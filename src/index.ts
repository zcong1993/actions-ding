import * as core from '@actions/core'
import {DingBot} from '@zcong/ding-bot'

const endpoint = 'https://oapi.dingtalk.com/robot/send'

async function run(): Promise<void> {
  try {
    const token = core.getInput('dingToken')
    const body = core.getInput('body')
    const secretStr = core.getInput('secret')
    const secret = secretStr === '' ? undefined : secretStr
    const data = JSON.parse(body)
    if (secret) {
      core.info('get secret, sign mode')
    }
    core.info(`Send body: ${body}`)
    const dingBot = new DingBot({
      endpoint,
      accessToken: token,
      signKey: secret
    })

    try {
      const resp = await dingBot.rawSend(data)

      if (resp?.errcode !== 0) {
        core.setFailed(resp?.errmsg)
      }
    } catch (requestErr) {
      core.error(
        `send request error, status: ${requestErr.response?.status}, data: ${requestErr.response?.data}`
      )
      core.setFailed(requestErr.message)
    }
  } catch (error) {
    core.setFailed(error.message)
  }
}

run()

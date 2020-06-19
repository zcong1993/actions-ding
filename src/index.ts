import * as core from '@actions/core'
import axios from 'axios'

const endpoint = 'https://oapi.dingtalk.com/robot/send'

async function run(): Promise<void> {
  try {
    const token: string = core.getInput('dingToken')
    const body: string = core.getInput('body')
    core.info(`Send body: ${body}`)
    try {
      const resp = await axios({
        method: 'post',
        url: `${endpoint}?access_token=${token}`,
        data: body,
        headers: {
          'Content-Type': 'application/json'
        }
      })

      if (resp.data.errcode !== 0) {
        core.setFailed(resp.data?.errmsg)
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

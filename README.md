# DingDing Notify Action

Send dingding simple notify message.

```yaml
- name: Send dingding notify
  uses: zcong1993/actions-ding@master
  with:
    dingToken: ${{ secrets.DING_TOKEN }}
    message: test message
```

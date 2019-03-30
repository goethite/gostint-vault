FROM vault:1.1.0

RUN apk --no-cache add curl jq bash
RUN setcap cap_ipc_lock=+ep $(readlink -f $(which vault))

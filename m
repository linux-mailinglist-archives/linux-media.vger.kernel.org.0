Return-Path: <linux-media+bounces-22298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC7C9DC129
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAA50162FAA
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38080176228;
	Fri, 29 Nov 2024 09:10:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE691598EE;
	Fri, 29 Nov 2024 09:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732871441; cv=none; b=DR71WIYYoHIXUmnkRYhd1aNtkBuD3fiWVFJgloa9ZSea4oB6vyQCAIoHhsttDzdq9JH5n1fXm0loGjT02ck373ZpUSVUBrHwVBzX8x5jwaM44I9O9xWbD0K/6bvGW+CREMk7Xj4W38KkLVnV+mg8ybNPaxMxbp9NV7EojuAETrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732871441; c=relaxed/simple;
	bh=ww29TWonr6IIzFfIHoPGUVxAmUmvv0DyWULVSKluLFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tEyz2Q38ISX5jicmT0IeGLO0qr8LYAO9apitdb4Y81wAM57f2MqNZigLLB04Qn8yxPzBl/5dQORUdMsKTjMsVAuK3baSu8VEzaK/wLak89Z7Euv8+pg3iH0ypRWw8pPkdg/LB29bQwRNN7n8XTNaZSSqalznVIFfPs2Oez+R7yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8474C4CECF;
	Fri, 29 Nov 2024 09:10:37 +0000 (UTC)
Message-ID: <b03f396b-a21c-40a8-8880-1f2e7f6b949a@xs4all.nl>
Date: Fri, 29 Nov 2024 10:10:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/28] media: iris: implement vb2 streaming ops
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241120-qcom-video-iris-v6-0-a8cf6704e992@quicinc.com>
 <20241120-qcom-video-iris-v6-16-a8cf6704e992@quicinc.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241120-qcom-video-iris-v6-16-a8cf6704e992@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2024 15:46, Dikshita Agarwal wrote:
> In stream on, send HFI_CMD_START on capture and output planes to start
> the processing on respective planes.
> 
> During stream off, send HFI_CMD_STOP to firmware which is a synchronous
> command. After the response is received from firmware, the session is
> closed on firmware.
> 
> Introduce different states for instance and state transitions.
> 
> IRIS_INST_INIT - video instance is opened.
> IRIS_INST_INPUT_STREAMING - stream on is completed on output plane.
> IRIS_INST_OUTPUT_STREAMING - stream on is completed on capture plane.
> IRIS_INST_STREAMING - stream on is completed on both output and capture
> planes.
> IRIS_INST_DEINIT - video instance is closed.
> IRIS_INST_ERROR - error state.
> 
>                    |
>                    v
>             -------------
>   +---------|   INIT    |---------  +
>   |         -------------           |
>   |            ^    ^               |
>   |           /      \              |
>   |          /        \             |
>   |         v          v            |
>   |    -----------    -----------   |
>   |   |   INPUT         OUTPUT  |   |
>   |---| STREAMING     STREAMING |---|
>   |    -----------    -----------   |
>   |        ^            ^           |
>   |         \          /            |
>   |          \        /             |
>   |           v      v              |
>   |         -------------           |
>   |--------|  STREAMING |-----------|
>   |         -------------           |
>   |               |                 |
>   |               |                 |
>   |               v                 |
>   |          -----------            |
>   +-------->|  DEINIT   |<----------+
>   |          -----------            |
>   |               |                 |
>   |               |                 |
>   |               v                 |
>   |          ----------             |
>   +-------->|   ERROR  |<-----------+
>              ----------.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  82 +++++++++++++++-
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  24 +++++
>  .../platform/qcom/iris/iris_hfi_gen1_response.c    |  39 +++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  61 ++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   2 +
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  32 ++++++-
>  drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
>  drivers/media/platform/qcom/iris/iris_state.c      | 104 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_state.h      |  58 ++++++++++++
>  drivers/media/platform/qcom/iris/iris_utils.c      |  11 ++-
>  drivers/media/platform/qcom/iris/iris_utils.h      |   2 +-
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  70 ++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vb2.h        |   3 +
>  drivers/media/platform/qcom/iris/iris_vdec.c       |  75 +++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vdec.h       |   3 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  12 ++-
>  18 files changed, 573 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index f685d76c2f79..ab16189aa9e6 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -12,6 +12,7 @@ iris-objs += iris_buffer.o \
>               iris_platform_sm8550.o \
>               iris_probe.o \
>               iris_resources.o \
> +             iris_state.o \
>               iris_utils.o \
>               iris_vidc.o \
>               iris_vb2.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index eaa2db469c74..8b1c4d156cf2 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -49,6 +49,8 @@ struct iris_hfi_command_ops {
>  	int (*sys_interframe_powercollapse)(struct iris_core *core);
>  	int (*sys_pc_prep)(struct iris_core *core);
>  	int (*session_open)(struct iris_inst *inst);
> +	int (*session_start)(struct iris_inst *inst, u32 plane);
> +	int (*session_stop)(struct iris_inst *inst, u32 plane);
>  	int (*session_close)(struct iris_inst *inst);
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 7ee69c5223ce..a3b09e8d1f49 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -71,6 +71,9 @@ static int iris_hfi_gen1_session_open(struct iris_inst *inst)
>  	struct hfi_session_open_pkt packet;
>  	int ret;
>  
> +	if (inst->state != IRIS_INST_DEINIT)
> +		return -EALREADY;
> +
>  	packet.shdr.hdr.size = sizeof(struct hfi_session_open_pkt);
>  	packet.shdr.hdr.pkt_type = HFI_CMD_SYS_SESSION_INIT;
>  	packet.shdr.session_id = inst->session_id;
> @@ -83,7 +86,7 @@ static int iris_hfi_gen1_session_open(struct iris_inst *inst)
>  	if (ret)
>  		return ret;
>  
> -	return iris_wait_for_session_response(inst);
> +	return iris_wait_for_session_response(inst, false);
>  }
>  
>  static void iris_hfi_gen1_packet_session_cmd(struct iris_inst *inst,
> @@ -104,12 +107,89 @@ static int iris_hfi_gen1_session_close(struct iris_inst *inst)
>  	return iris_hfi_queue_cmd_write(inst->core, &packet, packet.shdr.hdr.size);
>  }
>  
> +static int iris_hfi_gen1_session_start(struct iris_inst *inst, u32 plane)
> +{
> +	struct iris_core *core = inst->core;
> +	struct hfi_session_pkt packet;
> +	int ret;
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(plane))
> +		return 0;
> +
> +	reinit_completion(&inst->completion);
> +	iris_hfi_gen1_packet_session_cmd(inst, &packet, HFI_CMD_SESSION_LOAD_RESOURCES);
> +
> +	ret = iris_hfi_queue_cmd_write(core, &packet, packet.shdr.hdr.size);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_wait_for_session_response(inst, false);
> +	if (ret)
> +		return ret;
> +
> +	reinit_completion(&inst->completion);
> +	iris_hfi_gen1_packet_session_cmd(inst, &packet, HFI_CMD_SESSION_START);
> +
> +	ret = iris_hfi_queue_cmd_write(core, &packet, packet.shdr.hdr.size);
> +	if (ret)
> +		return ret;
> +
> +	return iris_wait_for_session_response(inst, false);
> +}
> +
> +static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
> +{
> +	struct hfi_session_flush_pkt flush_pkt;
> +	struct iris_core *core = inst->core;
> +	struct hfi_session_pkt pkt;
> +	u32 flush_type = 0;
> +	int ret = 0;
> +
> +	if ((V4L2_TYPE_IS_OUTPUT(plane) &&
> +	     inst->state == IRIS_INST_INPUT_STREAMING) ||
> +	    (V4L2_TYPE_IS_CAPTURE(plane) &&
> +	     inst->state == IRIS_INST_OUTPUT_STREAMING) ||
> +	    inst->state == IRIS_INST_ERROR) {
> +		reinit_completion(&inst->completion);
> +		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
> +		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
> +		if (!ret)
> +			ret = iris_wait_for_session_response(inst, false);
> +
> +		reinit_completion(&inst->completion);
> +		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_RELEASE_RESOURCES);
> +		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
> +		if (!ret)
> +			ret = iris_wait_for_session_response(inst, false);
> +	} else if (inst->state == IRIS_INST_STREAMING) {
> +		if (V4L2_TYPE_IS_OUTPUT(plane))
> +			flush_type = HFI_FLUSH_ALL;
> +		else if (V4L2_TYPE_IS_CAPTURE(plane))
> +			flush_type = HFI_FLUSH_OUTPUT;
> +
> +		reinit_completion(&inst->flush_completion);
> +
> +		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
> +		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
> +		flush_pkt.shdr.session_id = inst->session_id;
> +		flush_pkt.flush_type = flush_type;
> +
> +		ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
> +		if (!ret)
> +			ret = iris_wait_for_session_response(inst, true);
> +	}
> +
> +	return ret;
> +}
> +
>  static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
>  	.sys_init = iris_hfi_gen1_sys_init,
>  	.sys_image_version = iris_hfi_gen1_sys_image_version,
>  	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
>  	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
>  	.session_open = iris_hfi_gen1_session_open,
> +	.session_start = iris_hfi_gen1_session_start,
> +	.session_stop = iris_hfi_gen1_session_stop,
>  	.session_close = iris_hfi_gen1_session_close,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 3640f8504db9..1b2bf6afc6ce 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -23,6 +23,12 @@
>  #define HFI_CMD_SYS_SESSION_INIT			0x10007
>  #define HFI_CMD_SYS_SESSION_END				0x10008
>  
> +#define HFI_CMD_SESSION_LOAD_RESOURCES			0x211001
> +#define HFI_CMD_SESSION_START				0x211002
> +#define HFI_CMD_SESSION_STOP				0x211003
> +#define HFI_CMD_SESSION_FLUSH				0x211008
> +#define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
> +
>  #define HFI_ERR_SESSION_UNSUPPORTED_SETTING		0x1008
>  #define HFI_ERR_SESSION_UNSUPPORT_BUFFERTYPE		0x1010
>  #define HFI_ERR_SESSION_INVALID_SCALE_FACTOR		0x1012
> @@ -31,6 +37,9 @@
>  #define HFI_EVENT_SYS_ERROR				0x1
>  #define HFI_EVENT_SESSION_ERROR				0x2
>  
> +#define HFI_FLUSH_OUTPUT				0x1000002
> +#define HFI_FLUSH_OUTPUT2				0x1000003
> +#define HFI_FLUSH_ALL					0x1000004
>  #define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL		0x5
>  #define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6
>  
> @@ -41,6 +50,11 @@
>  #define HFI_MSG_SYS_PROPERTY_INFO			0x2000a
>  
>  #define HFI_MSG_EVENT_NOTIFY				0x21001
> +#define HFI_MSG_SESSION_LOAD_RESOURCES			0x221001
> +#define HFI_MSG_SESSION_START				0x221002
> +#define HFI_MSG_SESSION_STOP				0x221003
> +#define HFI_MSG_SESSION_FLUSH				0x221006
> +#define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
>  
>  struct hfi_pkt_hdr {
>  	u32 size;
> @@ -83,6 +97,11 @@ struct hfi_sys_pc_prep_pkt {
>  	struct hfi_pkt_hdr hdr;
>  };
>  
> +struct hfi_session_flush_pkt {
> +	struct hfi_session_hdr_pkt shdr;
> +	u32 flush_type;
> +};
> +
>  struct hfi_msg_event_notify_pkt {
>  	struct hfi_session_hdr_pkt shdr;
>  	u32 event_id;
> @@ -116,6 +135,11 @@ struct hfi_msg_sys_property_info_pkt {
>  	u8 data[];
>  };
>  
> +struct hfi_msg_session_flush_done_pkt {
> +	struct hfi_msg_session_hdr_pkt shdr;
> +	u32 flush_type;
> +};
> +
>  struct hfi_enable {
>  	u32 enable;
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 18ba5f67dd36..db5858ec04ea 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -11,6 +11,7 @@ static void
>  iris_hfi_gen1_sys_event_notify(struct iris_core *core, void *packet)
>  {
>  	struct hfi_msg_event_notify_pkt *pkt = packet;
> +	struct iris_inst *instance;
>  
>  	if (pkt->event_id == HFI_EVENT_SYS_ERROR)
>  		dev_err(core->dev, "sys error (type: %x, session id:%x, data1:%x, data2:%x)\n",
> @@ -18,6 +19,12 @@ iris_hfi_gen1_sys_event_notify(struct iris_core *core, void *packet)
>  			pkt->event_data2);
>  
>  	core->state = IRIS_CORE_ERROR;
> +
> +	mutex_lock(&core->lock);
> +	list_for_each_entry(instance, &core->instances, list)
> +		iris_inst_change_state(instance, IRIS_INST_ERROR);
> +	mutex_unlock(&core->lock);
> +
>  	schedule_delayed_work(&core->sys_error_handler, msecs_to_jiffies(10));
>  }
>  
> @@ -44,6 +51,7 @@ iris_hfi_gen1_event_session_error(struct iris_inst *inst, struct hfi_msg_event_n
>  			pkt->event_data2, pkt->event_data1,
>  			pkt->shdr.session_id);
>  		iris_vb2_queue_error(inst);
> +		iris_inst_change_state(inst, IRIS_INST_ERROR);
>  		break;
>  	}
>  }
> @@ -148,6 +156,26 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
>  	 .pkt = HFI_MSG_SYS_SESSION_END,
>  	 .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
>  	},
> +	{
> +	 .pkt = HFI_MSG_SESSION_LOAD_RESOURCES,
> +	 .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
> +	},
> +	{
> +	 .pkt = HFI_MSG_SESSION_START,
> +	 .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
> +	},
> +	{
> +	 .pkt = HFI_MSG_SESSION_STOP,
> +	 .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
> +	},
> +	{
> +	 .pkt = HFI_MSG_SESSION_FLUSH,
> +	 .pkt_sz = sizeof(struct hfi_msg_session_flush_done_pkt),
> +	},
> +	{
> +	 .pkt = HFI_MSG_SESSION_RELEASE_RESOURCES,
> +	 .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
> +	},
>  };
>  
>  static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
> @@ -156,6 +184,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>  	const struct iris_hfi_gen1_response_pkt_info *pkt_info;
>  	struct device *dev = core->dev;
>  	struct hfi_session_pkt *pkt;
> +	struct completion *done;
>  	struct iris_inst *inst;
>  	bool found = false;
>  	u32 i;
> @@ -205,7 +234,15 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>  		}
>  
>  		mutex_lock(&inst->lock);
> -		complete(&inst->completion);
> +		struct hfi_msg_session_hdr_pkt *shdr;
> +
> +		shdr = (struct hfi_msg_session_hdr_pkt *)hdr;
> +		if (shdr->error_type != HFI_ERR_NONE)
> +			iris_inst_change_state(inst, IRIS_INST_ERROR);
> +
> +		done = pkt_info->pkt == HFI_MSG_SESSION_FLUSH ?
> +			&inst->flush_completion : &inst->completion;
> +		complete(done);
>  		mutex_unlock(&inst->lock);
>  
>  		break;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index a08e844bb4bb..b0557917fc52 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -85,6 +85,18 @@ static int iris_hfi_gen2_sys_pc_prep(struct iris_core *core)
>  	return ret;
>  }
>  
> +static u32 iris_hfi_gen2_get_port(u32 plane)
> +{
> +	switch (plane) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		return HFI_PORT_BITSTREAM;
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		return HFI_PORT_RAW;
> +	default:
> +		return HFI_PORT_NONE;
> +	}
> +}
> +
>  static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
>  {
>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> @@ -124,6 +136,9 @@ static int iris_hfi_gen2_session_open(struct iris_inst *inst)
>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>  	int ret;
>  
> +	if (inst->state != IRIS_INST_DEINIT)
> +		return -EALREADY;
> +
>  	inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
>  	if (!inst_hfi_gen2->packet)
>  		return -ENOMEM;
> @@ -188,12 +203,58 @@ static int iris_hfi_gen2_session_close(struct iris_inst *inst)
>  	return ret;
>  }
>  
> +static int iris_hfi_gen2_session_start(struct iris_inst *inst, u32 plane)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +
> +	iris_hfi_gen2_packet_session_command(inst,
> +					     HFI_CMD_START,
> +					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
> +					     HFI_HOST_FLAGS_INTR_REQUIRED),
> +					     iris_hfi_gen2_get_port(plane),
> +					     inst->session_id,
> +					     HFI_PAYLOAD_NONE,
> +					     NULL,
> +					     0);
> +
> +	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
> +					inst_hfi_gen2->packet->size);
> +}
> +
> +static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	int ret = 0;
> +
> +	reinit_completion(&inst->completion);
> +
> +	iris_hfi_gen2_packet_session_command(inst,
> +					     HFI_CMD_STOP,
> +					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
> +					     HFI_HOST_FLAGS_INTR_REQUIRED |
> +					     HFI_HOST_FLAGS_NON_DISCARDABLE),
> +					     iris_hfi_gen2_get_port(plane),
> +					     inst->session_id,
> +					     HFI_PAYLOAD_NONE,
> +					     NULL,
> +					     0);
> +
> +	ret = iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
> +				       inst_hfi_gen2->packet->size);
> +	if (ret)
> +		return ret;
> +
> +	return iris_wait_for_session_response(inst, false);
> +}
> +
>  static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>  	.sys_init = iris_hfi_gen2_sys_init,
>  	.sys_image_version = iris_hfi_gen2_sys_image_version,
>  	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
>  	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
>  	.session_open = iris_hfi_gen2_session_open,
> +	.session_start = iris_hfi_gen2_session_start,
> +	.session_stop = iris_hfi_gen2_session_stop,
>  	.session_close = iris_hfi_gen2_session_close,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 6be8a6ff7924..4cbd31448ff5 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -15,6 +15,8 @@
>  #define HFI_CMD_POWER_COLLAPSE			0x01000002
>  #define HFI_CMD_OPEN				0x01000003
>  #define HFI_CMD_CLOSE				0x01000004
> +#define HFI_CMD_START				0x01000005
> +#define HFI_CMD_STOP				0x01000006
>  #define HFI_CMD_END				0x01FFFFFF
>  
>  #define HFI_PROP_BEGIN				0x03000000
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index a7d8c5ff7f2f..0bd43a07394a 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -98,6 +98,7 @@ static int iris_hfi_gen2_handle_session_error(struct iris_inst *inst,
>  
>  	dev_err(core->dev, "session error received %#x: %s\n", pkt->type, error);
>  	iris_vb2_queue_error(inst);
> +	iris_inst_change_state(inst, IRIS_INST_ERROR);
>  
>  	return 0;
>  }
> @@ -105,9 +106,17 @@ static int iris_hfi_gen2_handle_session_error(struct iris_inst *inst,
>  static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
>  					     struct iris_hfi_packet *pkt)
>  {
> +	struct iris_inst *instance;
> +
>  	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
>  
>  	core->state = IRIS_CORE_ERROR;
> +
> +	mutex_lock(&core->lock);
> +	list_for_each_entry(instance, &core->instances, list)
> +		iris_inst_change_state(instance, IRIS_INST_ERROR);
> +	mutex_unlock(&core->lock);
> +
>  	schedule_delayed_work(&core->sys_error_handler, msecs_to_jiffies(10));
>  
>  	return 0;
> @@ -126,20 +135,32 @@ static int iris_hfi_gen2_handle_system_init(struct iris_core *core,
>  	return 0;
>  }
>  
> +static void iris_hfi_gen2_handle_session_close(struct iris_inst *inst,
> +					       struct iris_hfi_packet *pkt)
> +{
> +	if (!(pkt->flags & HFI_FW_FLAGS_SUCCESS)) {
> +		iris_inst_change_state(inst, IRIS_INST_ERROR);
> +		return;
> +	}
> +
> +	complete(&inst->completion);
> +}
> +
>  static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
>  						struct iris_hfi_packet *pkt)
>  {
> -	int ret = 0;
> -
>  	switch (pkt->type) {
>  	case HFI_CMD_CLOSE:
> +		iris_hfi_gen2_handle_session_close(inst, pkt);
> +		break;
> +	case HFI_CMD_STOP:
>  		complete(&inst->completion);
>  		break;
>  	default:
>  		break;
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int iris_hfi_gen2_handle_image_version_property(struct iris_core *core,
> @@ -244,8 +265,11 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
>  			if (packet->flags & HFI_FW_FLAGS_SESSION_ERROR)
>  				iris_hfi_gen2_handle_session_error(inst, packet);
>  
> -			if (packet->type > range[i].begin && packet->type < range[i].end)
> +			if (packet->type > range[i].begin && packet->type < range[i].end) {
>  				ret = range[i].handle(inst, packet);
> +				if (ret)
> +					iris_inst_change_state(inst, IRIS_INST_ERROR);
> +			}
>  			pkt += packet->size;
>  		}
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 16b463cec4f4..f40df09e5323 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -26,9 +26,11 @@
>   * @ctrl_handler: reference of v4l2 ctrl handler
>   * @crop: structure of crop info
>   * @completions: structure of signal completions
> + * @flush_completions: structure of signal completions for flush cmd
>   * @fw_caps: array of supported instance firmware capabilities
>   * @buffers: array of different iris buffers
>   * @fw_min_count: minimnum count of buffers needed by fw
> + * @state: instance state
>   * @once_per_session_set: boolean to set once per session property
>   * @m2m_dev:	a reference to m2m device structure
>   * @m2m_ctx:	a reference to m2m context structure
> @@ -47,9 +49,11 @@ struct iris_inst {
>  	struct v4l2_ctrl_handler	ctrl_handler;
>  	struct iris_hfi_rect_desc	crop;
>  	struct completion		completion;
> +	struct completion		flush_completion;
>  	struct platform_inst_fw_cap	fw_caps[INST_FW_CAP_MAX];
>  	struct iris_buffers		buffers[BUF_TYPE_MAX];
>  	u32				fw_min_count;
> +	enum iris_inst_state		state;
>  	bool				once_per_session_set;
>  	struct v4l2_m2m_dev		*m2m_dev;
>  	struct v4l2_m2m_ctx		*m2m_ctx;
> diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
> new file mode 100644
> index 000000000000..44362e8fe18f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_state.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_instance.h"
> +
> +static bool iris_allow_inst_state_change(struct iris_inst *inst,
> +					 enum iris_inst_state req_state)
> +{
> +	switch (inst->state) {
> +	case IRIS_INST_INIT:
> +		if (req_state == IRIS_INST_INPUT_STREAMING ||
> +		    req_state == IRIS_INST_OUTPUT_STREAMING ||
> +		    req_state == IRIS_INST_DEINIT)
> +			return true;
> +		return false;
> +	case IRIS_INST_INPUT_STREAMING:
> +		if (req_state == IRIS_INST_INIT ||
> +		    req_state == IRIS_INST_STREAMING ||
> +		    req_state == IRIS_INST_DEINIT)
> +			return true;
> +		return false;
> +	case IRIS_INST_OUTPUT_STREAMING:
> +		if (req_state == IRIS_INST_INIT ||
> +		    req_state == IRIS_INST_STREAMING ||
> +		    req_state == IRIS_INST_DEINIT)
> +			return true;
> +		return false;
> +	case IRIS_INST_STREAMING:
> +		if (req_state == IRIS_INST_INPUT_STREAMING ||
> +		    req_state == IRIS_INST_OUTPUT_STREAMING ||
> +		    req_state == IRIS_INST_DEINIT)
> +			return true;
> +		return false;
> +	case IRIS_INST_DEINIT:
> +		if (req_state == IRIS_INST_INIT)
> +			return true;
> +		return false;
> +	default:
> +		return false;
> +	}
> +}
> +
> +int iris_inst_change_state(struct iris_inst *inst,
> +			   enum iris_inst_state request_state)
> +{
> +	if (inst->state == IRIS_INST_ERROR)
> +		return 0;
> +
> +	if (inst->state == request_state)
> +		return 0;
> +
> +	if (request_state == IRIS_INST_ERROR)
> +		goto change_state;
> +
> +	if (!iris_allow_inst_state_change(inst, request_state))
> +		return -EINVAL;
> +
> +change_state:
> +	inst->state = request_state;
> +	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
> +		inst->state, request_state);
> +
> +	return 0;
> +}
> +
> +int iris_inst_state_change_streamon(struct iris_inst *inst, u32 plane)
> +{
> +	enum iris_inst_state new_state = IRIS_INST_ERROR;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(plane)) {
> +		if (inst->state == IRIS_INST_INIT)
> +			new_state = IRIS_INST_INPUT_STREAMING;
> +		else if (inst->state == IRIS_INST_OUTPUT_STREAMING)
> +			new_state = IRIS_INST_STREAMING;
> +	} else if (V4L2_TYPE_IS_CAPTURE(plane)) {
> +		if (inst->state == IRIS_INST_INIT)
> +			new_state = IRIS_INST_OUTPUT_STREAMING;
> +		else if (inst->state == IRIS_INST_INPUT_STREAMING)
> +			new_state = IRIS_INST_STREAMING;
> +	}
> +
> +	return iris_inst_change_state(inst, new_state);
> +}
> +
> +int iris_inst_state_change_streamoff(struct iris_inst *inst, u32 plane)
> +{
> +	enum iris_inst_state new_state = IRIS_INST_ERROR;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(plane)) {
> +		if (inst->state == IRIS_INST_INPUT_STREAMING)
> +			new_state = IRIS_INST_INIT;
> +		else if (inst->state == IRIS_INST_STREAMING)
> +			new_state = IRIS_INST_OUTPUT_STREAMING;
> +	} else if (V4L2_TYPE_IS_CAPTURE(plane)) {
> +		if (inst->state == IRIS_INST_OUTPUT_STREAMING)
> +			new_state = IRIS_INST_INIT;
> +		else if (inst->state == IRIS_INST_STREAMING)
> +			new_state = IRIS_INST_INPUT_STREAMING;
> +	}
> +
> +	return iris_inst_change_state(inst, new_state);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
> index 776262615195..8a25c0c27df4 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.h
> +++ b/drivers/media/platform/qcom/iris/iris_state.h
> @@ -6,6 +6,8 @@
>  #ifndef __IRIS_STATE_H__
>  #define __IRIS_STATE_H__
>  
> +struct iris_inst;
> +
>  /**
>   * enum iris_core_state
>   *
> @@ -38,4 +40,60 @@ enum iris_core_state {
>  	IRIS_CORE_ERROR,
>  };
>  
> +/**
> + * enum iris_inst_state
> + *
> + * IRIS_INST_INIT: video instance is opened.
> + * IRIS_INST_INPUT_STREAMING: stream on is completed on output plane.
> + * IRIS_INST_OUTPUT_STREAMING: stream on is completed on capture plane.
> + * IRIS_INST_STREAMING: stream on is completed on both output and capture planes.
> + * IRIS_INST_DEINIT: video instance is closed.
> + * IRIS_INST_ERROR: error state.
> + *                    |
> + *                    V
> + *             -------------
> + *   +--------|     INIT    |----------+
> + *   |         -------------           |
> + *   |            ^   ^                |
> + *   |           /      \              |
> + *   |          /        \             |
> + *   |         v          v            |
> + *   |   -----------    -----------    |
> + *   |   |   INPUT         OUTPUT  |   |
> + *   |---| STREAMING     STREAMING |---|
> + *   |   -----------    -----------    |
> + *   |       ^            ^            |
> + *   |         \          /            |
> + *   |          \        /             |
> + *   |           v      v              |
> + *   |         -------------           |
> + *   |--------|  STREAMING |-----------|
> + *   |        -------------            |
> + *   |               |                 |
> + *   |               |                 |
> + *   |               v                 |
> + *   |          -----------            |
> + *   +-------->|  DEINIT   |<----------+
> + *   |          -----------            |
> + *   |               |                 |
> + *   |               |                 |
> + *   |               v                 |
> + *   |          ----------             |
> + *   +-------->|   ERROR |<------------+
> + *              ----------
> + */
> +enum iris_inst_state {
> +	IRIS_INST_DEINIT,
> +	IRIS_INST_INIT,
> +	IRIS_INST_INPUT_STREAMING,
> +	IRIS_INST_OUTPUT_STREAMING,
> +	IRIS_INST_STREAMING,
> +	IRIS_INST_ERROR,
> +};
> +
> +int iris_inst_change_state(struct iris_inst *inst,
> +			   enum iris_inst_state request_state);
> +int iris_inst_state_change_streamon(struct iris_inst *inst, u32 plane);
> +int iris_inst_state_change_streamoff(struct iris_inst *inst, u32 plane);
> +
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index d5c8e052922c..4833830f30d5 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -17,20 +17,23 @@ int iris_get_mbpf(struct iris_inst *inst)
>  	return NUM_MBS_PER_FRAME(height, width);
>  }
>  
> -int iris_wait_for_session_response(struct iris_inst *inst)
> +int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
>  {
>  	struct iris_core *core = inst->core;
>  	u32 hw_response_timeout_val;
> +	struct completion *done;
>  	int ret;
>  
>  	hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
> +	done = is_flush ? &inst->flush_completion : &inst->completion;
>  
>  	mutex_unlock(&inst->lock);
> -	ret = wait_for_completion_timeout(&inst->completion,
> -					  msecs_to_jiffies(hw_response_timeout_val));
> +	ret = wait_for_completion_timeout(done, msecs_to_jiffies(hw_response_timeout_val));
>  	mutex_lock(&inst->lock);
> -	if (!ret)
> +	if (!ret) {
> +		iris_inst_change_state(inst, IRIS_INST_ERROR);
>  		return -ETIMEDOUT;
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
> index 26649b66d978..40658a6643cf 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.h
> +++ b/drivers/media/platform/qcom/iris/iris_utils.h
> @@ -29,6 +29,6 @@ static inline enum iris_buffer_type iris_v4l2_type_to_driver(u32 type)
>  
>  int iris_get_mbpf(struct iris_inst *inst);
>  struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
> -int iris_wait_for_session_response(struct iris_inst *inst);
> +int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index e9db44515d91..b93da860d336 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -5,6 +5,7 @@
>  
>  #include "iris_instance.h"
>  #include "iris_vb2.h"
> +#include "iris_vdec.h"
>  
>  int iris_vb2_queue_setup(struct vb2_queue *q,
>  			 unsigned int *num_buffers, unsigned int *num_planes,
> @@ -18,6 +19,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>  	inst = vb2_get_drv_priv(q);
>  
>  	mutex_lock(&inst->lock);
> +	if (inst->state == IRIS_INST_ERROR) {
> +		ret = -EBUSY;
> +		goto unlock;
> +	}
>  
>  	core = inst->core;
>  	f = V4L2_TYPE_IS_OUTPUT(q->type) ? inst->fmt_src : inst->fmt_dst;
> @@ -38,6 +43,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>  			dev_err(core->dev, "session open failed\n");
>  			goto unlock;
>  		}
> +
> +		ret = iris_inst_change_state(inst, IRIS_INST_INIT);
> +		if (ret)
> +			goto unlock;
>  	}
>  
>  	*num_planes = 1;
> @@ -48,3 +57,64 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>  
>  	return ret;
>  }
> +
> +int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct iris_inst *inst;
> +	int ret = 0;
> +
> +	inst = vb2_get_drv_priv(q);
> +
> +	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state == IRIS_INST_INIT)
> +		return 0;
> +
> +	mutex_lock(&inst->lock);
> +	if (inst->state == IRIS_INST_ERROR) {
> +		ret = -EBUSY;
> +		goto error;
> +	}
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
> +	    !V4L2_TYPE_IS_CAPTURE(q->type)) {
> +		ret = -EINVAL;
> +		goto error;
> +	}
> +
> +	if (V4L2_TYPE_IS_OUTPUT(q->type))
> +		ret = iris_vdec_streamon_input(inst);
> +	else if (V4L2_TYPE_IS_CAPTURE(q->type))
> +		ret = iris_vdec_streamon_output(inst);
> +	if (ret)
> +		goto error;
> +
> +	mutex_unlock(&inst->lock);
> +
> +	return ret;
> +
> +error:
> +	iris_inst_change_state(inst, IRIS_INST_ERROR);
> +	mutex_unlock(&inst->lock);
> +
> +	return ret;
> +}
> +
> +void iris_vb2_stop_streaming(struct vb2_queue *q)
> +{
> +	struct iris_inst *inst;
> +
> +	inst = vb2_get_drv_priv(q);
> +
> +	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state == IRIS_INST_INIT)
> +		return;
> +
> +	mutex_lock(&inst->lock);
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
> +	    !V4L2_TYPE_IS_CAPTURE(q->type))
> +		goto exit;
> +
> +	iris_vdec_session_streamoff(inst, q->type);
> +
> +exit:
> +	mutex_unlock(&inst->lock);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.h b/drivers/media/platform/qcom/iris/iris_vb2.h
> index d2e71d0596cc..3906510fa71f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.h
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.h
> @@ -9,4 +9,7 @@
>  int iris_vb2_queue_setup(struct vb2_queue *q,
>  			 unsigned int *num_buffers, unsigned int *num_planes,
>  			 unsigned int sizes[], struct device *alloc_devs[]);
> +int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count);
> +void iris_vb2_stop_streaming(struct vb2_queue *q);
> +
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 5571c24a7417..615a780bf010 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -225,3 +225,78 @@ int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_su
>  
>  	return ret;
>  }
> +
> +static void iris_vdec_kill_session(struct iris_inst *inst)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +
> +	if (!inst->session_id)
> +		return;
> +
> +	hfi_ops->session_close(inst);
> +	iris_inst_change_state(inst, IRIS_INST_ERROR);
> +}
> +
> +void iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	int ret;
> +
> +	ret = hfi_ops->session_stop(inst, plane);
> +	if (ret)
> +		goto error;
> +
> +	ret = iris_inst_state_change_streamoff(inst, plane);
> +	if (ret)
> +		goto error;
> +
> +	return;
> +
> +error:
> +	iris_vdec_kill_session(inst);
> +}
> +
> +static int iris_vdec_process_streamon_input(struct iris_inst *inst)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	int ret;
> +
> +	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	if (ret)
> +		return ret;
> +
> +	return iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +}
> +
> +int iris_vdec_streamon_input(struct iris_inst *inst)
> +{
> +	return iris_vdec_process_streamon_input(inst);
> +}
> +
> +static int iris_vdec_process_streamon_output(struct iris_inst *inst)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	int ret;
> +
> +	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (ret)
> +		return ret;
> +
> +	return iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +}
> +
> +int iris_vdec_streamon_output(struct iris_inst *inst)
> +{
> +	int ret;
> +
> +	ret = iris_vdec_process_streamon_output(inst);
> +	if (ret)
> +		goto error;
> +
> +	return ret;
> +
> +error:
> +	iris_vdec_session_streamoff(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +
> +	return ret;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
> index 9f08a13cb6bb..a17bb817b6e5 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
> @@ -14,5 +14,8 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
>  int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>  int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>  int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
> +int iris_vdec_streamon_input(struct iris_inst *inst);
> +int iris_vdec_streamon_output(struct iris_inst *inst);
> +void iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 26fdf03ab972..eb850f7da82c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -145,10 +145,12 @@ int iris_open(struct file *filp)
>  
>  	inst->core = core;
>  	inst->session_id = hash32_ptr(inst);
> +	inst->state = IRIS_INST_DEINIT;
>  
>  	mutex_init(&inst->lock);
>  	mutex_init(&inst->ctx_q_lock);
>  	init_completion(&inst->completion);
> +	init_completion(&inst->flush_completion);
>  
>  	iris_v4l2_fh_init(inst);
>  
> @@ -194,6 +196,9 @@ static void iris_session_close(struct iris_inst *inst)
>  	bool wait_for_response = true;
>  	int ret;
>  
> +	if (inst->state == IRIS_INST_DEINIT)
> +		return;
> +
>  	reinit_completion(&inst->completion);
>  
>  	ret = hfi_ops->session_close(inst);
> @@ -201,7 +206,7 @@ static void iris_session_close(struct iris_inst *inst)
>  		wait_for_response = false;
>  
>  	if (wait_for_response)
> -		iris_wait_for_session_response(inst);
> +		iris_wait_for_session_response(inst, false);
>  }
>  
>  int iris_close(struct file *filp)
> @@ -214,6 +219,7 @@ int iris_close(struct file *filp)
>  	mutex_lock(&inst->lock);
>  	iris_vdec_inst_deinit(inst);
>  	iris_session_close(inst);
> +	iris_inst_change_state(inst, IRIS_INST_DEINIT);
>  	iris_v4l2_fh_deinit(inst);
>  	iris_remove_session(inst);
>  	mutex_unlock(&inst->lock);
> @@ -356,6 +362,8 @@ static struct v4l2_file_operations iris_v4l2_file_ops = {
>  
>  static const struct vb2_ops iris_vb2_ops = {
>  	.queue_setup                    = iris_vb2_queue_setup,
> +	.start_streaming                = iris_vb2_start_streaming,
> +	.stop_streaming                 = iris_vb2_stop_streaming,
>  };
>  
>  static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
> @@ -373,6 +381,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>  	.vidioc_g_selection             = iris_g_selection,
>  	.vidioc_subscribe_event         = iris_subscribe_event,
>  	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
> +	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
>  };
>  
>  void iris_init_ops(struct iris_core *core)
> 



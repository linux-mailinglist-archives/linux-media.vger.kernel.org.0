Return-Path: <linux-media+bounces-22301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C478F9DC161
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28C08B21674
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539E3181B8D;
	Fri, 29 Nov 2024 09:22:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31FB156F28;
	Fri, 29 Nov 2024 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732872160; cv=none; b=k33oIJ8kFL4BulFHvuXSDknfQKN/euxT7re1rHnrlimP/t7VU0bj7DQk3GdyjS6a9PuSXE9g6PCviZJrUVs24lK2OFVoNgLbx59clBQcMRXcqjmo3HQ41U8WlR4Xk+ZY07nBb2OdQFXQjZqmQwdyhv6VRpdcYQn8NSnhoC2CRUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732872160; c=relaxed/simple;
	bh=dV0heHIi1TJqOFHeNX2cjJXd9Tv1bHiZy+ddnVvGsEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBu5yPMfxbDmZGiJqKX+L4e5R/j+8g6gl/bZsD6DX85/Y0FszMi/78FEy27mfShdaSGgnHlWC4i8M+QpMigyMYXvnNPu9KkBN5jEwRcToWRMH44cb9EDWahyZmCCXmmrNbA90xdQWHr2rv697KX3OyVvhQ0gA/hvlCv8K3jyB4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFB3C4CECF;
	Fri, 29 Nov 2024 09:22:37 +0000 (UTC)
Message-ID: <9f38c3bb-32a2-45ee-845b-fee02f7b79ec@xs4all.nl>
Date: Fri, 29 Nov 2024 10:22:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/28] media: iris: add support for drain sequence
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
 <20241120-qcom-video-iris-v6-23-a8cf6704e992@quicinc.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241120-qcom-video-iris-v6-23-a8cf6704e992@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2024 15:46, Dikshita Agarwal wrote:
> handle the V4L2_DEC_CMD_STOP by initiating drain sequence to firmware.
> Process and decode all OUTPUT buffers queued by the client before the
> VIDIOC_DECODER_CMD() was issued and mark the last buffer with
> V4L2_BUF_FLAG_LAST flag. Decoder is stopped after processing the last
> buffer.
> 
> Resume the decoder when one of below are issued by client:
> - V4L2_DEC_CMD_START
> - pair of VIDIOC_STREAMOFF() and VIDIOC_STREAMON() on the CAPTURE queue
> - pair of VIDIOC_STREAMOFF() and VIDIOC_STREAMON() on the OUTPUT queue
> 
> Add the handling to resume decoding when client issues
> V4L2_DEC_CMD_START to resume decoding after source change is detected.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  2 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 13 ++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
>  .../platform/qcom/iris/iris_hfi_gen1_response.c    | 15 ++++
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 43 ++++++++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    | 46 ++++++++++-
>  drivers/media/platform/qcom/iris/iris_state.c      | 68 ++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_state.h      | 13 +++-
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  6 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 91 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vdec.h       |  2 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       | 37 +++++++++
>  13 files changed, 331 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index 8e14a61c9be4..b2c541367fc6 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -121,6 +121,8 @@ struct iris_hfi_command_ops {
>  	int (*session_pause)(struct iris_inst *inst, u32 plane);
>  	int (*session_resume_drc)(struct iris_inst *inst, u32 plane);
>  	int (*session_stop)(struct iris_inst *inst, u32 plane);
> +	int (*session_drain)(struct iris_inst *inst, u32 plane);
> +	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
>  	int (*session_close)(struct iris_inst *inst);
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index e0cb75a112e3..e1fbbb3c196d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -368,6 +368,18 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
>  	return ret;
>  }
>  
> +static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
> +{
> +	struct hfi_session_empty_buffer_compressed_pkt ip_pkt = {0};
> +
> +	ip_pkt.shdr.hdr.size = sizeof(struct hfi_session_empty_buffer_compressed_pkt);
> +	ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
> +	ip_pkt.shdr.session_id = inst->session_id;
> +	ip_pkt.flags = HFI_BUFFERFLAG_EOS;
> +
> +	return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
> +}
> +
>  static int
>  iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *packet,
>  					  struct iris_inst *inst, u32 ptype, void *pdata)
> @@ -789,6 +801,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
>  	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
>  	.session_resume_drc = iris_hfi_gen1_session_continue,
>  	.session_stop = iris_hfi_gen1_session_stop,
> +	.session_drain = iris_hfi_gen1_session_drain,
>  	.session_close = iris_hfi_gen1_session_close,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index c40e0a28b21f..9f246816a286 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -49,6 +49,7 @@
>  #define HFI_EVENT_DATA_SEQUENCE_CHANGED_INSUFFICIENT_BUF_RESOURCES 0x1000002
>  #define HFI_EVENT_SESSION_SEQUENCE_CHANGED			   0x1000003
>  
> +#define HFI_BUFFERFLAG_EOS				0x00000001
>  #define HFI_BUFFERFLAG_TIMESTAMPINVALID			0x00000100
>  
>  #define HFI_FLUSH_OUTPUT				0x1000002
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 3a47d9f39695..b72d503dd740 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -386,6 +386,7 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>  	struct hfi_msg_session_fbd_uncompressed_plane0_pkt *pkt = packet;
>  	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>  	struct v4l2_m2m_buffer *m2m_buffer, *n;
> +	struct hfi_session_flush_pkt flush_pkt;
>  	u32 timestamp_hi = pkt->time_stamp_hi;
>  	u32 timestamp_lo = pkt->time_stamp_lo;
>  	struct iris_core *core = inst->core;
> @@ -394,11 +395,25 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>  	u32 output_tag = pkt->output_tag;
>  	struct iris_buffer *buf, *iter;
>  	struct iris_buffers *buffers;
> +	u32 hfi_flags = pkt->flags;
>  	u32 offset = pkt->offset;
>  	u64 timestamp_us = 0;
>  	bool found = false;
>  	u32 flags = 0;
>  
> +	if ((hfi_flags & HFI_BUFFERFLAG_EOS) && !filled_len) {
> +		reinit_completion(&inst->flush_completion);
> +
> +		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
> +		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
> +		flush_pkt.shdr.session_id = inst->session_id;
> +		flush_pkt.flush_type = HFI_FLUSH_OUTPUT;
> +		iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
> +		iris_inst_sub_state_change_drain_last(inst);
> +
> +		return;
> +	}
> +
>  	if (iris_split_mode_enabled(inst) && pkt->stream_id == 0) {
>  		buffers = &inst->buffers[BUF_DPB];
>  		if (!buffers)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 8efc6a70a57a..a908b41e2868 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -774,6 +774,47 @@ static int iris_hfi_gen2_session_resume_drc(struct iris_inst *inst, u32 plane)
>  					inst_hfi_gen2->packet->size);
>  }
>  
> +static int iris_hfi_gen2_session_resume_drain(struct iris_inst *inst, u32 plane)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 payload = HFI_CMD_DRAIN;
> +
> +	iris_hfi_gen2_packet_session_command(inst,
> +					     HFI_CMD_RESUME,
> +					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
> +					     HFI_HOST_FLAGS_INTR_REQUIRED),
> +					     iris_hfi_gen2_get_port(plane),
> +					     inst->session_id,
> +					     HFI_PAYLOAD_U32,
> +					     &payload,
> +					     sizeof(u32));
> +
> +	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
> +					inst_hfi_gen2->packet->size);
> +}
> +
> +static int iris_hfi_gen2_session_drain(struct iris_inst *inst, u32 plane)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(plane))
> +		return 0;
> +
> +	iris_hfi_gen2_packet_session_command(inst,
> +					     HFI_CMD_DRAIN,
> +					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
> +					     HFI_HOST_FLAGS_INTR_REQUIRED |
> +					     HFI_HOST_FLAGS_NON_DISCARDABLE),
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
>  static u32 iris_hfi_gen2_buf_type_from_driver(enum iris_buffer_type buffer_type)
>  {
>  	switch (buffer_type) {
> @@ -900,6 +941,8 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>  	.session_pause = iris_hfi_gen2_session_pause,
>  	.session_resume_drc = iris_hfi_gen2_session_resume_drc,
>  	.session_stop = iris_hfi_gen2_session_stop,
> +	.session_drain = iris_hfi_gen2_session_drain,
> +	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
>  	.session_close = iris_hfi_gen2_session_close,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index d759b7355711..214e2a579b8e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -17,6 +17,7 @@
>  #define HFI_CMD_CLOSE				0x01000004
>  #define HFI_CMD_START				0x01000005
>  #define HFI_CMD_STOP				0x01000006
> +#define HFI_CMD_DRAIN				0x01000007
>  #define HFI_CMD_RESUME				0x01000008
>  #define HFI_CMD_BUFFER				0x01000009
>  #define HFI_CMD_SUBSCRIBE_MODE			0x0100000B
> @@ -79,6 +80,7 @@
>  #define HFI_INFO_UNSUPPORTED			0x06000001
>  #define HFI_INFO_DATA_CORRUPT			0x06000002
>  #define HFI_INFO_BUFFER_OVERFLOW		0x06000004
> +#define HFI_INFO_HFI_FLAG_DRAIN_LAST		0x06000006
>  #define HFI_INFO_HFI_FLAG_PSC_LAST		0x06000007
>  #define HFI_INFORMATION_END			0x06FFFFFF
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 28857a7a5112..f043e74866bc 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -201,6 +201,10 @@ static int iris_hfi_gen2_handle_session_info(struct iris_inst *inst,
>  		info = "buffer overflow";
>  		inst_hfi_gen2->hfi_frame_info.overflow = 1;
>  		break;
> +	case HFI_INFO_HFI_FLAG_DRAIN_LAST:
> +		info = "drain last flag";
> +		ret = iris_inst_sub_state_change_drain_last(inst);
> +		break;
>  	case HFI_INFO_HFI_FLAG_PSC_LAST:
>  		info = "drc last flag";
>  		ret = iris_inst_sub_state_change_drc_last(inst);
> @@ -334,6 +338,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
>  	bool found = false;
>  	int ret;
>  
> +	if (hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) {
> +		ret = iris_inst_sub_state_change_drain_last(inst);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (hfi_buffer->flags & HFI_BUF_FW_FLAG_PSC_LAST) {
>  		ret = iris_inst_sub_state_change_drc_last(inst);
>  		if (ret)
> @@ -422,6 +432,21 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
>  	return ret;
>  }
>  
> +static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,
> +					     struct iris_hfi_packet *pkt)
> +{
> +	int ret = 0;
> +
> +	if (pkt->port == HFI_PORT_RAW)
> +		ret = iris_inst_sub_state_change_pause(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	else if (pkt->port == HFI_PORT_BITSTREAM)
> +		ret = iris_inst_sub_state_change_pause(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +
> +	complete(&inst->completion);
> +
> +	return ret;
> +}
> +
>  static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
>  					       struct iris_hfi_packet *pkt)
>  {
> @@ -450,6 +475,22 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
>  		return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
>  }
>  
> +static int iris_hfi_gen2_handle_session_drain(struct iris_inst *inst,
> +					      struct iris_hfi_packet *pkt)
> +{
> +	int ret = 0;
> +
> +	if (!(pkt->flags & HFI_FW_FLAGS_SUCCESS)) {
> +		iris_inst_change_state(inst, IRIS_INST_ERROR);
> +		return 0;
> +	}
> +
> +	if (inst->sub_state & IRIS_INST_SUB_DRAIN)
> +		ret = iris_inst_change_sub_state(inst, 0, IRIS_INST_SUB_INPUT_PAUSE);
> +
> +	return ret;
> +}
> +
>  static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>  {
>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> @@ -569,7 +610,7 @@ static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
>  		iris_hfi_gen2_handle_session_close(inst, pkt);
>  		break;
>  	case HFI_CMD_STOP:
> -		complete(&inst->completion);
> +		iris_hfi_gen2_handle_session_stop(inst, pkt);
>  		break;
>  	case HFI_CMD_BUFFER:
>  		ret = iris_hfi_gen2_handle_session_buffer(inst, pkt);
> @@ -577,6 +618,9 @@ static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
>  	case HFI_CMD_SETTINGS_CHANGE:
>  		ret = iris_hfi_gen2_handle_src_change(inst, pkt);
>  		break;
> +	case HFI_CMD_DRAIN:
> +		ret = iris_hfi_gen2_handle_session_drain(inst, pkt);
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
> index aad7e734d5c8..f12306e735ec 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.c
> +++ b/drivers/media/platform/qcom/iris/iris_state.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <media/v4l2-mem2mem.h>
> +
>  #include "iris_instance.h"
>  
>  static bool iris_allow_inst_state_change(struct iris_inst *inst,
> @@ -148,6 +150,21 @@ int iris_inst_sub_state_change_drc(struct iris_inst *inst)
>  	return iris_inst_change_sub_state(inst, 0, set_sub_state);
>  }
>  
> +int iris_inst_sub_state_change_drain_last(struct iris_inst *inst)
> +{
> +	enum iris_inst_sub_state set_sub_state;
> +
> +	if (inst->sub_state & IRIS_INST_SUB_DRAIN_LAST)
> +		return -EINVAL;
> +
> +	if (!(inst->sub_state & IRIS_INST_SUB_DRAIN))
> +		return -EINVAL;
> +
> +	set_sub_state = IRIS_INST_SUB_DRAIN_LAST | IRIS_INST_SUB_OUTPUT_PAUSE;
> +
> +	return iris_inst_change_sub_state(inst, 0, set_sub_state);
> +}
> +
>  int iris_inst_sub_state_change_drc_last(struct iris_inst *inst)
>  {
>  	enum iris_inst_sub_state set_sub_state;
> @@ -166,3 +183,54 @@ int iris_inst_sub_state_change_drc_last(struct iris_inst *inst)
>  
>  	return iris_inst_change_sub_state(inst, 0, set_sub_state);
>  }
> +
> +int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane)
> +{
> +	enum iris_inst_sub_state set_sub_state;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(plane)) {
> +		if (inst->sub_state & IRIS_INST_SUB_DRC &&
> +		    !(inst->sub_state & IRIS_INST_SUB_DRC_LAST))
> +			return -EINVAL;
> +
> +		if (inst->sub_state & IRIS_INST_SUB_DRAIN &&
> +		    !(inst->sub_state & IRIS_INST_SUB_DRAIN_LAST))
> +			return -EINVAL;
> +
> +		set_sub_state = IRIS_INST_SUB_INPUT_PAUSE;
> +	} else {
> +		set_sub_state = IRIS_INST_SUB_OUTPUT_PAUSE;
> +	}
> +
> +	return iris_inst_change_sub_state(inst, 0, set_sub_state);
> +}
> +
> +static inline bool iris_drc_pending(struct iris_inst *inst)
> +{
> +	return inst->sub_state & IRIS_INST_SUB_DRC &&
> +		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
> +}
> +
> +static inline bool iris_drain_pending(struct iris_inst *inst)
> +{
> +	return inst->sub_state & IRIS_INST_SUB_DRAIN &&
> +		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
> +}
> +
> +bool iris_allow_cmd(struct iris_inst *inst, u32 cmd)
> +{
> +	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +
> +	if (cmd == V4L2_DEC_CMD_START) {
> +		if (vb2_is_streaming(src_q) || vb2_is_streaming(dst_q))
> +			if (iris_drc_pending(inst) || iris_drain_pending(inst))
> +				return true;
> +	} else if (cmd == V4L2_DEC_CMD_STOP) {
> +		if (vb2_is_streaming(src_q))
> +			if (inst->sub_state != IRIS_INST_SUB_DRAIN)
> +				return true;
> +	}
> +
> +	return false;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
> index 11236001c1cc..bf645f6f879c 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.h
> +++ b/drivers/media/platform/qcom/iris/iris_state.h
> @@ -104,6 +104,9 @@ enum iris_inst_state {
>   *		      sent to client.
>   * IRIS_INST_SUB_DRC_LAST: indicates last buffer is received from firmware
>   *                         as part of source change.
> + * IRIS_INST_SUB_DRAIN: indicates drain is in progress.
> + * IRIS_INST_SUB_DRAIN_LAST: indicates last buffer is received from firmware
> + *                           as part of drain sequence.
>   * IRIS_INST_SUB_INPUT_PAUSE: source change is received form firmware. This
>   *                            indicates that firmware is paused to process
>   *                            any further input frames.
> @@ -115,8 +118,10 @@ enum iris_inst_sub_state {
>  	IRIS_INST_SUB_FIRST_IPSC	= BIT(0),
>  	IRIS_INST_SUB_DRC		= BIT(1),
>  	IRIS_INST_SUB_DRC_LAST		= BIT(2),
> -	IRIS_INST_SUB_INPUT_PAUSE	= BIT(3),
> -	IRIS_INST_SUB_OUTPUT_PAUSE	= BIT(4),
> +	IRIS_INST_SUB_DRAIN		= BIT(3),
> +	IRIS_INST_SUB_DRAIN_LAST	= BIT(4),
> +	IRIS_INST_SUB_INPUT_PAUSE	= BIT(5),
> +	IRIS_INST_SUB_OUTPUT_PAUSE	= BIT(6),
>  };
>  
>  int iris_inst_change_state(struct iris_inst *inst,
> @@ -124,9 +129,13 @@ int iris_inst_change_state(struct iris_inst *inst,
>  int iris_inst_change_sub_state(struct iris_inst *inst,
>  			       enum iris_inst_sub_state clear_sub_state,
>  			       enum iris_inst_sub_state set_sub_state);
> +
>  int iris_inst_state_change_streamon(struct iris_inst *inst, u32 plane);
>  int iris_inst_state_change_streamoff(struct iris_inst *inst, u32 plane);
>  int iris_inst_sub_state_change_drc(struct iris_inst *inst);
> +int iris_inst_sub_state_change_drain_last(struct iris_inst *inst);
>  int iris_inst_sub_state_change_drc_last(struct iris_inst *inst);
> +int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane);
> +bool iris_allow_cmd(struct iris_inst *inst, u32 cmd);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index 1ff2017673ed..f51fd6929f64 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -206,8 +206,10 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
>  	}
>  
>  	if (V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type)) {
> -		if (inst->sub_state & IRIS_INST_SUB_DRC &&
> -		    inst->sub_state & IRIS_INST_SUB_DRC_LAST) {
> +		if ((inst->sub_state & IRIS_INST_SUB_DRC &&
> +		     inst->sub_state & IRIS_INST_SUB_DRC_LAST) ||
> +		    (inst->sub_state & IRIS_INST_SUB_DRAIN &&
> +		     inst->sub_state & IRIS_INST_SUB_DRAIN_LAST)) {
>  			vbuf->flags |= V4L2_BUF_FLAG_LAST;
>  			vbuf->sequence = inst->sequence_cap++;
>  			vbuf->field = V4L2_FIELD_NONE;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 012ae9f7f9a8..1ae0bb4830de 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -374,6 +374,7 @@ static int iris_vdec_process_streamon_input(struct iris_inst *inst)
>  	}
>  
>  	if (inst->sub_state & IRIS_INST_SUB_DRC ||
> +	    inst->sub_state & IRIS_INST_SUB_DRAIN ||
>  	    inst->sub_state & IRIS_INST_SUB_FIRST_IPSC) {
>  		if (!(inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE)) {
>  			if (hfi_ops->session_pause) {
> @@ -425,15 +426,20 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>  static int iris_vdec_process_streamon_output(struct iris_inst *inst)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	bool drain_active = false, drc_active = false;
>  	enum iris_inst_sub_state clear_sub_state = 0;
> -	bool drc_active = false;
>  	int ret = 0;
>  
> +	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
> +		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
> +
>  	drc_active = inst->sub_state & IRIS_INST_SUB_DRC &&
>  		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
>  
>  	if (drc_active)
>  		clear_sub_state = IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRC_LAST;
> +	else if (drain_active)
> +		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
>  
>  	if (inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
>  		ret = iris_alloc_and_queue_input_int_bufs(inst);
> @@ -449,8 +455,12 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
>  
>  	if (inst->state == IRIS_INST_INPUT_STREAMING &&
>  	    inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
> -		ret = hfi_ops->session_resume_drc(inst,
> -						  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +		if (!drain_active)
> +			ret = hfi_ops->session_resume_drc(inst,
> +							  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +		else if (hfi_ops->session_resume_drain)
> +			ret = hfi_ops->session_resume_drain(inst,
> +							    V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>  		if (ret)
>  			return ret;
>  		clear_sub_state |= IRIS_INST_SUB_INPUT_PAUSE;
> @@ -568,3 +578,78 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>  
>  	return iris_queue_buffer(inst, buf);
>  }
> +
> +int iris_vdec_start_cmd(struct iris_inst *inst)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	enum iris_inst_sub_state clear_sub_state = 0;
> +	struct vb2_queue *dst_vq;
> +	int ret;
> +
> +	dst_vq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +
> +	if (inst->sub_state & IRIS_INST_SUB_DRC &&
> +	    inst->sub_state & IRIS_INST_SUB_DRC_LAST) {
> +		vb2_clear_last_buffer_dequeued(dst_vq);
> +		clear_sub_state = IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRC_LAST;
> +
> +		if (inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
> +			ret = hfi_ops->session_resume_drc(inst,
> +							  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +			if (ret)
> +				return ret;
> +			clear_sub_state |= IRIS_INST_SUB_INPUT_PAUSE;
> +		}
> +		if (inst->sub_state & IRIS_INST_SUB_OUTPUT_PAUSE) {
> +			ret = hfi_ops->session_resume_drc(inst,
> +							  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +			if (ret)
> +				return ret;
> +			clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
> +		}
> +	} else if (inst->sub_state & IRIS_INST_SUB_DRAIN &&
> +		   inst->sub_state & IRIS_INST_SUB_DRAIN_LAST) {
> +		vb2_clear_last_buffer_dequeued(dst_vq);
> +		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
> +		if (inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
> +			if (hfi_ops->session_resume_drain) {
> +				ret =
> +				hfi_ops->session_resume_drain(inst,
> +							      V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +				if (ret)
> +					return ret;
> +			}
> +
> +			clear_sub_state |= IRIS_INST_SUB_INPUT_PAUSE;
> +		}
> +		if (inst->sub_state & IRIS_INST_SUB_OUTPUT_PAUSE) {
> +			if (hfi_ops->session_resume_drain) {
> +				ret =
> +				hfi_ops->session_resume_drain(inst,
> +							      V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +				if (ret)
> +					return ret;
> +			}
> +
> +			clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
> +		}
> +	} else {
> +		dev_err(inst->core->dev, "start called before receiving last_flag\n");
> +		iris_inst_change_state(inst, IRIS_INST_ERROR);
> +		return -EBUSY;
> +	}
> +
> +	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
> +}
> +
> +int iris_vdec_stop_cmd(struct iris_inst *inst)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	int ret;
> +
> +	ret = hfi_ops->session_drain(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	if (ret)
> +		return ret;
> +
> +	return iris_inst_change_sub_state(inst, 0, IRIS_INST_SUB_DRAIN);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
> index dfcc2089a1ef..b24932dc511a 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
> @@ -18,6 +18,8 @@ void iris_vdec_src_change(struct iris_inst *inst);
>  int iris_vdec_streamon_input(struct iris_inst *inst);
>  int iris_vdec_streamon_output(struct iris_inst *inst);
>  int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
> +int iris_vdec_start_cmd(struct iris_inst *inst);
> +int iris_vdec_stop_cmd(struct iris_inst *inst);
>  int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 8a1c35f99538..2281b291b736 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -365,6 +365,41 @@ static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
>  	return iris_vdec_subscribe_event(inst, sub);
>  }
>  
> +static int iris_dec_cmd(struct file *filp, void *fh,
> +			struct v4l2_decoder_cmd *dec)
> +{
> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
> +	int ret = 0;
> +
> +	mutex_lock(&inst->lock);
> +

I would expect to see a call to v4l2_m2m_ioctl_decoder_cmd here since
that deals with some of the LAST flag handling and internal m2m state.

It could be that you handle this manually elsewhere, but I am not certain
about that.

Regards,

	Hans

> +	if (dec->cmd != V4L2_DEC_CMD_START &&
> +	    dec->cmd != V4L2_DEC_CMD_STOP) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	if (inst->state == IRIS_INST_DEINIT)
> +		goto unlock;
> +
> +	if (!iris_allow_cmd(inst, dec->cmd)) {
> +		ret = -EBUSY;
> +		goto unlock;
> +	}
> +
> +	if (dec->cmd == V4L2_DEC_CMD_START)
> +		ret = iris_vdec_start_cmd(inst);
> +	else if (dec->cmd == V4L2_DEC_CMD_STOP)
> +		ret = iris_vdec_stop_cmd(inst);
> +	else
> +		ret = -EINVAL;
> +
> +unlock:
> +	mutex_unlock(&inst->lock);
> +
> +	return ret;
> +}
> +
>  static struct v4l2_file_operations iris_v4l2_file_ops = {
>  	.owner                          = THIS_MODULE,
>  	.open                           = iris_open,
> @@ -408,6 +443,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>  	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
>  	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
>  	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
> +	.vidioc_try_decoder_cmd         = v4l2_m2m_ioctl_try_decoder_cmd,
> +	.vidioc_decoder_cmd             = iris_dec_cmd,
>  };
>  
>  void iris_init_ops(struct iris_core *core)
> 



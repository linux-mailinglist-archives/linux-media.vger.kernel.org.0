Return-Path: <linux-media+bounces-20106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD369AC8AD
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 13:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF93A28295F
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 11:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B335E1AA780;
	Wed, 23 Oct 2024 11:13:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7C24F21D;
	Wed, 23 Oct 2024 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729681986; cv=none; b=l6bUMz1Rx3W+LolDDcneCxve4S3h/9NlpICYapVEglAgWc96J0+e67FWw/PmNwKeus88+sBaa01wcfQyrP1PM2YJizirS9xPIJqwgaOV6evqmbYHYpfI+ru8cC97iBJE+KxBjgtgLJrJk6vb1ltBwrbdisLMY1PnTWBPTLMUjCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729681986; c=relaxed/simple;
	bh=w2dIDHsuzH+P3MBWYFVjkSTcv9ecunJ3p9KhQ6AkdzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cit/Mt00QicaSj30KAz9RFxGJlzhRckl17u2mYWgn4tI/qOKzKBgjLECjYTa+ntvErdnZrP9IEJbWxQBFF+shsE2TPZ9ti74OMYZenNvqImXdzZiMcFQGyKYFeb23/Hmw1F0BxfFlFDNcnpi/8Y0og+Wv5JQIcFowc/Fe1JoVXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC1BC4CEE4;
	Wed, 23 Oct 2024 11:13:03 +0000 (UTC)
Message-ID: <59047df4-1e5f-488f-a134-f8bad7cf655c@xs4all.nl>
Date: Wed, 23 Oct 2024 13:13:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/28] media: iris: implement vb2 streaming ops
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-16-c5eaa4e9ab9e@quicinc.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241014-qcom-video-iris-v4-v4-16-c5eaa4e9ab9e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2024 11:07, Dikshita Agarwal wrote:
> In stream on, send HFI_CMD_START on capture and
> output planes to start the processing on respective planes.
> 
> During stream off, send HFI_CMD_STOP to firmware which is
> a synchronous command. After the response is received from
> firmware, the session is closed on firmware.
> 
> Introduce different states for instance and state transitions.
> 
> IRIS_INST_INIT - video instance is opened.
> IRIS_INST_INPUT_STREAMING - stream on is completed on output plane.
> IRIS_INST_OUTPUT_STREAMING - stream on is completed on capture
> plane.
> IRIS_INST_STREAMING - stream on is completed on both output and
> capture planes.
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
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  32 ++++++-
>  18 files changed, 593 insertions(+), 12 deletions(-)
> 

<snip>

> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index f89891e52fde..75c1364709d1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -6,6 +6,7 @@
>  #include "iris_buffer.h"
>  #include "iris_instance.h"
>  #include "iris_vb2.h"
> +#include "iris_vdec.h"
>  #include "iris_vpu_buffer.h"
>  
>  int iris_vb2_queue_setup(struct vb2_queue *q,
> @@ -22,6 +23,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
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
> @@ -49,6 +54,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>  			dev_err(core->dev, "session open failed\n");
>  			goto unlock;
>  		}
> +
> +		ret = iris_inst_change_state(inst, IRIS_INST_INIT);
> +		if (ret)
> +			goto unlock;
>  	}
>  
>  	buffers = &inst->buffers[buffer_type];
> @@ -75,3 +84,64 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
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

If an error occurs during start_streaming, then all queued buffers must be
returned to vb2 in state VB2_BUF_STATE_QUEUED.

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

stop_streaming must return all queued buffers to vb2 in state VB2_BUF_STATE_ERROR.

> +	mutex_unlock(&inst->lock);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.h b/drivers/media/platform/qcom/iris/iris_vb2.h
> index 78157a97b86e..bc3bb830c2ba 100644
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
> index 66a54771b9e8..44372e2811c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -241,3 +241,78 @@ int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_su
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
> index d7b8a0ad6fa8..b3299164f823 100644
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
> index 60ee05b67f86..615f57bfaddc 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -142,10 +142,12 @@ int iris_open(struct file *filp)
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
> @@ -191,6 +193,9 @@ static void iris_session_close(struct iris_inst *inst)
>  	bool wait_for_response = true;
>  	int ret;
>  
> +	if (inst->state == IRIS_INST_DEINIT)
> +		return;
> +
>  	reinit_completion(&inst->completion);
>  
>  	ret = hfi_ops->session_close(inst);
> @@ -198,7 +203,7 @@ static void iris_session_close(struct iris_inst *inst)
>  		wait_for_response = false;
>  
>  	if (wait_for_response)
> -		iris_wait_for_session_response(inst);
> +		iris_wait_for_session_response(inst, false);
>  }
>  
>  int iris_close(struct file *filp)
> @@ -211,6 +216,7 @@ int iris_close(struct file *filp)
>  	mutex_lock(&inst->lock);
>  	iris_vdec_inst_deinit(inst);
>  	iris_session_close(inst);
> +	iris_inst_change_state(inst, IRIS_INST_DEINIT);
>  	iris_v4l2_fh_deinit(inst);
>  	iris_remove_session(inst);
>  	mutex_unlock(&inst->lock);
> @@ -238,7 +244,14 @@ static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_form
>  	int ret;
>  
>  	mutex_lock(&inst->lock);
> +	if (inst->state == IRIS_INST_ERROR) {
> +		ret = -EBUSY;
> +		goto unlock;
> +	}

Why this check? You should be able to try a format at any time.

> +
>  	ret = iris_vdec_try_fmt(inst, f);
> +
> +unlock:
>  	mutex_unlock(&inst->lock);
>  
>  	return ret;
> @@ -250,7 +263,14 @@ static int iris_s_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
>  	int ret;
>  
>  	mutex_lock(&inst->lock);
> +	if (inst->state == IRIS_INST_ERROR) {
> +		ret = -EBUSY;
> +		goto unlock;
> +	}
> +
>  	ret = iris_vdec_s_fmt(inst, f);
> +
> +unlock:
>  	mutex_unlock(&inst->lock);
>  
>  	return ret;
> @@ -262,6 +282,11 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
>  	int ret = 0;
>  
>  	mutex_lock(&inst->lock);
> +	if (inst->state == IRIS_INST_ERROR) {
> +		ret = -EBUSY;
> +		goto unlock;
> +	}

Same question, this should be fine at any time.

> +
>  	if (V4L2_TYPE_IS_OUTPUT(f->type))
>  		memcpy(f, inst->fmt_src, sizeof(*f));
>  	else if (V4L2_TYPE_IS_CAPTURE(f->type))
> @@ -269,6 +294,7 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
>  	else
>  		ret = -EINVAL;
>  
> +unlock:
>  	mutex_unlock(&inst->lock);
>  
>  	return ret;
> @@ -402,6 +428,8 @@ static struct v4l2_file_operations iris_v4l2_file_ops = {
>  
>  static const struct vb2_ops iris_vb2_ops = {
>  	.queue_setup                    = iris_vb2_queue_setup,
> +	.start_streaming                = iris_vb2_start_streaming,
> +	.stop_streaming                 = iris_vb2_stop_streaming,
>  };
>  
>  static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
> @@ -421,6 +449,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>  	.vidioc_g_selection             = iris_g_selection,
>  	.vidioc_subscribe_event         = iris_subscribe_event,
>  	.vidioc_unsubscribe_event       = iris_unsubscribe_event,
> +	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
>  };
>  
>  void iris_init_ops(struct iris_core *core)
> 



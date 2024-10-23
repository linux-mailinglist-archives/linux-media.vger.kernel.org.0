Return-Path: <linux-media+bounces-20102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 449179AC842
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 12:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DCB01C21AA5
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 10:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786AF1A706A;
	Wed, 23 Oct 2024 10:53:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A35D55896;
	Wed, 23 Oct 2024 10:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729680828; cv=none; b=dz/YXLwHjXyx7kbW6mich8/z5ecGdW9WUDXR4zyBGeHF4zX6/1h+JWnWqPqSENY0zL+SRWfwZprV3Wsydwxb5uZmYzyKRV/wbEK7e2MBkq8dPx9qMU0RvX1TiBPVwQR0rgQs7aioDSJzPaSxkGZGwamU+nvmcvdAnHBfB8z9lZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729680828; c=relaxed/simple;
	bh=OVxvnPFmtEptAnqiwO8D4thUZ7w93Z8IUlicBOIjqY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFw83CsBNf5R/oMcUQ9f1MLWqA271k1TD8GMaswdaDxWdsAutBIQWAEt4Tp6JlFi+GzAPWuRyFiYR7ypkEKyqhghY9cj8iII6v8YgTItNKOF6yIm711TNpr2bN6eivVhsKRqZLR5wMSTE6pUe27ZqQ+Uwbpg4Kjn+3ucYxHsYso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C78DC4CEC6;
	Wed, 23 Oct 2024 10:53:44 +0000 (UTC)
Message-ID: <990813bb-05b8-48e7-af00-e07de6836a17@xs4all.nl>
Date: Wed, 23 Oct 2024 12:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/28] media: iris: implement subscribe_event and
 unsubscribe_event ioctls
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vedang Nagar <quic_vnagar@quicinc.com>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-13-c5eaa4e9ab9e@quicinc.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241014-qcom-video-iris-v4-v4-13-c5eaa4e9ab9e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2024 11:07, Dikshita Agarwal wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> Implement subscribe_event and unsubscribe_event iocts
> with necessary hooks.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_instance.h |  2 ++
>  drivers/media/platform/qcom/iris/iris_vdec.c     | 26 ++++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vdec.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_vidc.c     | 17 ++++++++++++++++
>  4 files changed, 46 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index bb43119af352..d28b8fd7ec2f 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -30,6 +30,7 @@
>   * @once_per_session_set: boolean to set once per session property
>   * @m2m_dev:	a reference to m2m device structure
>   * @m2m_ctx:	a reference to m2m context structure
> + * @subscriptions: variable to hold current events subscriptions
>   */
>  
>  struct iris_inst {
> @@ -48,6 +49,7 @@ struct iris_inst {
>  	bool				once_per_session_set;
>  	struct v4l2_m2m_dev		*m2m_dev;
>  	struct v4l2_m2m_ctx		*m2m_ctx;
> +	unsigned int			subscriptions;
>  };
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index fd0f1ebc33e8..c4eeba5ed6da 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  
>  #include "iris_buffer.h"
> @@ -13,6 +14,7 @@
>  #define DEFAULT_WIDTH 320
>  #define DEFAULT_HEIGHT 240
>  #define DEFAULT_CODEC_ALIGNMENT 16
> +#define MAX_EVENTS 30
>  
>  void iris_vdec_inst_init(struct iris_inst *inst)
>  {
> @@ -208,3 +210,27 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  
>  	return 0;
>  }
> +
> +int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub)
> +{
> +	int ret = 0;
> +
> +	switch (sub->type) {
> +	case V4L2_EVENT_EOS:
> +		ret = v4l2_event_subscribe(&inst->fh, sub, MAX_EVENTS, NULL);

Why 30 events? EOS needs has to store just 1 event. I'd just drop MAX_EVENTS and
fill in 0 or 1 here.

> +		inst->subscriptions |= V4L2_EVENT_EOS;
> +		break;
> +	case V4L2_EVENT_SOURCE_CHANGE:
> +		ret = v4l2_src_change_event_subscribe(&inst->fh, sub);
> +		inst->subscriptions |= V4L2_EVENT_SOURCE_CHANGE;
> +		break;
> +	case V4L2_EVENT_CTRL:
> +		ret = v4l2_ctrl_subscribe_event(&inst->fh, sub);
> +		inst->subscriptions |= V4L2_EVENT_CTRL;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
> index eb8a1121ae92..707fff34bf4d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
> @@ -13,5 +13,6 @@ void iris_vdec_inst_deinit(struct iris_inst *inst);
>  int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
>  int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>  int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
> +int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 1d6c5e8fafb4..8068c06c1f11 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/pm_runtime.h>
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-mem2mem.h>
>  
> @@ -320,6 +321,20 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
>  	return 0;
>  }
>  
> +static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub)
> +{
> +	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
> +
> +	return iris_vdec_subscribe_event(inst, sub);
> +}
> +
> +static int iris_unsubscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub)
> +{
> +	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
> +
> +	return v4l2_event_unsubscribe(&inst->fh, sub);
> +}
> +
>  static struct v4l2_file_operations iris_v4l2_file_ops = {
>  	.owner                          = THIS_MODULE,
>  	.open                           = iris_open,
> @@ -345,6 +360,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>  	.vidioc_enum_framesizes         = iris_enum_framesizes,
>  	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
>  	.vidioc_g_selection             = iris_g_selection,
> +	.vidioc_subscribe_event         = iris_subscribe_event,
> +	.vidioc_unsubscribe_event       = iris_unsubscribe_event,

Just set this op to v4l2_event_unsubscribe directly. You should not need a
driver specific override function.

>  };
>  
>  void iris_init_ops(struct iris_core *core)
> 



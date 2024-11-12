Return-Path: <linux-media+bounces-21296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5C19C546D
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 11:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADA12B2E08C
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 10:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A7520E31D;
	Tue, 12 Nov 2024 10:23:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F016921216C;
	Tue, 12 Nov 2024 10:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407006; cv=none; b=B+Y2jn5IKNv5QyT+aEE1efoiVuYjsxtbkENosQXDkJX7Bx/sB9p6KLlZFtwWpcEa0a8HRZrBuu6xibGUma7NxoyEeaSOQMAsfwtXnAYwyWI/M4nP7ONbRtH/KS1jHJ04rMXDYBJLvm2npXfxJPcusjy/EsXo1u5Z4aEffC3xZIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407006; c=relaxed/simple;
	bh=JiZ5Tc2DIkZvwY2DXbMIpkFJDjwpVLxOSSaar6aI7/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDaAIq1/ZA0mF5B0lHuTQsd84GOUmJMAdzvRfBQwDHKydiNU5FJZoezia0PWSiSZnIuEdtrJBCiDBY7jUcPYoEBxm7U/xy+O7HM7hyklAVpNp4ucVkJZGiY/540SmLfllDrygAdvRlRXyZEYAi84ToIz6p3FjAkpySBAVSAqjac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9699AC4CED6;
	Tue, 12 Nov 2024 10:23:21 +0000 (UTC)
Message-ID: <7dcf9ca0-4707-4641-905e-c5e1b0a8b7fd@xs4all.nl>
Date: Tue, 12 Nov 2024 11:23:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/28] media: iris: implement enum_fmt and
 enum_frameintervals ioctls
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
 linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-12-a88e7c220f78@quicinc.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241105-qcom-video-iris-v5-12-a88e7c220f78@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/11/2024 07:55, Dikshita Agarwal wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> Implement enum_fmt and enum_frameintervals ioctls with necessary hooks.

There is a typo in this commit log and in the Subject: you implement framesizes,
not frameintervals.

Please fix, since this is confusing.

Regards,

	Hans

> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  4 +++
>  .../platform/qcom/iris/iris_platform_sm8550.c      |  4 +++
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 17 ++++++++++
>  drivers/media/platform/qcom/iris/iris_vdec.h       |  1 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       | 39 ++++++++++++++++++++++
>  5 files changed, 65 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index e345667dfbf2..54a2d723797b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -43,6 +43,10 @@ struct ubwc_config_data {
>  };
>  
>  struct platform_inst_caps {
> +	u32 min_frame_width;
> +	u32 max_frame_width;
> +	u32 min_frame_height;
> +	u32 max_frame_height;
>  	u32 max_mbpf;
>  };
>  struct iris_core_power {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> index bc4769732aad..37c0130d7059 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -11,6 +11,10 @@
>  #define VIDEO_ARCH_LX 1
>  
>  static struct platform_inst_caps platform_inst_cap_sm8550 = {
> +	.min_frame_width = 96,
> +	.max_frame_width = 8192,
> +	.min_frame_height = 96,
> +	.max_frame_height = 8192,
>  	.max_mbpf = (8192 * 4352) / 256,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index e807decdda2b..b2858c96e859 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -60,6 +60,23 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>  	kfree(inst->fmt_src);
>  }
>  
> +int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
> +{
> +	switch (f->type) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		f->pixelformat = V4L2_PIX_FMT_H264;
> +		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		f->pixelformat = V4L2_PIX_FMT_NV12;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
> index 4f2557d15ca2..eb8a1121ae92 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
> @@ -10,6 +10,7 @@ struct iris_inst;
>  
>  void iris_vdec_inst_init(struct iris_inst *inst);
>  void iris_vdec_inst_deinit(struct iris_inst *inst);
> +int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
>  int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>  int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 6a32fd8d6123..bc77dfc2ba67 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -217,6 +217,16 @@ int iris_close(struct file *filp)
>  	return 0;
>  }
>  
> +static int iris_enum_fmt(struct file *filp, void *fh, struct v4l2_fmtdesc *f)
> +{
> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
> +
> +	if (f->index)
> +		return -EINVAL;
> +
> +	return iris_vdec_enum_fmt(inst, f);
> +}
> +
>  static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
>  {
>  	struct iris_inst *inst = iris_get_inst(filp, NULL);
> @@ -259,6 +269,32 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
>  	return ret;
>  }
>  
> +static int iris_enum_framesizes(struct file *filp, void *fh,
> +				struct v4l2_frmsizeenum *fsize)
> +{
> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
> +	struct platform_inst_caps *caps;
> +
> +	if (fsize->index)
> +		return -EINVAL;
> +
> +	if (fsize->pixel_format != V4L2_PIX_FMT_H264 &&
> +	    fsize->pixel_format != V4L2_PIX_FMT_NV12)
> +		return -EINVAL;
> +
> +	caps = inst->core->iris_platform_data->inst_caps;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise.min_width = caps->min_frame_width;
> +	fsize->stepwise.max_width = caps->max_frame_width;
> +	fsize->stepwise.step_width = STEP_WIDTH;
> +	fsize->stepwise.min_height = caps->min_frame_height;
> +	fsize->stepwise.max_height = caps->max_frame_height;
> +	fsize->stepwise.step_height = STEP_HEIGHT;
> +
> +	return 0;
> +}
> +
>  static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
>  {
>  	struct iris_inst *inst = iris_get_inst(filp, NULL);
> @@ -300,12 +336,15 @@ static const struct vb2_ops iris_vb2_ops = {
>  };
>  
>  static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
> +	.vidioc_enum_fmt_vid_cap        = iris_enum_fmt,
> +	.vidioc_enum_fmt_vid_out        = iris_enum_fmt,
>  	.vidioc_try_fmt_vid_cap_mplane  = iris_try_fmt_vid_mplane,
>  	.vidioc_try_fmt_vid_out_mplane  = iris_try_fmt_vid_mplane,
>  	.vidioc_s_fmt_vid_cap_mplane    = iris_s_fmt_vid_mplane,
>  	.vidioc_s_fmt_vid_out_mplane    = iris_s_fmt_vid_mplane,
>  	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
>  	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
> +	.vidioc_enum_framesizes         = iris_enum_framesizes,
>  	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
>  	.vidioc_g_selection             = iris_g_selection,
>  };
> 



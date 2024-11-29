Return-Path: <linux-media+bounces-22295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEFB9DC0F7
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2F9E282075
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6752172BA9;
	Fri, 29 Nov 2024 09:01:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650CD16DEDF;
	Fri, 29 Nov 2024 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732870878; cv=none; b=g+v0i4oiEGfKr1Ahu8IrCfEKYQodchK2/mHNB0GHOuMvB63aLr7D0laycpTjUH7VjkP06NyezxwOjL+72ScIxc0VHI4Se1k3bIf+iBfO/kpkhIaZ/Xn8r37KnJLhujRrzOFubBJ8aYwRwcSP/26XlXXoCrwg+mFgta/YKJmYEyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732870878; c=relaxed/simple;
	bh=ZmAVSzcdfNqQ2AmOAcMLQqf53TAg05WAO3ERdUd468Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AuswElpj5ZqpoqsMgePhnZUVXMCQs24Lk7Ly6RvbH6U4WE3UtNe4wrgOMWYxXWKpK9Y3c43CAxZbs3BYiMT5G6rsmpFDmnz4KJvp/l+kBUqOLv2Y+r6+s/9lVfrsDW60Tx4S61wl8KEh7ubj6X43cJF2b2hTPzHetQFOOa/UwGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F2EC4CECF;
	Fri, 29 Nov 2024 09:01:13 +0000 (UTC)
Message-ID: <92f9c7ba-90a5-4f02-b547-62a00af128e1@xs4all.nl>
Date: Fri, 29 Nov 2024 10:01:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/28] media: iris: implement s_fmt, g_fmt and try_fmt
 ioctls
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
References: <20241120-qcom-video-iris-v6-0-a8cf6704e992@quicinc.com>
 <20241120-qcom-video-iris-v6-10-a8cf6704e992@quicinc.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwEKAD8CGwMGCwkIBwMCBhUIAgkKCwQWAgMB
 Ah4BAheAFiEEBSzee8IVBTtonxvKvS1hSGYUO0wFAmaU3GkFCRf7lXsACgkQvS1hSGYUO0wZ
 cw//cLMiaV+p2rCyzdpDjWon2XD6M646THYvqXLb9eVWicFlVG78kNtHrHyEWKPhN3OdWWjn
 kOzXseVR/nS6vZvqCaT3rwgh3ZMb0GvOQk1/7V8UbcIERy036AjQoZmKo5tEDIv48MSvqxjj
 H6wbKXbCyvnIwpGICLyb0xAwvvpTaJkwZjvGqeo5EL0Z+cQ8fCelfKNO5CFFP3FNd3dH8wU6
 CHRtdZE03iIVEWpgCTjsG2zwsX/CKfPx0EKcrQajW3Tc50Jm0uuRUEKCVphlYORAPtFAF1dj
 Ly8zpN1bEXH+0FDXe/SHhzbvgS4sL0J4KQCCZ/GcbKh/vsDC1VLsGS5C7fKOhAtOkUPWRjF+
 kOEEcTOROMMvSUVokO+gCdb9nA/e3WMgiTwWRumWy5eCEnCpM9+rfI2HzTeACrVgGEDkOTHW
 eaGHEy8nS9a25ejQzsBhi+T7MW53ZTIjklR7dFl/uuK+EJ6DLbDpVbwyYo2oeiwP+sf8/Rgv
 WfJv4wzfUo/JABwrsbfWfycVZwFWBzqq+TaKFkMPm017dkLdg4MzxvvTMP7nKfJxU1bQ2OOr
 xkPk5KDcz+aRYBvTqEXgYZ6OZtnOUFKD+uPlbWf68vuz/1iFbQYnNJkTxwWhiIMN7BULK74d
 Ek89MU7JlbYNSv0v21lRF+uDo0J6zyoTt0ZxSPzOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAEKACYCGwwWIQQFLN57whUFO2ifG8q9LWFIZhQ7TAUC
 ZpTcxwUJF/uV2gAKCRC9LWFIZhQ7TMlPD/9ppgrN4Z9gXta9IdS8a+0E7lj/dc0LnF9T6MMq
 aUC+CFffTiOoNDnfXh8sfsqTjAT50TsVpdlH6YyPlbU5FR8bC8wntrJ6ZRWDdHJiCDLqNA/l
 GVtIKP1YW8fA01thMcVUyQCdVUqnByMJiJQDzZYrX+E/YKUTh2RL5Ye0foAGE7SGzfZagI0D
 OZN92w59e1Jg3zBhYXQIjzBbhGIy7usBfvE882GdUbP29bKfTpcOKkJIgO6K+w82D/1d5TON
 SD146+UySmEnjYxHI8kBYaZJ4ubyYrDGgXT3jIBPq8i9iZP3JSeZ/0F9UIlX4KeMSG8ymgCR
 SqL1y9pl9R2ewCepCahEkTT7IieGUzJZz7fGUaxrSyexPE1+qNosfrUIu3yhRA6AIjhwPisl
 aSwDxLI6qWDEQeeWNQaYUSEIFQ5XkZxd/VN8JeMwGIAq17Hlym+JzjBkgkm1LV9LXw9D8MQL
 e8tSeEXX8BZIen6y/y+U2CedzEsMKGjy5WNmufiPOzB3q2JwFQCw8AoNic7soPN9CVCEgd2r
 XS+OUZb8VvEDVRSK5Yf79RveqHvmhAdNOVh70f5CvwR/bfX/Ei2Szxz47KhZXpn1lxmcds6b
 LYjTAZF0anym44vsvOEuQg3rqxj/7Hiz4A3HIkrpTWclV6ru1tuGp/ZJ7aY8bdvztP2KTw==
In-Reply-To: <20241120-qcom-video-iris-v6-10-a8cf6704e992@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dikshita,

Some comments below...

On 20/11/2024 15:46, Dikshita Agarwal wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> Implement s_fmt, g_fmt and try_fmt ioctl ops with necessary hooks.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vdec.c | 122 +++++++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vdec.h |   2 +
>  drivers/media/platform/qcom/iris/iris_vidc.c |  48 +++++++++++
>  3 files changed, 172 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 2ed50ad5d58b..11a2507fc35f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <media/v4l2-mem2mem.h>
> +
>  #include "iris_buffer.h"
>  #include "iris_instance.h"
>  #include "iris_vdec.h"
> @@ -10,6 +12,7 @@
>  
>  #define DEFAULT_WIDTH 320
>  #define DEFAULT_HEIGHT 240
> +#define DEFAULT_CODEC_ALIGNMENT 16
>  
>  void iris_vdec_inst_init(struct iris_inst *inst)
>  {
> @@ -54,3 +57,122 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>  	kfree(inst->fmt_dst);
>  	kfree(inst->fmt_src);
>  }
> +
> +int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
> +	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
> +	struct v4l2_format *f_inst;
> +	struct vb2_queue *src_q;
> +
> +	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
> +	switch (f->type) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264) {
> +			f_inst = inst->fmt_src;
> +			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
> +			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
> +			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
> +		}
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
> +			f_inst = inst->fmt_dst;
> +			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
> +			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
> +			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
> +		}
> +
> +		src_q = v4l2_m2m_get_src_vq(m2m_ctx);
> +		if (vb2_is_streaming(src_q)) {
> +			f_inst = inst->fmt_src;
> +			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
> +			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (pixmp->field == V4L2_FIELD_ANY)
> +		pixmp->field = V4L2_FIELD_NONE;
> +
> +	pixmp->num_planes = 1;
> +
> +	return 0;
> +}
> +
> +int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
> +{
> +	struct v4l2_format *fmt, *output_fmt;
> +	struct vb2_queue *q;
> +	u32 codec_align;
> +
> +	iris_vdec_try_fmt(inst, f);

I'm missing a vb2_is_busy() check here (and a return -EBUSY).

Changing the format while busy (i.e. while buffers are allocated)
is generally a no-go since the format and the buffer sizes are linked.

> +
> +	switch (f->type) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264)
> +			return -EINVAL;
> +
> +		fmt = inst->fmt_src;
> +		fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +
> +		codec_align = DEFAULT_CODEC_ALIGNMENT;
> +		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
> +		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
> +		fmt->fmt.pix_mp.num_planes = 1;
> +		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
> +		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_INPUT);
> +		inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
> +		inst->buffers[BUF_INPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> +
> +		fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
> +		fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
> +		fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
> +		fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
> +
> +		output_fmt = inst->fmt_dst;
> +		output_fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
> +		output_fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
> +		output_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
> +		output_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
> +
> +		inst->crop.left = 0;
> +		inst->crop.top = 0;
> +		inst->crop.width = f->fmt.pix_mp.width;
> +		inst->crop.height = f->fmt.pix_mp.height;
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		fmt = inst->fmt_dst;
> +		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +		q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> +		if (q->streaming) {
> +			f->fmt.pix_mp.height = inst->fmt_src->fmt.pix_mp.height;
> +			f->fmt.pix_mp.width = inst->fmt_src->fmt.pix_mp.width;
> +		}
> +		if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
> +			return -EINVAL;
> +		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
> +		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
> +		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
> +		fmt->fmt.pix_mp.num_planes = 1;
> +		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
> +		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
> +		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
> +		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> +
> +		if (!q->streaming) {

Use vb2_is_streaming(), don't refer to q->streaming directly.

Please check if this is done anywhere else as well in the driver and
use the helper function instead.

> +			inst->crop.top = 0;
> +			inst->crop.left = 0;
> +			inst->crop.width = f->fmt.pix_mp.width;
> +			inst->crop.height = f->fmt.pix_mp.height;

A bigger question is why you do this? See the question about vb2_is_busy above:
you shouldn't be able to get here at all if you are streaming since the vb2_is_busy
check will catch that.

> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	memcpy(f, fmt, sizeof(*fmt));
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
> index 353b73b76230..85e93f33e9e7 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
> @@ -10,5 +10,7 @@ struct iris_inst;
>  
>  void iris_vdec_inst_init(struct iris_inst *inst);
>  void iris_vdec_inst_deinit(struct iris_inst *inst);
> +int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
> +int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index ab3b63171c1d..6707eb9917fe 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -217,6 +217,48 @@ int iris_close(struct file *filp)
>  	return 0;
>  }
>  
> +static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
> +{
> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
> +	int ret;
> +
> +	mutex_lock(&inst->lock);
> +	ret = iris_vdec_try_fmt(inst, f);
> +	mutex_unlock(&inst->lock);
> +
> +	return ret;
> +}
> +
> +static int iris_s_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
> +{
> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
> +	int ret;
> +
> +	mutex_lock(&inst->lock);
> +	ret = iris_vdec_s_fmt(inst, f);
> +	mutex_unlock(&inst->lock);
> +
> +	return ret;
> +}
> +
> +static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
> +{
> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
> +	int ret = 0;
> +
> +	mutex_lock(&inst->lock);
> +	if (V4L2_TYPE_IS_OUTPUT(f->type))
> +		memcpy(f, inst->fmt_src, sizeof(*f));

Use: *f = *inst->fmt_src

> +	else if (V4L2_TYPE_IS_CAPTURE(f->type))
> +		memcpy(f, inst->fmt_dst, sizeof(*f));

Ditto for fmt_dst

> +	else
> +		ret = -EINVAL;
> +
> +	mutex_unlock(&inst->lock);
> +
> +	return ret;
> +}
> +
>  static struct v4l2_file_operations iris_v4l2_file_ops = {
>  	.owner                          = THIS_MODULE,
>  	.open                           = iris_open,
> @@ -231,6 +273,12 @@ static const struct vb2_ops iris_vb2_ops = {
>  };
>  
>  static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
> +	.vidioc_try_fmt_vid_cap_mplane  = iris_try_fmt_vid_mplane,
> +	.vidioc_try_fmt_vid_out_mplane  = iris_try_fmt_vid_mplane,
> +	.vidioc_s_fmt_vid_cap_mplane    = iris_s_fmt_vid_mplane,
> +	.vidioc_s_fmt_vid_out_mplane    = iris_s_fmt_vid_mplane,
> +	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
> +	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
>  	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
>  };
>  
> 

Regards,

	Hans


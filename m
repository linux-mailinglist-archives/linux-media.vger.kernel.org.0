Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79DA324B745
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 12:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729382AbgHTKuI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 06:50:08 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:52045 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731694AbgHTKtL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 06:49:11 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8i84kGOdVywL58i85kZMQE; Thu, 20 Aug 2020 12:49:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597920549; bh=stFKX1/bkOlFOdmE1cMlFLXhv1Na/vGI886SGTypFC8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TsIU9CQDjfF3BqP0nq+m1FDr5dxg8+PKgZv1xaoWKcjTY8Zme/49jjnuBEptiuB+h
         qKGWQskc9Lzw+dYttVVZ/eqYTUIuWblBd96pSkJ7wryRosdCA8szaujY2oW6WFVP+J
         jcmvRmK6/V6fCb18dOswV6/A7yHpP3G/c1ypuG1cevaiZtThUNB3yYqt0bNQOKz5XL
         w/+s/mtBL8m3EKOdaVgBtRwGIEL82H8MztKb92Psj5vyBgIX+N/2zHkLEClnHZs3z+
         W+m3LBeCNCRF8vyfK94eWmUjz8n4PRv51Kx6mEr97jvfPhreONDqUw2Fgqeic0t+gc
         i3aw7qwyG1dpg==
Subject: Re: [PATCH v6 3/6] media: vivid: Add support to the CSC API
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200818081807.23134-1-dafna.hirschfeld@collabora.com>
 <20200818081807.23134-4-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <82f2ef44-8fd0-69d5-fc79-eda18cfc6dcc@xs4all.nl>
Date:   Thu, 20 Aug 2020 12:49:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818081807.23134-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfObn4GVjiVxsi1FvVVddvztxtJUEZzoeAIhSAyJCZoceD2QS0issBSpzwd22UrFDE489bIHbCdCFIsjYbhBK8RxXmZaQpGkqlUsXGIikcUQjvyjJjkhF
 hJEkJYGPubZQJFx6VMFRU/W+tJvgBICVoDZ+Xvasb6G+AjBc+nuDlgLdAPq0Vibr6kd/FUXrkwwHR6axCrO3pMUBixL9ODNvj2VPcz8DXx9V3rl5Zjfqb5Ny
 PJqb3jSQYTpjD/I3kIMCoyuudMMlvIxsfR8GczjGTAJx+A0ddnU5miGyn1So7fwfFYXxB+9hyDLBz5YVqW6Uyu/P4jaW8YFnQD0g8fpCcl601wT6HoZXYfuN
 zKXFN+Mmv5VJaVZyIIRepe/ehElFy9BkkbakCAfurzMf3uPTUpF+z7A+fUo9E2eDmrt0Z/qhIPxSe1cV2ttZXGEleSh1CYTBfF64mu+ghZYmcRvz4fj7qIkj
 mhrap10556QxY8owLiHQiXbJtOFv4vzuQ8ZUvxl1lFKPZ8OcZN5go8dtVHRgnfd9AzhRuzpUDWIJ/kTDUhVYp+sACAbfI59jnL8adHLiNRDbXtbyHG7CMOlP
 XLaKoS+BkZVOwzviJALO9YaUWW7HrTDR/jptQAQEqfVBVNLjZxPm4oKAW2thuY8lHvo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/08/2020 10:18, Dafna Hirschfeld wrote:
> The CSC API (Colorspace conversion) allows userspace to try
> to configure the colorspace, transfer function, Y'CbCr/HSV encoding
> and the quantization for capture devices. This patch adds support
> to the CSC API in vivid.
> Using the CSC API, userspace is allowed to do the following:
> 
> - Set the colorspace.
> - Set the xfer_func.
> - Set the ycbcr_enc function for YUV formats.
> - Set the hsv_enc function for HSV formats
> - Set the quantization for YUV and RGB formats.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../media/test-drivers/vivid/vivid-vid-cap.c  | 38 +++++++++++++++---
>  .../test-drivers/vivid/vivid-vid-common.c     | 25 ++++++++++++
>  include/media/v4l2-common.h                   | 39 +++++++++++++++++++
>  3 files changed, 96 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> index e94beef008c8..eadf28ab1e39 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> @@ -560,6 +560,7 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
>  	unsigned factor = 1;
>  	unsigned w, h;
>  	unsigned p;
> +	bool user_set_csc = !!(mp->flags & V4L2_PIX_FMT_FLAG_SET_CSC);
>  
>  	fmt = vivid_get_format(dev, mp->pixelformat);
>  	if (!fmt) {
> @@ -633,13 +634,30 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
>  			(fmt->bit_depth[p] / fmt->vdownsampling[p])) /
>  			(fmt->bit_depth[0] / fmt->vdownsampling[0]);
>  
> -	mp->colorspace = vivid_colorspace_cap(dev);
> -	if (fmt->color_enc == TGP_COLOR_ENC_HSV)
> -		mp->hsv_enc = vivid_hsv_enc_cap(dev);
> -	else
> +	if (!user_set_csc || !v4l2_is_colorspace_valid(mp->colorspace))
> +		mp->colorspace = vivid_colorspace_cap(dev);
> +
> +	if (!user_set_csc || !v4l2_is_xfer_func_valid(mp->xfer_func))
> +		mp->xfer_func = vivid_xfer_func_cap(dev);
> +
> +	if (fmt->color_enc == TGP_COLOR_ENC_HSV) {
> +		if (!user_set_csc || !v4l2_is_hsv_enc_valid(mp->hsv_enc))
> +			mp->hsv_enc = vivid_hsv_enc_cap(dev);
> +	} else if (fmt->color_enc == TGP_COLOR_ENC_YCBCR) {
> +		if (!user_set_csc || !v4l2_is_ycbcr_enc_valid(mp->ycbcr_enc))
> +			mp->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
> +	} else {
>  		mp->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
> -	mp->xfer_func = vivid_xfer_func_cap(dev);
> -	mp->quantization = vivid_quantization_cap(dev);
> +	}
> +
> +	if (fmt->color_enc == TGP_COLOR_ENC_YCBCR ||
> +	    fmt->color_enc == TGP_COLOR_ENC_RGB) {
> +		if (!user_set_csc || !v4l2_is_quant_valid(mp->quantization))
> +			mp->quantization = vivid_quantization_cap(dev);
> +	} else {
> +		mp->quantization = vivid_quantization_cap(dev);
> +	}
> +
>  	memset(mp->reserved, 0, sizeof(mp->reserved));
>  	return 0;
>  }
> @@ -769,6 +787,14 @@ int vivid_s_fmt_vid_cap(struct file *file, void *priv,
>  	if (vivid_is_sdtv_cap(dev))
>  		dev->tv_field_cap = mp->field;
>  	tpg_update_mv_step(&dev->tpg);
> +	dev->tpg.colorspace = mp->colorspace;
> +	dev->tpg.xfer_func = mp->xfer_func;
> +	if (dev->fmt_cap->color_enc == TGP_COLOR_ENC_YCBCR)
> +		dev->tpg.ycbcr_enc = mp->ycbcr_enc;
> +	else
> +		dev->tpg.hsv_enc = mp->hsv_enc;
> +	dev->tpg.quantization = mp->quantization;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
> index 76b0be670ebb..19701fe72030 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
> @@ -920,6 +920,31 @@ int vivid_enum_fmt_vid(struct file *file, void  *priv,
>  	fmt = &vivid_formats[f->index];
>  
>  	f->pixelformat = fmt->fourcc;
> +
> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> +	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +		return 0;
> +	/*
> +	 * For capture devices, we support the CSC API.
> +	 * We allow userspace to:
> +	 * 1. set the colorspace
> +	 * 2. set the xfer_func
> +	 * 3. set the ycbcr_enc on YUV formats
> +	 * 4. set the hsv_enc on HSV formats
> +	 * 5. set the quantization on YUV and RGB formats
> +	 */
> +	f->flags |= V4L2_FMT_FLAG_CSC_COLORSPACE;
> +	f->flags |= V4L2_FMT_FLAG_CSC_XFER_FUNC;
> +
> +	if (fmt->color_enc == TGP_COLOR_ENC_YCBCR) {
> +		f->flags |= V4L2_FMT_FLAG_CSC_YCBCR_ENC;
> +		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION;
> +	} else if (fmt->color_enc == TGP_COLOR_ENC_HSV) {
> +		f->flags |= V4L2_FMT_FLAG_CSC_HSV_ENC;
> +	} else if (fmt->color_enc == TGP_COLOR_ENC_RGB) {
> +		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION;
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 150ee16ebd81..f024022d1909 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -539,4 +539,43 @@ static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
>  	buf->timestamp.tv_usec = ts.tv_nsec / NSEC_PER_USEC;
>  }
>  
> +static inline bool v4l2_is_colorspace_valid(__u32 colorspace)
> +{
> +	if (colorspace > V4L2_COLORSPACE_DEFAULT &&
> +	    colorspace <= V4L2_COLORSPACE_DCI_P3)
> +		return true;
> +	return false;

Just simplify this and the others below to:

	return colorspace > V4L2_COLORSPACE_DEFAULT &&
	       colorspace <= V4L2_COLORSPACE_DCI_P3;

Regards,

	Hans

> +}
> +
> +static inline bool v4l2_is_xfer_func_valid(__u32 xfer_func)
> +{
> +	if (xfer_func > V4L2_XFER_FUNC_DEFAULT &&
> +	    xfer_func <= V4L2_XFER_FUNC_SMPTE2084)
> +		return true;
> +	return false;
> +}
> +
> +static inline bool v4l2_is_ycbcr_enc_valid(__u8 ycbcr_enc)
> +{
> +	if (ycbcr_enc > V4L2_YCBCR_ENC_DEFAULT &&
> +	    ycbcr_enc <= V4L2_YCBCR_ENC_SMPTE240M)
> +		return true;
> +	return false;
> +}
> +
> +static inline bool v4l2_is_hsv_enc_valid(__u8 hsv_enc)
> +{
> +	if (hsv_enc == V4L2_HSV_ENC_180 || hsv_enc == V4L2_HSV_ENC_256)
> +		return true;
> +	return false;
> +}
> +
> +static inline bool v4l2_is_quant_valid(__u8 quantization)
> +{
> +	if (quantization == V4L2_QUANTIZATION_FULL_RANGE ||
> +	    quantization == V4L2_QUANTIZATION_LIM_RANGE)
> +		return true;
> +	return false;
> +}
> +
>  #endif /* V4L2_COMMON_H_ */
> 


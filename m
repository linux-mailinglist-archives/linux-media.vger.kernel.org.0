Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A2B228188
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 16:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgGUOCp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 10:02:45 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:50777 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726436AbgGUOCp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 10:02:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xsqvjiFWdNPeYxsqwjuipk; Tue, 21 Jul 2020 16:02:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595340162; bh=MgJcFLAOBJ5F+1SLF/huG0SeljYHtQODPd90uTa48Us=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sNlHjQTNxPAgUlaTBvETgRZI/WQdruxJaa5g2688r8oBXIwU25I0eTRAX/mOEzvO6
         NU8Eg7UvCoAvqzoO/zJxd5zTa3SEMi0xpS1j6M4V3sh/cT1xunZXSSGuwnMCJCy2rq
         n77l4ovdy7uIz549fOsFnJDLQ4eT2u/oxGILchTHAQZ12ieH19RKkCX5c1qzOj2Wbk
         VBWg1aKN2XvkTds6H2H+gibnmAFLEzKHjOR4bMonsWg9EOoJA8R0YQq6cw51IaLDVL
         BhswJVLrbX8WZE/mtWZd42jHWn8YENZZIhQsKd//AF1c0AVmDrSkT6cKX08TUkcYA/
         wbGTlU7LPGK+Q==
Subject: Re: [PATCH v5 6/7] media: staging: rkisp1: allow quantization setting
 by userspace on the isp source pad
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
 <20200703171019.19270-7-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4b506cf2-7b9b-9a68-bb9a-834371a2fd09@xs4all.nl>
Date:   Tue, 21 Jul 2020 16:02:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200703171019.19270-7-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLkxuONgcNDQjurl1SV8h7wdyBBpZfM06tuE3d//kvZZZfuT+HnQkzjFAdpu7KzNRp3Y4UWv78QJIyuF0NjaSNVWAvQe92sIDO2tx4r2YcEDeHUAcMaD
 SZv2FNu4+edlnSSYuwG5deVcjvI72KV/3k37UgiwgvlxBoVPKMrHmYWaE3kf4u9HaM+M/tnjtgxm914kFlbFn3mYGYg9zv5yo6F+LdYMl3VIk73uKrFFrcbA
 oZRTdxzgts9qwaCi7wA9H0NUeOm8ntlF2ELcDeuUmYWW8ceOQrAirxzlB6oyH1CWARaPEVrKBUYn7kFekbIGXlVjD9T4mzFujInDTE84BdYVSEaTc7cQgYWz
 oLJhORcC0wyByWmLsJB0jxQHyEjWxLdF7YK9A7SMBXjEDeBwnfX7g87ImCgIksNC06OF1Dzbx6nXrtU0l4lmT7CHJ/vZR2Qy0WEKE2ksxL58KilhtltGV1T/
 dYYtR2VFqCLCRiH9YuvaEnxOSu3aJTm4KeZgMZzT33QBbdE6aC8sJ4FQnKbowPYBbQDBnXt9fmEPHt+DkwsOXiCZd/QikmEH0RGDbl0hJfJKCvT/2Oa3IGoF
 WSOAqQ1h1cmMltFeG2qtosJMe7RxuULatJBGAptA3r3Ro/OImf31eE9AaOmBDs1tpag=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/07/2020 19:10, Dafna Hirschfeld wrote:
> The isp entity has a hardware support to force full range quantization

s/a hardware support/hardware support/

> for YUV formats. Use the subdev CSC API to allow userspace to set the
> quantization for YUV formats on the isp entity.
> 
> - The flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION is set on

s/on/for/

> YUV formats during enumeration of the isp formats on the source pad.
> - The full quantization is set on YUV formats if userspace ask it

s/ask/asks for/

> on the isp entity using the flag V4L2_MBUS_FRAMEFMT_SET_CSC.
> 
> On the capture and the resizer, the quantization is read-only
> and always set to the default quantization.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/TODO             |  2 +-
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 10 ----------
>  drivers/staging/media/rkisp1/rkisp1-isp.c     | 18 ++++++++++++++----
>  3 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> index c0cbec0a164d..db05288949bd 100644
> --- a/drivers/staging/media/rkisp1/TODO
> +++ b/drivers/staging/media/rkisp1/TODO
> @@ -2,7 +2,7 @@
>  * Use threaded interrupt for rkisp1_stats_isr(), remove work queue.
>  * Fix checkpatch errors.
>  * Review and comment every lock
> -* Handle quantization
> +* Add uapi docs. Remeber to add documentation of how quantization is handled.
>  * Document rkisp1-common.h
>  * streaming paths (mainpath and selfpath) check if the other path is streaming
>  in several places of the code, review this, specially that it doesn't seem it
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index f69235f82c45..93d6846886f2 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -1085,8 +1085,6 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
>  			   const struct v4l2_format_info **fmt_info)
>  {
>  	const struct rkisp1_capture_config *config = cap->config;
> -	struct rkisp1_capture *other_cap =
> -			&cap->rkisp1->capture_devs[cap->id ^ 1];
>  	const struct rkisp1_capture_fmt_cfg *fmt;
>  	const struct v4l2_format_info *info;
>  	const unsigned int max_widths[] = { RKISP1_RSZ_MP_SRC_MAX_WIDTH,
> @@ -1111,14 +1109,6 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
>  
>  	info = rkisp1_fill_pixfmt(pixm, cap->id);
>  
> -	/* can not change quantization when stream-on */
> -	if (other_cap->is_streaming)
> -		pixm->quantization = other_cap->pix.fmt.quantization;
> -	/* output full range by default, take effect in params */
> -	else if (!pixm->quantization ||
> -		 pixm->quantization > V4L2_QUANTIZATION_LIM_RANGE)
> -		pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> -
>  	if (fmt_cfg)
>  		*fmt_cfg = fmt;
>  	if (fmt_info)
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index 58c90c67594d..d575c1e4dc4b 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -589,6 +589,10 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
>  
>  		if (code->index == pos - 1) {
>  			code->code = fmt->mbus_code;
> +			if (fmt->pixel_enc == V4L2_PIXEL_ENC_YUV &&
> +			    dir == RKISP1_ISP_SD_SRC)
> +				code->flags =
> +					V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
>  			return 0;
>  		}
>  	}
> @@ -620,7 +624,6 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
>  					     RKISP1_ISP_PAD_SOURCE_VIDEO);
>  	*src_fmt = *sink_fmt;
>  	src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
> -	src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>  
>  	src_crop = v4l2_subdev_get_try_crop(sd, cfg,
>  					    RKISP1_ISP_PAD_SOURCE_VIDEO);
> @@ -663,10 +666,17 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>  		isp->src_fmt = mbus_info;
>  	src_fmt->width  = src_crop->width;
>  	src_fmt->height = src_crop->height;
> -	src_fmt->quantization = format->quantization;
> -	/* full range by default */
> -	if (!src_fmt->quantization)
> +
> +	/*
> +	 * The CSC API is used to allow userspace to force full
> +	 * quantization on YUV formats.
> +	 */
> +	if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
> +	    format->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
> +	    mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
>  		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	else
> +		src_fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
>  
>  	*format = *src_fmt;
>  }
> 

Regards,

	Hans

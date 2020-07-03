Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC0F21402E
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 22:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgGCUAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 16:00:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47488 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgGCUAu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 16:00:50 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id E74C62A6648
Subject: Re: [PATCH v5 6/7] media: staging: rkisp1: allow quantization setting
 by userspace on the isp source pad
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
 <20200703171019.19270-7-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <a4d0a929-8e54-a72f-0940-1657987c8522@collabora.com>
Date:   Fri, 3 Jul 2020 17:00:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200703171019.19270-7-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for your patch.

On 7/3/20 2:10 PM, Dafna Hirschfeld wrote:
> The isp entity has a hardware support to force full range quantization
> for YUV formats. Use the subdev CSC API to allow userspace to set the
> quantization for YUV formats on the isp entity.
> 
> - The flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION is set on
> YUV formats during enumeration of the isp formats on the source pad.
> - The full quantization is set on YUV formats if userspace ask it
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

According to the docs [1]:

[1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/colorspaces-defs.html?highlight=quantization

"The default colorspace. This can be used by applications to let the driver fill in the colorspace."

So, in my understanding, the driver should never return V4L2_QUANTIZATION_DEFAULT to userspace.

We have the same issue in the resizer.

I also see an issue in the capture that allows userspace to change quantization, and this should be fixed.

In my understanding, since you are leaving all the other pads and video nodes with read-only quantization,
changing quantization in the ISP source pad should change the readings in all the other pads and video nodes.

So, if all pads are reporting V4L2_QUANTIZATION_LIM_RANGE (which is the default for sRGB colorspace), and userspace sets
V4L2_QUANTIZATION_FULL_RANGE to the isp source pad, then all the other pads and video nodes should also report
V4L2_QUANTIZATION_FULL_RANGE, since this will be the actual quantization used by the driver.

Regards,
Helen

>  
>  	*format = *src_fmt;
>  }
> 

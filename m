Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 599375B3856
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 14:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbiIIM5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 08:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiIIM5c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 08:57:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDED12E1A7;
        Fri,  9 Sep 2022 05:57:31 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4ED6CDD;
        Fri,  9 Sep 2022 14:57:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662728249;
        bh=0X6SKJNPk5OkpXfTo5ahOa/LoPG1eBmaBdFNGcsYX8I=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=u3W5DZIrhukR0NxgjK7oqPuPHGW48lZL123WC3TmxN1ZH8kVjgo2m2qUIwfzFu1GF
         x6cKFz5pMsNbHOPLQfp7zd/h46JleEhb+Xc0krE3K8ZDyUvh2TnIOwYghrLXKQq9Hi
         97DHvb//s/fagMtQWG3vfwfzHLEZ3DPoavX4KBUE=
Message-ID: <52b3d18c-9f17-7f73-0f32-a6008f1c4321@ideasonboard.com>
Date:   Fri, 9 Sep 2022 13:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
References: <20220908194750.3750310-1-m.grzeschik@pengutronix.de>
 <20220908194750.3750310-2-m.grzeschik@pengutronix.de>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v13 1/6] media: v4l: move helper functions for fractions
 from uvc to v4l2-common
In-Reply-To: <20220908194750.3750310-2-m.grzeschik@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael - thanks for the patch

On 08/09/2022 20:47, Michael Grzeschik wrote:
> The functions uvc_simplify_fraction and uvc_fraction_to_interval are
> generic helpers which are also useful for other v4l2 drivers. This patch
> moves them to v4l2-common.
>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>


This and #2 make sense to me, so for these two:


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Tested-by: Daniel Scally <dan.scally@ideasonboard.com>

>
> ---
> v1 -> v7: -
> v7 -> v8: - ported all style fixes and broken links from latest version on rebase
> v8 -> v13: -
>
>   drivers/media/usb/uvc/uvc_driver.c    | 84 --------------------------
>   drivers/media/usb/uvc/uvc_v4l2.c      | 14 ++---
>   drivers/media/usb/uvc/uvcvideo.h      |  3 -
>   drivers/media/v4l2-core/v4l2-common.c | 86 +++++++++++++++++++++++++++
>   include/media/v4l2-common.h           |  4 ++
>   5 files changed, 97 insertions(+), 94 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 9c05776f11d1f0..0f14dee4b6d794 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -329,90 +329,6 @@ static enum v4l2_ycbcr_encoding uvc_ycbcr_enc(const u8 matrix_coefficients)
>   	return V4L2_YCBCR_ENC_DEFAULT;  /* Reserved */
>   }
>   
> -/*
> - * Simplify a fraction using a simple continued fraction decomposition. The
> - * idea here is to convert fractions such as 333333/10000000 to 1/30 using
> - * 32 bit arithmetic only. The algorithm is not perfect and relies upon two
> - * arbitrary parameters to remove non-significative terms from the simple
> - * continued fraction decomposition. Using 8 and 333 for n_terms and threshold
> - * respectively seems to give nice results.
> - */
> -void uvc_simplify_fraction(u32 *numerator, u32 *denominator,
> -		unsigned int n_terms, unsigned int threshold)
> -{
> -	u32 *an;
> -	u32 x, y, r;
> -	unsigned int i, n;
> -
> -	an = kmalloc_array(n_terms, sizeof(*an), GFP_KERNEL);
> -	if (an == NULL)
> -		return;
> -
> -	/*
> -	 * Convert the fraction to a simple continued fraction. See
> -	 * https://en.wikipedia.org/wiki/Continued_fraction
> -	 * Stop if the current term is bigger than or equal to the given
> -	 * threshold.
> -	 */
> -	x = *numerator;
> -	y = *denominator;
> -
> -	for (n = 0; n < n_terms && y != 0; ++n) {
> -		an[n] = x / y;
> -		if (an[n] >= threshold) {
> -			if (n < 2)
> -				n++;
> -			break;
> -		}
> -
> -		r = x - an[n] * y;
> -		x = y;
> -		y = r;
> -	}
> -
> -	/* Expand the simple continued fraction back to an integer fraction. */
> -	x = 0;
> -	y = 1;
> -
> -	for (i = n; i > 0; --i) {
> -		r = y;
> -		y = an[i-1] * y + x;
> -		x = r;
> -	}
> -
> -	*numerator = y;
> -	*denominator = x;
> -	kfree(an);
> -}
> -
> -/*
> - * Convert a fraction to a frame interval in 100ns multiples. The idea here is
> - * to compute numerator / denominator * 10000000 using 32 bit fixed point
> - * arithmetic only.
> - */
> -u32 uvc_fraction_to_interval(u32 numerator, u32 denominator)
> -{
> -	u32 multiplier;
> -
> -	/* Saturate the result if the operation would overflow. */
> -	if (denominator == 0 ||
> -	    numerator/denominator >= ((u32)-1)/10000000)
> -		return (u32)-1;
> -
> -	/*
> -	 * Divide both the denominator and the multiplier by two until
> -	 * numerator * multiplier doesn't overflow. If anyone knows a better
> -	 * algorithm please let me know.
> -	 */
> -	multiplier = 10000000;
> -	while (numerator > ((u32)-1)/multiplier) {
> -		multiplier /= 2;
> -		denominator /= 2;
> -	}
> -
> -	return denominator ? numerator * multiplier / denominator : 0;
> -}
> -
>   /* ------------------------------------------------------------------------
>    * Terminal and unit management
>    */
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 4cc3fa6b8c9812..f4d4c33b6dfbd7 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -386,7 +386,7 @@ static int uvc_v4l2_get_streamparm(struct uvc_streaming *stream,
>   	mutex_unlock(&stream->mutex);
>   
>   	denominator = 10000000;
> -	uvc_simplify_fraction(&numerator, &denominator, 8, 333);
> +	v4l2_simplify_fraction(&numerator, &denominator, 8, 333);
>   
>   	memset(parm, 0, sizeof(*parm));
>   	parm->type = stream->type;
> @@ -427,7 +427,7 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
>   	else
>   		timeperframe = parm->parm.output.timeperframe;
>   
> -	interval = uvc_fraction_to_interval(timeperframe.numerator,
> +	interval = v4l2_fraction_to_interval(timeperframe.numerator,
>   		timeperframe.denominator);
>   	uvc_dbg(stream->dev, FORMAT, "Setting frame interval to %u/%u (%u)\n",
>   		timeperframe.numerator, timeperframe.denominator, interval);
> @@ -481,7 +481,7 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
>   	/* Return the actual frame period. */
>   	timeperframe.numerator = probe.dwFrameInterval;
>   	timeperframe.denominator = 10000000;
> -	uvc_simplify_fraction(&timeperframe.numerator,
> +	v4l2_simplify_fraction(&timeperframe.numerator,
>   		&timeperframe.denominator, 8, 333);
>   
>   	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> @@ -1275,7 +1275,7 @@ static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
>   		fival->discrete.numerator =
>   			frame->dwFrameInterval[index];
>   		fival->discrete.denominator = 10000000;
> -		uvc_simplify_fraction(&fival->discrete.numerator,
> +		v4l2_simplify_fraction(&fival->discrete.numerator,
>   			&fival->discrete.denominator, 8, 333);
>   	} else {
>   		fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
> @@ -1285,11 +1285,11 @@ static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
>   		fival->stepwise.max.denominator = 10000000;
>   		fival->stepwise.step.numerator = frame->dwFrameInterval[2];
>   		fival->stepwise.step.denominator = 10000000;
> -		uvc_simplify_fraction(&fival->stepwise.min.numerator,
> +		v4l2_simplify_fraction(&fival->stepwise.min.numerator,
>   			&fival->stepwise.min.denominator, 8, 333);
> -		uvc_simplify_fraction(&fival->stepwise.max.numerator,
> +		v4l2_simplify_fraction(&fival->stepwise.max.numerator,
>   			&fival->stepwise.max.denominator, 8, 333);
> -		uvc_simplify_fraction(&fival->stepwise.step.numerator,
> +		v4l2_simplify_fraction(&fival->stepwise.step.numerator,
>   			&fival->stepwise.step.denominator, 8, 333);
>   	}
>   
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 24c911aeebce56..ff710bdd38b3fd 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -911,9 +911,6 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>   		      struct uvc_xu_control_query *xqry);
>   
>   /* Utility functions */
> -void uvc_simplify_fraction(u32 *numerator, u32 *denominator,
> -			   unsigned int n_terms, unsigned int threshold);
> -u32 uvc_fraction_to_interval(u32 numerator, u32 denominator);
>   struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
>   					    u8 epaddr);
>   u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep);
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index e0fbe6ba4b6c49..40f56e044640d7 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -484,3 +484,89 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
>   	return freq > 0 ? freq : -EINVAL;
>   }
>   EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
> +
> +/*
> + * Simplify a fraction using a simple continued fraction decomposition. The
> + * idea here is to convert fractions such as 333333/10000000 to 1/30 using
> + * 32 bit arithmetic only. The algorithm is not perfect and relies upon two
> + * arbitrary parameters to remove non-significative terms from the simple
> + * continued fraction decomposition. Using 8 and 333 for n_terms and threshold
> + * respectively seems to give nice results.
> + */
> +void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
> +		unsigned int n_terms, unsigned int threshold)
> +{
> +	u32 *an;
> +	u32 x, y, r;
> +	unsigned int i, n;
> +
> +	an = kmalloc_array(n_terms, sizeof(*an), GFP_KERNEL);
> +	if (an == NULL)
> +		return;
> +
> +	/*
> +	 * Convert the fraction to a simple continued fraction. See
> +	 * https://en.wikipedia.org/wiki/Continued_fraction
> +	 * Stop if the current term is bigger than or equal to the given
> +	 * threshold.
> +	 */
> +	x = *numerator;
> +	y = *denominator;
> +
> +	for (n = 0; n < n_terms && y != 0; ++n) {
> +		an[n] = x / y;
> +		if (an[n] >= threshold) {
> +			if (n < 2)
> +				n++;
> +			break;
> +		}
> +
> +		r = x - an[n] * y;
> +		x = y;
> +		y = r;
> +	}
> +
> +	/* Expand the simple continued fraction back to an integer fraction. */
> +	x = 0;
> +	y = 1;
> +
> +	for (i = n; i > 0; --i) {
> +		r = y;
> +		y = an[i-1] * y + x;
> +		x = r;
> +	}
> +
> +	*numerator = y;
> +	*denominator = x;
> +	kfree(an);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_simplify_fraction);
> +
> +/*
> + * Convert a fraction to a frame interval in 100ns multiples. The idea here is
> + * to compute numerator / denominator * 10000000 using 32 bit fixed point
> + * arithmetic only.
> + */
> +u32 v4l2_fraction_to_interval(u32 numerator, u32 denominator)
> +{
> +	u32 multiplier;
> +
> +	/* Saturate the result if the operation would overflow. */
> +	if (denominator == 0 ||
> +	    numerator/denominator >= ((u32)-1)/10000000)
> +		return (u32)-1;
> +
> +	/*
> +	 * Divide both the denominator and the multiplier by two until
> +	 * numerator * multiplier doesn't overflow. If anyone knows a better
> +	 * algorithm please let me know.
> +	 */
> +	multiplier = 10000000;
> +	while (numerator > ((u32)-1)/multiplier) {
> +		multiplier /= 2;
> +		denominator /= 2;
> +	}
> +
> +	return denominator ? numerator * multiplier / denominator : 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_fraction_to_interval);
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index b708d63995f458..725ff91b26e063 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -540,6 +540,10 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>   s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
>   		       unsigned int div);
>   
> +void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
> +		unsigned int n_terms, unsigned int threshold);
> +u32 v4l2_fraction_to_interval(u32 numerator, u32 denominator);
> +
>   static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
>   {
>   	/*

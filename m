Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF14A3F4270
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 01:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbhHVXx1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 19:53:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59848 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbhHVXx1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 19:53:27 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F33A4A3;
        Mon, 23 Aug 2021 01:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629676364;
        bh=uTvF0Z+/xHcqsMHpeCVHC+kzKOuDEi7+FThzLimDamg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EsgQNR/qgCps43XEiZ1Vg+boH2QTwIRvCo/4s3nJAEx8FVRKQJs/8bn85PvB1kL65
         6n28+ozgVLi9Jt61jsqTnE6o5Auz1nHasOmK/25svDlx+96g9ZZJXbr8gKaaqv8UiJ
         2fBXWWJv/PWITeZB0jKWkaacih0+ZiM1yYikM8TA=
Date:   Mon, 23 Aug 2021 02:52:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, Hans Verkuil <hans.verkuil@cisco.com>
Subject: Re: [PATCH v10 18/21] uvcvideo: improve error handling in
 uvc_query_ctrl()
Message-ID: <YSLjQqzmR2ZqN6+p@pendragon.ideasonboard.com>
References: <20210618122923.385938-1-ribalda@chromium.org>
 <20210618122923.385938-19-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618122923.385938-19-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo and Hans,

Thank you for the patch.

Please add a "media: " prefix to the subject line. Same for the other
patches in the series that are missing this.

On Fri, Jun 18, 2021 at 02:29:20PM +0200, Ricardo Ribalda wrote:
> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> - If __uvc_query_ctrl() failed with a non-EPIPE error, then
>   report that with dev_err. If an error code is obtained, then
>   report that with dev_dbg.
> 
> - For error 2 (Wrong state) return -EACCES instead of -EILSEQ.
>   EACCES is a much more appropriate error code. EILSEQ will return
>   "Invalid or incomplete multibyte or wide character." in strerror(),
>   which is a *very* confusing message.

I would still have split the patch in two :-)

> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 38 ++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index daba5fe352ea..00488f15cdbf 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -79,15 +79,11 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	if (likely(ret == size))
>  		return 0;
>  
> -	dev_err(&dev->udev->dev,
> -		"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> -		uvc_query_name(query), cs, unit, ret, size);
> -
> -	if (ret != -EPIPE)
> -		return ret;
> +	if (ret < 0 && ret != -EPIPE)

What if ret >= 0 ? There's a change of behaviour here that isn't
documented in the commit message. It shouldn't happen, but it would be
nice to handle it correctly.

> +		goto err;
>  
> +	/* reuse data[0] to request the error code. */
>  	tmp = *(u8 *)data;
> -
>  	ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
>  			       UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
>  			       UVC_CTRL_CONTROL_TIMEOUT);
> @@ -95,19 +91,21 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	error = *(u8 *)data;
>  	*(u8 *)data = tmp;
>  
> -	if (ret != 1)
> -		return ret < 0 ? ret : -EPIPE;
> +	if (ret != 1) {
> +		ret = ret < 0 ? ret : -EPIPE;
> +		goto err;

This will print an error message that doesn't match the error.

> +	}
>  
> -	uvc_dbg(dev, CONTROL, "Control error %u\n", error);
> +	if (error >=1 && error <=8)

Missing space before 1 and 8.

> +		uvc_dbg(dev, CONTROL,
> +			"Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
> +			uvc_query_name(query), cs, unit, error);
>  
>  	switch (error) {
> -	case 0:
> -		/* Cannot happen - we received a STALL */
> -		return -EPIPE;
>  	case 1: /* Not ready */
>  		return -EBUSY;
>  	case 2: /* Wrong state */
> -		return -EILSEQ;
> +		return -EACCES;
>  	case 3: /* Power */
>  		return -EREMOTE;
>  	case 4: /* Out of range */
> @@ -123,10 +121,18 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	case 8: /* Invalid value within range */
>  		return -EINVAL;
>  	default: /* reserved or unknown */
> -		break;
> +		dev_err(&dev->udev->dev,
> +			"Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
> +			uvc_query_name(query), cs, unit, error);
> +		return -EPIPE;
>  	}
>  
> -	return -EPIPE;
> +err:
> +	dev_err(&dev->udev->dev,
> +		"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> +		uvc_query_name(query), cs, unit, ret, size);
> +
> +	return ret;
>  }
>  
>  static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,

-- 
Regards,

Laurent Pinchart

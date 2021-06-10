Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CD03A31D7
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 19:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhFJRQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 13:16:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48590 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbhFJRQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 13:16:18 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8EE78D4;
        Thu, 10 Jun 2021 19:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623345261;
        bh=W3SG8UnrOuR0iNr7YMC6xV0NHhWpG2qC0B18el8uGRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CWs4pucu7yHlt13WsWWDMESpaBZ19pWRiJViN5CTYioV6Vd2b3vucesFsxQyScg39
         dhQnGZNEVeIJ97MQCJWfeq2ue5YQ1lE8JTnke1B6AwLK9EXU76wCxmVKDS1GYcPd+M
         s7KkN5GmI10Pd+7CpCwlFgeF+F/K6x7NDeCy3Kw4=
Date:   Thu, 10 Jun 2021 20:14:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, Hans Verkuil <hans.verkuil@cisco.com>
Subject: Re: [PATCH v9 20/22] uvcvideo: improve error handling in
 uvc_query_ctrl()
Message-ID: <YMJIWtvp2AkaRw8T@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-21-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326095840.364424-21-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo and Hans,

Thank you for the patch.

On Fri, Mar 26, 2021 at 10:58:38AM +0100, Ricardo Ribalda wrote:
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

I would have split the commit in two.

> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
> 
> I have changed a bit the patch from the original version.
> 
> drivers/media/usb/uvc/uvc_video.c | 38 +++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index b63c073ec30e..1c3a94d91724 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -76,35 +76,31 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	if (likely(ret == size))
>  		return 0;
>  
> -	dev_dbg(&dev->udev->dev,
> -		"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> -		uvc_query_name(query), cs, unit, ret, size);
> -
> -	if (ret != -EPIPE)
> -		return ret;
> +	if (ret < 0 && ret != -EPIPE)
> +		goto err;
>  
> +	// reuse data[0] for request the error code.

C-style comments please.

s/for request/to request/

>  	tmp = *(u8 *)data;
> -
>  	ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
>  			       UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
>  			       UVC_CTRL_CONTROL_TIMEOUT);
> -

No need to drop the blank lines.

>  	error = *(u8 *)data;
>  	*(u8 *)data = tmp;
>  
> -	if (ret != 1)
> -		return ret < 0 ? ret : -EPIPE;
> +	if (ret != 1) {
> +		ret = ret < 0 ? ret : -EPIPE;
> +		goto err;
> +	}
>  
> -	uvc_dbg(dev, CONTROL, "Control error %u\n", error);
> +	dev_dbg(&dev->udev->dev,

Why not uvc_dbg ?

> +		"Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
> +		uvc_query_name(query), cs, unit, error);
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
> @@ -120,10 +116,18 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	case 8: /* Invalid value within range */
>  		return -EINVAL;
>  	default: /* reserved or unknown */
> -		break;
> +		dev_err(&dev->udev->dev,
> +			"Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
> +			uvc_query_name(query), cs, unit, error);

when debugging is enabled, this will print the error message a second
time, it's not very nice.

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

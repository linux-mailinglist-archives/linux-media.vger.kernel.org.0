Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0A62E0709
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 09:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgLVIFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 03:05:22 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42222 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgLVIFW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 03:05:22 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A1C39E6;
        Tue, 22 Dec 2020 09:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608624280;
        bh=u9ey3spq/ryytAsWdO8BpNmB77m31wxs7DKBWTLcGQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JdIQv2IWvf2m95HlOkHlJ/foyoJOE9gi/4EPlVO/WR/oQzBFvl8wW1pIMUgCfPBcb
         o27gwQ4KxLtb5uLFtLrPR9faCTPueGPKq1zxsWFy+lvwaCTlGDJCqOjXONDVTHSJrh
         +nOG5IyoCVT187jWQErVMoVVZwteOCeLpLshZQs8=
Date:   Tue, 22 Dec 2020 10:04:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/12] media: uvcvideo: Fix race condition handling
 events
Message-ID: <X+GokHQbUHcquCnm@pendragon.ideasonboard.com>
References: <20201221164819.792019-1-ribalda@chromium.org>
 <20201221164819.792019-2-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201221164819.792019-2-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Mon, Dec 21, 2020 at 05:48:08PM +0100, Ricardo Ribalda wrote:
> The control and its data needs to be copied to the workqueue at the same
> time to avoid half-updates of the events.
> This is, events reported to userspace were the control id does not match
> its value.

Actually, after discussing this with you on IRC, I'm not sure there's a
problem. The URB is resubmitted by uvc_ctrl_status_event_work(), so the
data shouldn't be overwritten before it is processed.

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
>  drivers/media/usb/uvc/uvcvideo.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 011e69427b7c..aa18dcdf8165 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1332,7 +1332,7 @@ bool uvc_ctrl_status_event(struct urb *urb, struct uvc_video_chain *chain,
>  		return false;
>  	}
>  
> -	w->data = data;
> +	memcpy(w->data, data, ctrl->info.size);
>  	w->urb = urb;
>  	w->chain = chain;
>  	w->ctrl = ctrl;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index a3dfacf069c4..0db6c2e0bd98 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -678,7 +678,7 @@ struct uvc_device {
>  		struct urb *urb;
>  		struct uvc_video_chain *chain;
>  		struct uvc_control *ctrl;
> -		const void *data;
> +		u8 data[UVC_MAX_STATUS_SIZE];
>  	} async_ctrl;
>  };
>  

-- 
Regards,

Laurent Pinchart

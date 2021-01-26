Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579F73042C6
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 16:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391055AbhAZPlq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 10:41:46 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54070 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392006AbhAZPkD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 10:40:03 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 597A62C1;
        Tue, 26 Jan 2021 16:39:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611675558;
        bh=Pby13UJp8gKyOcj8Zok5aTPgmkef0wuX4nO2OfrKUYk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JVeM4bcqDjxxdAD+nQ13zTsSWvUJ5ZJDWt9bb9F63f/ZwuYA8k3X+nt59FAEb3i54
         Ha7mANWTihATYJPSa31itWIUCByNh59ib248T8h9iLaadibpHUc1d9oNw16gHQrDKn
         cecKKPgkz5aSA4fj3bylfWvgGWb63ZgCTNQxLX7Y=
Date:   Tue, 26 Jan 2021 17:38:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 04/12] media: uvcvideo: Provide sync and async
 uvc_ctrl_status_event
Message-ID: <YBA3krpfIfIB2vYc@pendragon.ideasonboard.com>
References: <20201223133528.55014-1-ribalda@chromium.org>
 <20201223133528.55014-5-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201223133528.55014-5-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Wed, Dec 23, 2020 at 02:35:20PM +0100, Ricardo Ribalda wrote:
> Split the functionality of void uvc_ctrl_status_event_work in two, so it
> can be called by functions outside interrupt context and not part of an
> URB.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 25 +++++++++++++++----------
>  drivers/media/usb/uvc/uvc_status.c |  3 ++-
>  drivers/media/usb/uvc/uvcvideo.h   |  4 +++-
>  3 files changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 9f6174a10e73..4d43f4c3e349 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1254,17 +1254,12 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>  	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
>  }
>  
> -static void uvc_ctrl_status_event_work(struct work_struct *work)
> +void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> +			   struct uvc_control *ctrl, const u8 *data)
>  {
> -	struct uvc_device *dev = container_of(work, struct uvc_device,
> -					      async_ctrl.work);
> -	struct uvc_ctrl_work *w = &dev->async_ctrl;
> -	struct uvc_video_chain *chain = w->chain;
>  	struct uvc_control_mapping *mapping;
> -	struct uvc_control *ctrl = w->ctrl;
>  	struct uvc_fh *handle;
>  	unsigned int i;
> -	int ret;
>  
>  	mutex_lock(&chain->ctrl_mutex);
>  
> @@ -1272,7 +1267,7 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
>  	ctrl->handle = NULL;
>  
>  	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> -		s32 value = __uvc_ctrl_get_value(mapping, w->data);
> +		s32 value = __uvc_ctrl_get_value(mapping, data);
>  
>  		/*
>  		 * handle may be NULL here if the device sends auto-update
> @@ -1291,6 +1286,16 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
>  	}
>  
>  	mutex_unlock(&chain->ctrl_mutex);
> +}
> +
> +static void uvc_ctrl_status_event_work(struct work_struct *work)
> +{
> +	struct uvc_device *dev = container_of(work, struct uvc_device,
> +					      async_ctrl.work);
> +	struct uvc_ctrl_work *w = &dev->async_ctrl;
> +	int ret;
> +
> +	uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
>  
>  	/* Resubmit the URB. */
>  	w->urb->interval = dev->int_ep->desc.bInterval;
> @@ -1300,8 +1305,8 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
>  			   ret);
>  }
>  
> -bool uvc_ctrl_status_event(struct urb *urb, struct uvc_video_chain *chain,
> -			   struct uvc_control *ctrl, const u8 *data)
> +bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
> +				 struct uvc_control *ctrl, const u8 *data)
>  {
>  	struct uvc_device *dev = chain->dev;
>  	struct uvc_ctrl_work *w = &dev->async_ctrl;
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 2bdb0ff203f8..3e26d82a906d 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -179,7 +179,8 @@ static bool uvc_event_control(struct urb *urb,
>  
>  	switch (status->bAttribute) {
>  	case UVC_CTRL_VALUE_CHANGE:
> -		return uvc_ctrl_status_event(urb, chain, ctrl, status->bValue);
> +		return uvc_ctrl_status_event_async(urb, chain, ctrl,
> +						   status->bValue);
>  
>  	case UVC_CTRL_INFO_CHANGE:
>  	case UVC_CTRL_FAILURE_CHANGE:
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index c50b0546901f..be784ed8354d 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -843,7 +843,9 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  int uvc_ctrl_init_device(struct uvc_device *dev);
>  void uvc_ctrl_cleanup_device(struct uvc_device *dev);
>  int uvc_ctrl_restore_values(struct uvc_device *dev);
> -bool uvc_ctrl_status_event(struct urb *urb, struct uvc_video_chain *chain,
> +bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
> +				 struct uvc_control *ctrl, const u8 *data);
> +void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>  			   struct uvc_control *ctrl, const u8 *data);
>  
>  int uvc_ctrl_begin(struct uvc_video_chain *chain);

-- 
Regards,

Laurent Pinchart

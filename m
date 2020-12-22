Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6442E070E
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 09:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgLVIIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 03:08:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgLVIIo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 03:08:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A7DC0613D6;
        Tue, 22 Dec 2020 00:08:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 898E89E6;
        Tue, 22 Dec 2020 09:08:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608624482;
        bh=tEFcEohsPVRb33DDASy/wcqKa3yFs9oS5ip/v2qdvbg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j4kMffjSwMclhoHzTN2gfCEx1rmVijJLXUNsdvD4Bt6rJv7lyOfoxNCKF3LwloWGo
         bKZ7dgDsYJec7a5dLBuzhWgCl+E/nTJCzYKweuj8e7M5sMCSPs+66EYwZYU5lpCZlZ
         L0RkXkvnLPsIi+hrI0zR4N9mv/HaDNHQWJh8tIrs=
Date:   Tue, 22 Dec 2020 10:07:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/12] media: uvcvideo: Allow more that one asyc_ctrl
Message-ID: <X+GpW1cN1IQ+AOwp@pendragon.ideasonboard.com>
References: <20201221164819.792019-1-ribalda@chromium.org>
 <20201221164819.792019-3-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201221164819.792019-3-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Mon, Dec 21, 2020 at 05:48:09PM +0100, Ricardo Ribalda wrote:
> The current implementation allocates memory for only one async_control.
> If we get a second event before we have processed the previous one, the
> old one gets lost.
> 
> Introduce a dynamic memory allocation and a list to handle the
> async_controls.

Thinking some more about this, do we need to go through the work queue
at all for GPIO-based events ? Could the part of
uvc_ctrl_status_event_work() before the URB resubmission be moved to
another function, which would be called directly by the GPIO threaded
IRQ handler ?

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 49 ++++++++++++++++++++++++++------
>  drivers/media/usb/uvc/uvcvideo.h | 19 ++++++++-----
>  2 files changed, 52 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index aa18dcdf8165..69b2fc6ce12c 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1275,11 +1275,9 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>  	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
>  }
>  
> -static void uvc_ctrl_status_event_work(struct work_struct *work)
> +static void __uvc_ctrl_status_event_work(struct uvc_device *dev,
> +					 struct uvc_ctrl_work *w)
>  {
> -	struct uvc_device *dev = container_of(work, struct uvc_device,
> -					      async_ctrl.work);
> -	struct uvc_ctrl_work *w = &dev->async_ctrl;
>  	struct uvc_video_chain *chain = w->chain;
>  	struct uvc_control_mapping *mapping;
>  	struct uvc_control *ctrl = w->ctrl;
> @@ -1321,23 +1319,54 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
>  			   ret);
>  }
>  
> +static void uvc_ctrl_status_event_work(struct work_struct *work)
> +{
> +	struct uvc_device *dev = container_of(work, struct uvc_device,
> +					      async_ctrl_work);
> +	struct uvc_ctrl_work *w;
> +
> +	do {
> +		mutex_lock(&dev->async_ctrl_lock);
> +		w = list_first_entry_or_null(&dev->async_ctrl_list,
> +					     struct uvc_ctrl_work,
> +					     list);
> +		if (w)
> +			list_del(&w->list);
> +		mutex_unlock(&dev->async_ctrl_lock);
> +
> +		if (!w)
> +			return;
> +
> +		__uvc_ctrl_status_event_work(dev, w);
> +		kfree(w);
> +	} while (w);
> +}
> +
>  bool uvc_ctrl_status_event(struct urb *urb, struct uvc_video_chain *chain,
>  			   struct uvc_control *ctrl, const u8 *data)
>  {
>  	struct uvc_device *dev = chain->dev;
> -	struct uvc_ctrl_work *w = &dev->async_ctrl;
> +	struct uvc_ctrl_work *w;
>  
>  	if (list_empty(&ctrl->info.mappings)) {
>  		ctrl->handle = NULL;
>  		return false;
>  	}
>  
> +	w = kzalloc(sizeof(*w), GFP_KERNEL);
> +	if (WARN(!w, "Not enough memory to trigger uvc event"))
> +		return false;
> +
>  	memcpy(w->data, data, ctrl->info.size);
>  	w->urb = urb;
>  	w->chain = chain;
>  	w->ctrl = ctrl;
>  
> -	schedule_work(&w->work);
> +	mutex_lock(&dev->async_ctrl_lock);
> +	list_add_tail(&w->list, &dev->async_ctrl_list);
> +	mutex_unlock(&dev->async_ctrl_lock);
> +
> +	schedule_work(&dev->async_ctrl_work);
>  
>  	return true;
>  }
> @@ -2277,7 +2306,9 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  	struct uvc_entity *entity;
>  	unsigned int i;
>  
> -	INIT_WORK(&dev->async_ctrl.work, uvc_ctrl_status_event_work);
> +	INIT_WORK(&dev->async_ctrl_work, uvc_ctrl_status_event_work);
> +	mutex_init(&dev->async_ctrl_lock);
> +	INIT_LIST_HEAD(&dev->async_ctrl_list);
>  
>  	/* Walk the entities list and instantiate controls */
>  	list_for_each_entry(entity, &dev->entities, list) {
> @@ -2348,8 +2379,8 @@ void uvc_ctrl_cleanup_device(struct uvc_device *dev)
>  	unsigned int i;
>  
>  	/* Can be uninitialized if we are aborting on probe error. */
> -	if (dev->async_ctrl.work.func)
> -		cancel_work_sync(&dev->async_ctrl.work);
> +	if (dev->async_ctrl_work.func)
> +		cancel_work_sync(&dev->async_ctrl_work);
>  
>  	/* Free controls and control mappings for all entities. */
>  	list_for_each_entry(entity, &dev->entities, list) {
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 0db6c2e0bd98..afcaf49fad1a 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -637,6 +637,14 @@ struct uvc_device_info {
>  	u32	meta_format;
>  };
>  
> +struct uvc_ctrl_work {
> +	struct list_head list;
> +	struct urb *urb;
> +	struct uvc_video_chain *chain;
> +	struct uvc_control *ctrl;
> +	u8 data[UVC_MAX_STATUS_SIZE];
> +};
> +
>  struct uvc_device {
>  	struct usb_device *udev;
>  	struct usb_interface *intf;
> @@ -673,13 +681,10 @@ struct uvc_device {
>  	struct input_dev *input;
>  	char input_phys[64];
>  
> -	struct uvc_ctrl_work {
> -		struct work_struct work;
> -		struct urb *urb;
> -		struct uvc_video_chain *chain;
> -		struct uvc_control *ctrl;
> -		u8 data[UVC_MAX_STATUS_SIZE];
> -	} async_ctrl;
> +	/* Async control */
> +	struct work_struct async_ctrl_work;
> +	struct list_head async_ctrl_list;
> +	struct mutex async_ctrl_lock;
>  };
>  
>  enum uvc_handle_state {

-- 
Regards,

Laurent Pinchart

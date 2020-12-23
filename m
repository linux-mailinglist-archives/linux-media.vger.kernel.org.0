Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23AFD2E1A2E
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 09:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgLWIyF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 03:54:05 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51614 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbgLWIyF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 03:54:05 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4577AA32;
        Wed, 23 Dec 2020 09:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608713602;
        bh=5GX1JyWecfHUWLK8aJoyu/c1Nfv3NybhlapwK2TIvfg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vpK417Fq/kdfUVcjxPTtpHUBXkxREiKupacdBYQhgg/YxZXu3QTY1iF7qIuCeU4ID
         Mz0tjpvl2BMMqDr39rADhH6rbLiETlLPSmmt7JxyMornJ/TZdNjpP76z++EDz/UHx+
         rCW/zB7niGjKBlve9Z6jpVnqSE7Tk5gksbR7fUi0=
Date:   Wed, 23 Dec 2020 10:53:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/11] media: uvcvideo: Add
 uvc_ctrl_status_event_direct
Message-ID: <X+MFevKFqk+ESlzo@pendragon.ideasonboard.com>
References: <20201222230446.1027916-1-ribalda@chromium.org>
 <20201222230446.1027916-5-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201222230446.1027916-5-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Wed, Dec 23, 2020 at 12:04:39AM +0100, Ricardo Ribalda wrote:
> Provide a code path for events that can be sent without a work-queue,
> this is, that do not belong to an URB and are not handled in the top
> half on an irq-handled.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 35 +++++++++++++++++++++++++++-----
>  drivers/media/usb/uvc/uvcvideo.h |  2 ++
>  2 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 9f6174a10e73..5fe228a3213b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1254,17 +1254,14 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>  	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
>  }
>  
> -static void uvc_ctrl_status_event_work(struct work_struct *work)
> +static void __uvc_ctrl_status_event(struct uvc_device *dev,
> +				    struct uvc_ctrl_work *w)

As this function doesn't deal with the work queue, should it receive the
members of uvc_ctrl_work as direct arguments ? You could then drop the
separate uvc_ctrl_status_event_direct(), or rather rename this function
to uvc_ctrl_status_event_direct().

Speaking of names, maybe uvc_ctrl_status_event() should be renamed to
uvc_ctrl_status_event_async(), and this function become
uvc_ctrl_status_event() ?

>  {
> -	struct uvc_device *dev = container_of(work, struct uvc_device,
> -					      async_ctrl.work);
> -	struct uvc_ctrl_work *w = &dev->async_ctrl;
>  	struct uvc_video_chain *chain = w->chain;
>  	struct uvc_control_mapping *mapping;
>  	struct uvc_control *ctrl = w->ctrl;
>  	struct uvc_fh *handle;
>  	unsigned int i;
> -	int ret;
>  
>  	mutex_lock(&chain->ctrl_mutex);
>  
> @@ -1291,6 +1288,16 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
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
> +	__uvc_ctrl_status_event(dev, w);
>  
>  	/* Resubmit the URB. */
>  	w->urb->interval = dev->int_ep->desc.bInterval;
> @@ -1321,6 +1328,24 @@ bool uvc_ctrl_status_event(struct urb *urb, struct uvc_video_chain *chain,
>  	return true;
>  }
>  
> +void uvc_ctrl_status_event_direct(struct uvc_video_chain *chain,
> +				  struct uvc_control *ctrl, const u8 *data)
> +{
> +	struct uvc_device *dev = chain->dev;
> +	struct uvc_ctrl_work w;
> +
> +	if (list_empty(&ctrl->info.mappings)) {
> +		ctrl->handle = NULL;
> +		return;
> +	}
> +
> +	w.data = data;
> +	w.chain = chain;
> +	w.ctrl = ctrl;
> +
> +	__uvc_ctrl_status_event(dev, &w);
> +}
> +
>  static bool uvc_ctrl_xctrls_has_control(const struct v4l2_ext_control *xctrls,
>  					unsigned int xctrls_count, u32 id)
>  {
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index c50b0546901f..d7954dcc2b60 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -845,6 +845,8 @@ void uvc_ctrl_cleanup_device(struct uvc_device *dev);
>  int uvc_ctrl_restore_values(struct uvc_device *dev);
>  bool uvc_ctrl_status_event(struct urb *urb, struct uvc_video_chain *chain,
>  			   struct uvc_control *ctrl, const u8 *data);
> +void uvc_ctrl_status_event_direct(struct uvc_video_chain *chain,
> +				  struct uvc_control *ctrl, const u8 *data);
>  
>  int uvc_ctrl_begin(struct uvc_video_chain *chain);
>  int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-media+bounces-22144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 183129DA4D7
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 10:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43D78B24A76
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC18F193078;
	Wed, 27 Nov 2024 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KUDWk99C"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9970013A888;
	Wed, 27 Nov 2024 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732700122; cv=none; b=ikrbu4lG+EoLwzs+4mJv/l7GKuwdshFudaXxgwjjh0fn96cN5XT084u1uaztiThOD4TDEpWC2QDOo6mFImTrGLD+xaJCQzTCCow/BJQp0Pt8IMQCOwHJReMDlIX6X6NmjxY6PfDW90/Xp+ZdWzy1kPNMLBhRDJt8jwWEDd9qlPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732700122; c=relaxed/simple;
	bh=VFZMQLehpl4nifxrEQOK0EN4tQXrQ2OOnZNzZLoYbDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYUuxWHWMnajaPL2e6i8Nqo3DVFAfkdm0WGoffa2qI1l2ik7Azk2oQyvZPczc4HnVa9zNnjIno2oi1NZ3QzeivYDz0fAR1sdKzVvSW9vcRUt3ejhXAtljUIyAazJyPiOHCyRd/rrrNX5I62ikYBPYFloFqrKvhjFFZDMbAigCkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KUDWk99C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97E09792;
	Wed, 27 Nov 2024 10:34:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732700094;
	bh=VFZMQLehpl4nifxrEQOK0EN4tQXrQ2OOnZNzZLoYbDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KUDWk99CcHIRgvA2s18iSbbcWTmcKIS2l3UrEqTTVyl4QF5LvgDOwTZXByLHu26A1
	 6pMWH7hW0TRIEgP4QHMmQvhhpIncVF6K5i0BkqL0kndGfrO/SwYIpBZoggtna4XGK3
	 lt0Ebyq+qyj6swBDZOtmiAYwzC++FlXDMwiuRung=
Date: Wed, 27 Nov 2024 11:35:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: Remove dangling pointers
Message-ID: <20241127093506.GE31095@pendragon.ideasonboard.com>
References: <20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org>
 <20241127-uvc-fix-async-v1-2-eb8722531b8c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241127-uvc-fix-async-v1-2-eb8722531b8c@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Wed, Nov 27, 2024 at 07:46:11AM +0000, Ricardo Ribalda wrote:
> When an async control is written, we copy a pointer to the file handle
> that started the operation. That pointer will be used when the device is
> done. Which could be anytime in the future.
> 
> If the user closes that file descriptor, its structure will be freed,
> and there will be one dangling pointer per pending async control, that
> the driver will try to use.
> 
> Clean all the dangling pointers during release().
> 
> To avoid adding a performance penalty in the most common case (no async
> operation). A counter has been introduced with some logic to make sure
> that it is properly handled.
> 
> Cc: stable@vger.kernel.org
> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 40 ++++++++++++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
>  drivers/media/usb/uvc/uvcvideo.h |  3 +++
>  3 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 5d3a28edf7f0..51a53ad25e9c 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1589,7 +1589,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>  	mutex_lock(&chain->ctrl_mutex);
>  
>  	handle = ctrl->handle;
> -	ctrl->handle = NULL;
> +	if (handle) {
> +		ctrl->handle = NULL;
> +		WARN_ON(!handle->pending_async_ctrls);
> +		if (handle->pending_async_ctrls)
> +			handle->pending_async_ctrls--;
> +	}

There's at least one other location where ctrl->handle is reset to NULL.

>  
>  	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
>  		s32 value = __uvc_ctrl_get_value(mapping, data);
> @@ -2050,8 +2055,11 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  	mapping->set(mapping, value,
>  		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>  
> -	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> +	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS) {
> +		if (!ctrl->handle)
> +			handle->pending_async_ctrls++;
>  		ctrl->handle = handle;

Is this protected by ctrl_mutex ?

Please be careful about locking and race conditions, taking the time to
double check will help getting your patches merged faster.

> +	}
>  
>  	ctrl->dirty = 1;
>  	ctrl->modified = 1;
> @@ -2774,6 +2782,34 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  	return 0;
>  }
>  
> +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> +{
> +	struct uvc_entity *entity;
> +
> +	guard(mutex)(&handle->chain->ctrl_mutex);
> +
> +	if (!handle->pending_async_ctrls)
> +		return;
> +
> +	list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> +		int i;

unsigned int

I wonder if these days you could event write

		for (unsigned int i = 0; i < entity->ncontrols; ++i) {

> +
> +		for (i = 0; i < entity->ncontrols; ++i) {
> +			struct uvc_control *ctrl = &entity->controls[i];
> +
> +			if (!ctrl->handle || ctrl->handle != handle)

Given that handle can't be null, you can write

			if (ctrl->handle != handle)

> +				continue;
> +
> +			ctrl->handle = NULL;
> +			if (WARN_ON(!handle->pending_async_ctrls))
> +				continue;

Is this needed ? If we find more controls for this handle than
pending_async_ctrls, decrementing it below 0 will case the WARN_ON() at
the end of this function to trigger, isn't that enough ?

> +			handle->pending_async_ctrls--;
> +		}
> +	}
> +
> +	WARN_ON(handle->pending_async_ctrls);
> +}
> +
>  /*
>   * Cleanup device controls.
>   */
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 97c5407f6603..b425306a3b8c 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -652,6 +652,8 @@ static int uvc_v4l2_release(struct file *file)
>  
>  	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>  
> +	uvc_ctrl_cleanup_fh(handle);
> +
>  	/* Only free resources if this is a privileged handle. */
>  	if (uvc_has_privileges(handle))
>  		uvc_queue_release(&stream->queue);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 07f9921d83f2..2f8a9c48e32a 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -612,6 +612,7 @@ struct uvc_fh {
>  	struct uvc_video_chain *chain;
>  	struct uvc_streaming *stream;
>  	enum uvc_handle_state state;
> +	unsigned int pending_async_ctrls; /* Protected by ctrl_mutex. */

The kernel does it the other way around, it lists in the documentation
of the lock what data it protects.

>  };
>  
>  struct uvc_driver {
> @@ -797,6 +798,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  		      struct uvc_xu_control_query *xqry);
>  
> +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> +
>  /* Utility functions */
>  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
>  					    u8 epaddr);

-- 
Regards,

Laurent Pinchart


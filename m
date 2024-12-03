Return-Path: <linux-media+bounces-22563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E4A9E2E90
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 23:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1E5DB3679D
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 20:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23A61E0DAF;
	Tue,  3 Dec 2024 20:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gTLWXnnR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BD21DB34E;
	Tue,  3 Dec 2024 20:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733258174; cv=none; b=WJEICjFaSumciJuHLNysgZPDScIS9afielHPTvbaBZOXhC1LsB2mCVVR3mltBA1X9zPBQnS3w327dgrfgeoULBQYfdk8AHLQJQWv18KF55ehTwHITISY89mbvzvvFQb2onLSEkGAZ8/a87za5CXb4ZVPQdGznDI1k84aJLbtOb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733258174; c=relaxed/simple;
	bh=4Waxk1OrNO6GTFs5DQaMfzgQ3SOLEn10SlKSkxh4Wqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1ouv4HwwpJiNwBBtTMd1dxxxwIj/DgSQWnAJkxIoqIaxteAGiktmQDEk5IwNT7uat2411Tla86cs0q7x1/4zHxhbU7U+Ojhb28TCQrMx6T15ZqlFfKZE+J1PhpyPdv1qVWr9tlVBE8WXmZgryi41Rwv50KAWEOZVaxrV2nLYPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gTLWXnnR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64865670;
	Tue,  3 Dec 2024 21:35:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733258141;
	bh=4Waxk1OrNO6GTFs5DQaMfzgQ3SOLEn10SlKSkxh4Wqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTLWXnnRHlD/aULJBcJfMgCX1Aiwui4OhNloCG5ZGnfFARmqFxHR5mzxT6hbVfzpH
	 EYHQ7g3jUTm3SBXv6E2+ToDBIuzzix6Tgx8XzJ+PfyrXFc0rmGvwc+6PR5VdxyWliP
	 Ybne+jhjC04jfD25h2XPbWrp4bBXafcWw6U5wv40=
Date: Tue, 3 Dec 2024 22:35:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 2/5] media: uvcvideo: Remove dangling pointers
Message-ID: <20241203203557.GC5196@pendragon.ideasonboard.com>
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
 <20241202-uvc-fix-async-v5-2-6658c1fe312b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202-uvc-fix-async-v5-2-6658c1fe312b@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Dec 02, 2024 at 02:24:36PM +0000, Ricardo Ribalda wrote:
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
> operation), a counter has been introduced with some logic to make sure
> that it is properly handled.
> 
> Cc: stable@vger.kernel.org
> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 52 ++++++++++++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
>  drivers/media/usb/uvc/uvcvideo.h |  9 ++++++-
>  3 files changed, 60 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 9a80a7d8e73a..af1e38f5c6e9 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1579,6 +1579,37 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>  	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
>  }
>  
> +static void uvc_ctrl_get_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
> +{
> +	lockdep_assert_held(&handle->chain->ctrl_mutex);
> +
> +	if (ctrl->handle)
> +		dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> +				     "UVC non compliance: Setting an async control with a pending operation.");
> +
> +	if (handle == ctrl->handle)
> +		return;
> +
> +	if (ctrl->handle)
> +		ctrl->handle->pending_async_ctrls--;
> +
> +	ctrl->handle = handle;
> +	handle->pending_async_ctrls++;
> +}
> +
> +static void uvc_ctrl_put_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
> +{
> +	lockdep_assert_held(&handle->chain->ctrl_mutex);
> +
> +	if (ctrl->handle != handle) /* Nothing to do here.*/
> +		return;
> +
> +	ctrl->handle = NULL;
> +	if (WARN_ON(!handle->pending_async_ctrls))
> +		return;
> +	handle->pending_async_ctrls--;
> +}

get/put have strong connotations in the kernel, related to acquiring a
reference to a given object, and releasing it. The usage here is
different, and I think it makes the usage below confusing. I prefer the
original single function.

> +
>  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>  			   struct uvc_control *ctrl, const u8 *data)
>  {
> @@ -1589,7 +1620,8 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>  	mutex_lock(&chain->ctrl_mutex);
>  
>  	handle = ctrl->handle;
> -	ctrl->handle = NULL;
> +	if (handle)
> +		uvc_ctrl_put_handle(handle, ctrl);
>  
>  	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
>  		s32 value = __uvc_ctrl_get_value(mapping, data);
> @@ -1865,7 +1897,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  
>  		if (!rollback && handle &&
>  		    ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> -			ctrl->handle = handle;
> +			uvc_ctrl_get_handle(handle, ctrl);
>  	}
>  
>  	return 0;
> @@ -2774,6 +2806,22 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
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
> +	list_for_each_entry(entity, &handle->chain->dev->entities, list)

	list_for_each_entry(entity, &handle->chain->dev->entities, list) {

> +		for (unsigned int i = 0; i < entity->ncontrols; ++i)
> +			uvc_ctrl_put_handle(handle, &entity->controls[i]);

	}

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
> index 07f9921d83f2..92ecdd188587 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -337,7 +337,11 @@ struct uvc_video_chain {
>  	struct uvc_entity *processing;		/* Processing unit */
>  	struct uvc_entity *selector;		/* Selector unit */
>  
> -	struct mutex ctrl_mutex;		/* Protects ctrl.info */
> +	struct mutex ctrl_mutex;		/*
> +						 * Protects ctrl.info,
> +						 * ctrl.handle and
> +						 * uvc_fh.pending_async_ctrls
> +						 */
>  
>  	struct v4l2_prio_state prio;		/* V4L2 priority state */
>  	u32 caps;				/* V4L2 chain-wide caps */
> @@ -612,6 +616,7 @@ struct uvc_fh {
>  	struct uvc_video_chain *chain;
>  	struct uvc_streaming *stream;
>  	enum uvc_handle_state state;
> +	unsigned int pending_async_ctrls;
>  };
>  
>  struct uvc_driver {
> @@ -797,6 +802,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  		      struct uvc_xu_control_query *xqry);
>  
> +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> +
>  /* Utility functions */
>  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
>  					    u8 epaddr);
> 

-- 
Regards,

Laurent Pinchart


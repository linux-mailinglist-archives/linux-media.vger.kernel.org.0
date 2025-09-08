Return-Path: <linux-media+bounces-41970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E09B4881E
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 11:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2893216D083
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 09:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D3D2EE61D;
	Mon,  8 Sep 2025 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mpgqrifp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C851E1E19;
	Mon,  8 Sep 2025 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757323123; cv=none; b=Ozcs8CPsw0ADwbDTRkSiooOaXo30jC2QgG9WiV8hM7Rlec3JEvq/atf71rvA0Lu4LVDj8xzQ3RXxvGggjimDof9Z5XIVUY5F8814RH/3LGC1fedXfQV2Y1Tb12oPb431Tt/3onItdz+EjTz8e1koaDNFz1RgX4pf1Q9pckoPkhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757323123; c=relaxed/simple;
	bh=sNlXJJ636+YqbuYzS4Qwsqp7lmB86wigvbLG3djtUHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6oossR61aY9Zk8ZoLlpAC4I+BcDZV/dO8/LsabH3atsBNMcOBycVLF0KG5ZLdqQx5FeB0KKcC2QekMgU/Lhdyhd/GpTasgu36kxQWvFsGbfnaiCOdRtubmIb+KcWyA2XG3ffwe7DCuC+Gmhv3B+CR3wfXcwCbnJDsZxyUk7HOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mpgqrifp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D3ED86DC;
	Mon,  8 Sep 2025 11:17:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757323047;
	bh=sNlXJJ636+YqbuYzS4Qwsqp7lmB86wigvbLG3djtUHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpgqrifpuc3SQ9EmkMS8By22p4EVyx8TkIpiVmhpLo7vr3iQcsxFJcvWxpRlMOFiO
	 PFuPI6Eav8N2ndsNyFaJNMHJFnNTkxkyub5U/gqGFX7IQY/4Nuuv37/ZmoXHX4oqww
	 pRDktDmvYNsSLj9Q5nAbW9KiXQN/5Vfg8F2oxVHk=
Date: Mon, 8 Sep 2025 11:18:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: uvcvideo: Move video_device under
 video_queue
Message-ID: <20250908091819.GB22977@pendragon.ideasonboard.com>
References: <20250725-uvc-onelocksless-v2-0-953477834929@chromium.org>
 <20250725-uvc-onelocksless-v2-2-953477834929@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250725-uvc-onelocksless-v2-2-953477834929@chromium.org>

Hi Ricardo,

On Fri, Jul 25, 2025 at 01:12:49PM +0000, Ricardo Ribalda wrote:
> It is more natural that the "struct video_device" belongs to
> uvc_video_queue instead of uvc_streaming.
> 
> This is an aesthetic change. No functional change expected.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_driver.c   | 16 ++++++++--------
>  drivers/media/usb/uvc/uvc_metadata.c |  3 +--
>  drivers/media/usb/uvc/uvc_v4l2.c     |  2 +-
>  drivers/media/usb/uvc/uvc_video.c    |  2 +-
>  drivers/media/usb/uvc/uvcvideo.h     |  4 +---
>  5 files changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 3039e6a533b82dd917050d416c9ced8756d69170..505e85a6b4d99666f3a4a9441dd1ca72e13228e0 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1954,11 +1954,11 @@ static void uvc_unregister_video(struct uvc_device *dev)
>  
>  	list_for_each_entry(stream, &dev->streams, list) {
>  		/* Nothing to do here, continue. */
> -		if (!video_is_registered(&stream->vdev))
> +		if (!video_is_registered(&stream->queue.vdev))
>  			continue;
>  
> -		vb2_video_unregister_device(&stream->vdev);
> -		vb2_video_unregister_device(&stream->meta.vdev);
> +		vb2_video_unregister_device(&stream->queue.vdev);
> +		vb2_video_unregister_device(&stream->meta.queue.vdev);
>  
>  		/*
>  		 * Now both vdevs are not streaming and all the ioctls will
> @@ -1980,12 +1980,12 @@ static void uvc_unregister_video(struct uvc_device *dev)
>  
>  int uvc_register_video_device(struct uvc_device *dev,
>  			      struct uvc_streaming *stream,
> -			      struct video_device *vdev,
>  			      struct uvc_video_queue *queue,
>  			      enum v4l2_buf_type type,
>  			      const struct v4l2_file_operations *fops,
>  			      const struct v4l2_ioctl_ops *ioctl_ops)
>  {
> +	struct video_device *vdev = &queue->vdev;
>  	int ret;
>  
>  	/* Initialize the video buffers queue. */
> @@ -2067,9 +2067,9 @@ static int uvc_register_video(struct uvc_device *dev,
>  	uvc_debugfs_init_stream(stream);
>  
>  	/* Register the device with V4L. */
> -	return uvc_register_video_device(dev, stream, &stream->vdev,
> -					 &stream->queue, stream->type,
> -					 &uvc_fops, &uvc_ioctl_ops);
> +	return uvc_register_video_device(dev, stream, &stream->queue,
> +					 stream->type, &uvc_fops,
> +					 &uvc_ioctl_ops);
>  }
>  
>  /*
> @@ -2105,7 +2105,7 @@ static int uvc_register_terms(struct uvc_device *dev,
>  		 */
>  		uvc_meta_register(stream);
>  
> -		term->vdev = &stream->vdev;
> +		term->vdev = &stream->queue.vdev;
>  	}
>  
>  	return 0;
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 649844e2ad60ed9e9951daec871f2000f48702a6..9ed50c3249cbd222be71ffdba18c41ff972158af 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -228,12 +228,11 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
>  int uvc_meta_register(struct uvc_streaming *stream)
>  {
>  	struct uvc_device *dev = stream->dev;
> -	struct video_device *vdev = &stream->meta.vdev;
>  	struct uvc_video_queue *queue = &stream->meta.queue;
>  
>  	stream->meta.format = V4L2_META_FMT_UVC;
>  
> -	return uvc_register_video_device(dev, stream, vdev, queue,
> +	return uvc_register_video_device(dev, stream, queue,
>  					 V4L2_BUF_TYPE_META_CAPTURE,
>  					 &uvc_meta_fops, &uvc_meta_ioctl_ops);
>  }
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index fdc4520a7bb42af7cd5cb9c1fa49957c31e0041c..5b0a7edc9966e7c66438af6daa1f98fa87a6d0d3 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -576,7 +576,7 @@ static int uvc_v4l2_open(struct file *file)
>  	if (!handle)
>  		return -ENOMEM;
>  
> -	v4l2_fh_init(&handle->vfh, &stream->vdev);
> +	v4l2_fh_init(&handle->vfh, &stream->queue.vdev);
>  	v4l2_fh_add(&handle->vfh);
>  	handle->chain = stream->chain;
>  	handle->stream = stream;
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 2e377e7b9e81599aca19b800a171cc16a09c1e8a..ef12a935829277d7f1c1ebffcd901742513fbe7e 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1705,7 +1705,7 @@ static void uvc_video_complete(struct urb *urb)
>  	struct uvc_streaming *stream = uvc_urb->stream;
>  	struct uvc_video_queue *queue = &stream->queue;
>  	struct uvc_video_queue *qmeta = &stream->meta.queue;
> -	struct vb2_queue *vb2_qmeta = stream->meta.vdev.queue;
> +	struct vb2_queue *vb2_qmeta = stream->meta.queue.vdev.queue;
>  	struct uvc_buffer *buf = NULL;
>  	struct uvc_buffer *buf_meta = NULL;
>  	unsigned long flags;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 86765b9d7935f0888476249c3fb826cd7f36b35c..d4947878fd0126d788d16977a553fa0f45645dcd 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -328,6 +328,7 @@ struct uvc_buffer {
>  #define UVC_QUEUE_DISCONNECTED		(1 << 0)
>  
>  struct uvc_video_queue {
> +	struct video_device vdev;
>  	struct vb2_queue queue;
>  	struct mutex mutex;			/*
>  						 * Serializes vb2_queue and
> @@ -450,7 +451,6 @@ struct uvc_urb {
>  struct uvc_streaming {
>  	struct list_head list;
>  	struct uvc_device *dev;
> -	struct video_device vdev;
>  	struct uvc_video_chain *chain;
>  	atomic_t active;
>  
> @@ -477,7 +477,6 @@ struct uvc_streaming {
>  		       struct uvc_buffer *meta_buf);
>  
>  	struct {
> -		struct video_device vdev;
>  		struct uvc_video_queue queue;
>  		u32 format;
>  	} meta;
> @@ -727,7 +726,6 @@ int uvc_meta_register(struct uvc_streaming *stream);
>  
>  int uvc_register_video_device(struct uvc_device *dev,
>  			      struct uvc_streaming *stream,
> -			      struct video_device *vdev,
>  			      struct uvc_video_queue *queue,
>  			      enum v4l2_buf_type type,
>  			      const struct v4l2_file_operations *fops,

-- 
Regards,

Laurent Pinchart


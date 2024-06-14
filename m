Return-Path: <linux-media+bounces-13256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3A29086EE
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 11:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AFDBB23283
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AFF191497;
	Fri, 14 Jun 2024 09:02:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E2B146A7A;
	Fri, 14 Jun 2024 09:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718355732; cv=none; b=nM14kHWFiLp1ijfYm+ApDYNdBjSEYWtAnswHmVxXR/pGa+yjTsBkoRRV8alLFN+LYmXBY+mhNPvEWQt71v/YXsBjwQnxtOk5i5g5eGs15xHHZlj/WL8Pyh4Z+1VlIDW8y3WBWEgpm5pM2RslyjTFprlwVYwToDcqBwOQ0yt++2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718355732; c=relaxed/simple;
	bh=xSwd9RT7wcgXqiFIolq3usCVmZfuWKhwVGxFbsWPf5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWAzzEdlVMovsSXjlSHylDnIsquI/g72dvfBwuBHhI9sT2/ojz1LlPxslVwaY93n+COafB7tixzgnsGcc66svTEvOFubgmpVc8OhwUolK4Nz2unD8F2XTD8MHIqnmk4ILG4iH6OerlWXecFuS7iuwm7iqtvZ9eFPxN5mKJSYHrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E23DC32786;
	Fri, 14 Jun 2024 09:02:10 +0000 (UTC)
Message-ID: <08900a94-cbba-4c76-8b47-e467f747cd99@xs4all.nl>
Date: Fri, 14 Jun 2024 11:02:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] media: uvcvideo: stop stream during unregister
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alan Stern <stern@rowland.harvard.edu>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20240611-guenter-mini-v5-0-047b6fe5d08b@chromium.org>
 <20240611-guenter-mini-v5-1-047b6fe5d08b@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240611-guenter-mini-v5-1-047b6fe5d08b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2024 10:12, Ricardo Ribalda wrote:
> uvc_unregister_video() can be called asynchronously from
> uvc_disconnect(). If the device is still streaming when that happens, a
> plethora of race conditions can happen.
> 
> Make sure that the device has stopped streaming before exiting this
> function.
> 
> If the user still holds handles to the driver's file descriptors, any
> ioctl will return -ENODEV from the v4l2 core.
> 
> This change make uvc more consistent with the rest of the v4l2 drivers
> using the vb2_fop_* and vb2_ioctl_* helpers.
> 
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index bbd90123a4e7..f1df6384e738 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1908,11 +1908,41 @@ static void uvc_unregister_video(struct uvc_device *dev)
>  	struct uvc_streaming *stream;
>  
>  	list_for_each_entry(stream, &dev->streams, list) {
> +		/* Nothing to do here, continue. */
>  		if (!video_is_registered(&stream->vdev))
>  			continue;
>  
> +		/*
> +		 * For stream->vdev we follow the same logic as:
> +		 * vb2_video_unregister_device().
> +		 */
> +
> +		/* 1. Take a reference to vdev */
> +		get_device(&stream->vdev.dev);
> +
> +		/* 2. Ensure that no new ioctls can be called. */
>  		video_unregister_device(&stream->vdev);
> -		video_unregister_device(&stream->meta.vdev);
> +
> +		/* 3. Wait for old ioctls to finish. */
> +		mutex_lock(&stream->mutex);
> +
> +		/* 4. Stop streamming. */

streamming -> streaming

> +		uvc_queue_streamoff(&stream->queue, stream->type);

This should call uvc_queue_release (just a wrapper around vb2_queue_release())
instead. Then it is identical in behavior to vb2_video_unregister_device.

Note that uvc_v4l2_release() also calls uvc_queue_release(): it's safe
to call uvc_queue_release() twice.

With that change:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> +
> +		mutex_unlock(&stream->mutex);
> +
> +		put_device(&stream->vdev.dev);
> +
> +		/*
> +		 * For stream->meta.vdev we can directly call:
> +		 * vb2_video_unregister_device().
> +		 */
> +		vb2_video_unregister_device(&stream->meta.vdev);
> +
> +		/*
> +		 * Now both vdevs are not streaming and all the ioctls will
> +		 * return -ENODEV.
> +		 */
>  
>  		uvc_debugfs_cleanup_stream(stream);
>  	}
> 



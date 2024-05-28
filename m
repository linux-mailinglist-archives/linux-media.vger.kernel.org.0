Return-Path: <linux-media+bounces-12063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCE88D1592
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 09:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EE96280FA8
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 07:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2EB3745C2;
	Tue, 28 May 2024 07:55:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9793E73455;
	Tue, 28 May 2024 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716882937; cv=none; b=kGcCbHBxEHz9D4OVc+mVC8ZPQ34aNS85QePchpGYLNYMRlOGnSdQvMGM/YDnTqgb4a2AS+vjNU5AVm+D0aI/CBnszRuviizvNr5aF87jnkbtHHtWqhIR9dSaucgrt3hCsdntlbHCKeK/cFlaE1XwF0/p6We3BZyKYAI/9C5aOWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716882937; c=relaxed/simple;
	bh=1EkBW8lDpZh1PWg2EvwlMNTwmwSt2yEYD3D320dGqGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IWvZlWXoe4JgJvqgTf4m5T9Y9bPpkxkDvXle8Gg5RABTPizdPKSwSiYyq3j0N441G/IhDIYIrU2L9vfQ41eyWBki/IispVD+pBIiCJHXPnahr5N5nIByOrO3IXV8CbYLPsX0RMz/MNaB1YnIw8EnCjVLo3Xj+jqYG6woMozqzrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B293C32781;
	Tue, 28 May 2024 07:55:34 +0000 (UTC)
Message-ID: <7d06c6e4-c555-4117-a22b-5c614d7f6f8a@xs4all.nl>
Date: Tue, 28 May 2024 09:55:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] media: uvcvideo: stop stream during unregister
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Max Staudt <mstaudt@chromium.org>,
 Tomasz Figa <tfiga@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alan Stern <stern@rowland.harvard.edu>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
 <20240327-guenter-mini-v4-1-49955c198eae@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240327-guenter-mini-v4-1-49955c198eae@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2024 09:24, Ricardo Ribalda wrote:
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
>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index bbd90123a4e76..17fc945c8deb6 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1911,8 +1911,19 @@ static void uvc_unregister_video(struct uvc_device *dev)
>  		if (!video_is_registered(&stream->vdev))
>  			continue;
>  
> +		/*
> +		 * Serialize other access to the stream.
> +		 */
> +		mutex_lock(&stream->mutex);
> +		uvc_queue_streamoff(&stream->queue, stream->type);
>  		video_unregister_device(&stream->vdev);
>  		video_unregister_device(&stream->meta.vdev);
> +		mutex_unlock(&stream->mutex);

This sequence isn't fool proof. You have to follow the same sequence as
vb2_video_unregister_device(): take a reference to the video device,
then unregister, then take the stream mutex and call vb2_queue_release
for each queue. Finally unlock the mutex and call put_device.

Doing the video_unregister_device first ensures no new ioctls can be
called on that device node. Taking the mutex ensures that any still
running ioctls will finish (since it will sleep until they release the
mutex), and then you can release the queue.

This does require that you call get_device before calling video_unregister_device,
otherwise everything might be released at that point.

Instead of vb2_queue_release() you might have to call uvc_queue_streamoff,
but note that there are two queues here: video and meta. The code above
just calls streamoff for the video device.

For the meta device I think you can just use vb2_video_unregister_device()
directly, since that sets vdev->queue and vdev->queue.lock to the correct
values. That would just leave the video device where you need to do this
manually.

Regards,

	Hans

> +
> +		/*
> +		 * Now the vdev is not streaming and all the ioctls will
> +		 * return -ENODEV
> +		 */
>  
>  		uvc_debugfs_cleanup_stream(stream);
>  	}
> 



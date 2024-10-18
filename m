Return-Path: <linux-media+bounces-19853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8354D9A3D0C
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 399841F23E8C
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 11:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2986D20100B;
	Fri, 18 Oct 2024 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNL1I3g9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FD2200CB6;
	Fri, 18 Oct 2024 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729250026; cv=none; b=C34ZIfg5KmfEJPRE59103GXAT/DckWyuC9phl/mXVTTXz6/dWtZH5LwYGnRVTmRxiWcWhuDkoZ5gtxMoROC3dEMfY2cA0b6aJ+dtri383rT7/fH/NqwZH6cGYVlyX6OF/8yUoW03l/EKPPDgrMp0C691f7zkwtVqn+iVVw7sfLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729250026; c=relaxed/simple;
	bh=6fjFvPjtW49gvS3feK/6QYpKDGIrQ/9y5cATnWJJL9s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8JTV2bmhdZMhmszRuJ2effxVD9ylnGMw0mUOOrowmUmJcx/MnJ6XYRrXKudl/t21YiQzYjYmUSIXZnYDWl58RZP9YEjhLHKDvY1urALkQuZfX94tN5dCS9vrFTzXoz3UueODZvKu3dEoe1ku0Nx+6oK8L9gbFw15wOYJoZerp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNL1I3g9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90738C4CEC3;
	Fri, 18 Oct 2024 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729250026;
	bh=6fjFvPjtW49gvS3feK/6QYpKDGIrQ/9y5cATnWJJL9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mNL1I3g9nMZEnPIzQKWMrqQvUjAHUjxChxaf01cbzXgh0qxcy4CPQFmAjb/4uHvhu
	 o1E2qDUaWYOfAeWGoUdDuIwqgKfG8PlDbmglHJGCYvGNvkiPEswRMilo9b139QIGuY
	 Eedsa+k+hJDXZDISmMlc3A9rl6SZB5DlXiHa5FPMgtz3yMPfQ75mS1KwWCkqZ27HUV
	 qo4udth1+jpeFFYAdv65k26xwGVY/3FrXaEuwNbdVCjvgtMwdw67WNydWqR2VONs+T
	 nfJEcoZQ5AIDlUxgVQt9GTqJfogDjUKrR/S9J4DhtiehcKPMHM3EETiTn5FB1HSm77
	 7Zz1QErd4fymg==
Date: Fri, 18 Oct 2024 13:13:41 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: uvcvideo: Stop stream during unregister
Message-ID: <20241018131341.2e95df71@foz.lan>
In-Reply-To: <20240926-uvc_stop_streaming-v1-1-038180fafe5f@chromium.org>
References: <20240926-uvc_stop_streaming-v1-1-038180fafe5f@chromium.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 26 Sep 2024 05:59:06 +0000
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> uvc_unregister_video() can be called asynchronously from
> uvc_disconnect(). If the device is still streaming when that happens, a
> plethora of race conditions can occur.
> 
> Make sure that the device has stopped streaming before exiting this
> function.
> 
> If the user still holds handles to the driver's file descriptors, any
> ioctl will return -ENODEV from the v4l2 core.
> 
> This change makes uvc more consistent with the rest of the v4l2 drivers
> using the vb2_fop_* and vb2_ioctl_* helpers.
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

I didn't test it, but the patch looks OK on my eyes.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
> This patch was part of the series:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=13064
> 
> Moved out from it to ease the review.
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f0febdc08c2d..bee150b852e4 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1919,11 +1919,41 @@ static void uvc_unregister_video(struct uvc_device *dev)
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
> +		/* 4. Stop streaming. */
> +		uvc_queue_release(&stream->queue);
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
> ---
> base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
> change-id: 20240926-uvc_stop_streaming-6e9fd20e97bc
> 
> Best regards,



Thanks,
Mauro


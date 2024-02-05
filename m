Return-Path: <linux-media+bounces-4711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B2B849D73
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 15:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C8B81F2412F
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 14:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2B22C1BA;
	Mon,  5 Feb 2024 14:56:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FDC2C859
	for <linux-media@vger.kernel.org>; Mon,  5 Feb 2024 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707144985; cv=none; b=lXy8iUN0ppu3Rk6tq8Lc1G4+jM/awk9HBnZR+hTz5YLj3hP1RFkgJw008okGmklB1EN2p+EwO10ydZq+RdDvJ579xz0vfVpmJD9AmaHRft2wKhUBNPjW4Fue9Dj8FM9NWW3yBkPUMIPL+DRvRHnJTJuT5mWSFjCl9cLUcWquz8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707144985; c=relaxed/simple;
	bh=4xtRQkuiPqyu6TyLwdlTOSwth1b8ntrgFb54HjrouaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKQnNuFWwsaSOlkswA2UoulQOsuvJ4KsDzoH0ZHtgm7MRAFmSDZUi3E1pueOSIJR8nK5Z6MsUcsjqEOfabdTDH9Q+17tCZ8mX+Kg0Mv0TXzVf9f/0FOwmdxfjT2hCRvik3HroB2sIp0g106dgb+BIe9PDXdkwd8BqfvMGWHSDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1112C433C7;
	Mon,  5 Feb 2024 14:56:23 +0000 (UTC)
Message-ID: <2708ec26-3156-4269-85ae-d9e783dc3bd1@xs4all.nl>
Date: Mon, 5 Feb 2024 15:56:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/29] media: v4l: Acquire a reference to the media
 device for every video device
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-18-sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231220103713.113386-18-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/2023 11:37, Sakari Ailus wrote:
> The video device depends on the existence of its media device --- if there
> is one. Acquire a reference to it.
> 
> Note that when the media device release callback is used, then the V4L2
> device release callback is ignored and a warning is issued if both are
> set.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 51 ++++++++++++++++++++----------
>  1 file changed, 34 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index d13954bd31fd..c1e4995eaf5c 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -176,6 +176,11 @@ static void v4l2_device_release(struct device *cd)
>  {
>  	struct video_device *vdev = to_video_device(cd);
>  	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
> +	bool v4l2_dev_has_release = v4l2_dev->release;
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	struct media_device *mdev = v4l2_dev->mdev;
> +	bool mdev_has_release = mdev && mdev->ops && mdev->ops->release;
> +#endif
>  
>  	mutex_lock(&videodev_lock);
>  	if (WARN_ON(video_devices[vdev->minor] != vdev)) {
> @@ -198,8 +203,8 @@ static void v4l2_device_release(struct device *cd)
>  
>  	mutex_unlock(&videodev_lock);
>  
> -#if defined(CONFIG_MEDIA_CONTROLLER)
> -	if (v4l2_dev->mdev && vdev->vfl_dir != VFL_DIR_M2M) {
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	if (mdev && vdev->vfl_dir != VFL_DIR_M2M) {
>  		/* Remove interfaces and interface links */
>  		media_devnode_remove(vdev->intf_devnode);
>  		if (vdev->entity.function != MEDIA_ENT_F_UNKNOWN)
> @@ -207,23 +212,31 @@ static void v4l2_device_release(struct device *cd)
>  	}
>  #endif
>  
> -	/* Do not call v4l2_device_put if there is no release callback set.
> -	 * Drivers that have no v4l2_device release callback might free the
> -	 * v4l2_dev instance in the video_device release callback below, so we
> -	 * must perform this check here.
> -	 *
> -	 * TODO: In the long run all drivers that use v4l2_device should use the
> -	 * v4l2_device release callback. This check will then be unnecessary.
> -	 */
> -	if (v4l2_dev->release == NULL)
> -		v4l2_dev = NULL;
> -
>  	/* Release video_device and perform other
>  	   cleanups as needed. */
>  	vdev->release(vdev);
>  
> -	/* Decrease v4l2_device refcount */
> -	if (v4l2_dev)
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	if (mdev)
> +		media_device_put(mdev);
> +
> +	/*
> +	 * Generally both struct media_device and struct v4l2_device are
> +	 * embedded in the same driver's context struct so having a release
> +	 * callback in both is a bug.
> +	 */
> +	WARN_ON(v4l2_dev_has_release && mdev_has_release);

How about:

	if (WARN_ON(v4l2_dev_has_release && mdev_has_release))
		v4l2_dev_has_release = false;

> +#endif
> +
> +	/*
> +	 * Decrease v4l2_device refcount, but only if the media device doesn't
> +	 * have a release callback.
> +	 */
> +	if (v4l2_dev_has_release
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	    && !mdev_has_release
> +#endif
> +	    )

Then this change is no longer needed.

General question: do we have drivers today that set both release functions?
Because that would now cause a WARN in the kernel log with this patch.

>  		v4l2_device_put(v4l2_dev);
>  }
>  
> @@ -792,11 +805,14 @@ static int video_register_media_controller(struct video_device *vdev)
>  	u32 intf_type;
>  	int ret;
>  
> -	/* Memory-to-memory devices are more complex and use
> +	/*
> +	 * Memory-to-memory devices are more complex and use
>  	 * their own function to register its mc entities.
>  	 */
> -	if (!vdev->v4l2_dev->mdev || vdev->vfl_dir == VFL_DIR_M2M)
> +	if (!vdev->v4l2_dev->mdev || vdev->vfl_dir == VFL_DIR_M2M) {
> +		media_device_get(vdev->v4l2_dev->mdev);
>  		return 0;
> +	}
>  
>  	vdev->entity.obj_type = MEDIA_ENTITY_TYPE_VIDEO_DEVICE;
>  	vdev->entity.function = MEDIA_ENT_F_UNKNOWN;
> @@ -875,6 +891,7 @@ static int video_register_media_controller(struct video_device *vdev)
>  
>  	/* FIXME: how to create the other interface links? */
>  
> +	media_device_get(vdev->v4l2_dev->mdev);
>  #endif
>  	return 0;
>  }

Regards,

	Hans


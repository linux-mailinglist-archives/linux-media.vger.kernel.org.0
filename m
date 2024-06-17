Return-Path: <linux-media+bounces-13404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E790AA2D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 11:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 586FF1C23873
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 09:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B11194AD8;
	Mon, 17 Jun 2024 09:39:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCF8194ACD
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 09:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718617183; cv=none; b=LCV5c0xKxXA4CClK01LespU9u4Chwj77ZPvTGSUHLt5X4T/K+ehYT6xp0ax7hTkUJuPLX8LUKXdk2qBn4IYfqmewgeoHq52fYuTSOjL2wEAhL9pHpz1cSgmo2ScVd7M5T2ZwC+Umownkycx/T/FOLnmh6lUCATLRj939zt/DHEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718617183; c=relaxed/simple;
	bh=YlOHA6sCalipKOZvHZqeF3LAgPSwlXJdo3rmUXb774Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kEslI+3ta2Vu4/PqEn+9/l6TrI/zkJP9RuAQ5BOPBR7737eCQ1U9zUX8gtNDCkUt7e/w+qIxEScg9WQX5etsvvNPKQ1JW2IrBLisNBjpECyWm88eLzEsDh0VFwYskTCRLY69gdhRmTiuabrJzrVl+qoXOuwRR3j51iMZ6iEIaMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F005C4AF1A;
	Mon, 17 Jun 2024 09:39:42 +0000 (UTC)
Message-ID: <10d4bdf9-e35f-4584-973c-07dab784f2bd@xs4all.nl>
Date: Mon, 17 Jun 2024 11:39:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/26] media: v4l: Acquire a reference to the media
 device for every video device
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-16-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240610100530.1107771-16-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/06/2024 12:05, Sakari Ailus wrote:
> The video device depends on the existence of its media device --- if there
> is one. Acquire a reference to it.
> 
> Note that when the media device release callback is used, then the V4L2
> device release callback is ignored and a warning is issued if both are
> set.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 53 ++++++++++++++++++++----------
>  1 file changed, 35 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index be2ba7ca5de2..4bf4398fd2fe 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -176,6 +176,11 @@ static void v4l2_device_release(struct device *cd)
>  {
>  	struct video_device *vdev = to_video_device(cd);
>  	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
> +	bool v4l2_dev_call_release = v4l2_dev->release;
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
> @@ -207,23 +212,28 @@ static void v4l2_device_release(struct device *cd)
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
> +	if (WARN_ON(v4l2_dev_call_release && mdev_has_release))
> +		v4l2_dev_call_release = false;
> +#endif
> +
> +	/*
> +	 * Decrease v4l2_device refcount, but only if the media device doesn't
> +	 * have a release callback.
> +	 */
> +	if (v4l2_dev_call_release)
>  		v4l2_device_put(v4l2_dev);
>  }
>  
> @@ -795,11 +805,17 @@ static int video_register_media_controller(struct video_device *vdev)
>  	u32 intf_type;
>  	int ret;
>  
> -	/* Memory-to-memory devices are more complex and use
> -	 * their own function to register its mc entities.
> +	if (!vdev->v4l2_dev->mdev)
> +		return 0;
> +
> +	/*
> +	 * Memory-to-memory devices are more complex and use their own function
> +	 * to register its mc entities.
>  	 */
> -	if (!vdev->v4l2_dev->mdev || vdev->vfl_dir == VFL_DIR_M2M)
> +	if (vdev->vfl_dir == VFL_DIR_M2M) {
> +		media_device_get(vdev->v4l2_dev->mdev);
>  		return 0;
> +	}
>  
>  	vdev->entity.obj_type = MEDIA_ENTITY_TYPE_VIDEO_DEVICE;
>  	vdev->entity.function = MEDIA_ENT_F_UNKNOWN;
> @@ -878,6 +894,7 @@ static int video_register_media_controller(struct video_device *vdev)
>  
>  	/* FIXME: how to create the other interface links? */
>  
> +	media_device_get(vdev->v4l2_dev->mdev);
>  #endif
>  	return 0;
>  }



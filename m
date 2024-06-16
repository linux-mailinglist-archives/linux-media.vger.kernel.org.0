Return-Path: <linux-media+bounces-13355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8512890A0DF
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BBDE282511
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E3674424;
	Sun, 16 Jun 2024 23:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vt3MdcV1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03118225D6;
	Sun, 16 Jun 2024 23:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718582075; cv=none; b=QGXiCcpssx0fBchyn+uvJQyToqxnI4qEa0ZO/k2mRe14bq7ur41Dq6rIfvmo8Mi3ziRqGxkCcTCGIbjuxuUI2kTviLV4gJzo7E4Yj2M5Fzhi7qFihpAdMhSyMetJxcLRtjIUCEehF2O48FS39qmemOwjPRyJ8JilhtHlU3IzVv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718582075; c=relaxed/simple;
	bh=Ri2CvSvGdxzAt/3LSCYExptWawOTSqNiyOXzVHotLCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIVuiJimF2ZS/7b/7iGEubMor+sWZ/1rscC/kx4p+Um+iAusOBm7BvhCIsbQ/G1UciexXDzd/gtPiCOnjSOieqFP/eMswcFgZXepIp+dMtsOQ+1vquC6U4g8Qxvha9egaJoow2/0APPfJ1fDALup0RHGnx5OvGjOfBn3JWg2TAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vt3MdcV1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCC412D5;
	Mon, 17 Jun 2024 01:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718582056;
	bh=Ri2CvSvGdxzAt/3LSCYExptWawOTSqNiyOXzVHotLCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vt3MdcV1rkaAu86FddoUKH5fcocyXobZ0CorVlmNQmAEILWuYP+Leah3NU9MVvSDs
	 Ntj4TiRA86iYqBAsGptIue5kpIhHCmgmrjoqRL7Kz9GLVFX6SnayZRoBkZrJNAUBPa
	 XNMOGoihnZafieiGrVTYQweeIsdoiFBbS6xAxrT4=
Date: Mon, 17 Jun 2024 02:54:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Tomasz Figa <tfiga@chromium.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sean Paul <seanpaul@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v6 1/4] media: uvcvideo: Stop stream during unregister
Message-ID: <20240616235410.GN4782@pendragon.ideasonboard.com>
References: <20240614-guenter-mini-v6-0-7b7fdc3b21b3@chromium.org>
 <20240614-guenter-mini-v6-1-7b7fdc3b21b3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614-guenter-mini-v6-1-7b7fdc3b21b3@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Fri, Jun 14, 2024 at 12:41:27PM +0000, Ricardo Ribalda wrote:
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

As I've said many times before, this issue needs a fix in the V4L2 core,
ideally with support in the cdev core. It seems I'll have to do it
myself ?

> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index bbd90123a4e7..55132688e363 100644
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

-- 
Regards,

Laurent Pinchart


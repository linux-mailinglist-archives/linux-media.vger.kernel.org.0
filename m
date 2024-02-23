Return-Path: <linux-media+bounces-5755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 004E7860EA2
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 10:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84627B24595
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 09:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AFD5C916;
	Fri, 23 Feb 2024 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EFSzAZel"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C02C5C610
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708681845; cv=none; b=GDfzTePtz52VQyM5b3PFg7bgdbmWKwaC6HS2AaGNGt6ljdcVJSKSrxZ/E3aKZXhlP9guMdv67pdBQbl0KMlTkdndLrRAH6vzaiOivT+FdzTkMKydskCuqxJQSIUJYCXULGbSbunJbG6b792whoRaDwVKOsTGiTHxCTKLLdj1a5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708681845; c=relaxed/simple;
	bh=2yIhaF7NJJNmbRcYjDCjlHpv2mHBA19Ci2xOom3OGaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkkuEwX5R2li41NalKgo48hb7z8X1aTidgv/ltJcuz7tdmHeOmJkirdkf8oyDem3wanjOKkiUM3XmnweN8X96h9rEjTCACH5xphMtuZrt/wH0HdUtghYJyLOA7KxRc0vDngSA1RgIK3uYKewO0oju7+n3ao4Rrlm5fkFpRFK9rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EFSzAZel; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 351EF9B6;
	Fri, 23 Feb 2024 10:50:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708681833;
	bh=2yIhaF7NJJNmbRcYjDCjlHpv2mHBA19Ci2xOom3OGaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFSzAZel2RiNzYTQCdqkEccSKnqhmpibUWaizMnEKdvVKc9AWmSTFqBsNQu/ThRh8
	 yRhwn5G6qbwawonx1Utr0jyNcFD7F1zf6z844z+WF7Glkd37G8vfm8NeT8rlL3aivu
	 FCkjXeGw2m0KHXKGT4jco6k8bXbYSEZyDRJYzlYM=
Date: Fri, 23 Feb 2024 11:50:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: mc: return ENODEV instead of EIO/ENXIO when dev
 is, unregistered
Message-ID: <20240223095045.GI31348@pendragon.ideasonboard.com>
References: <41bb718b-2c6d-41aa-b093-b800dffcbe1e@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <41bb718b-2c6d-41aa-b093-b800dffcbe1e@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Fri, Feb 23, 2024 at 10:34:32AM +0100, Hans Verkuil wrote:
> If the media device is unregistered, the read/write/ioctl file ops
> returned EIO instead of ENODEV. And open returned ENXIO instead of the
> linux kernel standard of ENODEV.

Are you sure this is right ? Looking at chrdev_open() for instance, it
returns -ENXIO when it can't find a cdev for the requested minor.
Furthermore, the read() 3 manpage documents the ENXIO error as

       ENXIO  A request was made of a nonexistent device, or the request
       was outside the capabilities of the device.

while it doesn't document ENODEV at all.

> Change the error code to ENODEV and document this as well in
> media-func-open.rst.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../userspace-api/media/mediactl/media-func-open.rst   |  4 ++--
>  drivers/media/mc/mc-devnode.c                          | 10 +++++-----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/mediactl/media-func-open.rst b/Documentation/userspace-api/media/mediactl/media-func-open.rst
> index 24487cb0a308..8c1c7ebefdb1 100644
> --- a/Documentation/userspace-api/media/mediactl/media-func-open.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-func-open.rst
> @@ -61,5 +61,5 @@ ENFILE
>  ENOMEM
>      Insufficient kernel memory was available.
> 
> -ENXIO
> -    No device corresponding to this device special file exists.
> +ENODEV
> +    Device not found or was removed.
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 7f67825c8757..fbf76e1414de 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -75,7 +75,7 @@ static ssize_t media_read(struct file *filp, char __user *buf,
>  	if (!devnode->fops->read)
>  		return -EINVAL;
>  	if (!media_devnode_is_registered(devnode))
> -		return -EIO;
> +		return -ENODEV;
>  	return devnode->fops->read(filp, buf, sz, off);
>  }
> 
> @@ -87,7 +87,7 @@ static ssize_t media_write(struct file *filp, const char __user *buf,
>  	if (!devnode->fops->write)
>  		return -EINVAL;
>  	if (!media_devnode_is_registered(devnode))
> -		return -EIO;
> +		return -ENODEV;
>  	return devnode->fops->write(filp, buf, sz, off);
>  }
> 
> @@ -114,7 +114,7 @@ __media_ioctl(struct file *filp, unsigned int cmd, unsigned long arg,
>  		return -ENOTTY;
> 
>  	if (!media_devnode_is_registered(devnode))
> -		return -EIO;
> +		return -ENODEV;
> 
>  	return ioctl_func(filp, cmd, arg);
>  }
> @@ -152,11 +152,11 @@ static int media_open(struct inode *inode, struct file *filp)
>  	 */
>  	mutex_lock(&media_devnode_lock);
>  	devnode = container_of(inode->i_cdev, struct media_devnode, cdev);
> -	/* return ENXIO if the media device has been removed
> +	/* return ENODEV if the media device has been removed
>  	   already or if it is not registered anymore. */
>  	if (!media_devnode_is_registered(devnode)) {
>  		mutex_unlock(&media_devnode_lock);
> -		return -ENXIO;
> +		return -ENODEV;
>  	}
>  	/* and increase the device refcount */
>  	get_device(&devnode->dev);

-- 
Regards,

Laurent Pinchart


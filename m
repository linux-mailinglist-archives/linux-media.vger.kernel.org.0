Return-Path: <linux-media+bounces-4803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CF784C911
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 11:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CEC9287AE3
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 10:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3B5179B2;
	Wed,  7 Feb 2024 10:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PFJXYZB/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A34E1B7E1
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707303496; cv=none; b=NoKRxYxFtj6dhwQHaX4c+7ZkvBg+XmU/UT+0pJv7VPL4m2LU3ls8zL61cgrAo4FxV+C2jvhWirvAKDvTcq31wO96ddI8ffbrvopD72eDVEmnQMx20mY9kq5V9C9erIY+H0tHsDvrdbSi0Q6MAzWwH+AuqFzFd6n+60hZhVmBeE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707303496; c=relaxed/simple;
	bh=vi/gMreWIoUmSvj5UL+K5TbA97haC/O79bCn7XqCYoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOHO9gVNEIIy/LWorZX1v65RT3Hy1F3mJoQUrLySAt6Q2ADe7g+qjFpJ/iTgKry8vGwUvzaVmAyoBRVDDzWj5ga0CyW+8N4NVW2979ZKuT81h07n+/FNh097JYzmVg5w2FLlky5r/riB9v71/uu6XjWw6Tv8rncW0pBLWmIrEVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PFJXYZB/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4D39975;
	Wed,  7 Feb 2024 11:56:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707303409;
	bh=vi/gMreWIoUmSvj5UL+K5TbA97haC/O79bCn7XqCYoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFJXYZB/JIFGmsvqDomod4iMj0KbqeMZ7r8NhXvYj5oqcPC8jNQAS5bZvaupReZaq
	 iD5d/vlA3sAPU7rpYj5h8tAF3v5AV2taCG00HwRxOYlqhR21wHUoZBDDgDvZDv7w5A
	 3pc2p8NlH0YEKdpZT2Nip960S9r6GYnFFT4IUDDI=
Date: Wed, 7 Feb 2024 12:58:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 15/29] media: mc: Unassign minor only if it has been
 assigned
Message-ID: <20240207105815.GM23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-16-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-16-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:36:59PM +0200, Sakari Ailus wrote:
> Assign the media device minor to -1 if it has not been previously
> assigned. There's no dependence to this yes but it will be required by
> patch "media: mc: Implement best effort media device removal safety sans
> refcount" soon.

After a quick look at that patch, I don't see the dependency I'm afraid.
Could you please explain it better ?

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-devnode.c | 9 ++++++++-
>  include/media/media-devnode.h | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 717408791a7c..5057c48f8870 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -59,7 +59,8 @@ static void media_devnode_release(struct device *cd)
>  {
>  	struct media_devnode *devnode = to_media_devnode(cd);
>  
> -	media_devnode_free_minor(devnode->minor);
> +	if (devnode->minor != -1)
> +		media_devnode_free_minor(devnode->minor);

Should the test be moved to media_devnode_free_minor() ?

>  
>  	/* Release media_devnode and perform other cleanups as needed. */
>  	if (devnode->release)
> @@ -212,6 +213,7 @@ static const struct file_operations media_devnode_fops = {
>  void media_devnode_init(struct media_devnode *devnode)
>  {
>  	device_initialize(&devnode->dev);
> +	devnode->minor = -1;
>  }
>  
>  int __must_check media_devnode_register(struct media_devnode *devnode,
> @@ -220,6 +222,9 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
>  	int minor;
>  	int ret;
>  
> +	if (devnode->minor != -1)
> +		return -EINVAL;
> +
>  	/* Part 1: Find a free minor number */
>  	mutex_lock(&media_devnode_lock);
>  	minor = find_first_zero_bit(media_devnode_nums, MEDIA_NUM_DEVICES);
> @@ -261,6 +266,8 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
>  cdev_add_error:
>  	media_devnode_free_minor(devnode->minor);
>  
> +	devnode->minor = -1;
> +
>  	return ret;
>  }
>  
> diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
> index 6d46c658be21..d050f54f252a 100644
> --- a/include/media/media-devnode.h
> +++ b/include/media/media-devnode.h
> @@ -60,7 +60,7 @@ struct media_file_operations {
>   * @dev:	pointer to struct &device containing the media controller device
>   * @cdev:	struct cdev pointer character device
>   * @parent:	parent device
> - * @minor:	device node minor number
> + * @minor:	device node minor number, -1 if unassigned
>   * @flags:	flags, combination of the ``MEDIA_FLAG_*`` constants
>   * @release:	release callback called at the end of ``media_devnode_release()``
>   *		routine at media-device.c.

-- 
Regards,

Laurent Pinchart


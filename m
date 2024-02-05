Return-Path: <linux-media+bounces-4715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5082E849DAC
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 16:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FA7BB23272
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 15:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CA02C6A5;
	Mon,  5 Feb 2024 15:08:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ABB2C690
	for <linux-media@vger.kernel.org>; Mon,  5 Feb 2024 15:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707145690; cv=none; b=FMQwM0XRaXi6sH9nHA4Ogu+cdJwKCvD7aD5+EtZGne+jW2poh2z8xtwd9rKBf2u4cwuD7Bg3+p5g08oRLZV6Mb7OwC5QR+W6+ZGqyyWLpzWIK2M47gLItcCJ6dZtweikbqPo1BfUM7y+Ji1x92T/DRVeJMnSwggN6pX0kpQI+BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707145690; c=relaxed/simple;
	bh=iTibol/A/ekiJznuwrob9y5XPRfUDuaFzA129kiXVEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jHdEWXkwuGHGSGW5Bxd7OmkHCrv9piCzqCbb/QFuuBECpSJUIsuSXanFqazBkSX6hFhRdzj7PNeWWiuFwqVdPRDrtg5ErtAaYW5wfarG4N9jtqkHQ7YBH9zppkI6+uDHiohjzHtTWYpd03OccYhCBiwqsUi2XyKk3p0VMGl7zQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7307FC433F1;
	Mon,  5 Feb 2024 15:08:09 +0000 (UTC)
Message-ID: <88005ad9-37af-4e14-bd3a-237ffa284286@xs4all.nl>
Date: Mon, 5 Feb 2024 16:08:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/29] media: mc: Add per-file-handle data support
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-26-sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231220103713.113386-26-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/2023 11:37, Sakari Ailus wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> The media devnode core associates devnodes with files by storing the
> devnode pointer in the file structure private_data field. In order to
> allow tracking of per-file-handle data introduce a new media devnode
> file handle structure that stores the devnode pointer, and store a
> pointer to that structure in the file private_data field.
> 
> Users of the media devnode code (the only existing user being
> media_device) are responsible for managing their own subclass of the
> media_devnode_fh structure.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Prepare struct media_device_fh to be used for maintaining file handle list
> to avoid shuffling things here and there right after.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/mc/mc-device.c  | 14 +++++++++++++-
>  drivers/media/mc/mc-devnode.c | 20 +++++++++-----------
>  include/media/media-device.h  |  7 +++++++
>  include/media/media-devnode.h | 18 +++++++++++++++++-
>  include/media/media-fh.h      | 32 ++++++++++++++++++++++++++++++++
>  5 files changed, 78 insertions(+), 13 deletions(-)
>  create mode 100644 include/media/media-fh.h
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index 10426c2796b6..67a39cb63f89 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -22,6 +22,7 @@
>  #include <media/media-device.h>
>  #include <media/media-devnode.h>
>  #include <media/media-entity.h>
> +#include <media/media-fh.h>
>  #include <media/media-request.h>
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
> @@ -35,7 +36,6 @@
>  #define MEDIA_ENT_SUBTYPE_MASK			0x0000ffff
>  #define MEDIA_ENT_T_DEVNODE_UNKNOWN		(MEDIA_ENT_F_OLD_BASE | \
>  						 MEDIA_ENT_SUBTYPE_MASK)
> -
>  /* -----------------------------------------------------------------------------
>   * Userspace API
>   */
> @@ -47,11 +47,23 @@ static inline void __user *media_get_uptr(__u64 arg)
>  
>  static int media_device_open(struct file *filp)
>  {
> +	struct media_device_fh *fh;
> +
> +	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
> +	if (!fh)
> +		return -ENOMEM;
> +
> +	filp->private_data = &fh->fh;
> +
>  	return 0;
>  }
>  
>  static int media_device_close(struct file *filp)
>  {
> +	struct media_device_fh *fh = media_device_fh(filp);
> +
> +	kfree(fh);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 4ea05e42dafb..04d376015526 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -150,6 +150,7 @@ static long media_compat_ioctl(struct file *filp, unsigned int cmd,
>  static int media_open(struct inode *inode, struct file *filp)
>  {
>  	struct media_devnode *devnode;
> +	struct media_devnode_fh *fh;
>  	int ret;
>  
>  	/* Check if the media device is available. This needs to be done with
> @@ -170,17 +171,15 @@ static int media_open(struct inode *inode, struct file *filp)
>  	get_device(&devnode->dev);
>  	mutex_unlock(&media_devnode_lock);
>  
> -	filp->private_data = devnode;
> -
> -	if (devnode->fops->open) {
> -		ret = devnode->fops->open(filp);
> -		if (ret) {
> -			put_device(&devnode->dev);
> -			filp->private_data = NULL;
> -			return ret;
> -		}
> +	ret = devnode->fops->open(filp);
> +	if (ret) {
> +		put_device(&devnode->dev);
> +		return ret;
>  	}
>  
> +	fh = filp->private_data;
> +	fh->devnode = devnode;
> +
>  	return 0;
>  }
>  
> @@ -189,8 +188,7 @@ static int media_release(struct inode *inode, struct file *filp)
>  {
>  	struct media_devnode *devnode = media_devnode_data(filp);
>  
> -	if (devnode->fops->release)
> -		devnode->fops->release(filp);
> +	devnode->fops->release(filp);
>  
>  	filp->private_data = NULL;
>  
> diff --git a/include/media/media-device.h b/include/media/media-device.h
> index 98e1892f1b51..83b8ea44463d 100644
> --- a/include/media/media-device.h
> +++ b/include/media/media-device.h
> @@ -110,6 +110,10 @@ struct media_device_ops {
>   *		     other operations that stop or start streaming.
>   * @request_id: Used to generate unique request IDs
>   *
> + * @fh_list:	List of file handles in the media device
> + *		(struct media_device_fh.mdev_list).
> + * @fh_list_lock: Serialise access to fh_list list.
> + *
>   * This structure represents an abstract high-level media device. It allows easy
>   * access to entities and provides basic media device-level support. The
>   * structure can be allocated directly or embedded in a larger structure.
> @@ -182,6 +186,9 @@ struct media_device {
>  
>  	struct mutex req_queue_mutex;
>  	atomic_t request_id;
> +
> +	struct list_head fh_list;
> +	spinlock_t fh_list_lock;
>  };
>  
>  /* We don't need to include usb.h here */
> diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
> index d050f54f252a..b0efdde4ffd8 100644
> --- a/include/media/media-devnode.h
> +++ b/include/media/media-devnode.h
> @@ -53,6 +53,20 @@ struct media_file_operations {
>  	int (*release) (struct file *);
>  };
>  
> +/**
> + * struct media_devnode_fh - Media device node file handle
> + * @devnode:	pointer to the media device node
> + *
> + * This structure serves as a base for per-file-handle data storage. Media
> + * device node users embed media_devnode_fh in their custom file handle data
> + * structures and store the media_devnode_fh in the file private_data in order
> + * to let the media device node core locate the media_devnode corresponding to a
> + * file handle.
> + */
> +struct media_devnode_fh {
> +	struct media_devnode *devnode;
> +};
> +
>  /**
>   * struct media_devnode - Media device node
>   * @media_dev:	pointer to struct &media_device
> @@ -137,7 +151,9 @@ void media_devnode_unregister(struct media_devnode *devnode);
>   */
>  static inline struct media_devnode *media_devnode_data(struct file *filp)
>  {
> -	return filp->private_data;
> +	struct media_devnode_fh *fh = filp->private_data;
> +
> +	return fh->devnode;
>  }
>  
>  /**
> diff --git a/include/media/media-fh.h b/include/media/media-fh.h
> new file mode 100644
> index 000000000000..6f00744b81d6
> --- /dev/null
> +++ b/include/media/media-fh.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Media device file handle
> + *
> + * Copyright (C) 2019--2023 Intel Corporation
> + */
> +
> +#ifndef MEDIA_FH_H
> +#define MEDIA_FH_H
> +
> +#include <linux/list.h>
> +#include <linux/file.h>
> +
> +#include <media/media-devnode.h>
> +
> +/**
> + * struct media_device_fh - File handle specific information on MC
> + *
> + * @fh: The media device file handle
> + * @mdev_list: This file handle in media device's list of file handles
> + */
> +struct media_device_fh {
> +	struct media_devnode_fh fh;
> +	struct list_head mdev_list;
> +};
> +
> +static inline struct media_device_fh *media_device_fh(struct file *filp)
> +{
> +	return container_of(filp->private_data, struct media_device_fh, fh);
> +}
> +
> +#endif /* MEDIA_FH_H */



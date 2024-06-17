Return-Path: <linux-media+bounces-13412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E58D90AB1E
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2716EB303C3
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 09:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755FA161320;
	Mon, 17 Jun 2024 09:57:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7DF1922D3
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618243; cv=none; b=cWOF2oTZuPXVUUv/6CnuJb0J6ergxi0O47QZUv7YbT97GBZGAwD/NvrWqPj1FwV2GVXUkknHEZMPqRh3+7Lj/hz1Orz6uc+RbNxqUeGM6tgFb8VivOsrXIFf293daxszSZ54pUp7yhTMlE2AxgMSXUCd0XIrhqi3xAlvzvlorBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618243; c=relaxed/simple;
	bh=iDqLfYP5HgHzW47RjEJEG0uPxtFSJFH7h42H/Ju33P4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1hCTdlMnVhgX4/Blei8vQn4to5ySHY8v9JDqwRqEBH3dZ3qPJ6spIsJoRoNB4UV9qF55aqehQ653GoMuUPbnrVaUvbBUfagIHinA6jNlqJicyGPYwwIMhKqf06CEYZEkuVERyvRE+UJgUBMfBDnnrPLFzzT0boauiXKdzQNZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED895C4AF1D;
	Mon, 17 Jun 2024 09:57:21 +0000 (UTC)
Message-ID: <20c3243e-9bd4-457a-9b1d-d6c65cf31a58@xs4all.nl>
Date: Mon, 17 Jun 2024 11:57:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/26] media: mc: Maintain a list of open file handles
 in a media device
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-23-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240610100530.1107771-23-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/06/2024 12:05, Sakari Ailus wrote:
> The list of file handles is needed to deliver media events as well as for
> other purposes in the future.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-device.c  | 19 ++++++++++++++++++-
>  drivers/media/mc/mc-devnode.c |  2 +-
>  include/media/media-devnode.h |  4 +++-
>  3 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index a9505ab4412d..46d1b0c9d8be 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -45,8 +45,9 @@ static inline void __user *media_get_uptr(__u64 arg)
>  	return (void __user *)(uintptr_t)arg;
>  }
>  
> -static int media_device_open(struct file *filp)
> +static int media_device_open(struct media_devnode *devnode, struct file *filp)
>  {
> +	struct media_device *mdev = to_media_device(devnode);
>  	struct media_device_fh *fh;
>  
>  	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
> @@ -55,13 +56,23 @@ static int media_device_open(struct file *filp)
>  
>  	filp->private_data = &fh->fh;
>  
> +	spin_lock_irq(&mdev->fh_list_lock);
> +	list_add(&fh->mdev_list, &mdev->fh_list);
> +	spin_unlock_irq(&mdev->fh_list_lock);
> +
>  	return 0;
>  }
>  
>  static int media_device_close(struct file *filp)
>  {
> +	struct media_devnode *devnode = media_devnode_data(filp);
> +	struct media_device *mdev = to_media_device(devnode);
>  	struct media_device_fh *fh = media_device_fh(filp);
>  
> +	spin_lock_irq(&mdev->fh_list_lock);
> +	list_del(&fh->mdev_list);
> +	spin_unlock_irq(&mdev->fh_list_lock);
> +
>  	kfree(fh);
>  
>  	return 0;
> @@ -769,11 +780,13 @@ void media_device_init(struct media_device *mdev)
>  	INIT_LIST_HEAD(&mdev->pads);
>  	INIT_LIST_HEAD(&mdev->links);
>  	INIT_LIST_HEAD(&mdev->entity_notify);
> +	INIT_LIST_HEAD(&mdev->fh_list);
>  
>  	mutex_init(&mdev->req_queue_mutex);
>  	mutex_init(&mdev->graph_mutex);
>  	ida_init(&mdev->entity_internal_idx);
>  	atomic_set(&mdev->request_id, 0);
> +	spin_lock_init(&mdev->fh_list_lock);
>  
>  	mdev->devnode.release = media_device_release;
>  	media_devnode_init(&mdev->devnode);
> @@ -830,6 +843,10 @@ void media_device_unregister(struct media_device *mdev)
>  	if (!media_devnode_is_registered(&mdev->devnode))
>  		return;
>  
> +	spin_lock_irq(&mdev->fh_list_lock);
> +	list_del_init(&mdev->fh_list);
> +	spin_unlock_irq(&mdev->fh_list_lock);

Huh? This doesn't make sense to me. Unregistering the media device
makes no difference to the list of open filehandles.

> +
>  	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
>  	dev_dbg(mdev->dev, "Media device unregistering\n");
>  	media_devnode_unregister(&mdev->devnode);
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 26491daaba96..617156963911 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -154,7 +154,7 @@ static int media_open(struct inode *inode, struct file *filp)
>  	get_device(&devnode->dev);
>  	mutex_unlock(&media_devnode_lock);
>  
> -	ret = devnode->fops->open(filp);
> +	ret = devnode->fops->open(devnode, filp);
>  	if (ret) {
>  		put_device(&devnode->dev);
>  		return ret;
> diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
> index e4e8552598eb..898fa67ca090 100644
> --- a/include/media/media-devnode.h
> +++ b/include/media/media-devnode.h
> @@ -21,6 +21,8 @@
>  #include <linux/device.h>
>  #include <linux/cdev.h>
>  
> +struct media_devnode;
> +
>  /*
>   * Flag to mark the media_devnode struct as registered. Drivers must not touch
>   * this flag directly, it will be set and cleared by media_devnode_register and
> @@ -49,7 +51,7 @@ struct media_file_operations {
>  	__poll_t (*poll) (struct file *, struct poll_table_struct *);
>  	long (*ioctl) (struct file *, unsigned int, unsigned long);
>  	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
> -	int (*open) (struct file *);
> +	int (*open) (struct media_devnode *, struct file *);
>  	int (*release) (struct file *);
>  };
>  

Regards,

	Hans


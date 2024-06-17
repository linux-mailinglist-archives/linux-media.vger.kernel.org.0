Return-Path: <linux-media+bounces-13429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 075ED90AD60
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 13:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 956BB1C22C5A
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 11:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2E8194C64;
	Mon, 17 Jun 2024 11:54:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CB019308B
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 11:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718625252; cv=none; b=QIpHfL1DPe9/nfFbNvUme36zp2rXd5uKrpq4Ce6jhjyVAsJOeeADkp71otg56roxu52106vNYqkIki2c7f7QLJomvPpN0QK+u71n13vlezwpaz1QhrRIUwgmx8SbgqEG9Krgzv9t/BwlZuABLK9vZiffp1ktUAs3P1/nkcdb+rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718625252; c=relaxed/simple;
	bh=i76okCap6+i9z4masGVy2UEV3PK3JTQyBhkSplpUAGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NuWKPS8r8r03ShPL7s9rc5p96PTk+vWTq8gM2Z8cv5It/u7NH2H2yO4eeMfG/MYH61TpT2X2wsHqzFMRBop+DF7zrPgTsVgYM04utbs2Zom/qwHXN70MOE/7ftllTYRr3OuwDM32Bspjr3FxahW1+rT+pTTVobpDLNBFrB66s3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F1FC2BD10;
	Mon, 17 Jun 2024 11:54:11 +0000 (UTC)
Message-ID: <73be9671-ea7c-45e3-be0e-e02a7a28c949@xs4all.nl>
Date: Mon, 17 Jun 2024 13:54:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/26] media: mc: Implement best effort media device
 removal safety sans refcount
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-24-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240610100530.1107771-24-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 10/06/2024 12:05, Sakari Ailus wrote:
> Add a new helper data structures media_devnode_compat_ref and
> media_devnode_cdev. The latter is used to prevent user space from calling
> IOCTLs or other system calls to the media device that has been already
> unregistered and the former to help with obtaining the container struct
> (either media_devnode_compat_ref or media_devnode) in media_open().
> 
> The media device's memory may of course still be released during the call
> but there is only so much that can be done to this without the driver
> managing the lifetime of the resources it needs somehow.
> 
> This patch should be reverted once all drivers have been converted to manage
> their resources' lifetime.

I know we discussed this before, but I really have a very, very hard time
accepting this patch. It is so terribly *ugly*.

I re-read the discussion about this from the original v1 series back in early 2023.

As I understand it, the main reason for this is that this patch series
embeds the media_devnode into media_device (patch 05/26, Revert "[media] media-device:
dynamically allocate struct media_devnode").

While imperfect, that original patch solved a crash when an unregistered device
is still in use.

So you reverted that, fixed more issues and created a new way of keeping track
of who uses the media device and allow drivers to switch to cleaning up using
the media device release callback. All very nice.

But by no longer dynamically allocating media_devnode, now all drivers that are
not yet converted to the new method (i.e. pretty much all of them) will crash.

So you add this horrible hack by allocating a media_devnode_compat_ref containing
a struct cdev, so effectively reproducing the original situation where struct
media_devnode was allocated dynamically.

In other words, depending on the driver, the media code uses either one cdev
(embedded in media_device) or another (dynamically allocated).

It's crazy.

Why not keep media_devnode dynamically allocated? Does it block the new
media_device release mechanism somehow?

Once all drivers are converted to the new mechanism, then media_devnode can
be embedded directly, but until that time, just keep it as-is. I.e. you just
postpone that last step.

It also means that you do not need to keep track of open file handles, since
it is only used at the moment for this specific hack. I understand that it
is very likely needed in the future for media events, but let's add it then,
and not mix it up in this lifetime management series.

Most of this series looks really nice, but I truly believe that you need
to keep media_devnode dynamically allocated.

I tried hard to convince myself that this patch is OK, but it just can't
accept it.



> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-device.c       |  49 +++++++++---
>  drivers/media/mc/mc-devnode.c      | 118 ++++++++++++++++++++++-------
>  drivers/media/v4l2-core/v4l2-dev.c |  26 +++++--
>  include/media/media-device.h       |   8 +-
>  include/media/media-devnode.h      |  65 ++++++++++++++--
>  5 files changed, 210 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index 46d1b0c9d8be..8cdd0d46e865 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -54,6 +54,8 @@ static int media_device_open(struct media_devnode *devnode, struct file *filp)
>  	if (!fh)
>  		return -ENOMEM;
>  
> +	fh->fh.ref = devnode->ref;
> +
>  	filp->private_data = &fh->fh;
>  
>  	spin_lock_irq(&mdev->fh_list_lock);
> @@ -65,13 +67,16 @@ static int media_device_open(struct media_devnode *devnode, struct file *filp)
>  
>  static int media_device_close(struct file *filp)
>  {
> -	struct media_devnode *devnode = media_devnode_data(filp);
> -	struct media_device *mdev = to_media_device(devnode);
>  	struct media_device_fh *fh = media_device_fh(filp);
>  
> -	spin_lock_irq(&mdev->fh_list_lock);
> -	list_del(&fh->mdev_list);
> -	spin_unlock_irq(&mdev->fh_list_lock);
> +	if (!fh->fh.ref || atomic_read(&fh->fh.ref->registered)) {
> +		struct media_devnode *devnode = media_devnode_data(filp);
> +		struct media_device *mdev = to_media_device(devnode);
> +
> +		spin_lock_irq(&mdev->fh_list_lock);
> +		list_del(&fh->mdev_list);
> +		spin_unlock_irq(&mdev->fh_list_lock);
> +	}
>  
>  	kfree(fh);
>  
> @@ -810,28 +815,45 @@ EXPORT_SYMBOL_GPL(media_device_cleanup);
>  int __must_check __media_device_register(struct media_device *mdev,
>  					 struct module *owner)
>  {
> +	struct media_devnode_compat_ref *ref = NULL;
>  	int ret;
>  
> +	if (!mdev->ops || !mdev->ops->release) {
> +		ref = kzalloc(sizeof(*mdev->devnode.ref), GFP_KERNEL);
> +		if (!ref)
> +			return -ENOMEM;
> +	}
> +
>  	/* Register the device node. */
>  	mdev->devnode.fops = &media_device_fops;
>  	mdev->devnode.parent = mdev->dev;
> +	mdev->devnode.ref = ref;
>  
>  	/* Set version 0 to indicate user-space that the graph is static */
>  	mdev->topology_version = 0;
>  
>  	ret = media_devnode_register(&mdev->devnode, owner);
>  	if (ret < 0)
> -		return ret;
> +		goto out_put_ref;
> +
> +	ret = device_create_file(media_devnode_dev(&mdev->devnode),
> +				 &dev_attr_model);
> +	if (ret < 0)
> +		goto out_devnode_unregister;
>  
> -	ret = device_create_file(&mdev->devnode.dev, &dev_attr_model);
> -	if (ret < 0) {
> -		media_devnode_unregister(&mdev->devnode);
> -		return ret;
> -	}
>  
>  	dev_dbg(mdev->dev, "Media device registered\n");
>  
>  	return 0;
> +
> +out_devnode_unregister:
> +	media_devnode_unregister(&mdev->devnode);
> +
> +out_put_ref:
> +	if (ref)
> +		put_device(&ref->dev);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(__media_device_register);
>  
> @@ -847,9 +869,12 @@ void media_device_unregister(struct media_device *mdev)
>  	list_del_init(&mdev->fh_list);
>  	spin_unlock_irq(&mdev->fh_list_lock);
>  
> -	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
> +	device_remove_file(media_devnode_dev(&mdev->devnode), &dev_attr_model);
>  	dev_dbg(mdev->dev, "Media device unregistering\n");
>  	media_devnode_unregister(&mdev->devnode);
> +
> +	if (mdev->devnode.ref)
> +		put_device(&mdev->devnode.ref->dev);
>  }
>  EXPORT_SYMBOL_GPL(media_device_unregister);
>  
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 617156963911..8cb4e0eec17f 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -49,24 +49,52 @@ static void media_devnode_release(struct device *cd)
>  {
>  	struct media_devnode *devnode = to_media_devnode(cd);
>  
> +	/* If the devnode has a ref, it is simply released by the user. */

"the user"? You mean "the refcount's release function"?

> +	if (devnode->ref)
> +		return;
> +
>  	/* Release media_devnode and perform other cleanups as needed. */
>  	if (devnode->release)
>  		devnode->release(devnode);
>  }
>  
> +static void media_devnode_ref_release(struct device *cd)
> +{
> +	struct media_devnode_compat_ref *ref =
> +		container_of_const(cd, struct media_devnode_compat_ref, dev);
> +
> +	kfree(ref);
> +}
> +
> +struct media_devnode *to_media_devnode(struct device *dev)
> +{
> +	if (dev->release == media_devnode_release)
> +		return container_of(dev, struct media_devnode, dev);
> +
> +	return container_of(dev, struct media_devnode_compat_ref, dev)->devnode;
> +}
> +
>  static const struct bus_type media_bus_type = {
>  	.name = MEDIA_NAME,
>  };
>  
> +static bool media_devnode_is_registered_compat(struct media_devnode_fh *fh)
> +{
> +	if (fh->ref)
> +		return atomic_read(&fh->ref->registered);
> +
> +	return media_devnode_is_registered(fh->devnode);
> +}
> +
>  static ssize_t media_read(struct file *filp, char __user *buf,
>  		size_t sz, loff_t *off)
>  {
>  	struct media_devnode *devnode = media_devnode_data(filp);
>  
> +	if (!media_devnode_is_registered_compat(filp->private_data))
> +		return -EIO;
>  	if (!devnode->fops->read)
>  		return -EINVAL;
> -	if (!media_devnode_is_registered(devnode))
> -		return -EIO;
>  	return devnode->fops->read(filp, buf, sz, off);
>  }
>  
> @@ -75,10 +103,10 @@ static ssize_t media_write(struct file *filp, const char __user *buf,
>  {
>  	struct media_devnode *devnode = media_devnode_data(filp);
>  
> +	if (!media_devnode_is_registered_compat(filp->private_data))
> +		return -EIO;
>  	if (!devnode->fops->write)
>  		return -EINVAL;
> -	if (!media_devnode_is_registered(devnode))
> -		return -EIO;
>  	return devnode->fops->write(filp, buf, sz, off);
>  }
>  
> @@ -87,7 +115,7 @@ static __poll_t media_poll(struct file *filp,
>  {
>  	struct media_devnode *devnode = media_devnode_data(filp);
>  
> -	if (!media_devnode_is_registered(devnode))
> +	if (!media_devnode_is_registered_compat(filp->private_data))
>  		return EPOLLERR | EPOLLHUP;
>  	if (!devnode->fops->poll)
>  		return DEFAULT_POLLMASK;
> @@ -99,14 +127,9 @@ __media_ioctl(struct file *filp, unsigned int cmd, unsigned long arg,
>  	      long (*ioctl_func)(struct file *filp, unsigned int cmd,
>  				 unsigned long arg))
>  {
> -	struct media_devnode *devnode = media_devnode_data(filp);
> -
>  	if (!ioctl_func)
>  		return -ENOTTY;
>  
> -	if (!media_devnode_is_registered(devnode))
> -		return -EIO;
> -
>  	return ioctl_func(filp, cmd, arg);
>  }
>  
> @@ -114,6 +137,9 @@ static long media_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>  	struct media_devnode *devnode = media_devnode_data(filp);
>  
> +	if (!media_devnode_is_registered_compat(filp->private_data))
> +		return -EIO;
> +
>  	return __media_ioctl(filp, cmd, arg, devnode->fops->ioctl);
>  }
>  
> @@ -124,6 +150,9 @@ static long media_compat_ioctl(struct file *filp, unsigned int cmd,
>  {
>  	struct media_devnode *devnode = media_devnode_data(filp);
>  
> +	if (!media_devnode_is_registered_compat(filp->private_data))
> +		return -EIO;
> +
>  	return __media_ioctl(filp, cmd, arg, devnode->fops->compat_ioctl);
>  }
>  
> @@ -132,6 +161,7 @@ static long media_compat_ioctl(struct file *filp, unsigned int cmd,
>  /* Override for the open function */
>  static int media_open(struct inode *inode, struct file *filp)
>  {
> +	struct media_devnode_cdev *mcdev;
>  	struct media_devnode *devnode;
>  	struct media_devnode_fh *fh;
>  	int ret;
> @@ -143,7 +173,12 @@ static int media_open(struct inode *inode, struct file *filp)
>  	 * a crash.
>  	 */
>  	mutex_lock(&media_devnode_lock);
> -	devnode = container_of(inode->i_cdev, struct media_devnode, cdev);
> +	mcdev = container_of(inode->i_cdev, struct media_devnode_cdev, cdev);
> +	if (mcdev->is_compat_ref)
> +		devnode = container_of(mcdev, struct media_devnode_compat_ref,
> +				       mcdev)->devnode;
> +	else
> +		devnode = container_of(mcdev, struct media_devnode, mcdev);
>  	/* return ENXIO if the media device has been removed
>  	   already or if it is not registered anymore. */
>  	if (!media_devnode_is_registered(devnode)) {
> @@ -151,12 +186,12 @@ static int media_open(struct inode *inode, struct file *filp)
>  		return -ENXIO;
>  	}
>  	/* and increase the device refcount */
> -	get_device(&devnode->dev);
> +	get_device(media_devnode_dev(devnode));
>  	mutex_unlock(&media_devnode_lock);
>  
>  	ret = devnode->fops->open(devnode, filp);
>  	if (ret) {
> -		put_device(&devnode->dev);
> +		put_device(media_devnode_dev(devnode));
>  		return ret;
>  	}
>  
> @@ -169,15 +204,21 @@ static int media_open(struct inode *inode, struct file *filp)
>  /* Override for the release function */
>  static int media_release(struct inode *inode, struct file *filp)
>  {
> -	struct media_devnode *devnode = media_devnode_data(filp);
> -
> -	devnode->fops->release(filp);
> +	struct media_devnode_fh *fh = filp->private_data;
> +	struct device *dev;
> +
> +	if (!fh->ref) {
> +		dev = &fh->devnode->dev;
> +		fh->devnode->fops->release(filp);
> +	} else {
> +		dev = &fh->ref->dev;
> +		fh->ref->release(filp);
> +	}
>  
>  	filp->private_data = NULL;
>  
> -	/* decrease the refcount unconditionally since the release()
> -	   return value is ignored. */
> -	put_device(&devnode->dev);
> +	put_device(dev);
> +
>  	return 0;
>  }
>  
> @@ -204,6 +245,9 @@ void media_devnode_init(struct media_devnode *devnode)
>  int __must_check media_devnode_register(struct media_devnode *devnode,
>  					struct module *owner)
>  {
> +	struct media_devnode_compat_ref *ref = devnode->ref;
> +	struct cdev *cdev;
> +	struct device *dev;
>  	int minor;
>  	int ret;
>  
> @@ -222,19 +266,31 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
>  	devnode->minor = minor;
>  
>  	/* Part 2: Initialize the media and character devices */
> -	cdev_init(&devnode->cdev, &media_devnode_fops);
> -	devnode->cdev.owner = owner;
> -	kobject_set_name(&devnode->cdev.kobj, "media%d", devnode->minor);
> -
> -	devnode->dev.bus = &media_bus_type;
> -	devnode->dev.devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
> +	cdev = ref ? &ref->mcdev.cdev : &devnode->mcdev.cdev;
> +	cdev_init(cdev, &media_devnode_fops);
> +	cdev->owner = owner;
> +	kobject_set_name(&cdev->kobj, "media%d", devnode->minor);
> +
> +	if (!ref) {
> +		dev = &devnode->dev;
> +	} else {
> +		ref->mcdev.is_compat_ref = true;
> +		device_initialize(&ref->dev);
> +		atomic_set(&ref->registered, 1);
> +		ref->devnode = devnode;
> +		ref->release = devnode->fops->release;
> +		dev = &ref->dev;
> +		dev->release = media_devnode_ref_release;
> +	}
> +	dev->bus = &media_bus_type;
> +	dev->devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
>  	if (devnode->parent)
> -		devnode->dev.parent = devnode->parent;
> -	dev_set_name(&devnode->dev, "media%d", devnode->minor);
> +		dev->parent = devnode->parent;
> +	dev_set_name(dev, "media%d", devnode->minor);
>  
>  	/* Part 3: Add the media and character devices */
>  	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
> -	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
> +	ret = cdev_device_add(cdev, dev);
>  	if (ret < 0) {
>  		pr_err("%s: cdev_device_add failed\n", __func__);
>  		goto cdev_add_error;
> @@ -256,11 +312,15 @@ void media_devnode_unregister(struct media_devnode *devnode)
>  	if (!media_devnode_is_registered(devnode))
>  		return;
>  
> +	if (devnode->ref)
> +		atomic_set(&devnode->ref->registered, 0);
> +
>  	mutex_lock(&media_devnode_lock);
>  	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
>  	mutex_unlock(&media_devnode_lock);
>  
> -	cdev_device_del(&devnode->cdev, &devnode->dev);
> +	cdev_device_del(devnode->ref ? &devnode->ref->mcdev.cdev :
> +			&devnode->mcdev.cdev, media_devnode_dev(devnode));
>  
>  	mutex_lock(&media_devnode_lock);
>  	clear_bit(devnode->minor, media_devnode_nums);
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 4bf4398fd2fe..2b19a845c3a4 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -179,7 +179,7 @@ static void v4l2_device_release(struct device *cd)
>  	bool v4l2_dev_call_release = v4l2_dev->release;
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	struct media_device *mdev = v4l2_dev->mdev;
> -	bool mdev_has_release = mdev && mdev->ops && mdev->ops->release;
> +	bool mdev_has_ref = mdev && mdev->devnode.ref;
>  #endif
>  
>  	mutex_lock(&videodev_lock);
> @@ -212,12 +212,24 @@ static void v4l2_device_release(struct device *cd)
>  	}
>  #endif
>  
> -	/* Release video_device and perform other
> -	   cleanups as needed. */
> +	/*
> +	 * Put struct media_devnode_compat_ref here as indicated by
> +	 * mdev_has_ref. mdev may be released by vdev->release() below.
> +	 */
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	if (mdev && mdev_has_ref)
> +		media_device_put(mdev);
> +#endif
> +
> +	/* Release video_device and perform other cleanups as needed. */
>  	vdev->release(vdev);
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
> -	if (mdev)
> +	/*
> +	 * Put a reference to struct media_device acquired in
> +	 * video_register_media_controller().
> +	 */
> +	if (mdev && !mdev_has_ref)
>  		media_device_put(mdev);
>  
>  	/*
> @@ -225,13 +237,15 @@ static void v4l2_device_release(struct device *cd)
>  	 * embedded in the same driver's context struct so having a release
>  	 * callback in both is a bug.
>  	 */
> -	if (WARN_ON(v4l2_dev_call_release && mdev_has_release))
> +	if (WARN_ON(v4l2_dev_call_release && !mdev_has_ref))
>  		v4l2_dev_call_release = false;
>  #endif
>  
>  	/*
>  	 * Decrease v4l2_device refcount, but only if the media device doesn't
> -	 * have a release callback.
> +	 * have a release callback. Otherwise one could expect accessing
> +	 * released memory --- driver's context struct refcounted already via
> +	 * struct media_device.
>  	 */
>  	if (v4l2_dev_call_release)
>  		v4l2_device_put(v4l2_dev);
> diff --git a/include/media/media-device.h b/include/media/media-device.h
> index f9f7c37e7d57..30f9b78d1ce7 100644
> --- a/include/media/media-device.h
> +++ b/include/media/media-device.h
> @@ -259,10 +259,10 @@ static inline void media_device_put(struct media_device *mdev)
>   *
>   * @mdev:	pointer to struct &media_device
>   *
> - * This function that will destroy the graph_mutex that is initialized in
> - * media_device_init(). Note that *only* drivers that do not manage releasing
> - * the memory of th media device itself call this function. This function is
> - * thus effectively DEPRECATED.
> + * This function will destroy the graph_mutex that is initialized in
> + * media_device_init(). Note that only drivers that do not have a proper release
> + * callback of the struct media_device call this function. This function is thus
> + * effectively DEPRECATED.
>   */
>  void media_device_cleanup(struct media_device *mdev);
>  
> diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
> index 898fa67ca090..5dee1acbc3f7 100644
> --- a/include/media/media-devnode.h
> +++ b/include/media/media-devnode.h
> @@ -41,8 +41,7 @@ struct media_devnode;
>   * @compat_ioctl: pointer to the function that will handle 32 bits userspace
>   *	calls to the ioctl() syscall on a Kernel compiled with 64 bits.
>   * @open: pointer to the function that implements open() syscall
> - * @release: pointer to the function that will release the resources allocated
> - *	by the @open function.
> + * @release: pointer to the function that implements release() syscall
>   */
>  struct media_file_operations {
>  	struct module *owner;
> @@ -55,9 +54,54 @@ struct media_file_operations {
>  	int (*release) (struct file *);
>  };
>  
> +/**
> + * struct media_devnode_cdev - Workaround for drivers not managing media device
> + *			       lifetime - character device
> + *
> + * Store the characeter device and whether this is a compatibility reference or
> + * not. struct media_devnode_cdev is embedded in either struct
> + * media_devnode_compat_ref or struct media_devnode.
> + *
> + * @cdev: the chracter device
> + * @is_compat_ref: Is this a compatibility reference or not?
> + */
> +struct media_devnode_cdev {
> +	struct cdev cdev;
> +	bool is_compat_ref;
> +};
> +
> +/**
> + * struct media_devnode_compat_ref - Workaround for drivers not managing media
> + *				     device lifetime - reference
> + *
> + * The purpose if this struct is to support drivers that do not manage the
> + * lifetime of their respective media devices to avoid the worst effects of
> + * this, namely an IOCTL call on an open file handle to a device that has been
> + * unbound causing a kernel oops systematically. This is not a fix. The proper,
> + * reliable way to handle this is to manage the resources used by the
> + * driver. This struct and its use can be removed once all drivers have been
> + * converted.
> + *
> + * @dev: struct device that remains in place as long as any reference remains
> + * @mcdev: the related character device
> + * @devnode: a pointer back to the devnode
> + * @release:	pointer to the function that will release the resources
> + *		allocated by the @open function.
> + * @registered: is this device registered?
> + */
> +struct media_devnode_compat_ref {
> +	struct device dev;
> +	struct media_devnode_cdev mcdev;
> +	struct media_devnode *devnode;
> +	int (*release)(struct file *);
> +	atomic_t registered;
> +};
> +
>  /**
>   * struct media_devnode_fh - Media device node file handle
>   * @devnode:	pointer to the media device node
> + * @ref:	media device compat ref, if the driver does not manage media
> + *		device lifetime
>   *
>   * This structure serves as a base for per-file-handle data storage. Media
>   * device node users embed media_devnode_fh in their custom file handle data
> @@ -67,18 +111,21 @@ struct media_file_operations {
>   */
>  struct media_devnode_fh {
>  	struct media_devnode *devnode;
> +	struct media_devnode_compat_ref *ref;
>  };
>  
>  /**
>   * struct media_devnode - Media device node
>   * @fops:	pointer to struct &media_file_operations with media device ops
>   * @dev:	pointer to struct &device containing the media controller device
> - * @cdev:	struct cdev pointer character device
> + * @mcdev:	related to the character device
>   * @parent:	parent device
>   * @minor:	device node minor number
>   * @flags:	flags, combination of the ``MEDIA_FLAG_*`` constants
>   * @release:	release callback called at the end of ``media_devnode_release()``
>   *		routine at media-device.c.
> + * @ref:	reference for providing best effort memory safety in device
> + *		removal
>   *
>   * This structure represents a media-related device node.
>   *
> @@ -91,7 +138,7 @@ struct media_devnode {
>  
>  	/* sysfs */
>  	struct device dev;		/* media device */
> -	struct cdev cdev;		/* character device */
> +	struct media_devnode_cdev mcdev; /* character device + compat status */
>  	struct device *parent;		/* device parent */
>  
>  	/* device info */
> @@ -100,10 +147,18 @@ struct media_devnode {
>  
>  	/* callbacks */
>  	void (*release)(struct media_devnode *devnode);
> +
> +	/* compat reference */
> +	struct media_devnode_compat_ref *ref;
>  };
>  
> +static inline struct device *media_devnode_dev(struct media_devnode *devnode)
> +{
> +	return devnode->ref ? &devnode->ref->dev : &devnode->dev;
> +}
> +
>  /* dev to media_devnode */
> -#define to_media_devnode(cd) container_of(cd, struct media_devnode, dev)
> +struct media_devnode *to_media_devnode(struct device *dev);
>  
>  /**
>   * media_devnode_init - initialise a media devnode

Regards,

	Hans


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715CD6A92BB
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 09:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjCCIkH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 03:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbjCCIjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 03:39:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1DD2117
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 00:39:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F189F6179A
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 08:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE190C433D2;
        Fri,  3 Mar 2023 08:39:47 +0000 (UTC)
Message-ID: <a3a8c0ec-f13e-2473-78d6-f454790467be@xs4all.nl>
Date:   Fri, 3 Mar 2023 09:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 25/26] media: Implement best effort media device removal
 safety sans refcounting
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
 <20230201214535.347075-26-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230201214535.347075-26-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/02/2023 22:45, Sakari Ailus wrote:
> Add a new helper data structure media_devnode_compat_ref, which is used to
> prevent user space from calling IOCTLs or other system calls to the media
> device that has been already unregistered.
> 
> The media device's memory may of course still be released during the call
> but there is only so much that can be done to this without the driver
> managing the lifetime of the resources it needs somehow.
> 
> This patch should be reverted once all drivers have been converted to manage
> their resources' lifetime.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-device.c  | 60 ++++++++++++++++++++++++++++++-----
>  drivers/media/mc/mc-devnode.c | 21 ++++++++----
>  include/media/media-devnode.h | 29 +++++++++++++++++
>  3 files changed, 96 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index 3a1db5fdbba7..22fdaa6370ea 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -45,18 +45,34 @@ static inline void __user *media_get_uptr(__u64 arg)
>  	return (void __user *)(uintptr_t)arg;
>  }
>  
> +static void compat_ref_release(struct kref *kref)
> +{
> +	struct media_devnode_compat_ref *ref =
> +		container_of_const(kref, struct media_devnode_compat_ref, kref);
> +
> +	kfree(ref);
> +}
> +
>  static int media_device_open(struct media_devnode *devnode, struct file *filp)
>  {
>  	struct media_device *mdev = to_media_device(devnode);
>  	struct media_device_fh *fh;
>  	unsigned long flags;
>  
> +	if (devnode->ref && (!atomic_read(&devnode->ref->registered) ||
> +			     !kref_get_unless_zero(&devnode->ref->kref)))
> +		return -ENXIO;
> +

This seems pointless: if the media device is unregistered, then the device
node disappears and it can't be opened anymore.

I'm confused by this patch in general: when media_device_unregister() is called,
it is no longer possible to call ioctls and basically do anything except close
the open fh.

So what am I missing here? It all looks odd.

Regards,

	Hans

>  	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
> -	if (!fh)
> +	if (!fh) {
> +		if (devnode->ref)
> +			kref_put(&devnode->ref->kref, compat_ref_release);
>  		return -ENOMEM;
> +	}
>  
> -	filp->private_data = &fh->fh;
> +	fh->fh.ref = devnode->ref;
>  
> +	filp->private_data = &fh->fh;
>  	spin_lock_irqsave(&mdev->fh_list_lock, flags);
>  	list_add(&fh->mdev_list, &mdev->fh_list);
>  	spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
> @@ -71,9 +87,14 @@ static int media_device_close(struct file *filp)
>  	struct media_device_fh *fh = media_device_fh(filp);
>  	unsigned long flags;
>  
> -	spin_lock_irqsave(&mdev->fh_list_lock, flags);
> -	list_del(&fh->mdev_list);
> -	spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
> +	if (!fh->fh.ref || atomic_read(&fh->fh.ref->registered)) {
> +		spin_lock_irqsave(&mdev->fh_list_lock, flags);
> +		list_del(&fh->mdev_list);
> +		spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
> +	}
> +
> +	if (fh->fh.ref)
> +		kref_put(&fh->fh.ref->kref, compat_ref_release);
>  
>  	kfree(fh);
>  
> @@ -816,6 +837,8 @@ EXPORT_SYMBOL_GPL(media_device_init);
>  
>  void media_device_cleanup(struct media_device *mdev)
>  {
> +	if (mdev->devnode.ref)
> +		kref_put(&mdev->devnode.ref->kref, compat_ref_release);
>  	__media_device_release(mdev);
>  	media_device_put(mdev);
>  }
> @@ -824,6 +847,7 @@ EXPORT_SYMBOL_GPL(media_device_cleanup);
>  int __must_check __media_device_register(struct media_device *mdev,
>  					 struct module *owner)
>  {
> +	struct media_devnode_compat_ref *ref = NULL;
>  	int ret;
>  
>  	/* Register the device node. */
> @@ -833,19 +857,39 @@ int __must_check __media_device_register(struct media_device *mdev,
>  	/* Set version 0 to indicate user-space that the graph is static */
>  	mdev->topology_version = 0;
>  
> +	if (!mdev->ops || !mdev->ops->release) {
> +		ref = kzalloc(sizeof(*mdev->devnode.ref), GFP_KERNEL);
> +		if (!ref)
> +			return -ENOMEM;
> +
> +		kref_init(&ref->kref);
> +		atomic_set(&ref->registered, 1);
> +		mdev->devnode.ref = ref;
> +	}
> +
>  	ret = media_devnode_register(&mdev->devnode, owner);
>  	if (ret < 0)
> -		return ret;
> +		goto err_release_ref;
>  
>  	ret = device_create_file(&mdev->devnode.dev, &dev_attr_model);
>  	if (ret < 0) {
> -		media_devnode_unregister(&mdev->devnode);
> -		return ret;
> +		goto err_devnode_unregister;
>  	}
>  
>  	dev_dbg(mdev->dev, "Media device registered\n");
>  
>  	return 0;
> +
> +err_devnode_unregister:
> +	media_devnode_unregister(&mdev->devnode);
> +
> +err_release_ref:
> +	if (ref) {
> +		kref_put(&ref->kref, compat_ref_release);
> +		mdev->devnode.ref = NULL;
> +	}
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(__media_device_register);
>  
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 760314dd22e1..f2cb3617df02 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -65,6 +65,14 @@ static struct bus_type media_bus_type = {
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
> @@ -72,7 +80,7 @@ static ssize_t media_read(struct file *filp, char __user *buf,
>  
>  	if (!devnode->fops->read)
>  		return -EINVAL;
> -	if (!media_devnode_is_registered(devnode))
> +	if (!media_devnode_is_registered_compat(filp->private_data))
>  		return -EIO;
>  	return devnode->fops->read(filp, buf, sz, off);
>  }
> @@ -84,7 +92,7 @@ static ssize_t media_write(struct file *filp, const char __user *buf,
>  
>  	if (!devnode->fops->write)
>  		return -EINVAL;
> -	if (!media_devnode_is_registered(devnode))
> +	if (!media_devnode_is_registered_compat(filp->private_data))
>  		return -EIO;
>  	return devnode->fops->write(filp, buf, sz, off);
>  }
> @@ -94,7 +102,7 @@ static __poll_t media_poll(struct file *filp,
>  {
>  	struct media_devnode *devnode = media_devnode_data(filp);
>  
> -	if (!media_devnode_is_registered(devnode))
> +	if (!media_devnode_is_registered_compat(filp->private_data))
>  		return EPOLLERR | EPOLLHUP;
>  	if (!devnode->fops->poll)
>  		return DEFAULT_POLLMASK;
> @@ -106,12 +114,10 @@ __media_ioctl(struct file *filp, unsigned int cmd, unsigned long arg,
>  	      long (*ioctl_func)(struct file *filp, unsigned int cmd,
>  				 unsigned long arg))
>  {
> -	struct media_devnode *devnode = media_devnode_data(filp);
> -
>  	if (!ioctl_func)
>  		return -ENOTTY;
>  
> -	if (!media_devnode_is_registered(devnode))
> +	if (!media_devnode_is_registered_compat(filp->private_data))
>  		return -EIO;
>  
>  	return ioctl_func(filp, cmd, arg);
> @@ -265,6 +271,9 @@ void media_devnode_unregister(struct media_devnode *devnode)
>  	if (!media_devnode_is_registered(devnode))
>  		return;
>  
> +	if (devnode->ref)
> +		atomic_set(&devnode->ref->registered, 0);
> +
>  	mutex_lock(&media_devnode_lock);
>  	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
>  	mutex_unlock(&media_devnode_lock);
> diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
> index d21c13829072..9ea55c53e5cb 100644
> --- a/include/media/media-devnode.h
> +++ b/include/media/media-devnode.h
> @@ -20,6 +20,7 @@
>  #include <linux/fs.h>
>  #include <linux/device.h>
>  #include <linux/cdev.h>
> +#include <linux/kref.h>
>  
>  struct media_devnode;
>  
> @@ -55,9 +56,31 @@ struct media_file_operations {
>  	int (*release) (struct file *);
>  };
>  
> +/**
> + * struct media_devnode_compat_ref - Workaround for drivers not managing media
> + *				     device lifetime
> + *
> + * The purpose if this struct is to support drivers that do not manage the
> + * lifetime of their respective media devices to avoid the worst effects of
> + * this, namely an IOCTL call on an open file handle to a device that has been
> + * unbound causing a kernel oops systematically. This is not a fix, the proper,
> + * reliable way to handle this is to manage the resources used by the
> + * driver. This struct and its use can be removed once all drivers have been
> + * converted.
> + *
> + * @kref: kref for the memory of this struct
> + * @registered: is this device registered?
> + */
> +struct media_devnode_compat_ref {
> +	struct kref kref;
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
> @@ -67,6 +90,7 @@ struct media_file_operations {
>   */
>  struct media_devnode_fh {
>  	struct media_devnode *devnode;
> +	struct media_devnode_compat_ref *ref;
>  };
>  
>  /**
> @@ -80,6 +104,8 @@ struct media_devnode_fh {
>   * @flags:	flags, combination of the ``MEDIA_FLAG_*`` constants
>   * @release:	release callback called at the end of ``media_devnode_release()``
>   *		routine at media-device.c.
> + * @ref:	reference for providing best effort system call safety in device
> + *		removal
>   *
>   * This structure represents a media-related device node.
>   *
> @@ -101,6 +127,9 @@ struct media_devnode {
>  
>  	/* callbacks */
>  	void (*release)(struct media_devnode *devnode);
> +
> +	/* compat reference */
> +	struct media_devnode_compat_ref *ref;
>  };
>  
>  /* dev to media_devnode */


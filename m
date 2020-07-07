Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9BD2176E1
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 20:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgGGShT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 14:37:19 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:19185 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728238AbgGGShT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 14:37:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f04c0d20000>; Tue, 07 Jul 2020 11:37:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Jul 2020 11:37:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Jul 2020 11:37:18 -0700
Received: from [10.2.173.217] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jul
 2020 18:37:18 +0000
Subject: Re: [RFC PATCH] v4l2-dev: split video_register_device into
 v4l2_vdev_init & _register
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <f16b8511-a21e-1c56-7271-b1768dcb2a93@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <fe821588-4307-cef4-a9db-cf74e0aefe97@nvidia.com>
Date:   Tue, 7 Jul 2020 11:37:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f16b8511-a21e-1c56-7271-b1768dcb2a93@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594147026; bh=alagb5MqOTi7QYboU3UlLt35s3e+naWgbL2zpNqlH8w=;
        h=X-PGP-Universal:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=bAeKV0Ctez7JXSlXBsM1FJ4i6WHcsu9IF8yJFUety1E+j62hsUqX8rgkxx5/Co1N1
         nVQ275pEnLJQXuvXXfOb5G8xuHGmodYJ20qUjvtUxOC9ZDmGEN8/tiSxa/ngluB3FO
         ZtIUgUoZLc3KjdterM0p2UxwAB0lXRRnoyOV7Jge1OGgwGEQkIPeHLGX/NymyK6uZC
         fS/3s059sUUZ4SRyS8rCi6SOxBnXhred8zIseF3bfzfv+/gCjfT9CLfPUlDrQfcbXs
         4O+5dJysdl6+cezhAK55gcuIbzUO+t37V8Ky7lJcTv3WXhVKemwlvFgxtyiuQu9B9h
         /rZriwvf1TphA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/7/20 8:23 AM, Hans Verkuil wrote:
> Especially for more complex devices you often want to postpone creating
> device nodes until everything has been initialized.
>
> However, video_register_device both initializes and registers the video
> device, and it is not possible to do this in two stages.
>
> This patch creates thee new functions: v4l2_vdev_init(), v4l2_vdev_uninit()
> and v4l2_vdev_register().
>
> The existing __video_register_device() function now just calls those two
> new functions.
>
> Drivers can replace video_register_device() by this two-stage call sequence,
> and so postpone the actual device node registration until the very end.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> This is just a proof of concept, in part because of problems that Sowjanya
> experiences with the tegra-video driver. I'm not at all sure about the
> naming convention, I just know that I would like to move to a proper
> v4l2_<foo>_init/uninit/register/unregister naming, as is done everywhere else.
>
> See: https://lore.kernel.org/patchwork/patch/1257372/ for the tegra discussion.
>
> Sowjanya, can you test this patch?
>
> Regards,
>
> 	Hans

Hi Hans,

With this patch, updated on Tegra video driver side to do 
v4l2_vdev_init() and then create media links along with ctrl handler 
setup by retrieving subdev through media remote pads and in the last did 
v4l2_vdev_register(). This works fine.

Should I wait for this split patch to be merged before I use these new 
API's?

Thanks

Sowjanya

> ---
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index a593ea0598b5..a81ea5b01f12 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -873,10 +873,9 @@ static int video_register_media_controller(struct video_device *vdev)
>   	return 0;
>   }
>
> -int __video_register_device(struct video_device *vdev,
> -			    enum vfl_devnode_type type,
> -			    int nr, int warn_if_nr_in_use,
> -			    struct module *owner)
> +int v4l2_vdev_init(struct video_device *vdev,
> +		   enum vfl_devnode_type type,
> +		   int nr, int warn_if_nr_in_use)
>   {
>   	int i = 0;
>   	int ret;
> @@ -1009,7 +1008,68 @@ int __video_register_device(struct video_device *vdev,
>   	if (vdev->ioctl_ops)
>   		determine_valid_ioctls(vdev);
>
> -	/* Part 3: Initialize the character device */
> +	/* Part 3: initialize vdev->dev */
> +	vdev->dev.class = &video_class;
> +	vdev->dev.devt = MKDEV(VIDEO_MAJOR, vdev->minor);
> +	vdev->dev.parent = vdev->dev_parent;
> +	dev_set_name(&vdev->dev, "%s%d", name_base, vdev->num);
> +	/* Register the release callback that will be called when the last
> +	   reference to the device goes away. */
> +	vdev->dev.release = v4l2_device_release;
> +
> +	if (nr != -1 && nr != vdev->num && warn_if_nr_in_use)
> +		pr_warn("%s: requested %s%d, got %s\n", __func__,
> +			name_base, nr, video_device_node_name(vdev));
> +
> +	/* Part 4: Register the entity. */
> +	ret = video_register_media_controller(vdev);
> +	if (ret)
> +		goto cleanup;
> +
> +	/* Part 5: mark as initialized. */
> +	set_bit(V4L2_FL_INITIALIZED, &vdev->flags);
> +
> +	return 0;
> +
> +cleanup:
> +	mutex_lock(&videodev_lock);
> +	video_devices[vdev->minor] = NULL;
> +	devnode_clear(vdev);
> +	mutex_unlock(&videodev_lock);
> +	/* Mark this video device as never having been registered. */
> +	vdev->minor = -1;
> +	return ret;
> +}
> +EXPORT_SYMBOL(v4l2_vdev_init);
> +
> +void v4l2_vdev_uninit(struct video_device *vdev)
> +{
> +	mutex_lock(&videodev_lock);
> +	clear_bit(V4L2_FL_INITIALIZED, &vdev->flags);
> +	video_devices[vdev->minor] = NULL;
> +	devnode_clear(vdev);
> +	mutex_unlock(&videodev_lock);
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	if (vdev->v4l2_dev->mdev && vdev->vfl_dir != VFL_DIR_M2M) {
> +		/* Remove interfaces and interface links */
> +		media_devnode_remove(vdev->intf_devnode);
> +		if (vdev->entity.function != MEDIA_ENT_F_UNKNOWN)
> +			media_device_unregister_entity(&vdev->entity);
> +	}
> +#endif
> +	/* Mark this video device as never having been registered. */
> +	vdev->minor = -1;
> +}
> +EXPORT_SYMBOL(v4l2_vdev_uninit);
> +
> +int v4l2_vdev_register(struct video_device *vdev, struct module *owner)
> +{
> +	int ret;
> +
> +	if (WARN_ON(!test_bit(V4L2_FL_INITIALIZED, &vdev->flags)))
> +		return -EINVAL;
> +
> +	/* Part 1: Initialize the character device */
>   	vdev->cdev = cdev_alloc();
>   	if (vdev->cdev == NULL) {
>   		ret = -ENOMEM;
> @@ -1025,11 +1085,7 @@ int __video_register_device(struct video_device *vdev,
>   		goto cleanup;
>   	}
>
> -	/* Part 4: register the device with sysfs */
> -	vdev->dev.class = &video_class;
> -	vdev->dev.devt = MKDEV(VIDEO_MAJOR, vdev->minor);
> -	vdev->dev.parent = vdev->dev_parent;
> -	dev_set_name(&vdev->dev, "%s%d", name_base, vdev->num);
> +	/* Part 2: register the device with sysfs */
>   	ret = device_register(&vdev->dev);
>   	if (ret < 0) {
>   		pr_err("%s: device_register failed\n", __func__);
> @@ -1039,17 +1095,10 @@ int __video_register_device(struct video_device *vdev,
>   	   reference to the device goes away. */
>   	vdev->dev.release = v4l2_device_release;
>
> -	if (nr != -1 && nr != vdev->num && warn_if_nr_in_use)
> -		pr_warn("%s: requested %s%d, got %s\n", __func__,
> -			name_base, nr, video_device_node_name(vdev));
> -
>   	/* Increase v4l2_device refcount */
>   	v4l2_device_get(vdev->v4l2_dev);
>
> -	/* Part 5: Register the entity. */
> -	ret = video_register_media_controller(vdev);
> -
> -	/* Part 6: Activate this minor. The char device can now be used. */
> +	/* Part 3: Activate this minor. The char device can now be used. */
>   	set_bit(V4L2_FL_REGISTERED, &vdev->flags);
>
>   	return 0;
> @@ -1058,11 +1107,24 @@ int __video_register_device(struct video_device *vdev,
>   	mutex_lock(&videodev_lock);
>   	if (vdev->cdev)
>   		cdev_del(vdev->cdev);
> -	video_devices[vdev->minor] = NULL;
> -	devnode_clear(vdev);
>   	mutex_unlock(&videodev_lock);
> -	/* Mark this video device as never having been registered. */
> -	vdev->minor = -1;
> +	return ret;
> +}
> +EXPORT_SYMBOL(v4l2_vdev_register);
> +
> +int __video_register_device(struct video_device *vdev,
> +			    enum vfl_devnode_type type,
> +			    int nr, int warn_if_nr_in_use,
> +			    struct module *owner)
> +{
> +	int ret;
> +
> +	ret = v4l2_vdev_init(vdev, type, nr, warn_if_nr_in_use);
> +	if (ret)
> +		return ret;
> +	ret = v4l2_vdev_register(vdev, owner);
> +	if (ret)
> +		v4l2_vdev_uninit(vdev);
>   	return ret;
>   }
>   EXPORT_SYMBOL(__video_register_device);
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index ad2d41952442..0a8e22e92e6a 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -66,6 +66,9 @@ struct v4l2_ctrl_handler;
>   /**
>    * enum v4l2_video_device_flags - Flags used by &struct video_device
>    *
> + * @V4L2_FL_INITIALIZED:
> + *	indicates that a &struct video_device is initialized.
> + *	It is cleared by video_unregister_device.
>    * @V4L2_FL_REGISTERED:
>    *	indicates that a &struct video_device is registered.
>    *	Drivers can clear this flag if they want to block all future
> @@ -90,10 +93,11 @@ struct v4l2_ctrl_handler;
>    *	handler to restrict access to some ioctl calls.
>    */
>   enum v4l2_video_device_flags {
> -	V4L2_FL_REGISTERED		= 0,
> -	V4L2_FL_USES_V4L2_FH		= 1,
> -	V4L2_FL_QUIRK_INVERTED_CROP	= 2,
> -	V4L2_FL_SUBDEV_RO_DEVNODE	= 3,
> +	V4L2_FL_INITIALIZED,
> +	V4L2_FL_REGISTERED,
> +	V4L2_FL_USES_V4L2_FH,
> +	V4L2_FL_QUIRK_INVERTED_CROP,
> +	V4L2_FL_SUBDEV_RO_DEVNODE,
>   };
>
>   /* Priority helper functions */
> @@ -326,6 +330,13 @@ struct video_device
>    */
>   #define to_video_device(cd) container_of(cd, struct video_device, dev)
>
> +int v4l2_vdev_init(struct video_device *vdev,
> +		   enum vfl_devnode_type type,
> +		   int nr, int warn_if_nr_in_use);
> +void v4l2_vdev_uninit(struct video_device *vdev);
> +
> +int v4l2_vdev_register(struct video_device *vdev, struct module *owner);
> +
>   /**
>    * __video_register_device - register video4linux devices
>    *
>

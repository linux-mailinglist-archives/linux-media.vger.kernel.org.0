Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB6A19AAC2
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 13:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732276AbgDAL2P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 07:28:15 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60727 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732273AbgDAL2P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Apr 2020 07:28:15 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id JbXUjEeArfHuvJbXYjEBl6; Wed, 01 Apr 2020 13:28:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585740492; bh=k2sluWsDcHocHINMSfPv2wA4fx44wfVTZLvnm3m7s00=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=g/xuxrTpwTsW/s3i2C3OBaDduWKue6ckAdJ5DvJ6WQ091AOjLs8pXHawwKAbKKFxW
         ogukDqJSPr3g9SisQdbaLggwSg/6sjByM/ivPI6XkXLpFfqhIEkn52FawW2MwnROlV
         6ZjOj2xKJGQ/LYPSHJ0JILvZE7fXZ2048fWYpOYBLU4RIS+vfkIEWFF1493oU3QExx
         Ge7XEhifI+Zz92hLiV1RH0fXIJm1+GEewhXUyhV10CyZv8YC1XdNAXLdiyes5OCq82
         qloTFFjDqVZvGf7wC1ncoTMwA80GvaLoOZSO8gUGM8ehI7Ux8po7IKsTB1dX5uReBD
         lcHbpyWBEga6w==
Subject: Re: [v2 3/3] media: v4l2-dev: Add
 v4l2_device_register_ro_subdev_node()
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
References: <20200327223522.506832-1-jacopo@jmondi.org>
 <20200327223522.506832-4-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d695bd54-7e6f-04c7-c2f3-e64ecbfd41ef@xs4all.nl>
Date:   Wed, 1 Apr 2020 13:28:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200327223522.506832-4-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKBKC9BUDxKaSgBk77tkZQ/r6grc2s92jgqcDof2spP6ZjV+2M5IU47MBvg5oOANOPPlF1obBTXPdvf3gLSZNk4tENaIbuefq3czLWRTUcjgbZSPlD6k
 qdmUzqieTPjv/10zphlyE3k9nxM//LBdJgu9LXJeTz5/hU4Gfbw78e9XFifIOchfzzI4vaDRCeW3I3oSxgp8SfMjLtUaE/DM8WzCDPKtMgd88F1wbj3QH1F1
 AcVU29jK0JvSnApZTiZLu/jLz2ndgH//nHkD7V4k0afYyTOW3+NJAm448P/VWjuYx9n3TU4Y5WspGPv+mfetIQWiy0KljKilVs67sufsAPQk+xI/Eefpx9j/
 +6rkIQ1f8dzpWlXKsgBIAhv9s87O3zYEUNdao4p6wnU5W0+zWGo5UdBmA3V+nW1c2pGy0Z00
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/27/20 11:35 PM, Jacopo Mondi wrote:
> Add to the V4L2 core a function to register device nodes for video
> subdevices in read-only mode.
> 
> Registering a device node in read-only mode is useful to expose to
> userspace the current sub-device configuration, without allowing
> application to change it by using the V4L2 subdevice ioctls.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/v4l2-core/v4l2-device.c |  7 +++--
>  drivers/media/v4l2-core/v4l2-subdev.c | 19 ++++++++++++
>  include/media/v4l2-dev.h              |  7 +++++
>  include/media/v4l2-device.h           | 42 ++++++++++++++++++++++++---
>  4 files changed, 69 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
> index c69941214bb2..4517a70379ce 100644
> --- a/drivers/media/v4l2-core/v4l2-device.c
> +++ b/drivers/media/v4l2-core/v4l2-device.c
> @@ -186,7 +186,8 @@ static void v4l2_device_release_subdev_node(struct video_device *vdev)
>  	kfree(vdev);
>  }
> 
> -int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
> +int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
> +					bool read_only)
>  {
>  	struct video_device *vdev;
>  	struct v4l2_subdev *sd;
> @@ -215,6 +216,8 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
>  		vdev->fops = &v4l2_subdev_fops;
>  		vdev->release = v4l2_device_release_subdev_node;
>  		vdev->ctrl_handler = sd->ctrl_handler;
> +		if (read_only)
> +			set_bit(V4L2_FL_RO_DEVNODE, &vdev->flags);

I noticed the discussion about set_bit vs BIT: if memory serves, then at some point
in time setting/testing/clearing the V4L2_FL_REGISTERED had to be atomic. However,
looking at it today this no longer appears to be needed, so it can probably all be
replaced by normal bit operations. But that should be done in a separate patch if
anyone is interested in making that change.

>  		err = __video_register_device(vdev, VFL_TYPE_SUBDEV, -1, 1,
>  					      sd->owner);
>  		if (err < 0) {
> @@ -252,7 +255,7 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
> 
>  	return err;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_device_register_subdev_nodes);
> +EXPORT_SYMBOL_GPL(__v4l2_device_register_subdev_nodes);
> 
>  void v4l2_device_unregister_subdev(struct v4l2_subdev *sd)
>  {
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index a376b351135f..87fea21919fc 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -331,6 +331,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	struct v4l2_fh *vfh = file->private_data;
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
> +	bool ro_subdev = test_bit(V4L2_FL_RO_DEVNODE, &vdev->flags);
>  #endif
>  	int rval;
> 
> @@ -477,6 +478,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_S_FMT: {
>  		struct v4l2_subdev_format *format = arg;
> 
> +		if (format->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
> +			return -EPERM;
> +
>  		memset(format->reserved, 0, sizeof(format->reserved));
>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
>  		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
> @@ -504,6 +508,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		struct v4l2_subdev_crop *crop = arg;
>  		struct v4l2_subdev_selection sel;
> 
> +		if (crop->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
> +			return -EPERM;
> +
>  		memset(crop->reserved, 0, sizeof(crop->reserved));
>  		memset(&sel, 0, sizeof(sel));
>  		sel.which = crop->which;
> @@ -545,6 +552,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
>  		struct v4l2_subdev_frame_interval *fi = arg;
> 
> +		if (ro_subdev)
> +			return -EPERM;
> +
>  		memset(fi->reserved, 0, sizeof(fi->reserved));
>  		return v4l2_subdev_call(sd, video, s_frame_interval, arg);
>  	}
> @@ -568,6 +578,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_S_SELECTION: {
>  		struct v4l2_subdev_selection *sel = arg;
> 
> +		if (sel->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
> +			return -EPERM;
> +
>  		memset(sel->reserved, 0, sizeof(sel->reserved));
>  		return v4l2_subdev_call(
>  			sd, pad, set_selection, subdev_fh->pad, sel);
> @@ -604,6 +617,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		return v4l2_subdev_call(sd, video, g_dv_timings, arg);
> 
>  	case VIDIOC_SUBDEV_S_DV_TIMINGS:
> +		if (ro_subdev)
> +			return -EPERM;
> +
>  		return v4l2_subdev_call(sd, video, s_dv_timings, arg);
> 
>  	case VIDIOC_SUBDEV_G_STD:
> @@ -612,6 +628,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_S_STD: {
>  		v4l2_std_id *std = arg;
> 
> +		if (ro_subdev)
> +			return -EPERM;
> +
>  		return v4l2_subdev_call(sd, video, s_std, *std);
>  	}
> 
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index 4602c15ff878..bdbd953a976c 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -82,11 +82,18 @@ struct v4l2_ctrl_handler;
>   *	but the old crop API will still work as expected in order to preserve
>   *	backwards compatibility.
>   *	Never set this flag for new drivers.
> + * @V4L2_FL_RO_DEVNODE:
> + *	indicates that the video device node is registered in read-only mode.
> + *	The flag only applies to device nodes registered for sub-devices, it is
> + *	set by the core when the sub-devices device nodes are registered with
> + *	v4l2_device_register_ro_subdev_nodes() and used by the sub-device ioctl
> + *	handler to restrict access to some ioctl calls.
>   */
>  enum v4l2_video_device_flags {
>  	V4L2_FL_REGISTERED		= 0,
>  	V4L2_FL_USES_V4L2_FH		= 1,
>  	V4L2_FL_QUIRK_INVERTED_CROP	= 2,
> +	V4L2_FL_RO_DEVNODE		= 3,

I think this should be renamed to V4L2_FL_SUBDEV_RO_DEVNODE since this is subdev
specific and not for general device node usage. 'SUBDEV' should definitely be
part of the flag name.

>  };
> 
>  /* Priority helper functions */
> diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
> index 7c912b7d2870..c01aa9df70b5 100644
> --- a/include/media/v4l2-device.h
> +++ b/include/media/v4l2-device.h
> @@ -174,14 +174,48 @@ int __must_check v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
>  void v4l2_device_unregister_subdev(struct v4l2_subdev *sd);
> 
>  /**
> - * v4l2_device_register_subdev_nodes - Registers device nodes for all subdevs
> - *	of the v4l2 device that are marked with
> - *	the %V4L2_SUBDEV_FL_HAS_DEVNODE flag.
> + * __v4l2_device_register_ro_subdev_nodes - Registers device nodes for
> + *      all subdevs of the v4l2 device that are marked with the
> + *      %V4L2_SUBDEV_FL_HAS_DEVNODE flag.
>   *
>   * @v4l2_dev: pointer to struct v4l2_device
> + * @read_only: subdevices read-only flag. True to register the subdevices
> + *	device nodes in read-only mode, false to allow full access to the
> + *	subdevice userspace API.
>   */
>  int __must_check
> -v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev);
> +__v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
> +				    bool read_only);
> +
> +/**
> + * v4l2_device_register_subdev_nodes - Registers subdevices device nodes with
> + *	unrestricted access to the subdevice userspace operations
> + *
> + * Internally calls __v4l2_device_register_subdev_nodes(). See its documentation
> + * for more details.
> + *
> + * @v4l2_dev: pointer to struct v4l2_device
> + */
> +static inline int __must_check
> +v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
> +{
> +	return __v4l2_device_register_subdev_nodes(v4l2_dev, false);
> +}
> +
> +/**
> + * v4l2_device_register_ro_subdev_nodes - Registers subdevices device nodes
> + *	in read-only mode
> + *
> + * Internally calls __v4l2_device_register_subdev_nodes(). See its documentation
> + * for more details.
> + *
> + * @v4l2_dev: pointer to struct v4l2_device
> + */
> +static inline int __must_check
> +v4l2_device_register_ro_subdev_nodes(struct v4l2_device *v4l2_dev)
> +{
> +	return __v4l2_device_register_subdev_nodes(v4l2_dev, true);
> +}
> 
>  /**
>   * v4l2_subdev_notify - Sends a notification to v4l2_device.
> --
> 2.25.1
> 

Regards,

	Hans

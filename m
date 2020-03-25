Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4D491932FB
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 22:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbgCYVpo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 17:45:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48658 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727355AbgCYVpo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 17:45:44 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B83B80C;
        Wed, 25 Mar 2020 22:45:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585172741;
        bh=p2NAutUcAb1Netd+amhiFxsbPOHvCWxQhkU4ke1ABdI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hvn6vLqt7XdJE4odA5Vm3XBJv2bFQ8rHApYoKKU2ZVrknQLCAH8rp3VBWkrRYcvbs
         mV3pCvRPrFkijYZDBEOdQBnse/EVVzcvAfxmTFUEdRhNXiVMBNRpydXJN6Z9uAShZS
         znQCKEdleYI5WzB/PdkaF+o3ZdZynKfE9BYqQmjY=
Date:   Wed, 25 Mar 2020 23:45:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        sakari.ailus@linux.intel.com
Subject: Re: [libcamera-devel] [PATCH 2/4] media: v4l2-dev: Add
 v4l2_device_register_ro_subdev_node()
Message-ID: <20200325214536.GV19171@pendragon.ideasonboard.com>
References: <20200324202844.1518292-1-jacopo@jmondi.org>
 <20200324202844.1518292-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200324202844.1518292-3-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Mar 24, 2020 at 09:28:42PM +0100, Jacopo Mondi wrote:
> Add to the V4L2 code a function to register device nodes for video
> subdevices in read-only mode.
> 
> Registering a device node in read-only mode is useful to expose to
> userspace the current sub-device configuration, without allowing
> application to change it by using the V4L2 subdevice ioctls.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/v4l2-core/v4l2-device.c | 16 +++++++++++++++-
>  drivers/media/v4l2-core/v4l2-subdev.c | 19 +++++++++++++++++++
>  include/media/v4l2-dev.h              |  7 +++++++
>  include/media/v4l2-device.h           | 10 ++++++++++
>  4 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
> index 63d6b147b21e..6f9dba36eda1 100644
> --- a/drivers/media/v4l2-core/v4l2-device.c
> +++ b/drivers/media/v4l2-core/v4l2-device.c
> @@ -188,7 +188,8 @@ static void v4l2_device_release_subdev_node(struct video_device *vdev)
>  	kfree(vdev);
>  }
>  
> -int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
> +int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
> +					bool read_only)
>  {
>  	struct video_device *vdev;
>  	struct v4l2_subdev *sd;
> @@ -217,6 +218,8 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
>  		vdev->fops = &v4l2_subdev_fops;
>  		vdev->release = v4l2_device_release_subdev_node;
>  		vdev->ctrl_handler = sd->ctrl_handler;
> +		if (read_only)
> +			vdev->flags |= V4L2_FL_RO_DEVNODE;

As Andrey pointed out, this should be BIT(V4L2_FL_RO_DEVNODE).

>  		err = __video_register_device(vdev, VFL_TYPE_SUBDEV, -1, 1,
>  					      sd->owner);
>  		if (err < 0) {
> @@ -254,8 +257,19 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
>  
>  	return err;
>  }
> +
> +int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
> +{
> +	return __v4l2_device_register_subdev_nodes(v4l2_dev, false);
> +}
>  EXPORT_SYMBOL_GPL(v4l2_device_register_subdev_nodes);
>  
> +int v4l2_device_register_ro_subdev_nodes(struct v4l2_device *v4l2_dev)
> +{
> +	return __v4l2_device_register_subdev_nodes(v4l2_dev, true);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_device_register_ro_subdev_nodes);

I would export __v4l2_device_register_subdev_nodes and implement these
two functions as static inline in include/media/v4l2-device.h.

> +
>  void v4l2_device_unregister_subdev(struct v4l2_subdev *sd)
>  {
>  	struct v4l2_device *v4l2_dev;
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index f725cd9b66b9..9247ee6c293f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -331,6 +331,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	struct v4l2_fh *vfh = file->private_data;
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
> +	bool ro_devnode = !!(vdev->flags & V4L2_FL_RO_DEVNODE);

Same here, BIT(V4L2_FL_RO_DEVNODE).

I would name the variable ro_api to emphasize this is not about the
device node being read-only (in the sense of POSIX file permissions).

>  	int rval;
>  #endif
>  
> @@ -453,6 +454,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_S_FMT: {
>  		struct v4l2_subdev_format *format = arg;
>  
> +		if (format->which != V4L2_SUBDEV_FORMAT_TRY && ro_devnode)
> +			return -EPERM;
> +
>  		memset(format->reserved, 0, sizeof(format->reserved));
>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
>  		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
> @@ -480,6 +484,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		struct v4l2_subdev_crop *crop = arg;
>  		struct v4l2_subdev_selection sel;
>  
> +		if (crop->which != V4L2_SUBDEV_FORMAT_TRY && ro_devnode)
> +			return -EPERM;
> +
>  		memset(crop->reserved, 0, sizeof(crop->reserved));
>  		memset(&sel, 0, sizeof(sel));
>  		sel.which = crop->which;
> @@ -521,6 +528,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
>  		struct v4l2_subdev_frame_interval *fi = arg;
>  
> +		if (ro_devnode)
> +			return -EPERM;
> +
>  		memset(fi->reserved, 0, sizeof(fi->reserved));
>  		return v4l2_subdev_call(sd, video, s_frame_interval, arg);
>  	}
> @@ -544,6 +554,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_S_SELECTION: {
>  		struct v4l2_subdev_selection *sel = arg;
>  
> +		if (sel->which != V4L2_SUBDEV_FORMAT_TRY && ro_devnode)
> +			return -EPERM;
> +
>  		memset(sel->reserved, 0, sizeof(sel->reserved));
>  		return v4l2_subdev_call(
>  			sd, pad, set_selection, subdev_fh->pad, sel);
> @@ -580,6 +593,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		return v4l2_subdev_call(sd, video, g_dv_timings, arg);
>  
>  	case VIDIOC_SUBDEV_S_DV_TIMINGS:
> +		if (ro_devnode)
> +			return -EPERM;
> +
>  		return v4l2_subdev_call(sd, video, s_dv_timings, arg);
>  
>  	case VIDIOC_SUBDEV_G_STD:
> @@ -588,6 +604,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_S_STD: {
>  		v4l2_std_id *std = arg;
>  
> +		if (ro_devnode)
> +			return -EPERM;
> +
>  		return v4l2_subdev_call(sd, video, s_std, *std);
>  	}
>  
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index 48531e57cc5a..029873a338f2 100644
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
>  };
>  
>  /* Priority helper functions */
> diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
> index e0b8f2602670..0df667ba9938 100644
> --- a/include/media/v4l2-device.h
> +++ b/include/media/v4l2-device.h
> @@ -183,6 +183,16 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd);
>  int __must_check
>  v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev);
>  
> +/**
> + * v4l2_device_register_ro_subdev_nodes - Registers read-only device nodes for
> + *      all subdevs of the v4l2 device that are marked with the
> + *      %V4L2_SUBDEV_FL_HAS_DEVNODE flag.
> + *
> + * @v4l2_dev: pointer to struct v4l2_device
> + */
> +int __must_check
> +v4l2_device_register_ro_subdev_nodes(struct v4l2_device *v4l2_dev);
> +
>  /**
>   * v4l2_subdev_notify - Sends a notification to v4l2_device.
>   *

-- 
Regards,

Laurent Pinchart

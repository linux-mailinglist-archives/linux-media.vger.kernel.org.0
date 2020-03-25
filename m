Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0051E1926F9
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 12:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbgCYLUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 07:20:51 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:55631 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgCYLUu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 07:20:50 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 302ED1C0010;
        Wed, 25 Mar 2020 11:20:43 +0000 (UTC)
Date:   Wed, 25 Mar 2020 12:23:42 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        sakari.ailus@linux.intel.com
Subject: Re: [libcamera-devel] [PATCH 2/4] media: v4l2-dev: Add
 v4l2_device_register_ro_subdev_node()
Message-ID: <20200325112342.andqi2uognizd4uq@uno.localdomain>
References: <20200324202844.1518292-1-jacopo@jmondi.org>
 <20200324202844.1518292-3-jacopo@jmondi.org>
 <313fcb7e-6612-9cf5-a4eb-ba6edb39f754@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <313fcb7e-6612-9cf5-a4eb-ba6edb39f754@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,
   thanks for the review

On Wed, Mar 25, 2020 at 11:42:27AM +0300, Andrey Konovalov wrote:
> Hi Jacopo,
>
> Thank you for your patch set!
>
> On 24.03.2020 23:28, Jacopo Mondi wrote:
> > Add to the V4L2 code a function to register device nodes for video
> > subdevices in read-only mode.
> >
> > Registering a device node in read-only mode is useful to expose to
> > userspace the current sub-device configuration, without allowing
> > application to change it by using the V4L2 subdevice ioctls.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >   drivers/media/v4l2-core/v4l2-device.c | 16 +++++++++++++++-
> >   drivers/media/v4l2-core/v4l2-subdev.c | 19 +++++++++++++++++++
> >   include/media/v4l2-dev.h              |  7 +++++++
> >   include/media/v4l2-device.h           | 10 ++++++++++
> >   4 files changed, 51 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
> > index 63d6b147b21e..6f9dba36eda1 100644
> > --- a/drivers/media/v4l2-core/v4l2-device.c
> > +++ b/drivers/media/v4l2-core/v4l2-device.c
> > @@ -188,7 +188,8 @@ static void v4l2_device_release_subdev_node(struct video_device *vdev)
> >   	kfree(vdev);
> >   }
> > -int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
> > +int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
> > +					bool read_only)
> >   {
> >   	struct video_device *vdev;
> >   	struct v4l2_subdev *sd;
> > @@ -217,6 +218,8 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
> >   		vdev->fops = &v4l2_subdev_fops;
> >   		vdev->release = v4l2_device_release_subdev_node;
> >   		vdev->ctrl_handler = sd->ctrl_handler;
> > +		if (read_only)
> > +			vdev->flags |= V4L2_FL_RO_DEVNODE;
>
> <snip>
>
> > @@ -331,6 +331,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >   	struct v4l2_fh *vfh = file->private_data;
> >   #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >   	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
> > +	bool ro_devnode = !!(vdev->flags & V4L2_FL_RO_DEVNODE);
>
> So V4L2_FL_RO_DEVNODE is a bit mask, ...
>
> <snip>
>
> > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > index 48531e57cc5a..029873a338f2 100644
> > --- a/include/media/v4l2-dev.h
> > +++ b/include/media/v4l2-dev.h
> > @@ -82,11 +82,18 @@ struct v4l2_ctrl_handler;
> >    *	but the old crop API will still work as expected in order to preserve
> >    *	backwards compatibility.
> >    *	Never set this flag for new drivers.
> > + * @V4L2_FL_RO_DEVNODE:
> > + *	indicates that the video device node is registered in read-only mode.
> > + *	The flag only applies to device nodes registered for sub-devices, it is
> > + *	set by the core when the sub-devices device nodes are registered with
> > + *	v4l2_device_register_ro_subdev_nodes() and used by the sub-device ioctl
> > + *	handler to restrict access to some ioctl calls.
> >    */
> >   enum v4l2_video_device_flags {
> >   	V4L2_FL_REGISTERED		= 0,
> >   	V4L2_FL_USES_V4L2_FH		= 1,
> >   	V4L2_FL_QUIRK_INVERTED_CROP	= 2,
> > +	V4L2_FL_RO_DEVNODE		= 3,
>
> ... then V4L2_FL_RO_DEVNODE should rather be equal to 4, than to (V4L2_FL_USES_V4L2_FH | V4L2_FL_QUIRK_INVERTED_CROP)

Ups!

I should have noticed looking at V4L2_FL_REGISTERED=0 that these
flags are actually meant to be used as bit shifts. I can't say I like
the idea, but I should have known better than this.

I'll resend using set_bit() and test_bit().

Thanks for your help!

>
> Thanks,
> Andrey
>
> >   };
> >   /* Priority helper functions */
> > diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
> > index e0b8f2602670..0df667ba9938 100644
> > --- a/include/media/v4l2-device.h
> > +++ b/include/media/v4l2-device.h
> > @@ -183,6 +183,16 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd);
> >   int __must_check
> >   v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev);
> > +/**
> > + * v4l2_device_register_ro_subdev_nodes - Registers read-only device nodes for
> > + *      all subdevs of the v4l2 device that are marked with the
> > + *      %V4L2_SUBDEV_FL_HAS_DEVNODE flag.
> > + *
> > + * @v4l2_dev: pointer to struct v4l2_device
> > + */
> > +int __must_check
> > +v4l2_device_register_ro_subdev_nodes(struct v4l2_device *v4l2_dev);
> > +
> >   /**
> >    * v4l2_subdev_notify - Sends a notification to v4l2_device.
> >    *
> >

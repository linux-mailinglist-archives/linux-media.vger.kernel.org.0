Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013DB1BD937
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 12:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgD2KMx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 06:12:53 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:35137 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgD2KMw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 06:12:52 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0CF4B4000C;
        Wed, 29 Apr 2020 10:12:48 +0000 (UTC)
Date:   Wed, 29 Apr 2020 12:16:00 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v5.1] media: v4l2-subdev: Guard whole fops and ioctl hdlr
Message-ID: <20200429101600.pkw3i5igq5lla5ev@uno.localdomain>
References: <20200428210609.6793-5-jacopo@jmondi.org>
 <20200429085855.186273-1-jacopo@jmondi.org>
 <20200429094949.GD9190@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200429094949.GD9190@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Apr 29, 2020 at 12:49:49PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> Thanks for the update.
>
> On Wed, Apr 29, 2020 at 10:58:55AM +0200, Jacopo Mondi wrote:
> > A sub-device device node can be registered in user space only if the
> > CONFIG_V4L2_SUBDEV_API Kconfig option is selected. Currently the
> > open/close file operations and the ioctl handler have some parts of their
> > implementations guarded by #if defined(CONFIG_V4L2_SUBDEV_API), while
> > they are actually not accessible without a video device node registered
> > to user space.
> >
> > Guard the whole open, close and ioctl handler and provide stubs if the
> > V4L2_SUBDEV_API Kconfig option is not selected.
> >
> > This slightly reduces the kernel size when the option is not selected
> > and simplifies the file ops and ioctl implementations.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> > A different approach compared to v5, which was anyway buggy and not a proper
> > solution.
> >
> > Sending out for comments, while waiting for consensus on v5 [5/6] (reserved
> > space in the ioctl argument vs versioning based on structure size)
> >
> > Compile tested with and without V4L2_SUBDEV_API Kconfig option enabled and
> > with drivers that depends on it built-in or as modules.
> >
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 39 +++++++++++++++++++++------
> >  1 file changed, 31 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 1dc263c2ca0a..6fef52880c99 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -22,24 +22,22 @@
> >  #include <media/v4l2-fh.h>
> >  #include <media/v4l2-event.h>
> >
> > +#if defined(CONFIG_V4L2_SUBDEV_API)
> >  static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
> >  {
> > -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >  	if (sd->entity.num_pads) {
> >  		fh->pad = v4l2_subdev_alloc_pad_config(sd);
> >  		if (fh->pad == NULL)
> >  			return -ENOMEM;
> >  	}
> > -#endif
> > +
> >  	return 0;
> >  }
> >
> >  static void subdev_fh_free(struct v4l2_subdev_fh *fh)
> >  {
> > -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >  	v4l2_subdev_free_pad_config(fh->pad);
> >  	fh->pad = NULL;
> > -#endif
> >  }
> >
> >  static int subdev_open(struct file *file)
> > @@ -111,6 +109,17 @@ static int subdev_close(struct file *file)
> >
> >  	return 0;
> >  }
> > +#else /* CONFIG_V4L2_SUBDEV_API */
> > +static int subdev_open(struct file *file)
> > +{
> > +	return 0;
>
> Perhaps:
>
> return -ENODEV;
>
> And I'd use inline functions in the header.

There is no way this functions gets called if no device node is
registered to userspace, I think. These are only here to please the
compiler. Am I mistaken ?

Also, these function are not exported by any headers, but only the
file_operations structure that contains them is:

include/media/v4l2-subdev.h
        extern const struct v4l2_file_operations v4l2_subdev_fops;

>
> > +}
> > +
> > +static int subdev_close(struct file *file)
> > +{
> > +	return 0;
> > +}
> > +#endif /* CONFIG_V4L2_SUBDEV_API */
> >
> >  static inline int check_which(u32 which)
> >  {
> > @@ -324,15 +333,14 @@ const struct v4l2_subdev_ops v4l2_subdev_call_wrappers = {
> >  };
> >  EXPORT_SYMBOL(v4l2_subdev_call_wrappers);
> >
> > +#if defined(CONFIG_V4L2_SUBDEV_API)
> >  static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  {
> >  	struct video_device *vdev = video_devdata(file);
> >  	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
> >  	struct v4l2_fh *vfh = file->private_data;
> > -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
> >  	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
> > -#endif
> >  	int rval;
> >
> >  	switch (cmd) {
> > @@ -466,7 +474,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  		return ret;
> >  	}
> >
> > -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >  	case VIDIOC_SUBDEV_G_FMT: {
> >  		struct v4l2_subdev_format *format = arg;
> >
> > @@ -646,7 +653,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >
> >  	case VIDIOC_SUBDEV_QUERYSTD:
> >  		return v4l2_subdev_call(sd, video, querystd, arg);
> > -#endif
> > +
> >  	default:
> >  		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
> >  	}
> > @@ -686,6 +693,22 @@ static long subdev_compat_ioctl32(struct file *file, unsigned int cmd,
> >  }
> >  #endif
> >
> > +#else /* CONFIG_V4L2_SUBDEV_API */
> > +static long subdev_ioctl(struct file *file, unsigned int cmd,
> > +	unsigned long arg)
> > +{
> > +	return 0;
>
> return -ENOTTY;
>
> > +}
> > +
> > +#ifdef CONFIG_COMPAT
> > +static long subdev_compat_ioctl32(struct file *file, unsigned int cmd,
> > +	unsigned long arg)
> > +{
> > +	return 0;
>
> Ditto.
>
> > +}
> > +#endif
> > +#endif /* CONFIG_V4L2_SUBDEV_API */
> > +
> >  static __poll_t subdev_poll(struct file *file, poll_table *wait)
> >  {
> >  	struct video_device *vdev = video_devdata(file);
>
> --
> Kind regards,
>
> Sakari Ailus

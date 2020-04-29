Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7601BD53B
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 08:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgD2G7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 02:59:10 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:46237 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgD2G7J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 02:59:09 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2C3951BF204;
        Wed, 29 Apr 2020 06:59:03 +0000 (UTC)
Date:   Wed, 29 Apr 2020 09:02:15 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v5 4/6] media: v4l2-subdev: Assume V4L2_SUBDEV_API is
 selected
Message-ID: <20200429070215.gh3757q455ky6bkq@uno.localdomain>
References: <20200428210609.6793-1-jacopo@jmondi.org>
 <20200428210609.6793-5-jacopo@jmondi.org>
 <20200428212643.GB5381@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200428212643.GB5381@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Apr 29, 2020 at 12:26:43AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Apr 28, 2020 at 11:06:07PM +0200, Jacopo Mondi wrote:
> > A sub-device device node can be registered in user space only if the
> > CONFIG_V4L2_SUBDEV_API Kconfig option is selected.
> >
> > Remove checks from the v4l2-subdev file handle open/close functions and
> > ioctl handler as they are only accessible if a device node was registered
> > to user space in first place.
>
> Is there other motivation with this than clean up things a little?
>

I had to add yet-another #if defined and I got fed up. If you don't
have a device node registered you won't be able to access any of the
functions where the existing #if defined() where placed.

> The change increases the binary size marginally if the Kconfig option is
> disabled.
>

I see. Should we instead guard the whole file handle operations and
ioctl handler instead of having #if defined() spread inside them ? I
assume they where there as leftover, as I'm still missing the point,
give that, as said, without V4L2_SUBDEV_API, you can't register any
device node to userspace..

> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 1dc263c2ca0a..f3fe515b8ccb 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -24,22 +24,19 @@
> >
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
> > @@ -329,10 +326,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
> > @@ -466,7 +461,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  		return ret;
> >  	}
> >
> > -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >  	case VIDIOC_SUBDEV_G_FMT: {
> >  		struct v4l2_subdev_format *format = arg;
> >
> > @@ -646,7 +640,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >
> >  	case VIDIOC_SUBDEV_QUERYSTD:
> >  		return v4l2_subdev_call(sd, video, querystd, arg);
> > -#endif
> > +
> >  	default:
> >  		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
> >  	}
> > --
> > 2.26.1
> >
>
> --
> Sakari Ailus

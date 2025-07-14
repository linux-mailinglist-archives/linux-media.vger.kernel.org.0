Return-Path: <linux-media+bounces-37696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ED8B04647
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 19:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 549944A66B9
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257A42620EE;
	Mon, 14 Jul 2025 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OojTjqWx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4925D1F0E26
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 17:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752513428; cv=none; b=pEjaSTdvUq19+8gygqBGytOFyCEZIasgO1RFSsaouZdopMzIQZlzPmUVyHKJLP4Cz8XjLLQi7Wji1E17QU8kHepe+ozaJZHs7Z3BG00k9EZPvApkt2Fc2YDCdSLH+7lTghj2I9FkaDOIqwuYqV355NmqMc7wUUncReiLml1A3bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752513428; c=relaxed/simple;
	bh=S4fdXrKvEFaXrU/QzHyW1jwPpP2YL/ry76Jg7Hb4FSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjCJky3iozCNbShq4x572bcJcxil0pjME/srS+/TunTYIqrVQNV6JxyaK4SoTCgFixYbhCq0PWqKeh9VuufsedW+N7jLgXagntXWDjNgNaWU2+VnjNc9C+tMP/WA0hMkQu3Y/HTeWWiQJjxiIjL8e9Cx8le7/hyD51qCKCvh0GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OojTjqWx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 55C273DC;
	Mon, 14 Jul 2025 19:16:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752513392;
	bh=S4fdXrKvEFaXrU/QzHyW1jwPpP2YL/ry76Jg7Hb4FSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OojTjqWxOqbzgccMuMqRNPRq2ayXyo7Pg9q8zjnjfKC2OSgq9BRTSqyzvxx/DzUsi
	 8RRN3GVAM6fu0/4kgGQDc8vBR7zBF3/eI1sd/ZV41cpiMO5nZyu2LUSbXJ1uQfo9I2
	 Yg4RAHJnC4i9A4ZX6yY8mdgKLOF9/ULYpJ9NZjd0=
Date: Mon, 14 Jul 2025 20:16:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] media: v4l2-core: Add support for video device
 state
Message-ID: <20250714171632.GA13846@pendragon.ideasonboard.com>
References: <20250703-vdev-state-v1-0-d647a5e4986d@ideasonboard.com>
 <20250703-vdev-state-v1-1-d647a5e4986d@ideasonboard.com>
 <3yifjhhqjrryg2fnfep6yqpxlvc3y5drh54smwajptfzy75tuu@dfsl6g5ktxbw>
 <175227804873.3930831.3557651361410884449@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175227804873.3930831.3557651361410884449@freya>

On Fri, Jul 11, 2025 at 04:54:08PM -0700, Jai Luthra wrote:
> Quoting Jacopo Mondi (2025-07-08 09:26:29)
> > On Thu, Jul 03, 2025 at 06:02:08PM -0700, Jai Luthra wrote:
> > > Simplify video capture device drivers by maintaining active and try
> > > states to track the v4l2 formats (for video and metadata capture) of the
> > > device.

I think you should split this patch in two, one introducing the active
state, and another one introducing the try state.

> > >
> > > A lot of boilerplate in the drivers can be reduced by combining the
> > > implementation of s_fmt and try_fmt hooks, and using a framework helper
> > > for the g_fmt hook.
> > >
> > > To achieve this, we pass the newly introduced state structure to the
> > > hooks through the already existing private void pointer. For S_FMT, we
> > > pass the pointer to the active state and enforce that the vb2 queue is
> > > not busy before calling the driver hook.

Is that the right thing to do ? The framework doesn't enforce that
constraint at the moment and lets drivers implement it. If there's no
good reason to do so, then the constraint should be enforced by the core
unconditionally, for all drivers (and that should be split to a patch of
its own). Otherwise, if there are use cases where a driver could
meaningfully handle VIDIOC_S_FMT while streaming, we should let drivers
enforce the constraint.

> > > For TRY_FMT, we pass the
> > > pointer to the temporary state stored in the file handle. Finally, we
> > > introduce a framework helper for the g_fmt hook that the drivers can
> > > use.
> > >
> > > The private void pointer argument already had some rare uses, so we
> > > switch away from using it in the v4l_*ctrl functions to access
> > > file->private_data, instead doing that access directly. Some drivers'
> > > hooks might still expect it to point to file->private_data, so we
> > > replace it with the state pointer only if a driver selects the
> > > V4L2_FL_USES_STATE flag while registering the device.
> > >
> > > State support may be extended in the future to other device types, such
> > > as video/metadata output or M2M devices.
> > >
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-dev.c   | 32 ++++++++++++++++++++++
> > >  drivers/media/v4l2-core/v4l2-fh.c    |  1 +
> > >  drivers/media/v4l2-core/v4l2-ioctl.c | 44 ++++++++++++++++++++++++------
> > >  include/media/v4l2-dev.h             | 52 ++++++++++++++++++++++++++++++++++++
> > >  include/media/v4l2-fh.h              |  5 +++-
> > >  5 files changed, 125 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > > index c369235113d98ae26c30a1aa386e7d60d541a66e..b8227d5508dc5bd775706264739e5db2d577f7fd 100644
> > > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > > @@ -27,6 +27,7 @@
> > >  #include <linux/uaccess.h>
> > >
> > >  #include <media/v4l2-common.h>
> > > +#include <media/v4l2-dev.h>
> > 
> > v4l2-common includes this already
> 
> Ah okay, somehow clangd wasn't happy with it, will drop this in next revision.
> 
> > 
> > >  #include <media/v4l2-device.h>
> > >  #include <media/v4l2-ioctl.h>
> > >  #include <media/v4l2-event.h>
> > > @@ -163,6 +164,34 @@ void video_device_release_empty(struct video_device *vdev)
> > >  }
> > >  EXPORT_SYMBOL(video_device_release_empty);
> > >
> > > +int video_device_g_fmt_vid(struct file *file, void *priv,
> > 
> > The function prototype (and documentation) names the second parameter
> > state.
> > 
> 
> Will fix.
> 
> > > +                        struct v4l2_format *fmt)
> > > +{
> > > +     struct video_device_state *state = priv;
> > > +
> > > +     if (WARN_ON_ONCE(!state))
> > > +             return -EINVAL;
> > > +
> > > +     *fmt = state->vid_fmt;
> > > +
> > > +     return 0;
> > > +}
> > > +EXPORT_SYMBOL(video_device_g_fmt_vid);
> > > +
> > > +int video_device_g_fmt_meta(struct file *file, void *priv,
> > > +                         struct v4l2_format *fmt)
> > > +{
> > > +     struct video_device_state *state = priv;
> > > +
> > > +     if (WARN_ON_ONCE(!state))
> > > +             return -EINVAL;
> > > +
> > > +     *fmt = state->meta_fmt;
> > > +
> > > +     return 0;
> > > +}
> > > +EXPORT_SYMBOL(video_device_g_fmt_meta);
> > > +
> > 
> > These two helpers, and the presence of two struct v4l2_format
> > 'vid_fmt' and 'meta_fmt' are a bit puzzling to me.
> > 
> > A video device will handle one buffer type and struct v4l2_format
> > accomodates all type of buffers in the 'fmt' union member.
> > 
> > Why do you store two of them in the video device state ?
> 
> I stored both as I was also looking at RPi CFE video nodes, which supports
> both video and metadata capture in a single video device.

That's correct, but not at the same time. The driver should be
refactored to use a single v4l2_format, and we should have a single
video_device_g_fmt() helper.

> These may explode even more in future for some M2M device with video +
> metdata. We will have to store and provide helpers for 4 combinations then,
> of capture & output formats for both video & metadata usecases.

Note the rp1-cfe driver already supports both metadata capture and
metadata output.

> > >  static inline void video_get(struct video_device *vdev)
> > >  {
> > >       get_device(&vdev->dev);
> > > @@ -927,6 +956,9 @@ int __video_register_device(struct video_device *vdev,
> > >       spin_lock_init(&vdev->fh_lock);
> > >       INIT_LIST_HEAD(&vdev->fh_list);
> > >
> > > +     /* video_device_state support */
> > > +     vdev->state.which = VIDEO_DEVICE_FORMAT_ACTIVE;
> > > +
> > >       /* Part 1: check device type */
> > >       switch (type) {
> > >       case VFL_TYPE_VIDEO:
> > > diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
> > > index 90eec79ee995a2d214590beeacc91b9f8f33236d..d246e05f8ef1244e212412caa5c9c6788a5c948a 100644
> > > --- a/drivers/media/v4l2-core/v4l2-fh.c
> > > +++ b/drivers/media/v4l2-core/v4l2-fh.c
> > > @@ -37,6 +37,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
> > >       INIT_LIST_HEAD(&fh->available);
> > >       INIT_LIST_HEAD(&fh->subscribed);
> > >       fh->sequence = -1;
> > > +     fh->state.which = VIDEO_DEVICE_FORMAT_TRY;
> > >       mutex_init(&fh->subscribe_lock);
> > >  }
> > >  EXPORT_SYMBOL_GPL(v4l2_fh_init);
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index 650dc1956f73d2f1943b56c42140c7b8d757259f..78a0db364725ec6641be37d0c4804edb222a9154 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -21,6 +21,7 @@
> > >
> > >  #include <media/media-device.h> /* for media_set_bus_info() */
> > >  #include <media/v4l2-common.h>
> > > +#include <media/v4l2-dev.h>
> > >  #include <media/v4l2-ioctl.h>
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-fh.h>
> > > @@ -1745,6 +1746,15 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
> > >       if (ret)
> > >               return ret;
> > >
> > > +     /*
> > > +      * Make sure queue isn't busy for devices that use state, as they have a
> > > +      * single implementation for .s_fmt and .try_fmt, and rely on us to make
> > > +      * sure the queue is not busy when calling for the .s_fmt case
> > > +      */
> > > +     if (test_bit(V4L2_FL_USES_STATE, &vfd->flags) && vfd->queue &&
> > > +         vb2_is_busy(vfd->queue))
> > > +             return -EBUSY;
> > > +
> > >       ret = v4l_enable_media_source(vfd);
> > >       if (ret)
> > >               return ret;
> > > @@ -2293,7 +2303,7 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
> > >       struct v4l2_query_ext_ctrl qec = {};
> > >       struct v4l2_queryctrl *p = arg;
> > >       struct v4l2_fh *vfh =
> > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;

This should be split to a separate patch with a clear commit message.

> > >       int ret;
> > >
> > >       if (vfh && vfh->ctrl_handler)
> > > @@ -2318,7 +2328,7 @@ static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
> > >       struct video_device *vfd = video_devdata(file);
> > >       struct v4l2_query_ext_ctrl *p = arg;
> > >       struct v4l2_fh *vfh =
> > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
> > >
> > >       if (vfh && vfh->ctrl_handler)
> > >               return v4l2_query_ext_ctrl(vfh->ctrl_handler, p);
> > > @@ -2335,7 +2345,7 @@ static int v4l_querymenu(const struct v4l2_ioctl_ops *ops,
> > >       struct video_device *vfd = video_devdata(file);
> > >       struct v4l2_querymenu *p = arg;
u> > >       struct v4l2_fh *vfh =
> > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
> > >
> > >       if (vfh && vfh->ctrl_handler)
> > >               return v4l2_querymenu(vfh->ctrl_handler, p);
> > > @@ -2352,7 +2362,7 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops,
> > >       struct video_device *vfd = video_devdata(file);
> > >       struct v4l2_control *p = arg;
> > >       struct v4l2_fh *vfh =
> > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
> > >       struct v4l2_ext_controls ctrls;
> > >       struct v4l2_ext_control ctrl;
> > >
> > > @@ -2384,7 +2394,7 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
> > >       struct video_device *vfd = video_devdata(file);
> > >       struct v4l2_control *p = arg;
> > >       struct v4l2_fh *vfh =
> > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
> > >       struct v4l2_ext_controls ctrls;
> > >       struct v4l2_ext_control ctrl;
> > >       int ret;
> > > @@ -2414,7 +2424,7 @@ static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
> > >       struct video_device *vfd = video_devdata(file);
> > >       struct v4l2_ext_controls *p = arg;
> > >       struct v4l2_fh *vfh =
> > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
> > >
> > >       p->error_idx = p->count;
> > >       if (vfh && vfh->ctrl_handler)
> > > @@ -2435,7 +2445,7 @@ static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
> > >       struct video_device *vfd = video_devdata(file);
> > >       struct v4l2_ext_controls *p = arg;
> > >       struct v4l2_fh *vfh =
> > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
> > >
> > >       p->error_idx = p->count;
> > >       if (vfh && vfh->ctrl_handler)
> > > @@ -2456,7 +2466,7 @@ static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
> > >       struct video_device *vfd = video_devdata(file);
> > >       struct v4l2_ext_controls *p = arg;
> > >       struct v4l2_fh *vfh =
> > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
> > >
> > >       p->error_idx = p->count;
> > >       if (vfh && vfh->ctrl_handler)
> > > @@ -3057,6 +3067,21 @@ void v4l_printk_ioctl(const char *prefix, unsigned int cmd)
> > >  }
> > >  EXPORT_SYMBOL(v4l_printk_ioctl);
> > >
> > > +static struct video_device_state *
> > > +video_device_get_state(struct video_device *vfd, struct v4l2_fh *vfh,
> > > +                    unsigned int cmd, void *arg)
> > > +{
> > > +     switch (cmd) {
> > > +     default:
> > > +             return NULL;
> > > +     case VIDIOC_G_FMT:
> > > +     case VIDIOC_S_FMT:
> > > +             return &vfd->state;
> > > +     case VIDIOC_TRY_FMT:
> > > +             return &vfh->state;
> > > +     }
> > > +}
> > > +
> > >  static long __video_do_ioctl(struct file *file,
> > >               unsigned int cmd, void *arg)
> > >  {
> > > @@ -3081,6 +3106,9 @@ static long __video_do_ioctl(struct file *file,
> > >       if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags))
> > >               vfh = file->private_data;
> > >
> > > +     if (vfh && test_bit(V4L2_FL_USES_STATE, &vfd->flags))
> > > +             fh = video_device_get_state(vfd, vfh, cmd, arg);
> > > +

That's very dangerous, using the same void pointer for two different
purposes depending on the USES_STATE flag. I think you should start with
some refactoring to move away from using a void pointer.

The first step is to remove direct setting of file->private_data in
drivers. Quite a few do so because they need to allocate the structure
containing the v4l2_fh. They therefore can't call v4l2_fh_open(), which
sets file->private_data, but call v4l2_fh_init(), set the private_data
field, and then call v4l2_fh_add(). In many cases it seems
v4l2_fh_init() could set file->private_data. You will need to check all
drivers that set the field directly, see if any of them set
file->private_data to a value different than the v4l2_fh pointer, and if
that could be fixed.

(Note that some drivers set the private_data field of a debugfs file, or
an ALSA device. Don't mistakenly consider those as direct usage of
private_data conflicting with V4L2_FL_USES_V4L2_FH.)

If we're lucky, we'll be able to remove manual usage of private_data in
drivers. In that case, we could then either

- Patch ioctl handlers in drivers to use file->private_data to access
  the v4l2_fh and stop using the void *fh argument, and then replace the
  void *fh argument with a video_device_state *state.

- Add a video_device_state *state argument to the ioctl handlers, if we
  decide to keep the fh pointer. In that case we should replace void *fh
  with v4l2_fh *fh.

If there are drivers left that can't easily stop setting private_data
manually, let's discuss them.

> > >       /*
> > >        * We need to serialize streamon/off with queueing new requests.
> > >        * These ioctls may trigger the cancellation of a streaming
> > > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > > index 1b6222fab24eda96cbe459b435431c01f7259366..8e6e7799212cd07ae4ad3dfc85912c21a9bcab2d 100644
> > > --- a/include/media/v4l2-dev.h
> > > +++ b/include/media/v4l2-dev.h
> > > @@ -89,12 +89,18 @@ struct dentry;
> > >   *   set by the core when the sub-devices device nodes are registered with
> > >   *   v4l2_device_register_ro_subdev_nodes() and used by the sub-device ioctl
> > >   *   handler to restrict access to some ioctl calls.
> > > + * @V4L2_FL_USES_STATE:
> > > + *   indicates that the &struct video_device has state support.
> > > + *   The active video and metadata formats are stored in video_device.state,
> > > + *   and the try video and metadata formats are stored in v4l2_fh.state.
> > > + *   All new drivers should use it.
> > >   */
> > >  enum v4l2_video_device_flags {
> > >       V4L2_FL_REGISTERED              = 0,
> > >       V4L2_FL_USES_V4L2_FH            = 1,
> > >       V4L2_FL_QUIRK_INVERTED_CROP     = 2,
> > >       V4L2_FL_SUBDEV_RO_DEVNODE       = 3,
> > > +     V4L2_FL_USES_STATE              = 4,
> > >  };
> > >
> > >  /* Priority helper functions */
> > > @@ -214,6 +220,30 @@ struct v4l2_file_operations {
> > >       int (*release) (struct file *);
> > >  };
> > >
> > > +/**
> > > + * enum video_device_format_whence - Video device format type
> > > + *
> > > + * @V4L2_DEVICE_FORMAT_TRY: from VIDIOC_TRY_FMT, for negotiation only
> > > + * @V4L2_DEVICE_FORMAT_ACTIVE: from VIDIOC_S_FMT, applied to the device
> > > + */
> > > +enum video_device_format_whence {
> > > +     VIDEO_DEVICE_FORMAT_TRY = 0,
> > > +     VIDEO_DEVICE_FORMAT_ACTIVE = 1,
> > > +};
> > 
> > I'm not sure we need these. More on this on the drivers
> > implementation in the next patches.

I agree, this should not be needed at this point. The whole point of
states is that drivers should not care whether they're operating on a
TRY or ACTIVE state. There are exceptions with subdevs for historical
reasons, but we shouldn't repeat that here.

It may make sense to later add TRY/ACTIVE identifiers for the UAPI, but
within drivers they should not be used. How about repurposing the
.try_fmt() and .s_fmt() ioctl handlers for drivers support states, by
using .try_fmt() first to adjust the format and store it in the state
(ACTIVE or TRY, that shouldn't matter to drivers), and then using
.s_fmt() to apply the state to the device ? The V4L2 core should call
.try_fmt() first followed by .s_fmt() when V4L2_FL_USES_STATE is set.
The vast majority of state-aware drivers will configure the device when
starting streaming, so they won't need to implement .s_fmt().

Now that I wrote this, the plan may conflict with my comment above
regarding leaving the busy check in drivers. Let's figure that one
first, and see if we need to let drivers known on what state they're
operating. I think repurposing .try_fmt() and .s_fmt() should be done
regardless.

> > > +
> > > +/**
> > > + * struct video_device_state - Used for storing video device state information.
> > > + *
> > > + * @vid_fmt: Format of the video capture stream
> > > + * @meta_fmt: Format of the metadata capture stream
> > > + * @which: is this a TRY or ACTIVE format?
> > > + */
> > > +struct video_device_state {
> > > +     struct v4l2_format vid_fmt;
> > > +     struct v4l2_format meta_fmt;
> > > +     enum video_device_format_whence which;
> > > +};
> > > +
> > >  /*
> > >   * Newer version of video_device, handled by videodev2.c
> > >   *   This version moves redundant code from video device code to
> > > @@ -238,6 +268,7 @@ struct v4l2_file_operations {
> > >   * @queue: &struct vb2_queue associated with this device node. May be NULL.
> > >   * @prio: pointer to &struct v4l2_prio_state with device's Priority state.
> > >   *    If NULL, then v4l2_dev->prio will be used.
> > > + * @state: &struct video_device_state, holds the active state for the device.
> > >   * @name: video device name
> > >   * @vfl_type: V4L device type, as defined by &enum vfl_devnode_type
> > >   * @vfl_dir: V4L receiver, transmitter or m2m
> > > @@ -283,6 +314,7 @@ struct video_device {
> > >       struct vb2_queue *queue;
> > >
> > >       struct v4l2_prio_state *prio;
> > > +     struct video_device_state state;
> > 
> > One of the key design requirement it's the ability for drivers to
> > sub-class video_device_state. One possibile way to obtain this is to
> > dynamically allocate the state either by deferring to the driver's the
> > allocation (so that they can allocate a bigger structure) or by
> > passing to the framework the size it has to allocate.
> > 
> > In any case, I'm afraid the state should be allocated dynamically,
> > either in the drivers' init_state() (or similar) callback or by the
> > framework with a size hint from the driver.
> > 
> > What do you think ?
> 
> Ah okay, I missed that. Should be possible to make this dynamically
> allocatable by the driver. It will also tie into Sakari's suggestion of
> creating a helper for initializing the state.

Yes, I agree with Jacopo and Sakari here. The state should be
dynamically allocated, and you should add an operation to initialize it.

> > >
> > >       /* device info */
> > >       char name[64];
> > > @@ -540,6 +572,26 @@ static inline int video_is_registered(struct video_device *vdev)
> > >       return test_bit(V4L2_FL_REGISTERED, &vdev->flags);
> > >  }
> > >
> > > +/**
> > > + * video_device_g_fmt_vid() - fill video v4l2_format from the state.
> > > + *
> > > + * @file: pointer to struct file
> > > + * @state: pointer to video device state
> > > + * @format: pointer to &struct v4l2_format
> > > + */
> > > +int video_device_g_fmt_vid(struct file *file, void *state,
> > > +                        struct v4l2_format *format);
> > > +
> > > +/**
> > > + * video_device_g_fmt_meta() - fill metadata v4l2_format from the state.
> > > + *
> > > + * @file: pointer to struct file
> > > + * @state: pointer to video device state
> > > + * @format: pointer to &struct v4l2_format
> > > + */
> > > +int video_device_g_fmt_meta(struct file *file, void *state,
> > > +                         struct v4l2_format *format);
> > > +
> > >  /**
> > >   * v4l2_debugfs_root - returns the dentry of the top-level "v4l2" debugfs dir
> > >   *
> > > diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
> > > index b5b3e00c8e6a0b082d9cd8a0c972a5094adcb6f2..02579f87ba99d0c849a0865f8cc4295446c39f94 100644
> > > --- a/include/media/v4l2-fh.h
> > > +++ b/include/media/v4l2-fh.h
> > > @@ -18,7 +18,8 @@
> > >  #include <linux/list.h>
> > >  #include <linux/videodev2.h>
> > >
> > > -struct video_device;
> > > +#include <media/v4l2-dev.h>
> > > +

You will be able to go back to forward declarations once you replace the
state field below with a pointer.

> > >  struct v4l2_ctrl_handler;
> > >
> > >  /**
> > > @@ -28,6 +29,7 @@ struct v4l2_ctrl_handler;
> > >   * @vdev: pointer to &struct video_device
> > >   * @ctrl_handler: pointer to &struct v4l2_ctrl_handler
> > >   * @prio: priority of the file handler, as defined by &enum v4l2_priority
> > > + * @state: try state used for format negotiation on the video device
> > >   *
> > >   * @wait: event' s wait queue
> > >   * @subscribe_lock: serialise changes to the subscribed list; guarantee that
> > > @@ -44,6 +46,7 @@ struct v4l2_fh {
> > >       struct video_device     *vdev;
> > >       struct v4l2_ctrl_handler *ctrl_handler;
> > >       enum v4l2_priority      prio;
> > > +     struct video_device_state state;
> > >
> > >       /* Events */
> > >       wait_queue_head_t       wait;
> > >

-- 
Regards,

Laurent Pinchart


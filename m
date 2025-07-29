Return-Path: <linux-media+bounces-38632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF00B14FE1
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 17:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B03218850AD
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 15:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BF5286888;
	Tue, 29 Jul 2025 14:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L2qlZYQf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCD628643F
	for <linux-media@vger.kernel.org>; Tue, 29 Jul 2025 14:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753801185; cv=none; b=T/8TNUNcpIx2sAW1Km7qYubKgbLtBPBvm//LRFTAlrJpv632ZEZP8xoufF14IUc3UkGePYV1d4dB0AvaKNKLq9BNxGgBffnazNRnWxyORRHmN00pC4KtU6PzFujTku8Eui+QzXFsvo+/UhxkQGbJa4IoPxQhsDGMM5HQRlZyhSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753801185; c=relaxed/simple;
	bh=cvnUNWtM+/py3RjswhLKoAesw6Rqt7tW0yO7nZWZ+wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsseT3slhiO87jfPCjLTKrQXmRMxKVhpg/+mO+l21BBbRr0BzWI3KzHn5jP6nSJorHoIwvRooIzmeTBn+eR+VsFEhS07+7D7bKuvmme5bBWQ8FPiCudAnEMkokUU5tGcJm32r1z03y5mZrPC/kkWC++xHwTwAAy0m5SifgPu3dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L2qlZYQf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 226AD6DC;
	Tue, 29 Jul 2025 16:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753801138;
	bh=cvnUNWtM+/py3RjswhLKoAesw6Rqt7tW0yO7nZWZ+wU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L2qlZYQfTas1ekJdM52QFYI/UUnpjV9ujoXViKEuqPd0zYVNm+nlPhXZY30+PCRq1
	 VNXgbtdGfGuWRkB1uxQ2A3WQzJ67DmaQV3S302kMQmOUQF/BqT9Pj/Xa8LuvGiJ10x
	 5QEQQehMJ1gSdsk/u4IeBlr5Oe3IEHiHcCdUQDeU=
Date: Tue, 29 Jul 2025 17:59:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] media: v4l2-core: Add support for video device
 state
Message-ID: <20250729145932.GG5233@pendragon.ideasonboard.com>
References: <20250703-vdev-state-v1-0-d647a5e4986d@ideasonboard.com>
 <20250703-vdev-state-v1-1-d647a5e4986d@ideasonboard.com>
 <3yifjhhqjrryg2fnfep6yqpxlvc3y5drh54smwajptfzy75tuu@dfsl6g5ktxbw>
 <175227804873.3930831.3557651361410884449@freya>
 <20250714171632.GA13846@pendragon.ideasonboard.com>
 <zxgkpvodgtanbe5mihgi4cboh3u6csmfsvbnruktaykhzfwgvs@fbgchdqjivbh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <zxgkpvodgtanbe5mihgi4cboh3u6csmfsvbnruktaykhzfwgvs@fbgchdqjivbh>

On Tue, Jul 29, 2025 at 03:43:17PM +0200, Jacopo Mondi wrote:
> Hi Laurent
> 
> On Mon, Jul 14, 2025 at 08:16:32PM +0300, Laurent Pinchart wrote:
> > On Fri, Jul 11, 2025 at 04:54:08PM -0700, Jai Luthra wrote:
> > > Quoting Jacopo Mondi (2025-07-08 09:26:29)
> 
> [snip]
> 
> > > > >  static long __video_do_ioctl(struct file *file,
> > > > >               unsigned int cmd, void *arg)
> > > > >  {
> > > > > @@ -3081,6 +3106,9 @@ static long __video_do_ioctl(struct file *file,
> > > > >       if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags))
> > > > >               vfh = file->private_data;
> > > > >
> > > > > +     if (vfh && test_bit(V4L2_FL_USES_STATE, &vfd->flags))
> > > > > +             fh = video_device_get_state(vfd, vfh, cmd, arg);
> > > > > +
> >
> > That's very dangerous, using the same void pointer for two different
> > purposes depending on the USES_STATE flag. I think you should start with
> > some refactoring to move away from using a void pointer.
> >
> > The first step is to remove direct setting of file->private_data in
> > drivers. Quite a few do so because they need to allocate the structure
> > containing the v4l2_fh. They therefore can't call v4l2_fh_open(), which
> > sets file->private_data, but call v4l2_fh_init(), set the private_data
> > field, and then call v4l2_fh_add(). In many cases it seems
> > v4l2_fh_init() could set file->private_data. You will need to check all
> > drivers that set the field directly, see if any of them set
> > file->private_data to a value different than the v4l2_fh pointer, and if
> > that could be fixed.
> 
> Can I reverse it ?
> 
> drivers that sets file->private_date = vfh; should be checked to make
> sure they do not retrieve 'vfh' from the 'void *' in their ioctl
> handlers but rather access file->private_data directly.
> 
> Once all of them are checked, we can replace the 'void *' argument
> with the video_device_state pointer. And yes, if we can have
> v4l2_fh_init() set file->private_data to vfh that's certainly better
> than having drivers doing that by hand.
> 
> But ...
> 
> > (Note that some drivers set the private_data field of a debugfs file, or
> 
> ... some drivers assume something different is set in
> file->private_data.

I'm not sure about that. My comment was related to the fact that more
than a quick grep is needed. There are drivers that set the private_date
field of a debugfs file or an ALSA device. Grepping for private_data
will show those, but they're not a problem. What we can is only the
private_data field of the struct file associated with a video_device.

Can we start with an assessment of what existing drivers do ?

> Again however, if in their ioctl handlers they retrieve it from
> file->private_data and do not hard-cast the void * to whatever they
> need, again the void * argument can safely be replaced by a pointer to
> video_device_state.
> 
> > an ALSA device. Don't mistakenly consider those as direct usage of
> > private_data conflicting with V4L2_FL_USES_V4L2_FH.)
> 
> I noticed, in example  drivers/media/platform/amphion/vpu_dbg.c
> 
> However I don't see it setting file->private_data but rather access
> it in their debugfs handlers:
> 
> 	struct seq_file *s = file->private_data;
> 
> Is this what you mean with
> 
> "Don't mistakenly consider those as direct usage of
>  private_data conflicting with V4L2_FL_USES_V4L2_FH."
> 
> ?

Yes, this isn't a problem, as that struct file isn't related to the
video_device.

> > If we're lucky, we'll be able to remove manual usage of private_data in
> > drivers. In that case, we could then either
> >
> > - Patch ioctl handlers in drivers to use file->private_data to access
> >   the v4l2_fh and stop using the void *fh argument, and then replace the
> >   void *fh argument with a video_device_state *state.
> 
> This would be preferable imho
> 
> > - Add a video_device_state *state argument to the ioctl handlers, if we
> >   decide to keep the fh pointer. In that case we should replace void *fh
> >   with v4l2_fh *fh.
> >
> > If there are drivers left that can't easily stop setting private_data
> > manually, let's discuss them.
> >
> > > > >       /*
> > > > >        * We need to serialize streamon/off with queueing new requests.
> > > > >        * These ioctls may trigger the cancellation of a streaming
> > > > > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > > > > index 1b6222fab24eda96cbe459b435431c01f7259366..8e6e7799212cd07ae4ad3dfc85912c21a9bcab2d 100644
> > > > > --- a/include/media/v4l2-dev.h
> > > > > +++ b/include/media/v4l2-dev.h
> > > > > @@ -89,12 +89,18 @@ struct dentry;
> > > > >   *   set by the core when the sub-devices device nodes are registered with
> > > > >   *   v4l2_device_register_ro_subdev_nodes() and used by the sub-device ioctl
> > > > >   *   handler to restrict access to some ioctl calls.
> > > > > + * @V4L2_FL_USES_STATE:
> > > > > + *   indicates that the &struct video_device has state support.
> > > > > + *   The active video and metadata formats are stored in video_device.state,
> > > > > + *   and the try video and metadata formats are stored in v4l2_fh.state.
> > > > > + *   All new drivers should use it.
> > > > >   */
> > > > >  enum v4l2_video_device_flags {
> > > > >       V4L2_FL_REGISTERED              = 0,
> > > > >       V4L2_FL_USES_V4L2_FH            = 1,
> > > > >       V4L2_FL_QUIRK_INVERTED_CROP     = 2,
> > > > >       V4L2_FL_SUBDEV_RO_DEVNODE       = 3,
> > > > > +     V4L2_FL_USES_STATE              = 4,
> > > > >  };
> > > > >
> > > > >  /* Priority helper functions */
> > > > > @@ -214,6 +220,30 @@ struct v4l2_file_operations {
> > > > >       int (*release) (struct file *);
> > > > >  };
> > > > >
> > > > > +/**
> > > > > + * enum video_device_format_whence - Video device format type
> > > > > + *
> > > > > + * @V4L2_DEVICE_FORMAT_TRY: from VIDIOC_TRY_FMT, for negotiation only
> > > > > + * @V4L2_DEVICE_FORMAT_ACTIVE: from VIDIOC_S_FMT, applied to the device
> > > > > + */
> > > > > +enum video_device_format_whence {
> > > > > +     VIDEO_DEVICE_FORMAT_TRY = 0,
> > > > > +     VIDEO_DEVICE_FORMAT_ACTIVE = 1,
> > > > > +};
> > > >
> > > > I'm not sure we need these. More on this on the drivers
> > > > implementation in the next patches.
> >
> > I agree, this should not be needed at this point. The whole point of
> > states is that drivers should not care whether they're operating on a
> > TRY or ACTIVE state. There are exceptions with subdevs for historical
> > reasons, but we shouldn't repeat that here.
> >
> > It may make sense to later add TRY/ACTIVE identifiers for the UAPI, but
> > within drivers they should not be used. How about repurposing the
> > .try_fmt() and .s_fmt() ioctl handlers for drivers support states, by
> > using .try_fmt() first to adjust the format and store it in the state
> > (ACTIVE or TRY, that shouldn't matter to drivers), and then using
> > .s_fmt() to apply the state to the device ? The V4L2 core should call
> > .try_fmt() first followed by .s_fmt() when V4L2_FL_USES_STATE is set.
> > The vast majority of state-aware drivers will configure the device when
> > starting streaming, so they won't need to implement .s_fmt().
> >
> > Now that I wrote this, the plan may conflict with my comment above
> > regarding leaving the busy check in drivers. Let's figure that one
> > first, and see if we need to let drivers known on what state they're
> > operating. I think repurposing .try_fmt() and .s_fmt() should be done
> > regardless.
> >
> > > > > +
> > > > > +/**
> > > > > + * struct video_device_state - Used for storing video device state information.
> > > > > + *
> > > > > + * @vid_fmt: Format of the video capture stream
> > > > > + * @meta_fmt: Format of the metadata capture stream
> > > > > + * @which: is this a TRY or ACTIVE format?
> > > > > + */
> > > > > +struct video_device_state {
> > > > > +     struct v4l2_format vid_fmt;
> > > > > +     struct v4l2_format meta_fmt;
> > > > > +     enum video_device_format_whence which;
> > > > > +};
> > > > > +
> > > > >  /*
> > > > >   * Newer version of video_device, handled by videodev2.c
> > > > >   *   This version moves redundant code from video device code to
> > > > > @@ -238,6 +268,7 @@ struct v4l2_file_operations {
> > > > >   * @queue: &struct vb2_queue associated with this device node. May be NULL.
> > > > >   * @prio: pointer to &struct v4l2_prio_state with device's Priority state.
> > > > >   *    If NULL, then v4l2_dev->prio will be used.
> > > > > + * @state: &struct video_device_state, holds the active state for the device.
> > > > >   * @name: video device name
> > > > >   * @vfl_type: V4L device type, as defined by &enum vfl_devnode_type
> > > > >   * @vfl_dir: V4L receiver, transmitter or m2m
> > > > > @@ -283,6 +314,7 @@ struct video_device {
> > > > >       struct vb2_queue *queue;
> > > > >
> > > > >       struct v4l2_prio_state *prio;
> > > > > +     struct video_device_state state;
> > > >
> > > > One of the key design requirement it's the ability for drivers to
> > > > sub-class video_device_state. One possibile way to obtain this is to
> > > > dynamically allocate the state either by deferring to the driver's the
> > > > allocation (so that they can allocate a bigger structure) or by
> > > > passing to the framework the size it has to allocate.
> > > >
> > > > In any case, I'm afraid the state should be allocated dynamically,
> > > > either in the drivers' init_state() (or similar) callback or by the
> > > > framework with a size hint from the driver.
> > > >
> > > > What do you think ?
> > >
> > > Ah okay, I missed that. Should be possible to make this dynamically
> > > allocatable by the driver. It will also tie into Sakari's suggestion of
> > > creating a helper for initializing the state.
> >
> > Yes, I agree with Jacopo and Sakari here. The state should be
> > dynamically allocated, and you should add an operation to initialize it.
> >
> > > > >
> > > > >       /* device info */
> > > > >       char name[64];
> > > > > @@ -540,6 +572,26 @@ static inline int video_is_registered(struct video_device *vdev)
> > > > >       return test_bit(V4L2_FL_REGISTERED, &vdev->flags);
> > > > >  }
> > > > >
> > > > > +/**
> > > > > + * video_device_g_fmt_vid() - fill video v4l2_format from the state.
> > > > > + *
> > > > > + * @file: pointer to struct file
> > > > > + * @state: pointer to video device state
> > > > > + * @format: pointer to &struct v4l2_format
> > > > > + */
> > > > > +int video_device_g_fmt_vid(struct file *file, void *state,
> > > > > +                        struct v4l2_format *format);
> > > > > +
> > > > > +/**
> > > > > + * video_device_g_fmt_meta() - fill metadata v4l2_format from the state.
> > > > > + *
> > > > > + * @file: pointer to struct file
> > > > > + * @state: pointer to video device state
> > > > > + * @format: pointer to &struct v4l2_format
> > > > > + */
> > > > > +int video_device_g_fmt_meta(struct file *file, void *state,
> > > > > +                         struct v4l2_format *format);
> > > > > +
> > > > >  /**
> > > > >   * v4l2_debugfs_root - returns the dentry of the top-level "v4l2" debugfs dir
> > > > >   *
> > > > > diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
> > > > > index b5b3e00c8e6a0b082d9cd8a0c972a5094adcb6f2..02579f87ba99d0c849a0865f8cc4295446c39f94 100644
> > > > > --- a/include/media/v4l2-fh.h
> > > > > +++ b/include/media/v4l2-fh.h
> > > > > @@ -18,7 +18,8 @@
> > > > >  #include <linux/list.h>
> > > > >  #include <linux/videodev2.h>
> > > > >
> > > > > -struct video_device;
> > > > > +#include <media/v4l2-dev.h>
> > > > > +
> >
> > You will be able to go back to forward declarations once you replace the
> > state field below with a pointer.
> >
> > > > >  struct v4l2_ctrl_handler;
> > > > >
> > > > >  /**
> > > > > @@ -28,6 +29,7 @@ struct v4l2_ctrl_handler;
> > > > >   * @vdev: pointer to &struct video_device
> > > > >   * @ctrl_handler: pointer to &struct v4l2_ctrl_handler
> > > > >   * @prio: priority of the file handler, as defined by &enum v4l2_priority
> > > > > + * @state: try state used for format negotiation on the video device
> > > > >   *
> > > > >   * @wait: event' s wait queue
> > > > >   * @subscribe_lock: serialise changes to the subscribed list; guarantee that
> > > > > @@ -44,6 +46,7 @@ struct v4l2_fh {
> > > > >       struct video_device     *vdev;
> > > > >       struct v4l2_ctrl_handler *ctrl_handler;
> > > > >       enum v4l2_priority      prio;
> > > > > +     struct video_device_state state;
> > > > >
> > > > >       /* Events */
> > > > >       wait_queue_head_t       wait;
> > > > >

-- 
Regards,

Laurent Pinchart


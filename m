Return-Path: <linux-media+bounces-43349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2E6BA9CF7
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 17:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCC703C5B6D
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 15:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F083030BB9F;
	Mon, 29 Sep 2025 15:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VX9D7lW9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE1D433AD;
	Mon, 29 Sep 2025 15:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759160008; cv=none; b=h+J6gWmMPT4gV+EtiiTneX5MyBq5lEx9AEjkTE1ukyKJAxao3gzgv/RCzVISBuuADNZOZsSEJ2p6Tq6lBBLX+BPE6nzqy8SV8Hhq7BK6IptAle8djFE7YFtQ/62anFVtRN8sb2pZvRpb27fZTqZC5cHGl7vxijqkoUyj0rBijmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759160008; c=relaxed/simple;
	bh=sfLMXmfWvs2wJFOn+7tjg/2C6RHUF1SzZiCezqrPFOU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GXK7KKmLUxiV9cYST/zj5boNONQ8UkTPK+O743oY5Vn6+fW6wo6WifEoVUnZKAxO8fuY8CWaCK4ZINXaFr2s7BJ7hjIbgFIvGjCvvOaW86xGKvrDQo2Q974TXhc66iZaPv1/BS9dLxe8wy5YSuJScgiJzvXCYHSWLwF4VM9DuEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VX9D7lW9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.87.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BCB44C7;
	Mon, 29 Sep 2025 17:31:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759159913;
	bh=sfLMXmfWvs2wJFOn+7tjg/2C6RHUF1SzZiCezqrPFOU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VX9D7lW9nUS5IQ1lkhLfLvDPe2hFb+E2cqItkJtuobWydMaOVmk4/h+cnWUuy6fEi
	 uT1lJXspEb1ZsuTVM4WSqKEzbxFT7zRYWTT1joAlg9QPDtPITe9pNrFXjnsJT/ZStY
	 Y1dpwZSi0xZEGbN7igkE7k9V+WYfD5ob+KjYAidI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9beb643b-603d-46e8-9c1d-cd8060548507@kernel.org>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com> <20250919-vdev-state-v2-1-b2c42426965c@ideasonboard.com> <15df046b-0fe1-4b57-acad-66b88beac982@kernel.org> <9beb643b-603d-46e8-9c1d-cd8060548507@kernel.org>
Subject: Re: [PATCH v2 01/10] media: v4l2-core: Introduce state management for video devices
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Al Viro <viro@zeniv.linux.org.uk>, Ma Ke <make24@iscas.ac.cn>, linux-kernel@vger.kernel.org
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org
Date: Mon, 29 Sep 2025 21:00:51 +0530
Message-ID: <175915985176.11386.11080057428921957743@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Hans,

Thanks for the review.

Quoting Hans Verkuil (2025-09-22 13:30:05)
> On 22/09/2025 09:44, Hans Verkuil wrote:
> > Hi Jai,
> >=20
> > Apologies that I had no time to review v1, but I'll review v2 today.
> >=20
> > On 19/09/2025 11:55, Jai Luthra wrote:
> >> Similar to V4L2 subdev states, introduce state support for video devic=
es
> >> to provide a centralized location for storing device state information.
> >> This includes the current (active) pixelformat used by the device and
> >> the temporary (try) pixelformat used during format negotiation. In the
> >> future, this may be extended or subclassed by device drivers to store
> >> their internal state variables.
> >>
> >> Also introduce a flag for drivers that wish to use this state
> >> management. When set, the framework automatically allocates the state
> >> during device registration and stores a pointer to it within the
> >> video_device structure.
> >>
> >> This change aligns video devices with V4L2 subdevices by storing
> >> hardware state in a common framework-allocated structure. This is the
> >> first step towards enabling the multiplexing of the underlying hardware
> >> by using different software "contexts", each represented by the combin=
ed
> >> state of all video devices and V4L2 subdevices in a complex media grap=
h.
> >>
> >> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> >> --
> >> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> >> Cc: Hans Verkuil <hverkuil@kernel.org>
> >> Cc: Ricardo Ribalda <ribalda@chromium.org>
> >> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >> Cc: Al Viro <viro@zeniv.linux.org.uk>
> >> Cc: Ma Ke <make24@iscas.ac.cn>
> >> Cc: Jai Luthra <jai.luthra@ideasonboard.com>
> >> Cc: linux-media@vger.kernel.org
> >> Cc: linux-kernel@vger.kernel.org
> >> ---
> >>  drivers/media/v4l2-core/v4l2-dev.c | 27 +++++++++++++++++++++++++
> >>  include/media/v4l2-dev.h           | 40 +++++++++++++++++++++++++++++=
+++++++++
> >>  2 files changed, 67 insertions(+)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-c=
ore/v4l2-dev.c
> >> index 10a126e50c1ca25b1bd0e9872571261acfc26b39..997255709448510fcd17b6=
de798a3df99cd7ea09 100644
> >> --- a/drivers/media/v4l2-core/v4l2-dev.c
> >> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> >> @@ -163,6 +163,27 @@ void video_device_release_empty(struct video_devi=
ce *vdev)
> >>  }
> >>  EXPORT_SYMBOL(video_device_release_empty);
> >> =20
> >> +struct video_device_state *
> >> +__video_device_state_alloc(struct video_device *vdev)
> >> +{
> >> +    struct video_device_state *state =3D
> >> +            kzalloc(sizeof(struct video_device_state), GFP_KERNEL);
> >> +
> >> +    if (!state)
> >> +            return ERR_PTR(-ENOMEM);
> >> +
> >> +    state->vdev =3D vdev;
> >> +
> >> +    return state;
> >> +}
> >> +EXPORT_SYMBOL_GPL(__video_device_state_alloc);
> >> +
> >> +void __video_device_state_free(struct video_device_state *state)
> >> +{
> >> +    kfree(state);
> >> +}
> >> +EXPORT_SYMBOL_GPL(__video_device_state_free);
> >> +
> >>  static inline void video_get(struct video_device *vdev)
> >>  {
> >>      get_device(&vdev->dev);
> >> @@ -939,6 +960,10 @@ int __video_register_device(struct video_device *=
vdev,
> >>      spin_lock_init(&vdev->fh_lock);
> >>      INIT_LIST_HEAD(&vdev->fh_list);
> >> =20
> >> +    /* state support */
> >> +    if (test_bit(V4L2_FL_USES_STATE, &vdev->flags))
> >> +            vdev->state =3D __video_device_state_alloc(vdev);
> >> +
> >>      /* Part 1: check device type */
> >>      switch (type) {
> >>      case VFL_TYPE_VIDEO:
> >> @@ -1127,6 +1152,8 @@ void video_unregister_device(struct video_device=
 *vdev)
> >>      clear_bit(V4L2_FL_REGISTERED, &vdev->flags);
> >>      mutex_unlock(&videodev_lock);
> >>      v4l2_event_wake_all(vdev);
> >> +    if (test_bit(V4L2_FL_USES_STATE, &vdev->flags))
> >> +            __video_device_state_free(vdev->state);
> >>      device_unregister(&vdev->dev);
> >>  }
> >>  EXPORT_SYMBOL(video_unregister_device);
> >> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> >> index a213c3398dcf60be8c531df87bf40c56b4ad772d..57e4691ef467aa2b0782dd=
4b8357bd0670643293 100644
> >> --- a/include/media/v4l2-dev.h
> >> +++ b/include/media/v4l2-dev.h
> >> @@ -89,12 +89,18 @@ struct dentry;
> >>   *  set by the core when the sub-devices device nodes are registered =
with
> >>   *  v4l2_device_register_ro_subdev_nodes() and used by the sub-device=
 ioctl
> >>   *  handler to restrict access to some ioctl calls.
> >> + * @V4L2_FL_USES_STATE:
> >> + *  indicates that the &struct video_device has state support.
> >> + *  The active video and metadata formats are stored in video_device.=
state,
> >> + *  and the try video and metadata formats are stored in v4l2_fh.stat=
e.
> >> + *  All new drivers should use it.
> >>   */
> >>  enum v4l2_video_device_flags {
> >>      V4L2_FL_REGISTERED              =3D 0,
> >>      V4L2_FL_USES_V4L2_FH            =3D 1,
> >>      V4L2_FL_QUIRK_INVERTED_CROP     =3D 2,
> >>      V4L2_FL_SUBDEV_RO_DEVNODE       =3D 3,
> >> +    V4L2_FL_USES_STATE              =3D 4,
> >>  };
> >> =20
> >>  /* Priority helper functions */
> >> @@ -214,6 +220,17 @@ struct v4l2_file_operations {
> >>      int (*release) (struct file *);
> >>  };
> >> =20
> >> +/**
> >> + * struct video_device_state - Used for storing video device state in=
formation.
> >> + *
> >> + * @fmt: Format of the capture stream
> >> + * @vdev: Pointer to video device
> >> + */
> >> +struct video_device_state {
> >> +    struct v4l2_format fmt;
> >=20
> > While typically a video_device supports only a single video format type=
, that is
> > not always the case. There are the following exceptions:
> >=20
> > 1) M2M devices have both a capture and output video format. However, fo=
r M2M devices
> >    the state is per-filehandle, so it shouldn't be stored in a video_de=
vice_state
> >    struct anyway.

Ah I see, so for M2M devices the formats are stored per-context, where the
context is tied to the filehandle. In that case, I agree that storing the
format state inside struct video_device would not work.

> > 2) VBI devices can have both a raw and sliced VBI format (either captur=
e or output)
> > 3) AFAIK non-M2M video devices can have both a video and meta format. T=
hat may have
> >    changed, I'm not 100% certain about this.

RPi CFE driver is one such case, where a single driver structure stores
both metadata and video format. But if I understand correctly, it creates
separate video device nodes for metadata and video capture, so it can be
managed through a single v4l2_format.fmt union for each video device.

Are there any non-M2M drivers which allow more than one type of formats to
be set on the same device node?

> > 4) video devices can also support an OVERLAY or OUTPUT_OVERLAY format (=
rare)
> >=20
> > V4L2_CAP_VIDEO_OVERLAY is currently only used in
> > drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c, so once =
that driver
> > disappears we can drop video overlay support for capture devices.

Yes, bcm2835-camera should be dropped hopefully in a couple more revisions =
of
https://lore.kernel.org/all/20250907-vchiq-destage-v2-4-6884505dca78@ideaso=
nboard.com/

> >=20
> > 2-4 are all quite rare, but 1 is very common. But for such devices the =
state
> > wouldn't be in video_device anyway.
> >=20
> > But it would be nice if the same struct can be used in both m2m devices=
 and non-m2m
> > devices. It's just stored either in struct v4l2_fh or struct video_devi=
ce. It would
> > give a lot of opportunities for creating helper functions to make the l=
ife for
> > driver developers easier.

Sure, I think we can modify the existing state struct to store both capture
and output formats, and keep it inside struct v4l2_fh for M2M devices.

This will definitely be confusing for driver developers, as currently the
two example patches in this series access the state directly. So I will add
framework helpers to access the correct state and format type, and document
properly that it should never be accessed manually by drivers.

>=20
> Follow-up: assuming we want to support M2M devices as well (I think we sh=
ould), then
> consider renaming video_device_state since it isn't video_device specific=
, i.e. it
> can either live in video_device or in v4l2_fh, and in the latter case you=
'd have
> two instances: capture and output state.

Argh, naming is the hardest problem :-)
Do you have any suggestions?

I personally don't think video_device_state is a bad name, even if it is
stored somewhere else for m2m devices, given it is still the "state" of the
video device, even if it is not persistent across multiple file opens.

I was trying to avoid names with "context" in then, so it does not clash
with Jacopo's work.

>=20
> Regards,
>=20
>         Hans
>=20
> >=20
> > Regards,
> >=20
> >       Hans
> >=20
> >> +    struct video_device *vdev;
> >> +};
> >> +
> >>  /*
> >>   * Newer version of video_device, handled by videodev2.c
> >>   *  This version moves redundant code from video device code to
> >> @@ -238,6 +255,7 @@ struct v4l2_file_operations {
> >>   * @queue: &struct vb2_queue associated with this device node. May be=
 NULL.
> >>   * @prio: pointer to &struct v4l2_prio_state with device's Priority s=
tate.
> >>   *   If NULL, then v4l2_dev->prio will be used.
> >> + * @state: &struct video_device_state, holds the active state for the=
 device.
> >>   * @name: video device name
> >>   * @vfl_type: V4L device type, as defined by &enum vfl_devnode_type
> >>   * @vfl_dir: V4L receiver, transmitter or m2m
> >> @@ -283,6 +301,7 @@ struct video_device {
> >>      struct vb2_queue *queue;
> >> =20
> >>      struct v4l2_prio_state *prio;
> >> +    struct video_device_state *state;
> >> =20
> >>      /* device info */
> >>      char name[64];
> >> @@ -546,6 +565,27 @@ static inline int video_is_registered(struct vide=
o_device *vdev)
> >>      return test_bit(V4L2_FL_REGISTERED, &vdev->flags);
> >>  }
> >> =20
> >> +/** __video_device_state_alloc - allocate video device state structure
> >> + *
> >> + * @vdev: pointer to struct video_device
> >> + *
> >> + * .. note::
> >> + *
> >> + *  This function is meant to be used only inside the V4L2 core.
> >> + */
> >> +struct video_device_state *
> >> +__video_device_state_alloc(struct video_device *vdev);
> >> +
> >> +/** __video_device_state_free - free video device state structure
> >> + *
> >> + * @state: pointer to the state to be freed
> >> + *
> >> + * .. note::
> >> + *
> >> + *  This function is meant to be used only inside the V4L2 core.
> >> + */
> >> +void __video_device_state_free(struct video_device_state *state);
> >> +
> >>  /**
> >>   * v4l2_debugfs_root - returns the dentry of the top-level "v4l2" deb=
ugfs dir
> >>   *
> >>
> >=20
> >=20
>=20

Thanks,
Jai


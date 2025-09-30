Return-Path: <linux-media+bounces-43409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77586BABD20
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 09:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01FE53C703C
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 07:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87972BE7CB;
	Tue, 30 Sep 2025 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a4vQ3Wci"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83125296BBF;
	Tue, 30 Sep 2025 07:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759217172; cv=none; b=Ute5bocYwa33leCPKh2OlgYduexJsSn4AKZ4+2QdEl9+7ZdO80WslqCnOgxY0azlT4tp+x96LC9MSzRfJ5k+IUeQs5dXVPEJ9a/XUbFCRRGmODieHkmsfJYsRHi3qeUkdv+Y7oeeSGTffP0Y6eJ86wnuXKZ4Iz5liomIV2wT5QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759217172; c=relaxed/simple;
	bh=DIi5TtpRpKKfTKze+UIR5xvneKDXjdWMJWKcV1W7QOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsjnF84AqLg0U7GPhM+FeO9Ffcwa4QZPRNNxOd0i2HFB4jJJzAaghLBbUa1iCiUfpVn//UYRbNv4+Rasqh3Bp1VEmiZHrZZfG2qb9i5M6bXa0/z5+pUlnCsIVOowHQdUtj03YwkdgFtAoiUqfX6h+xaM+JbKnmBz56gsu4rZOds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a4vQ3Wci; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84A4C42B;
	Tue, 30 Sep 2025 09:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759217079;
	bh=DIi5TtpRpKKfTKze+UIR5xvneKDXjdWMJWKcV1W7QOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a4vQ3Wci2Sk0h79h0csuFIuLPaMIOXE5r1/c2/UpMss5La3L/fq0sR8NpZq2C8KHM
	 kw6THwHcl6OqheH9pRxFQ/c5eMfpcXgFoAljxdeeSlq2NHI18RmY1gCZnYygDFRSAP
	 p1phDfIZWPknsRwtuFYN0t4bAeNujbCMtZU0myPA=
Date: Tue, 30 Sep 2025 09:26:04 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	Ricardo Ribalda <ribalda@chromium.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Ma Ke <make24@iscas.ac.cn>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] media: v4l2-core: Introduce state management
 for video devices
Message-ID: <7cqxqg3b7iad7qhm76rvj6dxni4p3h3x5c2y6pu57ogsgamncq@73uomzq3prxm>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
 <20250919-vdev-state-v2-1-b2c42426965c@ideasonboard.com>
 <15df046b-0fe1-4b57-acad-66b88beac982@kernel.org>
 <9beb643b-603d-46e8-9c1d-cd8060548507@kernel.org>
 <175915985176.11386.11080057428921957743@freya>
 <27c413a0-3912-4072-a4a9-871515a946ff@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <27c413a0-3912-4072-a4a9-871515a946ff@collabora.com>

Hi Michael

On Mon, Sep 29, 2025 at 10:02:41PM +0200, Michael Riesch wrote:
> Hi Jai,
>
> Thanks for your efforts! Could you include me in Cc: in the next
> iteration, please?
>
> On 9/29/25 17:30, Jai Luthra wrote:
> > Hi Hans,
> >
> > Thanks for the review.
> >
> > Quoting Hans Verkuil (2025-09-22 13:30:05)
> >> On 22/09/2025 09:44, Hans Verkuil wrote:
> >>> Hi Jai,
> >>>
> >>> Apologies that I had no time to review v1, but I'll review v2 today.
> >>>
> >>> On 19/09/2025 11:55, Jai Luthra wrote:
> >>>> Similar to V4L2 subdev states, introduce state support for video devices
> >>>> to provide a centralized location for storing device state information.
> >>>> This includes the current (active) pixelformat used by the device and
> >>>> the temporary (try) pixelformat used during format negotiation. In the
> >>>> future, this may be extended or subclassed by device drivers to store
> >>>> their internal state variables.
> >>>>
> >>>> Also introduce a flag for drivers that wish to use this state
> >>>> management. When set, the framework automatically allocates the state
> >>>> during device registration and stores a pointer to it within the
> >>>> video_device structure.
> >>>>
> >>>> This change aligns video devices with V4L2 subdevices by storing
> >>>> hardware state in a common framework-allocated structure. This is the
> >>>> first step towards enabling the multiplexing of the underlying hardware
> >>>> by using different software "contexts", each represented by the combined
> >>>> state of all video devices and V4L2 subdevices in a complex media graph.
>
> Could you elaborate a bit on how (sub)device states and the future

Sure
https://patchwork.linuxtv.org/project/linux-media/patch/20250724-multicontext-mainline-2025-v2-12-c9b316773486@ideasonboard.com/

> contexts will be related? Based on the description above, I imagine that
> at some point there will be a context data structure that contains all
> (sub) device states, and when a certain context becomes active, the

Not all states, a single state.

There will be
1) One state per context
2) One state per open-file handle
3) One state per subdevice

If the driver supports contexts 1) will be used for active and 2) for
try.

If the driver doesn't support contexts 3) will be used for activer and
2) for try.

It's a bit more complex than this as we also have a default context in
the subdev to support drivers that are context-aware but are operated
by context-unaware userspace.

Happy to discuss this more on the actual context series.

> states are passed and applied to the (sub)devices. But this is only my
> imagination here. It would be great to know the overall concept here.
>
> >>>>
> >>>> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> >>>> --
> >>>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> >>>> Cc: Hans Verkuil <hverkuil@kernel.org>
> >>>> Cc: Ricardo Ribalda <ribalda@chromium.org>
> >>>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>>> Cc: Al Viro <viro@zeniv.linux.org.uk>
> >>>> Cc: Ma Ke <make24@iscas.ac.cn>
> >>>> Cc: Jai Luthra <jai.luthra@ideasonboard.com>
> >>>> Cc: linux-media@vger.kernel.org
> >>>> Cc: linux-kernel@vger.kernel.org
> >>>> ---
> >>>>  drivers/media/v4l2-core/v4l2-dev.c | 27 +++++++++++++++++++++++++
> >>>>  include/media/v4l2-dev.h           | 40 ++++++++++++++++++++++++++++++++++++++
> >>>>  2 files changed, 67 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> >>>> index 10a126e50c1ca25b1bd0e9872571261acfc26b39..997255709448510fcd17b6de798a3df99cd7ea09 100644
> >>>> --- a/drivers/media/v4l2-core/v4l2-dev.c
> >>>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> >>>> @@ -163,6 +163,27 @@ void video_device_release_empty(struct video_device *vdev)
> >>>>  }
> >>>>  EXPORT_SYMBOL(video_device_release_empty);
> >>>>
> >>>> +struct video_device_state *
> >>>> +__video_device_state_alloc(struct video_device *vdev)
> >>>> +{
> >>>> +    struct video_device_state *state =
> >>>> +            kzalloc(sizeof(struct video_device_state), GFP_KERNEL);
> >>>> +
> >>>> +    if (!state)
> >>>> +            return ERR_PTR(-ENOMEM);
> >>>> +
> >>>> +    state->vdev = vdev;
> >>>> +
> >>>> +    return state;
> >>>> +}
> >>>> +EXPORT_SYMBOL_GPL(__video_device_state_alloc);
> >>>> +
> >>>> +void __video_device_state_free(struct video_device_state *state)
> >>>> +{
> >>>> +    kfree(state);
> >>>> +}
> >>>> +EXPORT_SYMBOL_GPL(__video_device_state_free);
> >>>> +
> >>>>  static inline void video_get(struct video_device *vdev)
> >>>>  {
> >>>>      get_device(&vdev->dev);
> >>>> @@ -939,6 +960,10 @@ int __video_register_device(struct video_device *vdev,
> >>>>      spin_lock_init(&vdev->fh_lock);
> >>>>      INIT_LIST_HEAD(&vdev->fh_list);
> >>>>
> >>>> +    /* state support */
> >>>> +    if (test_bit(V4L2_FL_USES_STATE, &vdev->flags))
> >>>> +            vdev->state = __video_device_state_alloc(vdev);
> >>>> +
> >>>>      /* Part 1: check device type */
> >>>>      switch (type) {
> >>>>      case VFL_TYPE_VIDEO:
> >>>> @@ -1127,6 +1152,8 @@ void video_unregister_device(struct video_device *vdev)
> >>>>      clear_bit(V4L2_FL_REGISTERED, &vdev->flags);
> >>>>      mutex_unlock(&videodev_lock);
> >>>>      v4l2_event_wake_all(vdev);
> >>>> +    if (test_bit(V4L2_FL_USES_STATE, &vdev->flags))
> >>>> +            __video_device_state_free(vdev->state);
> >>>>      device_unregister(&vdev->dev);
> >>>>  }
> >>>>  EXPORT_SYMBOL(video_unregister_device);
> >>>> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> >>>> index a213c3398dcf60be8c531df87bf40c56b4ad772d..57e4691ef467aa2b0782dd4b8357bd0670643293 100644
> >>>> --- a/include/media/v4l2-dev.h
> >>>> +++ b/include/media/v4l2-dev.h
> >>>> @@ -89,12 +89,18 @@ struct dentry;
> >>>>   *  set by the core when the sub-devices device nodes are registered with
> >>>>   *  v4l2_device_register_ro_subdev_nodes() and used by the sub-device ioctl
> >>>>   *  handler to restrict access to some ioctl calls.
> >>>> + * @V4L2_FL_USES_STATE:
> >>>> + *  indicates that the &struct video_device has state support.
> >>>> + *  The active video and metadata formats are stored in video_device.state,
> >>>> + *  and the try video and metadata formats are stored in v4l2_fh.state.
> >>>> + *  All new drivers should use it.
> >>>>   */
> >>>>  enum v4l2_video_device_flags {
> >>>>      V4L2_FL_REGISTERED              = 0,
> >>>>      V4L2_FL_USES_V4L2_FH            = 1,
> >>>>      V4L2_FL_QUIRK_INVERTED_CROP     = 2,
> >>>>      V4L2_FL_SUBDEV_RO_DEVNODE       = 3,
> >>>> +    V4L2_FL_USES_STATE              = 4,
> >>>>  };
> >>>>
> >>>>  /* Priority helper functions */
> >>>> @@ -214,6 +220,17 @@ struct v4l2_file_operations {
> >>>>      int (*release) (struct file *);
> >>>>  };
> >>>>
> >>>> +/**
> >>>> + * struct video_device_state - Used for storing video device state information.
> >>>> + *
> >>>> + * @fmt: Format of the capture stream
> >>>> + * @vdev: Pointer to video device
>
> What else do you envisage to be included in the state?
>
> >>>> + */
> >>>> +struct video_device_state {
> >>>> +    struct v4l2_format fmt;
> >>>
> >>> While typically a video_device supports only a single video format type, that is
> >>> not always the case. There are the following exceptions:
> >>>
> >>> 1) M2M devices have both a capture and output video format. However, for M2M devices
> >>>    the state is per-filehandle, so it shouldn't be stored in a video_device_state
> >>>    struct anyway.
> >
> > Ah I see, so for M2M devices the formats are stored per-context, where the
> > context is tied to the filehandle. In that case, I agree that storing the
> > format state inside struct video_device would not work.
> >
> >>> 2) VBI devices can have both a raw and sliced VBI format (either capture or output)
> >>> 3) AFAIK non-M2M video devices can have both a video and meta format. That may have
> >>>    changed, I'm not 100% certain about this.
> >
> > RPi CFE driver is one such case, where a single driver structure stores
> > both metadata and video format. But if I understand correctly, it creates
> > separate video device nodes for metadata and video capture, so it can be
> > managed through a single v4l2_format.fmt union for each video device.
> >
> > Are there any non-M2M drivers which allow more than one type of formats to
> > be set on the same device node?
> >
> >>> 4) video devices can also support an OVERLAY or OUTPUT_OVERLAY format (rare)
> >>>
> >>> V4L2_CAP_VIDEO_OVERLAY is currently only used in
> >>> drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c, so once that driver
> >>> disappears we can drop video overlay support for capture devices.
> >
> > Yes, bcm2835-camera should be dropped hopefully in a couple more revisions of
> > https://lore.kernel.org/all/20250907-vchiq-destage-v2-4-6884505dca78@ideasonboard.com/
> >
> >>>
> >>> 2-4 are all quite rare, but 1 is very common. But for such devices the state
> >>> wouldn't be in video_device anyway.
> >>>
> >>> But it would be nice if the same struct can be used in both m2m devices and non-m2m
> >>> devices. It's just stored either in struct v4l2_fh or struct video_device. It would
> >>> give a lot of opportunities for creating helper functions to make the life for
> >>> driver developers easier.
> >
> > Sure, I think we can modify the existing state struct to store both capture
> > and output formats, and keep it inside struct v4l2_fh for M2M devices.
> >
> > This will definitely be confusing for driver developers, as currently the
> > two example patches in this series access the state directly. So I will add
> > framework helpers to access the correct state and format type, and document
> > properly that it should never be accessed manually by drivers.
>
> Would that be a similar approach as in v4l2_subdev_state?
>
> >> Follow-up: assuming we want to support M2M devices as well (I think we should), then
> >> consider renaming video_device_state since it isn't video_device specific, i.e. it
> >> can either live in video_device or in v4l2_fh, and in the latter case you'd have
> >> two instances: capture and output state.
> >
> > Argh, naming is the hardest problem :-)
> > Do you have any suggestions?
> >
> > I personally don't think video_device_state is a bad name, even if it is
> > stored somewhere else for m2m devices, given it is still the "state" of the
> > video device, even if it is not persistent across multiple file opens.
> >
> > I was trying to avoid names with "context" in then, so it does not clash
> > with Jacopo's work.
>
> It would be interesting how contexts (the new ones from Jacopo's series)
> are applied to mem2mem devices. And again, how the state introduced here
> is related to the (new) context.
>
> Best regards,
> Michael
>
> >
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> Regards,
> >>>
> >>>       Hans
> >>>
> >>>> +    struct video_device *vdev;
> >>>> +};
> >>>> +
> >>>>  /*
> >>>>   * Newer version of video_device, handled by videodev2.c
> >>>>   *  This version moves redundant code from video device code to
> >>>> @@ -238,6 +255,7 @@ struct v4l2_file_operations {
> >>>>   * @queue: &struct vb2_queue associated with this device node. May be NULL.
> >>>>   * @prio: pointer to &struct v4l2_prio_state with device's Priority state.
> >>>>   *   If NULL, then v4l2_dev->prio will be used.
> >>>> + * @state: &struct video_device_state, holds the active state for the device.
> >>>>   * @name: video device name
> >>>>   * @vfl_type: V4L device type, as defined by &enum vfl_devnode_type
> >>>>   * @vfl_dir: V4L receiver, transmitter or m2m
> >>>> @@ -283,6 +301,7 @@ struct video_device {
> >>>>      struct vb2_queue *queue;
> >>>>
> >>>>      struct v4l2_prio_state *prio;
> >>>> +    struct video_device_state *state;
> >>>>
> >>>>      /* device info */
> >>>>      char name[64];
> >>>> @@ -546,6 +565,27 @@ static inline int video_is_registered(struct video_device *vdev)
> >>>>      return test_bit(V4L2_FL_REGISTERED, &vdev->flags);
> >>>>  }
> >>>>
> >>>> +/** __video_device_state_alloc - allocate video device state structure
> >>>> + *
> >>>> + * @vdev: pointer to struct video_device
> >>>> + *
> >>>> + * .. note::
> >>>> + *
> >>>> + *  This function is meant to be used only inside the V4L2 core.
> >>>> + */
> >>>> +struct video_device_state *
> >>>> +__video_device_state_alloc(struct video_device *vdev);
> >>>> +
> >>>> +/** __video_device_state_free - free video device state structure
> >>>> + *
> >>>> + * @state: pointer to the state to be freed
> >>>> + *
> >>>> + * .. note::
> >>>> + *
> >>>> + *  This function is meant to be used only inside the V4L2 core.
> >>>> + */
> >>>> +void __video_device_state_free(struct video_device_state *state);
> >>>> +
> >>>>  /**
> >>>>   * v4l2_debugfs_root - returns the dentry of the top-level "v4l2" debugfs dir
> >>>>   *
> >>>>
> >>>
> >>>
> >>
> >
> > Thanks,
> > Jai
> >
>


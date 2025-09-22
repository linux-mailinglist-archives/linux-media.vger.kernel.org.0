Return-Path: <linux-media+bounces-42900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D27BEB8F538
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 09:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 885E13BF2DD
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 07:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4862F6179;
	Mon, 22 Sep 2025 07:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Woo2QBeN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717608F40;
	Mon, 22 Sep 2025 07:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758527047; cv=none; b=ekDVzkehsG/cPTEnSOpaqjRiStMLpW2pk+oxfXd8BjSGQmyHxIZ6zy1iba6SjZGmSnt7WttHGFj/Uc3x1f2rpaoKCEQ+03HRHZfdmzmCpOuWWxJuYoOrMPWl4GEXVeDn/0coTyi6a1wwh+y/bJa0C5BIMi3qWPVG3v8my0jdL6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758527047; c=relaxed/simple;
	bh=xTJmutZRe2xmXyQhek9lOtpNGYD49Simt+rFNAEbuJQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Oe2Akk2D9IVh1YjMM5O4XTKniY0BF2Q1nEQF9FTklJ0l0QJGHeN18UWd8VjcbklZ30hw6oMN8iji8NQpZuCNzJRcWCwTBolEPtEtgqyKGG7awOcrEIzB46DD+i53TOAXPAgie4PCCuAVDZS3uQcr66WdP47HvrdeNZLHDdGgtP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Woo2QBeN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E58BC4CEF0;
	Mon, 22 Sep 2025 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758527047;
	bh=xTJmutZRe2xmXyQhek9lOtpNGYD49Simt+rFNAEbuJQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Woo2QBeNR0jRVE685higrpHvwMEnNOtNZrQrOp24TSeJ+WgE/35Cun4Ba76LH7fln
	 xuczEcsyEGk0I40iIXeCvDOjQkogpdaIKN6YIPmfi6f4fPeszqegaQgCW/9bxUr96S
	 5bym8Zpv4vdt3wM9XMZbPabCP0dhduXiFIfUold4q78UmMua9SNryOa+vh3KO5rszN
	 X2rMuzLCR106XhSlbcdj8COSkSCOYA3sRDCILGzV60QIUq+Yl4re5+xMqBjHx3pP7/
	 m8Kqmvl1TP/R7o7DaFhOnqQKhfiStTbilkqZt+EwRXjc87adVBubqpaZGBPtFhPe1T
	 s3tHTZ3dZUnyQ==
Message-ID: <15df046b-0fe1-4b57-acad-66b88beac982@kernel.org>
Date: Mon, 22 Sep 2025 09:44:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 01/10] media: v4l2-core: Introduce state management for
 video devices
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Ma Ke <make24@iscas.ac.cn>,
 linux-kernel@vger.kernel.org
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
 <20250919-vdev-state-v2-1-b2c42426965c@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250919-vdev-state-v2-1-b2c42426965c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jai,

Apologies that I had no time to review v1, but I'll review v2 today.

On 19/09/2025 11:55, Jai Luthra wrote:
> Similar to V4L2 subdev states, introduce state support for video devices
> to provide a centralized location for storing device state information.
> This includes the current (active) pixelformat used by the device and
> the temporary (try) pixelformat used during format negotiation. In the
> future, this may be extended or subclassed by device drivers to store
> their internal state variables.
> 
> Also introduce a flag for drivers that wish to use this state
> management. When set, the framework automatically allocates the state
> during device registration and stores a pointer to it within the
> video_device structure.
> 
> This change aligns video devices with V4L2 subdevices by storing
> hardware state in a common framework-allocated structure. This is the
> first step towards enabling the multiplexing of the underlying hardware
> by using different software "contexts", each represented by the combined
> state of all video devices and V4L2 subdevices in a complex media graph.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> --
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Hans Verkuil <hverkuil@kernel.org>
> Cc: Ricardo Ribalda <ribalda@chromium.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: Jai Luthra <jai.luthra@ideasonboard.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 27 +++++++++++++++++++++++++
>  include/media/v4l2-dev.h           | 40 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 10a126e50c1ca25b1bd0e9872571261acfc26b39..997255709448510fcd17b6de798a3df99cd7ea09 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -163,6 +163,27 @@ void video_device_release_empty(struct video_device *vdev)
>  }
>  EXPORT_SYMBOL(video_device_release_empty);
>  
> +struct video_device_state *
> +__video_device_state_alloc(struct video_device *vdev)
> +{
> +	struct video_device_state *state =
> +		kzalloc(sizeof(struct video_device_state), GFP_KERNEL);
> +
> +	if (!state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	state->vdev = vdev;
> +
> +	return state;
> +}
> +EXPORT_SYMBOL_GPL(__video_device_state_alloc);
> +
> +void __video_device_state_free(struct video_device_state *state)
> +{
> +	kfree(state);
> +}
> +EXPORT_SYMBOL_GPL(__video_device_state_free);
> +
>  static inline void video_get(struct video_device *vdev)
>  {
>  	get_device(&vdev->dev);
> @@ -939,6 +960,10 @@ int __video_register_device(struct video_device *vdev,
>  	spin_lock_init(&vdev->fh_lock);
>  	INIT_LIST_HEAD(&vdev->fh_list);
>  
> +	/* state support */
> +	if (test_bit(V4L2_FL_USES_STATE, &vdev->flags))
> +		vdev->state = __video_device_state_alloc(vdev);
> +
>  	/* Part 1: check device type */
>  	switch (type) {
>  	case VFL_TYPE_VIDEO:
> @@ -1127,6 +1152,8 @@ void video_unregister_device(struct video_device *vdev)
>  	clear_bit(V4L2_FL_REGISTERED, &vdev->flags);
>  	mutex_unlock(&videodev_lock);
>  	v4l2_event_wake_all(vdev);
> +	if (test_bit(V4L2_FL_USES_STATE, &vdev->flags))
> +		__video_device_state_free(vdev->state);
>  	device_unregister(&vdev->dev);
>  }
>  EXPORT_SYMBOL(video_unregister_device);
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index a213c3398dcf60be8c531df87bf40c56b4ad772d..57e4691ef467aa2b0782dd4b8357bd0670643293 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -89,12 +89,18 @@ struct dentry;
>   *	set by the core when the sub-devices device nodes are registered with
>   *	v4l2_device_register_ro_subdev_nodes() and used by the sub-device ioctl
>   *	handler to restrict access to some ioctl calls.
> + * @V4L2_FL_USES_STATE:
> + *	indicates that the &struct video_device has state support.
> + *	The active video and metadata formats are stored in video_device.state,
> + *	and the try video and metadata formats are stored in v4l2_fh.state.
> + *	All new drivers should use it.
>   */
>  enum v4l2_video_device_flags {
>  	V4L2_FL_REGISTERED		= 0,
>  	V4L2_FL_USES_V4L2_FH		= 1,
>  	V4L2_FL_QUIRK_INVERTED_CROP	= 2,
>  	V4L2_FL_SUBDEV_RO_DEVNODE	= 3,
> +	V4L2_FL_USES_STATE		= 4,
>  };
>  
>  /* Priority helper functions */
> @@ -214,6 +220,17 @@ struct v4l2_file_operations {
>  	int (*release) (struct file *);
>  };
>  
> +/**
> + * struct video_device_state - Used for storing video device state information.
> + *
> + * @fmt: Format of the capture stream
> + * @vdev: Pointer to video device
> + */
> +struct video_device_state {
> +	struct v4l2_format fmt;

While typically a video_device supports only a single video format type, that is
not always the case. There are the following exceptions:

1) M2M devices have both a capture and output video format. However, for M2M devices
   the state is per-filehandle, so it shouldn't be stored in a video_device_state
   struct anyway.
2) VBI devices can have both a raw and sliced VBI format (either capture or output)
3) AFAIK non-M2M video devices can have both a video and meta format. That may have
   changed, I'm not 100% certain about this.
4) video devices can also support an OVERLAY or OUTPUT_OVERLAY format (rare)

V4L2_CAP_VIDEO_OVERLAY is currently only used in
drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c, so once that driver
disappears we can drop video overlay support for capture devices.

2-4 are all quite rare, but 1 is very common. But for such devices the state
wouldn't be in video_device anyway.

But it would be nice if the same struct can be used in both m2m devices and non-m2m
devices. It's just stored either in struct v4l2_fh or struct video_device. It would
give a lot of opportunities for creating helper functions to make the life for
driver developers easier.

Regards,

	Hans

> +	struct video_device *vdev;
> +};
> +
>  /*
>   * Newer version of video_device, handled by videodev2.c
>   *	This version moves redundant code from video device code to
> @@ -238,6 +255,7 @@ struct v4l2_file_operations {
>   * @queue: &struct vb2_queue associated with this device node. May be NULL.
>   * @prio: pointer to &struct v4l2_prio_state with device's Priority state.
>   *	 If NULL, then v4l2_dev->prio will be used.
> + * @state: &struct video_device_state, holds the active state for the device.
>   * @name: video device name
>   * @vfl_type: V4L device type, as defined by &enum vfl_devnode_type
>   * @vfl_dir: V4L receiver, transmitter or m2m
> @@ -283,6 +301,7 @@ struct video_device {
>  	struct vb2_queue *queue;
>  
>  	struct v4l2_prio_state *prio;
> +	struct video_device_state *state;
>  
>  	/* device info */
>  	char name[64];
> @@ -546,6 +565,27 @@ static inline int video_is_registered(struct video_device *vdev)
>  	return test_bit(V4L2_FL_REGISTERED, &vdev->flags);
>  }
>  
> +/** __video_device_state_alloc - allocate video device state structure
> + *
> + * @vdev: pointer to struct video_device
> + *
> + * .. note::
> + *
> + *	This function is meant to be used only inside the V4L2 core.
> + */
> +struct video_device_state *
> +__video_device_state_alloc(struct video_device *vdev);
> +
> +/** __video_device_state_free - free video device state structure
> + *
> + * @state: pointer to the state to be freed
> + *
> + * .. note::
> + *
> + *	This function is meant to be used only inside the V4L2 core.
> + */
> +void __video_device_state_free(struct video_device_state *state);
> +
>  /**
>   * v4l2_debugfs_root - returns the dentry of the top-level "v4l2" debugfs dir
>   *
> 



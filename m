Return-Path: <linux-media+bounces-37138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2980AFD0B5
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 18:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFC743ABEBB
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 16:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4B12E1C65;
	Tue,  8 Jul 2025 16:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rPRM8AQg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD242D9790
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 16:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751991997; cv=none; b=riaQ5RrXqEyb6bzQD3eRUiBAolLG8mULxq97P57KMlxQNx/aBgrRifJ6dxqVB6VB6cGIb54vw6J7LzI+ArZixhK7FbAFrQxcCq3v9NTYbyEmBPJtvdJ4uUV0JCnBBlKBfPp8E3o5QjFjDr8jDAxHTWm7vMoVjuHWC/t/YCQwCVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751991997; c=relaxed/simple;
	bh=if7lDBdgmJ5pVqx/bE72nrCHwQ649XcASjUhDTHfCQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFmUoKcIyfcFO0Dji/l9FOFD0LtlTolb+2pQ8aAh953dJrCow3rWBEUEggKd1p4HEzSVcEaR3wyEIngJ81XULanSD0UqOY1K2WKJ2V9NgJLeGP1rMUBHI1vGkCrDMeptXx4hji81BmLiAz0o7y0m6n6waepwI+nZefuOVROmHZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rPRM8AQg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A94D838;
	Tue,  8 Jul 2025 18:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751991965;
	bh=if7lDBdgmJ5pVqx/bE72nrCHwQ649XcASjUhDTHfCQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPRM8AQgZJwOFEI6wor5bcZ4jHxhxdrK12XlNz4YLxxZFSJNSrKuCiU4cYoEhuwCm
	 y9iJGUMWCx5TFxoeRmbQfVokVUhBQLSrEjQzVUXEMbyvhnVS+KMAUVVkF3ZM9WLEej
	 Aouj7+TLCQJwF60tvwkjND251TVCCcxHeVO05elA=
Date: Tue, 8 Jul 2025 18:26:29 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Heiko Stuebner <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Dafna Hirschfeld <dafna@fastmail.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] media: v4l2-core: Add support for video device
 state
Message-ID: <3yifjhhqjrryg2fnfep6yqpxlvc3y5drh54smwajptfzy75tuu@dfsl6g5ktxbw>
References: <20250703-vdev-state-v1-0-d647a5e4986d@ideasonboard.com>
 <20250703-vdev-state-v1-1-d647a5e4986d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250703-vdev-state-v1-1-d647a5e4986d@ideasonboard.com>

Hi Jai

On Thu, Jul 03, 2025 at 06:02:08PM -0700, Jai Luthra wrote:
> Simplify video capture device drivers by maintaining active and try
> states to track the v4l2 formats (for video and metadata capture) of the
> device.
>
> A lot of boilerplate in the drivers can be reduced by combining the
> implementation of s_fmt and try_fmt hooks, and using a framework helper
> for the g_fmt hook.
>
> To achieve this, we pass the newly introduced state structure to the
> hooks through the already existing private void pointer. For S_FMT, we
> pass the pointer to the active state and enforce that the vb2 queue is
> not busy before calling the driver hook. For TRY_FMT, we pass the
> pointer to the temporary state stored in the file handle. Finally, we
> introduce a framework helper for the g_fmt hook that the drivers can
> use.
>
> The private void pointer argument already had some rare uses, so we
> switch away from using it in the v4l_*ctrl functions to access
> file->private_data, instead doing that access directly. Some drivers'
> hooks might still expect it to point to file->private_data, so we
> replace it with the state pointer only if a driver selects the
> V4L2_FL_USES_STATE flag while registering the device.
>
> State support may be extended in the future to other device types, such
> as video/metadata output or M2M devices.
>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c   | 32 ++++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-fh.c    |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c | 44 ++++++++++++++++++++++++------
>  include/media/v4l2-dev.h             | 52 ++++++++++++++++++++++++++++++++++++
>  include/media/v4l2-fh.h              |  5 +++-
>  5 files changed, 125 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index c369235113d98ae26c30a1aa386e7d60d541a66e..b8227d5508dc5bd775706264739e5db2d577f7fd 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -27,6 +27,7 @@
>  #include <linux/uaccess.h>
>
>  #include <media/v4l2-common.h>
> +#include <media/v4l2-dev.h>

v4l2-common includes this already


>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-event.h>
> @@ -163,6 +164,34 @@ void video_device_release_empty(struct video_device *vdev)
>  }
>  EXPORT_SYMBOL(video_device_release_empty);
>
> +int video_device_g_fmt_vid(struct file *file, void *priv,

The function prototype (and documentation) names the second parameter
state.

> +			   struct v4l2_format *fmt)
> +{
> +	struct video_device_state *state = priv;
> +
> +	if (WARN_ON_ONCE(!state))
> +		return -EINVAL;
> +
> +	*fmt = state->vid_fmt;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(video_device_g_fmt_vid);
> +
> +int video_device_g_fmt_meta(struct file *file, void *priv,
> +			    struct v4l2_format *fmt)
> +{
> +	struct video_device_state *state = priv;
> +
> +	if (WARN_ON_ONCE(!state))
> +		return -EINVAL;
> +
> +	*fmt = state->meta_fmt;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(video_device_g_fmt_meta);
> +

These two helpers, and the presence of two struct v4l2_format
'vid_fmt' and 'meta_fmt' are a bit puzzling to me.

A video device will handle one buffer type and struct v4l2_format
accomodates all type of buffers in the 'fmt' union member.

Why do you store two of them in the video device state ?

>  static inline void video_get(struct video_device *vdev)
>  {
>  	get_device(&vdev->dev);
> @@ -927,6 +956,9 @@ int __video_register_device(struct video_device *vdev,
>  	spin_lock_init(&vdev->fh_lock);
>  	INIT_LIST_HEAD(&vdev->fh_list);
>
> +	/* video_device_state support */
> +	vdev->state.which = VIDEO_DEVICE_FORMAT_ACTIVE;
> +
>  	/* Part 1: check device type */
>  	switch (type) {
>  	case VFL_TYPE_VIDEO:
> diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
> index 90eec79ee995a2d214590beeacc91b9f8f33236d..d246e05f8ef1244e212412caa5c9c6788a5c948a 100644
> --- a/drivers/media/v4l2-core/v4l2-fh.c
> +++ b/drivers/media/v4l2-core/v4l2-fh.c
> @@ -37,6 +37,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
>  	INIT_LIST_HEAD(&fh->available);
>  	INIT_LIST_HEAD(&fh->subscribed);
>  	fh->sequence = -1;
> +	fh->state.which = VIDEO_DEVICE_FORMAT_TRY;
>  	mutex_init(&fh->subscribe_lock);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fh_init);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 650dc1956f73d2f1943b56c42140c7b8d757259f..78a0db364725ec6641be37d0c4804edb222a9154 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -21,6 +21,7 @@
>
>  #include <media/media-device.h> /* for media_set_bus_info() */
>  #include <media/v4l2-common.h>
> +#include <media/v4l2-dev.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fh.h>
> @@ -1745,6 +1746,15 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>  	if (ret)
>  		return ret;
>
> +	/*
> +	 * Make sure queue isn't busy for devices that use state, as they have a
> +	 * single implementation for .s_fmt and .try_fmt, and rely on us to make
> +	 * sure the queue is not busy when calling for the .s_fmt case
> +	 */
> +	if (test_bit(V4L2_FL_USES_STATE, &vfd->flags) && vfd->queue &&
> +	    vb2_is_busy(vfd->queue))
> +		return -EBUSY;
> +
>  	ret = v4l_enable_media_source(vfd);
>  	if (ret)
>  		return ret;
> @@ -2293,7 +2303,7 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
>  	struct v4l2_query_ext_ctrl qec = {};
>  	struct v4l2_queryctrl *p = arg;
>  	struct v4l2_fh *vfh =
> -		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> +		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
>  	int ret;
>
>  	if (vfh && vfh->ctrl_handler)
> @@ -2318,7 +2328,7 @@ static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
>  	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_query_ext_ctrl *p = arg;
>  	struct v4l2_fh *vfh =
> -		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> +		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
>
>  	if (vfh && vfh->ctrl_handler)
>  		return v4l2_query_ext_ctrl(vfh->ctrl_handler, p);
> @@ -2335,7 +2345,7 @@ static int v4l_querymenu(const struct v4l2_ioctl_ops *ops,
>  	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_querymenu *p = arg;
>  	struct v4l2_fh *vfh =
> -		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> +		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
>
>  	if (vfh && vfh->ctrl_handler)
>  		return v4l2_querymenu(vfh->ctrl_handler, p);
> @@ -2352,7 +2362,7 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops,
>  	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_control *p = arg;
>  	struct v4l2_fh *vfh =
> -		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> +		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
>  	struct v4l2_ext_controls ctrls;
>  	struct v4l2_ext_control ctrl;
>
> @@ -2384,7 +2394,7 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
>  	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_control *p = arg;
>  	struct v4l2_fh *vfh =
> -		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> +		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
>  	struct v4l2_ext_controls ctrls;
>  	struct v4l2_ext_control ctrl;
>  	int ret;
> @@ -2414,7 +2424,7 @@ static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>  	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_ext_controls *p = arg;
>  	struct v4l2_fh *vfh =
> -		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> +		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
>
>  	p->error_idx = p->count;
>  	if (vfh && vfh->ctrl_handler)
> @@ -2435,7 +2445,7 @@ static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>  	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_ext_controls *p = arg;
>  	struct v4l2_fh *vfh =
> -		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> +		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
>
>  	p->error_idx = p->count;
>  	if (vfh && vfh->ctrl_handler)
> @@ -2456,7 +2466,7 @@ static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>  	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_ext_controls *p = arg;
>  	struct v4l2_fh *vfh =
> -		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> +		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->private_data : NULL;
>
>  	p->error_idx = p->count;
>  	if (vfh && vfh->ctrl_handler)
> @@ -3057,6 +3067,21 @@ void v4l_printk_ioctl(const char *prefix, unsigned int cmd)
>  }
>  EXPORT_SYMBOL(v4l_printk_ioctl);
>
> +static struct video_device_state *
> +video_device_get_state(struct video_device *vfd, struct v4l2_fh *vfh,
> +		       unsigned int cmd, void *arg)
> +{
> +	switch (cmd) {
> +	default:
> +		return NULL;
> +	case VIDIOC_G_FMT:
> +	case VIDIOC_S_FMT:
> +		return &vfd->state;
> +	case VIDIOC_TRY_FMT:
> +		return &vfh->state;
> +	}
> +}
> +
>  static long __video_do_ioctl(struct file *file,
>  		unsigned int cmd, void *arg)
>  {
> @@ -3081,6 +3106,9 @@ static long __video_do_ioctl(struct file *file,
>  	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags))
>  		vfh = file->private_data;
>
> +	if (vfh && test_bit(V4L2_FL_USES_STATE, &vfd->flags))
> +		fh = video_device_get_state(vfd, vfh, cmd, arg);
> +
>  	/*
>  	 * We need to serialize streamon/off with queueing new requests.
>  	 * These ioctls may trigger the cancellation of a streaming
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index 1b6222fab24eda96cbe459b435431c01f7259366..8e6e7799212cd07ae4ad3dfc85912c21a9bcab2d 100644
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
> @@ -214,6 +220,30 @@ struct v4l2_file_operations {
>  	int (*release) (struct file *);
>  };
>
> +/**
> + * enum video_device_format_whence - Video device format type
> + *
> + * @V4L2_DEVICE_FORMAT_TRY: from VIDIOC_TRY_FMT, for negotiation only
> + * @V4L2_DEVICE_FORMAT_ACTIVE: from VIDIOC_S_FMT, applied to the device
> + */
> +enum video_device_format_whence {
> +	VIDEO_DEVICE_FORMAT_TRY = 0,
> +	VIDEO_DEVICE_FORMAT_ACTIVE = 1,
> +};

I'm not sure we need these. More on this on the drivers
implementation in the next patches.

> +
> +/**
> + * struct video_device_state - Used for storing video device state information.
> + *
> + * @vid_fmt: Format of the video capture stream
> + * @meta_fmt: Format of the metadata capture stream
> + * @which: is this a TRY or ACTIVE format?
> + */
> +struct video_device_state {
> +	struct v4l2_format vid_fmt;
> +	struct v4l2_format meta_fmt;
> +	enum video_device_format_whence which;
> +};
> +
>  /*
>   * Newer version of video_device, handled by videodev2.c
>   *	This version moves redundant code from video device code to
> @@ -238,6 +268,7 @@ struct v4l2_file_operations {
>   * @queue: &struct vb2_queue associated with this device node. May be NULL.
>   * @prio: pointer to &struct v4l2_prio_state with device's Priority state.
>   *	 If NULL, then v4l2_dev->prio will be used.
> + * @state: &struct video_device_state, holds the active state for the device.
>   * @name: video device name
>   * @vfl_type: V4L device type, as defined by &enum vfl_devnode_type
>   * @vfl_dir: V4L receiver, transmitter or m2m
> @@ -283,6 +314,7 @@ struct video_device {
>  	struct vb2_queue *queue;
>
>  	struct v4l2_prio_state *prio;
> +	struct video_device_state state;

One of the key design requirement it's the ability for drivers to
sub-class video_device_state. One possibile way to obtain this is to
dynamically allocate the state either by deferring to the driver's the
allocation (so that they can allocate a bigger structure) or by
passing to the framework the size it has to allocate.

In any case, I'm afraid the state should be allocated dynamically,
either in the drivers' init_state() (or similar) callback or by the
framework with a size hint from the driver.

What do you think ?

>
>  	/* device info */
>  	char name[64];
> @@ -540,6 +572,26 @@ static inline int video_is_registered(struct video_device *vdev)
>  	return test_bit(V4L2_FL_REGISTERED, &vdev->flags);
>  }
>
> +/**
> + * video_device_g_fmt_vid() - fill video v4l2_format from the state.
> + *
> + * @file: pointer to struct file
> + * @state: pointer to video device state
> + * @format: pointer to &struct v4l2_format
> + */
> +int video_device_g_fmt_vid(struct file *file, void *state,
> +			   struct v4l2_format *format);
> +
> +/**
> + * video_device_g_fmt_meta() - fill metadata v4l2_format from the state.
> + *
> + * @file: pointer to struct file
> + * @state: pointer to video device state
> + * @format: pointer to &struct v4l2_format
> + */
> +int video_device_g_fmt_meta(struct file *file, void *state,
> +			    struct v4l2_format *format);
> +
>  /**
>   * v4l2_debugfs_root - returns the dentry of the top-level "v4l2" debugfs dir
>   *
> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
> index b5b3e00c8e6a0b082d9cd8a0c972a5094adcb6f2..02579f87ba99d0c849a0865f8cc4295446c39f94 100644
> --- a/include/media/v4l2-fh.h
> +++ b/include/media/v4l2-fh.h
> @@ -18,7 +18,8 @@
>  #include <linux/list.h>
>  #include <linux/videodev2.h>
>
> -struct video_device;
> +#include <media/v4l2-dev.h>
> +
>  struct v4l2_ctrl_handler;
>
>  /**
> @@ -28,6 +29,7 @@ struct v4l2_ctrl_handler;
>   * @vdev: pointer to &struct video_device
>   * @ctrl_handler: pointer to &struct v4l2_ctrl_handler
>   * @prio: priority of the file handler, as defined by &enum v4l2_priority
> + * @state: try state used for format negotiation on the video device
>   *
>   * @wait: event' s wait queue
>   * @subscribe_lock: serialise changes to the subscribed list; guarantee that
> @@ -44,6 +46,7 @@ struct v4l2_fh {
>  	struct video_device	*vdev;
>  	struct v4l2_ctrl_handler *ctrl_handler;
>  	enum v4l2_priority	prio;
> +	struct video_device_state state;
>
>  	/* Events */
>  	wait_queue_head_t	wait;
>
> --
> 2.49.0
>
>


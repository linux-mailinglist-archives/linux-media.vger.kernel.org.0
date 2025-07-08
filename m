Return-Path: <linux-media+bounces-37058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDC6AFC465
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 09:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04960189BD5D
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 07:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662AF299AAF;
	Tue,  8 Jul 2025 07:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjripq4f"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE7C17BB6
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751960582; cv=none; b=BvLp0fGql4F2wCu1TolywslCjXr5A0O3V50RWcYJslvGNo13RZHezl7yxlO8JAJ+Dxi7CHRqYYLIiop7Zpt3HnO3BEGddKhNPg42k7d8QBUwEObv1KmV9a3EFywymQQ1ktGSDkGETVurFKcpyB+FZ1UyLSvDbnMZicmUYGOTqX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751960582; c=relaxed/simple;
	bh=rw3QyhzUii8LmY53DvQkT8PNSn+NYfcXlCfb3tBi7Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSD93MS4l7gIaW4jVQErzHYYdRI03o9WzZURA4c9sFI1hJv77BQSh0COfpSdALVLN8Rpn/P2e57nP0XjvRlSzotPe2SDzIK5DYSMPNdwx218yHcaGTrF1I/mHKnWefRDYfKVZ4Oq59oLdch95XWGHyr9lA5CMnEqA/XKcj37z7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjripq4f; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751960581; x=1783496581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rw3QyhzUii8LmY53DvQkT8PNSn+NYfcXlCfb3tBi7Ak=;
  b=hjripq4f4RBff7UmUYMWsEDzZ0X4bWVHqvRcRaIGIUFoTAspmFDWiicf
   6tyX08FqVCLf9QnTJZ9c6chZLIuXv7iSBFpkFoyIu4QMVEYx3DP+qM7Ry
   j/GaX10fzEvHW4gc+LIhRAmDBdeQxC4vt5b2jkQtGMp8QHk+iXNt4XAOG
   R0t8lcYlsMGlzA6ILfl1R47bUp/UcY3ruSb7PeuOd0V+0C2RsHL8W+yZn
   BpBoQpTPxrFzxc3Btxab+KCiauLBUS/D+mSekDYOjME4V010qFsjcb7jP
   FKXmJaqylxO2EktEoCkth68Zr2dg63BStAoXTfAMSKpZbUQSvIyCQJBts
   g==;
X-CSE-ConnectionGUID: Vn0JjXDPTQyYJLjf79q+ww==
X-CSE-MsgGUID: WgRYx8r9Q92WJURu9MfZ3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53905853"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="53905853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 00:43:01 -0700
X-CSE-ConnectionGUID: hbd33qqmRtS4CE/cM9m4YA==
X-CSE-MsgGUID: s0oFF7vPQGWTrIiqPMdVEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="155770991"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.230])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 00:42:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 19B82120898;
	Tue,  8 Jul 2025 10:42:55 +0300 (EEST)
Date: Tue, 8 Jul 2025 07:42:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] media: v4l2-core: Add support for video device
 state
Message-ID: <aGzL_8BFEfZ6Co_u@kekkonen.localdomain>
References: <20250703-vdev-state-v1-0-d647a5e4986d@ideasonboard.com>
 <20250703-vdev-state-v1-1-d647a5e4986d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-vdev-state-v1-1-d647a5e4986d@ideasonboard.com>

Hi Jai,

Thanks for the patchset.

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
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-event.h>
> @@ -163,6 +164,34 @@ void video_device_release_empty(struct video_device *vdev)
>  }
>  EXPORT_SYMBOL(video_device_release_empty);
>  
> +int video_device_g_fmt_vid(struct file *file, void *priv,
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

EXPORT_SYMBOL_GPL(), please.

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

What about selection rectangles?

Should this be called video_device_state_whence?

> + *
> + * @V4L2_DEVICE_FORMAT_TRY: from VIDIOC_TRY_FMT, for negotiation only
> + * @V4L2_DEVICE_FORMAT_ACTIVE: from VIDIOC_S_FMT, applied to the device
> + */
> +enum video_device_format_whence {
> +	VIDEO_DEVICE_FORMAT_TRY = 0,
> +	VIDEO_DEVICE_FORMAT_ACTIVE = 1,
> +};
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

It'd be also nice to have a callback to initialise the state. That could
well go to a separate patch though.

-- 
Regards,

Sakari Ailus


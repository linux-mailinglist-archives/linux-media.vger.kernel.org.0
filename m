Return-Path: <linux-media+bounces-43514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4EBBB1DF6
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 23:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78B772A35B2
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 21:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687C7311960;
	Wed,  1 Oct 2025 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Excnw8LI"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7117617A2FC;
	Wed,  1 Oct 2025 21:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354903; cv=none; b=KESl0hc4CP6i0sRBUHcLWTuiRFZccN69bQq8z6fOBWT8HG4I+NTCQ3a6yp5iGXuRdZxSQZ3wpuRCXNdZZ1M1smwl2zSPdTg7q7rNQpVb8+O1aiJR3yn2/r6LMSiKjdwcY3d5XLaCwSKVnulSpTmmPhyyO+u1U7/dD6OErxaT6uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354903; c=relaxed/simple;
	bh=teBzgg6W66TCegIEp7ZYSh7bHyXJUjH+ENcqJQ17cqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2sp9IxXHZ5Bb4wSiGrnZw1xqlGtTDCTXmNTfd1HU7wKpKyqqRX3u0K5lMg/4E1OKQWDEM64/FCXPVS1zSdZSykLWfvS9u6VBlKkY0732BPlIdfpHZo7j5la2g45sIwRFUmn4niEVOWtR0elShSJsRiQM6B2q+60x99M32IioxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Excnw8LI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759354899;
	bh=teBzgg6W66TCegIEp7ZYSh7bHyXJUjH+ENcqJQ17cqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Excnw8LIXnQ/LNhbk55aewH9+GfqyTaDKYKtMOVqBxvZYHyJUcxX8isJFBk+RUbGY
	 VnEtzqf5we8wjMq+M70lpd3rMDHY7xiFrQcRqg9UVxlHzo7GfsHKJKpBLER7AHdRVW
	 +/ywcqH6Nozs/jUdF9eibULEFlx7n71aoNPlbq8OSn0PDnQk2zWY30VVUd7TXuyTHe
	 E7Wu/5FVm/uprZnT+5/4M3OQ70dXE1nNCyiIb1AQ5RBs+clm7Ck35PGhfbNCD6ftec
	 6hkFb3jKCKiKWyjvAGKMwkI/YLMcXi4y7IBWqmwPzM72kqf/jHLY19pkfSGW+qAyJk
	 BYkh82tLhWAcg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3CE917E12C0;
	Wed,  1 Oct 2025 23:41:38 +0200 (CEST)
Message-ID: <b8e03fd2-3a44-48bb-8707-4aecabbbfd9c@collabora.com>
Date: Wed, 1 Oct 2025 23:41:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/26] media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
 <20250717-multicontext-mainline-2025-v1-6-81ac18979c03@ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-6-81ac18979c03@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jacopo,

On 7/17/25 12:45, Jacopo Mondi wrote:
> Introduce a new ioctl in V4L2 to allocate a video device context and
> associate it with a media device context.
> 
> The ioctl is valid only if support for MEDIA_CONTROLLER is compiled in
> as it calls into the entity ops to let driver allocate a new context and
> binds the newly created context with the media context associated
> with the file descriptor provided by userspace as the new ioctl
> argument.

I would have expected that the execution context of the video device
already exists and is not allocated at ioctl call time. If I understand
it correctly

 - after opening a video device, no context is allocated, but in
   v4l2_fh_release the reference counter of the context is decreased.
   This smells fishy. Note that the user may not call the ioctl.
 - after opening a video device there is no context. This could imply
   that two operating modes are required (with a context and without a
   context), which would seem unnecessarily complex.
 - What happens if the VIDIOC_BIND_CONTEXT ioctl is called more than
   once? (IIUC vfh->context gets overwritten but the old context is not
   released)

(Just found that a later patch introduces default contexts. Should this
address the comments above, consider rearranging the patches so that
default contexts are introduced first.)

> The newly allocated video context is then stored in the v4l2-fh that
> represent the open file handle on which the ioctl has been called.

Couldn't the same be achieved by
 - v4l2_fh_open allocates a new context
 - v4l2_fh_release releases it (already implemented)
 - ioctl takes the existing context and binds it to the media device
   context
Then,
 - open/release are symmetric and not fishy
 - after open but before the ioctl call the user can safely operate on a
   context
 - calling ioctl twice will be idempotent (check already implemented in
   media_device_bind_context())

> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c   | 10 ++++++
>  drivers/media/v4l2-core/v4l2-fh.c    |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c | 64 ++++++++++++++++++++++++++++++++++++
>  include/media/v4l2-ioctl.h           |  7 ++++
>  include/uapi/linux/videodev2.h       | 11 +++++++
>  5 files changed, 93 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index c83c37843c9e7beb899a4b2bd176273c3dec381b..bc6502b4ce21cc0ad53136e1637d1c926e31dd89 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -606,6 +606,10 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		__set_bit(_IOC_NR(VIDIOC_ENUM_FREQ_BANDS), valid_ioctls);
>  
>  	if (is_vid) {
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +		__set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls);
> +#endif
> +
>  		/* video specific ioctls */
>  		if ((is_rx && (ops->vidioc_enum_fmt_vid_cap ||
>  			       ops->vidioc_enum_fmt_vid_overlay)) ||
> @@ -661,12 +665,18 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_meta_cap);
>  		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_cap);
>  		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_cap);
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +		__set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls);
> +#endif
>  	} else if (is_meta && is_tx) {
>  		/* metadata output specific ioctls */
>  		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_meta_out);
>  		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_meta_out);
>  		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_out);
>  		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_out);
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +		__set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls);
> +#endif
>  	}
>  	if (is_vbi) {
>  		/* vbi specific ioctls */
> diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
> index 90eec79ee995a2d214590beeacc91b9f8f33236d..f7af444d2344541ccae1eae230b39d4cbc47f6bd 100644
> --- a/drivers/media/v4l2-core/v4l2-fh.c
> +++ b/drivers/media/v4l2-core/v4l2-fh.c
> @@ -93,6 +93,7 @@ int v4l2_fh_release(struct file *filp)
>  	struct v4l2_fh *fh = filp->private_data;
>  
>  	if (fh) {
> +		video_device_context_put(fh->context);
>  		v4l2_fh_del(fh);
>  		v4l2_fh_exit(fh);
>  		kfree(fh);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 46da373066f4ec786b87ef18b8372abee621332f..bade64cc62b66dd6237ccd5338aa6dd8ab00ef8c 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/compat.h>
> +#include <linux/file.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> @@ -350,6 +351,13 @@ static void v4l_print_format(const void *arg, bool write_only)
>  	}
>  }
>  
> +static void v4l_print_context(const void *arg, bool write_only)
> +{
> +	const struct v4l2_context *c = arg;
> +
> +	pr_cont("context=%u\n", c->context_fd);
> +}
> +
>  static void v4l_print_framebuffer(const void *arg, bool write_only)
>  {
>  	const struct v4l2_framebuffer *p = arg;
> @@ -2151,6 +2159,61 @@ static int v4l_overlay(const struct v4l2_ioctl_ops *ops,
>  	return ops->vidioc_overlay(file, fh, *(unsigned int *)arg);
>  }
>  
> +static int v4l_bind_context(const struct v4l2_ioctl_ops *ops,
> +			    struct file *file, void *fh, void *arg)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +	struct media_device_context *mdev_context;
> +	struct v4l2_fh *vfh =
> +		test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags) ? fh : NULL;
> +	struct v4l2_context *c = arg;
> +	int ret;
> +
> +	/*
> +	 * TODO: do not __set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls)
> +	 * if V4L2_FL_USES_V4L2_FH isn't set or the driver does not implement
> +	 * alloc_context and destroy_context.
> +	 */
> +	if (!vfh)
> +		return -ENOTTY;
> +
> +	if (!vdev->entity.ops || !vdev->entity.ops->alloc_context ||
> +	    !vdev->entity.ops->destroy_context)
> +		return -ENOTTY;
> +
> +	mdev_context = media_device_context_get_from_fd(c->context_fd);
> +	if (!mdev_context)
> +		return -EINVAL;
> +
> +	/* Let the driver allocate the per-file handle context. */
> +	ret = vdev->entity.ops->alloc_context(&vdev->entity,
> +					      (struct media_entity_context **)
> +					      &vfh->context);
> +	if (ret)
> +		goto err_put_mdev_context;
> +
> +	/*
> +	 * Bind the newly created video device context to the media device
> +	 * context identified by the file descriptor.
> +	 */
> +	ret = media_device_bind_context(mdev_context,
> +					(struct media_entity_context *)
> +					vfh->context);
> +	if (ret)
> +		goto err_put_context;
> +
> +	media_device_context_put(mdev_context);
> +
> +	return 0;
> +
> +err_put_context:
> +	video_device_context_put(vfh->context);
> +err_put_mdev_context:
> +	media_device_context_put(mdev_context);
> +
> +	return ret;
> +}
> +
>  static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> @@ -2998,6 +3061,7 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>  	IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info, v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match)),
>  	IOCTL_INFO(VIDIOC_QUERY_EXT_CTRL, v4l_query_ext_ctrl, v4l_print_query_ext_ctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_query_ext_ctrl, id)),
>  	IOCTL_INFO(VIDIOC_REMOVE_BUFS, v4l_remove_bufs, v4l_print_remove_buffers, INFO_FL_PRIO | INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_remove_buffers, type)),
> +	IOCTL_INFO(VIDIOC_BIND_CONTEXT, v4l_bind_context, v4l_print_context, 0),
>  };
>  #define V4L2_IOCTLS ARRAY_SIZE(v4l2_ioctls)
>  
> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index 82695c3a300a73219f262fb556ed61a8f09d273e..6d9edfd9ca912972ad15acdc07014dee1ed36ab6 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -18,6 +18,7 @@
>  #include <linux/videodev2.h>
>  
>  struct v4l2_fh;
> +struct video_device_context;
>  
>  /**
>   * struct v4l2_ioctl_ops - describe operations for each V4L2 ioctl
> @@ -149,6 +150,8 @@ struct v4l2_fh;
>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
>   * @vidioc_try_fmt_meta_out: pointer to the function that implements
>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata output
> + * @vidioc_bind_context: pointer to the function that implements
> + *	:ref:`VIDIOC_BIND_CONTEXT <vidioc_bind_context>` ioctl
>   * @vidioc_reqbufs: pointer to the function that implements
>   *	:ref:`VIDIOC_REQBUFS <vidioc_reqbufs>` ioctl
>   * @vidioc_querybuf: pointer to the function that implements
> @@ -402,6 +405,10 @@ struct v4l2_ioctl_ops {
>  	int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
>  				       struct v4l2_format *f);
>  
> +	/* Context handlers */
> +	int (*vidioc_bind_context)(struct file *file, void *fh,
> +				   struct video_device_context *c);
> +
>  	/* Buffer handlers */
>  	int (*vidioc_reqbufs)(struct file *file, void *fh,
>  			      struct v4l2_requestbuffers *b);
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 3dd9fa45dde1066d52a68581625a39e7ec92c9b7..0b9aa89e2479620dbbaa54f1aadff7aaa7a3d0f7 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1057,6 +1057,14 @@ struct v4l2_jpegcompression {
>  					* always use APP0 */
>  };
>  
> +/*
> + *     V I D E O   D E V I C E   C O N T E X T
> + */
> +
> +struct v4l2_context {
> +	__u32 context_fd;

Reserve some space for the future?

> +};
> +
>  /*
>   *	M E M O R Y - M A P P I N G   B U F F E R S
>   */
> @@ -2818,6 +2826,9 @@ struct v4l2_remove_buffers {
>  #define VIDIOC_REMOVE_BUFS	_IOWR('V', 104, struct v4l2_remove_buffers)
>  
>  
> +/* Context handling */
> +#define VIDIOC_BIND_CONTEXT	_IOW('V', 105, struct v4l2_context)
> +
>  /* Reminder: when adding new ioctls please add support for them to
>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
>  
> 

Best regards,
Michael



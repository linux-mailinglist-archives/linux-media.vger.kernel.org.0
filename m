Return-Path: <linux-media+bounces-27695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89660A5473B
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 11:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BD3F3B1AE4
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 10:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725852036E5;
	Thu,  6 Mar 2025 10:02:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1630B1FECB5;
	Thu,  6 Mar 2025 10:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741255351; cv=none; b=non3wvigSM542SyGwgHFcla7wJvLbv40dM/arCwnqgKf30dFyEzTJtddijt1wxM/Hfr2d80WQ0M5NuHDNeRdhBjA+F/JO1lftphI6i7S0fYq2MBTOfzdEJHqg7lNUMyLWftoEWmFeeyWqdFTIFYEKW21ByJbt9uOgue2vW3DvkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741255351; c=relaxed/simple;
	bh=kxGqFgv5DV4uqS8x3+VfQonPcdYK8J9y0uKc1HKkDT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ITDg8sd6W5gopc72Lx8uD2h5iEoqFb/w0Oo0x4ygrer6idGUo/1qHV64ePsZ0En7c0J44rbc1Zj5AX05nfaFQJEVx9O95jnwsu2LL3GSr3o4+f/BULKv4eovQAS9dPQozTWs54g8bbSYQVA3+OXQIRFeyXnvCs/l5DGwxBM1mmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704C0C4CEE0;
	Thu,  6 Mar 2025 10:02:29 +0000 (UTC)
Message-ID: <97e71c79-b6ca-4840-bb86-32ac44508f69@xs4all.nl>
Date: Thu, 6 Mar 2025 11:02:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: vivid: Introduce VIDEO_VIVID_OSD
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Slawomir Rosek <srosek@google.com>, Hidenori Kobayashi <hidenorik@google.com>
References: <20250228-vivid-osd-v1-0-16963a0a0ab7@chromium.org>
 <20250228-vivid-osd-v1-2-16963a0a0ab7@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250228-vivid-osd-v1-2-16963a0a0ab7@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

I like this change, but I have a few comments:

On 28/02/2025 14:08, Ricardo Ribalda wrote:
> vivid-osd depends on CONFIG_FB, which can be a large dependency. Introduce
> CONFIG_VIDEO_VIVID_OSD to control enabling support for testing output
> overlay.
> 
> Suggested-by: Slawomir Rosek <srosek@google.com>
> Co-developed-by: Slawomir Rosek <srosek@google.com>
> Signed-off-by: Slawomir Rosek <srosek@google.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/test-drivers/vivid/Kconfig         | 12 ++++++++++--
>  drivers/media/test-drivers/vivid/Makefile        |  5 ++++-
>  drivers/media/test-drivers/vivid/vivid-core.c    |  4 ++++
>  drivers/media/test-drivers/vivid/vivid-core.h    |  2 ++
>  drivers/media/test-drivers/vivid/vivid-osd.h     | 11 +++++++++++
>  drivers/media/test-drivers/vivid/vivid-vid-out.c |  7 ++++---
>  6 files changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
> index ec2e71d76965..e95edc0f22bf 100644
> --- a/drivers/media/test-drivers/vivid/Kconfig
> +++ b/drivers/media/test-drivers/vivid/Kconfig
> @@ -1,9 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config VIDEO_VIVID
>  	tristate "Virtual Video Test Driver"
> -	depends on VIDEO_DEV && !SPARC32 && !SPARC64 && FB
> +	depends on VIDEO_DEV && !SPARC32 && !SPARC64
>  	depends on HAS_DMA
> -	select FB_IOMEM_HELPERS
>  	select FONT_SUPPORT
>  	select FONT_8x16
>  	select VIDEOBUF2_VMALLOC
> @@ -31,6 +30,15 @@ config VIDEO_VIVID_CEC
>  	  When selected the vivid module will emulate the optional
>  	  HDMI CEC feature.
>  
> +config VIDEO_VIVID_OSD
> +	bool "Enable Framebuffer for testing Output Overlay"
> +	depends on VIDEO_VIVID && FB
> +	default y
> +	select FB_IOMEM_HELPERS
> +	help
> +	  When selected the vivid module will emulate a Framebuffer for
> +	  testing Output Overlay.
> +
>  config VIDEO_VIVID_MAX_DEVS
>  	int "Maximum number of devices"
>  	depends on VIDEO_VIVID
> diff --git a/drivers/media/test-drivers/vivid/Makefile b/drivers/media/test-drivers/vivid/Makefile
> index b12ad0152a3e..284a59e97335 100644
> --- a/drivers/media/test-drivers/vivid/Makefile
> +++ b/drivers/media/test-drivers/vivid/Makefile
> @@ -3,10 +3,13 @@ vivid-objs := vivid-core.o vivid-ctrls.o vivid-vid-common.o vivid-vbi-gen.o \
>  		vivid-vid-cap.o vivid-vid-out.o vivid-kthread-cap.o vivid-kthread-out.o \
>  		vivid-radio-rx.o vivid-radio-tx.o vivid-radio-common.o \
>  		vivid-rds-gen.o vivid-sdr-cap.o vivid-vbi-cap.o vivid-vbi-out.o \
> -		vivid-osd.o vivid-meta-cap.o vivid-meta-out.o \
> +		vivid-meta-cap.o vivid-meta-out.o \
>  		vivid-kthread-touch.o vivid-touch-cap.o
>  ifeq ($(CONFIG_VIDEO_VIVID_CEC),y)
>    vivid-objs += vivid-cec.o
>  endif
> +ifeq ($(CONFIG_VIDEO_VIVID_OSD),y)
> +  vivid-objs += vivid-osd.o
> +endif
>  
>  obj-$(CONFIG_VIDEO_VIVID) += vivid.o
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
> index 10f5bef3f49c..6af12a76a067 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.c
> +++ b/drivers/media/test-drivers/vivid/vivid-core.c
> @@ -125,7 +125,9 @@ MODULE_PARM_DESC(node_types, " node types, default is 0xe1d3d. Bitmask with the
>  			     "\t\t    bit 8: Video Output node\n"
>  			     "\t\t    bit 10-11: VBI Output node: 0 = none, 1 = raw vbi, 2 = sliced vbi, 3 = both\n"
>  			     "\t\t    bit 12: Radio Transmitter node\n"
> +#if IS_ENABLED(CONFIG_VIDEO_VIVID_OSD)

Just use #ifdef CONFIG_VIDEO_VIVID_OSD. It's a simple bool config option, after all.

>  			     "\t\t    bit 16: Framebuffer for testing output overlays\n"
> +#endif
>  			     "\t\t    bit 17: Metadata Capture node\n"
>  			     "\t\t    bit 18: Metadata Output node\n"
>  			     "\t\t    bit 19: Touch Capture node\n");
> @@ -1071,9 +1073,11 @@ static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
>  	/* do we have a modulator? */
>  	*has_modulator = dev->has_radio_tx;
>  
> +#if IS_ENABLED(CONFIG_VIDEO_VIVID_OSD)
>  	if (dev->has_vid_cap)
>  		/* do we have a framebuffer for overlay testing? */
>  		dev->has_fb = node_type & 0x10000;
> +#endif
>  
>  	/* can we do crop/compose/scaling while capturing? */
>  	if (no_error_inj && *ccs_cap == -1)
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
> index d2d52763b119..72bd48031ba0 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.h
> +++ b/drivers/media/test-drivers/vivid/vivid-core.h
> @@ -403,9 +403,11 @@ struct vivid_dev {
>  	int				display_byte_stride;
>  	int				bits_per_pixel;
>  	int				bytes_per_pixel;
> +#if IS_ENABLED(CONFIG_VIDEO_VIVID_OSD)
>  	struct fb_info			fb_info;
>  	struct fb_var_screeninfo	fb_defined;
>  	struct fb_fix_screeninfo	fb_fix;
> +#endif
>  
>  	/* Error injection */
>  	bool				disconnect_error;
> diff --git a/drivers/media/test-drivers/vivid/vivid-osd.h b/drivers/media/test-drivers/vivid/vivid-osd.h
> index 883459552fa9..6830e6d63dc5 100644
> --- a/drivers/media/test-drivers/vivid/vivid-osd.h
> +++ b/drivers/media/test-drivers/vivid/vivid-osd.h
> @@ -8,8 +8,19 @@
>  #ifndef _VIVID_OSD_H_
>  #define _VIVID_OSD_H_
>  
> +#if IS_ENABLED(CONFIG_VIDEO_VIVID_OSD)
>  int vivid_fb_init(struct vivid_dev *dev);
>  void vivid_fb_deinit(struct vivid_dev *dev);
>  void vivid_clear_fb(struct vivid_dev *dev);

Let's rename this to vivid_fb_clear (that can be done in the previous patch).

That way all these functions use a common prefix.

> +#else
> +static inline int vivid_fb_init(struct vivid_dev *dev)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline void vivid_fb_deinit(struct vivid_dev *dev) {}
> +

Just drop this empty line.

> +static inline void vivid_clear_fb(struct vivid_dev *dev) {}
> +#endif
>  
>  #endif
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
> index 5ec84db934d6..75b24751b9a4 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
> @@ -907,10 +907,11 @@ int vivid_vid_out_g_fbuf(struct file *file, void *fh,
>  	a->base = (void *)dev->video_pbase;
>  	a->fmt.width = dev->display_width;
>  	a->fmt.height = dev->display_height;
> -	if (dev->fb_defined.green.length == 5)
> -		a->fmt.pixelformat = V4L2_PIX_FMT_ARGB555;
> -	else
> +	a->fmt.pixelformat = V4L2_PIX_FMT_ARGB555;
> +#if IS_ENABLED(CONFIG_VIDEO_VIVID_FB)
> +	if (dev->fb_defined.green.length != 5)
>  		a->fmt.pixelformat = V4L2_PIX_FMT_RGB565;
> +#endif

I prefer that this uses a new helper: vivid_fb_green_bits(). Again, that can
be done in the previous patch. With that helper you can keep the original
if-else construct, which is easier to read.

The helper should return 5 if CONFIG_VIDEO_VIVID_OSD is not defined.

>  	a->fmt.bytesperline = dev->display_byte_stride;
>  	a->fmt.sizeimage = a->fmt.height * a->fmt.bytesperline;
>  	a->fmt.field = V4L2_FIELD_NONE;
> 

Regards,

	Hans


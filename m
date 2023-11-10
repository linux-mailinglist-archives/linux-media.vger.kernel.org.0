Return-Path: <linux-media+bounces-13-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0597C7E7ECB
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2840C1C20BEF
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD533AC1B;
	Fri, 10 Nov 2023 17:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TpGQt+V1"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB33538F9F
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:33 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 319C83B306
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 07:40:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ED43673;
	Fri, 10 Nov 2023 16:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699630832;
	bh=qhG25pJyJMIZD3xWDD7RJsofQ1G1gsZakBU5FSUsQQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TpGQt+V1OJFBHZMZJG2bVzPnfOFJspYYMFzSXkK+B7YojhtCdbSe1fFK8lfomsYQg
	 QSb6e6CojtkTWzB9/H8H70An0fgl7OmuOK5Icg2hctZUw7aSywkAYdZdjFtzkluNoy
	 1+MdRBzwrXzrfwzQQOKbm8d+CPLJGJXStl+ozyoM=
Date: Fri, 10 Nov 2023 17:41:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH] media: drop CONFIG_MEDIA_CONTROLLER_REQUEST_API
Message-ID: <20231110154101.GB7466@pendragon.ideasonboard.com>
References: <35ee2d37-949a-4878-b27b-b8431f685efb@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <35ee2d37-949a-4878-b27b-b8431f685efb@xs4all.nl>

On Fri, Nov 10, 2023 at 09:53:00AM +0100, Hans Verkuil wrote:
> This config option was added during the development of the Request API
> to make it easy to disable it.
> 
> The Request API is now stable so it is time to drop this option altogether.

Less config options is a good idea.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index c7a54d82a55e..9295ded50bc3 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -685,10 +685,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
>  	if (q->allow_cache_hints && q->io_modes & VB2_MMAP)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
> -#ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
>  	if (q->supports_requests)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> -#endif
>  }
> 
>  static void validate_memory_flags(struct vb2_queue *q,
> diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
> index 375b09612981..c82b07d2ef36 100644
> --- a/drivers/media/mc/Kconfig
> +++ b/drivers/media/mc/Kconfig
> @@ -11,10 +11,3 @@ config MEDIA_CONTROLLER_DVB
>  	  Enable the media controller API support for DVB.
> 
>  	  This is currently experimental.
> -
> -config MEDIA_CONTROLLER_REQUEST_API
> -	bool
> -	depends on MEDIA_CONTROLLER
> -	help
> -	  This option enables the Request API for the Media controller and V4L2
> -	  interfaces. It is currently needed by a few stateless codec drivers.
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index 8cee956e38d4..c0dd4ae57227 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -372,16 +372,12 @@ static long media_device_get_topology(struct media_device *mdev, void *arg)
> 
>  static long media_device_request_alloc(struct media_device *mdev, void *arg)
>  {
> -#ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
>  	int *alloc_fd = arg;
> 
>  	if (!mdev->ops || !mdev->ops->req_validate || !mdev->ops->req_queue)
>  		return -ENOTTY;
> 
>  	return media_request_alloc(mdev, alloc_fd);
> -#else
> -	return -ENOTTY;
> -#endif
>  }
> 
>  static long copy_arg_from_user(void *karg, void __user *uarg, unsigned int cmd)
> diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/media/platform/mediatek/vcodec/Kconfig
> index 74b00eb1bc97..bc8292232530 100644
> --- a/drivers/media/platform/mediatek/vcodec/Kconfig
> +++ b/drivers/media/platform/mediatek/vcodec/Kconfig
> @@ -24,7 +24,6 @@ config VIDEO_MEDIATEK_VCODEC
>  	select V4L2_H264
>  	select V4L2_VP9
>  	select MEDIA_CONTROLLER
> -	select MEDIA_CONTROLLER_REQUEST_API
>  	help
>  	  Mediatek video codec driver provides HW capability to
>  	  encode and decode in a range of video formats on MT8173
> diff --git a/drivers/media/platform/nvidia/tegra-vde/Kconfig b/drivers/media/platform/nvidia/tegra-vde/Kconfig
> index f7454823bbbb..2fe13f39c95b 100644
> --- a/drivers/media/platform/nvidia/tegra-vde/Kconfig
> +++ b/drivers/media/platform/nvidia/tegra-vde/Kconfig
> @@ -6,7 +6,6 @@ config VIDEO_TEGRA_VDE
>  	select DMA_SHARED_BUFFER
>  	select IOMMU_IOVA
>  	select MEDIA_CONTROLLER
> -	select MEDIA_CONTROLLER_REQUEST_API
>  	select SRAM
>  	select VIDEOBUF2_DMA_CONTIG
>  	select VIDEOBUF2_DMA_SG
> diff --git a/drivers/media/platform/verisilicon/Kconfig b/drivers/media/platform/verisilicon/Kconfig
> index e65b836b9d78..24b927d8f182 100644
> --- a/drivers/media/platform/verisilicon/Kconfig
> +++ b/drivers/media/platform/verisilicon/Kconfig
> @@ -8,7 +8,6 @@ config VIDEO_HANTRO
>  	depends on V4L_MEM2MEM_DRIVERS
>  	depends on VIDEO_DEV
>  	select MEDIA_CONTROLLER
> -	select MEDIA_CONTROLLER_REQUEST_API
>  	select VIDEOBUF2_DMA_CONTIG
>  	select VIDEOBUF2_VMALLOC
>  	select V4L2_MEM2MEM_DEV
> diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
> index 459b433e9fae..5a5379524bde 100644
> --- a/drivers/media/test-drivers/Kconfig
> +++ b/drivers/media/test-drivers/Kconfig
> @@ -12,7 +12,6 @@ config VIDEO_VIM2M
>  	select VIDEOBUF2_VMALLOC
>  	select V4L2_MEM2MEM_DEV
>  	select MEDIA_CONTROLLER
> -	select MEDIA_CONTROLLER_REQUEST_API
>  	help
>  	  This is a virtual test device for the memory-to-memory driver
>  	  framework.
> diff --git a/drivers/media/test-drivers/vicodec/Kconfig b/drivers/media/test-drivers/vicodec/Kconfig
> index a7a828eec2a4..4ea0689c3abe 100644
> --- a/drivers/media/test-drivers/vicodec/Kconfig
> +++ b/drivers/media/test-drivers/vicodec/Kconfig
> @@ -5,7 +5,6 @@ config VIDEO_VICODEC
>  	select VIDEOBUF2_VMALLOC
>  	select V4L2_MEM2MEM_DEV
>  	select MEDIA_CONTROLLER
> -	select MEDIA_CONTROLLER_REQUEST_API
>  	help
>  	  Driver for a Virtual Codec
> 
> diff --git a/drivers/media/test-drivers/visl/Kconfig b/drivers/media/test-drivers/visl/Kconfig
> index 7508b904f196..37be9f267224 100644
> --- a/drivers/media/test-drivers/visl/Kconfig
> +++ b/drivers/media/test-drivers/visl/Kconfig
> @@ -7,7 +7,6 @@ config VIDEO_VISL
>  	select VIDEOBUF2_VMALLOC
>  	select V4L2_MEM2MEM_DEV
>  	select MEDIA_CONTROLLER
> -	select MEDIA_CONTROLLER_REQUEST_API
>  	select VIDEO_V4L2_TPG
>  	help
> 
> diff --git a/drivers/media/test-drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
> index 5b08a5ad291e..ec2e71d76965 100644
> --- a/drivers/media/test-drivers/vivid/Kconfig
> +++ b/drivers/media/test-drivers/vivid/Kconfig
> @@ -10,7 +10,6 @@ config VIDEO_VIVID
>  	select VIDEOBUF2_DMA_CONTIG
>  	select VIDEO_V4L2_TPG
>  	select MEDIA_CONTROLLER
> -	select MEDIA_CONTROLLER_REQUEST_API
>  	help
>  	  Enables a virtual video driver. This driver emulates a webcam,
>  	  TV, S-Video and HDMI capture hardware, including VBI support for
> diff --git a/drivers/staging/media/rkvdec/Kconfig b/drivers/staging/media/rkvdec/Kconfig
> index e963d60cc6ad..5f3bdd848a2c 100644
> --- a/drivers/staging/media/rkvdec/Kconfig
> +++ b/drivers/staging/media/rkvdec/Kconfig
> @@ -4,7 +4,6 @@ config VIDEO_ROCKCHIP_VDEC
>  	depends on ARCH_ROCKCHIP || COMPILE_TEST
>  	depends on VIDEO_DEV
>  	select MEDIA_CONTROLLER
> -	select MEDIA_CONTROLLER_REQUEST_API
>  	select VIDEOBUF2_DMA_CONTIG
>  	select VIDEOBUF2_VMALLOC
>  	select V4L2_MEM2MEM_DEV
> diff --git a/drivers/staging/media/sunxi/cedrus/Kconfig b/drivers/staging/media/sunxi/cedrus/Kconfig
> index 621944f9907a..cb07a343c9c2 100644
> --- a/drivers/staging/media/sunxi/cedrus/Kconfig
> +++ b/drivers/staging/media/sunxi/cedrus/Kconfig
> @@ -6,7 +6,6 @@ config VIDEO_SUNXI_CEDRUS
>  	depends on HAS_DMA
>  	depends on OF
>  	select MEDIA_CONTROLLER
> -	select MEDIA_CONTROLLER_REQUEST_API
>  	select SUNXI_SRAM
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV

-- 
Regards,

Laurent Pinchart


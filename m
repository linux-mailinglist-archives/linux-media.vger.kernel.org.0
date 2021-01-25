Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7E530357C
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 06:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730006AbhAZFng (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:43:36 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:54095 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725320AbhAYJQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 04:16:35 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3xazlSWaXiWRg3xb3lfU0o; Mon, 25 Jan 2021 09:51:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611564702; bh=C3cDWsvM0LjibWiTO81h6zNc9ARaKkT/ejPnG5SrJo8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RkvCK6q2d3IKOorpG8okDw6KUugddM5m4YWiw8veKNfpECCZta4o6rC3+Fjt0WT/3
         DEk87J9jLyuyyUEKYgSVYPCIeEyvoPGynaf4Bwg/RYgBFfGVcefSVJWUS5sxiLr+3W
         i9URChCvTVi8OW46QRWbIMGO/WZcCSN98PBGrHGMfZdpGY6x66G8Sq5FD2bsS+asWI
         wn1ywJmSsMC4sRuCvZkq4xHu6PZ00V7UipePpUrbnr73t8tfeolyv/YBxcXLwMx4oE
         +TwudGH5cXxDDDSDUrIcZO3opjZWDuqQos8r2PUa5g2Ec3bJ7HRUI8ToRQGGvLVsQf
         GyJktgkUBgmIA==
Subject: Re: [PATCH v5 2/3] media: rockchip: Introduce driver for Rockhip's
 camera interface
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
References: <20201229161724.511102-1-maxime.chevallier@bootlin.com>
 <20201229161724.511102-3-maxime.chevallier@bootlin.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f4b9bce1-5f79-5f5e-54df-9c0df020f17c@xs4all.nl>
Date:   Mon, 25 Jan 2021 09:51:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201229161724.511102-3-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHUxYbk6IrmBLYdzUzNsT3uf5qV5aYOleh2ked0/Ab4GrWMj1rddYg6bZgwlOXDcwSC7lT9duka+PIaEf5doHqTdlW0z4RbeYLFnbigMHvibYOoWhVMt
 M9ibm1JVBhsc9Ribr7TM9T109vNcpt2Xu7vg2A+g7nM4Rw21alZz09+M0FzxKrm+F9wPE0jZjrHhA88MGbafw/BqyMEXcJVh53OPq0ZLGuqZ8IM+FJUtsrB8
 4lCX4uUailJNHD1ZW5N629Mt9pkjfvuXLphj3zDAsji7DhCnHD0mEhOk7conITirxdLe4QW31I0hz09SW7NBOxVH3mgDHa04Vu9iMbmISIZNMqPvlfmuv2pa
 KZK+SHEpfZ6m5A+EkZ70N9Egdkc7ZPmMuH6iedO08NSMS0xJ7C4clGgnNNxNORXSUwG5ndoH8PJSTG30o4Qwq3suO6x7EqCwRm63ituir/wrGWxCZBamc7YV
 QNbBGbTaFLeUViNKmwJ00uJKRVEfjTT2iJPO1rgUKZ+mL+ogFC9XxoMGd4lw0qGkf4M5460eVK3VBSJokl2DmATwbVZ4tnTj80RzQBPagQxUQ/HumNh9dVeH
 PGcXEIuw9T4C2qQzUu2lEBWO
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

Note: typo in subject: Rockhip -> Rockchip

Review comments below:

On 29/12/2020 17:17, Maxime Chevallier wrote:
> Introduce a driver for the camera interface on some Rockchip platforms.
> 
> This controller supports CSI2 and BT656 interfaces, but for
> now only the BT656 interface could be tested, hence it's the only one
> that's supported in the first version of this driver.
> 
> This controller can be fond on PX30, RK1808, RK3128, RK3288 and RK3288,
> but for now it's only be tested on PX30.
> 
> Most of this driver was written following the BSP driver from rockchip,
> removing the parts that either didn't fit correctly the guidelines, or
> that couldn't be tested.
> 
> In the BSP, this driver is known as the "cif" driver, but this was
> renamed to "vip" to better fit the controller denomination in the
> datasheet.
> 
> This basic version doesn't support cropping nor scaling, and is only
> designed with one sensor being attached to it a any time.
> 
> This version uses the "pingpong" mode of the controller, which is a
> double-buffering mechanism.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V3:
>  - renamed the driver
>  - Took Hans, Robin and Ezequiel's reviews into account
>  - Implemented the ouble-buffering mode
> 
> v4:
>  - Took Ezequiel's reviews into account
>  - Reworked the imagesize computation
>  - Fixed the bulk API use for clks and rsts
> 
> v5:
>  - Fixed a compile-time warning
>  - Fixed a v4l2-compliance warning
> 
>  drivers/media/platform/Kconfig                |   15 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/rockchip/vip/Makefile  |    3 +
>  drivers/media/platform/rockchip/vip/capture.c | 1146 +++++++++++++++++
>  drivers/media/platform/rockchip/vip/dev.c     |  331 +++++
>  drivers/media/platform/rockchip/vip/dev.h     |  203 +++
>  drivers/media/platform/rockchip/vip/regs.h    |  260 ++++
>  7 files changed, 1959 insertions(+)
>  create mode 100644 drivers/media/platform/rockchip/vip/Makefile
>  create mode 100644 drivers/media/platform/rockchip/vip/capture.c
>  create mode 100644 drivers/media/platform/rockchip/vip/dev.c
>  create mode 100644 drivers/media/platform/rockchip/vip/dev.h
>  create mode 100644 drivers/media/platform/rockchip/vip/regs.h
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 35a18d388f3f..a1778de3774f 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -507,6 +507,21 @@ config VIDEO_ROCKCHIP_RGA
>  
>  	  To compile this driver as a module choose m here.
>  
> +config VIDEO_ROCKCHIP_VIP
> +	tristate "Rockchip VIP (Video InPut) Camera Interface"
> +	depends on VIDEO_DEV && VIDEO_V4L2
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	select VIDEOBUF2_DMA_SG
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_FWNODE
> +	select V4L2_MEM2MEM_DEV
> +	help
> +	  This is a v4l2 driver for Rockchip SOC Camera interface. It supports
> +	  BT.656 and CSI2 inputs.
> +
> +	  To compile this driver as a module choose m here : the module will
> +	  be called video_rkvip.
> +
>  config VIDEO_TI_VPE
>  	tristate "TI VPE (Video Processing Engine) driver"
>  	depends on VIDEO_DEV && VIDEO_V4L2
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 1d63aa956bcd..dc82b6932bd0 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -54,6 +54,7 @@ obj-$(CONFIG_VIDEO_RENESAS_VSP1)	+= vsp1/
>  
>  obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1)	+= rockchip/rkisp1/
>  obj-$(CONFIG_VIDEO_ROCKCHIP_RGA)	+= rockchip/rga/
> +obj-$(CONFIG_VIDEO_ROCKCHIP_VIP)	+= rockchip/vip/
>  
>  obj-y	+= omap/
>  
> diff --git a/drivers/media/platform/rockchip/vip/Makefile b/drivers/media/platform/rockchip/vip/Makefile
> new file mode 100644
> index 000000000000..c239ee0bb0fe
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/vip/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIDEO_ROCKCHIP_VIP) += video_rkvip.o
> +video_rkvip-objs += dev.o capture.o
> diff --git a/drivers/media/platform/rockchip/vip/capture.c b/drivers/media/platform/rockchip/vip/capture.c
> new file mode 100644
> index 000000000000..6794b491da85
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/vip/capture.c
> @@ -0,0 +1,1146 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip VIP Camera Interface Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "dev.h"
> +#include "regs.h"
> +
> +#define VIP_REQ_BUFS_MIN	3
> +#define VIP_MIN_WIDTH		64
> +#define VIP_MIN_HEIGHT		64
> +#define VIP_MAX_WIDTH		8192
> +#define VIP_MAX_HEIGHT		8192
> +
> +#define RK_VIP_PLANE_Y			0
> +#define RK_VIP_PLANE_CBCR		1
> +
> +#define VIP_FETCH_Y_LAST_LINE(VAL) ((VAL) & 0x1fff)
> +/* Check if swap y and c in bt1120 mode */
> +#define VIP_FETCH_IS_Y_FIRST(VAL) ((VAL) & 0xf)
> +
> +static const struct vip_output_fmt out_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV16,
> +		.fmt_val = VIP_FORMAT_YUV_OUTPUT_422 |
> +			   VIP_FORMAT_UV_STORAGE_ORDER_UVUV,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_NV61,
> +		.fmt_val = VIP_FORMAT_YUV_OUTPUT_422 |
> +			   VIP_FORMAT_UV_STORAGE_ORDER_VUVU,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12,
> +		.fmt_val = VIP_FORMAT_YUV_OUTPUT_420 |
> +			   VIP_FORMAT_UV_STORAGE_ORDER_UVUV,
> +		.mbus = MEDIA_BUS_FMT_UYVY8_2X8,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV21,
> +		.fmt_val = VIP_FORMAT_YUV_OUTPUT_420 |
> +			   VIP_FORMAT_UV_STORAGE_ORDER_VUVU,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_RGB24,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_RGB565,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_BGR666,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SRGGB8,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SGRBG8,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SGBRG8,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SBGGR8,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SRGGB10,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SGRBG10,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SGBRG10,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SBGGR10,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SRGGB12,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SGRBG12,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SGBRG12,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SBGGR12,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SBGGR16,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_Y16,
> +	}
> +};
> +
> +static const struct vip_input_fmt in_fmts[] = {
> +	{
> +		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val	= VIP_FORMAT_YUV_INPUT_422 |
> +				  VIP_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_YUV422,
> +		.fmt_type	= VIP_FMT_TYPE_YUV,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val	= VIP_FORMAT_YUV_INPUT_422 |
> +				  VIP_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_YUV422,
> +		.fmt_type	= VIP_FMT_TYPE_YUV,
> +		.field		= V4L2_FIELD_INTERLACED,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val	= VIP_FORMAT_YUV_INPUT_422 |
> +				  VIP_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_YUV422,
> +		.fmt_type	= VIP_FMT_TYPE_YUV,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val	= VIP_FORMAT_YUV_INPUT_422 |
> +				  VIP_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_YUV422,
> +		.fmt_type	= VIP_FMT_TYPE_YUV,
> +		.field		= V4L2_FIELD_INTERLACED,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val	= VIP_FORMAT_YUV_INPUT_422 |
> +				  VIP_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_YUV422,
> +		.fmt_type	= VIP_FMT_TYPE_YUV,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val	= VIP_FORMAT_YUV_INPUT_422 |
> +				  VIP_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_YUV422,
> +		.fmt_type	= VIP_FMT_TYPE_YUV,
> +		.field		= V4L2_FIELD_INTERLACED,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val	= VIP_FORMAT_YUV_INPUT_422 |
> +				  VIP_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_YUV422,
> +		.fmt_type	= VIP_FMT_TYPE_YUV,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val	= VIP_FORMAT_YUV_INPUT_422 |
> +				  VIP_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_YUV422,
> +		.fmt_type	= VIP_FMT_TYPE_YUV,
> +		.field		= V4L2_FIELD_INTERLACED,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_8,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW8,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_8,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW8,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_8,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW8,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_8,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW8,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_10,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW10,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_10,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW10,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_10,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW10,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_10,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW10,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_12,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW12,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_12,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW12,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_12,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW12,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_12,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW12,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RGB888,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_8,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW8,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_10,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW10,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_Y12_1X12,
> +		.dvp_fmt_val	= VIP_FORMAT_INPUT_MODE_RAW |
> +				  VIP_FORMAT_RAW_DATA_WIDTH_12,
> +		.csi_fmt_val	= VIP_CSI_WRDDR_TYPE_RAW12,
> +		.fmt_type	= VIP_FMT_TYPE_RAW,
> +		.field		= V4L2_FIELD_NONE,
> +	}
> +};
> +
> +static const struct
> +vip_input_fmt *get_input_fmt(struct v4l2_subdev *sd)
> +{
> +	struct v4l2_subdev_format fmt;
> +	int ret;
> +	u32 i;
> +
> +	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +	fmt.pad = 0;
> +	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
> +	if (ret < 0) {
> +		v4l2_warn(sd->v4l2_dev,
> +			  "sensor fmt invalid, set to default size\n");
> +		goto set_default;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(in_fmts); i++)
> +		if (fmt.format.code == in_fmts[i].mbus_code &&
> +		    fmt.format.field == in_fmts[i].field)
> +			return &in_fmts[i];
> +
> +	v4l2_err(sd->v4l2_dev, "remote sensor mbus code not supported\n");
> +
> +set_default:
> +	return NULL;
> +}
> +
> +static const struct
> +vip_output_fmt *find_output_fmt(struct rk_vip_stream *stream, u32 pixelfmt)
> +{
> +	const struct vip_output_fmt *fmt;
> +	u32 i;
> +
> +	for (i = 0; i < ARRAY_SIZE(out_fmts); i++) {
> +		fmt = &out_fmts[i];
> +		if (fmt->fourcc == pixelfmt)
> +			return fmt;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void rk_vip_setup_buffers(struct rk_vip_stream *stream)
> +{
> +	struct rk_vip_device *dev = stream->vipdev;
> +	void __iomem *base = dev->base_addr;
> +
> +	write_vip_reg(base, VIP_FRM0_ADDR_Y, stream->buffs[0]->buff_addr[RK_VIP_PLANE_Y]);
> +	write_vip_reg(base, VIP_FRM0_ADDR_UV, stream->buffs[0]->buff_addr[RK_VIP_PLANE_CBCR]);
> +
> +	write_vip_reg(base, VIP_FRM1_ADDR_Y, stream->buffs[1]->buff_addr[RK_VIP_PLANE_Y]);
> +	write_vip_reg(base, VIP_FRM1_ADDR_UV, stream->buffs[1]->buff_addr[RK_VIP_PLANE_CBCR]);
> +}
> +
> +static struct rk_vip_buffer *rk_vip_buffer_next(struct rk_vip_stream *stream)
> +{
> +	struct rk_vip_buffer *buff;
> +
> +	if (list_empty(&stream->buf_head))
> +		return NULL;
> +
> +	buff = list_first_entry(&stream->buf_head, struct rk_vip_buffer, queue);
> +	list_del(&buff->queue);
> +
> +	return buff;
> +}
> +
> +static void rk_vip_init_buffers(struct rk_vip_stream *stream)
> +{
> +	spin_lock(&stream->vbq_lock);
> +
> +	stream->buffs[0] = rk_vip_buffer_next(stream);
> +	stream->buffs[1] = rk_vip_buffer_next(stream);
> +
> +	spin_unlock(&stream->vbq_lock);
> +
> +	rk_vip_setup_buffers(stream);
> +}
> +
> +static void rk_vip_assign_new_buffer_pingpong(struct rk_vip_stream *stream)
> +{
> +	struct rk_vip_scratch_buffer *scratch_buf = &stream->scratch_buf;
> +	struct rk_vip_device *dev = stream->vipdev;
> +	struct rk_vip_buffer *buffer = NULL;
> +	void __iomem *base = dev->base_addr;
> +	u32 frm_addr_y, frm_addr_uv;
> +
> +	/* Set up an empty buffer for the next frame */
> +	spin_lock(&stream->vbq_lock);
> +
> +	buffer = rk_vip_buffer_next(stream);
> +	stream->buffs[stream->frame_phase] = buffer;
> +
> +	spin_unlock(&stream->vbq_lock);
> +
> +	frm_addr_y = stream->frame_phase ? VIP_FRM1_ADDR_Y : VIP_FRM0_ADDR_Y;
> +	frm_addr_uv = stream->frame_phase ? VIP_FRM1_ADDR_UV : VIP_FRM0_ADDR_UV;
> +
> +	if (buffer) {
> +		write_vip_reg(base, frm_addr_y,
> +			      buffer->buff_addr[RK_VIP_PLANE_Y]);
> +		write_vip_reg(base, frm_addr_uv,
> +			      buffer->buff_addr[RK_VIP_PLANE_CBCR]);
> +	} else {
> +		write_vip_reg(base, frm_addr_y, scratch_buf->dma_addr);
> +		write_vip_reg(base, frm_addr_uv, scratch_buf->dma_addr);
> +	}
> +}
> +
> +static void rk_vip_stream_stop(struct rk_vip_stream *stream)
> +{
> +	struct rk_vip_device *vip_dev = stream->vipdev;
> +	void __iomem *base = vip_dev->base_addr;
> +	u32 val;
> +
> +	val = read_vip_reg(base, VIP_CTRL);
> +	write_vip_reg(base, VIP_CTRL, val & (~VIP_CTRL_ENABLE_CAPTURE));
> +	write_vip_reg(base, VIP_INTEN, 0x0);
> +	write_vip_reg(base, VIP_INTSTAT, 0x3ff);
> +	write_vip_reg(base, VIP_FRAME_STATUS, 0x0);
> +
> +	stream->state = RK_VIP_STATE_READY;
> +}
> +
> +static int rk_vip_queue_setup(struct vb2_queue *queue,
> +			      unsigned int *num_buffers,
> +			      unsigned int *num_planes,
> +			      unsigned int sizes[],
> +			      struct device *alloc_devs[])
> +{
> +	struct rk_vip_stream *stream = queue->drv_priv;
> +	const struct v4l2_plane_pix_format *plane_fmt;
> +	const struct v4l2_pix_format_mplane *pixm;
> +
> +	pixm = &stream->pixm;
> +
> +	if (*num_planes) {
> +		if (*num_planes != 1)
> +			return -EINVAL;

You can drop this test: the vb2 framework guarantees that the number
of planes is always consistent.

> +
> +		if (sizes[0] < pixm->plane_fmt[0].sizeimage)
> +			return -EINVAL;
> +		return 0;
> +	}
> +
> +	*num_planes = 1;
> +
> +	plane_fmt = &pixm->plane_fmt[0];
> +	sizes[0] = plane_fmt->sizeimage;
> +
> +	*num_buffers = VIP_REQ_BUFS_MIN;
> +
> +	return 0;
> +}
> +
> +static void rk_vip_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rk_vip_buffer *vipbuf = to_rk_vip_buffer(vbuf);
> +	struct vb2_queue *queue = vb->vb2_queue;
> +	struct rk_vip_stream *stream = queue->drv_priv;
> +	struct v4l2_pix_format_mplane *pixm = &stream->pixm;
> +	unsigned long lock_flags = 0;
> +	int i;
> +
> +	memset(vipbuf->buff_addr, 0, sizeof(vipbuf->buff_addr));
> +
> +	vipbuf->buff_addr[0] = vb2_dma_contig_plane_dma_addr(vb, 0);
> +
> +	for (i = 0; i < pixm->num_planes - 1; i++)
> +		vipbuf->buff_addr[i + 1] = vipbuf->buff_addr[i] +
> +			pixm->plane_fmt[i].bytesperline * pixm->height;
> +
> +	spin_lock_irqsave(&stream->vbq_lock, lock_flags);
> +	list_add_tail(&vipbuf->queue, &stream->buf_head);
> +	spin_unlock_irqrestore(&stream->vbq_lock, lock_flags);
> +}
> +
> +static int rk_vip_create_scratch_buf(struct rk_vip_stream *stream)
> +{
> +	struct rk_vip_scratch_buffer *scratch_buf = &stream->scratch_buf;
> +	struct rk_vip_device *dev = stream->vipdev;
> +
> +	/* get a maximum plane size */
> +	scratch_buf->size = max(stream->pixm.plane_fmt[0].sizeimage,
> +				stream->pixm.plane_fmt[1].sizeimage);
> +
> +	scratch_buf->vaddr = dma_alloc_coherent(dev->dev, scratch_buf->size,
> +						&scratch_buf->dma_addr,
> +						GFP_KERNEL);
> +	if (!scratch_buf->vaddr) {
> +		v4l2_err(&dev->v4l2_dev,
> +			 "Failed to allocate the memory for scratch buffer\n");
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void rk_vip_destroy_scratch_buf(struct rk_vip_stream *stream)
> +{
> +	struct rk_vip_scratch_buffer *scratch_buf = &stream->scratch_buf;
> +	struct rk_vip_device *dev = stream->vipdev;
> +
> +	dma_free_coherent(dev->dev, scratch_buf->size,
> +			  scratch_buf->vaddr, scratch_buf->dma_addr);
> +}
> +
> +static void rk_vip_stop_streaming(struct vb2_queue *queue)
> +{
> +	struct rk_vip_stream *stream = queue->drv_priv;
> +	struct rk_vip_device *dev = stream->vipdev;
> +	struct rk_vip_buffer *buf;
> +	struct v4l2_subdev *sd;
> +	int ret;
> +
> +	stream->stopping = true;
> +	ret = wait_event_timeout(stream->wq_stopped,
> +				 stream->state != RK_VIP_STATE_STREAMING,
> +				 msecs_to_jiffies(1000));
> +	if (!ret) {
> +		rk_vip_stream_stop(stream);
> +		stream->stopping = false;
> +	}
> +	pm_runtime_put(dev->dev);
> +
> +	/* stop the sub device*/
> +	sd = dev->sensor.sd;
> +	v4l2_subdev_call(sd, video, s_stream, 0);
> +	v4l2_subdev_call(sd, core, s_power, 0);
> +
> +	/* release buffers */
> +	if (stream->buffs[0]) {
> +		list_add_tail(&stream->buffs[0]->queue, &stream->buf_head);
> +		stream->buffs[0] = NULL;
> +	}
> +	if (stream->buffs[1]) {
> +		list_add_tail(&stream->buffs[1]->queue, &stream->buf_head);
> +		stream->buffs[1] = NULL;
> +	}
> +
> +	while (!list_empty(&stream->buf_head)) {
> +		buf = rk_vip_buffer_next(stream);
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +	}
> +
> +	rk_vip_destroy_scratch_buf(stream);
> +}
> +
> +static u32 rk_vip_determine_input_mode(struct rk_vip_device *dev)
> +{
> +	struct rk_vip_sensor_info *sensor_info = &dev->sensor;
> +	struct rk_vip_stream *stream = &dev->stream;
> +	v4l2_std_id std;
> +	u32 mode = VIP_FORMAT_INPUT_MODE_YUV;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(sensor_info->sd, video, querystd, &std);
> +	if (ret == 0) {
> +		/* retrieve std from sensor if exist */
> +		switch (std) {
> +		case 0:
> +			break;
> +		case V4L2_STD_NTSC:
> +			mode = VIP_FORMAT_INPUT_MODE_NTSC;
> +			break;
> +		case V4L2_STD_PAL:
> +			mode = VIP_FORMAT_INPUT_MODE_PAL;
> +			break;
> +		case V4L2_STD_ATSC:

STD_ATSC is no longer supported. Is this meant to support e.g. HDMI
video receivers? If so, then this should be done very differently
(using the DV_TIMINGS ioctls).

> +			mode = VIP_FORMAT_INPUT_MODE_BT1120;
> +			break;
> +		default:
> +			v4l2_err(&dev->v4l2_dev,
> +				 "std: %lld is not supported", std);

Missing break.

> +		}
> +	} else {
> +		/* determine input mode by mbus_code (fmt_type) */
> +		switch (stream->vip_fmt_in->fmt_type) {
> +		case VIP_FMT_TYPE_YUV:
> +			mode = VIP_FORMAT_INPUT_MODE_YUV;
> +			break;
> +		case VIP_FMT_TYPE_RAW:
> +			mode = VIP_FORMAT_INPUT_MODE_RAW;
> +			break;
> +		}
> +	}
> +
> +	return mode;
> +}
> +
> +static inline u32 rk_vip_scl_ctl(struct rk_vip_stream *stream)
> +{
> +	u32 fmt_type = stream->vip_fmt_in->fmt_type;
> +
> +	return (fmt_type == VIP_FMT_TYPE_YUV) ?
> +		VIP_SCL_CTRL_ENABLE_YUV_16BIT_BYPASS :
> +		VIP_SCL_CTRL_ENABLE_RAW_16BIT_BYPASS;
> +}
> +
> +static int rk_vip_stream_start(struct rk_vip_stream *stream)
> +{
> +	u32 val, mbus_flags, href_pol, vsync_pol,
> +	    xfer_mode = 0, yc_swap = 0, skip_top = 0;
> +	struct rk_vip_device *dev = stream->vipdev;
> +	struct rk_vip_sensor_info *sensor_info;
> +	void __iomem *base = dev->base_addr;
> +
> +	sensor_info = &dev->sensor;
> +	stream->frame_idx = 0;
> +
> +	mbus_flags = sensor_info->mbus.flags;
> +	href_pol = (mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH) ?
> +			VIP_FORMAT_HSY_HIGH_ACTIVE : VIP_FORMAT_HSY_LOW_ACTIVE;
> +	vsync_pol = (mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH) ?
> +			VIP_FORMAT_VSY_HIGH_ACTIVE : VIP_FORMAT_VSY_LOW_ACTIVE;
> +
> +	if (rk_vip_determine_input_mode(dev) == VIP_FORMAT_INPUT_MODE_BT1120) {

No, this is wrong.

In order to support video receivers you need to implement the G_STD, S_STD and
QUERYSTD ioctls. Userspace will typically call QUERYSTD first, followed by S_STD
with the result of the QUERYSTD ioctl. S_STD will update the format (since that
depends on the standard) and that it what is used to configure the hardware.

So stream_start will use the format configured by S_STD and shall not query
this on the fly.

Was this driver ever tested with a SDTV video receiver? I'm pretty sure it would
fail the compliance test.

If you have only tested this with a sensor, then I would recommend that you
drop the video receiver support in this driver for this initial submission.
When you are able to test with a video receiver later, then support for that
can be added at that time.

> +		if (stream->vip_fmt_in->field == V4L2_FIELD_NONE)
> +			xfer_mode = VIP_FORMAT_BT1120_TRANSMIT_PROGRESS;
> +		else
> +			xfer_mode = VIP_FORMAT_BT1120_TRANSMIT_INTERFACE;

TRANSMIT_INTERFACE? Did you mean TRANSMIT_INTERLACED?

> +
> +		if (!VIP_FETCH_IS_Y_FIRST(stream->vip_fmt_in->dvp_fmt_val))
> +			yc_swap = VIP_FORMAT_BT1120_YC_SWAP;
> +	}
> +
> +	val = vsync_pol | href_pol | rk_vip_determine_input_mode(dev) |
> +	      stream->vip_fmt_out->fmt_val | stream->vip_fmt_in->dvp_fmt_val |
> +	      xfer_mode | yc_swap;
> +	write_vip_reg(base, VIP_FOR, val);
> +	val = stream->pixm.width;
> +	if (stream->vip_fmt_in->fmt_type == VIP_FMT_TYPE_RAW)
> +		val = stream->pixm.width * 2;
> +	write_vip_reg(base, VIP_VIR_LINE_WIDTH, val);
> +	write_vip_reg(base, VIP_SET_SIZE,
> +		      stream->pixm.width | (stream->pixm.height << 16));
> +
> +	v4l2_subdev_call(sensor_info->sd, sensor, g_skip_top_lines, &skip_top);
> +
> +	write_vip_reg(base, VIP_CROP, skip_top << VIP_CROP_Y_SHIFT);
> +	write_vip_reg(base, VIP_FRAME_STATUS, VIP_FRAME_STAT_CLS);
> +	write_vip_reg(base, VIP_INTSTAT, VIP_INTSTAT_CLS);
> +	write_vip_reg(base, VIP_SCL_CTRL, rk_vip_scl_ctl(stream));
> +
> +	rk_vip_init_buffers(stream);
> +
> +	write_vip_reg(base, VIP_INTEN, VIP_INTEN_FRAME_END_EN |
> +				       VIP_INTEN_LINE_ERR_EN |
> +				       VIP_INTEN_PST_INF_FRAME_END_EN);
> +
> +	write_vip_reg(base, VIP_CTRL, VIP_CTRL_AXI_BURST_16 |
> +				      VIP_CTRL_MODE_PINGPONG |
> +				      VIP_CTRL_ENABLE_CAPTURE);
> +
> +	stream->state = RK_VIP_STATE_STREAMING;
> +
> +	return 0;
> +}
> +
> +static int rk_vip_start_streaming(struct vb2_queue *queue, unsigned int count)
> +{
> +	struct rk_vip_stream *stream = queue->drv_priv;
> +	struct rk_vip_device *dev = stream->vipdev;
> +	struct v4l2_device *v4l2_dev = &dev->v4l2_dev;
> +	struct v4l2_subdev *sd;
> +	int ret;
> +
> +	if (WARN_ON(stream->state != RK_VIP_STATE_READY)) {
> +		ret = -EBUSY;
> +		v4l2_err(v4l2_dev, "stream in busy state\n");
> +		goto destroy_buf;
> +	}
> +
> +	stream->vip_fmt_in = get_input_fmt(dev->sensor.sd);
> +
> +	ret = rk_vip_create_scratch_buf(stream);
> +	if (ret < 0) {
> +		v4l2_err(v4l2_dev, "Failed to create scratch_buf, %d\n", ret);
> +		goto destroy_buf;
> +	}
> +
> +	ret = pm_runtime_get_sync(dev->dev);
> +	if (ret < 0) {
> +		v4l2_err(v4l2_dev, "Failed to get runtime pm, %d\n", ret);
> +		goto destroy_scratch_buf;
> +	}
> +
> +	/* start sub-devices */
> +	sd = dev->sensor.sd;
> +	ret = v4l2_subdev_call(sd, core, s_power, 1);
> +	if (ret < 0 && ret != -ENOIOCTLCMD)
> +		goto runtime_put;
> +	ret = v4l2_subdev_call(sd, video, s_stream, 1);
> +	if (ret < 0)
> +		goto subdev_poweroff;
> +
> +	ret = rk_vip_stream_start(stream);
> +	if (ret < 0)
> +		goto stop_stream;
> +
> +	return 0;
> +
> +stop_stream:
> +	rk_vip_stream_stop(stream);
> +subdev_poweroff:
> +	v4l2_subdev_call(sd, core, s_power, 0);
> +runtime_put:
> +	pm_runtime_put(dev->dev);
> +destroy_scratch_buf:
> +	rk_vip_destroy_scratch_buf(stream);
> +destroy_buf:
> +	while (!list_empty(&stream->buf_head)) {
> +		struct rk_vip_buffer *buf;
> +
> +		buf = rk_vip_buffer_next(stream);
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
> +	}
> +
> +	return ret;
> +}
> +
> +static struct vb2_ops rk_vip_vb2_ops = {
> +	.queue_setup = rk_vip_queue_setup,
> +	.buf_queue = rk_vip_buf_queue,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.stop_streaming = rk_vip_stop_streaming,
> +	.start_streaming = rk_vip_start_streaming,
> +};
> +
> +static int rk_vip_init_vb2_queue(struct vb2_queue *q,
> +				 struct rk_vip_stream *stream)
> +{
> +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE |
> +		  V4L2_BUF_TYPE_VIDEO_CAPTURE;

Drop V4L2_BUF_TYPE_VIDEO_CAPTURE. You can't set both, and beside, these
defines aren't bitmasks so you can't OR them at all.

> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> +	q->drv_priv = stream;
> +	q->ops = &rk_vip_vb2_ops;
> +	q->mem_ops = &vb2_dma_contig_memops;
> +	q->buf_struct_size = sizeof(struct rk_vip_buffer);
> +	q->min_buffers_needed = VIP_REQ_BUFS_MIN;
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->lock = &stream->vlock;
> +	q->dev = stream->vipdev->dev;
> +
> +	return vb2_queue_init(q);
> +}
> +
> +static void rk_vip_set_fmt(struct rk_vip_stream *stream,
> +			   struct v4l2_pix_format_mplane *pixm,
> +			   bool try)
> +{
> +	struct rk_vip_device *dev = stream->vipdev;
> +	struct v4l2_subdev_format sd_fmt;
> +	const struct vip_output_fmt *fmt;
> +	struct v4l2_rect input_rect;
> +	u32 width, height;
> +
> +	fmt = find_output_fmt(stream, pixm->pixelformat);
> +	if (!fmt)
> +		fmt = &out_fmts[0];
> +
> +	if (!try) {
> +		sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +		sd_fmt.pad = 0;
> +		sd_fmt.format.width = pixm->width;
> +		sd_fmt.format.height = pixm->height;
> +		v4l2_subdev_call(dev->sensor.sd, pad, set_fmt, NULL, &sd_fmt);
> +
> +		pixm->width = sd_fmt.format.width;
> +		pixm->height = sd_fmt.format.height;
> +	}
> +
> +	input_rect.width = VIP_MAX_WIDTH;
> +	input_rect.height = VIP_MAX_HEIGHT;
> +
> +	width = clamp_t(u32, pixm->width, VIP_MIN_WIDTH, input_rect.width);
> +	height = clamp_t(u32, pixm->height, VIP_MIN_HEIGHT, input_rect.height);
> +
> +	v4l2_fill_pixfmt_mp(pixm, fmt->fourcc, width, height);
> +
> +	pixm->quantization = V4L2_QUANTIZATION_DEFAULT;
> +	pixm->colorspace = V4L2_COLORSPACE_SRGB;
> +
> +	pixm->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pixm->colorspace);
> +	pixm->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(pixm->colorspace);

The colorimetry information really should come from the subdev. Sensors will
typically return SRGB, video receivers return V4L2_COLORSPACE_SMPTE170M.

> +
> +	pixm->field = V4L2_FIELD_NONE;
> +
> +	if (!try) {
> +		stream->vip_fmt_out = fmt;
> +		stream->pixm = *pixm;
> +	}
> +}
> +
> +void rk_vip_stream_init(struct rk_vip_device *dev)
> +{
> +	struct rk_vip_stream *stream = &dev->stream;
> +	struct v4l2_pix_format_mplane pixm;
> +
> +	memset(stream, 0, sizeof(*stream));
> +	memset(&pixm, 0, sizeof(pixm));
> +	stream->vipdev = dev;
> +
> +	INIT_LIST_HEAD(&stream->buf_head);
> +	spin_lock_init(&stream->vbq_lock);
> +	stream->state = RK_VIP_STATE_READY;
> +	init_waitqueue_head(&stream->wq_stopped);
> +
> +	/* Set default format */
> +	pixm.pixelformat = V4L2_PIX_FMT_NV12;
> +	pixm.width = RK_VIP_DEFAULT_WIDTH;
> +	pixm.height = RK_VIP_DEFAULT_HEIGHT;
> +	rk_vip_set_fmt(stream, &pixm, false);
> +
> +	stream->crop.left = 0;
> +	stream->crop.top = 0;
> +	stream->crop.width = 10;
> +	stream->crop.height = 10;

Huh? I would expect that the initial crop width and height are equal
to the width and height of the default format.

Since cropping is not (yet) supported, I would just drop the crop field
altogether.

> +}
> +
> +static const struct v4l2_file_operations rk_vip_fops = {
> +	.open = v4l2_fh_open,
> +	.release = vb2_fop_release,
> +	.unlocked_ioctl = video_ioctl2,
> +	.poll = vb2_fop_poll,
> +	.mmap = vb2_fop_mmap,
> +};
> +
> +static int rk_vip_enum_input(struct file *file, void *priv,
> +			     struct v4l2_input *input)
> +{
> +	if (input->index > 0)
> +		return -EINVAL;
> +
> +	input->type = V4L2_INPUT_TYPE_CAMERA;
> +	strlcpy(input->name, "Camera", sizeof(input->name));

To properly support video receivers you need to call the subdev video
g_input_status op here so you can fill in the input->status field.

> +
> +	return 0;
> +}
> +
> +static int rk_vip_try_fmt_vid_cap_mplane(struct file *file, void *fh,
> +					 struct v4l2_format *f)
> +{
> +	struct rk_vip_stream *stream = video_drvdata(file);
> +
> +	rk_vip_set_fmt(stream, &f->fmt.pix_mp, true);
> +
> +	return 0;
> +}
> +
> +static int rk_vip_enum_fmt_vid_cap(struct file *file, void *priv,
> +				   struct v4l2_fmtdesc *f)
> +{
> +	const struct vip_output_fmt *fmt = NULL;
> +
> +	if (f->index >= ARRAY_SIZE(out_fmts))
> +		return -EINVAL;
> +
> +	fmt = &out_fmts[f->index];
> +	f->pixelformat = fmt->fourcc;
> +
> +	return 0;
> +}
> +
> +static int rk_vip_s_fmt_vid_cap_mplane(struct file *file,
> +				       void *priv, struct v4l2_format *f)
> +{
> +	struct rk_vip_stream *stream = video_drvdata(file);
> +
> +	if (stream->state == RK_VIP_STATE_STREAMING)
> +		return -EBUSY;
> +
> +	rk_vip_set_fmt(stream, &f->fmt.pix_mp, false);
> +
> +	return 0;
> +}
> +
> +static int rk_vip_g_fmt_vid_cap_mplane(struct file *file, void *fh,
> +				       struct v4l2_format *f)
> +{
> +	struct rk_vip_stream *stream = video_drvdata(file);
> +
> +	f->fmt.pix_mp = stream->pixm;
> +
> +	return 0;
> +}
> +
> +static int rk_vip_querycap(struct file *file, void *priv,
> +			   struct v4l2_capability *cap)
> +{
> +	struct rk_vip_stream *stream = video_drvdata(file);
> +	struct device *dev = stream->vipdev->dev;
> +
> +	strlcpy(cap->driver, dev->driver->name, sizeof(cap->driver));
> +	strlcpy(cap->card, dev->driver->name, sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s", dev_name(dev));
> +
> +	return 0;
> +}
> +
> +static int rk_vip_enum_framesizes(struct file *file, void *fh,
> +				  struct v4l2_frmsizeenum *fsize)
> +{
> +	struct rk_vip_stream *stream = video_drvdata(file);
> +	struct rk_vip_device *dev = stream->vipdev;
> +	struct v4l2_subdev_frame_size_enum fse = {
> +		.index = fsize->index,
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +	const struct vip_output_fmt *fmt;
> +	int ret;
> +
> +	if (!dev->sensor.sd)
> +		return -EINVAL;
> +
> +	fmt = find_output_fmt(stream, fsize->pixel_format);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	fse.code = fmt->mbus;
> +
> +	ret = v4l2_subdev_call(dev->sensor.sd, pad, enum_frame_size,
> +			       NULL, &fse);
> +	if (ret)
> +		return ret;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
> +	fsize->discrete.width = fse.max_width;
> +	fsize->discrete.height = fse.max_height;
> +
> +	return 0;
> +}
> +
> +static int rk_vip_enum_frameintervals(struct file *file, void *fh,
> +				      struct v4l2_frmivalenum *fival)
> +{
> +	struct rk_vip_stream *stream = video_drvdata(file);
> +	struct rk_vip_device *dev = stream->vipdev;
> +	struct v4l2_subdev_frame_interval_enum fie = {
> +		.index = fival->index,
> +		.width = fival->width,
> +		.height = fival->height,
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +	const struct vip_output_fmt *fmt;
> +	int ret;
> +
> +	if (!dev->sensor.sd)
> +		return -EINVAL;
> +
> +	fmt = find_output_fmt(stream, fival->pixel_format);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	fie.code = fmt->mbus;
> +
> +	ret = v4l2_subdev_call(dev->sensor.sd, pad, enum_frame_interval,
> +			       NULL, &fie);
> +	if (ret)
> +		return ret;
> +
> +	fival->type = V4L2_FRMSIZE_TYPE_DISCRETE;
> +	fival->discrete = fie.interval;
> +
> +	return 0;
> +}
> +
> +static int rk_vip_g_input(struct file *file, void *fh, unsigned int *i)
> +{
> +	*i = 0;
> +	return 0;
> +}
> +
> +static int rk_vip_s_input(struct file *file, void *fh, unsigned int i)
> +{
> +	if (i)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int rk_vip_g_parm(struct file *file, void *priv,
> +			 struct v4l2_streamparm *p)
> +{
> +	struct rk_vip_stream *stream = video_drvdata(file);
> +	struct rk_vip_device *dev = stream->vipdev;
> +
> +	return v4l2_g_parm_cap(video_devdata(file), dev->sensor.sd, p);
> +}
> +
> +static int rk_vip_s_parm(struct file *file, void *priv,
> +			 struct v4l2_streamparm *p)
> +{
> +	struct rk_vip_stream *stream = video_drvdata(file);
> +	struct rk_vip_device *dev = stream->vipdev;
> +
> +	return v4l2_s_parm_cap(video_devdata(file), dev->sensor.sd, p);
> +}
> +
> +static const struct v4l2_ioctl_ops rk_vip_v4l2_ioctl_ops = {
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +
> +	.vidioc_enum_fmt_vid_cap = rk_vip_enum_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap_mplane = rk_vip_try_fmt_vid_cap_mplane,
> +	.vidioc_s_fmt_vid_cap_mplane = rk_vip_s_fmt_vid_cap_mplane,
> +	.vidioc_g_fmt_vid_cap_mplane = rk_vip_g_fmt_vid_cap_mplane,
> +	.vidioc_querycap = rk_vip_querycap,
> +	.vidioc_enum_framesizes = rk_vip_enum_framesizes,
> +	.vidioc_enum_frameintervals = rk_vip_enum_frameintervals,
> +
> +	.vidioc_enum_input = rk_vip_enum_input,
> +	.vidioc_g_input = rk_vip_g_input,
> +	.vidioc_s_input = rk_vip_s_input,
> +
> +	.vidioc_g_parm = rk_vip_g_parm,
> +	.vidioc_s_parm = rk_vip_s_parm,
> +};
> +
> +void rk_vip_unregister_stream_vdev(struct rk_vip_device *dev)
> +{
> +	struct rk_vip_stream *stream = &dev->stream;
> +
> +	media_entity_cleanup(&stream->vdev.entity);
> +	video_unregister_device(&stream->vdev);
> +}
> +
> +int rk_vip_register_stream_vdev(struct rk_vip_device *dev)
> +{
> +	struct rk_vip_stream *stream = &dev->stream;
> +	struct v4l2_device *v4l2_dev = &dev->v4l2_dev;
> +	struct video_device *vdev = &stream->vdev;
> +	int ret;
> +
> +	strlcpy(vdev->name, VIP_VIDEODEVICE_NAME, sizeof(vdev->name));
> +	mutex_init(&stream->vlock);
> +
> +	vdev->ioctl_ops = &rk_vip_v4l2_ioctl_ops;
> +	vdev->release = video_device_release_empty;
> +	vdev->fops = &rk_vip_fops;
> +	vdev->minor = -1;
> +	vdev->v4l2_dev = v4l2_dev;
> +	vdev->lock = &stream->vlock;
> +	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> +			    V4L2_CAP_STREAMING;
> +	video_set_drvdata(vdev, stream);
> +	vdev->vfl_dir = VFL_DIR_RX;
> +	stream->pad.flags = MEDIA_PAD_FL_SINK;
> +
> +	rk_vip_init_vb2_queue(&stream->buf_queue, stream);
> +
> +	vdev->queue = &stream->buf_queue;
> +	strscpy(vdev->name, KBUILD_MODNAME, sizeof(vdev->name));
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret < 0) {
> +		v4l2_err(v4l2_dev,
> +			 "video_register_device failed with error %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = media_entity_pads_init(&vdev->entity, 1, &stream->pad);
> +	if (ret < 0)
> +		goto unreg;
> +
> +	return 0;
> +unreg:
> +	video_unregister_device(vdev);
> +	return ret;
> +}
> +
> +static void rk_vip_vb_done(struct rk_vip_stream *stream,
> +			   struct vb2_v4l2_buffer *vb_done)
> +{
> +	vb2_set_plane_payload(&vb_done->vb2_buf, 0,
> +			      stream->pixm.plane_fmt[0].sizeimage);
> +	vb_done->vb2_buf.timestamp = ktime_get_ns();
> +	vb_done->sequence = stream->frame_idx;
> +	vb2_buffer_done(&vb_done->vb2_buf, VB2_BUF_STATE_DONE);
> +}
> +
> +static void rk_vip_reset_stream(struct rk_vip_device *vip_dev)
> +{
> +	void __iomem *base = vip_dev->base_addr;
> +	u32 ctl = read_vip_reg(base, VIP_CTRL);
> +
> +	write_vip_reg(base, VIP_CTRL, ctl & (~VIP_CTRL_ENABLE_CAPTURE));
> +	write_vip_reg(base, VIP_CTRL, ctl | VIP_CTRL_ENABLE_CAPTURE);
> +}
> +
> +irqreturn_t rk_vip_irq_pingpong(int irq, void *ctx)
> +{
> +	struct device *dev = ctx;
> +	struct rk_vip_device *vip_dev = dev_get_drvdata(dev);
> +	struct rk_vip_stream *stream = &vip_dev->stream;
> +	void __iomem *base = vip_dev->base_addr;
> +	unsigned int intstat;
> +
> +	u32 lastline, lastpix, ctl, vip_frmst;
> +
> +	intstat = read_vip_reg(base, VIP_INTSTAT);
> +	vip_frmst = read_vip_reg(base, VIP_FRAME_STATUS);
> +	lastline = VIP_FETCH_Y_LAST_LINE(read_vip_reg(base, VIP_LAST_LINE));
> +	lastpix = read_vip_reg(base, VIP_LAST_PIX);
> +	ctl = read_vip_reg(base, VIP_CTRL);
> +
> +	/* There are two irqs enabled:
> +	 *  - PST_INF_FRAME_END: vip FIFO is ready,
> +	 *    this is prior to FRAME_END
> +	 *  - FRAME_END: vip has saved frame to memory,
> +	 *    a frame ready
> +	 */
> +
> +	if ((intstat & VIP_INTSTAT_PST_INF_FRAME_END)) {
> +		write_vip_reg(base, VIP_INTSTAT,
> +			      VIP_INTSTAT_PST_INF_FRAME_END_CLR);
> +
> +		if (stream->stopping)
> +			/* To stop VIP ASAP, before FRAME_END irq */
> +			write_vip_reg(base, VIP_CTRL,
> +				      ctl & (~VIP_CTRL_ENABLE_CAPTURE));
> +	}
> +
> +	if ((intstat & VIP_INTSTAT_PRE_INF_FRAME_END))
> +		write_vip_reg(base, VIP_INTSTAT, VIP_INTSTAT_PRE_INF_FRAME_END);
> +
> +	if (intstat & (VIP_INTSTAT_LINE_ERR | VIP_INTSTAT_PIX_ERR)) {
> +		write_vip_reg(base, VIP_INTSTAT, VIP_INTSTAT_LINE_ERR |
> +						 VIP_INTSTAT_PIX_ERR);
> +		rk_vip_reset_stream(vip_dev);
> +	}
> +
> +	if ((intstat & VIP_INTSTAT_FRAME_END)) {
> +		struct vb2_v4l2_buffer *vb_done = NULL;
> +
> +		write_vip_reg(base, VIP_INTSTAT, VIP_INTSTAT_FRAME_END_CLR |
> +						 VIP_INTSTAT_LINE_END_CLR);
> +
> +		if (stream->stopping) {
> +			rk_vip_stream_stop(stream);
> +			stream->stopping = false;
> +			wake_up(&stream->wq_stopped);
> +			return IRQ_HANDLED;
> +		}
> +
> +		if (lastline != stream->pixm.height) {
> +			v4l2_err(&vip_dev->v4l2_dev,
> +				 "Bad frame, irq:0x%x frmst:0x%x size:%dx%d\n",
> +				 intstat, vip_frmst, lastline, lastpix);
> +
> +			rk_vip_reset_stream(vip_dev);
> +		}
> +
> +		if (vip_frmst & VIP_INTSTAT_F0_READY)
> +			stream->frame_phase = 0;
> +		else if (vip_frmst & VIP_INTSTAT_F1_READY)
> +			stream->frame_phase = 1;
> +		else
> +			return IRQ_HANDLED;
> +
> +		if (stream->buffs[stream->frame_phase])
> +			vb_done = &stream->buffs[stream->frame_phase]->vb;
> +
> +		rk_vip_assign_new_buffer_pingpong(stream);
> +
> +		if (vb_done)
> +			rk_vip_vb_done(stream, vb_done);
> +
> +		stream->frame_idx++;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> diff --git a/drivers/media/platform/rockchip/vip/dev.c b/drivers/media/platform/rockchip/vip/dev.c
> new file mode 100644
> index 000000000000..86e2e34756df
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/vip/dev.c
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip VIP Camera Interface Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/reset.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#include "dev.h"
> +#include "regs.h"
> +
> +#define RK_VIP_VERNO_LEN		10
> +
> +struct vip_match_data {
> +	int chip_id;
> +	const char * const *clks;
> +	const char * const *rsts;
> +	int clks_num;
> +	int rsts_num;
> +};
> +
> +static int rk_vip_create_links(struct rk_vip_device *dev)
> +{
> +	struct v4l2_subdev *sd = dev->sensor.sd;
> +	int ret;
> +
> +	ret = media_create_pad_link(&sd->entity, 0,
> +				    &dev->stream.vdev.entity, 0,
> +				    MEDIA_LNK_FL_ENABLED);
> +	if (ret) {
> +		dev_err(dev->dev, "failed to create link");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int subdev_notifier_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct rk_vip_device *dev;
> +	int ret;
> +
> +	dev = container_of(notifier, struct rk_vip_device, notifier);
> +
> +	mutex_lock(&dev->media_dev.graph_mutex);
> +
> +	ret = v4l2_device_register_subdev_nodes(&dev->v4l2_dev);
> +	if (ret < 0)
> +		goto unlock;
> +
> +	ret = rk_vip_create_links(dev);
> +	if (ret < 0)
> +		goto unlock;
> +
> +unlock:
> +	mutex_unlock(&dev->media_dev.graph_mutex);
> +	return ret;
> +}
> +
> +static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
> +				 struct v4l2_subdev *subdev,
> +				 struct v4l2_async_subdev *asd)
> +{
> +	struct rk_vip_device *vip_dev = container_of(notifier,
> +					struct rk_vip_device, notifier);
> +
> +	int pad;
> +
> +	vip_dev->sensor.sd = subdev;
> +	pad = media_entity_get_fwnode_pad(&subdev->entity, subdev->fwnode,
> +					  MEDIA_PAD_FL_SOURCE);
> +	if (pad < 0)
> +		return pad;
> +
> +	vip_dev->sensor.pad = pad;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations subdev_notifier_ops = {
> +	.bound = subdev_notifier_bound,
> +	.complete = subdev_notifier_complete,
> +};
> +
> +static int vip_subdev_notifier(struct rk_vip_device *vip_dev)
> +{
> +	struct v4l2_async_notifier *ntf = &vip_dev->notifier;
> +	struct device *dev = vip_dev->dev;
> +	struct v4l2_fwnode_endpoint vep = {
> +		.bus_type = V4L2_MBUS_PARALLEL,
> +	};
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	v4l2_async_notifier_init(ntf);
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -EINVAL;
> +
> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
> +							   &vip_dev->asd);
> +	if (ret)
> +		return ret;
> +
> +	ntf->ops = &subdev_notifier_ops;
> +
> +	fwnode_handle_put(ep);
> +
> +	ret = v4l2_async_notifier_register(&vip_dev->v4l2_dev, ntf);
> +	return ret;
> +}
> +
> +static int rk_vip_register_platform_subdevs(struct rk_vip_device *vip_dev)
> +{
> +	int ret;
> +
> +	ret = rk_vip_register_stream_vdev(vip_dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = vip_subdev_notifier(vip_dev);
> +	if (ret < 0) {
> +		v4l2_err(&vip_dev->v4l2_dev,
> +			 "Failed to register subdev notifier(%d)\n", ret);
> +		rk_vip_unregister_stream_vdev(vip_dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static const char * const px30_vip_clks[] = {
> +	"aclk",
> +	"hclk",
> +	"pclk",
> +};
> +
> +static const struct vip_match_data px30_vip_match_data = {
> +	.chip_id = CHIP_PX30_VIP,
> +	.clks = px30_vip_clks,
> +	.clks_num = ARRAY_SIZE(px30_vip_clks),
> +};
> +
> +static const struct of_device_id rk_vip_plat_of_match[] = {
> +	{
> +		.compatible = "rockchip,px30-vip",
> +		.data = &px30_vip_match_data,
> +	},
> +	{},
> +};
> +
> +void rk_vip_soft_reset(struct rk_vip_device *vip_dev)
> +{
> +	reset_control_assert(vip_dev->vip_rst);
> +
> +	udelay(5);
> +
> +	reset_control_deassert(vip_dev->vip_rst);
> +}
> +
> +static int rk_vip_plat_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	struct device_node *node = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct v4l2_device *v4l2_dev;
> +	struct rk_vip_device *vip_dev;
> +	const struct vip_match_data *data;
> +	struct resource *res;
> +	int i, ret, irq;
> +
> +	match = of_match_node(rk_vip_plat_of_match, node);
> +	if (IS_ERR(match))
> +		return PTR_ERR(match);
> +
> +	vip_dev = devm_kzalloc(dev, sizeof(*vip_dev), GFP_KERNEL);
> +	if (!vip_dev)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, vip_dev);
> +	vip_dev->dev = dev;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, rk_vip_irq_pingpong, IRQF_SHARED,
> +			       dev_driver_string(dev), dev);
> +	if (ret < 0) {
> +		dev_err(dev, "request irq failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	vip_dev->irq = irq;
> +	data = match->data;
> +	vip_dev->chip_id = data->chip_id;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	vip_dev->base_addr = devm_ioremap_resource(dev, res);
> +
> +	if (IS_ERR(vip_dev->base_addr))
> +		return PTR_ERR(vip_dev->base_addr);
> +
> +	for (i = 0; i < data->clks_num; i++)
> +		vip_dev->clks[i].id = data->clks[i];
> +
> +	vip_dev->num_clk = data->clks_num;
> +
> +	ret = devm_clk_bulk_get(dev, vip_dev->num_clk, vip_dev->clks);
> +	if (ret)
> +		return ret;
> +
> +	vip_dev->vip_rst = devm_reset_control_array_get(dev, false, false);
> +	if (IS_ERR(vip_dev->vip_rst))
> +		return PTR_ERR(vip_dev->vip_rst);
> +
> +	/* Initialize the stream */
> +	rk_vip_stream_init(vip_dev);
> +
> +	strlcpy(vip_dev->media_dev.model, "rk_vip",
> +		sizeof(vip_dev->media_dev.model));
> +	vip_dev->media_dev.dev = &pdev->dev;
> +	v4l2_dev = &vip_dev->v4l2_dev;
> +	v4l2_dev->mdev = &vip_dev->media_dev;
> +	strlcpy(v4l2_dev->name, "rk_vip", sizeof(v4l2_dev->name));
> +
> +	ret = v4l2_device_register(vip_dev->dev, &vip_dev->v4l2_dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	media_device_init(&vip_dev->media_dev);
> +
> +	ret = media_device_register(&vip_dev->media_dev);
> +	if (ret < 0) {
> +		v4l2_err(v4l2_dev, "Failed to register media device: %d\n",
> +			 ret);
> +		goto err_unreg_v4l2_dev;
> +	}
> +
> +	/* create & register platefom subdev (from of_node) */

platefom -> platform

> +	ret = rk_vip_register_platform_subdevs(vip_dev);
> +	if (ret < 0)
> +		goto err_unreg_media_dev;
> +
> +	ret = of_reserved_mem_device_init(dev);
> +	if (ret)
> +		v4l2_warn(v4l2_dev, "No reserved memory region assign to VIP\n");
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return 0;
> +
> +err_unreg_media_dev:
> +	media_device_unregister(&vip_dev->media_dev);
> +err_unreg_v4l2_dev:
> +	v4l2_device_unregister(&vip_dev->v4l2_dev);
> +	return ret;
> +}
> +
> +static int rk_vip_plat_remove(struct platform_device *pdev)
> +{
> +	struct rk_vip_device *vip_dev = platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	media_device_unregister(&vip_dev->media_dev);
> +	v4l2_device_unregister(&vip_dev->v4l2_dev);
> +	rk_vip_unregister_stream_vdev(vip_dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused rk_vip_runtime_suspend(struct device *dev)
> +{
> +	struct rk_vip_device *vip_dev = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(vip_dev->num_clk, vip_dev->clks);
> +
> +	return pinctrl_pm_select_sleep_state(dev);
> +}
> +
> +static int __maybe_unused rk_vip_runtime_resume(struct device *dev)
> +{
> +	struct rk_vip_device *vip_dev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pinctrl_pm_select_default_state(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return clk_bulk_prepare_enable(vip_dev->num_clk, vip_dev->clks);
> +}
> +
> +static const struct dev_pm_ops rk_vip_plat_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(rk_vip_runtime_suspend, rk_vip_runtime_resume, NULL)
> +};
> +
> +static struct platform_driver rk_vip_plat_drv = {
> +	.driver = {
> +		   .name = VIP_DRIVER_NAME,
> +		   .of_match_table = of_match_ptr(rk_vip_plat_of_match),
> +		   .pm = &rk_vip_plat_pm_ops,
> +	},
> +	.probe = rk_vip_plat_probe,
> +	.remove = rk_vip_plat_remove,
> +};
> +
> +module_platform_driver(rk_vip_plat_drv);
> +MODULE_AUTHOR("Rockchip Camera/ISP team");
> +MODULE_DESCRIPTION("Rockchip VIP platform driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/rockchip/vip/dev.h b/drivers/media/platform/rockchip/vip/dev.h
> new file mode 100644
> index 000000000000..c4594df6d952
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/vip/dev.h
> @@ -0,0 +1,203 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip VIP Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + */
> +
> +#ifndef _RK_VIP_DEV_H
> +#define _RK_VIP_DEV_H
> +
> +#include <linux/clk.h>
> +#include <linux/mutex.h>
> +#include <media/media-device.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#define VIP_DRIVER_NAME		"rk_vip"
> +#define VIP_VIDEODEVICE_NAME	"stream_vip"
> +
> +#define RK_VIP_MAX_BUS_CLK	8
> +#define RK_VIP_MAX_SENSOR	2
> +#define RK_VIP_MAX_RESET		5
> +#define RK_VIP_MAX_CSI_CHANNEL	4
> +
> +#define RK_VIP_DEFAULT_WIDTH	640
> +#define RK_VIP_DEFAULT_HEIGHT	480
> +
> +#define write_vip_reg(base, addr, val)  writel(val, (addr) + (base))
> +#define read_vip_reg(base, addr) readl((addr) + (base))
> +
> +#define write_csihost_reg(base, addr, val)  writel(val, (addr) + (base))
> +#define read_csihost_reg(base, addr) readl((addr) + (base))
> +
> +enum rk_vip_state {
> +	RK_VIP_STATE_DISABLED,
> +	RK_VIP_STATE_READY,
> +	RK_VIP_STATE_STREAMING
> +};
> +
> +enum rk_vip_chip_id {
> +	CHIP_PX30_VIP,
> +	CHIP_RK1808_VIP,
> +	CHIP_RK3128_VIP,
> +	CHIP_RK3288_VIP
> +};
> +
> +enum host_type_t {
> +	RK_CSI_RXHOST,
> +	RK_DSI_RXHOST
> +};
> +
> +struct rk_vip_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head queue;
> +	union {
> +		u32 buff_addr[VIDEO_MAX_PLANES];
> +		void *vaddr[VIDEO_MAX_PLANES];
> +	};
> +};
> +
> +struct rk_vip_scratch_buffer {
> +	void *vaddr;
> +	dma_addr_t dma_addr;
> +	u32 size;
> +};
> +
> +extern int rk_vip_debug;
> +
> +static inline struct rk_vip_buffer *to_rk_vip_buffer(struct vb2_v4l2_buffer *vb)
> +{
> +	return container_of(vb, struct rk_vip_buffer, vb);
> +}
> +
> +/*
> + * struct rk_vip_sensor_info - Sensor infomations
> + * @mbus: media bus configuration
> + */
> +struct rk_vip_sensor_info {
> +	struct v4l2_subdev *sd;
> +	int pad;
> +	struct v4l2_mbus_config mbus;
> +	int lanes;
> +};
> +
> +/*
> + * struct vip_output_fmt - The output format
> + *
> + * @fourcc: pixel format in fourcc
> + * @cplanes: number of colour planes
> + * @fmt_val: the fmt val corresponding to VIP_FOR register
> + * @bpp: bits per pixel for each cplanes
> + */
> +struct vip_output_fmt {
> +	u32 fourcc;
> +	u32 mbus;
> +	u32 fmt_val;
> +};
> +
> +enum vip_fmt_type {
> +	VIP_FMT_TYPE_YUV = 0,
> +	VIP_FMT_TYPE_RAW,
> +};
> +
> +/*
> + * struct vip_input_fmt - The input mbus format from sensor
> + *
> + * @mbus_code: mbus format
> + * @dvp_fmt_val: the fmt val corresponding to VIP_FOR register
> + * @csi_fmt_val: the fmt val corresponding to VIP_CSI_ID_CTRL
> + * @field: the field type of the input from sensor
> + */
> +struct vip_input_fmt {
> +	u32 mbus_code;
> +	u32 dvp_fmt_val;
> +	u32 csi_fmt_val;
> +	enum vip_fmt_type fmt_type;
> +	enum v4l2_field field;
> +};
> +
> +/*
> + * struct rk_vip_stream - Stream states TODO
> + *
> + * @vbq_lock: lock to protect buf_queue
> + * @buf_queue: queued buffer list
> + * @scratch_buf: scratch space to store dropped data
> + *
> + * rk_vip use shadowsock registers, so it need two buffer at a time

What's 'shadowsock'?

> + * @curr_buf: the buffer used for current frame
> + * @next_buf: the buffer used for next frame
> + */
> +struct rk_vip_stream {
> +	struct rk_vip_device		*vipdev;
> +	enum rk_vip_state		state;
> +	bool				stopping;
> +	wait_queue_head_t		wq_stopped;
> +	int				frame_idx;
> +	int				frame_phase;
> +
> +	/* lock between irq and buf_queue */
> +	spinlock_t			vbq_lock;
> +	struct vb2_queue		buf_queue;
> +	struct list_head		buf_head;
> +	struct rk_vip_scratch_buffer	scratch_buf;
> +	struct rk_vip_buffer		*buffs[2];
> +
> +	/* vfd lock */
> +	struct mutex			vlock;
> +	struct video_device		vdev;
> +	struct media_pad		pad;
> +
> +	const struct vip_output_fmt	*vip_fmt_out;
> +	const struct vip_input_fmt	*vip_fmt_in;
> +	struct v4l2_pix_format_mplane	pixm;
> +	struct v4l2_rect		crop;
> +	int				crop_enable;
> +};
> +
> +static inline struct rk_vip_stream *to_rk_vip_stream(struct video_device *vdev)
> +{
> +	return container_of(vdev, struct rk_vip_stream, vdev);
> +}
> +
> +/*
> + * struct rk_vip_device - ISP platform device
> + * @base_addr: base register address
> + * @active_sensor: sensor in-use, set when streaming on
> + * @stream: capture video device
> + */
> +struct rk_vip_device {
> +	struct list_head		list;
> +	struct device			*dev;
> +	int				irq;
> +	void __iomem			*base_addr;
> +	void __iomem			*csi_base;
> +	struct clk_bulk_data		clks[RK_VIP_MAX_BUS_CLK];
> +	int				num_clk;
> +	struct vb2_alloc_ctx		*alloc_ctx;
> +	bool				iommu_en;
> +	struct iommu_domain		*domain;
> +	struct reset_control		*vip_rst;
> +
> +	struct v4l2_device		v4l2_dev;
> +	struct media_device		media_dev;
> +	struct v4l2_ctrl_handler	ctrl_handler;
> +	struct v4l2_async_notifier	notifier;
> +	struct v4l2_async_subdev	asd;
> +	struct rk_vip_sensor_info	sensor;
> +
> +	struct rk_vip_stream		stream;
> +
> +	int				chip_id;
> +};
> +
> +void rk_vip_unregister_stream_vdev(struct rk_vip_device *dev);
> +int rk_vip_register_stream_vdev(struct rk_vip_device *dev);
> +void rk_vip_stream_init(struct rk_vip_device *dev);
> +
> +irqreturn_t rk_vip_irq_pingpong(int irq, void *ctx);
> +void rk_vip_soft_reset(struct rk_vip_device *vip_dev);
> +
> +#endif
> diff --git a/drivers/media/platform/rockchip/vip/regs.h b/drivers/media/platform/rockchip/vip/regs.h
> new file mode 100644
> index 000000000000..cfe287ce5bf6
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/vip/regs.h
> @@ -0,0 +1,260 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip VIP Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + */
> +
> +#ifndef _RK_VIP_REGS_H
> +#define _RK_VIP_REGS_H
> +
> +/* VIP Reg Offset */
> +#define VIP_CTRL			0x00
> +#define VIP_INTEN			0x04
> +#define VIP_INTSTAT			0x08
> +#define VIP_FOR				0x0c
> +#define VIP_LINE_NUM_ADDR		0x10
> +#define VIP_FRM0_ADDR_Y			0x14
> +#define VIP_FRM0_ADDR_UV		0x18
> +#define VIP_FRM1_ADDR_Y			0x1c
> +#define VIP_FRM1_ADDR_UV		0x20
> +#define VIP_VIR_LINE_WIDTH		0x24
> +#define VIP_SET_SIZE			0x28
> +#define VIP_SCM_ADDR_Y			0x2c
> +#define VIP_SCM_ADDR_U			0x30
> +#define VIP_SCM_ADDR_V			0x34
> +#define VIP_WB_UP_FILTER		0x38
> +#define VIP_WB_LOW_FILTER		0x3c
> +#define VIP_WBC_CNT			0x40
> +#define VIP_CROP			0x44
> +#define VIP_SCL_CTRL			0x48
> +#define VIP_SCL_DST			0x4c
> +#define VIP_SCL_FCT			0x50
> +#define VIP_SCL_VALID_NUM		0x54
> +#define VIP_LINE_LOOP_CTR		0x58
> +#define VIP_FRAME_STATUS		0x60
> +#define VIP_CUR_DST			0x64
> +#define VIP_LAST_LINE			0x68
> +#define VIP_LAST_PIX			0x6c
> +
> +/* RK1808 VIP CSI Registers Offset */
> +#define VIP_CSI_ID0_CTRL0		0x80
> +#define VIP_CSI_ID0_CTRL1		0x84
> +#define VIP_CSI_ID1_CTRL0		0x88
> +#define VIP_CSI_ID1_CTRL1		0x8c
> +#define VIP_CSI_ID2_CTRL0		0x90
> +#define VIP_CSI_ID2_CTRL1		0x94
> +#define VIP_CSI_ID3_CTRL0		0x98
> +#define VIP_CSI_ID3_CTRL1		0x9c
> +#define VIP_CSI_WATER_LINE		0xa0
> +#define VIP_CSI_FRM0_ADDR_Y_ID0		0xa4
> +#define VIP_CSI_FRM1_ADDR_Y_ID0		0xa8
> +#define VIP_CSI_FRM0_ADDR_UV_ID0	0xac
> +#define VIP_CSI_FRM1_ADDR_UV_ID0	0xb0
> +#define VIP_CSI_FRM0_VLW_Y_ID0		0xb4
> +#define VIP_CSI_FRM1_VLW_Y_ID0		0xb8
> +#define VIP_CSI_FRM0_VLW_UV_ID0		0xbc
> +#define VIP_CSI_FRM1_VLW_UV_ID0		0xc0
> +#define VIP_CSI_FRM0_ADDR_Y_ID1		0xc4
> +#define VIP_CSI_FRM1_ADDR_Y_ID1		0xc8
> +#define VIP_CSI_FRM0_ADDR_UV_ID1	0xcc
> +#define VIP_CSI_FRM1_ADDR_UV_ID1	0xd0
> +#define VIP_CSI_FRM0_VLW_Y_ID1		0xd4
> +#define VIP_CSI_FRM1_VLW_Y_ID1		0xd8
> +#define VIP_CSI_FRM0_VLW_UV_ID1		0xdc
> +#define VIP_CSI_FRM1_VLW_UV_ID1		0xe0
> +#define VIP_CSI_FRM0_ADDR_Y_ID2		0xe4
> +#define VIP_CSI_FRM1_ADDR_Y_ID2		0xe8
> +#define VIP_CSI_FRM0_ADDR_UV_ID2	0xec
> +#define VIP_CSI_FRM1_ADDR_UV_ID2	0xf0
> +#define VIP_CSI_FRM0_VLW_Y_ID2		0xf4
> +#define VIP_CSI_FRM1_VLW_Y_ID2		0xf8
> +#define VIP_CSI_FRM0_VLW_UV_ID2		0xfc
> +#define VIP_CSI_FRM1_VLW_UV_ID2		0x100
> +#define VIP_CSI_FRM0_ADDR_Y_ID3		0x104
> +#define VIP_CSI_FRM1_ADDR_Y_ID3		0x108
> +#define VIP_CSI_FRM0_ADDR_UV_ID3	0x10c
> +#define VIP_CSI_FRM1_ADDR_UV_ID3	0x110
> +#define VIP_CSI_FRM0_VLW_Y_ID3		0x114
> +#define VIP_CSI_FRM1_VLW_Y_ID3		0x118
> +#define VIP_CSI_FRM0_VLW_UV_ID3		0x11c
> +#define VIP_CSI_FRM1_VLW_UV_ID3		0x120
> +#define VIP_CSI_INTEN			0x124
> +#define VIP_CSI_INTSTAT			0x128
> +#define VIP_CSI_LINE_INT_NUM_ID0_1	0x12c
> +#define VIP_CSI_LINE_INT_NUM_ID2_3	0x130
> +#define VIP_CSI_LINE_CNT_ID0_1		0x134
> +#define VIP_CSI_LINE_CNT_ID2_3		0x138
> +#define VIP_CSI_ID0_CROP_START		0x13c
> +#define VIP_CSI_ID1_CROP_START		0x140
> +#define VIP_CSI_ID2_CROP_START		0x144
> +#define VIP_CSI_ID3_CROP_START		0x148
> +
> +/* The key register bit description */
> +
> +/* VIP_CTRL Reg */
> +#define VIP_CTRL_DISABLE_CAPTURE			(0x0 << 0)
> +#define VIP_CTRL_ENABLE_CAPTURE			(0x1 << 0)
> +#define VIP_CTRL_MODE_ONEFRAME			(0x0 << 1)
> +#define VIP_CTRL_MODE_PINGPONG			(0x1 << 1)
> +#define VIP_CTRL_MODE_LINELOOP			(0x2 << 1)
> +#define VIP_CTRL_AXI_BURST_16			(0xF << 12)
> +
> +/* VIP_INTEN */
> +#define VIP_INTEN_DISABLE			(0x0 << 0)
> +#define VIP_INTEN_FRAME_END_EN			(0x1 << 0)
> +#define VIP_INTEN_LINE_ERR_EN			(0x1 << 2)
> +#define VIP_INTEN_BUS_ERR_EN			(0x1 << 6)
> +#define VIP_INTEN_SCL_ERR_EN			(0x1 << 7)
> +#define VIP_INTEN_PST_INF_FRAME_END_EN		(0x1 << 9)
> +
> +/* VIP INTSTAT */
> +#define VIP_INTSTAT_CLS			(0x3FF)
> +#define VIP_INTSTAT_FRAME_END			(0x01 << 0)
> +#define VIP_INTSTAT_LINE_END			(0x01 << 1)
> +#define VIP_INTSTAT_LINE_ERR			(0x01 << 2)
> +#define VIP_INTSTAT_PIX_ERR			(0x01 << 3)
> +#define VIP_INTSTAT_PRE_INF_FRAME_END		(0x01 << 8)
> +#define VIP_INTSTAT_PST_INF_FRAME_END		(0x01 << 9)
> +#define VIP_INTSTAT_FRAME_END_CLR			(0x01 << 0)
> +#define VIP_INTSTAT_LINE_END_CLR			(0x01 << 1)
> +#define VIP_INTSTAT_LINE_ERR_CLR			(0x01 << 2)
> +#define VIP_INTSTAT_PST_INF_FRAME_END_CLR		(0x01 << 9)
> +#define VIP_INTSTAT_ERR			(0xFC)
> +
> +/* VIP_FRAME STATUS */
> +#define VIP_FRAME_STAT_CLS			0x00
> +#define VIP_FRAME_FRM0_STAT_CLS			0x20	/* write 0 to clear frame 0 */
> +
> +/* VIP_FORMAT */
> +#define VIP_FORMAT_VSY_HIGH_ACTIVE			(0x01 << 0)
> +#define VIP_FORMAT_VSY_LOW_ACTIVE			(0x00 << 0)
> +#define VIP_FORMAT_HSY_LOW_ACTIVE			(0x01 << 1)
> +#define VIP_FORMAT_HSY_HIGH_ACTIVE			(0x00 << 1)
> +#define VIP_FORMAT_INPUT_MODE_YUV			(0x00 << 2)
> +#define VIP_FORMAT_INPUT_MODE_PAL			(0x02 << 2)
> +#define VIP_FORMAT_INPUT_MODE_NTSC			(0x03 << 2)
> +#define VIP_FORMAT_INPUT_MODE_BT1120		(0x07 << 2)
> +#define VIP_FORMAT_INPUT_MODE_RAW			(0x04 << 2)
> +#define VIP_FORMAT_INPUT_MODE_JPEG			(0x05 << 2)
> +#define VIP_FORMAT_INPUT_MODE_MIPI			(0x06 << 2)
> +#define VIP_FORMAT_YUV_INPUT_ORDER_UYVY		(0x00 << 5)
> +#define VIP_FORMAT_YUV_INPUT_ORDER_YVYU		(0x01 << 5)
> +#define VIP_FORMAT_YUV_INPUT_ORDER_VYUY		(0x10 << 5)
> +#define VIP_FORMAT_YUV_INPUT_ORDER_YUYV		(0x03 << 5)
> +#define VIP_FORMAT_YUV_INPUT_422			(0x00 << 7)
> +#define VIP_FORMAT_YUV_INPUT_420			(0x01 << 7)
> +#define VIP_FORMAT_INPUT_420_ORDER_EVEN		(0x00 << 8)
> +#define VIP_FORMAT_INPUT_420_ORDER_ODD		(0x01 << 8)
> +#define VIP_FORMAT_CCIR_INPUT_ORDER_ODD		(0x00 << 9)
> +#define VIP_FORMAT_CCIR_INPUT_ORDER_EVEN		(0x01 << 9)
> +#define VIP_FORMAT_RAW_DATA_WIDTH_8		(0x00 << 11)
> +#define VIP_FORMAT_RAW_DATA_WIDTH_10		(0x01 << 11)
> +#define VIP_FORMAT_RAW_DATA_WIDTH_12		(0x02 << 11)
> +#define VIP_FORMAT_YUV_OUTPUT_422			(0x00 << 16)
> +#define VIP_FORMAT_YUV_OUTPUT_420			(0x01 << 16)
> +#define VIP_FORMAT_OUTPUT_420_ORDER_EVEN		(0x00 << 17)
> +#define VIP_FORMAT_OUTPUT_420_ORDER_ODD		(0x01 << 17)
> +#define VIP_FORMAT_RAWD_DATA_LITTLE_ENDIAN		(0x00 << 18)
> +#define VIP_FORMAT_RAWD_DATA_BIG_ENDIAN		(0x01 << 18)
> +#define VIP_FORMAT_UV_STORAGE_ORDER_UVUV		(0x00 << 19)
> +#define VIP_FORMAT_UV_STORAGE_ORDER_VUVU		(0x01 << 19)
> +#define VIP_FORMAT_BT1120_CLOCK_SINGLE_EDGES	(0x00 << 24)
> +#define VIP_FORMAT_BT1120_CLOCK_DOUBLE_EDGES	(0x01 << 24)
> +#define VIP_FORMAT_BT1120_TRANSMIT_INTERFACE	(0x00 << 25)
> +#define VIP_FORMAT_BT1120_TRANSMIT_PROGRESS	(0x01 << 25)
> +#define VIP_FORMAT_BT1120_YC_SWAP			(0x01 << 26)
> +
> +/* VIP_SCL_CTRL */
> +#define VIP_SCL_CTRL_ENABLE_SCL_DOWN			(0x01 << 0)
> +#define VIP_SCL_CTRL_DISABLE_SCL_DOWN		(0x00 << 0)
> +#define VIP_SCL_CTRL_ENABLE_SCL_UP			(0x01 << 1)
> +#define VIP_SCL_CTRL_DISABLE_SCL_UP			(0x00 << 1)
> +#define VIP_SCL_CTRL_ENABLE_YUV_16BIT_BYPASS		(0x01 << 4)
> +#define VIP_SCL_CTRL_DISABLE_YUV_16BIT_BYPASS	(0x00 << 4)
> +#define VIP_SCL_CTRL_ENABLE_RAW_16BIT_BYPASS		(0x01 << 5)
> +#define VIP_SCL_CTRL_DISABLE_RAW_16BIT_BYPASS	(0x00 << 5)
> +#define VIP_SCL_CTRL_ENABLE_32BIT_BYPASS		(0x01 << 6)
> +#define VIP_SCL_CTRL_DISABLE_32BIT_BYPASS		(0x00 << 6)
> +
> +/* VIP_INTSTAT */
> +#define VIP_INTSTAT_F0_READY			(0x01 << 0)
> +#define VIP_INTSTAT_F1_READY			(0x01 << 1)
> +
> +/* VIP_CROP */
> +#define VIP_CROP_Y_SHIFT		16
> +#define VIP_CROP_X_SHIFT		0
> +
> +/* VIP_CSI_ID_CTRL0 */
> +#define VIP_CSI_DISABLE_CAPTURE		(0x0 << 0)
> +#define VIP_CSI_ENABLE_CAPTURE		(0x1 << 0)
> +#define VIP_CSI_WRDDR_TYPE_RAW8		(0x0 << 1)
> +#define VIP_CSI_WRDDR_TYPE_RAW10		(0x1 << 1)
> +#define VIP_CSI_WRDDR_TYPE_RAW12		(0x2 << 1)
> +#define VIP_CSI_WRDDR_TYPE_RGB888		(0x3 << 1)
> +#define VIP_CSI_WRDDR_TYPE_YUV422		(0x4 << 1)
> +#define VIP_CSI_DISABLE_COMMAND_MODE	(0x0 << 4)
> +#define VIP_CSI_ENABLE_COMMAND_MODE		(0x1 << 4)
> +#define VIP_CSI_DISABLE_CROP		(0x0 << 5)
> +#define VIP_CSI_ENABLE_CROP			(0x1 << 5)
> +
> +/* VIP_CSI_INTEN */
> +#define VIP_CSI_FRAME0_START_INTEN(id)	(0x1 << ((id) * 2))
> +#define VIP_CSI_FRAME1_START_INTEN(id)	(0x1 << ((id) * 2 + 1))
> +#define VIP_CSI_FRAME0_END_INTEN(id)	(0x1 << ((id) * 2 + 8))
> +#define VIP_CSI_FRAME1_END_INTEN(id)	(0x1 << ((id) * 2 + 9))
> +#define VIP_CSI_DMA_Y_FIFO_OVERFLOW_INTEN	(0x1 << 16)
> +#define VIP_CSI_DMA_UV_FIFO_OVERFLOW_INTEN	(0x1 << 17)
> +#define VIP_CSI_CONFIG_FIFO_OVERFLOW_INTEN	(0x1 << 18)
> +#define VIP_CSI_BANDWIDTH_LACK_INTEN	(0x1 << 19)
> +#define VIP_CSI_RX_FIFO_OVERFLOW_INTEN	(0x1 << 20)
> +#define VIP_CSI_ALL_FRAME_START_INTEN	(0xff << 0)
> +#define VIP_CSI_ALL_FRAME_END_INTEN		(0xff << 8)
> +#define VIP_CSI_ALL_ERROR_INTEN		(0x1f << 16)
> +
> +/* VIP_CSI_INTSTAT */
> +#define VIP_CSI_FRAME0_START_ID0		(0x1 << 0)
> +#define VIP_CSI_FRAME1_START_ID0		(0x1 << 1)
> +#define VIP_CSI_FRAME0_START_ID1		(0x1 << 2)
> +#define VIP_CSI_FRAME1_START_ID1		(0x1 << 3)
> +#define VIP_CSI_FRAME0_START_ID2		(0x1 << 4)
> +#define VIP_CSI_FRAME1_START_ID2		(0x1 << 5)
> +#define VIP_CSI_FRAME0_START_ID3		(0x1 << 6)
> +#define VIP_CSI_FRAME1_START_ID3		(0x1 << 7)
> +#define VIP_CSI_FRAME0_END_ID0		(0x1 << 8)
> +#define VIP_CSI_FRAME1_END_ID0		(0x1 << 9)
> +#define VIP_CSI_FRAME0_END_ID1		(0x1 << 10)
> +#define VIP_CSI_FRAME1_END_ID1		(0x1 << 11)
> +#define VIP_CSI_FRAME0_END_ID2		(0x1 << 12)
> +#define VIP_CSI_FRAME1_END_ID2		(0x1 << 13)
> +#define VIP_CSI_FRAME0_END_ID3		(0x1 << 14)
> +#define VIP_CSI_FRAME1_END_ID3		(0x1 << 15)
> +#define VIP_CSI_DMA_Y_FIFO_OVERFLOW		(0x1 << 16)
> +#define VIP_CSI_DMA_UV_FIFO_OVERFLOW	(0x1 << 17)
> +#define VIP_CSI_CONFIG_FIFO_OVERFLOW	(0x1 << 18)
> +#define VIP_CSI_BANDWIDTH_LACK		(0x1 << 19)
> +#define VIP_CSI_RX_FIFO_OVERFLOW		(0x1 << 20)
> +
> +#define VIP_CSI_FIFO_OVERFLOW	(VIP_CSI_DMA_Y_FIFO_OVERFLOW |	\
> +				 VIP_CSI_DMA_UV_FIFO_OVERFLOW |	\
> +				 VIP_CSI_CONFIG_FIFO_OVERFLOW |	\
> +				 VIP_CSI_RX_FIFO_OVERFLOW)
> +
> +/* CSI Host Registers Define */
> +#define VIP_CSIHOST_N_LANES		0x04
> +#define VIP_CSIHOST_PHY_RSTZ	0x0c
> +#define VIP_CSIHOST_RESETN		0x10
> +#define VIP_CSIHOST_ERR1		0x20
> +#define VIP_CSIHOST_ERR2		0x24
> +#define VIP_CSIHOST_MSK1		0x28
> +#define VIP_CSIHOST_MSK2		0x2c
> +#define VIP_CSIHOST_CONTROL		0x40
> +
> +#define VIP_SW_CPHY_EN(x)		((x) << 0)
> +#define VIP_SW_DSI_EN(x)		((x) << 4)
> +#define VIP_SW_DATATYPE_FS(x)	((x) << 8)
> +#define VIP_SW_DATATYPE_FE(x)	((x) << 14)
> +#define VIP_SW_DATATYPE_LS(x)	((x) << 20)
> +#define VIP_SW_DATATYPE_LE(x)	((x) << 26)
> +
> +#endif
> 

Regards,

	Hans

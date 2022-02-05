Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D77F4AA5A3
	for <lists+linux-media@lfdr.de>; Sat,  5 Feb 2022 03:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378952AbiBECVZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 21:21:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52824 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240608AbiBECVY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 21:21:24 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23DC9472;
        Sat,  5 Feb 2022 03:21:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644027682;
        bh=uHcrAsFw1sertY95DaOEajBL6YruRfTq3b5cavmZGZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kumD0izDxFiWs9FqIKapBUVJsfCYMr4R8AtnNrEEg8OaH8+A0CQcp0MixeyAa9Tbm
         KEKlnnnelYlWwG2wIEz2lCCJLfNVpxIEHKr6F9D5vCOlTH3N21xuYacOy0/691JDRv
         5x7k/kMUaVM9vi20UfrUwA9IzwzU3cOMLEDUhNOc=
Date:   Sat, 5 Feb 2022 04:20:57 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc:     dave.stevenson@raspberrypi.com, devicetree@vger.kernel.org,
        kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, lukasz@jany.st,
        mchehab@kernel.org, naush@raspberrypi.com, robh@kernel.org,
        tomi.valkeinen@ideasonboard.com, nsaenz@kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [RFC PATCH v4 05/12] media: bcm2835-unicam: Add support for
 CCP2/CSI2 camera interface
Message-ID: <Yf3fCVdfq3Wv08om@pendragon.ideasonboard.com>
References: <20220203175009.558868-1-jeanmichel.hautbois@ideasonboard.com>
 <20220203175009.558868-6-jeanmichel.hautbois@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220203175009.558868-6-jeanmichel.hautbois@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jean-Michel,

Thank you for the patch.

On Thu, Feb 03, 2022 at 06:50:02PM +0100, Jean-Michel Hautbois wrote:
> Add driver for the Unicam camera receiver block on BCM283x processors.
> It is represented as two video device nodes: unicam-image and
> unicam-embedded which are connected to an internal subdev (named
> unicam-subdev) in order to manage streams routing.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> 
> ---
> v3 main changes:
>   - Change code organization
>   - Remove unused variables
>   - Correct the fmt_meta functions
>   - Rewrite the start/stop streaming
>     - You can now start the image node alone, but not the metadata one
>     - The buffers are allocated per-node
>     - only the required stream is started, if the route exists and is
>       enabled
>   - Prefix the macros with UNICAM_ to not have too generic names
>   - Drop colorspace support
>     -> This is causing issues in the try-fmt v4l2-compliance test
>   test VIDIOC_G_FMT: OK
> 	fail: v4l2-test-formats.cpp(363): colorspace >= 0xff
> 	fail: v4l2-test-formats.cpp(465): testColorspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pix.quantization)
>   test VIDIOC_TRY_FMT: FAIL
> 	fail: v4l2-test-formats.cpp(363): colorspace >= 0xff
> 	fail: v4l2-test-formats.cpp(465): testColorspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pix.quantization)
>   test VIDIOC_S_FMT: FAIL
> 
> v2: Remove the unicam_{info,debug,error} macros and use
> dev_dbg/dev_err instead.
> ---
>  MAINTAINERS                                   |    1 +
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/bcm2835/Kconfig        |   21 +
>  drivers/media/platform/bcm2835/Makefile       |    3 +
>  .../media/platform/bcm2835/bcm2835-unicam.c   | 2586 +++++++++++++++++
>  .../media/platform/bcm2835/vc4-regs-unicam.h  |  253 ++
>  7 files changed, 2867 insertions(+)
>  create mode 100644 drivers/media/platform/bcm2835/Kconfig
>  create mode 100644 drivers/media/platform/bcm2835/Makefile
>  create mode 100644 drivers/media/platform/bcm2835/bcm2835-unicam.c
>  create mode 100644 drivers/media/platform/bcm2835/vc4-regs-unicam.h

I'd name the file bcm2835-unicam-regs.h.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 740cf86c56dc..ef2cdb37e06f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3676,6 +3676,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
>  F:	arch/arm/boot/dts/bcm283x*
> +F:	drivers/media/platform/bcm2835/
>  
>  BROADCOM BCM47XX MIPS ARCHITECTURE
>  M:	Hauke Mehrtens <hauke@hauke-m.de>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 9fbdba0fd1e7..033b0358fbb8 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -170,6 +170,7 @@ source "drivers/media/platform/am437x/Kconfig"
>  source "drivers/media/platform/xilinx/Kconfig"
>  source "drivers/media/platform/rcar-vin/Kconfig"
>  source "drivers/media/platform/atmel/Kconfig"
> +source "drivers/media/platform/bcm2835/Kconfig"
>  source "drivers/media/platform/sunxi/Kconfig"
>  
>  config VIDEO_TI_CAL
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 28eb4aadbf45..18894fc586aa 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -86,6 +86,8 @@ obj-$(CONFIG_VIDEO_QCOM_CAMSS)		+= qcom/camss/
>  
>  obj-$(CONFIG_VIDEO_QCOM_VENUS)		+= qcom/venus/
>  
> +obj-$(CONFIG_VIDEO_BCM2835_UNICAM)	+= bcm2835/
> +
>  obj-y					+= sunxi/
>  
>  obj-$(CONFIG_VIDEO_MESON_GE2D)		+= meson/ge2d/
> diff --git a/drivers/media/platform/bcm2835/Kconfig b/drivers/media/platform/bcm2835/Kconfig
> new file mode 100644
> index 000000000000..1691541da905
> --- /dev/null
> +++ b/drivers/media/platform/bcm2835/Kconfig
> @@ -0,0 +1,21 @@
> +# Broadcom VideoCore4 V4L2 camera support
> +
> +config VIDEO_BCM2835_UNICAM
> +	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
> +	depends on ARCH_BCM2835 || COMPILE_TEST
> +	depends on VIDEO_V4L2
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE
> +	select VIDEOBUF2_DMA_CONTIG
> +	help
> +	  Say Y here to enable support for the BCM283x/BCM271x CSI-2 receiver.
> +	  This is a V4L2 driver that controls the CSI-2 receiver directly,
> +	  independently from the VC4 firmware.
> +	  This driver is mutually exclusive with the use of bcm2835-camera. The
> +	  firmware will disable all access to the peripheral from within the
> +	  firmware if it finds a DT node using it, and bcm2835-camera will
> +	  therefore fail to probe.
> +
> +	  To compile this driver as a module, choose M here. The module will be
> +	  called bcm2835-unicam.
> diff --git a/drivers/media/platform/bcm2835/Makefile b/drivers/media/platform/bcm2835/Makefile
> new file mode 100644
> index 000000000000..a98aba03598a
> --- /dev/null
> +++ b/drivers/media/platform/bcm2835/Makefile
> @@ -0,0 +1,3 @@
> +# Makefile for BCM2835 Unicam driver
> +
> +obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
> diff --git a/drivers/media/platform/bcm2835/bcm2835-unicam.c b/drivers/media/platform/bcm2835/bcm2835-unicam.c
> new file mode 100644
> index 000000000000..95e12fdb90f5
> --- /dev/null
> +++ b/drivers/media/platform/bcm2835/bcm2835-unicam.c
> @@ -0,0 +1,2586 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * BCM283x / BCM271x Unicam Capture Driver
> + *
> + * Copyright (C) 2017-2020 - Raspberry Pi (Trading) Ltd.
> + *
> + * Dave Stevenson <dave.stevenson@raspberrypi.com>
> + *
> + * Based on TI am437x driver by
> + *   Benoit Parrot <bparrot@ti.com>
> + *   Lad, Prabhakar <prabhakar.csengg@gmail.com>
> + *
> + * and TI CAL camera interface driver by
> + *    Benoit Parrot <bparrot@ti.com>
> + *
> + *
> + * There are two camera drivers in the kernel for BCM283x - this one
> + * and bcm2835-camera (currently in staging).
> + *
> + * This driver directly controls the Unicam peripheral - there is no
> + * involvement with the VideoCore firmware. Unicam receives CSI-2 or
> + * CCP2 data and writes it into SDRAM.
> + * The only potential processing options are to repack Bayer data into an
> + * alternate format, and applying windowing.
> + * The repacking does not shift the data, so can repack V4L2_PIX_FMT_Sxxxx10P
> + * to V4L2_PIX_FMT_Sxxxx10, or V4L2_PIX_FMT_Sxxxx12P to V4L2_PIX_FMT_Sxxxx12,
> + * but not generically up to V4L2_PIX_FMT_Sxxxx16. The driver will add both
> + * formats where the relevant formats are defined, and will automatically
> + * configure the repacking as required.
> + * Support for windowing may be added later.
> + *
> + * It should be possible to connect this driver to any sensor with a
> + * suitable output interface and V4L2 subdevice driver.
> + *
> + * bcm2835-camera uses the VideoCore firmware to control the sensor,
> + * Unicam, ISP, and all tuner control loops. Fully processed frames are
> + * delivered to the driver by the firmware. It only has sensor drivers
> + * for Omnivision OV5647, and Sony IMX219 sensors.
> + *
> + * The two drivers are mutually exclusive for the same Unicam instance.
> + * The VideoCore firmware checks the device tree configuration during boot.
> + * If it finds device tree nodes called csi0 or csi1 it will block the
> + * firmware from accessing the peripheral, and bcm2835-camera will
> + * not be able to stream data.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +#include <linux/videodev2.h>
> +
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-dv-timings.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "vc4-regs-unicam.h"
> +
> +#define UNICAM_MODULE_NAME	"unicam"
> +
> +/*
> + * Unicam must request a minimum of 250Mhz from the VPU clock.
> + * Otherwise the input FIFOs overrun and cause image corruption.
> + */
> +#define UNICAM_MIN_VPU_CLOCK_RATE (250 * 1000 * 1000)
> +
> +/*
> + * Stride is a 16 bit register, but also has to be a multiple of 32.
> + */
> +#define UNICAM_BPL_ALIGNMENT		32
> +#define UNICAM_MAX_BYTESPERLINE		((1 << 16) - UNICAM_BPL_ALIGNMENT)
> +/*
> + * Max width is therefore determined by the max stride divided by
> + * the number of bits per pixel. Take 32bpp as a
> + * worst case.
> + * No imposed limit on the height, so adopt a square image for want
> + * of anything better.
> + */
> +#define UNICAM_MAX_WIDTH		(UNICAM_MAX_BYTESPERLINE / 4)
> +#define UNICAM_MAX_HEIGHT		UNICAM_MAX_WIDTH
> +/* Define a nominal minimum image size */
> +#define UNICAM_MIN_WIDTH		16
> +#define UNICAM_MIN_HEIGHT		16
> +/* Default size of the embedded buffer */
> +#define UNICAM_EMBEDDED_SIZE	16384
> +
> +/*
> + * Size of the dummy buffer. Can be any size really, but the DMA
> + * allocation works in units of page sizes.
> + */
> +#define UNICAM_DUMMY_BUF_SIZE		PAGE_SIZE
> +
> +#define UNICAM_SD_PAD_SINK		0
> +#define UNICAM_SD_PAD_SOURCE_IMAGE	1
> +#define UNICAM_SD_PAD_SOURCE_METADATA	2
> +#define UNICAM_SD_NUM_PADS		(1 + UNICAM_SD_PAD_SOURCE_METADATA)
> +
> +static inline bool unicam_sd_pad_is_sink(u32 pad)
> +{
> +	/* Camera RX has 1 sink pad, and N source pads */
> +	return pad == 0;
> +}
> +
> +static inline bool unicam_sd_pad_is_source(u32 pad)
> +{
> +	/* Camera RX has 1 sink pad, and N source pads */
> +	return pad != UNICAM_SD_PAD_SINK;
> +}
> +
> +enum unicam_node_type {
> +	UNICAM_IMAGE_NODE,
> +	UNICAM_METADATA_NODE,
> +	UNICAM_MAX_NODES
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Structure definitions
> + */
> +
> +/*
> + * struct unicam_fmt - Unicam media bus format information
> + * @fourcc: V4L2 pixel format FCC identifier. 0 if n/a.
> + * @unpacked_fourcc: V4L2 pixel format FCC identifier if the data is expanded
> + * out to 16bpp. 0 if n/a.
> + * @code: V4L2 media bus format code.
> + * @depth: Bits per pixel as delivered from the source.
> + * @csi_dt: CSI data type.
> + * @metadata_fmt: This format only applies to the metadata pad.
> + */
> +struct unicam_fmt {
> +	u32	fourcc;
> +	u32	unpacked_fourcc;
> +	u32	code;
> +	u8	depth;
> +	u8	csi_dt;
> +	u8	metadata_fmt:1;
> +};
> +
> +static const struct unicam_fmt formats[] = {

s/formats/unicam_formats/

> +	/* YUV Formats */
> +	{
> +		.fourcc		= V4L2_PIX_FMT_YUYV,
> +		.code		= MEDIA_BUS_FMT_YUYV8_1X16,
> +		.depth		= 16,
> +		.csi_dt		= 0x1e,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_UYVY,
> +		.code		= MEDIA_BUS_FMT_UYVY8_1X16,
> +		.depth		= 16,
> +		.csi_dt		= 0x1e,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_YVYU,
> +		.code		= MEDIA_BUS_FMT_YVYU8_1X16,
> +		.depth		= 16,
> +		.csi_dt		= 0x1e,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_VYUY,
> +		.code		= MEDIA_BUS_FMT_VYUY8_1X16,
> +		.depth		= 16,
> +		.csi_dt		= 0x1e,
> +	}, {
> +	/* RGB Formats */
> +		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
> +		.code		= MEDIA_BUS_FMT_RGB565_1X16,
> +		.depth		= 16,
> +		.csi_dt		= 0x22,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
> +		.code		= MEDIA_BUS_FMT_RGB888_1X24,
> +		.depth		= 24,
> +		.csi_dt		= 0x24,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
> +		.code		= MEDIA_BUS_FMT_BGR888_1X24,
> +		.depth		= 24,
> +		.csi_dt		= 0x24,
> +	}, {
> +	/* Bayer Formats */
> +		.fourcc		= V4L2_PIX_FMT_SBGGR8,
> +		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.depth		= 8,
> +		.csi_dt		= 0x2a,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGBRG8,
> +		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.depth		= 8,
> +		.csi_dt		= 0x2a,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGRBG8,
> +		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.depth		= 8,
> +		.csi_dt		= 0x2a,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SRGGB8,
> +		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.depth		= 8,
> +		.csi_dt		= 0x2a,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SBGGR10P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_SBGGR10,
> +		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.depth		= 10,
> +		.csi_dt		= 0x2b,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGBRG10P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_SGBRG10,
> +		.code		= MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.depth		= 10,
> +		.csi_dt		= 0x2b,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGRBG10P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_SGRBG10,
> +		.code		= MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.depth		= 10,
> +		.csi_dt		= 0x2b,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SRGGB10P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_SRGGB10,
> +		.code		= MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.depth		= 10,
> +		.csi_dt		= 0x2b,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SBGGR12P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_SBGGR12,
> +		.code		= MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.depth		= 12,
> +		.csi_dt		= 0x2c,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGBRG12P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_SGBRG12,
> +		.code		= MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.depth		= 12,
> +		.csi_dt		= 0x2c,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGRBG12P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_SGRBG12,
> +		.code		= MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.depth		= 12,
> +		.csi_dt		= 0x2c,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SRGGB12P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_SRGGB12,
> +		.code		= MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.depth		= 12,
> +		.csi_dt		= 0x2c,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SBGGR14P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_SBGGR14,
> +		.code		= MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.depth		= 14,
> +		.csi_dt		= 0x2d,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGBRG14P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_SGBRG14,
> +		.code		= MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.depth		= 14,
> +		.csi_dt		= 0x2d,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGRBG14P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_SGRBG14,
> +		.code		= MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.depth		= 14,
> +		.csi_dt		= 0x2d,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SRGGB14P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_SRGGB14,
> +		.code		= MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.depth		= 14,
> +		.csi_dt		= 0x2d,
> +	}, {
> +	/*
> +	 * 16 bit Bayer formats could be supported, but there is no CSI2
> +	 * data_type defined for raw 16, and no sensors that produce it at
> +	 * present.
> +	 */

Write this as

	/* 16 bit Bayer formats could be supported. */

as these is a data type.

> +
> +	/* Greyscale formats */
> +		.fourcc		= V4L2_PIX_FMT_GREY,
> +		.code		= MEDIA_BUS_FMT_Y8_1X8,
> +		.depth		= 8,
> +		.csi_dt		= 0x2a,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_Y10P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_Y10,
> +		.code		= MEDIA_BUS_FMT_Y10_1X10,
> +		.depth		= 10,
> +		.csi_dt		= 0x2b,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_Y12P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_Y12,
> +		.code		= MEDIA_BUS_FMT_Y12_1X12,
> +		.depth		= 12,
> +		.csi_dt		= 0x2c,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_Y14P,
> +		.unpacked_fourcc = V4L2_PIX_FMT_Y14,
> +		.code		= MEDIA_BUS_FMT_Y14_1X14,
> +		.depth		= 14,
> +		.csi_dt		= 0x2d,
> +	},
> +	/* Embedded data format */
> +	{
> +		.fourcc		= V4L2_META_FMT_8,
> +		.code		= MEDIA_BUS_FMT_METADATA_8,
> +		.depth		= 8,
> +		.metadata_fmt	= 1,
> +	}
> +};
> +
> +struct unicam_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head list;
> +};
> +
> +static inline struct unicam_buffer *to_unicam_buffer(struct vb2_buffer *vb)
> +{
> +	return container_of(vb, struct unicam_buffer, vb.vb2_buf);
> +}
> +
> +struct unicam_node {
> +	bool registered;
> +	bool streaming;
> +	unsigned int node_id;

This is assigned but never used. You can either drop the field, or
modify unicam_schedule_dummy_buffer() to use node->node_id. In the
second case I would also modify is_metadata_node() and is_image_node()
to use the node_id.

I would also rename the field to id. And then,

	if (node->id == UNICAM_METADATA_NODE)

isn't much longer than

	if (is_metadata_node(node))

so you could decide to drop the is_metadata_node() and is_image_node()
helpers if desired.

> +	/* Source pad id on the subdev for this node */

	/* Source pad of the connected subdev */

> +	unsigned int src_pad_id;
> +	/* Pointer pointing to current v4l2_buffer */

	/* Pointer to the current v4l2_buffer */

Same below.

> +	struct unicam_buffer *cur_frm;
> +	/* Pointer pointing to next v4l2_buffer */
> +	struct unicam_buffer *next_frm;
> +	/* video capture */
> +	const struct unicam_fmt *fmt;
> +	/* Used to store current pixel format */
> +	struct v4l2_format v_fmt;
> +	/* Used to store current mbus frame format */
> +	struct v4l2_mbus_framefmt m_fmt;

Used in a single location but never initialized.

> +	/* Buffer queue used in video-buf */
> +	struct vb2_queue buffer_queue;
> +	/* Queue of filled frames */
> +	struct list_head dma_queue;
> +	/* IRQ lock for DMA queue */
> +	spinlock_t dma_queue_lock;
> +	/* lock used to access this structure */
> +	struct mutex lock;
> +	/* Identifies video device for this channel */
> +	struct video_device video_dev;
> +	/* Pointer to the parent handle */
> +	struct unicam_device *dev;
> +	struct media_pad pad;
> +	struct media_pipeline pipe;

There's a single pipeline, store this in unicam_device.

> +	/*
> +	 * Dummy buffer intended to be used by unicam
> +	 * if we have no other queued buffers to swap to.
> +	 */
> +	void *dummy_buf_cpu_addr;
> +	dma_addr_t dummy_buf_dma_addr;
> +
> +	/* Stream connected */
> +	u32 stream;

This is used in unicam_start_streaming() and unicam_stop_streaming()
only, and I wonder if it's needed. The links between the unicam subdev
and the video nodes carry a single stream each, right ? In that case I
think you can hardcode stream 0 there. Tomi could confirm.

> +};
> +
> +struct unicam_device {
> +	struct kref kref;
> +
> +	/* V4l2 specific parameters */
> +	struct v4l2_async_subdev asd;

Not used.

> +
> +	/* peripheral base address */
> +	void __iomem *base;
> +	/* clock gating base address */
> +	void __iomem *clk_gate_base;
> +	/* lp clock handle */
> +	struct clk *clock;
> +	/* vpu clock handle */
> +	struct clk *vpu_clock;
> +	/* V4l2 device */
> +	struct v4l2_device v4l2_dev;
> +	struct media_device mdev;
> +
> +	/* parent device */
> +	struct device *pdev;

Call it dev, pdev usually refers to a platform device.

> +	/* subdevice async Notifier */
> +	struct v4l2_async_notifier notifier;
> +	unsigned int sequence;
> +
> +	/* ptr to  sub device */

I'd drop this comment, and quite a few of the other ones actually. This
just duplicates the next line without adding any information.

> +	struct v4l2_subdev *sensor;
> +
> +	/* Internal subdev */
> +	struct {
> +		struct v4l2_subdev sd;
> +		struct media_pad pads[UNICAM_SD_NUM_PADS];
> +		bool streaming;
> +	} subdev;
> +
> +	/* Remote pad pointer */
> +	struct media_pad *remote_pad;

This will always be equal to UNICAM_SD_PAD_SOURCE_IMAGE, so you can use
UNICAM_SD_PAD_SOURCE_IMAGE instead. There's however a use for storing a
pointer to the sensor's source pad. You can rename the field to
sensor_pad and move it next to the sensor field. You could also organize
it as

	struct {
		struct v4l2_subdev *subdev;
		struct media_pad *pad;
	} sensor;

> +
> +	enum v4l2_mbus_type bus_type;
> +	/*
> +	 * Stores bus.mipi_csi2.flags for CSI2 sensors, or
> +	 * bus.mipi_csi1.strobe for CCP2.
> +	 */
> +	unsigned int bus_flags;
> +	unsigned int max_data_lanes;
> +	unsigned int active_data_lanes;
> +	bool sensor_embedded_data;

Set but never used, drop it.

> +
> +	struct unicam_node node[UNICAM_MAX_NODES];
> +};
> +
> +static inline struct unicam_device *
> +v4l2_device_to_unicam_device(struct v4l2_device *v4l2_dev)

As this is only used with notifier->v4l2_dev as a parameter, you could
name is notifier_to_unicam_device and use

	return container_of(notifier, struct unicam_device, notifier);

> +{
> +	return container_of(v4l2_dev, struct unicam_device, v4l2_dev);
> +}
> +
> +static inline struct unicam_device *
> +sd_to_unicam_device(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct unicam_device, subdev.sd);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Misc helper functions
> + */
> +
> +static inline bool is_metadata_node(struct unicam_node *node)
> +{
> +	return node->video_dev.device_caps & V4L2_CAP_META_CAPTURE;
> +}
> +
> +static inline bool is_image_node(struct unicam_node *node)
> +{
> +	return node->video_dev.device_caps & V4L2_CAP_VIDEO_CAPTURE;
> +}
> +
> +/* Hardware access */
> +static inline void unicam_clk_write(struct unicam_device *dev, u32 val)

Some of the unicam_device pointers are named dev, some are named unicam.
Let's standardize globally on one of the two.

> +{
> +	writel(val | 0x5a000000, dev->clk_gate_base);
> +}
> +
> +static inline u32 unicam_reg_read(struct unicam_device *dev, u32 offset)
> +{
> +	return readl(dev->base + offset);
> +}
> +
> +static inline void unicam_reg_write(struct unicam_device *dev, u32 offset, u32 val)
> +{
> +	writel(val, dev->base + offset);
> +}
> +
> +static inline int unicam_get_field(u32 value, u32 mask)
> +{
> +	return (value & mask) >> __ffs(mask);
> +}
> +
> +static inline void unicam_set_field(u32 *valp, u32 field, u32 mask)
> +{
> +	u32 val = *valp;
> +
> +	val &= ~mask;
> +	val |= (field << __ffs(mask)) & mask;
> +	*valp = val;
> +}
> +
> +static inline void unicam_reg_write_field(struct unicam_device *dev, u32 offset,
> +					  u32 field, u32 mask)
> +{
> +	u32 val = unicam_reg_read(dev, offset);
> +
> +	unicam_set_field(&val, field, mask);
> +	unicam_reg_write(dev, offset, val);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Format data table and helper functions
> + */
> +
> +/* Format setup functions */
> +static const struct unicam_fmt *find_format_by_code(u32 code)

unicam_ prefix, and for the next two functions too.

> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(formats); i++) {
> +		if (formats[i].code == code)
> +			return &formats[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static const struct unicam_fmt *find_format_by_fourcc(u32 fourcc)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
> +		if (formats[i].fourcc == fourcc)
> +			return &formats[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static unsigned int bytes_per_line(u32 width, const struct unicam_fmt *fmt,
> +				   u32 v4l2_fourcc)
> +{
> +	if (v4l2_fourcc == fmt->unpacked_fourcc)
> +		/* Repacking always goes to 16bpp */

s/Repacking/Unpacking/

> +		return ALIGN(width << 1, UNICAM_BPL_ALIGNMENT);
> +	else
> +		return ALIGN((width * fmt->depth) >> 3, UNICAM_BPL_ALIGNMENT);
> +}
> +
> +static int unicam_calc_format_size_bpl(struct unicam_device *dev,
> +				       const struct unicam_fmt *fmt,
> +				       struct v4l2_format *f)
> +{
> +	unsigned int min_bytesperline;

min_bpl would be shorter to write.

> +
> +	v4l_bound_align_image(&f->fmt.pix.width, UNICAM_MIN_WIDTH, UNICAM_MAX_WIDTH, 2,
> +			      &f->fmt.pix.height, UNICAM_MIN_HEIGHT, UNICAM_MAX_HEIGHT, 0,
> +			      0);


Unless it hurts readability, the general rule is to keep lines within
the 80 columns limit in the media subsystem. I'd wrap this to 80
columns.

	v4l_bound_align_image(&f->fmt.pix.width, UNICAM_MIN_WIDTH,
			      UNICAM_MAX_WIDTH, 2,
			      &f->fmt.pix.height, UNICAM_MIN_HEIGHT,
			      UNICAM_MAX_HEIGHT, 0, 0);

There are other candidates for line wrap below.

> +
> +	min_bytesperline = bytes_per_line(f->fmt.pix.width, fmt,
> +					  f->fmt.pix.pixelformat);

You could inline bytes_per_line() here as it's only used in this
location.

	/* Unpacking always goes to 16bpp */
	if (f->fmt.pix.pixelformat == fmt->unpacked_fourcc)
		min_bytesperline = width * 2;
	else
		min_bytesperline = width * fmt->depth / 8;
	min_bytesperline = ALIGN(min_bytesperline, UNICAM_BPL_ALIGNMENT);

> +
> +	if (f->fmt.pix.bytesperline > min_bytesperline &&
> +	    f->fmt.pix.bytesperline <= UNICAM_MAX_BYTESPERLINE)
> +		f->fmt.pix.bytesperline = ALIGN(f->fmt.pix.bytesperline,
> +						UNICAM_BPL_ALIGNMENT);
> +	else
> +		f->fmt.pix.bytesperline = min_bytesperline;

Would this be clearer ?

	f->fmt.pix.bytesperline = ALIGN(f->fmt.pix.bytesperline,
					UNICAM_BPL_ALIGNMENT);
	f->fmt.pix.bytesperline = clamp(f->fmt.pix.bytesperline,
					min_bytesperline,
					UNICAM_MAX_BYTESPERLINE);

> +
> +	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
> +
> +	dev_dbg(dev->v4l2_dev.dev, "%s: fourcc: %08X size: %dx%d bpl:%d img_size:%d\n",

width and height are unsigned, so I'd use %ux%u. Same for bpl and
img_size.

You can use dev->pdev instead of dev->v4l2_dev.dev here and everywhere
else.

> +		__func__,
> +		f->fmt.pix.pixelformat,
> +		f->fmt.pix.width, f->fmt.pix.height,
> +		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
> +
> +	return 0;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Hardware handling
> + */
> +
> +static void unicam_wr_dma_addr(struct unicam_device *dev, dma_addr_t dmaaddr,
> +			       unsigned int buffer_size, int node_id)

Maybe you could pass a unicam_node pointer to replace dev and node_id ?

> +{
> +	dma_addr_t endaddr = dmaaddr + buffer_size;
> +
> +	if (node_id == UNICAM_IMAGE_NODE) {
> +		unicam_reg_write(dev, UNICAM_IBSA0, dmaaddr);
> +		unicam_reg_write(dev, UNICAM_IBEA0, endaddr);
> +	} else {
> +		unicam_reg_write(dev, UNICAM_DBSA0, dmaaddr);
> +		unicam_reg_write(dev, UNICAM_DBEA0, endaddr);
> +	}
> +}
> +
> +static unsigned int unicam_get_lines_done(struct unicam_device *dev)
> +{
> +	dma_addr_t start_addr, cur_addr;
> +	unsigned int stride = dev->node[UNICAM_IMAGE_NODE].v_fmt.fmt.pix.bytesperline;
> +	struct unicam_buffer *frm = dev->node[UNICAM_IMAGE_NODE].cur_frm;
> +
> +	if (!frm)
> +		return 0;
> +
> +	start_addr = vb2_dma_contig_plane_dma_addr(&frm->vb.vb2_buf, 0);
> +	cur_addr = unicam_reg_read(dev, UNICAM_IBWP);
> +	return (unsigned int)(cur_addr - start_addr) / stride;
> +}
> +
> +static void unicam_schedule_next_buffer(struct unicam_node *node)
> +{
> +	struct unicam_device *dev = node->dev;
> +	struct unicam_buffer *buf;
> +	unsigned int size;
> +	dma_addr_t addr;
> +
> +	buf = list_first_entry(&node->dma_queue, struct unicam_buffer, list);
> +	node->next_frm = buf;
> +	list_del(&buf->list);
> +
> +	addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> +	if (is_image_node(node)) {
> +		size = node->v_fmt.fmt.pix.sizeimage;
> +		unicam_wr_dma_addr(dev, addr, size, UNICAM_IMAGE_NODE);
> +	} else {
> +		size = node->v_fmt.fmt.meta.buffersize;
> +		unicam_wr_dma_addr(dev, addr, size, UNICAM_METADATA_NODE);
> +	}
> +}
> +
> +static void unicam_schedule_dummy_buffer(struct unicam_node *node)
> +{
> +	struct unicam_device *dev = node->dev;
> +	int node_id = is_image_node(node) ? UNICAM_IMAGE_NODE : UNICAM_METADATA_NODE;
> +
> +	dev_dbg(dev->v4l2_dev.dev, "Scheduling dummy buffer for node %d\n", node_id);
> +
> +	unicam_wr_dma_addr(dev, node->dummy_buf_dma_addr, UNICAM_DUMMY_BUF_SIZE,
> +			   node_id);
> +	node->next_frm = NULL;
> +}
> +
> +static void unicam_process_buffer_complete(struct unicam_node *node,
> +					   unsigned int sequence)
> +{
> +	node->cur_frm->vb.field = node->m_fmt.field;

m_fmt is never initialized (and I don't think it should be, the subdev
use the active state managed by the V4L2 core). I think this should be
node->v_fmt.field.

> +	node->cur_frm->vb.sequence = sequence;
> +
> +	vb2_buffer_done(&node->cur_frm->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +}
> +
> +static void unicam_queue_event_sof(struct unicam_device *unicam)
> +{
> +	struct v4l2_event event = {
> +		.type = V4L2_EVENT_FRAME_SYNC,
> +		.u.frame_sync.frame_sequence = unicam->sequence,
> +	};
> +
> +	v4l2_event_queue(&unicam->node[UNICAM_IMAGE_NODE].video_dev, &event);
> +}
> +
> +/*
> + * unicam_isr : ISR handler for unicam capture
> + * @irq: irq number
> + * @dev_id: dev_id ptr
> + *
> + * It changes status of the captured buffer, takes next buffer from the queue
> + * and sets its address in unicam registers
> + */
> +static irqreturn_t unicam_isr(int irq, void *dev)
> +{
> +	struct unicam_device *unicam = dev;
> +	unsigned int lines_done = unicam_get_lines_done(dev);
> +	unsigned int sequence = unicam->sequence;
> +	unsigned int i;
> +	u32 ista, sta;
> +	bool fe;
> +	u64 ts;
> +
> +	sta = unicam_reg_read(unicam, UNICAM_STA);
> +	/* Write value back to clear the interrupts */
> +	unicam_reg_write(unicam, UNICAM_STA, sta);
> +
> +	ista = unicam_reg_read(unicam, UNICAM_ISTA);
> +	/* Write value back to clear the interrupts */
> +	unicam_reg_write(unicam, UNICAM_ISTA, ista);
> +
> +	dev_dbg(unicam->v4l2_dev.dev, "ISR: ISTA: 0x%X, STA: 0x%X, sequence %d, lines done %d",
> +		ista, sta, sequence, lines_done);
> +
> +	if (!(sta & (UNICAM_IS | UNICAM_PI0)))
> +		return IRQ_HANDLED;
> +
> +	/*
> +	 * Look for either the Frame End interrupt or the Packet Capture status
> +	 * to signal a frame end.
> +	 */
> +	fe = ista & UNICAM_FEI || sta & UNICAM_PI0;
> +
> +	/*
> +	 * We must run the frame end handler first. If we have a valid next_frm
> +	 * and we get a simultaneout FE + FS interrupt, running the FS handler
> +	 * first would null out the next_frm ptr and we would have lost the
> +	 * buffer forever.
> +	 */
> +	if (fe) {
> +		/*
> +		 * Ensure we have swapped buffers already as we can't
> +		 * stop the peripheral. If no buffer is available, use a
> +		 * dummy buffer to dump out frames until we get a new buffer
> +		 * to use.
> +		 */
> +		for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
> +			if (!unicam->node[i].streaming)
> +				continue;
> +
> +			/*
> +			 * If cur_frm == next_frm, it means we have not had
> +			 * a chance to swap buffers, likely due to having
> +			 * multiple interrupts occurring simultaneously (like FE
> +			 * + FS + LS). In this case, we cannot signal the buffer
> +			 * as complete, as the HW will reuse that buffer.
> +			 */
> +			if (unicam->node[i].cur_frm &&
> +			    unicam->node[i].cur_frm != unicam->node[i].next_frm)
> +				unicam_process_buffer_complete(&unicam->node[i],
> +							       sequence);
> +			unicam->node[i].cur_frm = unicam->node[i].next_frm;
> +		}
> +		unicam->sequence++;
> +	}
> +
> +	if (ista & UNICAM_FSI) {
> +		/*
> +		 * Timestamp is to be when the first data byte was captured,
> +		 * aka frame start.
> +		 */
> +		ts = ktime_get_ns();
> +		for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
> +			if (!unicam->node[i].streaming)
> +				continue;
> +
> +			if (unicam->node[i].cur_frm)
> +				unicam->node[i].cur_frm->vb.vb2_buf.timestamp =
> +								ts;
> +			else
> +				dev_dbg(unicam->v4l2_dev.dev, "ISR: [%d] Dropping frame, buffer not available at FS\n",
> +					i);

				dev_dbg(unicam->v4l2_dev.dev,
					"ISR: [%d] Dropping frame, buffer not available at FS\n",
					i);

> +			/*
> +			 * Set the next frame output to go to a dummy frame
> +			 * if we have not managed to obtain another frame
> +			 * from the queue.
> +			 */
> +			unicam_schedule_dummy_buffer(&unicam->node[i]);
> +		}
> +
> +		unicam_queue_event_sof(unicam);
> +	}
> +
> +	/*
> +	 * Cannot swap buffer at frame end, there may be a race condition
> +	 * where the HW does not actually swap it if the new frame has
> +	 * already started.
> +	 */
> +	if (ista & (UNICAM_FSI | UNICAM_LCI) && !fe) {
> +		for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
> +			if (!unicam->node[i].streaming)
> +				continue;
> +
> +			spin_lock(&unicam->node[i].dma_queue_lock);
> +			if (!list_empty(&unicam->node[i].dma_queue) &&
> +			    !unicam->node[i].next_frm)
> +				unicam_schedule_next_buffer(&unicam->node[i]);
> +			spin_unlock(&unicam->node[i].dma_queue_lock);
> +		}
> +	}
> +
> +	if (unicam_reg_read(unicam, UNICAM_ICTL) & UNICAM_FCM) {
> +		/* Switch out of trigger mode if selected */
> +		unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
> +		unicam_reg_write_field(unicam, UNICAM_ICTL, 0, UNICAM_FCM);
> +	}
> +	return IRQ_HANDLED;
> +}
> +
> +static void unicam_set_packing_config(struct unicam_device *dev)
> +{
> +	u32 pack, unpack;
> +	u32 val;
> +
> +	if (dev->node[UNICAM_IMAGE_NODE].v_fmt.fmt.pix.pixelformat ==
> +	    dev->node[UNICAM_IMAGE_NODE].fmt->fourcc) {
> +		unpack = UNICAM_PUM_NONE;
> +		pack = UNICAM_PPM_NONE;
> +	} else {
> +		switch (dev->node[UNICAM_IMAGE_NODE].fmt->depth) {
> +		case 8:
> +			unpack = UNICAM_PUM_UNPACK8;
> +			break;
> +		case 10:
> +			unpack = UNICAM_PUM_UNPACK10;
> +			break;
> +		case 12:
> +			unpack = UNICAM_PUM_UNPACK12;
> +			break;
> +		case 14:
> +			unpack = UNICAM_PUM_UNPACK14;
> +			break;
> +		case 16:
> +			unpack = UNICAM_PUM_UNPACK16;
> +			break;
> +		default:
> +			unpack = UNICAM_PUM_NONE;
> +			break;
> +		}
> +
> +		/* Repacking is always to 16bpp */
> +		pack = UNICAM_PPM_PACK16;
> +	}
> +
> +	val = 0;
> +	unicam_set_field(&val, unpack, UNICAM_PUM_MASK);
> +	unicam_set_field(&val, pack, UNICAM_PPM_MASK);
> +	unicam_reg_write(dev, UNICAM_IPIPE, val);
> +}
> +
> +static void unicam_cfg_image_id(struct unicam_device *dev)
> +{

	struct unicam_node *node = &dev->node[UNICAM_IMAGE_NODE];

will help shorten the lines below. There could be other functoins where
this could be useful.

> +	if (dev->bus_type == V4L2_MBUS_CSI2_DPHY) {
> +		/* CSI2 mode, hardcode VC 0 for now. */
> +		unicam_reg_write(dev, UNICAM_IDI0,
> +				 (0 << 6) | dev->node[UNICAM_IMAGE_NODE].fmt->csi_dt);
> +	} else {
> +		/* CCP2 mode */
> +		unicam_reg_write(dev, UNICAM_IDI0,
> +				 0x80 | dev->node[UNICAM_IMAGE_NODE].fmt->csi_dt);
> +	}
> +}
> +
> +static void unicam_enable_ed(struct unicam_device *dev)
> +{
> +	u32 val = unicam_reg_read(dev, UNICAM_DCS);
> +
> +	unicam_set_field(&val, 2, UNICAM_EDL_MASK);
> +	/* Do not wrap at the end of the embedded data buffer */
> +	unicam_set_field(&val, 0, UNICAM_DBOB);
> +
> +	unicam_reg_write(dev, UNICAM_DCS, val);
> +}
> +
> +static void unicam_start_rx(struct unicam_device *dev, dma_addr_t *addr)
> +{
> +	int line_int_freq = dev->node[UNICAM_IMAGE_NODE].v_fmt.fmt.pix.height >> 2;
> +	unsigned int size, i;
> +	u32 val;
> +
> +	if (line_int_freq < 128)
> +		line_int_freq = 128;
> +
> +	/* Enable lane clocks */
> +	val = 1;
> +	for (i = 0; i < dev->active_data_lanes; i++)
> +		val = val << 2 | 1;
> +	unicam_clk_write(dev, val);
> +
> +	/* Basic init */
> +	unicam_reg_write(dev, UNICAM_CTRL, UNICAM_MEM);
> +
> +	/* Enable analogue control, and leave in reset. */
> +	val = UNICAM_AR;
> +	unicam_set_field(&val, 7, UNICAM_CTATADJ_MASK);
> +	unicam_set_field(&val, 7, UNICAM_PTATADJ_MASK);
> +	unicam_reg_write(dev, UNICAM_ANA, val);
> +	usleep_range(1000, 2000);
> +
> +	/* Come out of reset */
> +	unicam_reg_write_field(dev, UNICAM_ANA, 0, UNICAM_AR);
> +
> +	/* Peripheral reset */
> +	unicam_reg_write_field(dev, UNICAM_CTRL, 1, UNICAM_CPR);
> +	unicam_reg_write_field(dev, UNICAM_CTRL, 0, UNICAM_CPR);
> +
> +	unicam_reg_write_field(dev, UNICAM_CTRL, 0, UNICAM_CPE);
> +
> +	/* Enable Rx control. */
> +	val = unicam_reg_read(dev, UNICAM_CTRL);
> +	if (dev->bus_type == V4L2_MBUS_CSI2_DPHY) {
> +		unicam_set_field(&val, UNICAM_CPM_CSI2, UNICAM_CPM_MASK);
> +		unicam_set_field(&val, UNICAM_DCM_STROBE, UNICAM_DCM_MASK);
> +	} else {
> +		unicam_set_field(&val, UNICAM_CPM_CCP2, UNICAM_CPM_MASK);
> +		unicam_set_field(&val, dev->bus_flags, UNICAM_DCM_MASK);
> +	}
> +	/* Packet framer timeout */
> +	unicam_set_field(&val, 0xf, UNICAM_PFT_MASK);
> +	unicam_set_field(&val, 128, UNICAM_OET_MASK);
> +	unicam_reg_write(dev, UNICAM_CTRL, val);
> +
> +	unicam_reg_write(dev, UNICAM_IHWIN, 0);
> +	unicam_reg_write(dev, UNICAM_IVWIN, 0);
> +
> +	/* AXI bus access QoS setup */
> +	val = unicam_reg_read(dev, UNICAM_PRI);
> +	unicam_set_field(&val, 0, UNICAM_BL_MASK);
> +	unicam_set_field(&val, 0, UNICAM_BS_MASK);
> +	unicam_set_field(&val, 0xe, UNICAM_PP_MASK);
> +	unicam_set_field(&val, 8, UNICAM_NP_MASK);
> +	unicam_set_field(&val, 2, UNICAM_PT_MASK);
> +	unicam_set_field(&val, 1, UNICAM_PE);
> +	unicam_reg_write(dev, UNICAM_PRI, val);
> +
> +	unicam_reg_write_field(dev, UNICAM_ANA, 0, UNICAM_DDL);
> +
> +	/* Always start in trigger frame capture mode (UNICAM_FCM set) */
> +	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_FCM | UNICAM_IBOB;
> +	unicam_set_field(&val, line_int_freq, UNICAM_LCIE_MASK);
> +	unicam_reg_write(dev, UNICAM_ICTL, val);
> +	unicam_reg_write(dev, UNICAM_STA, UNICAM_STA_MASK_ALL);
> +	unicam_reg_write(dev, UNICAM_ISTA, UNICAM_ISTA_MASK_ALL);
> +
> +	/* tclk_term_en */
> +	unicam_reg_write_field(dev, UNICAM_CLT, 2, UNICAM_CLT1_MASK);
> +	/* tclk_settle */
> +	unicam_reg_write_field(dev, UNICAM_CLT, 6, UNICAM_CLT2_MASK);
> +	/* td_term_en */
> +	unicam_reg_write_field(dev, UNICAM_DLT, 2, UNICAM_DLT1_MASK);
> +	/* ths_settle */
> +	unicam_reg_write_field(dev, UNICAM_DLT, 6, UNICAM_DLT2_MASK);
> +	/* trx_enable */
> +	unicam_reg_write_field(dev, UNICAM_DLT, 0, UNICAM_DLT3_MASK);
> +
> +	unicam_reg_write_field(dev, UNICAM_CTRL, 0, UNICAM_SOE);
> +
> +	/* Packet compare setup - required to avoid missing frame ends */
> +	val = 0;
> +	unicam_set_field(&val, 1, UNICAM_PCE);
> +	unicam_set_field(&val, 1, UNICAM_GI);
> +	unicam_set_field(&val, 1, UNICAM_CPH);
> +	unicam_set_field(&val, 0, UNICAM_PCVC_MASK);
> +	unicam_set_field(&val, 1, UNICAM_PCDT_MASK);
> +	unicam_reg_write(dev, UNICAM_CMP0, val);
> +
> +	/* Enable clock lane and set up terminations */
> +	val = 0;
> +	if (dev->bus_type == V4L2_MBUS_CSI2_DPHY) {
> +		/* CSI2 */
> +		unicam_set_field(&val, 1, UNICAM_CLE);
> +		unicam_set_field(&val, 1, UNICAM_CLLPE);
> +		if (dev->bus_flags & V4L2_MBUS_CSI2_CONTINUOUS_CLOCK) {
> +			unicam_set_field(&val, 1, UNICAM_CLTRE);
> +			unicam_set_field(&val, 1, UNICAM_CLHSE);
> +		}
> +	} else {
> +		/* CCP2 */
> +		unicam_set_field(&val, 1, UNICAM_CLE);
> +		unicam_set_field(&val, 1, UNICAM_CLHSE);
> +		unicam_set_field(&val, 1, UNICAM_CLTRE);
> +	}
> +	unicam_reg_write(dev, UNICAM_CLK, val);
> +
> +	/*
> +	 * Enable required data lanes with appropriate terminations.
> +	 * The same value needs to be written to UNICAM_DATn registers for
> +	 * the active lanes, and 0 for inactive ones.
> +	 */
> +	val = 0;
> +	if (dev->bus_type == V4L2_MBUS_CSI2_DPHY) {
> +		/* CSI2 */
> +		unicam_set_field(&val, 1, UNICAM_DLE);
> +		unicam_set_field(&val, 1, UNICAM_DLLPE);
> +		if (dev->bus_flags & V4L2_MBUS_CSI2_CONTINUOUS_CLOCK) {
> +			unicam_set_field(&val, 1, UNICAM_DLTRE);
> +			unicam_set_field(&val, 1, UNICAM_DLHSE);
> +		}
> +	} else {
> +		/* CCP2 */
> +		unicam_set_field(&val, 1, UNICAM_DLE);
> +		unicam_set_field(&val, 1, UNICAM_DLHSE);
> +		unicam_set_field(&val, 1, UNICAM_DLTRE);
> +	}
> +	unicam_reg_write(dev, UNICAM_DAT0, val);
> +
> +	if (dev->active_data_lanes == 1)
> +		val = 0;
> +	unicam_reg_write(dev, UNICAM_DAT1, val);
> +
> +	if (dev->max_data_lanes > 2) {
> +		/*
> +		 * Registers UNICAM_DAT2 and UNICAM_DAT3 only valid if the
> +		 * instance supports more than 2 data lanes.
> +		 */
> +		if (dev->active_data_lanes == 2)
> +			val = 0;
> +		unicam_reg_write(dev, UNICAM_DAT2, val);
> +
> +		if (dev->active_data_lanes == 3)
> +			val = 0;
> +		unicam_reg_write(dev, UNICAM_DAT3, val);
> +	}
> +
> +	unicam_reg_write(dev, UNICAM_IBLS,
> +			 dev->node[UNICAM_IMAGE_NODE].v_fmt.fmt.pix.bytesperline);
> +	size = dev->node[UNICAM_IMAGE_NODE].v_fmt.fmt.pix.sizeimage;
> +	unicam_wr_dma_addr(dev, addr[UNICAM_IMAGE_NODE], size, UNICAM_IMAGE_NODE);
> +	unicam_set_packing_config(dev);
> +	unicam_cfg_image_id(dev);
> +
> +	val = unicam_reg_read(dev, UNICAM_MISC);
> +	unicam_set_field(&val, 1, UNICAM_FL0);
> +	unicam_set_field(&val, 1, UNICAM_FL1);
> +	unicam_reg_write(dev, UNICAM_MISC, val);
> +
> +	/* Enable peripheral */
> +	unicam_reg_write_field(dev, UNICAM_CTRL, 1, UNICAM_CPE);
> +
> +	/* Load image pointers */
> +	unicam_reg_write_field(dev, UNICAM_ICTL, 1, UNICAM_LIP_MASK);
> +
> +	/*
> +	 * Enable trigger only for the first frame to
> +	 * sync correctly to the FS from the source.
> +	 */
> +	unicam_reg_write_field(dev, UNICAM_ICTL, 1, UNICAM_TFC);
> +}
> +
> +static void unicam_start_metadata(struct unicam_device *dev, dma_addr_t *addr)
> +{
> +	unsigned int size;
> +
> +	dev_dbg(dev->v4l2_dev.dev, "enable metadata dma\n");
> +	size = dev->node[UNICAM_METADATA_NODE].v_fmt.fmt.meta.buffersize;
> +	unicam_enable_ed(dev);
> +	unicam_wr_dma_addr(dev, addr[UNICAM_METADATA_NODE], size, UNICAM_METADATA_NODE);
> +	unicam_reg_write_field(dev, UNICAM_DCS, 1, UNICAM_LDP);
> +}
> +
> +static void unicam_disable(struct unicam_device *dev)
> +{
> +	/* Analogue lane control disable */
> +	unicam_reg_write_field(dev, UNICAM_ANA, 1, UNICAM_DDL);
> +
> +	/* Stop the output engine */
> +	unicam_reg_write_field(dev, UNICAM_CTRL, 1, UNICAM_SOE);
> +
> +	/* Disable the data lanes. */
> +	unicam_reg_write(dev, UNICAM_DAT0, 0);
> +	unicam_reg_write(dev, UNICAM_DAT1, 0);
> +
> +	if (dev->max_data_lanes > 2) {
> +		unicam_reg_write(dev, UNICAM_DAT2, 0);
> +		unicam_reg_write(dev, UNICAM_DAT3, 0);
> +	}
> +
> +	/* Peripheral reset */
> +	unicam_reg_write_field(dev, UNICAM_CTRL, 1, UNICAM_CPR);
> +	usleep_range(50, 100);
> +	unicam_reg_write_field(dev, UNICAM_CTRL, 0, UNICAM_CPR);
> +
> +	/* Disable peripheral */
> +	unicam_reg_write_field(dev, UNICAM_CTRL, 0, UNICAM_CPE);
> +
> +	/* Clear ED setup */
> +	unicam_reg_write(dev, UNICAM_DCS, 0);
> +
> +	/* Disable all lane clocks */
> +	unicam_clk_write(dev, 0);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * V4L2 subdev Operations
> + */
> +
> +static int __unicam_subdev_set_routing(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *state,
> +				       struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	ret = v4l2_subdev_routing_validate_1_to_1(routing);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_subdev_lock_state(state);
> +
> +	ret = v4l2_subdev_set_routing(sd, state, routing);

You've switched from v4l2_subdev_set_routing_with_fmt() to
v4l2_subdev_set_routing(), so this doesn't set formats anymore. It means
that .init_cfg() won't initialize formats. Was there an issue with
v4l2_subdev_set_routing_with_fmt() ?

> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	if (ret)
> +		return ret;
> +
> +	return 0;

You can replace those three lines with

	return ret;

> +}
> +
> +static int unicam_subdev_set_routing(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *state,
> +				     enum v4l2_subdev_format_whence which,
> +				     struct v4l2_subdev_krouting *routing)
> +{
> +	struct unicam_device *unicam = sd_to_unicam_device(sd);
> +
> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && unicam->subdev.streaming)
> +		return -EBUSY;
> +
> +	return __unicam_subdev_set_routing(sd, state, routing);
> +}
> +
> +static int unicam_subdev_init_cfg(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = UNICAM_SD_PAD_SINK,
> +			.sink_stream = 0,
> +			.source_pad = UNICAM_SD_PAD_SOURCE_IMAGE,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +
> +	struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	/* Initialize routing to single route to the fist source pad */
> +	return __unicam_subdev_set_routing(sd, state, &routing);
> +}
> +
> +static int unicam_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	int ret = 0;
> +
> +	v4l2_subdev_lock_state(state);
> +
> +	/* No transcoding, source and sink codes must match. */
> +	if (unicam_sd_pad_is_source(code->pad)) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index > 0) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		fmt = v4l2_subdev_state_get_opposite_stream_format(state,
> +								   code->pad,
> +								   code->stream);
> +		if (!fmt) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		code->code = fmt->code;
> +	} else {
> +		if (code->index >= ARRAY_SIZE(formats)) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		code->code = formats[code->index].code;

Shouldn't we restrict codes to image formats for the stream that goes to
the image pad, and to meta formats for the stream that goes to the meta
pad ? The following is an (untested) attempt to implement that.

	u32 pad, stream;
	int ret = -EINVAL;

	v4l2_subdev_lock_state(state);

	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, code->pad,
						    code->stream, &pad,
						    &stream);
	if (ret)
		goto out;

	if (unicam_sd_pad_is_source(code->pad)) {
		/* No transcoding, source and sink codes must match. */
		struct v4l2_mbus_framefmt *fmt;

		fmt = v4l2_subdev_state_get_stream_format(state, pad, stream);
		if (!fmt)
			goto out;

		if (code->index > 0)
			goto out;

		code->code = fmt->code;
	} else {
		const struct unicam_fmt *formats;
		unsigned int num_formats;

		if (pad == UNICAM_SD_PAD_SOURCE_IMAGE) {
			formats = unicam_image_formats;
			num_formats = ARRAY_SIZE(unicam_image_formats);
		} else {
			formats = unicam_meta_formats;
			num_formats = ARRAY_SIZE(unicam_meta_formats);
		}

		if (code->index >= num_formats)
			goto out;

		code->code = formats[code->index].code;
	}

	ret = 0;

out:
	v4l2_subdev_unlock_state(state);

	return ret;

This requires splitting the formats array at the top of the driver into
two, for image and metadata formats. You may also need to update
unicam_subdev_enum_frame_size() accordingly.

> +	}
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
> +static int unicam_subdev_start_streaming(struct unicam_device *unicam, u32 pad,
> +					 u32 stream)
> +{
> +	int ret;
> +	struct media_pad *remote_pad;
> +
> +	unicam->sequence = 0;
> +
> +	dev_dbg(unicam->v4l2_dev.dev, "Running with %u data lanes\n",
> +		unicam->active_data_lanes);
> +
> +	ret = clk_set_min_rate(unicam->vpu_clock, UNICAM_MIN_VPU_CLOCK_RATE);
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "failed to set up VPU clock\n");
> +		goto err_streaming;

You can return ret here, as you haven't set unicam->subdev.streaming to
true.

> +	}
> +
> +	ret = clk_prepare_enable(unicam->vpu_clock);
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "Failed to enable VPU clock: %d\n", ret);
> +		goto err_streaming;

Here you need to undo the clk_set_min_rate() call.

> +	}
> +
> +	ret = clk_set_rate(unicam->clock, 100 * 1000 * 1000);
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "failed to set up CSI clock\n");
> +		goto err_vpu_clock;
> +	}
> +
> +	ret = clk_prepare_enable(unicam->clock);
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "Failed to enable CSI clock: %d\n", ret);
> +		goto err_vpu_clock;
> +	}
> +
> +	remote_pad = media_entity_remote_pad(&unicam->subdev.pads[pad]);

Use unicam->remote_pad here.

> +	ret = v4l2_subdev_call(unicam->sensor, video, enable_streams,
> +			       remote_pad->index, BIT(stream));
> +
> +	if (ret && ret == -ENOIOCTLCMD)
> +		ret = v4l2_subdev_call(unicam->sensor, video, s_stream, 1);
> +
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "stream on failed in subdev\n");
> +		return ret;

You need to disable clocks.

> +	}
> +
> +	unicam->subdev.streaming = true;
> +
> +	return 0;
> +
> +err_vpu_clock:
> +	if (clk_set_min_rate(unicam->vpu_clock, 0))
> +		dev_err(unicam->v4l2_dev.dev, "failed to reset the VPU clock\n");
> +	clk_disable_unprepare(unicam->vpu_clock);
> +err_streaming:
> +	unicam->subdev.streaming = false;
> +
> +	return ret;
> +}
> +
> +static void unicam_subdev_stop_streaming(struct unicam_device *unicam, u32 pad,
> +					 u32 stream)
> +{
> +	struct media_pad *remote_pad;
> +	int ret;
> +
> +	remote_pad = media_entity_remote_pad(&unicam->subdev.pads[pad]);

Same here about remote_pad.

> +	ret = v4l2_subdev_call(unicam->sensor, video, disable_streams,
> +			       remote_pad->index, BIT(stream));
> +
> +	if (ret && ret == -ENOIOCTLCMD)
> +		ret = v4l2_subdev_call(unicam->sensor, video, s_stream, 0);
> +
> +	clk_disable_unprepare(unicam->clock);
> +	if (clk_set_min_rate(unicam->vpu_clock, 0))
> +		dev_err(unicam->v4l2_dev.dev, "failed to reset the VPU clock\n");
> +	clk_disable_unprepare(unicam->vpu_clock);
> +
> +	unicam->subdev.streaming = false;
> +}
> +
> +static int unicam_sd_enable_streams(struct v4l2_subdev *sd, u32 pad,
> +				    u64 streams_mask)
> +{
> +	struct unicam_device *unicam = sd_to_unicam_device(sd);
> +	struct v4l2_subdev_state *state;
> +	u32 other_pad, other_stream;
> +	int ret;
> +
> +	if (WARN_ON(streams_mask != 1))
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_active_state(sd);
> +
> +	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
> +						    &other_pad, &other_stream);
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	if (ret)
> +		return ret;
> +
> +	ret = unicam_subdev_start_streaming(unicam, other_pad, other_stream);

Any reason to split part of this in unicam_subdev_start_streaming() ?

> +
> +	return ret;
> +}
> +
> +static int unicam_sd_disable_streams(struct v4l2_subdev *sd, u32 pad,
> +				     u64 streams_mask)
> +{
> +	struct unicam_device *unicam = sd_to_unicam_device(sd);
> +	struct v4l2_subdev_state *state;
> +	u32 other_pad, other_stream;
> +	int ret;
> +
> +	if (WARN_ON(streams_mask != 1))
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_active_state(sd);
> +
> +	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
> +						    &other_pad, &other_stream);
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "disable streams failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	unicam_subdev_stop_streaming(unicam, other_pad, other_stream);

Same question.

> +
> +	return 0;
> +}
> +
> +static int unicam_subdev_set_pad_format(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					struct v4l2_subdev_format *format)
> +{
> +	struct unicam_device *unicam = sd_to_unicam_device(sd);
> +	struct v4l2_mbus_framefmt *sink_format, *source_format;
> +	const struct unicam_fmt *fmtinfo;
> +	unsigned int bpp;
> +	int ret = 0;
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && unicam->subdev.streaming) {
> +		dev_err(unicam->v4l2_dev.dev, "format %d, subdev is %s\n",
> +			format->which,
> +			unicam->subdev.streaming ? "not streaming" : "streaming");

Drop this message, format->which and unicam->subdev.streaming always
have the same values here as you check them on the line before.

> +		return -EBUSY;
> +	}
> +
> +	/* No transcoding, source and sink formats must match. */
> +	if (unicam_sd_pad_is_source(format->pad))
> +		return v4l2_subdev_get_fmt(sd, state, format);
> +
> +	if (format->pad == UNICAM_SD_PAD_SOURCE_IMAGE) {

This can't happen as you return on the line above if format->pad is a
source.

> +		fmtinfo = find_format_by_code(format->format.code);
> +		if (!fmtinfo)
> +			fmtinfo = &formats[0];
> +
> +		bpp = ALIGN(fmtinfo->depth, 8);

That's not right for packed formats.

> +
> +		format->format.width = clamp_t(unsigned int, format->format.width,
> +					       UNICAM_MIN_WIDTH * 8 / bpp,
> +					       UNICAM_MAX_WIDTH * 8 / bpp);

UNICAM_MIN_WIDTH and UNICAM_MAX_WIDTH are expressed in pixels already.

> +		format->format.height = clamp_t(unsigned int, format->format.height,
> +						UNICAM_MIN_HEIGHT,
> +						UNICAM_MAX_HEIGHT);
> +
> +		format->format.code = fmtinfo->code;

This prevents picking an unpacked format.

> +		format->format.field = V4L2_FIELD_NONE;
> +	}
> +
> +	v4l2_subdev_lock_state(state);
> +
> +	sink_format = v4l2_state_get_stream_format(state, format->pad,
> +						   format->stream);
> +	source_format = v4l2_subdev_state_get_opposite_stream_format(state,
> +								     format->pad,
> +								     format->stream);
> +	if (!sink_format || !source_format) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	*sink_format = format->format;
> +	*source_format = format->format;
> +out:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
> +static int unicam_subdev_enum_frame_size(struct v4l2_subdev *sd,
> +					 struct v4l2_subdev_state *state,
> +					 struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	const struct unicam_fmt *fmtinfo;
> +	int ret = 0;
> +
> +	if (fse->index > 0)
> +		return -EINVAL;
> +
> +	v4l2_subdev_lock_state(state);
> +
> +	/* No transcoding, source and sink formats must match. */
> +	if (unicam_sd_pad_is_source(fse->pad)) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		fmt = v4l2_subdev_state_get_opposite_stream_format(state,
> +								   fse->pad,
> +								   fse->stream);
> +		if (!fmt) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		if (fse->code != fmt->code) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		fse->min_width = fmt->width;
> +		fse->max_width = fmt->width;
> +		fse->min_height = fmt->height;
> +		fse->max_height = fmt->height;
> +	} else {
> +		fmtinfo = find_format_by_code(fse->code);
> +		if (!fmtinfo) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		fse->min_width = UNICAM_MIN_WIDTH * 8 / ALIGN(fmtinfo->depth, 8);
> +		fse->max_width = UNICAM_MAX_WIDTH * 8 / ALIGN(fmtinfo->depth, 8);

UNICAM_MIN_WIDTH and UNICAM_MAX_WIDTH are expressed in pixels already.

> +		fse->min_height = UNICAM_MIN_HEIGHT;
> +		fse->max_height = UNICAM_MAX_HEIGHT;
> +	}
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_video_ops unicam_subdev_video_ops = {
> +	.enable_streams	= unicam_sd_enable_streams,
> +	.disable_streams = unicam_sd_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_pad_ops unicam_subdev_pad_ops = {
> +	.init_cfg		= unicam_subdev_init_cfg,
> +	.enum_mbus_code		= unicam_subdev_enum_mbus_code,
> +	.get_fmt		= v4l2_subdev_get_fmt,
> +	.set_fmt		= unicam_subdev_set_pad_format,
> +	.set_routing		= unicam_subdev_set_routing,
> +	.enum_frame_size	= unicam_subdev_enum_frame_size,
> +};
> +
> +static const struct v4l2_subdev_ops unicam_subdev_ops = {
> +	.video		= &unicam_subdev_video_ops,
> +	.pad		= &unicam_subdev_pad_ops,
> +};
> +
> +static const struct media_entity_operations unicam_subdev_media_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +	.has_route = v4l2_subdev_has_route,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Videobuf2 Queue Operations
> + */
> +
> +static int unicam_queue_setup(struct vb2_queue *vq,
> +			      unsigned int *nbuffers,
> +			      unsigned int *nplanes,
> +			      unsigned int sizes[],
> +			      struct device *alloc_devs[])
> +{
> +	struct unicam_node *node = vb2_get_drv_priv(vq);
> +	struct unicam_device *dev = node->dev;
> +	unsigned int size = is_image_node(node) ?
> +				node->v_fmt.fmt.pix.sizeimage :
> +				node->v_fmt.fmt.meta.buffersize;
> +
> +	if (vq->num_buffers + *nbuffers < 3)
> +		*nbuffers = 3 - vq->num_buffers;
> +
> +	if (*nplanes) {
> +		if (sizes[0] < size) {
> +			dev_dbg(dev->v4l2_dev.dev, "sizes[0] %i < size %u\n", sizes[0],
> +				size);
> +			return -EINVAL;
> +		}
> +		size = sizes[0];
> +	}
> +
> +	*nplanes = 1;
> +	sizes[0] = size;
> +
> +	return 0;
> +}
> +
> +static int unicam_buffer_prepare(struct vb2_buffer *vb)
> +{
> +	struct unicam_node *node = vb2_get_drv_priv(vb->vb2_queue);
> +	struct unicam_device *dev = node->dev;
> +	struct unicam_buffer *buf = to_unicam_buffer(vb);
> +	unsigned long size;
> +
> +	if (WARN_ON(!node->fmt))
> +		return -EINVAL;
> +
> +	size = is_image_node(node) ? node->v_fmt.fmt.pix.sizeimage :
> +				     node->v_fmt.fmt.meta.buffersize;
> +	if (vb2_plane_size(vb, 0) < size) {
> +		dev_dbg(dev->v4l2_dev.dev, "data will not fit into plane (%lu < %lu)\n",
> +			vb2_plane_size(vb, 0), size);
> +		return -EINVAL;
> +	}
> +
> +	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, size);
> +	return 0;
> +}
> +
> +static void unicam_buffer_queue(struct vb2_buffer *vb)
> +{
> +	struct unicam_node *node = vb2_get_drv_priv(vb->vb2_queue);
> +	struct unicam_buffer *buf = to_unicam_buffer(vb);
> +
> +	spin_lock_irq(&node->dma_queue_lock);
> +	list_add_tail(&buf->list, &node->dma_queue);
> +	spin_unlock_irq(&node->dma_queue_lock);
> +}
> +
> +static void unicam_return_buffers(struct unicam_node *node,
> +				  enum vb2_buffer_state state)
> +{
> +	struct unicam_buffer *buf, *tmp;
> +
> +	list_for_each_entry_safe(buf, tmp, &node->dma_queue, list) {
> +		list_del(&buf->list);
> +		vb2_buffer_done(&buf->vb.vb2_buf, state);
> +	}
> +
> +	if (node->cur_frm)
> +		vb2_buffer_done(&node->cur_frm->vb.vb2_buf,
> +				state);
> +	if (node->next_frm && node->cur_frm != node->next_frm)
> +		vb2_buffer_done(&node->next_frm->vb.vb2_buf,
> +				state);
> +
> +	node->cur_frm = NULL;
> +	node->next_frm = NULL;
> +}
> +
> +static int unicam_video_check_format(struct unicam_node *node)
> +{
> +	const struct v4l2_mbus_framefmt *format;
> +	struct unicam_device *dev = node->dev;
> +	struct v4l2_subdev_state *state;
> +	int ret = 0;
> +
> +	state = v4l2_subdev_lock_active_state(&dev->subdev.sd);
> +
> +	format = v4l2_state_get_stream_format(state, dev->remote_pad->index, 0);

You can replace dev->remote_pad->index with UNICAM_SD_PAD_SOURCE_IMAGE.

> +	if (!format) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (node->fmt->code != format->code ||
> +	    node->v_fmt.fmt.pix.height != format->height ||
> +	    node->v_fmt.fmt.pix.width != format->width ||
> +	    node->v_fmt.fmt.pix.field != format->field) {
> +		dev_dbg(dev->v4l2_dev.dev, "(%d x %d) %08X %s != (%d x %d) %08X %s\n",

%u for unsigned, and %08x instead of %08X.

> +			node->v_fmt.fmt.pix.width, node->v_fmt.fmt.pix.height,
> +			node->fmt->code,
> +			v4l2_field_names[node->v_fmt.fmt.pix.field],
> +			format->width, format->height, format->code,
> +			v4l2_field_names[format->field]);
> +		ret = -EPIPE;
> +		goto out;
> +	}
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
> +static int unicam_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct unicam_node *node = vb2_get_drv_priv(vq);
> +	struct unicam_device *dev = node->dev;
> +	dma_addr_t buffer_addr[UNICAM_MAX_NODES] = { 0 };
> +	struct unicam_buffer *buf;
> +	struct media_pad *remote_pad;
> +	struct v4l2_subdev_route *route = NULL;
> +	struct v4l2_subdev_route *r;
> +	struct v4l2_subdev_state *state;
> +	unsigned long flags;
> +	unsigned int i;
> +	int ret;
> +
> +	/* Get remote pad */
> +	remote_pad = media_entity_remote_pad(&node->pad);
> +	if (!remote_pad) {
> +		dev_err(dev->v4l2_dev.dev, "Context not connected\n");
> +		ret = -ENODEV;
> +		goto err_streaming;
> +	}

This can't happen. Use UNICAM_SD_PAD_SOURCE_IMAGE or
UNICAM_SD_PAD_SOURCE_METADATA instead of going through
media_entity_remote_pad(). Same when stopping streaming.

> +
> +	/* Look for the route for the given pad and stream. */
> +	state = v4l2_subdev_lock_active_state(&dev->subdev.sd);
> +
> +	/* Find the stream */
> +	for_each_active_route(&state->routing, r) {
> +		if (r->source_pad != remote_pad->index)
> +			continue;
> +
> +		route = r;
> +
> +		break;
> +	}

Can you use v4l2_subdev_routing_find_opposite_end() ?

> +
> +	if (!route) {
> +		v4l2_subdev_unlock_state(state);
> +		dev_err(dev->v4l2_dev.dev, "Failed to find route\n");
> +		ret = -ENODEV;
> +		goto err_streaming;
> +	}
> +
> +	/* Store the PHY connected to this video device. */

The PHY ?

> +	node->stream = route->sink_stream;
> +	dev_dbg(dev->v4l2_dev.dev, "Starting stream %u on pad %d on subdev %s\n",
> +		node->stream, remote_pad->index, dev->subdev.sd.name);
> +	v4l2_subdev_unlock_state(state);
> +
> +	/* The metadata node can't be started alone. */
> +	if (node == &dev->node[UNICAM_METADATA_NODE]) {

	if (is_metadata_node(node)) {

> +		if (!dev->node[UNICAM_IMAGE_NODE].streaming) {
> +			dev_err(dev->v4l2_dev.dev,
> +				"Can't start metadata without image\n");
> +			return -EINVAL;
> +		}
> +		dev_dbg(dev->v4l2_dev.dev, "starting metadata node\n");
> +
> +		spin_lock_irqsave(&node->dma_queue_lock, flags);
> +		buf = list_first_entry(&node->dma_queue,
> +				       struct unicam_buffer, list);
> +		dev_dbg(dev->v4l2_dev.dev, "buffer %d: %p\n", i, buf);
> +		node->cur_frm = buf;
> +		node->next_frm = buf;
> +		list_del(&buf->list);
> +		spin_unlock_irqrestore(&node->dma_queue_lock, flags);
> +
> +		buffer_addr[UNICAM_METADATA_NODE] =
> +			vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> +		dev_dbg(dev->v4l2_dev.dev, "buffer %d addr: %lld\n", i, buffer_addr[i]);
> +
> +		unicam_start_metadata(dev, buffer_addr);
> +		node->streaming = true;
> +		return 0;
> +	}
> +
> +	ret = pm_runtime_get_sync(dev->pdev);
> +	if (ret < 0) {
> +		dev_err(dev->v4l2_dev.dev, "pm_runtime_get_sync failed\n");
> +		goto err_streaming;
> +	}
> +
> +	ret = media_pipeline_start(node->video_dev.entity.pads, &node->pipe);
> +	if (ret < 0) {
> +		dev_dbg(dev->v4l2_dev.dev, "Failed to start media pipeline: %d\n", ret);
> +		goto err_pm_put;
> +	}
> +
> +	ret = unicam_video_check_format(node);
> +	if (ret < 0) {
> +		dev_err(dev->v4l2_dev.dev, "Video format is incorrect: %d\n", ret);
> +		goto error_pipeline;
> +	}
> +
> +	dev_dbg(dev->v4l2_dev.dev, "node %s\n", node->video_dev.name);
> +
> +	spin_lock_irqsave(&node->dma_queue_lock, flags);
> +	buf = list_first_entry(&node->dma_queue,
> +			       struct unicam_buffer, list);
> +	dev_dbg(dev->v4l2_dev.dev, "buffer %d: %p\n", i, buf);
> +	node->cur_frm = buf;
> +	node->next_frm = buf;
> +	list_del(&buf->list);
> +	spin_unlock_irqrestore(&node->dma_queue_lock, flags);
> +
> +	buffer_addr[UNICAM_IMAGE_NODE] =
> +			vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> +
> +	dev_dbg(dev->v4l2_dev.dev, "Start unicam\n");
> +	unicam_start_rx(dev, buffer_addr);
> +
> +	dev_dbg(dev->v4l2_dev.dev, "Enable stream\n");
> +	ret = v4l2_subdev_call(&dev->subdev.sd, video, enable_streams,
> +			       remote_pad->index, BIT(node->stream));

node->stream is the sink stream, while remote_pad->index is a source
pad. You're mixing concepts, please go through the code and double-check
that all pads and streams are correct.

> +	if (ret < 0) {
> +		dev_err(dev->v4l2_dev.dev, "stream on failed in subdev\n");
> +		goto error_pipeline;
> +	}
> +
> +	node->streaming = true;
> +
> +	return 0;
> +
> +error_pipeline:
> +	media_pipeline_stop(node->video_dev.entity.pads);
> +err_pm_put:
> +	pm_runtime_put_sync(dev->pdev);
> +err_streaming:
> +	return ret;
> +}
> +
> +static void unicam_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct unicam_node *node = vb2_get_drv_priv(vq);
> +	struct unicam_device *dev = node->dev;
> +	struct media_pad *remote_pad;
> +
> +	node->streaming = false;
> +
> +	remote_pad = media_entity_remote_pad(&node->pad);
> +	v4l2_subdev_call(&dev->subdev.sd, video, disable_streams,
> +			 remote_pad->index, BIT(node->stream));
> +
> +	/* We can stream only with the image node. */
> +	if (is_metadata_node(node)) {
> +		/*
> +		 * Allow the hardware to spin in the dummy buffer.
> +		 * This is only really needed if the embedded data pad is
> +		 * disabled before the image pad.
> +		 */
> +		unicam_wr_dma_addr(dev, node->dummy_buf_dma_addr,
> +				   UNICAM_DUMMY_BUF_SIZE, UNICAM_METADATA_NODE);
> +		goto dequeue_buffers;
> +	}
> +
> +	unicam_disable(dev);
> +
> +	media_pipeline_stop(node->video_dev.entity.pads);
> +	pm_runtime_put_sync(dev->pdev);

You can drop the _sync.

> +
> +dequeue_buffers:
> +	/* Clear all queued buffers for the node */
> +	unicam_return_buffers(node, VB2_BUF_STATE_ERROR);
> +}
> +
> +static const struct vb2_ops unicam_video_qops = {
> +	.wait_prepare		= vb2_ops_wait_prepare,
> +	.wait_finish		= vb2_ops_wait_finish,
> +	.queue_setup		= unicam_queue_setup,
> +	.buf_prepare		= unicam_buffer_prepare,
> +	.buf_queue		= unicam_buffer_queue,
> +	.start_streaming	= unicam_start_streaming,
> +	.stop_streaming		= unicam_stop_streaming,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + *  V4L2 video device Operations
> + */
> +
> +static int unicam_querycap(struct file *file, void *priv,
> +			   struct v4l2_capability *cap)
> +{
> +	struct unicam_node *node = video_drvdata(file);
> +	struct unicam_device *dev = node->dev;
> +
> +	strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
> +
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s", dev_name(dev->pdev));
> +
> +	cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE;
> +
> +	return 0;
> +}
> +
> +static int unicam_log_status(struct file *file, void *fh)
> +{
> +	struct unicam_node *node = video_drvdata(file);
> +	struct unicam_device *dev = node->dev;
> +	u32 reg;
> +
> +	/* status for sub devices */
> +	v4l2_device_call_all(&dev->v4l2_dev, 0, core, log_status);
> +
> +	dev_info(dev->v4l2_dev.dev, "-----Receiver status-----\n");
> +	dev_info(dev->v4l2_dev.dev, "V4L2 width/height:   %ux%u\n",
> +		 node->v_fmt.fmt.pix.width, node->v_fmt.fmt.pix.height);
> +	dev_info(dev->v4l2_dev.dev, "Mediabus format:     %08x\n", node->fmt->code);
> +	dev_info(dev->v4l2_dev.dev, "V4L2 format:         %08x\n",
> +		 node->v_fmt.fmt.pix.pixelformat);
> +	reg = unicam_reg_read(dev, UNICAM_IPIPE);
> +	dev_info(dev->v4l2_dev.dev, "Unpacking/packing:   %u / %u\n",
> +		 unicam_get_field(reg, UNICAM_PUM_MASK),
> +		 unicam_get_field(reg, UNICAM_PPM_MASK));
> +	dev_info(dev->v4l2_dev.dev, "----Live data----\n");
> +	dev_info(dev->v4l2_dev.dev, "Programmed stride:   %4u\n",
> +		 unicam_reg_read(dev, UNICAM_IBLS));
> +	dev_info(dev->v4l2_dev.dev, "Detected resolution: %ux%u\n",
> +		 unicam_reg_read(dev, UNICAM_IHSTA),
> +		 unicam_reg_read(dev, UNICAM_IVSTA));
> +	dev_info(dev->v4l2_dev.dev, "Write pointer:       %08x\n",
> +		 unicam_reg_read(dev, UNICAM_IBWP));
> +
> +	return 0;
> +}
> +
> +static int unicam_subscribe_event(struct v4l2_fh *fh,
> +				  const struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_FRAME_SYNC:
> +		return v4l2_event_subscribe(fh, sub, 2, NULL);
> +	}
> +
> +	return v4l2_ctrl_subscribe_event(fh, sub);
> +}
> +
> +static int unicam_enum_fmt_vid_cap(struct file *file, void  *priv,
> +				   struct v4l2_fmtdesc *f)
> +{
> +	unsigned int i, index;
> +
> +	for (i = 0, index = 0; i < ARRAY_SIZE(formats); i++) {
> +		if (f->mbus_code && formats[i].code != f->mbus_code)
> +			continue;
> +		if (formats[i].metadata_fmt)
> +			continue;
> +
> +		if (index == f->index) {
> +			f->pixelformat = formats[i].fourcc;
> +			return 0;
> +		}
> +
> +		index++;
> +
> +		if (formats[i].unpacked_fourcc) {
> +			if (index == f->index) {
> +				f->pixelformat = formats[i].unpacked_fourcc;
> +				return 0;
> +			}
> +			index++;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int unicam_g_fmt_vid_cap(struct file *file, void *priv,
> +				struct v4l2_format *f)
> +{
> +	struct unicam_node *node = video_drvdata(file);
> +
> +	*f = node->v_fmt;
> +
> +	return 0;
> +}
> +
> +static const struct unicam_fmt *
> +unicam_try_fmt(struct unicam_node *node, struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format *v4l2_format = &f->fmt.pix;
> +	struct unicam_device *dev = node->dev;
> +	const struct unicam_fmt *fmt;
> +
> +	/*
> +	 * Default to the first format if the requested pixel format code isn't
> +	 * supported.
> +	 */
> +	fmt = find_format_by_fourcc(v4l2_format->pixelformat);
> +	if (!fmt) {
> +		fmt = &formats[0];
> +		v4l2_format->pixelformat = fmt->fourcc;
> +	}
> +
> +	unicam_calc_format_size_bpl(dev, fmt, f);
> +
> +	if (v4l2_format->field == V4L2_FIELD_ANY)
> +		v4l2_format->field = V4L2_FIELD_NONE;
> +
> +	dev_dbg(dev->v4l2_dev.dev, "%s: %08x %ux%u (bytesperline %u sizeimage %u)\n",
> +		__func__, v4l2_format->pixelformat,
> +		v4l2_format->width, v4l2_format->height,
> +		v4l2_format->bytesperline, v4l2_format->sizeimage);
> +
> +	return fmt;
> +}
> +
> +static int unicam_try_fmt_vid_cap(struct file *file, void *priv,
> +				  struct v4l2_format *f)
> +{
> +	struct unicam_node *node = video_drvdata(file);
> +
> +	unicam_try_fmt(node, f);
> +	return 0;
> +}
> +
> +static int unicam_s_fmt_vid_cap(struct file *file, void *priv,
> +				struct v4l2_format *f)
> +{
> +	struct unicam_node *node = video_drvdata(file);
> +	struct unicam_device *dev = node->dev;
> +	const struct unicam_fmt *fmt;
> +
> +	if (vb2_is_busy(&node->buffer_queue)) {
> +		dev_dbg(dev->v4l2_dev.dev, "%s device busy\n", __func__);
> +		return -EBUSY;
> +	}
> +
> +	fmt = unicam_try_fmt(node, f);

	node->fmt = fmt;

> +
> +	node->v_fmt = *f;
> +	node->fmt = fmt;
> +
> +	return 0;
> +}
> +
> +static int unicam_enum_framesizes(struct file *file, void *fh,
> +				  struct v4l2_frmsizeenum *fsize)
> +{
> +	if (fsize->index > 0)
> +		return -EINVAL;
> +
> +	if (!find_format_by_fourcc(fsize->pixel_format))
> +		return -EINVAL;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise.min_width = UNICAM_MIN_WIDTH;
> +	fsize->stepwise.max_width = UNICAM_MAX_WIDTH;
> +	fsize->stepwise.step_width = 1;
> +	fsize->stepwise.min_height = UNICAM_MIN_HEIGHT;
> +	fsize->stepwise.max_height = UNICAM_MAX_HEIGHT;
> +	fsize->stepwise.step_height = 1;
> +
> +	return 0;
> +}
> +
> +static int unicam_enum_fmt_meta_cap(struct file *file, void  *priv,

Extra space after void.

> +				    struct v4l2_fmtdesc *f)
> +{
> +	unsigned int i, index;
> +
> +	for (i = 0, index = 0; i < ARRAY_SIZE(formats); i++) {
> +		if (f->mbus_code && formats[i].code != f->mbus_code)
> +			continue;
> +		if (!formats[i].metadata_fmt)
> +			continue;
> +
> +		if (index == f->index) {
> +			f->pixelformat = formats[i].fourcc;
> +			f->type = V4L2_BUF_TYPE_META_CAPTURE;
> +			return 0;
> +		}
> +		index++;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int unicam_g_fmt_meta_cap(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	struct unicam_node *node = video_drvdata(file);
> +	struct v4l2_meta_format *meta = &f->fmt.meta;
> +
> +	meta->dataformat = node->v_fmt.fmt.meta.dataformat;
> +	meta->buffersize = node->v_fmt.fmt.meta.buffersize;

How about just

	f->fmt.meta = node->v_fmt.fmt.meta;

?

> +
> +	return 0;
> +}
> +
> +static int unicam_try_fmt_meta_cap(struct file *file, void *priv,
> +				   struct v4l2_format *f)
> +{
> +	f->fmt.meta.dataformat = V4L2_META_FMT_8;

Should we do something with buffersize too ? At least clamp it to
reasonable min/max values ?

> +
> +	return 0;
> +}
> +
> +static int unicam_s_fmt_meta_cap(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	struct unicam_node *node = video_drvdata(file);
> +
> +	unicam_try_fmt_meta_cap(file, priv, f);
> +
> +	node->v_fmt = *f;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops unicam_ioctl_ops = {
> +	.vidioc_querycap      = unicam_querycap,
> +	.vidioc_enum_fmt_vid_cap  = unicam_enum_fmt_vid_cap,
> +	.vidioc_g_fmt_vid_cap     = unicam_g_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap   = unicam_try_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap     = unicam_s_fmt_vid_cap,
> +
> +	.vidioc_enum_fmt_meta_cap	= unicam_enum_fmt_meta_cap,
> +	.vidioc_g_fmt_meta_cap		= unicam_g_fmt_meta_cap,
> +	.vidioc_try_fmt_meta_cap	= unicam_try_fmt_meta_cap,
> +	.vidioc_s_fmt_meta_cap		= unicam_s_fmt_meta_cap,

I think you can drop the _cap suffix from the function names, as this
driver only supports capture, not output.

> +
> +	.vidioc_enum_framesizes   = unicam_enum_framesizes,
> +	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
> +	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf   = vb2_ioctl_prepare_buf,
> +	.vidioc_querybuf      = vb2_ioctl_querybuf,
> +	.vidioc_qbuf          = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
> +	.vidioc_expbuf        = vb2_ioctl_expbuf,
> +	.vidioc_streamon      = vb2_ioctl_streamon,
> +	.vidioc_streamoff     = vb2_ioctl_streamoff,
> +
> +	.vidioc_log_status		= unicam_log_status,
> +	.vidioc_subscribe_event		= unicam_subscribe_event,
> +	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> +};
> +
> +/* unicam capture driver file operations */
> +static const struct v4l2_file_operations unicam_fops = {
> +	.owner		= THIS_MODULE,
> +	.open           = v4l2_fh_open,
> +	.release        = vb2_fop_release,
> +	.poll		= vb2_fop_poll,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap           = vb2_fop_mmap,
> +};

/* -----------------------------------------------------------------------------
 * V4L2 async notifier
 */

> +
> +static int
> +unicam_async_bound(struct v4l2_async_notifier *notifier,
> +		   struct v4l2_subdev *subdev,
> +		   struct v4l2_async_subdev *asd)
> +{
> +	struct unicam_device *unicam = v4l2_device_to_unicam_device(notifier->v4l2_dev);
> +	struct media_pad *sink = &unicam->subdev.sd.entity.pads[UNICAM_SD_PAD_SINK];
> +
> +	unicam->sensor = subdev;
> +	dev_dbg(unicam->v4l2_dev.dev, "Using sensor %s for capture\n",
> +		subdev->name);
> +
> +	return v4l2_create_fwnode_links_to_pad(subdev, sink, MEDIA_LNK_FL_ENABLED |
> +					       MEDIA_LNK_FL_IMMUTABLE);
> +}
> +
> +static void unicam_release(struct kref *kref)
> +{
> +	struct unicam_device *unicam =
> +		container_of(kref, struct unicam_device, kref);
> +
> +	media_device_cleanup(&unicam->mdev);

You need to make this conditional, otherwise there are code paths where
this function will be called without media_device_init() called first.

	if (unicam->mdev.dev)
		media_device_cleanup(&unicam->mdev);

should do.

> +
> +	kfree(unicam);
> +}
> +
> +static void unicam_put(struct unicam_device *unicam)
> +{
> +	kref_put(&unicam->kref, unicam_release);
> +}
> +
> +static struct unicam_device *unicam_get(struct unicam_device *unicam)
> +{
> +	kref_get(&unicam->kref);
> +	return unicam;
> +}

I'd move those three functions much further up, just before the misc
helpers.

> +
> +static void unicam_node_release(struct video_device *vdev)
> +{
> +	struct unicam_node *node = video_get_drvdata(vdev);
> +
> +	unicam_put(node->dev);
> +}
> +
> +static void unicam_set_default_format(struct unicam_node *node)
> +{
> +	static const struct v4l2_mbus_framefmt format = {
> +		.width = 640,
> +		.height = 480,
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.field = V4L2_FIELD_NONE,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
> +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> +		.xfer_func = V4L2_XFER_FUNC_SRGB,
> +		.flags = 0,
> +	};

Move this out of the function to a global variable, and use it to
initialize the subdev formats too in __unicam_subdev_set_routing().

> +
> +	if (is_image_node(node)) {
> +		struct v4l2_pix_format *pix_fmt = &node->v_fmt.fmt.pix;
> +
> +		pix_fmt->width = format.width;
> +		pix_fmt->height = format.height;
> +		pix_fmt->field = format.field;
> +		pix_fmt->colorspace = format.colorspace;
> +		pix_fmt->ycbcr_enc = format.ycbcr_enc;
> +		pix_fmt->quantization = format.quantization;
> +		pix_fmt->xfer_func = format.xfer_func;
> +		pix_fmt->pixelformat = formats[0].fourcc;
> +		unicam_calc_format_size_bpl(node->dev, &formats[0],
> +					    &node->v_fmt);
> +		node->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +
> +		node->fmt = &formats[0];
> +	} else {
> +		const struct unicam_fmt *fmt;
> +
> +		/* Fix this node format as embedded data. */
> +		fmt = find_format_by_code(MEDIA_BUS_FMT_METADATA_8);
> +		node->fmt = fmt;
> +		node->v_fmt.fmt.meta.dataformat = fmt->fourcc;
> +		node->v_fmt.fmt.meta.buffersize = UNICAM_EMBEDDED_SIZE;
> +		node->v_fmt.type = V4L2_BUF_TYPE_META_CAPTURE;
> +	}
> +}
> +
> +static int register_node(struct unicam_device *unicam,

Prefix.

> +			 enum unicam_node_type type)
> +{
> +	struct video_device *vdev;
> +	struct vb2_queue *q;
> +	struct unicam_node *node = &unicam->node[type];
> +	int ret;
> +
> +	node->dev = unicam_get(unicam);
> +	node->node_id = type;
> +
> +	spin_lock_init(&node->dma_queue_lock);
> +	mutex_init(&node->lock);
> +
> +	/* Initialize the videobuf2 queue. */
> +	INIT_LIST_HEAD(&node->dma_queue);

This line should go above, it's not the videobuf2 queue.

> +
> +	q = &node->buffer_queue;
> +	q->type = type == UNICAM_IMAGE_NODE ? V4L2_BUF_TYPE_VIDEO_CAPTURE
> +					    : V4L2_BUF_TYPE_META_CAPTURE;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> +	q->drv_priv = node;
> +	q->ops = &unicam_video_qops;
> +	q->mem_ops = &vb2_dma_contig_memops;
> +	q->buf_struct_size = sizeof(struct unicam_buffer);
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->lock = &node->lock;
> +	q->min_buffers_needed = 1;
> +	q->dev = unicam->pdev;
> +
> +	ret = vb2_queue_init(q);
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "vb2_queue_init() failed\n");
> +		goto err_unicam_put;
> +	}
> +
> +	/* Initialize the video device. */
> +	vdev = &node->video_dev;
> +	vdev->release = unicam_node_release;
> +	vdev->fops = &unicam_fops;
> +	vdev->ioctl_ops = &unicam_ioctl_ops;
> +	vdev->v4l2_dev = &unicam->v4l2_dev;
> +	vdev->vfl_dir = VFL_DIR_RX;
> +	vdev->queue = q;
> +	vdev->lock = &node->lock;
> +	vdev->device_caps = (type == UNICAM_IMAGE_NODE) ?

No need for parentheses.

> +			     V4L2_CAP_VIDEO_CAPTURE : V4L2_CAP_META_CAPTURE;
> +	vdev->device_caps |= V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
> +
> +	/* Define the device names */
> +	snprintf(vdev->name, sizeof(vdev->name), "%s-%s", UNICAM_MODULE_NAME,
> +		 type == UNICAM_IMAGE_NODE ? "image" : "embedded");
> +
> +	video_set_drvdata(vdev, node);
> +	if (type == UNICAM_IMAGE_NODE)
> +		vdev->entity.flags |= MEDIA_ENT_FL_DEFAULT;
> +	node->pad.flags = MEDIA_PAD_FL_SINK;
> +	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
> +	if (ret)
> +		goto err_unicam_put;
> +
> +	node->dummy_buf_cpu_addr = dma_alloc_coherent(unicam->pdev,
> +						      UNICAM_DUMMY_BUF_SIZE,
> +						      &node->dummy_buf_dma_addr,
> +						      GFP_KERNEL);
> +	if (!node->dummy_buf_cpu_addr) {
> +		dev_err(unicam->v4l2_dev.dev, "Unable to allocate dummy buffer.\n");
> +		ret = -ENOMEM;
> +		goto err_entity_cleanup;
> +	}
> +
> +	unicam_set_default_format(node);
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "Unable to register video device %s\n",
> +			vdev->name);
> +		goto err_dma_free;
> +	}
> +
> +	node->registered = true;
> +
> +	ret = media_create_pad_link(&unicam->subdev.sd.entity,
> +				    node->src_pad_id,
> +				    &node->video_dev.entity,
> +				    0,
> +				    MEDIA_LNK_FL_ENABLED |
> +				    MEDIA_LNK_FL_IMMUTABLE);
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "Unable to create pad link for %s",
> +			unicam->sensor->name);
> +		goto err_unregister_device;
> +	}
> +
> +	return 0;
> +
> +err_unregister_device:
> +	video_unregister_device(&node->video_dev);

Now that the video device has been registered, video_unregister_device()
will end up calling unicam_put() through unicam_node_release(). The
unicam_put() call below will thus release the reference a second time.

As the caller of this function calls unregister_nodes() on error, you
can drop video_unregister_device() here and simply return an error
directly if media_create_pad_link() fails. Adding a comment there will
be useful too:

	ret = media_create_pad_link(&unicam->subdev.sd.entity,
				    node->src_pad_id,
				    &node->video_dev.entity, 0,
				    MEDIA_LNK_FL_ENABLED |
				    MEDIA_LNK_FL_IMMUTABLE);
	if (ret) {
		/*
		 * No need for cleanup, the caller will unregister the
		 * video device, which will drop the reference on the
		 * device and trigger the cleanup.
		 */
		return ret;
	}

> +err_dma_free:
> +	dma_free_coherent(unicam->pdev, UNICAM_DUMMY_BUF_SIZE,
> +			  node->dummy_buf_cpu_addr,
> +			  node->dummy_buf_dma_addr);
> +err_entity_cleanup:
> +	media_entity_cleanup(&vdev->entity);
> +err_unicam_put:
> +	unicam_put(unicam);
> +	return ret;
> +}
> +
> +static void unregister_nodes(struct unicam_device *unicam)

Prefix.

> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
> +		struct unicam_node *node = &unicam->node[i];
> +
> +		if (node->dummy_buf_cpu_addr)
> +			dma_free_coherent(unicam->pdev, UNICAM_DUMMY_BUF_SIZE,
> +					  node->dummy_buf_cpu_addr,
> +					  node->dummy_buf_dma_addr);
> +
> +		if (node->registered) {
> +			video_unregister_device(&node->video_dev);
> +			node->registered = false;
> +		}
> +	}
> +}

Let's move this and the previous function just after unicam_fops.

> +
> +static int unicam_async_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct unicam_device *unicam = v4l2_device_to_unicam_device(notifier->v4l2_dev);
> +	unsigned int i, source_pads = 0;
> +	int ret;
> +
> +	for (i = 0; i < unicam->subdev.sd.entity.num_pads; i++) {
> +		if (unicam->subdev.sd.entity.pads[i].flags & MEDIA_PAD_FL_SOURCE) {
> +			if (source_pads < UNICAM_MAX_NODES) {
> +				unicam->node[source_pads].src_pad_id = i;
> +				dev_dbg(unicam->v4l2_dev.dev, "source pad %u is index %u\n",
> +					source_pads, i);
> +			}
> +			source_pads++;
> +		}
> +	}
> +	if (!source_pads) {
> +		dev_err(unicam->v4l2_dev.dev, "No source pads on subdev.\n");
> +		goto unregister;
> +	}

Please re-read the review of v2. This whole block should be dropped, and
the src_pad_id field be dropped from unicam_node.

> +
> +	ret = register_node(unicam, UNICAM_IMAGE_NODE);
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "Unable to register image video device.\n");
> +		goto unregister;
> +	}
> +
> +	/* \todo: The sensor should report it. */
> +	unicam->sensor_embedded_data = true;

Not used.

> +
> +	ret = register_node(unicam, UNICAM_METADATA_NODE);
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "Unable to register metadata video device.\n");
> +		goto unregister;
> +	}
> +
> +	ret = v4l2_device_register_subdev_nodes(&unicam->v4l2_dev);
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "Unable to register subdev nodes.\n");
> +		goto unregister;
> +	}
> +
> +	unicam->remote_pad = media_entity_remote_pad(&unicam->node[UNICAM_IMAGE_NODE].pad);

Store the pointer to the sensor's source pad instead, and move this to
unicam_async_bound() when set set unicam->sensor.

> +	if (!unicam->remote_pad)
> +		return -ENODEV;
> +
> +	return 0;
> +
> +unregister:
> +	unregister_nodes(unicam);
> +	unicam_put(unicam);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_async_notifier_operations unicam_async_ops = {
> +	.bound = unicam_async_bound,
> +	.complete = unicam_async_complete,
> +};
> +
> +static int of_unicam_connect_subdevs(struct unicam_device *dev)

unicam_connect_of_subdevs() to use the unicam_ prefix consistently.

> +{
> +	struct device *pdev = dev->pdev;

You can drop this variable and use dev->pdev in the two locations where
this is used below.

> +	struct v4l2_fwnode_endpoint ep = { };
> +	struct fwnode_handle *ep_handle;
> +	struct v4l2_async_subdev *asd;
> +	unsigned int lane;
> +	int ret = -EINVAL;
> +
> +	if (of_property_read_u32(pdev->of_node, "num-data-lanes",

The binding now use brcm,num-data-lanes.

> +				 &dev->max_data_lanes) < 0) {
> +		dev_err(dev->v4l2_dev.dev, "number of data lanes not set\n");

		dev_err(dev->pdev, "DT property %s not set\n",
			"brcm,num-data-lanes");

> +		return -EINVAL;
> +	}
> +
> +	/* Get the local endpoint and remote device. */
> +	ep_handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(pdev), 0, 0,
> +						    FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep_handle) {
> +		dev_err(dev->v4l2_dev.dev, "No endpoint.\n");

s/endpoint./endpoint/

> +		return -ENODEV;
> +	}
> +
> +	/* Parse the local endpoint and validate its configuration. */
> +	if (v4l2_fwnode_endpoint_alloc_parse(ep_handle, &ep)) {
> +		dev_err(dev->v4l2_dev.dev, "could not parse endpoint\n");
> +		goto cleanup_exit;
> +	}
> +
> +	dev_dbg(dev->v4l2_dev.dev, "parsed local endpoint, bus_type %u\n",
> +		ep.bus_type);
> +
> +	dev->bus_type = ep.bus_type;
> +
> +	switch (ep.bus_type) {
> +	case V4L2_MBUS_CSI2_DPHY:
> +		switch (ep.bus.mipi_csi2.num_data_lanes) {
> +		case 1:
> +		case 2:
> +		case 4:
> +			break;
> +
> +		default:
> +			dev_err(dev->v4l2_dev.dev, "%u data lanes not supported\n",
> +				ep.bus.mipi_csi2.num_data_lanes);
> +			goto cleanup_exit;
> +		}
> +
> +		for (lane = 0; lane < ep.bus.mipi_csi2.num_data_lanes; lane++) {
> +			if (ep.bus.mipi_csi2.data_lanes[lane] != lane + 1) {
> +				dev_err(dev->v4l2_dev.dev, "data lanes reordering not supported\n");
> +				goto cleanup_exit;
> +			}
> +		}
> +
> +		if (ep.bus.mipi_csi2.num_data_lanes > dev->max_data_lanes) {
> +			dev_err(dev->v4l2_dev.dev, "endpoint requires %u data lanes when %u are supported\n",
> +				ep.bus.mipi_csi2.num_data_lanes,
> +				dev->max_data_lanes);
> +		}
> +
> +		dev->active_data_lanes = ep.bus.mipi_csi2.num_data_lanes;
> +		dev->bus_flags = ep.bus.mipi_csi2.flags;
> +
> +		break;
> +
> +	case V4L2_MBUS_CCP2:
> +		if (ep.bus.mipi_csi1.clock_lane != 0 ||
> +		    ep.bus.mipi_csi1.data_lane != 1) {
> +			dev_err(dev->v4l2_dev.dev, "unsupported lanes configuration\n");
> +			goto cleanup_exit;
> +		}
> +
> +		dev->max_data_lanes = 1;
> +		dev->active_data_lanes = 1;
> +			dev->bus_flags = ep.bus.mipi_csi1.strobe;

Wrong indentation.

> +		break;
> +
> +	default:
> +		/* Unsupported bus type */
> +		dev_err(dev->v4l2_dev.dev, "unsupported bus type %u\n",
> +			ep.bus_type);
> +		goto cleanup_exit;
> +	}
> +
> +	dev_dbg(dev->v4l2_dev.dev, "%s bus, %u data lanes, flags=0x%08x\n",
> +		dev->bus_type == V4L2_MBUS_CSI2_DPHY ? "CSI-2" : "CCP2",
> +		dev->active_data_lanes, dev->bus_flags);
> +
> +	/* Initialize and register the async notifier. */
> +	v4l2_async_nf_init(&dev->notifier);
> +
> +	asd = v4l2_async_nf_add_fwnode_remote(&dev->notifier,
> +					      ep_handle,

These two lines can fit into one.

> +					      struct v4l2_async_subdev);
> +
> +	fwnode_handle_put(ep_handle);

	ep_handle = NULL;

or the cleanup path will release the reference a second time.

> +
> +	if (IS_ERR(asd)) {
> +		ret = PTR_ERR(asd);
> +		/* OK if asd already exists */

Why is that OK ?

> +		if (ret != -EEXIST)
> +			goto cleanup_exit;
> +	}
> +
> +	dev->notifier.ops = &unicam_async_ops;
> +
> +	ret = v4l2_async_nf_register(&dev->v4l2_dev, &dev->notifier);
> +	if (ret) {
> +		dev_err(dev->v4l2_dev.dev, "Error registering device notifier: %d\n", ret);
> +		goto cleanup_exit;
> +	}
> +
> +	return 0;
> +
> +cleanup_exit:
> +	v4l2_fwnode_endpoint_free(&ep);
> +	fwnode_handle_put(ep_handle);
> +
> +	return ret;
> +}
> +
> +static int bcm2835_media_dev_init(struct unicam_device *unicam,

bcm2835 stands out, you use unicam_ as a prefix everywhere else.

> +				  struct platform_device *pdev)

Drop this argument and use unicam->pdev.

> +{
> +	unicam->mdev.dev = &pdev->dev;
> +	strscpy(unicam->mdev.model, UNICAM_MODULE_NAME,
> +		sizeof(unicam->mdev.model));
> +	strscpy(unicam->mdev.serial, "", sizeof(unicam->mdev.serial));
> +	snprintf(unicam->mdev.bus_info, sizeof(unicam->mdev.bus_info),
> +		 "platform:%s", dev_name(&pdev->dev));

This line can be dropped once "[PATCH v2 0/4] Set bus_info field in
framework" gets merged.

> +	unicam->mdev.hw_revision = 0;
> +
> +	media_device_init(&unicam->mdev);
> +
> +	unicam->v4l2_dev.mdev = &unicam->mdev;
> +
> +	return v4l2_device_register(&pdev->dev, &unicam->v4l2_dev);
> +}
> +
> +static int unicam_init_and_register_subdev(struct unicam_device *unicam)

I'd move this function to the subdev section, just after
unicam_subdev_media_ops.

> +{

	struct v4l2_subdev *sd = &unicam->subdev.sd;

will make the lines below shorter and easier to read.

> +	int ret;
> +
> +	v4l2_subdev_init(&unicam->subdev.sd, &unicam_subdev_ops);
> +	v4l2_set_subdevdata(&unicam->subdev.sd, unicam);
> +	unicam->subdev.sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	unicam->subdev.sd.dev = unicam->pdev;
> +	unicam->subdev.sd.owner = THIS_MODULE;
> +	unicam->subdev.sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_MULTIPLEXED;
> +	snprintf(unicam->subdev.sd.name, sizeof(unicam->subdev.sd.name), "unicam-subdev");
> +
> +	unicam->subdev.pads[UNICAM_SD_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +
> +	unicam->subdev.pads[UNICAM_SD_PAD_SOURCE_IMAGE].flags = MEDIA_PAD_FL_SOURCE;
> +	unicam->subdev.pads[UNICAM_SD_PAD_SOURCE_METADATA].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	unicam->subdev.sd.entity.ops = &unicam_subdev_media_ops;

Move this line just after setting entity.function.

> +	ret = media_entity_pads_init(&unicam->subdev.sd.entity,
> +				     ARRAY_SIZE(unicam->subdev.pads), unicam->subdev.pads);
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "Could not init media controller for subdev");

You can use unicam->pdev. Same below.

s/controller for subdev/entity/

> +		return ret;
> +	}
> +
> +	ret = v4l2_subdev_init_finalize(&unicam->subdev.sd);
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev, "Could not finalize init for subdev");
> +		goto err_entity_cleanup;
> +	}
> +
> +	return v4l2_device_register_subdev(&unicam->v4l2_dev, &unicam->subdev.sd);
> +
> +err_entity_cleanup:
> +	media_entity_cleanup(&unicam->subdev.sd.entity);

This should be moved to unicam_release(). Drop it from unicam_probe()
too.

> +	return ret;
> +}
> +
> +static int unicam_probe(struct platform_device *pdev)
> +{
> +	struct unicam_device *unicam;
> +	int ret = 0;
> +
> +	unicam = kzalloc(sizeof(*unicam), GFP_KERNEL);
> +	if (!unicam)
> +		return -ENOMEM;
> +
> +	kref_init(&unicam->kref);
> +	unicam->pdev = &pdev->dev;
> +
> +	unicam->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(unicam->base)) {
> +		ret = PTR_ERR(unicam->base);
> +		goto err_unicam_put;
> +	}
> +
> +	unicam->clk_gate_base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(unicam->clk_gate_base)) {
> +		ret = PTR_ERR(unicam->clk_gate_base);
> +		goto err_unicam_put;
> +	}
> +
> +	unicam->clock = devm_clk_get(&pdev->dev, "lp");
> +	if (IS_ERR(unicam->clock)) {
> +		dev_err(unicam->v4l2_dev.dev, "Failed to get lp clock\n");
> +		ret = PTR_ERR(unicam->clock);
> +		goto err_unicam_put;
> +	}
> +
> +	unicam->vpu_clock = devm_clk_get(&pdev->dev, "vpu");
> +	if (IS_ERR(unicam->vpu_clock)) {
> +		dev_err(unicam->v4l2_dev.dev, "Failed to get vpu clock\n");
> +		ret = PTR_ERR(unicam->vpu_clock);
> +		goto err_unicam_put;
> +	}
> +
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret <= 0) {
> +		dev_err(&pdev->dev, "No IRQ resource\n");
> +		ret = -EINVAL;
> +		goto err_unicam_put;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev, ret, unicam_isr, 0,
> +			       "unicam_capture0", unicam);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Unable to request interrupt\n");
> +		ret = -EINVAL;
> +		goto err_unicam_put;
> +	}
> +
> +	ret = bcm2835_media_dev_init(unicam, pdev);
> +	if (ret) {
> +		dev_err(unicam->v4l2_dev.dev,
> +			"Unable to register v4l2 device.\n");
> +		goto err_unicam_put;
> +	}
> +
> +	ret = media_device_register(&unicam->mdev);

This can be moved to the bcm2835_media_dev_init() function, which could
then be renamed to unicam_init_and_register_media() to match
unicam_init_and_register_subdev().

Please double-check the cleanup path at the end of this function after
making this change.

> +	if (ret < 0) {
> +		dev_err(unicam->v4l2_dev.dev,
> +			"Unable to register media-controller device.\n");
> +		goto err_v4l2_unregister;
> +	}
> +
> +	/* set the driver data in platform device */
> +	platform_set_drvdata(pdev, unicam);

I'd move this line either to the top, just after setting unicam->pdev,
or to the bottom, just before returning. It's a bit lost here in the
middle.

> +
> +	ret = unicam_init_and_register_subdev(unicam);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register internal subdev\n");
> +		goto err_media_unregister;
> +	}
> +
> +	ret = of_unicam_connect_subdevs(unicam);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to connect subdevs\n");
> +		goto err_subdev_unregister;
> +	}
> +
> +	/* Enable the block power domain */
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return 0;
> +
> +err_subdev_unregister:
> +	v4l2_subdev_cleanup(&unicam->subdev.sd);
> +err_media_unregister:
> +	media_entity_cleanup(&unicam->subdev.sd.entity);
> +	media_device_unregister(&unicam->mdev);
> +err_v4l2_unregister:
> +	v4l2_device_unregister(&unicam->v4l2_dev);
> +err_unicam_put:
> +	unicam_put(unicam);
> +
> +	return ret;
> +}
> +
> +static int unicam_remove(struct platform_device *pdev)
> +{
> +	struct unicam_device *unicam = platform_get_drvdata(pdev);
> +
> +	unregister_nodes(unicam);
> +	v4l2_device_unregister(&unicam->v4l2_dev);
> +	media_device_unregister(&unicam->mdev);
> +	v4l2_async_nf_unregister(&unicam->notifier);
> +	unicam_put(unicam);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id unicam_of_match[] = {
> +	{ .compatible = "brcm,bcm2835-unicam", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, unicam_of_match);
> +
> +static struct platform_driver unicam_driver = {
> +	.probe		= unicam_probe,
> +	.remove		= unicam_remove,
> +	.driver = {
> +		.name	= UNICAM_MODULE_NAME,
> +		.of_match_table = of_match_ptr(unicam_of_match),
> +	},
> +};
> +
> +module_platform_driver(unicam_driver);
> +
> +MODULE_AUTHOR("Dave Stevenson <dave.stevenson@raspberrypi.com>");
> +MODULE_DESCRIPTION("BCM2835 Unicam driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/bcm2835/vc4-regs-unicam.h b/drivers/media/platform/bcm2835/vc4-regs-unicam.h
> new file mode 100644
> index 000000000000..b8d297076a02
> --- /dev/null
> +++ b/drivers/media/platform/bcm2835/vc4-regs-unicam.h
> @@ -0,0 +1,253 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +/*
> + * Copyright (C) 2017-2020 Raspberry Pi Trading.
> + * Dave Stevenson <dave.stevenson@raspberrypi.com>
> + */
> +
> +#ifndef VC4_REGS_UNICAM_H
> +#define VC4_REGS_UNICAM_H
> +
> +/*
> + * The following values are taken from files found within the code drop
> + * made by Broadcom for the BCM21553 Graphics Driver, predominantly in
> + * brcm_usrlib/dag/vmcsx/vcinclude/hardware_vc4.h.
> + * They have been modified to be only the register offset.
> + */
> +#define UNICAM_CTRL		0x000
> +#define UNICAM_STA		0x004
> +#define UNICAM_ANA		0x008
> +#define UNICAM_PRI		0x00c
> +#define UNICAM_CLK		0x010
> +#define UNICAM_CLT		0x014
> +#define UNICAM_DAT0		0x018
> +#define UNICAM_DAT1		0x01c
> +#define UNICAM_DAT2		0x020
> +#define UNICAM_DAT3		0x024
> +#define UNICAM_DLT		0x028
> +#define UNICAM_CMP0		0x02c
> +#define UNICAM_CMP1		0x030
> +#define UNICAM_CAP0		0x034
> +#define UNICAM_CAP1		0x038
> +#define UNICAM_ICTL		0x100
> +#define UNICAM_ISTA		0x104
> +#define UNICAM_IDI0		0x108
> +#define UNICAM_IPIPE		0x10c
> +#define UNICAM_IBSA0		0x110
> +#define UNICAM_IBEA0		0x114
> +#define UNICAM_IBLS		0x118
> +#define UNICAM_IBWP		0x11c
> +#define UNICAM_IHWIN		0x120
> +#define UNICAM_IHSTA		0x124
> +#define UNICAM_IVWIN		0x128
> +#define UNICAM_IVSTA		0x12c
> +#define UNICAM_ICC		0x130
> +#define UNICAM_ICS		0x134
> +#define UNICAM_IDC		0x138
> +#define UNICAM_IDPO		0x13c
> +#define UNICAM_IDCA		0x140
> +#define UNICAM_IDCD		0x144
> +#define UNICAM_IDS		0x148
> +#define UNICAM_DCS		0x200
> +#define UNICAM_DBSA0		0x204
> +#define UNICAM_DBEA0		0x208
> +#define UNICAM_DBWP		0x20c
> +#define UNICAM_DBCTL		0x300
> +#define UNICAM_IBSA1		0x304
> +#define UNICAM_IBEA1		0x308
> +#define UNICAM_IDI1		0x30c
> +#define UNICAM_DBSA1		0x310
> +#define UNICAM_DBEA1		0x314
> +#define UNICAM_MISC		0x400
> +
> +/*
> + * The following bitmasks are from the kernel released by Broadcom
> + * for Android - https://android.googlesource.com/kernel/bcm/
> + * The Rhea, Hawaii, and Java chips all contain the same VideoCore4
> + * Unicam block as BCM2835, as defined in eg
> + * arch/arm/mach-rhea/include/mach/rdb_A0/brcm_rdb_cam.h and similar.
> + * Values reworked to use the kernel BIT and GENMASK macros.
> + *
> + * Some of the bit mnenomics have been amended to match the datasheet.
> + */
> +/* UNICAM_CTRL Register */
> +#define UNICAM_CPE		BIT(0)
> +#define UNICAM_MEM		BIT(1)
> +#define UNICAM_CPR		BIT(2)
> +#define UNICAM_CPM_MASK		GENMASK(3, 3)
> +#define UNICAM_CPM_CSI2		0
> +#define UNICAM_CPM_CCP2		1
> +#define UNICAM_SOE		BIT(4)
> +#define UNICAM_DCM_MASK		GENMASK(5, 5)
> +#define UNICAM_DCM_STROBE	0
> +#define UNICAM_DCM_DATA		1
> +#define UNICAM_SLS		BIT(6)
> +#define UNICAM_PFT_MASK		GENMASK(11, 8)
> +#define UNICAM_OET_MASK		GENMASK(20, 12)
> +
> +/* UNICAM_STA Register */
> +#define UNICAM_SYN		BIT(0)
> +#define UNICAM_CS		BIT(1)
> +#define UNICAM_SBE		BIT(2)
> +#define UNICAM_PBE		BIT(3)
> +#define UNICAM_HOE		BIT(4)
> +#define UNICAM_PLE		BIT(5)
> +#define UNICAM_SSC		BIT(6)
> +#define UNICAM_CRCE		BIT(7)
> +#define UNICAM_OES		BIT(8)
> +#define UNICAM_IFO		BIT(9)
> +#define UNICAM_OFO		BIT(10)
> +#define UNICAM_BFO		BIT(11)
> +#define UNICAM_DL		BIT(12)
> +#define UNICAM_PS		BIT(13)
> +#define UNICAM_IS		BIT(14)
> +#define UNICAM_PI0		BIT(15)
> +#define UNICAM_PI1		BIT(16)
> +#define UNICAM_FSI_S		BIT(17)
> +#define UNICAM_FEI_S		BIT(18)
> +#define UNICAM_LCI_S		BIT(19)
> +#define UNICAM_BUF0_RDY		BIT(20)
> +#define UNICAM_BUF0_NO		BIT(21)
> +#define UNICAM_BUF1_RDY		BIT(22)
> +#define UNICAM_BUF1_NO		BIT(23)
> +#define UNICAM_DI		BIT(24)
> +
> +#define UNICAM_STA_MASK_ALL \
> +		(UNICAM_DL | \
> +		UNICAM_SBE | \
> +		UNICAM_PBE | \
> +		UNICAM_HOE | \
> +		UNICAM_PLE | \
> +		UNICAM_SSC | \
> +		UNICAM_CRCE | \
> +		UNICAM_IFO | \
> +		UNICAM_OFO | \
> +		UNICAM_PS | \
> +		UNICAM_PI0 | \
> +		UNICAM_PI1)
> +
> +/* UNICAM_ANA Register */
> +#define UNICAM_APD		BIT(0)
> +#define UNICAM_BPD		BIT(1)
> +#define UNICAM_AR		BIT(2)
> +#define UNICAM_DDL		BIT(3)
> +#define UNICAM_CTATADJ_MASK	GENMASK(7, 4)
> +#define UNICAM_PTATADJ_MASK	GENMASK(11, 8)
> +
> +/* UNICAM_PRI Register */
> +#define UNICAM_PE		BIT(0)
> +#define UNICAM_PT_MASK		GENMASK(2, 1)
> +#define UNICAM_NP_MASK		GENMASK(7, 4)
> +#define UNICAM_PP_MASK		GENMASK(11, 8)
> +#define UNICAM_BS_MASK		GENMASK(15, 12)
> +#define UNICAM_BL_MASK		GENMASK(17, 16)
> +
> +/* UNICAM_CLK Register */
> +#define UNICAM_CLE		BIT(0)
> +#define UNICAM_CLPD		BIT(1)
> +#define UNICAM_CLLPE		BIT(2)
> +#define UNICAM_CLHSE		BIT(3)
> +#define UNICAM_CLTRE		BIT(4)
> +#define UNICAM_CLAC_MASK	GENMASK(8, 5)
> +#define UNICAM_CLSTE		BIT(29)
> +
> +/* UNICAM_CLT Register */
> +#define UNICAM_CLT1_MASK	GENMASK(7, 0)
> +#define UNICAM_CLT2_MASK	GENMASK(15, 8)
> +
> +/* UNICAM_DATn Registers */
> +#define UNICAM_DLE		BIT(0)
> +#define UNICAM_DLPD		BIT(1)
> +#define UNICAM_DLLPE		BIT(2)
> +#define UNICAM_DLHSE		BIT(3)
> +#define UNICAM_DLTRE		BIT(4)
> +#define UNICAM_DLSM		BIT(5)
> +#define UNICAM_DLFO		BIT(28)
> +#define UNICAM_DLSTE		BIT(29)
> +
> +#define UNICAM_DAT_MASK_ALL	(UNICAM_DLSTE | UNICAM_DLFO)
> +
> +/* UNICAM_DLT Register */
> +#define UNICAM_DLT1_MASK	GENMASK(7, 0)
> +#define UNICAM_DLT2_MASK	GENMASK(15, 8)
> +#define UNICAM_DLT3_MASK	GENMASK(23, 16)
> +
> +/* UNICAM_ICTL Register */
> +#define UNICAM_FSIE		BIT(0)
> +#define UNICAM_FEIE		BIT(1)
> +#define UNICAM_IBOB		BIT(2)
> +#define UNICAM_FCM		BIT(3)
> +#define UNICAM_TFC		BIT(4)
> +#define UNICAM_LIP_MASK		GENMASK(6, 5)
> +#define UNICAM_LCIE_MASK	GENMASK(28, 16)
> +
> +/* UNICAM_IDI0/1 Register */
> +#define UNICAM_ID0_MASK		GENMASK(7, 0)
> +#define UNICAM_ID1_MASK		GENMASK(15, 8)
> +#define UNICAM_ID2_MASK		GENMASK(23, 16)
> +#define UNICAM_ID3_MASK		GENMASK(31, 24)
> +
> +/* UNICAM_ISTA Register */
> +#define UNICAM_FSI		BIT(0)
> +#define UNICAM_FEI		BIT(1)
> +#define UNICAM_LCI		BIT(2)
> +
> +#define UNICAM_ISTA_MASK_ALL	(UNICAM_FSI | UNICAM_FEI | UNICAM_LCI)
> +
> +/* UNICAM_IPIPE Register */
> +#define UNICAM_PUM_MASK		GENMASK(2, 0)
> +/* Unpacking modes */
> +#define UNICAM_PUM_NONE		0
> +#define UNICAM_PUM_UNPACK6	1
> +#define UNICAM_PUM_UNPACK7	2
> +#define UNICAM_PUM_UNPACK8	3
> +#define UNICAM_PUM_UNPACK10	4
> +#define UNICAM_PUM_UNPACK12	5
> +#define UNICAM_PUM_UNPACK14	6
> +#define UNICAM_PUM_UNPACK16	7
> +#define UNICAM_DDM_MASK		GENMASK(6, 3)
> +#define UNICAM_PPM_MASK		GENMASK(9, 7)
> +/* Packing modes */
> +#define UNICAM_PPM_NONE		0
> +#define UNICAM_PPM_PACK8	1
> +#define UNICAM_PPM_PACK10	2
> +#define UNICAM_PPM_PACK12	3
> +#define UNICAM_PPM_PACK14	4
> +#define UNICAM_PPM_PACK16	5
> +#define UNICAM_DEM_MASK		GENMASK(11, 10)
> +#define UNICAM_DEBL_MASK	GENMASK(14, 12)
> +#define UNICAM_ICM_MASK		GENMASK(16, 15)
> +#define UNICAM_IDM_MASK		GENMASK(17, 17)
> +
> +/* UNICAM_ICC Register */
> +#define UNICAM_ICFL_MASK	GENMASK(4, 0)
> +#define UNICAM_ICFH_MASK	GENMASK(9, 5)
> +#define UNICAM_ICST_MASK	GENMASK(12, 10)
> +#define UNICAM_ICLT_MASK	GENMASK(15, 13)
> +#define UNICAM_ICLL_MASK	GENMASK(31, 16)
> +
> +/* UNICAM_DCS Register */
> +#define UNICAM_DIE		BIT(0)
> +#define UNICAM_DIM		BIT(1)
> +#define UNICAM_DBOB		BIT(3)
> +#define UNICAM_FDE		BIT(4)
> +#define UNICAM_LDP		BIT(5)
> +#define UNICAM_EDL_MASK		GENMASK(15, 8)
> +
> +/* UNICAM_DBCTL Register */
> +#define UNICAM_DBEN		BIT(0)
> +#define UNICAM_BUF0_IE		BIT(1)
> +#define UNICAM_BUF1_IE		BIT(2)
> +
> +/* UNICAM_CMP[0,1] register */
> +#define UNICAM_PCE		BIT(31)
> +#define UNICAM_GI		BIT(9)
> +#define UNICAM_CPH		BIT(8)
> +#define UNICAM_PCVC_MASK	GENMASK(7, 6)
> +#define UNICAM_PCDT_MASK	GENMASK(5, 0)
> +
> +/* UNICAM_MISC register */
> +#define UNICAM_FL0		BIT(6)
> +#define UNICAM_FL1		BIT(9)
> +
> +#endif

-- 
Regards,

Laurent Pinchart

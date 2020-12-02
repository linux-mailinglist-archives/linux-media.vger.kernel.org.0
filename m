Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E052CC937
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 22:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgLBVzO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 16:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgLBVzO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 16:55:14 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEA1C0613D6
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 13:54:33 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 62CE8634C24;
        Wed,  2 Dec 2020 23:53:20 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kka3s-00035b-Qf; Wed, 02 Dec 2020 23:53:20 +0200
Date:   Wed, 2 Dec 2020 23:53:20 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, naush@raspberrypi.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se,
        dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        nsaenzjulienne@suse.de, mchehab+huawei@kernel.org
Subject: Re: [PATCH v4 3/5] media: bcm2835-unicam: Driver for CCP2/CSI2
 camera interface
Message-ID: <20201202215320.GZ4351@valkosipuli.retiisi.org.uk>
References: <20201110174036.220883-1-jacopo@jmondi.org>
 <20201110174036.220883-4-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201110174036.220883-4-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Nov 10, 2020 at 06:40:34PM +0100, Jacopo Mondi wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> Add a driver for the Unicam camera receiver block on BCM283x processors.
> Compared to the bcm2835-camera driver present in staging, this driver
> handles the Unicam block only (CSI-2 receiver), and doesn't depend on
> the VC4 firmware running on the VPU.
> 
> The commit is made up of a series of changes cherry-picked from the
> rpi-5.9.y branch of https://github.com/raspberrypi/linux/ at revision
> commit be371a8ffc012
> ("media: bcm2835-unicam: change minimum number of vb2_queue buffers to 1")
> with additional enhancements, forward-ported to the mainline kernel.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  MAINTAINERS                                   |    7 +
>  drivers/staging/media/Kconfig                 |    2 +
>  drivers/staging/media/Makefile                |    1 +
>  drivers/staging/media/bcm2835-unicam/Kconfig  |   21 +
>  drivers/staging/media/bcm2835-unicam/Makefile |    3 +
>  .../media/bcm2835-unicam/bcm2835-unicam.c     | 2750 +++++++++++++++++
>  .../media/bcm2835-unicam/vc4-regs-unicam.h    |  253 ++
>  7 files changed, 3037 insertions(+)
>  create mode 100644 drivers/staging/media/bcm2835-unicam/Kconfig
>  create mode 100644 drivers/staging/media/bcm2835-unicam/Makefile
>  create mode 100644 drivers/staging/media/bcm2835-unicam/bcm2835-unicam.c
>  create mode 100644 drivers/staging/media/bcm2835-unicam/vc4-regs-unicam.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 811db1d3ca33b..69d55ed67e1cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3411,6 +3411,13 @@ N:	bcm113*
>  N:	bcm216*
>  N:	kona
>  
> +BROADCOM BCM2835 CAMERA DRIVER
> +M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> +F:	drivers/staging/media/bcm2835/
> +
>  BROADCOM BCM47XX MIPS ARCHITECTURE
>  M:	Hauke Mehrtens <hauke@hauke-m.de>
>  M:	Rafał Miłecki <zajec5@gmail.com>
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
> index 747c6cf1d795e..b734e882f63c9 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -46,4 +46,6 @@ source "drivers/staging/media/ipu3/Kconfig"
>  
>  source "drivers/staging/media/rkisp1/Kconfig"
>  
> +source "drivers/staging/media/bcm2835-unicam/Kconfig"
> +
>  endif
> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
> index b59571826ba69..93d819ef243f1 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_VIDEO_ALLEGRO_DVT)	+= allegro-dvt/
>  obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
> +obj-$(CONFIG_VIDEO_BCM2835_UNICAM)	+= bcm2835-unicam/
>  obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
>  obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
>  obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
> diff --git a/drivers/staging/media/bcm2835-unicam/Kconfig b/drivers/staging/media/bcm2835-unicam/Kconfig
> new file mode 100644
> index 0000000000000..bd13701996509
> --- /dev/null
> +++ b/drivers/staging/media/bcm2835-unicam/Kconfig
> @@ -0,0 +1,21 @@
> +# Broadcom VideoCore4 V4L2 camera support
> +
> +config VIDEO_BCM2835_UNICAM
> +	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
> +	depends on VIDEO_V4L2
> +	depends on ARCH_BCM2835 || COMPILE_TEST
> +	select VIDEO_V4L2_SUBDEV_API
> +	select MEDIA_CONTROLLER
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_FWNODE
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
> diff --git a/drivers/staging/media/bcm2835-unicam/Makefile b/drivers/staging/media/bcm2835-unicam/Makefile
> new file mode 100644
> index 0000000000000..a98aba03598ab
> --- /dev/null
> +++ b/drivers/staging/media/bcm2835-unicam/Makefile
> @@ -0,0 +1,3 @@
> +# Makefile for BCM2835 Unicam driver
> +
> +obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
> diff --git a/drivers/staging/media/bcm2835-unicam/bcm2835-unicam.c b/drivers/staging/media/bcm2835-unicam/bcm2835-unicam.c
> new file mode 100644
> index 0000000000000..3e365baa8197f
> --- /dev/null
> +++ b/drivers/staging/media/bcm2835-unicam/bcm2835-unicam.c
> @@ -0,0 +1,2750 @@
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
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-dv-timings.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "vc4-regs-unicam.h"
> +
> +#define UNICAM_MODULE_NAME	"unicam"
> +#define UNICAM_VERSION		"0.1.0"
> +
> +/*
> + * Unicam must request a minimum of 250Mhz from the VPU clock.
> + * Otherwise the input FIFOs overrun and cause image corruption.
> + */
> +#define MIN_VPU_CLOCK_RATE (250 * 1000 * 1000)
> +/*
> + * To protect against a dodgy sensor driver never returning an error from
> + * enum_mbus_code, set a maximum index value to be used.
> + */
> +#define MAX_ENUM_MBUS_CODE	128

Please remove, and instead fix the buggy sensor drivers.

> +
> +/*
> + * Stride is a 16 bit register, but also has to be a multiple of 32.
> + */
> +#define BPL_ALIGNMENT		32
> +#define MAX_BYTESPERLINE	((1 << 16) - BPL_ALIGNMENT)
> +/*
> + * Max width is therefore determined by the max stride divided by
> + * the number of bits per pixel. Take 32bpp as a
> + * worst case.
> + * No imposed limit on the height, so adopt a square image for want
> + * of anything better.
> + */
> +#define MAX_WIDTH		(MAX_BYTESPERLINE / 4)
> +#define MAX_HEIGHT		MAX_WIDTH
> +/* Define a nominal minimum image size */
> +#define MIN_WIDTH		16
> +#define MIN_HEIGHT		16
> +
> +/*
> + * Size of the dummy buffer. Can be any size really, but the DMA
> + * allocation works in units of page sizes.
> + */
> +#define DUMMY_BUF_SIZE		(PAGE_SIZE)
> +
> +/* Enumeration of the video device node identifiers. */
> +enum unicam_node_ids {
> +	IMAGE_NODE,
> +	METADATA_NODE,
> +	MAX_NODES
> +};
> +
> +/*
> + * Associate video device nodes with the subdevice's source pad ids.
> + * The image video device is connected to the subdevice pad #0;
> + * The metadata video device is connected to the subdevice pad #1;
> + */
> +unsigned int subdev_pads[2] = {
> +	[IMAGE_NODE]	= 0,
> +	[METADATA_NODE]	= 1,
> +};

I recognise this and the above enum are used for different purpose, but
this is also entirely useless. At the very least make it static.

> +
> +/*
> + * struct unicam_fmt - Unicam media bus format information
> + * @pixelformat: V4L2 pixel format FCC identifier. 0 if n/a.
> + * @repacked_fourcc: V4L2 pixel format FCC identifier if the data is expanded
> + * out to 16bpp. 0 if n/a.
> + * @code: V4L2 media bus format code.
> + * @depth: Bits per pixel as delivered from the source.
> + * @csi_dt: CSI data type.
> + * @check_variants: Flag to denote that there are multiple mediabus formats
> + *		still in the list that could match this V4L2 format.
> + */
> +struct unicam_fmt {
> +	u32	fourcc;
> +	u32	repacked_fourcc;
> +	u32	code;
> +	u8	depth;
> +	u8	csi_dt;
> +	u8	check_variants;
> +};
> +
> +static const struct unicam_fmt formats[] = {
> +	/* YUV Formats */
> +	{
> +		.fourcc		= V4L2_PIX_FMT_YUYV,
> +		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
> +		.depth		= 16,
> +		.csi_dt		= 0x1e,
> +		.check_variants = 1,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_UYVY,
> +		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
> +		.depth		= 16,
> +		.csi_dt		= 0x1e,
> +		.check_variants = 1,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_YVYU,
> +		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
> +		.depth		= 16,
> +		.csi_dt		= 0x1e,
> +		.check_variants = 1,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_VYUY,
> +		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
> +		.depth		= 16,
> +		.csi_dt		= 0x1e,
> +		.check_variants = 1,
> +	}, {
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
> +		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
> +		.depth		= 16,
> +		.csi_dt		= 0x22,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_RGB565X, /* rrrrrggg gggbbbbb */
> +		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
> +		.depth		= 16,
> +		.csi_dt		= 0x22
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_RGB555, /* gggbbbbb arrrrrgg */
> +		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE,
> +		.depth		= 16,
> +		.csi_dt		= 0x21,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_RGB555X, /* arrrrrgg gggbbbbb */
> +		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE,
> +		.depth		= 16,
> +		.csi_dt		= 0x21,
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
> +		.fourcc		= V4L2_PIX_FMT_RGB32, /* argb */
> +		.code		= MEDIA_BUS_FMT_ARGB8888_1X32,
> +		.depth		= 32,
> +		.csi_dt		= 0x0,
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
> +		.repacked_fourcc = V4L2_PIX_FMT_SBGGR10,
> +		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.depth		= 10,
> +		.csi_dt		= 0x2b,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGBRG10P,
> +		.repacked_fourcc = V4L2_PIX_FMT_SGBRG10,
> +		.code		= MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.depth		= 10,
> +		.csi_dt		= 0x2b,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGRBG10P,
> +		.repacked_fourcc = V4L2_PIX_FMT_SGRBG10,
> +		.code		= MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.depth		= 10,
> +		.csi_dt		= 0x2b,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SRGGB10P,
> +		.repacked_fourcc = V4L2_PIX_FMT_SRGGB10,
> +		.code		= MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.depth		= 10,
> +		.csi_dt		= 0x2b,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SBGGR12P,
> +		.repacked_fourcc = V4L2_PIX_FMT_SBGGR12,
> +		.code		= MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.depth		= 12,
> +		.csi_dt		= 0x2c,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGBRG12P,
> +		.repacked_fourcc = V4L2_PIX_FMT_SGBRG12,
> +		.code		= MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.depth		= 12,
> +		.csi_dt		= 0x2c,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGRBG12P,
> +		.repacked_fourcc = V4L2_PIX_FMT_SGRBG12,
> +		.code		= MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.depth		= 12,
> +		.csi_dt		= 0x2c,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SRGGB12P,
> +		.repacked_fourcc = V4L2_PIX_FMT_SRGGB12,
> +		.code		= MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.depth		= 12,
> +		.csi_dt		= 0x2c,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SBGGR14P,
> +		.code		= MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.depth		= 14,
> +		.csi_dt		= 0x2d,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGBRG14P,
> +		.code		= MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.depth		= 14,
> +		.csi_dt		= 0x2d,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SGRBG14P,
> +		.code		= MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.depth		= 14,
> +		.csi_dt		= 0x2d,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_SRGGB14P,
> +		.code		= MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.depth		= 14,
> +		.csi_dt		= 0x2d,
> +	}, {
> +	/*
> +	 * 16 bit Bayer formats could be supported, but there is no CSI2
> +	 * data_type defined for raw 16, and no sensors that produce it at
> +	 * present.
> +	 */
> +
> +	/* Greyscale formats */
> +		.fourcc		= V4L2_PIX_FMT_GREY,
> +		.code		= MEDIA_BUS_FMT_Y8_1X8,
> +		.depth		= 8,
> +		.csi_dt		= 0x2a,
> +	}, {
> +		.fourcc		= V4L2_PIX_FMT_Y10P,
> +		.repacked_fourcc = V4L2_PIX_FMT_Y10,
> +		.code		= MEDIA_BUS_FMT_Y10_1X10,
> +		.depth		= 10,
> +		.csi_dt		= 0x2b,
> +	}, {
> +		/* NB There is no packed V4L2 fourcc for this format. */
> +		.repacked_fourcc = V4L2_PIX_FMT_Y12,
> +		.code		= MEDIA_BUS_FMT_Y12_1X12,
> +		.depth		= 12,
> +		.csi_dt		= 0x2c,
> +	},
> +	/* Embedded data format */
> +	{
> +		.fourcc		= V4L2_META_FMT_SENSOR_DATA,
> +		.code		= MEDIA_BUS_FMT_CUSTOM_SENSOR_DATA,
> +		.depth		= 8,
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
> +	int open;
> +	bool streaming;
> +	unsigned int node_id;
> +	/* Pointer pointing to current v4l2_buffer */
> +	struct unicam_buffer *cur_frm;
> +	/* Pointer pointing to next v4l2_buffer */
> +	struct unicam_buffer *next_frm;
> +	/* video capture */
> +	const struct unicam_fmt *fmt;
> +	/* Used to store current pixel format */
> +	struct v4l2_format v_fmt;
> +	/* Used to store current mbus frame format */
> +	struct v4l2_mbus_framefmt m_fmt;
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
> +	/*
> +	 * Dummy buffer intended to be used by unicam
> +	 * if we have no other queued buffers to swap to.
> +	 */
> +	void *dummy_buf_cpu_addr;
> +	dma_addr_t dummy_buf_dma_addr;
> +};
> +
> +struct unicam_device {
> +	struct device *dev;
> +
> +	/* V4l2 specific parameters */
> +	struct v4l2_async_subdev asd;
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
> +	/* subdevice async Notifier */
> +	struct v4l2_async_notifier notifier;
> +	unsigned int sequence;
> +
> +	/* ptr to  sub device */
> +	struct v4l2_subdev *sensor;
> +	/* Pad config for the sensor */
> +	struct v4l2_subdev_pad_config *sensor_config;
> +
> +	enum v4l2_mbus_type bus_type;
> +	/*
> +	 * Stores bus.mipi_csi2.flags for CSI2 sensors, or
> +	 * bus.mipi_csi1.strobe for CCP2.
> +	 */
> +	unsigned int bus_flags;
> +	unsigned int max_data_lanes;
> +	unsigned int active_data_lanes;
> +
> +	struct unicam_node node[MAX_NODES];
> +	struct v4l2_ctrl_handler ctrl_handler;
> +};
> +
> +static inline struct unicam_device *
> +to_unicam_device(struct v4l2_device *v4l2_dev)
> +{
> +	return container_of(v4l2_dev, struct unicam_device, v4l2_dev);
> +}
> +
> +static char *print_fourcc(u32 fmt)
> +{
> +	static char code[16];
> +
> +	code[0] = (unsigned char)(fmt & 0xff);
> +	code[1] = (unsigned char)((fmt >> 8) & 0xff);
> +	code[2] = (unsigned char)((fmt >> 16) & 0xff);
> +	code[3] = (unsigned char)((fmt >> 24) & 0xff);
> +	snprintf(&code[4], 12, "=0x%8x", fmt);

Ugh. Hopefully we'll have %p4cc soon. It's not yet merged at least. :-\

The rest looks fairly normal, apart from the obvious lack of MC support
from a driver that supports embedded data (also a TODO item).

-- 
Kind regards,

Sakari Ailus

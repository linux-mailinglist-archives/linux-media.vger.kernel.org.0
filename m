Return-Path: <linux-media+bounces-6080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC2A86AF71
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 13:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F14AE1C23A10
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 12:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFFB14A081;
	Wed, 28 Feb 2024 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="miZYBRsw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65A573522;
	Wed, 28 Feb 2024 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709124628; cv=none; b=SXavcCL6BQsD8NMyEVmfdujBAFUkg1/j6I9JgwDK0tKxfW8+dbxv4UYRQ6g+Va04W5n7E+xCVYyrvQChwj14h4a5y66yPHO9C1HEVkFtiNN6/urVYLYgqqyEg1g9TvijGXP3RfRUF3KBOscIgkpj0B9HrACxvX0/x0b1/O8GcOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709124628; c=relaxed/simple;
	bh=UlwOMaciPjr38cxWtLg5gALX4lZqDrgx342HsLimBjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OabvhRQSN3dHqQ3n4KWt4T0t0jsOGBSIIE1Di8uEXlP/HW8cLvjkLgrHtXKX5n8SoaG7QK9KK36HnjW2s1brbW7dNyqQQmaCull6wMARxy838avCgtgYA8m3Gptdcl8/AGiNes+VEdzRt4jMopi0+SW0m4EffDLgBL0rRKSmQiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=miZYBRsw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E927673;
	Wed, 28 Feb 2024 13:50:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709124604;
	bh=UlwOMaciPjr38cxWtLg5gALX4lZqDrgx342HsLimBjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=miZYBRswNXxMNtFfln4Ohd6usJqnO9/CmRPLM794gv2CAOvnEUY/88+AaJ8Qmvpko
	 1Bqq5Wpw4g4lBNKr7IJejJu6fYt5LQ05QmCOWr0mD3Hpy2+v7py/9c0N4gPUD6aNAw
	 h/O7Xud3HruqubSZcFZxOqNnMqkhGy5yC1GMN1jQ=
Date: Wed, 28 Feb 2024 13:50:14 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jerome.forissier@linaro.org, 
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 3/5] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <mylttlhcnxe5e37m2ar6xgtus6dbr56teyyp74qm7l2d3wejwv@ewpbhpjr3v4m>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-4-dan.scally@ideasonboard.com>
 <ZdxwE3omXmUjfLMn@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZdxwE3omXmUjfLMn@valkosipuli.retiisi.eu>

Hi Sakari

On Mon, Feb 26, 2024 at 11:03:47AM +0000, Sakari Ailus wrote:
> Hi Daniel,
>
> Thanks for the set.
>
> How do you determine which buffers go together on the video buffer queues?
> Or do you need a buffer on both for every frame if the nodes are set
> streaming?
>
> This should be also documented, in the documentation patch. At least I
> didn't find it there.
>
> On Wed, Feb 14, 2024 at 02:19:04PM +0000, Daniel Scally wrote:
> > Add a driver for Arm's Mali-C55 Image Signal Processor. The driver is
> > V4L2 and Media Controller compliant and creates subdevices to manage
> > the ISP itself, its internal test pattern generator as well as the
> > crop, scaler and output format functionality for each of its two
> > output devices.
> >
> > Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> > Changes in v2:
> >
> > 	- Clock handling
> > 	- Fixed the warnings raised by the kernel test robot
> >
> >  drivers/media/platform/Kconfig                |    1 +
> >  drivers/media/platform/Makefile               |    1 +
> >  drivers/media/platform/arm/Kconfig            |    5 +
> >  drivers/media/platform/arm/Makefile           |    2 +
> >  drivers/media/platform/arm/mali-c55/Kconfig   |   18 +
> >  drivers/media/platform/arm/mali-c55/Makefile  |    9 +
> >  .../platform/arm/mali-c55/mali-c55-capture.c  | 1021 +++++++++++++++++
> >  .../platform/arm/mali-c55/mali-c55-common.h   |  271 +++++
> >  .../platform/arm/mali-c55/mali-c55-core.c     |  767 +++++++++++++
> >  .../platform/arm/mali-c55/mali-c55-isp.c      |  682 +++++++++++
> >  .../arm/mali-c55/mali-c55-registers.h         |  180 +++
> >  .../arm/mali-c55/mali-c55-resizer-coefs.h     |  382 ++++++
> >  .../platform/arm/mali-c55/mali-c55-resizer.c  |  678 +++++++++++
> >  .../platform/arm/mali-c55/mali-c55-tpg.c      |  425 +++++++
> >  14 files changed, 4442 insertions(+)
> >  create mode 100644 drivers/media/platform/arm/Kconfig
> >  create mode 100644 drivers/media/platform/arm/Makefile
> >  create mode 100644 drivers/media/platform/arm/mali-c55/Kconfig
> >  create mode 100644 drivers/media/platform/arm/mali-c55/Makefile
> >  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-capture.c
> >  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-common.h
> >  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-core.c
> >  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> >  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> >  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer-coefs.h
> >  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> >  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
> >
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index 91e54215de3a..cd92c024e039 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -65,6 +65,7 @@ config VIDEO_MUX
> >  source "drivers/media/platform/allegro-dvt/Kconfig"
> >  source "drivers/media/platform/amlogic/Kconfig"
> >  source "drivers/media/platform/amphion/Kconfig"
> > +source "drivers/media/platform/arm/Kconfig"
> >  source "drivers/media/platform/aspeed/Kconfig"
> >  source "drivers/media/platform/atmel/Kconfig"
> >  source "drivers/media/platform/cadence/Kconfig"
> > diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> > index 3296ec1ebe16..ea6624c62559 100644
> > --- a/drivers/media/platform/Makefile
> > +++ b/drivers/media/platform/Makefile
> > @@ -8,6 +8,7 @@
> >  obj-y += allegro-dvt/
> >  obj-y += amlogic/
> >  obj-y += amphion/
> > +obj-y += arm/
> >  obj-y += aspeed/
> >  obj-y += atmel/
> >  obj-y += cadence/
> > diff --git a/drivers/media/platform/arm/Kconfig b/drivers/media/platform/arm/Kconfig
> > new file mode 100644
> > index 000000000000..4f0764c329c7
> > --- /dev/null
> > +++ b/drivers/media/platform/arm/Kconfig
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +comment "ARM media platform drivers"
> > +
> > +source "drivers/media/platform/arm/mali-c55/Kconfig"
> > diff --git a/drivers/media/platform/arm/Makefile b/drivers/media/platform/arm/Makefile
> > new file mode 100644
> > index 000000000000..8cc4918725ef
> > --- /dev/null
> > +++ b/drivers/media/platform/arm/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-y += mali-c55/
> > diff --git a/drivers/media/platform/arm/mali-c55/Kconfig b/drivers/media/platform/arm/mali-c55/Kconfig
> > new file mode 100644
> > index 000000000000..602085e28b01
> > --- /dev/null
> > +++ b/drivers/media/platform/arm/mali-c55/Kconfig
> > @@ -0,0 +1,18 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config VIDEO_MALI_C55
> > +	tristate "ARM Mali-C55 Image Signal Processor driver"
> > +	depends on V4L_PLATFORM_DRIVERS
> > +	depends on VIDEO_DEV && OF
> > +	depends on ARCH_VEXPRESS || COMPILE_TEST
> > +	select MEDIA_CONTROLLER
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	select VIDEOBUF2_DMA_CONTIG
> > +	select VIDEOBUF2_VMALLOC
> > +	select V4L2_FWNODE
> > +	select GENERIC_PHY_MIPI_DPHY
> > +	default n
> > +	help
> > +	  Enable this to support Arm's Mali-C55 Image Signal Processor.
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called mali-c55.
> > diff --git a/drivers/media/platform/arm/mali-c55/Makefile b/drivers/media/platform/arm/mali-c55/Makefile
> > new file mode 100644
> > index 000000000000..77dcb2fbf0f4
> > --- /dev/null
> > +++ b/drivers/media/platform/arm/mali-c55/Makefile
> > @@ -0,0 +1,9 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +mali-c55-y := mali-c55-capture.o \
> > +	      mali-c55-core.o \
> > +	      mali-c55-isp.o \
> > +	      mali-c55-tpg.o \
> > +	      mali-c55-resizer.o
> > +
> > +obj-$(CONFIG_VIDEO_MALI_C55) += mali-c55.o
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
> > new file mode 100644
> > index 000000000000..98020b7ecb1e
> > --- /dev/null
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
> > @@ -0,0 +1,1021 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * ARM Mali-C55 ISP Driver - Video capture devices
> > + *
> > + * Copyright (C) 2023 Ideas on Board Oy
>
> 2024
>
> > + */
> > +
> > +#include <linux/minmax.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/string.h>
> > +#include <linux/videodev2.h>
> > +
> > +#include <media/v4l2-dev.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/v4l2-subdev.h>
> > +#include <media/videobuf2-core.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +
> > +#include "mali-c55-common.h"
> > +#include "mali-c55-registers.h"
> > +
> > +/*
> > + * The Mali-C55 ISP has up to two output pipes; known as full resolution and
> > + * down scaled. The register space for these is laid out identically, but offset
> > + * by 372 bytes.
> > + */
> > +#define MALI_C55_CAP_DEV_FR_REG_OFFSET		0x0
> > +#define MALI_C55_CAP_DEV_DS_REG_OFFSET		0x174
> > +
> > +static const struct mali_c55_fmt mali_c55_fmts[] = {
> > +	/*
> > +	 * This table is missing some entries which need further work or
> > +	 * investigation:
> > +	 *
> > +	 * Base mode 1 is a backwards V4L2_PIX_FMT_XRGB32 with no V4L2 equivalent
> > +	 * Base mode 5 is "Generic Data"
> > +	 * Base mode 8 is a backwards V4L2_PIX_FMT_XYUV32 - no V4L2 equivalent
> > +	 * Base mode 9 seems to have no V4L2 equivalent
> > +	 * Base mode 17, 19 and 20 describe formats which seem to have no V4L2
> > +	 * equivalent
> > +	 */
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_ARGB2101010,
> > +		.mbus_codes = {
> > +			MEDIA_BUS_FMT_RGB121212_1X36,
> > +			MEDIA_BUS_FMT_RGB202020_1X60,
> > +		},
> > +		.enumerate = true,
> > +		.is_raw = false,
> > +		.registers = {
> > +			.base_mode = MALI_C55_OUTPUT_A2R10G10B10,
> > +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
> > +		}
> > +	},
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_RGB565,
> > +		.mbus_codes = {
> > +			MEDIA_BUS_FMT_RGB121212_1X36,
> > +			MEDIA_BUS_FMT_RGB202020_1X60,
> > +		},
> > +		.enumerate = false,
> > +		.is_raw = false,
> > +		.registers = {
> > +			.base_mode = MALI_C55_OUTPUT_RGB565,
> > +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
> > +		}
> > +	},
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_BGR24,
> > +		.mbus_codes = {
> > +			MEDIA_BUS_FMT_RGB121212_1X36,
> > +			MEDIA_BUS_FMT_RGB202020_1X60,
> > +		},
> > +		.enumerate = false,
> > +		.is_raw = false,
> > +		.registers = {
> > +			.base_mode = MALI_C55_OUTPUT_RGB24,
> > +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
> > +		}
> > +	},
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_YUYV,
> > +		.mbus_codes = {
> > +			MEDIA_BUS_FMT_YUV10_1X30,
> > +		},
> > +		.enumerate = true,
> > +		.is_raw = false,
> > +		.registers = {
> > +			.base_mode = MALI_C55_OUTPUT_YUY2,
> > +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
> > +		}
> > +	},
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_UYVY,
> > +		.mbus_codes = {
> > +			MEDIA_BUS_FMT_YUV10_1X30,
> > +		},
> > +		.enumerate = false,
> > +		.is_raw = false,
> > +		.registers = {
> > +			.base_mode = MALI_C55_OUTPUT_UYVY,
> > +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
> > +		}
> > +	},
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_Y210,
> > +		.mbus_codes = {
> > +			MEDIA_BUS_FMT_YUV10_1X30,
> > +		},
> > +		.enumerate = false,
> > +		.is_raw = false,
> > +		.registers = {
> > +			.base_mode = MALI_C55_OUTPUT_Y210,
> > +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
> > +		}
> > +	},
> > +	/*
> > +	 * This is something of a hack, the ISP thinks it's running NV12M but
> > +	 * by setting uv_plane = 0 we simply discard that planes and only output
> > +	 * the Y-plane.
> > +	 */
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_GREY,
> > +		.mbus_codes = {
> > +			MEDIA_BUS_FMT_YUV10_1X30,
> > +		},
> > +		.enumerate = false,
> > +		.is_raw = false,
> > +		.registers = {
> > +			.base_mode = MALI_C55_OUTPUT_NV12_21,
> > +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
> > +		}
> > +	},
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_NV12M,
> > +		.mbus_codes = {
> > +			MEDIA_BUS_FMT_YUV10_1X30,
> > +		},
> > +		.enumerate = false,
> > +		.is_raw = false,
> > +		.registers = {
> > +			.base_mode = MALI_C55_OUTPUT_NV12_21,
> > +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT1
> > +		}
> > +	},
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_NV21M,
> > +		.mbus_codes = {
> > +			MEDIA_BUS_FMT_YUV10_1X30,
> > +		},
> > +		.enumerate = false,
> > +		.is_raw = false,
> > +		.registers = {
> > +			.base_mode = MALI_C55_OUTPUT_NV12_21,
> > +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT2
> > +		}
> > +	},
> > +	/*
> > +	 * RAW uncompressed formats are all packed in 16 bpp.
> > +	 * TODO: Expand this list to encompass all possible RAW formats.
> > +	 */
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_SRGGB12,
> > +		.mbus_codes = {
> > +			MEDIA_BUS_FMT_SRGGB12_1X12,
> > +		},
> > +		.enumerate = true,
> > +		.is_raw = true,
> > +		.registers = {
> > +			.base_mode = MALI_C55_OUTPUT_RAW16,
> > +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
> > +		}
> > +	},
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_SBGGR12,
> > +		.mbus_codes = {
> > +			MEDIA_BUS_FMT_SBGGR12_1X12,
> > +		},
> > +		.enumerate = true,
> > +		.is_raw = true,
> > +		.registers = {
> > +			.base_mode = MALI_C55_OUTPUT_RAW16,
> > +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
> > +		}
> > +	},
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_SGBRG12,
> > +		.mbus_codes = {
> > +			MEDIA_BUS_FMT_SGBRG12_1X12,
> > +		},
> > +		.enumerate = true,
> > +		.is_raw = true,
> > +		.registers = {
> > +			.base_mode = MALI_C55_OUTPUT_RAW16,
> > +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
> > +		}
> > +	},
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_SGRBG12,
> > +		.mbus_codes = {
> > +			MEDIA_BUS_FMT_SGRBG12_1X12,
> > +		},
> > +		.enumerate = true,
> > +		.is_raw = true,
> > +		.registers = {
> > +			.base_mode = MALI_C55_OUTPUT_RAW16,
> > +			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
> > +		}
> > +	},
> > +};
> > +
> > +static bool mali_c55_mbus_code_can_produce_fmt(const struct mali_c55_fmt *fmt,
> > +					       u32 code)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(fmt->mbus_codes); i++) {
> > +		if (fmt->mbus_codes[i] == code)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +const struct mali_c55_fmt *mali_c55_cap_fmt_next(const struct mali_c55_fmt *fmt,
> > +						 bool allow_raw, bool unique)
> > +{
> > +	if (!fmt)
> > +		fmt = &mali_c55_fmts[0];
> > +	else
> > +		++fmt;
>
> fmt++, please.
>

Can I ask why ? (here and in the next occurrences you have reported)


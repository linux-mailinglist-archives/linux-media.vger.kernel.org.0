Return-Path: <linux-media+bounces-15715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2994394517B
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 19:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2431F2309A
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 17:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54CD1B9B4F;
	Thu,  1 Aug 2024 17:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FoPDgSMF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F294A1B9B46;
	Thu,  1 Aug 2024 17:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722533334; cv=none; b=PBS0NSzjuyPtIPdLV15xaa8Hy7c6GwD/sfagKqxtVZemdPIYEmaNXTj45OcIjh/9mDypH2fSUP98qgAQTJTHXp9/ApJemU/FW3X9g7INMWZF7l1k2s+qCVN3O4aW5eYS9nrUtjz75Rx7Sl2Gpl5XAwRE98JLz1DzR47Tx/VeDkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722533334; c=relaxed/simple;
	bh=d5udCHacAjsMJb7iE7xxoM7jGnOYTtEpHuwj1KwyM9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyPFOzq2CvciGn5zOtgSiQBkIXvBM2x7qNFdEb17sj8Aje9ETFWOBcALPrLgA2Clb9fktkUQmB3OEKvRpjtEddWSY6qgt5XJM0JZeAipN8BJ4P8OAb8ouqYPLILv+y85kssSiXjaT0pYDhQ1NpPYHYhS5+mHCCIYupqlnT+6Q1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FoPDgSMF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43D7E667;
	Thu,  1 Aug 2024 19:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722533280;
	bh=d5udCHacAjsMJb7iE7xxoM7jGnOYTtEpHuwj1KwyM9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FoPDgSMFYTww5UbOwPvkmOILlwVDdqD28ppMpEdX18R4suLK+nM+PDH9t0mCFegoL
	 cNJOvAsGq6uwu3vnjh6x8PYGSYTG3Qoh6U6qnGTiaT7tnaqA6BoF16cAy++lsA0mw5
	 Ud8yW1hSo3gfLunvsxtWXBOi4Clcd7h/jwnRHgGk=
Date: Thu, 1 Aug 2024 20:28:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: yuji2.ishikawa@toshiba.co.jp
Cc: hverkuil@xs4all.nl, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
	sakari.ailus@linux.intel.com, nobuhiro1.iwamatsu@toshiba.co.jp,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/6] media: platform: visconti: Add Toshiba Visconti
 Video Input Interface driver
Message-ID: <20240801172827.GB18732@pendragon.ideasonboard.com>
References: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
 <20240709000848.1108788-4-yuji2.ishikawa@toshiba.co.jp>
 <20240722220815.GA9047@pendragon.ideasonboard.com>
 <OSZPR01MB9427EDDADF59D6061DDF1DD492B22@OSZPR01MB9427.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OSZPR01MB9427EDDADF59D6061DDF1DD492B22@OSZPR01MB9427.jpnprd01.prod.outlook.com>

Hi Ishikawa-san,

Sakari, there's a question for you below.

On Thu, Aug 01, 2024 at 09:27:14AM +0000, yuji2.ishikawa@toshiba.co.jp wrote:
> On Tuesday, July 23, 2024 7:08 AM, Laurent Pinchart wrote:
> > On Tue, Jul 09, 2024 at 09:08:45AM +0900, Yuji Ishikawa wrote:
> > > Add support to Video Input Interface on Toshiba Visconti ARM SoCs.
> > > The interface device includes CSI2 Receiver,
> > > frame grabber, video DMAC and image signal processor.
> > >
> > > A driver instance provides three /dev/videoX device files;
> > > one for RGB image capture, another one for optional RGB capture
> > > with different parameters and the last one for RAW capture.
> > >
> > > Through the device files, the driver provides streaming interface.
> > > Both DMABUF and MMAP operations are supported.
> > > A userland application should feed phisically continuous
> > 
> > s/phisically/physically/
> > s/continuous/contiguous/ (I often mistype them too)
> > 
> > Maybe you could write "DMA-contiguous" as there's an IOMMU as far as I
> > understand (even if it's not supported yet).
> 
> I'll fix them.
> 
> > > DMA-BUF instances as capture buffers.
> > >
> > > The driver is based on media controller framework.
> > > Its operations are roughly mapped to three subdrivers;
> > > CSI2 receiver subdevice, ISP subdevice and capture devices.
> > >
> > > The Video DMACs have 32bit address space
> > > and currently corresponding IOMMU driver is not provided.
> > > Therefore, memory-block address for captured image is 32bit IOVA
> > > which is equal to 32bit-truncated phisical address.
> > > When the Visconti IOMMU driver (currently under development) is accepted,
> > > the hardware layer will use 32bit IOVA mapped by the attached IOMMU.
> > >
> > > Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> > > ---
> > > Changelog v2:
> > > - Resend v1 because a patch exceeds size limit.
> > >
> > > Changelog v3:
> > > - Adapted to media control framework
> > > - Introduced ISP subdevice, capture device
> > > - Remove private IOCTLs and add vendor specific V4L2 controls
> > > - Change function name avoiding camelcase and uppercase letters
> > >
> > > Changelog v4:
> > > - fix style problems at the v3 patch
> > > - remove "index" member
> > > - update example
> > > - Split patches because the v3 patch exceeds size limit
> > > - Stop using ID number to identify driver instance:
> > >   - Use dynamically allocated structure to hold driver's context,
> > >     instead of static one indexed by ID number.
> > >   - internal functions accept context structure instead of ID number.
> > > - Use pm_runtime to trigger initialization of HW
> > >   along with open/close of device files.
> > >
> > > Changelog v5:
> > > - Fix coding style problems in viif.c
> > >
> > > Changelog v6:
> > > - update dependency description of Kconfig
> > > - bugfix: usage of buffer pointed with dma_active
> > > - remove unused macros
> > > - add viif_common.c for commonly used register buffer control routine
> > > - add initialization of Bus Controller (HWAIF) and Memory Protection Unit
> > > - removed hwd_ and HWD_ prefix
> > > - update source code documentation
> > > - Suggestion from Hans Verkuil
> > >   - pointer to userland memory is removed from uAPI arguments
> > >     - style of structure is now "nested" instead of "chained by pointer";
> > >   - use div64_u64 for 64bit division
> > >   - define Visconti specific control IDs in v4l2-controls.h
> > >   - set proper initial size to v4l2_ctrl_handler_init()
> > >   - set all buffers to QUEUED state on an error at start_streaming
> > >   - use vb2_is_busy() instead of vb2_is_streaming()
> > >   - add parameter check for s->type and s->target in get_selection()
> > >   - remove ioctls related to DV format and EDID
> > >   - release v4l2 fh instance on and error at opening device file
> > >   - support VB2_MMAP mode for streaming operation
> > >   - add initial value to each vendor specific control
> > >   - GET_LAST_CAPTURE_STATUS control is updated asyncnously from workqueue
> > >   - applied v4l2-compliance
> > > - Suggestion from Sakari Ailus
> > >   - use div64_u64 for 64bit division
> > >   - update copyright's year
> > >   - use common definition of MIPI CSI2 DataTypes
> > >   - remove redandunt cast
> > >   - use bool instead of HWD_VIIF_ENABLE/DISABLE
> > >   - simplify comparison to 0
> > >   - simplify statements with trigram operator
> > >   - remove redundant local variables
> > >   - simplify timeout loop
> > >   - use general integer types instead of u32/s32
> > > - Suggestion from Laurent Pinchart
> > >   - moved VIIF driver to driver/platform/toshiba/visconti
> > >   - add CSI2RX subdevice
> > >   - change register access: struct-style to macro-style
> > >   - use common definition of MIPI CSI2 DataTypes
> > >   - Kconfig: add SPDX header, add V4L2_ASYNC
> > >   - remove unused type definitions
> > >   - define enums instead of successive macro constants
> > >   - remove redundant parenthesis of macro constant
> > >   - embed struct hwd_res into struct viif_device
> > >   - turn switch-case into table lookup
> > >   - use xxx_dma instead of xxx_paddr for variable names of IOVA
> > >   - literal value: just 0 instead of 0x0
> > >   - use literal 1 or 0 instead of HWD_VIIF_ENABLE, DISABLE for register access
> > >   - use true or false instead of HWD_VIIF_ENABLE, DISABLE for function calls
> > >   - remove ioctl request handlers which refers subdevices
> > >
> > > Changelog v7:
> > > - change compatible string to visconti5-viif
> > > - remove unused variables
> > > - set static to internal functions
> > > - Suggestion from kernel test robot <lkp@intel.com>
> > >   - update references to headers
> > >
> > > Changelog v8:
> > > - bugfix: handling return value of visconti_viiif_parse_dt()
> > > - add visconti_viif_subdev_notifier_register() to gather
> > >   all operations around v4l2_async_notifier
> > > - update for v6.6-rc2
> > >   - use v4l2_async_connection instead of v4l2_async_subdev
> > >   - aid for devices using subdev active state
> > > - add __maybe_unused for runtime_pm callbacks
> > > - Suggestion from Krzysztof Kozlowski
> > >   - use static initialization of local variable
> > >   - use dev_err_probe()
> > >   - remove error message for DMA memory allocation failure
> > >   - remove unused comment messages
> > >   - add error handling at fail of workqueue_create()
> > >   - remove redundant mutex for pm_runtime callback routines
> > > - Suggestion from Hans Verkuil
> > >   - remove pr_info() calls
> > >   - build check with media_stage.git
> > >   - some lacks for kerneldoc description
> > >
> > > Changelog v9:
> > > - applied sparse checker
> > >   - add static qualifier to a file scoped local variable
> > >   - expand functions for acquiring/releasing locks
> > > - bugfix: use NULL (instead of 0) for pad::get_fmt subdevice API
> > > - fix warnings for cast between ptr and dma_addr_t
> > > - call div64_u64 for 64bit division
> > > - rebase to media_staging tree; update Visconti specific control IDs
> > >
> > > Changelog v10:
> > > - remove vendor specific compound controls
> > > - remove "rawpack mode" flag
> > >   - RAW16, RAW18, RAW20 (to be implemented and tested) should be used instead
> > > - catch up to v6.9-rc4
> > >
> > > Changelog v11:
> > > - stop merging sensor's controls to capture device's
> > > - remove redundant parameter checkings
> > > - update routines handling crop/compose rects of the ISP subdevice
> > > - update kerneldoc comments
> > > - update copyright year
> > >
> > >  drivers/media/platform/Kconfig                |    1 +
> > >  drivers/media/platform/Makefile               |    1 +
> > >  drivers/media/platform/toshiba/Kconfig        |    6 +
> > >  drivers/media/platform/toshiba/Makefile       |    2 +
> > >  .../media/platform/toshiba/visconti/Kconfig   |   19 +
> > >  .../media/platform/toshiba/visconti/Makefile  |    8 +
> > >  .../media/platform/toshiba/visconti/viif.c    |  627 ++++++
> > >  .../media/platform/toshiba/visconti/viif.h    |  393 ++++
> > >  .../platform/toshiba/visconti/viif_capture.c  | 1431 ++++++++++++
> > >  .../platform/toshiba/visconti/viif_capture.h  |   21 +
> > >  .../platform/toshiba/visconti/viif_common.c   |  239 ++
> > >  .../platform/toshiba/visconti/viif_common.h   |   42 +
> > >  .../platform/toshiba/visconti/viif_csi2rx.c   |  657 ++++++
> > >  .../platform/toshiba/visconti/viif_csi2rx.h   |   24 +
> > >  .../toshiba/visconti/viif_csi2rx_regs.h       |  102 +
> > >  .../platform/toshiba/visconti/viif_isp.c      | 1183 ++++++++++
> > >  .../platform/toshiba/visconti/viif_isp.h      |   24 +
> > >  .../platform/toshiba/visconti/viif_regs.h     |  721 +++++++
> > >  include/uapi/linux/visconti_viif.h            | 1921 +++++++++++++++++
> > >  19 files changed, 7422 insertions(+)
> > >  create mode 100644 drivers/media/platform/toshiba/Kconfig
> > >  create mode 100644 drivers/media/platform/toshiba/Makefile
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/Kconfig
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/Makefile
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/viif.c
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/viif.h
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/viif_capture.c
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/viif_capture.h
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/viif_common.c
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/viif_common.h
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/viif_csi2rx.c
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/viif_csi2rx.h
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/viif_csi2rx_regs.h
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/viif_isp.c
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/viif_isp.h
> > >  create mode 100644 drivers/media/platform/toshiba/visconti/viif_regs.h
> > >  create mode 100644 include/uapi/linux/visconti_viif.h

[snip]

> > > diff --git a/drivers/media/platform/toshiba/visconti/viif.c b/drivers/media/platform/toshiba/visconti/viif.c
> > > new file mode 100644
> > > index 0000000000..472b292752
> > > --- /dev/null
> > > +++ b/drivers/media/platform/toshiba/visconti/viif.c
> > > @@ -0,0 +1,627 @@

[snip]

> > > diff --git a/drivers/media/platform/toshiba/visconti/viif.h
> > b/drivers/media/platform/toshiba/visconti/viif.h
> > > new file mode 100644
> > > index 0000000000..72b35bd605
> > > --- /dev/null
> > > +++ b/drivers/media/platform/toshiba/visconti/viif.h
> > > @@ -0,0 +1,393 @@

[snip]

> > > +#define VIIF_HW_AVAILABLE_IRQS 4
> > > +
> > > +#define VIIF_SYS_CLK 500000UL
> > 
> > Is that always a fixed frequency, or should it be retrieved dynamically
> > at runtime from the clock ?
> 
> The system clock for VIIF is fixed to 500MHz.
> 
> We are also trying to expand Visconti's clock driver to support VIIF.
> The value can be retrived from API in future.

OK. If the clock driver doesn't expose a VIIF clock yet, then using this
macro is fine. A comment above the line to indicate the frequency should
be retrieved dynamically from the clock would be useful.

If the clock driver has a VIIF clock that is not configurable yet but is
hardcoded to 500MHz, then you can already use clk_get_rate() to get the
frequency, and remove the macro.

[snip]

> > > diff --git a/drivers/media/platform/toshiba/visconti/viif_csi2rx_regs.h b/drivers/media/platform/toshiba/visconti/viif_csi2rx_regs.h
> > > new file mode 100644
> > > index 0000000000..97e2017fec
> > > --- /dev/null
> > > +++ b/drivers/media/platform/toshiba/visconti/viif_csi2rx_regs.h
> > > @@ -0,0 +1,102 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> > > +/* Toshiba Visconti Video Capture register definitions
> > > + *
> > > + * (C) Copyright 2024 TOSHIBA CORPORATION
> > > + * (C) Copyright 2024 Toshiba Electronic Devices & Storage Corporation
> > > + */
> > > +
> > > +#ifndef VIIF_CSI2RX_REGS_H
> > > +#define VIIF_CSI2RX_REGS_H
> > > +
> > > +/*=============================================*/
> > > +/* CSI2HOST registers */
> > > +/*=============================================*/
> > > +#define REG_CSI2RX_NLANES	 0x4
> > > +#define REG_CSI2RX_PHY_SHUTDOWNZ 0x40
> > > +#define REG_CSI2RX_PHY_RSTZ	 0x44
> > > +
> > > +/* access to dphy external registers */
> > > +#define REG_CSI2RX_PHY_TESTCTRL0 0x50
> > > +#define BIT_TESTCTRL0_CLK_0	 0
> > > +#define BIT_TESTCTRL0_CLK_1	 BIT(1)
> > 
> > Quoting drivers/media/platform/renesas/rcar-csi2.c,
> > 
> > #define V4H_N_LANES_REG                                 0x0004
> > #define V4H_CSI2_RESETN_REG                             0x0008
> > #define V4H_PHY_MODE_REG                                0x001c
> > #define V4H_PHY_SHUTDOWNZ_REG                           0x0040
> > #define V4H_DPHY_RSTZ_REG                               0x0044
> > ...
> > #define PHTW_REG                        0x50
> > 
> > Where does your CSI-2 receiver come from, is it a Synopsys IP ? One day
> > we should really try to consolidate all that into a single driver. To
> > make it easier, I think support for the CSI-2 RX should already be split
> > out of this driver to a standalone subdev driver, with separate DT
> > bindings.
> 
> Yes, CSI2RX is Synopsys IP (host controller + D-Phy).
> I'll try to separate the CSI2RX driver into standalone subdev driver, 
> using the structure of the rcar-csi2 driver as a reference.

Thank you.

[snip]

> > > diff --git a/drivers/media/platform/toshiba/visconti/viif_isp.c b/drivers/media/platform/toshiba/visconti/viif_isp.c
> > > new file mode 100644
> > > index 0000000000..7a66aac715
> > > --- /dev/null
> > > +++ b/drivers/media/platform/toshiba/visconti/viif_isp.c
> > > @@ -0,0 +1,1183 @@

[snip]

> > > +static void visconti_viif_isp_set_sink_fmt(struct v4l2_subdev_state *sd_state,
> > > +					   struct v4l2_mbus_framefmt *format)
> > > +{
> > > +	struct v4l2_mbus_framefmt *sink_fmt, *src0_fmt, *src1_fmt, *src2_fmt;
> > > +
> > > +	sink_fmt = v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SINK_VIDEO);
> > > +	src0_fmt = v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SRC_PATH0);
> > > +	src1_fmt = v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SRC_PATH1);
> > > +	src2_fmt = v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SRC_PATH2);
> > > +
> > > +	/* update mbus code only if it's available */
> > > +	if (viif_is_valid_mbus_code(format->code))
> > > +		sink_fmt->code = format->code;
> > 
> > If format->code is not valid, it would be better to set sink_fmt->code
> > to a default format instead of keeping the current value. It will result
> > in a more predictable behaviour for userspace, making it easier to debug
> > issues.
> 
> I understand. I'll fix it.
> 
> > > +
> > > +	/* sink::mbus_code is derived from src::mbus_code */
> > 
> > Here you seem to do it the other way around, setting the source format
> > based on the sink format.
> 
> I have no idea what to set in the source format here.
> Should I use the default format even if it is not compatible to the source format?

The base rule is that subdev drivers must propagate formats from sink
(input of the subdev) to source (output of the subdev). This function is
called when userspace sets the format on the sink pad. It needs to
update the source pad format accordingly, which you do below. What I
think is not correct (if I understand it right) is the comment above.
You set the source format based on the sink format, so I think the
comment should read

	/* src::mbus_code is derived from sink::mbus_code */

> > > +	if (viif_get_mbus_rgb_out(sink_fmt->code)) {
> > > +		src0_fmt->code = MEDIA_BUS_FMT_RGB888_1X24;
> > > +		src1_fmt->code = MEDIA_BUS_FMT_RGB888_1X24;
> > > +	} else {
> > > +		src0_fmt->code = MEDIA_BUS_FMT_YUV8_1X24;
> > > +		src1_fmt->code = MEDIA_BUS_FMT_YUV8_1X24;
> > > +	}
> > > +
> > > +	/* SRC2 (RAW output) follows SINK format */
> > > +	src2_fmt->code = format->code;
> > > +	src2_fmt->width = format->width;
> > > +	src2_fmt->height = format->height;
> > 
> > You need to adjust the width and height based on the hardware limits.
> > 
> > Can src0 and src1 generate any size, or are they restricted by the sink
> > size ? I would recomend propagating the sink size to all sources here.
> > You should also adjust selection rectangles.
> 
> I need to understand what should/can be propagated from sink to source, and what should not.
> I have read "4.13 Sub-device Interface" but I'm still not clear.

The order of the configuration parameters in a subdev is as follows:

- sink format (mbus code, size, colorspace)
- sink crop (rectangle)
- sink compose (rectangle)
- source crop (rectangle)
- source format (mbus code, size, colorspace)

Starting with the easy ones. To propagate the media bus code from sink
to source, you need to set a media bus code on the source pads that is
compatible with the media bus code on the sink pad. What that is depends
on your hardware constraints. For instance, if the ISP can produce
multiple RGB and YUV formats from a raw bayer format, then pick a
default RGB or YUV format for the source pads..

For the colorspace information (the colorspace, ycbcr_enc, quantization
and xfer_func fields), the situation is slightly more complicated, but I
think it can be simplified. The ISP input can be in any color space, and
the ISP can also output different color spaces. In theory, that could be
controlled by the color space fields on the source pads, setting them to
specific values would configure the ISP parameters accordingly (RGB2RGB
matrix, RGB2YUV matrix, ...). However, this would create complexity in
the driver, and would make the ISP less flexible as userspace wouldn't
be able to have precise control of all the corresponding ISP parameters.
For that reason, I think it's better to control all the ISP paramaters
through the ISP parameters buffer, and ignore the color space fields in
the sink and source pad formats. The quantization range may be an
exception, you may want to control quantization using the pad format, up
to you. As an example, here's how we handle colorspace propagation in
the rkisp1 driver:

        /*
         * Copy the color space for the sink pad. When converting from Bayer to
         * YUV, default to a limited quantization range.
         */
        src_fmt->colorspace = sink_fmt->colorspace;
        src_fmt->xfer_func = sink_fmt->xfer_func;
        src_fmt->ycbcr_enc = sink_fmt->ycbcr_enc;

        if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
            src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
                src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
        else
                src_fmt->quantization = sink_fmt->quantization;

        /*
         * Allow setting the source color space fields when the SET_CSC flag is
         * set and the source format is YUV. If the sink format is YUV, don't
         * set the color primaries, transfer function or YCbCr encoding as the
         * ISP is bypassed in that case and passes YUV data through without
         * modifications.
         *
         * The color primaries and transfer function are configured through the
         * cross-talk matrix and tone curve respectively. Settings for those
         * hardware blocks are conveyed through the ISP parameters buffer, as
         * they need to combine color space information with other image tuning
         * characteristics and can't thus be computed by the kernel based on the
         * color space. The source pad colorspace and xfer_func fields are thus
         * ignored by the driver, but can be set by userspace to propagate
         * accurate color space information down the pipeline.
         */
        set_csc = format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC;

        if (set_csc && src_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
                if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
                        if (format->colorspace != V4L2_COLORSPACE_DEFAULT)
                                src_fmt->colorspace = format->colorspace;
                        if (format->xfer_func != V4L2_XFER_FUNC_DEFAULT)
                                src_fmt->xfer_func = format->xfer_func;
                        if (format->ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT)
                                src_fmt->ycbcr_enc = format->ycbcr_enc;
                }

                if (format->quantization != V4L2_QUANTIZATION_DEFAULT)
                        src_fmt->quantization = format->quantization;
        }

The colorspace-related fields on the source pad can be set to make
userspace code simpler. By setting the colorspace on the ISP source pad
to the value corresponding to the ISP parameters it sets, userspace will
make sure the correct colorspace value is propagated along the pipeline
to the capture device at the end. This will help writing more generic
code in userspace that can take the colorspace from the capture device
and use it on the consumer of the video stream (e.g. a video codec or a
display device), to avoid colorspace mismatches.

Now we have the sizes and rectangles to propagate:

- sink format size
- sink crop rectangle
- sink compose rectangle
- source crop rectangle
- source format size, colorspace

When userspace sets the sink format size, this should be propagated to
the sink crop by setting the sink crop to the full sink format size. The
sink compose rectangle should be reset to a 1:1 scaling ratio. The
source crop rectangle should be reset to the same size (no additional
cropping), and the source format size should be set to the same size
too. Sakari, could you confirm this is correct ?

> The sizes of src0 and src1 are not restricted by the sink size.
> Src0 and src1 are processed by L2-ISP (undistortion, resize, crop).

Does that mean that the resizer can both downscale and upscale ? Are
there limits to the scaling factors ?

> L2-ISP's operation is represented with sink.compose, src0.crop and src1.crop.
> 
> In order to correctly map the subdevice nodes to the HW functions and ensure consistency with the pad operations,
> the internal driver structure should be modified as shown below.
> However due to the increased complexity of operating the L2ISP and risks of unverified HW operation patterns, I have not yet tried this.
> 
> [HW]
> sensor --- CSI2RX --- glue --- L1ISP --- L2ISP --- DMAC
> 
> [subdevice]
>                 Param_dev ---       --- Stat_dev
> Sensor --- CSI2RX --- MUX --- L1ISP --- Resizer0 --- Capture0_dev
>                                     --- Resizer1 --- Capture1_dev
>                           -------------------------- Capture2_dev
> 
> > > +
> > > +	/* size check */
> > > +	sink_fmt->width = format->width;
> > > +	sink_fmt->height = format->height;
> > > +
> > > +	*format = *sink_fmt;
> > > +}

[snip]

> > > diff --git a/include/uapi/linux/visconti_viif.h b/include/uapi/linux/visconti_viif.h
> > > new file mode 100644
> > > index 0000000000..3ff9bfc913
> > > --- /dev/null
> > > +++ b/include/uapi/linux/visconti_viif.h
> > > @@ -0,0 +1,1921 @@

[snip]

> > > +/**
> > > + * struct viif_l1_ag_mode_config - L1ISP parameter for analog gain
> > > + *
> > > + * @sysm_ag_grad: Analog gain slope. Range: [0..255], Index corresponds to psel id.
> > > + * @sysm_ag_ofst: Analog gain offset. Range: [0..65535], Index corresponds to psel id.
> > > + * @sysm_ag_cont_hobc_en_high: set 1 to enable  control analog gain
> > > + *                             for high sensitivity image of OBCC
> > > + * @sysm_ag_psel_hobc_high: Analog gain id for high sensitivity image of OBCC. Range: [0..3]
> > > + * @sysm_ag_cont_hobc_en_middle_led: set 1 to enable control analog gain
> > > + *                                   for middle sensitivity or LED image of OBCC
> > > + * @sysm_ag_psel_hobc_middle_led: Analog gain id for middle sensitivity
> > > + *                                or LED image of OBCC. Range: [0..3]
> > > + * @sysm_ag_cont_hobc_en_low: set 1 to enable control analog gain
> > > + *                            for low sensitivity image of OBCC
> > > + * @sysm_ag_psel_hobc_low: Analog gain id for low sensitivity image of OBCC. Range:[0..3]
> > > + * @sysm_ag_cont_abpc_en_high: set 1 to enable control analog gain
> > > + *                             for high sensitivity image of ABPC
> > > + * @sysm_ag_psel_abpc_high: Analog gain id for high sensitivity image of ABPC. Range: [0..3]
> > > + * @sysm_ag_cont_abpc_en_middle_led: set 1 to enable control analog gain
> > > + *                                   for middle sensitivity or LED image of ABPC
> > > + * @sysm_ag_psel_abpc_middle_led: Analog gain id for middle sensitivity
> > > + *                                or LED image of ABPC. Range: [0..3]
> > > + * @sysm_ag_cont_abpc_en_low: set 1 to enable control analog gain
> > > + *                            for low sensitivity image of ABPC
> > > + * @sysm_ag_psel_abpc_low: Analog gain id for low sensitivity image of ABPC. Range: [0..3]
> > > + * @sysm_ag_cont_rcnr_en_high: set 1 to enable control analog gain
> > > + *                             for high sensitivity image of RCNR
> > > + * @sysm_ag_psel_rcnr_high: Analog gain id for high sensitivity image of RCNR. Range: [0..3]
> > > + * @sysm_ag_cont_rcnr_en_middle_led: set 1 to enable control analog gain
> > > + *                                   for middle sensitivity or LED image of RCNR
> > > + * @sysm_ag_psel_rcnr_middle_led: Analog gain id for middle sensitivity
> > > + *                                or LED image of RCNR. Range: [0..3]
> > > + * @sysm_ag_cont_rcnr_en_low: set 1 to enable control analog gain
> > > + *                            for low sensitivity image of RCNR
> > > + * @sysm_ag_psel_rcnr_low: Analog gain id for low sensitivity image of RCNR. Range: [0..3]
> > > + * @sysm_ag_cont_lssc_en: set 1 to enable control analog gain for LSC
> > > + * @sysm_ag_ssel_lssc: &enum viif_l1_img_sensitivity_mode value. Sensitive image used for LSC.
> > > + * @sysm_ag_psel_lssc: Analog gain id for LSC. Range: [0..3]
> > > + * @sysm_ag_cont_mpro_en: set 1 to enable control analog gain for color matrix
> > > + * @sysm_ag_ssel_mpro: &enum viif_l1_img_sensitivity_mode value.
> > > + *                     Sensitive image used for color matrix.
> > > + * @sysm_ag_psel_mpro: Analog gain id for color matrix. Range: [0..3]
> > > + * @sysm_ag_cont_vpro_en: set 1 to enable control analog gain for image adjustment
> > > + * @sysm_ag_ssel_vpro: &enum viif_l1_img_sensitivity_mode value.
> > > + *                     Sensitive image used for image adjustment.
> > > + * @sysm_ag_psel_vpro: Analog gain id for image adjustment. Range: [0..3]
> > > + * @sysm_ag_cont_hobc_test_high: Manual analog gain for high sensitivity image
> > > + *                               of OBCC. Range: [0..255]
> > > + * @sysm_ag_cont_hobc_test_middle_led: Manual analog gain for middle sensitivity
> > > + *                                     or led image of OBCC. Range: [0..255]
> > > + * @sysm_ag_cont_hobc_test_low: Manual analog gain for low sensitivity image
> > > + *                              of OBCC. Range: [0..255]
> > > + * @sysm_ag_cont_abpc_test_high: Manual analog gain for high sensitivity image
> > > + *                               of ABPC. Range: [0..255]
> > > + * @sysm_ag_cont_abpc_test_middle_led: Manual analog gain for middle sensitivity
> > > + *                                     or led image of ABPC. Range: [0..255]
> > > + * @sysm_ag_cont_abpc_test_low: Manual analog gain for low sensitivity image
> > > + *                              of ABPC. Range: [0..255]
> > > + * @sysm_ag_cont_rcnr_test_high: Manual analog gain for high sensitivity image
> > > + *                               of RCNR. Range:  [0..255]
> > > + * @sysm_ag_cont_rcnr_test_middle_led: Manual analog gain for middle sensitivity
> > > + *                                     or led image of RCNR. Range: [0..255]
> > > + * @sysm_ag_cont_rcnr_test_low: Manual analog gain for low sensitivity image
> > > + *                              of RCNR. Range:  [0..255]
> > > + * @sysm_ag_cont_lssc_test: Manual analog gain for LSSC. Range: [0..255]
> > > + * @sysm_ag_cont_mpro_test: Manual analog gain for color matrix. Range: [0..255]
> > > + * @sysm_ag_cont_vpro_test: Manual analog gain for image adjustment. Range: [0..255]
> > > + *
> > > + * This parameter sets rules of generating analog gains for each feature in L1ISP.
> > 
> > Does the ISP compute the analog gains for the sensor ? That's the first
> > time I see such a ISP feature. If that's not the case, maybe I'm not
> > understanding the documentation correctly.
> > 
> > Overall, there are lots of ISP parameters here. They all have a short
> > description, and ranges and formats for fixed-point integers are
> > documented, which is very nice. However, reading the documentation in
> > this file doesn't provide me with enough information to use most of the
> > ISP parameters. There are three main options to address this:
> > 
> > - Expanding the documentation in this header file to clearly explain how
> >   each ISP parameter operates and how to use them.
> > 
> > - Providing an open userspace implementation of ISP algorithms that
> >   showcase how to calculate the values for the parameters.
> > 
> > - Providing detailed hardware documentation for the ISP. This is usually
> >   not favoured by ISP vendors, and the V4L2 community is not pushing for
> >   this, but I wanted to mention it for completeness.
> > 
> > If you would prefer the second option, any open-source camera framework
> > would be acceptable, but in practice the only real option is likely
> > libcamera.
> > 
> > This does not mean that you have to open-source all your ISP control
> > algorithms. Only the code needed to explain how ISP parameters are
> > applied to the image and are computed is needed. Other parts, such as
> > for instance AI-based computation of white balance gains, or complex AGC
> > calculations, don't need to be open-source.
> > 
> > The explain this requirement different and perhaps more clearly, the
> > goal is to make sure that developers who have access to only open-source
> > material (ISP kernel driver, this header, any open-source userspace
> > code, public documentation, ...) will have enough information to
> > configure and control the ISP.
> 
> I read the HW manual again and found the term "analog gain" is not related to the sensor nor individual pixel values.
> It is a kind of "strength" parameter commonly used in image processing algorithms.
> I think I need to correct the confusing words and inconsistencies in the documents, comments and source code.

That would be nice :-)

> We have an offline tool for generating ISP settings, but the parameters are too many and specialized.
> I think it is attractive idea to prepare a simple userland for libcamera in the future.

That is what I recommend, as I think it's the simplest solution. We can
help if needed.

> > > + * Related features are:
> > > + *
> > > + * - Optical Black Clamp Correction (OBCC)
> > > + * - Defect Pixel Correction (DPC)
> > > + * - RAW Color Noise Reduction (RCNR)
> > > + * - Lens Shading Correction (LSC)
> > > + * - Color matrix correction (MPRO)
> > > + * - Image quality adjustment (VPRO)
> > > + *
> > > + * The base gain is set with  &struct viif_l1_ag_config.
> > > + *
> > > + * If sysm_ag_cont_xxxx_en = 1, analog_gain for each module is generated from
> > > + * sysm_ag_grad, sysm_ag_ofst and the value specified with &struct viif_l1_ag_config.
> > > + * If sysm_ag_cont_xxxx_en = 0,
> > > + * the value of sysm_ag_cont_xxxx_test is used for analog_gain for each module.
> > > + *
> > > + * Up to 4 sets of parameters (sysm_ag_grad[4] and sysm_ag_ofst[4]) can be used
> > > + * to generate analog gain.
> > > + * The parameter sysm_ag_psel_xxxx specifies the set to be used for module xxxx.
> > > + * For example, if sysm_ag_psel_hobc_high is set to 2,
> > > + * values in sysm_ag_grad[2] and sysm_ag_ofst[2] are used
> > > + * to generate analog gain for high sensitivity images in OBCC processing.
> > > + *
> > > + * Analog gain generation for each L1ISP module is disabled when
> > > + * "sysm_ag_cont_xxxx_en=0" and "sysm_ag_cont_xxxx_test=0".
> > > + * Be sure to disable the analog gain generation
> > > + * if VIIF_L1_INPUT_HDR or VIIF_L1_INPUT_PWL is set to
> > > + * &struct viif_l1_input_mode_config
> > > + *
> > > + */
> > > +struct viif_l1_ag_mode_config {
> > > +	__u8 sysm_ag_grad[4];
> > > +	__u16 sysm_ag_ofst[4];
> > > +	__u32 sysm_ag_cont_hobc_en_high;
> > > +	__u32 sysm_ag_psel_hobc_high;
> > > +	__u32 sysm_ag_cont_hobc_en_middle_led;
> > > +	__u32 sysm_ag_psel_hobc_middle_led;
> > > +	__u32 sysm_ag_cont_hobc_en_low;
> > > +	__u32 sysm_ag_psel_hobc_low;
> > > +	__u32 sysm_ag_cont_abpc_en_high;
> > > +	__u32 sysm_ag_psel_abpc_high;
> > > +	__u32 sysm_ag_cont_abpc_en_middle_led;
> > > +	__u32 sysm_ag_psel_abpc_middle_led;
> > > +	__u32 sysm_ag_cont_abpc_en_low;
> > > +	__u32 sysm_ag_psel_abpc_low;
> > > +	__u32 sysm_ag_cont_rcnr_en_high;
> > > +	__u32 sysm_ag_psel_rcnr_high;
> > > +	__u32 sysm_ag_cont_rcnr_en_middle_led;
> > > +	__u32 sysm_ag_psel_rcnr_middle_led;
> > > +	__u32 sysm_ag_cont_rcnr_en_low;
> > > +	__u32 sysm_ag_psel_rcnr_low;
> > > +	__u32 sysm_ag_cont_lssc_en;
> > > +	__u32 sysm_ag_ssel_lssc;
> > > +	__u32 sysm_ag_psel_lssc;
> > > +	__u32 sysm_ag_cont_mpro_en;
> > > +	__u32 sysm_ag_ssel_mpro;
> > > +	__u32 sysm_ag_psel_mpro;
> > > +	__u32 sysm_ag_cont_vpro_en;
> > > +	__u32 sysm_ag_ssel_vpro;
> > > +	__u32 sysm_ag_psel_vpro;
> > > +	__u8 sysm_ag_cont_hobc_test_high;
> > > +	__u8 sysm_ag_cont_hobc_test_middle_led;
> > > +	__u8 sysm_ag_cont_hobc_test_low;
> > > +	__u8 sysm_ag_cont_abpc_test_high;
> > > +	__u8 sysm_ag_cont_abpc_test_middle_led;
> > > +	__u8 sysm_ag_cont_abpc_test_low;
> > > +	__u8 sysm_ag_cont_rcnr_test_high;
> > > +	__u8 sysm_ag_cont_rcnr_test_middle_led;
> > > +	__u8 sysm_ag_cont_rcnr_test_low;
> > > +	__u8 sysm_ag_cont_lssc_test;
> > > +	__u8 sysm_ag_cont_mpro_test;
> > > +	__u8 sysm_ag_cont_vpro_test;
> > > +};

[snip]

-- 
Regards,

Laurent Pinchart


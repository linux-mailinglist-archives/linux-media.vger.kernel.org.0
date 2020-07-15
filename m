Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D07922170F
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 23:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgGOVd1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 17:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgGOVd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 17:33:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 624F2C061755;
        Wed, 15 Jul 2020 14:33:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC343564;
        Wed, 15 Jul 2020 23:33:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594848803;
        bh=uhwx1ZrzzumUYxJ8EEJ1c7hBgtoqxkgDljA2p0ocD9s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S0hYaAWqoh8B3sqAAbKHei9ISfySdfxwDZsIzhkawLad4ZaNgbKlKXDiyJTW3ITYv
         DMJmcyvat+g5fPFE70dMdgvXgDaKVksB5nqZbFzxaitUaviUtkkfBd6uQTL+ko1Vqw
         L3a3AYQO0SWIsBMstJVxUOecDXZQ9y1MPfW2m48c=
Date:   Thu, 16 Jul 2020 00:33:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, hyunk@xilinx.com,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        michals@xilinx.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, joe@perches.com, sandipk@xilinx.com,
        dineshk@xilinx.com
Subject: Re: [PATCH v3 3/3] media: v4l: xilinx: Add Xilinx UHD-SDI Rx
 Subsystem driver
Message-ID: <20200715213315.GF6144@pendragon.ideasonboard.com>
References: <20200618053304.14551-1-vishal.sagar@xilinx.com>
 <20200618053304.14551-4-vishal.sagar@xilinx.com>
 <50cc4f4b-e788-c5ad-cd6a-b428b96d5377@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50cc4f4b-e788-c5ad-cd6a-b428b96d5377@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

Thank you for the patch.

Hans, there are a few questions for you below.

On Thu, Jun 25, 2020 at 11:43:01AM +0200, Hans Verkuil wrote:
> On 18/06/2020 07:33, Vishal Sagar wrote:
> > The Xilinx UHD-SDI Rx subsystem soft IP is used to capture native SDI
> > streams from SDI sources like SDI broadcast equipment like cameras and
> > mixers. This block outputs either native SDI, native video or
> > AXI4-Stream compliant data stream for further processing. Please refer
> > to PG290 for details.
> > 
> > The driver is used to configure the IP to add framer, search for
> > specific modes, get the detected mode, stream parameters, errors, etc.
> > It also generates events for video lock/unlock, bridge over/under flow.
> > 
> > The driver supports 10/12 bpc YUV 422 media bus format currently. It
> > also decodes the stream parameters based on the ST352 packet embedded in the
> > stream. In case the ST352 packet isn't present in the stream, the core's
> > detected properties are used to set stream properties.
> > 
> > The driver currently supports only the AXI4-Stream IP configuration.
> > 
> > Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> > ---
> > v3
> > - fixed KConfig with better description
> > - removed unnecessary header files
> > - converted uppercase to lowercase for all hex values
> > - merged core struct to state struct
> > - removed most one line functions and replaced with direct reg
> >   read/write or macros
> > - dt property bpp to bpc. default 10. not mandatory.
> > - fixed subscribe events, log_status, s_stream
> > - merged overflow/underflow to one event
> > - moved all controls to xilinx-sdirxss.h
> > - max events from 128 to 8
> > - used FIELD_GET() instead of custom macro
> > - updated the controls documentation
> > - added spinlock
> > - removed 3GB control and added mode to detect bitmask
> > - fixed format for (width, height, colorspace, xfer func, etc)
> > - added dv_timings_cap, s/g_dv_timings
> > - fixed set/get_format
> > - fix v4l control registrations
> > - fix order of registration / deregistration in probe() remove()
> > - fixed other comments from Hyun, Laurent and Hans
> > - things yet to close
> >   - adding source port for connector (Laurent's suggestion)
> >   - adding new FIELD type for Transport Stream V4L2_FIELD_ALTERNATE_PROG (Han's suggestion)
> >   - Update / remove EDH or CRC related controls
> > 
> > v2
> > - Added DV timing support based on Hans Verkuilś feedback
> > - More documentation to custom v4l controls and events
> > - Fixed Hyunś comments
> > - Added macro for masking and shifting as per Joe Perches comments
> > - Updated to latest as per Xilinx github repo driver like
> >   adding new DV timings not in mainline yet uptill 03/21/20
> > 
> >  drivers/media/platform/xilinx/Kconfig         |   11 +
> >  drivers/media/platform/xilinx/Makefile        |    1 +
> >  .../media/platform/xilinx/xilinx-sdirxss.c    | 2121 +++++++++++++++++
> >  include/uapi/linux/v4l2-controls.h            |    6 +
> >  include/uapi/linux/xilinx-sdirxss.h           |  283 +++
> >  5 files changed, 2422 insertions(+)
> >  create mode 100644 drivers/media/platform/xilinx/xilinx-sdirxss.c
> >  create mode 100644 include/uapi/linux/xilinx-sdirxss.h
> > 
> > diff --git a/drivers/media/platform/xilinx/Kconfig b/drivers/media/platform/xilinx/Kconfig
> > index 01c96fb66414..578cdcc1036e 100644
> > --- a/drivers/media/platform/xilinx/Kconfig
> > +++ b/drivers/media/platform/xilinx/Kconfig
> > @@ -12,6 +12,17 @@ config VIDEO_XILINX
> >  
> >  if VIDEO_XILINX
> >  
> > +config VIDEO_XILINX_SDIRXSS
> > +	tristate "Xilinx UHD SDI Rx Subsystem"
> > +	help
> > +	  Driver for Xilinx UHD-SDI Rx Subsystem. This is a V4L sub-device
> > +	  based driver that takes input from a SDI source like SDI camera and
> > +	  converts it into an AXI4-Stream. The subsystem comprises a SMPTE
> > +	  UHD-SDI Rx core, a SDI Rx to Native Video bridge and a Video In to
> > +	  AXI4-Stream bridge. The driver is used to set different stream
> > +	  detection modes and identify stream properties to properly configure
> > +	  downstream.
> > +
> >  config VIDEO_XILINX_TPG
> >  	tristate "Xilinx Video Test Pattern Generator"
> >  	depends on VIDEO_XILINX
> > diff --git a/drivers/media/platform/xilinx/Makefile b/drivers/media/platform/xilinx/Makefile
> > index 4cdc0b1ec7a5..3beaf24d832c 100644
> > --- a/drivers/media/platform/xilinx/Makefile
> > +++ b/drivers/media/platform/xilinx/Makefile
> > @@ -3,5 +3,6 @@
> >  xilinx-video-objs += xilinx-dma.o xilinx-vip.o xilinx-vipp.o
> >  
> >  obj-$(CONFIG_VIDEO_XILINX) += xilinx-video.o
> > +obj-$(CONFIG_VIDEO_XILINX_SDIRXSS) += xilinx-sdirxss.o
> >  obj-$(CONFIG_VIDEO_XILINX_TPG) += xilinx-tpg.o
> >  obj-$(CONFIG_VIDEO_XILINX_VTC) += xilinx-vtc.o
> > diff --git a/drivers/media/platform/xilinx/xilinx-sdirxss.c b/drivers/media/platform/xilinx/xilinx-sdirxss.c
> > new file mode 100644
> > index 000000000000..e39aab7c656a
> > --- /dev/null
> > +++ b/drivers/media/platform/xilinx/xilinx-sdirxss.c
> > @@ -0,0 +1,2121 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Driver for Xilinx SDI Rx Subsystem
> > + *
> > + * Copyright (C) 2017 - 2020 Xilinx, Inc.
> > + *
> > + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
> > + */
> > +
> > +#include <dt-bindings/media/xilinx-sdi.h>
> > +#include <linux/bits.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/xilinx-sdirxss.h>

That's an impressive trim down of headers, but I think it may have gone
a bit too far :-S I've pointed out to headers that are not needed in v2,
but you've removed all headers that are implicitly included through
other headers. This makes the driver more fragile, as if headers are
refactored, there's a large risk of compilation breakages.

> > +#include <media/media-entity.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-dv-timings.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +/*
> > + * SDI Rx register map, bitmask and offsets
> > + */
> > +#define XSDIRX_RST_CTRL_REG		0x00
> > +#define XSDIRX_MDL_CTRL_REG		0x04
> > +#define XSDIRX_GLBL_IER_REG		0x0c
> > +#define XSDIRX_ISR_REG			0x10
> > +#define XSDIRX_IER_REG			0x14
> > +#define XSDIRX_ST352_VALID_REG		0x18
> > +#define XSDIRX_ST352_DS1_REG		0x1c
> > +#define XSDIRX_ST352_DS3_REG		0x20
> > +#define XSDIRX_ST352_DS5_REG		0x24
> > +#define XSDIRX_ST352_DS7_REG		0x28
> > +#define XSDIRX_ST352_DS9_REG		0x2c
> > +#define XSDIRX_ST352_DS11_REG		0x30
> > +#define XSDIRX_ST352_DS13_REG		0x34
> > +#define XSDIRX_ST352_DS15_REG		0x38
> > +#define XSDIRX_VERSION_REG		0x3c
> > +#define XSDIRX_SS_CONFIG_REG		0x40
> > +#define XSDIRX_MODE_DET_STAT_REG	0x44
> > +#define XSDIRX_TS_DET_STAT_REG		0x48
> > +#define XSDIRX_EDH_STAT_REG		0x4c
> > +#define XSDIRX_EDH_ERRCNT_EN_REG	0x50
> > +#define XSDIRX_EDH_ERRCNT_REG		0x54
> > +#define XSDIRX_CRC_ERRCNT_REG		0x58
> > +#define XSDIRX_VID_LOCK_WINDOW_REG	0x5c
> > +#define XSDIRX_ST352_DS2_REG		0x70
> > +#define XSDIRX_ST352_DS4_REG		0x74
> > +#define XSDIRX_ST352_DS6_REG		0x78
> > +#define XSDIRX_ST352_DS8_REG		0x7c
> > +#define XSDIRX_ST352_DS10_REG		0x80
> > +#define XSDIRX_ST352_DS12_REG		0x84
> > +#define XSDIRX_ST352_DS14_REG		0x88
> > +#define XSDIRX_ST352_DS16_REG		0x8c
> > +
> > +#define XSDIRX_RST_CTRL_SS_EN_MASK			BIT(0)
> > +#define XSDIRX_RST_CTRL_SRST_MASK			BIT(1)
> > +#define XSDIRX_RST_CTRL_RST_CRC_ERRCNT_MASK		BIT(2)
> > +#define XSDIRX_RST_CTRL_RST_EDH_ERRCNT_MASK		BIT(3)
> > +#define XSDIRX_RST_CTRL_SDIRX_BRIDGE_ENB_MASK		BIT(8)
> > +#define XSDIRX_RST_CTRL_VIDIN_AXI4S_MOD_ENB_MASK	BIT(9)
> > +#define XSDIRX_RST_CTRL_BRIDGE_CH_FMT_OFFSET		10
> > +#define XSDIRX_RST_CTRL_BRIDGE_CH_FMT_MASK		GENMASK(12, 10)
> > +#define XSDIRX_RST_CTRL_BRIDGE_CH_FMT_YUV444		1
> > +
> > +#define XSDIRX_MDL_CTRL_FRM_EN_MASK		BIT(4)
> > +#define XSDIRX_MDL_CTRL_MODE_DET_EN_MASK	BIT(5)
> > +#define XSDIRX_MDL_CTRL_MODE_HD_EN_MASK		BIT(8)
> > +#define XSDIRX_MDL_CTRL_MODE_SD_EN_MASK		BIT(9)
> > +#define XSDIRX_MDL_CTRL_MODE_3G_EN_MASK		BIT(10)
> > +#define XSDIRX_MDL_CTRL_MODE_6G_EN_MASK		BIT(11)
> > +#define XSDIRX_MDL_CTRL_MODE_12GI_EN_MASK	BIT(12)
> > +#define XSDIRX_MDL_CTRL_MODE_12GF_EN_MASK	BIT(13)
> > +#define XSDIRX_MDL_CTRL_MODE_AUTO_DET_MASK	GENMASK(13, 8)
> > +
> > +#define XSDIRX_MDL_CTRL_FORCED_MODE_OFFSET	16
> > +#define XSDIRX_MDL_CTRL_FORCED_MODE_MASK	GENMASK(18, 16)
> > +
> > +#define XSDIRX_GLBL_INTR_EN_MASK	BIT(0)
> > +
> > +#define XSDIRX_INTR_VIDLOCK_MASK	BIT(0)
> > +#define XSDIRX_INTR_VIDUNLOCK_MASK	BIT(1)
> > +#define XSDIRX_INTR_OVERFLOW_MASK	BIT(9)
> > +#define XSDIRX_INTR_UNDERFLOW_MASK	BIT(10)
> > +
> > +#define XSDIRX_INTR_ALL_MASK	(XSDIRX_INTR_VIDLOCK_MASK |\
> > +				XSDIRX_INTR_VIDUNLOCK_MASK |\
> > +				XSDIRX_INTR_OVERFLOW_MASK |\
> > +				XSDIRX_INTR_UNDERFLOW_MASK)
> > +
> > +#define XSDIRX_ST352_VALID_DS1_MASK	BIT(0)
> > +#define XSDIRX_ST352_VALID_DS3_MASK	BIT(1)
> > +#define XSDIRX_ST352_VALID_DS5_MASK	BIT(2)
> > +#define XSDIRX_ST352_VALID_DS7_MASK	BIT(3)
> > +#define XSDIRX_ST352_VALID_DS9_MASK	BIT(4)
> > +#define XSDIRX_ST352_VALID_DS11_MASK	BIT(5)
> > +#define XSDIRX_ST352_VALID_DS13_MASK	BIT(6)
> > +#define XSDIRX_ST352_VALID_DS15_MASK	BIT(7)
> > +
> > +#define XSDIRX_MODE_DET_STAT_RX_MODE_MASK	GENMASK(2, 0)
> > +#define XSDIRX_MODE_DET_STAT_MODE_LOCK_MASK	BIT(3)
> > +#define XSDIRX_MODE_DET_STAT_ACT_STREAM_MASK	GENMASK(6, 4)
> > +#define XSDIRX_MODE_DET_STAT_ACT_STREAM_OFFSET	4
> > +#define XSDIRX_MODE_DET_STAT_LVLB_3G_MASK	BIT(7)
> > +
> > +#define XSDIRX_TS_DET_STAT_LOCKED_MASK		BIT(0)
> > +#define XSDIRX_TS_DET_STAT_SCAN_MASK		BIT(1)
> > +#define XSDIRX_TS_DET_STAT_FAMILY_MASK		GENMASK(7, 4)
> > +#define XSDIRX_TS_DET_STAT_RATE_MASK		GENMASK(11, 8)
> > +
> > +#define XSDIRX_TS_DET_STAT_RATE_NONE		0x0
> > +#define XSDIRX_TS_DET_STAT_RATE_23_98HZ		0x2
> > +#define XSDIRX_TS_DET_STAT_RATE_24HZ		0x3
> > +#define XSDIRX_TS_DET_STAT_RATE_47_95HZ		0x4
> > +#define XSDIRX_TS_DET_STAT_RATE_25HZ		0x5
> > +#define XSDIRX_TS_DET_STAT_RATE_29_97HZ		0x6
> > +#define XSDIRX_TS_DET_STAT_RATE_30HZ		0x7
> > +#define XSDIRX_TS_DET_STAT_RATE_48HZ		0x8
> > +#define XSDIRX_TS_DET_STAT_RATE_50HZ		0x9
> > +#define XSDIRX_TS_DET_STAT_RATE_59_94HZ		0xa
> > +#define XSDIRX_TS_DET_STAT_RATE_60HZ		0xb
> > +
> > +#define XSDIRX_EDH_STAT_EDH_AP_MASK	BIT(0)
> > +#define XSDIRX_EDH_STAT_EDH_FF_MASK	BIT(1)
> > +#define XSDIRX_EDH_STAT_EDH_ANC_MASK	BIT(2)
> > +#define XSDIRX_EDH_STAT_AP_FLAG_MASK	GENMASK(8, 4)
> > +#define XSDIRX_EDH_STAT_FF_FLAG_MASK	GENMASK(13, 9)
> > +#define XSDIRX_EDH_STAT_ANC_FLAG_MASK	GENMASK(18, 14)
> > +#define XSDIRX_EDH_STAT_PKT_FLAG_MASK	GENMASK(22, 19)
> > +
> > +#define XSDIRX_EDH_ERRCNT_COUNT_MASK	GENMASK(15, 0)
> > +
> > +#define XSDIRX_CRC_ERRCNT_COUNT_MASK	GENMASK(31, 16)
> > +#define XSDIRX_CRC_ERRCNT_DS_CRC_MASK	GENMASK(15, 0)
> > +
> > +#define XSDIRX_VERSION_REV_MASK		GENMASK(7, 0)
> > +#define XSDIRX_VERSION_PATCHID_MASK	GENMASK(11, 8)
> > +#define XSDIRX_VERSION_VER_REV_MASK	GENMASK(15, 12)
> > +#define XSDIRX_VERSION_VER_MIN_MASK	GENMASK(23, 16)
> > +#define XSDIRX_VERSION_VER_MAJ_MASK	GENMASK(31, 24)
> > +
> > +#define XSDIRX_SS_CONFIG_EDH_INCLUDED_MASK		BIT(1)
> > +
> > +#define XSDIRX_STAT_SB_RX_TDATA_CHANGE_DONE_MASK	BIT(0)
> > +#define XSDIRX_STAT_SB_RX_TDATA_CHANGE_FAIL_MASK	BIT(1)
> > +#define XSDIRX_STAT_SB_RX_TDATA_GT_RESETDONE_MASK	BIT(2)
> > +#define XSDIRX_STAT_SB_RX_TDATA_GT_BITRATE_MASK		BIT(3)
> > +
> > +#define XSDIRX_DEFAULT_WIDTH	1920
> > +#define XSDIRX_DEFAULT_HEIGHT	1080
> > +
> > +#define XSDIRX_MAX_STR_LENGTH	16
> > +
> > +#define XSDIRX_DEFAULT_VIDEO_LOCK_WINDOW	0x3000
> > +
> > +#define XSDIRX_MODE_HD_MASK	0x0
> > +#define XSDIRX_MODE_SD_MASK	0x1
> > +#define XSDIRX_MODE_3G_MASK	0x2
> > +#define XSDIRX_MODE_6G_MASK	0x4
> > +#define XSDIRX_MODE_12GI_MASK	0x5
> > +#define XSDIRX_MODE_12GF_MASK	0x6
> > +
> > +/* Maximum number of events per file handle. */
> > +#define XSDIRX_MAX_EVENTS	8
> > +
> > +/* ST352 related macros */
> > +#define XST352_PAYLOAD_BYTE1_MASK	GENMASK(7, 0)
> > +#define XST352_PAYLOAD_BYTE2_OFFSET	8
> > +#define XST352_PAYLOAD_BYTE3_OFFSET	16
> > +#define XST352_PAYLOAD_BYTE4_OFFSET	24
> > +
> > +#define XST352_BYTE1_ST292_1x720L_1_5G		0x84
> > +#define XST352_BYTE1_ST292_1x1080L_1_5G		0x85
> > +#define XST352_BYTE1_ST425_2008_750L_3GB	0x88
> > +#define XST352_BYTE1_ST425_2008_1125L_3GA	0x89
> > +#define XST352_BYTE1_ST372_DL_3GB		0x8a
> > +#define XST352_BYTE1_ST372_2x720L_3GB		0x8b
> > +#define XST352_BYTE1_ST372_2x1080L_3GB		0x8c
> > +#define XST352_BYTE1_ST2081_10_2160L_6G		0xc0
> > +#define XST352_BYTE1_ST2081_10_2_1080L_6G	0xc1
> > +#define XST352_BYTE1_ST2081_10_DL_2160L_6G	0xc2
> > +#define XST352_BYTE1_ST2082_10_2160L_12G	0xce
> > +
> > +#define XST352_BYTE2_TS_TYPE_MASK		BIT(15)
> > +#define XST352_BYTE2_PIC_TYPE_MASK		BIT(14)
> > +#define XST352_BYTE2_TS_PIC_TYPE_INTERLACED	0
> > +#define XST352_BYTE2_TS_PIC_TYPE_PROGRESSIVE	1
> > +
> > +#define XST352_BYTE2_FPS_MASK			GENMASK(11, 8)
> > +#define XST352_BYTE2_FPS_24F			0x2
> > +#define XST352_BYTE2_FPS_24			0x3
> > +#define XST352_BYTE2_FPS_48F			0x4
> > +#define XST352_BYTE2_FPS_25			0x5
> > +#define XST352_BYTE2_FPS_30F			0x6
> > +#define XST352_BYTE2_FPS_30			0x7
> > +#define XST352_BYTE2_FPS_48			0x8
> > +#define XST352_BYTE2_FPS_50			0x9
> > +#define XST352_BYTE2_FPS_60F			0xa
> > +#define XST352_BYTE2_FPS_60			0xb
> > +/* Table 4 ST 2081-10:2015 */
> > +#define XST352_BYTE2_FPS_96			0xc
> > +#define XST352_BYTE2_FPS_100			0xd
> > +#define XST352_BYTE2_FPS_120			0xe
> > +#define XST352_BYTE2_FPS_120F			0xf
> > +
> > +#define XST352_BYTE3_ACT_LUMA_COUNT_MASK	BIT(22)
> > +
> > +#define XST352_BYTE3_COLOR_FORMAT_MASK		GENMASK(19, 16)
> > +#define XST352_BYTE3_COLOR_FORMAT_422		0x0
> > +#define XST352_BYTE3_COLOR_FORMAT_YUV444	0x1
> > +#define XST352_BYTE3_COLOR_FORMAT_420		0x3
> > +#define XST352_BYTE3_COLOR_FORMAT_GBR		0x2
> > +
> > +#define XST352_BYTE3_COLORIMETRY_MASK		GENMASK(21, 20)
> > +#define XST352_BYTE3_COLORIMETRY_BT709		0
> > +#define XST352_BYTE3_COLORIMETRY_COLOR_VANC	1
> > +#define XST352_BYTE3_COLORIMETRY_UHDTV		2
> > +#define XST352_BYTE3_COLORIMETRY_UNKNOWN	3
> > +
> > +#define XST352_BYTE4_BIT_DEPTH_MASK		GENMASK(25, 24)
> > +#define XST352_BYTE4_BIT_DEPTH_10		0x1
> > +#define XST352_BYTE4_BIT_DEPTH_12		0x2
> > +
> > +/* GT input clock for sdi_rx_clk */
> > +#define CLK_INT		148500000UL
> > +
> > +#define XSDIRXSS_WIDTH_MIN                    720
> > +#define XSDIRXSS_WIDTH_MAX                    4096
> > +#define XSDIRXSS_HEIGHT_MIN                   243
> > +#define XSDIRXSS_HEIGHT_MAX                   2160
> > +#define XSDIRXSS_PIXELCLOCK_MIN               13500000
> > +#define XSDIRXSS_PIXELCLOCK_MAX               594000000
> > +
> > +/**
> > + * enum sdi_family_enc - SDI Transport Video Format Detected with Active Pixels
> > + * @XSDIRX_SMPTE_ST_274: SMPTE ST 274 detected with AP 1920x1080
> > + * @XSDIRX_SMPTE_ST_296: SMPTE ST 296 detected with AP 1280x720
> > + * @XSDIRX_SMPTE_ST_2048_2: SMPTE ST 2048-2 detected with AP 2048x1080
> > + * @XSDIRX_SMPTE_ST_295: SMPTE ST 295 detected with AP 1920x1080
> > + * @XSDIRX_NTSC: NTSC encoding detected with AP 720x486
> > + * @XSDIRX_PAL: PAL encoding detected with AP 720x576
> > + * @XSDIRX_TS_UNKNOWN: Unknown SMPTE Transport family type
> > + */
> > +enum sdi_family_enc {
> > +	XSDIRX_SMPTE_ST_274	= 0,
> > +	XSDIRX_SMPTE_ST_296	= 1,
> > +	XSDIRX_SMPTE_ST_2048_2	= 2,
> > +	XSDIRX_SMPTE_ST_295	= 3,
> > +	XSDIRX_NTSC		= 8,
> > +	XSDIRX_PAL		= 9,
> > +	XSDIRX_TS_UNKNOWN	= 15
> > +};
> > +
> > +/**
> > + * struct xsdirxss_state - SDI Rx Subsystem device structure
> > + * @subdev: The v4l2 subdev structure
> > + * @ctrl_handler: control handler
> > + * @default_format: default V4L2 media bus format
> > + * @pad: source media pad
> > + * @dev: Platform structure
> > + * @iomem: Base address of subsystem
> > + * @clks: array of clocks
> > + * @prev_is_frac: Previous clock is fractional or not flag
> > + * @bpc: Bits per component, can be 10 or 12
> > + * @mode: 3G/6G/12G mode
> > + * @num_clks: number of clocks
> > + * @include_edh: EDH processor presence
> > + * @slock: spinlock to protect below members
> > + * @format: Active V4L2 format detected
> > + * @src_format: Active V4L2 format on source pad
> > + * @frame_interval: Captures the frame rate
> > + * @current_timings: DV timings from application
> > + * @detected_timings_index: index of DV timings detected on incoming stream
> > + * @vidlockwin: Video lock window value set by control
> > + * @edhmask: EDH mask set by control
> > + * @searchmask: Search mask set by control
> > + * @streaming: Flag for storing streaming state
> > + * @vidlocked: Flag indicating SDI Rx has locked onto video stream
> > + * @ts_is_interlaced: Flag indicating Transport Stream is interlaced.
> > + * @framer_enable: Flag for framer enabled or not set by control
> > + *
> > + * This structure contains the device driver related parameters
> > + */
> > +struct xsdirxss_state {
> > +	struct v4l2_subdev subdev;
> > +	struct v4l2_ctrl_handler ctrl_handler;
> > +	struct v4l2_mbus_framefmt default_format;
> > +	struct media_pad pad;
> > +	struct device *dev;
> > +	void __iomem *iomem;
> > +	struct clk_bulk_data *clks;
> > +	int prev_is_frac;

If I understand the code correctly, this field doesn't store the
previous value but the current value programmed to the hardware. It
could be named clk_is_frac or something similar.

> > +	u32 bpc;
> > +	u32 mode;
> > +	unsigned int num_clks;
> > +	bool include_edh;
> > +
> > +	/*
> > +	 * This spinlock is used to protect the below members
> > +	 * format, src_format, frame_interval, current_timings,
> > +	 * detected_timings_index, vidlockwin, edhmask, searchmask,
> > +	 * streaming, vidlocked, ts_is_interlaced, framer_enable
> > +	 */
> > +	spinlock_t slock;
> > +	struct v4l2_mbus_framefmt format;
> > +	struct v4l2_mbus_framefmt src_format;
> > +	struct v4l2_fract frame_interval;
> > +	struct v4l2_dv_timings current_timings;
> > +	u32 detected_timings_index;
> > +	u32 vidlockwin;
> > +	u32 edhmask;
> > +	u16 searchmask;
> > +	bool streaming;
> > +	bool vidlocked;
> > +	bool ts_is_interlaced;
> > +	bool framer_enable;
> > +};
> > +
> > +/* List of clocks required by UHD-SDI Rx subsystem */
> > +static const char * const xsdirxss_clks[] = {
> > +	"s_axi_aclk", "sdi_rx_clk", "video_out_clk",
> > +};
> > +
> > +/* TODO - Add YUV 444/420 and RBG 10/12 bpc mbus formats here */
> > +static const u32 xsdirxss_10bpc_mbus_fmts[] = {
> > +	MEDIA_BUS_FMT_UYVY10_1X20,
> > +};
> > +
> > +static const u32 xsdirxss_12bpc_mbus_fmts[] = {
> > +	MEDIA_BUS_FMT_UYVY12_1X24,
> > +};
> > +
> > +static const struct v4l2_dv_timings fmt_cap[] = {
> > +	V4L2_DV_BT_SDI_720X487I60,
> > +	V4L2_DV_BT_CEA_720X576I50,
> > +	V4L2_DV_BT_CEA_1280X720P24,
> > +	V4L2_DV_BT_CEA_1280X720P25,
> > +	V4L2_DV_BT_CEA_1280X720P30,
> > +	V4L2_DV_BT_CEA_1280X720P50,
> > +	V4L2_DV_BT_CEA_1280X720P60,
> > +	V4L2_DV_BT_CEA_1920X1080P24,
> > +	V4L2_DV_BT_CEA_1920X1080P30,
> > +	V4L2_DV_BT_CEA_1920X1080I50,
> > +	V4L2_DV_BT_CEA_1920X1080I60,
> > +	V4L2_DV_BT_CEA_1920X1080P48,
> > +	V4L2_DV_BT_CEA_1920X1080P50,
> > +	V4L2_DV_BT_CEA_1920X1080P60,
> > +	V4L2_DV_BT_CEA_3840X2160P24,
> > +	V4L2_DV_BT_CEA_3840X2160P30,
> > +	V4L2_DV_BT_CEA_3840X2160P48,
> > +	V4L2_DV_BT_CEA_3840X2160P50,
> > +	V4L2_DV_BT_CEA_3840X2160P60,
> > +	V4L2_DV_BT_CEA_4096X2160P24,
> > +	V4L2_DV_BT_CEA_4096X2160P25,
> > +	V4L2_DV_BT_CEA_4096X2160P30,
> > +	V4L2_DV_BT_CEA_4096X2160P48,
> > +	V4L2_DV_BT_CEA_4096X2160P50,
> > +	V4L2_DV_BT_CEA_4096X2160P60,
> > +
> > +	XLNX_V4L2_DV_BT_2048X1080P24,
> > +	XLNX_V4L2_DV_BT_2048X1080P25,
> > +	XLNX_V4L2_DV_BT_2048X1080P30,
> > +	XLNX_V4L2_DV_BT_2048X1080I48,
> > +	XLNX_V4L2_DV_BT_2048X1080I50,
> > +	XLNX_V4L2_DV_BT_2048X1080I60,
> > +	XLNX_V4L2_DV_BT_2048X1080P48,
> > +	XLNX_V4L2_DV_BT_2048X1080P50,
> > +	XLNX_V4L2_DV_BT_2048X1080P60,
> > +	XLNX_V4L2_DV_BT_1920X1080I48,
> 
> Looking at this:
> 
> https://www.smpte.org/sites/default/files/images/SMPTE%20wallchart%232.6_20_17-JULY%202017.pdf
> 
> I would think that these formats are defined in one of the smpte standards,
> probably ST 2048-2.
> 
> Can you take a look if you have this standard?
> 
> > +};
> > +
> > +struct xsdirxss_dv_map {
> > +	u32 width;
> > +	u32 height;
> > +	u32 fps;
> > +	struct v4l2_dv_timings timing;
> > +};
> > +
> > +static const struct xsdirxss_dv_map xsdirxss_dv_timings[] = {
> > +	/* SD - 720x487i60 */
> > +	{ 720, 243, 30, V4L2_DV_BT_SDI_720X487I60 },
> > +	/* SD - 720x576i50 */
> > +	{ 720, 288, 25, V4L2_DV_BT_CEA_720X576I50 },
> > +	/* HD - 1280x720p23.98 */
> > +	/* HD - 1280x720p24 */
> > +	{ 1280, 720, 24, V4L2_DV_BT_CEA_1280X720P24 },
> > +	/* HD - 1280x720p25 */
> > +	{ 1280, 720, 25, V4L2_DV_BT_CEA_1280X720P25 },
> > +	/* HD - 1280x720p29.97 */
> > +	/* HD - 1280x720p30 */
> > +	{ 1280, 720, 30, V4L2_DV_BT_CEA_1280X720P30 },
> > +	/* HD - 1280x720p50 */
> > +	{ 1280, 720, 50, V4L2_DV_BT_CEA_1280X720P50 },
> > +	/* HD - 1280x720p59.94 */
> > +	/* HD - 1280x720p60 */
> > +	{ 1280, 720, 60, V4L2_DV_BT_CEA_1280X720P60 },
> > +	/* HD - 1920x1080p23.98 */
> > +	/* HD - 1920x1080p24 */
> > +	{ 1920, 1080, 24, V4L2_DV_BT_CEA_1920X1080P24 },
> > +	/* HD - 1920x1080p25 */
> > +	{ 1920, 1080, 25, V4L2_DV_BT_CEA_1920X1080P25 },
> > +	/* HD - 1920x1080p29.97 */
> > +	/* HD - 1920x1080p30 */
> > +	{ 1920, 1080, 30, V4L2_DV_BT_CEA_1920X1080P30 },
> > +
> > +	/* HD - 2048x1080p23.98 */
> > +	/* HD - 2048x1080p24 */
> > +	{ 2048, 1080, 24, XLNX_V4L2_DV_BT_2048X1080P24 },
> > +	/* HD - 2048x1080p25 */
> > +	{ 2048, 1080, 24, XLNX_V4L2_DV_BT_2048X1080P25 },
> > +	/* HD - 2048x1080p29.97 */
> > +	/* HD - 2048x1080p30 */
> > +	{ 2048, 1080, 24, XLNX_V4L2_DV_BT_2048X1080P30 },
> > +	/* HD - 1920x1080i47.95 */
> > +	/* HD - 1920x1080i48 */
> > +	{ 1920, 540, 24, XLNX_V4L2_DV_BT_1920X1080I48 },
> > +
> > +	/* HD - 1920x1080i50 */
> > +	{ 1920, 540, 25, V4L2_DV_BT_CEA_1920X1080I50 },
> > +	/* HD - 1920x1080i59.94 */
> > +	/* HD - 1920x1080i60 */
> > +	{ 1920, 540, 30, V4L2_DV_BT_CEA_1920X1080I60 },
> > +
> > +	/* HD - 2048x1080i47.95 */
> > +	/* HD - 2048x1080i48 */
> > +	{ 2048, 540, 24, XLNX_V4L2_DV_BT_2048X1080I48 },
> > +	/* HD - 2048x1080i50 */
> > +	{ 2048, 540, 25, XLNX_V4L2_DV_BT_2048X1080I50 },
> > +	/* HD - 2048x1080i59.94 */
> > +	/* HD - 2048x1080i60 */
> > +	{ 2048, 540, 30, XLNX_V4L2_DV_BT_2048X1080I60 },
> > +	/* 3G - 1920x1080p47.95 */
> > +	/* 3G - 1920x1080p48 */
> > +	{ 1920, 1080, 48, V4L2_DV_BT_CEA_1920X1080P48 },
> > +
> > +	/* 3G - 1920x1080p50 148.5 */
> > +	{ 1920, 1080, 50, V4L2_DV_BT_CEA_1920X1080P50 },
> > +	/* 3G - 1920x1080p59.94 148.5/1.001 */
> > +	/* 3G - 1920x1080p60 148.5 */
> > +	{ 1920, 1080, 60, V4L2_DV_BT_CEA_1920X1080P60 },
> > +
> > +	/* 3G - 2048x1080p47.95 */
> > +	/* 3G - 2048x1080p48 */
> > +	{ 2048, 1080, 48, XLNX_V4L2_DV_BT_2048X1080P48 },
> > +	/* 3G - 2048x1080p50 */
> > +	{ 2048, 1080, 50, XLNX_V4L2_DV_BT_2048X1080P50 },
> > +	/* 3G - 2048x1080p59.94 */
> > +	/* 3G - 2048x1080p60 */
> > +	{ 2048, 1080, 60, XLNX_V4L2_DV_BT_2048X1080P60 },
> > +
> > +	/* 6G - 3840X2160p23.98 */
> > +	/* 6G - 3840X2160p24 */
> > +	{ 3840, 2160, 24, V4L2_DV_BT_CEA_3840X2160P24 },
> > +	/* 6G - 3840X2160p25 */
> > +	{ 3840, 2160, 25, V4L2_DV_BT_CEA_3840X2160P25 },
> > +	/* 6G - 3840X2160p29.97 */
> > +	/* 6G - 3840X2160p30 */
> > +	{ 3840, 2160, 30, V4L2_DV_BT_CEA_3840X2160P30 },
> > +	/* 6G - 4096X2160p23.98 */
> > +	/* 6G - 4096X2160p24 */
> > +	{ 4096, 2160, 24, V4L2_DV_BT_CEA_4096X2160P24 },
> > +	/* 6G - 4096X2160p25 */
> > +	{ 4096, 2160, 25, V4L2_DV_BT_CEA_4096X2160P25 },
> > +	/* 6G - 4096X2160p29.97 */
> > +	/* 6G - 4096X2160p30 */
> > +	{ 4096, 2160, 30, V4L2_DV_BT_CEA_4096X2160P30 },
> > +	/* 12G - 3840X2160p47.95 */
> > +	/* 12G - 3840X2160p48 */
> > +	{ 3840, 2160, 48, V4L2_DV_BT_CEA_3840X2160P48 },
> > +
> > +	/* 12G - 3840X2160p50 */
> > +	{ 3840, 2160, 50, V4L2_DV_BT_CEA_3840X2160P50 },
> > +	/* 12G - 3840X2160p59.94 */
> > +	/* 12G - 3840X2160p60 */
> > +	{ 3840, 2160, 60, V4L2_DV_BT_CEA_3840X2160P60 },
> > +
> > +	/* 12G - 4096X2160p47.95 */
> > +	/* 12G - 4096X2160p48 */
> > +	{ 3840, 2160, 48, V4L2_DV_BT_CEA_4096X2160P48 },
> > +
> > +	/* 12G - 4096X2160p50 */
> > +	{ 4096, 2160, 50, V4L2_DV_BT_CEA_4096X2160P50 },
> > +	/* 12G - 4096X2160p59.94 */
> > +	/* 12G - 4096X2160p60 */
> > +	{ 4096, 2160, 60, V4L2_DV_BT_CEA_4096X2160P60 },
> > +};
> > +
> > +static const struct v4l2_dv_timings_cap xsdirxss_timings_cap = {
> > +	.type = V4L2_DV_BT_656_1120,
> > +	.pad = 0,
> > +	.reserved = { 0 },
> > +	V4L2_INIT_BT_TIMINGS(XSDIRXSS_WIDTH_MIN, XSDIRXSS_WIDTH_MAX,
> > +			     XSDIRXSS_HEIGHT_MIN, XSDIRXSS_HEIGHT_MAX,
> > +			     XSDIRXSS_PIXELCLOCK_MIN, XSDIRXSS_PIXELCLOCK_MAX,
> > +			     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_SDI,
> > +			     V4L2_DV_BT_CAP_PROGRESSIVE
> > +			     | V4L2_DV_BT_CAP_INTERLACED)
> > +
> > +};

As this is only used in xsdirxss_dv_timings_cap(), I would just set the
fields there. Up to you.

> > +
> > +struct regmap {
> > +	const char *name;
> > +	u32 offset;
> > +};
> > +
> > +static const struct regmap xsdirxss_regmap[] = {
> > +	{ .name = "Reset Control", .offset = XSDIRX_RST_CTRL_REG },
> > +	{ .name = "Module Control", .offset = XSDIRX_MDL_CTRL_REG },
> > +	{ .name = "Interrupt Enable", .offset = XSDIRX_IER_REG },
> > +	{ .name = "Global Interrupt Enable", .offset = XSDIRX_GLBL_IER_REG },
> > +	{ .name = "ST352 Valid", .offset = XSDIRX_ST352_VALID_REG },
> > +	{ .name = "ST352 DS1", .offset = XSDIRX_ST352_DS1_REG },
> > +	{ .name = "ST352 DS2", .offset = XSDIRX_ST352_DS2_REG },
> > +	{ .name = "ST352 DS3", .offset = XSDIRX_ST352_DS3_REG },
> > +	{ .name = "ST352 DS4", .offset = XSDIRX_ST352_DS4_REG },
> > +	{ .name = "ST352 DS5", .offset = XSDIRX_ST352_DS5_REG },
> > +	{ .name = "ST352 DS6", .offset = XSDIRX_ST352_DS6_REG },
> > +	{ .name = "ST352 DS7", .offset = XSDIRX_ST352_DS7_REG },
> > +	{ .name = "ST352 DS8", .offset = XSDIRX_ST352_DS8_REG },
> > +	{ .name = "ST352 DS9", .offset = XSDIRX_ST352_DS9_REG },
> > +	{ .name = "ST352 DS10", .offset = XSDIRX_ST352_DS10_REG },
> > +	{ .name = "ST352 DS11", .offset = XSDIRX_ST352_DS11_REG },
> > +	{ .name = "ST352 DS12", .offset = XSDIRX_ST352_DS12_REG },
> > +	{ .name = "ST352 DS13", .offset = XSDIRX_ST352_DS13_REG },
> > +	{ .name = "ST352 DS14", .offset = XSDIRX_ST352_DS14_REG },
> > +	{ .name = "ST352 DS15", .offset = XSDIRX_ST352_DS15_REG },
> > +	{ .name = "ST352 DS16", .offset = XSDIRX_ST352_DS16_REG },
> > +	{ .name = "Version", .offset = XSDIRX_VERSION_REG },
> > +	{ .name = "Subsystem Config ", .offset = XSDIRX_SS_CONFIG_REG },
> > +	{ .name = "Mode Detect", .offset = XSDIRX_MODE_DET_STAT_REG },
> > +	{ .name = "Transport Stream Detect", .offset = XSDIRX_TS_DET_STAT_REG },
> > +	{ .name = "EDH Status", .offset = XSDIRX_EDH_STAT_REG },
> > +	{ .name = "EDH Error Count", .offset = XSDIRX_EDH_ERRCNT_EN_REG },
> > +	{ .name = "CRC error indication", .offset = XSDIRX_CRC_ERRCNT_REG },
> > +	{ .name = "Video Lock Window", .offset = XSDIRX_VID_LOCK_WINDOW_REG },
> > +};
> > +
> > +static inline struct xsdirxss_state *
> > +to_xsdirxssstate(struct v4l2_subdev *subdev)
> > +{
> > +	return container_of(subdev, struct xsdirxss_state, subdev);
> > +}
> > +
> > +/*
> > + * Register related operations
> > + */
> > +static inline u32 xsdirxss_read(struct xsdirxss_state *xsdirxss, u32 addr)
> > +{
> > +	return ioread32(xsdirxss->iomem + addr);
> > +}
> > +
> > +static inline void xsdirxss_write(struct xsdirxss_state *xsdirxss, u32 addr,
> > +				  u32 value)
> > +{
> > +	iowrite32(value, xsdirxss->iomem + addr);
> > +}
> > +
> > +static inline void xsdirxss_clr(struct xsdirxss_state *xsdirxss, u32 addr,
> > +				u32 clr)
> > +{
> > +	xsdirxss_write(xsdirxss, addr, xsdirxss_read(xsdirxss, addr) & ~clr);
> > +}
> > +
> > +static inline void xsdirxss_set(struct xsdirxss_state *xsdirxss, u32 addr,
> > +				u32 set)
> > +{
> > +	xsdirxss_write(xsdirxss, addr, xsdirxss_read(xsdirxss, addr) | set);
> > +}
> > +
> > +#define XSDIRX_CORE_DISABLE(state)  xsdirxss_clr((state), XSDIRX_RST_CTRL_REG,\
> > +						 XSDIRX_RST_CTRL_SS_EN_MASK)
> > +
> > +#define XSDIRX_CORE_ENABLE(state)  xsdirxss_set((state), XSDIRX_RST_CTRL_REG,\
> > +						XSDIRX_RST_CTRL_SS_EN_MASK)
> > +
> > +#define XSDIRX_GLOBAL_INTR_ENABLE(state)	\
> > +	xsdirxss_set((state), XSDIRX_GLBL_IER_REG, XSDIRX_GLBL_INTR_EN_MASK)
> > +
> > +#define XSDIRX_GLOBAL_INTR_DISABLE(state)	\
> > +	xsdirxss_clr((state), XSDIRX_GLBL_IER_REG, XSDIRX_GLBL_INTR_EN_MASK)

Any reason to make these macros and not inline functions ?

> > +
> > +static int xsdirx_set_modedetect(struct xsdirxss_state *state, u16 mask)
> > +{
> > +	u32 val;
> > +	struct device *dev = state->dev;
> > +
> > +	mask &= XSDIRX_DETECT_ALL_MODES;
> > +	if (!mask) {
> > +		dev_err(dev, "Invalid bit mask = 0x%08x\n", mask);
> > +		return -EINVAL;
> > +	}
> > +
> > +	dev_dbg(dev, "mask = 0x%x\n", mask);
> > +
> > +	val = xsdirxss_read(state, XSDIRX_MDL_CTRL_REG);
> > +	val &= ~XSDIRX_MDL_CTRL_MODE_DET_EN_MASK;
> > +	val &= ~XSDIRX_MDL_CTRL_MODE_AUTO_DET_MASK;
> > +	val &= ~XSDIRX_MDL_CTRL_FORCED_MODE_MASK;
> > +
> > +	if (hweight16(mask) > 1) {
> > +		/* Multi mode detection as more than 1 bit set in mask */
> > +		dev_dbg(dev, "Detect multiple modes\n");
> > +
> > +		if (mask & BIT(XSDIRX_MODE_SD_OFFSET))
> > +			val |= XSDIRX_MDL_CTRL_MODE_SD_EN_MASK;
> > +		if (mask & BIT(XSDIRX_MODE_HD_OFFSET))
> > +			val |= XSDIRX_MDL_CTRL_MODE_HD_EN_MASK;
> > +		/*
> > +		 * There is only one bit in IP to detect 3G mode.
> > +		 * So set it when 3GA or 3GB mask is set.
> > +		 */
> > +		if (mask & (BIT(XSDIRX_MODE_3GA_OFFSET) |
> > +			    BIT(XSDIRX_MODE_3GB_OFFSET)))
> > +			val |= XSDIRX_MDL_CTRL_MODE_3G_EN_MASK;
> > +		if (mask & BIT(XSDIRX_MODE_6G_OFFSET))
> > +			val |= XSDIRX_MDL_CTRL_MODE_6G_EN_MASK;
> > +		if (mask & BIT(XSDIRX_MODE_12GI_OFFSET))
> > +			val |= XSDIRX_MDL_CTRL_MODE_12GI_EN_MASK;
> > +		if (mask & BIT(XSDIRX_MODE_12GF_OFFSET))
> > +			val |= XSDIRX_MDL_CTRL_MODE_12GF_EN_MASK;
> > +
> > +		val |= XSDIRX_MDL_CTRL_MODE_DET_EN_MASK;
> > +	} else {
> > +		/* Fixed Mode */
> > +		u32 forced_mode_mask;
> > +
> > +		dev_dbg(dev, "Detect fixed mode\n");
> > +
> > +		/* Find offset of first bit set */
> > +		switch (mask) {
> > +		case XSDIRX_MODE_SD_OFFSET:
> > +			forced_mode_mask = XSDIRX_MODE_SD_MASK;
> > +			break;
> > +		case XSDIRX_MODE_HD_OFFSET:
> > +			forced_mode_mask = XSDIRX_MODE_HD_MASK;
> > +			break;
> > +		/*
> > +		 * There is only one bit in IP to detect 3G mode.
> > +		 * So set it when 3GA or 3GB mask is set.
> > +		 */
> > +		case XSDIRX_MODE_3GA_OFFSET:
> > +		case XSDIRX_MODE_3GB_OFFSET:
> > +			forced_mode_mask = XSDIRX_MODE_3G_MASK;
> > +			break;
> > +		case XSDIRX_MODE_6G_OFFSET:
> > +			forced_mode_mask = XSDIRX_MODE_6G_MASK;
> > +			break;
> > +		case XSDIRX_MODE_12GI_OFFSET:
> > +			forced_mode_mask = XSDIRX_MODE_12GI_MASK;
> > +			break;
> > +		case XSDIRX_MODE_12GF_OFFSET:
> > +			forced_mode_mask = XSDIRX_MODE_12GF_MASK;
> > +			break;
> > +		default:
> > +			dev_err(dev, "Invalid mask for fixed detect mode\n");
> > +			return -EINVAL;
> > +		}
> > +		dev_dbg(dev, "Forced Mode Mask : 0x%x\n",
> > +			forced_mode_mask);
> > +		val |= forced_mode_mask << XSDIRX_MDL_CTRL_FORCED_MODE_OFFSET;
> > +	}
> > +
> > +	dev_dbg(dev, "Modes to be detected : sdi ctrl reg = 0x%08x\n",
> > +		val);
> > +	xsdirxss_write(state, XSDIRX_MDL_CTRL_REG, val);
> > +
> > +	return 0;
> > +}
> > +
> > +static void xsdirx_streamflow_control(struct xsdirxss_state *state, bool enable)
> > +{
> > +	/* The sdi to native bridge is followed by native to axis4 bridge */
> > +	/*
> > +	 * TODO - Enable YUV444/RBG format in the bridge based
> > +	 * on BYTE3 color format.
> > +	 * XSDIRX_RST_CTRL_BRIDGE_CH_FMT_YUV444
> > +	 */
> > +	if (enable) {
> > +		xsdirxss_set(state, XSDIRX_RST_CTRL_REG,
> > +			     XSDIRX_RST_CTRL_VIDIN_AXI4S_MOD_ENB_MASK);
> > +		xsdirxss_set(state, XSDIRX_RST_CTRL_REG,
> > +			     XSDIRX_RST_CTRL_SDIRX_BRIDGE_ENB_MASK);
> > +	} else {
> > +		xsdirxss_clr(state, XSDIRX_RST_CTRL_REG,
> > +			     XSDIRX_RST_CTRL_SDIRX_BRIDGE_ENB_MASK);
> > +		xsdirxss_clr(state, XSDIRX_RST_CTRL_REG,
> > +			     XSDIRX_RST_CTRL_VIDIN_AXI4S_MOD_ENB_MASK);
> > +	}
> > +	state->streaming = enable;
> > +}
> > +
> > +static void xsdirxss_get_framerate(struct v4l2_fract *frame_interval,
> > +				   u32 framerate)
> > +{
> > +	switch (framerate) {
> > +	case XSDIRX_TS_DET_STAT_RATE_23_98HZ:
> > +		frame_interval->numerator = 1001;
> > +		frame_interval->denominator = 24000;
> > +		break;
> > +	case XSDIRX_TS_DET_STAT_RATE_24HZ:
> > +		frame_interval->numerator = 1000;
> > +		frame_interval->denominator = 24000;
> > +		break;
> > +	case XSDIRX_TS_DET_STAT_RATE_25HZ:
> > +		frame_interval->numerator = 1000;
> > +		frame_interval->denominator = 25000;
> > +		break;
> > +	case XSDIRX_TS_DET_STAT_RATE_29_97HZ:
> > +		frame_interval->numerator = 1001;
> > +		frame_interval->denominator = 30000;
> > +		break;
> > +	case XSDIRX_TS_DET_STAT_RATE_30HZ:
> > +		frame_interval->numerator = 1000;
> > +		frame_interval->denominator = 30000;
> > +		break;
> > +	case XSDIRX_TS_DET_STAT_RATE_47_95HZ:
> > +		frame_interval->numerator = 1001;
> > +		frame_interval->denominator = 48000;
> > +		break;
> > +	case XSDIRX_TS_DET_STAT_RATE_48HZ:
> > +		frame_interval->numerator = 1000;
> > +		frame_interval->denominator = 48000;
> > +		break;
> > +	case XSDIRX_TS_DET_STAT_RATE_50HZ:
> > +		frame_interval->numerator = 1000;
> > +		frame_interval->denominator = 50000;
> > +		break;
> > +	case XSDIRX_TS_DET_STAT_RATE_59_94HZ:
> > +		frame_interval->numerator = 1001;
> > +		frame_interval->denominator = 60000;
> > +		break;
> > +	case XSDIRX_TS_DET_STAT_RATE_60HZ:
> > +		frame_interval->numerator = 1000;
> > +		frame_interval->denominator = 60000;
> > +		break;
> > +	default:
> > +		frame_interval->numerator = 1;
> > +		frame_interval->denominator = 1;
> > +	}
> > +}
> > +
> > +static void xsdirxss_set_gtclk(struct xsdirxss_state *state)
> > +{
> > +	struct clk *gtclk;
> > +	unsigned long clkrate;
> > +	int ret, is_frac;
> > +	u32 mode;
> > +
> > +	mode = xsdirxss_read(state, XSDIRX_MODE_DET_STAT_REG);
> > +	mode &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> > +
> > +	/*
> > +	 * TODO: For now, don't change the clock rate for any mode except 12G.
> > +	 * In future, configure gt clock for all modes and enable clock only
> > +	 * when needed (stream on/off).
> > +	 */
> > +	if (mode != XSDIRX_MODE_12GI_MASK && mode != XSDIRX_MODE_12GF_MASK)
> > +		return;
> > +
> > +	/* When numerator is 1001 then frame rate is fractional else integer */
> > +	is_frac = state->frame_interval.numerator == 1001 ? 1 : 0;
> > +
> > +	if (state->prev_is_frac == is_frac)
> > +		return;
> > +
> > +	XSDIRX_GLOBAL_INTR_DISABLE(state);
> > +	xsdirxss_clr(state, XSDIRX_IER_REG, XSDIRX_INTR_ALL_MASK);
> > +	XSDIRX_CORE_DISABLE(state);
> > +
> > +	/* get sdi_rx_clk */
> > +	gtclk = state->clks[1].clk;
> > +
> > +	/* calculate clkrate */
> > +	if (!is_frac)
> > +		clkrate = CLK_INT;
> > +	else
> > +		clkrate = (CLK_INT * 1000) / 1001;
> > +
> > +	ret = clk_set_rate(gtclk, clkrate);

This function is called from the IRQ handler, and with a spinlock held.
clk_set_rate() can sleep as the clock source can be an external
I2C-controlled chip. Have you tested this code path ? I think taking the
spinlock at top level locations will need to be reconsidered.

> > +	if (ret)
> > +		dev_err(state->dev, "failed to set clk rate = %d\n", ret);
> > +
> > +	state->prev_is_frac = is_frac;
> > +	clkrate = clk_get_rate(gtclk);
> > +
> > +	dev_dbg(state->dev, "clkrate = %lu is_frac = %d\n",
> > +		clkrate, is_frac);
> > +
> > +	if (state->framer_enable) {
> > +		xsdirxss_set(state, XSDIRX_MDL_CTRL_REG,
> > +			     XSDIRX_MDL_CTRL_FRM_EN_MASK);
> > +	} else {
> > +		xsdirxss_clr(state, XSDIRX_MDL_CTRL_REG,
> > +			     XSDIRX_MDL_CTRL_FRM_EN_MASK);
> > +	}

No need for braces.

> > +	xsdirxss_write(state, XSDIRX_EDH_ERRCNT_EN_REG,
> > +		       state->edhmask & XSDIRX_EDH_ALLERR_MASK);
> > +	xsdirxss_write(state, XSDIRX_VID_LOCK_WINDOW_REG, state->vidlocked);
> > +	xsdirx_set_modedetect(state, state->searchmask);
> > +	XSDIRX_CORE_ENABLE(state);
> > +	xsdirxss_set(state, XSDIRX_IER_REG, XSDIRX_INTR_ALL_MASK);
> > +	XSDIRX_GLOBAL_INTR_ENABLE(state);
> > +}
> > +
> > +/**
> > + * xsdirx_get_stream_properties - Get SDI Rx stream properties
> > + * @state: pointer to driver state
> > + *
> > + * This function decodes the stream's ST352 payload (if available) to get
> > + * stream properties like width, height, picture type (interlaced/progressive),
> > + * etc.
> > + *
> > + * Return: 0 for success else errors
> > + */
> > +static int xsdirx_get_stream_properties(struct xsdirxss_state *state)
> > +{
> > +	struct device *dev = state->dev;
> > +	u32 mode, payload = 0, val, family, valid, tscan;
> > +	u8 byte1 = 0, active_luma = 0, pic_type = 0, framerate = 0;
> > +	u8 sampling = XST352_BYTE3_COLOR_FORMAT_422;
> > +	struct v4l2_mbus_framefmt *format = &state->format;
> > +	u32 bpc = XST352_BYTE4_BIT_DEPTH_10;
> > +	u32 colorimetry = XST352_BYTE3_COLORIMETRY_BT709;
> > +
> > +	mode = xsdirxss_read(state, XSDIRX_MODE_DET_STAT_REG);
> > +	mode &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> > +
> > +	valid = xsdirxss_read(state, XSDIRX_ST352_VALID_REG);
> > +
> > +	if (mode >= XSDIRX_MODE_3G_MASK && !valid) {
> > +		dev_err(dev, "No valid ST352 payload present even for 3G mode and above\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	val = xsdirxss_read(state, XSDIRX_TS_DET_STAT_REG);
> > +	if (valid & XSDIRX_ST352_VALID_DS1_MASK) {
> > +		payload = xsdirxss_read(state, XSDIRX_ST352_DS1_REG);
> > +		byte1 = FIELD_GET(XST352_PAYLOAD_BYTE1_MASK, payload);
> > +		active_luma = FIELD_GET(XST352_BYTE3_ACT_LUMA_COUNT_MASK,
> > +					payload);
> > +		pic_type = FIELD_GET(XST352_BYTE2_PIC_TYPE_MASK, payload);
> > +		framerate = FIELD_GET(XST352_BYTE2_FPS_MASK, payload);
> > +		tscan = FIELD_GET(XST352_BYTE2_TS_TYPE_MASK, payload);
> > +		sampling = FIELD_GET(XST352_BYTE3_COLOR_FORMAT_MASK, payload);
> > +		bpc = FIELD_GET(XST352_BYTE4_BIT_DEPTH_MASK, payload);
> > +		colorimetry = FIELD_GET(XST352_BYTE3_COLORIMETRY_MASK, payload);
> > +	} else {
> > +		dev_dbg(dev, "No ST352 payload available : Mode = %d\n", mode);
> > +		framerate = FIELD_GET(XSDIRX_TS_DET_STAT_RATE_MASK, val);
> > +		tscan = FIELD_GET(XSDIRX_TS_DET_STAT_SCAN_MASK, val);
> > +	}
> > +
> > +	if ((bpc == XST352_BYTE4_BIT_DEPTH_10 && state->bpc != 10) ||
> > +	    (bpc == XST352_BYTE4_BIT_DEPTH_12 && state->bpc != 12)) {
> > +		dev_dbg(dev, "Bit depth not supported. bpc = %d state->bpc = %d\n",
> > +			bpc, state->bpc);
> > +		return -EINVAL;
> > +	}
> > +
> > +	family = FIELD_GET(XSDIRX_TS_DET_STAT_FAMILY_MASK, val);
> > +	state->ts_is_interlaced = tscan ? false : true;
> > +
> > +	dev_dbg(dev, "ts_is_interlaced = %d, family = %d\n",
> > +		state->ts_is_interlaced, family);
> > +
> > +	switch (mode) {
> > +	case XSDIRX_MODE_HD_MASK:
> > +		if (!valid) {
> > +			/* No payload obtained */
> > +			dev_dbg(dev, "frame rate : %d, tscan = %d\n",
> > +				framerate, tscan);
> > +			/*
> > +			 * NOTE : A progressive segmented frame pSF will be
> > +			 * reported incorrectly as Interlaced as we rely on IP's
> > +			 * transport scan locked bit.
> > +			 */
> > +			dev_warn(dev, "pSF will be incorrectly reported as Interlaced\n");
> > +
> > +			switch (framerate) {
> > +			case XSDIRX_TS_DET_STAT_RATE_23_98HZ:
> > +			case XSDIRX_TS_DET_STAT_RATE_24HZ:
> > +			case XSDIRX_TS_DET_STAT_RATE_25HZ:
> > +			case XSDIRX_TS_DET_STAT_RATE_29_97HZ:
> > +			case XSDIRX_TS_DET_STAT_RATE_30HZ:
> > +				if (family == XSDIRX_SMPTE_ST_296) {
> > +					format->width = 1280;
> > +					format->height = 720;
> > +					format->field = V4L2_FIELD_NONE;
> > +				} else if (family == XSDIRX_SMPTE_ST_2048_2) {
> > +					format->width = 2048;
> > +					format->height = 1080;
> > +					if (tscan)
> > +						format->field = V4L2_FIELD_NONE;
> > +					else
> > +						format->field =
> > +							V4L2_FIELD_ALTERNATE;
> > +				} else {
> > +					format->width = 1920;
> > +					format->height = 1080;
> > +					if (tscan)
> > +						format->field = V4L2_FIELD_NONE;
> > +					else
> > +						format->field =
> > +							V4L2_FIELD_ALTERNATE;
> > +				}
> > +				break;
> > +			case XSDIRX_TS_DET_STAT_RATE_50HZ:
> > +			case XSDIRX_TS_DET_STAT_RATE_59_94HZ:
> > +			case XSDIRX_TS_DET_STAT_RATE_60HZ:
> > +				if (family == XSDIRX_SMPTE_ST_274) {
> > +					format->width = 1920;
> > +					format->height = 1080;
> > +				} else {
> > +					format->width = 1280;
> > +					format->height = 720;
> > +				}
> > +				format->field = V4L2_FIELD_NONE;
> > +				break;
> > +			default:
> > +				format->width = 1920;
> > +				format->height = 1080;
> > +				format->field = V4L2_FIELD_NONE;
> > +			}
> > +		} else {
> > +			dev_dbg(dev, "Got the payload\n");
> > +			switch (byte1) {
> > +			case XST352_BYTE1_ST292_1x720L_1_5G:
> > +				/* SMPTE ST 292-1 for 720 line payloads */
> > +				format->width = 1280;
> > +				format->height = 720;
> > +				break;
> > +			case XST352_BYTE1_ST292_1x1080L_1_5G:
> > +				/* SMPTE ST 292-1 for 1080 line payloads */
> > +				format->height = 1080;
> > +				if (active_luma)
> > +					format->width = 2048;
> > +				else
> > +					format->width = 1920;
> > +				break;
> > +			default:
> > +				dev_dbg(dev, "Unknown HD Mode SMPTE standard\n");
> > +				return -EINVAL;
> > +			}
> > +		}
> > +		break;
> > +	case XSDIRX_MODE_SD_MASK:
> > +		format->field = V4L2_FIELD_ALTERNATE;
> > +
> > +		switch (family) {
> > +		case XSDIRX_NTSC:
> > +			format->width = 720;
> > +			format->height = 486;
> > +			break;
> > +		case XSDIRX_PAL:
> > +			format->width = 720;
> > +			format->height = 576;
> > +			break;
> > +		default:
> > +			dev_dbg(dev, "Unknown SD Mode SMPTE standard\n");
> > +			return -EINVAL;
> > +		}
> > +		break;
> > +	case XSDIRX_MODE_3G_MASK:
> > +		switch (byte1) {
> > +		case XST352_BYTE1_ST425_2008_750L_3GB:
> > +			/* Sec 4.1.6.1 SMPTE 425-2008 */
> > +		case XST352_BYTE1_ST372_2x720L_3GB:
> > +			/* Table 13 SMPTE 425-2008 */
> > +			format->width = 1280;
> > +			format->height = 720;
> > +			break;
> > +		case XST352_BYTE1_ST425_2008_1125L_3GA:
> > +			/* ST352 Table SMPTE 425-1 */
> > +		case XST352_BYTE1_ST372_DL_3GB:
> > +			/* Table 13 SMPTE 425-2008 */
> > +		case XST352_BYTE1_ST372_2x1080L_3GB:
> > +			/* Table 13 SMPTE 425-2008 */
> > +			format->height = 1080;
> > +			if (active_luma)
> > +				format->width = 2048;
> > +			else
> > +				format->width = 1920;
> > +			break;
> > +		default:
> > +			dev_dbg(dev, "Unknown 3G Mode SMPTE standard\n");
> > +			return -EINVAL;
> > +		}
> > +		break;
> > +	case XSDIRX_MODE_6G_MASK:
> > +		switch (byte1) {
> > +		case XST352_BYTE1_ST2081_10_DL_2160L_6G:
> > +			/* Dual link 6G */
> > +		case XST352_BYTE1_ST2081_10_2160L_6G:
> > +			/* Table 3 SMPTE ST 2081-10 */
> > +			format->height = 2160;
> > +			if (active_luma)
> > +				format->width = 4096;
> > +			else
> > +				format->width = 3840;
> > +			break;
> > +		case XST352_BYTE1_ST2081_10_2_1080L_6G:
> > +			format->height = 1080;
> > +			if (active_luma)
> > +				format->width = 2048;
> > +			else
> > +				format->width = 1920;
> > +			break;
> > +		default:
> > +			dev_dbg(dev, "Unknown 6G Mode SMPTE standard\n");
> > +			return -EINVAL;
> > +		}
> > +		break;
> > +	case XSDIRX_MODE_12GI_MASK:
> > +	case XSDIRX_MODE_12GF_MASK:
> > +		switch (byte1) {
> > +		case XST352_BYTE1_ST2082_10_2160L_12G:
> > +			/* Section 4.3.1 SMPTE ST 2082-10 */
> > +			format->height = 2160;
> > +			if (active_luma)
> > +				format->width = 4096;
> > +			else
> > +				format->width = 3840;
> > +			break;
> > +		default:
> > +			dev_dbg(dev, "Unknown 12G Mode SMPTE standard\n");
> > +			return -EINVAL;
> > +		}
> > +		break;
> > +	default:
> > +		dev_err(dev, "Invalid Mode\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (valid) {
> > +		if (pic_type)
> > +			format->field = V4L2_FIELD_NONE;
> > +		else
> > +			format->field = V4L2_FIELD_ALTERNATE;
> > +
> > +		if (format->height == 1080 && pic_type && !tscan)
> > +			format->field = V4L2_FIELD_ALTERNATE;
> > +
> > +		/*
> > +		 * In 3GB DL pSF mode the video is similar to interlaced.
> > +		 * So though it is a progressive video, its transport is
> > +		 * interlaced and is sent as two width x (height/2) buffers.
> > +		 */
> > +		if (byte1 == XST352_BYTE1_ST372_DL_3GB) {
> > +			if (state->ts_is_interlaced)
> > +				format->field = V4L2_FIELD_ALTERNATE;
> > +			else
> > +				format->field = V4L2_FIELD_NONE;
> > +		}
> > +	}
> > +
> > +	if (format->field == V4L2_FIELD_ALTERNATE)
> > +		format->height = format->height / 2;
> > +
> > +	switch (sampling) {
> > +	case XST352_BYTE3_COLOR_FORMAT_422:
> > +		if (state->bpc == 10)
> > +			format->code = MEDIA_BUS_FMT_UYVY10_1X20;
> > +		else
> > +			format->code = MEDIA_BUS_FMT_UYVY12_1X24;
> > +		break;
> > +	case XST352_BYTE3_COLOR_FORMAT_420:
> > +	case XST352_BYTE3_COLOR_FORMAT_YUV444:
> > +	case XST352_BYTE3_COLOR_FORMAT_GBR:
> > +		format->code = 0;
> > +		dev_dbg(dev, "No corresponding media bus formats\n");
> > +		break;
> > +	default:
> > +		dev_err(dev, "Unsupported color format : %d\n", sampling);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Refer Table 3 SMPTE ST 2081-10:2018 */
> > +	switch (colorimetry) {
> > +	case XST352_BYTE3_COLORIMETRY_BT709:
> > +		format->colorspace = V4L2_COLORSPACE_REC709;
> > +		break;
> > +	/* When HDR support is added UHDTV will have BT2020 colorspace */
> > +	case XST352_BYTE3_COLORIMETRY_UHDTV:
> > +	case XST352_BYTE3_COLORIMETRY_COLOR_VANC:
> > +	case XST352_BYTE3_COLORIMETRY_UNKNOWN:
> > +	default:
> > +		dev_err(dev, "Unknown colorimetry : %d\n", colorimetry);
> 
> I'm a bit surprised. I would expect that SDTV over SDI would use
> V4L2_COLORSPACE_SMPTE170M, but I don't see that here.
> 
> > +		return -EINVAL;
> > +	}
> > +
> > +	xsdirxss_get_framerate(&state->frame_interval, framerate);
> > +
> > +	dev_dbg(dev, "Stream width = %d height = %d Field = %d payload = 0x%08x ts = 0x%08x\n",
> > +		format->width, format->height, format->field, payload, val);
> > +	dev_dbg(dev, "frame rate numerator = %d denominator = %d\n",
> > +		state->frame_interval.numerator,
> > +		state->frame_interval.denominator);
> > +	dev_dbg(dev, "Stream code = 0x%x\n", format->code);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xsdirxss_irq_handler - Interrupt handler for SDI Rx
> > + * @irq: IRQ number
> > + * @dev_id: Pointer to device state
> > + *
> > + * The SDI Rx interrupts are cleared by writing 1 to corresponding bit.
> > + *
> > + * Return: IRQ_HANDLED after handling interrupts
> > + */
> > +static irqreturn_t xsdirxss_irq_handler(int irq, void *dev_id)
> > +{
> > +	struct xsdirxss_state *state = (struct xsdirxss_state *)dev_id;
> > +	struct device *dev = state->dev;
> > +	u32 status;
> > +
> > +	status = xsdirxss_read(state, XSDIRX_ISR_REG);
> > +	xsdirxss_write(state, XSDIRX_ISR_REG, status);
> > +	dev_dbg(dev, "interrupt status = 0x%08x\n", status);
> > +
> > +	if (!status)
> > +		return IRQ_NONE;
> > +
> > +	if (status & XSDIRX_INTR_VIDLOCK_MASK ||
> > +	    status & XSDIRX_INTR_VIDUNLOCK_MASK) {
> > +		u32 val1, val2;
> > +		struct v4l2_event event = { 0 };
> > +		unsigned long flags;
> > +
> > +		dev_dbg(dev, "video lock/unlock interrupt\n");
> > +
> > +		spin_lock_irqsave(&state->slock, flags);
> > +		xsdirx_streamflow_control(state, false);
> > +
> > +		val1 = xsdirxss_read(state, XSDIRX_MODE_DET_STAT_REG);
> > +		val2 = xsdirxss_read(state, XSDIRX_TS_DET_STAT_REG);
> > +
> > +		if ((val1 & XSDIRX_MODE_DET_STAT_MODE_LOCK_MASK) &&
> > +		    (val2 & XSDIRX_TS_DET_STAT_LOCKED_MASK)) {
> > +			u32 mask = XSDIRX_RST_CTRL_RST_CRC_ERRCNT_MASK |
> > +				   XSDIRX_RST_CTRL_RST_EDH_ERRCNT_MASK;
> > +
> > +			dev_dbg(dev, "video lock interrupt\n");
> > +
> > +			xsdirxss_set(state, XSDIRX_RST_CTRL_REG, mask);
> > +			xsdirxss_clr(state, XSDIRX_RST_CTRL_REG, mask);
> > +
> > +			val1 = xsdirxss_read(state, XSDIRX_ST352_VALID_REG);
> > +			val2 = xsdirxss_read(state, XSDIRX_ST352_DS1_REG);
> > +
> > +			dev_dbg(dev, "valid st352 mask = 0x%08x\n", val1);
> > +			dev_dbg(dev, "st352 payload = 0x%08x\n", val2);
> > +
> > +			if (!xsdirx_get_stream_properties(state)) {
> > +				state->vidlocked = true;
> > +				xsdirxss_set_gtclk(state);
> > +			} else {
> > +				dev_err(dev, "Unable to get stream properties!\n");
> > +				state->vidlocked = false;
> > +			}
> > +		} else {
> > +			dev_dbg(dev, "video unlock interrupt\n");
> > +			state->vidlocked = false;
> > +		}
> > +		spin_unlock_irqrestore(&state->slock, flags);
> > +
> > +		event.type = V4L2_EVENT_SOURCE_CHANGE;
> > +		event.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION;
> > +		v4l2_subdev_notify_event(&state->subdev, &event);
> > +	}
> > +
> > +	if (status & (XSDIRX_INTR_UNDERFLOW_MASK | XSDIRX_INTR_OVERFLOW_MASK)) {
> > +		struct v4l2_event event = { 0 };
> > +
> > +		dev_dbg(dev, "Video in to AXI4 Stream core under/overflow interrupt\n");
> > +
> > +		event.type = V4L2_EVENT_XILINX_SDIRX_UND_OVR_FLOW;
> > +		if (status & XSDIRX_INTR_UNDERFLOW_MASK)
> > +			event.u.data[0] = XILINX_SDIRX_UNDERFLOW_EVENT;

Should this be

			event.u.data[0] |= XILINX_SDIRX_UNDERFLOW_EVENT;

> > +		if (status & XSDIRX_INTR_OVERFLOW_MASK)
> > +			event.u.data[0] = XILINX_SDIRX_OVERFLOW_EVENT;

And this

			event.u.data[0] |= XILINX_SDIRX_OVERFLOW_EVENT;

in case both underflow and overflow need to be reported at the same time
? I'm not sure that can happen in practice though, but even if it can't,
it also won't hurt to treat the field as a bitflag.

> > +
> > +		v4l2_subdev_notify_event(&state->subdev, &event);
> > +	}
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +/**
> > + * xsdirxss_subscribe_event - Subscribe to video lock and unlock event
> > + * @sd: V4L2 Sub device
> > + * @fh: V4L2 File Handle
> > + * @sub: Subcribe event structure
> > + *
> > + * Return: 0 on success, errors otherwise
> > + */
> > +static int xsdirxss_subscribe_event(struct v4l2_subdev *sd,
> > +				    struct v4l2_fh *fh,
> > +				    struct v4l2_event_subscription *sub)
> > +{
> > +	int ret;
> > +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> > +
> > +	dev_dbg(xsdirxss->dev, "Event subscribed : 0x%08x\n", sub->type);
> > +	switch (sub->type) {
> > +	case V4L2_EVENT_XILINX_SDIRX_UND_OVR_FLOW:
> > +		ret = v4l2_event_subscribe(fh, sub, XSDIRX_MAX_EVENTS, NULL);
> > +		break;
> > +	case V4L2_EVENT_SOURCE_CHANGE:
> > +		ret = v4l2_src_change_event_subscribe(fh, sub);
> > +		break;
> > +	default:
> > +		ret = v4l2_ctrl_subscribe_event(fh, sub);

It's customary to have a break at the end of the last case.

> > +	}
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xsdirxss_s_ctrl - This is used to set the Xilinx SDI Rx V4L2 controls
> > + * @ctrl: V4L2 control to be set
> > + *
> > + * This function is used to set the V4L2 controls for the Xilinx SDI Rx
> > + * Subsystem.
> > + *
> > + * Return: 0 on success, errors otherwise
> > + */
> > +static int xsdirxss_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	int ret = 0;
> > +	struct xsdirxss_state *xsdirxss =
> > +		container_of(ctrl->handler, struct xsdirxss_state,
> > +			     ctrl_handler);
> > +	struct device *dev = xsdirxss->dev;
> > +	unsigned long flags;
> > +
> > +	dev_dbg(dev, "set ctrl id = 0x%08x val = 0x%08x\n",
> > +		ctrl->id, ctrl->val);
> > +
> > +	spin_lock_irqsave(&xsdirxss->slock, flags);
> > +
> > +	if (xsdirxss->streaming) {
> > +		spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +		dev_err(dev, "Cannot set controls while streaming\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	XSDIRX_CORE_DISABLE(xsdirxss);
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_XILINX_SDIRX_FRAMER:
> > +		xsdirxss->framer_enable = ctrl->val;
> > +		if (xsdirxss->framer_enable) {
> > +			xsdirxss_set(xsdirxss, XSDIRX_MDL_CTRL_REG,
> > +				     XSDIRX_MDL_CTRL_FRM_EN_MASK);
> > +		} else {
> > +			xsdirxss_clr(xsdirxss, XSDIRX_MDL_CTRL_REG,
> > +				     XSDIRX_MDL_CTRL_FRM_EN_MASK);
> > +		}
> > +		break;
> > +	case V4L2_CID_XILINX_SDIRX_VIDLOCK_WINDOW:
> > +		/*
> > +		 * The video lock window is the amount of time for which the
> > +		 * the mode and transport stream should be locked to get the
> > +		 * video lock interrupt.
> > +		 */
> > +		xsdirxss->vidlockwin = ctrl->val;
> > +		xsdirxss_write(xsdirxss, XSDIRX_VID_LOCK_WINDOW_REG,
> > +			       xsdirxss->vidlockwin);
> > +		break;
> > +	case V4L2_CID_XILINX_SDIRX_EDH_ERROR_SOURCES:
> > +		xsdirxss->edhmask = ctrl->val & XSDIRX_EDH_ALLERR_MASK;
> 
> The '& XSDIRX_EDH_ALLERR_MASK' is not needed since the control's 'max' value
> is set to XSDIRX_EDH_ALLERR_MASK, so ctrl->val can't contain any other bits.
> The control framework ensures that.
> 
> > +		xsdirxss_write(xsdirxss, XSDIRX_EDH_ERRCNT_EN_REG,
> > +			       xsdirxss->edhmask);
> > +		break;
> > +	case V4L2_CID_XILINX_SDIRX_SEARCH_MODES:
> > +		if (!ctrl->val) {
> 
> This check should be done in a try_ctrl function instead of s_ctrl.
> 
> Interesting, this is the first bitmask control where you don't want it to
> be 0. If we get more of these in the future, then it would make sense if this
> is supported in the control framework itself (e.g. if min is set to 1, then
> that means that the value can't be 0). But for now just check this in the
> try_ctrl() function.
> 
> > +			spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +			dev_err(dev, "Select at least one mode!\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (xsdirxss->mode == XSDI_STD_3G) {
> > +			dev_dbg(dev, "Upto 3G supported\n");
> > +			ctrl->val &= ~(BIT(XSDIRX_MODE_6G_OFFSET) |
> > +				       BIT(XSDIRX_MODE_12GI_OFFSET) |
> > +				       BIT(XSDIRX_MODE_12GF_OFFSET));
> > +		}
> > +
> > +		if (xsdirxss->mode == XSDI_STD_6G) {
> > +			dev_dbg(dev, "Upto 6G supported\n");
> > +			ctrl->val &= ~(BIT(XSDIRX_MODE_12GI_OFFSET) |
> > +				       BIT(XSDIRX_MODE_12GF_OFFSET));
> > +		}
> 
> This shouldn't be done here. Instead the 'max' field of the control must be
> set correctly based on the mode. You can call v4l2_ctrl_modify_range() in
> xsdirxss_probe() to update the max value.

Hans, I wrote this comment in v2:

"The traditional approach to select timing standards is to use ioctls.
Hans, do you think a custom control is fine here, or should the dv
timings ioctls be extended (or new sdi timings ioctls created) ?

If we go for a single control, I'm a bit concerned that this control
will restrict the search when multiple bits are set, but force a
specific mode when a single bit is set. I don't have enough experience
with SDI to tell whether this is the right behaviour."

What do you think ? It's of course hard to standardize an API with a
single device as an example (although there's also a spec to help here),
so I'm not opposed to using controls in this driver.

> > +
> > +		ret = xsdirx_set_modedetect(xsdirxss, ctrl->val);
> > +		if (!ret)
> > +			xsdirxss->searchmask = ctrl->val;
> > +		break;
> > +	default:
> > +		ret = -EINVAL;
> > +		break;
> > +	}
> > +	XSDIRX_CORE_ENABLE(xsdirxss);
> > +
> > +	spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xsdirxss_g_volatile_ctrl - get the Xilinx SDI Rx controls
> > + * @ctrl: Pointer to V4L2 control
> > + *
> > + * Return: 0 on success, errors otherwise
> > + */
> > +static int xsdirxss_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	u32 val;
> > +	struct xsdirxss_state *xsdirxss =
> > +		container_of(ctrl->handler,
> > +			     struct xsdirxss_state, ctrl_handler);
> > +	struct device *dev = xsdirxss->dev;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&xsdirxss->slock, flags);
> > +	if (!xsdirxss->vidlocked) {
> > +		spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +		dev_err(dev, "Can't get values when video not locked!\n");
> > +		return -EINVAL;
> > +	}
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_XILINX_SDIRX_MODE_DETECT:
> > +		val = xsdirxss_read(xsdirxss, XSDIRX_MODE_DET_STAT_REG);
> > +		val &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> > +
> > +		switch (val) {
> > +		case XSDIRX_MODE_SD_MASK:
> > +			ctrl->val = XSDIRX_MODE_SD_OFFSET;
> > +			break;
> > +		case XSDIRX_MODE_HD_MASK:
> > +			ctrl->val = XSDIRX_MODE_HD_OFFSET;
> > +			break;
> > +		case XSDIRX_MODE_3G_MASK:
> > +			val = xsdirxss_read(xsdirxss, XSDIRX_MODE_DET_STAT_REG);
> > +			val &= XSDIRX_MODE_DET_STAT_LVLB_3G_MASK;
> > +			ctrl->val = val ? XSDIRX_MODE_3GB_OFFSET :
> > +				XSDIRX_MODE_3GA_OFFSET;
> > +			break;
> > +		case XSDIRX_MODE_6G_MASK:
> > +			ctrl->val = XSDIRX_MODE_6G_OFFSET;
> > +			break;
> > +		case XSDIRX_MODE_12GI_MASK:
> > +			ctrl->val = XSDIRX_MODE_12GI_OFFSET;
> > +			break;
> > +		case XSDIRX_MODE_12GF_MASK:
> > +			ctrl->val = XSDIRX_MODE_12GF_OFFSET;
> > +			break;
> > +		}
> 
> There is no interrupt that will tell you when the mode changes? It's much
> nicer if updating this control is interrupt driven rather than requiring
> userspace to poll.
> 
> > +		break;
> > +	case V4L2_CID_XILINX_SDIRX_CRC:
> > +		ctrl->val = xsdirxss_read(xsdirxss, XSDIRX_CRC_ERRCNT_REG);
> > +		xsdirxss_write(xsdirxss, XSDIRX_CRC_ERRCNT_REG, 0xffff);
> > +		break;
> > +	case V4L2_CID_XILINX_SDIRX_EDH_ERRCNT:
> > +		val = xsdirxss_read(xsdirxss, XSDIRX_MODE_DET_STAT_REG);
> > +		val &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> > +		if (val == XSDIRX_MODE_SD_MASK) {
> > +			ctrl->val = xsdirxss_read(xsdirxss,
> > +						  XSDIRX_EDH_ERRCNT_REG);
> > +		} else {
> > +			spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +			dev_dbg(dev, "%d - not in SD mode\n", ctrl->id);
> > +			return -EINVAL;
> 
> Getting a control value shouldn't fail. Just set ctrl->val to 0 and
> return 0. You can leave the dev_dbg though, that can be useful.
> 
> > +		}
> > +		break;
> > +	case V4L2_CID_XILINX_SDIRX_EDH_STATUS:
> > +		val = xsdirxss_read(xsdirxss, XSDIRX_MODE_DET_STAT_REG);
> > +		val &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> > +		if (val == XSDIRX_MODE_SD_MASK) {
> > +			ctrl->val = xsdirxss_read(xsdirxss,
> > +						  XSDIRX_EDH_STAT_REG);
> > +		} else {
> > +			spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +			dev_dbg(dev, "%d - not in SD mode\n", ctrl->id);
> > +			return -EINVAL;
> 
> Ditto.
> 
> > +		}
> > +		break;
> > +	case V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED:
> > +		ctrl->val = xsdirxss->ts_is_interlaced;
> > +		break;
> 
> I assume this control will disappear once you added support for
> FIELD_ALTERNATE_PROG?

I'm not sure FIELD_ALTERNATE_PROG is a good idea. The v4l2_field
specifies today how frames are split into multiple buffers. There's an
implicit assumption that a frame split into two buffers is captured with
interlacing. In the SDI case, the two concepts get decoupled, a
progressive frame can be transmitted (and captured) in two separate
parts. If we add a *_PROG field, we'll need to duplicate most of the
v4l2_field values with a _PROG suffix, as the progressive frame can be
captured in alternate buffers on a video node, but also in separate odd
and even buffers on two video nodes. Tt the hardware level, data is
transmitted with odd lines on one link, and even lines on a second link.
There are then two instances of this IP core, one for each link. One
instance would receive and process the even lines, the other instance
the odd lines. The output of the two instances can then be connected to
two separate DMA engines, or combined in the FPGA fabric, depending on
how the user designs the system.

> > +	default:
> > +		spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +		dev_err(dev, "Get Invalid control id 0x%0x\n", ctrl->id);
> > +		return -EINVAL;
> 
> You can drop the default case altogether: this function will only be called
> for volatile controls.
> 
> > +	}
> > +
> > +	spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xsdirxss_log_status - Logs the status of the SDI Rx Subsystem
> > + * @sd: Pointer to V4L2 subdevice structure
> > + *
> > + * This function prints the current status of Xilinx SDI Rx Subsystem
> > + *
> > + * Return: 0 on success
> > + */
> > +static int xsdirxss_log_status(struct v4l2_subdev *sd)
> > +{
> > +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> > +	u32 i;
> > +
> > +	v4l2_info(sd, "***** SDI Rx subsystem reg dump start *****\n");
> > +	v4l2_info(sd, "No : Register Name : Value\n");
> > +	for (i = 0; i < ARRAY_SIZE(xsdirxss_regmap); i++) {
> > +		v4l2_info(sd, "%02d : %s register : 0x%08x\n", i,
> > +			  xsdirxss_regmap[i].name,
> > +			  xsdirxss_read(xsdirxss, xsdirxss_regmap[i].offset));
> > +	}
> > +	v4l2_info(sd, "***** SDI Rx subsystem reg dump end *****\n");
> > +
> > +	v4l2_ctrl_subdev_log_status(sd);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xsdirxss_g_frame_interval - Get the frame interval
> > + * @sd: V4L2 Sub device
> > + * @fi: Pointer to V4l2 Sub device frame interval structure
> > + *
> > + * This function is used to get the frame interval.
> > + * The frame rate can be integral or fractional.
> > + * Integral frame rate e.g. numerator = 1000, denominator = 24000 => 24 fps
> > + * Fractional frame rate e.g. numerator = 1001, denominator = 24000 => 23.97 fps
> > + *
> > + * Return: 0 on success
> > + */
> > +static int xsdirxss_g_frame_interval(struct v4l2_subdev *sd,
> > +				     struct v4l2_subdev_frame_interval *fi)
> > +{
> > +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> > +	unsigned long flags;
> > +
> > +	if (!xsdirxss->vidlocked) {
> > +		dev_err(xsdirxss->dev, "Video not locked!\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	spin_lock_irqsave(&xsdirxss->slock, flags);
> > +	fi->interval = xsdirxss->frame_interval;
> > +	spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +
> > +	dev_dbg(xsdirxss->dev, "frame rate numerator = %d denominator = %d\n",
> > +		xsdirxss->frame_interval.numerator,
> > +		xsdirxss->frame_interval.denominator);

You should print fi->interval, not xsdirxss->frame_interval, as you're
outside of the spinlock.

> > +	return 0;
> > +}
> > +
> > +/**
> > + * xsdirxss_s_stream - It is used to start/stop the streaming.
> > + * @sd: V4L2 Sub device
> > + * @enable: Flag (True / False)
> > + *
> > + * This function controls the start or stop of streaming for the
> > + * Xilinx SDI Rx Subsystem.
> > + *
> > + * Return: 0 on success, errors otherwise
> > + */
> > +static int xsdirxss_s_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> > +	struct device *dev = xsdirxss->dev;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&xsdirxss->slock, flags);
> > +	if (enable == xsdirxss->streaming) {
> > +		spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +		dev_dbg(dev, "already in same streaming state as requested\n");
> > +		return 0;
> > +	}
> > +
> > +	if (enable) {
> > +		if (!xsdirxss->vidlocked) {
> > +			spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +			dev_err(dev, "Video is not locked\n");
> > +			return -EINVAL;
> > +		}
> > +		xsdirx_streamflow_control(xsdirxss, true);
> > +	} else {
> > +		xsdirx_streamflow_control(xsdirxss, false);
> > +	}
> > +	spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +	dev_dbg(dev, "Streaming %s\n", enable ? "started" : "stopped");
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xsdirxss_g_input_status - It is used to determine if the video signal
> > + * is present / locked onto or not.
> > + *
> > + * @sd: V4L2 Sub device
> > + * @status: status of signal locked
> > + *
> > + * This is used to determine if the video signal is present and locked onto
> > + * by the SDI Rx core or not based on vidlocked flag.
> > + *
> > + * Return: zero on success
> > + */
> > +static int xsdirxss_g_input_status(struct v4l2_subdev *sd, u32 *status)
> > +{
> > +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&xsdirxss->slock, flags);
> > +	if (!xsdirxss->vidlocked)
> > +		*status = V4L2_IN_ST_NO_SYNC | V4L2_IN_ST_NO_SIGNAL;
> > +	else
> > +		*status = 0;
> > +
> > +	spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +	return 0;
> > +}
> > +
> > +static struct v4l2_mbus_framefmt *
> > +__xsdirxss_get_pad_format(struct xsdirxss_state *xsdirxss,
> > +			  struct v4l2_subdev_pad_config *cfg,
> > +			  unsigned int pad, u32 which)
> > +{
> > +	switch (which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		return v4l2_subdev_get_try_format(&xsdirxss->subdev, cfg, pad);
> > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +		return &xsdirxss->src_format;
> > +	default:
> > +		return NULL;
> > +	}
> > +}
> > +
> > +/**
> > + * xsdirxss_init_cfg - Initialise the pad format config to default
> > + * @sd: Pointer to V4L2 Sub device structure
> > + * @cfg: Pointer to sub device pad information structure
> > + *
> > + * This function is used to initialize the pad format with the default
> > + * values.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int xsdirxss_init_cfg(struct v4l2_subdev *sd,
> > +			     struct v4l2_subdev_pad_config *cfg)
> > +{
> > +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +
> > +	format = v4l2_subdev_get_try_format(sd, cfg, 0);
> > +	*format = xsdirxss->default_format;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xsdirxss_get_set_format - This is used to get/set the pad format
> > + * @sd: Pointer to V4L2 Sub device structure
> > + * @cfg: Pointer to sub device pad information structure
> > + * @fmt: Pointer to pad level media bus format
> > + *
> > + * This function is used to get and set the pad format.
> > + * Since the pad format is fixed in hardware, it can't be
> > + * modified on run time. So set and get are same.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int xsdirxss_get_set_format(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_pad_config *cfg,
> > +				   struct v4l2_subdev_format *fmt)
> > +{
> > +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&xsdirxss->slock, flags);
> > +	if (!xsdirxss->vidlocked) {
> > +		spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +		dev_err(xsdirxss->dev, "Video not locked!\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	fmt->format = *__xsdirxss_get_pad_format(xsdirxss, cfg,
> > +						 fmt->pad, fmt->which);
> > +
> > +	spin_unlock_irqrestore(&xsdirxss->slock, flags);
> > +	dev_dbg(xsdirxss->dev,
> > +		"stream width %d height %d code %d field %d colorspace %d xfer_func %d quantization %d\n",
> > +		fmt->format.width, fmt->format.height,
> > +		fmt->format.code, fmt->format.field,
> > +		fmt->format.colorspace, fmt->format.xfer_func,
> > +		fmt->format.quantization);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xsdirxss_enum_mbus_code - Handle pixel format enumeration
> > + * @sd: pointer to v4l2 subdev structure
> > + * @cfg: V4L2 subdev pad configuration
> > + * @code: pointer to v4l2_subdev_mbus_code_enum structure
> > + *
> > + * Return: -EINVAL or zero on success
> > + */
> > +static int xsdirxss_enum_mbus_code(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_pad_config *cfg,
> > +				   struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> > +	u32 index = code->index;
> > +	u32 maxindex;
> > +
> > +	if (xsdirxss->bpc == 10)
> > +		maxindex = ARRAY_SIZE(xsdirxss_10bpc_mbus_fmts);
> > +	else
> > +		maxindex = ARRAY_SIZE(xsdirxss_12bpc_mbus_fmts);
> > +
> > +	if (code->pad || index >= maxindex)
> > +		return -EINVAL;
> > +
> > +	if (xsdirxss->bpc == 10)
> > +		code->code = xsdirxss_10bpc_mbus_fmts[index];
> > +	else
> > +		code->code = xsdirxss_12bpc_mbus_fmts[index];
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xsdirxss_enum_dv_timings - Enumerate all the supported DV timings
> > + * @sd: pointer to v4l2 subdev structure
> > + * @timings: DV timings structure to be returned.
> > + *
> > + * Return: -EINVAL incase of invalid index and pad or zero on success
> > + */
> > +static int xsdirxss_enum_dv_timings(struct v4l2_subdev *sd,
> > +				    struct v4l2_enum_dv_timings *timings)
> > +{
> > +	if (timings->index >= ARRAY_SIZE(fmt_cap))
> > +		return -EINVAL;
> > +
> > +	if (timings->pad != 0)
> > +		return -EINVAL;
> > +
> > +	timings->timings = fmt_cap[timings->index];
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xsdirxss_query_dv_timings - Query for the current DV timings
> > + * @sd: pointer to v4l2 subdev structure
> > + * @timings: DV timings structure to be returned.
> > + *
> > + * Return: -ENOLCK when video is not locked, -ERANGE when corresponding timing
> > + * entry is not found or zero on success.
> > + */
> > +static int xsdirxss_query_dv_timings(struct v4l2_subdev *sd,
> > +				     struct v4l2_dv_timings *timings)
> > +{
> > +	struct xsdirxss_state *state = to_xsdirxssstate(sd);
> > +	unsigned int i;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&state->slock, flags);
> > +	if (!state->vidlocked) {
> > +		spin_unlock_irqrestore(&state->slock, flags);
> > +		return -ENOLCK;
> > +	}
> > +
> > +	for (i = 0; i < ARRAY_SIZE(xsdirxss_dv_timings); i++) {
> > +		if (state->format.width == xsdirxss_dv_timings[i].width &&
> > +		    state->format.height == xsdirxss_dv_timings[i].height &&
> > +		    state->frame_interval.denominator ==
> > +		    (xsdirxss_dv_timings[i].fps * 1000)) {
> > +			*timings = xsdirxss_dv_timings[i].timing;
> > +			state->detected_timings_index = i;
> > +			spin_unlock_irqrestore(&state->slock, flags);
> > +			return 0;
> > +		}
> > +	}
> 
> This limits the available timings to those explicitly supported by this
> driver. Is that intended? What it you receive something that's not in this
> list? Do you still want to be able to receive it?
> 
> > +	spin_unlock_irqrestore(&state->slock, flags);
> > +
> > +	return -ERANGE;
> > +}
> > +
> > +static int xsdirxss_s_dv_timings(struct v4l2_subdev *sd,
> > +				 struct v4l2_dv_timings *timings)
> > +{
> > +	struct xsdirxss_state *state = to_xsdirxssstate(sd);
> > +	u32 i = state->detected_timings_index;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&state->slock, flags);
> > +	if (!state->vidlocked) {
> > +		spin_unlock_irqrestore(&state->slock, flags);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* input timing should match query dv_timing */
> > +	if (!v4l2_match_dv_timings(timings,
> > +				   &xsdirxss_dv_timings[i].timing,
> > +				   0, false)) {
> > +		spin_unlock_irqrestore(&state->slock, flags);
> > +		return -EINVAL;
> > +	}
> > +
> > +	state->current_timings = *timings;
> > +
> > +	/* Update the media bus format */
> > +	state->src_format = state->format;
> > +	spin_unlock_irqrestore(&state->slock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int xsdirxss_g_dv_timings(struct v4l2_subdev *sd,
> > +				 struct v4l2_dv_timings *timings)
> > +{
> > +	struct xsdirxss_state *state = to_xsdirxssstate(sd);
> > +
> > +	*timings = state->current_timings;
> > +	return 0;
> > +}
> > +
> > +static int xsdirxss_dv_timings_cap(struct v4l2_subdev *sd,
> > +				   struct v4l2_dv_timings_cap *cap)
> > +{
> > +	if (cap->pad != 0)
> > +		return -EINVAL;
> > +
> > +	*cap = xsdirxss_timings_cap;
> > +	return 0;
> > +}
> > +
> > +/* -----------------------------------------------------------------------------
> > + * Media Operations
> > + */
> > +
> > +static const struct media_entity_operations xsdirxss_media_ops = {
> > +	.link_validate = v4l2_subdev_link_validate
> > +};
> > +
> > +static const struct v4l2_ctrl_ops xsdirxss_ctrl_ops = {
> > +	.g_volatile_ctrl = xsdirxss_g_volatile_ctrl,
> > +	.s_ctrl	= xsdirxss_s_ctrl
> > +};
> > +
> > +static const struct v4l2_ctrl_config xsdirxss_edh_ctrls[] = {
> > +	{
> > +		.ops	= &xsdirxss_ctrl_ops,
> > +		.id	= V4L2_CID_XILINX_SDIRX_EDH_ERROR_SOURCES,
> > +		.name	= "SDI Rx : EDH Error Count Enable",
> 
> No space before ':'.
> 
> > +		.type	= V4L2_CTRL_TYPE_BITMASK,
> > +		.min	= 0,
> > +		.max	= XSDIRX_EDH_ALLERR_MASK,
> > +		.def	= 0,
> > +	}, {
> > +		.ops	= &xsdirxss_ctrl_ops,
> > +		.id	= V4L2_CID_XILINX_SDIRX_EDH_ERRCNT,
> > +		.name	= "SDI Rx : EDH Error Count",
> > +		.type	= V4L2_CTRL_TYPE_INTEGER,
> > +		.min	= 0,
> > +		.max	= 0xffff,
> > +		.step	= 1,
> > +		.def	= 0,
> > +		.flags  = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> > +	}, {
> > +		.ops	= &xsdirxss_ctrl_ops,
> > +		.id	= V4L2_CID_XILINX_SDIRX_EDH_STATUS,
> > +		.name	= "SDI Rx : EDH Status",
> > +		.type	= V4L2_CTRL_TYPE_INTEGER,
> 
> This should be a bitmask type. Should this be a control at all? Isn't this more
> something to log with log_status? Is this something that an application needs to
> use, or is it just a debugging aid? It feels like the latter.
> 
> > +		.min	= 0,
> > +		.max	= 0xffffffff,
> > +		.step	= 1,
> > +		.def	= 0,
> > +		.flags  = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> > +	}
> > +};
> > +
> > +static const struct v4l2_ctrl_config xsdirxss_ctrls[] = {
> > +	{
> > +		.ops	= &xsdirxss_ctrl_ops,
> > +		.id	= V4L2_CID_XILINX_SDIRX_FRAMER,
> > +		.name	= "SDI Rx : Enable Framer",
> > +		.type	= V4L2_CTRL_TYPE_BOOLEAN,
> > +		.min	= false,
> > +		.max	= true,
> > +		.step	= 1,
> > +		.def	= true,
> > +	}, {
> > +		.ops	= &xsdirxss_ctrl_ops,
> > +		.id	= V4L2_CID_XILINX_SDIRX_VIDLOCK_WINDOW,
> > +		.name	= "SDI Rx : Video Lock Window",
> > +		.type	= V4L2_CTRL_TYPE_INTEGER,
> > +		.min	= 0,
> > +		.max	= 0xffffffff,
> 
> max should be 0x7fffffff since this is a s32.
> 
> > +		.step	= 1,
> > +		.def	= XSDIRX_DEFAULT_VIDEO_LOCK_WINDOW,
> > +	}, {
> > +		.ops	= &xsdirxss_ctrl_ops,
> > +		.id	= V4L2_CID_XILINX_SDIRX_SEARCH_MODES,
> > +		.name	= "SDI Rx : Modes search Mask",
> 
> search -> Search
> 
> > +		.type	= V4L2_CTRL_TYPE_BITMASK,
> > +		.min	= 0,
> > +		.max	= XSDIRX_DETECT_ALL_MODES,
> > +		.def	= XSDIRX_DETECT_ALL_MODES,
> > +	}, {
> > +		.ops	= &xsdirxss_ctrl_ops,
> > +		.id	= V4L2_CID_XILINX_SDIRX_MODE_DETECT,
> > +		.name	= "SDI Rx : Mode Detect Status",
> 
> Mode Detect Status ->  Detected Mode
> 
> > +		.type	= V4L2_CTRL_TYPE_INTEGER,
> 
> This is really a menu control.
> 
> > +		.min	= XSDIRX_MODE_SD_OFFSET,
> > +		.max	= XSDIRX_MODE_12GF_OFFSET,
> > +		.step	= 1,
> > +		.flags  = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> > +	}, {
> > +		.ops	= &xsdirxss_ctrl_ops,
> > +		.id	= V4L2_CID_XILINX_SDIRX_CRC,
> > +		.name	= "SDI Rx : CRC Error status",
> > +		.type	= V4L2_CTRL_TYPE_INTEGER,
> 
> This is really two controls based on the description in the header:
> 
> One bitmask for the 16 data streams and one accumulated error count.

Hans, as this is highly device-specific, and the two values need to be
read together, do we really want to mandate all the complexity of
creating two controls in a cluster ? It seems overkill to me.

> > +		.min	= 0,
> > +		.max	= 0xffffffff,
> > +		.step	= 1,
> > +		.def	= 0,
> > +		.flags  = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> > +	}, {
> > +		.ops	= &xsdirxss_ctrl_ops,
> > +		.id	= V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED,
> > +		.name	= "SDI Rx : TS is Interlaced",
> > +		.type	= V4L2_CTRL_TYPE_BOOLEAN,
> > +		.min	= false,
> > +		.max	= true,
> > +		.def	= false,
> > +		.step	= 1,
> > +		.flags  = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> > +	},
> > +};
> > +
> > +static const struct v4l2_subdev_core_ops xsdirxss_core_ops = {
> > +	.log_status = xsdirxss_log_status,
> > +	.subscribe_event = xsdirxss_subscribe_event,
> > +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops xsdirxss_video_ops = {
> > +	.g_frame_interval = xsdirxss_g_frame_interval,
> > +	.s_stream = xsdirxss_s_stream,
> > +	.g_input_status = xsdirxss_g_input_status,
> > +	.query_dv_timings = xsdirxss_query_dv_timings,
> > +	.g_dv_timings = xsdirxss_g_dv_timings,
> > +	.s_dv_timings = xsdirxss_s_dv_timings,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops xsdirxss_pad_ops = {
> > +	.init_cfg = xsdirxss_init_cfg,
> > +	.get_fmt = xsdirxss_get_set_format,
> > +	.set_fmt = xsdirxss_get_set_format,
> > +	.enum_mbus_code = xsdirxss_enum_mbus_code,
> > +	.enum_dv_timings = xsdirxss_enum_dv_timings,
> > +	.dv_timings_cap = xsdirxss_dv_timings_cap,
> > +};
> > +
> > +static const struct v4l2_subdev_ops xsdirxss_ops = {
> > +	.core = &xsdirxss_core_ops,
> > +	.video = &xsdirxss_video_ops,
> > +	.pad = &xsdirxss_pad_ops
> > +};
> > +
> > +/* -----------------------------------------------------------------------------
> > + * Platform Device Driver
> > + */
> > +
> > +static int xsdirxss_parse_of(struct xsdirxss_state *xsdirxss)
> > +{
> > +	struct device_node *node = xsdirxss->dev->of_node;
> > +	struct device *dev = xsdirxss->dev;
> > +	int ret;
> > +
> > +	xsdirxss->include_edh = of_property_read_bool(node, "xlnx,include-edh");
> > +	dev_dbg(dev, "EDH property = %s\n",
> > +		xsdirxss->include_edh ? "Present" : "Absent");
> > +
> > +	ret = of_property_read_u32(node, "xlnx,line-rate", &xsdirxss->mode);
> > +	if (ret < 0) {
> > +		dev_err(dev, "xlnx,line-rate property not found\n");
> > +		return ret;
> > +	}
> > +
> > +	if (xsdirxss->mode != XSDI_STD_3G && xsdirxss->mode != XSDI_STD_6G &&
> > +	    xsdirxss->mode != XSDI_STD_12G_8DS) {
> > +		dev_err(dev, "Invalid Line Rate\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	dev_dbg(dev, "SDI Rx Line Rate / mode = %d\n", xsdirxss->mode);
> > +
> > +	ret = of_property_read_u32(node, "xlnx,bpc", &xsdirxss->bpc);
> > +	if (ret == -EINVAL) {
> > +		xsdirxss->bpc = 10;
> > +		dev_dbg(dev, "set default bpc as 10\n");
> > +	} else if (ret < 0) {
> > +		dev_err(dev, "failed to get xlnx,bpc\n");
> > +		return ret;
> > +	}
> > +
> > +	if (xsdirxss->bpc != 10 && xsdirxss->bpc != 12) {
> > +		dev_err(dev, "bits per component=%u. Can be 10 or 12 only\n",
> > +			xsdirxss->bpc);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int xsdirxss_probe(struct platform_device *pdev)
> > +{
> > +	struct v4l2_subdev *subdev;
> > +	struct xsdirxss_state *xsdirxss;
> > +	struct device *dev;
> > +	int ret, irq;
> > +	unsigned int num_ctrls, i;
> > +
> > +	xsdirxss = devm_kzalloc(&pdev->dev, sizeof(*xsdirxss), GFP_KERNEL);
> > +	if (!xsdirxss)
> > +		return -ENOMEM;
> > +
> > +	xsdirxss->dev = &pdev->dev;
> > +	dev = xsdirxss->dev;
> > +
> > +	spin_lock_init(&xsdirxss->slock);
> > +	ret = xsdirxss_parse_of(xsdirxss);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	xsdirxss->iomem = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(xsdirxss->iomem))
> > +		return PTR_ERR(xsdirxss->iomem);
> > +
> > +	xsdirxss->num_clks = ARRAY_SIZE(xsdirxss_clks);
> > +	xsdirxss->clks = devm_kcalloc(dev, xsdirxss->num_clks,
> > +				      sizeof(*xsdirxss->clks), GFP_KERNEL);
> > +	if (!xsdirxss->clks)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < xsdirxss->num_clks; i++)
> > +		xsdirxss->clks[i].id = xsdirxss_clks[i];
> > +
> > +	ret = devm_clk_bulk_get(dev, xsdirxss->num_clks, xsdirxss->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = clk_bulk_prepare_enable(xsdirxss->num_clks, xsdirxss->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Reset the core */
> > +	xsdirx_streamflow_control(xsdirxss, false);
> > +	XSDIRX_CORE_DISABLE(xsdirxss);
> > +	/* Clear all interrupts */
> > +	xsdirxss_set(xsdirxss, XSDIRX_ISR_REG, XSDIRX_INTR_ALL_MASK);
> > +	xsdirxss_clr(xsdirxss, XSDIRX_IER_REG, XSDIRX_INTR_ALL_MASK);
> > +	xsdirxss_set(xsdirxss, XSDIRX_IER_REG, XSDIRX_INTR_ALL_MASK);
> > +	XSDIRX_GLOBAL_INTR_ENABLE(xsdirxss);
> > +	xsdirxss_write(xsdirxss, XSDIRX_CRC_ERRCNT_REG, 0xffff);
> > +
> > +	/* Register interrupt handler */
> > +	irq = platform_get_irq(pdev, 0);
> > +	ret = devm_request_threaded_irq(dev, irq, NULL, xsdirxss_irq_handler,
> > +					IRQF_ONESHOT, dev_name(dev), xsdirxss);
> > +	if (ret) {
> > +		dev_err(dev, "Err = %d Interrupt handler reg failed!\n",
> > +			ret);
> > +		goto clk_err;
> > +	}
> > +
> > +	/* Initialize V4L2 subdevice and media entity */
> > +	xsdirxss->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +
> > +	/* Initialize the default format */
> > +	if (xsdirxss->bpc == 10)
> > +		xsdirxss->default_format.code = MEDIA_BUS_FMT_UYVY10_1X20;
> > +	else
> > +		xsdirxss->default_format.code = MEDIA_BUS_FMT_UYVY12_1X24;
> > +	xsdirxss->default_format.field = V4L2_FIELD_NONE;
> > +	xsdirxss->default_format.colorspace = V4L2_COLORSPACE_REC709;
> > +	xsdirxss->default_format.width = XSDIRX_DEFAULT_WIDTH;
> > +	xsdirxss->default_format.height = XSDIRX_DEFAULT_HEIGHT;
> > +	xsdirxss->default_format.xfer_func = V4L2_XFER_FUNC_709;
> > +	xsdirxss->default_format.quantization = V4L2_QUANTIZATION_LIM_RANGE;
> > +
> > +	xsdirxss->format = xsdirxss->default_format;
> > +
> > +	/* Initialize V4L2 subdevice and media entity */
> > +	subdev = &xsdirxss->subdev;
> > +	v4l2_subdev_init(subdev, &xsdirxss_ops);
> > +
> > +	subdev->dev = &pdev->dev;
> > +	strscpy(subdev->name, dev_name(dev), sizeof(subdev->name));
> > +
> > +	subdev->flags = V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +
> > +	subdev->entity.ops = &xsdirxss_media_ops;
> > +
> > +	v4l2_set_subdevdata(subdev, xsdirxss);
> > +
> > +	ret = media_entity_pads_init(&subdev->entity, 1, &xsdirxss->pad);
> > +	if (ret < 0)
> > +		goto error;
> > +
> > +	/* Initialise and register the controls */
> > +	num_ctrls = ARRAY_SIZE(xsdirxss_ctrls);
> > +
> > +	if (xsdirxss->include_edh)
> > +		num_ctrls += ARRAY_SIZE(xsdirxss_edh_ctrls);
> > +
> > +	v4l2_ctrl_handler_init(&xsdirxss->ctrl_handler, num_ctrls);
> > +
> > +	for (i = 0; i < ARRAY_SIZE(xsdirxss_ctrls); i++) {
> > +		struct v4l2_ctrl *ctrl;
> > +
> > +		dev_dbg(dev, "%d %s ctrl = 0x%x\n", i, xsdirxss_ctrls[i].name,
> > +			xsdirxss_ctrls[i].id);
> > +
> > +		ctrl = v4l2_ctrl_new_custom(&xsdirxss->ctrl_handler,
> > +					    &xsdirxss_ctrls[i], NULL);

You can drop the ctrl variable, it's not used. Same below.

> > +	}
> > +
> > +	if (xsdirxss->include_edh) {
> > +		for (i = 0; i < ARRAY_SIZE(xsdirxss_edh_ctrls); i++) {
> > +			struct v4l2_ctrl *ctrl;
> > +
> > +			dev_dbg(dev, "%d %s ctrl = 0x%x\n", i,
> > +				xsdirxss_edh_ctrls[i].name,
> > +				xsdirxss_edh_ctrls[i].id);
> > +
> > +			ctrl = v4l2_ctrl_new_custom(&xsdirxss->ctrl_handler,
> > +						    &xsdirxss_edh_ctrls[i],
> > +						    NULL);
> > +		}
> > +	}
> > +
> > +	if (xsdirxss->ctrl_handler.error) {
> > +		dev_err(dev, "failed to add controls\n");
> > +		ret = xsdirxss->ctrl_handler.error;
> > +		goto error;
> > +	}
> > +
> > +	subdev->ctrl_handler = &xsdirxss->ctrl_handler;
> > +
> > +	ret = v4l2_ctrl_handler_setup(&xsdirxss->ctrl_handler);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to set controls\n");
> > +		goto error;
> > +	}
> > +
> > +	platform_set_drvdata(pdev, xsdirxss);
> > +
> > +	ret = v4l2_async_register_subdev(subdev);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to register subdev\n");
> > +		goto error;
> > +	}
> > +
> > +	xsdirxss->prev_is_frac = -1;
> > +
> > +	XSDIRX_CORE_ENABLE(xsdirxss);
> > +
> > +	return 0;
> > +error:
> > +	v4l2_ctrl_handler_free(&xsdirxss->ctrl_handler);
> > +	media_entity_cleanup(&subdev->entity);
> > +	XSDIRX_GLOBAL_INTR_DISABLE(xsdirxss);
> > +	xsdirxss_clr(xsdirxss, XSDIRX_IER_REG, XSDIRX_INTR_ALL_MASK);
> > +clk_err:
> > +	clk_bulk_disable_unprepare(xsdirxss->num_clks, xsdirxss->clks);
> > +	return ret;
> > +}
> > +
> > +static int xsdirxss_remove(struct platform_device *pdev)
> > +{
> > +	struct xsdirxss_state *xsdirxss = platform_get_drvdata(pdev);
> > +	struct v4l2_subdev *subdev = &xsdirxss->subdev;
> > +
> > +	XSDIRX_CORE_DISABLE(xsdirxss);
> > +	XSDIRX_GLOBAL_INTR_DISABLE(xsdirxss);
> > +	xsdirxss_clr(xsdirxss, XSDIRX_IER_REG, XSDIRX_INTR_ALL_MASK);
> > +	xsdirx_streamflow_control(xsdirxss, false);
> > +
> > +	v4l2_async_unregister_subdev(subdev);
> > +	v4l2_ctrl_handler_free(&xsdirxss->ctrl_handler);
> > +	media_entity_cleanup(&subdev->entity);
> > +
> > +	clk_bulk_disable_unprepare(xsdirxss->num_clks, xsdirxss->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id xsdirxss_of_id_table[] = {
> > +	{ .compatible = "xlnx,v-smpte-uhdsdi-rx-ss-2.0" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, xsdirxss_of_id_table);
> > +
> > +static struct platform_driver xsdirxss_driver = {
> > +	.driver = {
> > +		.name		= "xilinx-sdirxss",
> > +		.of_match_table	= xsdirxss_of_id_table,
> > +	},
> > +	.probe			= xsdirxss_probe,
> > +	.remove			= xsdirxss_remove,
> > +};
> > +
> > +module_platform_driver(xsdirxss_driver);
> > +
> > +MODULE_AUTHOR("Vishal Sagar <vsagar@xilinx.com>");
> > +MODULE_DESCRIPTION("Xilinx SDI Rx Subsystem Driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 62271418c1be..9526a6acc6f4 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -198,6 +198,12 @@ enum v4l2_colorfx {
> >   */
> >  #define V4L2_CID_USER_ATMEL_ISC_BASE		(V4L2_CID_USER_BASE + 0x10c0)
> >  
> > +/*
> > + * The base for the Xilinx SDI Rx driver controls.
> > + * We reserve 16 controls for this driver.
> > + */
> > +#define V4L2_CID_USER_XILINX_SDIRX_BASE		(V4L2_CID_USER_BASE + 0x10e0)
> > +
> >  /* MPEG-class control IDs */
> >  /* The MPEG controls are applicable to all codec controls
> >   * and the 'MPEG' part of the define is historical */
> > diff --git a/include/uapi/linux/xilinx-sdirxss.h b/include/uapi/linux/xilinx-sdirxss.h
> > new file mode 100644
> > index 000000000000..1bcbf5852b22
> > --- /dev/null
> > +++ b/include/uapi/linux/xilinx-sdirxss.h
> > @@ -0,0 +1,283 @@
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +/*
> > + * Xilinx SDI Rx Subsystem mode, event, custom timings and
> > + * flag definitions.
> > + *
> > + * Copyright (C) 2019 - 2020 Xilinx, Inc.
> > + *
> > + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
> > + */
> > +
> > +#ifndef __UAPI_XILINX_SDIRXSS_H__
> > +#define __UAPI_XILINX_SDIRXSS_H__
> > +
> > +#include <linux/types.h>
> > +#include <linux/v4l2-controls.h>
> > +#include <linux/v4l2-dv-timings.h>
> > +#include <linux/videodev2.h>
> > +
> > +/*
> > + * Events
> > + *
> > + * V4L2_EVENT_XILINX_SDIRX_UND_OVR_FLOW: Video in to AXI4 Stream core
> > + * under/overflowed during a resolution or frame rate change.
> > + */
> > +#define V4L2_EVENT_XILINX_SDIRX_CLASS      (V4L2_EVENT_PRIVATE_START | 0x200)
> > +#define V4L2_EVENT_XILINX_SDIRX_UND_OVR_FLOW	\
> > +					(V4L2_EVENT_XILINX_SDIRX_CLASS | 0x1)
> > +
> > +#define XILINX_SDIRX_UNDERFLOW_EVENT	BIT(1)
> > +#define XILINX_SDIRX_OVERFLOW_EVENT	BIT(2)
> > +/*
> > + * This enum is used to prepare the bitmask of modes to be detected
> > + */
> > +enum {
> > +	XSDIRX_MODE_SD_OFFSET = 0,
> > +	XSDIRX_MODE_HD_OFFSET,
> > +	XSDIRX_MODE_3GA_OFFSET,
> > +	XSDIRX_MODE_3GB_OFFSET,
> > +	XSDIRX_MODE_6G_OFFSET,
> > +	XSDIRX_MODE_12GI_OFFSET,
> > +	XSDIRX_MODE_12GF_OFFSET,
> > +	XSDIRX_MODE_NUM_SUPPORTED,
> > +};
> 
> These are all standard SDI modes, right?
> 
> > +
> > +#define XSDIRX_DETECT_ALL_MODES		(BIT(XSDIRX_MODE_SD_OFFSET) | \
> > +					BIT(XSDIRX_MODE_HD_OFFSET) | \
> > +					BIT(XSDIRX_MODE_3GA_OFFSET) | \
> > +					BIT(XSDIRX_MODE_3GB_OFFSET) | \
> > +					BIT(XSDIRX_MODE_6G_OFFSET) | \
> > +					BIT(XSDIRX_MODE_12GI_OFFSET) | \
> > +					BIT(XSDIRX_MODE_12GF_OFFSET))
> > +
> > +/*
> > + * EDH - Error Detection and Handling.
> > + * In the SD-SDI mode, the UHD-SDI core fully supports RP 165.
> > + * The bitmask is named as XSDIRX_EDH_ERRCNT_XX_YY_ERR except
> > + * for packet checksum error.
> > + *
> > + * XX - EDH Error Types
> > + * ANC - Ancillary Data Packet Errors
> > + * FF - Full Field Errors
> > + * AP - Active Portion Errors
> > + *
> > + * YY - Error Flags
> > + * EDH - error detected here
> > + * EDA - error Detected already
> > + * IDH - internal error detected here
> > + * IDA - internal error detected already
> > + * UES - unknown error status
> > + *
> > + * Refer to Sec 4.3 Error Flags in RP 165-1994 for details
> > + */
> > +
> > +#define XSDIRX_EDH_ERRCNT_ANC_EDH_ERR		BIT(0)
> > +#define XSDIRX_EDH_ERRCNT_ANC_EDA_ERR		BIT(1)
> > +#define XSDIRX_EDH_ERRCNT_ANC_IDH_ERR		BIT(2)
> > +#define XSDIRX_EDH_ERRCNT_ANC_IDA_ERR		BIT(3)
> > +#define XSDIRX_EDH_ERRCNT_ANC_UES_ERR		BIT(4)
> > +#define XSDIRX_EDH_ERRCNT_FF_EDH_ERR		BIT(5)
> > +#define XSDIRX_EDH_ERRCNT_FF_EDA_ERR		BIT(6)
> > +#define XSDIRX_EDH_ERRCNT_FF_IDH_ERR		BIT(7)
> > +#define XSDIRX_EDH_ERRCNT_FF_IDA_ERR		BIT(8)
> > +#define XSDIRX_EDH_ERRCNT_FF_UES_ERR		BIT(9)
> > +#define XSDIRX_EDH_ERRCNT_AP_EDH_ERR		BIT(10)
> > +#define XSDIRX_EDH_ERRCNT_AP_EDA_ERR		BIT(11)
> > +#define XSDIRX_EDH_ERRCNT_AP_IDH_ERR		BIT(12)
> > +#define XSDIRX_EDH_ERRCNT_AP_IDA_ERR		BIT(13)
> > +#define XSDIRX_EDH_ERRCNT_AP_UES_ERR		BIT(14)
> > +#define XSDIRX_EDH_ERRCNT_PKT_CHKSUM_ERR	BIT(15)
> > +
> > +#define XSDIRX_EDH_ALLERR_MASK		0xFFFF
> 
> Lowercase 0xffff.
> 
> And these error conditions are also standardized?
> 
> If so, then I think these defines/enums can be part of V4L2 itself rather
> than Xilinx specific.
> 
> > +
> > +/*
> > + * V4L2 Controls - We reserved 16 controls for this driver.
> 
> I'd increase that to 32.
> 
> > + *
> > + * The V4L2_CID_XILINX_SDIRX_EDH_* controls are present only if
> > + * EDH is enabled.
> > + * The controls which can be set should only be set before enabling
> > + * streaming. The controls which can be got should be called while
> > + * streaming to get correct values.
> > + * The V4L2_CID_XILINX_SDIRX_MODE_DETECT can be called when query dv timing
> 
> query dv timing -> query_dv_timings
> 
> > + * returns a valid timing.
> > + */
> > +
> > +/*
> > + * Framer Control to enable or disable the framer. When this is set, the framer
> > + * automatically readjusts the output word alignment to match the alignment of
> > + * each timing reference signal(TRS). Normally this should be set. But user may
> > + * control this input to implement TRS filtering to prevent a signal misaligned
> > + * TRS from causing erroneous alignment changes.
> > + * Refer to PG205 rx_frame_en for more details.
> > + */
> > +#define V4L2_CID_XILINX_SDIRX_FRAMER		(V4L2_CID_USER_XILINX_SDIRX_BASE + 1)
> > +
> > +/*
> > + * Video Lock Window Control to set the video lock window value
> > + * This is the amount of time the mode and transport stream need
> > + * to be locked before a video lock interrupt occurs.
> > + */
> > +#define V4L2_CID_XILINX_SDIRX_VIDLOCK_WINDOW	(V4L2_CID_USER_XILINX_SDIRX_BASE + 2)
> > +
> > +/*
> > + * EDH Error Mask Control to enable EDH error count
> > + * This control takes in the bitmask of XSDIRX_EDH_ERRCNT_*_ERR to enable counting
> > + * such errors.
> > + */
> > +#define V4L2_CID_XILINX_SDIRX_EDH_ERROR_SOURCES	(V4L2_CID_USER_XILINX_SDIRX_BASE + 3)
> 
> If these EDH error sources are from the SDI standard, then this can become a standard
> control as well.
> 
> > +
> > +/*
> > + * Mode search Control to pass the bit mask of modes to detect.
> > + * If only 1 bit is set, the driver programs IP to be in fixed mode else
> > + * in multi detection mode.
> > + *
> > + * Set this when not streaming.
> > + *
> > + * bit 0 set to detect SD  mode,
> > + * bit 1 set to detect HD  mode,
> > + * bit 2 set to detect 3GA mode,
> > + * bit 3 set to detect 3GB mode,
> > + * bit 4 set to detect 6G  mode,
> > + * bit 5 set to detect 12G integer frame rate mode,
> > + * bit 6 set to detect 12G fractional frame rate mode,
> > + */
> > +#define V4L2_CID_XILINX_SDIRX_SEARCH_MODES	(V4L2_CID_USER_XILINX_SDIRX_BASE + 4)
> 
> Same here if these modes are standardized.
> 
> > +
> > +/*
> > + * Get Detected SDI Mode control (read only)
> > + *
> > + * Control Value - Mode detected
> > + *        0      -     SD
> > + *        1      -     HD
> > + *        2      -     3GA
> > + *        3      -     3GB
> > + *        4      -     6G
> > + *        5      -     12G integer frame rate
> > + *        6      -     12G fractional frame rate
> > + */
> > +#define V4L2_CID_XILINX_SDIRX_MODE_DETECT	(V4L2_CID_USER_XILINX_SDIRX_BASE + 5)
> 
> Ditto.
> 
> > +
> > +/* Get number of CRC errors status control
> > + *
> > + * When a CRC is detected on a line, the CRC error signal of that data stream
> > + * becomes asserted starting a few clock cycles after the last CRC word is
> > + * output on the data stream ports following the EAV that ends the line
> > + * containing the error. The CRC signal remains asserted for one line time.
> > + *
> > + * The LSB 16 bits of value returned by thsi control represent the error
> > + * signal on each of 16 data streams. The MSB 16 bits contains the accumulated
> > + * error count.
> > + *
> > + * Refer to PG205 rx_crc_err_dsX (X = 1 to 16) description for details.
> > + */
> > +#define V4L2_CID_XILINX_SDIRX_CRC		(V4L2_CID_USER_XILINX_SDIRX_BASE + 6)
> 
> As suggested earlier, I think this should be split into two controls.
> 
> > +
> > +/*
> > + * Get EDH error count control
> > + *
> > + * Reading this control will give the number of EDH errors occurred based
> > + * on the bitmask passed in V4L2_CID_XILINX_SDIRX_EDH_ERROR_SOURCES.
> > + *
> > + * It increments once per field when any of the error conditions enabled by
> > + * the RX_EDH_ERRCNT_EN register bit(s) occur during that field.
> > + *
> > + * Refer to PG205 rx_edh_errcnt
> > + */
> > +#define V4L2_CID_XILINX_SDIRX_EDH_ERRCNT	(V4L2_CID_USER_XILINX_SDIRX_BASE + 7)
> 
> Even though the EDH errors appear to be standard, I'm not sure if this specific control
> can be standardized. The precise behavior of a counter like this might differ between
> HW implementations.
> 
> > +
> > +/*
> > + * Get EDH status control
> > + *
> > + * This control returns the RX_EDH_STS register contents.
> > + * Refer to PG290 register space section for more details.
> > + */
> > +#define V4L2_CID_XILINX_SDIRX_EDH_STATUS	(V4L2_CID_USER_XILINX_SDIRX_BASE + 8)
> 
> As mentioned above: this is a dubious control, reporting it in log_status seems
> a more logical approach.
> 
> > +
> > +/* Get Transport Interlaced status whether it is interlaced or not */
> > +#define V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED	(V4L2_CID_USER_XILINX_SDIRX_BASE + 9)
> 
> And as also mentioned above, this will be replaced by a new FIELD_ALTERNATE_PROG?
> 
> > +
> > +/*
> > + * Xilinx DV timings
> > + * TODO - Remove these once they are in v4l2-dv-timings.h
> > + */
> > +#define XLNX_V4L2_DV_BT_2048X1080P24 { \
> > +	.type = V4L2_DV_BT_656_1120, \
> > +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> > +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> > +		74250000, 510, 44, 148, 4, 5, 36, 0, 0, 0, \
> > +		V4L2_DV_BT_STD_SDI) \
> > +}
> > +
> > +#define XLNX_V4L2_DV_BT_2048X1080P25 { \
> > +	.type = V4L2_DV_BT_656_1120, \
> > +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> > +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> > +		74250000, 400, 44, 148, 4, 5, 36, 0, 0, 0, \
> > +		V4L2_DV_BT_STD_SDI) \
> > +}
> > +
> > +#define XLNX_V4L2_DV_BT_2048X1080P30 { \
> > +	.type = V4L2_DV_BT_656_1120, \
> > +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> > +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> > +		74250000, 66, 20, 66, 4, 5, 36, 0, 0, 0, \
> > +		V4L2_DV_BT_STD_SDI) \
> > +}
> > +
> > +#define XLNX_V4L2_DV_BT_2048X1080I48 { \
> > +	.type = V4L2_DV_BT_656_1120, \
> > +	V4L2_INIT_BT_TIMINGS(2048, 1080, 1, \
> > +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> > +		74250000, 329, 44, 329, 2, 5, 15, 3, 5, 15, \
> > +		V4L2_DV_BT_STD_SDI) \
> > +}
> > +
> > +#define XLNX_V4L2_DV_BT_2048X1080I50 { \
> > +	.type = V4L2_DV_BT_656_1120, \
> > +	V4L2_INIT_BT_TIMINGS(2048, 1080, 1, \
> > +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> > +		74250000, 274, 44, 274, 2, 5, 15, 3, 5, 15, \
> > +		V4L2_DV_BT_STD_SDI) \
> > +}
> > +
> > +#define XLNX_V4L2_DV_BT_2048X1080I60 { \
> > +	.type = V4L2_DV_BT_656_1120, \
> > +	V4L2_INIT_BT_TIMINGS(2048, 1080, 1, \
> > +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> > +		74250000, 66, 20, 66, 2, 5, 15, 3, 5, 15, \
> > +		V4L2_DV_BT_STD_SDI) \
> > +}
> > +
> > +#define XLNX_V4L2_DV_BT_2048X1080P48 { \
> > +	.type = V4L2_DV_BT_656_1120, \
> > +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> > +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> > +		148500000, 510, 44, 148, 4, 5, 36, 0, 0, 0, \
> > +		V4L2_DV_BT_STD_SDI) \
> > +}
> > +
> > +#define XLNX_V4L2_DV_BT_2048X1080P50 { \
> > +	.type = V4L2_DV_BT_656_1120, \
> > +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> > +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> > +		148500000, 400, 44, 148, 4, 5, 36, 0, 0, 0, \
> > +		V4L2_DV_BT_STD_SDI) \
> > +}
> > +
> > +#define XLNX_V4L2_DV_BT_2048X1080P60 { \
> > +	.type = V4L2_DV_BT_656_1120, \
> > +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> > +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> > +		148500000, 88, 44, 20, 4, 5, 36, 0, 0, 0, \
> > +		V4L2_DV_BT_STD_SDI) \
> > +}
> > +
> > +#define XLNX_V4L2_DV_BT_1920X1080I48 { \
> > +	.type = V4L2_DV_BT_656_1120, \
> > +	V4L2_INIT_BT_TIMINGS(1920, 1080, 1, \
> > +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> > +		148500000, 371, 88, 371, 2, 5, 15, 3, 5, 15, \
> > +		V4L2_DV_BT_STD_SDI) \
> > +}
> > +
> > +#endif /* __UAPI_XILINX_SDIRXSS_H__ */

-- 
Regards,

Laurent Pinchart

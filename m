Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745F01C73A9
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 17:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729322AbgEFPMD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 11:12:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56840 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbgEFPMC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 May 2020 11:12:02 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E94FB542;
        Wed,  6 May 2020 17:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588777908;
        bh=OgPW0FiG0bfGFWpm6HDke/69B2sIgCPK3Ih7ue2cWbE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h74pNX9KGvfOSBrhejIXpgLtaxc9kCnoLUeUfooKvarY4LyEkQHtRLY//RzycJ1D5
         vj7q84n+Ut/Ue/iEiHHtVxsj8ZVtWFlyPm2J55urlAXqX9z+37opOINfp4uXDPBvb+
         MSFf4bgkHNU4bBYv3xO3ryd4z6v8qCIY3Aq6Ydmk=
Date:   Wed, 6 May 2020 18:11:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     Hyun Kwon <hyunk@xilinx.com>, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hans.verkuil@cisco.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx
 Subsystem driver
Message-ID: <20200506151142.GA15206@pendragon.ideasonboard.com>
References: <20200429141705.18755-1-vishal.sagar@xilinx.com>
 <20200429141705.18755-3-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200429141705.18755-3-vishal.sagar@xilinx.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

Thank you for the patch.

There are a few questions for Hans below.

On Wed, Apr 29, 2020 at 07:47:04PM +0530, Vishal Sagar wrote:
> The Xilinx UHD-SDI Rx subsystem soft IP is used to capture native SDI
> streams from SDI sources like SDI broadcast equipment like cameras and
> mixers. This block outputs either native SDI, native video or
> AXI4-Stream compliant data stream for further processing. Please refer
> to PG290 for details.
> 
> The driver is used to configure the IP to add framer, search for
> specific modes, get the detected mode, stream parameters, errors, etc.
> It also generates events for video lock/unlock, bridge over/under flow.
> 
> The driver supports 10/12 bpc YUV 422 media bus format currently. It also
> decodes the stream parameters based on the ST352 packet embedded in the
> stream. In case the ST352 packet isn't present in the stream, the core's
> detected properties are used to set stream properties.

As commented on patch 1/2, I don't see a mention of 12 bpc in the
documentation. Let's discuss it as part of patch 1/2.

> The driver currently supports only the AXI4-Stream IP configuration.
> 
> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> ---
> v2
> - Added DV timing support based on Hans Verkuilś feedback
> - More documentation to custom v4l controls and events
> - Fixed Hyunś comments
> - Added macro for masking and shifting as per Joe Perches comments
> - Updated to latest as per Xilinx github repo driver like
>   adding new DV timings not in mainline yet uptill 03/21/20
> 
>  drivers/media/platform/xilinx/Kconfig         |   11 +
>  drivers/media/platform/xilinx/Makefile        |    1 +
>  .../media/platform/xilinx/xilinx-sdirxss.c    | 2162 +++++++++++++++++
>  include/uapi/linux/xilinx-sdirxss.h           |  179 ++
>  include/uapi/linux/xilinx-v4l2-controls.h     |   67 +
>  5 files changed, 2420 insertions(+)
>  create mode 100644 drivers/media/platform/xilinx/xilinx-sdirxss.c
>  create mode 100644 include/uapi/linux/xilinx-sdirxss.h
> 
> diff --git a/drivers/media/platform/xilinx/Kconfig b/drivers/media/platform/xilinx/Kconfig
> index 01c96fb66414..77091318a9c9 100644
> --- a/drivers/media/platform/xilinx/Kconfig
> +++ b/drivers/media/platform/xilinx/Kconfig
> @@ -12,6 +12,17 @@ config VIDEO_XILINX
>  
>  if VIDEO_XILINX
>  
> +config VIDEO_XILINX_SDIRXSS
> +	tristate "Xilinx UHD SDI Rx Subsystem"
> +	help
> +	  Driver for Xilinx UHD-SDI Rx Subsystem. This is a V4L sub-device
> +	  based driver that takes input from a SDI source like SDI camera and
> +	  converts it into an AXI4-Stream. The subsystem comprises of a SMPTE

s/comprises of/comprises/

> +	  UHD-SDI Rx core, a SDI Rx to Native Video bridge and a Video In to
> +	  AXI4-Stream bridge. The driver is used to set different stream
> +	  detection modes and identify stream properties to properly configure
> +	  downstream.
> +
>  config VIDEO_XILINX_TPG
>  	tristate "Xilinx Video Test Pattern Generator"
>  	depends on VIDEO_XILINX
> diff --git a/drivers/media/platform/xilinx/Makefile b/drivers/media/platform/xilinx/Makefile
> index 4cdc0b1ec7a5..6c375f03f587 100644
> --- a/drivers/media/platform/xilinx/Makefile
> +++ b/drivers/media/platform/xilinx/Makefile
> @@ -2,6 +2,7 @@
>  
>  xilinx-video-objs += xilinx-dma.o xilinx-vip.o xilinx-vipp.o
>  
> +obj-$(CONFIG_VIDEO_XILINX_SDIRXSS) += xilinx-sdirxss.o
>  obj-$(CONFIG_VIDEO_XILINX) += xilinx-video.o
>  obj-$(CONFIG_VIDEO_XILINX_TPG) += xilinx-tpg.o
>  obj-$(CONFIG_VIDEO_XILINX_VTC) += xilinx-vtc.o
> diff --git a/drivers/media/platform/xilinx/xilinx-sdirxss.c b/drivers/media/platform/xilinx/xilinx-sdirxss.c
> new file mode 100644
> index 000000000000..c536ea3aaa0d
> --- /dev/null
> +++ b/drivers/media/platform/xilinx/xilinx-sdirxss.c
> @@ -0,0 +1,2162 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for Xilinx SDI Rx Subsystem
> + *
> + * Copyright (C) 2017 - 2020 Xilinx, Inc.
> + *
> + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
> + *

You can remove this blank line.

> + */
> +
> +#include <dt-bindings/media/xilinx-vip.h>
> +#include <linux/bitops.h>
> +#include <linux/compiler.h>
> +#include <linux/clk.h>

You nearly got the alphabetical order right ;-)

> +#include <linux/delay.h>

No use of delay or sleep functions in the code, is this needed ?

> +#include <linux/device.h>

You can probably drop this one as you include platform_device.h.

> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>

I don't think of_irq is needed either.

> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/spinlock_types.h>

The driver doesn't seems to use spinlocks, you can remove those two
headers.

> +#include <linux/types.h>
> +#include <linux/v4l2-dv-timings.h>
> +#include <linux/v4l2-subdev.h>
> +#include <linux/xilinx-sdirxss.h>
> +#include <linux/xilinx-v4l2-controls.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +#include "xilinx-vip.h"
> +
> +/*
> + * SDI Rx register map, bitmask and offsets
> + */
> +#define XSDIRX_RST_CTRL_REG		0x00
> +#define XSDIRX_MDL_CTRL_REG		0x04
> +#define XSDIRX_GLBL_IER_REG		0x0C
> +#define XSDIRX_ISR_REG			0x10
> +#define XSDIRX_IER_REG			0x14
> +#define XSDIRX_ST352_VALID_REG		0x18
> +#define XSDIRX_ST352_DS1_REG		0x1C

Could you use lower-case hex values ? That's the most common option in
kernel code. If you use vim,

:%s/\<0x[0-9A-F]\+\>/\L\0/

I'm sure there's an emacs equivalent :-)

> +#define XSDIRX_ST352_DS3_REG		0x20
> +#define XSDIRX_ST352_DS5_REG		0x24
> +#define XSDIRX_ST352_DS7_REG		0x28
> +#define XSDIRX_ST352_DS9_REG		0x2C
> +#define XSDIRX_ST352_DS11_REG		0x30
> +#define XSDIRX_ST352_DS13_REG		0x34
> +#define XSDIRX_ST352_DS15_REG		0x38
> +#define XSDIRX_VERSION_REG		0x3C
> +#define XSDIRX_SS_CONFIG_REG		0x40
> +#define XSDIRX_MODE_DET_STAT_REG	0x44
> +#define XSDIRX_TS_DET_STAT_REG		0x48
> +#define XSDIRX_EDH_STAT_REG		0x4C
> +#define XSDIRX_EDH_ERRCNT_EN_REG	0x50
> +#define XSDIRX_EDH_ERRCNT_REG		0x54
> +#define XSDIRX_CRC_ERRCNT_REG		0x58
> +#define XSDIRX_VID_LOCK_WINDOW_REG	0x5C
> +#define XSDIRX_SB_RX_STS_REG		0x60
> +
> +#define XSDIRX_RST_CTRL_SS_EN_MASK			BIT(0)
> +#define XSDIRX_RST_CTRL_SRST_MASK			BIT(1)
> +#define XSDIRX_RST_CTRL_RST_CRC_ERRCNT_MASK		BIT(2)
> +#define XSDIRX_RST_CTRL_RST_EDH_ERRCNT_MASK		BIT(3)
> +#define XSDIRX_RST_CTRL_SDIRX_BRIDGE_ENB_MASK		BIT(8)
> +#define XSDIRX_RST_CTRL_VIDIN_AXI4S_MOD_ENB_MASK	BIT(9)
> +#define XSDIRX_RST_CTRL_BRIDGE_CH_FMT_OFFSET		10
> +#define XSDIRX_RST_CTRL_BRIDGE_CH_FMT_MASK		GENMASK(12, 10)
> +#define XSDIRX_RST_CTRL_BRIDGE_CH_FMT_YUV444		1
> +
> +#define XSDIRX_MDL_CTRL_FRM_EN_MASK		BIT(4)
> +#define XSDIRX_MDL_CTRL_MODE_DET_EN_MASK	BIT(5)
> +#define XSDIRX_MDL_CTRL_MODE_HD_EN_MASK		BIT(8)
> +#define XSDIRX_MDL_CTRL_MODE_SD_EN_MASK		BIT(9)
> +#define XSDIRX_MDL_CTRL_MODE_3G_EN_MASK		BIT(10)
> +#define XSDIRX_MDL_CTRL_MODE_6G_EN_MASK		BIT(11)
> +#define XSDIRX_MDL_CTRL_MODE_12GI_EN_MASK	BIT(12)
> +#define XSDIRX_MDL_CTRL_MODE_12GF_EN_MASK	BIT(13)
> +#define XSDIRX_MDL_CTRL_MODE_AUTO_DET_MASK	GENMASK(13, 8)
> +
> +#define XSDIRX_MDL_CTRL_FORCED_MODE_OFFSET	16
> +#define XSDIRX_MDL_CTRL_FORCED_MODE_MASK	GENMASK(18, 16)
> +
> +#define XSDIRX_GLBL_INTR_EN_MASK	BIT(0)
> +
> +#define XSDIRX_INTR_VIDLOCK_MASK	BIT(0)
> +#define XSDIRX_INTR_VIDUNLOCK_MASK	BIT(1)
> +#define XSDIRX_INTR_OVERFLOW_MASK	BIT(9)
> +#define XSDIRX_INTR_UNDERFLOW_MASK	BIT(10)
> +
> +#define XSDIRX_INTR_ALL_MASK	(XSDIRX_INTR_VIDLOCK_MASK |\
> +				XSDIRX_INTR_VIDUNLOCK_MASK |\
> +				XSDIRX_INTR_OVERFLOW_MASK |\
> +				XSDIRX_INTR_UNDERFLOW_MASK)
> +
> +#define XSDIRX_ST352_VALID_DS1_MASK	BIT(0)
> +#define XSDIRX_ST352_VALID_DS3_MASK	BIT(1)
> +#define XSDIRX_ST352_VALID_DS5_MASK	BIT(2)
> +#define XSDIRX_ST352_VALID_DS7_MASK	BIT(3)
> +#define XSDIRX_ST352_VALID_DS9_MASK	BIT(4)
> +#define XSDIRX_ST352_VALID_DS11_MASK	BIT(5)
> +#define XSDIRX_ST352_VALID_DS13_MASK	BIT(6)
> +#define XSDIRX_ST352_VALID_DS15_MASK	BIT(7)
> +
> +#define XSDIRX_MODE_DET_STAT_RX_MODE_MASK	GENMASK(2, 0)
> +#define XSDIRX_MODE_DET_STAT_MODE_LOCK_MASK	BIT(3)
> +#define XSDIRX_MODE_DET_STAT_ACT_STREAM_MASK	GENMASK(6, 4)
> +#define XSDIRX_MODE_DET_STAT_ACT_STREAM_OFFSET	4
> +#define XSDIRX_MODE_DET_STAT_LVLB_3G_MASK	BIT(7)
> +
> +#define XSDIRX_TS_DET_STAT_LOCKED_MASK		BIT(0)
> +#define XSDIRX_TS_DET_STAT_SCAN_MASK		BIT(1)
> +#define XSDIRX_TS_DET_STAT_SCAN_OFFSET		(1)
> +#define XSDIRX_TS_DET_STAT_FAMILY_MASK		GENMASK(7, 4)
> +#define XSDIRX_TS_DET_STAT_FAMILY_OFFSET	(4)
> +#define XSDIRX_TS_DET_STAT_RATE_MASK		GENMASK(11, 8)
> +#define XSDIRX_TS_DET_STAT_RATE_OFFSET		(8)
> +
> +#define XSDIRX_TS_DET_STAT_RATE_NONE		0x0
> +#define XSDIRX_TS_DET_STAT_RATE_23_98HZ		0x2
> +#define XSDIRX_TS_DET_STAT_RATE_24HZ		0x3
> +#define XSDIRX_TS_DET_STAT_RATE_47_95HZ		0x4
> +#define XSDIRX_TS_DET_STAT_RATE_25HZ		0x5
> +#define XSDIRX_TS_DET_STAT_RATE_29_97HZ		0x6
> +#define XSDIRX_TS_DET_STAT_RATE_30HZ		0x7
> +#define XSDIRX_TS_DET_STAT_RATE_48HZ		0x8
> +#define XSDIRX_TS_DET_STAT_RATE_50HZ		0x9
> +#define XSDIRX_TS_DET_STAT_RATE_59_94HZ		0xA
> +#define XSDIRX_TS_DET_STAT_RATE_60HZ		0xB
> +
> +#define XSDIRX_EDH_STAT_EDH_AP_MASK	BIT(0)
> +#define XSDIRX_EDH_STAT_EDH_FF_MASK	BIT(1)
> +#define XSDIRX_EDH_STAT_EDH_ANC_MASK	BIT(2)
> +#define XSDIRX_EDH_STAT_AP_FLAG_MASK	GENMASK(8, 4)
> +#define XSDIRX_EDH_STAT_FF_FLAG_MASK	GENMASK(13, 9)
> +#define XSDIRX_EDH_STAT_ANC_FLAG_MASK	GENMASK(18, 14)
> +#define XSDIRX_EDH_STAT_PKT_FLAG_MASK	GENMASK(22, 19)
> +
> +#define XSDIRX_EDH_ERRCNT_COUNT_MASK	GENMASK(15, 0)
> +
> +#define XSDIRX_CRC_ERRCNT_COUNT_MASK	GENMASK(31, 16)
> +#define XSDIRX_CRC_ERRCNT_DS_CRC_MASK	GENMASK(15, 0)
> +
> +#define XSDIRX_VERSION_REV_MASK		GENMASK(7, 0)
> +#define XSDIRX_VERSION_PATCHID_MASK	GENMASK(11, 8)
> +#define XSDIRX_VERSION_VER_REV_MASK	GENMASK(15, 12)
> +#define XSDIRX_VERSION_VER_MIN_MASK	GENMASK(23, 16)
> +#define XSDIRX_VERSION_VER_MAJ_MASK	GENMASK(31, 24)
> +
> +#define XSDIRX_SS_CONFIG_EDH_INCLUDED_MASK		BIT(1)
> +
> +#define XSDIRX_STAT_SB_RX_TDATA_CHANGE_DONE_MASK	BIT(0)
> +#define XSDIRX_STAT_SB_RX_TDATA_CHANGE_FAIL_MASK	BIT(1)
> +#define XSDIRX_STAT_SB_RX_TDATA_GT_RESETDONE_MASK	BIT(2)
> +#define XSDIRX_STAT_SB_RX_TDATA_GT_BITRATE_MASK		BIT(3)
> +
> +#define XSDIRX_DEFAULT_WIDTH	(1920)

No need for parentheses around integer values in macros.

> +#define XSDIRX_DEFAULT_HEIGHT	(1080)
> +
> +#define XSDIRX_MAX_STR_LENGTH	16
> +
> +#define XSDIRXSS_SDI_STD_3G		0
> +#define XSDIRXSS_SDI_STD_6G		1
> +#define XSDIRXSS_SDI_STD_12G_8DS	2

Should these three constants be placed in an enum ? The
xsdirxss_core.mode field would then become an enum.

> +
> +#define XSDIRX_DEFAULT_VIDEO_LOCK_WINDOW	0x3000
> +
> +#define XSDIRX_MODE_HD_MASK	0x0
> +#define XSDIRX_MODE_SD_MASK	0x1
> +#define XSDIRX_MODE_3G_MASK	0x2
> +#define XSDIRX_MODE_6G_MASK	0x4
> +#define XSDIRX_MODE_12GI_MASK	0x5
> +#define XSDIRX_MODE_12GF_MASK	0x6
> +
> +/* Maximum number of events per file handle. */
> +#define XSDIRX_MAX_EVENTS	(128)

Do we really need such a high number ? How often are the overflow and
underflow expected ?

> +
> +/* ST352 related macros */
> +#define XST352_PAYLOAD_BYTE1_MASK	0xFF
> +#define XST352_PAYLOAD_BYTE1_OFFSET	0
> +#define XST352_PAYLOAD_BYTE2_OFFSET	8
> +#define XST352_PAYLOAD_BYTE3_OFFSET	16
> +#define XST352_PAYLOAD_BYTE4_OFFSET	24
> +
> +#define XST352_BYTE1_ST292_1x720L_1_5G		0x84
> +#define XST352_BYTE1_ST292_1x1080L_1_5G		0x85
> +#define XST352_BYTE1_ST425_2008_750L_3GB	0x88
> +#define XST352_BYTE1_ST425_2008_1125L_3GA	0x89
> +#define XST352_BYTE1_ST372_DL_3GB		0x8A
> +#define XST352_BYTE1_ST372_2x720L_3GB		0x8B
> +#define XST352_BYTE1_ST372_2x1080L_3GB		0x8C
> +#define XST352_BYTE1_ST2081_10_2160L_6G		0xC0
> +#define XST352_BYTE1_ST2081_10_2_1080L_6G	0xC1
> +#define XST352_BYTE1_ST2081_10_DL_2160L_6G	0xC2
> +#define XST352_BYTE1_ST2082_10_2160L_12G	0xCE
> +
> +#define XST352_BYTE2_TS_TYPE_MASK		BIT(15)
> +#define XST352_BYTE2_TS_TYPE_OFFSET		15
> +#define XST352_BYTE2_PIC_TYPE_MASK		BIT(14)
> +#define XST352_BYTE2_PIC_TYPE_OFFSET		14
> +#define XST352_BYTE2_TS_PIC_TYPE_INTERLACED	0
> +#define XST352_BYTE2_TS_PIC_TYPE_PROGRESSIVE	1
> +
> +#define XST352_BYTE2_FPS_MASK			0xF
> +#define XST352_BYTE2_FPS_OFFSET			8
> +#define XST352_BYTE2_FPS_24F			0x2
> +#define XST352_BYTE2_FPS_24			0x3
> +#define XST352_BYTE2_FPS_48F			0x4
> +#define XST352_BYTE2_FPS_25			0x5
> +#define XST352_BYTE2_FPS_30F			0x6
> +#define XST352_BYTE2_FPS_30			0x7
> +#define XST352_BYTE2_FPS_48			0x8
> +#define XST352_BYTE2_FPS_50			0x9
> +#define XST352_BYTE2_FPS_60F			0xA
> +#define XST352_BYTE2_FPS_60			0xB
> +/* Table 4 ST 2081-10:2015 */
> +#define XST352_BYTE2_FPS_96			0xC
> +#define XST352_BYTE2_FPS_100			0xD
> +#define XST352_BYTE2_FPS_120			0xE
> +#define XST352_BYTE2_FPS_120F			0xF
> +
> +#define XST352_BYTE3_ACT_LUMA_COUNT_MASK	BIT(22)
> +#define XST352_BYTE3_ACT_LUMA_COUNT_OFFSET	22
> +
> +#define XST352_BYTE3_COLOR_FORMAT_MASK		GENMASK(19, 16)
> +#define XST352_BYTE3_COLOR_FORMAT_OFFSET	16
> +#define XST352_BYTE3_COLOR_FORMAT_422		0x0
> +#define XST352_BYTE3_COLOR_FORMAT_YUV444	0x1
> +#define XST352_BYTE3_COLOR_FORMAT_420		0x3
> +#define XST352_BYTE3_COLOR_FORMAT_GBR		0x2
> +
> +#define XST352_BYTE4_BIT_DEPTH_MASK		GENMASK(25, 24)
> +#define XST352_BYTE4_BIT_DEPTH_OFFSET		24
> +#define XST352_BYTE4_BIT_DEPTH_10		0x1
> +#define XST352_BYTE4_BIT_DEPTH_12		0x2
> +
> +#define CLK_INT		148500000UL
> +
> +#define rshift_and_mask(val, type) \
> +		(((val) >> type##_OFFSET) & type##_MASK)
> +
> +#define mask_and_rshift(val, type) \
> +		(((val) & type##_MASK) >> type##_OFFSET)

How about using FIELD_GET() from linux/bitfield.h ? It's more standard,
and will thus be less confusing to readers.

> +
> +/**
> + * enum sdi_family_enc - SDI Transport Video Format Detected with Active Pixels
> + * @XSDIRX_SMPTE_ST_274: SMPTE ST 274 detected with AP 1920x1080
> + * @XSDIRX_SMPTE_ST_296: SMPTE ST 296 detected with AP 1280x720
> + * @XSDIRX_SMPTE_ST_2048_2: SMPTE ST 2048-2 detected with AP 2048x1080
> + * @XSDIRX_SMPTE_ST_295: SMPTE ST 295 detected with AP 1920x1080
> + * @XSDIRX_NTSC: NTSC encoding detected with AP 720x486
> + * @XSDIRX_PAL: PAL encoding detected with AP 720x576
> + * @XSDIRX_TS_UNKNOWN: Unknown SMPTE Transport family type
> + */
> +enum sdi_family_enc {
> +	XSDIRX_SMPTE_ST_274	= 0,
> +	XSDIRX_SMPTE_ST_296	= 1,
> +	XSDIRX_SMPTE_ST_2048_2	= 2,
> +	XSDIRX_SMPTE_ST_295	= 3,
> +	XSDIRX_NTSC		= 8,
> +	XSDIRX_PAL		= 9,
> +	XSDIRX_TS_UNKNOWN	= 15
> +};

This should ideally go in a header file shared between the SDI RX and
TX, as it's part of the UHD-SDI IP core, but it can be done later.

> +
> +/**
> + * struct xsdirxss_core - Core configuration SDI Rx Subsystem device structure
> + * @dev: Platform structure
> + * @iomem: Base address of subsystem
> + * @irq: requested irq number
> + * @include_edh: EDH processor presence
> + * @mode: 3G/6G/12G mode
> + * @clks: array of clocks
> + * @num_clks: number of clocks
> + * @bpc: Bits per component, can be 10 or 12
> + */
> +struct xsdirxss_core {
> +	struct device *dev;
> +	void __iomem *iomem;
> +	int irq;
> +	bool include_edh;
> +	int mode;
> +	struct clk_bulk_data *clks;
> +	int num_clks;

num_clks is never negative, you can make it an unsigned int.

> +	u32 bpc;
> +};
> +
> +/**
> + * struct xsdirxss_state - SDI Rx Subsystem device structure
> + * @core: Core structure for MIPI SDI Rx Subsystem
> + * @subdev: The v4l2 subdev structure
> + * @ctrl_handler: control handler
> + * @event: Holds the video unlock event
> + * @format: Active V4L2 format on source pad
> + * @default_format: default V4L2 media bus format
> + * @frame_interval: Captures the frame rate
> + * @pad: source media pad
> + * @vidlockwin: Video lock window value set by control
> + * @edhmask: EDH mask set by control
> + * @searchmask: Search mask set by control
> + * @streaming: Flag for storing streaming state
> + * @vidlocked: Flag indicating SDI Rx has locked onto video stream
> + * @ts_is_interlaced: Flag indicating Transport Stream is interlaced.
> + * @framer_enable: Flag for framer enabled or not set by control
> + *
> + * This structure contains the device driver related parameters
> + */
> +struct xsdirxss_state {
> +	struct xsdirxss_core core;
> +	struct v4l2_subdev subdev;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_event event;

Is this needed, can't it be a local variable in the function where it is
used ?

> +	struct v4l2_mbus_framefmt format;
> +	struct v4l2_mbus_framefmt default_format;
> +	struct v4l2_fract frame_interval;
> +	struct media_pad pad;

You will need two pads as there should be two ports (let's discuss it as
part of patch 1/2).

> +	u32 vidlockwin;
> +	u32 edhmask;
> +	u16 searchmask;
> +	bool streaming;
> +	bool vidlocked;
> +	bool ts_is_interlaced;
> +	bool framer_enable;
> +};

As for the CSI2-RX, splitting core and state in separate structures
isn't an established practice. I think it leads to more complex code as
you have to remember in which structure each field is located.

> +
> +/* List of clocks required by UHD-SDI Rx subsystem */
> +static const char * const xsdirxss_clks[] = {
> +	"s_axi_aclk", "sdi_rx_clk", "video_out_clk",
> +};
> +
> +/* TODO - Add YUV 444/420 and RBG 10/12 bpc mbus formats here */

s/RBG/RGB/ ?

> +static const u32 xsdirxss_10bpc_mbus_fmts[] = {
> +	MEDIA_BUS_FMT_UYVY10_1X20,
> +};
> +
> +static const u32 xsdirxss_12bpc_mbus_fmts[] = {
> +	MEDIA_BUS_FMT_UYVY12_1X24,
> +};
> +
> +static const struct v4l2_dv_timings fmt_cap[] = {
> +	V4L2_DV_BT_SDI_720X487I60,
> +	V4L2_DV_BT_CEA_720X576I50,
> +	V4L2_DV_BT_CEA_1280X720P24,
> +	V4L2_DV_BT_CEA_1280X720P25,
> +	V4L2_DV_BT_CEA_1280X720P30,
> +	V4L2_DV_BT_CEA_1280X720P50,
> +	V4L2_DV_BT_CEA_1280X720P60,
> +	V4L2_DV_BT_CEA_1920X1080P24,
> +	V4L2_DV_BT_CEA_1920X1080P30,
> +	V4L2_DV_BT_CEA_1920X1080I50,
> +	V4L2_DV_BT_CEA_1920X1080I60,
> +	V4L2_DV_BT_CEA_1920X1080P50,
> +	V4L2_DV_BT_CEA_1920X1080P60,
> +	V4L2_DV_BT_CEA_3840X2160P24,
> +	V4L2_DV_BT_CEA_3840X2160P30,
> +	V4L2_DV_BT_CEA_3840X2160P50,
> +	V4L2_DV_BT_CEA_3840X2160P60,
> +	V4L2_DV_BT_CEA_4096X2160P24,
> +	V4L2_DV_BT_CEA_4096X2160P25,
> +	V4L2_DV_BT_CEA_4096X2160P30,
> +	V4L2_DV_BT_CEA_4096X2160P50,
> +	V4L2_DV_BT_CEA_4096X2160P60,
> +
> +	XLNX_V4L2_DV_BT_2048X1080P24,
> +	XLNX_V4L2_DV_BT_2048X1080P25,
> +	XLNX_V4L2_DV_BT_2048X1080P30,
> +	XLNX_V4L2_DV_BT_2048X1080I48,
> +	XLNX_V4L2_DV_BT_2048X1080I50,
> +	XLNX_V4L2_DV_BT_2048X1080I60,
> +	XLNX_V4L2_DV_BT_2048X1080P48,
> +	XLNX_V4L2_DV_BT_2048X1080P50,
> +	XLNX_V4L2_DV_BT_2048X1080P60,
> +	XLNX_V4L2_DV_BT_1920X1080P48,
> +	XLNX_V4L2_DV_BT_1920X1080I48,
> +	XLNX_V4L2_DV_BT_3840X2160P48,
> +	XLNX_V4L2_DV_BT_4096X2160P48,
> +};
> +
> +struct xsdirxss_dv_map {
> +	u32 width;
> +	u32 height;
> +	u32 fps;
> +	struct v4l2_dv_timings format;
> +};
> +
> +static const struct xsdirxss_dv_map xsdirxss_dv_timings[] = {
> +	/* SD - 720x487i60 */
> +	{ 720, 243, 30, V4L2_DV_BT_SDI_720X487I60 },
> +	/* SD - 720x576i50 */
> +	{ 720, 288, 25, V4L2_DV_BT_CEA_720X576I50 },
> +	/* HD - 1280x720p23.98 */
> +	/* HD - 1280x720p24 */
> +	{ 1280, 720, 24, V4L2_DV_BT_CEA_1280X720P24 },
> +	/* HD - 1280x720p25 */
> +	{ 1280, 720, 25, V4L2_DV_BT_CEA_1280X720P25 },
> +	/* HD - 1280x720p29.97 */
> +	/* HD - 1280x720p30 */
> +	{ 1280, 720, 30, V4L2_DV_BT_CEA_1280X720P30 },
> +	/* HD - 1280x720p50 */
> +	{ 1280, 720, 50, V4L2_DV_BT_CEA_1280X720P50 },
> +	/* HD - 1280x720p59.94 */
> +	/* HD - 1280x720p60 */
> +	{ 1280, 720, 60, V4L2_DV_BT_CEA_1280X720P60 },
> +	/* HD - 1920x1080p23.98 */
> +	/* HD - 1920x1080p24 */
> +	{ 1920, 1080, 24, V4L2_DV_BT_CEA_1920X1080P24 },
> +	/* HD - 1920x1080p25 */
> +	{ 1920, 1080, 25, V4L2_DV_BT_CEA_1920X1080P25 },
> +	/* HD - 1920x1080p29.97 */
> +	/* HD - 1920x1080p30 */
> +	{ 1920, 1080, 30, V4L2_DV_BT_CEA_1920X1080P30 },
> +
> +	/* HD - 2048x1080p23.98 */
> +	/* HD - 2048x1080p24 */
> +	{ 2048, 1080, 24, XLNX_V4L2_DV_BT_2048X1080P24 },
> +	/* HD - 2048x1080p25 */
> +	{ 2048, 1080, 24, XLNX_V4L2_DV_BT_2048X1080P25 },
> +	/* HD - 2048x1080p29.97 */
> +	/* HD - 2048x1080p30 */
> +	{ 2048, 1080, 24, XLNX_V4L2_DV_BT_2048X1080P30 },
> +	/* HD - 1920x1080i47.95 */
> +	/* HD - 1920x1080i48 */
> +	{ 1920, 540, 24, XLNX_V4L2_DV_BT_1920X1080I48 },
> +
> +	/* HD - 1920x1080i50 */
> +	{ 1920, 540, 25, V4L2_DV_BT_CEA_1920X1080I50 },
> +	/* HD - 1920x1080i59.94 */
> +	/* HD - 1920x1080i60 */
> +	{ 1920, 540, 30, V4L2_DV_BT_CEA_1920X1080I60 },
> +
> +	/* HD - 2048x1080i47.95 */
> +	/* HD - 2048x1080i48 */
> +	{ 2048, 540, 24, XLNX_V4L2_DV_BT_2048X1080I48 },
> +	/* HD - 2048x1080i50 */
> +	{ 2048, 540, 25, XLNX_V4L2_DV_BT_2048X1080I50 },
> +	/* HD - 2048x1080i59.94 */
> +	/* HD - 2048x1080i60 */
> +	{ 2048, 540, 30, XLNX_V4L2_DV_BT_2048X1080I60 },
> +	/* 3G - 1920x1080p47.95 */
> +	/* 3G - 1920x1080p48 */
> +	{ 1920, 1080, 48, XLNX_V4L2_DV_BT_1920X1080P48 },
> +
> +	/* 3G - 1920x1080p50 148.5 */
> +	{ 1920, 1080, 50, V4L2_DV_BT_CEA_1920X1080P50 },
> +	/* 3G - 1920x1080p59.94 148.5/1.001 */
> +	/* 3G - 1920x1080p60 148.5 */
> +	{ 1920, 1080, 60, V4L2_DV_BT_CEA_1920X1080P60 },
> +
> +	/* 3G - 2048x1080p47.95 */
> +	/* 3G - 2048x1080p48 */
> +	{ 2048, 1080, 48, XLNX_V4L2_DV_BT_2048X1080P48 },
> +	/* 3G - 2048x1080p50 */
> +	{ 2048, 1080, 50, XLNX_V4L2_DV_BT_2048X1080P50 },
> +	/* 3G - 2048x1080p59.94 */
> +	/* 3G - 2048x1080p60 */
> +	{ 2048, 1080, 60, XLNX_V4L2_DV_BT_2048X1080P60 },
> +
> +	/* 6G - 3840X2160p23.98 */
> +	/* 6G - 3840X2160p24 */
> +	{ 3840, 2160, 24, V4L2_DV_BT_CEA_3840X2160P24 },
> +	/* 6G - 3840X2160p25 */
> +	{ 3840, 2160, 25, V4L2_DV_BT_CEA_3840X2160P25 },
> +	/* 6G - 3840X2160p29.97 */
> +	/* 6G - 3840X2160p30 */
> +	{ 3840, 2160, 30, V4L2_DV_BT_CEA_3840X2160P30 },
> +	/* 6G - 4096X2160p23.98 */
> +	/* 6G - 4096X2160p24 */
> +	{ 4096, 2160, 24, V4L2_DV_BT_CEA_4096X2160P24 },
> +	/* 6G - 4096X2160p25 */
> +	{ 4096, 2160, 25, V4L2_DV_BT_CEA_4096X2160P25 },
> +	/* 6G - 4096X2160p29.97 */
> +	/* 6G - 4096X2160p30 */
> +	{ 4096, 2160, 30, V4L2_DV_BT_CEA_4096X2160P30 },
> +	/* 12G - 3840X2160p47.95 */
> +	/* 12G - 3840X2160p48 */
> +	{ 3840, 2160, 48, XLNX_V4L2_DV_BT_3840X2160P48 },
> +
> +	/* 12G - 3840X2160p50 */
> +	{ 3840, 2160, 50, V4L2_DV_BT_CEA_3840X2160P50 },
> +	/* 12G - 3840X2160p59.94 */
> +	/* 12G - 3840X2160p60 */
> +	{ 3840, 2160, 60, V4L2_DV_BT_CEA_3840X2160P60 },
> +
> +	/* 12G - 4096X2160p47.95 */
> +	/* 12G - 4096X2160p48 */
> +	{ 3840, 2160, 48, XLNX_V4L2_DV_BT_4096X2160P48 },
> +
> +	/* 12G - 4096X2160p50 */
> +	{ 4096, 2160, 50, V4L2_DV_BT_CEA_4096X2160P50 },
> +	/* 12G - 4096X2160p59.94 */
> +	/* 12G - 4096X2160p60 */
> +	{ 4096, 2160, 60, V4L2_DV_BT_CEA_4096X2160P60 },
> +};
> +
> +static inline struct xsdirxss_state *
> +to_xsdirxssstate(struct v4l2_subdev *subdev)
> +{
> +	return container_of(subdev, struct xsdirxss_state, subdev);
> +}
> +
> +/*
> + * Register related operations
> + */
> +static inline u32 xsdirxss_read(struct xsdirxss_core *xsdirxss, u32 addr)
> +{
> +	return ioread32(xsdirxss->iomem + addr);
> +}
> +
> +static inline void xsdirxss_write(struct xsdirxss_core *xsdirxss, u32 addr,
> +				  u32 value)
> +{
> +	iowrite32(value, xsdirxss->iomem + addr);
> +}
> +
> +static inline void xsdirxss_clr(struct xsdirxss_core *xsdirxss, u32 addr,
> +				u32 clr)
> +{
> +	xsdirxss_write(xsdirxss, addr, xsdirxss_read(xsdirxss, addr) & ~clr);
> +}
> +
> +static inline void xsdirxss_set(struct xsdirxss_core *xsdirxss, u32 addr,
> +				u32 set)
> +{
> +	xsdirxss_write(xsdirxss, addr, xsdirxss_read(xsdirxss, addr) | set);
> +}
> +
> +static inline void xsdirx_core_disable(struct xsdirxss_core *core)
> +{
> +	xsdirxss_clr(core, XSDIRX_RST_CTRL_REG, XSDIRX_RST_CTRL_SS_EN_MASK);
> +}
> +
> +static inline void xsdirx_core_enable(struct xsdirxss_core *core)
> +{
> +	xsdirxss_set(core, XSDIRX_RST_CTRL_REG, XSDIRX_RST_CTRL_SS_EN_MASK);
> +}
> +
> +static int xsdirx_set_modedetect(struct xsdirxss_core *core, u16 mask)
> +{
> +	u32 val;
> +	struct device *dev = core->dev;
> +
> +	mask &= XSDIRX_DETECT_ALL_MODES;
> +	if (!mask) {
> +		dev_err(dev, "Invalid bit mask = 0x%08x\n", mask);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dev, "mask = 0x%x\n", mask);
> +
> +	val = xsdirxss_read(core, XSDIRX_MDL_CTRL_REG);
> +	val &= ~XSDIRX_MDL_CTRL_MODE_DET_EN_MASK;
> +	val &= ~XSDIRX_MDL_CTRL_MODE_AUTO_DET_MASK;
> +	val &= ~XSDIRX_MDL_CTRL_FORCED_MODE_MASK;
> +
> +	if (hweight16(mask) > 1) {
> +		/* Multi mode detection as more than 1 bit set in mask */
> +		dev_dbg(dev, "Detect multiple modes\n");
> +
> +		if (mask & BIT(XSDIRX_MODE_SD_OFFSET))
> +			val |= XSDIRX_MDL_CTRL_MODE_SD_EN_MASK;
> +		if (mask & BIT(XSDIRX_MODE_HD_OFFSET))
> +			val |= XSDIRX_MDL_CTRL_MODE_HD_EN_MASK;
> +		if (mask & BIT(XSDIRX_MODE_3G_OFFSET))
> +			val |= XSDIRX_MDL_CTRL_MODE_3G_EN_MASK;
> +		if (mask & BIT(XSDIRX_MODE_6G_OFFSET))
> +			val |= XSDIRX_MDL_CTRL_MODE_6G_EN_MASK;
> +		if (mask & BIT(XSDIRX_MODE_12GI_OFFSET))
> +			val |= XSDIRX_MDL_CTRL_MODE_12GI_EN_MASK;
> +		if (mask & BIT(XSDIRX_MODE_12GF_OFFSET))
> +			val |= XSDIRX_MDL_CTRL_MODE_12GF_EN_MASK;
> +
> +		val |= XSDIRX_MDL_CTRL_MODE_DET_EN_MASK;
> +	} else {
> +		/* Fixed Mode */
> +		u32 forced_mode_mask;
> +
> +		dev_dbg(dev, "Detect fixed mode\n");
> +
> +		/* Find offset of first bit set */
> +		switch (__ffs(mask)) {
> +		case XSDIRX_MODE_SD_OFFSET:
> +			forced_mode_mask = XSDIRX_MODE_SD_MASK;
> +			break;
> +		case XSDIRX_MODE_HD_OFFSET:
> +			forced_mode_mask = XSDIRX_MODE_HD_MASK;
> +			break;
> +		case XSDIRX_MODE_3G_OFFSET:
> +			forced_mode_mask = XSDIRX_MODE_3G_MASK;
> +			break;
> +		case XSDIRX_MODE_6G_OFFSET:
> +			forced_mode_mask = XSDIRX_MODE_6G_MASK;
> +			break;
> +		case XSDIRX_MODE_12GI_OFFSET:
> +			forced_mode_mask = XSDIRX_MODE_12GI_MASK;
> +			break;
> +		case XSDIRX_MODE_12GF_OFFSET:
> +			forced_mode_mask = XSDIRX_MODE_12GF_MASK;
> +			break;
> +		default:
> +			forced_mode_mask = 0;
> +		}
> +		dev_dbg(dev, "Forced Mode Mask : 0x%x\n",
> +			forced_mode_mask);
> +		val |= forced_mode_mask << XSDIRX_MDL_CTRL_FORCED_MODE_OFFSET;
> +	}
> +
> +	dev_dbg(dev, "Modes to be detected : sdi ctrl reg = 0x%08x\n",
> +		val);
> +	xsdirxss_write(core, XSDIRX_MDL_CTRL_REG, val);
> +
> +	return 0;
> +}
> +
> +static void xsdirx_framer(struct xsdirxss_core *core, bool flag)
> +{
> +	if (flag)
> +		xsdirxss_set(core, XSDIRX_MDL_CTRL_REG,
> +			     XSDIRX_MDL_CTRL_FRM_EN_MASK);
> +	else
> +		xsdirxss_clr(core, XSDIRX_MDL_CTRL_REG,
> +			     XSDIRX_MDL_CTRL_FRM_EN_MASK);
> +}
> +
> +static void xsdirx_setedherrcnttrigger(struct xsdirxss_core *core, u32 enable)

That's a hard to read function name. Could you separate words with
underscores ? Same for functions below that concatenate multiple words
together.

> +{
> +	u32 val = xsdirxss_read(core, XSDIRX_EDH_ERRCNT_EN_REG);
> +
> +	val = enable & XSDIRX_EDH_ALLERR_MASK;
> +
> +	xsdirxss_write(core, XSDIRX_EDH_ERRCNT_EN_REG, val);
> +}
> +
> +static inline void xsdirx_setvidlockwindow(struct xsdirxss_core *core, u32 val)
> +{
> +	/*
> +	 * The video lock window is the amount of time for which the
> +	 * the mode and transport stream should be locked to get the
> +	 * video lock interrupt.
> +	 */
> +	xsdirxss_write(core, XSDIRX_VID_LOCK_WINDOW_REG, val);
> +}
> +
> +static inline void xsdirx_disableintr(struct xsdirxss_core *core, u32 mask)
> +{
> +	xsdirxss_clr(core, XSDIRX_IER_REG, mask);
> +}
> +
> +static inline void xsdirx_enableintr(struct xsdirxss_core *core, u32 mask)
> +{
> +	xsdirxss_set(core, XSDIRX_IER_REG, mask);
> +}
> +
> +static void xsdirx_globalintr(struct xsdirxss_core *core, bool flag)
> +{
> +	if (flag)
> +		xsdirxss_set(core, XSDIRX_GLBL_IER_REG,
> +			     XSDIRX_GLBL_INTR_EN_MASK);
> +	else
> +		xsdirxss_clr(core, XSDIRX_GLBL_IER_REG,
> +			     XSDIRX_GLBL_INTR_EN_MASK);
> +}
> +
> +static inline void xsdirx_clearintr(struct xsdirxss_core *core, u32 mask)
> +{
> +	xsdirxss_set(core, XSDIRX_ISR_REG, mask);
> +}
> +
> +static void xsdirx_vid_bridge_control(struct xsdirxss_core *core,
> +				      bool enable)
> +{
> +	u32 mask = XSDIRX_RST_CTRL_SDIRX_BRIDGE_ENB_MASK;
> +
> +	/*
> +	 * TODO - Enable YUV444/RBG format in the bridge based
> +	 * on BYTE3 color format.
> +	 * XSDIRX_RST_CTRL_BRIDGE_CH_FMT_YUV444
> +	 */
> +	if (enable)
> +		xsdirxss_set(core, XSDIRX_RST_CTRL_REG, mask);
> +	else
> +		xsdirxss_clr(core, XSDIRX_RST_CTRL_REG, mask);
> +}

This is only used in xsdirx_streamflow_control(), inlining it manually
would be simpler I think.

> +
> +static void xsdirx_axis4_bridge_control(struct xsdirxss_core *core,
> +					bool enable)
> +{
> +	if (enable)
> +		xsdirxss_set(core, XSDIRX_RST_CTRL_REG,
> +			     XSDIRX_RST_CTRL_VIDIN_AXI4S_MOD_ENB_MASK);
> +	else
> +		xsdirxss_clr(core, XSDIRX_RST_CTRL_REG,
> +			     XSDIRX_RST_CTRL_VIDIN_AXI4S_MOD_ENB_MASK);
> +}

Same for this one.

> +
> +static void xsdirx_streamflow_control(struct xsdirxss_core *core, bool enable)
> +{
> +	/* The sdi to native bridge is followed by native to axis4 bridge */
> +	if (enable) {
> +		xsdirx_axis4_bridge_control(core, enable);
> +		xsdirx_vid_bridge_control(core, enable);
> +	} else {
> +		xsdirx_vid_bridge_control(core, enable);
> +		xsdirx_axis4_bridge_control(core, enable);
> +	}
> +}
> +
> +static void xsdirxss_get_framerate(struct v4l2_fract *frame_interval,
> +				   u32 framerate)
> +{
> +	switch (framerate) {
> +	case XSDIRX_TS_DET_STAT_RATE_23_98HZ:
> +		frame_interval->numerator = 1001;
> +		frame_interval->denominator = 24000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_24HZ:
> +		frame_interval->numerator = 1000;
> +		frame_interval->denominator = 24000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_25HZ:
> +		frame_interval->numerator = 1000;
> +		frame_interval->denominator = 25000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_29_97HZ:
> +		frame_interval->numerator = 1001;
> +		frame_interval->denominator = 30000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_30HZ:
> +		frame_interval->numerator = 1000;
> +		frame_interval->denominator = 30000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_47_95HZ:
> +		frame_interval->numerator = 1001;
> +		frame_interval->denominator = 48000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_48HZ:
> +		frame_interval->numerator = 1000;
> +		frame_interval->denominator = 48000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_50HZ:
> +		frame_interval->numerator = 1000;
> +		frame_interval->denominator = 50000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_59_94HZ:
> +		frame_interval->numerator = 1001;
> +		frame_interval->denominator = 60000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_60HZ:
> +		frame_interval->numerator = 1000;
> +		frame_interval->denominator = 60000;
> +		break;
> +	default:
> +		frame_interval->numerator = 1;
> +		frame_interval->denominator = 1;
> +	}
> +}
> +
> +static void xsdirxss_set_gtclk(struct xsdirxss_state *state)
> +{
> +	struct clk *gtclk;
> +	unsigned long clkrate;
> +	int ret, is_frac;
> +	struct xsdirxss_core *core = &state->core;
> +	u32 mode;
> +	static int prev_is_frac = -1;
> +
> +	mode = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +	mode &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> +
> +	/*
> +	 * TODO: For now, don't change the clock rate for any mode except 12G.
> +	 * In future, configure gt clock for all modes and enable clock only
> +	 * when needed (stream on/off).
> +	 */
> +	if (mode != XSDIRX_MODE_12GI_MASK && mode != XSDIRX_MODE_12GF_MASK)
> +		return;
> +
> +	is_frac = state->frame_interval.numerator == 1001 ? 1 : 0;
> +
> +	if (prev_is_frac == is_frac)
> +		return;
> +
> +	xsdirx_core_disable(core);
> +	xsdirx_globalintr(core, false);
> +	xsdirx_disableintr(core, XSDIRX_INTR_ALL_MASK);
> +
> +	/* get sdi_rx_clk */
> +	gtclk = core->clks[1].clk;
> +	clkrate = clk_get_rate(gtclk);
> +	is_frac = state->frame_interval.numerator == 1001 ? 1 : 0;
> +
> +	/* calcualte clkrate */

s/calcualte/calculate/

> +	if (!is_frac)
> +		clkrate = CLK_INT;
> +	else
> +		clkrate = (CLK_INT * 1000) / 1001;

Shouldn't the clock rate also depend on the mode ? Table 3-2 lists
different clock rates for HD-SDI and 12G-SDI.

> +
> +	ret = clk_set_rate(gtclk, clkrate);
> +	if (ret)
> +		dev_err(core->dev, "failed to set clk rate = %d\n", ret);
> +
> +	clkrate = clk_get_rate(gtclk);
> +
> +	dev_dbg(core->dev, "clkrate = %lu is_frac = %d\n",
> +		clkrate, is_frac);
> +
> +	xsdirx_framer(core, state->framer_enable);

As this is called in both the IRQ handler and the s_ctrl handler, you
could have a race when accessing the XSDIRX_MDL_CTRL_REG register. You
will need to protect all accesses to registers that are written from
both the IRQ handler and userspace contexts with a spinlock.

> +	xsdirx_setedherrcnttrigger(core, state->edhmask);
> +	xsdirx_setvidlockwindow(core, state->vidlockwin);
> +	xsdirx_set_modedetect(core, state->searchmask);
> +	xsdirx_enableintr(core, XSDIRX_INTR_ALL_MASK);
> +	xsdirx_globalintr(core, true);
> +	xsdirx_core_enable(core);
> +
> +	prev_is_frac = is_frac;

That's lots of work done in an interrupt handler. As this function is
called when a stream lock is detected, if the clock rate has to be
changed, do I assume correctly that the resolution may have changed too
? That may require reconfiguring the pipeline and reallocating buffers.
With SD and HD TV, I think the usual practice is to notify userspace of
video lock and let it do the reconfiguration is required, instead of
attempting to do so automatically. Hans, is that correct ? How would we
handle then the case where the pipeline is already correctly configured
with big enough buffers (I'm not sure this can actually happen, for the
buffers yes, but for the pipeline configuration, maybe the format will
always need to change) ?

And I've now seen that we do emit the V4L2_EVENT_SRC_CH_RESOLUTION event
:-) Do we thus need to reconfigure the IP core here ?

> +}
> +
> +/**
> + * xsdirx_get_stream_properties - Get SDI Rx stream properties
> + * @state: pointer to driver state
> + *
> + * This function decodes the stream's ST352 payload (if available) to get
> + * stream properties like width, height, picture type (interlaced/progressive),
> + * etc.
> + *
> + * Return: 0 for success else errors
> + */
> +static int xsdirx_get_stream_properties(struct xsdirxss_state *state)
> +{
> +	struct xsdirxss_core *core = &state->core;
> +	struct device *dev = core->dev;
> +	u32 mode, payload = 0, val, family, valid, tscan;
> +	u8 byte1 = 0, active_luma = 0, pic_type = 0, framerate = 0;
> +	u8 sampling = XST352_BYTE3_COLOR_FORMAT_422;
> +	struct v4l2_mbus_framefmt *format = &state->format;
> +	u32 bpc = XST352_BYTE4_BIT_DEPTH_10;
> +
> +	mode = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +	mode &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> +
> +	valid = xsdirxss_read(core, XSDIRX_ST352_VALID_REG);
> +
> +	if (mode >= XSDIRX_MODE_3G_MASK && !valid) {
> +		dev_err(dev, "No valid ST352 payload present even for 3G mode and above\n");
> +		return -EINVAL;
> +	}
> +
> +	val = xsdirxss_read(core, XSDIRX_TS_DET_STAT_REG);
> +	if (valid & XSDIRX_ST352_VALID_DS1_MASK) {
> +		payload = xsdirxss_read(core, XSDIRX_ST352_DS1_REG);
> +		byte1 = rshift_and_mask(payload, XST352_PAYLOAD_BYTE1);
> +		active_luma = mask_and_rshift(payload,
> +					      XST352_BYTE3_ACT_LUMA_COUNT);
> +		pic_type = mask_and_rshift(payload, XST352_BYTE2_PIC_TYPE);
> +		framerate = rshift_and_mask(payload, XST352_BYTE2_FPS);
> +		tscan = mask_and_rshift(payload, XST352_BYTE2_TS_TYPE);
> +		sampling = mask_and_rshift(payload, XST352_BYTE3_COLOR_FORMAT);
> +		bpc = mask_and_rshift(payload, XST352_BYTE4_BIT_DEPTH);
> +	} else {
> +		dev_dbg(dev, "No ST352 payload available : Mode = %d\n", mode);
> +		framerate = mask_and_rshift(val, XSDIRX_TS_DET_STAT_RATE);
> +		tscan = mask_and_rshift(val, XSDIRX_TS_DET_STAT_SCAN);
> +	}
> +
> +	if ((bpc == XST352_BYTE4_BIT_DEPTH_10 && core->bpc != 10) ||
> +	    (bpc == XST352_BYTE4_BIT_DEPTH_12 && core->bpc != 12)) {
> +		dev_dbg(dev, "Bit depth not supported. bpc = %d core->bpc = %d\n",
> +			bpc, core->bpc);
> +		return -EINVAL;
> +	}
> +
> +	family = mask_and_rshift(val, XSDIRX_TS_DET_STAT_FAMILY);
> +	state->ts_is_interlaced = tscan ? false : true;
> +
> +	dev_dbg(dev, "ts_is_interlaced = %d, family = %d\n",
> +		state->ts_is_interlaced, family);
> +
> +	switch (mode) {
> +	case XSDIRX_MODE_HD_MASK:
> +		if (!valid) {
> +			/* No payload obtained */
> +			dev_dbg(dev, "frame rate : %d, tscan = %d\n",
> +				framerate, tscan);
> +			/*
> +			 * NOTE : A progressive segmented frame pSF will be
> +			 * reported incorrectly as Interlaced as we rely on IP's
> +			 * transport scan locked bit.
> +			 */
> +			dev_warn(dev, "pSF will be incorrectly reported as Interlaced\n");
> +
> +			switch (framerate) {
> +			case XSDIRX_TS_DET_STAT_RATE_23_98HZ:
> +			case XSDIRX_TS_DET_STAT_RATE_24HZ:
> +			case XSDIRX_TS_DET_STAT_RATE_25HZ:
> +			case XSDIRX_TS_DET_STAT_RATE_29_97HZ:
> +			case XSDIRX_TS_DET_STAT_RATE_30HZ:
> +				if (family == XSDIRX_SMPTE_ST_296) {
> +					format->width = 1280;
> +					format->height = 720;
> +					format->field = V4L2_FIELD_NONE;
> +				} else if (family == XSDIRX_SMPTE_ST_2048_2) {
> +					format->width = 2048;
> +					format->height = 1080;
> +					if (tscan)
> +						format->field = V4L2_FIELD_NONE;
> +					else
> +						format->field =
> +							V4L2_FIELD_ALTERNATE;
> +				} else {
> +					format->width = 1920;
> +					format->height = 1080;
> +					if (tscan)
> +						format->field = V4L2_FIELD_NONE;
> +					else
> +						format->field =
> +							V4L2_FIELD_ALTERNATE;
> +				}
> +				break;
> +			case XSDIRX_TS_DET_STAT_RATE_50HZ:
> +			case XSDIRX_TS_DET_STAT_RATE_59_94HZ:
> +			case XSDIRX_TS_DET_STAT_RATE_60HZ:
> +				if (family == XSDIRX_SMPTE_ST_274) {
> +					format->width = 1920;
> +					format->height = 1080;
> +				} else {
> +					format->width = 1280;
> +					format->height = 720;
> +				}
> +				format->field = V4L2_FIELD_NONE;
> +				break;
> +			default:
> +				format->width = 1920;
> +				format->height = 1080;
> +				format->field = V4L2_FIELD_NONE;
> +			}
> +		} else {
> +			dev_dbg(dev, "Got the payload\n");
> +			switch (byte1) {
> +			case XST352_BYTE1_ST292_1x720L_1_5G:
> +				/* SMPTE ST 292-1 for 720 line payloads */
> +				format->width = 1280;
> +				format->height = 720;
> +				break;
> +			case XST352_BYTE1_ST292_1x1080L_1_5G:
> +				/* SMPTE ST 292-1 for 1080 line payloads */
> +				format->height = 1080;
> +				if (active_luma)
> +					format->width = 2048;
> +				else
> +					format->width = 1920;
> +				break;
> +			default:
> +				dev_dbg(dev, "Unknown HD Mode SMPTE standard\n");
> +				return -EINVAL;
> +			}
> +		}
> +		break;
> +	case XSDIRX_MODE_SD_MASK:
> +		format->field = V4L2_FIELD_ALTERNATE;
> +
> +		switch (family) {
> +		case XSDIRX_NTSC:
> +			format->width = 720;
> +			format->height = 486;
> +			break;
> +		case XSDIRX_PAL:
> +			format->width = 720;
> +			format->height = 576;
> +			break;
> +		default:
> +			dev_dbg(dev, "Unknown SD Mode SMPTE standard\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	case XSDIRX_MODE_3G_MASK:
> +		switch (byte1) {
> +		case XST352_BYTE1_ST425_2008_750L_3GB:
> +			/* Sec 4.1.6.1 SMPTE 425-2008 */
> +		case XST352_BYTE1_ST372_2x720L_3GB:
> +			/* Table 13 SMPTE 425-2008 */
> +			format->width = 1280;
> +			format->height = 720;
> +			break;
> +		case XST352_BYTE1_ST425_2008_1125L_3GA:
> +			/* ST352 Table SMPTE 425-1 */
> +		case XST352_BYTE1_ST372_DL_3GB:
> +			/* Table 13 SMPTE 425-2008 */
> +		case XST352_BYTE1_ST372_2x1080L_3GB:
> +			/* Table 13 SMPTE 425-2008 */
> +			format->height = 1080;
> +			if (active_luma)
> +				format->width = 2048;
> +			else
> +				format->width = 1920;
> +			break;
> +		default:
> +			dev_dbg(dev, "Unknown 3G Mode SMPTE standard\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	case XSDIRX_MODE_6G_MASK:
> +		switch (byte1) {
> +		case XST352_BYTE1_ST2081_10_DL_2160L_6G:
> +			/* Dual link 6G */
> +		case XST352_BYTE1_ST2081_10_2160L_6G:
> +			/* Table 3 SMPTE ST 2081-10 */
> +			format->height = 2160;
> +			if (active_luma)
> +				format->width = 4096;
> +			else
> +				format->width = 3840;
> +			break;
> +		case XST352_BYTE1_ST2081_10_2_1080L_6G:
> +			format->height = 1080;
> +			if (active_luma)
> +				format->width = 2048;
> +			else
> +				format->width = 1920;
> +			break;
> +		default:
> +			dev_dbg(dev, "Unknown 6G Mode SMPTE standard\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	case XSDIRX_MODE_12GI_MASK:
> +	case XSDIRX_MODE_12GF_MASK:
> +		switch (byte1) {
> +		case XST352_BYTE1_ST2082_10_2160L_12G:
> +			/* Section 4.3.1 SMPTE ST 2082-10 */
> +			format->height = 2160;
> +			if (active_luma)
> +				format->width = 4096;
> +			else
> +				format->width = 3840;
> +			break;
> +		default:
> +			dev_dbg(dev, "Unknown 12G Mode SMPTE standard\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		dev_err(dev, "Invalid Mode\n");
> +		return -EINVAL;
> +	}
> +
> +	if (valid) {
> +		if (pic_type)
> +			format->field = V4L2_FIELD_NONE;
> +		else
> +			format->field = V4L2_FIELD_ALTERNATE;
> +
> +		if (format->height == 1080 && pic_type && !tscan)
> +			format->field = V4L2_FIELD_ALTERNATE;
> +
> +		/*
> +		 * In 3GB DL pSF mode the video is similar to interlaced.
> +		 * So though it is a progressive video, its transport is
> +		 * interlaced and is sent as two width x (height/2) buffers.
> +		 */
> +		if (byte1 == XST352_BYTE1_ST372_DL_3GB) {
> +			if (state->ts_is_interlaced)
> +				format->field = V4L2_FIELD_ALTERNATE;
> +			else
> +				format->field = V4L2_FIELD_NONE;
> +		}
> +	}
> +
> +	if (format->field == V4L2_FIELD_ALTERNATE)
> +		format->height = format->height / 2;
> +
> +	switch (sampling) {
> +	case XST352_BYTE3_COLOR_FORMAT_422:
> +		if (core->bpc == 10)
> +			format->code = MEDIA_BUS_FMT_UYVY10_1X20;
> +		else
> +			format->code = MEDIA_BUS_FMT_UYVY12_1X24;
> +		break;
> +	case XST352_BYTE3_COLOR_FORMAT_420:
> +	case XST352_BYTE3_COLOR_FORMAT_YUV444:
> +	case XST352_BYTE3_COLOR_FORMAT_GBR:
> +		format->code = 0;
> +		dev_dbg(dev, "No corresponding media bus formats\n");
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported color format : %d\n", sampling);
> +		return -EINVAL;
> +	}
> +
> +	xsdirxss_get_framerate(&state->frame_interval, framerate);
> +
> +	dev_dbg(dev, "Stream width = %d height = %d Field = %d payload = 0x%08x ts = 0x%08x\n",
> +		format->width, format->height, format->field, payload, val);
> +	dev_dbg(dev, "frame rate numerator = %d denominator = %d\n",
> +		state->frame_interval.numerator,
> +		state->frame_interval.denominator);
> +	dev_dbg(dev, "Stream code = 0x%x\n", format->code);
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_irq_handler - Interrupt handler for SDI Rx
> + * @irq: IRQ number
> + * @dev_id: Pointer to device state
> + *
> + * The SDI Rx interrupts are cleared by writing 1 to corresponding bit.
> + *
> + * Return: IRQ_HANDLED after handling interrupts
> + */
> +static irqreturn_t xsdirxss_irq_handler(int irq, void *dev_id)
> +{
> +	struct xsdirxss_state *state = (struct xsdirxss_state *)dev_id;
> +	struct xsdirxss_core *core = &state->core;
> +	struct device *dev = core->dev;
> +	u32 status;
> +
> +	status = xsdirxss_read(core, XSDIRX_ISR_REG);
> +	xsdirxss_write(core, XSDIRX_ISR_REG, status);
> +	dev_dbg(dev, "interrupt status = 0x%08x\n", status);
> +
> +	if (status & XSDIRX_INTR_VIDLOCK_MASK ||
> +	    status & XSDIRX_INTR_VIDUNLOCK_MASK) {
> +		u32 val1, val2;
> +
> +		dev_dbg(dev, "video lock/unlock interrupt\n");
> +
> +		xsdirx_streamflow_control(core, false);
> +		state->streaming = false;
> +
> +		val1 = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +		val2 = xsdirxss_read(core, XSDIRX_TS_DET_STAT_REG);
> +
> +		if ((val1 & XSDIRX_MODE_DET_STAT_MODE_LOCK_MASK) &&
> +		    (val2 & XSDIRX_TS_DET_STAT_LOCKED_MASK)) {
> +			u32 mask = XSDIRX_RST_CTRL_RST_CRC_ERRCNT_MASK |
> +				   XSDIRX_RST_CTRL_RST_EDH_ERRCNT_MASK;
> +
> +			dev_dbg(dev, "video lock interrupt\n");
> +
> +			xsdirxss_set(core, XSDIRX_RST_CTRL_REG, mask);
> +			xsdirxss_clr(core, XSDIRX_RST_CTRL_REG, mask);
> +
> +			val1 = xsdirxss_read(core, XSDIRX_ST352_VALID_REG);
> +			val2 = xsdirxss_read(core, XSDIRX_ST352_DS1_REG);
> +
> +			dev_dbg(dev, "valid st352 mask = 0x%08x\n", val1);
> +			dev_dbg(dev, "st352 payload = 0x%08x\n", val2);
> +
> +			if (!xsdirx_get_stream_properties(state)) {
> +				state->vidlocked = true;
> +				xsdirxss_set_gtclk(state);
> +			} else {
> +				dev_err(dev, "Unable to get stream properties!\n");
> +				state->vidlocked = false;
> +			}
> +		} else {
> +			dev_dbg(dev, "video unlock interrupt\n");
> +			state->vidlocked = false;
> +		}
> +
> +		memset(&state->event, 0, sizeof(state->event));
> +		state->event.type = V4L2_EVENT_SOURCE_CHANGE;
> +		state->event.u.src_change.changes =
> +			V4L2_EVENT_SRC_CH_RESOLUTION;
> +		v4l2_subdev_notify_event(&state->subdev, &state->event);
> +	}
> +
> +	if (status & XSDIRX_INTR_UNDERFLOW_MASK) {
> +		dev_dbg(dev, "Video in to AXI4 Stream core underflow interrupt\n");
> +
> +		memset(&state->event, 0, sizeof(state->event));
> +		state->event.type = V4L2_EVENT_XILINX_SDIRX_UNDERFLOW;
> +		v4l2_subdev_notify_event(&state->subdev, &state->event);
> +	}
> +
> +	if (status & XSDIRX_INTR_OVERFLOW_MASK) {
> +		dev_dbg(dev, "Video in to AXI4 Stream core overflow interrupt\n");
> +
> +		memset(&state->event, 0, sizeof(state->event));
> +		state->event.type = V4L2_EVENT_XILINX_SDIRX_OVERFLOW;
> +		v4l2_subdev_notify_event(&state->subdev, &state->event);
> +	}

Can't we combine these two in a single event type, with underflow and
overflow reported in the event payload in a bitmask ?

> +	return IRQ_HANDLED;
> +}
> +
> +/**
> + * xsdirxss_subscribe_event - Subscribe to video lock and unlock event
> + * @sd: V4L2 Sub device
> + * @fh: V4L2 File Handle
> + * @sub: Subcribe event structure
> + *
> + * Return: 0 on success, errors otherwise
> + */
> +static int xsdirxss_subscribe_event(struct v4l2_subdev *sd,
> +				    struct v4l2_fh *fh,
> +				    struct v4l2_event_subscription *sub)
> +{
> +	int ret;
> +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> +	struct xsdirxss_core *core = &xsdirxss->core;
> +
> +	switch (sub->type) {
> +	case V4L2_EVENT_XILINX_SDIRX_UNDERFLOW:
> +	case V4L2_EVENT_XILINX_SDIRX_OVERFLOW:
> +		ret = v4l2_event_subscribe(fh, sub, XSDIRX_MAX_EVENTS, NULL);
> +		break;
> +	case V4L2_EVENT_SOURCE_CHANGE:
> +		ret = v4l2_src_change_event_subscribe(fh, sub);
> +		break;
> +	default:
> +		return -EINVAL;

As Hans commented, you need to call v4l2_ctrl_subscribe_event() here.

> +	}
> +	dev_dbg(core->dev, "Event subscribed : 0x%08x\n", sub->type);
> +	return ret;
> +}
> +
> +/**
> + * xsdirxss_unsubscribe_event - Unsubscribe from all events registered
> + * @sd: V4L2 Sub device
> + * @fh: V4L2 file handle
> + * @sub: pointer to Event unsubscription structure
> + *
> + * Return: zero on success, else a negative error code.
> + */
> +static int xsdirxss_unsubscribe_event(struct v4l2_subdev *sd,
> +				      struct v4l2_fh *fh,
> +				      struct v4l2_event_subscription *sub)
> +{
> +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> +	struct xsdirxss_core *core = &xsdirxss->core;
> +
> +	dev_dbg(core->dev, "Event unsubscribe : 0x%08x\n", sub->type);
> +	return v4l2_event_unsubscribe(fh, sub);
> +}

I think you can drop this function and use v4l2_event_subdev_unsubscribe
as the ..unsubscribe_event() handler.

> +
> +/**
> + * xsdirxss_s_ctrl - This is used to set the Xilinx SDI Rx V4L2 controls
> + * @ctrl: V4L2 control to be set
> + *
> + * This function is used to set the V4L2 controls for the Xilinx SDI Rx
> + * Subsystem.
> + *
> + * Return: 0 on success, errors otherwise
> + */
> +static int xsdirxss_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	int ret = 0;
> +	struct xsdirxss_state *xsdirxss =
> +		container_of(ctrl->handler, struct xsdirxss_state,
> +			     ctrl_handler);
> +	struct xsdirxss_core *core = &xsdirxss->core;
> +	struct device *dev = core->dev;
> +
> +	dev_dbg(dev, "set ctrl id = 0x%08x val = 0x%08x\n",
> +		ctrl->id, ctrl->val);
> +
> +	if (xsdirxss->streaming) {
> +		dev_err(dev, "Cannot set controls while streaming\n");
> +		return -EINVAL;
> +	}
> +
> +	xsdirx_core_disable(core);
> +	switch (ctrl->id) {
> +	case V4L2_CID_XILINX_SDIRX_FRAMER:
> +		xsdirx_framer(core, ctrl->val);
> +		xsdirxss->framer_enable = ctrl->val;
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_VIDLOCK_WINDOW:
> +		xsdirx_setvidlockwindow(core, ctrl->val);
> +		xsdirxss->vidlockwin = ctrl->val;
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_EDH_ERRCNT_ENABLE:

As this is used to select which error sources to enable, how about
naming the control V4L2_CID_XILINX_SDIRX_EDH_ERROR_SOURCES or
V4L2_CID_XILINX_SDIRX_EDH_ERRORS_MASK ?

> +		xsdirx_setedherrcnttrigger(core, ctrl->val);
> +		xsdirxss->edhmask = ctrl->val;
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_SEARCH_MODES:
> +		if (ctrl->val) {
> +			if (core->mode == XSDIRXSS_SDI_STD_3G) {
> +				dev_dbg(dev, "Upto 3G supported\n");
> +				ctrl->val &= ~(BIT(XSDIRX_MODE_6G_OFFSET) |
> +					       BIT(XSDIRX_MODE_12GI_OFFSET) |
> +					       BIT(XSDIRX_MODE_12GF_OFFSET));
> +			}
> +
> +			if (core->mode == XSDIRXSS_SDI_STD_6G) {
> +				dev_dbg(dev, "Upto 6G supported\n");
> +				ctrl->val &= ~(BIT(XSDIRX_MODE_12GI_OFFSET) |
> +					       BIT(XSDIRX_MODE_12GF_OFFSET));
> +			}
> +
> +			ret = xsdirx_set_modedetect(core, ctrl->val);
> +			if (!ret)
> +				xsdirxss->searchmask = ctrl->val;
> +		} else {
> +			dev_err(dev, "Select at least one mode!\n");
> +			return -EINVAL;
> +		}
> +		break;

The traditional approach to select timing standards is to use ioctls.
Hans, do you think a custom control is fine here, or should the dv
timings ioctls be extended (or new sdi timings ioctls created) ?

If we go for a single control, I'm a bit concerned that this control
will restrict the search when multiple bits are set, but force a
specific mode when a single bit is set. I don't have enough experience
with SDI to tell whether this is the right behaviour.

> +	default:
> +		xsdirxss_set(core, XSDIRX_RST_CTRL_REG,
> +			     XSDIRX_RST_CTRL_SS_EN_MASK);
> +		return -EINVAL;

This looks weird.

		ret = -EINVAL;
		break;

would be better.

> +	}
> +	xsdirx_core_enable(core);

Do we really need to disable and reenable the core as we're guaranteed
not to be streaming ?

> +	return ret;
> +}
> +
> +/**
> + * xsdirxss_g_volatile_ctrl - get the Xilinx SDI Rx controls
> + * @ctrl: Pointer to V4L2 control
> + *
> + * Return: 0 on success, errors otherwise
> + */
> +static int xsdirxss_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	u32 val;
> +	struct xsdirxss_state *xsdirxss =
> +		container_of(ctrl->handler,
> +			     struct xsdirxss_state, ctrl_handler);
> +	struct xsdirxss_core *core = &xsdirxss->core;
> +	struct device *dev = core->dev;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_XILINX_SDIRX_MODE_DETECT:
> +		if (!xsdirxss->vidlocked) {
> +			dev_err(dev, "Can't get values when video not locked!\n");
> +			return -EINVAL;
> +		}
> +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +		val &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> +
> +		switch (val) {
> +		case XSDIRX_MODE_SD_MASK:
> +			ctrl->val = XSDIRX_MODE_SD_OFFSET;
> +			break;
> +		case XSDIRX_MODE_HD_MASK:
> +			ctrl->val = XSDIRX_MODE_HD_OFFSET;
> +			break;
> +		case XSDIRX_MODE_3G_MASK:
> +			ctrl->val = XSDIRX_MODE_3G_OFFSET;
> +			break;
> +		case XSDIRX_MODE_6G_MASK:
> +			ctrl->val = XSDIRX_MODE_6G_OFFSET;
> +			break;
> +		case XSDIRX_MODE_12GI_MASK:
> +			ctrl->val = XSDIRX_MODE_12GI_OFFSET;
> +			break;
> +		case XSDIRX_MODE_12GF_MASK:
> +			ctrl->val = XSDIRX_MODE_12GF_OFFSET;
> +			break;
> +		}
> +		break;

Hans commented that the dv timings structure will report whether the
mode is interlaced, I wonder if reporting the SDI mode shouldn't go
through that structure too.

> +	case V4L2_CID_XILINX_SDIRX_CRC:
> +		ctrl->val = xsdirxss_read(core, XSDIRX_CRC_ERRCNT_REG);
> +		xsdirxss_write(core, XSDIRX_CRC_ERRCNT_REG, 0xFFFF);
> +		break;

Are CRC errors common (and recoverable), or are they rare and fatal
errors ? In other words, does this report information that would be
classified as link quality, or fatal errors ? In the later case I wonder
if an event wouldn't make more sense. It could be reported as another
bit in the overflow/underflow event.

> +	case V4L2_CID_XILINX_SDIRX_EDH_ERRCNT:
> +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +		val &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> +		if (val == XSDIRX_MODE_SD_MASK) {
> +			ctrl->val = xsdirxss_read(core, XSDIRX_EDH_ERRCNT_REG);
> +		} else {
> +			dev_dbg(dev, "%d - not in SD mode\n", ctrl->id);
> +			return -EINVAL;
> +		}
> +		break;

If my understanding of the datasheet is correct, this will be reset for
every frame, right ? Reporting the information this way is thus quite
racy. Isn't it better to send it through an event ?

> +	case V4L2_CID_XILINX_SDIRX_EDH_STATUS:
> +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +		val &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> +		if (val == XSDIRX_MODE_SD_MASK) {
> +			ctrl->val = xsdirxss_read(core, XSDIRX_EDH_STAT_REG);
> +		} else {
> +			dev_dbg(dev, "%d - not in SD mode\n", ctrl->id);
> +			return -EINVAL;
> +		}
> +		break;

Same here, seems quite racy.

> +	case V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED:
> +		if (!xsdirxss->vidlocked) {
> +			dev_err(dev, "Can't get values when video not locked!\n");
> +			return -EINVAL;
> +		}
> +		ctrl->val = xsdirxss->ts_is_interlaced;
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_ACTIVE_STREAMS:
> +		if (!xsdirxss->vidlocked) {
> +			dev_err(dev, "Can't get values when video not locked!\n");
> +			return -EINVAL;
> +		}
> +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +		val &= XSDIRX_MODE_DET_STAT_ACT_STREAM_MASK;
> +		val >>= XSDIRX_MODE_DET_STAT_ACT_STREAM_OFFSET;
> +		ctrl->val = 1 << val;
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_IS_3GB:
> +		if (!xsdirxss->vidlocked) {
> +			dev_err(dev, "Can't get values when video not locked!\n");
> +			return -EINVAL;
> +		}
> +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +		val &= XSDIRX_MODE_DET_STAT_LVLB_3G_MASK;
> +		ctrl->val = val ? true : false;
> +		break;

Shouldn't this also go through DV timings ? If not, I think it should at
least be combined with V4L2_CID_XILINX_SDIRX_MODE_DETECT.

> +	default:
> +		dev_err(dev, "Get Invalid control id 0x%0x\n", ctrl->id);
> +		return -EINVAL;
> +	}
> +	dev_dbg(dev, "Get ctrl id = 0x%08x val = 0x%08x\n", ctrl->id,
> +		ctrl->val);

I would drop this line.

> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_log_status - Logs the status of the SDI Rx Subsystem
> + * @sd: Pointer to V4L2 subdevice structure
> + *
> + * This function prints the current status of Xilinx SDI Rx Subsystem
> + *
> + * Return: 0 on success
> + */
> +static int xsdirxss_log_status(struct v4l2_subdev *sd)
> +{
> +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> +	struct xsdirxss_core *core = &xsdirxss->core;
> +	u32 i;
> +
> +	v4l2_info(sd, "***** SDI Rx subsystem reg dump start *****\n");
> +	for (i = 0; i < 0x28; i++) {

There are registers in this range that are not documented in the
datasheet. Is it really safe to read them ? There are also registers
that are of no real interest I believe (ISR for instance), or registers
that seems to map to a FIFO (RX_ST352_DATA_DS*) which may cause issue
when read as the IRQ handler extracts data from them (I could be wrong
here though). Should this be restricted to a handful of carefully
selected registers ? You could then also print their name instead of
their address, that would be more readable.

> +		u32 data;
> +
> +		data = xsdirxss_read(core, i * 4);
> +		v4l2_info(sd, "offset 0x%08x data 0x%08x\n",
> +			  i * 4, data);
> +	}
> +	v4l2_info(sd, "***** SDI Rx subsystem reg dump end *****\n");
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_g_frame_interval - Get the frame interval
> + * @sd: V4L2 Sub device
> + * @fi: Pointer to V4l2 Sub device frame interval structure
> + *
> + * This function is used to get the frame interval.
> + * The frame rate can be integral or fractional.
> + * Integral frame rate e.g. numerator = 1000, denominator = 24000 => 24 fps
> + * Fractional frame rate e.g. numerator = 1001, denominator = 24000 => 23.97 fps
> + *
> + * Return: 0 on success
> + */
> +static int xsdirxss_g_frame_interval(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_frame_interval *fi)
> +{
> +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> +	struct xsdirxss_core *core = &xsdirxss->core;
> +
> +	if (!xsdirxss->vidlocked) {
> +		dev_err(core->dev, "Video not locked!\n");
> +		return -EINVAL;
> +	}
> +
> +	fi->interval = xsdirxss->frame_interval;

There's a data race with the interrupt handler here.

> +
> +	dev_dbg(core->dev, "frame rate numerator = %d denominator = %d\n",
> +		xsdirxss->frame_interval.numerator,
> +		xsdirxss->frame_interval.denominator);
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_s_stream - It is used to start/stop the streaming.
> + * @sd: V4L2 Sub device
> + * @enable: Flag (True / False)
> + *
> + * This function controls the start or stop of streaming for the
> + * Xilinx SDI Rx Subsystem.
> + *
> + * Return: 0 on success, errors otherwise
> + */
> +static int xsdirxss_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> +	struct xsdirxss_core *core = &xsdirxss->core;
> +	struct device *dev = core->dev;
> +

Maybe

	if (enable == xsdirxss->streaming) {
		dev_dbg(...);
		return enable ? -EINVAL : 0;
	}

? Up to you.

> +	if (enable) {
> +		if (!xsdirxss->vidlocked) {
> +			dev_dbg(dev, "Video is not locked\n");
> +			return -EINVAL;
> +		}
> +		if (xsdirxss->streaming) {
> +			dev_dbg(dev, "Already streaming\n");
> +			return -EINVAL;
> +		}
> +
> +		xsdirx_streamflow_control(core, true);
> +		xsdirxss->streaming = true;
> +		dev_dbg(dev, "Streaming started\n");
> +	} else {
> +		if (!xsdirxss->streaming) {
> +			dev_dbg(dev, "Stopped streaming already\n");
> +			return 0;
> +		}
> +
> +		xsdirx_streamflow_control(core, false);
> +		xsdirxss->streaming = false;
> +		dev_dbg(dev, "Streaming stopped\n");
> +	}
> +

And possibly

	xsdirxss->streaming = enable;
	dev_dbg(dev, "Streaming %s\", enable ? "started" : "stopped");

> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_g_input_status - It is used to determine if the video signal
> + * is present / locked onto or not.
> + *
> + * @sd: V4L2 Sub device
> + * @status: status of signal locked
> + *
> + * This is used to determine if the video signal is present and locked onto
> + * by the SDI Rx core or not based on vidlocked flag.
> + *
> + * Return: zero on success
> + */
> +static int xsdirxss_g_input_status(struct v4l2_subdev *sd, u32 *status)
> +{
> +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> +
> +	if (!xsdirxss->vidlocked)
> +		*status = V4L2_IN_ST_NO_SYNC | V4L2_IN_ST_NO_SIGNAL;
> +	else
> +		*status = 0;
> +
> +	return 0;
> +}
> +
> +static struct v4l2_mbus_framefmt *
> +__xsdirxss_get_pad_format(struct xsdirxss_state *xsdirxss,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  unsigned int pad, u32 which)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		return v4l2_subdev_get_try_format(&xsdirxss->subdev, cfg, pad);
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return &xsdirxss->format;
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +/**
> + * xsdirxss_init_cfg - Initialise the pad format config to default
> + * @sd: Pointer to V4L2 Sub device structure
> + * @cfg: Pointer to sub device pad information structure
> + *
> + * This function is used to initialize the pad format with the default
> + * values.
> + *
> + * Return: 0 on success
> + */
> +static int xsdirxss_init_cfg(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> +	struct v4l2_mbus_framefmt *format;
> +
> +	format = v4l2_subdev_get_try_format(sd, cfg, 0);
> +	*format = xsdirxss->default_format;
> +
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_get_format - Get the pad format
> + * @sd: Pointer to V4L2 Sub device structure
> + * @cfg: Pointer to sub device pad information structure
> + * @fmt: Pointer to pad level media bus format
> + *
> + * This function is used to get the pad format information.
> + *
> + * Return: 0 on success
> + */
> +static int xsdirxss_get_format(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_pad_config *cfg,
> +			       struct v4l2_subdev_format *fmt)
> +{
> +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> +	struct xsdirxss_core *core = &xsdirxss->core;
> +
> +	if (!xsdirxss->vidlocked) {
> +		dev_err(core->dev, "Video not locked!\n");
> +		return -EINVAL;
> +	}
> +
> +	fmt->format = *__xsdirxss_get_pad_format(xsdirxss, cfg,
> +						 fmt->pad, fmt->which);
> +
> +	dev_dbg(core->dev, "Stream width = %d height = %d Field = %d\n",
> +		fmt->format.width, fmt->format.height, fmt->format.field);
> +
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_set_format - This is used to set the pad format
> + * @sd: Pointer to V4L2 Sub device structure
> + * @cfg: Pointer to sub device pad information structure
> + * @fmt: Pointer to pad level media bus format
> + *
> + * This function is used to set the pad format.
> + * Since the pad format is fixed in hardware, it can't be
> + * modified on run time.
> + *
> + * Return: 0 on success
> + */
> +static int xsdirxss_set_format(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_pad_config *cfg,
> +			       struct v4l2_subdev_format *fmt)
> +{
> +	struct v4l2_mbus_framefmt *__format;
> +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> +
> +	dev_dbg(xsdirxss->core.dev,
> +		"set width %d height %d code %d field %d colorspace %d\n",
> +		fmt->format.width, fmt->format.height,
> +		fmt->format.code, fmt->format.field,
> +		fmt->format.colorspace);
> +
> +	__format = __xsdirxss_get_pad_format(xsdirxss, cfg,
> +					     fmt->pad, fmt->which);
> +
> +	/* Currently reset the code to one fixed in hardware */
> +	/* TODO : Add checks for width height */
> +	fmt->format.code = __format->code;

As Hans requested, width, height and field should be set here too, and
probably colorspace information too.

> +
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_enum_mbus_code - Handle pixel format enumeration
> + * @sd: pointer to v4l2 subdev structure
> + * @cfg: V4L2 subdev pad configuration
> + * @code: pointer to v4l2_subdev_mbus_code_enum structure
> + *
> + * Return: -EINVAL or zero on success
> + */
> +static int xsdirxss_enum_mbus_code(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> +	u32 index = code->index;
> +	u32 maxindex;
> +
> +	if (xsdirxss->core.bpc == 10)
> +		maxindex = ARRAY_SIZE(xsdirxss_10bpc_mbus_fmts);
> +	else
> +		maxindex = ARRAY_SIZE(xsdirxss_12bpc_mbus_fmts);
> +
> +	if (code->pad || index >= maxindex)
> +		return -EINVAL;
> +
> +	if (xsdirxss->core.bpc == 10)
> +		code->code = xsdirxss_10bpc_mbus_fmts[index];
> +	else
> +		code->code = xsdirxss_12bpc_mbus_fmts[index];
> +
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_enum_dv_timings: Enumerate all the supported DV timings
> + * @sd: pointer to v4l2 subdev structure
> + * @timings: DV timings structure to be returned.
> + *
> + * Return: -EINVAL incase of invalid index and pad or zero on success
> + */
> +static int xsdirxss_enum_dv_timings(struct v4l2_subdev *sd,
> +				    struct v4l2_enum_dv_timings *timings)
> +{
> +	if (timings->index >= ARRAY_SIZE(fmt_cap))
> +		return -EINVAL;
> +
> +	if (timings->pad != 0)
> +		return -EINVAL;
> +
> +	timings->timings = fmt_cap[timings->index];
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_query_dv_timings: Query for the current DV timings
> + * @sd: pointer to v4l2 subdev structure
> + * @timings: DV timings structure to be returned.
> + *
> + * Return: -ENOLCK when video is not locked, -ERANGE when corresponding timing
> + * entry is not found or zero on success.
> + */
> +static int xsdirxss_query_dv_timings(struct v4l2_subdev *sd,
> +				     struct v4l2_dv_timings *timings)
> +{
> +	struct xsdirxss_state *state = to_xsdirxssstate(sd);
> +	unsigned int i;
> +
> +	if (!state->vidlocked)
> +		return -ENOLCK;
> +
> +	for (i = 0; i < ARRAY_SIZE(xsdirxss_dv_timings); i++) {
> +		if (state->format.width == xsdirxss_dv_timings[i].width &&
> +		    state->format.height == xsdirxss_dv_timings[i].height &&
> +		    state->frame_interval.denominator ==
> +		    (xsdirxss_dv_timings[i].fps * 1000)) {
> +			*timings = xsdirxss_dv_timings[i].format;
> +			return 0;
> +		}
> +	}
> +
> +	return -ERANGE;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Media Operations
> + */
> +
> +static const struct media_entity_operations xsdirxss_media_ops = {
> +	.link_validate = v4l2_subdev_link_validate
> +};
> +
> +static const struct v4l2_ctrl_ops xsdirxss_ctrl_ops = {
> +	.g_volatile_ctrl = xsdirxss_g_volatile_ctrl,
> +	.s_ctrl	= xsdirxss_s_ctrl
> +};
> +
> +static const struct v4l2_ctrl_config xsdirxss_edh_ctrls[] = {
> +	{
> +		.ops	= &xsdirxss_ctrl_ops,
> +		.id	= V4L2_CID_XILINX_SDIRX_EDH_ERRCNT_ENABLE,
> +		.name	= "SDI Rx : EDH Error Count Enable",
> +		.type	= V4L2_CTRL_TYPE_BITMASK,
> +		.min	= 0,
> +		.max	= XSDIRX_EDH_ALLERR_MASK,
> +		.def	= 0,
> +	}, {
> +		.ops	= &xsdirxss_ctrl_ops,
> +		.id	= V4L2_CID_XILINX_SDIRX_EDH_ERRCNT,
> +		.name	= "SDI Rx : EDH Error Count",
> +		.type	= V4L2_CTRL_TYPE_INTEGER,
> +		.min	= 0,
> +		.max	= 0xFFFF,
> +		.step	= 1,
> +		.def	= 0,
> +		.flags  = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +	}, {
> +		.ops	= &xsdirxss_ctrl_ops,
> +		.id	= V4L2_CID_XILINX_SDIRX_EDH_STATUS,
> +		.name	= "SDI Rx : EDH Status",
> +		.type	= V4L2_CTRL_TYPE_INTEGER,
> +		.min	= 0,
> +		.max	= 0xFFFFFFFF,
> +		.step	= 1,
> +		.def	= 0,
> +		.flags  = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +	}
> +};
> +
> +static const struct v4l2_ctrl_config xsdirxss_ctrls[] = {
> +	{
> +		.ops	= &xsdirxss_ctrl_ops,
> +		.id	= V4L2_CID_XILINX_SDIRX_FRAMER,
> +		.name	= "SDI Rx : Enable Framer",
> +		.type	= V4L2_CTRL_TYPE_BOOLEAN,
> +		.min	= false,
> +		.max	= true,
> +		.step	= 1,
> +		.def	= true,
> +	}, {
> +		.ops	= &xsdirxss_ctrl_ops,
> +		.id	= V4L2_CID_XILINX_SDIRX_VIDLOCK_WINDOW,
> +		.name	= "SDI Rx : Video Lock Window",
> +		.type	= V4L2_CTRL_TYPE_INTEGER,
> +		.min	= 0,
> +		.max	= 0xFFFFFFFF,
> +		.step	= 1,
> +		.def	= XSDIRX_DEFAULT_VIDEO_LOCK_WINDOW,
> +	}, {
> +		.ops	= &xsdirxss_ctrl_ops,
> +		.id	= V4L2_CID_XILINX_SDIRX_SEARCH_MODES,
> +		.name	= "SDI Rx : Modes search Mask",
> +		.type	= V4L2_CTRL_TYPE_BITMASK,
> +		.min	= 0,
> +		.max	= XSDIRX_DETECT_ALL_MODES,
> +		.def	= XSDIRX_DETECT_ALL_MODES,
> +	}, {
> +		.ops	= &xsdirxss_ctrl_ops,
> +		.id	= V4L2_CID_XILINX_SDIRX_MODE_DETECT,
> +		.name	= "SDI Rx : Mode Detect Status",
> +		.type	= V4L2_CTRL_TYPE_INTEGER,
> +		.min	= XSDIRX_MODE_SD_OFFSET,
> +		.max	= XSDIRX_MODE_12GF_OFFSET,
> +		.step	= 1,
> +		.flags  = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +	}, {
> +		.ops	= &xsdirxss_ctrl_ops,
> +		.id	= V4L2_CID_XILINX_SDIRX_CRC,
> +		.name	= "SDI Rx : CRC Error status",
> +		.type	= V4L2_CTRL_TYPE_INTEGER,
> +		.min	= 0,
> +		.max	= 0xFFFFFFFF,
> +		.step	= 1,
> +		.def	= 0,
> +		.flags  = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +	}, {
> +		.ops	= &xsdirxss_ctrl_ops,
> +		.id	= V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED,
> +		.name	= "SDI Rx : TS is Interlaced",
> +		.type	= V4L2_CTRL_TYPE_BOOLEAN,
> +		.min	= false,
> +		.max	= true,
> +		.def	= false,
> +		.step	= 1,
> +		.flags  = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +	}, {
> +		.ops	= &xsdirxss_ctrl_ops,
> +		.id	= V4L2_CID_XILINX_SDIRX_ACTIVE_STREAMS,
> +		.name	= "SDI Rx : Active Streams",
> +		.type	= V4L2_CTRL_TYPE_INTEGER,
> +		.min	= 1,
> +		.max	= 16,
> +		.def	= 1,
> +		.step	= 1,
> +		.flags  = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +	}, {
> +		.ops	= &xsdirxss_ctrl_ops,
> +		.id	= V4L2_CID_XILINX_SDIRX_IS_3GB,
> +		.name	= "SDI Rx : Is 3GB",
> +		.type	= V4L2_CTRL_TYPE_BOOLEAN,
> +		.min	= false,
> +		.max	= true,
> +		.def	= false,
> +		.step	= 1,
> +		.flags  = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +	}
> +};
> +
> +static const struct v4l2_subdev_core_ops xsdirxss_core_ops = {
> +	.log_status = xsdirxss_log_status,
> +	.subscribe_event = xsdirxss_subscribe_event,
> +	.unsubscribe_event = xsdirxss_unsubscribe_event
> +};
> +
> +static const struct v4l2_subdev_video_ops xsdirxss_video_ops = {
> +	.g_frame_interval = xsdirxss_g_frame_interval,
> +	.s_stream = xsdirxss_s_stream,
> +	.g_input_status = xsdirxss_g_input_status,
> +	.query_dv_timings = xsdirxss_query_dv_timings,
> +};
> +
> +static const struct v4l2_subdev_pad_ops xsdirxss_pad_ops = {
> +	.init_cfg = xsdirxss_init_cfg,
> +	.get_fmt = xsdirxss_get_format,
> +	.set_fmt = xsdirxss_set_format,
> +	.enum_mbus_code = xsdirxss_enum_mbus_code,
> +	.enum_dv_timings = xsdirxss_enum_dv_timings,
> +};
> +
> +static const struct v4l2_subdev_ops xsdirxss_ops = {
> +	.core = &xsdirxss_core_ops,
> +	.video = &xsdirxss_video_ops,
> +	.pad = &xsdirxss_pad_ops
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Platform Device Driver
> + */
> +
> +static int xsdirxss_parse_of(struct xsdirxss_state *xsdirxss)
> +{
> +	struct device_node *node = xsdirxss->core.dev->of_node;
> +	struct xsdirxss_core *core = &xsdirxss->core;
> +	struct device *dev = core->dev;
> +	struct fwnode_handle *ep, *rep;
> +	int ret;
> +	const char *sdi_std;
> +
> +	core->include_edh = of_property_read_bool(node, "xlnx,include-edh");
> +	dev_dbg(dev, "EDH property = %s\n",
> +		core->include_edh ? "Present" : "Absent");
> +
> +	ret = of_property_read_string(node, "xlnx,line-rate", &sdi_std);
> +	if (ret < 0) {
> +		dev_err(dev, "xlnx,line-rate property not found\n");
> +		return ret;
> +	}
> +
> +	if (!strncmp(sdi_std, "12G_SDI_8DS", XSDIRX_MAX_STR_LENGTH)) {

Strings in DT are null-terminated, you can use strcmp() and drop
XSDIRX_MAX_STR_LENGTH.

> +		core->mode = XSDIRXSS_SDI_STD_12G_8DS;
> +	} else if (!strncmp(sdi_std, "6G_SDI", XSDIRX_MAX_STR_LENGTH)) {
> +		core->mode = XSDIRXSS_SDI_STD_6G;
> +	} else if (!strncmp(sdi_std, "3G_SDI", XSDIRX_MAX_STR_LENGTH)) {
> +		core->mode = XSDIRXSS_SDI_STD_3G;
> +	} else {
> +		dev_err(dev, "Invalid Line Rate\n");
> +		return -EINVAL;
> +	}
> +	dev_dbg(dev, "SDI Rx Line Rate = %s, mode = %d\n", sdi_std,
> +		core->mode);
> +
> +	ret = of_property_read_u32(node, "xlnx,bpp", &core->bpc);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to get xlnx,bpp\n");
> +		return ret;
> +	}
> +
> +	if (core->bpc != 10 && core->bpc != 12) {
> +		dev_err(dev, "bits per component=%u. Can be 10 or 12 only\n",
> +			core->bpc);
> +		return -EINVAL;
> +	}
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep) {
> +		dev_err(dev, "no source port found");
> +		ret = -EINVAL;
> +		goto dt_parse_done;
> +	}
> +
> +	rep = fwnode_graph_get_remote_endpoint(ep);
> +	if (!rep) {
> +		dev_err(dev, "no remote sink endpoint found");
> +		ret = -EINVAL;
> +	}

I don't think you need to check this, the subdev won't be linked
properly in the pipeline if there's no port anyway.

> +
> +	fwnode_handle_put(rep);
> +dt_parse_done:
> +	fwnode_handle_put(ep);
> +	return ret;
> +}
> +
> +static int xsdirxss_probe(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *subdev;
> +	struct xsdirxss_state *xsdirxss;
> +	struct xsdirxss_core *core;
> +	struct device *dev;
> +	int ret;
> +	unsigned int num_ctrls, num_edh_ctrls = 0, i;
> +
> +	xsdirxss = devm_kzalloc(&pdev->dev, sizeof(*xsdirxss), GFP_KERNEL);
> +	if (!xsdirxss)
> +		return -ENOMEM;
> +
> +	xsdirxss->core.dev = &pdev->dev;
> +	core = &xsdirxss->core;
> +	dev = core->dev;
> +
> +	/* Register interrupt handler */
> +	core->irq = platform_get_irq(pdev, 0);
> +	ret = devm_request_threaded_irq(dev, core->irq, NULL,
> +					xsdirxss_irq_handler, IRQF_ONESHOT,
> +					dev_name(dev), xsdirxss);

Why a threaded IRQ ?

> +	if (ret) {
> +		dev_err(dev, "Err = %d Interrupt handler reg failed!\n",
> +			ret);
> +		return ret;
> +	}

You should request the IRQ after resetting the core, otherwise
interrupts could be triggered immediately.

> +
> +	core->num_clks = ARRAY_SIZE(xsdirxss_clks);
> +	core->clks = devm_kcalloc(dev, core->num_clks,
> +				  sizeof(*core->clks), GFP_KERNEL);
> +	if (!core->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < core->num_clks; i++)
> +		core->clks[i].id = xsdirxss_clks[i];
> +
> +	ret = devm_clk_bulk_get(dev, core->num_clks, core->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_bulk_prepare_enable(core->num_clks, core->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret = xsdirxss_parse_of(xsdirxss);
> +	if (ret < 0)
> +		goto clk_err;
> +
> +	core->iomem = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(core->iomem)) {
> +		ret = PTR_ERR(core->iomem);
> +		goto clk_err;
> +	}

If you move these two calls above handling of the clocks, you will be
able to return immediately and avoid the goto.

> +
> +	/* Reset the core */
> +	xsdirx_streamflow_control(core, false);
> +	xsdirx_core_disable(core);
> +	xsdirx_clearintr(core, XSDIRX_INTR_ALL_MASK);
> +	xsdirx_disableintr(core, XSDIRX_INTR_ALL_MASK);
> +	xsdirx_enableintr(core, XSDIRX_INTR_ALL_MASK);
> +	xsdirx_globalintr(core, true);
> +	xsdirxss_write(core, XSDIRX_CRC_ERRCNT_REG, 0xFFFF);
> +
> +	/* Initialize V4L2 subdevice and media entity */
> +	xsdirxss->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	/* Initialize the default format */
> +	if (core->bpc == 10)
> +		xsdirxss->default_format.code = MEDIA_BUS_FMT_UYVY10_1X20;
> +	else
> +		xsdirxss->default_format.code = MEDIA_BUS_FMT_UYVY12_1X24;
> +	xsdirxss->default_format.field = V4L2_FIELD_NONE;
> +	xsdirxss->default_format.colorspace = V4L2_COLORSPACE_DEFAULT;
> +	xsdirxss->default_format.width = XSDIRX_DEFAULT_WIDTH;
> +	xsdirxss->default_format.height = XSDIRX_DEFAULT_HEIGHT;
> +
> +	xsdirxss->format = xsdirxss->default_format;
> +
> +	/* Initialize V4L2 subdevice and media entity */
> +	subdev = &xsdirxss->subdev;
> +	v4l2_subdev_init(subdev, &xsdirxss_ops);
> +
> +	subdev->dev = &pdev->dev;
> +	strscpy(subdev->name, dev_name(dev), sizeof(subdev->name));
> +
> +	subdev->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
> +
> +	subdev->entity.ops = &xsdirxss_media_ops;
> +
> +	v4l2_set_subdevdata(subdev, xsdirxss);
> +
> +	ret = media_entity_pads_init(&subdev->entity, 1, &xsdirxss->pad);
> +	if (ret < 0)
> +		goto error;
> +
> +	/* Initialise and register the controls */
> +	num_ctrls = ARRAY_SIZE(xsdirxss_ctrls);
> +
> +	if (core->include_edh)
> +		num_edh_ctrls = ARRAY_SIZE(xsdirxss_edh_ctrls);

How about

		num_ctrls += ARRAY_SIZE(xsdirxss_edh_ctrls);

> +
> +	v4l2_ctrl_handler_init(&xsdirxss->ctrl_handler,
> +			       (num_ctrls + num_edh_ctrls));

			       num_ctrls);

> +
> +	for (i = 0; i < num_ctrls; i++) {

	for (i = 0; i < ARRAY_SIZE(xsdirxss_ctrls); i++) {

> +		struct v4l2_ctrl *ctrl;
> +
> +		dev_dbg(dev, "%d %s ctrl = 0x%x\n", i, xsdirxss_ctrls[i].name,
> +			xsdirxss_ctrls[i].id);
> +
> +		ctrl = v4l2_ctrl_new_custom(&xsdirxss->ctrl_handler,
> +					    &xsdirxss_ctrls[i], NULL);
> +		if (!ctrl) {
> +			dev_dbg(dev, "Failed to add %s ctrl\n",
> +				xsdirxss_ctrls[i].name);
> +			goto error;
> +		}

As you check for xsdirxss->ctrl_handler.error below you can drop this
check and the equivalent one for the EDH controls.

> +	}
> +
> +	if (core->include_edh) {
> +		for (i = 0; i < num_edh_ctrls; i++) {

		for (i = 0; i < ARRAY_SIZE(xsdirxss_edh_ctrls); i++) {

> +			struct v4l2_ctrl *ctrl;
> +
> +			dev_dbg(dev, "%d %s ctrl = 0x%x\n", i,
> +				xsdirxss_edh_ctrls[i].name,
> +				xsdirxss_edh_ctrls[i].id);
> +
> +			ctrl = v4l2_ctrl_new_custom(&xsdirxss->ctrl_handler,
> +						    &xsdirxss_edh_ctrls[i],
> +						    NULL);
> +			if (!ctrl) {
> +				dev_dbg(dev, "Failed to add %s ctrl\n",
> +					xsdirxss_edh_ctrls[i].name);
> +				goto error;
> +			}
> +		}
> +	}
> +
> +	if (xsdirxss->ctrl_handler.error) {
> +		dev_err(dev, "failed to add controls\n");
> +		ret = xsdirxss->ctrl_handler.error;
> +		goto error;
> +	}
> +
> +	subdev->ctrl_handler = &xsdirxss->ctrl_handler;
> +
> +	ret = v4l2_ctrl_handler_setup(&xsdirxss->ctrl_handler);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set controls\n");
> +		goto error;
> +	}
> +
> +	platform_set_drvdata(pdev, xsdirxss);
> +
> +	ret = v4l2_async_register_subdev(subdev);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register subdev\n");
> +		goto error;
> +	}
> +
> +	xsdirxss->streaming = false;
> +
> +	xsdirx_core_enable(core);
> +
> +	dev_info(dev, "probe success\n");

You can drop this line, successful driver probing should be silent.

> +
> +	return 0;
> +error:
> +	v4l2_ctrl_handler_free(&xsdirxss->ctrl_handler);
> +	media_entity_cleanup(&subdev->entity);
> +	xsdirx_globalintr(core, false);
> +	xsdirx_disableintr(core, XSDIRX_INTR_ALL_MASK);
> +clk_err:
> +	clk_bulk_disable_unprepare(core->num_clks, core->clks);
> +	return ret;
> +}
> +
> +static int xsdirxss_remove(struct platform_device *pdev)
> +{
> +	struct xsdirxss_state *xsdirxss = platform_get_drvdata(pdev);
> +	struct xsdirxss_core *core = &xsdirxss->core;
> +	struct v4l2_subdev *subdev = &xsdirxss->subdev;
> +
> +	v4l2_async_unregister_subdev(subdev);
> +	v4l2_ctrl_handler_free(&xsdirxss->ctrl_handler);
> +	media_entity_cleanup(&subdev->entity);
> +
> +	xsdirx_globalintr(core, false);
> +	xsdirx_disableintr(core, XSDIRX_INTR_ALL_MASK);
> +	xsdirx_core_disable(core);
> +	xsdirx_streamflow_control(core, false);
> +
> +	clk_bulk_disable_unprepare(core->num_clks, core->clks);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id xsdirxss_of_id_table[] = {
> +	{ .compatible = "xlnx,v-smpte-uhdsdi-rx-ss-2.0" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, xsdirxss_of_id_table);
> +
> +static struct platform_driver xsdirxss_driver = {
> +	.driver = {
> +		.name		= "xilinx-sdirxss",
> +		.of_match_table	= xsdirxss_of_id_table,
> +	},
> +	.probe			= xsdirxss_probe,
> +	.remove			= xsdirxss_remove,
> +};
> +
> +module_platform_driver(xsdirxss_driver);
> +
> +MODULE_AUTHOR("Vishal Sagar <vsagar@xilinx.com>");
> +MODULE_DESCRIPTION("Xilinx SDI Rx Subsystem Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/uapi/linux/xilinx-sdirxss.h b/include/uapi/linux/xilinx-sdirxss.h
> new file mode 100644
> index 000000000000..6f2a093968d9
> --- /dev/null
> +++ b/include/uapi/linux/xilinx-sdirxss.h
> @@ -0,0 +1,179 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Xilinx SDI Rx Subsystem mode, event, custom timings
> + * and flag definitions.
> + *
> + * Copyright (C) 2019 - 2020 Xilinx, Inc.
> + *
> + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
> + */
> +
> +#ifndef __UAPI_XILINX_SDIRXSS_H__
> +#define __UAPI_XILINX_SDIRXSS_H__
> +
> +#include <linux/types.h>
> +#include <linux/v4l2-dv-timings.h>
> +#include <linux/videodev2.h>
> +
> +/*
> + * Events
> + *
> + * V4L2_EVENT_XILINX_SDIRX_UNDERFLOW: Video in to AXI4 Stream core underflowed
> + * V4L2_EVENT_XILINX_SDIRX_OVERFLOW: Video in to AXI4 Stream core overflowed
> + */
> +#define V4L2_EVENT_XILINX_SDIRX_CLASS      (V4L2_EVENT_PRIVATE_START | 0x200)
> +#define V4L2_EVENT_XILINX_SDIRX_UNDERFLOW  (V4L2_EVENT_XILINX_SDIRX_CLASS | 0x1)
> +#define V4L2_EVENT_XILINX_SDIRX_OVERFLOW   (V4L2_EVENT_XILINX_SDIRX_CLASS | 0x2)
> +
> +/*
> + * This enum is used to prepare the bitmask of modes to be detected
> + */
> +enum {
> +	XSDIRX_MODE_SD_OFFSET = 0,
> +	XSDIRX_MODE_HD_OFFSET,
> +	XSDIRX_MODE_3G_OFFSET,
> +	XSDIRX_MODE_6G_OFFSET,
> +	XSDIRX_MODE_12GI_OFFSET,
> +	XSDIRX_MODE_12GF_OFFSET,
> +	XSDIRX_MODE_NUM_SUPPORTED,
> +};
> +
> +#define XSDIRX_DETECT_ALL_MODES		(BIT(XSDIRX_MODE_SD_OFFSET) | \
> +					BIT(XSDIRX_MODE_HD_OFFSET) | \
> +					BIT(XSDIRX_MODE_3G_OFFSET) | \
> +					BIT(XSDIRX_MODE_6G_OFFSET) | \
> +					BIT(XSDIRX_MODE_12GI_OFFSET) | \
> +					BIT(XSDIRX_MODE_12GF_OFFSET))
> +
> +/*
> + * EDH Error Types
> + * ANC - Ancillary Data Packet Errors
> + * FF - Full Field Errors
> + * AP - Active Portion Errors
> + */
> +
> +#define XSDIRX_EDH_ERRCNT_ANC_EDH_ERR		BIT(0)
> +#define XSDIRX_EDH_ERRCNT_ANC_EDA_ERR		BIT(1)
> +#define XSDIRX_EDH_ERRCNT_ANC_IDH_ERR		BIT(2)
> +#define XSDIRX_EDH_ERRCNT_ANC_IDA_ERR		BIT(3)
> +#define XSDIRX_EDH_ERRCNT_ANC_UES_ERR		BIT(4)
> +#define XSDIRX_EDH_ERRCNT_FF_EDH_ERR		BIT(5)
> +#define XSDIRX_EDH_ERRCNT_FF_EDA_ERR		BIT(6)
> +#define XSDIRX_EDH_ERRCNT_FF_IDH_ERR		BIT(7)
> +#define XSDIRX_EDH_ERRCNT_FF_IDA_ERR		BIT(8)
> +#define XSDIRX_EDH_ERRCNT_FF_UES_ERR		BIT(9)
> +#define XSDIRX_EDH_ERRCNT_AP_EDH_ERR		BIT(10)
> +#define XSDIRX_EDH_ERRCNT_AP_EDA_ERR		BIT(11)
> +#define XSDIRX_EDH_ERRCNT_AP_IDH_ERR		BIT(12)
> +#define XSDIRX_EDH_ERRCNT_AP_IDA_ERR		BIT(13)
> +#define XSDIRX_EDH_ERRCNT_AP_UES_ERR		BIT(14)
> +#define XSDIRX_EDH_ERRCNT_PKT_CHKSUM_ERR	BIT(15)
> +
> +#define XSDIRX_EDH_ALLERR_MASK		0xFFFF
> +
> +/* Xilinx DV timings not in mainline yet */
> +#define XLNX_V4L2_DV_BT_2048X1080P24 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 510, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080P25 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 400, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080P30 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 66, 20, 66, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080I48 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 1, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 329, 44, 329, 2, 5, 15, 3, 5, 15, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080I50 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 1, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 274, 44, 274, 2, 5, 15, 3, 5, 15, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080I60 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 1, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 66, 20, 66, 2, 5, 15, 3, 5, 15, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_1920X1080P48 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 638, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080P48 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 510, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080P50 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 400, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080P60 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 88, 44, 20, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_3840X2160P48 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		594000000, 1276, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_4096X2160P48 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(4096, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		594000000, 1020, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_1920X1080I48 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 1, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 371, 88, 371, 2, 5, 15, 3, 5, 15, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#endif /* __UAPI_XILINX_SDIRXSS_H__ */
> diff --git a/include/uapi/linux/xilinx-v4l2-controls.h b/include/uapi/linux/xilinx-v4l2-controls.h
> index b6441fe705c5..e9de65e82642 100644
> --- a/include/uapi/linux/xilinx-v4l2-controls.h
> +++ b/include/uapi/linux/xilinx-v4l2-controls.h
> @@ -71,4 +71,71 @@
>  /* Noise level */
>  #define V4L2_CID_XILINX_TPG_NOISE_GAIN		(V4L2_CID_XILINX_TPG + 17)
>  
> +/*
> + * Xilinx SDI Rx Subsystem
> + */
> +
> +/* The base for the sdi rx driver controls.
> + * We reserve 32 controls for this driver.
> + *
> + * The V4L2_CID_XILINX_SDIRX_EDH_* controls are present only if
> + * EDH is enabled.
> + * The controls which can be set should only be set before enabling
> + * streaming. The controls which can be got should be called while
> + * streaming to get correct values.
> + * The V4L2_CID_XILINX_SDIRX_MODE_DETECT can be called when query dv timing
> + * returns a valid timing.
> + */
> +
> +#define V4L2_CID_XILINX_SDIRX			(V4L2_CID_XILINX_BASE + 0x20)
> +
> +/* Framer Control to enable or disable the framer */
> +#define V4L2_CID_XILINX_SDIRX_FRAMER		(V4L2_CID_XILINX_SDIRX + 1)

This control needs more documentation. What does it do, and how should
it be used ?

> +/*
> + * Video Lock Window Control to set the video lock window value
> + * This is the amount of time the mode and transport stream need
> + * to be locked before a video lock interrupt occurs.
> + */
> +#define V4L2_CID_XILINX_SDIRX_VIDLOCK_WINDOW	(V4L2_CID_XILINX_SDIRX + 2)
> +/* EDH Error Mask Control to enable EDH error count */
> +#define V4L2_CID_XILINX_SDIRX_EDH_ERRCNT_ENABLE	(V4L2_CID_XILINX_SDIRX + 3)
> +/*
> + * Mode search Control to pass the bit mask of modes to detect.
> + *
> + * bit 0 set to detect SD mode,
> + * bit 1 set to detect HD mode,
> + * bit 2 set to detect 3G (3GA & 3GB) mode,
> + * bit 3 set to detect 6G mode,
> + * bit 4 set to detect 12G integer frame rate mode,
> + * bit 5 set to detect 12G fractional frame rate mode,
> + */
> +#define V4L2_CID_XILINX_SDIRX_SEARCH_MODES	(V4L2_CID_XILINX_SDIRX + 4)
> +/*
> + * Get Detected Mode control
> + *
> + * Control Value - Mode detected
> + *        0      -     SD
> + *        1      -     HD
> + *        2      -     3G (3GA & 3GB)
> + *        3      -     6G
> + *        4      -     12G integer frame rate
> + *        5      -     12G fractional frame rate
> + */
> +#define V4L2_CID_XILINX_SDIRX_MODE_DETECT	(V4L2_CID_XILINX_SDIRX + 5)
> +/* Get number of CRC errors status control */
> +#define V4L2_CID_XILINX_SDIRX_CRC		(V4L2_CID_XILINX_SDIRX + 6)
> +/* Get EDH error count control */
> +#define V4L2_CID_XILINX_SDIRX_EDH_ERRCNT	(V4L2_CID_XILINX_SDIRX + 7)
> +/* Get EDH status control */
> +#define V4L2_CID_XILINX_SDIRX_EDH_STATUS	(V4L2_CID_XILINX_SDIRX + 8)
> +/* Get Transport Interlaced status whether it is interlaced or not */
> +#define V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED	(V4L2_CID_XILINX_SDIRX + 9)
> +/* Get number of Active Streams */
> +#define V4L2_CID_XILINX_SDIRX_ACTIVE_STREAMS	(V4L2_CID_XILINX_SDIRX + 10)
> +/*
> + * Get if the detected mode is 3GB.
> + * Can be used to distinguished between 3GA and 3GB
> + */
> +#define V4L2_CID_XILINX_SDIRX_IS_3GB		(V4L2_CID_XILINX_SDIRX + 11)
> +
>  #endif /* __UAPI_XILINX_V4L2_CONTROLS_H__ */

-- 
Regards,

Laurent Pinchart

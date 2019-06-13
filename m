Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F67744F02
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 00:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbfFMWO7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 18:14:59 -0400
Received: from mail-eopbgr730062.outbound.protection.outlook.com ([40.107.73.62]:37696
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725837AbfFMWO7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 18:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAXVrJv0RN0TNcpTJOJmFM/eb+bMPX/GFj1NS2JU3iA=;
 b=YIH5cDtzbPnhIxhC7zXYQKulfRE3nHa6/JAKWbIHNn3HPHvDNCPkjXJEGOZ5ASCq2uH8nQSudQdToj41sBrAmpq+3ajAv05UGCa0g4YpZpJ0IG72gYfCM0k5ld01vLx4ZMdqS/TFmUZjL6tRPBfENQs+9JsukCXzePJqt9JRulM=
Received: from DM6PR02CA0006.namprd02.prod.outlook.com (2603:10b6:5:1c::19) by
 CH2PR02MB6231.namprd02.prod.outlook.com (2603:10b6:610:d::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 13 Jun 2019 22:14:46 +0000
Received: from BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::205) by DM6PR02CA0006.outlook.office365.com
 (2603:10b6:5:1c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.14 via Frontend
 Transport; Thu, 13 Jun 2019 22:14:46 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 BL2NAM02FT018.mail.protection.outlook.com (10.152.77.170) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1987.11
 via Frontend Transport; Thu, 13 Jun 2019 22:14:45 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:34554 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1hbXzZ-0004JS-CJ; Thu, 13 Jun 2019 15:14:45 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1hbXzU-0000eC-9K; Thu, 13 Jun 2019 15:14:40 -0700
Received: from [172.19.2.244] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1hbXzJ-0000cG-3h; Thu, 13 Jun 2019 15:14:29 -0700
Date:   Thu, 13 Jun 2019 15:05:08 -0700
From:   Hyun Kwon <hyun.kwon@xilinx.com>
To:     Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     Hyun Kwon <hyunk@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>
Subject: Re: [PATCH 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem
 driver
Message-ID: <20190613220507.GA2473@smtp.xilinx.com>
References: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
 <1559656556-79174-3-git-send-email-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1559656556-79174-3-git-send-email-vishal.sagar@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(376002)(39860400002)(396003)(346002)(136003)(2980300002)(54094003)(52314003)(45074003)(199004)(189003)(51914003)(446003)(305945005)(9786002)(70586007)(1076003)(336012)(426003)(14444005)(11346002)(476003)(126002)(486006)(44832011)(36386004)(57986006)(8936002)(70206006)(53946003)(8676002)(81166006)(63266004)(229853002)(6636002)(478600001)(81156014)(106002)(2486003)(76506005)(76176011)(107886003)(50466002)(6862004)(356004)(2906002)(6246003)(47776003)(186003)(16586007)(58126008)(6666004)(26005)(54906003)(33656002)(23676004)(4326008)(52146003)(316002)(77096007)(5660300002)(30864003)(5001870100001)(579004)(559001)(569006);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR02MB6231;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9e71bae-2d44-48e2-e365-08d6f04c8b37
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:CH2PR02MB6231;
X-MS-TrafficTypeDiagnostic: CH2PR02MB6231:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CH2PR02MB62311BFD5E918211C28B3E90D6EF0@CH2PR02MB6231.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0067A8BA2A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /xkchhpnRqpOy1+kswCWU6cV/JczPtED4ELNgiLrtu3EH/6PfmF0qGMxHg3rn3tisaD6ZcMgEpErDBrSrT595aZhAsDd2c85OuS+G60qyfYCdII1nJ7zh4uyTcqFVTBWAHnHoEl0sVo56lRlO9HPfiwthedIV123j8BTNhwCmO9RFNaEO2ZzoSThwgQ5nWratQ24tmQ6gN02MsEH7lnSVZ21x1QriXxuGKFzjTCUdkx70R5DN0ItfxXsNoP91SAubm5V8QP9mOLmbTKMZzWEA7ZibEpuTZ894HN26/xZ4e3NFu49MoEaTn8kOKyK9eWAyllqqGwBX37UunGT9x1fdiW944PDxYyoh2Wiy5zCeYpAWy7k8aYRUpZNVCXXjOoEZBYa0n6d9XgVyc4EDg8tedJiLbEyJsd64zGIbp9KRms=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2019 22:14:45.9707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e71bae-2d44-48e2-e365-08d6f04c8b37
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6231
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

Thanks for the patch.

On Tue, 2019-06-04 at 06:55:56 -0700, Vishal Sagar wrote:
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
> The driver supports only 10 bpc YUV 422 media bus format. It also
> decodes the stream parameters based on the ST352 packet embedded in the
> stream. In case the ST352 packet isn't present in the stream, the core's
> detected properties are used to set stream properties.
> 
> The driver currently supports only the AXI4-Stream configuration.
> 
> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> ---
>  drivers/media/platform/xilinx/Kconfig          |   11 +
>  drivers/media/platform/xilinx/Makefile         |    1 +
>  drivers/media/platform/xilinx/xilinx-sdirxss.c | 1846 ++++++++++++++++++++++++
>  include/uapi/linux/xilinx-sdirxss.h            |   63 +
>  include/uapi/linux/xilinx-v4l2-controls.h      |   30 +
>  include/uapi/linux/xilinx-v4l2-events.h        |    9 +
>  6 files changed, 1960 insertions(+)
>  create mode 100644 drivers/media/platform/xilinx/xilinx-sdirxss.c
>  create mode 100644 include/uapi/linux/xilinx-sdirxss.h
> 
> diff --git a/drivers/media/platform/xilinx/Kconfig b/drivers/media/platform/xilinx/Kconfig
> index cd1a0fd..0c68caa 100644
> --- a/drivers/media/platform/xilinx/Kconfig
> +++ b/drivers/media/platform/xilinx/Kconfig
> @@ -20,6 +20,17 @@ config VIDEO_XILINX_CSI2RXSS
>  	  Bridge. The driver is used to set the number of active lanes and
>  	  get short packet data.
>  
> +config VIDEO_XILINX_SDIRXSS
> +	tristate "Xilinx UHD SDI Rx Subsystem"
> +	help
> +	  Driver for Xilinx UHD-SDI Rx Subsystem. This is a V4L sub-device
> +	  based driver that takes input from a SDI source like SDI camera and
> +	  converts it into an AXI4-Stream. The subsystem comprises of a SMPTE
> +	  UHD-SDI Rx core, a SDI Rx to Native Video bridge and a Video In to
> +	  AXI4-Stream bridge. The driver is used to set different stream
> +	  detection modes and identify stream properties to properly configure
> +	  downstream.
> +
>  config VIDEO_XILINX_TPG
>  	tristate "Xilinx Video Test Pattern Generator"
>  	depends on VIDEO_XILINX
> diff --git a/drivers/media/platform/xilinx/Makefile b/drivers/media/platform/xilinx/Makefile
> index 6119a34..223f2ea 100644
> --- a/drivers/media/platform/xilinx/Makefile
> +++ b/drivers/media/platform/xilinx/Makefile
> @@ -4,5 +4,6 @@ xilinx-video-objs += xilinx-dma.o xilinx-vip.o xilinx-vipp.o
>  
>  obj-$(CONFIG_VIDEO_XILINX) += xilinx-video.o
>  obj-$(CONFIG_VIDEO_XILINX_CSI2RXSS) += xilinx-csi2rxss.o
> +obj-$(CONFIG_VIDEO_XILINX_SDIRXSS) += xilinx-sdirxss.o
>  obj-$(CONFIG_VIDEO_XILINX_TPG) += xilinx-tpg.o
>  obj-$(CONFIG_VIDEO_XILINX_VTC) += xilinx-vtc.o
> diff --git a/drivers/media/platform/xilinx/xilinx-sdirxss.c b/drivers/media/platform/xilinx/xilinx-sdirxss.c
> new file mode 100644
> index 0000000..ba2d9d0
> --- /dev/null
> +++ b/drivers/media/platform/xilinx/xilinx-sdirxss.c
> @@ -0,0 +1,1846 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Xilinx SDI Rx Subsystem
> + *
> + * Copyright (C) 2017 - 2019 Xilinx, Inc.
> + *
> + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
> + *
> + */
> +
> +#include <dt-bindings/media/xilinx-vip.h>
> +#include <linux/bitops.h>
> +#include <linux/compiler.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/spinlock_types.h>
> +#include <linux/types.h>
> +#include <linux/v4l2-subdev.h>
> +#include <linux/xilinx-sdirxss.h>
> +#include <linux/xilinx-v4l2-events.h>
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

I'd rather put these under corresponding offsets. In that way, it'd be easier
to follow. Up to you.

> +
> +#define XSDIRX_MDL_CTRL_FRM_EN_MASK		BIT(4)
> +#define XSDIRX_MDL_CTRL_MODE_DET_EN_MASK	BIT(5)
> +#define XSDIRX_MDL_CTRL_MODE_HD_EN_MASK		BIT(8)
> +#define XSDIRX_MDL_CTRL_MODE_SD_EN_MASK		BIT(9)
> +#define XSDIRX_MDL_CTRL_MODE_3G_EN_MASK		BIT(10)
> +#define XSDIRX_MDL_CTRL_MODE_6G_EN_MASK		BIT(11)
> +#define XSDIRX_MDL_CTRL_MODE_12GI_EN_MASK	BIT(12)
> +#define XSDIRX_MDL_CTRL_MODE_12GF_EN_MASK	BIT(13)

These are not actually mask, so I'd remove _MASK. But it maybe just me.

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
> +#define XSDIRX_ACTIVE_STREAMS_1		0x0
> +#define XSDIRX_ACTIVE_STREAMS_2		0x1
> +#define XSDIRX_ACTIVE_STREAMS_4		0x2
> +#define XSDIRX_ACTIVE_STREAMS_8		0x3
> +#define XSDIRX_ACTIVE_STREAMS_16	0x4
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
> +/* Number of media pads */
> +#define XSDIRX_MEDIA_PADS	(1)
> +
> +#define XSDIRX_DEFAULT_WIDTH	(1920)
> +#define XSDIRX_DEFAULT_HEIGHT	(1080)
> +
> +#define XSDIRX_MAX_STR_LENGTH	16
> +
> +#define XSDIRXSS_SDI_STD_3G		0
> +#define XSDIRXSS_SDI_STD_6G		1
> +#define XSDIRXSS_SDI_STD_12G_8DS	2
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
> +/*
> + * Maximum number of events per file handle.
> + */

Nit, This doesn't have to be multieline comment.

> +#define XSDIRX_MAX_EVENTS	(128)
> +
> +/* ST352 related macros */
> +#define XST352_PAYLOAD_BYTE_MASK	0xFF
> +#define XST352_PAYLOAD_BYTE1_SHIFT	0
> +#define XST352_PAYLOAD_BYTE2_SHIFT	8
> +#define XST352_PAYLOAD_BYTE3_SHIFT	16
> +#define XST352_PAYLOAD_BYTE4_SHIFT	24
> +
> +#define XST352_BYTE1_ST292_1x720L_1_5G		0x84
> +#define XST352_BYTE1_ST292_1x1080L_1_5G		0x85
> +#define XST352_BYTE1_ST425_2008_750L_3GB	0x88
> +#define XST352_BYTE1_ST425_2008_1125L_3GA	0x89
> +#define XST352_BYTE1_ST372_DL_3GB		0x8A
> +#define XST352_BYTE1_ST372_2x720L_3GB		0x8B
> +#define XST352_BYTE1_ST372_2x1080L_3GB		0x8C
> +#define XST352_BYTE1_ST2081_10_2160L_6G		0xC0
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
> +#define XST352_BYTE2_FPS_SHIFT			8
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
> +#define XST352_BYTE3_COLOR_FORMAT_420		0x3
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
> +
> +/**
> + * struct xsdirxss_core - Core configuration SDI Rx Subsystem device structure
> + * @dev: Platform structure
> + * @iomem: Base address of subsystem
> + * @irq: requested irq number
> + * @include_edh: EDH processor presence
> + * @mode: 3G/6G/12G mode
> + * @axi_clk: Axi lite interface clock
> + * @sdirx_clk: SDI Rx GT clock
> + * @vidout_clk: Video clock
> + */
> +struct xsdirxss_core {
> +	struct device *dev;
> +	void __iomem *iomem;
> +	int irq;
> +	bool include_edh;

I wonder if this is required. I guess it's not critical anyway, so up to you.

> +	int mode;
> +	struct clk *axi_clk;
> +	struct clk *sdirx_clk;
> +	struct clk *vidout_clk;
> +};
> +
> +/**
> + * struct xsdirxss_state - SDI Rx Subsystem device structure
> + * @core: Core structure for MIPI SDI Rx Subsystem
> + * @subdev: The v4l2 subdev structure
> + * @ctrl_handler: control handler
> + * @event: Holds the video unlock event
> + * @formats: Active V4L2 formats on each pad
> + * @default_format: default V4L2 media bus format
> + * @frame_interval: Captures the frame rate
> + * @vip_format: format information corresponding to the active format
> + * @pads: media pads
> + * @streaming: Flag for storing streaming state
> + * @vidlocked: Flag indicating SDI Rx has locked onto video stream
> + * @ts_is_interlaced: Flag indicating Transport Stream is interlaced.
> + *
> + * This structure contains the device driver related parameters
> + */
> +struct xsdirxss_state {
> +	struct xsdirxss_core core;
> +	struct v4l2_subdev subdev;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_event event;
> +	struct v4l2_mbus_framefmt formats[XSDIRX_MEDIA_PADS];

It's always single port, so this doesn't have to be an array.

> +	struct v4l2_mbus_framefmt default_format;
> +	struct v4l2_fract frame_interval;
> +	const struct xvip_video_format *vip_format;
> +	struct media_pad pads[XSDIRX_MEDIA_PADS];

Ditto.

> +	bool streaming;
> +	bool vidlocked;
> +	bool ts_is_interlaced;
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
> +static void xsdirx_core_disable(struct xsdirxss_core *core)
> +{
> +	xsdirxss_clr(core, XSDIRX_RST_CTRL_REG, XSDIRX_RST_CTRL_SS_EN_MASK);
> +}
> +
> +static void xsdirx_core_enable(struct xsdirxss_core *core)
> +{
> +	xsdirxss_set(core, XSDIRX_RST_CTRL_REG, XSDIRX_RST_CTRL_SS_EN_MASK);
> +}
> +
> +static int xsdirx_set_modedetect(struct xsdirxss_core *core, u16 mask)
> +{
> +	u32 i, val;
> +
> +	mask &= XSDIRX_DETECT_ALL_MODES;
> +	if (!mask) {
> +		dev_err(core->dev, "Invalid bit mask = 0x%08x\n", mask);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(core->dev, "mask = 0x%x\n", mask);
> +
> +	val = xsdirxss_read(core, XSDIRX_MDL_CTRL_REG);
> +	val &= ~(XSDIRX_MDL_CTRL_MODE_DET_EN_MASK);
> +	val &= ~(XSDIRX_MDL_CTRL_MODE_AUTO_DET_MASK);
> +	val &= ~(XSDIRX_MDL_CTRL_FORCED_MODE_MASK);

() is not needed here. I'd avoid unneeded ().

> +
> +	if (hweight16(mask) > 1) {
> +		/* Multi mode detection as more than 1 bit set in mask */
> +		dev_dbg(core->dev, "Detect multiple modes\n");
> +		for (i = 0; i < XSDIRX_MODE_NUM_SUPPORTED; i++) {
> +			switch (mask & (1 << i)) {
> +			case BIT(XSDIRX_MODE_SD_OFFSET):
> +				val |= XSDIRX_MDL_CTRL_MODE_SD_EN_MASK;
> +				break;
> +			case BIT(XSDIRX_MODE_HD_OFFSET):
> +				val |= XSDIRX_MDL_CTRL_MODE_HD_EN_MASK;
> +				break;
> +			case BIT(XSDIRX_MODE_3G_OFFSET):
> +				val |= XSDIRX_MDL_CTRL_MODE_3G_EN_MASK;
> +				break;
> +			case BIT(XSDIRX_MODE_6G_OFFSET):
> +				val |= XSDIRX_MDL_CTRL_MODE_6G_EN_MASK;
> +				break;
> +			case BIT(XSDIRX_MODE_12GI_OFFSET):
> +				val |= XSDIRX_MDL_CTRL_MODE_12GI_EN_MASK;
> +				break;
> +			case BIT(XSDIRX_MODE_12GF_OFFSET):
> +				val |= XSDIRX_MDL_CTRL_MODE_12GF_EN_MASK;
> +				break;
> +			}
> +		}
> +		val |= XSDIRX_MDL_CTRL_MODE_DET_EN_MASK;
> +	} else {
> +		/* Fixed Mode */
> +		u32 forced_mode_mask = 0;

Setting this under default below would make it clearer. But up to you.

> +
> +		dev_dbg(core->dev, "Detect fixed mode\n");
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
> +		}
> +		dev_dbg(core->dev, "Forced Mode Mask : 0x%x\n",
> +			forced_mode_mask);
> +		val |= forced_mode_mask << XSDIRX_MDL_CTRL_FORCED_MODE_OFFSET;
> +	}
> +
> +	dev_dbg(core->dev, "Modes to be detected : sdi ctrl reg = 0x%08x\n",
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
> +{
> +	u32 val = xsdirxss_read(core, XSDIRX_EDH_ERRCNT_EN_REG);
> +
> +	val = enable & XSDIRX_EDH_ALLERR_MASK;
> +
> +	xsdirxss_write(core, XSDIRX_EDH_ERRCNT_EN_REG, val);
> +}
> +
> +static void xsdirx_setvidlockwindow(struct xsdirxss_core *core, u32 val)
> +{
> +	/*
> +	 * The video lock window is the amount of time for which the
> +	 * the mode and transport stream should be locked to get the
> +	 * video lock interrupt.
> +	 */
> +	xsdirxss_write(core, XSDIRX_VID_LOCK_WINDOW_REG, val);
> +}
> +
> +static void xsdirx_disableintr(struct xsdirxss_core *core, u32 mask)
> +{
> +	xsdirxss_clr(core, XSDIRX_IER_REG, mask);
> +}
> +
> +static void xsdirx_enableintr(struct xsdirxss_core *core, u32 mask)
> +{
> +	xsdirxss_set(core, XSDIRX_IER_REG, mask);
> +}
> +
> +static void xsdirx_globalintr(struct xsdirxss_core *core, bool flag)
> +{
> +	if (flag)

The flag can be determined at build time, so this 'if' isn't needed. Then
the disabling call can be added to xsdirxss_remove().

> +		xsdirxss_set(core, XSDIRX_GLBL_IER_REG,
> +			     XSDIRX_GLBL_INTR_EN_MASK);
> +	else
> +		xsdirxss_clr(core, XSDIRX_GLBL_IER_REG,
> +			     XSDIRX_GLBL_INTR_EN_MASK);
> +}
> +
> +static void xsdirx_clearintr(struct xsdirxss_core *core, u32 mask)
> +{
> +	xsdirxss_set(core, XSDIRX_ISR_REG, mask);
> +}
> +
> +static void xsdirx_vid_bridge_control(struct xsdirxss_core *core, bool enable)
> +{
> +	if (enable)
> +		xsdirxss_set(core, XSDIRX_RST_CTRL_REG,
> +			     XSDIRX_RST_CTRL_SDIRX_BRIDGE_ENB_MASK);
> +	else
> +		xsdirxss_clr(core, XSDIRX_RST_CTRL_REG,
> +			     XSDIRX_RST_CTRL_SDIRX_BRIDGE_ENB_MASK);

Even these can be inlined. I don't see need for having dynamic check.

> +}
> +
> +static void xsdirx_axis4_bridge_control(struct xsdirxss_core *core, bool enable)
> +{
> +	if (enable)
> +		xsdirxss_set(core, XSDIRX_RST_CTRL_REG,
> +			     XSDIRX_RST_CTRL_VIDIN_AXI4S_MOD_ENB_MASK);
> +	else
> +		xsdirxss_clr(core, XSDIRX_RST_CTRL_REG,
> +			     XSDIRX_RST_CTRL_VIDIN_AXI4S_MOD_ENB_MASK);

Ditto.

> +}
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
> +static void xsdirx_streamdowncb(struct xsdirxss_core *core)
> +{
> +	xsdirx_streamflow_control(core, false);
> +}

These thin wrapers don't seem useful. Wouldn't it be better to inline most of
these?

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
> +	u32 mode, payload = 0, val, family, valid, tscan;
> +	u8 byte1 = 0, active_luma = 0, pic_type = 0, framerate = 0;
> +	u8 sampling = XST352_BYTE3_COLOR_FORMAT_422;
> +	struct v4l2_mbus_framefmt *format = &state->formats[0];
> +
> +	mode = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +	mode &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> +
> +	valid = xsdirxss_read(core, XSDIRX_ST352_VALID_REG);
> +
> +	if (mode >= XSDIRX_MODE_3G_MASK && !valid) {
> +		dev_err(core->dev, "No valid ST352 payload present even for 3G mode and above\n");
> +		return -EINVAL;
> +	}
> +
> +	val = xsdirxss_read(core, XSDIRX_TS_DET_STAT_REG);
> +	if (valid & XSDIRX_ST352_VALID_DS1_MASK) {
> +		payload = xsdirxss_read(core, XSDIRX_ST352_DS1_REG);
> +		byte1 = (payload >> XST352_PAYLOAD_BYTE1_SHIFT) &
> +				XST352_PAYLOAD_BYTE_MASK;
> +		active_luma = (payload & XST352_BYTE3_ACT_LUMA_COUNT_MASK) >>
> +				XST352_BYTE3_ACT_LUMA_COUNT_OFFSET;
> +		pic_type = (payload & XST352_BYTE2_PIC_TYPE_MASK) >>
> +				XST352_BYTE2_PIC_TYPE_OFFSET;
> +		framerate = (payload >> XST352_BYTE2_FPS_SHIFT) &
> +				XST352_BYTE2_FPS_MASK;
> +		tscan = (payload & XST352_BYTE2_TS_TYPE_MASK) >>
> +				XST352_BYTE2_TS_TYPE_OFFSET;

Please align consistently throughout the patch. I believe the checkpatch
--strict warns on these.

> +		sampling = (payload & XST352_BYTE3_COLOR_FORMAT_MASK) >>
> +			   XST352_BYTE3_COLOR_FORMAT_OFFSET;
> +	} else {
> +		dev_dbg(core->dev, "No ST352 payload available : Mode = %d\n",
> +			mode);
> +		framerate = (val & XSDIRX_TS_DET_STAT_RATE_MASK) >>
> +				XSDIRX_TS_DET_STAT_RATE_OFFSET;
> +		tscan = (val & XSDIRX_TS_DET_STAT_SCAN_MASK) >>
> +				XSDIRX_TS_DET_STAT_SCAN_OFFSET;
> +	}
> +
> +	family = (val & XSDIRX_TS_DET_STAT_FAMILY_MASK) >>
> +		  XSDIRX_TS_DET_STAT_FAMILY_OFFSET;

Just nit. Alignment.

> +	state->ts_is_interlaced = tscan ? false : true;
> +
> +	dev_dbg(core->dev, "ts_is_interlaced = %d, family = %d\n",
> +		state->ts_is_interlaced, family);
> +
> +	switch (mode) {
> +	case XSDIRX_MODE_HD_MASK:
> +		if (!valid) {
> +			/* No payload obtained */
> +			dev_dbg(core->dev, "frame rate : %d, tscan = %d\n",
> +				framerate, tscan);
> +			/*
> +			 * NOTE : A progressive segmented frame pSF will be
> +			 * reported incorrectly as Interlaced as we rely on IP's
> +			 * transport scan locked bit.
> +			 */
> +			dev_warn(core->dev, "pSF will be incorrectly reported as Interlaced\n");
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
> +			dev_dbg(core->dev, "Got the payload\n");
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
> +				dev_dbg(core->dev, "Unknown HD Mode SMPTE standard\n");
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
> +			dev_dbg(core->dev, "Unknown SD Mode SMPTE standard\n");
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
> +			dev_dbg(core->dev, "Unknown 3G Mode SMPTE standard\n");
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
> +		default:
> +			dev_dbg(core->dev, "Unknown 6G Mode SMPTE standard\n");
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
> +			dev_dbg(core->dev, "Unknown 12G Mode SMPTE standard\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		dev_err(core->dev, "Invalid Mode\n");
> +		return -EINVAL;
> +	}

Could you please take another look if this can be organized simpler? This is
a little too many switch - case and if statements.

> +
> +	if (valid) {
> +		if (pic_type)
> +			format->field = V4L2_FIELD_NONE;
> +		else
> +			format->field = V4L2_FIELD_ALTERNATE;
> +	}
> +
> +	if (format->field == V4L2_FIELD_ALTERNATE)
> +		format->height = format->height / 2;
> +
> +	switch (sampling) {
> +	case XST352_BYTE3_COLOR_FORMAT_422:
> +		format->code = MEDIA_BUS_FMT_UYVY10_1X20;
> +		break;
> +	default:
> +		dev_err(core->dev, "Unsupported color format : %d\n", sampling);
> +		return -EINVAL;
> +	}
> +
> +	xsdirxss_get_framerate(&state->frame_interval, framerate);
> +
> +	dev_dbg(core->dev, "Stream width = %d height = %d Field = %d payload = 0x%08x ts = 0x%08x\n",
> +		format->width, format->height, format->field, payload, val);
> +	dev_dbg(core->dev, "frame rate numerator = %d denominator = %d\n",
> +		state->frame_interval.numerator,
> +		state->frame_interval.denominator);
> +	dev_dbg(core->dev, "Stream code = 0x%x\n", format->code);
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_irq_handler - Interrupt handler for SDI Rx
> + * @irq: IRQ number
> + * @dev_id: Pointer to device state
> + *
> + * The SDI Rx interrupts are cleared by first setting and then clearing the bits
> + * in the interrupt clear register. The interrupt status register is read only.

Thanks for the doc. I was about to ask. So I guess it's read - to -clear.

> + *
> + * Return: IRQ_HANDLED after handling interrupts
> + */
> +static irqreturn_t xsdirxss_irq_handler(int irq, void *dev_id)
> +{
> +	struct xsdirxss_state *state = (struct xsdirxss_state *)dev_id;
> +	struct xsdirxss_core *core = &state->core;
> +	u32 status;
> +
> +	status = xsdirxss_read(core, XSDIRX_ISR_REG);
> +	dev_dbg(core->dev, "interrupt status = 0x%08x\n", status);
> +
> +	if (!status)
> +		return IRQ_NONE;
> +
> +	if (status & XSDIRX_INTR_VIDLOCK_MASK) {
> +		u32 val1, val2;
> +
> +		dev_dbg(core->dev, "video lock interrupt\n");
> +		xsdirx_clearintr(core, XSDIRX_INTR_VIDLOCK_MASK);
> +
> +		val1 = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +		val2 = xsdirxss_read(core, XSDIRX_TS_DET_STAT_REG);
> +
> +		if ((val1 & XSDIRX_MODE_DET_STAT_MODE_LOCK_MASK) &&
> +		    (val2 & XSDIRX_TS_DET_STAT_LOCKED_MASK)) {
> +			u32 mask = XSDIRX_RST_CTRL_RST_CRC_ERRCNT_MASK |
> +				   XSDIRX_RST_CTRL_RST_EDH_ERRCNT_MASK;
> +
> +			dev_dbg(core->dev, "mode & ts lock occurred\n");
> +
> +			xsdirxss_set(core, XSDIRX_RST_CTRL_REG, mask);
> +			xsdirxss_clr(core, XSDIRX_RST_CTRL_REG, mask);
> +
> +			val1 = xsdirxss_read(core, XSDIRX_ST352_VALID_REG);
> +			val2 = xsdirxss_read(core, XSDIRX_ST352_DS1_REG);
> +
> +			dev_dbg(core->dev, "valid st352 mask = 0x%08x\n", val1);
> +			dev_dbg(core->dev, "st352 payload = 0x%08x\n", val2);
> +
> +			if (!xsdirx_get_stream_properties(state)) {
> +				memset(&state->event, 0, sizeof(state->event));
> +				state->event.type = V4L2_EVENT_SOURCE_CHANGE;
> +				state->event.u.src_change.changes =
> +					V4L2_EVENT_SRC_CH_RESOLUTION;
> +				v4l2_subdev_notify_event(&state->subdev,
> +							 &state->event);
> +
> +				state->vidlocked = true;
> +			} else {
> +				dev_err(core->dev, "Unable to get stream properties!\n");
> +				state->vidlocked = false;
> +			}
> +		} else {
> +			dev_dbg(core->dev, "video unlock before video lock!\n");
> +			state->vidlocked = false;
> +		}
> +	}
> +
> +	if (status & XSDIRX_INTR_VIDUNLOCK_MASK) {
> +		dev_dbg(core->dev, "video unlock interrupt\n");
> +		xsdirx_clearintr(core, XSDIRX_INTR_VIDUNLOCK_MASK);
> +		xsdirx_streamdowncb(core);
> +
> +		memset(&state->event, 0, sizeof(state->event));
> +		state->event.type = V4L2_EVENT_XLNXSDIRX_VIDUNLOCK;
> +		v4l2_subdev_notify_event(&state->subdev, &state->event);
> +
> +		state->vidlocked = false;
> +	}
> +
> +	if (status & XSDIRX_INTR_UNDERFLOW_MASK) {
> +		dev_dbg(core->dev, "Video in to AXI4 Stream core underflow interrupt\n");
> +		xsdirx_clearintr(core, XSDIRX_INTR_UNDERFLOW_MASK);
> +
> +		memset(&state->event, 0, sizeof(state->event));
> +		state->event.type = V4L2_EVENT_XLNXSDIRX_UNDERFLOW;
> +		v4l2_subdev_notify_event(&state->subdev, &state->event);
> +	}
> +
> +	if (status & XSDIRX_INTR_OVERFLOW_MASK) {
> +		dev_dbg(core->dev, "Video in to AXI4 Stream core overflow interrupt\n");
> +		xsdirx_clearintr(core, XSDIRX_INTR_OVERFLOW_MASK);
> +
> +		memset(&state->event, 0, sizeof(state->event));
> +		state->event.type = V4L2_EVENT_XLNXSDIRX_OVERFLOW;
> +		v4l2_subdev_notify_event(&state->subdev, &state->event);
> +	}
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
> +	case V4L2_EVENT_XLNXSDIRX_VIDUNLOCK:
> +	case V4L2_EVENT_XLNXSDIRX_UNDERFLOW:
> +	case V4L2_EVENT_XLNXSDIRX_OVERFLOW:
> +		ret = v4l2_event_subscribe(fh, sub, XSDIRX_MAX_EVENTS, NULL);
> +		break;
> +	case V4L2_EVENT_SOURCE_CHANGE:
> +		ret = v4l2_src_change_event_subscribe(fh, sub);
> +		break;
> +	default:
> +		return -EINVAL;
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
> +		container_of(ctrl->handler,

This doesn't have to be a new line.

> +			     struct xsdirxss_state, ctrl_handler);
> +	struct xsdirxss_core *core = &xsdirxss->core;
> +
> +	dev_dbg(core->dev, "set ctrl id = 0x%08x val = 0x%08x\n",
> +		ctrl->id, ctrl->val);
> +
> +	if (xsdirxss->streaming) {
> +		dev_err(core->dev, "Cannot set controls while streaming\n");
> +		return -EINVAL;
> +	}
> +
> +	xsdirx_core_disable(core);

Not sure why this is needed here. Can this be part of s_stream?

> +	switch (ctrl->id) {
> +	case V4L2_CID_XILINX_SDIRX_FRAMER:
> +		xsdirx_framer(core, ctrl->val);
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_VIDLOCK_WINDOW:
> +		xsdirx_setvidlockwindow(core, ctrl->val);
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_EDH_ERRCNT_ENABLE:
> +		xsdirx_setedherrcnttrigger(core, ctrl->val);
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_SEARCH_MODES:
> +		if (ctrl->val) {
> +			if (core->mode == XSDIRXSS_SDI_STD_3G) {
> +				dev_dbg(core->dev, "Upto 3G supported\n");
> +				ctrl->val &= ~(BIT(XSDIRX_MODE_6G_OFFSET) |
> +					       BIT(XSDIRX_MODE_12GI_OFFSET) |
> +					       BIT(XSDIRX_MODE_12GF_OFFSET));
> +			}
> +
> +			if (core->mode == XSDIRXSS_SDI_STD_6G) {
> +				dev_dbg(core->dev, "Upto 6G supported\n");
> +				ctrl->val &= ~(BIT(XSDIRX_MODE_12GI_OFFSET) |
> +					       BIT(XSDIRX_MODE_12GF_OFFSET));
> +			}
> +
> +			ret = xsdirx_set_modedetect(core, ctrl->val);
> +		} else {
> +			dev_err(core->dev, "Select at least one mode!\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		xsdirxss_set(core, XSDIRX_RST_CTRL_REG,
> +			     XSDIRX_RST_CTRL_SS_EN_MASK);
> +		return -EINVAL;
> +	}
> +	xsdirx_core_enable(core);

Ditto.

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
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_XILINX_SDIRX_MODE_DETECT:
> +		if (!xsdirxss->vidlocked) {
> +			dev_err(core->dev, "Can't get values when video not locked!\n");
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
> +	case V4L2_CID_XILINX_SDIRX_CRC:
> +		ctrl->val = xsdirxss_read(core, XSDIRX_CRC_ERRCNT_REG);
> +		xsdirxss_write(core, XSDIRX_CRC_ERRCNT_REG, 0xFFFF);
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_EDH_ERRCNT:
> +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +		val &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> +		if (val == XSDIRX_MODE_SD_MASK) {
> +			ctrl->val = xsdirxss_read(core, XSDIRX_EDH_ERRCNT_REG);
> +		} else {
> +			dev_dbg(core->dev, "%d - not in SD mode\n", ctrl->id);
> +			return -EINVAL;
> +		}
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_EDH_STATUS:
> +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +		val &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> +		if (val == XSDIRX_MODE_SD_MASK) {
> +			ctrl->val = xsdirxss_read(core, XSDIRX_EDH_STAT_REG);
> +		} else {
> +			dev_dbg(core->dev, "%d - not in SD mode\n", ctrl->id);
> +			return -EINVAL;
> +		}
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED:
> +		if (!xsdirxss->vidlocked) {
> +			dev_err(core->dev, "Can't get values when video not locked!\n");
> +			return -EINVAL;
> +		}
> +		ctrl->val = xsdirxss->ts_is_interlaced;
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_ACTIVE_STREAMS:
> +		if (!xsdirxss->vidlocked) {
> +			dev_err(core->dev, "Can't get values when video not locked!\n");
> +			return -EINVAL;
> +		}
> +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +		val &= XSDIRX_MODE_DET_STAT_ACT_STREAM_MASK;
> +		val >>= XSDIRX_MODE_DET_STAT_ACT_STREAM_OFFSET;
> +		ctrl->val = 1 << val;
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_IS_3GB:
> +		if (!xsdirxss->vidlocked) {
> +			dev_err(core->dev, "Can't get values when video not locked!\n");
> +			return -EINVAL;
> +		}
> +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> +		val &= XSDIRX_MODE_DET_STAT_LVLB_3G_MASK;
> +		ctrl->val = val ? true : false;
> +		break;
> +	default:
> +		dev_err(core->dev, "Get Invalid control id 0x%0x\n", ctrl->id);
> +		return -EINVAL;
> +	}
> +	dev_dbg(core->dev, "Get ctrl id = 0x%08x val = 0x%08x\n",
> +		ctrl->id, ctrl->val);
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
> +	u32 data, i;

'data' can be declared inside the for loop below.

> +
> +	v4l2_info(sd, "***** SDI Rx subsystem reg dump start *****\n");
> +	for (i = 0; i < 0x28; i++) {
> +		data = xsdirxss_read(core, i * 4);
> +		v4l2_info(sd, "offset 0x%08x data 0x%08x\n",
> +			  i * 4, data);
> +	}
> +	v4l2_info(sd, "***** SDI Rx subsystem reg dump end *****\n");
> +	return 0;
> +}
> +
> +static void xsdirxss_start_stream(struct xsdirxss_state *xsdirxss)
> +{
> +	xsdirx_streamflow_control(&xsdirxss->core, true);
> +}
> +
> +static void xsdirxss_stop_stream(struct xsdirxss_state *xsdirxss)
> +{
> +	xsdirx_streamflow_control(&xsdirxss->core, false);
> +}

Ditto. Not sure if these single liner wrappers are useful.

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
> +
> +	if (enable) {
> +		if (!xsdirxss->vidlocked) {
> +			dev_dbg(core->dev, "Video is not locked\n");
> +			return -EINVAL;
> +		}
> +		if (xsdirxss->streaming) {
> +			dev_dbg(core->dev, "Already streaming\n");
> +			return -EINVAL;
> +		}
> +
> +		xsdirxss_start_stream(xsdirxss);
> +		xsdirxss->streaming = true;
> +		dev_dbg(core->dev, "Streaming started\n");
> +	} else {
> +		if (!xsdirxss->streaming) {
> +			dev_dbg(core->dev, "Stopped streaming already\n");
> +			return -EINVAL;
> +		}
> +
> +		xsdirxss_stop_stream(xsdirxss);
> +		xsdirxss->streaming = false;
> +		dev_dbg(core->dev, "Streaming stopped\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static struct v4l2_mbus_framefmt *
> +__xsdirxss_get_pad_format(struct xsdirxss_state *xsdirxss,
> +			  struct v4l2_subdev_pad_config *cfg,
> +				unsigned int pad, u32 which)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		return v4l2_subdev_get_try_format(&xsdirxss->subdev, cfg, pad);
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return &xsdirxss->formats[pad];
> +	default:
> +		return NULL;
> +	}
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
> +					struct v4l2_subdev_format *fmt)

Please check the alignment.

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
> +				struct v4l2_subdev_format *fmt)

Please check the alignment.

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
> +
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_open - Called on v4l2_open()
> + * @sd: Pointer to V4L2 sub device structure
> + * @fh: Pointer to V4L2 File handle
> + *
> + * This function is called on v4l2_open(). It sets the default format for pad.
> + *
> + * Return: 0 on success
> + */
> +static int xsdirxss_open(struct v4l2_subdev *sd,
> +			 struct v4l2_subdev_fh *fh)
> +{
> +	struct v4l2_mbus_framefmt *format;
> +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
> +
> +	format = v4l2_subdev_get_try_format(sd, fh->pad, 0);
> +	*format = xsdirxss->default_format;
> +
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_close - Called on v4l2_close()
> + * @sd: Pointer to V4L2 sub device structure
> + * @fh: Pointer to V4L2 File handle
> + *
> + * This function is called on v4l2_close().
> + *
> + * Return: 0 on success
> + */
> +static int xsdirxss_close(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_fh *fh)
> +{
> +	return 0;
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
> +static struct v4l2_ctrl_config xsdirxss_edh_ctrls[] = {
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
> +static struct v4l2_ctrl_config xsdirxss_ctrls[] = {
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
> +static struct v4l2_subdev_video_ops xsdirxss_video_ops = {
> +	.g_frame_interval = xsdirxss_g_frame_interval,
> +	.s_stream = xsdirxss_s_stream
> +};
> +
> +static struct v4l2_subdev_pad_ops xsdirxss_pad_ops = {
> +	.get_fmt = xsdirxss_get_format,
> +	.set_fmt = xsdirxss_set_format,
> +};
> +
> +static struct v4l2_subdev_ops xsdirxss_ops = {
> +	.core = &xsdirxss_core_ops,
> +	.video = &xsdirxss_video_ops,
> +	.pad = &xsdirxss_pad_ops
> +};
> +
> +static const struct v4l2_subdev_internal_ops xsdirxss_internal_ops = {
> +	.open = xsdirxss_open,
> +	.close = xsdirxss_close
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Platform Device Driver
> + */
> +
> +static int xsdirxss_parse_of(struct xsdirxss_state *xsdirxss)
> +{
> +	struct device_node *node = xsdirxss->core.dev->of_node;
> +	struct device_node *ports = NULL;
> +	struct device_node *port = NULL;
> +	unsigned int nports = 0;
> +	struct xsdirxss_core *core = &xsdirxss->core;
> +	int ret;
> +	const char *sdi_std;
> +
> +	core->include_edh = of_property_read_bool(node, "xlnx,include-edh");
> +	dev_dbg(core->dev, "EDH property = %s\n",
> +		core->include_edh ? "Present" : "Absent");
> +
> +	ret = of_property_read_string(node, "xlnx,line-rate",
> +				      &sdi_std);

Single line is enough.

> +	if (ret < 0) {
> +		dev_err(core->dev, "xlnx,line-rate property not found\n");
> +		return ret;
> +	}
> +
> +	if (!strncmp(sdi_std, "12G_SDI_8DS", XSDIRX_MAX_STR_LENGTH)) {
> +		core->mode = XSDIRXSS_SDI_STD_12G_8DS;
> +	} else if (!strncmp(sdi_std, "6G_SDI", XSDIRX_MAX_STR_LENGTH)) {
> +		core->mode = XSDIRXSS_SDI_STD_6G;
> +	} else if (!strncmp(sdi_std, "3G_SDI", XSDIRX_MAX_STR_LENGTH)) {
> +		core->mode = XSDIRXSS_SDI_STD_3G;
> +	} else {
> +		dev_err(core->dev, "Invalid Line Rate\n");
> +		return -EINVAL;
> +	}
> +	dev_dbg(core->dev, "SDI Rx Line Rate = %s, mode = %d\n", sdi_std,
> +		core->mode);
> +
> +	ports = of_get_child_by_name(node, "ports");
> +	if (!ports)
> +		ports = node;
> +
> +	for_each_child_of_node(ports, port) {
> +		const struct xvip_video_format *format;
> +		struct device_node *endpoint;
> +
> +		if (!port->name || of_node_cmp(port->name, "port"))
> +			continue;
> +
> +		format = xvip_of_get_format(port);
> +		if (IS_ERR(format)) {
> +			dev_err(core->dev, "invalid format in DT");
> +			return PTR_ERR(format);
> +		}
> +
> +		dev_dbg(core->dev, "vf_code = %d bpc = %d bpp = %d\n",
> +			format->vf_code, format->width, format->bpp);

The commit mentions this driver supports only 10bpc. Wouldn't it be better to
check it here?

> +
> +		if (format->vf_code != XVIP_VF_YUV_422 &&
> +		    format->vf_code != XVIP_VF_YUV_420) {
> +			dev_err(core->dev, "Incorrect UG934 video format set.\n");

You can make this single line as below,

	dev_err(core->dev,
		"Incorrect UG934 video format set.\n");

> +			return -EINVAL;
> +		}
> +		xsdirxss->vip_format = format;
> +
> +		endpoint = of_get_next_child(port, NULL);
> +		if (!endpoint) {
> +			dev_err(core->dev, "No port at\n");
> +			return -EINVAL;
> +		}
> +
> +		/* Count the number of ports. */
> +		nports++;
> +	}
> +
> +	if (nports != 1) {
> +		dev_err(core->dev, "invalid number of ports %u\n", nports);
> +		return -EINVAL;
> +	}
> +
> +	/* Register interrupt handler */
> +	core->irq = irq_of_parse_and_map(node, 0);
> +
> +	ret = devm_request_irq(core->dev, core->irq, xsdirxss_irq_handler,
> +			       IRQF_SHARED, "xilinx-sdirxss", xsdirxss);
> +	if (ret) {
> +		dev_err(core->dev, "Err = %d Interrupt handler reg failed!\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xsdirxss_probe(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *subdev;
> +	struct xsdirxss_state *xsdirxss;
> +	struct xsdirxss_core *core;
> +	struct resource *res;
> +	int ret;
> +	unsigned int num_ctrls, num_edh_ctrls = 0, i;
> +
> +	xsdirxss = devm_kzalloc(&pdev->dev, sizeof(*xsdirxss), GFP_KERNEL);
> +	if (!xsdirxss)
> +		return -ENOMEM;
> +
> +	xsdirxss->core.dev = &pdev->dev;
> +	core = &xsdirxss->core;
> +
> +	core->axi_clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
> +	if (IS_ERR(core->axi_clk)) {
> +		ret = PTR_ERR(core->axi_clk);
> +		dev_err(&pdev->dev, "failed to get s_axi_clk (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	core->sdirx_clk = devm_clk_get(&pdev->dev, "sdi_rx_clk");
> +	if (IS_ERR(core->sdirx_clk)) {
> +		ret = PTR_ERR(core->sdirx_clk);
> +		dev_err(&pdev->dev, "failed to get sdi_rx_clk (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	core->vidout_clk = devm_clk_get(&pdev->dev, "video_out_clk");
> +	if (IS_ERR(core->vidout_clk)) {
> +		ret = PTR_ERR(core->vidout_clk);
> +		dev_err(&pdev->dev, "failed to get video_out_aclk (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(core->axi_clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to enable axi_clk (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(core->sdirx_clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to enable sdirx_clk (%d)\n", ret);
> +		goto rx_clk_err;
> +	}
> +
> +	ret = clk_prepare_enable(core->vidout_clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to enable vidout_clk (%d)\n", ret);
> +		goto vidout_clk_err;
> +	}
> +
> +	ret = xsdirxss_parse_of(xsdirxss);
> +	if (ret < 0)
> +		goto clk_err;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	xsdirxss->core.iomem = devm_ioremap_resource(xsdirxss->core.dev, res);
> +	if (IS_ERR(xsdirxss->core.iomem)) {
> +		ret = PTR_ERR(xsdirxss->core.iomem);
> +		goto clk_err;
> +	}
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
> +	xsdirxss->pads[0].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	/* Initialize the default format */
> +	xsdirxss->default_format.code = xsdirxss->vip_format->code;
> +	xsdirxss->default_format.field = V4L2_FIELD_NONE;
> +	xsdirxss->default_format.colorspace = V4L2_COLORSPACE_DEFAULT;
> +	xsdirxss->default_format.width = XSDIRX_DEFAULT_WIDTH;
> +	xsdirxss->default_format.height = XSDIRX_DEFAULT_HEIGHT;
> +
> +	xsdirxss->formats[0] = xsdirxss->default_format;
> +
> +	/* Initialize V4L2 subdevice and media entity */
> +	subdev = &xsdirxss->subdev;
> +	v4l2_subdev_init(subdev, &xsdirxss_ops);
> +
> +	subdev->dev = &pdev->dev;
> +	subdev->internal_ops = &xsdirxss_internal_ops;
> +	strlcpy(subdev->name, dev_name(&pdev->dev), sizeof(subdev->name));
> +
> +	subdev->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
> +
> +	subdev->entity.ops = &xsdirxss_media_ops;
> +
> +	v4l2_set_subdevdata(subdev, xsdirxss);
> +
> +	ret = media_entity_pads_init(&subdev->entity, 1, xsdirxss->pads);
> +	if (ret < 0)
> +		goto error;
> +
> +	/* Initialise and register the controls */
> +	num_ctrls = ARRAY_SIZE(xsdirxss_ctrls);
> +
> +	if (xsdirxss->core.include_edh)
> +		num_edh_ctrls = ARRAY_SIZE(xsdirxss_edh_ctrls);
> +
> +	v4l2_ctrl_handler_init(&xsdirxss->ctrl_handler,
> +			       (num_ctrls + num_edh_ctrls));
> +
> +	for (i = 0; i < num_ctrls; i++) {
> +		struct v4l2_ctrl *ctrl;
> +
> +		dev_dbg(xsdirxss->core.dev, "%d %s ctrl = 0x%x\n",
> +			i, xsdirxss_ctrls[i].name, xsdirxss_ctrls[i].id);
> +
> +		ctrl = v4l2_ctrl_new_custom(&xsdirxss->ctrl_handler,
> +					    &xsdirxss_ctrls[i], NULL);
> +		if (!ctrl) {
> +			dev_dbg(xsdirxss->core.dev, "Failed to add %s ctrl\n",
> +				xsdirxss_ctrls[i].name);
> +			goto error;
> +		}
> +	}
> +
> +	if (xsdirxss->core.include_edh) {
> +		for (i = 0; i < num_edh_ctrls; i++) {
> +			struct v4l2_ctrl *ctrl;
> +
> +			dev_dbg(xsdirxss->core.dev, "%d %s ctrl = 0x%x\n",
> +				i, xsdirxss_edh_ctrls[i].name,
> +				xsdirxss_edh_ctrls[i].id);
> +
> +			ctrl = v4l2_ctrl_new_custom(&xsdirxss->ctrl_handler,
> +						    &xsdirxss_edh_ctrls[i],
> +						    NULL);
> +			if (!ctrl) {
> +				dev_dbg(xsdirxss->core.dev, "Failed to add %s ctrl\n",
> +					xsdirxss_edh_ctrls[i].name);
> +				goto error;
> +			}
> +		}
> +	} else {
> +		dev_dbg(xsdirxss->core.dev, "Not registering the EDH controls as EDH is disabled in IP\n");

Is this worth being here? There's already an equivalent print for dt is parsed.

> +	}
> +
> +	if (xsdirxss->ctrl_handler.error) {
> +		dev_err(&pdev->dev, "failed to add controls\n");
> +		ret = xsdirxss->ctrl_handler.error;
> +		goto error;
> +	}
> +
> +	subdev->ctrl_handler = &xsdirxss->ctrl_handler;
> +
> +	ret = v4l2_ctrl_handler_setup(&xsdirxss->ctrl_handler);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to set controls\n");
> +		goto error;
> +	}
> +
> +	platform_set_drvdata(pdev, xsdirxss);
> +
> +	ret = v4l2_async_register_subdev(subdev);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to register subdev\n");
> +		goto error;
> +	}
> +
> +	xsdirxss->streaming = false;
> +
> +	dev_info(xsdirxss->core.dev, "Xilinx SDI Rx Subsystem device found!\n");
> +
> +	xsdirx_core_enable(core);
> +
> +	return 0;
> +error:
> +	v4l2_ctrl_handler_free(&xsdirxss->ctrl_handler);
> +	media_entity_cleanup(&subdev->entity);
> +
> +clk_err:
> +	clk_disable_unprepare(core->vidout_clk);
> +vidout_clk_err:
> +	clk_disable_unprepare(core->sdirx_clk);
> +rx_clk_err:
> +	clk_disable_unprepare(core->axi_clk);
> +	return ret;
> +}
> +
> +static int xsdirxss_remove(struct platform_device *pdev)
> +{
> +	struct xsdirxss_state *xsdirxss = platform_get_drvdata(pdev);
> +	struct v4l2_subdev *subdev = &xsdirxss->subdev;
> +
> +	v4l2_async_unregister_subdev(subdev);
> +	v4l2_ctrl_handler_free(&xsdirxss->ctrl_handler);
> +	media_entity_cleanup(&subdev->entity);
> +	clk_disable_unprepare(xsdirxss->core.vidout_clk);
> +	clk_disable_unprepare(xsdirxss->core.sdirx_clk);
> +	clk_disable_unprepare(xsdirxss->core.axi_clk);
> +	return 0;
> +}
> +
> +static const struct of_device_id xsdirxss_of_id_table[] = {
> +	{ .compatible = "xlnx,v-smpte-uhdsdi-rx-ss" },
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
> index 0000000..983a43b
> --- /dev/null
> +++ b/include/uapi/linux/xilinx-sdirxss.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Xilinx SDI Rx Subsystem mode and flag definitions.
> + *
> + * Copyright (C) 2019 Xilinx, Inc.
> + *
> + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
> + *
> + */
> +
> +#ifndef __UAPI_XILINX_SDIRXSS_H__
> +#define __UAPI_XILINX_SDIRXSS_H__
> +
> +#include <linux/types.h>
> +#include <linux/videodev2.h>
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
> +#endif /* __UAPI_XILINX_SDIRXSS_H__ */
> diff --git a/include/uapi/linux/xilinx-v4l2-controls.h b/include/uapi/linux/xilinx-v4l2-controls.h
> index f023623..4c68a10 100644
> --- a/include/uapi/linux/xilinx-v4l2-controls.h
> +++ b/include/uapi/linux/xilinx-v4l2-controls.h
> @@ -83,4 +83,34 @@
>  /* Reset all event counters */
>  #define V4L2_CID_XILINX_MIPICSISS_RESET_COUNTERS (V4L2_CID_XILINX_MIPICSISS + 2)
>  
> +/*
> + * Xilinx SDI Rx Subsystem
> + */
> +
> +/* Base ID */
> +#define V4L2_CID_XILINX_SDIRX			(V4L2_CID_USER_BASE + 0xc100)
> +
> +/* Framer Control */
> +#define V4L2_CID_XILINX_SDIRX_FRAMER		(V4L2_CID_XILINX_SDIRX + 1)
> +/* Video Lock Window Control */
> +#define V4L2_CID_XILINX_SDIRX_VIDLOCK_WINDOW	(V4L2_CID_XILINX_SDIRX + 2)
> +/* EDH Error Mask Control */
> +#define V4L2_CID_XILINX_SDIRX_EDH_ERRCNT_ENABLE	(V4L2_CID_XILINX_SDIRX + 3)
> +/* Mode search Control */
> +#define V4L2_CID_XILINX_SDIRX_SEARCH_MODES	(V4L2_CID_XILINX_SDIRX + 4)
> +/* Get Detected Mode control */
> +#define V4L2_CID_XILINX_SDIRX_MODE_DETECT	(V4L2_CID_XILINX_SDIRX + 5)
> +/* Get CRC error status */
> +#define V4L2_CID_XILINX_SDIRX_CRC		(V4L2_CID_XILINX_SDIRX + 6)
> +/* Get EDH error count control */
> +#define V4L2_CID_XILINX_SDIRX_EDH_ERRCNT	(V4L2_CID_XILINX_SDIRX + 7)
> +/* Get EDH status control */
> +#define V4L2_CID_XILINX_SDIRX_EDH_STATUS	(V4L2_CID_XILINX_SDIRX + 8)
> +/* Get Transport Interlaced status */
> +#define V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED	(V4L2_CID_XILINX_SDIRX + 9)
> +/* Get Active Streams count */
> +#define V4L2_CID_XILINX_SDIRX_ACTIVE_STREAMS	(V4L2_CID_XILINX_SDIRX + 10)
> +/* Is Mode 3GB */
> +#define V4L2_CID_XILINX_SDIRX_IS_3GB		(V4L2_CID_XILINX_SDIRX + 11)
> +
>  #endif /* __UAPI_XILINX_V4L2_CONTROLS_H__ */
> diff --git a/include/uapi/linux/xilinx-v4l2-events.h b/include/uapi/linux/xilinx-v4l2-events.h
> index 2aa357c..7b47595 100644
> --- a/include/uapi/linux/xilinx-v4l2-events.h
> +++ b/include/uapi/linux/xilinx-v4l2-events.h
> @@ -18,4 +18,13 @@
>  /* Stream Line Buffer full */
>  #define V4L2_EVENT_XLNXCSIRX_SLBF	(V4L2_EVENT_XLNXCSIRX_CLASS | 0x1)
>  
> +/* Xilinx SMPTE UHD-SDI RX Subsystem */
> +#define V4L2_EVENT_XLNXSDIRX_CLASS	(V4L2_EVENT_PRIVATE_START | 0x200)
> +/* Video Unlock event */
> +#define V4L2_EVENT_XLNXSDIRX_VIDUNLOCK	(V4L2_EVENT_XLNXSDIRX_CLASS | 0x1)
> +/* Video in to AXI4 Stream core underflowed */
> +#define V4L2_EVENT_XLNXSDIRX_UNDERFLOW	(V4L2_EVENT_XLNXSDIRX_CLASS | 0x2)
> +/* Video in to AXI4 Stream core overflowed */
> +#define V4L2_EVENT_XLNXSDIRX_OVERFLOW	(V4L2_EVENT_XLNXSDIRX_CLASS | 0x3)

Could you please double-check if all events / controls are hard-required? More
of these will make generic v4l applications harder to run on this driver. It'd
be nicer if some of these (ex, from sdi spec) can be shared for any sdi if
possible?

Thanks,
-hyun

> +
>  #endif /* __UAPI_XILINX_V4L2_EVENTS_H__ */
> -- 
> 1.8.3.1
> 
> 

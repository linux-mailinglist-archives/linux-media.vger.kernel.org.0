Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F62E3C841
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 12:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405233AbfFKKLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 06:11:30 -0400
Received: from mail-eopbgr720085.outbound.protection.outlook.com ([40.107.72.85]:32448
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404501AbfFKKLa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 06:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5xLNwy0eTrtZBib4jeE9y7KBaVKnCuBdkqjeqy8da8=;
 b=QID0JdmeLsv9BWeAvPHNHhwLiX+QXNuyRwezAbUgorvua/rQmIEQWV4TKrkCW7MjpcQqlgYUrxn/cFnm6mM/1aRxI3Xw2Dt9q/VYWgLM+jAcBsSVF8UlHNzEH65ThcFNguBEzzCnp5EiMh+45ldbR2YwT3t+VxvxIFuIBHXL2p8=
Received: from BN6PR02CA0038.namprd02.prod.outlook.com (2603:10b6:404:5f::24)
 by BL0PR02MB4931.namprd02.prod.outlook.com (2603:10b6:208:53::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.17; Tue, 11 Jun
 2019 10:11:13 +0000
Received: from SN1NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::202) by BN6PR02CA0038.outlook.office365.com
 (2603:10b6:404:5f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.14 via Frontend
 Transport; Tue, 11 Jun 2019 10:11:13 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT012.mail.protection.outlook.com (10.152.72.95) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1965.12
 via Frontend Transport; Tue, 11 Jun 2019 10:11:12 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hadkG-0005TR-0n; Tue, 11 Jun 2019 03:11:12 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hadkA-0002Kf-UM; Tue, 11 Jun 2019 03:11:06 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x5BAB23p020131;
        Tue, 11 Jun 2019 03:11:02 -0700
Received: from [172.23.62.223] (helo=xhdrdevl203.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hadk5-00029I-Rv; Tue, 11 Jun 2019 03:11:02 -0700
From:   Vishal Sagar <vishal.sagar@xilinx.com>
To:     Hyun Kwon <hyunk@xilinx.com>, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hans.verkuil@cisco.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [PATCH v9 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem driver
Date:   Tue, 11 Jun 2019 15:40:09 +0530
Message-Id: <1560247809-117978-3-git-send-email-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1560247809-117978-1-git-send-email-vishal.sagar@xilinx.com>
References: <1560247809-117978-1-git-send-email-vishal.sagar@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(376002)(136003)(39860400002)(396003)(346002)(2980300002)(45074003)(189003)(199004)(426003)(446003)(4720700003)(478600001)(107886003)(70586007)(14444005)(47776003)(336012)(53946003)(126002)(63266004)(50226002)(44832011)(50466002)(70206006)(486006)(7696005)(106002)(48376002)(8936002)(2906002)(305945005)(51416003)(5660300002)(316002)(186003)(16586007)(26005)(77096007)(76176011)(476003)(9786002)(36756003)(86362001)(356004)(81156014)(4326008)(36386004)(11346002)(7416002)(8676002)(2616005)(81166006)(30864003)(110136005)(921003)(42866002)(1121003)(559001)(579004);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR02MB4931;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 773954a4-852a-4dba-b62c-08d6ee552206
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:BL0PR02MB4931;
X-MS-TrafficTypeDiagnostic: BL0PR02MB4931:
X-Microsoft-Antispam-PRVS: <BL0PR02MB4931C6D3A727FF73E4431E15F6ED0@BL0PR02MB4931.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-Forefront-PRVS: 006546F32A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zTJSfB4WLvNkn+M3BOKE7SuquagHSW30I3VTAlm6F8KAEw5royDCf9fHqITGDsNkN9bLbZ64shAK77VzCv2LH93AJduVh2C5O4vpRKCOATOeAP8GbdHnDBjBXoE0B2W/hAE8IcGHd+i4fNuZKEO3XAWBFXS2R07UZORkP/qLzBGGHVyLD1aLRuWcijHE0p++COQ+gf6lc8IlXYPi1yZsmZ++d1HuoO0aRasAmqvocJWJ+763m5Zx201Wpurg2Iwp9kBd31yL5ISKTwtIM5ctnbaXlE8FUUgVD5OekR3yUZCTZsu3OFL7sFKBMdkkKhcqXhZUZSqWqcG/kzAIPawzELwJIRQa0GDnFOF4ueKu1kTtV+8LiZerBUHjsthrsqUjaPbep6qAc/jUewUk/JJp3VuhXdwitHjpX3twVMGsDjs=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2019 10:11:12.4515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 773954a4-852a-4dba-b62c-08d6ee552206
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4931
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Xilinx MIPI CSI-2 Rx Subsystem soft IP is used to capture images
from MIPI CSI-2 camera sensors and output AXI4-Stream video data ready
for image processing. Please refer to PG232 for details.

The driver is used to set the number of active lanes, if enabled
in hardware. The CSI2 Rx controller filters out all packets except for
the packets with data type fixed in hardware. RAW8 packets are always
allowed to pass through.

It is also used to setup and handle interrupts and enable the core. It
logs all the events in respective counters between streaming on and off.

The driver supports only the video format bridge enabled configuration.
Some data types like YUV 422 10bpc, RAW16, RAW20 are supported when the
CSI v2.0 feature is enabled in design. When the VCX feature is enabled,
the maximum number of virtual channels becomes 16 from 4.

Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
---
v9
- Moved all controls and events to xilinx-csi2rxss.h
- Updated name and description of controls and events
- Get control base address from v4l2-controls.h (0x10c0)
- Fix KConfig for dependency on VIDEO_XILINX                                                                                   
- Added enum_mbus_code() support
- Added default format to be returned on open()
- Mark variables are const
- Remove references to short packet in comments
- Add check for streaming before setting active lanes control
- strlcpy -> strscpy
- Fix xcsi2rxss_set_format()

v8
- Use clk_bulk* APIs
- Add gpio reset for asserting video_aresetn when stream line buffer occurs
- Removed short packet related events and irq handling
  - V4L2_EVENT_XLNXCSIRX_SPKT and V4L2_EVENT_XLNXCSIRX_SPKT_OVF removed
- Removed frame counter control V4L2_CID_XILINX_MIPICSISS_FRAME_COUNTER
  and xcsi2rxss_g_volatile_ctrl()
- Minor formatting fixes

v7
- No change

v6
- No change

v5
- Removed bayer and updated related parts like set default format based
  on Luca Cersoli's comments.
- Added correct YUV422 10bpc media bus format

v4
- Removed irq member from core structure
- Consolidated IP config prints in xcsi2rxss_log_ipconfig()
- Return -EINVAL in case of invalid ioctl
- Code formatting
- Added reviewed by Hyun Kwon

v3
- Fixed comments given by Hyun.
- Removed DPHY 200 MHz clock. This will be controlled by DPHY driver
- Minor code formatting
- en_csi_v20 and vfb members removed from struct and made local to dt parsing
- lock description updated
- changed to ratelimited type for all dev prints in irq handler
- Removed YUV 422 10bpc media format

v2
- Fixed comments given by Hyun and Sakari.
- Made all bitmask using BIT() and GENMASK()
- Removed unused definitions
- Removed DPHY access. This will be done by separate DPHY PHY driver.
- Added support for CSI v2.0 for YUV 422 10bpc, RAW16, RAW20 and extra
  virtual channels
- Fixed the ports as sink and source
- Now use the v4l2fwnode API to get number of data-lanes
- Added clock framework support
- Removed the close() function
- updated the set format function
- support only VFB enabled configuration

 drivers/media/platform/xilinx/Kconfig           |   11 +
 drivers/media/platform/xilinx/Makefile          |    1 +
 drivers/media/platform/xilinx/xilinx-csi2rxss.c | 1488 +++++++++++++++++++++++
 include/uapi/linux/v4l2-controls.h              |    4 +
 include/uapi/linux/xilinx-csi2rxss.h            |   52 +
 5 files changed, 1556 insertions(+)
 create mode 100644 drivers/media/platform/xilinx/xilinx-csi2rxss.c
 create mode 100644 include/uapi/linux/xilinx-csi2rxss.h

diff --git a/drivers/media/platform/xilinx/Kconfig b/drivers/media/platform/xilinx/Kconfig
index a2773ad..349da87 100644
--- a/drivers/media/platform/xilinx/Kconfig
+++ b/drivers/media/platform/xilinx/Kconfig
@@ -10,6 +10,17 @@ config VIDEO_XILINX
 
 if VIDEO_XILINX
 
+config VIDEO_XILINX_CSI2RXSS
+	tristate "Xilinx CSI2 Rx Subsystem"
+	depends on VIDEO_XILINX
+	help
+	  Driver for Xilinx MIPI CSI2 Rx Subsystem. This is a V4L sub-device
+	  based driver that takes input from CSI2 Tx source and converts
+	  it into an AXI4-Stream. The subsystem comprises of a CSI2 Rx
+	  controller, DPHY, an optional I2C controller and a Video Format
+	  Bridge. The driver is used to set the number of active lanes and
+	  get short packet data.
+
 config VIDEO_XILINX_TPG
 	tristate "Xilinx Video Test Pattern Generator"
 	depends on VIDEO_XILINX
diff --git a/drivers/media/platform/xilinx/Makefile b/drivers/media/platform/xilinx/Makefile
index 4cdc0b1..6119a34 100644
--- a/drivers/media/platform/xilinx/Makefile
+++ b/drivers/media/platform/xilinx/Makefile
@@ -3,5 +3,6 @@
 xilinx-video-objs += xilinx-dma.o xilinx-vip.o xilinx-vipp.o
 
 obj-$(CONFIG_VIDEO_XILINX) += xilinx-video.o
+obj-$(CONFIG_VIDEO_XILINX_CSI2RXSS) += xilinx-csi2rxss.o
 obj-$(CONFIG_VIDEO_XILINX_TPG) += xilinx-tpg.o
 obj-$(CONFIG_VIDEO_XILINX_VTC) += xilinx-vtc.o
diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
new file mode 100644
index 0000000..373d91f
--- /dev/null
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -0,0 +1,1488 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for Xilinx MIPI CSI2 Rx Subsystem
+ *
+ * Copyright (C) 2016 - 2019 Xilinx, Inc.
+ *
+ * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
+ *
+ */
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/v4l2-subdev.h>
+#include <linux/xilinx-csi2rxss.h>
+#include <media/media-entity.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+#include "xilinx-vip.h"
+
+/* Register register map */
+#define XCSI_CCR_OFFSET		0x00
+#define XCSI_CCR_SOFTRESET	BIT(1)
+#define XCSI_CCR_ENABLE		BIT(0)
+
+#define XCSI_PCR_OFFSET		0x04
+#define XCSI_PCR_MAXLANES_MASK	GENMASK(4, 3)
+#define XCSI_PCR_ACTLANES_MASK	GENMASK(1, 0)
+
+#define XCSI_CSR_OFFSET		0x10
+#define XCSI_CSR_PKTCNT		GENMASK(31, 16)
+#define XCSI_CSR_SPFIFOFULL	BIT(3)
+#define XCSI_CSR_SPFIFONE	BIT(2)
+#define XCSI_CSR_SLBF		BIT(1)
+#define XCSI_CSR_RIPCD		BIT(0)
+
+#define XCSI_GIER_OFFSET	0x20
+#define XCSI_GIER_GIE		BIT(0)
+
+#define XCSI_ISR_OFFSET		0x24
+#define XCSI_IER_OFFSET		0x28
+
+#define XCSI_ISR_FR		BIT(31)
+#define XCSI_ISR_VCXFE		BIT(30)
+#define XCSI_ISR_WCC		BIT(22)
+#define XCSI_ISR_ILC		BIT(21)
+#define XCSI_ISR_SPFIFOF	BIT(20)
+#define XCSI_ISR_SPFIFONE	BIT(19)
+#define XCSI_ISR_SLBF		BIT(18)
+#define XCSI_ISR_STOP		BIT(17)
+#define XCSI_ISR_SOTERR		BIT(13)
+#define XCSI_ISR_SOTSYNCERR	BIT(12)
+#define XCSI_ISR_ECC2BERR	BIT(11)
+#define XCSI_ISR_ECC1BERR	BIT(10)
+#define XCSI_ISR_CRCERR		BIT(9)
+#define XCSI_ISR_DATAIDERR	BIT(8)
+#define XCSI_ISR_VC3FSYNCERR	BIT(7)
+#define XCSI_ISR_VC3FLVLERR	BIT(6)
+#define XCSI_ISR_VC2FSYNCERR	BIT(5)
+#define XCSI_ISR_VC2FLVLERR	BIT(4)
+#define XCSI_ISR_VC1FSYNCERR	BIT(3)
+#define XCSI_ISR_VC1FLVLERR	BIT(2)
+#define XCSI_ISR_VC0FSYNCERR	BIT(1)
+#define XCSI_ISR_VC0FLVLERR	BIT(0)
+
+#define XCSI_INTR_PROT_MASK	(XCSI_ISR_VC3FSYNCERR |	XCSI_ISR_VC3FLVLERR |\
+				 XCSI_ISR_VC2FSYNCERR | XCSI_ISR_VC2FLVLERR |\
+				 XCSI_ISR_VC1FSYNCERR | XCSI_ISR_VC1FLVLERR |\
+				 XCSI_ISR_VC0FSYNCERR |	XCSI_ISR_VC0FLVLERR |\
+				 XCSI_ISR_VCXFE)
+
+#define XCSI_INTR_PKTLVL_MASK	(XCSI_ISR_ECC2BERR | XCSI_ISR_ECC1BERR |\
+				 XCSI_ISR_CRCERR | XCSI_ISR_DATAIDERR)
+
+#define XCSI_INTR_DPHY_MASK	(XCSI_ISR_SOTERR | XCSI_ISR_SOTSYNCERR)
+
+#define XCSI_INTR_SPKT_MASK	(XCSI_ISR_SPFIFOF | XCSI_ISR_SPFIFONE)
+
+#define XCSI_INTR_ERR_MASK	(XCSI_ISR_WCC | XCSI_ISR_ILC | XCSI_ISR_SLBF |\
+				 XCSI_ISR_STOP)
+
+#define XCSI_INTR_FRAMERCVD_MASK	(XCSI_ISR_FR)
+
+#define XCSI_ISR_ALLINTR_MASK	(XCSI_INTR_PROT_MASK | XCSI_INTR_PKTLVL_MASK |\
+				 XCSI_INTR_DPHY_MASK | XCSI_INTR_SPKT_MASK |\
+				 XCSI_INTR_ERR_MASK | XCSI_INTR_FRAMERCVD_MASK)
+
+/*
+ * Removed VCXFE mask as it doesn't exist in IER
+ * Removed STOP state irq as this will keep driver in irq handler only
+ */
+#define XCSI_IER_INTR_MASK	(XCSI_ISR_ALLINTR_MASK &\
+				 ~(XCSI_ISR_STOP | XCSI_ISR_VCXFE))
+
+#define XCSI_SPKTR_OFFSET	0x30
+#define XCSI_SPKTR_DATA		GENMASK(23, 8)
+#define XCSI_SPKTR_VC		GENMASK(7, 6)
+#define XCSI_SPKTR_DT		GENMASK(5, 0)
+
+#define XCSI_VCXR_OFFSET	0x34
+#define XCSI_VCXR_VCERR		GENMASK(23, 0)
+#define XCSI_VCXR_VCSTART	4
+#define XCSI_VCXR_VCEND		15
+#define XCSI_VCXR_FSYNCERR	BIT(1)
+#define XCSI_VCXR_FLVLERR	BIT(0)
+
+#define XCSI_CLKINFR_OFFSET	0x3C
+#define XCSI_CLKINFR_STOP	BIT(1)
+
+#define XCSI_DLXINFR_OFFSET	0x40
+#define XCSI_DLXINFR_STOP	BIT(5)
+#define XCSI_DLXINFR_SOTERR	BIT(1)
+#define XCSI_DLXINFR_SOTSYNCERR	BIT(0)
+#define XCSI_MAXDL_COUNT	0x4
+
+#define XCSI_VCXINF1R_OFFSET		0x60
+#define XCSI_VCXINF1R_LINECOUNT		GENMASK(31, 16)
+#define XCSI_VCXINF1R_LINECOUNT_SHIFT	16
+#define XCSI_VCXINF1R_BYTECOUNT		GENMASK(15, 0)
+
+#define XCSI_VCXINF2R_OFFSET	0x64
+#define XCSI_VCXINF2R_DT	GENMASK(5, 0)
+#define XCSI_MAXVCX_COUNT	16
+
+/*
+ * The core takes less than 100 video clock cycles to reset.
+ * So choosing a timeout value larger than this.
+ */
+#define XCSI_TIMEOUT_VAL	1000 /* us */
+
+/* Maximum events */
+#define XCSI_MAX_EVENT		32
+
+/*
+ * Sink pad connected to sensor source pad.
+ * Source pad connected to next module like demosaic.
+ */
+#define XCSI_MEDIA_PADS		2
+#define XCSI_DEFAULT_WIDTH	1920
+#define XCSI_DEFAULT_HEIGHT	1080
+
+/* Max media bus formats supported for enumeration */
+#define XCSI_MAX_MBUS_FMTS	16
+
+/* Max string length for CSI Data type string */
+#define XCSI_PXLFMT_STRLEN_MAX	16
+
+/* MIPI CSI2 Data Types from spec */
+#define XCSI_DT_YUV4228B	0x1E
+#define XCSI_DT_YUV42210B	0x1F
+#define XCSI_DT_RGB444		0x20
+#define XCSI_DT_RGB555		0x21
+#define XCSI_DT_RGB565		0x22
+#define XCSI_DT_RGB666		0x23
+#define XCSI_DT_RGB888		0x24
+#define XCSI_DT_RAW6		0x28
+#define XCSI_DT_RAW7		0x29
+#define XCSI_DT_RAW8		0x2A
+#define XCSI_DT_RAW10		0x2B
+#define XCSI_DT_RAW12		0x2C
+#define XCSI_DT_RAW14		0x2D
+#define XCSI_DT_RAW16		0x2E
+#define XCSI_DT_RAW20		0x2F
+
+#define XCSI_VCX_START		4
+#define XCSI_MAX_VC		4
+#define XCSI_MAX_VCX		16
+
+#define XCSI_NEXTREG_OFFSET	4
+
+/* There are 2 events frame sync and frame level error per VC */
+#define XCSI_VCX_NUM_EVENTS	((XCSI_MAX_VCX - XCSI_MAX_VC) * 2)
+
+/* Macro to return "true" or "false" string if bit is set */
+#define XCSI_GET_BITSET_STR(val, mask)	(val) & (mask) ? "true" : "false"
+
+/**
+ * struct xcsi2rxss_event - Event log structure
+ * @mask: Event mask
+ * @name: Name of the event
+ * @counter: Count number of events
+ */
+struct xcsi2rxss_event {
+	u32 mask;
+	const char *name;
+	unsigned int counter;
+};
+
+/*
+ * struct xcsi2rxss_core - Core configuration CSI2 Rx Subsystem device structure
+ * @dev: Platform structure
+ * @iomem: Base address of subsystem
+ * @enable_active_lanes: If number of active lanes can be modified
+ * @max_num_lanes: Maximum number of lanes present
+ * @datatype: Data type filter
+ * @events: Structure to maintain event logs
+ * @vcx_events: Structure to maintain VCX event logs
+ * @en_vcx: If more than 4 VC are enabled
+ * @clks: array of clocks
+ * @num_clks: number of clocks
+ * @rst_gpio: reset to video_aresetn
+ */
+struct xcsi2rxss_core {
+	struct device *dev;
+	void __iomem *iomem;
+	bool enable_active_lanes;
+	u32 max_num_lanes;
+	u32 datatype;
+	struct xcsi2rxss_event *events;
+	struct xcsi2rxss_event *vcx_events;
+	bool en_vcx;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct gpio_desc *rst_gpio;
+};
+
+/**
+ * struct xcsi2rxss_state - CSI2 Rx Subsystem device structure
+ * @core: Core structure for MIPI CSI2 Rx Subsystem
+ * @subdev: The v4l2 subdev structure
+ * @ctrl_handler: control handler
+ * @format: Active V4L2 formats on each pad
+ * @default_format: Default V4L2 format
+ * @event: Holds the line buffer full event
+ * @lock: mutex for accessing this structure
+ * @pads: media pads
+ * @mbus_fmts: List of media bus formats for enum_mbus_code
+ * @mbus_fmts_count: Number of media bus formats
+ * @streaming: Flag for storing streaming state
+ *
+ * This structure contains the device driver related parameters
+ */
+struct xcsi2rxss_state {
+	struct xcsi2rxss_core core;
+	struct v4l2_subdev subdev;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_mbus_framefmt format;
+	struct v4l2_mbus_framefmt default_format;
+	struct v4l2_event event;
+	/* used to protect access to this struct */
+	struct mutex lock;
+	struct media_pad pads[XCSI_MEDIA_PADS];
+	u32 mbus_fmts[XCSI_MAX_MBUS_FMTS];
+	u32 mbus_fmts_count;
+	bool streaming;
+};
+
+static const struct xcsi2rxss_event xcsi2rxss_events[] = {
+	{ XCSI_ISR_FR, "Frame Received", 0 },
+	{ XCSI_ISR_VCXFE, "VCX Frame Errors", 0 },
+	{ XCSI_ISR_WCC, "Word Count Errors", 0 },
+	{ XCSI_ISR_ILC, "Invalid Lane Count Error", 0 },
+	{ XCSI_ISR_SPFIFOF, "Short Packet FIFO OverFlow Error", 0 },
+	{ XCSI_ISR_SPFIFONE, "Short Packet FIFO Not Empty", 0 },
+	{ XCSI_ISR_SLBF, "Streamline Buffer Full Error", 0 },
+	{ XCSI_ISR_STOP, "Lane Stop State", 0 },
+	{ XCSI_ISR_SOTERR, "SOT Error", 0 },
+	{ XCSI_ISR_SOTSYNCERR, "SOT Sync Error", 0 },
+	{ XCSI_ISR_ECC2BERR, "2 Bit ECC Unrecoverable Error", 0 },
+	{ XCSI_ISR_ECC1BERR, "1 Bit ECC Recoverable Error", 0 },
+	{ XCSI_ISR_CRCERR, "CRC Error", 0 },
+	{ XCSI_ISR_DATAIDERR, "Data Id Error", 0 },
+	{ XCSI_ISR_VC3FSYNCERR, "Virtual Channel 3 Frame Sync Error", 0 },
+	{ XCSI_ISR_VC3FLVLERR, "Virtual Channel 3 Frame Level Error", 0 },
+	{ XCSI_ISR_VC2FSYNCERR, "Virtual Channel 2 Frame Sync Error", 0 },
+	{ XCSI_ISR_VC2FLVLERR, "Virtual Channel 2 Frame Level Error", 0 },
+	{ XCSI_ISR_VC1FSYNCERR, "Virtual Channel 1 Frame Sync Error", 0 },
+	{ XCSI_ISR_VC1FLVLERR, "Virtual Channel 1 Frame Level Error", 0 },
+	{ XCSI_ISR_VC0FSYNCERR, "Virtual Channel 0 Frame Sync Error", 0 },
+	{ XCSI_ISR_VC0FLVLERR, "Virtual Channel 0 Frame Level Error", 0 }
+};
+
+#define XCSI_NUM_EVENTS		ARRAY_SIZE(xcsi2rxss_events)
+
+static const struct clk_bulk_data xcsi2rxss_clks[] = {
+	{ .id = "lite_aclk" },
+	{ .id = "video_aclk" },
+};
+
+static inline struct xcsi2rxss_state *
+to_xcsi2rxssstate(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct xcsi2rxss_state, subdev);
+}
+
+/*
+ * Register related operations
+ */
+static inline u32 xcsi2rxss_read(struct xcsi2rxss_core *xcsi2rxss, u32 addr)
+{
+	return ioread32(xcsi2rxss->iomem + addr);
+}
+
+static inline void xcsi2rxss_write(struct xcsi2rxss_core *xcsi2rxss, u32 addr,
+				   u32 value)
+{
+	iowrite32(value, xcsi2rxss->iomem + addr);
+}
+
+static inline void xcsi2rxss_clr(struct xcsi2rxss_core *xcsi2rxss, u32 addr,
+				 u32 clr)
+{
+	xcsi2rxss_write(xcsi2rxss, addr,
+			xcsi2rxss_read(xcsi2rxss, addr) & ~clr);
+}
+
+static inline void xcsi2rxss_set(struct xcsi2rxss_core *xcsi2rxss, u32 addr,
+				 u32 set)
+{
+	xcsi2rxss_write(xcsi2rxss, addr,
+			xcsi2rxss_read(xcsi2rxss, addr) | set);
+}
+
+/**
+ * xcsi2rxss_clr_and_set - Clear and set the register with a bitmask
+ * @xcsi2rxss: Xilinx MIPI CSI2 Rx Subsystem subdev core struct
+ * @addr: address of register
+ * @clr: bitmask to be cleared
+ * @set: bitmask to be set
+ *
+ * Clear a bit(s) of mask @clr in the register at address @addr, then set
+ * a bit(s) of mask @set in the register after.
+ */
+static void xcsi2rxss_clr_and_set(struct xcsi2rxss_core *xcsi2rxss,
+				  u32 addr, u32 clr, u32 set)
+{
+	u32 reg;
+
+	reg = xcsi2rxss_read(xcsi2rxss, addr);
+	reg &= ~clr;
+	reg |= set;
+	xcsi2rxss_write(xcsi2rxss, addr, reg);
+}
+
+static void xcsi2rxss_enable(struct xcsi2rxss_core *core)
+{
+	xcsi2rxss_set(core, XCSI_CCR_OFFSET, XCSI_CCR_ENABLE);
+}
+
+static void xcsi2rxss_disable(struct xcsi2rxss_core *core)
+{
+	xcsi2rxss_clr(core, XCSI_CCR_OFFSET, XCSI_CCR_ENABLE);
+}
+
+static void xcsi2rxss_intr_enable(struct xcsi2rxss_core *core)
+{
+	xcsi2rxss_clr(core, XCSI_GIER_OFFSET, XCSI_GIER_GIE);
+	xcsi2rxss_write(core, XCSI_IER_OFFSET, XCSI_IER_INTR_MASK);
+	xcsi2rxss_set(core, XCSI_GIER_OFFSET, XCSI_GIER_GIE);
+}
+
+static void xcsi2rxss_intr_disable(struct xcsi2rxss_core *core)
+{
+	xcsi2rxss_clr(core, XCSI_IER_OFFSET, XCSI_IER_INTR_MASK);
+	xcsi2rxss_clr(core, XCSI_GIER_OFFSET, XCSI_GIER_GIE);
+}
+
+/**
+ * xcsi2rxss_reset - Does a soft reset of the MIPI CSI2 Rx Subsystem
+ * @core: Core Xilinx CSI2 Rx Subsystem structure pointer
+ *
+ * Core takes less than 100 video clock cycles to reset.
+ * So a larger timeout value is chosen for margin.
+ *
+ * Return: 0 - on success OR -ETIME if reset times out
+ */
+static int xcsi2rxss_reset(struct xcsi2rxss_core *core)
+{
+	u32 timeout = XCSI_TIMEOUT_VAL;
+
+	xcsi2rxss_set(core, XCSI_CCR_OFFSET, XCSI_CCR_SOFTRESET);
+
+	while (xcsi2rxss_read(core, XCSI_CSR_OFFSET) & XCSI_CSR_RIPCD) {
+		if (timeout == 0) {
+			dev_err(core->dev, "soft reset timed out!\n");
+			return -ETIME;
+		}
+
+		timeout--;
+		udelay(1);
+	}
+
+	xcsi2rxss_clr(core, XCSI_CCR_OFFSET, XCSI_CCR_SOFTRESET);
+	return 0;
+}
+
+static void xcsi2rxss_reset_event_counters(struct xcsi2rxss_state *state)
+{
+	unsigned int i;
+
+	for (i = 0; i < XCSI_NUM_EVENTS; i++)
+		state->core.events[i].counter = 0;
+
+	if (state->core.en_vcx) {
+		for (i = 0; i < XCSI_VCX_NUM_EVENTS; i++)
+			state->core.vcx_events[i].counter = 0;
+	}
+}
+
+/* Print event counters */
+static void xcsi2rxss_log_counters(struct xcsi2rxss_state *state)
+{
+	struct xcsi2rxss_core *core = &state->core;
+	int i;
+
+	for (i = 0; i < XCSI_NUM_EVENTS; i++) {
+		if (core->events[i].counter > 0) {
+			dev_info(core->dev, "%s events: %d\n",
+				 core->events[i].name,
+				 core->events[i].counter);
+		}
+	}
+
+	if (core->en_vcx) {
+		for (i = 0; i < XCSI_VCX_NUM_EVENTS; i++) {
+			if (core->vcx_events[i].counter > 0) {
+				dev_info(core->dev,
+					 "VC %d Frame %s err vcx events: %d\n",
+					 (i / 2) + XCSI_VCX_START,
+					 i & 1 ? "Sync" : "Level",
+					 core->vcx_events[i].counter);
+			}
+		}
+	}
+}
+
+static void xcsi2rxss_log_ipconfig(struct xcsi2rxss_state *state)
+{
+	struct xcsi2rxss_core *core = &state->core;
+
+	dev_dbg(core->dev, "****** Xilinx MIPI CSI2 Rx SS IP Config ******\n");
+	dev_dbg(core->dev, "vcx is %s", core->en_vcx ? "enabled" : "disabled");
+	dev_dbg(core->dev, "Enable active lanes property is %s\n",
+		core->enable_active_lanes ? "present" : "absent");
+	dev_dbg(core->dev, "Max lanes = %d", core->max_num_lanes);
+	dev_dbg(core->dev, "Pixel format set as 0x%x\n", core->datatype);
+	dev_dbg(core->dev, "**********************************************\n");
+}
+
+/**
+ * xcsi2rxss_log_status - Logs the status of the CSI-2 Receiver
+ * @sd: Pointer to V4L2 subdevice structure
+ *
+ * This function prints the current status of Xilinx MIPI CSI-2
+ *
+ * Return: 0 on success
+ */
+static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
+{
+	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
+	struct xcsi2rxss_core *core = &xcsi2rxss->core;
+	unsigned int reg, data, i, max_vc;
+
+	mutex_lock(&xcsi2rxss->lock);
+
+	xcsi2rxss_log_ipconfig(xcsi2rxss);
+
+	xcsi2rxss_log_counters(xcsi2rxss);
+
+	dev_info(core->dev, "***** Core Status *****\n");
+	data = xcsi2rxss_read(core, XCSI_CSR_OFFSET);
+	dev_info(core->dev, "Short Packet FIFO Full = %s\n",
+		 XCSI_GET_BITSET_STR(data, XCSI_CSR_SPFIFOFULL));
+	dev_info(core->dev, "Short Packet FIFO Not Empty = %s\n",
+		 XCSI_GET_BITSET_STR(data, XCSI_CSR_SPFIFONE));
+	dev_info(core->dev, "Stream line buffer full = %s\n",
+		 XCSI_GET_BITSET_STR(data, XCSI_CSR_SLBF));
+	dev_info(core->dev, "Soft reset/Core disable in progress = %s\n",
+		 XCSI_GET_BITSET_STR(data, XCSI_CSR_RIPCD));
+
+	/* Clk & Lane Info  */
+	dev_info(core->dev, "******** Clock Lane Info *********\n");
+	data = xcsi2rxss_read(core, XCSI_CLKINFR_OFFSET);
+	dev_info(core->dev, "Clock Lane in Stop State = %s\n",
+		 XCSI_GET_BITSET_STR(data, XCSI_CLKINFR_STOP));
+
+	dev_info(core->dev, "******** Data Lane Info *********\n");
+	dev_info(core->dev, "Lane\tSoT Error\tSoT Sync Error\tStop State\n");
+	reg = XCSI_DLXINFR_OFFSET;
+	for (i = 0; i < XCSI_MAXDL_COUNT; i++) {
+		data = xcsi2rxss_read(core, reg);
+
+		dev_info(core->dev, "%d\t%s\t\t%s\t\t%s\n", i,
+			 XCSI_GET_BITSET_STR(data, XCSI_DLXINFR_SOTERR),
+			 XCSI_GET_BITSET_STR(data, XCSI_DLXINFR_SOTSYNCERR),
+			 XCSI_GET_BITSET_STR(data, XCSI_DLXINFR_STOP));
+
+		reg += XCSI_NEXTREG_OFFSET;
+	}
+
+	/* Virtual Channel Image Information */
+	dev_info(core->dev, "********** Virtual Channel Info ************\n");
+	dev_info(core->dev, "VC\tLine Count\tByte Count\tData Type\n");
+	if (core->en_vcx)
+		max_vc = XCSI_MAX_VCX;
+	else
+		max_vc = XCSI_MAX_VC;
+
+	reg = XCSI_VCXINF1R_OFFSET;
+	for (i = 0; i < max_vc; i++) {
+		u32 line_count, byte_count, data_type;
+
+		/* Get line and byte count from VCXINFR1 Register */
+		data = xcsi2rxss_read(core, reg);
+		byte_count = data & XCSI_VCXINF1R_BYTECOUNT;
+		line_count = data & XCSI_VCXINF1R_LINECOUNT;
+		line_count >>= XCSI_VCXINF1R_LINECOUNT_SHIFT;
+
+		/* Get data type from VCXINFR2 Register */
+		reg += XCSI_NEXTREG_OFFSET;
+		data = xcsi2rxss_read(core, reg);
+		data_type = data & XCSI_VCXINF2R_DT;
+
+		dev_info(core->dev, "%d\t%d\t\t%d\t\t0x%x\n", i, line_count,
+			 byte_count, data_type);
+
+		/* Move to next pair of VC Info registers */
+		reg += XCSI_NEXTREG_OFFSET;
+	}
+
+	mutex_unlock(&xcsi2rxss->lock);
+
+	return 0;
+}
+
+/*
+ * xcsi2rxss_subscribe_event - Subscribe to custom events
+ * receive event.
+ * @sd: V4L2 Sub device
+ * @fh: V4L2 File Handle
+ * @sub: Subcribe event structure
+ *
+ * The driver generates a line buffer full event which the application may
+ * subscribe to. On getting this event, application may stop streaming and
+ * intimate user that something is incorrect in downstream pipeline which
+ * is causing this event.
+ *
+ * Return: 0 on success, errors otherwise
+ */
+static int xcsi2rxss_subscribe_event(struct v4l2_subdev *sd,
+				     struct v4l2_fh *fh,
+				     struct v4l2_event_subscription *sub)
+{
+	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
+	int ret;
+
+	mutex_lock(&xcsi2rxss->lock);
+
+	switch (sub->type) {
+	case V4L2_EVENT_XILINX_CSI2RX_SLBF:
+		ret = v4l2_event_subscribe(fh, sub, XCSI_MAX_EVENT, NULL);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	mutex_unlock(&xcsi2rxss->lock);
+
+	return ret;
+}
+
+/**
+ * xcsi2rxss_unsubscribe_event - Unsubscribe from all events registered
+ * @sd: V4L2 Sub device
+ * @fh: V4L2 file handle
+ * @sub: pointer to Event unsubscription structure
+ *
+ * Return: zero on success, else a negative error code.
+ */
+static int xcsi2rxss_unsubscribe_event(struct v4l2_subdev *sd,
+				       struct v4l2_fh *fh,
+				       struct v4l2_event_subscription *sub)
+{
+	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
+	int ret;
+
+	mutex_lock(&xcsi2rxss->lock);
+	ret = v4l2_event_unsubscribe(fh, sub);
+	mutex_unlock(&xcsi2rxss->lock);
+
+	return ret;
+}
+
+/**
+ * xcsi2rxss_s_ctrl - This is used to set the Xilinx MIPI CSI-2 V4L2 controls
+ * @ctrl: V4L2 control to be set
+ *
+ * This function is used to set the V4L2 controls for the Xilinx MIPI
+ * CSI-2 Rx Subsystem. It is used to set the active lanes in the system.
+ * The event counters can be reset.
+ *
+ * Return: 0 on success, errors otherwise
+ */
+static int xcsi2rxss_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct xcsi2rxss_state *xcsi2rxss =
+		container_of(ctrl->handler, struct xcsi2rxss_state,
+			     ctrl_handler);
+	struct xcsi2rxss_core *core = &xcsi2rxss->core;
+	int ret = 0;
+
+	mutex_lock(&xcsi2rxss->lock);
+
+	switch (ctrl->id) {
+	case V4L2_CID_XILINX_CSI2RX_ACT_LANES:
+		/*
+		 * This will be called only when "Enable Active Lanes" parameter
+		 * is set in design.
+		 */
+		if (core->enable_active_lanes && !xcsi2rxss->streaming) {
+			u32 active_lanes;
+
+			xcsi2rxss_clr_and_set(core, XCSI_PCR_OFFSET,
+					      XCSI_PCR_ACTLANES_MASK,
+					      ctrl->val - 1);
+			/*
+			 * This delay is to allow the value to reflect as write
+			 * and read paths are different.
+			 */
+			udelay(1);
+			active_lanes = xcsi2rxss_read(core, XCSI_PCR_OFFSET);
+			active_lanes &= XCSI_PCR_ACTLANES_MASK;
+			active_lanes++;
+			if (active_lanes != ctrl->val)
+				dev_info(core->dev, "RxByteClkHS absent\n");
+			dev_dbg(core->dev, "active lanes = %d\n", ctrl->val);
+		} else {
+			ret = -EINVAL;
+		}
+		break;
+	case V4L2_CID_XILINX_CSI2RX_RESET_COUNTERS:
+		xcsi2rxss_reset_event_counters(xcsi2rxss);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	mutex_unlock(&xcsi2rxss->lock);
+
+	return ret;
+}
+
+static int xcsi2rxss_start_stream(struct xcsi2rxss_state *state)
+{
+	struct xcsi2rxss_core *core = &state->core;
+	int ret = 0;
+
+	xcsi2rxss_enable(core);
+
+	ret = xcsi2rxss_reset(core);
+	if (ret < 0) {
+		state->streaming = false;
+		return ret;
+	}
+
+	xcsi2rxss_intr_enable(core);
+	state->streaming = true;
+
+	return ret;
+}
+
+static void xcsi2rxss_stop_stream(struct xcsi2rxss_state *state)
+{
+	struct xcsi2rxss_core *core = &state->core;
+
+	xcsi2rxss_intr_disable(core);
+	xcsi2rxss_disable(core);
+	state->streaming = false;
+}
+
+/**
+ * xcsi2rxss_irq_handler - Interrupt handler for CSI-2
+ * @irq: IRQ number
+ * @dev_id: Pointer to device state
+ *
+ * In the interrupt handler, a list of event counters are updated for
+ * corresponding interrupts. This is useful to get status / debug.
+ *
+ * In case of stream line buffer full condition, the IP is reset, stopped and
+ * an event is raised.
+ *
+ * Return: IRQ_HANDLED after handling interrupts
+ *         IRQ_NONE is no interrupts
+ */
+static irqreturn_t xcsi2rxss_irq_handler(int irq, void *dev_id)
+{
+	struct xcsi2rxss_state *state = (struct xcsi2rxss_state *)dev_id;
+	struct xcsi2rxss_core *core = &state->core;
+	u32 status;
+
+	status = xcsi2rxss_read(core, XCSI_ISR_OFFSET) & XCSI_ISR_ALLINTR_MASK;
+	dev_dbg_ratelimited(core->dev, "interrupt status = 0x%08x\n", status);
+
+	if (!status)
+		return IRQ_NONE;
+
+	/* Received a short packet */
+	if (status & XCSI_ISR_SPFIFONE) {
+		dev_dbg_ratelimited(core->dev, "Short packet = 0x%08x\n",
+				    xcsi2rxss_read(core, XCSI_SPKTR_OFFSET));
+	}
+
+	/* Short packet FIFO overflow */
+	if (status & XCSI_ISR_SPFIFOF)
+		dev_alert_ratelimited(core->dev, "Short packet FIFO overflowed\n");
+
+	/*
+	 * Stream line buffer full
+	 * This means there is a backpressure from downstream IP
+	 */
+	if (status & XCSI_ISR_SLBF) {
+		dev_alert_ratelimited(core->dev, "Stream Line Buffer Full!\n");
+		if (core->rst_gpio) {
+			gpiod_set_value(core->rst_gpio, 1);
+			/* minimum 40 dphy_clk_200M cycles */
+			ndelay(250);
+			gpiod_set_value(core->rst_gpio, 0);
+		}
+		xcsi2rxss_stop_stream(state);
+		memset(&state->event, 0, sizeof(state->event));
+		state->event.type = V4L2_EVENT_XILINX_CSI2RX_SLBF;
+		v4l2_subdev_notify_event(&state->subdev, &state->event);
+	}
+
+	/* Increment event counters */
+	if (status & XCSI_ISR_ALLINTR_MASK) {
+		unsigned int i;
+
+		for (i = 0; i < XCSI_NUM_EVENTS; i++) {
+			if (!(status & core->events[i].mask))
+				continue;
+			core->events[i].counter++;
+			dev_dbg_ratelimited(core->dev, "%s: %d\n",
+					    core->events[i].name,
+					    core->events[i].counter);
+		}
+
+		if (status & XCSI_ISR_VCXFE && core->en_vcx) {
+			u32 vcxstatus;
+
+			vcxstatus = xcsi2rxss_read(core, XCSI_VCXR_OFFSET);
+			vcxstatus &= XCSI_VCXR_VCERR;
+			for (i = 0; i < XCSI_VCX_NUM_EVENTS; i++) {
+				if (!(vcxstatus & core->vcx_events[i].mask))
+					continue;
+				core->vcx_events[i].counter++;
+			}
+			xcsi2rxss_write(core, XCSI_VCXR_OFFSET, vcxstatus);
+		}
+	}
+
+	xcsi2rxss_write(core, XCSI_ISR_OFFSET, status);
+	return IRQ_HANDLED;
+}
+
+/**
+ * xcsi2rxss_s_stream - It is used to start/stop the streaming.
+ * @sd: V4L2 Sub device
+ * @enable: Flag (True / False)
+ *
+ * This function controls the start or stop of streaming for the
+ * Xilinx MIPI CSI-2 Rx Subsystem.
+ *
+ * Return: 0 on success, errors otherwise
+ */
+static int xcsi2rxss_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
+	int ret = 0;
+
+	mutex_lock(&xcsi2rxss->lock);
+
+	if (enable) {
+		if (!xcsi2rxss->streaming) {
+			/* reset the event counters */
+			xcsi2rxss_reset_event_counters(xcsi2rxss);
+			ret = xcsi2rxss_start_stream(xcsi2rxss);
+		}
+	} else {
+		if (xcsi2rxss->streaming) {
+			struct gpio_desc *rst = xcsi2rxss->core.rst_gpio;
+
+			if (rst) {
+				gpiod_set_value_cansleep(rst, 1);
+				usleep_range(1, 2);
+				gpiod_set_value_cansleep(rst, 0);
+			}
+			xcsi2rxss_stop_stream(xcsi2rxss);
+		}
+	}
+
+	mutex_unlock(&xcsi2rxss->lock);
+	return ret;
+}
+
+static struct v4l2_mbus_framefmt *
+__xcsi2rxss_get_pad_format(struct xcsi2rxss_state *xcsi2rxss,
+			   struct v4l2_subdev_pad_config *cfg,
+			   unsigned int pad, u32 which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_format(&xcsi2rxss->subdev, cfg, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &xcsi2rxss->format;
+	default:
+		return NULL;
+	}
+}
+
+/**
+ * xcsi2rxss_get_format - Get the pad format
+ * @sd: Pointer to V4L2 Sub device structure
+ * @cfg: Pointer to sub device pad information structure
+ * @fmt: Pointer to pad level media bus format
+ *
+ * This function is used to get the pad format information.
+ *
+ * Return: 0 on success
+ */
+static int xcsi2rxss_get_format(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_format *fmt)
+{
+	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
+
+	mutex_lock(&xcsi2rxss->lock);
+	fmt->format = *__xcsi2rxss_get_pad_format(xcsi2rxss, cfg, fmt->pad,
+						  fmt->which);
+	mutex_unlock(&xcsi2rxss->lock);
+
+	return 0;
+}
+
+/**
+ * xcsi2rxss_set_format - This is used to set the pad format
+ * @sd: Pointer to V4L2 Sub device structure
+ * @cfg: Pointer to sub device pad information structure
+ * @fmt: Pointer to pad level media bus format
+ *
+ * This function is used to set the pad format. Since the pad format is fixed
+ * in hardware, it can't be modified on run time. So when a format set is
+ * requested by application, all parameters except the format type is saved
+ * for the pad and the original pad format is sent back to the application.
+ *
+ * Return: 0 on success
+ */
+static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_format *fmt)
+{
+	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
+	struct xcsi2rxss_core *core = &xcsi2rxss->core;
+	struct v4l2_mbus_framefmt *__format;
+
+	/* only sink pad format can be updated */
+	mutex_lock(&xcsi2rxss->lock);
+
+	/*
+	 * Only the format->code parameter matters for CSI as the
+	 * CSI format cannot be changed at runtime.
+	 * Ensure that format to set is copied to over to CSI pad format
+	 */
+	__format = __xcsi2rxss_get_pad_format(xcsi2rxss, cfg,
+					      fmt->pad, fmt->which);
+
+	if (fmt->pad == XVIP_PAD_SOURCE) {
+		fmt->format = *__format;
+		mutex_unlock(&xcsi2rxss->lock);
+		return 0;
+	}
+
+	/*
+	 * RAW8 is supported in all datatypes. So if requested media bus format
+	 * is of RAW8 type, then allow to be set. In case core is configured to
+	 * other RAW, YUV422 8/10 or RGB888, set appropriate media bus format.
+	 */
+	if ((fmt->format.code == MEDIA_BUS_FMT_SBGGR8_1X8 ||
+	     fmt->format.code == MEDIA_BUS_FMT_SGBRG8_1X8 ||
+	     fmt->format.code == MEDIA_BUS_FMT_SGRBG8_1X8 ||
+	     fmt->format.code == MEDIA_BUS_FMT_SRGGB8_1X8) ||
+	    (core->datatype == XCSI_DT_RAW10 &&
+	     (fmt->format.code == MEDIA_BUS_FMT_SBGGR10_1X10 ||
+	      fmt->format.code == MEDIA_BUS_FMT_SGBRG10_1X10 ||
+	      fmt->format.code == MEDIA_BUS_FMT_SGRBG10_1X10 ||
+	      fmt->format.code == MEDIA_BUS_FMT_SRGGB10_1X10)) ||
+	    (core->datatype == XCSI_DT_RAW12 &&
+	     (fmt->format.code == MEDIA_BUS_FMT_SBGGR12_1X12 ||
+	      fmt->format.code == MEDIA_BUS_FMT_SGBRG12_1X12 ||
+	      fmt->format.code == MEDIA_BUS_FMT_SGRBG12_1X12 ||
+	      fmt->format.code == MEDIA_BUS_FMT_SRGGB12_1X12)) ||
+	    (core->datatype == XCSI_DT_RAW14 &&
+	     (fmt->format.code == MEDIA_BUS_FMT_SBGGR14_1X14 ||
+	      fmt->format.code == MEDIA_BUS_FMT_SGBRG14_1X14 ||
+	      fmt->format.code == MEDIA_BUS_FMT_SGRBG14_1X14 ||
+	      fmt->format.code == MEDIA_BUS_FMT_SRGGB14_1X14)) ||
+	    (core->datatype == XCSI_DT_RAW16 &&
+	     (fmt->format.code == MEDIA_BUS_FMT_SBGGR16_1X16 ||
+	      fmt->format.code == MEDIA_BUS_FMT_SGBRG16_1X16 ||
+	      fmt->format.code == MEDIA_BUS_FMT_SGRBG16_1X16 ||
+	      fmt->format.code == MEDIA_BUS_FMT_SRGGB16_1X16)) ||
+	    (core->datatype == XCSI_DT_YUV4228B &&
+	     fmt->format.code == MEDIA_BUS_FMT_UYVY8_1X16) ||
+	    (core->datatype == XCSI_DT_YUV42210B &&
+	     fmt->format.code == MEDIA_BUS_FMT_UYVY10_1X20) ||
+	    (core->datatype == XCSI_DT_RGB888 &&
+	     fmt->format.code == MEDIA_BUS_FMT_RBG888_1X24)) {
+		/* Copy over the format to be set */
+		*__format = fmt->format;
+	} else {
+		/* Restore the original pad format code */
+		dev_dbg(core->dev, "Unsupported media bus format");
+		fmt->format.code = __format->code;
+		*__format = fmt->format;
+	}
+
+	mutex_unlock(&xcsi2rxss->lock);
+
+	return 0;
+}
+
+/*
+ * xcsi2rxss_enum_mbus_code - Handle pixel format enumeration
+ * @sd : pointer to v4l2 subdev structure
+ * @cfg: V4L2 subdev pad configuration
+ * @code : pointer to v4l2_subdev_mbus_code_enum structure
+ *
+ * Return: -EINVAL or zero on success
+ */
+int xcsi2rxss_enum_mbus_code(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct xcsi2rxss_state *state = to_xcsi2rxssstate(sd);
+
+	if (code->pad >= XCSI_MEDIA_PADS ||
+	    code->index > state->mbus_fmts_count)
+		return -EINVAL;
+
+	code->code = state->mbus_fmts[code->index];
+
+	return 0;
+}
+
+/**
+ * xcsi2rxss_open - Called on v4l2_open()
+ * @sd: Pointer to V4L2 sub device structure
+ * @fh: Pointer to V4L2 File handle
+ *
+ * This function is called on v4l2_open(). It sets the default format
+ * for both pads.
+ *
+ * Return: 0 on success
+ */
+static int xcsi2rxss_open(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_fh *fh)
+{
+	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
+	struct v4l2_mbus_framefmt *format;
+	unsigned int i;
+
+	for (i = 0; i < XCSI_MEDIA_PADS; i++) {
+		format = v4l2_subdev_get_try_format(sd, fh->pad, i);
+		*format = xcsi2rxss->default_format;
+	}
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * Media Operations
+ */
+
+static const struct media_entity_operations xcsi2rxss_media_ops = {
+	.link_validate = v4l2_subdev_link_validate
+};
+
+static const struct v4l2_ctrl_ops xcsi2rxss_ctrl_ops = {
+	.s_ctrl	= xcsi2rxss_s_ctrl
+};
+
+static struct v4l2_ctrl_config xcsi2rxss_ctrls[] = {
+	{
+		.ops	= &xcsi2rxss_ctrl_ops,
+		.id	= V4L2_CID_XILINX_CSI2RX_ACT_LANES,
+		.name	= "Active Lanes",
+		.type	= V4L2_CTRL_TYPE_INTEGER,
+		.min	= 1,
+		.max	= 4,
+		.step	= 1,
+		.def	= 1,
+	}, {
+		.ops	= &xcsi2rxss_ctrl_ops,
+		.id	= V4L2_CID_XILINX_CSI2RX_RESET_COUNTERS,
+		.name	= "Reset Counters",
+		.type	= V4L2_CTRL_TYPE_BUTTON,
+		.min	= 0,
+		.max	= 1,
+		.step	= 1,
+		.def	= 0,
+		.flags	= V4L2_CTRL_FLAG_WRITE_ONLY,
+	}
+};
+
+static const struct v4l2_subdev_core_ops xcsi2rxss_core_ops = {
+	.log_status = xcsi2rxss_log_status,
+	.subscribe_event = xcsi2rxss_subscribe_event,
+	.unsubscribe_event = xcsi2rxss_unsubscribe_event
+};
+
+static const struct v4l2_subdev_video_ops xcsi2rxss_video_ops = {
+	.s_stream = xcsi2rxss_s_stream
+};
+
+static const struct v4l2_subdev_pad_ops xcsi2rxss_pad_ops = {
+	.get_fmt = xcsi2rxss_get_format,
+	.set_fmt = xcsi2rxss_set_format,
+	.enum_mbus_code = xcsi2rxss_enum_mbus_code,
+};
+
+static const struct v4l2_subdev_ops xcsi2rxss_ops = {
+	.core = &xcsi2rxss_core_ops,
+	.video = &xcsi2rxss_video_ops,
+	.pad = &xcsi2rxss_pad_ops
+};
+
+static const struct v4l2_subdev_internal_ops xcsi2rxss_internal_ops = {
+	.open = xcsi2rxss_open,
+};
+
+static void xcsi2rxss_set_default_format(struct xcsi2rxss_state *state)
+{
+	struct xcsi2rxss_core *core = &state->core;
+
+	memset(&state->default_format, 0, sizeof(state->default_format));
+
+	switch (core->datatype) {
+	case XCSI_DT_YUV4228B:
+		state->default_format.code = MEDIA_BUS_FMT_UYVY8_1X16;
+		break;
+	case XCSI_DT_RGB888:
+		state->default_format.code = MEDIA_BUS_FMT_RBG888_1X24;
+		break;
+	case XCSI_DT_YUV42210B:
+		state->default_format.code = MEDIA_BUS_FMT_UYVY10_1X20;
+		break;
+	case XCSI_DT_RAW10:
+		state->default_format.code = MEDIA_BUS_FMT_SRGGB10_1X10;
+		break;
+	case XCSI_DT_RAW12:
+		state->default_format.code = MEDIA_BUS_FMT_SRGGB12_1X12;
+		break;
+	case XCSI_DT_RAW14:
+		state->default_format.code = MEDIA_BUS_FMT_SRGGB14_1X14;
+		break;
+	case XCSI_DT_RAW16:
+		state->default_format.code = MEDIA_BUS_FMT_SRGGB16_1X16;
+		break;
+	case XCSI_DT_RAW8:
+	case XCSI_DT_RGB444:
+	case XCSI_DT_RGB555:
+	case XCSI_DT_RGB565:
+	case XCSI_DT_RGB666:
+		state->default_format.code = MEDIA_BUS_FMT_SRGGB8_1X8;
+		break;
+	}
+
+	state->default_format.field = V4L2_FIELD_NONE;
+	state->default_format.colorspace = V4L2_COLORSPACE_SRGB;
+	state->default_format.width = XCSI_DEFAULT_WIDTH;
+	state->default_format.height = XCSI_DEFAULT_HEIGHT;
+
+	dev_dbg(core->dev, "default mediabus format = 0x%x",
+		state->default_format.code);
+}
+
+static void xcsi2rxss_init_mbus_fmts(struct xcsi2rxss_state *state)
+{
+	struct xcsi2rxss_core *core = &state->core;
+	u32 i = 0;
+
+	state->mbus_fmts[i++] = MEDIA_BUS_FMT_SRGGB8_1X8;
+	state->mbus_fmts[i++] = MEDIA_BUS_FMT_SBGGR8_1X8;
+	state->mbus_fmts[i++] = MEDIA_BUS_FMT_SGRBG8_1X8;
+	state->mbus_fmts[i++] = MEDIA_BUS_FMT_SGBRG8_1X8;
+
+	switch (core->datatype) {
+	case XCSI_DT_RAW10:
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SRGGB10_1X10;
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SBGGR10_1X10;
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SGRBG10_1X10;
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SGBRG10_1X10;
+		break;
+	case XCSI_DT_RAW12:
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SRGGB12_1X12;
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SBGGR12_1X12;
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SGRBG12_1X12;
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SGBRG12_1X12;
+		break;
+	case XCSI_DT_RAW14:
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SRGGB14_1X14;
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SBGGR14_1X14;
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SGRBG14_1X14;
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SGBRG14_1X14;
+		break;
+	case XCSI_DT_RAW16:
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SRGGB16_1X16;
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SBGGR16_1X16;
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SGRBG16_1X16;
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_SGBRG16_1X16;
+		break;
+	case XCSI_DT_YUV4228B:
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		break;
+	case XCSI_DT_RGB888:
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_RBG888_1X24;
+		break;
+	case XCSI_DT_YUV42210B:
+		state->mbus_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		break;
+	}
+
+	state->mbus_fmts_count = i;
+}
+
+static int xcsi2rxss_parse_of(struct xcsi2rxss_state *xcsi2rxss)
+{
+	struct xcsi2rxss_core *core = &xcsi2rxss->core;
+	struct device_node *node = xcsi2rxss->core.dev->of_node;
+	struct device_node *ports = NULL;
+	struct device_node *port = NULL;
+	unsigned int nports, irq;
+	bool en_csi_v20, vfb;
+	int ret;
+
+	en_csi_v20 = of_property_read_bool(node, "xlnx,en-csi-v2-0");
+	if (en_csi_v20)
+		core->en_vcx = of_property_read_bool(node, "xlnx,en-vcx");
+
+	core->enable_active_lanes =
+		of_property_read_bool(node, "xlnx,en-active-lanes");
+
+	ret = of_property_read_u32(node, "xlnx,csi-pxl-format",
+				   &core->datatype);
+	if (ret < 0) {
+		dev_err(core->dev, "missing xlnx,csi-pxl-format property\n");
+		return ret;
+	}
+
+	switch (core->datatype) {
+	case XCSI_DT_YUV4228B:
+	case XCSI_DT_RGB444:
+	case XCSI_DT_RGB555:
+	case XCSI_DT_RGB565:
+	case XCSI_DT_RGB666:
+	case XCSI_DT_RGB888:
+	case XCSI_DT_RAW6:
+	case XCSI_DT_RAW7:
+	case XCSI_DT_RAW8:
+	case XCSI_DT_RAW10:
+	case XCSI_DT_RAW12:
+	case XCSI_DT_RAW14:
+		break;
+	case XCSI_DT_YUV42210B:
+	case XCSI_DT_RAW16:
+	case XCSI_DT_RAW20:
+		if (!en_csi_v20) {
+			ret = -EINVAL;
+			dev_dbg(core->dev, "enable csi v2 for this pixel format");
+		}
+		break;
+	default:
+		ret = -EINVAL;
+	}
+	if (ret < 0) {
+		dev_err(core->dev, "invalid csi-pxl-format property!\n");
+		return ret;
+	}
+
+	vfb = of_property_read_bool(node, "xlnx,vfb");
+	if (!vfb) {
+		dev_err(core->dev, "failed as VFB is disabled!\n");
+		return -EINVAL;
+	}
+
+	ports = of_get_child_by_name(node, "ports");
+	if (!ports)
+		ports = node;
+
+	nports = 0;
+	for_each_child_of_node(ports, port) {
+		struct device_node *endpoint;
+		struct v4l2_fwnode_endpoint v4lendpoint;
+		int ret;
+
+		if (!port->name || of_node_cmp(port->name, "port"))
+			continue;
+
+		endpoint = of_get_next_child(port, NULL);
+		if (!endpoint) {
+			dev_err(core->dev, "No port at\n");
+			return -EINVAL;
+		}
+
+		/*
+		 * since first port is sink port and it contains
+		 * all info about data-lanes and cfa-pattern,
+		 * don't parse second port but only check if exists
+		 */
+		if (nports == XVIP_PAD_SOURCE) {
+			dev_dbg(core->dev, "no need to parse source port");
+			nports++;
+			of_node_put(endpoint);
+			continue;
+		}
+
+		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
+						 &v4lendpoint);
+		of_node_put(endpoint);
+		if (ret)
+			return ret;
+
+		dev_dbg(core->dev, "%s : port %d bus type = %d\n",
+			__func__, nports, v4lendpoint.bus_type);
+
+		if (v4lendpoint.bus_type == V4L2_MBUS_CSI2_DPHY) {
+			dev_dbg(core->dev, "%s : base.port = %d base.id = %d\n",
+				__func__, v4lendpoint.base.port,
+				v4lendpoint.base.id);
+
+			dev_dbg(core->dev, "%s : mipi number lanes = %d\n",
+				__func__,
+				v4lendpoint.bus.mipi_csi2.num_data_lanes);
+
+			core->max_num_lanes =
+				v4lendpoint.bus.mipi_csi2.num_data_lanes;
+		}
+
+		/* Count the number of ports. */
+		nports++;
+	}
+
+	if (nports != XCSI_MEDIA_PADS) {
+		dev_err(core->dev, "invalid number of ports %u\n", nports);
+		return -EINVAL;
+	}
+
+	/* Register interrupt handler */
+	irq = irq_of_parse_and_map(node, 0);
+	ret = devm_request_irq(core->dev, irq, xcsi2rxss_irq_handler,
+			       IRQF_SHARED, "xilinx-csi2rxss", xcsi2rxss);
+	if (ret) {
+		dev_err(core->dev, "Err = %d Interrupt handler reg failed!\n",
+			ret);
+		return ret;
+	}
+
+	xcsi2rxss_log_ipconfig(xcsi2rxss);
+
+	return 0;
+}
+
+static int xcsi2rxss_probe(struct platform_device *pdev)
+{
+	struct v4l2_subdev *subdev;
+	struct xcsi2rxss_state *xcsi2rxss;
+	struct xcsi2rxss_core *core;
+	struct resource *res;
+	int ret, num_ctrls, i;
+
+	xcsi2rxss = devm_kzalloc(&pdev->dev, sizeof(*xcsi2rxss), GFP_KERNEL);
+	if (!xcsi2rxss)
+		return -ENOMEM;
+
+	core = &xcsi2rxss->core;
+	core->dev = &pdev->dev;
+
+	core->clks = devm_kmemdup(core->dev, xcsi2rxss_clks,
+				  sizeof(xcsi2rxss_clks), GFP_KERNEL);
+	if (!core->clks)
+		return -ENOMEM;
+
+	/* Reset GPIO */
+	core->rst_gpio = devm_gpiod_get_optional(core->dev, "reset",
+						 GPIOD_OUT_HIGH);
+	if (IS_ERR(core->rst_gpio)) {
+		if (PTR_ERR(core->rst_gpio) != -EPROBE_DEFER)
+			dev_err(core->dev, "Video Reset GPIO not setup in DT");
+		return PTR_ERR(core->rst_gpio);
+	}
+
+	mutex_init(&xcsi2rxss->lock);
+
+	ret = xcsi2rxss_parse_of(xcsi2rxss);
+	if (ret < 0)
+		return ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	core->iomem = devm_ioremap_resource(core->dev, res);
+	if (IS_ERR(core->iomem))
+		return PTR_ERR(core->iomem);
+
+	core->num_clks = ARRAY_SIZE(xcsi2rxss_clks);
+
+	ret = clk_bulk_get(core->dev, core->num_clks, core->clks);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(core->num_clks, core->clks);
+	if (ret)
+		goto err_clk_put;
+
+	if (xcsi2rxss->core.rst_gpio) {
+		gpiod_set_value_cansleep(xcsi2rxss->core.rst_gpio, 1);
+		/* minimum of 40 dphy_clk_200M cycles */
+		usleep_range(1, 2);
+		gpiod_set_value_cansleep(xcsi2rxss->core.rst_gpio, 0);
+	}
+
+	xcsi2rxss_reset(core);
+
+	core->events = devm_kzalloc(&pdev->dev, sizeof(xcsi2rxss_events),
+				    GFP_KERNEL);
+	for (i = 0; i < XCSI_NUM_EVENTS; i++) {
+		core->events[i].name = xcsi2rxss_events[i].name;
+		core->events[i].mask = xcsi2rxss_events[i].mask;
+	}
+
+	if (core->en_vcx) {
+		u32 alloc_size;
+
+		alloc_size = sizeof(struct xcsi2rxss_event) *
+			     XCSI_VCX_NUM_EVENTS;
+		core->vcx_events = devm_kzalloc(&pdev->dev, alloc_size,
+						GFP_KERNEL);
+		if (!core->vcx_events) {
+			mutex_destroy(&xcsi2rxss->lock);
+			ret = -ENOMEM;
+			goto err_clk_disable;
+		}
+
+		for (i = 0; i < XCSI_VCX_NUM_EVENTS; i++)
+			core->vcx_events[i].mask = 1 << i;
+	}
+
+	/* Initialize V4L2 subdevice and media entity */
+	xcsi2rxss->pads[XVIP_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	xcsi2rxss->pads[XVIP_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	/* Initialize the default format */
+	xcsi2rxss_set_default_format(xcsi2rxss);
+
+	/* Initialize the mbus formats supported */
+	xcsi2rxss_init_mbus_fmts(xcsi2rxss);
+
+	/* Initialize V4L2 subdevice and media entity */
+	subdev = &xcsi2rxss->subdev;
+	v4l2_subdev_init(subdev, &xcsi2rxss_ops);
+	subdev->dev = &pdev->dev;
+	subdev->internal_ops = &xcsi2rxss_internal_ops;
+	strscpy(subdev->name, dev_name(&pdev->dev), sizeof(subdev->name));
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
+	subdev->entity.ops = &xcsi2rxss_media_ops;
+	v4l2_set_subdevdata(subdev, xcsi2rxss);
+
+	ret = media_entity_pads_init(&subdev->entity, XCSI_MEDIA_PADS,
+				     xcsi2rxss->pads);
+	if (ret < 0)
+		goto error;
+
+	/*
+	 * In case the Enable Active Lanes config parameter is not set,
+	 * dynamic lane reconfiguration is not allowed.
+	 * So V4L2_CID_XILINX_CSI2RX_ACT_LANES ctrl will not be registered.
+	 * Accordingly allocate the number of controls
+	 */
+	num_ctrls = ARRAY_SIZE(xcsi2rxss_ctrls);
+
+	if (!core->enable_active_lanes)
+		num_ctrls--;
+
+	v4l2_ctrl_handler_init(&xcsi2rxss->ctrl_handler, num_ctrls);
+	for (i = 0; i < ARRAY_SIZE(xcsi2rxss_ctrls); i++) {
+		struct v4l2_ctrl *ctrl;
+
+		if (xcsi2rxss_ctrls[i].id ==
+			V4L2_CID_XILINX_CSI2RX_ACT_LANES) {
+			if (!core->enable_active_lanes) {
+				/* Don't register control */
+				dev_dbg(core->dev,
+					"Skip active lane control\n");
+				continue;
+			}
+			xcsi2rxss_ctrls[i].max = core->max_num_lanes;
+			xcsi2rxss_ctrls[i].def = core->max_num_lanes;
+		}
+
+		dev_dbg(core->dev, "%d ctrl = 0x%x\n", i,
+			xcsi2rxss_ctrls[i].id);
+		ctrl = v4l2_ctrl_new_custom(&xcsi2rxss->ctrl_handler,
+					    &xcsi2rxss_ctrls[i], NULL);
+		if (!ctrl) {
+			dev_err(core->dev, "Failed for %s ctrl\n",
+				xcsi2rxss_ctrls[i].name);
+			goto error;
+		}
+	}
+
+	if (xcsi2rxss->ctrl_handler.error) {
+		dev_err(core->dev, "failed to add controls\n");
+		ret = xcsi2rxss->ctrl_handler.error;
+		goto error;
+	}
+
+	subdev->ctrl_handler = &xcsi2rxss->ctrl_handler;
+	ret = v4l2_ctrl_handler_setup(&xcsi2rxss->ctrl_handler);
+	if (ret < 0) {
+		dev_err(core->dev, "failed to set controls\n");
+		goto error;
+	}
+
+	platform_set_drvdata(pdev, xcsi2rxss);
+
+	ret = v4l2_async_register_subdev(subdev);
+	if (ret < 0) {
+		dev_err(core->dev, "failed to register subdev\n");
+		goto error;
+	}
+
+	dev_info(core->dev, "Xilinx CSI2 Rx Subsystem device found!\n");
+
+	return 0;
+error:
+	v4l2_ctrl_handler_free(&xcsi2rxss->ctrl_handler);
+	media_entity_cleanup(&subdev->entity);
+	mutex_destroy(&xcsi2rxss->lock);
+err_clk_disable:
+	clk_bulk_disable_unprepare(core->num_clks, core->clks);
+err_clk_put:
+	clk_bulk_put(core->num_clks, core->clks);
+	return ret;
+}
+
+static int xcsi2rxss_remove(struct platform_device *pdev)
+{
+	struct xcsi2rxss_state *xcsi2rxss = platform_get_drvdata(pdev);
+	struct xcsi2rxss_core *core = &xcsi2rxss->core;
+	struct v4l2_subdev *subdev = &xcsi2rxss->subdev;
+
+	v4l2_async_unregister_subdev(subdev);
+	v4l2_ctrl_handler_free(&xcsi2rxss->ctrl_handler);
+	media_entity_cleanup(&subdev->entity);
+	mutex_destroy(&xcsi2rxss->lock);
+	clk_bulk_disable_unprepare(core->num_clks, core->clks);
+	clk_bulk_put(core->num_clks, core->clks);
+
+	return 0;
+}
+
+static const struct of_device_id xcsi2rxss_of_id_table[] = {
+	{ .compatible = "xlnx,mipi-csi2-rx-subsystem-4.0",},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, xcsi2rxss_of_id_table);
+
+static struct platform_driver xcsi2rxss_driver = {
+	.driver = {
+		.name		= "xilinx-csi2rxss",
+		.of_match_table	= xcsi2rxss_of_id_table,
+	},
+	.probe			= xcsi2rxss_probe,
+	.remove			= xcsi2rxss_remove,
+};
+
+module_platform_driver(xcsi2rxss_driver);
+
+MODULE_AUTHOR("Vishal Sagar <vsagar@xilinx.com>");
+MODULE_DESCRIPTION("Xilinx MIPI CSI2 Rx Subsystem Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index a2669b7..98074f2 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -192,6 +192,10 @@ enum v4l2_colorfx {
  * We reserve 16 controls for this driver. */
 #define V4L2_CID_USER_IMX_BASE			(V4L2_CID_USER_BASE + 0x10b0)
 
+/* The base for the Xilinx MIPI CSI2 Rx Subsystem driver controls.
+ * We reserve 16 controls for this driver. */
+#define V4L2_CID_XILINX_CSI2RX_BASE		(V4L2_CID_USER_BASE + 0x10c0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
diff --git a/include/uapi/linux/xilinx-csi2rxss.h b/include/uapi/linux/xilinx-csi2rxss.h
new file mode 100644
index 0000000..79e2797
--- /dev/null
+++ b/include/uapi/linux/xilinx-csi2rxss.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Xilinx MIPI CSI2 Rx Subsystem events and controls
+ *
+ * Copyright (C) 2019 Xilinx, Inc.
+ *
+ * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
+ *
+ */
+
+#ifndef __XILINX_CSI2RXSS_H__
+#define __XILINX_CSI2RXSS_H__
+
+#include <linux/v4l2-controls.h>
+#include <linux/videodev2.h>
+
+/* Xilinx MIPI CSI2 Rx Subsystem controls */
+
+/* Active Lanes
+ *
+ * This control is used to dynamically set the number of active lanes.
+ * This is present only when the "Enable Active Lanes" is set in design.
+ * It should be called when IP is not streaming.
+ */
+#define V4L2_CID_XILINX_CSI2RX_ACT_LANES	(V4L2_CID_XILINX_CSI2RX_BASE + 1)
+
+/* Reset all event counters
+ *
+ * The driver has counters to keep a track of different events. These counters
+ * can be printed using the log_status. This control is used to reset these
+ * counters.
+ */
+#define V4L2_CID_XILINX_CSI2RX_RESET_COUNTERS	(V4L2_CID_XILINX_CSI2RX_BASE + 2)
+
+/* Xilinx MIPI CSI2 Rx Subsystem events */
+
+/* Base class */
+#define V4L2_EVENT_XILINX_CSI2RX_CLASS	(V4L2_EVENT_PRIVATE_START | 0x200)
+
+/* Stream Line Buffer full event
+ *
+ * This event occurs when the MIPI CSI2 Rx Subsystem's line buffer is full.
+ * This occurs because of back pressure from some downstream IP i.e.
+ * the downstream IP isn't ready to accept data. This is usually due to some
+ * system design issue.
+ *
+ * When this event occurs, application may stop streaming, inform the user
+ * about the issue and exit.
+ */
+#define V4L2_EVENT_XILINX_CSI2RX_SLBF	(V4L2_EVENT_XILINX_CSI2RX_CLASS | 0x1)
+
+#endif /* __XILINX_CSI2RXSS_H__ */
-- 
1.8.3.1


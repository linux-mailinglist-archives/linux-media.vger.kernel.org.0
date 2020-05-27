Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A0B1E44DA
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 15:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389041AbgE0N6D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 09:58:03 -0400
Received: from mail-bn7nam10on2078.outbound.protection.outlook.com ([40.107.92.78]:33248
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388594AbgE0N6B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 09:58:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PljkP330tVPQUGjFBEPkERbLgn9TXYbXY3ulMhgxu5+ZSYnUkLuhOlfDHG9JfwUiAP/Gizx1aVuMrmtQa3IqFJ4CH97Mlrrikn28ojUtIWaF3bZ1HHgP7uBayxznropHlwIZMQgAyJuJyd5DNm2Q3KXrrOJ/FYcBGVzuT9DLCnfY2YnzKf7CQLCFIBT6ZdQjYIFOW0Pz+0vtdJNcBHNnGYRt/ydYNAquzuUbKux/vocCL00Yw3jxW1R5aVYOkrrxGWp7kZKCAOTi20hFkHBvE+W7stadkPUocD28nznKb+ej1izj+npJBIWZRmpiMgI+/OiSVvIaddKJ14yyQiYf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+E40cZctgMgOSk/OoM+ddwemIdva73BxP+5aOuMqrWY=;
 b=iFnN8TCbIP5BtLhji9dVgf1DKrSwxKI1iIkpbFiMNArJo1lBt3CcUJhvacQFa1tWEWCjFk9K8+/LprM6fUpUTPpQKbHcQJaVy3H+5oHFHbaTlh1JZmDV6ZQzM73Zv6AGMg93kBCSxbj2VM/NsNHTBxJ0/Z8+bSGDUaI52wm50JNLa9LbgUgxa6+vyY6xtnfvK3P+9fsotyZ8bqIRSliZgPXjW7n2dqL8wDTmaCHUXWxZNVL+emB2dG4JzJ4vsEauTmx0ZrpWmJ8edK7hil17fPjHD59iM7dmUDDnFjl4rU6wHK4ClxkSrgxhGA0NawQrcJ0givEWcmk1MvP6Uhozew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=jmondi.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+E40cZctgMgOSk/OoM+ddwemIdva73BxP+5aOuMqrWY=;
 b=RNbs9yFw6UiX8WYhumCMiykfco9yPUpRScUaHRUuGepa0tGcKLDDDH0oJa7VrI9FXTankCFzpx8GSImlS6tvEWQren++VcFH6almTHf2lcRbqWINn7clIs/zxpvP2qjXsR0K+GP+zO17V0V4HTc/j9YymitV4B1OEOFnzG/OJxU=
Received: from SN4PR0201CA0064.namprd02.prod.outlook.com
 (2603:10b6:803:20::26) by DM5PR02MB2491.namprd02.prod.outlook.com
 (2603:10b6:3:3c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.26; Wed, 27 May
 2020 13:57:48 +0000
Received: from SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:20:cafe::77) by SN4PR0201CA0064.outlook.office365.com
 (2603:10b6:803:20::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Wed, 27 May 2020 13:57:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT060.mail.protection.outlook.com (10.152.72.192) with Microsoft SMTP
 Server id 15.20.3021.23 via Frontend Transport; Wed, 27 May 2020 13:57:47
 +0000
Received: from [149.199.38.66] (port=35490 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jdwYP-0001of-Ip; Wed, 27 May 2020 06:57:09 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jdwYz-0007RU-UX; Wed, 27 May 2020 06:57:45 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04RDvfQj025262;
        Wed, 27 May 2020 06:57:41 -0700
Received: from [172.23.82.133] (helo=xhdvsagar40x.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jdwYv-0007P3-7r; Wed, 27 May 2020 06:57:41 -0700
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
Subject: [PATCH v14 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem driver
Date:   Wed, 27 May 2020 19:27:19 +0530
Message-Id: <1590587839-129558-3-git-send-email-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1590587839-129558-1-git-send-email-vishal.sagar@xilinx.com>
References: <1590587839-129558-1-git-send-email-vishal.sagar@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(396003)(39860400002)(346002)(376002)(136003)(46966005)(36756003)(8936002)(70206006)(110136005)(47076004)(7416002)(7696005)(82740400003)(6666004)(30864003)(26005)(186003)(5660300002)(316002)(2906002)(356005)(82310400002)(426003)(70586007)(2616005)(336012)(9786002)(8676002)(81166007)(44832011)(4326008)(83380400001)(478600001)(107886003)(921003)(579004);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 61b88029-048d-4ff8-1e48-08d80245effa
X-MS-TrafficTypeDiagnostic: DM5PR02MB2491:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2491D893F1E0BE18CF811622A7B10@DM5PR02MB2491.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:163;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 07Ri1bx1PdPbFW4G6OvwwIhF5Lb/ELkPtjNtEgBKaR1TCWdgkmREKZZrpqHI1dAuGXqq4YwH/Xqx/tBQkFyYZmC9Y/B5APu/n5E+Rjgr55ol4rLGFVrhhT7GWG30tFxpIFSCCqmG/TJNRmWP26d27CQjJpQTklzjIRGj8VQwM8rLKock+OHjyjDjplD/sPNsHIujL0iTSLCaLhaLjVlI2Fwc+sZe1rzZh3qOPT/CN9czU4DSjEURl8UMu0spX3RlxneqwjdHIfniv/IiTxQ+siaS+VzswAZyrIrBGkKA2fyzm9rtoAjA06pZJjGvO2It+k74SUcN6cXZJYKQzcXuovwTSmSKS3yia3bL/A3R9ZHqM9Xbh/RMIvbb8Wjx0Yfe01NOqOwOzZAn5+/ycoGuhceew7kriN47yozQDqRCtfc=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 13:57:47.4820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b88029-048d-4ff8-1e48-08d80245effa
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2491
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Xilinx MIPI CSI-2 Rx Subsystem soft IP is used to capture images
from MIPI CSI-2 camera sensors and output AXI4-Stream video data ready
for image processing. Please refer to PG232 for details.

The CSI2 Rx controller filters out all packets except for the packets
with data type fixed in hardware. RAW8 packets are always allowed to
pass through.

It is also used to setup and handle interrupts and enable the core. It
logs all the events in respective counters between streaming on and off.

The driver supports only the video format bridge enabled configuration.
Some data types like YUV 422 10bpc, RAW16, RAW20 are supported when the
CSI v2.0 feature is enabled in design. When the VCX feature is enabled,
the maximum number of virtual channels becomes 16 from 4.

Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---
v14
 - Fixed condition to check ret in xcsi2rxss_start_stream
 - Use BIT(i) instead of (1 << i)
 - Moved "only sink pad format can be updated" in xcsi2rxss_set_format
 - Added Reviewed by Luca Ceresoli
 - Replace "tr" and "fa" to "true" and "false" in xcsi2rxss_log_status
 - Remove setting streaming state to false in SLBF case. The app should
   stop the streaming in case of SLBF.
 - Made xcsi2rxss_enum_mbus_code() static as reported by kbuild bot
 - Added Reviewed by Laurent

v13
- Based on Laurent's suggestions
- Removed unnecessary debug statement for vep
- Added TODO for clock to enable disable at streamon/off
- Fix for index to start from 0 for get_nth_mbus_format
- Removed macro XCSI_TIMEOUT_VAL
- Remove ndelay from hard reset
- Remove hard reset from irq handler
- Fix short packet fifo clear
- Add TODO for v4l2_subdev_notify for SLBF error
- Fix the enable condition in s_stream
- Fix condition in xcsi2rxss_set_format
- Fix enum_mbus_code for double enumeration of RAW8 Data type
- Removed core struct
- Added reviewed by Laurent

v12
- Changes done as suggested by Laurent Pinchart and Luca Ceresoli
- Removed unused macros
- No local storage of supported formats
- Dropped init mbus fmts and removed xcsi2rxss_init_mbus_fmts()
- XCSI_GET_BITSET_STR removed
- Add data type and mbus LUT
  - Added xcsi2rxss_get_nth_mbus() and xcsi2rxss_get_dt()
- Replaced all core->dev with dev in dev_dbg() and related debug prints
- Replaced xcsi2rxss_log_ipconfig() with single line
- Removed small functions to enable/disable interrupts and core
- Now save remote subdev in state struct before streaming on
- Made xcsi2rxss_reset as soft_reset()
- Added hard reset using video-reset gpio
  - 2 modes one with delay and another sleep
- Instead of reset-gpios it is not video-reset-gpios
- In irq handler
  - Moved clearing of ISR up
  - Dump / empty short packet fifo
  - Irq handler is now threaded 
- Added init_cfg pad ops and removed open()
- Updated xcsi2rxss_set_format(), xcsi2rxss_enum_mbus_code() to use the dt mbus lut
- xcsi2rxss_set_default_format() updated
- Moved mutex_init()
- Updated graph handling
- Removed unnecessary prints
- Use devm_platform_ioremap_resource() and platform_get_irq()
- Update KConfig description

v11
- Fixed changes as suggested by Sakari Ailus
- Removed VIDEO_XILINX from KConfig
- Minor formatting
- Start / Stop upstream sub-device in xcsi2rxss_start_stream()
  and xcsi2rxss_stop_stream()
- Added v4l2_subdev_link_validate_default() in v4l2_subdev_pad_ops()
- Use fwnode_graph_get_endpoint_by_id() instead of parsing by self
- Set bus type as V4L2_MBUS_CSI2_DPHY in struct v4l2_fwnode_endpoint
- Remove num_clks from core. Instead use ARRAY_SIZE()
- Fixed SPDX header to GPL-2.0
- Update copyright year to 2020

v10
- Removed all V4L2 controls and events based on Sakari's comments.
- Now stop_stream() before toggling rst_gpio
- Updated init_mbus() to throw error on array out of bound access
- Make events and vcx_events as counters instead of structures
- Minor fixes in set_format() enum_mbus_code() as suggested by Sakari

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

 drivers/media/platform/xilinx/Kconfig           |    7 +
 drivers/media/platform/xilinx/Makefile          |    1 +
 drivers/media/platform/xilinx/xilinx-csi2rxss.c | 1111 +++++++++++++++++++++++
 3 files changed, 1119 insertions(+)
 create mode 100644 drivers/media/platform/xilinx/xilinx-csi2rxss.c

diff --git a/drivers/media/platform/xilinx/Kconfig b/drivers/media/platform/xilinx/Kconfig
index 01c96fb..44587dc 100644
--- a/drivers/media/platform/xilinx/Kconfig
+++ b/drivers/media/platform/xilinx/Kconfig
@@ -12,6 +12,13 @@ config VIDEO_XILINX
 
 if VIDEO_XILINX
 
+config VIDEO_XILINX_CSI2RXSS
+	tristate "Xilinx CSI-2 Rx Subsystem"
+	help
+	  Driver for Xilinx MIPI CSI-2 Rx Subsystem. This is a V4L sub-device
+	  based driver that takes input from CSI-2 Tx source and converts
+	  it into an AXI4-Stream.
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
index 0000000..fff7dde
--- /dev/null
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -0,0 +1,1111 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Xilinx MIPI CSI-2 Rx Subsystem
+ *
+ * Copyright (C) 2016 - 2020 Xilinx, Inc.
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
+#include <media/media-entity.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
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
+#define XCSI_ISR_ALLINTR_MASK	(0xc07e3fff)
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
+#define XCSI_SPKT_FIFO_DEPTH	31
+
+#define XCSI_VCXR_OFFSET	0x34
+#define XCSI_VCXR_VCERR		GENMASK(23, 0)
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
+ * Sink pad connected to sensor source pad.
+ * Source pad connected to next module like demosaic.
+ */
+#define XCSI_MEDIA_PADS		2
+#define XCSI_DEFAULT_WIDTH	1920
+#define XCSI_DEFAULT_HEIGHT	1080
+
+/* MIPI CSI-2 Data Types from spec */
+#define XCSI_DT_YUV4228B	0x1e
+#define XCSI_DT_YUV42210B	0x1f
+#define XCSI_DT_RGB444		0x20
+#define XCSI_DT_RGB555		0x21
+#define XCSI_DT_RGB565		0x22
+#define XCSI_DT_RGB666		0x23
+#define XCSI_DT_RGB888		0x24
+#define XCSI_DT_RAW6		0x28
+#define XCSI_DT_RAW7		0x29
+#define XCSI_DT_RAW8		0x2a
+#define XCSI_DT_RAW10		0x2b
+#define XCSI_DT_RAW12		0x2c
+#define XCSI_DT_RAW14		0x2d
+#define XCSI_DT_RAW16		0x2e
+#define XCSI_DT_RAW20		0x2f
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
+/**
+ * struct xcsi2rxss_event - Event log structure
+ * @mask: Event mask
+ * @name: Name of the event
+ */
+struct xcsi2rxss_event {
+	u32 mask;
+	const char *name;
+};
+
+static const struct xcsi2rxss_event xcsi2rxss_events[] = {
+	{ XCSI_ISR_FR, "Frame Received" },
+	{ XCSI_ISR_VCXFE, "VCX Frame Errors" },
+	{ XCSI_ISR_WCC, "Word Count Errors" },
+	{ XCSI_ISR_ILC, "Invalid Lane Count Error" },
+	{ XCSI_ISR_SPFIFOF, "Short Packet FIFO OverFlow Error" },
+	{ XCSI_ISR_SPFIFONE, "Short Packet FIFO Not Empty" },
+	{ XCSI_ISR_SLBF, "Streamline Buffer Full Error" },
+	{ XCSI_ISR_STOP, "Lane Stop State" },
+	{ XCSI_ISR_SOTERR, "SOT Error" },
+	{ XCSI_ISR_SOTSYNCERR, "SOT Sync Error" },
+	{ XCSI_ISR_ECC2BERR, "2 Bit ECC Unrecoverable Error" },
+	{ XCSI_ISR_ECC1BERR, "1 Bit ECC Recoverable Error" },
+	{ XCSI_ISR_CRCERR, "CRC Error" },
+	{ XCSI_ISR_DATAIDERR, "Data Id Error" },
+	{ XCSI_ISR_VC3FSYNCERR, "Virtual Channel 3 Frame Sync Error" },
+	{ XCSI_ISR_VC3FLVLERR, "Virtual Channel 3 Frame Level Error" },
+	{ XCSI_ISR_VC2FSYNCERR, "Virtual Channel 2 Frame Sync Error" },
+	{ XCSI_ISR_VC2FLVLERR, "Virtual Channel 2 Frame Level Error" },
+	{ XCSI_ISR_VC1FSYNCERR, "Virtual Channel 1 Frame Sync Error" },
+	{ XCSI_ISR_VC1FLVLERR, "Virtual Channel 1 Frame Level Error" },
+	{ XCSI_ISR_VC0FSYNCERR, "Virtual Channel 0 Frame Sync Error" },
+	{ XCSI_ISR_VC0FLVLERR, "Virtual Channel 0 Frame Level Error" }
+};
+
+#define XCSI_NUM_EVENTS		ARRAY_SIZE(xcsi2rxss_events)
+
+/*
+ * This table provides a mapping between CSI-2 Data type
+ * and media bus formats
+ */
+static const u32 xcsi2dt_mbus_lut[][2] = {
+	{ XCSI_DT_YUV4228B, MEDIA_BUS_FMT_UYVY8_1X16 },
+	{ XCSI_DT_YUV42210B, MEDIA_BUS_FMT_UYVY10_1X20 },
+	{ XCSI_DT_RGB444, 0 },
+	{ XCSI_DT_RGB555, 0 },
+	{ XCSI_DT_RGB565, 0 },
+	{ XCSI_DT_RGB666, 0 },
+	{ XCSI_DT_RGB888, MEDIA_BUS_FMT_RBG888_1X24 },
+	{ XCSI_DT_RAW6, 0 },
+	{ XCSI_DT_RAW7, 0 },
+	{ XCSI_DT_RAW8, MEDIA_BUS_FMT_SRGGB8_1X8 },
+	{ XCSI_DT_RAW8, MEDIA_BUS_FMT_SBGGR8_1X8 },
+	{ XCSI_DT_RAW8, MEDIA_BUS_FMT_SGBRG8_1X8 },
+	{ XCSI_DT_RAW8, MEDIA_BUS_FMT_SGRBG8_1X8 },
+	{ XCSI_DT_RAW10, MEDIA_BUS_FMT_SRGGB10_1X10 },
+	{ XCSI_DT_RAW10, MEDIA_BUS_FMT_SBGGR10_1X10 },
+	{ XCSI_DT_RAW10, MEDIA_BUS_FMT_SGBRG10_1X10 },
+	{ XCSI_DT_RAW10, MEDIA_BUS_FMT_SGRBG10_1X10 },
+	{ XCSI_DT_RAW12, MEDIA_BUS_FMT_SRGGB12_1X12 },
+	{ XCSI_DT_RAW12, MEDIA_BUS_FMT_SBGGR12_1X12 },
+	{ XCSI_DT_RAW12, MEDIA_BUS_FMT_SGBRG12_1X12 },
+	{ XCSI_DT_RAW12, MEDIA_BUS_FMT_SGRBG12_1X12 },
+	{ XCSI_DT_RAW16, MEDIA_BUS_FMT_SRGGB16_1X16 },
+	{ XCSI_DT_RAW16, MEDIA_BUS_FMT_SBGGR16_1X16 },
+	{ XCSI_DT_RAW16, MEDIA_BUS_FMT_SGBRG16_1X16 },
+	{ XCSI_DT_RAW16, MEDIA_BUS_FMT_SGRBG16_1X16 },
+	{ XCSI_DT_RAW20, 0 },
+};
+
+/**
+ * struct xcsi2rxss_state - CSI-2 Rx Subsystem device structure
+ * @subdev: The v4l2 subdev structure
+ * @format: Active V4L2 formats on each pad
+ * @default_format: Default V4L2 format
+ * @events: counter for events
+ * @vcx_events: counter for vcx_events
+ * @dev: Platform structure
+ * @rsubdev: Remote subdev connected to sink pad
+ * @rst_gpio: reset to video_aresetn
+ * @clks: array of clocks
+ * @iomem: Base address of subsystem
+ * @max_num_lanes: Maximum number of lanes present
+ * @datatype: Data type filter
+ * @lock: mutex for accessing this structure
+ * @pads: media pads
+ * @streaming: Flag for storing streaming state
+ * @enable_active_lanes: If number of active lanes can be modified
+ * @en_vcx: If more than 4 VC are enabled
+ *
+ * This structure contains the device driver related parameters
+ */
+struct xcsi2rxss_state {
+	struct v4l2_subdev subdev;
+	struct v4l2_mbus_framefmt format;
+	struct v4l2_mbus_framefmt default_format;
+	u32 events[XCSI_NUM_EVENTS];
+	u32 vcx_events[XCSI_VCX_NUM_EVENTS];
+	struct device *dev;
+	struct v4l2_subdev *rsubdev;
+	struct gpio_desc *rst_gpio;
+	struct clk_bulk_data *clks;
+	void __iomem *iomem;
+	u32 max_num_lanes;
+	u32 datatype;
+	/* used to protect access to this struct */
+	struct mutex lock;
+	struct media_pad pads[XCSI_MEDIA_PADS];
+	bool streaming;
+	bool enable_active_lanes;
+	bool en_vcx;
+};
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
+static inline u32 xcsi2rxss_read(struct xcsi2rxss_state *xcsi2rxss, u32 addr)
+{
+	return ioread32(xcsi2rxss->iomem + addr);
+}
+
+static inline void xcsi2rxss_write(struct xcsi2rxss_state *xcsi2rxss, u32 addr,
+				   u32 value)
+{
+	iowrite32(value, xcsi2rxss->iomem + addr);
+}
+
+static inline void xcsi2rxss_clr(struct xcsi2rxss_state *xcsi2rxss, u32 addr,
+				 u32 clr)
+{
+	xcsi2rxss_write(xcsi2rxss, addr,
+			xcsi2rxss_read(xcsi2rxss, addr) & ~clr);
+}
+
+static inline void xcsi2rxss_set(struct xcsi2rxss_state *xcsi2rxss, u32 addr,
+				 u32 set)
+{
+	xcsi2rxss_write(xcsi2rxss, addr, xcsi2rxss_read(xcsi2rxss, addr) | set);
+}
+
+/*
+ * This function returns the nth mbus for a data type.
+ * In case of error, mbus code returned is 0.
+ */
+static u32 xcsi2rxss_get_nth_mbus(u32 dt, u32 n)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(xcsi2dt_mbus_lut); i++) {
+		if (xcsi2dt_mbus_lut[i][0] == dt) {
+			if (n-- == 0)
+				return xcsi2dt_mbus_lut[i][1];
+		}
+	}
+
+	return 0;
+}
+
+/* This returns the data type for a media bus format else 0 */
+static u32 xcsi2rxss_get_dt(u32 mbus)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(xcsi2dt_mbus_lut); i++) {
+		if (xcsi2dt_mbus_lut[i][1] == mbus)
+			return xcsi2dt_mbus_lut[i][0];
+	}
+
+	return 0;
+}
+
+/**
+ * xcsi2rxss_soft_reset - Does a soft reset of the MIPI CSI-2 Rx Subsystem
+ * @state: Xilinx CSI-2 Rx Subsystem structure pointer
+ *
+ * Core takes less than 100 video clock cycles to reset.
+ * So a larger timeout value is chosen for margin.
+ *
+ * Return: 0 - on success OR -ETIME if reset times out
+ */
+static int xcsi2rxss_soft_reset(struct xcsi2rxss_state *state)
+{
+	u32 timeout = 1000; /* us */
+
+	xcsi2rxss_set(state, XCSI_CCR_OFFSET, XCSI_CCR_SOFTRESET);
+
+	while (xcsi2rxss_read(state, XCSI_CSR_OFFSET) & XCSI_CSR_RIPCD) {
+		if (timeout == 0) {
+			dev_err(state->dev, "soft reset timed out!\n");
+			return -ETIME;
+		}
+
+		timeout--;
+		udelay(1);
+	}
+
+	xcsi2rxss_clr(state, XCSI_CCR_OFFSET, XCSI_CCR_SOFTRESET);
+	return 0;
+}
+
+static void xcsi2rxss_hard_reset(struct xcsi2rxss_state *state)
+{
+	if (!state->rst_gpio)
+		return;
+
+	/* minimum of 40 dphy_clk_200M cycles */
+	gpiod_set_value_cansleep(state->rst_gpio, 1);
+	usleep_range(1, 2);
+	gpiod_set_value_cansleep(state->rst_gpio, 0);
+}
+
+static void xcsi2rxss_reset_event_counters(struct xcsi2rxss_state *state)
+{
+	unsigned int i;
+
+	for (i = 0; i < XCSI_NUM_EVENTS; i++)
+		state->events[i] = 0;
+
+	for (i = 0; i < XCSI_VCX_NUM_EVENTS; i++)
+		state->vcx_events[i] = 0;
+}
+
+/* Print event counters */
+static void xcsi2rxss_log_counters(struct xcsi2rxss_state *state)
+{
+	struct device *dev = state->dev;
+	unsigned int i;
+
+	for (i = 0; i < XCSI_NUM_EVENTS; i++) {
+		if (state->events[i] > 0) {
+			dev_info(dev, "%s events: %d\n",
+				 xcsi2rxss_events[i].name,
+				 state->events[i]);
+		}
+	}
+
+	if (state->en_vcx) {
+		for (i = 0; i < XCSI_VCX_NUM_EVENTS; i++) {
+			if (state->vcx_events[i] > 0) {
+				dev_info(dev,
+					 "VC %d Frame %s err vcx events: %d\n",
+					 (i / 2) + XCSI_VCX_START,
+					 i & 1 ? "Sync" : "Level",
+					 state->vcx_events[i]);
+			}
+		}
+	}
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
+	struct device *dev = xcsi2rxss->dev;
+	u32 reg, data;
+	unsigned int i, max_vc;
+
+	mutex_lock(&xcsi2rxss->lock);
+
+	xcsi2rxss_log_counters(xcsi2rxss);
+
+	dev_info(dev, "***** Core Status *****\n");
+	data = xcsi2rxss_read(xcsi2rxss, XCSI_CSR_OFFSET);
+	dev_info(dev, "Short Packet FIFO Full = %s\n",
+		 data & XCSI_CSR_SPFIFOFULL ? "true" : "false");
+	dev_info(dev, "Short Packet FIFO Not Empty = %s\n",
+		 data & XCSI_CSR_SPFIFONE ? "true" : "false");
+	dev_info(dev, "Stream line buffer full = %s\n",
+		 data & XCSI_CSR_SLBF ? "true" : "false");
+	dev_info(dev, "Soft reset/Core disable in progress = %s\n",
+		 data & XCSI_CSR_RIPCD ? "true" : "false");
+
+	/* Clk & Lane Info  */
+	dev_info(dev, "******** Clock Lane Info *********\n");
+	data = xcsi2rxss_read(xcsi2rxss, XCSI_CLKINFR_OFFSET);
+	dev_info(dev, "Clock Lane in Stop State = %s\n",
+		 data & XCSI_CLKINFR_STOP ? "true" : "false");
+
+	dev_info(dev, "******** Data Lane Info *********\n");
+	dev_info(dev, "Lane\tSoT Error\tSoT Sync Error\tStop State\n");
+	reg = XCSI_DLXINFR_OFFSET;
+	for (i = 0; i < XCSI_MAXDL_COUNT; i++) {
+		data = xcsi2rxss_read(xcsi2rxss, reg);
+
+		dev_info(dev, "%d\t%s\t\t%s\t\t%s\n", i,
+			 data & XCSI_DLXINFR_SOTERR ? "true" : "false",
+			 data & XCSI_DLXINFR_SOTSYNCERR ? "true" : "false",
+			 data & XCSI_DLXINFR_STOP ? "true" : "false");
+
+		reg += XCSI_NEXTREG_OFFSET;
+	}
+
+	/* Virtual Channel Image Information */
+	dev_info(dev, "********** Virtual Channel Info ************\n");
+	dev_info(dev, "VC\tLine Count\tByte Count\tData Type\n");
+	if (xcsi2rxss->en_vcx)
+		max_vc = XCSI_MAX_VCX;
+	else
+		max_vc = XCSI_MAX_VC;
+
+	reg = XCSI_VCXINF1R_OFFSET;
+	for (i = 0; i < max_vc; i++) {
+		u32 line_count, byte_count, data_type;
+
+		/* Get line and byte count from VCXINFR1 Register */
+		data = xcsi2rxss_read(xcsi2rxss, reg);
+		byte_count = data & XCSI_VCXINF1R_BYTECOUNT;
+		line_count = data & XCSI_VCXINF1R_LINECOUNT;
+		line_count >>= XCSI_VCXINF1R_LINECOUNT_SHIFT;
+
+		/* Get data type from VCXINFR2 Register */
+		reg += XCSI_NEXTREG_OFFSET;
+		data = xcsi2rxss_read(xcsi2rxss, reg);
+		data_type = data & XCSI_VCXINF2R_DT;
+
+		dev_info(dev, "%d\t%d\t\t%d\t\t0x%x\n", i, line_count,
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
+static struct v4l2_subdev *xcsi2rxss_get_remote_subdev(struct media_pad *local)
+{
+	struct media_pad *remote;
+
+	remote = media_entity_remote_pad(local);
+	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
+		return NULL;
+
+	return media_entity_to_v4l2_subdev(remote->entity);
+}
+
+static int xcsi2rxss_start_stream(struct xcsi2rxss_state *state)
+{
+	int ret = 0;
+
+	/* enable core */
+	xcsi2rxss_set(state, XCSI_CCR_OFFSET, XCSI_CCR_ENABLE);
+
+	ret = xcsi2rxss_soft_reset(state);
+	if (ret) {
+		state->streaming = false;
+		return ret;
+	}
+
+	/* enable interrupts */
+	xcsi2rxss_clr(state, XCSI_GIER_OFFSET, XCSI_GIER_GIE);
+	xcsi2rxss_write(state, XCSI_IER_OFFSET, XCSI_IER_INTR_MASK);
+	xcsi2rxss_set(state, XCSI_GIER_OFFSET, XCSI_GIER_GIE);
+
+	state->streaming = true;
+
+	state->rsubdev =
+		xcsi2rxss_get_remote_subdev(&state->pads[XVIP_PAD_SINK]);
+
+	ret = v4l2_subdev_call(state->rsubdev, video, s_stream, 1);
+	if (ret) {
+		/* disable interrupts */
+		xcsi2rxss_clr(state, XCSI_IER_OFFSET, XCSI_IER_INTR_MASK);
+		xcsi2rxss_clr(state, XCSI_GIER_OFFSET, XCSI_GIER_GIE);
+
+		/* disable core */
+		xcsi2rxss_clr(state, XCSI_CCR_OFFSET, XCSI_CCR_ENABLE);
+		state->streaming = false;
+	}
+
+	return ret;
+}
+
+static void xcsi2rxss_stop_stream(struct xcsi2rxss_state *state)
+{
+	v4l2_subdev_call(state->rsubdev, video, s_stream, 0);
+
+	/* disable interrupts */
+	xcsi2rxss_clr(state, XCSI_IER_OFFSET, XCSI_IER_INTR_MASK);
+	xcsi2rxss_clr(state, XCSI_GIER_OFFSET, XCSI_GIER_GIE);
+
+	/* disable core */
+	xcsi2rxss_clr(state, XCSI_CCR_OFFSET, XCSI_CCR_ENABLE);
+	state->streaming = false;
+}
+
+/**
+ * xcsi2rxss_irq_handler - Interrupt handler for CSI-2
+ * @irq: IRQ number
+ * @data: Pointer to device state
+ *
+ * In the interrupt handler, a list of event counters are updated for
+ * corresponding interrupts. This is useful to get status / debug.
+ *
+ * Return: IRQ_HANDLED after handling interrupts
+ */
+static irqreturn_t xcsi2rxss_irq_handler(int irq, void *data)
+{
+	struct xcsi2rxss_state *state = (struct xcsi2rxss_state *)data;
+	struct device *dev = state->dev;
+	u32 status;
+
+	status = xcsi2rxss_read(state, XCSI_ISR_OFFSET) & XCSI_ISR_ALLINTR_MASK;
+	xcsi2rxss_write(state, XCSI_ISR_OFFSET, status);
+
+	/* Received a short packet */
+	if (status & XCSI_ISR_SPFIFONE) {
+		u32 count = 0;
+
+		/*
+		 * Drain generic short packet FIFO by reading max 31
+		 * (fifo depth) short packets from fifo or till fifo is empty.
+		 */
+		for (count = 0; count < XCSI_SPKT_FIFO_DEPTH; ++count) {
+			u32 spfifostat, spkt;
+
+			spkt = xcsi2rxss_read(state, XCSI_SPKTR_OFFSET);
+			dev_dbg(dev, "Short packet = 0x%08x\n", spkt);
+			spfifostat = xcsi2rxss_read(state, XCSI_ISR_OFFSET);
+			spfifostat &= XCSI_ISR_SPFIFONE;
+			if (!spfifostat)
+				break;
+			xcsi2rxss_write(state, XCSI_ISR_OFFSET, spfifostat);
+		}
+	}
+
+	/* Short packet FIFO overflow */
+	if (status & XCSI_ISR_SPFIFOF)
+		dev_dbg_ratelimited(dev, "Short packet FIFO overflowed\n");
+
+	/*
+	 * Stream line buffer full
+	 * This means there is a backpressure from downstream IP
+	 */
+	if (status & XCSI_ISR_SLBF) {
+		dev_alert_ratelimited(dev, "Stream Line Buffer Full!\n");
+
+		/* disable interrupts */
+		xcsi2rxss_clr(state, XCSI_IER_OFFSET, XCSI_IER_INTR_MASK);
+		xcsi2rxss_clr(state, XCSI_GIER_OFFSET, XCSI_GIER_GIE);
+
+		/* disable core */
+		xcsi2rxss_clr(state, XCSI_CCR_OFFSET, XCSI_CCR_ENABLE);
+
+		/*
+		 * The IP needs to be hard reset before it can be used now.
+		 * This will be done in streamoff.
+		 */
+
+		/*
+		 * TODO: Notify the whole pipeline with v4l2_subdev_notify() to
+		 * inform userspace.
+		 */
+	}
+
+	/* Increment event counters */
+	if (status & XCSI_ISR_ALLINTR_MASK) {
+		unsigned int i;
+
+		for (i = 0; i < XCSI_NUM_EVENTS; i++) {
+			if (!(status & xcsi2rxss_events[i].mask))
+				continue;
+			state->events[i]++;
+			dev_dbg_ratelimited(dev, "%s: %u\n",
+					    xcsi2rxss_events[i].name,
+					    state->events[i]);
+		}
+
+		if (status & XCSI_ISR_VCXFE && state->en_vcx) {
+			u32 vcxstatus;
+
+			vcxstatus = xcsi2rxss_read(state, XCSI_VCXR_OFFSET);
+			vcxstatus &= XCSI_VCXR_VCERR;
+			for (i = 0; i < XCSI_VCX_NUM_EVENTS; i++) {
+				if (!(vcxstatus & BIT(i)))
+					continue;
+				state->vcx_events[i]++;
+			}
+			xcsi2rxss_write(state, XCSI_VCXR_OFFSET, vcxstatus);
+		}
+	}
+
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
+	if (enable == xcsi2rxss->streaming)
+		goto stream_done;
+
+	if (enable) {
+		xcsi2rxss_reset_event_counters(xcsi2rxss);
+		ret = xcsi2rxss_start_stream(xcsi2rxss);
+	} else {
+		xcsi2rxss_stop_stream(xcsi2rxss);
+		xcsi2rxss_hard_reset(xcsi2rxss);
+	}
+
+stream_done:
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
+ * xcsi2rxss_init_cfg - Initialise the pad format config to default
+ * @sd: Pointer to V4L2 Sub device structure
+ * @cfg: Pointer to sub device pad information structure
+ *
+ * This function is used to initialize the pad format with the default
+ * values.
+ *
+ * Return: 0 on success
+ */
+static int xcsi2rxss_init_cfg(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_pad_config *cfg)
+{
+	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
+	struct v4l2_mbus_framefmt *format;
+	unsigned int i;
+
+	mutex_lock(&xcsi2rxss->lock);
+	for (i = 0; i < XCSI_MEDIA_PADS; i++) {
+		format = v4l2_subdev_get_try_format(sd, cfg, i);
+		*format = xcsi2rxss->default_format;
+	}
+	mutex_unlock(&xcsi2rxss->lock);
+
+	return 0;
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
+	struct v4l2_mbus_framefmt *__format;
+	u32 dt;
+
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
+	/* only sink pad format can be updated */
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
+	dt = xcsi2rxss_get_dt(fmt->format.code);
+	if (dt != xcsi2rxss->datatype && dt != XCSI_DT_RAW8) {
+		dev_dbg(xcsi2rxss->dev, "Unsupported media bus format");
+		/* set the default format for the data type */
+		fmt->format.code = xcsi2rxss_get_nth_mbus(xcsi2rxss->datatype,
+							  0);
+	}
+
+	*__format = fmt->format;
+	mutex_unlock(&xcsi2rxss->lock);
+
+	return 0;
+}
+
+/*
+ * xcsi2rxss_enum_mbus_code - Handle pixel format enumeration
+ * @sd: pointer to v4l2 subdev structure
+ * @cfg: V4L2 subdev pad configuration
+ * @code: pointer to v4l2_subdev_mbus_code_enum structure
+ *
+ * Return: -EINVAL or zero on success
+ */
+static int xcsi2rxss_enum_mbus_code(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct xcsi2rxss_state *state = to_xcsi2rxssstate(sd);
+	u32 dt, n;
+	int ret = 0;
+
+	/* RAW8 dt packets are available in all DT configurations */
+	if (code->index < 4) {
+		n = code->index;
+		dt = XCSI_DT_RAW8;
+	} else if (state->datatype != XCSI_DT_RAW8) {
+		n = code->index - 4;
+		dt = state->datatype;
+	} else {
+		return -EINVAL;
+	}
+
+	code->code = xcsi2rxss_get_nth_mbus(dt, n);
+	if (!code->code)
+		ret = -EINVAL;
+
+	return ret;
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
+static const struct v4l2_subdev_core_ops xcsi2rxss_core_ops = {
+	.log_status = xcsi2rxss_log_status,
+};
+
+static const struct v4l2_subdev_video_ops xcsi2rxss_video_ops = {
+	.s_stream = xcsi2rxss_s_stream
+};
+
+static const struct v4l2_subdev_pad_ops xcsi2rxss_pad_ops = {
+	.init_cfg = xcsi2rxss_init_cfg,
+	.get_fmt = xcsi2rxss_get_format,
+	.set_fmt = xcsi2rxss_set_format,
+	.enum_mbus_code = xcsi2rxss_enum_mbus_code,
+	.link_validate = v4l2_subdev_link_validate_default,
+};
+
+static const struct v4l2_subdev_ops xcsi2rxss_ops = {
+	.core = &xcsi2rxss_core_ops,
+	.video = &xcsi2rxss_video_ops,
+	.pad = &xcsi2rxss_pad_ops
+};
+
+static int xcsi2rxss_parse_of(struct xcsi2rxss_state *xcsi2rxss)
+{
+	struct device *dev = xcsi2rxss->dev;
+	struct device_node *node = dev->of_node;
+
+	struct fwnode_handle *ep;
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	bool en_csi_v20, vfb;
+	int ret;
+
+	en_csi_v20 = of_property_read_bool(node, "xlnx,en-csi-v2-0");
+	if (en_csi_v20)
+		xcsi2rxss->en_vcx = of_property_read_bool(node, "xlnx,en-vcx");
+
+	xcsi2rxss->enable_active_lanes =
+		of_property_read_bool(node, "xlnx,en-active-lanes");
+
+	ret = of_property_read_u32(node, "xlnx,csi-pxl-format",
+				   &xcsi2rxss->datatype);
+	if (ret < 0) {
+		dev_err(dev, "missing xlnx,csi-pxl-format property\n");
+		return ret;
+	}
+
+	switch (xcsi2rxss->datatype) {
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
+			dev_dbg(dev, "enable csi v2 for this pixel format");
+		}
+		break;
+	default:
+		ret = -EINVAL;
+	}
+	if (ret < 0) {
+		dev_err(dev, "invalid csi-pxl-format property!\n");
+		return ret;
+	}
+
+	vfb = of_property_read_bool(node, "xlnx,vfb");
+	if (!vfb) {
+		dev_err(dev, "operation without VFB is not supported\n");
+		return -EINVAL;
+	}
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+					     XVIP_PAD_SINK, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep) {
+		dev_err(dev, "no sink port found");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	fwnode_handle_put(ep);
+	if (ret) {
+		dev_err(dev, "error parsing sink port");
+		return ret;
+	}
+
+	dev_dbg(dev, "mipi number lanes = %d\n",
+		vep.bus.mipi_csi2.num_data_lanes);
+
+	xcsi2rxss->max_num_lanes = vep.bus.mipi_csi2.num_data_lanes;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+					     XVIP_PAD_SOURCE, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep) {
+		dev_err(dev, "no source port found");
+		return -EINVAL;
+	}
+
+	fwnode_handle_put(ep);
+
+	dev_dbg(dev, "vcx %s, %u data lanes (%s), data type 0x%02x\n",
+		xcsi2rxss->en_vcx ? "enabled" : "disabled",
+		xcsi2rxss->max_num_lanes,
+		xcsi2rxss->enable_active_lanes ? "dynamic" : "static",
+		xcsi2rxss->datatype);
+
+	return 0;
+}
+
+static int xcsi2rxss_probe(struct platform_device *pdev)
+{
+	struct v4l2_subdev *subdev;
+	struct xcsi2rxss_state *xcsi2rxss;
+	int num_clks = ARRAY_SIZE(xcsi2rxss_clks);
+	struct device *dev = &pdev->dev;
+	int irq, ret;
+
+	xcsi2rxss = devm_kzalloc(dev, sizeof(*xcsi2rxss), GFP_KERNEL);
+	if (!xcsi2rxss)
+		return -ENOMEM;
+
+	xcsi2rxss->dev = dev;
+
+	xcsi2rxss->clks = devm_kmemdup(dev, xcsi2rxss_clks,
+				       sizeof(xcsi2rxss_clks), GFP_KERNEL);
+	if (!xcsi2rxss->clks)
+		return -ENOMEM;
+
+	/* Reset GPIO */
+	xcsi2rxss->rst_gpio = devm_gpiod_get_optional(dev, "video-reset",
+						      GPIOD_OUT_HIGH);
+	if (IS_ERR(xcsi2rxss->rst_gpio)) {
+		if (PTR_ERR(xcsi2rxss->rst_gpio) != -EPROBE_DEFER)
+			dev_err(dev, "Video Reset GPIO not setup in DT");
+		return PTR_ERR(xcsi2rxss->rst_gpio);
+	}
+
+	ret = xcsi2rxss_parse_of(xcsi2rxss);
+	if (ret < 0)
+		return ret;
+
+	xcsi2rxss->iomem = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(xcsi2rxss->iomem))
+		return PTR_ERR(xcsi2rxss->iomem);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(dev, irq, NULL,
+					xcsi2rxss_irq_handler, IRQF_ONESHOT,
+					dev_name(dev), xcsi2rxss);
+	if (ret) {
+		dev_err(dev, "Err = %d Interrupt handler reg failed!\n", ret);
+		return ret;
+	}
+
+	ret = clk_bulk_get(dev, num_clks, xcsi2rxss->clks);
+	if (ret)
+		return ret;
+
+	/* TODO: Enable/disable clocks at stream on/off time. */
+	ret = clk_bulk_prepare_enable(num_clks, xcsi2rxss->clks);
+	if (ret)
+		goto err_clk_put;
+
+	mutex_init(&xcsi2rxss->lock);
+
+	xcsi2rxss_hard_reset(xcsi2rxss);
+	xcsi2rxss_soft_reset(xcsi2rxss);
+
+	/* Initialize V4L2 subdevice and media entity */
+	xcsi2rxss->pads[XVIP_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	xcsi2rxss->pads[XVIP_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	/* Initialize the default format */
+	xcsi2rxss->default_format.code =
+		xcsi2rxss_get_nth_mbus(xcsi2rxss->datatype, 0);
+	xcsi2rxss->default_format.field = V4L2_FIELD_NONE;
+	xcsi2rxss->default_format.colorspace = V4L2_COLORSPACE_SRGB;
+	xcsi2rxss->default_format.width = XCSI_DEFAULT_WIDTH;
+	xcsi2rxss->default_format.height = XCSI_DEFAULT_HEIGHT;
+	xcsi2rxss->format = xcsi2rxss->default_format;
+
+	/* Initialize V4L2 subdevice and media entity */
+	subdev = &xcsi2rxss->subdev;
+	v4l2_subdev_init(subdev, &xcsi2rxss_ops);
+	subdev->dev = dev;
+	strscpy(subdev->name, dev_name(dev), sizeof(subdev->name));
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
+	subdev->entity.ops = &xcsi2rxss_media_ops;
+	v4l2_set_subdevdata(subdev, xcsi2rxss);
+
+	ret = media_entity_pads_init(&subdev->entity, XCSI_MEDIA_PADS,
+				     xcsi2rxss->pads);
+	if (ret < 0)
+		goto error;
+
+	platform_set_drvdata(pdev, xcsi2rxss);
+
+	ret = v4l2_async_register_subdev(subdev);
+	if (ret < 0) {
+		dev_err(dev, "failed to register subdev\n");
+		goto error;
+	}
+
+	return 0;
+error:
+	media_entity_cleanup(&subdev->entity);
+	mutex_destroy(&xcsi2rxss->lock);
+	clk_bulk_disable_unprepare(num_clks, xcsi2rxss->clks);
+err_clk_put:
+	clk_bulk_put(num_clks, xcsi2rxss->clks);
+	return ret;
+}
+
+static int xcsi2rxss_remove(struct platform_device *pdev)
+{
+	struct xcsi2rxss_state *xcsi2rxss = platform_get_drvdata(pdev);
+	struct v4l2_subdev *subdev = &xcsi2rxss->subdev;
+	int num_clks = ARRAY_SIZE(xcsi2rxss_clks);
+
+	v4l2_async_unregister_subdev(subdev);
+	media_entity_cleanup(&subdev->entity);
+	mutex_destroy(&xcsi2rxss->lock);
+	clk_bulk_disable_unprepare(num_clks, xcsi2rxss->clks);
+	clk_bulk_put(num_clks, xcsi2rxss->clks);
+
+	return 0;
+}
+
+static const struct of_device_id xcsi2rxss_of_id_table[] = {
+	{ .compatible = "xlnx,mipi-csi2-rx-subsystem-5.0", },
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
+MODULE_DESCRIPTION("Xilinx MIPI CSI-2 Rx Subsystem Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.1.1


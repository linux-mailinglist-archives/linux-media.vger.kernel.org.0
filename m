Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C833B6F35
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 10:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbhF2IYZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 04:24:25 -0400
Received: from mail-eopbgr80080.outbound.protection.outlook.com ([40.107.8.80]:59831
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232491AbhF2IYV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 04:24:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpD5WedoW+3/jAXmrkVTa9Yb9uA9nBMnMuoFUEwlS+DcURUCtHH6qSJULRfku+XVm0r+75zP76+PyvBCgL5ne9rQTg0QNZHu3/F5/gF8C9rM6cHRITLe+Da7rmCMmFjn9TRGt8EYQy9OblJvYQ5ULDhYBWqivX/RsoMVlb3CtBSbSzN/SOomWdZG095uEjOU3VHouHkLyicl45HNe1LSKJ1nmZBeTZCZNuQiE5Bfx9RcIG1W0VdcC9cdJbBMwWNQZpijTwCiyXmKJGNGzwur8uaya+T7bUnJf/KwcJxj1lBCOu+5CGtWX/zDkS3SL1P0YAAQzor8f2kH4kj0ScK8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjiDfvCuXwqvQ7+gPR79g5nQe0ONwBU4dXGBFWWnK+M=;
 b=Q3bzx+uBawM1SmBcfSqCSeTuQ4lazLSdxoH+TQiO5vj+zaKkBYiPGdy7c50li5Aorp9sqjxwsxnjC+MW4jVkzh9kwQwjOoxQDviVb4GeYCZPdlILRA8gNZb/eXStfK5TbKtYt2S74oslFHMoz2ityivNxaAbwnOa7HQU6rUgkIRMlmOyZW1tx2j4bpuxtgD5YFt87H07M6zOjfONKCyoJIg66+mmqr7Yz8mA7U73SkrJ09V1Q9iPD4wRawHu6e0nyo+lRkKdsfpiEESdHDhJyFKHVt2bqLOtd+iFPw9YiFI20TOtZUrZy7Qs3MYSxciK4stwzQcPj+9GbEADizmp2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjiDfvCuXwqvQ7+gPR79g5nQe0ONwBU4dXGBFWWnK+M=;
 b=T0tlFBmbmu0jGu/dInIYh+aV2AKIFtltLNXVYhtrIfx5k5xtXod2GltJljIZrou1aTx4KVmmU2h5/fKu7iDkfZhfNDGUliMTkgikgvBdYB19ePS/GKjs+DxROrA2YXmo/OTzieDMNUoXGKY9bGKqRKo7jtRwuvctWdXoalHh37I=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM7PR04MB7191.eurprd04.prod.outlook.com (2603:10a6:20b:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 08:21:51 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642%3]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 08:21:51 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 03/13] media: imx: imx8q: add imx8q vpu device driver
Date:   Tue, 29 Jun 2021 16:21:04 +0800
Message-Id: <705b61f80c08c1eaafaa77ef77777afe31aed65a.1624954576.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624954576.git.ming.qian@nxp.com>
References: <cover.1624954576.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: SG2PR06CA0160.apcprd06.prod.outlook.com
 (2603:1096:1:1e::14) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0160.apcprd06.prod.outlook.com (2603:1096:1:1e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 08:21:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 169f0a86-6ab4-4a25-8249-08d93ad6f230
X-MS-TrafficTypeDiagnostic: AM7PR04MB7191:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7191A05244FF364AF6AE667CE7029@AM7PR04MB7191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2kzXyxDKEnBbjtF0d33Lor/oZu0UGyQDZoxn2OHhXLQIQLCRF/8O3uPDIyh1v4JiEyJnXGF54LaHbB+Zzzne2n7O9saW+fgBdXrhEojwAJMSA9p18HAacPS5YMuM7eaqWmqZXGZkMgxEZnP2748EzrvWc6Vzb1ATzjHMzBdbhj/nhT/yWpvzn3RCk6M/ZizYJmH9mJPoLQwHqwCkvB9W4JcWdI9M0EqjulG6aRMwlTV0h0mvUeb4hQ2L+EPIHPTypRrwtUA0tM/mgxBo+iVAiDbqq9jMJuYO5nx3Dtt+V9ETpKRcujEl8uaJFHCB8zBvGf9skFfcZxzgNhdKfC+SteG/n42oXLeRLk6BtdpEotmYHHIxqlaLbyUrtv+/3Qu2IkuD0LUOxOAGe7nS5diiauS3NkZwInR7Ct+xfqvVQQBz0JDG7jf0jy5jZBGFsb1pKKbN+Tdus+dUM/snFexbaG90G/zZ43tvOtn08zK3fBhIgDwAF+YJjOPB3hERW0/7O27tWA16PUJ+ViJEAMvCEncwxQYb77/Mf6GORNO/h73GwGxm5hRpm6IRAv7O5Jfqu6zyVPdsUQIYQk2AOPAEXrH71PuRxo1RPmAYNb5MjNY2p7ISUrsikeaBXfXIAwEotCaEqvyX9CamgdVpYOsp0voOuVPyG/dbi6uH5xTvKIxQ0CJBALhc7Jwe6zjHMQQlBFvPLbFQ7nrNMwdeWrN/P3ES4n+4SUBi8Vzkgxmr/JDG1oKxb2p2hcUQ72RfPcPaIjqKS8N95e1cJU7NBy2AITHaDqz8/2ElY1HDA5CgC+wAgVUqbeMrcc8Rt0pkBnaFYZdBW9m6eBggT6cVmDGcSqCjyP3zkfPLitAv+J9e+Tc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39850400004)(86362001)(7696005)(52116002)(7416002)(38350700002)(5660300002)(66946007)(966005)(44832011)(8936002)(4326008)(6486002)(478600001)(66476007)(30864003)(2616005)(316002)(38100700002)(8676002)(956004)(66556008)(36756003)(6666004)(83380400001)(2906002)(26005)(16526019)(186003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?In6KxR7DxwC7Rma+TJl+1y1fX5dA/i6WxJV2LIHqM2O6hBC91JZbGnZt6uQ9?=
 =?us-ascii?Q?igDJZdY0WrsC+hgelgH834uw65yeOEy9zVtoT2N2VnorBTImb/2V4nF3+Uuu?=
 =?us-ascii?Q?bUZk2uzpRLOolDGgCt+iGdaEZs9p/6FvGCR0WRDV1pAr4gKa+071n60oV3l7?=
 =?us-ascii?Q?OUMYYwS+Qbe9rziOf4usUIdoUJGYrHsNjIxVnHp+2AEC/OK/4kSeLKJGZSUE?=
 =?us-ascii?Q?cUwzNx39SqHKBc3H4fq1iRE41CNo0tF2PkkzFxd4dgh0DCY3NOpoQZEbWMhX?=
 =?us-ascii?Q?XZtEbTL4ML+hKiYSe+Cwo+IaRbL98oybsCt+K3QYDOaoiBheFHZkQluNk1NH?=
 =?us-ascii?Q?eOnltUGN78v4FjalTzuTD6ti7XRugbwL3DX4mEXvXIQrXHq+7r3xo/pYgMxn?=
 =?us-ascii?Q?KSVGllqHlJctlFejklqAHyfNR6IQo7E6dcyJRSVRSuByuNm5TIgMvlysfXpN?=
 =?us-ascii?Q?/4KwOUeSs3LhebPta9klCqmLzzPXC197RRJ7f2DD1yCpSU9fY2cCoA4VuDCO?=
 =?us-ascii?Q?ITMHcGk0SYj7p7x5ruWZ85oOMZ4VDpjFbdXUOFtrCcYbmfr15HrEPDqezrpC?=
 =?us-ascii?Q?EjcW/zy0tXD2eYPweiPWkUMoQY42zTcOT0rBTBKSodCBL5QZYfXGAcJHRYGY?=
 =?us-ascii?Q?nkjP043Hy9ifh3dx28d7MqkFcjyNNediUraSi8tzY47qvWkx5Sfo6i/XFrFb?=
 =?us-ascii?Q?KPupzI0o4sS+n92RSheSg0R9vjAmtIyF2mnugd1jmxjE+2bOyD/iqc2KUxRe?=
 =?us-ascii?Q?gBNncWQWZ189QiDi+8+z0+8HnRCML2+cJSx8WZN5mZVTJVRxrsNFUm8N2Kz0?=
 =?us-ascii?Q?JGXfuTlKzpc2R5PE2Wqb6hrOUC8h396bF5J6gnO+MM+TFa0YNorGy3aa67+F?=
 =?us-ascii?Q?oW0nGvIh0r1EJORGt7qo5iOCBv3axUu6+sBZhOxE7EIUrWPQ7GiEcUWJJ8LF?=
 =?us-ascii?Q?G50iVqEr5lYSBiAM5DMF+AYbUk1uzdax2ByMidH2IHsHxU17JlYEi9lLmeIJ?=
 =?us-ascii?Q?WRpoL0Xiy1AJTiwshSLFXM6R4Vx2HsKAdxfvPTEzxtZeVDyhL+vHpKgBhUTZ?=
 =?us-ascii?Q?bfwLxdvbjKXOCxVMrBvxf0HsgoslaZiWpZ4Xvky6oMuVhmIGR8x1wBrM5Gvv?=
 =?us-ascii?Q?MgZEeMfGB2fRWXgDH2m7Fi36qFQqrGxCRkJSd253p5z0whfYtfPz1XV6yTdj?=
 =?us-ascii?Q?ZpgzGrRaxOZQQZzQo2ROnUuhK6aOFDpOeqm//lp1v+VpdnIs4Ph1S8lo1mB0?=
 =?us-ascii?Q?rA1QO5GZaDe/JHTbX6VDkZJ8OCUbIXSjlPQYLhCBRM5He/+06aE0apIKh06T?=
 =?us-ascii?Q?E39smCwVnrm+QYIczcf3cbQF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169f0a86-6ab4-4a25-8249-08d93ad6f230
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:21:51.3511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jPSTxMOJBhh9CDPiH1CE0kqXLbM8BZlYyhEZ7bM7sBErJWKrrd+tBxM+DFNCd1NciUnTR93jcjwy5swd+lLHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7191
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IMX8Q SoCs feature a powerful video processing unit able to decode many
foramts and encode H.264.

The vpu IP is amphion malone decoder and windsor encoder.
This Driver is for this IP that is based on the v4l2 mem2mem framework.

Supported SoCs are: IMX8QXP, IMX8QM

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 drivers/media/platform/Kconfig                |   2 +
 drivers/media/platform/Makefile               |   2 +
 drivers/media/platform/imx/Kconfig            |  19 +
 drivers/media/platform/imx/Makefile           |   1 +
 drivers/media/platform/imx/vpu-8q/Makefile    |  23 ++
 drivers/media/platform/imx/vpu-8q/vpu.h       | 339 ++++++++++++++++++
 drivers/media/platform/imx/vpu-8q/vpu_defs.h  | 194 ++++++++++
 .../media/platform/imx/vpu-8q/vpu_dev_imx8q.c |  82 +++++
 drivers/media/platform/imx/vpu-8q/vpu_drv.c   | 251 +++++++++++++
 include/linux/imx_vpu.h                       |  19 +
 include/uapi/linux/imx_vpu.h                  | 120 +++++++
 11 files changed, 1052 insertions(+)
 create mode 100644 drivers/media/platform/imx/Kconfig
 create mode 100644 drivers/media/platform/imx/Makefile
 create mode 100644 drivers/media/platform/imx/vpu-8q/Makefile
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_defs.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_dev_imx8q.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_drv.c
 create mode 100644 include/linux/imx_vpu.h
 create mode 100644 include/uapi/linux/imx_vpu.h

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index a3cb104956d5..27e67cb1abb5 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -168,6 +168,8 @@ config VIDEO_TI_CAL
 	  In TI Technical Reference Manual this module is referred as
 	  Camera Interface Subsystem (CAMSS).
 
+source "drivers/media/platform/imx/Kconfig"
+
 endif # V4L_PLATFORM_DRIVERS
 
 menuconfig V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 62b6cdc8c730..e564c0089012 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -80,3 +80,5 @@ obj-$(CONFIG_VIDEO_QCOM_CAMSS)		+= qcom/camss/
 obj-$(CONFIG_VIDEO_QCOM_VENUS)		+= qcom/venus/
 
 obj-y					+= sunxi/
+
+obj-y					+= imx/
diff --git a/drivers/media/platform/imx/Kconfig b/drivers/media/platform/imx/Kconfig
new file mode 100644
index 000000000000..40cceb2cb526
--- /dev/null
+++ b/drivers/media/platform/imx/Kconfig
@@ -0,0 +1,19 @@
+#
+# Codec configuration
+#
+
+config MXC_VPU_8Q
+	tristate "Support for MXC 8Q VPU(Video Processing Unit) Codec"
+	depends on ARCH_MXC
+	depends on MEDIA_SUPPORT
+	depends on VIDEO_DEV
+	depends on VIDEO_V4L2
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	default y
+	help
+	  This is a V4L2 driver for NXP MXC 8Q video accelerator hardware.
+	  It accelerates encoding and decoding operations on
+	  various NXP SoCs.
+	  To compile this driver as a module choose m here.
diff --git a/drivers/media/platform/imx/Makefile b/drivers/media/platform/imx/Makefile
new file mode 100644
index 000000000000..214f43ca390c
--- /dev/null
+++ b/drivers/media/platform/imx/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MXC_VPU_8Q) += vpu-8q/
diff --git a/drivers/media/platform/imx/vpu-8q/Makefile b/drivers/media/platform/imx/vpu-8q/Makefile
new file mode 100644
index 000000000000..ecc74b63d536
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/Makefile
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+# Makefile for NXP VPU driver
+
+vpu-8q-dev-objs += vpu_drv.o \
+			vpu_dev_imx8q.o
+
+vpu-8q-core-objs += vpu_core.o \
+			vpu_mbox.o \
+			vpu_v4l2.o \
+			vpu_helpers.o \
+			vpu_cmds.o \
+			vpu_msgs.o \
+			vpu_rpc.o \
+			vpu_imx8q.o \
+			vpu_windsor.o \
+			vpu_malone.o \
+			vpu_color.o \
+			vdec.o  \
+			venc.o \
+			vpu_dbg.o
+
+obj-$(CONFIG_MXC_VPU_8Q) += vpu-8q-dev.o
+obj-$(CONFIG_MXC_VPU_8Q) += vpu-8q-core.o
diff --git a/drivers/media/platform/imx/vpu-8q/vpu.h b/drivers/media/platform/imx/vpu-8q/vpu.h
new file mode 100644
index 000000000000..862723512005
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu.h
@@ -0,0 +1,339 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#ifndef _IMX_VPU_H
+#define _IMX_VPU_H
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-mem2mem.h>
+#include <linux/mailbox_client.h>
+#include <linux/mailbox_controller.h>
+#include <linux/kfifo.h>
+
+#define VPU_TIMEOUT		msecs_to_jiffies(1000)
+#define VPU_INST_NULL_ID	(-1L)
+#define VPU_MSG_BUFFER_SIZE	(8192)
+
+enum imx_plat_type {
+	IMX8QXP = 0,
+	IMX8QM  = 1,
+	IMX8DM,
+	IMX8DX,
+	PLAT_TYPE_RESERVED
+};
+
+enum vpu_core_type {
+	VPU_CORE_TYPE_ENC = 0,
+	VPU_CORE_TYPE_DEC = 0x10,
+};
+
+struct vpu_dev;
+struct vpu_resources {
+	enum imx_plat_type plat_type;
+	u32 mreg_base;
+	int (*setup)(struct vpu_dev *vpu);
+	int (*setup_encoder)(struct vpu_dev *vpu);
+	int (*setup_decoder)(struct vpu_dev *vpu);
+	int (*reset)(struct vpu_dev *vpu);
+};
+
+struct vpu_buffer {
+	void *virt;
+	dma_addr_t phys;
+	u32 length;
+	u32 bytesused;
+	struct device *dev;
+};
+
+struct vpu_dev {
+	void __iomem *base;
+	struct platform_device *pdev;
+	struct device *dev;
+	struct mutex lock;
+	const struct vpu_resources *res;
+	struct list_head cores;
+	struct vpu_buffer memory;
+
+	struct v4l2_device v4l2_dev;
+	struct video_device *vdev_dec;
+	struct video_device *vdev_enc;
+
+	struct delayed_work watchdog_work;
+	void (*get_vpu)(struct vpu_dev *vpu);
+	void (*put_vpu)(struct vpu_dev *vpu);
+	void (*get_enc)(struct vpu_dev *vpu);
+	void (*put_enc)(struct vpu_dev *vpu);
+	void (*get_dec)(struct vpu_dev *vpu);
+	void (*put_dec)(struct vpu_dev *vpu);
+	atomic_t ref_vpu;
+	atomic_t ref_enc;
+	atomic_t ref_dec;
+
+	struct dentry *debugfs;
+};
+
+struct vpu_format {
+	const char *name;
+	u32 pixfmt;
+	unsigned int num_planes;
+	u32 type;
+	u32 flags;
+	u32 width;
+	u32 height;
+	u32 sizeimage[VIDEO_MAX_PLANES];
+	u32 bytesperline[VIDEO_MAX_PLANES];
+	u32 field;
+};
+
+struct vpu_core_resources {
+	enum vpu_core_type type;
+	const char *fwname;
+	u32 stride;
+	u32 max_width;
+	u32 min_width;
+	u32 step_width;
+	u32 max_height;
+	u32 min_height;
+	u32 step_height;
+	bool use_reserved_mem;
+	bool standalone;
+};
+
+struct vpu_mbox {
+	char name[20];
+	struct mbox_client cl;
+	struct mbox_chan *ch;
+	bool block;
+};
+
+enum vpu_core_state {
+	VPU_CORE_DEINIT = 0,
+	VPU_CORE_ACTIVE,
+	VPU_CORE_SNAPSHOT,
+	VPU_CORE_HANG
+};
+
+struct vpu_core {
+	void __iomem *base;
+	struct platform_device *pdev;
+	struct device *dev;
+	struct device *parent;
+	struct device *pd;
+	struct device_link *pd_link;
+	struct mutex lock;
+	struct mutex cmd_lock;
+	struct list_head list;
+	enum vpu_core_type type;
+	int id;
+	const struct vpu_core_resources *res;
+	unsigned long instance_mask;
+	u32 supported_instance_count;
+	unsigned long hang_mask;
+	u32 request_count;
+	struct list_head instances;
+	enum vpu_core_state state;
+	u32 fw_version;
+
+	struct vpu_buffer fw;
+	struct vpu_buffer rpc;
+	struct vpu_buffer log;
+
+	struct vpu_mbox tx_type;
+	struct vpu_mbox tx_data;
+	struct vpu_mbox rx;
+	unsigned long cmd_seq;
+
+	wait_queue_head_t ack_wq;
+	struct completion cmp;
+	struct workqueue_struct *workqueue;
+	struct work_struct msg_work;
+	struct delayed_work msg_delayed_work;
+	struct kfifo msg_fifo;
+	void *msg_buffer;
+	unsigned int msg_buffer_size;
+
+	struct vpu_dev *vpu;
+	void *iface;
+
+	struct dentry *debugfs;
+	struct dentry *debugfs_fwlog;
+};
+
+enum vpu_codec_state {
+	VPU_CODEC_STATE_DEINIT = 1,
+	VPU_CODEC_STATE_CONFIGURED,
+	VPU_CODEC_STATE_START,
+	VPU_CODEC_STATE_STARTED,
+	VPU_CODEC_STATE_ACTIVE,
+	VPU_CODEC_STATE_SEEK,
+	VPU_CODEC_STATE_STOP,
+	VPU_CODEC_STATE_DRAIN,
+	VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE,
+};
+
+struct vpu_frame_info {
+	u32 type;
+	u32 id;
+	u32 sequence;
+	u32 luma;
+	u32 chroma_u;
+	u32 chroma_v;
+	u32 data_offset;
+	u32 flags;
+	u32 skipped;
+	s64 timestamp;
+};
+
+struct vpu_inst;
+struct vpu_inst_ops {
+	int (*ctrl_init)(struct vpu_inst *inst);
+	int (*start)(struct vpu_inst *inst, u32 type);
+	int (*stop)(struct vpu_inst *inst, u32 type);
+	int (*abort)(struct vpu_inst *inst);
+	bool (*check_ready)(struct vpu_inst *inst, unsigned int type);
+	void (*buf_done)(struct vpu_inst *inst, struct vpu_frame_info *frame);
+	void (*event_notify)(struct vpu_inst *inst, u32 event, void *data);
+	void (*release)(struct vpu_inst *inst);
+	void (*cleanup)(struct vpu_inst *inst);
+	void (*mem_request)(struct vpu_inst *inst,
+				u32 enc_frame_size,
+				u32 enc_frame_num,
+				u32 ref_frame_size,
+				u32 ref_frame_num,
+				u32 act_frame_size,
+				u32 act_frame_num);
+	void (*input_done)(struct vpu_inst *inst);
+	void (*stop_done)(struct vpu_inst *inst);
+	int (*process_output)(struct vpu_inst *inst, struct vb2_buffer *vb);
+	int (*process_capture)(struct vpu_inst *inst, struct vb2_buffer *vb);
+	int (*get_one_frame)(struct vpu_inst *inst, void *info);
+	void (*on_queue_empty)(struct vpu_inst *inst, u32 type);
+	int (*get_debug_info)(struct vpu_inst *inst, char *str, u32 size, u32 i);
+};
+
+struct vpu_inst {
+	struct list_head list;
+	struct mutex lock;
+	struct mutex ioctl_sync;
+	struct vpu_core *core;
+	int id;
+
+	struct v4l2_fh fh;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct v4l2_m2m_ctx *m2m_ctx;
+	struct v4l2_ctrl_handler ctrl_handler;
+	atomic_t ref_count;
+	int (*release)(struct vpu_inst *inst);
+
+	enum vpu_codec_state state;
+	enum vpu_core_type type;
+
+	struct workqueue_struct *workqueue;
+	struct work_struct msg_work;
+	struct kfifo msg_fifo;
+	u8 msg_buffer[VPU_MSG_BUFFER_SIZE];
+
+	struct vpu_buffer stream_buffer;
+	bool use_stream_buffer;
+
+	struct list_head cmd_q;
+	void *pending;
+
+	struct vpu_inst_ops *ops;
+	const struct vpu_format *formats;
+	struct vpu_format out_format;
+	struct vpu_format cap_format;
+	u32 min_buffer_cap;
+	u32 min_buffer_out;
+
+	struct v4l2_rect crop;
+	u32 colorspace;
+	u8 ycbcr_enc;
+	u8 quantization;
+	u8 xfer_func;
+	u32 sequence;
+	u32 extra_size;
+
+	u32 flows[16];
+	u32 flow_idx;
+
+	pid_t pid;
+	pid_t tgid;
+	struct dentry *debugfs;
+
+	void *priv;
+};
+
+#define call_vop(inst, op, args...)					\
+	((inst)->ops->op ? (inst)->ops->op(inst, ##args) : 0)		\
+
+enum {
+	VPU_BUF_STATE_IDLE = 0,
+	VPU_BUF_STATE_INUSE,
+	VPU_BUF_STATE_DECODED,
+	VPU_BUF_STATE_READY,
+	VPU_BUF_STATE_SKIP,
+	VPU_BUF_STATE_ERROR
+};
+
+struct vpu_vb2_buffer {
+	struct v4l2_m2m_buffer m2m_buf;
+	dma_addr_t luma;
+	dma_addr_t chroma_u;
+	dma_addr_t chroma_v;
+	unsigned int state;
+	u32 tag;
+};
+
+void vpu_writel(struct vpu_dev *vpu, u32 reg, u32 val);
+u32 vpu_readl(struct vpu_dev *vpu, u32 reg);
+
+static inline struct vpu_vb2_buffer *to_vpu_vb2_buffer(struct vb2_v4l2_buffer *vbuf)
+{
+	struct v4l2_m2m_buffer *m2m_buf = container_of(vbuf, struct v4l2_m2m_buffer, vb);
+
+	return container_of(m2m_buf, struct vpu_vb2_buffer, m2m_buf);
+}
+
+static inline const char *vpu_core_type_desc(enum vpu_core_type type)
+{
+	return type == VPU_CORE_TYPE_ENC ? "encoder" : "decoder";
+}
+
+static inline struct vpu_inst *to_inst(struct file *filp)
+{
+	return container_of(filp->private_data, struct vpu_inst, fh);
+}
+
+#define ctrl_to_inst(ctrl)	\
+	container_of((ctrl)->handler, struct vpu_inst, ctrl_handler)
+
+int venc_create_video_device(struct vpu_dev *vpu);
+int vdec_create_video_device(struct vpu_dev *vpu);
+
+struct vpu_inst *vpu_inst_get(struct vpu_inst *inst);
+void vpu_inst_put(struct vpu_inst *inst);
+struct vpu_core *vpu_request_core(struct vpu_dev *vpu, enum vpu_core_type type);
+void vpu_release_core(struct vpu_core *core);
+int vpu_inst_register(struct vpu_inst *inst);
+int vpu_inst_unregister(struct vpu_inst *inst);
+
+int vpu_inst_create_dbgfs_file(struct vpu_inst *inst);
+int vpu_inst_remove_dbgfs_file(struct vpu_inst *inst);
+int vpu_core_create_dbgfs_file(struct vpu_core *core);
+int vpu_core_remove_dbgfs_file(struct vpu_core *core);
+void vpu_inst_record_flow(struct vpu_inst *inst, u32 flow);
+
+#endif
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_defs.h b/drivers/media/platform/imx/vpu-8q/vpu_defs.h
new file mode 100644
index 000000000000..308f461486c0
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_defs.h
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#ifndef _IMX_VPU_DEFS_H
+#define _IMX_VPU_DEFS_H
+
+enum MSG_TYPE {
+	INIT_DONE = 1,
+	PRC_BUF_OFFSET,
+	BOOT_ADDRESS,
+	COMMAND,
+	EVENT,
+};
+
+enum {
+	VPU_IRQ_CODE_BOOT_DONE = 0x55,
+	VPU_IRQ_CODE_SNAPSHOT_DONE = 0xa5,
+	VPU_IRQ_CODE_SYNC = 0xaa,
+};
+
+enum {
+	VPU_CMD_ID_NOOP = 0x0,
+	VPU_CMD_ID_CONFIGURE_CODEC,
+	VPU_CMD_ID_START,
+	VPU_CMD_ID_STOP,
+	VPU_CMD_ID_ABORT,
+	VPU_CMD_ID_RST_BUF,
+	VPU_CMD_ID_SNAPSHOT,
+	VPU_CMD_ID_FIRM_RESET,
+	VPU_CMD_ID_UPDATE_PARAMETER,
+	VPU_CMD_ID_FRAME_ENCODE,
+	VPU_CMD_ID_SKIP,
+	VPU_CMD_ID_PARSE_NEXT_SEQ,
+	VPU_CMD_ID_PARSE_NEXT_I,
+	VPU_CMD_ID_PARSE_NEXT_IP,
+	VPU_CMD_ID_PARSE_NEXT_ANY,
+	VPU_CMD_ID_DEC_PIC,
+	VPU_CMD_ID_FS_ALLOC,
+	VPU_CMD_ID_FS_RELEASE,
+	VPU_CMD_ID_TIMESTAMP,
+	VPU_CMD_ID_DEBUG
+};
+
+enum {
+	VPU_MSG_ID_NOOP = 0x100,
+	VPU_MSG_ID_RESET_DONE,
+	VPU_MSG_ID_START_DONE,
+	VPU_MSG_ID_STOP_DONE,
+	VPU_MSG_ID_ABORT_DONE,
+	VPU_MSG_ID_BUF_RST,
+	VPU_MSG_ID_MEM_REQUEST,
+	VPU_MSG_ID_PARAM_UPD_DONE,
+	VPU_MSG_ID_FRAME_INPUT_DONE,
+	VPU_MSG_ID_ENC_DONE,
+	VPU_MSG_ID_DEC_DONE,
+	VPU_MSG_ID_FRAME_REQ,
+	VPU_MSG_ID_FRAME_RELEASE,
+	VPU_MSG_ID_SEQ_HDR_FOUND,
+	VPU_MSG_ID_RES_CHANGE,
+	VPU_MSG_ID_PIC_HDR_FOUND,
+	VPU_MSG_ID_PIC_DECODED,
+	VPU_MSG_ID_PIC_EOS,
+	VPU_MSG_ID_FIFO_LOW,
+	VPU_MSG_ID_FIFO_HIGH,
+	VPU_MSG_ID_FIFO_EMPTY,
+	VPU_MSG_ID_FIFO_FULL,
+	VPU_MSG_ID_BS_ERROR,
+	VPU_MSG_ID_UNSUPPORTED,
+	VPU_MSG_ID_TIMESTAMP_INFO,
+
+	VPU_MSG_ID_FIRMWARE_XCPT,
+};
+
+enum VPU_ENC_MEMORY_RESOURSE {
+	MEM_RES_ENC,
+	MEM_RES_REF,
+	MEM_RES_ACT
+};
+
+enum VPU_DEC_MEMORY_RESOURCE {
+	MEM_RES_FRAME,
+	MEM_RES_MBI,
+	MEM_RES_DCP
+};
+
+enum VPU_SCODE_TYPE {
+	SCODE_PADDING_EOS = 1,
+	SCODE_PADDING_BUFFLUSH = 2,
+	SCODE_PADDING_ABORT = 3,
+	SCODE_SEQUENCE = 0x31,
+	SCODE_PICTURE = 0x32,
+	SCODE_SLICE = 0x33
+};
+
+struct vpu_pkt_mem_req_data {
+	u32 enc_frame_size;
+	u32 enc_frame_num;
+	u32 ref_frame_size;
+	u32 ref_frame_num;
+	u32 act_buf_size;
+	u32 act_buf_num;
+};
+
+struct vpu_enc_pic_info {
+	u32 frame_id;
+	u32 pic_type;
+	u32 skipped_frame;
+	u32 error_flag;
+	u32 psnr;
+	u32 frame_size;
+	u32 wptr;
+	u32 crc;
+	s64 timestamp;
+};
+
+struct vpu_dec_codec_info {
+	u32 pixfmt;
+	u32 num_ref_frms;
+	u32 num_dpb_frms;
+	u32 num_dfe_area;
+	u32 color_primaries;
+	u32 transfer_chars;
+	u32 matrix_coeffs;
+	u32 full_range;
+	u32 vui_present;
+	u32 progressive;
+	u32 width;
+	u32 height;
+	u32 decoded_width;
+	u32 decoded_height;
+	u32 frame_rate;
+	u32 dsp_asp_ratio;
+	u32 level_idc;
+	u32 bit_depth_luma;
+	u32 bit_depth_chroma;
+	u32 chroma_fmt;
+	u32 mvc_num_views;
+	u32 offset_x;
+	u32 offset_y;
+	u32 tag;
+	u32 sizeimage[VIDEO_MAX_PLANES];
+	u32 bytesperline[VIDEO_MAX_PLANES];
+	u32 mbi_size;
+	u32 dcp_size;
+};
+
+struct vpu_dec_pic_info {
+	u32 id;
+	u32 luma;
+	u32 start;
+	u32 end;
+	u32 pic_size;
+	u32 stride;
+	u32 skipped;
+	s64 timestamp;
+	u32 consumed_count;
+};
+
+struct vpu_fs_info {
+	u32 id;
+	u32 type;
+	u32 tag;
+	u32 luma_addr;
+	u32 luma_size;
+	u32 chroma_addr;
+	u32 chromau_size;
+	u32 chromav_addr;
+	u32 chromav_size;
+	u32 bytesperline;
+	u32 not_displayed;
+};
+
+struct vpu_ts_info {
+	s64 timestamp;
+	u32 size;
+};
+
+#define BITRATE_STEP		(1024)
+#define BITRATE_MIN		(16 * BITRATE_STEP)
+#define BITRATE_MAX		(240 * 1024 * BITRATE_STEP)
+#define BITRATE_DEFAULT		(2 * 1024 * BITRATE_STEP)
+
+#endif
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_dev_imx8q.c b/drivers/media/platform/imx/vpu-8q/vpu_dev_imx8q.c
new file mode 100644
index 000000000000..e88b0693ea8e
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_dev_imx8q.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/ioctl.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include "vpu.h"
+#include "vpu_imx8q.h"
+
+int vpu_imx8q_setup_dec(struct vpu_dev *vpu)
+{
+	const off_t offset = DEC_MFD_XREG_SLV_BASE + MFD_BLK_CTRL;
+
+	vpu_writel(vpu, offset + MFD_BLK_CTRL_MFD_SYS_CLOCK_ENABLE_SET, 0x1f);
+	vpu_writel(vpu, offset + MFD_BLK_CTRL_MFD_SYS_RESET_SET, 0xffffffff);
+
+	return 0;
+}
+
+int vpu_imx8q_setup_enc(struct vpu_dev *vpu)
+{
+	return 0;
+}
+
+int vpu_imx8q_setup(struct vpu_dev *vpu)
+{
+	const off_t offset = SCB_XREG_SLV_BASE + SCB_SCB_BLK_CTRL;
+	u32 read_data;
+
+	read_data = vpu_readl(vpu, offset + 0x108);
+
+	vpu_writel(vpu, offset + SCB_BLK_CTRL_SCB_CLK_ENABLE_SET, 0x1);
+	vpu_writel(vpu, offset + 0x190, 0xffffffff);
+	vpu_writel(vpu, offset + SCB_BLK_CTRL_XMEM_RESET_SET, 0xffffffff);
+	vpu_writel(vpu, offset + SCB_BLK_CTRL_SCB_CLK_ENABLE_SET, 0xE);
+	vpu_writel(vpu, offset + SCB_BLK_CTRL_CACHE_RESET_SET, 0x7);
+	vpu_writel(vpu, XMEM_CONTROL, 0x102);
+
+	read_data = vpu_readl(vpu, offset + 0x108);
+
+	return 0;
+}
+
+static int vpu_imx8q_reset_enc(struct vpu_dev *vpu)
+{
+	return 0;
+}
+
+static int vpu_imx8q_reset_dec(struct vpu_dev *vpu)
+{
+	const off_t offset = DEC_MFD_XREG_SLV_BASE + MFD_BLK_CTRL;
+
+	vpu_writel(vpu, offset + MFD_BLK_CTRL_MFD_SYS_RESET_CLR, 0xffffffff);
+
+	return 0;
+}
+
+int vpu_imx8q_reset(struct vpu_dev *vpu)
+{
+	const off_t offset = SCB_XREG_SLV_BASE + SCB_SCB_BLK_CTRL;
+
+	vpu_writel(vpu, offset + SCB_BLK_CTRL_CACHE_RESET_CLR, 0x7);
+	vpu_imx8q_reset_enc(vpu);
+	vpu_imx8q_reset_dec(vpu);
+
+	return 0;
+}
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_drv.c b/drivers/media/platform/imx/vpu-8q/vpu_drv.c
new file mode 100644
index 000000000000..f078d3dd8adf
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_drv.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+#include <linux/init.h>
+#include <linux/interconnect.h>
+#include <linux/ioctl.h>
+#include <linux/list.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/dma-map-ops.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/pm_runtime.h>
+#include <linux/videodev2.h>
+#include <linux/of_reserved_mem.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-ioctl.h>
+#include <linux/debugfs.h>
+#include "vpu.h"
+#include "vpu_imx8q.h"
+
+void vpu_writel(struct vpu_dev *vpu, u32 reg, u32 val)
+{
+	writel(val, vpu->base + reg);
+}
+
+u32 vpu_readl(struct vpu_dev *vpu, u32 reg)
+{
+	return readl(vpu->base + reg);
+}
+
+static void vpu_dev_get(struct vpu_dev *vpu)
+{
+	if (atomic_inc_return(&vpu->ref_vpu) == 1 && vpu->res->setup)
+		vpu->res->setup(vpu);
+}
+
+static void vpu_dev_put(struct vpu_dev *vpu)
+{
+	atomic_dec(&vpu->ref_vpu);
+}
+
+static void vpu_enc_get(struct vpu_dev *vpu)
+{
+	if (atomic_inc_return(&vpu->ref_enc) == 1 && vpu->res->setup_encoder)
+		vpu->res->setup_encoder(vpu);
+}
+
+static void vpu_enc_put(struct vpu_dev *vpu)
+{
+	atomic_dec(&vpu->ref_enc);
+}
+
+static void vpu_dec_get(struct vpu_dev *vpu)
+{
+	if (atomic_inc_return(&vpu->ref_dec) == 1 && vpu->res->setup_decoder)
+		vpu->res->setup_decoder(vpu);
+}
+
+static void vpu_dec_put(struct vpu_dev *vpu)
+{
+	atomic_dec(&vpu->ref_dec);
+}
+
+static void vpu_init_reserved_memory(struct vpu_dev *vpu)
+{
+	struct device_node *node;
+	struct resource res;
+	int ret;
+
+	if (!vpu || !vpu->dev)
+		return;
+
+	node = of_parse_phandle(vpu->dev->of_node, "memory-region", 0);
+	if (!node)
+		return;
+	if (of_address_to_resource(node, 0, &res))
+		return;
+
+	ret = of_reserved_mem_device_init(vpu->dev);
+	if (ret) {
+		pr_err("vpu declare reserved dma fail, ret = %d\n", ret);
+		return;
+	}
+	vpu->memory.phys = res.start;
+	vpu->memory.length = resource_size(&res);
+}
+
+static int vpu_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vpu_dev *vpu;
+	struct resource *r;
+	int ret;
+
+	pr_info("vpu probe %s\n", pdev->dev.of_node->name);
+	vpu = devm_kzalloc(dev, sizeof(*vpu), GFP_KERNEL);
+	if (!vpu)
+		return -ENOMEM;
+
+	vpu->pdev = pdev;
+	vpu->dev = dev;
+	mutex_init(&vpu->lock);
+	INIT_LIST_HEAD(&vpu->cores);
+	platform_set_drvdata(pdev, vpu);
+	atomic_set(&vpu->ref_vpu, 0);
+	atomic_set(&vpu->ref_enc, 0);
+	atomic_set(&vpu->ref_dec, 0);
+	vpu->get_vpu = vpu_dev_get;
+	vpu->put_vpu = vpu_dev_put;
+	vpu->get_enc = vpu_enc_get;
+	vpu->put_enc = vpu_enc_put;
+	vpu->get_dec = vpu_dec_get;
+	vpu->put_dec = vpu_dec_put;
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	vpu->base = devm_ioremap_resource(dev, r);
+	if (IS_ERR(vpu->base))
+		return PTR_ERR(vpu->base);
+
+	vpu->res = of_device_get_match_data(dev);
+	if (!vpu->res)
+		return -ENODEV;
+
+	vpu_init_reserved_memory(vpu);
+
+	pm_runtime_enable(dev);
+	ret = pm_runtime_get_sync(dev);
+	if (ret)
+		goto err_runtime_disable;
+
+	pm_runtime_put_sync(dev);
+
+	ret = v4l2_device_register(dev, &vpu->v4l2_dev);
+	if (ret)
+		goto err_vpu_deinit;
+
+	vpu->debugfs = debugfs_create_dir("vpu", NULL);
+
+	of_platform_populate(dev->of_node, NULL, NULL, dev);
+
+	return 0;
+
+err_vpu_deinit:
+err_runtime_disable:
+	pm_runtime_set_suspended(dev);
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static int vpu_remove(struct platform_device *pdev)
+{
+	struct vpu_dev *vpu = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	WARN_ON(ret < 0);
+
+	debugfs_remove_recursive(vpu->debugfs);
+	vpu->debugfs = NULL;
+
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+
+	v4l2_device_unregister(&vpu->v4l2_dev);
+	mutex_destroy(&vpu->lock);
+
+	return 0;
+}
+
+static int __maybe_unused vpu_runtime_resume(struct device *dev)
+{
+	return 0;
+}
+
+static int __maybe_unused vpu_runtime_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int __maybe_unused vpu_resume(struct device *dev)
+{
+	return 0;
+}
+
+static int __maybe_unused vpu_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static const struct dev_pm_ops vpu_pm_ops = {
+	SET_RUNTIME_PM_OPS(vpu_runtime_suspend, vpu_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(vpu_suspend, vpu_resume)
+};
+
+struct vpu_resources imx8qxp_res = {
+	.plat_type = IMX8QXP,
+	.mreg_base = 0x40000000,
+	.setup = vpu_imx8q_setup,
+	.setup_encoder = vpu_imx8q_setup_enc,
+	.setup_decoder = vpu_imx8q_setup_dec,
+	.reset = vpu_imx8q_reset
+};
+
+struct vpu_resources imx8qm_res = {
+	.plat_type = IMX8QM,
+	.mreg_base = 0x40000000,
+	.setup = vpu_imx8q_setup,
+	.setup_encoder = vpu_imx8q_setup_enc,
+	.setup_decoder = vpu_imx8q_setup_dec,
+	.reset = vpu_imx8q_reset
+};
+
+static const struct of_device_id vpu_dt_match[] = {
+	{ .compatible = "nxp,imx8qxp-vpu", .data = &imx8qxp_res },
+	{ .compatible = "nxp,imx8qm-vpu", .data = &imx8qm_res },
+	{}
+};
+MODULE_DEVICE_TABLE(of, vpu_dt_match);
+
+static struct platform_driver imx_vpu_driver = {
+	.probe = vpu_probe,
+	.remove = vpu_remove,
+	.driver = {
+		.name = "imx-vpu",
+		.of_match_table = vpu_dt_match,
+		.pm = &vpu_pm_ops,
+	},
+};
+module_platform_driver(imx_vpu_driver);
+
+MODULE_AUTHOR("Freescale Semiconductor, Inc.");
+MODULE_DESCRIPTION("Linux VPU driver for Freescale i.MX/MXC");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/imx_vpu.h b/include/linux/imx_vpu.h
new file mode 100644
index 000000000000..46aa2464e6fe
--- /dev/null
+++ b/include/linux/imx_vpu.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2018-2021 NXP
+ */
+
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+#ifndef __LINUX_IMX_VPU_H
+#define __LINUX_IMX_VPU_H
+
+#include <uapi/linux/imx_vpu.h>
+
+#endif
diff --git a/include/uapi/linux/imx_vpu.h b/include/uapi/linux/imx_vpu.h
new file mode 100644
index 000000000000..330082d1c13f
--- /dev/null
+++ b/include/uapi/linux/imx_vpu.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright 2018-2020 NXP
+ */
+
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+#ifndef _UAPI__LINUX_IMX_VPU_H
+#define _UAPI__LINUX_IMX_VPU_H
+
+#include <linux/videodev2.h>
+#include <linux/v4l2-controls.h>
+
+/*imx v4l2 controls & extension controls*/
+
+//ctrls & extension ctrls definitions
+#define V4L2_CID_NON_FRAME		(V4L2_CID_USER_IMX_BASE)
+#define V4L2_CID_DIS_REORDER		(V4L2_CID_USER_IMX_BASE + 1)
+#define V4L2_CID_ROI_COUNT		(V4L2_CID_USER_IMX_BASE + 2)
+#define V4L2_CID_ROI			(V4L2_CID_USER_IMX_BASE + 3)
+#define V4L2_CID_IPCM_COUNT		(V4L2_CID_USER_IMX_BASE + 4)
+#define V4L2_CID_IPCM			(V4L2_CID_USER_IMX_BASE + 5)
+#define V4L2_CID_HDR10META		(V4L2_CID_USER_IMX_BASE + 6)
+#define V4L2_CID_SECUREMODE		(V4L2_CID_USER_IMX_BASE + 7)
+#define V4L2_CID_SC_ENABLE		(V4L2_CID_USER_IMX_BASE + 8)
+
+#define V4L2_MAX_ROI_REGIONS		8
+struct v4l2_enc_roi_param {
+	struct v4l2_rect rect;
+	__u32 enable;
+	__s32 qp_delta;
+	__u32 reserved[2];
+};
+
+struct v4l2_enc_roi_params {
+	__u32 num_roi_regions;
+	struct v4l2_enc_roi_param roi_params[V4L2_MAX_ROI_REGIONS];
+	__u32 config_store;
+	__u32 reserved[2];
+};
+
+#define V4L2_MAX_IPCM_REGIONS		2
+struct v4l2_enc_ipcm_param {
+	struct v4l2_rect rect;
+	__u32 enable;
+	__u32 reserved[2];
+};
+struct v4l2_enc_ipcm_params {
+	__u32 num_ipcm_regions;
+	struct v4l2_enc_ipcm_param ipcm_params[V4L2_MAX_IPCM_REGIONS];
+	__u32 config_store;
+	__u32 reserved[2];
+};
+
+struct v4l2_hdr10_meta {
+	__u32 hasHdr10Meta;
+	__u32 redPrimary[2];
+	__u32 greenPrimary[2];
+	__u32 bluePrimary[2];
+	__u32 whitePoint[2];
+	__u32 maxMasteringLuminance;
+	__u32 minMasteringLuminance;
+	__u32 maxContentLightLevel;
+	__u32 maxFrameAverageLightLevel;
+};
+
+/*imx v4l2 command*/
+#define V4L2_DEC_CMD_IMX_BASE		(0x08000000)
+#define V4L2_DEC_CMD_RESET		(V4L2_DEC_CMD_IMX_BASE + 1)
+
+/*imx v4l2 event*/
+//error happened in dec/enc
+#define V4L2_EVENT_CODEC_ERROR		(V4L2_EVENT_PRIVATE_START + 1)
+//frame loss in dec/enc
+#define V4L2_EVENT_SKIP			(V4L2_EVENT_PRIVATE_START + 2)
+//crop area change in dec, not reso change
+#define V4L2_EVENT_CROPCHANGE		(V4L2_EVENT_PRIVATE_START + 3)
+//some options can't be handled by codec, so might be ignored or updated. But codec could go on.
+#define V4L2_EVENT_INVALID_OPTION	(V4L2_EVENT_PRIVATE_START + 4)
+
+/*imx v4l2 warning msg, attached with event V4L2_EVENT_INVALID_OPTION*/
+enum {
+	UNKONW_WARNING = -1,		//not known warning type
+	RIOREGION_NOTALLOW,		//(part of)roi region can not work with media setting and be ignored by enc
+	IPCMREGION_NOTALLOW,		//(part of)ipcm region can not work with media setting and be ignored by enc
+	LEVEL_UPDATED,			//current level cant't work with media setting and be updated by enc
+};
+
+/*  Flags for 'flags' field */
+/* Buffer only contains codec config data, eg. sps and pps*/
+#define V4L2_BUF_FLAG_CODECCONFIG	0x00200000
+
+/* imx v4l2 formats */
+/*raw formats*/
+#define V4L2_PIX_FMT_BGR565		v4l2_fourcc('B', 'G', 'R', 'P') /* 16  BGR-5-6-5 */
+#define V4L2_PIX_FMT_NV12X		v4l2_fourcc('N', 'V', 'X', '2') /* Y/CbCr 4:2:0 for 10bit */
+#define V4L2_PIX_FMT_DTRC		v4l2_fourcc('D', 'T', 'R', 'C') /* 8bit tile output, uncompressed */
+#define V4L2_PIX_FMT_P010		v4l2_fourcc('P', '0', '1', '0')	/* ms p010, data stored in upper 10 bits of 16 */
+#define V4L2_PIX_FMT_TILEX		v4l2_fourcc('D', 'T', 'R', 'X') /* 10 bit tile output, uncompressed */
+#define V4L2_PIX_FMT_RFC		v4l2_fourcc('R', 'F', 'C', '0') /* 8bit tile output, with rfc*/
+#define V4L2_PIX_FMT_RFCX		v4l2_fourcc('R', 'F', 'C', 'X') /* 10 bit tile output, with rfc */
+#define V4L2_PIX_FMT_411SP		v4l2_fourcc('4', '1', 'S', 'P') /* YUV 411 Semi planar */
+#define V4L2_PIX_FMT_NT8		v4l2_fourcc('N', 'A', '1', '2') /* NXP Tiled NV12 Format*/
+#define V4L2_PIX_FMT_NT10		v4l2_fourcc('N', 'T', '1', '2') /* NXP Tiled 10 bit Format*/
+
+/*codec format*/
+#define V4L2_PIX_FMT_AV1		v4l2_fourcc('A', 'V', '1', '0')	/* av1 */
+#define V4L2_PIX_FMT_RV			v4l2_fourcc('R', 'V', '0', '0')	/* rv  */
+#define V4L2_PIX_FMT_AVS		v4l2_fourcc('A', 'V', 'S', '0')	/* avs */
+#define V4L2_PIX_FMT_VP6		v4l2_fourcc('V', 'P', '6', '0') /* vp6 */
+#define V4L2_PIX_FMT_SPK		v4l2_fourcc('S', 'P', 'K', '0') /* spk */
+
+/*codec formats*/
+#endif	//#ifndef _UAPI__LINUX_IMX_VPU_H
-- 
2.31.1


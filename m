Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95E934C2233
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 04:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiBXDLt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 22:11:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiBXDLr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 22:11:47 -0500
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30057.outbound.protection.outlook.com [40.107.3.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A342465FD;
        Wed, 23 Feb 2022 19:11:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eD7U4rWQ5xS0CiwKJE81rp+sYHwHsi7dgOkUyFKMaHD2ESqdrOIHNrWB1PS/bK0O448j9ZdfsD7NrM/k2Df82qLPSu9qxYOC9x/HcyxNs1GfbmYyopWdpd5sbob/M6+WeMEi8J9eReH3WM9/GvchSJSCgyvxZs343MZM1lFgQgNjjGX+66EdzWfxdVHyW/+t5r2zglhVqu6Ds6rLTW8U39qfUTKx/IW5K7iMo9jidS2cAXoGMHMvZRAC2nL4Fpd+FXyQncYvm9CslFz+jovQlaBsnYoc9omZ2wA8ZOm8B3SEDOaj6HLHO+5G89VtQm1raKiqS6LP+DGhMvvc4UXrFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BhP6e6IpMKIqOPJwnqxfaEiXFdi60VfsBwxspd+4MU=;
 b=iVpKmYAOrpcQt1D9hk+ze00ixwwqEgC4TRwomvxsIp/qhfqajkoPYw6m+yXCZD5fGbpPdusPy8iRN/ObBFCjJ+E59gz1rrcj95WVHu6fb36Mkf0pNVDkdttqOu/CLJgllMjJ/TVI+LlvE9VhYcrab3XnVPYdROEWa1f6Hm7tTYEeL0Z9XoYp6JoYyFH+XIqmQKjOu7CK8JI0WsnOe89dQ0spAeTldnk6mqjNSXym5UZopS0TxLwHk8bkHPIaxIEm77JedYh8aeEe1nz0SUaZ9EMebvCVkicNkVitPVTWLaLYW+e52Fag/SoJ2HESatqTMlVjfbpBYUCpzkWYtwWQ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BhP6e6IpMKIqOPJwnqxfaEiXFdi60VfsBwxspd+4MU=;
 b=jaOMy+ibZqAV7fwPDchs1MVfiJa3q8RuzzQ1wfc/oMzoAHEzM7hDe4qFTd11meNcM56NIflRVo6AhyQ8o6N6UGlzob6a2TH9HQoLkwUd2ljPOWGTmy/GFQkq/MvX65RdMSQQCH8cjQ4ltvMN2BG40cY95VECrqT+rTocrODV8iw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by PA4PR04MB8013.eurprd04.prod.outlook.com (2603:10a6:102:c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 03:11:14 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c39:69cf:c4ea:967]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c39:69cf:c4ea:967%5]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 03:11:14 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v18 03/15] media: amphion: add amphion vpu device driver
Date:   Thu, 24 Feb 2022 11:10:01 +0800
Message-Id: <4608edb3fd4999f63dd615506d7956d9be82f7ea.1645670589.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1645670589.git.ming.qian@nxp.com>
References: <cover.1645670589.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0029.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::16)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf99acab-ea0c-4a09-bb04-08d9f74350d3
X-MS-TrafficTypeDiagnostic: PA4PR04MB8013:EE_
X-Microsoft-Antispam-PRVS: <PA4PR04MB8013E254ACACF3D29705B93AE73D9@PA4PR04MB8013.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Com5rMcyk2af4kZebMumDeWIIYmGpGEhiy+xsJC2m93j8BTqppcZfrEROBCT30F7JbswmJpb5QEFYUi7abcW7xXZjL14/7fKdVx/dxCBxeKRiRCDaKi8Cx8wmYeIDEuZ/vagA2Aoz05WRqUNVv9THGi++VN/QFqfcZD/CcYzrlzRcpAQcmTTlDhGSjmm5ZNdGKzKNCe1+YqjKLwRx6pHe49q5+0mJ9Kh7DPQVSEDtf+v+C57j790aTRNESODAxXtA4aTKSCZLjn7tgAFfbcUJJ1H4wmBhvRP5UkYkYoB2ShOZTCZSPsvRx6EKqiGqDjOw9j/qjbAuCTbYlqek1avQqwZBtYO5s08eCCB3RK4wXkT17AgPdZ66nnQTG6aQCp9A33T/pQ/YPUIH1t/ml2guzRTgZ2ALWH/puDLJqicsisTakpNkxFf5D2+OksLUAM31iTq/UP3on1Kosbu/3TXqJKbiIFQSYF99Ivt6JqX8MZSGcyvlPPyuKtGJZ/LvE3x4v7iwdUhNIDqpJKnw/3+OI9TghkfJRoIxM5+fxnpwSrq1ifNOzeJ3xK81WSsHc6v3nBi5Ckvc0g8m0KcU1YSYFp/vw2N1ZJfThaCRtf/mtweJ+QEDpG7Tq1enEi+fiJw2BBnxzzfPewWyaG7ibNVW7FKOCN/U6UlG50SJ74ZyDxsinnABDGGMbrzp7gTaROit5tPA6smz/6GpbitAaBeGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(2616005)(44832011)(6512007)(38100700002)(38350700002)(186003)(26005)(5660300002)(508600001)(6486002)(52116002)(6506007)(86362001)(6666004)(7416002)(66946007)(8936002)(30864003)(2906002)(8676002)(4326008)(83380400001)(66476007)(66556008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZCcPitN5W4B1uIx5pT0Jdjy+GJe+gt324qh9e2GhA9Jt7xFFUx2VkLgp6BCR?=
 =?us-ascii?Q?ixw0/2AEO64wrst7vc8lPqW6b8bLWkmUaxj8HKSfOc9mNAOzsvZtNEDyQoe9?=
 =?us-ascii?Q?XLiMxykdfTdVqAW2zUkcqVp99fcjbKFpxCy5WBigQtHZr8Vc4f3yFuCMTX8Y?=
 =?us-ascii?Q?0C8jo5ea1SkFgobj//mffcfXTBfWPRAH4bEv30T5nbySHOXt68P6CdojcxAH?=
 =?us-ascii?Q?B6TMGk47RbPy/eVxxI1vYrGeVmsyaS2/BCIW66qyqHeuXI5877GKAmRxi2li?=
 =?us-ascii?Q?LbG/6+aa8RjEgi/dvaFgGCeqibe2S6xazmYwioU1YwHnJnAuZI6UDPAA9nJm?=
 =?us-ascii?Q?9sfkbQLy+1hdbzzho1nJVGelD9zSnTm9X/PNaLAkSQ9avKaRRGCevfAFQueK?=
 =?us-ascii?Q?pw2McyFELbvFbTqxy3UbJR1MlaCcyN1HcVhnv/CmXg3Ek3J2EwA7h9rJvcx5?=
 =?us-ascii?Q?Pf+6Y1izLLbLdkqxlNDUa7pcAQjO1aTv58ApYWXghmZwhyOd2Sl2fffpsacr?=
 =?us-ascii?Q?zUPe/44kGUCoZfcz/WU0KBYUC+86XsbJWMQHHThcA6JZk365w5Q/apFjdKjW?=
 =?us-ascii?Q?VZziAztzOGQ+/o1/eq1NdQNY/lVjoKEiJJBUvdU/Pux1fLIxNjXT6nrFFpjn?=
 =?us-ascii?Q?g0aQ8Mf/sLISi6BiLyq0ZQuDOYanry+u9e0KboUg8AuxEBTj9uneiinyGdl4?=
 =?us-ascii?Q?VBjpeglqExlU8svDxU/Rf8CYO/p2tqv9Ou6157dpFhKCmes+rG9OZlzpIiOm?=
 =?us-ascii?Q?ci/sm8115p1JEQ8mAcq3BRNTzPNob4YUY4uCQ00Ofv0+FIebjJ40Xa6wOTjV?=
 =?us-ascii?Q?i3SIU2aOvVevfgGAAGVR/9rSDlKmM5ay+embCoEFr1YL+Osst6QR7IFOnYmt?=
 =?us-ascii?Q?ToWnG9jQCloMVqySUPk/GrZpW27zqbxmBytso62APsua+DnQpf4yb2blpJCJ?=
 =?us-ascii?Q?foFyzXcJkyD1nWM1mISkfH3hJmRHT9OXyuWVFt99RwqN2ma5CdD+QoCdZ9la?=
 =?us-ascii?Q?cc9vbUxpV7m3qUruHCroK5mB5VL7nSPo8vK1qP+trs0SQxEcJ99/BNZdumPG?=
 =?us-ascii?Q?0LTY329sqm4Jc59xY7fP5CnEPyFqa6ugetV5HZITd86ae9KU7Fm6hkLIdVt4?=
 =?us-ascii?Q?PJa7FNcG0chyn/+mXTR2BIiXUOmUIqzPw5l5DxEbAhBWSKzLlmNA2jHAghJ1?=
 =?us-ascii?Q?kHNHWvAZHb+7S2mQpwnCGDET8Ft32wnf+JwGlJeIQr0luYv5ybN96tUXPE0F?=
 =?us-ascii?Q?r1OWqRWslYVenrg4fZfgftd45uPjnQvPBYn2V5RjwEJc9lv61uwOCrq0e7OG?=
 =?us-ascii?Q?EmSkAZrLpN7iNITl67FGx3MvTtcyQSTxXHAQxwwv0KfV6QfptsosRzl2OkK0?=
 =?us-ascii?Q?p8S86xllXgKKfQCzq9sj9SxGYdyYelV0DutVAfzGhKa9QKyl3vkIg5JXAH73?=
 =?us-ascii?Q?R5AQ4zdTuRpFl8x807U+w1k3G33sDhID0DrXvYJlWsruGtYSzKy6zzecE2R/?=
 =?us-ascii?Q?8UCAAFoaqoS67Nv3C7AbmTrl6+tFJZbbOlT8mIPu3KN7nECaMUfR6gwXUFVs?=
 =?us-ascii?Q?nN1GY56WRJxf+wrxs0ydhfg7Zujrojl35fbCb41YfzeFAq587Cvqz9VgLa09?=
 =?us-ascii?Q?vGkVsC5vLAuoP9RjWpxWxZ8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf99acab-ea0c-4a09-bb04-08d9f74350d3
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 03:11:14.3527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IB/t6bPtUA54QznJ8AGr1/60Dr1vPA2LZhY9fvpgQZHAZvy4MOSjcAElZviaaovy+I2VO3LFZAInRnzcRs9jpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8013
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The amphion vpu codec ip contains encoder and decoder.
Windsor is the encoder, it supports to encode H.264.
Malone is the decoder, it features a powerful
video processing unit able to decode many formats,
such as H.264, HEVC, and other formats.

This Driver is for this IP that is based on the v4l2 mem2mem framework.

Supported SoCs are: IMX8QXP, IMX8QM

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/amphion/Makefile    |  20 ++
 drivers/media/platform/amphion/vpu.h       | 362 +++++++++++++++++++++
 drivers/media/platform/amphion/vpu_defs.h  | 187 +++++++++++
 drivers/media/platform/amphion/vpu_drv.c   | 260 +++++++++++++++
 drivers/media/platform/amphion/vpu_imx8q.c | 271 +++++++++++++++
 drivers/media/platform/amphion/vpu_imx8q.h | 115 +++++++
 6 files changed, 1215 insertions(+)
 create mode 100644 drivers/media/platform/amphion/Makefile
 create mode 100644 drivers/media/platform/amphion/vpu.h
 create mode 100644 drivers/media/platform/amphion/vpu_defs.h
 create mode 100644 drivers/media/platform/amphion/vpu_drv.c
 create mode 100644 drivers/media/platform/amphion/vpu_imx8q.c
 create mode 100644 drivers/media/platform/amphion/vpu_imx8q.h

diff --git a/drivers/media/platform/amphion/Makefile b/drivers/media/platform/amphion/Makefile
new file mode 100644
index 000000000000..80717312835f
--- /dev/null
+++ b/drivers/media/platform/amphion/Makefile
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0
+# Makefile for NXP VPU driver
+
+amphion-vpu-objs += vpu_drv.o \
+			vpu_core.o \
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
+obj-$(CONFIG_VIDEO_AMPHION_VPU) += amphion-vpu.o
diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platform/amphion/vpu.h
new file mode 100644
index 000000000000..e56b96a7e5d3
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu.h
@@ -0,0 +1,362 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _AMPHION_VPU_H
+#define _AMPHION_VPU_H
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
+struct vpu_func {
+	struct video_device *vfd;
+	struct v4l2_m2m_dev *m2m_dev;
+	enum vpu_core_type type;
+	int function;
+};
+
+struct vpu_dev {
+	void __iomem *base;
+	struct platform_device *pdev;
+	struct device *dev;
+	struct mutex lock; /* protect vpu device */
+	const struct vpu_resources *res;
+	struct list_head cores;
+
+	struct v4l2_device v4l2_dev;
+	struct vpu_func encoder;
+	struct vpu_func decoder;
+	struct media_device mdev;
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
+	u32 rpc_size;
+	u32 fwlog_size;
+	u32 act_size;
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
+	struct mutex lock;     /* protect vpu core */
+	struct mutex cmd_lock; /* Lock vpu command */
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
+	struct vpu_buffer act;
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
+			    u32 enc_frame_size,
+			    u32 enc_frame_num,
+			    u32 ref_frame_size,
+			    u32 ref_frame_num,
+			    u32 act_frame_size,
+			    u32 act_frame_num);
+	void (*input_done)(struct vpu_inst *inst);
+	void (*stop_done)(struct vpu_inst *inst);
+	int (*process_output)(struct vpu_inst *inst, struct vb2_buffer *vb);
+	int (*process_capture)(struct vpu_inst *inst, struct vb2_buffer *vb);
+	int (*get_one_frame)(struct vpu_inst *inst, void *info);
+	void (*on_queue_empty)(struct vpu_inst *inst, u32 type);
+	int (*get_debug_info)(struct vpu_inst *inst, char *str, u32 size, u32 i);
+	void (*wait_prepare)(struct vpu_inst *inst);
+	void (*wait_finish)(struct vpu_inst *inst);
+};
+
+struct vpu_inst {
+	struct list_head list;
+	struct mutex lock; /* v4l2 and videobuf2 lock */
+	struct vpu_dev *vpu;
+	struct vpu_core *core;
+	struct device *dev;
+	int id;
+
+	struct v4l2_fh fh;
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
+	struct vpu_buffer act;
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
+#define call_void_vop(inst, op, args...)				\
+	do {								\
+		if ((inst)->ops->op)					\
+			(inst)->ops->op(inst, ##args);				\
+	} while (0)
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
+const struct v4l2_ioctl_ops *venc_get_ioctl_ops(void);
+const struct v4l2_file_operations *venc_get_fops(void);
+const struct v4l2_ioctl_ops *vdec_get_ioctl_ops(void);
+const struct v4l2_file_operations *vdec_get_fops(void);
+
+int vpu_add_func(struct vpu_dev *vpu, struct vpu_func *func);
+void vpu_remove_func(struct vpu_func *func);
+
+struct vpu_inst *vpu_inst_get(struct vpu_inst *inst);
+void vpu_inst_put(struct vpu_inst *inst);
+struct vpu_core *vpu_request_core(struct vpu_dev *vpu, enum vpu_core_type type);
+void vpu_release_core(struct vpu_core *core);
+int vpu_inst_register(struct vpu_inst *inst);
+int vpu_inst_unregister(struct vpu_inst *inst);
+const struct vpu_core_resources *vpu_get_resource(struct vpu_inst *inst);
+
+int vpu_inst_create_dbgfs_file(struct vpu_inst *inst);
+int vpu_inst_remove_dbgfs_file(struct vpu_inst *inst);
+int vpu_core_create_dbgfs_file(struct vpu_core *core);
+int vpu_core_remove_dbgfs_file(struct vpu_core *core);
+void vpu_inst_record_flow(struct vpu_inst *inst, u32 flow);
+
+int vpu_core_driver_init(void);
+void vpu_core_driver_exit(void);
+
+extern bool debug;
+#define vpu_trace(dev, fmt, arg...)					\
+	do {								\
+		if (debug)						\
+			dev_info(dev, "%s: " fmt, __func__, ## arg);	\
+	} while (0)
+
+#endif
diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/media/platform/amphion/vpu_defs.h
new file mode 100644
index 000000000000..282664202dcf
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_defs.h
@@ -0,0 +1,187 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _AMPHION_VPU_DEFS_H
+#define _AMPHION_VPU_DEFS_H
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
+	struct v4l2_fract frame_rate;
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
+	u32 stride;
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
+#define BITRATE_DEFAULT_PEAK	(BITRATE_DEFAULT * 2)
+
+#endif
diff --git a/drivers/media/platform/amphion/vpu_drv.c b/drivers/media/platform/amphion/vpu_drv.c
new file mode 100644
index 000000000000..834ec39640e5
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_drv.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
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
+bool debug;
+module_param(debug, bool, 0644);
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
+static int vpu_init_media_device(struct vpu_dev *vpu)
+{
+	vpu->mdev.dev = vpu->dev;
+	strscpy(vpu->mdev.model, "amphion-vpu", sizeof(vpu->mdev.model));
+	strscpy(vpu->mdev.bus_info, "platform: amphion-vpu", sizeof(vpu->mdev.bus_info));
+	media_device_init(&vpu->mdev);
+	vpu->v4l2_dev.mdev = &vpu->mdev;
+
+	return 0;
+}
+
+static int vpu_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vpu_dev *vpu;
+	int ret;
+
+	dev_dbg(dev, "probe\n");
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
+	vpu->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vpu->base))
+		return PTR_ERR(vpu->base);
+
+	vpu->res = of_device_get_match_data(dev);
+	if (!vpu->res)
+		return -ENODEV;
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
+	vpu_init_media_device(vpu);
+	vpu->encoder.type = VPU_CORE_TYPE_ENC;
+	vpu->encoder.function = MEDIA_ENT_F_PROC_VIDEO_ENCODER;
+	vpu->decoder.type = VPU_CORE_TYPE_DEC;
+	vpu->decoder.function = MEDIA_ENT_F_PROC_VIDEO_DECODER;
+	vpu_add_func(vpu, &vpu->decoder);
+	vpu_add_func(vpu, &vpu->encoder);
+	ret = media_device_register(&vpu->mdev);
+	if (ret)
+		goto err_vpu_media;
+	vpu->debugfs = debugfs_create_dir("amphion_vpu", NULL);
+
+	of_platform_populate(dev->of_node, NULL, NULL, dev);
+
+	return 0;
+
+err_vpu_media:
+	vpu_remove_func(&vpu->encoder);
+	vpu_remove_func(&vpu->decoder);
+	v4l2_device_unregister(&vpu->v4l2_dev);
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
+
+	debugfs_remove_recursive(vpu->debugfs);
+	vpu->debugfs = NULL;
+
+	pm_runtime_disable(dev);
+
+	media_device_unregister(&vpu->mdev);
+	vpu_remove_func(&vpu->decoder);
+	vpu_remove_func(&vpu->encoder);
+	media_device_cleanup(&vpu->mdev);
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
+static struct vpu_resources imx8qxp_res = {
+	.plat_type = IMX8QXP,
+	.mreg_base = 0x40000000,
+	.setup = vpu_imx8q_setup,
+	.setup_encoder = vpu_imx8q_setup_enc,
+	.setup_decoder = vpu_imx8q_setup_dec,
+	.reset = vpu_imx8q_reset
+};
+
+static struct vpu_resources imx8qm_res = {
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
+static struct platform_driver amphion_vpu_driver = {
+	.probe = vpu_probe,
+	.remove = vpu_remove,
+	.driver = {
+		.name = "amphion-vpu",
+		.of_match_table = vpu_dt_match,
+		.pm = &vpu_pm_ops,
+	},
+};
+
+static int __init vpu_driver_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&amphion_vpu_driver);
+	if (ret)
+		return ret;
+
+	return vpu_core_driver_init();
+}
+
+static void __exit vpu_driver_exit(void)
+{
+	vpu_core_driver_exit();
+	platform_driver_unregister(&amphion_vpu_driver);
+}
+module_init(vpu_driver_init);
+module_exit(vpu_driver_exit);
+
+MODULE_AUTHOR("Freescale Semiconductor, Inc.");
+MODULE_DESCRIPTION("Linux VPU driver for Freescale i.MX8Q");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/platform/amphion/vpu_imx8q.c b/drivers/media/platform/amphion/vpu_imx8q.c
new file mode 100644
index 000000000000..606cc53125f8
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_imx8q.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/ioctl.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/types.h>
+#include "vpu.h"
+#include "vpu_core.h"
+#include "vpu_imx8q.h"
+#include "vpu_rpc.h"
+
+#define IMX8Q_CSR_CM0Px_ADDR_OFFSET			0x00000000
+#define IMX8Q_CSR_CM0Px_CPUWAIT				0x00000004
+
+#ifdef CONFIG_IMX_SCU
+#include <linux/firmware/imx/ipc.h>
+#include <linux/firmware/imx/svc/misc.h>
+
+#define VPU_DISABLE_BITS			0x7
+#define VPU_IMX_DECODER_FUSE_OFFSET		14
+#define VPU_ENCODER_MASK			0x1
+#define VPU_DECODER_MASK			0x3UL
+#define VPU_DECODER_H264_MASK			0x2UL
+#define VPU_DECODER_HEVC_MASK			0x1UL
+
+static u32 imx8q_fuse;
+
+struct vpu_sc_msg_misc {
+	struct imx_sc_rpc_msg hdr;
+	u32 word;
+} __packed;
+#endif
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
+
+	vpu_readl(vpu, offset + 0x108);
+
+	vpu_writel(vpu, offset + SCB_BLK_CTRL_SCB_CLK_ENABLE_SET, 0x1);
+	vpu_writel(vpu, offset + 0x190, 0xffffffff);
+	vpu_writel(vpu, offset + SCB_BLK_CTRL_XMEM_RESET_SET, 0xffffffff);
+	vpu_writel(vpu, offset + SCB_BLK_CTRL_SCB_CLK_ENABLE_SET, 0xE);
+	vpu_writel(vpu, offset + SCB_BLK_CTRL_CACHE_RESET_SET, 0x7);
+	vpu_writel(vpu, XMEM_CONTROL, 0x102);
+
+	vpu_readl(vpu, offset + 0x108);
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
+
+int vpu_imx8q_set_system_cfg_common(struct vpu_rpc_system_config *config, u32 regs, u32 core_id)
+{
+	if (!config)
+		return -EINVAL;
+
+	switch (core_id) {
+	case 0:
+		config->malone_base_addr[0] = regs + DEC_MFD_XREG_SLV_BASE;
+		config->num_malones = 1;
+		config->num_windsors = 0;
+		break;
+	case 1:
+		config->windsor_base_addr[0] = regs + ENC_MFD_XREG_SLV_0_BASE;
+		config->num_windsors = 1;
+		config->num_malones = 0;
+		break;
+	case 2:
+		config->windsor_base_addr[0] = regs + ENC_MFD_XREG_SLV_1_BASE;
+		config->num_windsors = 1;
+		config->num_malones = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (config->num_windsors) {
+		config->windsor_irq_pin[0x0][0x0] = WINDSOR_PAL_IRQ_PIN_L;
+		config->windsor_irq_pin[0x0][0x1] = WINDSOR_PAL_IRQ_PIN_H;
+	}
+
+	config->malone_base_addr[0x1] = 0x0;
+	config->hif_offset[0x0] = MFD_HIF;
+	config->hif_offset[0x1] = 0x0;
+
+	config->dpv_base_addr = 0x0;
+	config->dpv_irq_pin = 0x0;
+	config->pixif_base_addr = regs + DEC_MFD_XREG_SLV_BASE + MFD_PIX_IF;
+	config->cache_base_addr[0] = regs + MC_CACHE_0_BASE;
+	config->cache_base_addr[1] = regs + MC_CACHE_1_BASE;
+
+	return 0;
+}
+
+int vpu_imx8q_boot_core(struct vpu_core *core)
+{
+	csr_writel(core, IMX8Q_CSR_CM0Px_ADDR_OFFSET, core->fw.phys);
+	csr_writel(core, IMX8Q_CSR_CM0Px_CPUWAIT, 0);
+	return 0;
+}
+
+int vpu_imx8q_get_power_state(struct vpu_core *core)
+{
+	if (csr_readl(core, IMX8Q_CSR_CM0Px_CPUWAIT) == 1)
+		return 0;
+	return 1;
+}
+
+int vpu_imx8q_on_firmware_loaded(struct vpu_core *core)
+{
+	u8 *p;
+
+	p = core->fw.virt;
+	p[16] = core->vpu->res->plat_type;
+	p[17] = core->id;
+	p[18] = 1;
+
+	return 0;
+}
+
+u32 vpu_imx8q_check_memory_region(dma_addr_t base, dma_addr_t addr, u32 size)
+{
+	const struct vpu_rpc_region_t imx8q_regions[] = {
+		{0x00000000, 0x08000000, VPU_CORE_MEMORY_CACHED},
+		{0x08000000, 0x10000000, VPU_CORE_MEMORY_UNCACHED},
+		{0x10000000, 0x20000000, VPU_CORE_MEMORY_CACHED},
+		{0x20000000, 0x40000000, VPU_CORE_MEMORY_UNCACHED}
+	};
+	int i;
+
+	if (addr < base)
+		return VPU_CORE_MEMORY_INVALID;
+
+	addr -= base;
+	for (i = 0; i < ARRAY_SIZE(imx8q_regions); i++) {
+		const struct vpu_rpc_region_t *region = &imx8q_regions[i];
+
+		if (addr >= region->start && addr + size < region->end)
+			return region->type;
+	}
+
+	return VPU_CORE_MEMORY_INVALID;
+}
+
+#ifdef CONFIG_IMX_SCU
+static u32 vpu_imx8q_get_fuse(void)
+{
+	static u32 fuse_got;
+	struct imx_sc_ipc *ipc;
+	struct vpu_sc_msg_misc msg;
+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
+	int ret;
+
+	if (fuse_got)
+		return imx8q_fuse;
+
+	ret = imx_scu_get_handle(&ipc);
+	if (ret) {
+		pr_err("error: get sct handle fail: %d\n", ret);
+		return 0;
+	}
+
+	hdr->ver = IMX_SC_RPC_VERSION;
+	hdr->svc = IMX_SC_RPC_SVC_MISC;
+	hdr->func = IMX_SC_MISC_FUNC_OTP_FUSE_READ;
+	hdr->size = 2;
+
+	msg.word = VPU_DISABLE_BITS;
+
+	ret = imx_scu_call_rpc(ipc, &msg, true);
+	if (ret)
+		return 0;
+
+	imx8q_fuse = msg.word;
+	fuse_got = 1;
+	return imx8q_fuse;
+}
+
+bool vpu_imx8q_check_codec(enum vpu_core_type type)
+{
+	u32 fuse = vpu_imx8q_get_fuse();
+
+	if (type == VPU_CORE_TYPE_ENC) {
+		if (fuse & VPU_ENCODER_MASK)
+			return false;
+	} else if (type == VPU_CORE_TYPE_DEC) {
+		fuse >>= VPU_IMX_DECODER_FUSE_OFFSET;
+		fuse &= VPU_DECODER_MASK;
+
+		if (fuse == VPU_DECODER_MASK)
+			return false;
+	}
+	return true;
+}
+
+bool vpu_imx8q_check_fmt(enum vpu_core_type type, u32 pixelfmt)
+{
+	u32 fuse = vpu_imx8q_get_fuse();
+
+	if (type == VPU_CORE_TYPE_DEC) {
+		fuse >>= VPU_IMX_DECODER_FUSE_OFFSET;
+		fuse &= VPU_DECODER_MASK;
+
+		if (fuse == VPU_DECODER_HEVC_MASK && pixelfmt == V4L2_PIX_FMT_HEVC)
+			return false;
+		if (fuse == VPU_DECODER_H264_MASK && pixelfmt == V4L2_PIX_FMT_H264)
+			return false;
+		if (fuse == VPU_DECODER_MASK)
+			return false;
+	}
+
+	return true;
+}
+#else
+bool vpu_imx8q_check_codec(enum vpu_core_type type)
+{
+	return true;
+}
+
+bool vpu_imx8q_check_fmt(enum vpu_core_type type, u32 pixelfmt)
+{
+	return true;
+}
+#endif
diff --git a/drivers/media/platform/amphion/vpu_imx8q.h b/drivers/media/platform/amphion/vpu_imx8q.h
new file mode 100644
index 000000000000..d63a2747e29c
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_imx8q.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _AMPHION_VPU_IMX8Q_H
+#define _AMPHION_VPU_IMX8Q_H
+
+#define SCB_XREG_SLV_BASE                               0x00000000
+#define SCB_SCB_BLK_CTRL                                0x00070000
+#define SCB_BLK_CTRL_XMEM_RESET_SET                     0x00000090
+#define SCB_BLK_CTRL_CACHE_RESET_SET                    0x000000A0
+#define SCB_BLK_CTRL_CACHE_RESET_CLR                    0x000000A4
+#define SCB_BLK_CTRL_SCB_CLK_ENABLE_SET                 0x00000100
+
+#define XMEM_CONTROL                                    0x00041000
+
+#define	MC_CACHE_0_BASE					0x00060000
+#define	MC_CACHE_1_BASE					0x00068000
+
+#define DEC_MFD_XREG_SLV_BASE                           0x00180000
+#define ENC_MFD_XREG_SLV_0_BASE				0x00800000
+#define ENC_MFD_XREG_SLV_1_BASE				0x00A00000
+
+#define MFD_HIF                                         0x0001C000
+#define MFD_HIF_MSD_REG_INTERRUPT_STATUS                0x00000018
+#define MFD_SIF                                         0x0001D000
+#define MFD_SIF_CTRL_STATUS                             0x000000F0
+#define MFD_SIF_INTR_STATUS                             0x000000F4
+#define MFD_MCX                                         0x00020800
+#define MFD_MCX_OFF                                     0x00000020
+#define MFD_PIX_IF					0x00020000
+
+#define MFD_BLK_CTRL                                    0x00030000
+#define MFD_BLK_CTRL_MFD_SYS_RESET_SET                  0x00000000
+#define MFD_BLK_CTRL_MFD_SYS_RESET_CLR                  0x00000004
+#define MFD_BLK_CTRL_MFD_SYS_CLOCK_ENABLE_SET           0x00000100
+#define MFD_BLK_CTRL_MFD_SYS_CLOCK_ENABLE_CLR           0x00000104
+
+#define VID_API_NUM_STREAMS				8
+#define VID_API_MAX_BUF_PER_STR				3
+#define VID_API_MAX_NUM_MVC_VIEWS			4
+#define MEDIAIP_MAX_NUM_MALONES				2
+#define MEDIAIP_MAX_NUM_MALONE_IRQ_PINS			2
+#define MEDIAIP_MAX_NUM_WINDSORS			1
+#define MEDIAIP_MAX_NUM_WINDSOR_IRQ_PINS		2
+#define MEDIAIP_MAX_NUM_CMD_IRQ_PINS			2
+#define MEDIAIP_MAX_NUM_MSG_IRQ_PINS			1
+#define MEDIAIP_MAX_NUM_TIMER_IRQ_PINS			4
+#define MEDIAIP_MAX_NUM_TIMER_IRQ_SLOTS			4
+
+#define WINDSOR_PAL_IRQ_PIN_L				0x4
+#define WINDSOR_PAL_IRQ_PIN_H				0x5
+
+struct vpu_rpc_system_config {
+	u32 cfg_cookie;
+
+	u32 num_malones;
+	u32 malone_base_addr[MEDIAIP_MAX_NUM_MALONES];
+	u32 hif_offset[MEDIAIP_MAX_NUM_MALONES];
+	u32 malone_irq_pin[MEDIAIP_MAX_NUM_MALONES][MEDIAIP_MAX_NUM_MALONE_IRQ_PINS];
+	u32 malone_irq_target[MEDIAIP_MAX_NUM_MALONES][MEDIAIP_MAX_NUM_MALONE_IRQ_PINS];
+
+	u32 num_windsors;
+	u32 windsor_base_addr[MEDIAIP_MAX_NUM_WINDSORS];
+	u32 windsor_irq_pin[MEDIAIP_MAX_NUM_WINDSORS][MEDIAIP_MAX_NUM_WINDSOR_IRQ_PINS];
+	u32 windsor_irq_target[MEDIAIP_MAX_NUM_WINDSORS][MEDIAIP_MAX_NUM_WINDSOR_IRQ_PINS];
+
+	u32 cmd_irq_pin[MEDIAIP_MAX_NUM_CMD_IRQ_PINS];
+	u32 cmd_irq_target[MEDIAIP_MAX_NUM_CMD_IRQ_PINS];
+
+	u32 msg_irq_pin[MEDIAIP_MAX_NUM_MSG_IRQ_PINS];
+	u32 msg_irq_target[MEDIAIP_MAX_NUM_MSG_IRQ_PINS];
+
+	u32 sys_clk_freq;
+	u32 num_timers;
+	u32 timer_base_addr;
+	u32 timer_irq_pin[MEDIAIP_MAX_NUM_TIMER_IRQ_PINS];
+	u32 timer_irq_target[MEDIAIP_MAX_NUM_TIMER_IRQ_PINS];
+	u32 timer_slots[MEDIAIP_MAX_NUM_TIMER_IRQ_SLOTS];
+
+	u32 gic_base_addr;
+	u32 uart_base_addr;
+
+	u32 dpv_base_addr;
+	u32 dpv_irq_pin;
+	u32 dpv_irq_target;
+
+	u32 pixif_base_addr;
+
+	u32 pal_trace_level;
+	u32 pal_trace_destination;
+
+	u32 pal_trace_level1;
+	u32 pal_trace_destination1;
+
+	u32 heap_base;
+	u32 heap_size;
+
+	u32 cache_base_addr[2];
+};
+
+int vpu_imx8q_setup_dec(struct vpu_dev *vpu);
+int vpu_imx8q_setup_enc(struct vpu_dev *vpu);
+int vpu_imx8q_setup(struct vpu_dev *vpu);
+int vpu_imx8q_reset(struct vpu_dev *vpu);
+int vpu_imx8q_set_system_cfg_common(struct vpu_rpc_system_config *config, u32 regs, u32 core_id);
+int vpu_imx8q_boot_core(struct vpu_core *core);
+int vpu_imx8q_get_power_state(struct vpu_core *core);
+int vpu_imx8q_on_firmware_loaded(struct vpu_core *core);
+u32 vpu_imx8q_check_memory_region(dma_addr_t base, dma_addr_t addr, u32 size);
+bool vpu_imx8q_check_codec(enum vpu_core_type type);
+bool vpu_imx8q_check_fmt(enum vpu_core_type type, u32 pixelfmt);
+
+#endif
-- 
2.33.0


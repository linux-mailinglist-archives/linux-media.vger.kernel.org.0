Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 687B1463025
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 10:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240528AbhK3Jwu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 04:52:50 -0500
Received: from mail-am6eur05on2085.outbound.protection.outlook.com ([40.107.22.85]:18944
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240417AbhK3Jwh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 04:52:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENOpu4oV2SSqNl0naNeFDWxaSQSd3gxVQ+u1V4S/RgAXs3BuCm+RCpV2/qWXqB/EG/rNTKnMWHEGL8Ovh6HzvT4Z9yBPF+m5EKvonQndSJ8iO5i/Zi4DGI9TWawXVykzuIvV+3rlCW4UBAKMT+1mC6DAoANZFzA44DIIj9sWFjkiiHwfYwXp9hV2qT/iwt5A1Xe0motk5NoxeWZ4726NXheAm1WKbXNT5L7lLen0M6NCJTYrtDHhOT1PXf1H54+l5EmY/glTrwplAAEsPMAxpjd1Svfa9nUCR8KDAaEfS/UEHlR0SmCwu3IMQsNqaqjQXNZFVuVLL2WahhFESJSePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCqeWIrL0p4oew2oIYCvP2RbMFkM2Fz5+e555GXtUaI=;
 b=BSuxLQ5Dj41dsXrSCmUjD+ckd+uV7/+aGUlEtFwndgxCD7wNF2M0L1EzDC8aTwQF9F8FVDnm+DFax3FpAwMJvcdEoYzFpAaQarSfxvsGzVfJjZ9zP1DOuIdzSRei4+28wPp9cxIb22sX5jLi9UY6lvCr/1fMGFYLN7WcmTecVHmzPGolyQf3H69lt7kNleCNlgC73HFrNAF6TQCOW6FQ8K/VZXZOtBxrQTCEpbQzeptoIcRJyi6zHiJIjPkzAAmfl9fPkJ6tlOL1hXh2foxi7ELu986IMh9WLKz0zl0oUS+HWVJIX88cQyljA/kdA4brkd7bVOL9XdVb/L46tXdJKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCqeWIrL0p4oew2oIYCvP2RbMFkM2Fz5+e555GXtUaI=;
 b=oIZKzVCQysldDMQDX+zyZgBK9YH3mOHuBHkrcjgDm87zqOIpLkla0BGJbDHRyciEgxi5tS07BCGcRkzOn2VFZm548svN/dqY6TIEvL6Aq71MqrpoXH0T7FCfB9Htypz3neqpm1/uqYmULGdRAQ60l9340xJFYs2zmvwvdzEC7E4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3925.eurprd04.prod.outlook.com (2603:10a6:209:1c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 09:48:53 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 09:48:53 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v13 04/13] media: amphion: add vpu core driver
Date:   Tue, 30 Nov 2021 17:48:05 +0800
Message-Id: <041cfcb9c52e2c3a4e8f5927e23f1b3c70ee44f8.1638263914.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1638263914.git.ming.qian@nxp.com>
References: <cover.1638263914.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SI2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::12) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Tue, 30 Nov 2021 09:48:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d187d1c-3848-4106-e3f0-08d9b3e69e5b
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3925:
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3925B6B5BF5B9D3831D2194EE7679@AM6PR0402MB3925.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tFoOD28JaIOCFZT9YP2bt3D7otNP2SKQxjzfQGDjy2iAry7HKoU6oU83/mvEAbQrxucY3Uk4EWcA4mGOI/pmal8GsCoWJuvyS+o0Uooe/VY/B1nUVaEn2HqpV3dPSkS4I8ECOlzh5jGaIhTrAdTfsnzgRVeayY7ddMHFxcvBZwKFp21Lhv/J9UhiYPz0PUORBrJPShGCc75YqcCw2H+DT/6moWxScyEDlPIXwRlgUYPBd5ItoA2mmeZ9qpVrEtzizMgDdjJphco/NiaOHgVVzf31f/C2tmFm4+GQ6H5T0Do54d7Vqtf993MB32QM2bdRXgKSniIbBtQ0+wKV3MzZbW6O4/f8O/DmLRiEvVPM/knCSU7UzIyPmjEYf5Zs0iCPwmdXSI8gQzP+RmnWUpTmjTx+PMF0s6CMZS5E1prx2Nj8I8C1G8XBfFwbQHitt/7jaBl3j8qDegpzTZX5VtY7qjsQ0D7rjARWVuU88VJxVJUXHr4bRfIOPnuF9W8tx4vPZeYAUjZCVjJ5OIXV3OCg+n3+30s8DL0W8IgASJz5Z5xV3QDbszxbhkYgayPd5+OODbflHdsFpTOgZl2EqihCfeX/Jhj4Ks5XhGE5YHkLxfE6SF0tBFH/3lL2B9fw7oLyKq93PVIRoQNqFOksBXZMrQlA9nrmgoOct6aHAXIZOY4vtIqALPeUlGFU7EwFB/qfnb+pJT4hr3vvoxtIIEnYBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(5660300002)(52116002)(8936002)(6666004)(508600001)(66556008)(7416002)(316002)(86362001)(6486002)(26005)(186003)(956004)(36756003)(2906002)(8676002)(7696005)(44832011)(66476007)(4326008)(38350700002)(30864003)(2616005)(38100700002)(66946007)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BKNeZ/gitXIXUdlFOgvLAewzXLxTY60hehS3j3lmWTcoDBKXS5dNnuRAwPUm?=
 =?us-ascii?Q?BcFhl00YAylGYNQQMDzEY9IcLF3oAogK3WGwKb3M6XaP7o13elZEiEBCtTpC?=
 =?us-ascii?Q?e9qfcizb3Nr2BLedGZcvYCr7oK/s9tT+OgdbS7cfXiaSlV3xLhaNYCJMjOhY?=
 =?us-ascii?Q?FuX5RVx/vqQjisqf5LnoAj+BP3METXldy6eU0NslxityneSAXhQhp6vQCnJW?=
 =?us-ascii?Q?cvfwWQcgWXxgmhlZQxpdxxJTixAO8JXTHNz15VG2Po1DCOWXcPr5GhIYVF7H?=
 =?us-ascii?Q?RLeAuNApY4xk9F3arYPLCvJObnCotnU18n3tY+zc7aQLrOjFJcKWy5DEK/KD?=
 =?us-ascii?Q?MP0O8GLzKv2IBqE9Ms1HQAsGTXU6usOUkA1aqPxk1+IxIcNYpEtMQF4GYmzt?=
 =?us-ascii?Q?fi0Uv5zACU5fdxaIZq9y6uaQAHZaGEqT+ebCny9KsN5riT5bYwOmAhwtTtph?=
 =?us-ascii?Q?hlR0g3ruQrudBvbBADLZSjxvfgRdbtcoZ4pHPpsRKH2W7hVclIaAGPozXK/L?=
 =?us-ascii?Q?Yb/dDkgi2tmxImMvo0sTUn82xHGL/ouLoEAz0tsFRcXfZ3D+KJhFD2BlJa0f?=
 =?us-ascii?Q?KCU4II/uV+PzLz4cVAlxF+W1sr6duhj0CdCnfxY9523lYXiPXUwBpAFkN4hk?=
 =?us-ascii?Q?BpEaVsMWJGG/eK+3A/1h1TpP03DaK4wABaktAHCIpW/edF0aSXunybO10Lue?=
 =?us-ascii?Q?lKTv2HrtZ6e/K01FoXC4Wkj4O74YnqOc22y7oNyqv/zusNRHJjiAkEUPCwyF?=
 =?us-ascii?Q?an8NxyMlZVbwSk3Ji2+SDQMGOMUidBTN66L2hTa8zI7REVfRV6aOxPVKKYdn?=
 =?us-ascii?Q?rKGrB7ZVg27LGrc/ULPMWUiVVVbX1KZhIsKdorkBGb08CCK49hd0WrOAay+0?=
 =?us-ascii?Q?ayE1Fp5UvgsY909trqbMiboh9dsvdPJ8fRkhP+ct75RBISO6edpWt2e0PS0a?=
 =?us-ascii?Q?eQUWEYivSjai8LkDzdgCcdSfSNeJapYTZUKD5rq7v6rH8PbCzJcsJuEIuRni?=
 =?us-ascii?Q?msvIN5Kxdos0GTFM+Iw2q8zFT1r7xjJ5PUhUD3bM9RYwAC3xaIrSbxFVY8LT?=
 =?us-ascii?Q?WsV6pk9RkER97N+BOryTv2RJFhWeud63siHO0KYzh0kFlLe0YHInzn97ODFq?=
 =?us-ascii?Q?giXuZWQTSACfKiZzhavoAslJquMFRcM3torRLIlaq3QW5QdSwj4gyY9IVCUY?=
 =?us-ascii?Q?437ipYlnb+KiJz4kUQbzMPGD9J36SvA6CFSOY9miGRrigaKNig67RO1q6vN6?=
 =?us-ascii?Q?XkmttnKmj4bC417VS7RNO9kyNylL6cEUxt4Pr19XeKvcIwOEN9gpeLNkaGXs?=
 =?us-ascii?Q?Nik6BFdIW4elBKcGtQUoqgWP7UPXljUZshQIZK943mob6c34oQMK0efzw6cX?=
 =?us-ascii?Q?H6RvP8PKlvF+v6CYJKaIIABGBrWuXexgi/H+rhFBmceaJKGf7MJWWQeb1cu4?=
 =?us-ascii?Q?WxwRezlJTeEEMHAXO3dzpN+y4KIsmmpBk3HbrRTCDpagZ2q85GjqrPYFj3Py?=
 =?us-ascii?Q?P3dTzfy2hwvI4ZFlJQFoKgQAftI9KNE5mY/naMgNyqcWUTW8Uk9OSDC3hUX/?=
 =?us-ascii?Q?zUuQ6TkNV97COp2hZ6VaVX66Wif3WgaytSZ2PHFpYa9lCGEwOP2xCo/kVElj?=
 =?us-ascii?Q?W6cZQKrpOV+8v/PFdLf5sOE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d187d1c-3848-4106-e3f0-08d9b3e69e5b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 09:48:53.7673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4ITa54wvV+q9GUZB3enq0sKNtVQ4A4ekB50tSCLugu87mLIX1ZqcePbQ/QRyy71AD6azxWBIKfh/23MQtsEcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3925
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vpu supports encoder and decoder.
it needs mu core to handle it.
core will run either encoder or decoder firmware.

This driver is for support the vpu core.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 drivers/media/platform/amphion/vpu_codec.h |  67 ++
 drivers/media/platform/amphion/vpu_core.c  | 906 +++++++++++++++++++++
 drivers/media/platform/amphion/vpu_core.h  |  15 +
 drivers/media/platform/amphion/vpu_dbg.c   | 495 +++++++++++
 drivers/media/platform/amphion/vpu_rpc.c   | 279 +++++++
 drivers/media/platform/amphion/vpu_rpc.h   | 464 +++++++++++
 6 files changed, 2226 insertions(+)
 create mode 100644 drivers/media/platform/amphion/vpu_codec.h
 create mode 100644 drivers/media/platform/amphion/vpu_core.c
 create mode 100644 drivers/media/platform/amphion/vpu_core.h
 create mode 100644 drivers/media/platform/amphion/vpu_dbg.c
 create mode 100644 drivers/media/platform/amphion/vpu_rpc.c
 create mode 100644 drivers/media/platform/amphion/vpu_rpc.h

diff --git a/drivers/media/platform/amphion/vpu_codec.h b/drivers/media/platform/amphion/vpu_codec.h
new file mode 100644
index 000000000000..bf8920e9f6d7
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_codec.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _AMPHION_VPU_CODEC_H
+#define _AMPHION_VPU_CODEC_H
+
+struct vpu_encode_params {
+	u32 input_format;
+	u32 codec_format;
+	u32 profile;
+	u32 tier;
+	u32 level;
+	struct v4l2_fract frame_rate;
+	u32 src_stride;
+	u32 src_width;
+	u32 src_height;
+	struct v4l2_rect crop;
+	u32 out_width;
+	u32 out_height;
+
+	u32 gop_length;
+	u32 bframes;
+
+	u32 rc_mode;
+	u32 bitrate;
+	u32 bitrate_min;
+	u32 bitrate_max;
+
+	u32 i_frame_qp;
+	u32 p_frame_qp;
+	u32 b_frame_qp;
+	u32 qp_min;
+	u32 qp_max;
+	u32 qp_min_i;
+	u32 qp_max_i;
+
+	struct {
+		u32 enable;
+		u32 idc;
+		u32 width;
+		u32 height;
+	} sar;
+
+	struct {
+		u32 primaries;
+		u32 transfer;
+		u32 matrix;
+		u32 full_range;
+	} color;
+};
+
+struct vpu_decode_params {
+	u32 codec_format;
+	u32 output_format;
+	u32 b_dis_reorder;
+	u32 b_non_frame;
+	u32 frame_count;
+	u32 end_flag;
+	struct {
+		u32 base;
+		u32 size;
+	} udata;
+};
+
+#endif
diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
new file mode 100644
index 000000000000..0dbfd1c84f75
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -0,0 +1,906 @@
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
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_domain.h>
+#include <linux/firmware.h>
+#include "vpu.h"
+#include "vpu_defs.h"
+#include "vpu_core.h"
+#include "vpu_mbox.h"
+#include "vpu_msgs.h"
+#include "vpu_rpc.h"
+#include "vpu_cmds.h"
+
+void csr_writel(struct vpu_core *core, u32 reg, u32 val)
+{
+	writel(val, core->base + reg);
+}
+
+u32 csr_readl(struct vpu_core *core, u32 reg)
+{
+	return readl(core->base + reg);
+}
+
+static int vpu_core_load_firmware(struct vpu_core *core)
+{
+	const struct firmware *pfw = NULL;
+	int ret = 0;
+
+	WARN_ON(!core || !core->res || !core->res->fwname);
+	if (!core->fw.virt) {
+		dev_err(core->dev, "firmware buffer is not ready\n");
+		return -EINVAL;
+	}
+
+	ret = request_firmware(&pfw, core->res->fwname, core->dev);
+	dev_dbg(core->dev, "request_firmware %s : %d\n", core->res->fwname, ret);
+	if (ret) {
+		dev_err(core->dev, "request firmware %s failed, ret = %d\n",
+				core->res->fwname, ret);
+		return ret;
+	}
+
+	if (core->fw.length < pfw->size) {
+		dev_err(core->dev, "firmware buffer size want %zu, but %d\n",
+				pfw->size, core->fw.length);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	memset_io(core->fw.virt, 0, core->fw.length);
+	memcpy(core->fw.virt, pfw->data, pfw->size);
+	core->fw.bytesused = pfw->size;
+	ret = vpu_iface_on_firmware_loaded(core);
+exit:
+	release_firmware(pfw);
+	pfw = NULL;
+
+	return ret;
+}
+
+static int vpu_core_boot_done(struct vpu_core *core)
+{
+	u32 fw_version;
+
+	fw_version = vpu_iface_get_version(core);
+	dev_info(core->dev, "%s firmware version : %d.%d.%d\n",
+			vpu_core_type_desc(core->type),
+			(fw_version >> 16) & 0xff,
+			(fw_version >> 8) & 0xff,
+			fw_version & 0xff);
+	core->supported_instance_count = vpu_iface_get_max_instance_count(core);
+	if (core->res->act_size) {
+		u32 count = core->act.length / core->res->act_size;
+
+		core->supported_instance_count = min(core->supported_instance_count, count);
+	}
+	core->fw_version = fw_version;
+	core->state = VPU_CORE_ACTIVE;
+
+	return 0;
+}
+
+static int vpu_core_wait_boot_done(struct vpu_core *core)
+{
+	int ret;
+
+	ret = wait_for_completion_timeout(&core->cmp, VPU_TIMEOUT);
+	if (!ret) {
+		dev_err(core->dev, "boot timeout\n");
+		return -EINVAL;
+	}
+	return vpu_core_boot_done(core);
+}
+
+static int vpu_core_boot(struct vpu_core *core, bool load)
+{
+	int ret;
+
+	WARN_ON(!core);
+
+	if (!core->res->standalone)
+		return 0;
+
+	reinit_completion(&core->cmp);
+	if (load) {
+		ret = vpu_core_load_firmware(core);
+		if (ret)
+			return ret;
+	}
+
+	vpu_iface_boot_core(core);
+	return vpu_core_wait_boot_done(core);
+}
+
+static int vpu_core_shutdown(struct vpu_core *core)
+{
+	if (!core->res->standalone)
+		return 0;
+	return vpu_iface_shutdown_core(core);
+}
+
+static int vpu_core_restore(struct vpu_core *core)
+{
+	int ret;
+
+	if (!core->res->standalone)
+		return 0;
+	ret = vpu_core_sw_reset(core);
+	if (ret)
+		return ret;
+
+	vpu_core_boot_done(core);
+	return vpu_iface_restore_core(core);
+}
+
+static int __vpu_alloc_dma(struct device *dev, struct vpu_buffer *buf)
+{
+	gfp_t gfp = GFP_KERNEL | GFP_DMA32;
+
+	WARN_ON(!dev || !buf);
+
+	if (!buf->length)
+		return 0;
+
+	buf->virt = dma_alloc_coherent(dev, buf->length, &buf->phys, gfp);
+	if (!buf->virt)
+		return -ENOMEM;
+
+	buf->dev = dev;
+
+	return 0;
+}
+
+void vpu_free_dma(struct vpu_buffer *buf)
+{
+	WARN_ON(!buf);
+
+	if (!buf->virt || !buf->dev)
+		return;
+
+	dma_free_coherent(buf->dev, buf->length, buf->virt, buf->phys);
+	buf->virt = NULL;
+	buf->phys = 0;
+	buf->length = 0;
+	buf->bytesused = 0;
+	buf->dev = NULL;
+}
+
+int vpu_alloc_dma(struct vpu_core *core, struct vpu_buffer *buf)
+{
+	WARN_ON(!core || !buf);
+
+	return __vpu_alloc_dma(core->dev, buf);
+}
+
+static void vpu_core_check_hang(struct vpu_core *core)
+{
+	if (core->hang_mask)
+		core->state = VPU_CORE_HANG;
+}
+
+static struct vpu_core *vpu_core_find_proper_by_type(struct vpu_dev *vpu, u32 type)
+{
+	struct vpu_core *core = NULL;
+	int request_count = INT_MAX;
+	struct vpu_core *c;
+
+	WARN_ON(!vpu);
+
+	list_for_each_entry(c, &vpu->cores, list) {
+		dev_dbg(c->dev, "instance_mask = 0x%lx, state = %d\n",
+				c->instance_mask,
+				c->state);
+		if (c->type != type)
+			continue;
+		if (c->state == VPU_CORE_DEINIT) {
+			core = c;
+			break;
+		}
+		vpu_core_check_hang(c);
+		if (c->state != VPU_CORE_ACTIVE)
+			continue;
+		if (c->request_count < request_count) {
+			request_count = c->request_count;
+			core = c;
+		}
+		if (!request_count)
+			break;
+	}
+
+	return core;
+}
+
+static bool vpu_core_is_exist(struct vpu_dev *vpu, struct vpu_core *core)
+{
+	struct vpu_core *c;
+
+	list_for_each_entry(c, &vpu->cores, list) {
+		if (c == core)
+			return true;
+	}
+
+	return false;
+}
+
+static void vpu_core_get_vpu(struct vpu_core *core)
+{
+	core->vpu->get_vpu(core->vpu);
+	if (core->type == VPU_CORE_TYPE_ENC)
+		core->vpu->get_enc(core->vpu);
+	if (core->type == VPU_CORE_TYPE_DEC)
+		core->vpu->get_dec(core->vpu);
+}
+
+static int vpu_core_register(struct device *dev, struct vpu_core *core)
+{
+	struct vpu_dev *vpu = dev_get_drvdata(dev);
+	int ret = 0;
+
+	dev_dbg(core->dev, "register core %s\n", vpu_core_type_desc(core->type));
+	if (vpu_core_is_exist(vpu, core))
+		return 0;
+
+	core->workqueue = alloc_workqueue("vpu", WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
+	if (!core->workqueue) {
+		dev_err(core->dev, "fail to alloc workqueue\n");
+		return -ENOMEM;
+	}
+	INIT_WORK(&core->msg_work, vpu_msg_run_work);
+	INIT_DELAYED_WORK(&core->msg_delayed_work, vpu_msg_delayed_work);
+	core->msg_buffer_size = roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
+	core->msg_buffer = vzalloc(core->msg_buffer_size);
+	if (!core->msg_buffer) {
+		dev_err(core->dev, "failed allocate buffer for fifo\n");
+		ret = -ENOMEM;
+		goto error;
+	}
+	ret = kfifo_init(&core->msg_fifo, core->msg_buffer, core->msg_buffer_size);
+	if (ret) {
+		dev_err(core->dev, "failed init kfifo\n");
+		goto error;
+	}
+
+	list_add_tail(&core->list, &vpu->cores);
+
+	vpu_core_get_vpu(core);
+
+	if (vpu_iface_get_power_state(core))
+		ret = vpu_core_restore(core);
+	if (ret)
+		goto error;
+
+	return 0;
+error:
+	if (core->msg_buffer) {
+		vfree(core->msg_buffer);
+		core->msg_buffer = NULL;
+	}
+	if (core->workqueue) {
+		destroy_workqueue(core->workqueue);
+		core->workqueue = NULL;
+	}
+	return ret;
+}
+
+static void vpu_core_put_vpu(struct vpu_core *core)
+{
+	if (core->type == VPU_CORE_TYPE_ENC)
+		core->vpu->put_enc(core->vpu);
+	if (core->type == VPU_CORE_TYPE_DEC)
+		core->vpu->put_dec(core->vpu);
+	core->vpu->put_vpu(core->vpu);
+}
+
+static int vpu_core_unregister(struct device *dev, struct vpu_core *core)
+{
+	list_del_init(&core->list);
+
+	vpu_core_put_vpu(core);
+	core->vpu = NULL;
+	vfree(core->msg_buffer);
+	core->msg_buffer = NULL;
+
+	if (core->workqueue) {
+		cancel_work_sync(&core->msg_work);
+		cancel_delayed_work_sync(&core->msg_delayed_work);
+		destroy_workqueue(core->workqueue);
+		core->workqueue = NULL;
+	}
+
+	return 0;
+}
+
+static int vpu_core_acquire_instance(struct vpu_core *core)
+{
+	int id;
+
+	WARN_ON(!core);
+
+	id = ffz(core->instance_mask);
+	if (id >= core->supported_instance_count)
+		return -EINVAL;
+
+	set_bit(id, &core->instance_mask);
+
+	return id;
+}
+
+static void vpu_core_release_instance(struct vpu_core *core, int id)
+{
+	WARN_ON(!core);
+
+	if (id < 0 || id >= core->supported_instance_count)
+		return;
+
+	clear_bit(id, &core->instance_mask);
+}
+
+struct vpu_inst *vpu_inst_get(struct vpu_inst *inst)
+{
+	if (!inst)
+		return NULL;
+
+	atomic_inc(&inst->ref_count);
+
+	return inst;
+}
+
+void vpu_inst_put(struct vpu_inst *inst)
+{
+	if (!inst)
+		return;
+	if (atomic_dec_and_test(&inst->ref_count)) {
+		if (inst->release)
+			inst->release(inst);
+	}
+}
+
+struct vpu_core *vpu_request_core(struct vpu_dev *vpu, enum vpu_core_type type)
+{
+	struct vpu_core *core = NULL;
+	int ret;
+
+	mutex_lock(&vpu->lock);
+
+	core = vpu_core_find_proper_by_type(vpu, type);
+	if (!core)
+		goto exit;
+
+	mutex_lock(&core->lock);
+	pm_runtime_get_sync(core->dev);
+
+	if (core->state == VPU_CORE_DEINIT) {
+		ret = vpu_core_boot(core, true);
+		if (ret) {
+			pm_runtime_put_sync(core->dev);
+			mutex_unlock(&core->lock);
+			core = NULL;
+			goto exit;
+		}
+	}
+
+	core->request_count++;
+
+	mutex_unlock(&core->lock);
+exit:
+	mutex_unlock(&vpu->lock);
+
+	return core;
+}
+
+void vpu_release_core(struct vpu_core *core)
+{
+	if (!core)
+		return;
+
+	mutex_lock(&core->lock);
+	pm_runtime_put_sync(core->dev);
+	if (core->request_count)
+		core->request_count--;
+	mutex_unlock(&core->lock);
+}
+
+int vpu_inst_register(struct vpu_inst *inst)
+{
+	struct vpu_dev *vpu;
+	struct vpu_core *core;
+	int ret = 0;
+
+	WARN_ON(!inst || !inst->vpu);
+
+	vpu = inst->vpu;
+	core = inst->core;
+	if (!core) {
+		core = vpu_request_core(vpu, inst->type);
+		if (!core) {
+			dev_err(vpu->dev, "there is no vpu core for %s\n",
+				vpu_core_type_desc(inst->type));
+			return -EINVAL;
+		}
+		inst->core = core;
+		inst->dev = get_device(core->dev);
+	}
+
+	mutex_lock(&core->lock);
+	if (inst->id >= 0 && inst->id < core->supported_instance_count)
+		goto exit;
+
+	ret = vpu_core_acquire_instance(core);
+	if (ret < 0)
+		goto exit;
+
+	vpu_trace(inst->dev, "[%d] %p\n", ret, inst);
+	inst->id = ret;
+	list_add_tail(&inst->list, &core->instances);
+	ret = 0;
+	if (core->res->act_size) {
+		inst->act.phys = core->act.phys + core->res->act_size * inst->id;
+		inst->act.virt = core->act.virt + core->res->act_size * inst->id;
+		inst->act.length = core->res->act_size;
+	}
+	vpu_inst_create_dbgfs_file(inst);
+exit:
+	mutex_unlock(&core->lock);
+
+	if (ret)
+		dev_err(core->dev, "register instance fail\n");
+	return ret;
+}
+
+int vpu_inst_unregister(struct vpu_inst *inst)
+{
+	struct vpu_core *core;
+
+	WARN_ON(!inst);
+
+	if (!inst->core)
+		return 0;
+
+	core = inst->core;
+	vpu_clear_request(inst);
+	mutex_lock(&core->lock);
+	if (inst->id >= 0 && inst->id < core->supported_instance_count) {
+		vpu_inst_remove_dbgfs_file(inst);
+		list_del_init(&inst->list);
+		vpu_core_release_instance(core, inst->id);
+		inst->id = VPU_INST_NULL_ID;
+	}
+	vpu_core_check_hang(core);
+	if (core->state == VPU_CORE_HANG && !core->instance_mask) {
+		dev_info(core->dev, "reset hang core\n");
+		if (!vpu_core_sw_reset(core)) {
+			core->state = VPU_CORE_ACTIVE;
+			core->hang_mask = 0;
+		}
+	}
+	mutex_unlock(&core->lock);
+
+	return 0;
+}
+
+struct vpu_inst *vpu_core_find_instance(struct vpu_core *core, u32 index)
+{
+	struct vpu_inst *inst = NULL;
+	struct vpu_inst *tmp;
+
+	mutex_lock(&core->lock);
+	if (!test_bit(index, &core->instance_mask))
+		goto exit;
+	list_for_each_entry(tmp, &core->instances, list) {
+		if (tmp->id == index) {
+			inst = vpu_inst_get(tmp);
+			break;
+		}
+	}
+exit:
+	mutex_unlock(&core->lock);
+
+	return inst;
+}
+
+const struct vpu_core_resources *vpu_get_resource(struct vpu_inst *inst)
+{
+	struct vpu_dev *vpu;
+	struct vpu_core *core = NULL;
+	const struct vpu_core_resources *res = NULL;
+
+	if (!inst || !inst->vpu)
+		return NULL;
+
+	if (inst->core && inst->core->res)
+		return inst->core->res;
+
+	vpu = inst->vpu;
+	mutex_lock(&vpu->lock);
+	list_for_each_entry(core, &vpu->cores, list) {
+		if (core->type == inst->type) {
+			res = core->res;
+			break;
+		}
+	}
+	mutex_unlock(&vpu->lock);
+
+	return res;
+}
+
+static int vpu_core_parse_dt(struct vpu_core *core, struct device_node *np)
+{
+	struct device_node *node;
+	struct resource res;
+
+	if (of_count_phandle_with_args(np, "memory-region", NULL) < 2) {
+		dev_err(core->dev, "need 2 memory-region for boot and rpc\n");
+		return -ENODEV;
+	}
+
+	node = of_parse_phandle(np, "memory-region", 0);
+	if (!node) {
+		dev_err(core->dev, "boot-region of_parse_phandle error\n");
+		return -ENODEV;
+	}
+	if (of_address_to_resource(node, 0, &res)) {
+		dev_err(core->dev, "boot-region of_address_to_resource error\n");
+		return -EINVAL;
+	}
+	core->fw.phys = res.start;
+	core->fw.length = resource_size(&res);
+
+	node = of_parse_phandle(np, "memory-region", 1);
+	if (!node) {
+		dev_err(core->dev, "rpc-region of_parse_phandle error\n");
+		return -ENODEV;
+	}
+	if (of_address_to_resource(node, 0, &res)) {
+		dev_err(core->dev, "rpc-region of_address_to_resource error\n");
+		return -EINVAL;
+	}
+	core->rpc.phys = res.start;
+	core->rpc.length = resource_size(&res);
+
+	if (core->rpc.length < core->res->rpc_size + core->res->fwlog_size) {
+		dev_err(core->dev, "the rpc-region <%pad, 0x%x> is not enough\n",
+				&core->rpc.phys, core->rpc.length);
+		return -EINVAL;
+	}
+
+	core->fw.virt = ioremap_wc(core->fw.phys, core->fw.length);
+	core->rpc.virt = ioremap_wc(core->rpc.phys, core->rpc.length);
+	memset_io(core->rpc.virt, 0, core->rpc.length);
+
+	if (vpu_iface_check_memory_region(core,
+				core->rpc.phys,
+				core->rpc.length) != VPU_CORE_MEMORY_UNCACHED) {
+		dev_err(core->dev, "rpc region<%pad, 0x%x> isn't uncached\n",
+				&core->rpc.phys, core->rpc.length);
+		return -EINVAL;
+	}
+
+	core->log.phys = core->rpc.phys + core->res->rpc_size;
+	core->log.virt = core->rpc.virt + core->res->rpc_size;
+	core->log.length = core->res->fwlog_size;
+	core->act.phys = core->log.phys + core->log.length;
+	core->act.virt = core->log.virt + core->log.length;
+	core->act.length = core->rpc.length - core->res->rpc_size - core->log.length;
+	core->rpc.length = core->res->rpc_size;
+
+	return 0;
+}
+
+static int vpu_core_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vpu_core *core;
+	struct vpu_dev *vpu = dev_get_drvdata(dev->parent);
+	struct vpu_shared_addr *iface;
+	u32 iface_data_size;
+	int ret;
+
+	dev_dbg(dev, "probe\n");
+	if (!vpu)
+		return -EINVAL;
+	core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+
+	core->pdev = pdev;
+	core->dev = dev;
+	platform_set_drvdata(pdev, core);
+	core->vpu = vpu;
+	INIT_LIST_HEAD(&core->instances);
+	mutex_init(&core->lock);
+	mutex_init(&core->cmd_lock);
+	init_completion(&core->cmp);
+	init_waitqueue_head(&core->ack_wq);
+	core->state = VPU_CORE_DEINIT;
+
+	core->res = of_device_get_match_data(dev);
+	if (!core->res)
+		return -ENODEV;
+
+	core->type = core->res->type;
+	core->id = of_alias_get_id(dev->of_node, "vpu_core");
+	if (core->id < 0) {
+		dev_err(dev, "can't get vpu core id\n");
+		return core->id;
+	}
+	dev_info(core->dev, "[%d] = %s\n", core->id, vpu_core_type_desc(core->type));
+	ret = vpu_core_parse_dt(core, dev->of_node);
+	if (ret)
+		return ret;
+
+	core->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(core->base))
+		return PTR_ERR(core->base);
+
+	if (!vpu_iface_check_codec(core)) {
+		dev_err(core->dev, "is not supported\n");
+		return -EINVAL;
+	}
+
+	ret = vpu_mbox_init(core);
+	if (ret)
+		return ret;
+
+	iface = devm_kzalloc(dev, sizeof(*iface), GFP_KERNEL);
+	if (!iface)
+		return -ENOMEM;
+
+	iface_data_size = vpu_iface_get_data_size(core);
+	if (iface_data_size) {
+		iface->priv = devm_kzalloc(dev, iface_data_size, GFP_KERNEL);
+		if (!iface->priv)
+			return -ENOMEM;
+	}
+
+	ret = vpu_iface_init(core, iface, &core->rpc, core->fw.phys);
+	if (ret) {
+		dev_err(core->dev, "init iface fail, ret = %d\n", ret);
+		return ret;
+	}
+
+	vpu_iface_config_system(core, vpu->res->mreg_base, vpu->base);
+	vpu_iface_set_log_buf(core, &core->log);
+
+	pm_runtime_enable(dev);
+	ret = pm_runtime_get_sync(dev);
+	if (ret) {
+		pm_runtime_put_noidle(dev);
+		pm_runtime_set_suspended(dev);
+		goto err_runtime_disable;
+	}
+
+	ret = vpu_core_register(dev->parent, core);
+	if (ret)
+		goto err_core_register;
+	core->parent = dev->parent;
+
+	pm_runtime_put_sync(dev);
+	vpu_core_create_dbgfs_file(core);
+
+	return 0;
+
+err_core_register:
+	pm_runtime_put_sync(dev);
+err_runtime_disable:
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static int vpu_core_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vpu_core *core = platform_get_drvdata(pdev);
+	int ret;
+
+	vpu_core_remove_dbgfs_file(core);
+	ret = pm_runtime_get_sync(dev);
+	WARN_ON(ret < 0);
+
+	vpu_core_shutdown(core);
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+
+	vpu_core_unregister(core->parent, core);
+	iounmap(core->fw.virt);
+	iounmap(core->rpc.virt);
+	mutex_destroy(&core->lock);
+	mutex_destroy(&core->cmd_lock);
+
+	return 0;
+}
+
+static int __maybe_unused vpu_core_runtime_resume(struct device *dev)
+{
+	struct vpu_core *core = dev_get_drvdata(dev);
+
+	return vpu_mbox_request(core);
+}
+
+static int __maybe_unused vpu_core_runtime_suspend(struct device *dev)
+{
+	struct vpu_core *core = dev_get_drvdata(dev);
+
+	vpu_mbox_free(core);
+	return 0;
+}
+
+static void vpu_core_cancel_work(struct vpu_core *core)
+{
+	struct vpu_inst *inst = NULL;
+
+	cancel_work_sync(&core->msg_work);
+	cancel_delayed_work_sync(&core->msg_delayed_work);
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(inst, &core->instances, list)
+		cancel_work_sync(&inst->msg_work);
+	mutex_unlock(&core->lock);
+}
+
+static void vpu_core_resume_work(struct vpu_core *core)
+{
+	struct vpu_inst *inst = NULL;
+	unsigned long delay = msecs_to_jiffies(10);
+
+	queue_work(core->workqueue, &core->msg_work);
+	queue_delayed_work(core->workqueue, &core->msg_delayed_work, delay);
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(inst, &core->instances, list)
+		queue_work(inst->workqueue, &inst->msg_work);
+	mutex_unlock(&core->lock);
+}
+
+static int __maybe_unused vpu_core_resume(struct device *dev)
+{
+	struct vpu_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (!core->res->standalone)
+		return 0;
+
+	mutex_lock(&core->lock);
+	pm_runtime_get_sync(dev);
+	vpu_core_get_vpu(core);
+	if (core->state != VPU_CORE_SNAPSHOT)
+		goto exit;
+
+	if (!vpu_iface_get_power_state(core)) {
+		if (!list_empty(&core->instances)) {
+			ret = vpu_core_boot(core, false);
+			if (ret) {
+				dev_err(core->dev, "%s boot fail\n", __func__);
+				core->state = VPU_CORE_DEINIT;
+				goto exit;
+			}
+		} else {
+			core->state = VPU_CORE_DEINIT;
+		}
+	} else {
+		if (!list_empty(&core->instances)) {
+			ret = vpu_core_sw_reset(core);
+			if (ret) {
+				dev_err(core->dev, "%s sw_reset fail\n", __func__);
+				core->state = VPU_CORE_HANG;
+				goto exit;
+			}
+		}
+		core->state = VPU_CORE_ACTIVE;
+	}
+
+exit:
+	pm_runtime_put_sync(dev);
+	mutex_unlock(&core->lock);
+
+	vpu_core_resume_work(core);
+	return ret;
+}
+
+static int __maybe_unused vpu_core_suspend(struct device *dev)
+{
+	struct vpu_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (!core->res->standalone)
+		return 0;
+
+	mutex_lock(&core->lock);
+	if (core->state == VPU_CORE_ACTIVE) {
+		if (!list_empty(&core->instances)) {
+			ret = vpu_core_snapshot(core);
+			if (ret) {
+				mutex_unlock(&core->lock);
+				return ret;
+			}
+		}
+
+		core->state = VPU_CORE_SNAPSHOT;
+	}
+	mutex_unlock(&core->lock);
+
+	vpu_core_cancel_work(core);
+
+	mutex_lock(&core->lock);
+	vpu_core_put_vpu(core);
+	mutex_unlock(&core->lock);
+	return ret;
+}
+
+static const struct dev_pm_ops vpu_core_pm_ops = {
+	SET_RUNTIME_PM_OPS(vpu_core_runtime_suspend, vpu_core_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(vpu_core_suspend, vpu_core_resume)
+};
+
+static struct vpu_core_resources imx8q_enc = {
+	.type = VPU_CORE_TYPE_ENC,
+	.fwname = "vpu/vpu_fw_imx8_enc.bin",
+	.stride = 16,
+	.max_width = 1920,
+	.max_height = 1920,
+	.min_width = 64,
+	.min_height = 48,
+	.step_width = 2,
+	.step_height = 2,
+	.rpc_size = 0x80000,
+	.fwlog_size = 0x80000,
+	.act_size = 0xc0000,
+	.standalone = true,
+};
+
+static struct vpu_core_resources imx8q_dec = {
+	.type = VPU_CORE_TYPE_DEC,
+	.fwname = "vpu/vpu_fw_imx8_dec.bin",
+	.stride = 256,
+	.max_width = 8188,
+	.max_height = 8188,
+	.min_width = 16,
+	.min_height = 16,
+	.step_width = 1,
+	.step_height = 1,
+	.rpc_size = 0x80000,
+	.fwlog_size = 0x80000,
+	.standalone = true,
+};
+
+static const struct of_device_id vpu_core_dt_match[] = {
+	{ .compatible = "nxp,imx8q-vpu-encoder", .data = &imx8q_enc },
+	{ .compatible = "nxp,imx8q-vpu-decoder", .data = &imx8q_dec },
+	{}
+};
+MODULE_DEVICE_TABLE(of, vpu_core_dt_match);
+
+static struct platform_driver amphion_vpu_core_driver = {
+	.probe = vpu_core_probe,
+	.remove = vpu_core_remove,
+	.driver = {
+		.name = "amphion-vpu-core",
+		.of_match_table = vpu_core_dt_match,
+		.pm = &vpu_core_pm_ops,
+	},
+};
+
+int __init vpu_core_driver_init(void)
+{
+	return platform_driver_register(&amphion_vpu_core_driver);
+}
+
+void __exit vpu_core_driver_exit(void)
+{
+	platform_driver_unregister(&amphion_vpu_core_driver);
+}
diff --git a/drivers/media/platform/amphion/vpu_core.h b/drivers/media/platform/amphion/vpu_core.h
new file mode 100644
index 000000000000..00a662997da4
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_core.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _AMPHION_VPU_CORE_H
+#define _AMPHION_VPU_CORE_H
+
+void csr_writel(struct vpu_core *core, u32 reg, u32 val);
+u32 csr_readl(struct vpu_core *core, u32 reg);
+int vpu_alloc_dma(struct vpu_core *core, struct vpu_buffer *buf);
+void vpu_free_dma(struct vpu_buffer *buf);
+struct vpu_inst *vpu_core_find_instance(struct vpu_core *core, u32 index);
+
+#endif
diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
new file mode 100644
index 000000000000..2e7e11101f99
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -0,0 +1,495 @@
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
+#include <linux/types.h>
+#include <linux/pm_runtime.h>
+#include <media/v4l2-device.h>
+#include <linux/debugfs.h>
+#include "vpu.h"
+#include "vpu_defs.h"
+#include "vpu_helpers.h"
+#include "vpu_cmds.h"
+#include "vpu_rpc.h"
+
+struct print_buf_desc {
+	u32 start_h_phy;
+	u32 start_h_vir;
+	u32 start_m;
+	u32 bytes;
+	u32 read;
+	u32 write;
+	char buffer[0];
+};
+
+static char *vb2_stat_name[] = {
+	[VB2_BUF_STATE_DEQUEUED] = "dequeued",
+	[VB2_BUF_STATE_IN_REQUEST] = "in_request",
+	[VB2_BUF_STATE_PREPARING] = "preparing",
+	[VB2_BUF_STATE_QUEUED] = "queued",
+	[VB2_BUF_STATE_ACTIVE] = "active",
+	[VB2_BUF_STATE_DONE] = "done",
+	[VB2_BUF_STATE_ERROR] = "error",
+};
+
+static char *vpu_stat_name[] = {
+	[VPU_BUF_STATE_IDLE] = "idle",
+	[VPU_BUF_STATE_INUSE] = "inuse",
+	[VPU_BUF_STATE_DECODED] = "decoded",
+	[VPU_BUF_STATE_READY] = "ready",
+	[VPU_BUF_STATE_SKIP] = "skip",
+	[VPU_BUF_STATE_ERROR] = "error",
+};
+
+static int vpu_dbg_instance(struct seq_file *s, void *data)
+{
+	struct vpu_inst *inst = s->private;
+	char str[128];
+	int num;
+	struct vb2_queue *vq;
+	int i;
+
+	num = scnprintf(str, sizeof(str), "[%s]\n", vpu_core_type_desc(inst->type));
+	if (seq_write(s, str, num))
+		return 0;
+
+	num = scnprintf(str, sizeof(str), "tgig = %d,pid = %d\n", inst->tgid, inst->pid);
+	if (seq_write(s, str, num))
+		return 0;
+	num = scnprintf(str, sizeof(str), "state = %d\n", inst->state);
+	if (seq_write(s, str, num))
+		return 0;
+	num = scnprintf(str, sizeof(str),
+			"min_buffer_out = %d, min_buffer_cap = %d\n",
+			inst->min_buffer_out, inst->min_buffer_cap);
+	if (seq_write(s, str, num))
+		return 0;
+
+
+	vq = v4l2_m2m_get_src_vq(inst->fh.m2m_ctx);
+	num = scnprintf(str, sizeof(str),
+			"output (%2d, %2d): fmt = %c%c%c%c %d x %d, %d;",
+			vb2_is_streaming(vq),
+			vq->num_buffers,
+			inst->out_format.pixfmt,
+			inst->out_format.pixfmt >> 8,
+			inst->out_format.pixfmt >> 16,
+			inst->out_format.pixfmt >> 24,
+			inst->out_format.width,
+			inst->out_format.height,
+			vq->last_buffer_dequeued);
+	if (seq_write(s, str, num))
+		return 0;
+	for (i = 0; i < inst->out_format.num_planes; i++) {
+		num = scnprintf(str, sizeof(str), " %d(%d)",
+				inst->out_format.sizeimage[i],
+				inst->out_format.bytesperline[i]);
+		if (seq_write(s, str, num))
+			return 0;
+	}
+	if (seq_write(s, "\n", 1))
+		return 0;
+
+	vq = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
+	num = scnprintf(str, sizeof(str),
+			"capture(%2d, %2d): fmt = %c%c%c%c %d x %d, %d;",
+			vb2_is_streaming(vq),
+			vq->num_buffers,
+			inst->cap_format.pixfmt,
+			inst->cap_format.pixfmt >> 8,
+			inst->cap_format.pixfmt >> 16,
+			inst->cap_format.pixfmt >> 24,
+			inst->cap_format.width,
+			inst->cap_format.height,
+			vq->last_buffer_dequeued);
+	if (seq_write(s, str, num))
+		return 0;
+	for (i = 0; i < inst->cap_format.num_planes; i++) {
+		num = scnprintf(str, sizeof(str), " %d(%d)",
+				inst->cap_format.sizeimage[i],
+				inst->cap_format.bytesperline[i]);
+		if (seq_write(s, str, num))
+			return 0;
+	}
+	if (seq_write(s, "\n", 1))
+		return 0;
+	num = scnprintf(str, sizeof(str), "crop: (%d, %d) %d x %d\n",
+			inst->crop.left,
+			inst->crop.top,
+			inst->crop.width,
+			inst->crop.height);
+	if (seq_write(s, str, num))
+		return 0;
+
+	vq = v4l2_m2m_get_src_vq(inst->fh.m2m_ctx);
+	for (i = 0; i < vq->num_buffers; i++) {
+		struct vb2_buffer *vb = vq->bufs[i];
+		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+		struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+
+		if (vb->state == VB2_BUF_STATE_DEQUEUED)
+			continue;
+		num = scnprintf(str, sizeof(str),
+				"output [%2d] state = %10s, %8s\n",
+				i, vb2_stat_name[vb->state],
+				vpu_stat_name[vpu_buf->state]);
+		if (seq_write(s, str, num))
+			return 0;
+	}
+
+	vq = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
+	for (i = 0; i < vq->num_buffers; i++) {
+		struct vb2_buffer *vb = vq->bufs[i];
+		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+		struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+
+		if (vb->state == VB2_BUF_STATE_DEQUEUED)
+			continue;
+		num = scnprintf(str, sizeof(str),
+				"capture[%2d] state = %10s, %8s\n",
+				i, vb2_stat_name[vb->state],
+				vpu_stat_name[vpu_buf->state]);
+		if (seq_write(s, str, num))
+			return 0;
+	}
+
+	num = scnprintf(str, sizeof(str), "sequence = %d\n", inst->sequence);
+	if (seq_write(s, str, num))
+		return 0;
+
+	if (inst->use_stream_buffer) {
+		num = scnprintf(str, sizeof(str), "stream_buffer = %d / %d, <%pad, 0x%x>\n",
+				vpu_helper_get_used_space(inst),
+				inst->stream_buffer.length,
+				&inst->stream_buffer.phys,
+				inst->stream_buffer.length);
+		if (seq_write(s, str, num))
+			return 0;
+	}
+	num = scnprintf(str, sizeof(str), "kfifo len = 0x%x\n", kfifo_len(&inst->msg_fifo));
+	if (seq_write(s, str, num))
+		return 0;
+
+	num = scnprintf(str, sizeof(str), "flow :\n");
+	if (seq_write(s, str, num))
+		return 0;
+
+	mutex_lock(&inst->core->cmd_lock);
+	for (i = 0; i < ARRAY_SIZE(inst->flows); i++) {
+		u32 idx = (inst->flow_idx + i) % (ARRAY_SIZE(inst->flows));
+
+		if (!inst->flows[idx])
+			continue;
+		num = scnprintf(str, sizeof(str), "\t[%s]0x%x\n",
+				inst->flows[idx] >= VPU_MSG_ID_NOOP ? "M" : "C",
+				inst->flows[idx]);
+		if (seq_write(s, str, num)) {
+			mutex_unlock(&inst->core->cmd_lock);
+			return 0;
+		}
+	}
+	mutex_unlock(&inst->core->cmd_lock);
+
+	i = 0;
+	while (true) {
+		num = call_vop(inst, get_debug_info, str, sizeof(str), i++);
+		if (num <= 0)
+			break;
+		if (seq_write(s, str, num))
+			return 0;
+	}
+
+	return 0;
+}
+
+static int vpu_dbg_core(struct seq_file *s, void *data)
+{
+	struct vpu_core *core = s->private;
+	struct vpu_shared_addr *iface = core->iface;
+	char str[128];
+	int num;
+
+	num = scnprintf(str, sizeof(str), "[%s]\n", vpu_core_type_desc(core->type));
+	if (seq_write(s, str, num))
+		return 0;
+
+	num = scnprintf(str, sizeof(str), "boot_region  = <%pad, 0x%x>\n",
+			&core->fw.phys, core->fw.length);
+	if (seq_write(s, str, num))
+		return 0;
+	num = scnprintf(str, sizeof(str), "rpc_region   = <%pad, 0x%x> used = 0x%x\n",
+			&core->rpc.phys, core->rpc.length, core->rpc.bytesused);
+	if (seq_write(s, str, num))
+		return 0;
+	num = scnprintf(str, sizeof(str), "fwlog_region = <%pad, 0x%x>\n",
+			&core->log.phys, core->log.length);
+	if (seq_write(s, str, num))
+		return 0;
+
+	num = scnprintf(str, sizeof(str), "state = %d\n", core->state);
+	if (seq_write(s, str, num))
+		return 0;
+	if (core->state == VPU_CORE_DEINIT)
+		return 0;
+	num = scnprintf(str, sizeof(str), "fw version = %d.%d.%d\n",
+				(core->fw_version >> 16) & 0xff,
+				(core->fw_version >> 8) & 0xff,
+				core->fw_version & 0xff);
+	if (seq_write(s, str, num))
+		return 0;
+	num = scnprintf(str, sizeof(str), "instances = %d/%d (0x%02lx), %d\n",
+			hweight32(core->instance_mask),
+			core->supported_instance_count,
+			core->instance_mask,
+			core->request_count);
+	if (seq_write(s, str, num))
+		return 0;
+	num = scnprintf(str, sizeof(str), "kfifo len = 0x%x\n", kfifo_len(&core->msg_fifo));
+	if (seq_write(s, str, num))
+		return 0;
+	num = scnprintf(str, sizeof(str),
+			"cmd_buf:[0x%x, 0x%x], wptr = 0x%x, rptr = 0x%x\n",
+			iface->cmd_desc->start,
+			iface->cmd_desc->end,
+			iface->cmd_desc->wptr,
+			iface->cmd_desc->rptr);
+	if (seq_write(s, str, num))
+		return 0;
+	num = scnprintf(str, sizeof(str),
+			"msg_buf:[0x%x, 0x%x], wptr = 0x%x, rptr = 0x%x\n",
+			iface->msg_desc->start,
+			iface->msg_desc->end,
+			iface->msg_desc->wptr,
+			iface->msg_desc->rptr);
+	if (seq_write(s, str, num))
+		return 0;
+
+	return 0;
+}
+
+static int vpu_dbg_fwlog(struct seq_file *s, void *data)
+{
+	struct vpu_core *core = s->private;
+	struct print_buf_desc *print_buf;
+	int length;
+	u32 rptr;
+	u32 wptr;
+	int ret = 0;
+
+	if (!core->log.virt || core->state == VPU_CORE_DEINIT)
+		return 0;
+
+	print_buf = core->log.virt;
+	rptr = print_buf->read;
+	wptr = print_buf->write;
+
+	if (rptr == wptr)
+		return 0;
+	else if (rptr < wptr)
+		length = wptr - rptr;
+	else
+		length = print_buf->bytes + wptr - rptr;
+
+	if (s->count + length >= s->size) {
+		s->count = s->size;
+		return 0;
+	}
+
+	if (rptr + length >= print_buf->bytes) {
+		int num = print_buf->bytes - rptr;
+
+		if (seq_write(s, print_buf->buffer + rptr, num))
+			ret = -1;
+		length -= num;
+		rptr = 0;
+	}
+
+	if (length) {
+		if (seq_write(s, print_buf->buffer + rptr, length))
+			ret = -1;
+		rptr += length;
+	}
+	if (!ret)
+		print_buf->read = rptr;
+
+	return 0;
+}
+
+static int vpu_dbg_inst_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, vpu_dbg_instance, inode->i_private);
+}
+
+static ssize_t vpu_dbg_inst_write(struct file *file,
+			const char __user *user_buf, size_t size, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct vpu_inst *inst = s->private;
+
+	vpu_session_debug(inst);
+
+	return size;
+}
+
+static ssize_t vpu_dbg_core_write(struct file *file,
+			const char __user *user_buf, size_t size, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct vpu_core *core = s->private;
+
+	pm_runtime_get_sync(core->dev);
+	mutex_lock(&core->lock);
+	if (core->state != VPU_CORE_DEINIT && !core->instance_mask) {
+		dev_info(core->dev, "reset\n");
+		if (!vpu_core_sw_reset(core)) {
+			core->state = VPU_CORE_ACTIVE;
+			core->hang_mask = 0;
+		}
+	}
+	mutex_unlock(&core->lock);
+	pm_runtime_put_sync(core->dev);
+
+	return size;
+}
+
+static int vpu_dbg_core_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, vpu_dbg_core, inode->i_private);
+}
+
+static int vpu_dbg_fwlog_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, vpu_dbg_fwlog, inode->i_private);
+}
+
+static const struct file_operations vpu_dbg_inst_fops = {
+	.owner = THIS_MODULE,
+	.open = vpu_dbg_inst_open,
+	.release = single_release,
+	.read = seq_read,
+	.write = vpu_dbg_inst_write,
+};
+
+static const struct file_operations vpu_dbg_core_fops = {
+	.owner = THIS_MODULE,
+	.open = vpu_dbg_core_open,
+	.release = single_release,
+	.read = seq_read,
+	.write = vpu_dbg_core_write,
+};
+
+static const struct file_operations vpu_dbg_fwlog_fops = {
+	.owner = THIS_MODULE,
+	.open = vpu_dbg_fwlog_open,
+	.release = single_release,
+	.read = seq_read,
+};
+
+int vpu_inst_create_dbgfs_file(struct vpu_inst *inst)
+{
+	struct vpu_dev *vpu;
+	char name[64];
+
+	if (!inst || !inst->core || !inst->core->vpu)
+		return -EINVAL;
+
+	vpu = inst->core->vpu;
+	if (!vpu->debugfs)
+		return -EINVAL;
+
+	if (inst->debugfs)
+		return 0;
+
+	scnprintf(name, sizeof(name), "instance.%d.%d",
+			inst->core->id, inst->id);
+	inst->debugfs = debugfs_create_file((const char *)name,
+				VERIFY_OCTAL_PERMISSIONS(0644),
+				vpu->debugfs,
+				inst,
+				&vpu_dbg_inst_fops);
+	if (!inst->debugfs) {
+		dev_err(inst->dev, "vpu create debugfs %s fail\n", name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int vpu_inst_remove_dbgfs_file(struct vpu_inst *inst)
+{
+	if (!inst)
+		return 0;
+
+	debugfs_remove(inst->debugfs);
+	inst->debugfs = NULL;
+
+	return 0;
+}
+
+int vpu_core_create_dbgfs_file(struct vpu_core *core)
+{
+	struct vpu_dev *vpu;
+	char name[64];
+
+	if (!core || !core->vpu)
+		return -EINVAL;
+
+	vpu = core->vpu;
+	if (!vpu->debugfs)
+		return -EINVAL;
+
+	if (!core->debugfs) {
+		scnprintf(name, sizeof(name), "core.%d", core->id);
+		core->debugfs = debugfs_create_file((const char *)name,
+					VERIFY_OCTAL_PERMISSIONS(0644),
+					vpu->debugfs,
+					core,
+					&vpu_dbg_core_fops);
+		if (!core->debugfs) {
+			dev_err(core->dev, "vpu create debugfs %s fail\n", name);
+			return -EINVAL;
+		}
+	}
+	if (!core->debugfs_fwlog) {
+		scnprintf(name, sizeof(name), "fwlog.%d", core->id);
+		core->debugfs_fwlog = debugfs_create_file((const char *)name,
+					VERIFY_OCTAL_PERMISSIONS(0444),
+					vpu->debugfs,
+					core,
+					&vpu_dbg_fwlog_fops);
+		if (!core->debugfs_fwlog) {
+			dev_err(core->dev, "vpu create debugfs %s fail\n", name);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+int vpu_core_remove_dbgfs_file(struct vpu_core *core)
+{
+	if (!core)
+		return 0;
+	debugfs_remove(core->debugfs);
+	core->debugfs = NULL;
+	debugfs_remove(core->debugfs_fwlog);
+	core->debugfs_fwlog = NULL;
+
+	return 0;
+}
+
+void vpu_inst_record_flow(struct vpu_inst *inst, u32 flow)
+{
+	if (!inst)
+		return;
+
+	inst->flows[inst->flow_idx] = flow;
+	inst->flow_idx = (inst->flow_idx + 1) % (ARRAY_SIZE(inst->flows));
+}
diff --git a/drivers/media/platform/amphion/vpu_rpc.c b/drivers/media/platform/amphion/vpu_rpc.c
new file mode 100644
index 000000000000..7b5e9177e010
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_rpc.c
@@ -0,0 +1,279 @@
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
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/firmware/imx/ipc.h>
+#include <linux/firmware/imx/svc/misc.h>
+#include "vpu.h"
+#include "vpu_rpc.h"
+#include "vpu_imx8q.h"
+#include "vpu_windsor.h"
+#include "vpu_malone.h"
+
+u32 vpu_iface_check_memory_region(struct vpu_core *core, dma_addr_t addr, u32 size)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (!ops || !ops->check_memory_region)
+		return VPU_CORE_MEMORY_INVALID;
+
+	return ops->check_memory_region(core->fw.phys, addr, size);
+}
+
+static u32 vpu_rpc_check_buffer_space(struct vpu_rpc_buffer_desc *desc, bool write)
+{
+	u32 ptr1;
+	u32 ptr2;
+	u32 size;
+
+	WARN_ON(!desc);
+
+	size = desc->end - desc->start;
+	if (write) {
+		ptr1 = desc->wptr;
+		ptr2 = desc->rptr;
+	} else {
+		ptr1 = desc->rptr;
+		ptr2 = desc->wptr;
+	}
+
+	if (ptr1 == ptr2) {
+		if (!write)
+			return 0;
+		else
+			return size;
+	}
+
+	return (ptr2 + size - ptr1) % size;
+}
+
+static int vpu_rpc_send_cmd_buf(struct vpu_shared_addr *shared,
+			struct vpu_rpc_event *cmd)
+{
+	struct vpu_rpc_buffer_desc *desc;
+	u32 space = 0;
+	u32 *data;
+	u32 wptr;
+	u32 i;
+
+	WARN_ON(!shared || !shared->cmd_mem_vir || !cmd);
+
+	desc = shared->cmd_desc;
+	space = vpu_rpc_check_buffer_space(desc, true);
+	if (space < (((cmd->hdr.num + 1) << 2) + 16)) {
+		pr_err("Cmd Buffer is no space for [%d] %d\n",
+				cmd->hdr.index, cmd->hdr.id);
+		return -EINVAL;
+	}
+	wptr = desc->wptr;
+	data = (u32 *)(shared->cmd_mem_vir + desc->wptr - desc->start);
+	*data = 0;
+	*data |= ((cmd->hdr.index & 0xff) << 24);
+	*data |= ((cmd->hdr.num & 0xff) << 16);
+	*data |= (cmd->hdr.id & 0x3fff);
+	wptr += 4;
+	data++;
+	if (wptr >= desc->end) {
+		wptr = desc->start;
+		data = shared->cmd_mem_vir;
+	}
+
+	for (i = 0; i < cmd->hdr.num; i++) {
+		*data = cmd->data[i];
+		wptr += 4;
+		data++;
+		if (wptr >= desc->end) {
+			wptr = desc->start;
+			data = shared->cmd_mem_vir;
+		}
+	}
+
+	/*update wptr after data is written*/
+	mb();
+	desc->wptr = wptr;
+
+	return 0;
+}
+
+static bool vpu_rpc_check_msg(struct vpu_shared_addr *shared)
+{
+	struct vpu_rpc_buffer_desc *desc;
+	u32 space = 0;
+	u32 msgword;
+	u32 msgnum;
+
+	WARN_ON(!shared || !shared->msg_desc);
+
+	desc = shared->msg_desc;
+	space = vpu_rpc_check_buffer_space(desc, 0);
+	space = (space >> 2);
+
+	if (space) {
+		msgword = *(u32 *)(shared->msg_mem_vir + desc->rptr - desc->start);
+		msgnum = (msgword & 0xff0000) >> 16;
+		if (msgnum <= space)
+			return true;
+	}
+
+	return false;
+}
+
+static int vpu_rpc_receive_msg_buf(struct vpu_shared_addr *shared, struct vpu_rpc_event *msg)
+{
+	struct vpu_rpc_buffer_desc *desc;
+	u32 *data;
+	u32 msgword;
+	u32 rptr;
+	u32 i;
+
+	WARN_ON(!shared || !shared->msg_desc || !msg);
+
+	if (!vpu_rpc_check_msg(shared))
+		return -EINVAL;
+
+	desc = shared->msg_desc;
+	data = (u32 *)(shared->msg_mem_vir + desc->rptr - desc->start);
+	rptr = desc->rptr;
+	msgword = *data;
+	data++;
+	rptr += 4;
+	if (rptr >= desc->end) {
+		rptr = desc->start;
+		data = shared->msg_mem_vir;
+	}
+
+	msg->hdr.index = (msgword >> 24) & 0xff;
+	msg->hdr.num = (msgword >> 16) & 0xff;
+	msg->hdr.id = msgword & 0x3fff;
+
+	if (msg->hdr.num > ARRAY_SIZE(msg->data)) {
+		pr_err("msg(%d) data length(%d) is out of range\n",
+				msg->hdr.id, msg->hdr.num);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < msg->hdr.num; i++) {
+		msg->data[i] = *data;
+		data++;
+		rptr += 4;
+		if (rptr >= desc->end) {
+			rptr = desc->start;
+			data = shared->msg_mem_vir;
+		}
+	}
+
+	/*update rptr after data is read*/
+	mb();
+	desc->rptr = rptr;
+
+	return 0;
+}
+
+struct vpu_iface_ops imx8q_rpc_ops[] = {
+	[VPU_CORE_TYPE_ENC] = {
+		.check_codec = vpu_imx8q_check_codec,
+		.check_fmt = vpu_imx8q_check_fmt,
+		.boot_core = vpu_imx8q_boot_core,
+		.get_power_state = vpu_imx8q_get_power_state,
+		.on_firmware_loaded = vpu_imx8q_on_firmware_loaded,
+		.get_data_size = vpu_windsor_get_data_size,
+		.check_memory_region = vpu_imx8q_check_memory_region,
+		.init_rpc = vpu_windsor_init_rpc,
+		.set_log_buf = vpu_windsor_set_log_buf,
+		.set_system_cfg = vpu_windsor_set_system_cfg,
+		.get_version = vpu_windsor_get_version,
+		.send_cmd_buf = vpu_rpc_send_cmd_buf,
+		.receive_msg_buf = vpu_rpc_receive_msg_buf,
+		.pack_cmd = vpu_windsor_pack_cmd,
+		.convert_msg_id = vpu_windsor_convert_msg_id,
+		.unpack_msg_data = vpu_windsor_unpack_msg_data,
+		.config_memory_resource = vpu_windsor_config_memory_resource,
+		.get_stream_buffer_size = vpu_windsor_get_stream_buffer_size,
+		.config_stream_buffer = vpu_windsor_config_stream_buffer,
+		.get_stream_buffer_desc = vpu_windsor_get_stream_buffer_desc,
+		.update_stream_buffer = vpu_windsor_update_stream_buffer,
+		.set_encode_params = vpu_windsor_set_encode_params,
+		.input_frame = vpu_windsor_input_frame,
+		.get_max_instance_count = vpu_windsor_get_max_instance_count,
+	},
+	[VPU_CORE_TYPE_DEC] = {
+		.check_codec = vpu_imx8q_check_codec,
+		.check_fmt = vpu_imx8q_check_fmt,
+		.boot_core = vpu_imx8q_boot_core,
+		.get_power_state = vpu_imx8q_get_power_state,
+		.on_firmware_loaded = vpu_imx8q_on_firmware_loaded,
+		.get_data_size = vpu_malone_get_data_size,
+		.check_memory_region = vpu_imx8q_check_memory_region,
+		.init_rpc = vpu_malone_init_rpc,
+		.set_log_buf = vpu_malone_set_log_buf,
+		.set_system_cfg = vpu_malone_set_system_cfg,
+		.get_version = vpu_malone_get_version,
+		.send_cmd_buf = vpu_rpc_send_cmd_buf,
+		.receive_msg_buf = vpu_rpc_receive_msg_buf,
+		.get_stream_buffer_size = vpu_malone_get_stream_buffer_size,
+		.config_stream_buffer = vpu_malone_config_stream_buffer,
+		.set_decode_params = vpu_malone_set_decode_params,
+		.pack_cmd = vpu_malone_pack_cmd,
+		.convert_msg_id = vpu_malone_convert_msg_id,
+		.unpack_msg_data = vpu_malone_unpack_msg_data,
+		.get_stream_buffer_desc = vpu_malone_get_stream_buffer_desc,
+		.update_stream_buffer = vpu_malone_update_stream_buffer,
+		.add_scode = vpu_malone_add_scode,
+		.input_frame = vpu_malone_input_frame,
+		.pre_send_cmd = vpu_malone_pre_cmd,
+		.post_send_cmd = vpu_malone_post_cmd,
+		.init_instance = vpu_malone_init_instance,
+		.get_max_instance_count = vpu_malone_get_max_instance_count,
+	},
+};
+
+
+static struct vpu_iface_ops *vpu_get_iface(struct vpu_dev *vpu, enum vpu_core_type type)
+{
+	struct vpu_iface_ops *rpc_ops = NULL;
+	u32 size = 0;
+
+	WARN_ON(!vpu || !vpu->res);
+
+	switch (vpu->res->plat_type) {
+	case IMX8QXP:
+	case IMX8QM:
+		rpc_ops = imx8q_rpc_ops;
+		size = ARRAY_SIZE(imx8q_rpc_ops);
+		break;
+	default:
+		return NULL;
+	}
+
+	if (type >= size)
+		return NULL;
+
+	return &rpc_ops[type];
+}
+
+struct vpu_iface_ops *vpu_core_get_iface(struct vpu_core *core)
+{
+	WARN_ON(!core || !core->vpu);
+
+	return vpu_get_iface(core->vpu, core->type);
+}
+
+struct vpu_iface_ops *vpu_inst_get_iface(struct vpu_inst *inst)
+{
+	WARN_ON(!inst || !inst->vpu);
+
+	if (inst->core)
+		return vpu_core_get_iface(inst->core);
+
+	return vpu_get_iface(inst->vpu, inst->type);
+}
diff --git a/drivers/media/platform/amphion/vpu_rpc.h b/drivers/media/platform/amphion/vpu_rpc.h
new file mode 100644
index 000000000000..abe998e5a5be
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_rpc.h
@@ -0,0 +1,464 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _AMPHION_VPU_RPC_H
+#define _AMPHION_VPU_RPC_H
+
+#include <media/videobuf2-core.h>
+#include "vpu_codec.h"
+
+struct vpu_rpc_buffer_desc {
+	u32 wptr;
+	u32 rptr;
+	u32 start;
+	u32 end;
+};
+
+struct vpu_shared_addr {
+	void *iface;
+	struct vpu_rpc_buffer_desc *cmd_desc;
+	void *cmd_mem_vir;
+	struct vpu_rpc_buffer_desc *msg_desc;
+	void *msg_mem_vir;
+
+	unsigned long boot_addr;
+	struct vpu_core *core;
+	void *priv;
+};
+
+struct vpu_rpc_event_header {
+	u32 index;
+	u32 id;
+	u32 num;
+};
+
+struct vpu_rpc_event {
+	struct vpu_rpc_event_header hdr;
+	u32 data[128];
+};
+
+struct vpu_iface_ops {
+	bool (*check_codec)(enum vpu_core_type type);
+	bool (*check_fmt)(enum vpu_core_type type, u32 pixelfmt);
+	u32 (*get_data_size)(void);
+	u32 (*check_memory_region)(dma_addr_t base, dma_addr_t addr, u32 size);
+	int (*boot_core)(struct vpu_core *core);
+	int (*shutdown_core)(struct vpu_core *core);
+	int (*restore_core)(struct vpu_core *core);
+	int (*get_power_state)(struct vpu_core *core);
+	int (*on_firmware_loaded)(struct vpu_core *core);
+	void (*init_rpc)(struct vpu_shared_addr *shared,
+			struct vpu_buffer *rpc, dma_addr_t boot_addr);
+	void (*set_log_buf)(struct vpu_shared_addr *shared,
+			struct vpu_buffer *log);
+	void (*set_system_cfg)(struct vpu_shared_addr *shared,
+			u32 regs_base, void __iomem *regs, u32 index);
+	void (*set_stream_cfg)(struct vpu_shared_addr *shared, u32 index);
+	u32 (*get_version)(struct vpu_shared_addr *shared);
+	u32 (*get_max_instance_count)(struct vpu_shared_addr *shared);
+	int (*get_stream_buffer_size)(struct vpu_shared_addr *shared);
+	int (*send_cmd_buf)(struct vpu_shared_addr *shared,
+			struct vpu_rpc_event *cmd);
+	int (*receive_msg_buf)(struct vpu_shared_addr *shared,
+			struct vpu_rpc_event *msg);
+	int (*pack_cmd)(struct vpu_rpc_event *pkt, u32 index, u32 id, void *data);
+	int (*convert_msg_id)(u32 msg_id);
+	int (*unpack_msg_data)(struct vpu_rpc_event *pkt, void *data);
+	int (*input_frame)(struct vpu_shared_addr *shared,
+			struct vpu_inst *inst, struct vb2_buffer *vb);
+	int (*config_memory_resource)(struct vpu_shared_addr *shared,
+					u32 instance,
+					u32 type,
+					u32 index,
+					struct vpu_buffer *buf);
+	int (*config_stream_buffer)(struct vpu_shared_addr *shared,
+					u32 instance,
+					struct vpu_buffer *buf);
+	int (*update_stream_buffer)(struct vpu_shared_addr *shared,
+					u32 instance, u32 ptr, bool write);
+	int (*get_stream_buffer_desc)(struct vpu_shared_addr *shared,
+					u32 instance,
+					struct vpu_rpc_buffer_desc *desc);
+	int (*set_encode_params)(struct vpu_shared_addr *shared,
+			u32 instance,
+			struct vpu_encode_params *params, u32 update);
+	int (*set_decode_params)(struct vpu_shared_addr *shared,
+			u32 instance,
+			struct vpu_decode_params *params, u32 update);
+	int (*add_scode)(struct vpu_shared_addr *shared,
+				u32 instance,
+				struct vpu_buffer *stream_buffer,
+				u32 pixelformat,
+				u32 scode_type);
+	int (*pre_send_cmd)(struct vpu_shared_addr *shared, u32 instance);
+	int (*post_send_cmd)(struct vpu_shared_addr *shared, u32 instance);
+	int (*init_instance)(struct vpu_shared_addr *shared, u32 instance);
+};
+
+enum {
+	VPU_CORE_MEMORY_INVALID = 0,
+	VPU_CORE_MEMORY_CACHED,
+	VPU_CORE_MEMORY_UNCACHED
+};
+
+struct vpu_rpc_region_t {
+	dma_addr_t start;
+	dma_addr_t end;
+	dma_addr_t type;
+};
+
+struct vpu_iface_ops *vpu_core_get_iface(struct vpu_core *core);
+struct vpu_iface_ops *vpu_inst_get_iface(struct vpu_inst *inst);
+u32 vpu_iface_check_memory_region(struct vpu_core *core, dma_addr_t addr, u32 size);
+
+static inline bool vpu_iface_check_codec(struct vpu_core *core)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (ops && ops->check_codec)
+		return ops->check_codec(core->type);
+
+	return true;
+}
+
+static inline bool vpu_iface_check_format(struct vpu_inst *inst, u32 pixelfmt)
+{
+	struct vpu_iface_ops *ops = vpu_inst_get_iface(inst);
+
+	if (ops && ops->check_fmt)
+		return ops->check_fmt(inst->type, pixelfmt);
+
+	return true;
+}
+
+static inline int vpu_iface_boot_core(struct vpu_core *core)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (ops && ops->boot_core)
+		return ops->boot_core(core);
+	return 0;
+}
+
+static inline int vpu_iface_get_power_state(struct vpu_core *core)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (ops && ops->get_power_state)
+		return ops->get_power_state(core);
+	return 1;
+}
+
+static inline int vpu_iface_shutdown_core(struct vpu_core *core)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (ops && ops->shutdown_core)
+		return ops->shutdown_core(core);
+	return 0;
+}
+
+static inline int vpu_iface_restore_core(struct vpu_core *core)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (ops && ops->restore_core)
+		return ops->restore_core(core);
+	return 0;
+}
+
+static inline int vpu_iface_on_firmware_loaded(struct vpu_core *core)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (ops && ops->on_firmware_loaded)
+		return ops->on_firmware_loaded(core);
+
+	return 0;
+}
+
+static inline u32 vpu_iface_get_data_size(struct vpu_core *core)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (!ops || !ops->get_data_size)
+		return 0;
+
+	return ops->get_data_size();
+}
+
+static inline int vpu_iface_init(struct vpu_core *core,
+				struct vpu_shared_addr *shared,
+				struct vpu_buffer *rpc,
+				dma_addr_t boot_addr)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (!ops || !ops->init_rpc)
+		return -EINVAL;
+
+	ops->init_rpc(shared, rpc, boot_addr);
+	core->iface = shared;
+	shared->core = core;
+	if (rpc->bytesused > rpc->length)
+		return -ENOSPC;
+	return 0;
+}
+
+static inline int vpu_iface_set_log_buf(struct vpu_core *core,
+					struct vpu_buffer *log)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (!ops)
+		return -EINVAL;
+
+	if (ops->set_log_buf)
+		ops->set_log_buf(core->iface, log);
+
+	return 0;
+}
+
+static inline int vpu_iface_config_system(struct vpu_core *core,
+		u32 regs_base, void __iomem *regs)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (!ops)
+		return -EINVAL;
+	if (ops->set_system_cfg)
+		ops->set_system_cfg(core->iface, regs_base, regs, core->id);
+
+	return 0;
+}
+
+static inline int vpu_iface_get_stream_buffer_size(struct vpu_core *core)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (!ops || !ops->get_stream_buffer_size)
+		return 0;
+
+	return ops->get_stream_buffer_size(core->iface);
+}
+
+static inline int vpu_iface_config_stream(struct vpu_inst *inst)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(inst->core);
+
+	WARN_ON(inst->id < 0);
+	if (!ops)
+		return -EINVAL;
+	if (ops->set_stream_cfg)
+		ops->set_stream_cfg(inst->core->iface, inst->id);
+	return 0;
+}
+
+static inline int vpu_iface_send_cmd(struct vpu_core *core, struct vpu_rpc_event *cmd)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (!ops || !ops->send_cmd_buf)
+		return -EINVAL;
+
+	return ops->send_cmd_buf(core->iface, cmd);
+}
+
+static inline int vpu_iface_receive_msg(struct vpu_core *core, struct vpu_rpc_event *msg)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (!ops || !ops->receive_msg_buf)
+		return -EINVAL;
+
+	return ops->receive_msg_buf(core->iface, msg);
+}
+
+static inline int vpu_iface_pack_cmd(struct vpu_core *core,
+					struct vpu_rpc_event *pkt,
+					u32 index, u32 id, void *data)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (!ops || !ops->pack_cmd)
+		return -EINVAL;
+	return ops->pack_cmd(pkt, index, id, data);
+}
+
+static inline int vpu_iface_convert_msg_id(struct vpu_core *core, u32 msg_id)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (!ops || !ops->convert_msg_id)
+		return -EINVAL;
+
+	return ops->convert_msg_id(msg_id);
+}
+
+static inline int vpu_iface_unpack_msg_data(struct vpu_core *core,
+						struct vpu_rpc_event *pkt, void *data)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (!ops || !ops->unpack_msg_data)
+		return -EINVAL;
+
+	return ops->unpack_msg_data(pkt, data);
+}
+
+static inline int vpu_iface_input_frame(struct vpu_inst *inst,
+						struct vb2_buffer *vb)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(inst->core);
+
+	if (!ops || !ops->input_frame)
+		return -EINVAL;
+
+	return ops->input_frame(inst->core->iface, inst, vb);
+}
+
+static inline int vpu_iface_config_memory_resource(struct vpu_inst *inst,
+			u32 type, u32 index, struct vpu_buffer *buf)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(inst->core);
+
+	WARN_ON(inst->id < 0);
+	if (!ops || !ops->config_memory_resource)
+		return -EINVAL;
+
+	return ops->config_memory_resource(inst->core->iface,
+					inst->id,
+					type, index, buf);
+}
+
+static inline int vpu_iface_config_stream_buffer(struct vpu_inst *inst,
+						struct vpu_buffer *buf)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(inst->core);
+
+	WARN_ON(inst->id < 0);
+	if (!ops || !ops->config_stream_buffer)
+		return -EINVAL;
+
+	return ops->config_stream_buffer(inst->core->iface, inst->id, buf);
+}
+
+static inline int vpu_iface_update_stream_buffer(struct vpu_inst *inst,
+						u32 ptr, bool write)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(inst->core);
+
+	WARN_ON(inst->id < 0);
+	if (!ops || !ops->update_stream_buffer)
+		return -EINVAL;
+
+	return ops->update_stream_buffer(inst->core->iface, inst->id, ptr, write);
+}
+
+static inline int vpu_iface_get_stream_buffer_desc(struct vpu_inst *inst,
+					struct vpu_rpc_buffer_desc *desc)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(inst->core);
+
+	WARN_ON(inst->id < 0);
+	if (!ops || !ops->get_stream_buffer_desc)
+		return -EINVAL;
+
+	if (!desc)
+		return 0;
+
+	return ops->get_stream_buffer_desc(inst->core->iface, inst->id, desc);
+}
+
+static inline u32 vpu_iface_get_version(struct vpu_core *core)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (!ops || !ops->get_version)
+		return 0;
+
+	return ops->get_version(core->iface);
+}
+
+static inline u32 vpu_iface_get_max_instance_count(struct vpu_core *core)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(core);
+
+	if (!ops || !ops->get_max_instance_count)
+		return 0;
+
+	return ops->get_max_instance_count(core->iface);
+}
+
+static inline int vpu_iface_set_encode_params(struct vpu_inst *inst,
+				struct vpu_encode_params *params, u32 update)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(inst->core);
+
+	WARN_ON(inst->id < 0);
+	if (!ops || !ops->set_encode_params)
+		return -EINVAL;
+
+	return ops->set_encode_params(inst->core->iface, inst->id, params, update);
+}
+
+static inline int vpu_iface_set_decode_params(struct vpu_inst *inst,
+				struct vpu_decode_params *params, u32 update)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(inst->core);
+
+	WARN_ON(inst->id < 0);
+	if (!ops || !ops->set_decode_params)
+		return -EINVAL;
+
+	return ops->set_decode_params(inst->core->iface, inst->id, params, update);
+}
+
+static inline int vpu_iface_add_scode(struct vpu_inst *inst, u32 scode_type)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(inst->core);
+
+	WARN_ON(inst->id < 0);
+	if (!ops || !ops->add_scode)
+		return -EINVAL;
+
+	return ops->add_scode(inst->core->iface, inst->id,
+				&inst->stream_buffer,
+				inst->out_format.pixfmt,
+				scode_type);
+}
+
+static inline int vpu_iface_pre_send_cmd(struct vpu_inst *inst)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(inst->core);
+
+	WARN_ON(inst->id < 0);
+	if (ops && ops->pre_send_cmd)
+		return ops->pre_send_cmd(inst->core->iface, inst->id);
+	return 0;
+}
+
+static inline int vpu_iface_post_send_cmd(struct vpu_inst *inst)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(inst->core);
+
+	WARN_ON(inst->id < 0);
+	if (ops && ops->post_send_cmd)
+		return ops->post_send_cmd(inst->core->iface, inst->id);
+	return 0;
+}
+
+static inline int vpu_iface_init_instance(struct vpu_inst *inst)
+{
+	struct vpu_iface_ops *ops = vpu_core_get_iface(inst->core);
+
+	WARN_ON(inst->id < 0);
+	if (ops && ops->init_instance)
+		return ops->init_instance(inst->core->iface, inst->id);
+
+	return 0;
+}
+
+#endif
-- 
2.33.0


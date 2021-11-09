Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DC944AA44
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 10:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244793AbhKIJNl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 04:13:41 -0500
Received: from mail-eopbgr140087.outbound.protection.outlook.com ([40.107.14.87]:55280
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244786AbhKIJNT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 04:13:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIhOyL9LsYY3v9a/DFUkhhqmeap3bwgzFrHgPXXy3dYt6pWDS3TvG4s04NVLiS0duGphNClk/JjI/5qPjQ+KI36zpqxCoGGZSJyia+KVVE/qkCidMuDgAt2BZ3K/jcM7DLdw7Q0mPQfM7lcuk0dK6KlnUiYv2qRIu6THBKutdDqsfTEdP0gtDZc3ofaNHvnqgPAFQ/4Glu2dnq5uJdy5/ViMO5c7CxuFzjNJEdJ3QNUZ7/Wymm0IbTnz9X+rCkuGbhfqFtulcekYi2IDTrPaIbrydAnvO03bpl6jPCj3XiadDEM07tsSTJnMhrt6TTxttTTarvf8B9gpAmB3YYRNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hCERVCB//xgsVciVmNv/Lef0yxaqxjAzT2JGytlAoU=;
 b=XGuOvAkJRcAXU+oBxQiJoLmYk2AGHoVqCZ0tx0Inm7yibBrnuCOUlbCDUcy1FZTEof22ZOyUlShP/PQdcAF5ZgEI+NZ1GnxwmZQ9aFeZdRwHyqz55Y1/9d9wZWJPfp4HFI4UVcFzWM0SmFNqdrNB2V15pvd0OJqhu0fn4mxIgfRWB3BdiH3L87hBfwBPuSgZfqnDXqQ0XpyKsfQZsGHMHuCW17t3iAEmqvFs/ncPBg782tkzKg7e7JRpJRTW1/hihw6U3ypChC8R2xaGuFXWJLPzDqAb68HnWdNikeXM4g0JxSkUMCq3O6IFSvrU0IJtZICAm9MCkDZzC3ve6iVKYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hCERVCB//xgsVciVmNv/Lef0yxaqxjAzT2JGytlAoU=;
 b=rvQ3bE6q3KWb9CerYkNjRSQCJWPiBRchaWWpEHMu+OfgOr8Gd6atEVpgjllUvjHijlkkfuvwoS+pRwuMG8MRhef70Xxt7ICpro2/MTw/YY6hiPpMRJf2qzuDNIaSN0gJI5X2YxuGdmk8LsAmtuZVO/0s14JX+X0hrHHXY1Kn2kU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB8278.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 9 Nov
 2021 09:10:27 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:10:27 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 10/13] media: amphion: implement malone decoder rpc interface
Date:   Tue,  9 Nov 2021 17:09:09 +0800
Message-Id: <90f528f34e8c5cfdc205c8191544d2960e80def4.1636445575.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1636445575.git.ming.qian@nxp.com>
References: <cover.1636445575.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend Transport; Tue, 9 Nov 2021 09:10:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2344a107-f88c-460b-601e-08d9a360c50e
X-MS-TrafficTypeDiagnostic: AS8PR04MB8278:
X-Microsoft-Antispam-PRVS: <AS8PR04MB82783547F6007FCA5DF3357AE7929@AS8PR04MB8278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:184;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gtCg+zHDEeHcGsYfawiFKnKSfKoj/9C9mSx/If9lUnJBM8LJrJB3Bh4sOqQfpdZhHdQIq5cU2r4I2d84ohwsXQzKBpgKQ3rG5rd+TV3EMZx7/IxygPKta6QH7nyaOMNizajfloHrP+6487CxXV9V5fBTta23TSrjCY0dxiG73Ldd9Ux+WpiiDB7jEkcBjwdqhsIElHYFMJMM58KC3hwCMy9kLurrphf5sUQXd3yluwMUQecMHPlp3CatE0cENEH/wzMuKM1TFrdW0kY69OfZ6chQoIXqz9eeh8f0XSfOfSXyOVmI0knPDTpsgiYPtXRit0hniBNyNhlDvWPF1HZqvnBcy4/pznrrWNLROzFF+O5odP6InxgAtMmJ1EKpEMp9nAoyC9c+QF4ejbFbYv4N06NTzQK9VAV/tLg9ae+aUggnVLzYEO1TeKkW0aYr5mFaZ2Nc4753kOhmgVC4pZxlUm3SB/BR+PslhNi2Gutl4AHrrdu0jDyk1eQyxZnfzgE1OcN+KKgGT5REZXcu7lMfFoUCC7Iydmal6ry8zlHhO5QMiMCisMaGIhFC1aAhSCrxEpplvy1bhi5FrMStj5ZtA6K01+Ni/vJLUQlj9gs93xF/qIHuP2P3X/NRd1Ev+dz1+EC5rkLVg32TU8P74QlCza7AbTq8C6a/PztEwEJSMfNgtAdYM/JFr0kHoA6ebhel6bn1JgivdERiKtA94lf6UQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(86362001)(508600001)(6666004)(30864003)(38100700002)(6486002)(956004)(4326008)(44832011)(5660300002)(26005)(316002)(7696005)(52116002)(38350700002)(2906002)(186003)(8936002)(36756003)(66476007)(66556008)(8676002)(7416002)(83380400001)(66946007)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P2Ed9ntTr72SFWK6YCQhlG5klbIrWVKPbUCQ7qkZ36IQpaNUtRZaFPSO9ECS?=
 =?us-ascii?Q?Z1rs3egSAPWcz+eMvH156qM/wqpv0uyytMPaPcxcGRwGjPnKuJ6OyyZmM43o?=
 =?us-ascii?Q?BI2aOKzM9XWH7+mPbqpBs6C0+GDWMRmNEK03mQRtmpKCzrtN+F8/AgaLHpse?=
 =?us-ascii?Q?BFX1e2GLgiVXHP3Bjc7PXz3FI70LjbgSopgw5A8EnkWJW7H1bYNdIQvG9JQi?=
 =?us-ascii?Q?nwu5Ig2JfgByp3I5E9stFSbswsoMnfDfdlMdRDxBBMc/IPfG5Yv4gDZG4PIL?=
 =?us-ascii?Q?drnEQ5F7Cps28xiOaYqpkBQdBnTDHFxSP3/rd4zNa6Dm+SESy84VXiI79qbF?=
 =?us-ascii?Q?byQM0OhuoR93rNBEjRlm5A2bTWMXZFXjIZ6EnIyKhWr2yEBwUZ9cblR/aZS+?=
 =?us-ascii?Q?cQv6WdJx/JYVTsmb6SjyQrZXjfB3I7NwLpW1Ky8owIp/i8ZboKiWvg5swoiL?=
 =?us-ascii?Q?P1XPeDHLcxNi0mI+0dwsFrOtII91tC2WTSAwMhH5O/4FpJknYD4HilF0OuNn?=
 =?us-ascii?Q?CrFJywMR5c8t/kQRHnn6EUZwL9kIt9LE+MIWdpCp/OFc0SH5ZP0TUvNYl99b?=
 =?us-ascii?Q?KD53Z6HPhomGkGwrJ0fVL6h7d26N8+EdajkumNqy/gKTnbhHu6bhO6pGfu1V?=
 =?us-ascii?Q?jy3YKS5UEd7p11eTMRXrJ5ilQly3aULYqtLxj9G9XufoqRljiGln17GZ0WN6?=
 =?us-ascii?Q?YwhU7NFd4ZMUPiDj5Pu/LwxfOI56UGW8IkU271aE6pS23lTXl80Q0mgCUuoo?=
 =?us-ascii?Q?kNBvtAh0UCOtNfFhP1Oe2/oDI6Z+iI/wk3eN3vBqkvwCx4MJM/hdcds5x1b9?=
 =?us-ascii?Q?40wqPdKDxhzMUNZcK/Z6KiR3jLsVH4X6LVB7Ks1bXUFWYOun4OBZPI9Cy5zp?=
 =?us-ascii?Q?jUX70rIDhJhOFrbTm+h5KYTGriirijV3+SmsbbqyQjwrz9Z1/DGFRBnutJ6O?=
 =?us-ascii?Q?jt15ep2kgpCiX5TQbkNdiLjk64WU/XbdUwEqSNiq+Ko1qFqfNLa/mLZWBdz1?=
 =?us-ascii?Q?s4F3656Mfc3KCs/7Hxz4S57UJncRljjf2LLHBs3emOqK1UHgRyvq7DeJCDx9?=
 =?us-ascii?Q?+xCqZlMiRkK5mwUaGp2nDEGMTEVFU/XMgiLRAk6PKyaolAAVb8qPXdffaLTP?=
 =?us-ascii?Q?N3BzKNUuk6GUYqFImfQEuH4WBzupy0p8KcuuD42ziJPjQbVayK9tHxkqJdB9?=
 =?us-ascii?Q?ZOheLu6SI3ULcaiVOlSmH5sVwfH8ffdwUE5D6Un4Sx90IwJtkifw1t/HwVko?=
 =?us-ascii?Q?2bj4o/ynNFlklRjbGVWqUCUPpKandl2Aq0RYloLCd4OYdecGLuzj1zH8dEJ3?=
 =?us-ascii?Q?/zwdf/kwpErlcB3Cse4VMno+bkU/1rg8vQzg74FlhCxJyWYsMwPNU8xS3Mnx?=
 =?us-ascii?Q?ZXegRqNSAxbR3ULUiwW4IhahrIhxYRT5NxjbYUT58Y0R3YtDKZIeCwPfKFe4?=
 =?us-ascii?Q?9vFa8C6joql8EbsjBqc4hayN6ODqemQFsYwgp0ixpfCDAUxVNJoFn9Al+Gsb?=
 =?us-ascii?Q?liX+/ssiT6kcRg50mMI2DIaAC6JD+2dNbuPzcCmTnU6s4L7MtWABykZCpaIC?=
 =?us-ascii?Q?G6pzQm0b/RWsl7oe8QMsXrjk1KedjcBcWOQzqdfnwj2K1L1cTzg7KqKK0bRT?=
 =?us-ascii?Q?mSrnV+hqJEV0OIXFHWnNMkw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2344a107-f88c-460b-601e-08d9a360c50e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:10:27.1595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/i6qOiw/bctF96dGNiUEzfEpcI5ElQhjJVCvIdp2j+VYalfHxC0eamYmGPXaKWa5hVI/RQ0I6Vh7jCMMO1WwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8278
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This part implements the malone decoder rpc interface.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 drivers/media/platform/amphion/vpu_malone.c | 1679 +++++++++++++++++++
 drivers/media/platform/amphion/vpu_malone.h |   42 +
 2 files changed, 1721 insertions(+)
 create mode 100644 drivers/media/platform/amphion/vpu_malone.c
 create mode 100644 drivers/media/platform/amphion/vpu_malone.h

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
new file mode 100644
index 000000000000..d04d26054dda
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -0,0 +1,1679 @@
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
+#include <linux/delay.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include <linux/videodev2.h>
+#include "vpu.h"
+#include "vpu_rpc.h"
+#include "vpu_defs.h"
+#include "vpu_helpers.h"
+#include "vpu_v4l2.h"
+#include "vpu_cmds.h"
+#include "vpu_imx8q.h"
+#include "vpu_malone.h"
+
+#define CMD_SIZE			25600
+#define MSG_SIZE			25600
+#define CODEC_SIZE			0x1000
+#define JPEG_SIZE			0x1000
+#define SEQ_SIZE			0x1000
+#define GOP_SIZE			0x1000
+#define PIC_SIZE			0x1000
+#define QMETER_SIZE			0x1000
+#define DBGLOG_SIZE			0x10000
+#define DEBUG_SIZE			0x80000
+#define ENG_SIZE			0x1000
+#define MALONE_SKIPPED_FRAME_ID		0x555
+
+#define MALONE_ALIGN_MBI		0x800
+#define MALONE_DCP_CHUNK_BIT		16
+#define MALONE_DCP_SIZE_MAX		0x3000000
+#define MALONE_DCP_SIZE_MIN		0x100000
+#define MALONE_DCP_FIXED_MB_ALLOC	250
+
+#define CONFIG_SET(val, cfg, pos, mask)		\
+		(*(cfg) |= (((val) << (pos)) & (mask)))
+//x means source data , y means destination data
+#define STREAM_CONFIG_FORMAT_SET(x, y)		CONFIG_SET(x, y, 0, 0x0000000F)
+#define STREAM_CONFIG_STRBUFIDX_SET(x, y)	CONFIG_SET(x, y, 8, 0x00000300)
+#define STREAM_CONFIG_NOSEQ_SET(x, y)		CONFIG_SET(x, y, 10, 0x00000400)
+#define STREAM_CONFIG_DEBLOCK_SET(x, y)		CONFIG_SET(x, y, 11, 0x00000800)
+#define STREAM_CONFIG_DERING_SET(x, y)		CONFIG_SET(x, y, 12, 0x00001000)
+#define STREAM_CONFIG_IBWAIT_SET(x, y)		CONFIG_SET(x, y, 13, 0x00002000)
+#define STREAM_CONFIG_FBC_SET(x, y)		CONFIG_SET(x, y, 14, 0x00004000)
+#define STREAM_CONFIG_PLAY_MODE_SET(x, y)	CONFIG_SET(x, y, 16, 0x00030000)
+#define STREAM_CONFIG_ENABLE_DCP_SET(x, y)	CONFIG_SET(x, y, 20, 0x00100000)
+#define STREAM_CONFIG_NUM_STR_BUF_SET(x, y)	CONFIG_SET(x, y, 21, 0x00600000)
+#define STREAM_CONFIG_MALONE_USAGE_SET(x, y)	CONFIG_SET(x, y, 23, 0x01800000)
+#define STREAM_CONFIG_MULTI_VID_SET(x, y)	CONFIG_SET(x, y, 25, 0x02000000)
+#define STREAM_CONFIG_OBFUSC_EN_SET(x, y)	CONFIG_SET(x, y, 26, 0x04000000)
+#define STREAM_CONFIG_RC4_EN_SET(x, y)		CONFIG_SET(x, y, 27, 0x08000000)
+#define STREAM_CONFIG_MCX_SET(x, y)		CONFIG_SET(x, y, 28, 0x10000000)
+#define STREAM_CONFIG_PES_SET(x, y)		CONFIG_SET(x, y, 29, 0x20000000)
+#define STREAM_CONFIG_NUM_DBE_SET(x, y)		CONFIG_SET(x, y, 30, 0x40000000)
+#define STREAM_CONFIG_FS_CTRL_MODE_SET(x, y)	CONFIG_SET(x, y, 31, 0x80000000)
+
+enum vpu_malone_stream_input_mode {
+	INVALID_MODE = 0,
+	FRAME_LVL,
+	NON_FRAME_LVL
+};
+
+enum vpu_malone_format {
+	MALONE_FMT_NULL = 0x0,
+	MALONE_FMT_AVC  = 0x1,
+	MALONE_FMT_MP2  = 0x2,
+	MALONE_FMT_VC1  = 0x3,
+	MALONE_FMT_AVS  = 0x4,
+	MALONE_FMT_ASP  = 0x5,
+	MALONE_FMT_JPG  = 0x6,
+	MALONE_FMT_RV   = 0x7,
+	MALONE_FMT_VP6  = 0x8,
+	MALONE_FMT_SPK  = 0x9,
+	MALONE_FMT_VP8  = 0xA,
+	MALONE_FMT_HEVC = 0xB,
+	MALONE_FMT_LAST = MALONE_FMT_HEVC
+};
+
+enum {
+	VID_API_CMD_NULL              = 0x00,
+	VID_API_CMD_PARSE_NEXT_SEQ    = 0x01,
+	VID_API_CMD_PARSE_NEXT_I      = 0x02,
+	VID_API_CMD_PARSE_NEXT_IP     = 0x03,
+	VID_API_CMD_PARSE_NEXT_ANY    = 0x04,
+	VID_API_CMD_DEC_PIC           = 0x05,
+	VID_API_CMD_UPDATE_ES_WR_PTR  = 0x06,
+	VID_API_CMD_UPDATE_ES_RD_PTR  = 0x07,
+	VID_API_CMD_UPDATE_UDATA      = 0x08,
+	VID_API_CMD_GET_FSINFO        = 0x09,
+	VID_API_CMD_SKIP_PIC          = 0x0a,
+	VID_API_CMD_DEC_CHUNK         = 0x0b,
+	VID_API_CMD_START             = 0x10,
+	VID_API_CMD_STOP              = 0x11,
+	VID_API_CMD_ABORT             = 0x12,
+	VID_API_CMD_RST_BUF           = 0x13,
+	VID_API_CMD_FS_RELEASE        = 0x15,
+	VID_API_CMD_MEM_REGION_ATTACH = 0x16,
+	VID_API_CMD_MEM_REGION_DETACH = 0x17,
+	VID_API_CMD_MVC_VIEW_SELECT   = 0x18,
+	VID_API_CMD_FS_ALLOC          = 0x19,
+	VID_API_CMD_DBG_GET_STATUS    = 0x1C,
+	VID_API_CMD_DBG_START_LOG     = 0x1D,
+	VID_API_CMD_DBG_STOP_LOG      = 0x1E,
+	VID_API_CMD_DBG_DUMP_LOG      = 0x1F,
+	VID_API_CMD_YUV_READY         = 0x20,
+	VID_API_CMD_TS                = 0x21,
+
+	VID_API_CMD_FIRM_RESET        = 0x40,
+
+	VID_API_CMD_SNAPSHOT          = 0xAA,
+	VID_API_CMD_ROLL_SNAPSHOT     = 0xAB,
+	VID_API_CMD_LOCK_SCHEDULER    = 0xAC,
+	VID_API_CMD_UNLOCK_SCHEDULER  = 0xAD,
+	VID_API_CMD_CQ_FIFO_DUMP      = 0xAE,
+	VID_API_CMD_DBG_FIFO_DUMP     = 0xAF,
+	VID_API_CMD_SVC_ILP           = 0xBB,
+	VID_API_CMD_FW_STATUS         = 0xF0,
+	VID_API_CMD_INVALID           = 0xFF
+};
+
+enum {
+	VID_API_EVENT_NULL			= 0x00,
+	VID_API_EVENT_RESET_DONE		= 0x01,
+	VID_API_EVENT_SEQ_HDR_FOUND		= 0x02,
+	VID_API_EVENT_PIC_HDR_FOUND		= 0x03,
+	VID_API_EVENT_PIC_DECODED		= 0x04,
+	VID_API_EVENT_FIFO_LOW			= 0x05,
+	VID_API_EVENT_FIFO_HIGH			= 0x06,
+	VID_API_EVENT_FIFO_EMPTY		= 0x07,
+	VID_API_EVENT_FIFO_FULL			= 0x08,
+	VID_API_EVENT_BS_ERROR			= 0x09,
+	VID_API_EVENT_UDATA_FIFO_UPTD		= 0x0A,
+	VID_API_EVENT_RES_CHANGE		= 0x0B,
+	VID_API_EVENT_FIFO_OVF			= 0x0C,
+	VID_API_EVENT_CHUNK_DECODED		= 0x0D,
+	VID_API_EVENT_REQ_FRAME_BUFF		= 0x10,
+	VID_API_EVENT_FRAME_BUFF_RDY		= 0x11,
+	VID_API_EVENT_REL_FRAME_BUFF		= 0x12,
+	VID_API_EVENT_STR_BUF_RST		= 0x13,
+	VID_API_EVENT_RET_PING			= 0x14,
+	VID_API_EVENT_QMETER			= 0x15,
+	VID_API_EVENT_STR_FMT_CHANGE		= 0x16,
+	VID_API_EVENT_FIRMWARE_XCPT		= 0x17,
+	VID_API_EVENT_START_DONE		= 0x18,
+	VID_API_EVENT_STOPPED			= 0x19,
+	VID_API_EVENT_ABORT_DONE		= 0x1A,
+	VID_API_EVENT_FINISHED			= 0x1B,
+	VID_API_EVENT_DBG_STAT_UPDATE		= 0x1C,
+	VID_API_EVENT_DBG_LOG_STARTED		= 0x1D,
+	VID_API_EVENT_DBG_LOG_STOPPED		= 0x1E,
+	VID_API_EVENT_DBG_LOG_UPDATED		= 0x1F,
+	VID_API_EVENT_DBG_MSG_DEC		= 0x20,
+	VID_API_EVENT_DEC_SC_ERR		= 0x21,
+	VID_API_EVENT_CQ_FIFO_DUMP		= 0x22,
+	VID_API_EVENT_DBG_FIFO_DUMP		= 0x23,
+	VID_API_EVENT_DEC_CHECK_RES		= 0x24,
+	VID_API_EVENT_DEC_CFG_INFO		= 0x25,
+	VID_API_EVENT_UNSUPPORTED_STREAM	= 0x26,
+	VID_API_EVENT_STR_SUSPENDED		= 0x30,
+	VID_API_EVENT_SNAPSHOT_DONE		= 0x40,
+	VID_API_EVENT_FW_STATUS                 = 0xF0,
+	VID_API_EVENT_INVALID			= 0xFF
+};
+
+struct vpu_malone_buffer_desc {
+	struct vpu_rpc_buffer_desc buffer;
+	u32 low;
+	u32 high;
+};
+
+struct vpu_malone_str_buffer {
+	u32 wptr;
+	u32 rptr;
+	u32 start;
+	u32 end;
+	u32 lwm;
+};
+
+struct vpu_malone_picth_info {
+	u32 frame_pitch;
+};
+
+struct vpu_malone_table_desc {
+	u32 array_base;
+	u32 size;
+};
+
+struct vpu_malone_dbglog_desc {
+	u32 addr;
+	u32 size;
+	u32 level;
+	u32 reserved;
+};
+
+struct vpu_malone_frame_buffer {
+	u32 addr;
+	u32 size;
+};
+
+struct vpu_malone_udata {
+	u32 base;
+	u32 total_size;
+	u32 slot_size;
+};
+
+struct vpu_malone_buffer_info {
+	u32 stream_input_mode;
+	u32 stream_pic_input_count;
+	u32 stream_pic_parsed_count;
+	u32 stream_buffer_threshold;
+	u32 stream_pic_end_flag;
+};
+
+struct vpu_malone_encrypt_info {
+	u32 rec4key[8];
+	u32 obfusc;
+};
+
+struct malone_iface {
+	u32 exec_base_addr;
+	u32 exec_area_size;
+	struct vpu_malone_buffer_desc cmd_buffer_desc;
+	struct vpu_malone_buffer_desc msg_buffer_desc;
+	u32 cmd_int_enable[VID_API_NUM_STREAMS];
+	struct vpu_malone_picth_info stream_pitch_info[VID_API_NUM_STREAMS];
+	u32 stream_config[VID_API_NUM_STREAMS];
+	struct vpu_malone_table_desc codec_param_tab_desc;
+	struct vpu_malone_table_desc jpeg_param_tab_desc;
+	u32 stream_buffer_desc[VID_API_NUM_STREAMS][VID_API_MAX_BUF_PER_STR];
+	struct vpu_malone_table_desc seq_info_tab_desc;
+	struct vpu_malone_table_desc pic_info_tab_desc;
+	struct vpu_malone_table_desc gop_info_tab_desc;
+	struct vpu_malone_table_desc qmeter_info_tab_desc;
+	u32 stream_error[VID_API_NUM_STREAMS];
+	u32 fw_version;
+	u32 fw_offset;
+	u32 max_streams;
+	struct vpu_malone_dbglog_desc dbglog_desc;
+	struct vpu_rpc_buffer_desc api_cmd_buffer_desc[VID_API_NUM_STREAMS];
+	struct vpu_malone_udata udata_buffer[VID_API_NUM_STREAMS];
+	struct vpu_malone_buffer_desc debug_buffer_desc;
+	struct vpu_malone_buffer_desc eng_access_buff_desc[VID_API_NUM_STREAMS];
+	u32 encrypt_info[VID_API_NUM_STREAMS];
+	struct vpu_rpc_system_config system_cfg;
+	u32 api_version;
+	struct vpu_malone_buffer_info stream_buff_info[VID_API_NUM_STREAMS];
+};
+
+struct malone_jpg_params {
+	u32 rotation_angle;
+	u32 horiz_scale_factor;
+	u32 vert_scale_factor;
+	u32 rotation_mode;
+	u32 rgb_mode;
+	u32 chunk_mode; /* 0 ~ 1 */
+	u32 last_chunk; /* 0 ~ 1 */
+	u32 chunk_rows; /* 0 ~ 255 */
+	u32 num_bytes;
+	u32 jpg_crop_x;
+	u32 jpg_crop_y;
+	u32 jpg_crop_width;
+	u32 jpg_crop_height;
+	u32 jpg_mjpeg_mode;
+	u32 jpg_mjpeg_interlaced;
+};
+
+struct malone_codec_params {
+	u32 disp_imm;
+	u32 fourcc;
+	u32 codec_version;
+	u32 frame_rate;
+	u32 dbglog_enable;
+	u32 bsdma_lwm;
+	u32 bbd_coring;
+	u32 bbd_s_thr_row;
+	u32 bbd_p_thr_row;
+	u32 bbd_s_thr_logo_row;
+	u32 bbd_p_thr_logo_row;
+	u32 bbd_s_thr_col;
+	u32 bbd_p_thr_col;
+	u32 bbd_chr_thr_row;
+	u32 bbd_chr_thr_col;
+	u32 bbd_uv_mid_level;
+	u32 bbd_excl_win_mb_left;
+	u32 bbd_excl_win_mb_right;
+};
+
+struct malone_padding_scode {
+	u32 scode_type;
+	u32 pixelformat;
+	u32 data[2];
+};
+
+struct malone_fmt_mapping {
+	u32 pixelformat;
+	enum vpu_malone_format malone_format;
+};
+
+struct malone_scode_t {
+	struct vpu_inst *inst;
+	struct vb2_buffer *vb;
+	u32 wptr;
+	u32 need_data;
+};
+
+struct malone_scode_handler {
+	u32 pixelformat;
+	int (*insert_scode_seq)(struct malone_scode_t *scode);
+	int (*insert_scode_pic)(struct malone_scode_t *scode);
+};
+
+struct vpu_dec_ctrl {
+	struct malone_codec_params *codec_param;
+	struct malone_jpg_params *jpg;
+	void *seq_mem;
+	void *pic_mem;
+	void *gop_mem;
+	void *qmeter_mem;
+	void *dbglog_mem;
+	struct vpu_malone_str_buffer *str_buf[VID_API_NUM_STREAMS];
+	u32 buf_addr[VID_API_NUM_STREAMS];
+};
+
+u32 vpu_malone_get_data_size(void)
+{
+	return sizeof(struct vpu_dec_ctrl);
+}
+
+void vpu_malone_init_rpc(struct vpu_shared_addr *shared,
+			struct vpu_buffer *rpc, dma_addr_t boot_addr)
+{
+	struct malone_iface *iface;
+	struct vpu_dec_ctrl *hc;
+	unsigned long base_phy_addr;
+	unsigned long phy_addr;
+	unsigned long offset;
+	unsigned int i;
+
+	WARN_ON(!shared || !shared->priv);
+	WARN_ON(!rpc || !rpc->phys || !rpc->length || rpc->phys < boot_addr);
+
+	iface = rpc->virt;
+	base_phy_addr = rpc->phys - boot_addr;
+	hc = shared->priv;
+
+	shared->iface = iface;
+	shared->boot_addr = boot_addr;
+
+	iface->exec_base_addr = base_phy_addr;
+	iface->exec_area_size = rpc->length;
+
+	offset = sizeof(struct malone_iface);
+	phy_addr = base_phy_addr + offset;
+
+	shared->cmd_desc = &iface->cmd_buffer_desc.buffer;
+	shared->cmd_mem_vir = rpc->virt + offset;
+	iface->cmd_buffer_desc.buffer.start =
+	iface->cmd_buffer_desc.buffer.rptr =
+	iface->cmd_buffer_desc.buffer.wptr = phy_addr;
+	iface->cmd_buffer_desc.buffer.end = iface->cmd_buffer_desc.buffer.start + CMD_SIZE;
+	offset += CMD_SIZE;
+	phy_addr = base_phy_addr + offset;
+
+	shared->msg_desc = &iface->msg_buffer_desc.buffer;
+	shared->msg_mem_vir = rpc->virt + offset;
+	iface->msg_buffer_desc.buffer.start =
+	iface->msg_buffer_desc.buffer.wptr =
+	iface->msg_buffer_desc.buffer.rptr = phy_addr;
+	iface->msg_buffer_desc.buffer.end = iface->msg_buffer_desc.buffer.start + MSG_SIZE;
+	offset += MSG_SIZE;
+	phy_addr = base_phy_addr + offset;
+
+	iface->codec_param_tab_desc.array_base = phy_addr;
+	hc->codec_param = rpc->virt + offset;
+	offset += CODEC_SIZE;
+	phy_addr = base_phy_addr + offset;
+
+	iface->jpeg_param_tab_desc.array_base = phy_addr;
+	hc->jpg = rpc->virt + offset;
+	offset += JPEG_SIZE;
+	phy_addr = base_phy_addr + offset;
+
+	iface->seq_info_tab_desc.array_base = phy_addr;
+	hc->seq_mem = rpc->virt + offset;
+	offset += SEQ_SIZE;
+	phy_addr = base_phy_addr + offset;
+
+	iface->pic_info_tab_desc.array_base = phy_addr;
+	hc->pic_mem = rpc->virt + offset;
+	offset += PIC_SIZE;
+	phy_addr = base_phy_addr + offset;
+
+	iface->gop_info_tab_desc.array_base = phy_addr;
+	hc->gop_mem = rpc->virt + offset;
+	offset += GOP_SIZE;
+	phy_addr = base_phy_addr + offset;
+
+	iface->qmeter_info_tab_desc.array_base = phy_addr;
+	hc->qmeter_mem = rpc->virt + offset;
+	offset += QMETER_SIZE;
+	phy_addr = base_phy_addr + offset;
+
+	iface->dbglog_desc.addr = phy_addr;
+	iface->dbglog_desc.size = DBGLOG_SIZE;
+	hc->dbglog_mem = rpc->virt + offset;
+	offset += DBGLOG_SIZE;
+	phy_addr = base_phy_addr + offset;
+
+	for (i = 0; i < VID_API_NUM_STREAMS; i++) {
+		iface->eng_access_buff_desc[i].buffer.start =
+		iface->eng_access_buff_desc[i].buffer.wptr =
+		iface->eng_access_buff_desc[i].buffer.rptr = phy_addr;
+		iface->eng_access_buff_desc[i].buffer.end =
+			iface->eng_access_buff_desc[i].buffer.start + ENG_SIZE;
+		offset += ENG_SIZE;
+		phy_addr = base_phy_addr + offset;
+	}
+
+	for (i = 0; i < VID_API_NUM_STREAMS; i++) {
+		iface->encrypt_info[i] = phy_addr;
+		offset += sizeof(struct vpu_malone_encrypt_info);
+		phy_addr = base_phy_addr + offset;
+	}
+
+	rpc->bytesused = offset;
+}
+
+void vpu_malone_set_log_buf(struct vpu_shared_addr *shared,
+			struct vpu_buffer *log)
+{
+	struct malone_iface *iface;
+
+	WARN_ON(!shared || !log || !log->phys);
+	iface = shared->iface;
+	iface->debug_buffer_desc.buffer.start =
+	iface->debug_buffer_desc.buffer.wptr =
+	iface->debug_buffer_desc.buffer.rptr = log->phys - shared->boot_addr;
+	iface->debug_buffer_desc.buffer.end = iface->debug_buffer_desc.buffer.start + log->length;
+}
+
+static u32 get_str_buffer_offset(u32 instance)
+{
+	return DEC_MFD_XREG_SLV_BASE + MFD_MCX + MFD_MCX_OFF * instance;
+}
+
+void vpu_malone_set_system_cfg(struct vpu_shared_addr *shared,
+				u32 regs_base, void __iomem *regs, u32 core_id)
+{
+	struct malone_iface *iface;
+	struct vpu_rpc_system_config *config;
+	struct vpu_dec_ctrl *hc;
+	int i;
+
+	WARN_ON(!shared || !shared->iface || !shared->core || !shared->priv);
+
+	iface = shared->iface;
+	config = &iface->system_cfg;
+	hc = shared->priv;
+
+	vpu_imx8q_set_system_cfg_common(config, regs_base, core_id);
+	for (i = 0; i < VID_API_NUM_STREAMS; i++) {
+		u32 offset = get_str_buffer_offset(i);
+
+		hc->buf_addr[i] = regs_base + offset;
+		hc->str_buf[i] = regs + offset;
+	}
+}
+
+u32 vpu_malone_get_version(struct vpu_shared_addr *shared)
+{
+	struct malone_iface *iface;
+
+	WARN_ON(!shared || !shared->iface);
+
+	iface = shared->iface;
+	return iface->fw_version;
+}
+
+int vpu_malone_get_stream_buffer_size(struct vpu_shared_addr *shared)
+{
+	return 0xc00000;
+}
+
+int vpu_malone_config_stream_buffer(struct vpu_shared_addr *shared,
+					u32 instance,
+					struct vpu_buffer *buf)
+{
+	struct malone_iface *iface;
+	struct vpu_dec_ctrl *hc;
+	struct vpu_malone_str_buffer *str_buf;
+
+	WARN_ON(!shared || !shared->iface || !shared->core || !shared->priv);
+
+	iface = shared->iface;
+	hc = shared->priv;
+	str_buf = hc->str_buf[instance];
+	str_buf->wptr = str_buf->rptr = str_buf->start = buf->phys;
+	str_buf->end = buf->phys + buf->length;
+	str_buf->lwm = 0x1;
+
+	iface->stream_buffer_desc[instance][0] = hc->buf_addr[instance];
+
+	return 0;
+}
+
+int vpu_malone_get_stream_buffer_desc(struct vpu_shared_addr *shared,
+		u32 instance, struct vpu_rpc_buffer_desc *desc)
+{
+	struct vpu_dec_ctrl *hc;
+	struct vpu_malone_str_buffer *str_buf;
+
+	WARN_ON(!shared || !shared->iface || !shared->core || !shared->priv);
+
+	hc = shared->priv;
+	str_buf = hc->str_buf[instance];
+
+	if (desc) {
+		desc->wptr = str_buf->wptr;
+		desc->rptr = str_buf->rptr;
+		desc->start = str_buf->start;
+		desc->end = str_buf->end;
+	}
+
+	return 0;
+}
+
+static void vpu_malone_update_wptr(struct vpu_malone_str_buffer *str_buf,
+					u32 wptr)
+{
+	u32 size = str_buf->end - str_buf->start;
+	u32 space = (str_buf->rptr + size - str_buf->wptr) % size;
+	u32 step = (wptr + size - str_buf->wptr) % size;
+
+	if (space && step > space)
+		pr_err("update wptr from 0x%x to 0x%x, cross over rptr 0x%x\n",
+				str_buf->wptr, wptr, str_buf->rptr);
+
+	/*update wptr after data is written*/
+	mb();
+	str_buf->wptr = wptr;
+}
+
+static void vpu_malone_update_rptr(struct vpu_malone_str_buffer *str_buf,
+					u32 rptr)
+{
+	u32 size = str_buf->end - str_buf->start;
+	u32 space = (str_buf->wptr + size - str_buf->rptr) % size;
+	u32 step = (rptr + size - str_buf->rptr) % size;
+
+	if (step > space)
+		pr_err("update rptr from 0x%x to 0x%x, cross over wptr 0x%x\n",
+				str_buf->rptr, rptr, str_buf->wptr);
+	/*update rptr after data is read*/
+	mb();
+	str_buf->rptr = rptr;
+}
+
+int vpu_malone_update_stream_buffer(struct vpu_shared_addr *shared,
+					u32 instance, u32 ptr, bool write)
+{
+	struct vpu_dec_ctrl *hc;
+	struct vpu_malone_str_buffer *str_buf;
+
+	WARN_ON(!shared || !shared->iface || !shared->core || !shared->priv);
+
+	hc = shared->priv;
+	str_buf = hc->str_buf[instance];
+
+	if (write)
+		vpu_malone_update_wptr(str_buf, ptr);
+	else
+		vpu_malone_update_rptr(str_buf, ptr);
+
+	return 0;
+}
+
+static struct malone_fmt_mapping fmt_mappings[] = {
+	{V4L2_PIX_FMT_H264,        MALONE_FMT_AVC},
+	{V4L2_PIX_FMT_H264_MVC,    MALONE_FMT_AVC},
+	{V4L2_PIX_FMT_HEVC,        MALONE_FMT_HEVC},
+	{V4L2_PIX_FMT_VC1_ANNEX_G, MALONE_FMT_VC1},
+	{V4L2_PIX_FMT_VC1_ANNEX_L, MALONE_FMT_VC1},
+	{V4L2_PIX_FMT_MPEG2,       MALONE_FMT_MP2},
+	{V4L2_PIX_FMT_MPEG4,       MALONE_FMT_ASP},
+	{V4L2_PIX_FMT_XVID,        MALONE_FMT_ASP},
+	{V4L2_PIX_FMT_H263,        MALONE_FMT_ASP},
+	{V4L2_PIX_FMT_JPEG,        MALONE_FMT_JPG},
+	{V4L2_PIX_FMT_VP8,         MALONE_FMT_VP8},
+};
+
+static enum vpu_malone_format vpu_malone_format_remap(u32 pixelformat)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(fmt_mappings); i++) {
+		if (pixelformat == fmt_mappings[i].pixelformat)
+			return fmt_mappings[i].malone_format;
+	}
+
+	return MALONE_FMT_NULL;
+}
+
+static void vpu_malone_set_stream_cfg(struct vpu_shared_addr *shared,
+		u32 instance, enum vpu_malone_format malone_format)
+{
+	struct malone_iface *iface;
+	u32 *curr_str_cfg;
+
+	iface = shared->iface;
+	curr_str_cfg = &iface->stream_config[instance];
+
+	*curr_str_cfg = 0;
+	STREAM_CONFIG_FORMAT_SET(malone_format, curr_str_cfg);
+	STREAM_CONFIG_STRBUFIDX_SET(0, curr_str_cfg);
+	STREAM_CONFIG_NOSEQ_SET(0, curr_str_cfg);
+	STREAM_CONFIG_DEBLOCK_SET(0, curr_str_cfg);
+	STREAM_CONFIG_DERING_SET(0, curr_str_cfg);
+	STREAM_CONFIG_PLAY_MODE_SET(0x3, curr_str_cfg);
+	STREAM_CONFIG_FS_CTRL_MODE_SET(0x1, curr_str_cfg);
+	STREAM_CONFIG_ENABLE_DCP_SET(1, curr_str_cfg);
+	STREAM_CONFIG_NUM_STR_BUF_SET(1, curr_str_cfg);
+	STREAM_CONFIG_MALONE_USAGE_SET(1, curr_str_cfg);
+	STREAM_CONFIG_MULTI_VID_SET(0, curr_str_cfg);
+	STREAM_CONFIG_OBFUSC_EN_SET(0, curr_str_cfg);
+	STREAM_CONFIG_RC4_EN_SET(0, curr_str_cfg);
+	STREAM_CONFIG_MCX_SET(1, curr_str_cfg);
+	STREAM_CONFIG_PES_SET(0, curr_str_cfg);
+	STREAM_CONFIG_NUM_DBE_SET(1, curr_str_cfg);
+}
+
+static int vpu_malone_set_params(struct vpu_shared_addr *shared,
+		u32 instance, struct vpu_decode_params *params)
+{
+	struct malone_iface *iface;
+	struct vpu_dec_ctrl *hc;
+	enum vpu_malone_format malone_format;
+
+	iface = shared->iface;
+	hc = shared->priv;
+	malone_format = vpu_malone_format_remap(params->codec_format);
+	iface->udata_buffer[instance].base = params->udata.base;
+	iface->udata_buffer[instance].slot_size = params->udata.size;
+
+	vpu_malone_set_stream_cfg(shared, instance, malone_format);
+
+	if (malone_format == MALONE_FMT_JPG) {
+		//1:JPGD_MJPEG_MODE_A; 2:JPGD_MJPEG_MODE_B
+		hc->jpg[instance].jpg_mjpeg_mode = 1;
+		//0: JPGD_MJPEG_PROGRESSIVE
+		hc->jpg[instance].jpg_mjpeg_interlaced = 0;
+	}
+
+	hc->codec_param[instance].disp_imm = params->b_dis_reorder ? 1 : 0;
+	hc->codec_param[instance].dbglog_enable = 0;
+	iface->dbglog_desc.level = 0;
+
+	if (params->b_non_frame)
+		iface->stream_buff_info[instance].stream_input_mode = NON_FRAME_LVL;
+	else
+		iface->stream_buff_info[instance].stream_input_mode = FRAME_LVL;
+	iface->stream_buff_info[instance].stream_buffer_threshold = 0;
+	iface->stream_buff_info[instance].stream_pic_input_count = 0;
+
+	return 0;
+}
+
+static bool vpu_malone_is_non_frame_mode(struct vpu_shared_addr *shared,
+					u32 instance)
+{
+	struct malone_iface *iface;
+
+	iface = shared->iface;
+	if (iface->stream_buff_info[instance].stream_input_mode == NON_FRAME_LVL)
+		return true;
+
+	return false;
+}
+
+static int vpu_malone_update_params(struct vpu_shared_addr *shared,
+		u32 instance, struct vpu_decode_params *params)
+{
+	struct malone_iface *iface;
+
+	iface = shared->iface;
+
+	if (params->end_flag)
+		iface->stream_buff_info[instance].stream_pic_end_flag = params->end_flag;
+	params->end_flag = 0;
+
+	return 0;
+}
+
+int vpu_malone_set_decode_params(struct vpu_shared_addr *shared,
+		u32 instance, struct vpu_decode_params *params, u32 update)
+{
+	if (!params)
+		return -EINVAL;
+
+	if (!update)
+		return vpu_malone_set_params(shared, instance, params);
+	else
+		return vpu_malone_update_params(shared, instance, params);
+}
+
+static struct vpu_pair malone_cmds[] = {
+	{VPU_CMD_ID_START, VID_API_CMD_START},
+	{VPU_CMD_ID_STOP, VID_API_CMD_STOP},
+	{VPU_CMD_ID_ABORT, VID_API_CMD_ABORT},
+	{VPU_CMD_ID_RST_BUF, VID_API_CMD_RST_BUF},
+	{VPU_CMD_ID_SNAPSHOT, VID_API_CMD_SNAPSHOT},
+	{VPU_CMD_ID_FIRM_RESET, VID_API_CMD_FIRM_RESET},
+	{VPU_CMD_ID_FS_ALLOC, VID_API_CMD_FS_ALLOC},
+	{VPU_CMD_ID_FS_RELEASE, VID_API_CMD_FS_RELEASE},
+	{VPU_CMD_ID_TIMESTAMP, VID_API_CMD_TS},
+	{VPU_CMD_ID_DEBUG, VID_API_CMD_FW_STATUS},
+};
+
+static struct vpu_pair malone_msgs[] = {
+	{VPU_MSG_ID_RESET_DONE, VID_API_EVENT_RESET_DONE},
+	{VPU_MSG_ID_START_DONE, VID_API_EVENT_START_DONE},
+	{VPU_MSG_ID_STOP_DONE, VID_API_EVENT_STOPPED},
+	{VPU_MSG_ID_ABORT_DONE, VID_API_EVENT_ABORT_DONE},
+	{VPU_MSG_ID_BUF_RST, VID_API_EVENT_STR_BUF_RST},
+	{VPU_MSG_ID_PIC_EOS, VID_API_EVENT_FINISHED},
+	{VPU_MSG_ID_SEQ_HDR_FOUND, VID_API_EVENT_SEQ_HDR_FOUND},
+	{VPU_MSG_ID_RES_CHANGE, VID_API_EVENT_RES_CHANGE},
+	{VPU_MSG_ID_PIC_HDR_FOUND, VID_API_EVENT_PIC_HDR_FOUND},
+	{VPU_MSG_ID_PIC_DECODED, VID_API_EVENT_PIC_DECODED},
+	{VPU_MSG_ID_DEC_DONE, VID_API_EVENT_FRAME_BUFF_RDY},
+	{VPU_MSG_ID_FRAME_REQ, VID_API_EVENT_REQ_FRAME_BUFF},
+	{VPU_MSG_ID_FRAME_RELEASE, VID_API_EVENT_REL_FRAME_BUFF},
+	{VPU_MSG_ID_FIFO_LOW, VID_API_EVENT_FIFO_LOW},
+	{VPU_MSG_ID_BS_ERROR, VID_API_EVENT_BS_ERROR},
+	{VPU_MSG_ID_UNSUPPORTED, VID_API_EVENT_UNSUPPORTED_STREAM},
+	{VPU_MSG_ID_FIRMWARE_XCPT, VID_API_EVENT_FIRMWARE_XCPT},
+};
+
+static void vpu_malone_pack_fs_alloc(struct vpu_rpc_event *pkt,
+					struct vpu_fs_info *fs)
+{
+	const u32 fs_type[] = {
+		[MEM_RES_FRAME] = 0,
+		[MEM_RES_MBI] = 1,
+		[MEM_RES_DCP] = 2,
+	};
+
+	pkt->hdr.num = 7;
+	pkt->data[0] = fs->id | (fs->tag << 24);
+	pkt->data[1] = fs->luma_addr;
+	if (fs->type == MEM_RES_FRAME) {
+		/*
+		 * if luma_addr equal to chroma_addr,
+		 * means luma(plane[0]) and chromau(plane[1]) used the
+		 * same fd -- usage of NXP codec2. Need to manually
+		 * offset chroma addr.
+		 */
+		if (fs->luma_addr == fs->chroma_addr)
+			fs->chroma_addr = fs->luma_addr + fs->luma_size;
+		pkt->data[2] = fs->luma_addr + fs->luma_size / 2;
+		pkt->data[3] = fs->chroma_addr;
+		pkt->data[4] = fs->chroma_addr + fs->chromau_size / 2;
+		pkt->data[5] = fs->bytesperline;
+	} else {
+		pkt->data[2] = fs->luma_size;
+		pkt->data[3] = 0;
+		pkt->data[4] = 0;
+		pkt->data[5] = 0;
+	}
+	pkt->data[6] = fs_type[fs->type];
+}
+
+static void vpu_malone_pack_fs_release(struct vpu_rpc_event *pkt,
+					struct vpu_fs_info *fs)
+{
+	pkt->hdr.num = 1;
+	pkt->data[0] = fs->id | (fs->tag << 24);
+}
+
+static void vpu_malone_pack_timestamp(struct vpu_rpc_event *pkt,
+					struct vpu_ts_info *info)
+{
+	pkt->hdr.num = 3;
+	if (info->timestamp < 0) {
+		pkt->data[0] = (u32)-1;
+		pkt->data[1] = 0;
+	} else {
+		pkt->data[0] = info->timestamp / NSEC_PER_SEC;
+		pkt->data[1] = info->timestamp % NSEC_PER_SEC;
+	}
+	pkt->data[2] = info->size;
+}
+
+int vpu_malone_pack_cmd(struct vpu_rpc_event *pkt, u32 index, u32 id, void *data)
+{
+	int ret;
+
+	WARN_ON(!pkt);
+
+	ret = vpu_find_dst_by_src(malone_cmds, ARRAY_SIZE(malone_cmds), id);
+	if (ret < 0)
+		return ret;
+
+	pkt->hdr.id = ret;
+	pkt->hdr.num = 0;
+	pkt->hdr.index = index;
+
+	switch (id) {
+	case VPU_CMD_ID_FS_ALLOC:
+		vpu_malone_pack_fs_alloc(pkt, data);
+		break;
+	case VPU_CMD_ID_FS_RELEASE:
+		vpu_malone_pack_fs_release(pkt, data);
+		break;
+	case VPU_CMD_ID_TIMESTAMP:
+		vpu_malone_pack_timestamp(pkt, data);
+		break;
+	}
+
+	pkt->hdr.index = index;
+	return 0;
+}
+
+int vpu_malone_convert_msg_id(u32 id)
+{
+	return vpu_find_src_by_dst(malone_msgs, ARRAY_SIZE(malone_msgs), id);
+}
+
+static void vpu_malone_fill_planes(struct vpu_dec_codec_info *info)
+{
+	u32 interlaced = info->progressive ? 0 : 1;
+
+	info->bytesperline[0] = 0;
+	info->sizeimage[0] = vpu_helper_get_plane_size(info->pixfmt,
+			info->decoded_width, info->decoded_height,
+			0, info->stride, interlaced,
+			&info->bytesperline[0]);
+	info->bytesperline[1] = 0;
+	info->sizeimage[1] = vpu_helper_get_plane_size(info->pixfmt,
+			info->decoded_width, info->decoded_height,
+			1, info->stride, interlaced,
+			&info->bytesperline[1]);
+}
+
+static void vpu_malone_init_seq_hdr(struct vpu_dec_codec_info *info)
+{
+	u32 chunks = info->num_dfe_area >> MALONE_DCP_CHUNK_BIT;
+
+	vpu_malone_fill_planes(info);
+
+	info->mbi_size = (info->sizeimage[0] + info->sizeimage[1]) >> 2;
+	info->mbi_size = ALIGN(info->mbi_size, MALONE_ALIGN_MBI);
+
+	info->dcp_size = MALONE_DCP_SIZE_MAX;
+	if (chunks) {
+		u32 mb_num;
+		u32 mb_w;
+		u32 mb_h;
+
+		mb_w = DIV_ROUND_UP(info->decoded_width, 16);
+		mb_h = DIV_ROUND_UP(info->decoded_height, 16);
+		mb_num = mb_w * mb_h;
+		info->dcp_size = mb_num * MALONE_DCP_FIXED_MB_ALLOC * chunks;
+		info->dcp_size = clamp_t(u32, info->dcp_size,
+					MALONE_DCP_SIZE_MIN, MALONE_DCP_SIZE_MAX);
+	}
+}
+
+static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_event *pkt,
+					struct vpu_dec_codec_info *info)
+{
+	info->num_ref_frms = pkt->data[0];
+	info->num_dpb_frms = pkt->data[1];
+	info->num_dfe_area = pkt->data[2];
+	info->progressive = pkt->data[3];
+	info->width = pkt->data[5];
+	info->height = pkt->data[4];
+	info->decoded_width = pkt->data[12];
+	info->decoded_height = pkt->data[11];
+	info->frame_rate.numerator = 1000;
+	info->frame_rate.denominator = pkt->data[8];
+	info->dsp_asp_ratio = pkt->data[9];
+	info->level_idc = pkt->data[10];
+	info->bit_depth_luma = pkt->data[13];
+	info->bit_depth_chroma = pkt->data[14];
+	info->chroma_fmt = pkt->data[15];
+	info->color_primaries = vpu_color_cvrt_primaries_i2v(pkt->data[16]);
+	info->transfer_chars = vpu_color_cvrt_transfers_i2v(pkt->data[17]);
+	info->matrix_coeffs = vpu_color_cvrt_matrix_i2v(pkt->data[18]);
+	info->full_range = vpu_color_cvrt_full_range_i2v(pkt->data[19]);
+	info->vui_present = pkt->data[20];
+	info->mvc_num_views = pkt->data[21];
+	info->offset_x = pkt->data[23];
+	info->offset_y = pkt->data[25];
+	info->tag = pkt->data[27];
+	if (info->bit_depth_luma > 8)
+		info->pixfmt = V4L2_PIX_FMT_NV12MT_10BE_8L128;
+	else
+		info->pixfmt = V4L2_PIX_FMT_NV12MT_8L128;
+	vpu_helper_calc_coprime(&info->frame_rate.numerator, &info->frame_rate.denominator);
+	vpu_malone_init_seq_hdr(info);
+}
+
+static void vpu_malone_unpack_pic_info(struct vpu_rpc_event *pkt,
+					struct vpu_dec_pic_info *info)
+{
+	info->id = pkt->data[7];
+	info->luma = pkt->data[0];
+	info->start = pkt->data[10];
+	info->end = pkt->data[12];
+	info->pic_size = pkt->data[11];
+	info->stride = pkt->data[5];
+	info->consumed_count = pkt->data[13];
+	if (info->id == MALONE_SKIPPED_FRAME_ID)
+		info->skipped = 1;
+	else
+		info->skipped = 0;
+}
+
+static void vpu_malone_unpack_req_frame(struct vpu_rpc_event *pkt,
+					struct vpu_fs_info *info)
+{
+	info->type = pkt->data[1];
+}
+
+static void vpu_malone_unpack_rel_frame(struct vpu_rpc_event *pkt,
+					struct vpu_fs_info *info)
+{
+	info->id = pkt->data[0];
+	info->type = pkt->data[1];
+	info->not_displayed = pkt->data[2];
+}
+
+static void vpu_malone_unpack_buff_rdy(struct vpu_rpc_event *pkt,
+					struct vpu_dec_pic_info *info)
+{
+	info->id = pkt->data[0];
+	info->luma = pkt->data[1];
+	info->stride = pkt->data[3];
+	if (info->id == MALONE_SKIPPED_FRAME_ID)
+		info->skipped = 1;
+	else
+		info->skipped = 0;
+	info->timestamp = MAKE_TIMESTAMP(pkt->data[9], pkt->data[10]);
+}
+
+int vpu_malone_unpack_msg_data(struct vpu_rpc_event *pkt, void *data)
+{
+	if (!pkt || !data)
+		return -EINVAL;
+
+	switch (pkt->hdr.id) {
+	case VID_API_EVENT_SEQ_HDR_FOUND:
+		vpu_malone_unpack_seq_hdr(pkt, data);
+		break;
+	case VID_API_EVENT_PIC_DECODED:
+		vpu_malone_unpack_pic_info(pkt, data);
+		break;
+	case VID_API_EVENT_REQ_FRAME_BUFF:
+		vpu_malone_unpack_req_frame(pkt, data);
+		break;
+	case VID_API_EVENT_REL_FRAME_BUFF:
+		vpu_malone_unpack_rel_frame(pkt, data);
+		break;
+	case VID_API_EVENT_FRAME_BUFF_RDY:
+		vpu_malone_unpack_buff_rdy(pkt, data);
+		break;
+	}
+
+	return 0;
+}
+
+static const struct malone_padding_scode padding_scodes[] = {
+	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_H264,        {0x0B010000, 0}},
+	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_H264_MVC,    {0x0B010000, 0}},
+	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_HEVC,        {0x4A010000, 0x20}},
+	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_VC1_ANNEX_G, {0x0a010000, 0x0}},
+	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_VC1_ANNEX_L, {0x0a010000, 0x0}},
+	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_MPEG2,       {0xCC010000, 0x0}},
+	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_MPEG4,       {0xb1010000, 0x0}},
+	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_XVID,        {0xb1010000, 0x0}},
+	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_H263,        {0xb1010000, 0x0}},
+	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_VP8,         {0x34010000, 0x0}},
+	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0xefff0000, 0x0}},
+	{SCODE_PADDING_ABORT,    V4L2_PIX_FMT_H264,        {0x0B010000, 0}},
+	{SCODE_PADDING_ABORT,    V4L2_PIX_FMT_H264_MVC,    {0x0B010000, 0}},
+	{SCODE_PADDING_ABORT,    V4L2_PIX_FMT_HEVC,        {0x4A010000, 0x20}},
+	{SCODE_PADDING_ABORT,    V4L2_PIX_FMT_VC1_ANNEX_G, {0x0a010000, 0x0}},
+	{SCODE_PADDING_ABORT,    V4L2_PIX_FMT_VC1_ANNEX_L, {0x0a010000, 0x0}},
+	{SCODE_PADDING_ABORT,    V4L2_PIX_FMT_MPEG2,       {0xb7010000, 0x0}},
+	{SCODE_PADDING_ABORT,    V4L2_PIX_FMT_MPEG4,       {0xb1010000, 0x0}},
+	{SCODE_PADDING_ABORT,    V4L2_PIX_FMT_XVID,        {0xb1010000, 0x0}},
+	{SCODE_PADDING_ABORT,    V4L2_PIX_FMT_H263,        {0xb1010000, 0x0}},
+	{SCODE_PADDING_ABORT,    V4L2_PIX_FMT_VP8,         {0x34010000, 0x0}},
+	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
+	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
+	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
+};
+static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
+
+static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt)
+{
+	const struct malone_padding_scode *s;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(padding_scodes); i++) {
+		s = &padding_scodes[i];
+
+		if (s->scode_type == type && s->pixelformat == fmt)
+			return s;
+	}
+
+	if (type != SCODE_PADDING_BUFFLUSH)
+		return &padding_scode_dft;
+
+	return NULL;
+}
+
+static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
+			struct vpu_malone_str_buffer *str_buf,
+			u32 pixelformat, u32 scode_type)
+{
+	u32 wptr;
+	u32 size;
+	u32 total_size = 0;
+	const struct malone_padding_scode *ps;
+	const u32 padding_size = 4096;
+	int ret;
+
+	ps = get_padding_scode(scode_type, pixelformat);
+	if (!ps)
+		return -EINVAL;
+
+	wptr = str_buf->wptr;
+	size = ALIGN(wptr, 4) - wptr;
+	if (size)
+		vpu_helper_memset_stream_buffer(stream_buffer, &wptr, 0, size);
+	total_size += size;
+
+	size = sizeof(ps->data);
+	ret = vpu_helper_copy_to_stream_buffer(stream_buffer, &wptr, size, (void *)ps->data);
+	if (ret < size)
+		return -EINVAL;
+	total_size += size;
+
+	size = padding_size - sizeof(ps->data);
+	vpu_helper_memset_stream_buffer(stream_buffer, &wptr, 0, size);
+	total_size += size;
+
+	vpu_malone_update_wptr(str_buf, wptr);
+	return total_size;
+}
+
+int vpu_malone_add_scode(struct vpu_shared_addr *shared,
+				u32 instance,
+				struct vpu_buffer *stream_buffer,
+				u32 pixelformat,
+				u32 scode_type)
+{
+	struct vpu_dec_ctrl *hc;
+	struct vpu_malone_str_buffer *str_buf;
+	int ret = -EINVAL;
+
+	WARN_ON(!shared || !shared->iface || !shared->core || !shared->priv);
+
+	hc = shared->priv;
+	str_buf = hc->str_buf[instance];
+
+	switch (scode_type) {
+	case SCODE_PADDING_EOS:
+	case SCODE_PADDING_ABORT:
+	case SCODE_PADDING_BUFFLUSH:
+		ret = vpu_malone_add_padding_scode(stream_buffer,
+				str_buf, pixelformat, scode_type);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+#define MALONE_PAYLOAD_HEADER_SIZE		16
+#define MALONE_CODEC_VERSION_ID			0x1
+#define MALONE_CODEC_ID_VC1_SIMPLE		0x10
+#define MALONE_CODEC_ID_VC1_MAIN		0x11
+#define MALONE_CODEC_ID_ARV8			0x28
+#define MALONE_CODEC_ID_ARV9			0x29
+#define MALONE_CODEC_ID_VP6			0x36
+#define MALONE_CODEC_ID_VP8			0x36
+#define MALONE_CODEC_ID_DIVX3			0x38
+#define MALONE_CODEC_ID_SPK			0x39
+
+#define MALONE_VP8_IVF_SEQ_HEADER_LEN		32
+#define MALONE_VP8_IVF_FRAME_HEADER_LEN		8
+
+#define MALONE_VC1_RCV_CODEC_V1_VERSION		0x85
+#define MALONE_VC1_RCV_CODEC_V2_VERSION		0xC5
+#define MALONE_VC1_RCV_NUM_FRAMES		0xFF
+#define MALONE_VC1_RCV_SEQ_EXT_DATA_SIZE	4
+#define MALONE_VC1_RCV_SEQ_HEADER_LEN		20
+#define MALONE_VC1_RCV_PIC_HEADER_LEN		4
+#define MALONE_VC1_NAL_HEADER_LEN		4
+#define MALONE_VC1_CONTAIN_NAL(data)		((data & 0x00FFFFFF) == 0x00010000)
+
+
+static void set_payload_hdr(u8 *dst, u32 scd_type, u32 codec_id,
+		u32 buffer_size, u32 width, u32 height)
+{
+	unsigned int payload_size;
+	/* payload_size = buffer_size + itself_size(16) - start_code(4) */
+	payload_size = buffer_size + 12;
+
+	dst[0] = 0x00;
+	dst[1] = 0x00;
+	dst[2] = 0x01;
+	dst[3] = scd_type;
+
+	/* length */
+	dst[4] = ((payload_size>>16)&0xff);
+	dst[5] = ((payload_size>>8)&0xff);
+	dst[6] = 0x4e;
+	dst[7] = ((payload_size>>0)&0xff);
+
+	/* Codec ID and Version */
+	dst[8] = codec_id;
+	dst[9] = MALONE_CODEC_VERSION_ID;
+
+	/* width */
+	dst[10] = ((width>>8)&0xff);
+	dst[11] = ((width>>0)&0xff);
+	dst[12] = 0x58;
+
+	/* height */
+	dst[13] = ((height>>8)&0xff);
+	dst[14] = ((height>>0)&0xff);
+	dst[15] = 0x50;
+}
+
+static void set_vp8_ivf_seqhdr(u8 *dst, u32 width, u32 height)
+{
+	/* 0-3byte signature "DKIF" */
+	dst[0] = 0x44;
+	dst[1] = 0x4b;
+	dst[2] = 0x49;
+	dst[3] = 0x46;
+	/* 4-5byte version: should be 0*/
+	dst[4] = 0x00;
+	dst[5] = 0x00;
+	/* 6-7 length of Header */
+	dst[6] = MALONE_VP8_IVF_SEQ_HEADER_LEN;
+	dst[7] = MALONE_VP8_IVF_SEQ_HEADER_LEN >> 8;
+	/* 8-11 VP8 fourcc */
+	dst[8] = 0x56;
+	dst[9] = 0x50;
+	dst[10] = 0x38;
+	dst[11] = 0x30;
+	/* 12-13 width in pixels */
+	dst[12] = width;
+	dst[13] = width >> 8;
+	/* 14-15 height in pixels */
+	dst[14] = height;
+	dst[15] = height >> 8;
+	/* 16-19 frame rate */
+	dst[16] = 0xe8;
+	dst[17] = 0x03;
+	dst[18] = 0x00;
+	dst[19] = 0x00;
+	/* 20-23 time scale */
+	dst[20] = 0x01;
+	dst[21] = 0x00;
+	dst[22] = 0x00;
+	dst[23] = 0x00;
+	/* 24-27 number frames */
+	dst[24] = 0xdf;
+	dst[25] = 0xf9;
+	dst[26] = 0x09;
+	dst[27] = 0x00;
+	/* 28-31 reserved */
+}
+
+static void set_vp8_ivf_pichdr(u8 *dst, u32 frame_size)
+{
+	/*
+	 * firmware just parse 64-bit timestamp(8 bytes).
+	 * As not transfer timestamp to firmware, use default value(ZERO).
+	 * No need to do anything here
+	 */
+}
+
+static void set_vc1_rcv_seqhdr(u8 *dst, u8 *src, u32 width, u32 height)
+{
+	u32 frames = MALONE_VC1_RCV_NUM_FRAMES;
+	u32 ext_data_size = MALONE_VC1_RCV_SEQ_EXT_DATA_SIZE;
+
+	/* 0-2 Number of frames, used default value 0xFF */
+	dst[0] = frames;
+	dst[1] = frames >> 8;
+	dst[2] = frames >> 16;
+
+	/* 3 RCV version, used V1 */
+	dst[3] = MALONE_VC1_RCV_CODEC_V1_VERSION;
+
+	/* 4-7 extension data size */
+	dst[4] = ext_data_size;
+	dst[5] = ext_data_size >> 8;
+	dst[6] = ext_data_size >> 16;
+	dst[7] = ext_data_size >> 24;
+	/* 8-11 extension data */
+	dst[8] = src[0];
+	dst[9] = src[1];
+	dst[10] = src[2];
+	dst[11] = src[3];
+
+	/* height */
+	dst[12] = height;
+	dst[13] = (height >> 8) & 0xff;
+	dst[14] = (height >> 16) & 0xff;
+	dst[15] = (height >> 24) & 0xff;
+	/* width */
+	dst[16] = width;
+	dst[17] = (width >> 8) & 0xff;
+	dst[18] = (width >> 16) & 0xff;
+	dst[19] = (width >> 24) & 0xff;
+}
+
+static void set_vc1_rcv_pichdr(u8 *dst, u32 buffer_size)
+{
+	dst[0] = buffer_size;
+	dst[1] = buffer_size >> 8;
+	dst[2] = buffer_size >> 16;
+	dst[3] = buffer_size >> 24;
+}
+
+static void create_vc1_nal_pichdr(u8 *dst)
+{
+	/* need insert nal header: special ID */
+	dst[0] = 0x0;
+	dst[1] = 0x0;
+	dst[2] = 0x01;
+	dst[3] = 0x0D;
+}
+
+static int vpu_malone_insert_scode_seq(struct malone_scode_t *scode, u32 codec_id, u32 ext_size)
+{
+	u8 hdr[MALONE_PAYLOAD_HEADER_SIZE];
+	int ret;
+
+	set_payload_hdr(hdr,
+			SCODE_SEQUENCE,
+			codec_id,
+			ext_size,
+			scode->inst->out_format.width,
+			scode->inst->out_format.height);
+	ret = vpu_helper_copy_to_stream_buffer(&scode->inst->stream_buffer,
+						&scode->wptr,
+						sizeof(hdr),
+						hdr);
+	return ret;
+}
+
+static int vpu_malone_insert_scode_pic(struct malone_scode_t *scode, u32 codec_id, u32 ext_size)
+{
+	u8 hdr[MALONE_PAYLOAD_HEADER_SIZE];
+
+	set_payload_hdr(hdr,
+			SCODE_PICTURE,
+			codec_id,
+			ext_size + vb2_get_plane_payload(scode->vb, 0),
+			scode->inst->out_format.width,
+			scode->inst->out_format.height);
+	return vpu_helper_copy_to_stream_buffer(&scode->inst->stream_buffer,
+						&scode->wptr,
+						sizeof(hdr),
+						hdr);
+}
+
+static int vpu_malone_insert_scode_vc1_g_pic(struct malone_scode_t *scode)
+{
+	struct vb2_v4l2_buffer *vbuf;
+	u8 nal_hdr[MALONE_VC1_NAL_HEADER_LEN];
+	u32 *data = NULL;
+
+	vbuf = to_vb2_v4l2_buffer(scode->vb);
+	data = vb2_plane_vaddr(scode->vb, 0);
+
+	if (vbuf->sequence == 0 || vpu_vb_is_codecconfig(vbuf))
+		return 0;
+	if (MALONE_VC1_CONTAIN_NAL(*data))
+		return 0;
+
+	create_vc1_nal_pichdr(nal_hdr);
+	return vpu_helper_copy_to_stream_buffer(&scode->inst->stream_buffer,
+						&scode->wptr,
+						sizeof(nal_hdr),
+						nal_hdr);
+}
+
+static int vpu_malone_insert_scode_vc1_l_seq(struct malone_scode_t *scode)
+{
+	int ret;
+	int size = 0;
+	u8 rcv_seqhdr[MALONE_VC1_RCV_SEQ_HEADER_LEN];
+
+	scode->need_data = 0;
+
+	ret = vpu_malone_insert_scode_seq(scode, MALONE_CODEC_ID_VC1_SIMPLE,
+					  sizeof(rcv_seqhdr));
+	if (ret < 0)
+		return ret;
+	size = ret;
+
+	set_vc1_rcv_seqhdr(rcv_seqhdr,
+			   vb2_plane_vaddr(scode->vb, 0),
+			   scode->inst->out_format.width,
+			   scode->inst->out_format.height);
+	ret = vpu_helper_copy_to_stream_buffer(&scode->inst->stream_buffer,
+						&scode->wptr,
+						sizeof(rcv_seqhdr),
+						rcv_seqhdr);
+
+	if (ret < 0)
+		return ret;
+	size += ret;
+	return size;
+}
+
+static int vpu_malone_insert_scode_vc1_l_pic(struct malone_scode_t *scode)
+{
+	int ret;
+	int size = 0;
+	u8 rcv_pichdr[MALONE_VC1_RCV_PIC_HEADER_LEN];
+
+	ret = vpu_malone_insert_scode_pic(scode, MALONE_CODEC_ID_VC1_SIMPLE,
+					  sizeof(rcv_pichdr));
+	if (ret < 0)
+		return ret;
+	size = ret;
+
+	set_vc1_rcv_pichdr(rcv_pichdr, vb2_get_plane_payload(scode->vb, 0));
+	ret = vpu_helper_copy_to_stream_buffer(&scode->inst->stream_buffer,
+						&scode->wptr,
+						sizeof(rcv_pichdr),
+						rcv_pichdr);
+	if (ret < 0)
+		return ret;
+	size += ret;
+	return size;
+}
+
+static int vpu_malone_insert_scode_vp8_seq(struct malone_scode_t *scode)
+{
+	int ret;
+	int size = 0;
+	u8 ivf_hdr[MALONE_VP8_IVF_SEQ_HEADER_LEN];
+
+	ret = vpu_malone_insert_scode_seq(scode, MALONE_CODEC_ID_VP8, sizeof(ivf_hdr));
+	if (ret < 0)
+		return ret;
+	size = ret;
+
+	set_vp8_ivf_seqhdr(ivf_hdr,
+			scode->inst->out_format.width,
+			scode->inst->out_format.height);
+	ret = vpu_helper_copy_to_stream_buffer(&scode->inst->stream_buffer,
+						&scode->wptr,
+						sizeof(ivf_hdr),
+						ivf_hdr);
+	if (ret < 0)
+		return ret;
+	size += ret;
+
+	return size;
+}
+
+static int vpu_malone_insert_scode_vp8_pic(struct malone_scode_t *scode)
+{
+	int ret;
+	int size = 0;
+	u8 ivf_hdr[MALONE_VP8_IVF_FRAME_HEADER_LEN] = {0};
+
+	ret = vpu_malone_insert_scode_pic(scode, MALONE_CODEC_ID_VP8, sizeof(ivf_hdr));
+	if (ret < 0)
+		return ret;
+	size = ret;
+
+	set_vp8_ivf_pichdr(ivf_hdr, vb2_get_plane_payload(scode->vb, 0));
+	ret = vpu_helper_copy_to_stream_buffer(&scode->inst->stream_buffer,
+						&scode->wptr,
+						sizeof(ivf_hdr),
+						ivf_hdr);
+	if (ret < 0)
+		return ret;
+	size += ret;
+
+	return size;
+}
+
+static const struct malone_scode_handler scode_handlers[] = {
+	{
+		/* fix me, need to swap return operation after gstreamer swap */
+		.pixelformat = V4L2_PIX_FMT_VC1_ANNEX_L,
+		.insert_scode_seq = vpu_malone_insert_scode_vc1_l_seq,
+		.insert_scode_pic = vpu_malone_insert_scode_vc1_l_pic,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_VC1_ANNEX_G,
+		.insert_scode_pic = vpu_malone_insert_scode_vc1_g_pic,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_VP8,
+		.insert_scode_seq = vpu_malone_insert_scode_vp8_seq,
+		.insert_scode_pic = vpu_malone_insert_scode_vp8_pic,
+	},
+};
+
+static const struct malone_scode_handler *get_scode_handler(u32 pixelformat)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(scode_handlers); i++) {
+		if (scode_handlers[i].pixelformat == pixelformat)
+			return &scode_handlers[i];
+	}
+
+	return NULL;
+}
+
+static int vpu_malone_insert_scode(struct malone_scode_t *scode, u32 type)
+{
+	const struct malone_scode_handler *handler;
+	int ret = 0;
+
+	if (!scode || !scode->inst || !scode->vb)
+		return 0;
+
+	scode->need_data = 1;
+	handler = get_scode_handler(scode->inst->out_format.pixfmt);
+	if (!handler)
+		return 0;
+
+	switch (type) {
+	case SCODE_SEQUENCE:
+		if (handler->insert_scode_seq)
+			ret = handler->insert_scode_seq(scode);
+		break;
+	case SCODE_PICTURE:
+		if (handler->insert_scode_pic)
+			ret = handler->insert_scode_pic(scode);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer *str_buf,
+				struct vpu_inst *inst, struct vb2_buffer *vb,
+				u32 disp_imm)
+{
+	struct malone_scode_t scode;
+	struct vb2_v4l2_buffer *vbuf;
+	u32 wptr;
+	int size = 0;
+	int ret = 0;
+
+	wptr = str_buf->wptr;
+
+	/*add scode: SCODE_SEQUENCE, SCODE_PICTURE, SCODE_SLICE*/
+	vbuf = to_vb2_v4l2_buffer(vb);
+	scode.inst = inst;
+	scode.vb = vb;
+	scode.wptr = wptr;
+	scode.need_data = 1;
+	if (vbuf->sequence == 0 || vpu_vb_is_codecconfig(vbuf))
+		ret = vpu_malone_insert_scode(&scode, SCODE_SEQUENCE);
+
+	if (ret < 0)
+		return -ENOMEM;
+	size += ret;
+	wptr = scode.wptr;
+	if (!scode.need_data) {
+		vpu_malone_update_wptr(str_buf, wptr);
+		return size;
+	}
+
+	ret = vpu_malone_insert_scode(&scode, SCODE_PICTURE);
+	if (ret < 0)
+		return -ENOMEM;
+	size += ret;
+	wptr = scode.wptr;
+
+	ret = vpu_helper_copy_to_stream_buffer(&inst->stream_buffer,
+						&wptr,
+						vb2_get_plane_payload(vb, 0),
+						vb2_plane_vaddr(vb, 0));
+	if (ret < vb2_get_plane_payload(vb, 0))
+		return -ENOMEM;
+	size += ret;
+
+	vpu_malone_update_wptr(str_buf, wptr);
+
+	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
+		ret = vpu_malone_add_scode(inst->core->iface,
+					     inst->id,
+					     &inst->stream_buffer,
+					     inst->out_format.pixfmt,
+					     SCODE_PADDING_BUFFLUSH);
+		if (ret < 0)
+			return ret;
+		size += ret;
+	}
+
+	return size;
+}
+
+static int vpu_malone_input_stream_data(struct vpu_malone_str_buffer *str_buf,
+				struct vpu_inst *inst, struct vb2_buffer *vb)
+{
+	u32 wptr;
+	int ret = 0;
+
+	wptr = str_buf->wptr;
+	ret = vpu_helper_copy_to_stream_buffer(&inst->stream_buffer,
+						&wptr,
+						vb2_get_plane_payload(vb, 0),
+						vb2_plane_vaddr(vb, 0));
+	if (ret < vb2_get_plane_payload(vb, 0))
+		return -ENOMEM;
+
+	vpu_malone_update_wptr(str_buf, wptr);
+
+	return ret;
+}
+
+static int vpu_malone_input_ts(struct vpu_inst *inst, s64  timestamp, u32 size)
+{
+	struct vpu_ts_info info;
+
+	memset(&info, 0, sizeof(info));
+	info.timestamp = timestamp;
+	info.size = size;
+
+	return vpu_session_fill_timestamp(inst, &info);
+}
+
+int vpu_malone_input_frame(struct vpu_shared_addr *shared,
+			struct vpu_inst *inst, struct vb2_buffer *vb)
+{
+	struct vpu_dec_ctrl *hc;
+	struct vb2_v4l2_buffer *vbuf;
+	struct vpu_malone_str_buffer *str_buf;
+	u32 disp_imm = 0;
+	u32 size;
+	int ret;
+
+	WARN_ON(!shared || !shared->iface || !shared->core || !shared->priv);
+	hc = shared->priv;
+	str_buf = hc->str_buf[inst->id];
+	disp_imm = hc->codec_param[inst->id].disp_imm;
+
+	if (vpu_malone_is_non_frame_mode(shared, inst->id))
+		ret = vpu_malone_input_stream_data(str_buf, inst, vb);
+	else
+		ret = vpu_malone_input_frame_data(str_buf, inst, vb, disp_imm);
+	if (ret < 0)
+		return ret;
+	size = ret;
+
+	/*
+	 * if buffer only contain codec data, and the timestamp is invalid,
+	 * don't put the invalid timestamp to resync
+	 * merge the data to next frame
+	 */
+	vbuf = to_vb2_v4l2_buffer(vb);
+	if (vpu_vb_is_codecconfig(vbuf) && (s64)vb->timestamp < 0) {
+		inst->extra_size += size;
+		return 0;
+	}
+	if (inst->extra_size) {
+		size += inst->extra_size;
+		inst->extra_size = 0;
+	}
+
+	ret = vpu_malone_input_ts(inst, vb->timestamp, size);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static bool vpu_malone_check_ready(struct vpu_shared_addr *shared, u32 instance)
+{
+	struct malone_iface *iface;
+	struct vpu_rpc_buffer_desc *desc;
+	u32 size;
+	u32 rptr;
+	u32 wptr;
+	u32 used;
+
+	iface = shared->iface;
+	desc = &iface->api_cmd_buffer_desc[instance];
+	size = desc->end - desc->start;
+	rptr = desc->rptr;
+	wptr = desc->wptr;
+	used = (wptr + size - rptr) % size;
+	if (!size || used < size / 2)
+		return true;
+
+	return false;
+}
+
+bool vpu_malone_is_ready(struct vpu_shared_addr *shared, u32 instance)
+{
+	u32 cnt = 0;
+
+	while (!vpu_malone_check_ready(shared, instance)) {
+		if (cnt > 30)
+			return false;
+		mdelay(1);
+		cnt++;
+	}
+	return true;
+}
+
+int vpu_malone_pre_cmd(struct vpu_shared_addr *shared, u32 instance)
+{
+	if (!vpu_malone_is_ready(shared, instance))
+		return -EINVAL;
+
+	return 0;
+}
+
+int vpu_malone_post_cmd(struct vpu_shared_addr *shared, u32 instance)
+{
+	struct malone_iface *iface;
+	struct vpu_rpc_buffer_desc *desc;
+
+	iface = shared->iface;
+	desc = &iface->api_cmd_buffer_desc[instance];
+	desc->wptr++;
+	if (desc->wptr == desc->end)
+		desc->wptr = desc->start;
+
+	return 0;
+}
+
+int vpu_malone_init_instance(struct vpu_shared_addr *shared, u32 instance)
+{
+	struct malone_iface *iface;
+	struct vpu_rpc_buffer_desc *desc;
+
+	iface = shared->iface;
+	desc = &iface->api_cmd_buffer_desc[instance];
+	desc->wptr = desc->rptr;
+	if (desc->wptr == desc->end)
+		desc->wptr = desc->start;
+
+	return 0;
+}
+
+u32 vpu_malone_get_max_instance_count(struct vpu_shared_addr *shared)
+{
+	struct malone_iface *iface = shared->iface;
+
+	return iface->max_streams;
+}
diff --git a/drivers/media/platform/amphion/vpu_malone.h b/drivers/media/platform/amphion/vpu_malone.h
new file mode 100644
index 000000000000..4699252fc73c
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_malone.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _AMPHION_VPU_MALONE_H
+#define _AMPHION_VPU_MALONE_H
+
+u32 vpu_malone_get_data_size(void);
+void vpu_malone_init_rpc(struct vpu_shared_addr *shared,
+			struct vpu_buffer *rpc, dma_addr_t boot_addr);
+void vpu_malone_set_log_buf(struct vpu_shared_addr *shared,
+			struct vpu_buffer *log);
+void vpu_malone_set_system_cfg(struct vpu_shared_addr *shared,
+				u32 regs_base, void __iomem *regs, u32 core_id);
+u32 vpu_malone_get_version(struct vpu_shared_addr *shared);
+int vpu_malone_get_stream_buffer_size(struct vpu_shared_addr *shared);
+int vpu_malone_config_stream_buffer(struct vpu_shared_addr *shared,
+					u32 instance, struct vpu_buffer *buf);
+int vpu_malone_get_stream_buffer_desc(struct vpu_shared_addr *shared,
+		u32 instance, struct vpu_rpc_buffer_desc *desc);
+int vpu_malone_update_stream_buffer(struct vpu_shared_addr *shared,
+					u32 instance, u32 ptr, bool write);
+int vpu_malone_set_decode_params(struct vpu_shared_addr *shared,
+		u32 instance, struct vpu_decode_params *params, u32 update);
+int vpu_malone_pack_cmd(struct vpu_rpc_event *pkt, u32 index, u32 id, void *data);
+int vpu_malone_convert_msg_id(u32 msg_id);
+int vpu_malone_unpack_msg_data(struct vpu_rpc_event *pkt, void *data);
+int vpu_malone_add_scode(struct vpu_shared_addr *shared,
+				u32 instance,
+				struct vpu_buffer *stream_buffer,
+				u32 pixelformat,
+				u32 scode_type);
+int vpu_malone_input_frame(struct vpu_shared_addr *shared,
+			struct vpu_inst *inst, struct vb2_buffer *vb);
+bool vpu_malone_is_ready(struct vpu_shared_addr *shared, u32 instance);
+int vpu_malone_pre_cmd(struct vpu_shared_addr *shared, u32 instance);
+int vpu_malone_post_cmd(struct vpu_shared_addr *shared, u32 instance);
+int vpu_malone_init_instance(struct vpu_shared_addr *shared, u32 instance);
+u32 vpu_malone_get_max_instance_count(struct vpu_shared_addr *shared);
+
+#endif
-- 
2.33.0


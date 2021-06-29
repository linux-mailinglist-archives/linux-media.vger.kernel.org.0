Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E093B6F46
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 10:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbhF2IYv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 04:24:51 -0400
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:47169
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232593AbhF2IYq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 04:24:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwn5Mjps5z5yN32LkxeMxtXDh9AbExFygzmt4OuB9Q1z/UoIZsMHb36oNljOfsAj8kISA8Wey7PwlQsNcOx+LMZlLrkVpeR3pOHO5v7Zz4tiylC/9v1YCTJlX/g3Ke/7Xqy58YZQKk1444cFl6J4/HImT+sQTk0IZHkqgL1nI/XANB79NW9UL/9jp5l4+3U2bhVPbZFktAKRq7iPDJr9iL3MJujH6vex3ijwetnlNNiAQqV3PZbRzlxHAih547G2qHiyveRVXD/R1EcKnId7IEI5s4p+IKj4Nak4Em5gAySuiF2696aTO1VA9nu+xLmRlKvDxC9dy37afEAy2afiyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S8feg5h21YhaUUr2AWx/9hdLfyNIPUqa9SAJPkPYp8=;
 b=Agf37jtpkZHAfY5GoDiXetZnJlqZHTs6mw4hEeQBI0HxoRBosgWy/HL3HQUDVkWJN2zGk/kzQQoRpIiYO0N5aoLYsJj+2gXB/TTJTKLhSw9NmsfJDQ7pIVPpxiGAHaVKg89lqj1D7TXXbFoG3R3d/MbUJjPqISo9YVqhPtOiKrEDT1Bla2rmBYaI1uqa5IQLkiNrENXuHTyQCNGIghyXO3PXx+DgbOG932pzgzLAhN9xPhzg0W9QqPzw3/HDFgCaq5lj7kJpS06pCfZ0IjWm/1dqZ2CkB4jjiAUvKkAHJF9z9jhx1KszbdRySNAUES+H7khtBHMl7E8SIUuGXXE8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S8feg5h21YhaUUr2AWx/9hdLfyNIPUqa9SAJPkPYp8=;
 b=MbzqLV6BxNLI1E25HunOyEwfbuyNPvjwCwgOxMedJkI0JESevkij+j5vzRNv1O+K+LXrWI32TW6uF/bmJgUXnA8UxfQut99Y+riaw2Ru0oNksWNgbXXzOVfpMEnxTjGBJlwkg7EbCwe3xw0ds9JqwGW0F3omqkQqHJCo9Rqvj5k=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM7PR04MB7191.eurprd04.prod.outlook.com (2603:10a6:20b:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 08:22:12 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642%3]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 08:22:11 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 08/13] media: imx: imx8q: add v4l2 m2m vpu decoder stateful driver
Date:   Tue, 29 Jun 2021 16:21:09 +0800
Message-Id: <65813fcbf86ef51a84fe59c9d34855e5b9177ecb.1624954576.git.ming.qian@nxp.com>
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
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0160.apcprd06.prod.outlook.com (2603:1096:1:1e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 08:22:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4cdc7ec-286d-4405-aff1-08d93ad6fe74
X-MS-TrafficTypeDiagnostic: AM7PR04MB7191:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB71918B26D6ACE6978A8A0FDDE7029@AM7PR04MB7191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ghIsyoHfsvI1B29exPCiuMo/Z7+xpJpiLirwWqSQmuVgsLaw0nUvdRAzDR5/WRm4Ung1Z/TD04d66PbWDPY3w0acYo/fQM8JIvQoeWP9Oodgia/ibXSkGDNz7y8HYOgeL8wjfTfxbw0lW5fItB+fMrv7wpFBUbaActSs22maBzVc+QbyfrPoSqb5DiAohaR5jdgeoGjNIIxJRNbo0BLNlyi1QEA5PXWRv16xtWS+TeRyRVrzMDkSjE8VGVbMJnd+DgAMv1ldNMXufqVHO5BPRfygU+QsKr1J4t+Ooe/H6Xc22Cpyrp+aJo0MEB/ILULue/+f3zaZjFCfs3nM/rkb/1r8cwCqaA/Jit3rvW5fW2fEi7jaMXXn8WUIcFIpZ+XnfeP5y92jzEJUqOBlDGwkx1tGPgHRZJ47WOoN4Wi7MCA6KX1rFKlIb65+236p7Srk0yUWjpAn7zcOGcu2NqdXtb3o/d4ULSlI1I9PFPwbAMpz/ef2kKfG+KQrB65CS9HwlA4a0eB2UGUWhicc03veDk+6lCIpdK2FJGSgJkx/GKC5hZ0xUYQHbDlfscn9lDtMF0/wYUqjd6EwSWq57sj98cL9dxcXRSRNP6o75n3hQmNJnjrLKeaou5mvC9ko8DB7em0Zsv/mfMOWHOwz0ac92nSWdLgHa7I/LqWBswp5N5C9Vn7zw6Oa9w5c7z90C4I92CHVpcr5dnPY7K4Y0ry6j0y7wJaGEv4Bd90gJdZilhBhVXliMEStVNuIgoHrbPDPzGbIabbLhoPR8wzjvLR+oLsnpFa79EiFQu5n1f4UamRLslBOZMlxx8+vwvjqqroQa92OORDPINo823BgY6iMfqCLqJoQ1PBtXLnFzq6gKSI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39850400004)(86362001)(7696005)(52116002)(7416002)(38350700002)(5660300002)(66946007)(966005)(44832011)(8936002)(4326008)(6486002)(478600001)(66476007)(30864003)(2616005)(316002)(38100700002)(8676002)(956004)(66556008)(36756003)(83380400001)(2906002)(26005)(16526019)(186003)(32563001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KtdUEwqQLw6h9MZuBxbAYD+jV4LzC6qDHQFq+IfcHA+S44E5mF7sKZj4sBOz?=
 =?us-ascii?Q?qz5ak2WNHGlUWcvY1iZXxE1pSKZQB2Ey8+yktu9dnz1d1KnyI35O4vq65m58?=
 =?us-ascii?Q?Q2LGdRT23EkFAkKl4QWw+x0afS3h8F0Khzr6Gp7KCDT7kytqyTqo9UrrDhz5?=
 =?us-ascii?Q?XGrfioRyWKLc1U8TZI5NdVxG4wTMTU5HY7GJQvV9ToUZrK0hfb1ps+SJPrQg?=
 =?us-ascii?Q?jQkxmCvfDfnOr6PFfppg9JzBnMAQ+/NEJDNZrozcT0rBI0vI25cdFRQ3KHLn?=
 =?us-ascii?Q?+WkdIqarRzo8T9Gsnhxd+Ifq0pZQmwXTVf8sP5espS7Tj2I+uufeWofWTHZj?=
 =?us-ascii?Q?AdGskCTKh4HvwzwNmrxMkTixtKnL6lydfjJxJ+zrsuUs5D52mml7tWqp4ziN?=
 =?us-ascii?Q?zqxxplZiiFJb1i8oaSGQBzFjUSgAPJaseOjsHD5fyzuffzZvn/bpvaiLcb02?=
 =?us-ascii?Q?cTCbFk9SbLL79/7UZgCAoZ2sId5HA7tMr+qrBACyJiCOpE/xkZf4IkEMX8b3?=
 =?us-ascii?Q?2H89IB7DxkzB/D93lSuo+AWpJzI5wpJIHvNoyy6vTx993HoCkUcuyQ+/6Hjf?=
 =?us-ascii?Q?xLGdbGQJ2GsenwSRDtYqk37JoGdcqDJUIFB7CIKCbxHsvhxRfSkrs5+a+mN5?=
 =?us-ascii?Q?Hjz/R/e/f2yl+36IY9zBrKoGsWtLwbOAYuZEPsA4GZRfNK0w2t++SGLIxgRZ?=
 =?us-ascii?Q?StqmI8xKEIymyHO6IVpa4bxFIFoKgXpnhlz23G7Zi0sZZX3iD5jVTAYhy0yZ?=
 =?us-ascii?Q?0L588g8XugND/WlB3yzfPThzFJmB9Muqp6z9DU6jhA2CSQBrQdHRAVYcHYOf?=
 =?us-ascii?Q?wK5oWPL5DS+D/guFJz8Rdt8D+G55XJmqZvEec1/nwK10HI6Xk7aoy0jFGeBQ?=
 =?us-ascii?Q?c/UeE4OCrtsCeUEBmYqjZAkL9UZcjUson0dFPAqjWmHzFwWr3AUvzhd+xWEe?=
 =?us-ascii?Q?s0SnJlafDOvWJV27OyiX2u0dDXOZDXUnUn5HWytuht2gFsycRyUPX3h46DgB?=
 =?us-ascii?Q?iQxgLeaUizblrvR07EnGmGx2/XvNHQd3bpkfp4uPAQbjyJaWEbNtVS1zveJO?=
 =?us-ascii?Q?xp20fqoxZdTX4ZelGd2IyF9i37ik2BwXzOBPWwaArA8fjzf5N4+x8Vvoir2S?=
 =?us-ascii?Q?YQPHLl/jHWsEksL0c6p8nliQPT5G/l5LKLxnHmuLVvwELHdVO4ZhVYl+uP5p?=
 =?us-ascii?Q?JSCibdJs2CZ9XuLA/ra4CgiST8Ly8gLVwa0bblNI6dH6Iofnfw4gphlU5uif?=
 =?us-ascii?Q?vLfddDWFUxLh+6WcyQ0LlQrS6kX8wQvAHj70Bsaj80PPMBodMt8K+ll7Jszl?=
 =?us-ascii?Q?7hzrzerOym6+X6rcs/0MHNNB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cdc7ec-286d-4405-aff1-08d93ad6fe74
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:22:11.8626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0WzzSckd5Rr0/TytDA7He4MzsiS6LXk1zwW0L5xDeMUQVvwfjDmuqKxW2ENZ1utinxCVIaJF8b5ulf6ne+hbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7191
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This consists of video decoder implementation plus decoder controls.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 drivers/media/platform/imx/vpu-8q/vdec.c | 1783 ++++++++++++++++++++++
 1 file changed, 1783 insertions(+)
 create mode 100644 drivers/media/platform/imx/vpu-8q/vdec.c

diff --git a/drivers/media/platform/imx/vpu-8q/vdec.c b/drivers/media/platform/imx/vpu-8q/vdec.c
new file mode 100644
index 000000000000..7231e2554a76
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vdec.c
@@ -0,0 +1,1783 @@
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
+#define TAG		"DEC"
+#include <linux/init.h>
+#include <linux/interconnect.h>
+#include <linux/ioctl.h>
+#include <linux/list.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/videodev2.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-vmalloc.h>
+#include <linux/imx_vpu.h>
+#include "vpu.h"
+#include "vpu_defs.h"
+#include "vpu_core.h"
+#include "vpu_helpers.h"
+#include "vpu_v4l2.h"
+#include "vpu_cmds.h"
+#include "vpu_rpc.h"
+#include "vpu_log.h"
+
+#define VDEC_FRAME_DEPTH		256
+
+struct vdec_fs_info {
+	char name[8];
+	u32 type;
+	u32 max_count;
+	u32 req_count;
+	u32 count;
+	u32 index;
+	u32 size;
+	struct vpu_buffer buffer[32];
+	u32 tag;
+};
+
+struct vdec_t {
+	u32 seq_hdr_found;
+	struct vpu_buffer udata;
+	struct vpu_decode_params params;
+	struct vpu_dec_codec_info codec_info;
+	enum vpu_codec_state state;
+
+	struct vpu_vb2_buffer *slots[VB2_MAX_FRAME];
+	u32 req_frame_count;
+	struct vdec_fs_info mbi;
+	struct vdec_fs_info dcp;
+	u32 seq_tag;
+
+	u32 decoded_frame_count;
+	u32 display_frame_count;
+	u32 eos_received;
+	u32 eos_subscribed;
+	u32 source_change;
+	u32 drain;
+	u32 ts_pre_count;
+	u32 frame_depth;
+	s64 ts_start;
+	s64 ts_input;
+	s64 timestamp;
+};
+
+static const struct vpu_format vdec_formats[] = {
+	{
+		.pixfmt = V4L2_PIX_FMT_NV12,
+		.num_planes = 2,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+	{
+		.name = "NXP Tiled NV12 Format",
+		.pixfmt = V4L2_PIX_FMT_NT8,
+		.num_planes = 2,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+	{
+		.name = "NXP Tiled 10bit Format",
+		.pixfmt = V4L2_PIX_FMT_NT10,
+		.num_planes = 2,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_H264_MVC,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_VC1_ANNEX_G,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_VC1_ANNEX_L,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_MPEG2,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_MPEG4,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{
+		.name = "AVS",
+		.pixfmt = V4L2_PIX_FMT_AVS,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_XVID,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_JPEG,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{
+		.name = "VP6",
+		.pixfmt = V4L2_PIX_FMT_VP6,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_VP8,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{
+		.name = "SPK",
+		.pixfmt = V4L2_PIX_FMT_SPK,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_H263,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{0, 0, 0, 0},
+};
+
+static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vpu_inst *inst = ctrl_to_inst(ctrl);
+	struct vdec_t *vdec = inst->priv;
+
+	switch (ctrl->id) {
+	case V4L2_CID_DIS_REORDER:
+		vdec->params.b_dis_reorder = ctrl->val;
+		break;
+	case V4L2_CID_NON_FRAME:
+		vdec->params.b_non_frame = ctrl->val;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops vdec_ctrl_ops = {
+	.s_ctrl = vdec_op_s_ctrl,
+	.g_volatile_ctrl = vpu_helper_g_volatile_ctrl,
+};
+
+static struct v4l2_ctrl_config vdec_custom_cfg[] = {
+	{
+		.id = V4L2_CID_DIS_REORDER,
+		.name = "frame disable reoder ctrl",
+		.ops = &vdec_ctrl_ops,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.min = 0,
+		.max = 1,
+		.step = 1,
+		.def = 0,
+	},
+	{
+		.id = V4L2_CID_NON_FRAME,
+		.name = "stream input mode, is non frame or not",
+		.ops = &vdec_ctrl_ops,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.min = 0,
+		.max = 1,
+		.step = 1,
+		.def = 0,
+	},
+	{0, 0, 0, 0},
+};
+
+static int vdec_ctrl_init(struct vpu_inst *inst)
+{
+	struct v4l2_ctrl *ctrl;
+	int i;
+	int ret;
+
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 20);
+	if (ret)
+		return ret;
+
+	ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
+			V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 2);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+
+	ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
+			V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, 1, 2);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+
+	for (i = 0; i < ARRAY_SIZE(vdec_custom_cfg); i++)
+		ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+					    &vdec_custom_cfg[i], NULL);
+
+	ret = v4l2_ctrl_handler_setup(&inst->ctrl_handler);
+	if (ret) {
+		inst_err(inst, "setup ctrls fail, ret = %d\n", ret);
+		v4l2_ctrl_handler_free(&inst->ctrl_handler);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int vdec_handle_eos(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+
+	if (!vdec->eos_received)
+		return 0;
+
+	if (!vdec->eos_subscribed)
+		return 0;
+
+	if (!list_empty(&dst_q->done_list))
+		return 0;
+
+	dst_q->last_buffer_dequeued = true;
+	vpu_notify_eos(inst);
+	vdec->eos_received--;
+
+	return 0;
+}
+
+static void vdec_handle_resolution_change(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vb2_queue *q;
+
+	if (inst->state != VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE)
+		return;
+	if (!vdec->source_change)
+		return;
+
+	q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	if (!list_empty(&q->done_list))
+		return;
+
+	vdec->source_change--;
+	vpu_notify_source_change(inst);
+}
+
+static int vdec_update_state(struct vpu_inst *inst,
+		enum vpu_codec_state state, u32 force)
+{
+	struct vdec_t *vdec = inst->priv;
+	enum vpu_codec_state pre_state = inst->state;
+
+	if (state == VPU_CODEC_STATE_SEEK) {
+		if (inst->state == VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE)
+			vdec->state = inst->state;
+		else
+			vdec->state = VPU_CODEC_STATE_ACTIVE;
+	}
+	if (inst->state != VPU_CODEC_STATE_SEEK || force)
+		inst->state = state;
+	else if (state == VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE)
+		vdec->state = VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE;
+
+	inst_dbg(inst, LVL_FLOW, "state : %d -> %d\n", pre_state, inst->state);
+
+	if (inst->state == VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE)
+		vdec_handle_resolution_change(inst);
+
+	return 0;
+}
+
+static int vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, "vpu B0", sizeof(cap->driver));
+	strscpy(cap->card, "imx vpu decoder", sizeof(cap->card));
+	strscpy(cap->bus_info, "platform: imx8q-vpu", sizeof(cap->bus_info));
+
+	return 0;
+}
+
+static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct vdec_t *vdec = inst->priv;
+	const struct vpu_format *fmt;
+	const char *descr = NULL;
+	int ret = -EINVAL;
+
+	mutex_lock(&inst->lock);
+	if (!V4L2_TYPE_IS_OUTPUT(f->type) && vdec->seq_hdr_found) {
+		if (f->index == 0) {
+			f->pixelformat = inst->cap_format.pixfmt;
+			f->flags = inst->cap_format.flags;
+			descr = inst->cap_format.name;
+			ret = 0;
+		}
+	} else {
+		fmt = vpu_helper_enum_format(inst, f->type, f->index);
+		memset(f->reserved, 0, sizeof(f->reserved));
+		if (!fmt)
+			goto exit;
+
+		f->pixelformat = fmt->pixfmt;
+		f->flags = fmt->flags;
+		descr = fmt->name;
+		ret = 0;
+	}
+	if (descr && strlen(descr))
+		strscpy(f->description, descr, sizeof(f->description));
+
+exit:
+	mutex_unlock(&inst->lock);
+	return ret;
+}
+
+static int vdec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct vdec_t *vdec = inst->priv;
+	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	struct vpu_format *cur_fmt;
+	int i;
+
+	cur_fmt = vpu_get_format(inst, f->type);
+
+	pixmp->pixelformat = cur_fmt->pixfmt;
+	pixmp->num_planes = cur_fmt->num_planes;
+	pixmp->width = cur_fmt->width;
+	pixmp->height = cur_fmt->height;
+	pixmp->field = cur_fmt->field;
+	pixmp->flags = cur_fmt->flags;
+	for (i = 0; i < pixmp->num_planes; i++) {
+		pixmp->plane_fmt[i].bytesperline = cur_fmt->bytesperline[i];
+		pixmp->plane_fmt[i].sizeimage = cur_fmt->sizeimage[i];
+	}
+
+	f->fmt.pix_mp.colorspace = vdec->codec_info.color_primaries;
+	f->fmt.pix_mp.xfer_func = vdec->codec_info.transfer_chars;
+	f->fmt.pix_mp.ycbcr_enc = vdec->codec_info.matrix_coeffs;
+	f->fmt.pix_mp.quantization = vdec->codec_info.full_range;
+
+	inst_dbg(inst, LVL_DEBUG, "%s g_fmt: %c%c%c%c %dx%d %d,%d, %d,%d\n",
+			vpu_type_name(f->type),
+			f->fmt.pix_mp.pixelformat,
+			f->fmt.pix_mp.pixelformat >> 8,
+			f->fmt.pix_mp.pixelformat >> 16,
+			f->fmt.pix_mp.pixelformat >> 24,
+			f->fmt.pix_mp.width,
+			f->fmt.pix_mp.height,
+			pixmp->plane_fmt[0].sizeimage,
+			pixmp->plane_fmt[1].sizeimage,
+			pixmp->plane_fmt[0].bytesperline,
+			pixmp->plane_fmt[1].bytesperline);
+
+	return 0;
+}
+
+static int vdec_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct vdec_t *vdec = inst->priv;
+
+	vpu_try_fmt_common(inst, f);
+
+	mutex_lock(&inst->lock);
+	if (vdec->seq_hdr_found) {
+		f->fmt.pix_mp.colorspace = vdec->codec_info.color_primaries;
+		f->fmt.pix_mp.xfer_func = vdec->codec_info.transfer_chars;
+		f->fmt.pix_mp.ycbcr_enc = vdec->codec_info.matrix_coeffs;
+		f->fmt.pix_mp.quantization = vdec->codec_info.full_range;
+	} else {
+		f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
+		f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+		f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+		f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	}
+	mutex_unlock(&inst->lock);
+
+	return 0;
+}
+
+static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	const struct vpu_format *fmt;
+	struct vpu_format *cur_fmt;
+	struct vb2_queue *q;
+	struct vdec_t *vdec;
+	int i;
+
+	vdec = inst->priv;
+	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
+	if (!q)
+		return -EINVAL;
+	if (vb2_is_streaming(q))
+		return -EBUSY;
+
+	fmt = vpu_try_fmt_common(inst, f);
+	if (!fmt)
+		return -EINVAL;
+
+	cur_fmt = vpu_get_format(inst, f->type);
+
+	mutex_lock(&inst->lock);
+	cur_fmt->pixfmt = fmt->pixfmt;
+	cur_fmt->type = fmt->type;
+	if (V4L2_TYPE_IS_OUTPUT(f->type) || vdec->seq_hdr_found <= 0) {
+		cur_fmt->num_planes = fmt->num_planes;
+		cur_fmt->flags = fmt->flags;
+		cur_fmt->width = pixmp->width;
+		cur_fmt->height = pixmp->height;
+		for (i = 0; i < fmt->num_planes; i++) {
+			cur_fmt->sizeimage[i] = pixmp->plane_fmt[i].sizeimage;
+			cur_fmt->bytesperline[i] = pixmp->plane_fmt[i].bytesperline;
+		}
+		if (pixmp->field != V4L2_FIELD_ANY)
+			cur_fmt->field = pixmp->field;
+	} else {
+		pixmp->num_planes = cur_fmt->num_planes;
+		pixmp->width = cur_fmt->width;
+		pixmp->height = cur_fmt->height;
+		for (i = 0; i < pixmp->num_planes; i++) {
+			pixmp->plane_fmt[i].bytesperline = cur_fmt->bytesperline[i];
+			pixmp->plane_fmt[i].sizeimage = cur_fmt->sizeimage[i];
+		}
+		pixmp->field = cur_fmt->field;
+	}
+	if (V4L2_TYPE_IS_OUTPUT(f->type))
+		vdec->params.codec_format = cur_fmt->pixfmt;
+	else
+		vdec->params.output_format = cur_fmt->pixfmt;
+
+	if (!vdec->seq_hdr_found) {
+		vdec->codec_info.color_primaries = f->fmt.pix_mp.colorspace;
+		vdec->codec_info.transfer_chars = f->fmt.pix_mp.xfer_func;
+		vdec->codec_info.matrix_coeffs = f->fmt.pix_mp.ycbcr_enc;
+		vdec->codec_info.full_range = f->fmt.pix_mp.quantization;
+
+		inst->crop.left = 0;
+		inst->crop.top = 0;
+		inst->crop.width = cur_fmt->width;
+		inst->crop.height = cur_fmt->height;
+	} else {
+		f->fmt.pix_mp.colorspace = vdec->codec_info.color_primaries;
+		f->fmt.pix_mp.xfer_func = vdec->codec_info.transfer_chars;
+		f->fmt.pix_mp.ycbcr_enc = vdec->codec_info.matrix_coeffs;
+		f->fmt.pix_mp.quantization = vdec->codec_info.full_range;
+	}
+
+	mutex_unlock(&inst->lock);
+
+	inst_dbg(inst, LVL_FLOW, "%s s_fmt: %c%c%c%c %dx%d %u,%u, %u,%u\n",
+			vpu_type_name(f->type),
+			f->fmt.pix_mp.pixelformat,
+			f->fmt.pix_mp.pixelformat >> 8,
+			f->fmt.pix_mp.pixelformat >> 16,
+			f->fmt.pix_mp.pixelformat >> 24,
+			f->fmt.pix_mp.width,
+			f->fmt.pix_mp.height,
+			pixmp->plane_fmt[0].sizeimage,
+			pixmp->plane_fmt[1].sizeimage,
+			pixmp->plane_fmt[0].bytesperline,
+			pixmp->plane_fmt[1].bytesperline);
+
+	return 0;
+}
+
+static int vdec_g_selection(struct file *file, void *fh,
+					struct v4l2_selection *s)
+{
+	struct vpu_inst *inst = to_inst(file);
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
+			s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+			s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
+			s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		if (!V4L2_TYPE_IS_OUTPUT(s->type))
+			return -EINVAL;
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->out_format.width;
+		s->r.height = inst->out_format.height;
+		break;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		if (!V4L2_TYPE_IS_OUTPUT(s->type))
+			return -EINVAL;
+		s->r = inst->crop;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+	case V4L2_SEL_TGT_COMPOSE_PADDED:
+		if (V4L2_TYPE_IS_OUTPUT(s->type))
+			return -EINVAL;
+		s->r = inst->crop;
+		break;
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		if (V4L2_TYPE_IS_OUTPUT(s->type))
+			return -EINVAL;
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->cap_format.width;
+		s->r.height = inst->cap_format.height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+
+	return 0;
+}
+
+static int vdec_drain(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	if (!vdec->drain)
+		return 0;
+
+	if (v4l2_m2m_num_src_bufs_ready(inst->m2m_ctx))
+		return 0;
+
+	if (!vdec->params.frame_count) {
+		vpu_notify_eos(inst);
+		return 0;
+	}
+
+	vpu_iface_add_scode(inst, SCODE_PADDING_EOS);
+	vdec->params.end_flag = 1;
+	vpu_iface_set_decode_params(inst, &vdec->params, 1);
+	vdec->drain = 0;
+	inst_dbg(inst, LVL_FLOW, "append eos\n");
+
+	return 0;
+}
+
+static int vdec_cmd_stop(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	inst_dbg(inst, LVL_FLOW, "stop cmd\n");
+
+	if (inst->state == VPU_CODEC_STATE_DEINIT) {
+		vpu_notify_eos(inst);
+	} else {
+		mutex_lock(&inst->lock);
+		vdec->drain = 1;
+		vdec_drain(inst);
+		mutex_unlock(&inst->lock);
+	}
+
+	return 0;
+}
+
+static int vdec_cmd_reset(struct vpu_inst *inst)
+{
+	inst_dbg(inst, LVL_FLOW, "reset cmd\n");
+
+	if (inst->state == VPU_CODEC_STATE_DEINIT)
+		return 0;
+
+	if (vb2_is_streaming(v4l2_m2m_get_src_vq(inst->m2m_ctx)))
+		return -EINVAL;
+	if (vb2_is_streaming(v4l2_m2m_get_dst_vq(inst->m2m_ctx)))
+		return -EINVAL;
+	vpu_session_stop(inst);
+
+	return 0;
+}
+
+static int vdec_decoder_cmd(struct file *file,
+		void *fh,
+		struct v4l2_decoder_cmd *cmd)
+{
+	struct vpu_inst *inst = to_inst(file);
+	int ret;
+
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
+	if (ret)
+		return ret;
+
+	switch (cmd->cmd) {
+	case V4L2_DEC_CMD_STOP:
+		vdec_cmd_stop(inst);
+		break;
+	case V4L2_DEC_CMD_RESET:
+		vdec_cmd_reset(inst);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int vdec_subscribe_event(struct v4l2_fh *fh,
+		const struct v4l2_event_subscription *sub)
+{
+	struct vpu_inst *inst = container_of(fh, struct vpu_inst, fh);
+	struct vdec_t *vdec = inst->priv;
+
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		vdec->eos_subscribed = true;
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_src_change_event_subscribe(fh, sub);
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	case V4L2_EVENT_SKIP:
+	case V4L2_EVENT_CODEC_ERROR:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int vdec_unsubscribe_event(struct v4l2_fh *fh,
+				const struct v4l2_event_subscription *sub)
+{
+	struct vpu_inst *inst = container_of(fh, struct vpu_inst, fh);
+	struct vdec_t *vdec = inst->priv;
+	int ret;
+
+	ret = v4l2_event_unsubscribe(fh, sub);
+	if (ret)
+		return ret;
+
+	if (sub->type == V4L2_EVENT_EOS)
+		vdec->eos_subscribed = false;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops vdec_ioctl_ops = {
+	.vidioc_querycap               = vdec_querycap,
+	.vidioc_enum_fmt_vid_cap       = vdec_enum_fmt,
+	.vidioc_enum_fmt_vid_out       = vdec_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane   = vdec_g_fmt,
+	.vidioc_g_fmt_vid_out_mplane   = vdec_g_fmt,
+	.vidioc_try_fmt_vid_cap_mplane = vdec_try_fmt,
+	.vidioc_try_fmt_vid_out_mplane = vdec_try_fmt,
+	.vidioc_s_fmt_vid_cap_mplane   = vdec_s_fmt,
+	.vidioc_s_fmt_vid_out_mplane   = vdec_s_fmt,
+	.vidioc_g_selection            = vdec_g_selection,
+	.vidioc_try_decoder_cmd        = v4l2_m2m_ioctl_try_decoder_cmd,
+	.vidioc_decoder_cmd            = vdec_decoder_cmd,
+	.vidioc_subscribe_event        = vdec_subscribe_event,
+	.vidioc_unsubscribe_event      = vdec_unsubscribe_event,
+	.vidioc_reqbufs                = vpu_v4l2_ioctl_reqbufs,
+	.vidioc_create_bufs	       = vpu_v4l2_ioctl_create_bufs,
+	.vidioc_prepare_buf	       = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_querybuf               = v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf                   = vpu_v4l2_ioctl_qbuf,
+	.vidioc_expbuf                 = v4l2_m2m_ioctl_expbuf,
+	.vidioc_dqbuf                  = vpu_v4l2_ioctl_dqbuf,
+	.vidioc_streamon               = vpu_v4l2_ioctl_streamon,
+	.vidioc_streamoff              = vpu_v4l2_ioctl_streamoff,
+};
+
+static bool vdec_check_ready(struct vpu_inst *inst, unsigned int type)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		if (vdec->ts_pre_count >= vdec->frame_depth)
+			return false;
+		return true;
+	}
+
+	if (vdec->req_frame_count || vdec->eos_received)
+		return true;
+
+	return false;
+}
+
+static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vpu_dec_pic_info *info = arg;
+	struct vpu_vb2_buffer *vpu_buf;
+	int ret = 0;
+
+	if (!info || info->id >= ARRAY_SIZE(vdec->slots))
+		return -EINVAL;
+
+	mutex_lock(&inst->lock);
+	vpu_buf = vdec->slots[info->id];
+	if (!vpu_buf) {
+		inst_err(inst, "decoded invalid frame[%d]\n", info->id);
+		ret = -EINVAL;
+		goto exit;
+	}
+	if (vpu_buf->state == VPU_BUF_STATE_DECODED)
+		inst_dbg(inst, LVL_INFO, "buf[%d] has been decoded\n", info->id);
+	vpu_buf->state = VPU_BUF_STATE_DECODED;
+	vdec->decoded_frame_count++;
+	if (vdec->ts_pre_count >= info->consumed_count)
+		vdec->ts_pre_count -= info->consumed_count;
+	else
+		vdec->ts_pre_count = 0;
+exit:
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
+static struct vpu_vb2_buffer *vdec_find_buffer(struct vpu_inst *inst, u32 luma)
+{
+	struct vdec_t *vdec = inst->priv;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
+		if (!vdec->slots[i])
+			continue;
+		if (luma == vdec->slots[i]->luma)
+			return vdec->slots[i];
+	}
+
+	return NULL;
+}
+
+static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vpu_vb2_buffer *vpu_buf;
+	struct vb2_v4l2_buffer *vbuf;
+
+	if (!frame)
+		return;
+
+	mutex_lock(&inst->lock);
+	vpu_buf = vdec_find_buffer(inst, frame->luma);
+	mutex_unlock(&inst->lock);
+	if (!vpu_buf) {
+		inst_err(inst, "can't find buffer, id = %d, addr = 0x%x\n",
+				frame->id, frame->luma);
+		return;
+	}
+	if (frame->skipped) {
+		inst_dbg(inst, LVL_DEBUG, "frame skip\n");
+		vpu_notify_skip(inst);
+		return;
+	}
+
+	vbuf = &vpu_buf->m2m_buf.vb;
+	if (vbuf->vb2_buf.index != frame->id)
+		inst_err(inst, "buffer id(%d, %d) dismatch\n",
+				vbuf->vb2_buf.index, frame->id);
+
+	if (vpu_buf->state != VPU_BUF_STATE_DECODED)
+		inst_err(inst, "buffer(%d) ready without decoded\n", frame->id);
+	vpu_buf->state = VPU_BUF_STATE_READY;
+	vb2_set_plane_payload(&vbuf->vb2_buf, 0, inst->cap_format.sizeimage[0]);
+	vb2_set_plane_payload(&vbuf->vb2_buf, 1, inst->cap_format.sizeimage[1]);
+	vbuf->vb2_buf.timestamp = frame->timestamp;
+	vbuf->field = inst->cap_format.field;
+	inst_dbg(inst, LVL_TS, "[OUTPUT TS]%32lld\n", frame->timestamp);
+
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+	mutex_lock(&inst->lock);
+	vdec->timestamp = frame->timestamp;
+	vdec->display_frame_count++;
+	mutex_unlock(&inst->lock);
+	inst_dbg(inst, LVL_DEBUG, "decoded : %d, display : %d\n",
+			vdec->decoded_frame_count, vdec->display_frame_count);
+}
+
+static void vdec_stop_done(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	mutex_lock(&inst->lock);
+	vdec_update_state(inst, VPU_CODEC_STATE_DEINIT, 0);
+	vdec->seq_hdr_found = 0;
+	mutex_unlock(&inst->lock);
+}
+
+static void vdec_init_fmt(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	inst->out_format.width = vdec->codec_info.decoded_width;
+	inst->out_format.height = vdec->codec_info.decoded_height;
+	inst->cap_format.width = vdec->codec_info.decoded_width;
+	inst->cap_format.height = vdec->codec_info.decoded_height;
+	inst->cap_format.pixfmt = vdec->codec_info.pixfmt;
+	inst->cap_format.bytesperline[0] = vdec->codec_info.bytesperline[0];
+	inst->cap_format.bytesperline[1] = vdec->codec_info.bytesperline[1];
+	inst->cap_format.sizeimage[0] = vdec->codec_info.sizeimage[0];
+	inst->cap_format.sizeimage[1] = vdec->codec_info.sizeimage[1];
+	if (vdec->codec_info.progressive)
+		inst->cap_format.field = V4L2_FIELD_NONE;
+	else
+		inst->cap_format.field = V4L2_FIELD_INTERLACED;
+	if (vdec->codec_info.color_primaries == V4L2_COLORSPACE_DEFAULT)
+		vdec->codec_info.color_primaries = V4L2_COLORSPACE_REC709;
+	if (vdec->codec_info.transfer_chars == V4L2_XFER_FUNC_DEFAULT)
+		vdec->codec_info.transfer_chars = V4L2_XFER_FUNC_709;
+	if (vdec->codec_info.matrix_coeffs == V4L2_YCBCR_ENC_DEFAULT)
+		vdec->codec_info.matrix_coeffs = V4L2_YCBCR_ENC_709;
+	if (vdec->codec_info.full_range == V4L2_QUANTIZATION_DEFAULT)
+		vdec->codec_info.full_range = V4L2_QUANTIZATION_LIM_RANGE;
+}
+
+static void vdec_init_crop(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	inst->crop.left = vdec->codec_info.offset_x;
+	inst->crop.top = vdec->codec_info.offset_y;
+	inst->crop.width = vdec->codec_info.width;
+	inst->crop.height = vdec->codec_info.height;
+}
+
+static void vdec_init_mbi(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	vdec->mbi.size = vdec->codec_info.mbi_size;
+	vdec->mbi.max_count = ARRAY_SIZE(vdec->mbi.buffer);
+	scnprintf(vdec->mbi.name, sizeof(vdec->mbi.name), "mbi");
+	vdec->mbi.type = MEM_RES_MBI;
+	vdec->mbi.tag = vdec->seq_tag;
+}
+
+static void vdec_init_dcp(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	vdec->dcp.size = vdec->codec_info.dcp_size;
+	vdec->dcp.max_count = ARRAY_SIZE(vdec->dcp.buffer);
+	scnprintf(vdec->dcp.name, sizeof(vdec->dcp.name), "dcp");
+	vdec->dcp.type = MEM_RES_DCP;
+	vdec->dcp.tag = vdec->seq_tag;
+}
+
+static void vdec_request_one_fs(struct vdec_fs_info *fs)
+{
+	WARN_ON(!fs);
+
+	fs->req_count++;
+	if (fs->req_count > fs->max_count) {
+		vpu_err("error:request %s over %d\n", fs->name, fs->max_count);
+		fs->req_count = fs->max_count;
+	}
+}
+
+static int vdec_alloc_fs_buffer(struct vpu_inst *inst, struct vdec_fs_info *fs)
+{
+	struct vpu_buffer *buffer;
+
+	if (!inst || !fs || !fs->size)
+		return -EINVAL;
+
+	if (fs->count >= fs->req_count)
+		return -EINVAL;
+
+	buffer = &fs->buffer[fs->count];
+	if (buffer->virt && buffer->length >= fs->size)
+		return 0;
+
+	vpu_free_dma(buffer);
+	buffer->length = fs->size;
+	return vpu_alloc_dma(inst->core, buffer);
+}
+
+static void vdec_alloc_fs(struct vpu_inst *inst, struct vdec_fs_info *fs)
+{
+	int ret;
+
+	while (fs->count < fs->req_count) {
+		ret = vdec_alloc_fs_buffer(inst, fs);
+		if (ret)
+			break;
+		fs->count++;
+	}
+}
+
+static void vdec_clear_fs(struct vdec_fs_info *fs)
+{
+	u32 i;
+
+	if (!fs)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(fs->buffer); i++)
+		vpu_free_dma(&fs->buffer[i]);
+	memset(fs, 0, sizeof(*fs));
+}
+
+static int vdec_response_fs(struct vpu_inst *inst, struct vdec_fs_info *fs)
+{
+	struct vpu_fs_info info;
+	int ret;
+
+	if (fs->index >= fs->count)
+		return 0;
+
+	memset(&info, 0, sizeof(info));
+	info.id = fs->index;
+	info.type = fs->type;
+	info.tag = fs->tag;
+	info.luma_addr = fs->buffer[fs->index].phys;
+	info.luma_size = fs->buffer[fs->index].length;
+	ret = vpu_session_alloc_fs(inst, &info);
+	if (ret)
+		return ret;
+
+	fs->index++;
+	return 0;
+}
+
+static int vdec_response_frame_abnormal(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vpu_fs_info info;
+
+	if (!vdec->req_frame_count)
+		return 0;
+
+	memset(&info, 0, sizeof(info));
+	info.type = MEM_RES_FRAME;
+	info.tag = vdec->seq_tag + 0xf0;
+	vpu_session_alloc_fs(inst, &info);
+	vdec->req_frame_count--;
+
+	return 0;
+}
+
+static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vbuf)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vpu_vb2_buffer *vpu_buf;
+	struct vpu_fs_info info;
+	int ret;
+
+	if (inst->state != VPU_CODEC_STATE_ACTIVE)
+		return -EINVAL;
+
+	if (!vdec->req_frame_count)
+		return -EINVAL;
+
+	if (!vbuf)
+		return -EINVAL;
+
+	if (vdec->slots[vbuf->vb2_buf.index]) {
+		inst_err(inst, "repeat alloc fs %d\n", vbuf->vb2_buf.index);
+		return -EINVAL;
+	}
+
+	inst_dbg(inst, LVL_DEBUG, "inst->state = %d, alloc fs %d, tag = 0x%x\n",
+		inst->state, vbuf->vb2_buf.index, vdec->seq_tag);
+	vpu_buf = to_vpu_vb2_buffer(vbuf);
+
+	memset(&info, 0, sizeof(info));
+	info.id = vbuf->vb2_buf.index;
+	info.type = MEM_RES_FRAME;
+	info.tag = vdec->seq_tag;
+	info.luma_addr = vpu_get_vb_phy_addr(&vbuf->vb2_buf, 0);
+	info.luma_size = inst->cap_format.sizeimage[0];
+	info.chroma_addr = vpu_get_vb_phy_addr(&vbuf->vb2_buf, 1);
+	info.chromau_size = inst->cap_format.sizeimage[1];
+	info.bytesperline = inst->cap_format.bytesperline[0];
+	ret = vpu_session_alloc_fs(inst, &info);
+	if (ret)
+		return ret;
+
+	vpu_buf->tag = info.tag;
+	vpu_buf->luma = info.luma_addr;
+	vpu_buf->chroma_u = info.chromau_size;
+	vpu_buf->chroma_v = 0;
+	vpu_buf->state = VPU_BUF_STATE_INUSE;
+	vdec->slots[info.id] = vpu_buf;
+	vdec->req_frame_count--;
+
+	return 0;
+}
+
+static void vdec_response_fs_request(struct vpu_inst *inst, bool force)
+{
+	struct vdec_t *vdec = inst->priv;
+	int i;
+	int ret;
+
+	if (force) {
+		for (i = vdec->req_frame_count; i > 0; i--)
+			vdec_response_frame_abnormal(inst);
+		return;
+	}
+
+	for (i = vdec->req_frame_count; i > 0; i--) {
+		ret = vpu_process_capture_buffer(inst);
+		if (ret)
+			break;
+		if (vdec->eos_received)
+			break;
+	}
+
+	for (i = vdec->mbi.index; i < vdec->mbi.count; i++) {
+		if (vdec_response_fs(inst, &vdec->mbi))
+			break;
+		if (vdec->eos_received)
+			break;
+	}
+	for (i = vdec->dcp.index; i < vdec->dcp.count; i++) {
+		if (vdec_response_fs(inst, &vdec->dcp))
+			break;
+		if (vdec->eos_received)
+			break;
+	}
+}
+
+static void vdec_response_fs_release(struct vpu_inst *inst, u32 id, u32 tag)
+{
+	struct vpu_fs_info info;
+
+	memset(&info, 0, sizeof(info));
+	info.id = id;
+	info.tag = tag;
+	vpu_session_release_fs(inst, &info);
+}
+
+static void vdec_recycle_buffer(struct vpu_inst *inst, struct vb2_v4l2_buffer *vbuf)
+{
+	if (!inst || !vbuf)
+		return;
+
+	if (vbuf->vb2_buf.state != VB2_BUF_STATE_ACTIVE)
+		return;
+	if (vpu_find_buf_by_idx(inst, vbuf->vb2_buf.type, vbuf->vb2_buf.index))
+		return;
+	v4l2_m2m_buf_queue(inst->m2m_ctx, vbuf);
+}
+
+static void vdec_clear_slots(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vpu_vb2_buffer *vpu_buf;
+	struct vb2_v4l2_buffer *vbuf;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
+		if (!vdec->slots[i])
+			continue;
+
+		vpu_buf = vdec->slots[i];
+		vbuf = &vpu_buf->m2m_buf.vb;
+		if (vpu_buf->tag == vdec->seq_tag)
+			inst_dbg(inst, LVL_WARN, "clear slot[%d], %d, %d\n",
+				i,
+				vdec->slots[i]->state,
+				vbuf->vb2_buf.state);
+
+		vdec_response_fs_release(inst, i, vpu_buf->tag);
+		vdec_recycle_buffer(inst, vbuf);
+		vdec->slots[i]->state = VPU_BUF_STATE_IDLE;
+		vdec->slots[i] = NULL;
+	}
+}
+
+static void vdec_event_seq_hdr(struct vpu_inst *inst,
+				struct vpu_dec_codec_info *hdr)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	mutex_lock(&inst->lock);
+	memcpy(&vdec->codec_info, hdr, sizeof(vdec->codec_info));
+
+	inst_dbg(inst, LVL_FLOW, "%d x %d, crop : (%d, %d) %d x %d\n",
+			vdec->codec_info.decoded_width,
+			vdec->codec_info.decoded_height,
+			vdec->codec_info.offset_x,
+			vdec->codec_info.offset_y,
+			vdec->codec_info.width,
+			vdec->codec_info.height);
+	vdec_init_fmt(inst);
+	vdec_init_crop(inst);
+	inst->min_buffer_cap = hdr->num_ref_frms + hdr->num_dpb_frms;
+	vdec_init_mbi(inst);
+	vdec_init_dcp(inst);
+	if (!vdec->seq_hdr_found) {
+		vdec->seq_tag = vdec->codec_info.tag;
+		vpu_notify_source_change(inst);
+	}
+	if (vdec->seq_tag != vdec->codec_info.tag) {
+		vdec_response_fs_request(inst, true);
+		inst_dbg(inst, LVL_DEBUG, "seq tag change: %d -> %d\n",
+				vdec->seq_tag, vdec->codec_info.tag);
+	}
+	vdec->seq_hdr_found++;
+	mutex_unlock(&inst->lock);
+}
+
+static void vdec_event_resolution_change(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	inst_dbg(inst, LVL_FLOW, "resolution change\n");
+	mutex_lock(&inst->lock);
+	vdec->seq_tag = vdec->codec_info.tag;
+	vdec_clear_fs(&vdec->mbi);
+	vdec_clear_fs(&vdec->dcp);
+	vdec_clear_slots(inst);
+	vdec_init_mbi(inst);
+	vdec_init_dcp(inst);
+	vdec_update_state(inst, VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE, 0);
+	vdec->source_change++;
+	vdec_handle_resolution_change(inst);
+	mutex_unlock(&inst->lock);
+}
+
+static void vdec_event_req_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	if (!fs)
+		return;
+
+	mutex_lock(&inst->lock);
+
+	switch (fs->type) {
+	case MEM_RES_FRAME:
+		vdec->req_frame_count++;
+		break;
+	case MEM_RES_MBI:
+		vdec_request_one_fs(&vdec->mbi);
+		break;
+	case MEM_RES_DCP:
+		vdec_request_one_fs(&vdec->dcp);
+		break;
+	default:
+		break;
+	}
+
+	vdec_alloc_fs(inst, &vdec->mbi);
+	vdec_alloc_fs(inst, &vdec->dcp);
+
+	vdec_response_fs_request(inst, false);
+
+	mutex_unlock(&inst->lock);
+}
+
+static void vdec_evnet_rel_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vpu_vb2_buffer *vpu_buf;
+	struct vb2_v4l2_buffer *vbuf;
+
+	if (!fs || fs->id >= ARRAY_SIZE(vdec->slots))
+		return;
+	if (fs->type != MEM_RES_FRAME)
+		return;
+
+	if (fs->id >= vpu_get_num_buffers(inst, inst->cap_format.type)) {
+		inst_err(inst, "invalid fs(%d) to release\n", fs->id);
+		return;
+	}
+
+	mutex_lock(&inst->lock);
+	vpu_buf = vdec->slots[fs->id];
+	vdec->slots[fs->id] = NULL;
+
+	if (!vpu_buf) {
+		inst_dbg(inst, LVL_DEBUG, "fs[%d] has bee released\n", fs->id);
+		goto exit;
+	}
+
+	if (vpu_buf->state == VPU_BUF_STATE_DECODED) {
+		inst_dbg(inst, LVL_DEBUG, "this frame is skipped\n");
+		vpu_notify_skip(inst);
+	}
+
+	vdec_response_fs_release(inst, fs->id, vpu_buf->tag);
+	vbuf = &vpu_buf->m2m_buf.vb;
+	if (vpu_buf->state != VPU_BUF_STATE_READY)
+		vdec_recycle_buffer(inst, vbuf);
+
+	vpu_buf->state = VPU_BUF_STATE_IDLE;
+	vpu_process_capture_buffer(inst);
+
+exit:
+	mutex_unlock(&inst->lock);
+}
+
+static void vdec_event_eos(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	inst_dbg(inst, LVL_FLOW, "eos\n");
+	mutex_lock(&inst->lock);
+	vdec->eos_received++;
+	vdec_update_state(inst, VPU_CODEC_STATE_DRAIN, 0);
+	vpu_process_capture_buffer(inst);
+	vdec_handle_eos(inst);
+	mutex_unlock(&inst->lock);
+}
+
+static void vdec_event_notify(struct vpu_inst *inst, u32 event, void *data)
+{
+	switch (event) {
+	case VPU_MSG_ID_SEQ_HDR_FOUND:
+		vdec_event_seq_hdr(inst, data);
+		break;
+	case VPU_MSG_ID_RES_CHANGE:
+		vdec_event_resolution_change(inst);
+		break;
+	case VPU_MSG_ID_FRAME_REQ:
+		vdec_event_req_fs(inst, data);
+		break;
+	case VPU_MSG_ID_FRAME_RELEASE:
+		vdec_evnet_rel_fs(inst, data);
+		break;
+	case VPU_MSG_ID_PIC_EOS:
+		vdec_event_eos(inst);
+		break;
+	default:
+		break;
+	}
+}
+
+static int vdec_process_output(struct vpu_inst *inst, struct vb2_buffer *vb)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vb2_v4l2_buffer *vbuf;
+	struct vpu_vb2_buffer *vpu_buf;
+	struct vpu_rpc_buffer_desc desc;
+	s64 timestamp;
+	u32 free_space;
+	int ret;
+
+	vbuf = to_vb2_v4l2_buffer(vb);
+	vpu_buf = to_vpu_vb2_buffer(vbuf);
+	inst_dbg(inst, LVL_DEBUG, "dec output [%d] %d : %ld\n",
+		vbuf->sequence, vb->index, vb2_get_plane_payload(vb, 0));
+
+	if (inst->state == VPU_CODEC_STATE_DEINIT)
+		return -EINVAL;
+
+	if (inst->state == VPU_CODEC_STATE_STARTED)
+		vdec_update_state(inst, VPU_CODEC_STATE_ACTIVE, 0);
+
+	ret = vpu_iface_get_stream_buffer_desc(inst, &desc);
+	if (ret)
+		return ret;
+
+	free_space = vpu_helper_get_free_space(inst);
+	if (free_space < vb2_get_plane_payload(vb, 0) + 0x40000)
+		return -ENOMEM;
+
+	timestamp = vb->timestamp;
+	if (timestamp >= 0 && vdec->ts_start < 0)
+		vdec->ts_start = timestamp;
+	if (vdec->ts_input < timestamp)
+		vdec->ts_input = timestamp;
+
+	ret = vpu_iface_input_frame(inst, vb);
+	if (ret < 0)
+		return -ENOMEM;
+
+	inst_dbg(inst, LVL_TS, "[INPUT  TS]%32lld\n", vb->timestamp);
+	vdec->ts_pre_count++;
+	vdec->params.frame_count++;
+
+	v4l2_m2m_src_buf_remove_by_buf(inst->m2m_ctx, vbuf);
+	vpu_buf->state = VPU_BUF_STATE_IDLE;
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+
+	if (vdec->drain)
+		vdec_drain(inst);
+
+	return 0;
+}
+
+static int vdec_process_capture(struct vpu_inst *inst, struct vb2_buffer *vb)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vb2_v4l2_buffer *vbuf;
+	int ret;
+
+	if (inst->state == VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE)
+		return -EINVAL;
+
+	vbuf = to_vb2_v4l2_buffer(vb);
+
+	if (vdec->eos_received) {
+		if (vdec->eos_subscribed) {
+			vdec_handle_eos(inst);
+		} else {
+			vb2_set_plane_payload(vb, 0, 0);
+			vb2_set_plane_payload(vb, 1, 0);
+			vbuf->flags |= V4L2_BUF_FLAG_LAST;
+			v4l2_m2m_dst_buf_remove_by_buf(inst->m2m_ctx, vbuf);
+			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+			vdec->eos_received--;
+		}
+		return 0;
+	}
+
+	ret = vdec_response_frame(inst, vbuf);
+	if (ret)
+		return ret;
+	v4l2_m2m_dst_buf_remove_by_buf(inst->m2m_ctx, vbuf);
+	return 0;
+}
+
+static void vdec_on_queue_emtpy(struct vpu_inst *inst, u32 type)
+{
+	if (V4L2_TYPE_IS_OUTPUT(type))
+		return;
+
+	mutex_lock(&inst->lock);
+	vdec_handle_resolution_change(inst);
+	vdec_handle_eos(inst);
+	mutex_unlock(&inst->lock);
+}
+
+static void vdec_abort(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vpu_rpc_buffer_desc desc;
+	int ret;
+
+	inst_dbg(inst, LVL_FLOW, "abort, inst->state = %d\n", inst->state);
+	mutex_lock(&inst->lock);
+	vpu_iface_add_scode(inst, SCODE_PADDING_ABORT);
+	vdec->params.end_flag = 1;
+	vpu_iface_set_decode_params(inst, &vdec->params, 1);
+	mutex_unlock(&inst->lock);
+
+	vpu_session_abort(inst);
+
+	mutex_lock(&inst->lock);
+	ret = vpu_iface_get_stream_buffer_desc(inst, &desc);
+	if (!ret)
+		vpu_iface_update_stream_buffer(inst, desc.rptr, 1);
+	mutex_unlock(&inst->lock);
+
+	vpu_session_rst_buf(inst);
+	mutex_lock(&inst->lock);
+	inst_dbg(inst, LVL_FLOW, "input : %d, decoded : %d, display : %d\n",
+			vdec->params.frame_count,
+			vdec->decoded_frame_count,
+			vdec->display_frame_count);
+	vdec->params.end_flag = 0;
+	vdec->drain = 0;
+	vdec->ts_pre_count = 0;
+	vdec->timestamp = VPU_INVALID_TIMESTAMP;
+	vdec->ts_start = VPU_INVALID_TIMESTAMP;
+	vdec->ts_input = VPU_INVALID_TIMESTAMP;
+	vdec->params.frame_count = 0;
+	vdec->decoded_frame_count = 0;
+	vdec->display_frame_count = 0;
+	mutex_unlock(&inst->lock);
+}
+
+static void vdec_release(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	inst_dbg(inst, LVL_FLOW, "release\n");
+	mutex_lock(&inst->lock);
+	vdec_clear_slots(inst);
+	mutex_unlock(&inst->lock);
+	if (inst->state != VPU_CODEC_STATE_DEINIT)
+		vpu_session_stop(inst);
+	vdec_clear_fs(&vdec->mbi);
+	vdec_clear_fs(&vdec->dcp);
+	vpu_free_dma(&vdec->udata);
+	vpu_free_dma(&inst->stream_buffer);
+	mutex_lock(&inst->lock);
+	vdec_update_state(inst, VPU_CODEC_STATE_DEINIT, 1);
+	mutex_unlock(&inst->lock);
+}
+
+static void vdec_cleanup(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec;
+
+	if (!inst)
+		return;
+
+	vdec = inst->priv;
+	if (vdec)
+		vfree(vdec);
+	inst->priv = NULL;
+	vfree(inst);
+}
+
+static void vdec_init_params(struct vdec_t *vdec)
+{
+	vdec->params.frame_count = 0;
+	vdec->params.end_flag = 0;
+}
+
+static int vdec_start(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+	int stream_buffer_size;
+	int ret;
+
+	if (inst->state != VPU_CODEC_STATE_DEINIT)
+		return 0;
+
+	inst_dbg(inst, LVL_FLOW, "start\n");
+	vdec->udata.length = 0x1000;
+	ret = vpu_alloc_dma(inst->core, &vdec->udata);
+	if (ret) {
+		inst_err(inst, "alloc udata fail\n");
+		goto error;
+	}
+
+	vpu_iface_init_instance(inst);
+	stream_buffer_size = vpu_iface_get_stream_buffer_size(inst->core);
+	if (stream_buffer_size > 0) {
+		inst->stream_buffer.length = stream_buffer_size;
+		ret = vpu_alloc_dma(inst->core, &inst->stream_buffer);
+		if (ret) {
+			inst_err(inst, "alloc stream buffer fail\n");
+			goto error;
+		}
+		inst->use_stream_buffer = true;
+		vpu_iface_config_stream_buffer(inst, &inst->stream_buffer);
+	}
+
+	vdec->params.udata.base = vdec->udata.phys;
+	vdec->params.udata.size = vdec->udata.length;
+	ret = vpu_iface_set_decode_params(inst, &vdec->params, 0);
+	if (ret) {
+		inst_err(inst, "set decode params fail\n");
+		goto error;
+	}
+
+	vdec_init_params(vdec);
+	ret = vpu_session_start(inst);
+	if (ret) {
+		inst_err(inst, "start fail\n");
+		goto error;
+	}
+
+	vdec_update_state(inst, VPU_CODEC_STATE_STARTED, 0);
+
+	return 0;
+error:
+	vpu_free_dma(&vdec->udata);
+	vpu_free_dma(&inst->stream_buffer);
+	return ret;
+}
+
+static int vdec_start_session(struct vpu_inst *inst, u32 type)
+{
+	struct vdec_t *vdec = inst->priv;
+	int ret = 0;
+
+	mutex_lock(&inst->lock);
+	if (inst->state == VPU_CODEC_STATE_DEINIT) {
+		if (V4L2_TYPE_IS_OUTPUT(type)) {
+			ret = vdec_start(inst);
+			if (ret)
+				goto exit;
+		}
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		if (inst->state == VPU_CODEC_STATE_SEEK)
+			vdec_update_state(inst, vdec->state, 1);
+		vdec->eos_received = 0;
+		vpu_process_output_buffer(inst);
+	} else {
+		if (inst->state == VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE)
+			vdec_update_state(inst, VPU_CODEC_STATE_ACTIVE, 0);
+		vpu_process_capture_buffer(inst);
+	}
+	if (inst->state == VPU_CODEC_STATE_ACTIVE)
+		vdec_response_fs_request(inst, false);
+
+exit:
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
+static int vdec_stop_session(struct vpu_inst *inst, u32 type)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	if (inst->state == VPU_CODEC_STATE_DEINIT)
+		return 0;
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		mutex_lock(&inst->lock);
+		vdec_update_state(inst, VPU_CODEC_STATE_SEEK, 0);
+		vdec->drain = 0;
+		mutex_unlock(&inst->lock);
+	} else {
+		if (inst->state != VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE)
+			vdec_abort(inst);
+
+		mutex_lock(&inst->lock);
+		vdec->eos_received = 0;
+		vdec_clear_slots(inst);
+		mutex_unlock(&inst->lock);
+	}
+
+	return 0;
+}
+
+static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
+{
+	struct vdec_t *vdec = inst->priv;
+	int num = -1;
+
+	switch (i) {
+	case 0:
+		num = scnprintf(str, size,
+				"req_frame_count = %d\ninterlaced = %d\n",
+				vdec->req_frame_count,
+				vdec->codec_info.progressive ? 0 : 1);
+		break;
+	case 1:
+		num = scnprintf(str, size,
+				"mbi: size = 0x%x request = %d, alloc = %d, response = %d\n",
+				vdec->mbi.size,
+				vdec->mbi.req_count,
+				vdec->mbi.count,
+				vdec->mbi.index);
+		break;
+	case 2:
+		num = scnprintf(str, size,
+				"dcp: size = 0x%x request = %d, alloc = %d, response = %d\n",
+				vdec->dcp.size,
+				vdec->dcp.req_count,
+				vdec->dcp.count,
+				vdec->dcp.index);
+		break;
+	case 3:
+		num = scnprintf(str, size, "input_frame_count = %d\n", vdec->params.frame_count);
+		break;
+	case 4:
+		num = scnprintf(str, size, "decoded_frame_count = %d\n", vdec->decoded_frame_count);
+		break;
+	case 5:
+		num = scnprintf(str, size, "display_frame_count = %d\n", vdec->display_frame_count);
+		break;
+	case 6:
+		num = scnprintf(str, size, "drain = %d, eos = %d, source_change = %d\n",
+				vdec->drain, vdec->eos_received, vdec->source_change);
+		break;
+	case 7:
+		num = scnprintf(str, size, "ts_pre_count = %d, frame_depth = %d\n",
+				vdec->ts_pre_count, vdec->frame_depth);
+		break;
+	case 8:
+		num = scnprintf(str, size, "b_dis_reorder = %d, b_non_frame = %d\n",
+				vdec->params.b_dis_reorder,
+				vdec->params.b_non_frame);
+		break;
+	case 9:
+	{
+		s64 timestamp = vdec->timestamp;
+		s64 ts_start = vdec->ts_start;
+		s64 ts_input = vdec->ts_input;
+
+		num = scnprintf(str, size, "timestamp = %9lld.%09lld(%9lld.%09lld, %9lld.%09lld)\n",
+				timestamp / NSEC_PER_SEC,
+				timestamp % NSEC_PER_SEC,
+				ts_start / NSEC_PER_SEC,
+				ts_start % NSEC_PER_SEC,
+				ts_input / NSEC_PER_SEC,
+				ts_input % NSEC_PER_SEC);
+	}
+		break;
+	default:
+		break;
+	}
+
+	return num;
+}
+
+static struct vpu_inst_ops vdec_inst_ops = {
+	.ctrl_init = vdec_ctrl_init,
+	.check_ready = vdec_check_ready,
+	.buf_done = vdec_buf_done,
+	.get_one_frame = vdec_frame_decoded,
+	.stop_done = vdec_stop_done,
+	.event_notify = vdec_event_notify,
+	.release = vdec_release,
+	.cleanup = vdec_cleanup,
+	.start = vdec_start_session,
+	.stop = vdec_stop_session,
+	.process_output = vdec_process_output,
+	.process_capture = vdec_process_capture,
+	.on_queue_empty = vdec_on_queue_emtpy,
+	.get_debug_info = vdec_get_debug_info,
+};
+
+static void vdec_init(struct file *file)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct vdec_t *vdec;
+	struct v4l2_format f;
+
+	vdec = inst->priv;
+	vdec->frame_depth = VDEC_FRAME_DEPTH;
+	vdec->timestamp = VPU_INVALID_TIMESTAMP;
+	vdec->ts_start = VPU_INVALID_TIMESTAMP;
+	vdec->ts_input = VPU_INVALID_TIMESTAMP;
+
+	memset(&f, 0, sizeof(f));
+	f.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	f.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
+	f.fmt.pix_mp.width = 1280;
+	f.fmt.pix_mp.height = 720;
+	f.fmt.pix_mp.field = V4L2_FIELD_NONE;
+	vdec_s_fmt(file, &inst->fh, &f);
+
+	memset(&f, 0, sizeof(f));
+	f.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	f.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
+	f.fmt.pix_mp.width = 1280;
+	f.fmt.pix_mp.height = 720;
+	f.fmt.pix_mp.field = V4L2_FIELD_NONE;
+	vdec_s_fmt(file, &inst->fh, &f);
+}
+
+int vdec_open(struct file *file)
+{
+	struct vpu_inst *inst;
+	struct vdec_t *vdec;
+	int ret;
+
+	inst = vzalloc(sizeof(*inst));
+	if (!inst)
+		return -ENOMEM;
+
+	vdec = vzalloc(sizeof(*vdec));
+	if (!vdec) {
+		vfree(inst);
+		return -ENOMEM;
+	}
+
+	inst->ops = &vdec_inst_ops;
+	inst->formats = vdec_formats;
+	inst->type = VPU_CORE_TYPE_DEC;
+	inst->priv = vdec;
+
+	ret = vpu_v4l2_open(file, inst);
+	if (ret) {
+		vdec_cleanup(inst);
+		return ret;
+	}
+
+	vdec_init(file);
+
+	return 0;
+}
+
+__poll_t vdec_poll(struct file *file, poll_table *wait)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct vb2_queue *src_q, *dst_q;
+	__poll_t ret;
+
+	ret = v4l2_m2m_fop_poll(file, wait);
+	src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	if (vb2_is_streaming(src_q) && !vb2_is_streaming(dst_q))
+		ret &= (~EPOLLERR);
+
+	return ret;
+}
+
+static const struct v4l2_file_operations vdec_fops = {
+	.owner = THIS_MODULE,
+	.open = vdec_open,
+	.release = vpu_v4l2_close,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = vdec_poll,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+int vdec_create_video_device(struct vpu_dev *vpu)
+{
+	struct video_device *vdec;
+	int ret;
+
+	if (!vpu)
+		return -EINVAL;
+
+	if (vpu->vdev_dec)
+		return 0;
+
+	vdec = video_device_alloc();
+	if (!vdec) {
+		vpu_err("alloc vpu decoder video device fail\n");
+		return -ENOMEM;
+	}
+	strscpy(vdec->name, "imx-vpu-decoder", sizeof(vdec->name));
+	vdec->release = video_device_release;
+	vdec->fops = &vdec_fops;
+	vdec->ioctl_ops = &vdec_ioctl_ops;
+	vdec->vfl_dir = VFL_DIR_M2M;
+	vdec->v4l2_dev = &vpu->v4l2_dev;
+	vdec->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+
+	ret = video_register_device(vdec, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		video_device_release(vdec);
+		return ret;
+	}
+	video_set_drvdata(vdec, vpu);
+	vpu->vdev_dec = vdec;
+
+	return 0;
+}
-- 
2.31.1


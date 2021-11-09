Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E897F44AA42
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 10:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244787AbhKIJNk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 04:13:40 -0500
Received: from mail-eopbgr140073.outbound.protection.outlook.com ([40.107.14.73]:29492
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244774AbhKIJNR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 04:13:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixcQhbLEQgG3CLCyyX57K5F2Od9GHIWT375FKdHXR6V2rPEE3+aVueqmfIYkBLvRemoe0qA488C6LYQNwu12veJ/xDIF/LLEGFSnQ5ZK+nQmAw+n3QbJBMx3yqRf0QuhriiFkRhUu/3r4jH3RhAOhgT0tbSthjDTaRp1X2cSaRTvRS0Mznl0DUW66ew3RpqDWxVvskRQY7zNAHk6rYFr+acsaJpA/ltjTP2a6N0QmjAWWqw+DuHGmlVgsAkqBE97Y0eNy/TBlboEgifI/nCplJCaGEDBPSj/gDeZh/rVkRZhFTgZH52y6zl9t2If+X6u/o8UvuRbVELqKxI4kCEFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q91CSxq/Ekh2WCmFXoWakB8hD0iokc9nNYun4yHvmXw=;
 b=LjVkCoOwojyLVMNuOs65KG9ibGGMbt/AS//IfHYbw77y9hejU/LKSuBKqhK7l1X/zFCNyN6LQ5J5PdqtXsCZhV0RaR0ZNJIBUJTXpmku/T+QIOnH3xcRKtZF0GNM7IE08rzilPNkEYTAxsms83P/HpWicgdgmsZYgPN17D3V8YVXI4JmST09puakmDpz2EP8oaUa1NKrnWxkdKKRnPbTCzR7kfdD6cY8S6O+nSCfh96HnIPisiXewcgS7pqHCcUVQUG7ZAGqVgQf30OeajdTcApXCGWKzxj42rnpnZTVNK7vyWjk9lCaRAOhqHcp+zpa/hB6A7zzv9W4JR2HKpeDOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q91CSxq/Ekh2WCmFXoWakB8hD0iokc9nNYun4yHvmXw=;
 b=gHpqzqc6PIcu1eXeX5hn498wPnajkRP06mKBR3pvF+5wM/qhX+i8yVLgEl+TV384Tri5BjZgAvjHV3znfo1yXR/+0cPdexvqPpWrr5OX6bfD8qXHww91M26FNYNwW2NwOdfrmtfTkMUzc7SlzW4ZRkqlkJyzsyKYVIEWFwuJiag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB8278.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 9 Nov
 2021 09:10:18 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:10:18 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 08/13] media: amphion: add v4l2 m2m vpu decoder stateful driver
Date:   Tue,  9 Nov 2021 17:09:07 +0800
Message-Id: <4097e13ddb0f69c4551b587afa8f022214329e4f.1636445575.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1636445575.git.ming.qian@nxp.com>
References: <cover.1636445575.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend Transport; Tue, 9 Nov 2021 09:10:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75411762-29a2-4f57-bb42-08d9a360bffc
X-MS-TrafficTypeDiagnostic: AS8PR04MB8278:
X-Microsoft-Antispam-PRVS: <AS8PR04MB8278A664580023E75028D2C8E7929@AS8PR04MB8278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:37;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UmXL1ELV+FBsNRxT3YOuHb7XKS39hWZnAU9O1GtmHxgXcdvcycVoSgykCwveXRqtXEFtz20ZeNmNzEPMRawDosbbiDbjf9fuVnxNUnGvtDOStNLcouwHrsUulvu1jnq3tFLELeM6eflFxgcmCk6JV9wOnb5p5jKETSgFu3gTlnQBnnLjw61hVMxsPgN7Djr6chKbd/VU96Zy55EXULWreLpKyBTe96KSDMdM76Wlb3/Pv/JwPm9uqK6onk8WxXWM1nXB5d7+vBYjnFsFwW3kOLRS5CC7+UgYX7xVXSutgC/CUpWRw3G62IT/rxBbCytf/fBCC6d4Anvs2kl58JmIW95Vxs8pX8mwqTLyrOK8tXBAGp0sgUrtvXgCg9uktlBXAsceJSV7WMbP55KCqFEzO4uKr2jus8ejmp4CYxfRbD8wtwOy9QllzYOYm7wlCldbIdLZ7aMhgetzM9MGj32tQgMy2Mh1z2GZ1cODnOG2TAJweUZODb+texObPFahdlhQ1Nv0Q5SwwcIqpynODT/i5sd8B6ICkF1DM6oi8rZSz6J93lKv6Set0M1zd0A95LZig2Gw4+ORwvwtJQ0cPRtD2fu3XXzp4AK7J3+xIJtHjYDAA6ajNFjKdIEeKOT8DMPQkksxLkVPRTzlu05shYiauOOlj/SyiFVfB68eGTbH7LrIyOGupoq2OLk+jW1+46s0ES9tEJ8xrfSoGv0ODyfyeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(86362001)(508600001)(6666004)(30864003)(38100700002)(6486002)(956004)(4326008)(44832011)(5660300002)(26005)(316002)(7696005)(52116002)(38350700002)(2906002)(186003)(8936002)(36756003)(66476007)(66556008)(8676002)(7416002)(83380400001)(66946007)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qBWIIkVzBHSRCuWGTssq1EnW1Jb3WD2ooudFG5ulc0dtCaU0Ks1qQ4ZVYIMI?=
 =?us-ascii?Q?Ka7yIs1Bp3fyKTblRumDsgZc+RRxtpx7yEFwktkdG7GOHXyFISHL60k01Qsy?=
 =?us-ascii?Q?3pK2KIj/GZH2dsYVSv7n1PU8tnSleuTFpKBOrMQeQ9H5ZeS9FrAPmbgnn69m?=
 =?us-ascii?Q?C2FIfPxeUOYdCV5mnCBSlnzcVEh5gG6RB1iq4n2kk5AbUTtgS4sOUf+zeVMF?=
 =?us-ascii?Q?z0BN7TwBd8v4rIAyMVr2pQejFVafCJqU05aNXFfbP9h2HSEqD8+m39H3Aql0?=
 =?us-ascii?Q?M6AS6XNh0v3pP4WR0NLenjCCz9fz2l8u+5FJQGGRS6LvaNl81JmWPMB3gn/Y?=
 =?us-ascii?Q?2EGBx4erZ3RMFJr/tGDjdFxKd0tcCxGJuNaCli2ZVZYZo5Ebb1iw5N7tVrcJ?=
 =?us-ascii?Q?o66ixjWG3Yfsl/iVMOzC5bOez+8+8U7Buy0Hm3GAWZc8woe3CQmpMCAaMNIJ?=
 =?us-ascii?Q?ZiJEoFJMH5GiijeBXZSu9IN3pKpjNvPQSabMZqNR6vDY0rt66iJg0pEVPx7J?=
 =?us-ascii?Q?qvIhAANya7aHmcEB//bjYzWktPcUPmn2TnCO2+Vj75Ycuf7ysfCYRb4wxGjJ?=
 =?us-ascii?Q?xinlrGOJZg/dRq0DueIrW8r8sO5IzVE/vzUWBJ7AZezQ1XeAn0aFBATijpld?=
 =?us-ascii?Q?sb/yLMpDPNFGrSCgAhrYBjjahATAcoJqliExjB80MpdGp6G0fcqTf90obGRB?=
 =?us-ascii?Q?Xggu9A9aNR1Rtjixl9EzB7PD/MzKRmuwbmqOXk+hrlaGKOaU2/I/Vh9c+MWC?=
 =?us-ascii?Q?FWyLj7IkvcbS0Glp45J59K27Fc2qo0ENz78f3WFEilqP2Q/25cGWKduwxCD8?=
 =?us-ascii?Q?1LGwLc9jWLCkXSpuqdLHdpFY2Yg1R+vO1kcqB6whIq9sF7pQRqSsGXxGlUz6?=
 =?us-ascii?Q?MPLhSfB4XdB2kb3tI/wik7SeeRFz5UvfWcBL4lbPAA0OLx7lglokYZrnVHbv?=
 =?us-ascii?Q?LwyQclISiF7yHC2BVpAR3h0MNlQwHavXccCkpRsW0RmKWEFdO0nAOMccAkt9?=
 =?us-ascii?Q?b7ejb0ZIO+1NJSC2ee4uavBpRnE6qcdDcbhv1/n0YzITbZaaNhW/4svNOD9a?=
 =?us-ascii?Q?RtFiWcHhOU5nE1c/DQ0PM9CwjojqmPAuLZYlEBGYgSBl/3xu3FOGfyBWSWus?=
 =?us-ascii?Q?bavYuC84V2eygFiTfUa8LRrSaGMqYQ06jv7q0khlKDYsDY5Er40HbVF4sWBu?=
 =?us-ascii?Q?XtDT75e8wvLURuUr3/XLdBsjYcBKXB6guiDv/N/U5oOkDNBFE6ftvWwkryBQ?=
 =?us-ascii?Q?qIgiIw34KtJifM6upBezr/f0iYrm8a/jtR6KuhImOeyqPyuLfTYxlW8kcEJK?=
 =?us-ascii?Q?/P4NtQV3hT/bn55FcUmFtV/0VehPuRzrQQ+XgFFL3zq33s1vjvdB7gf25lX1?=
 =?us-ascii?Q?6pO/k8sM1e9SIiEZPdjgnx3psoYgqGCkicpAMh3TXoahVxpO7qsMest2c1T1?=
 =?us-ascii?Q?iopNVOlzWzkvagFB5rlortuUXkv+VwuSlkMClND1QHxL0A6hth7qtNwTElo8?=
 =?us-ascii?Q?9mKxJ8tfw6SiONVwypPjRg4aSVus2V9rjzTAXj5gxViOpVIUcOWSxzxWvWk5?=
 =?us-ascii?Q?c6LJgxsYE5anQrmDWMArytSGgrBWIhhhL2tBXqwzLubl4CQ5BQacDIVcFvj+?=
 =?us-ascii?Q?sA9vFxZx86rJ9iktG/WLfYA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75411762-29a2-4f57-bb42-08d9a360bffc
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:10:18.6812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7I4NlansznT6KhET4+gbNmk8tDhNmjCf/c3me/8R1PtSzU9epK+J0hbprN7ZJuc9sp1S0EpUjnVADKmeZiHDug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8278
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This consists of video decoder implementation plus decoder controls.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 drivers/media/platform/amphion/vdec.c | 1680 +++++++++++++++++++++++++
 1 file changed, 1680 insertions(+)
 create mode 100644 drivers/media/platform/amphion/vdec.c

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
new file mode 100644
index 000000000000..a66d34d02a50
--- /dev/null
+++ b/drivers/media/platform/amphion/vdec.c
@@ -0,0 +1,1680 @@
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
+#include <linux/videodev2.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-vmalloc.h>
+#include "vpu.h"
+#include "vpu_defs.h"
+#include "vpu_core.h"
+#include "vpu_helpers.h"
+#include "vpu_v4l2.h"
+#include "vpu_cmds.h"
+#include "vpu_rpc.h"
+
+#define VDEC_FRAME_DEPTH		256
+#define VDEC_MIN_BUFFER_CAP		8
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
+	bool reset_codec;
+	bool fixed_fmt;
+	u32 decoded_frame_count;
+	u32 display_frame_count;
+	u32 sequence;
+	u32 eos_received;
+	bool is_source_changed;
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
+		.pixfmt = V4L2_PIX_FMT_NV12MT_8L128,
+		.num_planes = 2,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_NV12MT_10BE_8L128,
+		.num_planes = 2,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_H264_MVC,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_VC1_ANNEX_G,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_VC1_ANNEX_L,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_MPEG2,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_MPEG4,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_XVID,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_VP8,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_H263,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION
+	},
+	{0, 0, 0, 0},
+};
+
+static const struct v4l2_ctrl_ops vdec_ctrl_ops = {
+	.g_volatile_ctrl = vpu_helper_g_volatile_ctrl,
+};
+
+static int vdec_ctrl_init(struct vpu_inst *inst)
+{
+	struct v4l2_ctrl *ctrl;
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
+	ret = v4l2_ctrl_handler_setup(&inst->ctrl_handler);
+	if (ret) {
+		dev_err(inst->dev, "[%d] setup ctrls fail, ret = %d\n", inst->id, ret);
+		v4l2_ctrl_handler_free(&inst->ctrl_handler);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void vdec_set_last_buffer_dequeued(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	if (vdec->eos_received) {
+		if (!vpu_set_last_buffer_dequeued(inst))
+			vdec->eos_received--;
+	}
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
+	q = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
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
+	if (inst->state != pre_state)
+		vpu_trace(inst->dev, "[%d] %d -> %d\n", inst->id, pre_state, inst->state);
+
+	if (inst->state == VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE)
+		vdec_handle_resolution_change(inst);
+
+	return 0;
+}
+
+static int vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, "amphion-vpu", sizeof(cap->driver));
+	strscpy(cap->card, "amphion vpu decoder", sizeof(cap->card));
+	strscpy(cap->bus_info, "platform: amphion-vpu", sizeof(cap->bus_info));
+
+	return 0;
+}
+
+static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct vdec_t *vdec = inst->priv;
+	const struct vpu_format *fmt;
+	int ret = -EINVAL;
+
+	vpu_inst_lock(inst);
+	if (!V4L2_TYPE_IS_OUTPUT(f->type) && vdec->fixed_fmt) {
+		if (f->index == 0) {
+			f->pixelformat = inst->cap_format.pixfmt;
+			f->flags = inst->cap_format.flags;
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
+		ret = 0;
+	}
+
+exit:
+	vpu_inst_unlock(inst);
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
+	vpu_inst_lock(inst);
+	if (vdec->fixed_fmt) {
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
+	vpu_inst_unlock(inst);
+
+	return 0;
+}
+
+static int vdec_s_fmt_common(struct vpu_inst *inst, struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	const struct vpu_format *fmt;
+	struct vpu_format *cur_fmt;
+	struct vb2_queue *q;
+	struct vdec_t *vdec = inst->priv;
+	int i;
+
+	q = v4l2_m2m_get_vq(inst->fh.m2m_ctx, f->type);
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
+	if (V4L2_TYPE_IS_OUTPUT(f->type) && inst->state != VPU_CODEC_STATE_DEINIT) {
+		if (cur_fmt->pixfmt != fmt->pixfmt ||
+		    (pixmp->width && cur_fmt->width != pixmp->width) ||
+		    (pixmp->height && cur_fmt->height != pixmp->height)) {
+			vdec->reset_codec = true;
+			vdec->fixed_fmt = false;
+		}
+	}
+	cur_fmt->pixfmt = fmt->pixfmt;
+	if (V4L2_TYPE_IS_OUTPUT(f->type) || !vdec->fixed_fmt) {
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
+
+	if (!vdec->fixed_fmt) {
+		if (V4L2_TYPE_IS_OUTPUT(f->type)) {
+			vdec->params.codec_format = cur_fmt->pixfmt;
+			vdec->codec_info.color_primaries = f->fmt.pix_mp.colorspace;
+			vdec->codec_info.transfer_chars = f->fmt.pix_mp.xfer_func;
+			vdec->codec_info.matrix_coeffs = f->fmt.pix_mp.ycbcr_enc;
+			vdec->codec_info.full_range = f->fmt.pix_mp.quantization;
+		} else {
+			vdec->params.output_format = cur_fmt->pixfmt;
+			inst->crop.left = 0;
+			inst->crop.top = 0;
+			inst->crop.width = cur_fmt->width;
+			inst->crop.height = cur_fmt->height;
+		}
+	}
+
+	return 0;
+}
+
+static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	struct vdec_t *vdec = inst->priv;
+	int ret = 0;
+
+	vpu_inst_lock(inst);
+	ret = vdec_s_fmt_common(inst, f);
+	if (ret)
+		goto exit;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type) && !vdec->fixed_fmt) {
+		struct v4l2_format fc;
+
+		memset(&fc, 0, sizeof(fc));
+		fc.type = inst->cap_format.type;
+		fc.fmt.pix_mp.pixelformat = inst->cap_format.pixfmt;
+		fc.fmt.pix_mp.width = pixmp->width;
+		fc.fmt.pix_mp.height = pixmp->height;
+		vdec_s_fmt_common(inst, &fc);
+	}
+
+	f->fmt.pix_mp.colorspace = vdec->codec_info.color_primaries;
+	f->fmt.pix_mp.xfer_func = vdec->codec_info.transfer_chars;
+	f->fmt.pix_mp.ycbcr_enc = vdec->codec_info.matrix_coeffs;
+	f->fmt.pix_mp.quantization = vdec->codec_info.full_range;
+
+exit:
+	vpu_inst_unlock(inst);
+	return ret;
+}
+
+static int vdec_g_selection(struct file *file, void *fh,
+					struct v4l2_selection *s)
+{
+	struct vpu_inst *inst = to_inst(file);
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+			s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_COMPOSE:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+	case V4L2_SEL_TGT_COMPOSE_PADDED:
+		s->r = inst->crop;
+		break;
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->cap_format.width;
+		s->r.height = inst->cap_format.height;
+		break;
+	default:
+		return -EINVAL;
+	}
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
+	if (v4l2_m2m_num_src_bufs_ready(inst->fh.m2m_ctx))
+		return 0;
+
+	if (!vdec->params.frame_count) {
+		vpu_set_last_buffer_dequeued(inst);
+		return 0;
+	}
+
+	vpu_iface_add_scode(inst, SCODE_PADDING_EOS);
+	vdec->params.end_flag = 1;
+	vpu_iface_set_decode_params(inst, &vdec->params, 1);
+	vdec->drain = 0;
+	vpu_trace(inst->dev, "[%d] frame_count = %d\n", inst->id, vdec->params.frame_count);
+
+	return 0;
+}
+
+static int vdec_cmd_start(struct vpu_inst *inst)
+{
+	if (inst->state == VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE)
+		vdec_update_state(inst, VPU_CODEC_STATE_ACTIVE, 0);
+	vpu_process_capture_buffer(inst);
+	return 0;
+}
+
+static int vdec_cmd_stop(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	vpu_trace(inst->dev, "[%d]\n", inst->id);
+
+	if (inst->state == VPU_CODEC_STATE_DEINIT) {
+		vpu_set_last_buffer_dequeued(inst);
+	} else {
+		vdec->drain = 1;
+		vdec_drain(inst);
+	}
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
+	vpu_inst_lock(inst);
+	switch (cmd->cmd) {
+	case V4L2_DEC_CMD_START:
+		vdec_cmd_start(inst);
+		break;
+	case V4L2_DEC_CMD_STOP:
+		vdec_cmd_stop(inst);
+		break;
+	default:
+		break;
+	}
+	vpu_inst_unlock(inst);
+
+	return 0;
+}
+
+static int vdec_subscribe_event(struct v4l2_fh *fh,
+		const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_src_change_event_subscribe(fh, sub);
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	default:
+		return -EINVAL;
+	}
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
+	.vidioc_unsubscribe_event      = v4l2_event_unsubscribe,
+	.vidioc_reqbufs                = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_create_bufs	       = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf	       = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_querybuf               = v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf                   = v4l2_m2m_ioctl_qbuf,
+	.vidioc_expbuf                 = v4l2_m2m_ioctl_expbuf,
+	.vidioc_dqbuf                  = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_streamon               = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff              = v4l2_m2m_ioctl_streamoff,
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
+	if (vdec->req_frame_count)
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
+	vpu_inst_lock(inst);
+	vpu_buf = vdec->slots[info->id];
+	if (!vpu_buf) {
+		dev_err(inst->dev, "[%d] decoded invalid frame[%d]\n", inst->id, info->id);
+		ret = -EINVAL;
+		goto exit;
+	}
+	if (vpu_buf->state == VPU_BUF_STATE_DECODED)
+		dev_info(inst->dev, "[%d] buf[%d] has been decoded\n", inst->id, info->id);
+	vpu_buf->state = VPU_BUF_STATE_DECODED;
+	vdec->decoded_frame_count++;
+	if (vdec->ts_pre_count >= info->consumed_count)
+		vdec->ts_pre_count -= info->consumed_count;
+	else
+		vdec->ts_pre_count = 0;
+exit:
+	vpu_inst_unlock(inst);
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
+	u32 sequence;
+
+	if (!frame)
+		return;
+
+	vpu_inst_lock(inst);
+	sequence = vdec->sequence++;
+	vpu_buf = vdec_find_buffer(inst, frame->luma);
+	vpu_inst_unlock(inst);
+	if (!vpu_buf) {
+		dev_err(inst->dev, "[%d] can't find buffer, id = %d, addr = 0x%x\n",
+				inst->id, frame->id, frame->luma);
+		return;
+	}
+	if (frame->skipped) {
+		dev_dbg(inst->dev, "[%d] frame skip\n", inst->id);
+		return;
+	}
+
+	vbuf = &vpu_buf->m2m_buf.vb;
+	if (vbuf->vb2_buf.index != frame->id)
+		dev_err(inst->dev, "[%d] buffer id(%d, %d) dismatch\n",
+				inst->id, vbuf->vb2_buf.index, frame->id);
+
+	if (vpu_buf->state != VPU_BUF_STATE_DECODED)
+		dev_err(inst->dev, "[%d] buffer(%d) ready without decoded\n",
+				inst->id, frame->id);
+	vpu_buf->state = VPU_BUF_STATE_READY;
+	vb2_set_plane_payload(&vbuf->vb2_buf, 0, inst->cap_format.sizeimage[0]);
+	vb2_set_plane_payload(&vbuf->vb2_buf, 1, inst->cap_format.sizeimage[1]);
+	vbuf->vb2_buf.timestamp = frame->timestamp;
+	vbuf->field = inst->cap_format.field;
+	vbuf->sequence = sequence;
+	dev_dbg(inst->dev, "[%d][OUTPUT TS]%32lld\n", inst->id, frame->timestamp);
+
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+	vpu_inst_lock(inst);
+	vdec->timestamp = frame->timestamp;
+	vdec->display_frame_count++;
+	vpu_inst_unlock(inst);
+	dev_dbg(inst->dev, "[%d] decoded : %d, display : %d, sequence : %d\n",
+			inst->id,
+			vdec->decoded_frame_count,
+			vdec->display_frame_count,
+			vdec->sequence);
+}
+
+static void vdec_stop_done(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	vpu_inst_lock(inst);
+	vdec_update_state(inst, VPU_CODEC_STATE_DEINIT, 0);
+	vdec->seq_hdr_found = 0;
+	vdec->req_frame_count = 0;
+	vdec->reset_codec = false;
+	vdec->fixed_fmt = false;
+	vdec->params.end_flag = 0;
+	vdec->drain = 0;
+	vdec->ts_pre_count = 0;
+	vdec->timestamp = VPU_INVALID_TIMESTAMP;
+	vdec->ts_start = VPU_INVALID_TIMESTAMP;
+	vdec->ts_input = VPU_INVALID_TIMESTAMP;
+	vdec->params.frame_count = 0;
+	vdec->decoded_frame_count = 0;
+	vdec->display_frame_count = 0;
+	vdec->sequence = 0;
+	vdec->eos_received = 0;
+	vdec->is_source_changed = false;
+	vdec->source_change = 0;
+	vpu_inst_unlock(inst);
+}
+
+static bool vdec_check_source_change(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+	const struct vpu_format *fmt;
+	int i;
+
+	if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx)))
+		return true;
+	fmt = vpu_helper_find_format(inst, inst->cap_format.type, vdec->codec_info.pixfmt);
+	if (inst->cap_format.pixfmt != vdec->codec_info.pixfmt)
+		return true;
+	if (inst->cap_format.width != vdec->codec_info.decoded_width)
+		return true;
+	if (inst->cap_format.height != vdec->codec_info.decoded_height)
+		return true;
+	if (vpu_get_num_buffers(inst, inst->cap_format.type) < inst->min_buffer_cap)
+		return true;
+	if (inst->crop.left != vdec->codec_info.offset_x)
+		return true;
+	if (inst->crop.top != vdec->codec_info.offset_y)
+		return true;
+	if (inst->crop.width != vdec->codec_info.width)
+		return true;
+	if (inst->crop.height != vdec->codec_info.height)
+		return true;
+	if (fmt && inst->cap_format.num_planes != fmt->num_planes)
+		return true;
+	for (i = 0; i < inst->cap_format.num_planes; i++) {
+		if (inst->cap_format.bytesperline[i] != vdec->codec_info.bytesperline[i])
+			return true;
+		if (inst->cap_format.sizeimage[i] != vdec->codec_info.sizeimage[i])
+			return true;
+	}
+
+	return false;
+}
+
+static void vdec_init_fmt(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+	const struct vpu_format *fmt;
+	int i;
+
+	fmt = vpu_helper_find_format(inst, inst->cap_format.type, vdec->codec_info.pixfmt);
+	inst->out_format.width = vdec->codec_info.width;
+	inst->out_format.height = vdec->codec_info.height;
+	inst->cap_format.width = vdec->codec_info.decoded_width;
+	inst->cap_format.height = vdec->codec_info.decoded_height;
+	inst->cap_format.pixfmt = vdec->codec_info.pixfmt;
+	if (fmt) {
+		inst->cap_format.num_planes = fmt->num_planes;
+		inst->cap_format.flags = fmt->flags;
+	}
+	for (i = 0; i < inst->cap_format.num_planes; i++) {
+		inst->cap_format.bytesperline[i] = vdec->codec_info.bytesperline[i];
+		inst->cap_format.sizeimage[i] = vdec->codec_info.sizeimage[i];
+	}
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
+	if (fs->req_count > fs->max_count)
+		fs->req_count = fs->max_count;
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
+		dev_err(inst->dev, "[%d] repeat alloc fs %d\n",
+				inst->id, vbuf->vb2_buf.index);
+		return -EINVAL;
+	}
+
+	dev_dbg(inst->dev, "[%d] state = %d, alloc fs %d, tag = 0x%x\n",
+		inst->id, inst->state, vbuf->vb2_buf.index, vdec->seq_tag);
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
+	v4l2_m2m_buf_queue(inst->fh.m2m_ctx, vbuf);
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
+	vpu_inst_lock(inst);
+	memcpy(&vdec->codec_info, hdr, sizeof(vdec->codec_info));
+
+	vpu_trace(inst->dev, "[%d] %d x %d, crop : (%d, %d) %d x %d, %d, %d\n",
+			inst->id,
+			vdec->codec_info.decoded_width,
+			vdec->codec_info.decoded_height,
+			vdec->codec_info.offset_x,
+			vdec->codec_info.offset_y,
+			vdec->codec_info.width,
+			vdec->codec_info.height,
+			hdr->num_ref_frms,
+			hdr->num_dpb_frms);
+	inst->min_buffer_cap = hdr->num_ref_frms + hdr->num_dpb_frms;
+	vdec->is_source_changed = vdec_check_source_change(inst);
+	vdec_init_fmt(inst);
+	vdec_init_crop(inst);
+	vdec_init_mbi(inst);
+	vdec_init_dcp(inst);
+	if (!vdec->seq_hdr_found) {
+		vdec->seq_tag = vdec->codec_info.tag;
+		if (vdec->is_source_changed) {
+			vdec_update_state(inst, VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE, 0);
+			vpu_notify_source_change(inst);
+			vdec->is_source_changed = false;
+		}
+	}
+	if (vdec->seq_tag != vdec->codec_info.tag) {
+		vdec_response_fs_request(inst, true);
+		vpu_trace(inst->dev, "[%d] seq tag change: %d -> %d\n",
+				inst->id, vdec->seq_tag, vdec->codec_info.tag);
+	}
+	vdec->seq_hdr_found++;
+	vdec->fixed_fmt = true;
+	vpu_inst_unlock(inst);
+}
+
+static void vdec_event_resolution_change(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	vpu_trace(inst->dev, "[%d]\n", inst->id);
+	vpu_inst_lock(inst);
+	vdec->seq_tag = vdec->codec_info.tag;
+	vdec_clear_fs(&vdec->mbi);
+	vdec_clear_fs(&vdec->dcp);
+	vdec_clear_slots(inst);
+	vdec_init_mbi(inst);
+	vdec_init_dcp(inst);
+	if (vdec->is_source_changed) {
+		vdec_update_state(inst, VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE, 0);
+		vdec->source_change++;
+		vdec_handle_resolution_change(inst);
+		vdec->is_source_changed = false;
+	}
+	vpu_inst_unlock(inst);
+}
+
+static void vdec_event_req_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	if (!fs)
+		return;
+
+	vpu_inst_lock(inst);
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
+	vpu_inst_unlock(inst);
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
+		dev_err(inst->dev, "[%d] invalid fs(%d) to release\n", inst->id, fs->id);
+		return;
+	}
+
+	vpu_inst_lock(inst);
+	vpu_buf = vdec->slots[fs->id];
+	vdec->slots[fs->id] = NULL;
+
+	if (!vpu_buf) {
+		dev_dbg(inst->dev, "[%d] fs[%d] has bee released\n", inst->id, fs->id);
+		goto exit;
+	}
+
+	if (vpu_buf->state == VPU_BUF_STATE_DECODED) {
+		dev_dbg(inst->dev, "[%d] frame skip\n", inst->id);
+		vdec->sequence++;
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
+	vpu_inst_unlock(inst);
+}
+
+static void vdec_event_eos(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	vpu_trace(inst->dev, "[%d] input : %d, decoded : %d, display : %d, sequence : %d\n",
+			inst->id,
+			vdec->params.frame_count,
+			vdec->decoded_frame_count,
+			vdec->display_frame_count,
+			vdec->sequence);
+	vpu_inst_lock(inst);
+	vdec->eos_received++;
+	vdec->fixed_fmt = false;
+	inst->min_buffer_cap = VDEC_MIN_BUFFER_CAP;
+	vdec_update_state(inst, VPU_CODEC_STATE_DRAIN, 0);
+	vdec_set_last_buffer_dequeued(inst);
+	vpu_inst_unlock(inst);
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
+	dev_dbg(inst->dev, "[%d] dec output [%d] %d : %ld\n",
+		inst->id, vbuf->sequence, vb->index, vb2_get_plane_payload(vb, 0));
+
+	if (inst->state == VPU_CODEC_STATE_DEINIT)
+		return -EINVAL;
+	if (vdec->reset_codec)
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
+	dev_dbg(inst->dev, "[%d][INPUT  TS]%32lld\n", inst->id, vb->timestamp);
+	vdec->ts_pre_count++;
+	vdec->params.frame_count++;
+
+	v4l2_m2m_src_buf_remove_by_buf(inst->fh.m2m_ctx, vbuf);
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
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	int ret;
+
+	if (inst->state == VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE)
+		return -EINVAL;
+	if (vdec->reset_codec)
+		return -EINVAL;
+
+	ret = vdec_response_frame(inst, vbuf);
+	if (ret)
+		return ret;
+	v4l2_m2m_dst_buf_remove_by_buf(inst->fh.m2m_ctx, vbuf);
+	return 0;
+}
+
+static void vdec_on_queue_empty(struct vpu_inst *inst, u32 type)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	if (V4L2_TYPE_IS_OUTPUT(type))
+		return;
+
+	vdec_handle_resolution_change(inst);
+	if (vdec->eos_received)
+		vdec_set_last_buffer_dequeued(inst);
+}
+
+static void vdec_abort(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vpu_rpc_buffer_desc desc;
+	int ret;
+
+	vpu_trace(inst->dev, "[%d] state = %d\n", inst->id, inst->state);
+	vpu_iface_add_scode(inst, SCODE_PADDING_ABORT);
+	vdec->params.end_flag = 1;
+	vpu_iface_set_decode_params(inst, &vdec->params, 1);
+
+	vpu_session_abort(inst);
+
+	ret = vpu_iface_get_stream_buffer_desc(inst, &desc);
+	if (!ret)
+		vpu_iface_update_stream_buffer(inst, desc.rptr, 1);
+
+	vpu_session_rst_buf(inst);
+	vpu_trace(inst->dev, "[%d] input : %d, decoded : %d, display : %d, sequence : %d\n",
+			inst->id,
+			vdec->params.frame_count,
+			vdec->decoded_frame_count,
+			vdec->display_frame_count,
+			vdec->sequence);
+	vdec->params.end_flag = 0;
+	vdec->drain = 0;
+	vdec->ts_pre_count = 0;
+	vdec->timestamp = VPU_INVALID_TIMESTAMP;
+	vdec->ts_start = VPU_INVALID_TIMESTAMP;
+	vdec->ts_input = VPU_INVALID_TIMESTAMP;
+	vdec->params.frame_count = 0;
+	vdec->decoded_frame_count = 0;
+	vdec->display_frame_count = 0;
+	vdec->sequence = 0;
+}
+
+static void vdec_stop(struct vpu_inst *inst, bool free)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	vdec_clear_slots(inst);
+	if (inst->state != VPU_CODEC_STATE_DEINIT)
+		vpu_session_stop(inst);
+	vdec_clear_fs(&vdec->mbi);
+	vdec_clear_fs(&vdec->dcp);
+	if (free) {
+		vpu_free_dma(&vdec->udata);
+		vpu_free_dma(&inst->stream_buffer);
+	}
+	vdec_update_state(inst, VPU_CODEC_STATE_DEINIT, 1);
+	vdec->reset_codec = false;
+}
+
+static void vdec_release(struct vpu_inst *inst)
+{
+	if (inst->id != VPU_INST_NULL_ID)
+		vpu_trace(inst->dev, "[%d]\n", inst->id);
+	vpu_inst_lock(inst);
+	vdec_stop(inst, true);
+	vpu_inst_unlock(inst);
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
+	vpu_trace(inst->dev, "[%d]\n", inst->id);
+	if (!vdec->udata.virt) {
+		vdec->udata.length = 0x1000;
+		ret = vpu_alloc_dma(inst->core, &vdec->udata);
+		if (ret) {
+			dev_err(inst->dev, "[%d] alloc udata fail\n", inst->id);
+			goto error;
+		}
+	}
+
+	if (!inst->stream_buffer.virt) {
+		stream_buffer_size = vpu_iface_get_stream_buffer_size(inst->core);
+		if (stream_buffer_size > 0) {
+			inst->stream_buffer.length = stream_buffer_size;
+			ret = vpu_alloc_dma(inst->core, &inst->stream_buffer);
+			if (ret) {
+				dev_err(inst->dev, "[%d] alloc stream buffer fail\n", inst->id);
+				goto error;
+			}
+			inst->use_stream_buffer = true;
+		}
+	}
+
+	if (inst->use_stream_buffer)
+		vpu_iface_config_stream_buffer(inst, &inst->stream_buffer);
+	vpu_iface_init_instance(inst);
+	vdec->params.udata.base = vdec->udata.phys;
+	vdec->params.udata.size = vdec->udata.length;
+	ret = vpu_iface_set_decode_params(inst, &vdec->params, 0);
+	if (ret) {
+		dev_err(inst->dev, "[%d] set decode params fail\n", inst->id);
+		goto error;
+	}
+
+	vdec_init_params(vdec);
+	ret = vpu_session_start(inst);
+	if (ret) {
+		dev_err(inst->dev, "[%d] start fail\n", inst->id);
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
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		if (vdec->reset_codec)
+			vdec_stop(inst, false);
+		if (inst->state == VPU_CODEC_STATE_DEINIT) {
+			ret = vdec_start(inst);
+			if (ret)
+				return ret;
+		}
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		if (inst->state == VPU_CODEC_STATE_SEEK)
+			vdec_update_state(inst, vdec->state, 1);
+		vdec->eos_received = 0;
+		vpu_process_output_buffer(inst);
+	} else {
+		vdec_cmd_start(inst);
+	}
+	if (inst->state == VPU_CODEC_STATE_ACTIVE)
+		vdec_response_fs_request(inst, false);
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
+		vdec_update_state(inst, VPU_CODEC_STATE_SEEK, 0);
+		vdec->drain = 0;
+	} else {
+		if (inst->state != VPU_CODEC_STATE_DYAMIC_RESOLUTION_CHANGE)
+			vdec_abort(inst);
+
+		vdec->eos_received = 0;
+		vdec_clear_slots(inst);
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
+		num = scnprintf(str, size, "sequence = %d\n", vdec->sequence);
+		break;
+	case 7:
+		num = scnprintf(str, size, "drain = %d, eos = %d, source_change = %d\n",
+				vdec->drain, vdec->eos_received, vdec->source_change);
+		break;
+	case 8:
+		num = scnprintf(str, size, "ts_pre_count = %d, frame_depth = %d\n",
+				vdec->ts_pre_count, vdec->frame_depth);
+		break;
+	case 9:
+		num = scnprintf(str, size, "fps = %d/%d\n",
+				vdec->codec_info.frame_rate.numerator,
+				vdec->codec_info.frame_rate.denominator);
+		break;
+	case 10:
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
+	.on_queue_empty = vdec_on_queue_empty,
+	.get_debug_info = vdec_get_debug_info,
+	.wait_prepare = vpu_inst_unlock,
+	.wait_finish = vpu_inst_lock,
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
+	f.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12MT_8L128;
+	f.fmt.pix_mp.width = 1280;
+	f.fmt.pix_mp.height = 720;
+	f.fmt.pix_mp.field = V4L2_FIELD_NONE;
+	vdec_s_fmt(file, &inst->fh, &f);
+}
+
+static int vdec_open(struct file *file)
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
+	if (ret)
+		return ret;
+
+	vdec->fixed_fmt = false;
+	inst->min_buffer_cap = VDEC_MIN_BUFFER_CAP;
+	vdec_init(file);
+
+	return 0;
+}
+
+static __poll_t vdec_poll(struct file *file, poll_table *wait)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct vb2_queue *src_q, *dst_q;
+	__poll_t ret;
+
+	ret = v4l2_m2m_fop_poll(file, wait);
+	src_q = v4l2_m2m_get_src_vq(inst->fh.m2m_ctx);
+	dst_q = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
+	if (vb2_is_streaming(src_q) && !vb2_is_streaming(dst_q))
+		ret &= (~EPOLLERR);
+	if (!src_q->error && !dst_q->error &&
+	    (vb2_is_streaming(src_q) && list_empty(&src_q->queued_list)) &&
+	    (vb2_is_streaming(dst_q) && list_empty(&dst_q->queued_list)))
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
+const struct v4l2_ioctl_ops *vdec_get_ioctl_ops(void)
+{
+	return &vdec_ioctl_ops;
+}
+
+const struct v4l2_file_operations *vdec_get_fops(void)
+{
+	return &vdec_fops;
+}
-- 
2.33.0


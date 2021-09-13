Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9BC4087DB
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 11:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238575AbhIMJNn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 05:13:43 -0400
Received: from mail-eopbgr140043.outbound.protection.outlook.com ([40.107.14.43]:39618
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238568AbhIMJNd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 05:13:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fG2LgMAdp+Cf6GOa/B8lSufMhgtBa/21qwc/Rw67GOm6TuPcGzWLNXVP430j+q3y43jH2rpEcRtfdjcv3wyqyqC6m8l6xDXKqBqXKXtZef+5B4PC8/ftf4M7jM/NKxw284DDgmGe//uBHJ/YrLBa2a/4xM6WR/rtNjIFEsQChxNoMJm8pJjFE6KkSigq1MQFujHotSN1adTtAWpb7BnGC/F62IJfcq33pWzwEKMgmBFZVaJW9d4DWgkzE6N6iV0OIweS5p6AC4I6UUdMUypyzhHKJj5P7oapqHaLX6LuaTjCmgz5z4PMqXyfQcmsoCyxgTt2xHZyRU7NIH9bKwv45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QE4j+s5uhyWn4NTZ0X94v0SrhJjzD3SgaMHNjVRhrBo=;
 b=jMRm52y1ZwePot07M9ARdXlyzJcw5V5gAfRYUzyZT2VjQFNU/sAGXWw4IW0N5PFenSILbOnaFXAFRt7e0ELJL5M3Jp9NT+Es29RMhDOCd08laz0/Mpd+EWvY1FL4aSoUbYZ4Ya4qsAvf1UXm7eHTBO8pCw5ajon5cmoIiACaajarHddvoMVBnoMl/dK58q5H9uKX3RkT1/KkTuZ5NzsvkjFWP0POJh8rVmMbB4iklYDWKgXl8X4Z0qCKDpPm06w5g783eNpOsfhkqhQ7uCCXuRqVYmcaFSW/j0u/ADY4p0zAR9Ji1wlHajV/0IEicT7qTuWF/1TX+4gzeid+OdsSww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE4j+s5uhyWn4NTZ0X94v0SrhJjzD3SgaMHNjVRhrBo=;
 b=ccCK3If7i64PyH8zDx91VBYQLwbTED4Teszlavm5x5XMECJeOvOHtkMI97EkRCTo4vodsLOUKfrdPCd5vcmlEeQYKg5K3Sj1O1wA+VXqCgjOgrFDWzPxnhbBqP7h5Do8V+R7rtoaKtr7wHRrn969BImi5O5ZQyhpVuIGrmZ3aYQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3925.eurprd04.prod.outlook.com (2603:10a6:209:1c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 09:12:09 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 09:12:08 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 06/13] media: amphion: add vpu v4l2 m2m support
Date:   Mon, 13 Sep 2021 17:11:08 +0800
Message-Id: <4142cb1f597a3fbb176cf18c6a3d6356cc0d4064.1631521295.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1631521295.git.ming.qian@nxp.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0101.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::27) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR01CA0101.apcprd01.prod.exchangelabs.com (2603:1096:3:15::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16 via Frontend Transport; Mon, 13 Sep 2021 09:12:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51084dd3-a1d9-47c4-a631-08d976969030
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3925:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB39251C58D9E9340DDC5FE141E7D99@AM6PR0402MB3925.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S3DjVMjjoz7XVJGIhJ7LmTDRHdGlmOS2FSxAdZ/KYrIewS3NdmY5hoO3J1hQjNOTh/dHWTHvtw+YSiCiCm6jikMCTB9keKrOo/0uIqHtxchg/rkVSdnODMsOHr8r0c7UfbL9AZ8SB539DoylcbE63B3v2tJ1A6dr5TCwlRnVBHZgVCT5xHR3YR8kV0tgvG94lTvQ9AjYCJcwzfT/eNERu+7hVCFf1gbFOTfgw1W8Xz8Km9u/KjMqJ/dQCpTeBlciWa82f3sGHIb6vrq5fOV9SZrIyPzk3J9WUV/JLE9vWBPnr8+b76WLW80dYyD5Fc6vQwwjHAbatzt17hVi9BlY4Qh7uk9iPqzmMFcIgzsJS27O344/hpkGoCm+XfFReo4HsqasUeqZ7pkYum2BP/3cnZjz4lVguJSqKZtoGK/9yO+GUSvM44z2KHFIdRW6HxBBvpIJ39JbJXsCG4w2w5IXokd2GeBwBcl91dhh1hwzm1OYrY9Twic4JGt2p23WjKyOWWmrRAqzlxXSSK53t3zHweILL+V7IOdzA9NjsFybVdG22StzBZ7Y/dZq/xTJbIjJKrRgGV/kJhlT4ZrbPRacp6brgfDyozyNGG2tkbwGaDupbk93/8Oho7yfsU337mz+wuZcSrvkBY0WqiDCE98eo0se5hdYrciy12kMphvfFgatTbc+nwymOEZWo1ZiKMeSOirPq+umm+2vW+LqbWvI8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(7416002)(30864003)(66946007)(66476007)(38350700002)(38100700002)(26005)(8676002)(6486002)(52116002)(7696005)(5660300002)(8936002)(83380400001)(186003)(66556008)(478600001)(956004)(316002)(2616005)(36756003)(44832011)(4326008)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/rEHAVUQ7oUB//j/CwWF16S5jdfyBlkwMlFom0CEAIz3aqKWgzypBFxnRwhC?=
 =?us-ascii?Q?yevYF/A0zmaF/pBceF0l/rxOkexeoTs91eZtk5cWa0YJFGjQj0bSBBV4YkHu?=
 =?us-ascii?Q?D1sLUALAAqlOa7Vch7UHh6qb0adFvWoR1CbJBqJh14eFNuTNmnFGddIf1K/u?=
 =?us-ascii?Q?4xR7GcyqNmdBgrevWmtSjpv2qOuHVlgCT+bGeXK9LTTsAdgDHnZKHkkW3ahY?=
 =?us-ascii?Q?89Pu2ECA0eRK3m3j119VKQCvzT+CJqmonArwiQK9Bihql8OIe8VTMgbrl37e?=
 =?us-ascii?Q?pTkC7ym/f66373B9e8Z9nE8mjXnkwGwWpCszWeG61Qq5uUMYbwf+sOdxlMqD?=
 =?us-ascii?Q?VZQQGl1af8Lt3pFbS/cunwlo1GMeBUCHXylLH9MpXnBktl0on6JweLK/fCqn?=
 =?us-ascii?Q?NSiJCgNR/jhAtoawjXFXeevIIVM74a1/VlYb+UPfctrz3peQQbYu9mIptX7/?=
 =?us-ascii?Q?ccrsLpL9L67z0UB/Npv03S0OaaNTF88MSWYRLe1kZFQG8PnVl8bdLQGuaoh6?=
 =?us-ascii?Q?Vm5XmhbLBAu6kcFzgz9U301GcVAXARusVGo6FxtTO46OpLX1czQocGgQ1G2r?=
 =?us-ascii?Q?5IPvYcraqPmk3GtplhRhrUPt5CL+RXv+KDuSCqtZ9VijaghQDwCuxyncKrxX?=
 =?us-ascii?Q?BuNKwskgLS0tEhjKXdNDchSKjE3GZL70vjWb8JODWFljRjJfWq0Xj6J8HDco?=
 =?us-ascii?Q?p65mjGsqbZvaxHtUFU/CQ7eSXoHqCty5GBtkfzbAL1uhx0O81tgvb7NJqKUc?=
 =?us-ascii?Q?V1B9Hkb4iVwsC7CfXjPagxYQ8uRlWJ8XilRTXlGfH9QkuyNRi/C5/qoq+T4s?=
 =?us-ascii?Q?M16sQMQhg435+iYf7/Zyk+AG1sfEoPaOU0LOnZHG/TEfxbJ8YnRRMJUXZdcc?=
 =?us-ascii?Q?wWNlu2xxdqKeEZONEL0yShW1rUOMnKdveoNF66qB1PQLIIkVSe6CQtbbyWPc?=
 =?us-ascii?Q?aTJaILJRtsm6NH1VZZW+x2SVy/0RiDUBZeoclvwQCbG2/g2RKpSo+aFlD1/e?=
 =?us-ascii?Q?UP83xHtnPqZ9q0ze1dGKx6VVD6ej0YqRx24TT2NAruwqHPGPIoWVb/XdV09O?=
 =?us-ascii?Q?6zaP8KLNJpMHpys5MLcq1oHIg4ymLibCmH+V8jwZuc1nnEMpEgtdg9weWxBA?=
 =?us-ascii?Q?wsWCaV3hiHqp02DcOVsEZ/iLWAuB4AD2dUXmZ/e55U6D/gNY7hyuu/ALPIrW?=
 =?us-ascii?Q?JgkqvLMdfNnD1dOs9m3RUvjls19iiUqSOi0iyVOgHKQhtYLDGXTJI52VWhvf?=
 =?us-ascii?Q?OnItUozjKv00vJZu34XK4mj0StYIfXdFVSFYKhFj84cg8wE2YNahSykxohZN?=
 =?us-ascii?Q?4+Sg2PTKF8Sm+voU0kmvTzy5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51084dd3-a1d9-47c4-a631-08d976969030
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 09:12:08.8703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QXhM1I1r9Ohn0mx+P5ggfetp3LDwS3lxwxeeVFt/1OHBR0KNzJyyVZAn4lj50yWc+mVdWkjStWkS+B7l6sZfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3925
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vpu_v4l2.c implements the v4l2 m2m driver methods.
vpu_helpers.c implements the common helper functions
vpu_color.c converts the v4l2 colorspace with iso

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/media/platform/amphion/vpu_color.c   | 192 ++++++
 drivers/media/platform/amphion/vpu_helpers.c | 453 ++++++++++++++
 drivers/media/platform/amphion/vpu_helpers.h |  72 +++
 drivers/media/platform/amphion/vpu_v4l2.c    | 625 +++++++++++++++++++
 drivers/media/platform/amphion/vpu_v4l2.h    |  53 ++
 5 files changed, 1395 insertions(+)
 create mode 100644 drivers/media/platform/amphion/vpu_color.c
 create mode 100644 drivers/media/platform/amphion/vpu_helpers.c
 create mode 100644 drivers/media/platform/amphion/vpu_helpers.h
 create mode 100644 drivers/media/platform/amphion/vpu_v4l2.c
 create mode 100644 drivers/media/platform/amphion/vpu_v4l2.h

diff --git a/drivers/media/platform/amphion/vpu_color.c b/drivers/media/platform/amphion/vpu_color.c
new file mode 100644
index 000000000000..29d1d5edc901
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_color.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#define TAG		"COLOR"
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
+#include <media/v4l2-device.h>
+#include "vpu.h"
+#include "vpu_helpers.h"
+
+static const u8 colorprimaries[] = {
+	0,
+	V4L2_COLORSPACE_REC709,        /*Rec. ITU-R BT.709-6*/
+	0,
+	0,
+	V4L2_COLORSPACE_470_SYSTEM_M, /*Rec. ITU-R BT.470-6 System M*/
+	V4L2_COLORSPACE_470_SYSTEM_BG,/*Rec. ITU-R BT.470-6 System B, G*/
+	V4L2_COLORSPACE_SMPTE170M,    /*SMPTE170M*/
+	V4L2_COLORSPACE_SMPTE240M,    /*SMPTE240M*/
+	0,                            /*Generic film*/
+	V4L2_COLORSPACE_BT2020,       /*Rec. ITU-R BT.2020-2*/
+	0,                            /*SMPTE ST 428-1*/
+};
+
+static const u8 colortransfers[] = {
+	0,
+	V4L2_XFER_FUNC_709,      /*Rec. ITU-R BT.709-6*/
+	0,
+	0,
+	0,                       /*Rec. ITU-R BT.470-6 System M*/
+	0,                       /*Rec. ITU-R BT.470-6 System B, G*/
+	V4L2_XFER_FUNC_709,      /*SMPTE170M*/
+	V4L2_XFER_FUNC_SMPTE240M,/*SMPTE240M*/
+	V4L2_XFER_FUNC_NONE,     /*Linear transfer characteristics*/
+	0,
+	0,
+	0,                       /*IEC 61966-2-4*/
+	0,                       /*Rec. ITU-R BT.1361-0 extended colour gamut*/
+	V4L2_XFER_FUNC_SRGB,     /*IEC 61966-2-1 sRGB or sYCC*/
+	V4L2_XFER_FUNC_709,      /*Rec. ITU-R BT.2020-2 (10 bit system)*/
+	V4L2_XFER_FUNC_709,      /*Rec. ITU-R BT.2020-2 (12 bit system)*/
+	V4L2_XFER_FUNC_SMPTE2084,/*SMPTE ST 2084*/
+	0,                       /*SMPTE ST 428-1*/
+	0                        /*Rec. ITU-R BT.2100-0 hybrid log-gamma (HLG)*/
+};
+
+static const u8 colormatrixcoefs[] = {
+	0,
+	V4L2_YCBCR_ENC_709,             /*Rec. ITU-R BT.709-6*/
+	0,
+	0,
+	0,                              /*Title 47 Code of Federal Regulations*/
+	V4L2_YCBCR_ENC_601,             /*Rec. ITU-R BT.601-7 625*/
+	V4L2_YCBCR_ENC_601,             /*Rec. ITU-R BT.601-7 525*/
+	V4L2_YCBCR_ENC_SMPTE240M,       /*SMPTE240M*/
+	0,
+	V4L2_YCBCR_ENC_BT2020,          /*Rec. ITU-R BT.2020-2*/
+	V4L2_YCBCR_ENC_BT2020_CONST_LUM /*Rec. ITU-R BT.2020-2 constant*/
+};
+
+u32 vpu_color_cvrt_primaries_v2i(u32 primaries)
+{
+	return VPU_ARRAY_FIND(colorprimaries, primaries);
+}
+
+u32 vpu_color_cvrt_primaries_i2v(u32 primaries)
+{
+	return VPU_ARRAY_AT(colorprimaries, primaries);
+}
+
+u32 vpu_color_cvrt_transfers_v2i(u32 transfers)
+{
+	return VPU_ARRAY_FIND(colortransfers, transfers);
+}
+
+u32 vpu_color_cvrt_transfers_i2v(u32 transfers)
+{
+	return VPU_ARRAY_AT(colortransfers, transfers);
+}
+
+u32 vpu_color_cvrt_matrix_v2i(u32 matrix)
+{
+	return VPU_ARRAY_FIND(colormatrixcoefs, matrix);
+}
+
+u32 vpu_color_cvrt_matrix_i2v(u32 matrix)
+{
+	return VPU_ARRAY_AT(colormatrixcoefs, matrix);
+}
+
+u32 vpu_color_cvrt_full_range_v2i(u32 full_range)
+{
+	return (full_range == V4L2_QUANTIZATION_FULL_RANGE);
+}
+
+u32 vpu_color_cvrt_full_range_i2v(u32 full_range)
+{
+	if (full_range)
+		return V4L2_QUANTIZATION_FULL_RANGE;
+
+	return V4L2_QUANTIZATION_LIM_RANGE;
+}
+
+int vpu_color_check_primaries(u32 primaries)
+{
+	return vpu_color_cvrt_primaries_v2i(primaries) ? 0 : -EINVAL;
+}
+
+int vpu_color_check_transfers(u32 transfers)
+{
+	return vpu_color_cvrt_transfers_v2i(transfers) ? 0 : -EINVAL;
+}
+
+int vpu_color_check_matrix(u32 matrix)
+{
+	return vpu_color_cvrt_matrix_v2i(matrix) ? 0 : -EINVAL;
+}
+
+int vpu_color_check_full_range(u32 full_range)
+{
+	int ret = -EINVAL;
+
+	switch (full_range) {
+	case V4L2_QUANTIZATION_FULL_RANGE:
+	case V4L2_QUANTIZATION_LIM_RANGE:
+		ret = 0;
+		break;
+	default:
+		break;
+
+	}
+
+	return ret;
+}
+
+int vpu_color_get_default(u32 primaries,
+		u32 *ptransfers, u32 *pmatrix, u32 *pfull_range)
+{
+	u32 transfers;
+	u32 matrix;
+	u32 full_range;
+
+	switch (primaries) {
+	case V4L2_COLORSPACE_REC709:
+		transfers = V4L2_XFER_FUNC_709;
+		matrix = V4L2_YCBCR_ENC_709;
+		full_range = V4L2_QUANTIZATION_LIM_RANGE;
+		break;
+	case V4L2_COLORSPACE_470_SYSTEM_M:
+	case V4L2_COLORSPACE_470_SYSTEM_BG:
+	case V4L2_COLORSPACE_SMPTE170M:
+		transfers = V4L2_XFER_FUNC_709;
+		matrix = V4L2_YCBCR_ENC_601;
+		full_range = V4L2_QUANTIZATION_LIM_RANGE;
+		break;
+	case V4L2_COLORSPACE_SMPTE240M:
+		transfers = V4L2_XFER_FUNC_SMPTE240M;
+		matrix = V4L2_YCBCR_ENC_SMPTE240M;
+		full_range = V4L2_QUANTIZATION_LIM_RANGE;
+		break;
+	case V4L2_COLORSPACE_BT2020:
+		transfers = V4L2_XFER_FUNC_709;
+		matrix = V4L2_YCBCR_ENC_BT2020;
+		full_range = V4L2_QUANTIZATION_LIM_RANGE;
+		break;
+	default:
+		transfers = V4L2_XFER_FUNC_709;
+		matrix = V4L2_YCBCR_ENC_709;
+		full_range = V4L2_QUANTIZATION_LIM_RANGE;
+		break;
+	}
+
+	if (ptransfers)
+		*ptransfers = transfers;
+	if (pmatrix)
+		*pmatrix = matrix;
+	if (pfull_range)
+		*pfull_range = full_range;
+
+
+	return 0;
+}
diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drivers/media/platform/amphion/vpu_helpers.c
new file mode 100644
index 000000000000..484575d2975e
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_helpers.c
@@ -0,0 +1,453 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#define TAG		"HELPER"
+#include <linux/init.h>
+#include <linux/interconnect.h>
+#include <linux/ioctl.h>
+#include <linux/list.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include "vpu.h"
+#include "vpu_core.h"
+#include "vpu_rpc.h"
+#include "vpu_helpers.h"
+#include "vpu_log.h"
+
+int vpu_helper_find_in_array_u8(const u8 *array, u32 size, u32 x)
+{
+	int i;
+
+	for (i = 0; i < size; i++) {
+		if (array[i] == x)
+			return i;
+	}
+
+	return 0;
+}
+
+bool vpu_helper_check_type(struct vpu_inst *inst, u32 type)
+{
+	const struct vpu_format *pfmt;
+
+	for (pfmt = inst->formats; pfmt->pixfmt; pfmt++) {
+		if (vpu_core_check_fmt(inst->core, pfmt->pixfmt))
+			continue;
+		if (pfmt->type == type)
+			return true;
+	}
+
+	return false;
+}
+
+const struct vpu_format *vpu_helper_find_format(struct vpu_inst *inst, u32 type, u32 pixelfmt)
+{
+	const struct vpu_format *pfmt;
+
+	if (!inst || !inst->formats)
+		return NULL;
+
+	if (vpu_core_check_fmt(inst->core, pixelfmt))
+		return NULL;
+
+	for (pfmt = inst->formats; pfmt->pixfmt; pfmt++) {
+		if (vpu_core_check_fmt(inst->core, pfmt->pixfmt))
+			continue;
+
+		if (pfmt->pixfmt == pixelfmt && (!type || type == pfmt->type))
+			return pfmt;
+	}
+
+	return NULL;
+}
+
+const struct vpu_format *vpu_helper_enum_format(struct vpu_inst *inst, u32 type, int index)
+{
+	const struct vpu_format *pfmt;
+	int i = 0;
+
+	if (!inst || !inst->formats)
+		return NULL;
+
+	for (pfmt = inst->formats; pfmt->pixfmt; pfmt++) {
+		if (vpu_core_check_fmt(inst->core, pfmt->pixfmt))
+			continue;
+
+		if (pfmt->type == type) {
+			if (index == i)
+				return pfmt;
+			i++;
+		}
+	}
+
+	return NULL;
+}
+
+u32 vpu_helper_valid_frame_width(struct vpu_inst *inst, u32 width)
+{
+	const struct vpu_core_resources *res;
+
+	if (!inst || !inst->core || !inst->core->res)
+		return width;
+
+	res = inst->core->res;
+	if (res->max_width)
+		width = clamp(width, res->min_width, res->max_width);
+	if (res->step_width)
+		width = ALIGN(width, res->step_width);
+
+	return width;
+}
+
+u32 vpu_helper_valid_frame_height(struct vpu_inst *inst, u32 height)
+{
+	const struct vpu_core_resources *res;
+
+	if (!inst || !inst->core || !inst->core->res)
+		return height;
+
+	res = inst->core->res;
+	if (res->max_height)
+		height = clamp(height, res->min_height, res->max_height);
+	if (res->step_height)
+		height = ALIGN(height, res->step_height);
+
+	return height;
+}
+
+u32 vpu_helper_get_frame_size(u32 fmt, u32 width, u32 height)
+{
+	switch (fmt) {
+	case V4L2_PIX_FMT_NV12:
+		return ((width * 3) >> 1) * height;
+	default:
+		return width * height;
+	}
+}
+
+static u32 get_nv12_plane_size(u32 width, u32 height, int plane_no,
+			u32 stride, u32 interlaced, u32 *pbl)
+{
+	u32 bytesperline;
+	u32 size = 0;
+
+	bytesperline = ALIGN(width, stride);
+	height = ALIGN(height, 2);
+	if (plane_no == 0)
+		size = bytesperline * height;
+	else
+		size = bytesperline * height >> 1;
+
+	if (pbl)
+		*pbl = bytesperline;
+
+	return size;
+}
+
+static u32 get_tiled_8l128_plane_size(u32 fmt, u32 width, u32 height, int plane_no,
+			u32 stride, u32 interlaced, u32 *pbl)
+{
+	u32 ws = 3;
+	u32 hs = 7;
+	u32 bitdepth = 8;
+	u32 bytesperline;
+	u32 size = 0;
+
+	if (interlaced)
+		hs++;
+	if (fmt == V4L2_PIX_FMT_NV12_10BE_8L128)
+		bitdepth = 10;
+	bytesperline = DIV_ROUND_UP(width * bitdepth, BITS_PER_BYTE);
+	bytesperline = ALIGN(bytesperline, 1 << ws);
+	bytesperline = ALIGN(bytesperline, stride);
+	height = ALIGN(height, 1 << hs);
+	if (plane_no == 0)
+		size = bytesperline * height;
+	else if (plane_no == 1)
+		size = (bytesperline * ALIGN(height, 1 << (hs + 1))) >> 1;
+
+	if (pbl)
+		*pbl = bytesperline;
+
+	return size;
+}
+
+static u32 get_default_plane_size(u32 width, u32 height, int plane_no,
+			u32 stride, u32 interlaced, u32 *pbl)
+{
+	u32 bytesperline;
+	u32 size = 0;
+
+	bytesperline = ALIGN(width, stride);
+	if (plane_no == 0)
+		size = bytesperline * height;
+
+	if (pbl)
+		*pbl = bytesperline;
+
+	return size;
+}
+
+u32 vpu_helper_get_plane_size(u32 fmt, u32 w, u32 h, int plane_no,
+		u32 stride, u32 interlaced, u32 *pbl)
+{
+	switch (fmt) {
+	case V4L2_PIX_FMT_NV12:
+		return get_nv12_plane_size(w, h, plane_no, stride, interlaced, pbl);
+	case V4L2_PIX_FMT_NV12_8L128:
+	case V4L2_PIX_FMT_NV12_10BE_8L128:
+		return get_tiled_8l128_plane_size(fmt, w, h, plane_no, stride, interlaced, pbl);
+	default:
+		return get_default_plane_size(w, h, plane_no, stride, interlaced, pbl);
+	}
+}
+
+u32 vpu_helper_copy_from_stream_buffer(struct vpu_buffer *stream_buffer,
+					u32 *rptr, u32 size, void *dst)
+{
+	u32 offset;
+	u32 start;
+	u32 end;
+	void *virt;
+
+	if (!stream_buffer || !rptr || !dst)
+		return -EINVAL;
+
+	if (!size)
+		return 0;
+
+	offset = *rptr;
+	start = stream_buffer->phys;
+	end = start + stream_buffer->length;
+	virt = stream_buffer->virt;
+
+	if (offset < start || offset > end) {
+		vpu_err("rptr 0x%x is out of range [0x%x, 0x%x]\n",
+				offset, start, end);
+		return -EINVAL;
+	}
+
+	if (offset + size <= end) {
+		memcpy(dst, virt + (offset - start), size);
+	} else {
+		memcpy(dst, virt + (offset - start), end - offset);
+		memcpy(dst + end - offset, virt, size + offset - end);
+	}
+
+	*rptr = vpu_helper_step_walk(stream_buffer, offset, size);
+	return size;
+}
+
+u32 vpu_helper_copy_to_stream_buffer(struct vpu_buffer *stream_buffer,
+				u32 *wptr, u32 size, void *src)
+{
+	u32 offset;
+	u32 start;
+	u32 end;
+	void *virt;
+
+	if (!stream_buffer || !wptr || !src)
+		return -EINVAL;
+
+	if (!size)
+		return 0;
+
+	offset = *wptr;
+	start = stream_buffer->phys;
+	end = start + stream_buffer->length;
+	virt = stream_buffer->virt;
+	if (offset < start || offset > end) {
+		vpu_err("wptr 0x%x is out of range [0x%x, 0x%x]\n",
+				offset, start, end);
+		return -EINVAL;
+	}
+
+	if (offset + size <= end) {
+		memcpy(virt + (offset - start), src, size);
+	} else {
+		memcpy(virt + (offset - start), src, end - offset);
+		memcpy(virt, src + end - offset, size + offset - end);
+	}
+
+	*wptr = vpu_helper_step_walk(stream_buffer, offset, size);
+
+	return size;
+}
+
+u32 vpu_helper_memset_stream_buffer(struct vpu_buffer *stream_buffer,
+				u32 *wptr, u8 val, u32 size)
+{
+	u32 offset;
+	u32 start;
+	u32 end;
+	void *virt;
+
+	if (!stream_buffer || !wptr)
+		return -EINVAL;
+
+	if (!size)
+		return 0;
+
+	offset = *wptr;
+	start = stream_buffer->phys;
+	end = start + stream_buffer->length;
+	virt = stream_buffer->virt;
+	if (offset < start || offset > end) {
+		vpu_err("wptr 0x%x is out of range [0x%x, 0x%x]\n",
+				offset, start, end);
+		return -EINVAL;
+	}
+
+	if (offset + size <= end) {
+		memset(virt + (offset - start), val, size);
+	} else {
+		memset(virt + (offset - start), val, end - offset);
+		memset(virt, val, size + offset - end);
+	}
+
+	offset += size;
+	if (offset >= end)
+		offset -= stream_buffer->length;
+
+	*wptr = offset;
+
+	return size;
+}
+
+u32 vpu_helper_get_free_space(struct vpu_inst *inst)
+{
+	struct vpu_rpc_buffer_desc desc;
+
+	if (vpu_iface_get_stream_buffer_desc(inst, &desc))
+		return 0;
+
+	if (desc.rptr > desc.wptr)
+		return desc.rptr - desc.wptr;
+	else if (desc.rptr < desc.wptr)
+		return (desc.end - desc.start + desc.rptr - desc.wptr);
+	else
+		return desc.end - desc.start;
+}
+
+u32 vpu_helper_get_used_space(struct vpu_inst *inst)
+{
+	struct vpu_rpc_buffer_desc desc;
+
+	if (vpu_iface_get_stream_buffer_desc(inst, &desc))
+		return 0;
+
+	if (desc.wptr > desc.rptr)
+		return desc.wptr - desc.rptr;
+	else if (desc.wptr < desc.rptr)
+		return (desc.end - desc.start + desc.wptr - desc.rptr);
+	else
+		return 0;
+}
+
+int vpu_helper_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vpu_inst *inst = ctrl_to_inst(ctrl);
+
+	switch (ctrl->id) {
+	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
+		ctrl->val = inst->min_buffer_cap;
+		break;
+	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
+		ctrl->val = inst->min_buffer_out;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+u32 vpu_helper_calc_coprime(u32 *a, u32 *b)
+{
+	int m = *a;
+	int n = *b;
+
+	if (m == 0)
+		return n;
+	if (n == 0)
+		return m;
+
+	while (n != 0) {
+		int tmp = m % n;
+
+		m = n;
+		n = tmp;
+	}
+	*a = (*a) / m;
+	*b = (*b) / m;
+
+	return m;
+}
+
+#define READ_BYTE(buffer, pos)	(*(u8 *)((buffer)->virt + ((pos) % buffer->length)))
+int vpu_helper_find_startcode(struct vpu_buffer *stream_buffer,
+			u32 pixelformat, u32 offset, u32 bytesused)
+{
+	u32 start_code;
+	int start_code_size;
+	u32 val = 0;
+	int i;
+	int ret = -EINVAL;
+
+	if (!stream_buffer || !stream_buffer->virt)
+		return -EINVAL;
+
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_H264:
+		start_code_size = 4;
+		start_code = 0x00000001;
+		break;
+	default:
+		return 0;
+	}
+
+	for (i = 0; i < bytesused; i++) {
+		val = (val << 8) | READ_BYTE(stream_buffer, offset + i);
+		if (i < start_code_size - 1)
+			continue;
+		if (val == start_code) {
+			ret = i + 1 - start_code_size;
+			break;
+		}
+	}
+
+	return ret;
+}
+
+int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 src)
+{
+	u32 i;
+
+	if (!pairs || !cnt)
+		return -EINVAL;
+
+	for (i = 0; i < cnt; i++) {
+		if (pairs[i].src == src)
+			return pairs[i].dst;
+	}
+
+	return -EINVAL;
+}
+
+int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 dst)
+{
+	u32 i;
+
+	if (!pairs || !cnt)
+		return -EINVAL;
+
+	for (i = 0; i < cnt; i++) {
+		if (pairs[i].dst == dst)
+			return pairs[i].src;
+	}
+
+	return -EINVAL;
+}
diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drivers/media/platform/amphion/vpu_helpers.h
new file mode 100644
index 000000000000..22029eab7b56
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_helpers.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _AMPHION_VPU_HELPERS_H
+#define _AMPHION_VPU_HELPERS_H
+
+struct vpu_pair {
+	u32 src;
+	u32 dst;
+};
+
+#define MAKE_TIMESTAMP(s, ns)		(((s32)(s) * NSEC_PER_SEC) + (ns))
+#define VPU_INVALID_TIMESTAMP		MAKE_TIMESTAMP(-1, 0)
+#define	VPU_ARRAY_AT(array, i)		(((i) < ARRAY_SIZE(array)) ? array[i] : 0)
+#define VPU_ARRAY_FIND(array, x)	vpu_helper_find_in_array_u8(array, ARRAY_SIZE(array), x)
+
+int vpu_helper_find_in_array_u8(const u8 *array, u32 size, u32 x);
+bool vpu_helper_check_type(struct vpu_inst *inst, u32 type);
+const struct vpu_format *vpu_helper_find_format(struct vpu_inst *inst, u32 type, u32 pixelfmt);
+const struct vpu_format *vpu_helper_enum_format(struct vpu_inst *inst, u32 type, int index);
+u32 vpu_helper_valid_frame_width(struct vpu_inst *inst, u32 width);
+u32 vpu_helper_valid_frame_height(struct vpu_inst *inst, u32 height);
+u32 vpu_helper_get_frame_size(u32 fmt, u32 width, u32 height);
+u32 vpu_helper_get_plane_size(u32 fmt, u32 width, u32 height, int plane_no,
+					u32 stride, u32 interlaced, u32 *pbl);
+u32 vpu_helper_copy_from_stream_buffer(struct vpu_buffer *stream_buffer,
+					u32 *rptr, u32 size, void *dst);
+u32 vpu_helper_copy_to_stream_buffer(struct vpu_buffer *stream_buffer,
+				u32 *wptr, u32 size, void *src);
+u32 vpu_helper_memset_stream_buffer(struct vpu_buffer *stream_buffer,
+				u32 *wptr, u8 val, u32 size);
+u32 vpu_helper_get_free_space(struct vpu_inst *inst);
+u32 vpu_helper_get_used_space(struct vpu_inst *inst);
+int vpu_helper_g_volatile_ctrl(struct v4l2_ctrl *ctrl);
+u32 vpu_helper_calc_coprime(u32 *a, u32 *b);
+void vpu_helper_get_kmp_next(const u8 *pattern, int *next, int size);
+int vpu_helper_kmp_search(u8 *s, int s_len, const u8 *p, int p_len, int *next);
+int vpu_helper_kmp_search_in_stream_buffer(struct vpu_buffer *stream_buffer,
+					u32 offset, int bytesused,
+					const u8 *p, int p_len, int *next);
+int vpu_helper_find_startcode(struct vpu_buffer *stream_buffer,
+			u32 pixelformat, u32 offset, u32 bytesused);
+
+static inline u32 vpu_helper_step_walk(struct vpu_buffer *stream_buffer, u32 pos, u32 step)
+{
+	pos += step;
+	if (pos > stream_buffer->phys + stream_buffer->length)
+		pos -= stream_buffer->length;
+
+	return pos;
+}
+
+int vpu_color_check_primaries(u32 primaries);
+int vpu_color_check_transfers(u32 transfers);
+int vpu_color_check_matrix(u32 matrix);
+int vpu_color_check_full_range(u32 full_range);
+u32 vpu_color_cvrt_primaries_v2i(u32 primaries);
+u32 vpu_color_cvrt_primaries_i2v(u32 primaries);
+u32 vpu_color_cvrt_transfers_v2i(u32 transfers);
+u32 vpu_color_cvrt_transfers_i2v(u32 transfers);
+u32 vpu_color_cvrt_matrix_v2i(u32 matrix);
+u32 vpu_color_cvrt_matrix_i2v(u32 matrix);
+u32 vpu_color_cvrt_full_range_v2i(u32 full_range);
+u32 vpu_color_cvrt_full_range_i2v(u32 full_range);
+int vpu_color_get_default(u32 primaries,
+		u32 *ptransfers, u32 *pmatrix, u32 *pfull_range);
+
+int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 src);
+int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 dst);
+#endif
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
new file mode 100644
index 000000000000..eb764c5d48e5
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -0,0 +1,625 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#define TAG		"V4L2"
+#include <linux/init.h>
+#include <linux/interconnect.h>
+#include <linux/ioctl.h>
+#include <linux/list.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/videodev2.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-vmalloc.h>
+#include "vpu.h"
+#include "vpu_core.h"
+#include "vpu_v4l2.h"
+#include "vpu_msgs.h"
+#include "vpu_helpers.h"
+#include "vpu_log.h"
+
+void vpu_inst_lock(struct vpu_inst *inst)
+{
+	mutex_lock(&inst->lock);
+}
+
+void vpu_inst_unlock(struct vpu_inst *inst)
+{
+	mutex_unlock(&inst->lock);
+}
+
+dma_addr_t vpu_get_vb_phy_addr(struct vb2_buffer *vb, u32 plane_no)
+{
+	return vb2_dma_contig_plane_dma_addr(vb, plane_no) +
+			vb->planes[plane_no].data_offset;
+}
+
+unsigned int vpu_get_vb_length(struct vb2_buffer *vb, u32 plane_no)
+{
+	if (plane_no >= vb->num_planes)
+		return 0;
+	return vb2_plane_size(vb, plane_no) - vb->planes[plane_no].data_offset;
+}
+
+void vpu_v4l2_set_error(struct vpu_inst *inst)
+{
+	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+
+	if (src_q)
+		src_q->error = 1;
+	if (dst_q)
+		dst_q->error = 1;
+}
+
+int vpu_notify_eos(struct vpu_inst *inst)
+{
+	const struct v4l2_event ev = {
+		.id = 0,
+		.type = V4L2_EVENT_EOS
+	};
+
+	inst_dbg(inst, LVL_FLOW, "notify eos event\n");
+	v4l2_event_queue_fh(&inst->fh, &ev);
+
+	return 0;
+}
+
+int vpu_notify_source_change(struct vpu_inst *inst)
+{
+	const struct v4l2_event ev = {
+		.id = 0,
+		.type = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION
+	};
+
+	inst_dbg(inst, LVL_FLOW, "notify source change event\n");
+	v4l2_event_queue_fh(&inst->fh, &ev);
+	return 0;
+}
+
+const struct vpu_format *vpu_try_fmt_common(struct vpu_inst *inst,
+		 struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	u32 type = f->type;
+	u32 stride;
+	u32 bytesperline;
+	u32 sizeimage;
+	const struct vpu_format *fmt;
+	int i;
+
+	fmt = vpu_helper_find_format(inst, type, pixmp->pixelformat);
+	if (!fmt) {
+		fmt = vpu_helper_enum_format(inst, type, 0);
+		if (!fmt)
+			return NULL;
+		pixmp->pixelformat = fmt->pixfmt;
+	}
+
+	stride = inst->core->res->stride;
+	pixmp->width = vpu_helper_valid_frame_width(inst, pixmp->width);
+	pixmp->height = vpu_helper_valid_frame_height(inst, pixmp->height);
+	pixmp->flags = fmt->flags;
+	pixmp->num_planes = fmt->num_planes;
+	if (pixmp->field == V4L2_FIELD_ANY)
+		pixmp->field = V4L2_FIELD_NONE;
+	for (i = 0; i < pixmp->num_planes; i++) {
+		sizeimage = vpu_helper_get_plane_size(pixmp->pixelformat,
+				pixmp->width, pixmp->height, i, stride,
+				pixmp->field == V4L2_FIELD_INTERLACED ? 1 : 0,
+				&bytesperline);
+		if ((s32)(pixmp->plane_fmt[i].bytesperline) <= 0)
+			pixmp->plane_fmt[i].bytesperline = bytesperline;
+		if ((s32)(pixmp->plane_fmt[i].sizeimage) <= 0)
+			pixmp->plane_fmt[i].sizeimage = sizeimage;
+		if (pixmp->plane_fmt[i].bytesperline < bytesperline)
+			pixmp->plane_fmt[i].bytesperline = bytesperline;
+		if (pixmp->plane_fmt[i].sizeimage <= sizeimage)
+			pixmp->plane_fmt[i].sizeimage = sizeimage;
+	}
+
+	return fmt;
+}
+
+static bool vpu_check_ready(struct vpu_inst *inst, u32 type)
+{
+	if (!inst)
+		return false;
+	if (inst->state == VPU_CODEC_STATE_DEINIT || inst->id < 0)
+		return false;
+	if (!inst->ops->check_ready)
+		return true;
+	return call_vop(inst, check_ready, type);
+}
+
+int vpu_process_output_buffer(struct vpu_inst *inst)
+{
+	struct v4l2_m2m_buffer *buf = NULL;
+	struct vpu_vb2_buffer *vpu_buf = NULL;
+
+	if (!inst)
+		return -EINVAL;
+
+	if (!vpu_check_ready(inst, inst->out_format.type))
+		return -EINVAL;
+
+	v4l2_m2m_for_each_src_buf(inst->m2m_ctx, buf) {
+		vpu_buf = container_of(buf, struct vpu_vb2_buffer, m2m_buf);
+		if (vpu_buf->state == VPU_BUF_STATE_IDLE)
+			break;
+		vpu_buf = NULL;
+	}
+
+	if (!vpu_buf)
+		return -EINVAL;
+
+	inst_dbg(inst, LVL_DEBUG, "frame id = %d / %d\n",
+			vpu_buf->m2m_buf.vb.sequence, inst->sequence);
+	return call_vop(inst, process_output, &vpu_buf->m2m_buf.vb.vb2_buf);
+}
+
+int vpu_process_capture_buffer(struct vpu_inst *inst)
+{
+	struct v4l2_m2m_buffer *buf = NULL;
+	struct vpu_vb2_buffer *vpu_buf = NULL;
+
+	if (!inst)
+		return -EINVAL;
+
+	if (!vpu_check_ready(inst, inst->cap_format.type))
+		return -EINVAL;
+
+	v4l2_m2m_for_each_dst_buf(inst->m2m_ctx, buf) {
+		vpu_buf = container_of(buf, struct vpu_vb2_buffer, m2m_buf);
+		if (vpu_buf->state == VPU_BUF_STATE_IDLE)
+			break;
+		vpu_buf = NULL;
+	}
+	if (!vpu_buf)
+		return -EINVAL;
+
+	return call_vop(inst, process_capture, &vpu_buf->m2m_buf.vb.vb2_buf);
+}
+
+struct vb2_v4l2_buffer *vpu_find_buf_by_sequence(struct vpu_inst *inst,
+						u32 type, u32 sequence)
+{
+	struct v4l2_m2m_buffer *buf = NULL;
+	struct vb2_v4l2_buffer *vbuf = NULL;
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		v4l2_m2m_for_each_src_buf(inst->m2m_ctx, buf) {
+			vbuf = &buf->vb;
+			if (vbuf->sequence == sequence)
+				break;
+			vbuf = NULL;
+		}
+	} else {
+		v4l2_m2m_for_each_dst_buf(inst->m2m_ctx, buf) {
+			vbuf = &buf->vb;
+			if (vbuf->sequence == sequence)
+				break;
+			vbuf = NULL;
+		}
+	}
+
+	return vbuf;
+}
+
+struct vb2_v4l2_buffer *vpu_find_buf_by_idx(struct vpu_inst *inst,
+						u32 type, u32 idx)
+{
+	struct v4l2_m2m_buffer *buf = NULL;
+	struct vb2_v4l2_buffer *vbuf = NULL;
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		v4l2_m2m_for_each_src_buf(inst->m2m_ctx, buf) {
+			vbuf = &buf->vb;
+			if (vbuf->vb2_buf.index == idx)
+				break;
+			vbuf = NULL;
+		}
+	} else {
+		v4l2_m2m_for_each_dst_buf(inst->m2m_ctx, buf) {
+			vbuf = &buf->vb;
+			if (vbuf->vb2_buf.index == idx)
+				break;
+			vbuf = NULL;
+		}
+	}
+
+	return vbuf;
+}
+
+int vpu_get_num_buffers(struct vpu_inst *inst, u32 type)
+{
+	struct vb2_queue *q;
+
+	if (!inst || !inst->m2m_ctx)
+		return -EINVAL;
+	if (V4L2_TYPE_IS_OUTPUT(type))
+		q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	else
+		q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+
+	return q->num_buffers;
+}
+
+static void vpu_m2m_device_run(void *priv)
+{
+}
+
+static void vpu_m2m_job_abort(void *priv)
+{
+	struct vpu_inst *inst = priv;
+
+	v4l2_m2m_job_finish(inst->m2m_dev, inst->m2m_ctx);
+}
+
+static const struct v4l2_m2m_ops vpu_m2m_ops = {
+	.device_run = vpu_m2m_device_run,
+	.job_abort = vpu_m2m_job_abort
+};
+
+static int vpu_vb2_queue_setup(struct vb2_queue *vq,
+				unsigned int *buf_count,
+				unsigned int *plane_count,
+				unsigned int psize[],
+				struct device *allocators[])
+{
+	struct vpu_inst *inst = vb2_get_drv_priv(vq);
+	struct vpu_format *cur_fmt;
+	int i;
+
+	cur_fmt = vpu_get_format(inst, vq->type);
+
+	if (*plane_count) {
+		if (*plane_count != cur_fmt->num_planes)
+			return -EINVAL;
+		for (i = 0; i < cur_fmt->num_planes; i++) {
+			if (psize[i] < cur_fmt->sizeimage[i])
+				return -EINVAL;
+		}
+	}
+
+	*plane_count = cur_fmt->num_planes;
+	for (i = 0; i < cur_fmt->num_planes; i++)
+		psize[i] = cur_fmt->sizeimage[i];
+
+	inst_dbg(inst, LVL_FLOW, "%s queue setup : %u; %u, %u\n",
+			vpu_type_name(vq->type),
+			*buf_count,
+			psize[0], psize[1]);
+
+	return 0;
+}
+
+static int vpu_vb2_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+
+	vpu_buf->state = VPU_BUF_STATE_IDLE;
+
+	return 0;
+}
+
+static void vpu_vb2_buf_cleanup(struct vb2_buffer *vb)
+{
+}
+
+static int vpu_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vpu_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+	struct vpu_format *cur_fmt;
+	u32 i;
+
+	cur_fmt = vpu_get_format(inst, vb->type);
+	if (vb->num_planes != cur_fmt->num_planes)
+		return -EINVAL;
+	for (i = 0; i < cur_fmt->num_planes; i++) {
+		if (vpu_get_vb_length(vb, i) < cur_fmt->sizeimage[i]) {
+			inst_err(inst, "%s buf[%d] is invalid\n",
+					vpu_type_name(vb->type),
+					vb->index);
+			vpu_buf->state = VPU_BUF_STATE_ERROR;
+		}
+	}
+
+	return 0;
+}
+
+static void vpu_vb2_buf_finish(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_queue *q = vb->vb2_queue;
+
+	if (vbuf->flags & V4L2_BUF_FLAG_LAST)
+		vpu_notify_eos(inst);
+
+	if (list_empty(&q->done_list))
+		call_vop(inst, on_queue_empty, q->type);
+}
+
+void vpu_vb2_buffers_return(struct vpu_inst *inst,
+		unsigned int type, enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *buf;
+
+	if (!inst || !inst->m2m_ctx)
+		return;
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		while ((buf = v4l2_m2m_src_buf_remove(inst->m2m_ctx)))
+			v4l2_m2m_buf_done(buf, state);
+	} else {
+		while ((buf = v4l2_m2m_dst_buf_remove(inst->m2m_ctx)))
+			v4l2_m2m_buf_done(buf, state);
+	}
+}
+
+static int vpu_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct vpu_inst *inst = vb2_get_drv_priv(q);
+	int ret;
+
+	vpu_inst_unlock(inst);
+	ret = vpu_inst_register(inst);
+	vpu_inst_lock(inst);
+	if (ret)
+		return ret;
+
+	vpu_inst_get(inst);
+	inst_dbg(inst, LVL_FLOW, "%s start streaming : %d\n",
+			vpu_type_name(q->type), q->num_buffers);
+	call_vop(inst, start, q->type);
+	vb2_clear_last_buffer_dequeued(q);
+
+	return 0;
+}
+
+static void vpu_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct vpu_inst *inst = vb2_get_drv_priv(q);
+
+	inst_dbg(inst, LVL_FLOW, "%s stop streaming\n", vpu_type_name(q->type));
+
+	call_vop(inst, stop, q->type);
+	vpu_vb2_buffers_return(inst, q->type, VB2_BUF_STATE_ERROR);
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		inst->sequence = 0;
+
+	vpu_inst_put(inst);
+}
+
+static void vpu_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	inst_dbg(inst, LVL_DEBUG, "%s buf queue\n", vpu_type_name(vb->type));
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
+		vbuf->sequence = inst->sequence++;
+		if ((s64)vb->timestamp < 0)
+			vb->timestamp = VPU_INVALID_TIMESTAMP;
+	}
+
+	v4l2_m2m_buf_queue(inst->m2m_ctx, vbuf);
+	vpu_process_output_buffer(inst);
+	vpu_process_capture_buffer(inst);
+}
+
+static struct vb2_ops vpu_vb2_ops = {
+	.queue_setup        = vpu_vb2_queue_setup,
+	.buf_init           = vpu_vb2_buf_init,
+	.buf_cleanup        = vpu_vb2_buf_cleanup,
+	.buf_prepare        = vpu_vb2_buf_prepare,
+	.buf_finish         = vpu_vb2_buf_finish,
+	.start_streaming    = vpu_vb2_start_streaming,
+	.stop_streaming     = vpu_vb2_stop_streaming,
+	.buf_queue          = vpu_vb2_buf_queue,
+	.wait_prepare       = vb2_ops_wait_prepare,
+	.wait_finish        = vb2_ops_wait_finish,
+};
+
+static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
+			  struct vb2_queue *dst_vq)
+{
+	struct vpu_inst *inst = priv;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->ops = &vpu_vb2_ops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	if (inst->type == VPU_CORE_TYPE_DEC && inst->use_stream_buffer)
+		src_vq->mem_ops = &vb2_vmalloc_memops;
+	src_vq->drv_priv = inst;
+	src_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
+	src_vq->allow_zero_bytesused = 1;
+	src_vq->min_buffers_needed = 1;
+	src_vq->dev = inst->core->dev;
+	src_vq->lock = &inst->lock;
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->ops = &vpu_vb2_ops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	if (inst->type == VPU_CORE_TYPE_ENC && inst->use_stream_buffer)
+		dst_vq->mem_ops = &vb2_vmalloc_memops;
+	dst_vq->drv_priv = inst;
+	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
+	dst_vq->allow_zero_bytesused = 1;
+	dst_vq->min_buffers_needed = 1;
+	dst_vq->dev = inst->core->dev;
+	dst_vq->lock = &inst->lock;
+	ret = vb2_queue_init(dst_vq);
+	if (ret) {
+		vb2_queue_release(src_vq);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int vpu_v4l2_release(struct vpu_inst *inst)
+{
+	struct vpu_core *core = inst->core;
+
+	inst_dbg(inst, LVL_FLOW, "%s\n", __func__);
+
+	vpu_release_core(core);
+
+	if (inst->workqueue) {
+		cancel_work_sync(&inst->msg_work);
+		destroy_workqueue(inst->workqueue);
+		inst->workqueue = NULL;
+	}
+	if (inst->m2m_ctx) {
+		v4l2_m2m_ctx_release(inst->m2m_ctx);
+		inst->m2m_ctx = NULL;
+	}
+	if (inst->m2m_dev) {
+		v4l2_m2m_release(inst->m2m_dev);
+		inst->m2m_dev = NULL;
+	}
+
+	v4l2_ctrl_handler_free(&inst->ctrl_handler);
+	mutex_destroy(&inst->lock);
+	v4l2_fh_del(&inst->fh);
+	v4l2_fh_exit(&inst->fh);
+
+	call_vop(inst, cleanup);
+
+	return 0;
+}
+
+int vpu_v4l2_open(struct file *file, struct vpu_inst *inst)
+{
+	struct vpu_dev *vpu = video_drvdata(file);
+	struct video_device *vdev;
+	struct vpu_core *core = NULL;
+	int ret = 0;
+
+	WARN_ON(!file || !inst || !inst->ops);
+
+	if (inst->type == VPU_CORE_TYPE_ENC)
+		vdev = vpu->vdev_enc;
+	else
+		vdev = vpu->vdev_dec;
+
+	mutex_init(&inst->lock);
+	INIT_LIST_HEAD(&inst->cmd_q);
+
+	inst->id = VPU_INST_NULL_ID;
+	inst->release = vpu_v4l2_release;
+	inst->core = vpu_request_core(vpu, inst->type);
+	inst->pid = current->pid;
+	inst->tgid = current->tgid;
+
+	core = inst->core;
+	if (!core) {
+		vpu_err("there is no core for %s\n",
+			vpu_core_type_desc(inst->type));
+		return -EINVAL;
+	}
+
+	inst->min_buffer_cap = 2;
+	inst->min_buffer_out = 2;
+
+	ret = call_vop(inst, ctrl_init);
+	if (ret)
+		goto error;
+
+	inst->m2m_dev = v4l2_m2m_init(&vpu_m2m_ops);
+	if (IS_ERR(inst->m2m_dev)) {
+		vpu_err("v4l2_m2m_init fail\n");
+		ret = PTR_ERR(inst->m2m_dev);
+		goto error;
+	}
+
+	inst->m2m_ctx = v4l2_m2m_ctx_init(inst->m2m_dev,
+					inst, vpu_m2m_queue_init);
+	if (IS_ERR(inst->m2m_ctx)) {
+		vpu_err("v4l2_m2m_ctx_init fail\n");
+		ret = PTR_ERR(inst->m2m_dev);
+		goto error;
+	}
+
+	v4l2_fh_init(&inst->fh, vdev);
+	v4l2_fh_add(&inst->fh);
+	inst->fh.ctrl_handler = &inst->ctrl_handler;
+	inst->fh.m2m_ctx = inst->m2m_ctx;
+	file->private_data = &inst->fh;
+	inst->state = VPU_CODEC_STATE_DEINIT;
+	inst->workqueue = alloc_workqueue("vpu_inst", WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
+	if (inst->workqueue) {
+		INIT_WORK(&inst->msg_work, vpu_inst_run_work);
+		ret = kfifo_init(&inst->msg_fifo,
+				inst->msg_buffer,
+				roundup_pow_of_two(sizeof(inst->msg_buffer)));
+		if (ret) {
+			destroy_workqueue(inst->workqueue);
+			inst->workqueue = NULL;
+		}
+	}
+	atomic_set(&inst->ref_count, 0);
+	vpu_inst_get(inst);
+	vpu_dbg(LVL_FLOW, "open, tgid = %d, pid = %d\n", inst->tgid, inst->pid);
+
+	return 0;
+error:
+	if (inst->m2m_ctx) {
+		v4l2_m2m_ctx_release(inst->m2m_ctx);
+		inst->m2m_ctx = NULL;
+	}
+	if (inst->m2m_dev) {
+		v4l2_m2m_release(inst->m2m_dev);
+		inst->m2m_dev = NULL;
+	}
+	v4l2_ctrl_handler_free(&inst->ctrl_handler);
+	vpu_release_core(inst->core);
+
+	return ret;
+}
+
+int vpu_v4l2_close(struct file *file)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct vb2_queue *src_q;
+	struct vb2_queue *dst_q;
+
+	inst_dbg(inst, LVL_FLOW, "close\n");
+	src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	vpu_inst_lock(inst);
+	if (vb2_is_streaming(src_q))
+		v4l2_m2m_streamoff(file, inst->m2m_ctx, src_q->type);
+	if (vb2_is_streaming(dst_q))
+		v4l2_m2m_streamoff(file, inst->m2m_ctx, dst_q->type);
+	vpu_inst_unlock(inst);
+
+	call_vop(inst, release);
+	vpu_inst_unregister(inst);
+	vpu_inst_put(inst);
+
+	return 0;
+}
diff --git a/drivers/media/platform/amphion/vpu_v4l2.h b/drivers/media/platform/amphion/vpu_v4l2.h
new file mode 100644
index 000000000000..8873e1f66072
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_v4l2.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _AMPHION_VPU_V4L2_H
+#define _AMPHION_VPU_V4L2_H
+
+#include <linux/videodev2.h>
+
+void vpu_inst_lock(struct vpu_inst *inst);
+void vpu_inst_unlock(struct vpu_inst *inst);
+
+int vpu_v4l2_open(struct file *file, struct vpu_inst *inst);
+int vpu_v4l2_close(struct file *file);
+
+const struct vpu_format *vpu_try_fmt_common(struct vpu_inst *inst, struct v4l2_format *f);
+int vpu_process_output_buffer(struct vpu_inst *inst);
+int vpu_process_capture_buffer(struct vpu_inst *inst);
+struct vb2_v4l2_buffer *vpu_find_buf_by_sequence(struct vpu_inst *inst, u32 type, u32 sequence);
+struct vb2_v4l2_buffer *vpu_find_buf_by_idx(struct vpu_inst *inst, u32 type, u32 idx);
+void vpu_v4l2_set_error(struct vpu_inst *inst);
+int vpu_notify_eos(struct vpu_inst *inst);
+int vpu_notify_source_change(struct vpu_inst *inst);
+void vpu_vb2_buffers_return(struct vpu_inst *inst,
+		unsigned int type, enum vb2_buffer_state state);
+int vpu_get_num_buffers(struct vpu_inst *inst, u32 type);
+
+dma_addr_t vpu_get_vb_phy_addr(struct vb2_buffer *vb, u32 plane_no);
+unsigned int vpu_get_vb_length(struct vb2_buffer *vb, u32 plane_no);
+static inline struct vpu_format *vpu_get_format(struct vpu_inst *inst, u32 type)
+{
+	if (V4L2_TYPE_IS_OUTPUT(type))
+		return &inst->out_format;
+	else
+		return &inst->cap_format;
+}
+
+static inline char *vpu_type_name(u32 type)
+{
+	return V4L2_TYPE_IS_OUTPUT(type) ? "output" : "capture";
+}
+
+static inline int vpu_vb_is_codecconfig(struct vb2_v4l2_buffer *vbuf)
+{
+#ifdef V4L2_BUF_FLAG_CODECCONFIG
+	return (vbuf->flags & V4L2_BUF_FLAG_CODECCONFIG) ? 1 : 0;
+#else
+	return 0;
+#endif
+}
+
+#endif
-- 
2.32.0


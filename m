Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D0F39D7B2
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 10:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhFGIpx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 04:45:53 -0400
Received: from mail-am6eur05on2049.outbound.protection.outlook.com ([40.107.22.49]:11345
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230395AbhFGIpv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Jun 2021 04:45:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FstRt9L+2WtPJUBLbmhZX9EqK7Yc3LwSMjCyE2QFOhHEVvaUPyy4dKFw+b3jhakC2FJ+CN5MR6I1bojllr5CxyZlVEAS8xupQ7tzIjbIJbMDJ1DhjcqZKPGTkN4S1Rl8j70s/ICgD0CJGOYsoHK1VJgGDydCptC35CbsIhqZ8+Eiu3p+fGAk2jEbmIws4F7V58aPtLf5QIn3Kci451NxiV26vNQl0KdxuTWFSJl62QEAWqhWNOXItt5rzBzQry3GpMaVcrJJJsEZ27Ftj4UHx9QYWq7ocx3WO74IisulJaqb2VvIWcgh4j4kuILpqsOH5B3qF24fxIqueJU3zI4u6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfoLhaZ4DzuouCPdkY2bVpe2EBXsuL8WSY5kbmOc8rU=;
 b=g10n6uZcdCdJg7E0b1P8TXf7FIxGaz5dAQCQTtaJS5TBrdd5aDsCj27I4k6Goh+zWGUQfV48yutdtpEwUJ0ZkL5CwFh6rzmwtkLJp4M6uZUbSx3I9wKzV7cLTuWiSVujd0JIaVGMvCMdaipi1yl5VQIr2M+mq3U63H3KXWagdZvdsxvO9aLsVtEiibMGbDbukIex/7wblWwPuMlAOIoZhj2L6l70AC6uwZWlfzOi0W8miHoH/QaI5sPEyDZl2WLLtg8kbSZkfVcztBiwGsw9Wm4Zn4NJK8rp9BQaaPbNa57qlwcVbdy6a4856WQZGTAu7u9l37jGsf0Iu44GL2GAxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfoLhaZ4DzuouCPdkY2bVpe2EBXsuL8WSY5kbmOc8rU=;
 b=A/ImXXDkTXOTQne8G8uKWtVTeioi4YoKJ3sXJOLWXN+l0kqhLI6V1xI0wiqnQsicqpoNKte6hlkdxDwxKeO6TIqJ2/ktSXWmkOhsc/uLdVqCQhRVy7Mh+nf/ku1NZTSQ5YGDq3ewiF9BWc1p3Fu4r0fFGsAoZLSdLNODN3zS9G0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM7PR04MB6933.eurprd04.prod.outlook.com (2603:10a6:20b:10d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 08:43:53 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 08:43:53 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 06/13] media: imx: imx8q: add vpu v4l2 m2m support
Date:   Mon,  7 Jun 2021 16:42:53 +0800
Message-Id: <fc879b09d3a9bd62bacd6bdb23ab266ea074999a.1623054584.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623054584.git.ming.qian@nxp.com>
References: <cover.1623054584.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 08:43:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8178167-990b-43c1-33d1-08d929906163
X-MS-TrafficTypeDiagnostic: AM7PR04MB6933:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6933C56B0150AC58C8BC8AFBE7389@AM7PR04MB6933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FGNOEwELdYfFGok7VCFhj31taf0GjV+PAMA5hYwXWYFuT7NdUdUkkrQP0ZNb+euLzUAZ/2DOXEjeTe1SI2X8Rm92FdDYDtjawSa0rkhOQTdc+DHExv7CEYd1ZqVdt20+Rhu8hEeLJSshYAEmCO0MO3jNP3UC1tCCm5/PHj3DobyYCGWEkdi1zxk1FIEhsAgTMmjzAzvaL8tzwFuSMR0+n9rMLCDP7cdPvjtpn3zOPX4zYCNzLCV09WNs2PhekjA1qOL2N5EpF1Ccn1F6Oldw+XvT5PIbb8ulZKTAh3ocFzA6XTbYMeozNR81NGLGGxB5R8UDtS+EeMywwbOalva/rIvXnNOdNCVmS6HsMH+0Tj9gXLAgpKSBZCMrBqlQBwgZvm0sWpJPUpe/buYeQE1PEanTfl1oz8Zqt4/MzEfgG3BvvNyNG2iJtvLDBh7xwbdIyC6kOAtc+ah5P64aJDl6gUgWkju9Qpa/WRBK/FcF4utakZUPrUPh+FsOfPsJ3mNPauALLWeTtole6nwEeXQPmm16ehF+XUnUvrFMTRRyrw32XMHYtA07ZVKJWYRTaJ+ahnO1CTd/lC0m9uBxUOIGQL1CzWcbmBYRJ8Bom+StBTYaS1WwbmMbIXycvCYqt0382eyuKp6DghNRvL4o6nYzlAmjY3Ha2X8x07jd18ilRD4Z6ko7WXgThh8EywiJnnLqhqLIjlPrxmQkY6H58OUD2FskbfMrMrKP1CjDwD9WdHq26+LngCKrlCru6OW1aD20NaL2VsBL/hzEzQqhkGcQgbCTgVvvE12imd/Qo+ZW5kPbFoJG0ukQDYNKPUXFv7YWq8bXUYLe8xvXAoqWa3UxyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(186003)(956004)(16526019)(7416002)(6486002)(966005)(26005)(316002)(30864003)(2616005)(2906002)(4326008)(478600001)(38100700002)(38350700002)(7696005)(66476007)(66556008)(66946007)(8676002)(5660300002)(83380400001)(52116002)(86362001)(36756003)(44832011)(8936002)(32563001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9kwAVPnSl1T1pymnGOCShAGeG5LrJVOVmyFxyOWumVKKM0wYFtyJOLE6xRVD?=
 =?us-ascii?Q?QAbg3paHhPKpVNmcik4PfcjdGCl30mIR6ZAnPq93qlU9StGlW+O9RvNuXAlY?=
 =?us-ascii?Q?uO87g0+YuBjYquEwcOQyxdHYUV3Yq/RUkxsT/MaIO1vGM28eTrIDDc+3//fO?=
 =?us-ascii?Q?BITuBOL4gCSn6ZLXeh8YGzCIkzOvxweMRnhJvSpY6sfF+wjb3Q2zpd4KszYF?=
 =?us-ascii?Q?exxREi+FBwkm7y27GjT3Q9CxA+vxdKsaYYuhwlUpJKp+siCqY1HxpMhFX/Ue?=
 =?us-ascii?Q?okUbyMELTOkcjqKutPy1Gyhk+Suz8jr3RbaJ7Ej8iQEOVm8slC09GXYezvuv?=
 =?us-ascii?Q?+Y3/gTzQNj4bX4nnQIKB82au+GTNUm+6VfFE77R4W76qWaEiXlII/0bncmUM?=
 =?us-ascii?Q?SV5/8wCDkY5BHNPX9EMyirORIR87PH10zSuAsbCPSXlu19LW9aMT4IvO3liw?=
 =?us-ascii?Q?NQxnSfaurm6eP5pDesPVn5xvnYIdV26re+KYWSFHCEXXoaHsr3Mvp3whH1ic?=
 =?us-ascii?Q?JALeIWe0FBFXUmSnuhy0VF5osWRMdZyTtiKtcdQF0hfaQCiIQB13fhv2zHDE?=
 =?us-ascii?Q?6Mx0owb678d/2UaK1WssCaD9g5y0iyWsVOOFr7ttLDoWDQlnAON6HcuvfNp/?=
 =?us-ascii?Q?8UBpbOTZcJL7iDOliTfhbpG/QPdSqK3AoNZYNVTV+3N+Sa/51tgVb74f6J0U?=
 =?us-ascii?Q?Ekvy6ScoU+t+w8u/SGowYBcFaYcrK18xO6UxMDQICJA21TNAxWSQrRmh5z5i?=
 =?us-ascii?Q?CAz5Jp5oNK6E035OPBY31nBWiE7JoyQyxLWempPVEeiCO72RdufcEXzyLHVM?=
 =?us-ascii?Q?Bby8e7kiPQM/nb2p7PpyCX0uPzP2u92JHuQBMput1ztTQpK7noeO+ild7uXO?=
 =?us-ascii?Q?ncjbYD8uSXT37G2uF7BnCx6K9KDgdCSBIsuqICw8c2jmgPwP4azkVMh3PWey?=
 =?us-ascii?Q?DtcQYPSuBpZ2IzOCb7gnW8aICpFmb9FoP/tGJ/c73sbNEl939n+PpaQGVknD?=
 =?us-ascii?Q?5Fl9pZQPo9cBU/13TPAPJa0FsZX06IS/x8+c4THUFNaXIJT5i6MlNkKFMsSe?=
 =?us-ascii?Q?1FutlR9E0hSYz81FZ5OuimRvcDgP1FfcSbngnavgrbQRnKuv3lQ4DHXPOfrM?=
 =?us-ascii?Q?806gIRgVST0A9koz3spsrKgrxeASOkb/hZh/kQh8+N6faboyY73ZTiigaOZr?=
 =?us-ascii?Q?wG258QqZyYs0dD8Ow6y1p5cDj3GgWcV/VeFVtBUeTU+lnSwXxZcRLw7Wfeox?=
 =?us-ascii?Q?pwTXkD9ilcy/mKOAAhvG1FQRZZArf09qhtiHxcBNOyOsWLPyTinRqadbGhfM?=
 =?us-ascii?Q?kr+in/bZNUz1VInOOsEIFsM1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8178167-990b-43c1-33d1-08d929906163
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 08:43:53.7265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iV1IYqtkZRi3SIhuYBvN5w4LcuR6m/++qsH94JiaUuXtbP7YImpSfuhKE5dnlMtfzKamYzSgfYGtmNkQCENMOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6933
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vpu_v4l2.c implements the v4l2 m2m driver methods.
vpu_helpers.c implements the common helper functions
vpu_color.c converts the v4l2 colorspace with iso

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 drivers/media/platform/imx/vpu-8q/vpu_color.c | 201 +++++
 .../media/platform/imx/vpu-8q/vpu_helpers.c   | 405 ++++++++++
 .../media/platform/imx/vpu-8q/vpu_helpers.h   |  80 ++
 drivers/media/platform/imx/vpu-8q/vpu_v4l2.c  | 730 ++++++++++++++++++
 drivers/media/platform/imx/vpu-8q/vpu_v4l2.h  |  56 ++
 5 files changed, 1472 insertions(+)
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_color.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_helpers.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_helpers.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_v4l2.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_v4l2.h

diff --git a/drivers/media/platform/imx/vpu-8q/vpu_color.c b/drivers/media/platform/imx/vpu-8q/vpu_color.c
new file mode 100644
index 000000000000..62030a3db0ee
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_color.c
@@ -0,0 +1,201 @@
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
+	V4L2_COLORSPACE_GENERIC_FILM, /*Generic film*/
+	V4L2_COLORSPACE_BT2020,       /*Rec. ITU-R BT.2020-2*/
+	V4L2_COLORSPACE_ST428         /*SMPTE ST 428-1*/
+};
+
+static const u8 colortransfers[] = {
+	0,
+	V4L2_XFER_FUNC_709,      /*Rec. ITU-R BT.709-6*/
+	0,
+	0,
+	V4L2_XFER_FUNC_GAMMA22,  /*Rec. ITU-R BT.470-6 System M*/
+	V4L2_XFER_FUNC_GAMMA28,  /*Rec. ITU-R BT.470-6 System B, G*/
+	V4L2_XFER_FUNC_709,      /*SMPTE170M*/
+	V4L2_XFER_FUNC_SMPTE240M,/*SMPTE240M*/
+	V4L2_XFER_FUNC_LINEAR,   /*Linear transfer characteristics*/
+	0,
+	0,
+	V4L2_XFER_FUNC_XVYCC,    /*IEC 61966-2-4*/
+	V4L2_XFER_FUNC_BT1361,   /*Rec. ITU-R BT.1361-0 extended colour gamut*/
+	V4L2_XFER_FUNC_SRGB,     /*IEC 61966-2-1 sRGB or sYCC*/
+	V4L2_XFER_FUNC_709,      /*Rec. ITU-R BT.2020-2 (10 bit system)*/
+	V4L2_XFER_FUNC_709,      /*Rec. ITU-R BT.2020-2 (12 bit system)*/
+	V4L2_XFER_FUNC_SMPTE2084,/*SMPTE ST 2084*/
+	V4L2_XFER_FUNC_ST428,    /*SMPTE ST 428-1*/
+	V4L2_XFER_FUNC_HLG       /*Rec. ITU-R BT.2100-0 hybrid log-gamma (HLG)*/
+};
+
+static const u8 colormatrixcoefs[] = {
+	0,
+	V4L2_YCBCR_ENC_709,             /*Rec. ITU-R BT.709-6*/
+	0,
+	0,
+	V4L2_YCBCR_ENC_BT470_6M,        /*Title 47 Code of Federal Regulations*/
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
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_helpers.c b/drivers/media/platform/imx/vpu-8q/vpu_helpers.c
new file mode 100644
index 000000000000..c21da2f26163
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_helpers.c
@@ -0,0 +1,405 @@
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
+u32 vpu_helper_get_plane_size(u32 fmt, u32 width, u32 height, int plane_no, u32 stride)
+{
+	width = ALIGN(width, stride);
+
+	switch (fmt) {
+	case V4L2_PIX_FMT_NV12:
+		if (plane_no == 0)
+			return width * height;
+		else if (plane_no == 1)
+			return (width >> 1) * height;
+		else
+			return 0;
+	default:
+		if (plane_no == 0)
+			return width * height;
+		else
+			return 0;
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
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_helpers.h b/drivers/media/platform/imx/vpu-8q/vpu_helpers.h
new file mode 100644
index 000000000000..3f0acda8522c
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_helpers.h
@@ -0,0 +1,80 @@
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
+#ifndef _IMX_VPU_HELPERS_H
+#define _IMX_VPU_HELPERS_H
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
+u32 vpu_helper_get_plane_size(u32 fmt, u32 width, u32 height, int plane_no, u32 stride);
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
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_v4l2.c b/drivers/media/platform/imx/vpu-8q/vpu_v4l2.c
new file mode 100644
index 000000000000..c3953165d08a
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_v4l2.c
@@ -0,0 +1,730 @@
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
+#include <linux/imx_vpu.h>
+#include "vpu.h"
+#include "vpu_core.h"
+#include "vpu_v4l2.h"
+#include "vpu_msgs.h"
+#include "vpu_helpers.h"
+#include "vpu_log.h"
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
+	struct vb2_queue *src_q;
+	struct vb2_queue *dst_q;
+
+	src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
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
+int vpu_notify_skip(struct vpu_inst *inst)
+{
+	const struct v4l2_event ev = {
+		.id = 0,
+		.type = V4L2_EVENT_SKIP,
+		.u.data[0] = 0xff,
+	};
+
+	inst_dbg(inst, LVL_FLOW, "notify skip event\n");
+	v4l2_event_queue_fh(&inst->fh, &ev);
+
+	return 0;
+}
+
+int vpu_notify_codec_error(struct vpu_inst *inst)
+{
+	const struct v4l2_event ev = {
+		.id = 0,
+		.type = V4L2_EVENT_CODEC_ERROR,
+	};
+
+	inst_dbg(inst, LVL_FLOW, "notify error event\n");
+	v4l2_event_queue_fh(&inst->fh, &ev);
+	vpu_v4l2_set_error(inst);
+
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
+		bytesperline = ALIGN(pixmp->width, stride);
+		sizeimage = vpu_helper_get_plane_size(pixmp->pixelformat,
+				pixmp->width, pixmp->height, i, stride);
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
+
+	mutex_lock(&inst->lock);
+	vpu_vb2_buffers_return(inst, q->type, VB2_BUF_STATE_ERROR);
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		inst->sequence = 0;
+	mutex_unlock(&inst->lock);
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
+	mutex_lock(&inst->lock);
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
+
+	mutex_unlock(&inst->lock);
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
+	ret = vb2_queue_init(dst_vq);
+	if (ret) {
+		vb2_queue_release(src_vq);
+		return ret;
+	}
+
+	return 0;
+}
+
+int vpu_v4l2_ioctl_reqbufs(struct file *file, void *priv,
+		struct v4l2_requestbuffers *rb)
+{
+	struct vpu_inst *inst = to_inst(file);
+	int ret;
+
+	mutex_lock(&inst->ioctl_sync);
+	ret = v4l2_m2m_ioctl_reqbufs(file, priv, rb);
+	mutex_unlock(&inst->ioctl_sync);
+
+	return ret;
+}
+
+int vpu_v4l2_ioctl_create_bufs(struct file *file, void *priv,
+		struct v4l2_create_buffers *create)
+{
+	struct vpu_inst *inst = to_inst(file);
+	int ret;
+
+	mutex_lock(&inst->ioctl_sync);
+	ret = v4l2_m2m_ioctl_create_bufs(file, priv, create);
+	mutex_unlock(&inst->ioctl_sync);
+
+	return ret;
+}
+
+int vpu_v4l2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+{
+	struct vpu_inst *inst = to_inst(file);
+	int ret;
+
+	mutex_lock(&inst->ioctl_sync);
+	ret = v4l2_m2m_ioctl_qbuf(file, priv, buf);
+	mutex_unlock(&inst->ioctl_sync);
+
+	return ret;
+}
+
+int vpu_v4l2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+{
+	struct vpu_inst *inst = to_inst(file);
+	int ret;
+
+	mutex_lock(&inst->ioctl_sync);
+	ret = v4l2_m2m_ioctl_dqbuf(file, priv, buf);
+	mutex_unlock(&inst->ioctl_sync);
+
+	return ret;
+}
+
+int vpu_v4l2_ioctl_streamon(struct file *file, void *priv,
+		enum v4l2_buf_type type)
+{
+	struct vpu_inst *inst = to_inst(file);
+	int ret;
+
+	ret = vpu_inst_register(inst);
+	if (ret)
+		return ret;
+
+	mutex_lock(&inst->ioctl_sync);
+	ret = v4l2_m2m_ioctl_streamon(file, priv, type);
+	mutex_unlock(&inst->ioctl_sync);
+
+	return ret;
+}
+
+int vpu_v4l2_ioctl_streamoff(struct file *file, void *priv,
+		enum v4l2_buf_type type)
+{
+	struct vpu_inst *inst = to_inst(file);
+	int ret;
+
+	mutex_lock(&inst->ioctl_sync);
+	ret = v4l2_m2m_ioctl_streamoff(file, priv, type);
+	mutex_unlock(&inst->ioctl_sync);
+
+	return ret;
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
+	mutex_destroy(&inst->ioctl_sync);
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
+	mutex_init(&inst->ioctl_sync);
+	INIT_LIST_HEAD(&inst->cmd_q);
+
+	inst->id = VPU_INST_NULL_ID;
+	inst->release = vpu_v4l2_release;
+	inst->core = vpu_request_core(vpu, inst->type);
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
+	mutex_lock(&inst->ioctl_sync);
+	if (vb2_is_streaming(src_q))
+		v4l2_m2m_streamoff(file, inst->m2m_ctx, src_q->type);
+	if (vb2_is_streaming(dst_q))
+		v4l2_m2m_streamoff(file, inst->m2m_ctx, dst_q->type);
+	mutex_unlock(&inst->ioctl_sync);
+
+	call_vop(inst, release);
+	vpu_inst_unregister(inst);
+	vpu_inst_put(inst);
+
+	return 0;
+}
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_v4l2.h b/drivers/media/platform/imx/vpu-8q/vpu_v4l2.h
new file mode 100644
index 000000000000..4b187dc24d48
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_v4l2.h
@@ -0,0 +1,56 @@
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
+#ifndef _IMX_VPU_V4L2_H
+#define _IMX_VPU_V4L2_H
+
+int vpu_v4l2_open(struct file *file, struct vpu_inst *inst);
+int vpu_v4l2_close(struct file *file);
+int vpu_v4l2_ioctl_reqbufs(struct file *file, void *priv, struct v4l2_requestbuffers *rb);
+int vpu_v4l2_ioctl_create_bufs(struct file *file, void *priv, struct v4l2_create_buffers *create);
+int vpu_v4l2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf);
+int vpu_v4l2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf);
+int vpu_v4l2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type type);
+int vpu_v4l2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type type);
+
+const struct vpu_format *vpu_try_fmt_common(struct vpu_inst *inst, struct v4l2_format *f);
+int vpu_process_output_buffer(struct vpu_inst *inst);
+int vpu_process_capture_buffer(struct vpu_inst *inst);
+struct vb2_v4l2_buffer *vpu_find_buf_by_sequence(struct vpu_inst *inst, u32 type, u32 sequence);
+struct vb2_v4l2_buffer *vpu_find_buf_by_idx(struct vpu_inst *inst, u32 type, u32 idx);
+void vpu_v4l2_set_error(struct vpu_inst *inst);
+int vpu_notify_eos(struct vpu_inst *inst);
+int vpu_notify_source_change(struct vpu_inst *inst);
+int vpu_notify_skip(struct vpu_inst *inst);
+int vpu_notify_codec_error(struct vpu_inst *inst);
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
+#endif
-- 
2.31.1


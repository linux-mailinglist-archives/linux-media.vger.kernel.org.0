Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7980A42BA43
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 10:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbhJMIai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 04:30:38 -0400
Received: from mail-eopbgr80043.outbound.protection.outlook.com ([40.107.8.43]:42126
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238479AbhJMIag (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 04:30:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMFr2xXBnBFopXIw81Guns/f3wL4HxQIPuanMkLnROstv99V2Mn8gts0d7dSuS2lfZ/j1FOpQFejNl2mwp6qP3qAH53NZJGpm/6/Ani4UzDpEX/GvmHTgcJoV5a8kPPR7Wx77Vx0BtLd3ijHzwi7lUuT7uHHEs39JiH/BgYNeVm0gGM6C5GwyC4HMQeD7l4AKPXvbj2ZGxs5rI10Y7pLCVaf30TaNxk9drDk3z4kHR6BhhiurWbJk2Ve3DP2gyYjHvTJ7OiRk4qVPgfYvUQ+ZOEXB8LuhjoBA3oGBYtbpmmfRDd7FCv6yytqxyHJ28XjeCEi4RBP8plBwWGPhZ4OZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkA5BDzuVm3hGAYRVh5eL4H4ij1Lxg88124qDM58R4w=;
 b=UP7lVKKdGa1I1paV+ia5cZ75+Ax2cyTav7iJ6jCDMh6KNbLm284GM9ifUK/bGX+B4bhx6gdptaO8l9PtbUYnH/4YH9S+9FZ76xeTEQztvFRZOPDCOm6rWqMXbbJ65B19+c1Fsf2fyfoLnDs1SeG7/aVvCgMeJxIfSQM3a531ThYzRjzuSnf+0DjVLv3m2FuVKNeZ9oWhnYMkQ4NU+dh9KvYKgeOsPPCe/SRk79+X+Iwk+ILMsnOFNc9mx6kzxOXsvKJu2SXKPqtN7X7khYSdqVCuAYSDCtWSbyX6korh4nSO6L5bjSOa1UvTk9ImDeTx7mw/72uAr3NkV13rFKQx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkA5BDzuVm3hGAYRVh5eL4H4ij1Lxg88124qDM58R4w=;
 b=pBrks1nStvPs5SNmQRKaqSnUlEyoQEIv3LquGFAP+0i/78ziCKmIrfaACr+SAr5LztEz7grlOVpUQ6DOKN62XU5MBfNZ8aYhEOusQw3m008+MpsmampO9zoBnmVwNQ6i0oNnokuksU+wsnff9CKzwBPQR9gliByCn3HFKm1VDRQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4789.eurprd04.prod.outlook.com (2603:10a6:20b:7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Wed, 13 Oct
 2021 08:28:31 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 08:28:31 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 02/13] media:Add nv12mt_8l128 and nv12mt_10be_8l128 video format.
Date:   Wed, 13 Oct 2021 16:27:18 +0800
Message-Id: <c3a4c996df86e4541377b72abbd80e55f64295c0.1634095309.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1634095309.git.ming.qian@nxp.com>
References: <cover.1634095309.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0121.apcprd03.prod.outlook.com
 (2603:1096:4:91::25) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR03CA0121.apcprd03.prod.outlook.com (2603:1096:4:91::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.12 via Frontend Transport; Wed, 13 Oct 2021 08:28:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a49822a-09d0-4ad7-7203-08d98e23709e
X-MS-TrafficTypeDiagnostic: AM6PR04MB4789:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB47899B74320A5D052A8FE9B3E7B79@AM6PR04MB4789.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sCKa5ad5OZ7BfWIsGziDyEAU1yPJmnohl364CnvHrJl99PCtwMreorT5/l2P8s5QXqONjbgqwF2fCsb2iKmERjYGjdDTmJGZtBXBdqdQEiQ2xjqGuy4E86apzJdQJtL0bHX/mxjT+0eEqQwscVvYuO/A9XcTo8r7TMXNbDFaUKT8WZSPRmezrpYJzYaJ4BtOOyn0jSWFE54dJLwihzjCA1nZ8DhnynbD7OM7FBp/SL4qt9FMTQSBqUHp2dctXjDPwLPurPjB2nSp6+OWhfeK4X+/uy4Kfwoyht5F2V11iJuv0sf6PIozqPjaSlEOLM2u8y9eEBCxHYAQxXB6oX6RhJLXm8bgG7X+6r6xnqphWcKkEid9eaXnX/nXm6Ahj0I3x52NQyJHfRnWSbj30yJY/KIfDDgSN0pvouwRtOPByl+3DRP+Ch1pxM3gfKtEin0FKvfkPWEax79trEHOpN7UsGUQO8yxtKczZkgYgZ11YKubqehzrfvf8Qkgv3clHKuQyhGuKmadBTlR63+gUEc4IgEA3bMa0nJA99BKmgkm1/gRPkykuKwuFRvFgKDPDIH+IzuBmGk6GAWq885rHFVpp2IaCsTRUG3wPiIi6wpk+hU5mR4ibCrroaavQEONPFoRApaBpXnmhvjs0Dz6Bg7oaP40tTV7dnv+RDpi/cEmEiIPS09sx+UYO5jTQhu6jvX5XEkm6jmKV5SWvagOrSeqppiGvAPavtpD1UHVzhhZ5SMgrMSy0m656VzdCD9oUyQ985vQh/4sBF8971dAeEFfAPDo7t/eqPmgXi81igcrXMs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(36756003)(186003)(966005)(2616005)(66556008)(66946007)(26005)(956004)(66476007)(6486002)(44832011)(316002)(7696005)(86362001)(6666004)(508600001)(52116002)(8676002)(4326008)(38100700002)(5660300002)(7416002)(38350700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ePTDZka51NYwL5KM9dZMI1vEZS3cSNGx3CAVe4bgUcZp+UXlTOmKlU0i/iGH?=
 =?us-ascii?Q?tFkXwdPnM5kX7yPzgNmSv3H+mnTYjnowb7FDsr9daKI/ZoES3S+KzZ4xQjf6?=
 =?us-ascii?Q?cP2UMWKUEP1uAqKriqvw+so8PsoUDGXpUZN/75pvxgrtV3CCh4dz3Cu5l7QQ?=
 =?us-ascii?Q?pvYVamDStiwVwKtvgDM2zOiQEJQD3jo3PykYVAiuveqIeD654p6AeKRNLK/n?=
 =?us-ascii?Q?ELsxU8bY6foIXaBwJ1Je3OZEOAvWEN8cgnbp34zdAEKdgAzW6GYT9Cg8YhfD?=
 =?us-ascii?Q?XoloYK+dHWNSZza6iL/BoQki2II2sj43pwJLGvJvwEtkd/EV+GFgtLZ4UTNV?=
 =?us-ascii?Q?PkSBCw9Rp89k4Ij9od5PDDwMvfDUvAkdJs1+eyH/Xx7jMPWAo/rMjg531NdD?=
 =?us-ascii?Q?e8N61LuF8bCOH4gDwIRtjs20PzZiVSE2OE7hveyPkDFXgsu3nizaO/Ibb/F1?=
 =?us-ascii?Q?Lls4GpJnlL21KR/peF2ewdtSq2Mz7xtDEZntEz1ggtfn2WiYnnrn5Y4DoeZ2?=
 =?us-ascii?Q?1oU5gYEIp2SYlIiaiyPmEW5pZoLc5wzQlUl/1IaXXlaAcuZwBv9n1ihd0pZz?=
 =?us-ascii?Q?9aba1L9h/yCyqYztbXjEt0neJJ3FEheVRW0HgZdncfp3vzU3eb1D/77CtrnO?=
 =?us-ascii?Q?G94HAMnwNx4IS6/1BnatHdnUFsLS8uqtnNIBt8Ac7LO8KolYz6RKLtFSkxGn?=
 =?us-ascii?Q?5ibAmZ5l372IX6RfpLcGBLq22vasSs5nlCqZVmt/k9uKSW5RdEzxmhSQNE7R?=
 =?us-ascii?Q?R55YMZK/tWmMryTsWbvph0tcIx8HHU/cG/JTVpNN2l27YAnRqqD/N4lI4jYp?=
 =?us-ascii?Q?GZxbQEleQrjLPRngn/mtsIGxf3B24mv0J/DYaWQsBvFX0H5l/B6MvY8UU1Ta?=
 =?us-ascii?Q?e8xe8UNxCdLptlLaHjJe69dmAfo56iH7PNKwv5BdudxNcgSCefqL2KejmGWa?=
 =?us-ascii?Q?KDk25CqyCZ4Msh1zVq1w1rkJ/DAEalUA0cXMoz+4S2UeH0EK7Uv1M8fWCsny?=
 =?us-ascii?Q?nC5ux6lBbxgX0yDl5V8TnXWJe8au1GKruEIJdMQE+cqEAoKMCGrki8jxmflC?=
 =?us-ascii?Q?2el9gqrWC29W6K0b6mj73lAtVKDsIbg/9GTJQplwGTU+8hcgUSMZGGjn062d?=
 =?us-ascii?Q?j85L31oKQcYTaMc73CP98Bnqp4M19FGXXwMQv340SYbSTjaHVgoLmXJTJ/K6?=
 =?us-ascii?Q?5PnuH8BBobjt0OQ5VuO4mvnh1vfOLHTdIr8J/DDsfxqlRwYIB9WauX5YDZI3?=
 =?us-ascii?Q?RjLtV+Y3MIc6wKdPoqsvcREn8kpbJiLws7dM3Rv73PV4IO6Qcn5QGkQShNgY?=
 =?us-ascii?Q?cl9+VpPRLD9aX99PUVBFCHJO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a49822a-09d0-4ad7-7203-08d98e23709e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:28:31.6985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8d6myCjPHntH1uwnPkIQyYDqPSHZUXPPsIqDSnvMxUMdUXZI2zE88xokFFSl3bABQtAJswFZ1fbU7pAT0fTlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4789
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

nv12mt_8l128 is 8-bit tiled nv12 format used by amphion decoder.
nv12mt_10be_8l128 is 10-bit tiled format used by amphion decoder.
The tile size is 8x128

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst | 15 +++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c              |  2 ++
 include/uapi/linux/videodev2.h                    |  2 ++
 3 files changed, 19 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 3a09d93d405b..fc3baa2753ab 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -257,6 +257,8 @@ of the luma plane.
 .. _V4L2-PIX-FMT-NV12-4L4:
 .. _V4L2-PIX-FMT-NV12-16L16:
 .. _V4L2-PIX-FMT-NV12-32L32:
+.. _V4L2_PIX_FMT_NV12MT_8L128:
+.. _V4L2_PIX_FMT_NV12MT_10BE_8L128:
 
 Tiled NV12
 ----------
@@ -296,6 +298,19 @@ tiles linearly in memory. The line stride and image height must be
 aligned to a multiple of 32. The layouts of the luma and chroma planes are
 identical.
 
+``V4L2_PIX_FMT_NV12MT_8L128`` is similar to ``V4L2_PIX_FMT_NV12M`` but stores
+pixel in 2D 8x128 tiles, and stores tiles linearly in memory.
+The image height must be aligned to a multiple of 128.
+The layouts of the luma and chroma planes are identical.
+
+``V4L2_PIX_FMT_NV12MT_10BE_8L128`` is similar to ``V4L2_PIX_FMT_NV12M`` but stores
+10 bits pixel in 2D 8x128 tiles, and stores tiles linearly in memory.
+the data is arranged at the big end.
+The image height must be aligned to a multiple of 128.
+The layouts of the luma and chroma planes are identical.
+Note the tile size is 8bytes multiplied by 128 bytes,
+it means that the low bits and high bits of one pixel may be in differnt tiles.
+
 .. _nv12mt:
 
 .. kernel-figure:: nv12mt.svg
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 31d0109ce5a8..4c6480fa29e4 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1388,6 +1388,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
+	case V4L2_PIX_FMT_NV12MT_8L128:	descr = "NV12M (8x128 Linear)"; break;
+	case V4L2_PIX_FMT_NV12MT_10BE_8L128:	descr = "NV12M 10BE(8x128 Linear)"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index f118fe7a9f58..9443c3109928 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -632,6 +632,8 @@ struct v4l2_pix_format {
 /* Tiled YUV formats, non contiguous planes */
 #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 64x32 tiles */
 #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
+#define V4L2_PIX_FMT_NV12MT_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
+#define V4L2_PIX_FMT_NV12MT_10BE_8L128 v4l2_fourcc('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
 
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
-- 
2.33.0


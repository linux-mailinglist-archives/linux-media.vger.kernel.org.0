Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B69144AA32
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 10:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244743AbhKIJMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 04:12:51 -0500
Received: from mail-eopbgr140089.outbound.protection.outlook.com ([40.107.14.89]:37014
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244724AbhKIJMk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 04:12:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRim/Plv9mxzUDvwkmCS3I4Uf9wzWfNPgqw/9yb++YBF3bfV+YvNiwseRIFq23gX2W+b3VoqitdBPxuOos18ANKLWyXFfhwOhvXCCKJ+xhtf32uGKx1UeJB45g6RMDJuPAFpVoBSb9VCoZVTgB3Pwnn1MDTg7UWVZpe/Pov81lXd+jD9TXSqvWwzchfr72ML6V7vb78l7tFnQrCdvIPO04oSynAHOc3PxCuHwK8Rrn5Bmd/DlyfhoG9jVjhEPlT4VxZ4LOboS8/1l5DysShdBEVIufsjh+mqPufLHVaPy3VMjwAk4Rf6xRBT0bxnqbJc02LJNedqNOC8Lrb48kcO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkA5BDzuVm3hGAYRVh5eL4H4ij1Lxg88124qDM58R4w=;
 b=jIMC23inDsSUJS8vDl9Cj0fCvlTXxBh8XyWmc6PpoZkw/fiknMgLSbiHytNi7ftHDjin7MipXPeP2fX35WF6HJtUojpJALH/1QpC1661SPAF2QcyVOTxr5YAPd4UHhlrc5J3eVmhJdPKJ24gt9Pzg/13ye9AXZy2k3W3y4cVL0chsgBunwmNY4x6z/Pz0JD7nwjps4v17qMR5vygy8Pcm9opblVtFRBdkfDEJgGf2nWayhSD7rWzR+1dIScVPHdKKwwgawRP9LyhLKr6WurgUukMBtdVFT6nwDgiP0PrLGwZE8/NbjjUqk8tY4XwtyJf3DH6/I+jZHFqxTxZCgS5LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkA5BDzuVm3hGAYRVh5eL4H4ij1Lxg88124qDM58R4w=;
 b=Mi3XntGYOy+kvNYQ4fXWLPLPD5W/VGp36ExrTfGfGgd9+qUuWk1Wy4nijrQ3nnMKABYqtzd22+11CiCWKgdz37SUW+aAAfb43KUzm3VxHZ9JyM0wcy1xKsfyrENfVyWX7yZ4m8jG9LQagxSzQ8Ax8w7r89/Jr6Xjp2OjIW7rPI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB8278.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 9 Nov
 2021 09:09:53 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:09:53 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 02/13] media:Add nv12mt_8l128 and nv12mt_10be_8l128 video format.
Date:   Tue,  9 Nov 2021 17:09:01 +0800
Message-Id: <3db72cf274ff259ced97a006c81d5feaa8bf11c1.1636445575.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1636445575.git.ming.qian@nxp.com>
References: <cover.1636445575.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend Transport; Tue, 9 Nov 2021 09:09:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be323a20-ecf4-42f2-3474-08d9a360b0ce
X-MS-TrafficTypeDiagnostic: AS8PR04MB8278:
X-Microsoft-Antispam-PRVS: <AS8PR04MB8278D33990A48D10C8321AA6E7929@AS8PR04MB8278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DzvHpPpSUlUtK+C3aoBEvTDGpXeT7q0XpSb/6P9QTFCclVlUKM/zFZaMDDgxgvXcRPvU8L2J2TpCPu251HJHFFRdeBjwSV23/Bru/nVe1ci15xsQs5vOgWScyG/40dgSFcMbmQkP7RIVVysvU1LKy7wHUCjX+3ybI2wDzeebrlMeDAFDVOz/wcPVY8q9PuhkUQLXi4XYbq2GPQom6mTTJATpyxzBobrsHw09ZDnRRAJxEnUQeZORx0IKKTW/E5VI8GqOsk0BP7zJwlNa4cj97Rd2y5UgGd85rq2irjt/2bNKhiAhBPl23h3mqPykc6c3LRf6qOrtc/mRTGTYZEAw8ET0y5TsLBMRcWMVMOdQJv5k7zxOMmMxfoFAh3ny9BijSP2x5QzSbTH0azmw3UtEinAfsuJlhTZHkPJmPxyqnyDugny+EVP/Rfe0C7LcbP2GMnzNWNDpUGjG2JWAcrNYLG4IQtJgLuW1mC6KzGp5CyGHBDL2JR2ExZXfVhzBg90WPsDdOExH7TKRq+3ujKeyR2U6Ovue3JC8lmVauEGXUd5V+cO2TneNTVubZ7oPvCYqDK84jhPubFt2mYY4BOlEBmaewrPufkGAj4vbAZLvP5BxezeqlPfJ2TNs5cQrzuuhbuTm2tMCbddbF0Y4CDMgtQA7BsZvz9PZ8mmwiJ4+KaBdgHovJJIdDXzTFpW9r+Ljjx9bBiS2KtYQb2xwD+iOfCIdkwJvCXLlEj8af0h/c3FK4yl+0aHhZOgL0IAmVTSKtWvV4vBbezcIvjI2sCZTlxeCZg8Z5dhLhIzI0j3hhs4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(86362001)(508600001)(6666004)(38100700002)(6486002)(956004)(4326008)(966005)(44832011)(5660300002)(26005)(316002)(7696005)(52116002)(38350700002)(2906002)(186003)(8936002)(36756003)(66476007)(66556008)(8676002)(7416002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q/Y2e39C9g1JpkhRgn2VFoqObZLPFOdiXFvpgySSYVufrnmBTchWD3WkKbNT?=
 =?us-ascii?Q?fm5pVrwPmzbXK7lHEZxTa1JszigqD274d1T9Knuu3f4kf9Ue2mLMFLp5pSSk?=
 =?us-ascii?Q?07tB2hywZLp1crV7RwTlwVbdhyWVnfBdvmb97YzWBnOcp4zZXMXSD4NfagXO?=
 =?us-ascii?Q?HzMc+6RPJx0LNyzEBJhwepEv/jKWotxVJa/v7Ta/mgK7NBgeLPbrH56QQo+n?=
 =?us-ascii?Q?hmvnNfUdZy8h9QF5vbm7MxUeaEmPNTtfttlB4rusv8raOZ29iZ20D1Dk0T/8?=
 =?us-ascii?Q?dYdmZYBPJ6Iw/+U8c9rFFY0uXdCgKWZ1Q73nrdLf+CGK7DSZgQ64PJjt6p5C?=
 =?us-ascii?Q?0Gxi42qnwWsMmM++6C0wsKxLgXBcFRUYq1fRzANmFCLaq5BwktfXL2YHJZDZ?=
 =?us-ascii?Q?RnRlS2aYGThH/gfFxIxeO0mQoS9uf8xWY5cKdUGRIqZ4icyh+Y7+857dnsdP?=
 =?us-ascii?Q?Rf7KI4nn8xbWBQFa4zG+ISHH+I5wa6qcj4Qm1mKcLlc7G/ifO7r4Y6EB6s+x?=
 =?us-ascii?Q?kVGhK4uo+A1Doq7PvOE2Tg/+dZI08w0wyywzOTCbOlvOVsnvUFFrmOpSpdMu?=
 =?us-ascii?Q?idJff4YBXfdW102P/ajcjX3hIRM+VkOEKKZl3Uu0wQJ9d0iwvkEmSCDT3bNa?=
 =?us-ascii?Q?auGuGKC+rKQmJFEQn4rHgf6Abe3LucD95+yfVjeDrR3hpv0BA3XmQUzch1b8?=
 =?us-ascii?Q?mDM8JEixB+ZcT/0egWi8QFbleA+Kt26AwKy9zq+6pXuNePCj7NERBdsmBKmS?=
 =?us-ascii?Q?veSqZE2yvcuQiJVAqrXxMn0abBfMeoBvtEpspVvFMSRta5GLxX0bnWM4B/ae?=
 =?us-ascii?Q?olvETqmcG/68mIFo8pOmvx5WMG1FKPx5tTHoQTFg+JGgP4dHG5vNmkFKK/jG?=
 =?us-ascii?Q?JXK2ENS6aPuC2SIHMalMAfmpqSLQeGNWtCUwY+rltXBsn6MtYq6Bl+7GwLko?=
 =?us-ascii?Q?U2bHSG459+q/oJcM8pIWLEpaa+VlQZgduHv2k1FYcNN8jAKy7n0WAZYPNkZp?=
 =?us-ascii?Q?4001gPKSzwEAhGYd3VLTgBd3v4Egx7tZ4k+8wQ7zQaTCBcgb5eT1NL/LXLCa?=
 =?us-ascii?Q?1eaxikuZlcMYHtpE9BC+KdJ2x+AcmRhODNZWeZfrU+qY38rVmywZM1DQ3ypB?=
 =?us-ascii?Q?d3VEq8yxPzdzhWYG39xkwb7WYgZtlYSGkMEEi74jQIraYe7eR/wpJk2oQO96?=
 =?us-ascii?Q?xK0cCheB88F3OrNWdURI98miE4swstKxucIjeV/IFkec7xQB6ynH78JATTre?=
 =?us-ascii?Q?ZxLGr06T/ilOXzdMKQBlLejzCLVTAOnT4gTta/6U1BnNXFmOULsc7Pwr3lbe?=
 =?us-ascii?Q?o6Q3ooY+ENJn5xlUt5P6XSe/70CRz/K2tjPSOo3E+KTQRtXV4liCerZ7d/ds?=
 =?us-ascii?Q?TzC1oFUN9aSrPO5bjfrdGF9wXLtMJdkw6mih0rYWmZqZaQZgBzCnfofRcDtK?=
 =?us-ascii?Q?IFYHIoikzzCBFjFoWj+F16IL+i1I2CCzTxQYzADCfSTgej/IC2RUtcVVMwGP?=
 =?us-ascii?Q?uO6osObJ0zQzibpFo2FngPrXDGXf27Q+DQB52Qi2umJYJvZg3UInHhCpMyi0?=
 =?us-ascii?Q?fv3MSv1QvXTbS/RGz67tSaNXVAcXw93wxR2un9x4EBOy5DqTYea+jGrYTuiN?=
 =?us-ascii?Q?4/WJJLjZkB/ZWyqIOlYdolk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be323a20-ecf4-42f2-3474-08d9a360b0ce
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:09:53.0286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpcL2CKl3DnZY4gKNzVavERrWW8sPy+Bu6v0kXWoCUmYTk20UDYBNCWFgzHutQ0STmDFragfsCbI09mwyrxTmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8278
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


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1CAC3E8C1D
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 10:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236312AbhHKIoi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 04:44:38 -0400
Received: from mail-am6eur05on2078.outbound.protection.outlook.com ([40.107.22.78]:49598
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235282AbhHKIoc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 04:44:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoDZjQ3g0t8XdP4MnxDxbY+Ic8fvZhHGKJPko8Tzc9xG8pmETGogc+ufNB5hZnv6bVWWtpaMCAKLiA/c+Pn4g5iNKHsAWF1JIHVGT9bkarIWtgYA65klyOKW2Dw7gYheKHyEmYMUorvDKxApIThN3EeKWcLXvywOkTS8VObpDQ0ORsdixX2sSPdyi6uqAI0tLoKw1+1djFdfhGJSwF2MdIlRQnRoF6AtVBRQHRflDnHEGOfrYBThOhX87CfhnxvlToUVQMQJn0gL7N4KF2v8++3lQed3FAjBBQ2l/SwMbpmcBlowhWtd8DZeu5z2XcZptrDyjRtfzxZWv8q8+ME2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhxRUPnEwlV4CgYdBTvE2xDk5TIbD3YkypRNoc0XgM4=;
 b=PiteA9zbmzr0o7Eu1OW4ewOAmnNVeMlEG5DhpkbQKQptKayirGrDQnDzLgkbuiME5Pw48yUKnuqE55faCrV5fZ4WpNta8HelMjtd0Zv7/08YqhGkmF2ny92EQG+QpkpMCj/bMLm1D4DOHrsghF5LoVSaDkC3hdaPIs5OHOVEhjn5RfDJXYkmjRCL+I+nqvJbDdN1915HEJr8PLD54omta2Sl7LCKBJ5PUAqyE1FxZ60pnq8feJOFjGmoGCa0q09PKnuRS/ykB/jTJddZ3iz1FJ6ZKA2jBQBzxYb/wgn3qMqZLP43OA14j8fr2uduLcSRIK1I4EGCVR/oCCBxWb0o5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhxRUPnEwlV4CgYdBTvE2xDk5TIbD3YkypRNoc0XgM4=;
 b=ZKkmfMXn07nt9RD9SL1j8pIkjekvuZyi8T91unlhSjpdAwHF6SBei6K1MNhaWq2WyYSRGcdZ17DQOWaMjB03kw7Y58WIL/bxb7DlFPwaqr8MysRbTbn2Xr5f5wAt2nHHtjNG3rvyfyRo3AxVqyBZU4uFuOanB7VVtvvW5phPEPw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB5126.eurprd04.prod.outlook.com (2603:10a6:20b:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 08:44:05 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384%6]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 08:44:05 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 02/14] media:Add nt8 and nt10 video format.
Date:   Wed, 11 Aug 2021 16:42:58 +0800
Message-Id: <981eee1270fb47658f7821d59525ff4c53c30644.1628671163.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628671163.git.ming.qian@nxp.com>
References: <cover.1628671163.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.4 via Frontend Transport; Wed, 11 Aug 2021 08:44:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e10345b6-31ed-4ff8-aee8-08d95ca42cfb
X-MS-TrafficTypeDiagnostic: AM6PR04MB5126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5126EABD2062386CCD4B61E4E7F89@AM6PR04MB5126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NXeqF3C+i+E+Jdhg1pBV2A9u2YvEPF7GnsjP4lBHZlX3dx6QAA+LDZHjl+3cMdTaoB0HsthLbjkY9diNmjLWkZIPt3tB+NI/7bS5J2Gf2x88dRmjfU50d1vAXs0BX324UjjWRJN6ZLId35u2w99Nis88dQxCw+28kX0uzV6kiObxS3yL4eXwNP5cT0OF5Kj+nIPLbjdIzbMRpICnFHB/G6NgZQ1p7JWH3eA0kCVUNqQXRdODin2XQF1rbRy8CGHLDhMx319SK4gLQ6+xaGfJHYmO+AEki/4+qPgWd6tsjdwxsF/t8xBtgTGtZL974xEQVEDaqX+flGFo0xa3xSYkfd66jVqkJhhatIF/i2fupKJFK5jUJo4QLMqsPzfguvwy9GO4FuK/zcmw+937IZeVHeGfsvjc6Xkn+Sr7+q4PXURw10HZagEmk3udX+rKSf6LXsh0kLbA/ut4vBBwSa8F3G8xp5J6z0XfcbXoyKIgvISTqWqE8UC3roSXdqyCZe3Xxxy5QZCDfL9GEAWyrA7SXiaUcJE2eD+vD2Ta0aP9NemSlA8v90ISoVK0ItXyRoO1W1bklPX0MX1kLs40jIc7hRNji4YNr0529JVi9wwwDoG5fuNKDifbEhjmM6s12AHxOhpG1f6i0Qs2qV+mbJuoRmi+wlEpQTMTU9vN0FAUszhcE+vFe9n03tlbxl9usd/wfOy1npDr1/uWfydjcp11c7G7z9yZaKLJ4NeIvpqPDmylFwOt9wDTGOrS8ZlxE74No/WPDLIDLKyViu2hQmV5KzoOHQktX7EzDhuYujjMVRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(8676002)(4326008)(38100700002)(2906002)(6486002)(966005)(86362001)(6666004)(38350700002)(8936002)(478600001)(186003)(36756003)(316002)(66476007)(26005)(44832011)(2616005)(66946007)(7696005)(66556008)(5660300002)(83380400001)(7416002)(52116002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W3m54KMQRe2fbQ6Gw59/ho6zIXJjatz8UCQ13NxQi4EAic6AUlYNLpaykdT/?=
 =?us-ascii?Q?4d4nlprTpi5dShNQdpt0/KjtkI/o+KDO3OkDzIjp7kILg3YmX4nuaYc1ygHm?=
 =?us-ascii?Q?7oTdCemF+NLk7y4S8fq/3ViJNqTYZqRDfEjKw7tNQepkZBp3aEsOBSSpidIW?=
 =?us-ascii?Q?V533GbVdVQhiqne7730y49cQkLQ5Cxv0Pfcwc9iU0B8/z84dXhopyNxS71oH?=
 =?us-ascii?Q?LWyFwLAIwISkgp16U0Tg1JFnr3jIXFAKsAoj9LcllYYBbXB8GMGu8WojNJFd?=
 =?us-ascii?Q?NsKeQOkwVWOKgzxVywZyHBA5gevZdFNJlcPL5Bm5I4p3KgzwTVXmbIaj17Ml?=
 =?us-ascii?Q?9fYNxGJ70smSavIWvKP0GcFMWtbuwmIstS54TMenJEIfrg6yf5lXNRHDxr1O?=
 =?us-ascii?Q?qCdgv2zt2PhVoWK/eE3/h/9XpcPT6YwUpZLurCR/8uIBKWRxyGS6S8dOryZ8?=
 =?us-ascii?Q?HIXZ9Yo9qSteC69KILZC9uSqDiEm5H8vE+ROeRYajkrm16sWC6wK7FSpcP9n?=
 =?us-ascii?Q?bCgpC3ZcHeeIJf2btdXc7G4161e1uUnlteOC/hzOhlBXhyf1LxE0a3PNphr2?=
 =?us-ascii?Q?3txinPMAjYJfffYfw4RatxNyKvGeHCAtyIcr6I7ywOeWldxq6NgJfhz4YU3g?=
 =?us-ascii?Q?nFrf2diqtSpU6BgmtaYOEMa4oRO6qeoi28tGGgP863Ni5E4tpJlHNY6Fc0RX?=
 =?us-ascii?Q?y85TOiUq6DYJ84MuFiIEpoDi4RhmpLDbXFR+40aH2TFOwjOyZG3grSK9XsHA?=
 =?us-ascii?Q?uFM2Q1erxEitXoFzZ7kZWW80Sy+AsmV0I5/5JLtxD/RBL3kC7/roqWsjupPn?=
 =?us-ascii?Q?jAEYZWx1Nzr2YBZJBzYlO6rdR85r5LitF2YW5KrMTYmdjHImgDh46bZVN2bW?=
 =?us-ascii?Q?7YiZzqnsW59jAL/LIbLj14x2TsVIaLwfXw79J0ondNAMGaaEhGkWBTKR3zXT?=
 =?us-ascii?Q?A2yOAn4nScGYdp9e/M0TskP6KHvS68ZA2q9UiV88IXQcmjCQAVAvfD55+jy4?=
 =?us-ascii?Q?1aArkYRGy0gHQ9vqNrf0lkNnnvBIxO/GIpTzV34+neUjcyh8O3yNWFyucLtH?=
 =?us-ascii?Q?jpm+XNd6y6WDJMxtgJBrazydQZMVUhI9TQscX+w/98WgrtqjWbh1yLmEBIkZ?=
 =?us-ascii?Q?RD6ZiyZ5HzxDRaIEy7UmGNAaPWik3FNdV6naf6KGRedO6L0QO91hjX+sA6Rz?=
 =?us-ascii?Q?9AROqHFBShbKnyx/gkv592evRB+uEkueAqI5ibzwYPmr/zq0KqkgFL8Ba+52?=
 =?us-ascii?Q?VLvWm7dlSqk7FKf/T0FS4be1TWlufHPQscod/4oRTBe9qaL6BpzM+2LKtCyq?=
 =?us-ascii?Q?NOt8WP4wiuLDXE199zr9N7Y3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e10345b6-31ed-4ff8-aee8-08d95ca42cfb
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 08:44:05.0448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gztnfpGUd0Y6V2z91Cov/48k+ZnNBDZtLS0In3LKvaAnb4Pd1eFx5Z9K9eHPmL7NkqSYItF3+8mkjZ502+aW7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5126
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

NT8 is 8-bit tiled nv12 format used by amphion decoder.
NT10 is 10-bit tiled format used by amphion decoder.
The tile size is 8x128

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst | 15 +++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c              |  2 ++
 include/uapi/linux/videodev2.h                    |  4 ++++
 3 files changed, 21 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 090c091affd2..ce3419d95691 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -254,6 +254,8 @@ of the luma plane.
 
 .. _V4L2-PIX-FMT-NV12MT:
 .. _V4L2-PIX-FMT-NV12MT-16X16:
+.. _V4L2_PIX_FMT_NV12_8L128:
+.. _V4L2_PIX_FMT_NV12_10BE_8L128:
 
 NV12MT and MV12MT_16X16
 -----------------------
@@ -276,6 +278,19 @@ If the vertical resolution is an odd number of macroblocks, the last row of
 macroblocks is stored in linear order. The layouts of the luma and chroma
 planes are identical.
 
+``V4L2_PIX_FMT_NV12_8L128`` stores pixel in 2D 8x128 tiles, and stores
+tiles linearly in memory. The line stride must be aligned to a multiple of 256.
+The image height must be aligned to a multiple of 128. The layouts of the
+luma and chroma planes are identical.
+
+``V4L2_PIX_FMT_NV12_10BE_8L128`` stores 10 bits pixel in 2D 8x128 tiles,
+and stores tiles linearly in memory. the data is arranged at the big end.
+The line stride must be aligned to a multiple of 256 bytes.  The image
+height must be aligned to a multiple of 128.  The layouts of the luma
+and chroma planes are identical. Note the tile size is 8bytes multiplied
+by 128 bytes, it means that the low bits and high bits of one pixel
+may be in differnt tiles.
+
 .. _nv12mt:
 
 .. kernel-figure:: nv12mt.svg
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 05d5db3d85e5..22f97a1cfbeb 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1367,6 +1367,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
+	case V4L2_PIX_FMT_NV12_8L128:		descr = "Y/CbCr 4:2:0 (8x128 Linear)"; break;
+	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "Y/CbCr 4:2:0 10BE(8x128 Linear)"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9260791b8438..167c0e40ec06 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -627,6 +627,10 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_YUV444M v4l2_fourcc('Y', 'M', '2', '4') /* 24  YUV444 planar */
 #define V4L2_PIX_FMT_YVU444M v4l2_fourcc('Y', 'M', '4', '2') /* 24  YVU444 planar */
 
+/* Tiled YUV formats */
+#define V4L2_PIX_FMT_NV12_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
+#define V4L2_PIX_FMT_NV12_10BE_8L128 v4l2_fourcc('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
+
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
 #define V4L2_PIX_FMT_SGBRG8  v4l2_fourcc('G', 'B', 'R', 'G') /*  8  GBGB.. RGRG.. */
-- 
2.32.0


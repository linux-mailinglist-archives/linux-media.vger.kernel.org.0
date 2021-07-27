Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD4D3D6C7E
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 05:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234830AbhG0ClM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 22:41:12 -0400
Received: from mail-eopbgr50075.outbound.protection.outlook.com ([40.107.5.75]:46830
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234708AbhG0ClL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 22:41:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVSnkBS//YGUmocW6SXuGXZ5ZFCBS2As21CiEZpW6wMTETEOP983GW0GYdBM8Gtm46BvRBRZ9WEBLoOQoy13cKdusoeHAuP+EnhB+8DmXj4urgFKvEU1uzeXLJOdYf9KZM9n7vMr/ivvNgnkDUPTdCeEvGyVO/cplczrtozud3ohBU/tBlHiPnhMqgkiv7S/JVPjbhkqztPWbj118sTRnBSUKFQO3HLq8A1xT9YMEuVyv/5Z2ekpwp1OrfjcwR/fGA6dv8T2mplwdoXDbRX61hKU+NnbEeRlo/J3do1NO+xYEHyMNuQZnlGVsP628ecMmfCxZvHHwV+SVb5nBWXtuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIb9XscagTatieP261BYNkfJ1+4Ez0zJlZwjQhdGrr8=;
 b=ZwfQZJsqFvrCVavkWa5pvrUXDZECqeb8ujKCh834EzKCdMLwzB+UaqY5AbvThW/uDwsZYUI/5lJtGBXb3bO6DIZJmg1HeWiYDIj5iT9tOdJjolInvs2V9jJ2xLEuLI/tYySutQia0aJRoHnGcdCLFwv6jVEGw/HCmse4gZSbjtpfn3CI85G7GVfBSgq+ms3FHDiiHsr6bU82za/aLErcMxuZgf3uUz8FKu4u3H3UUftnqAJwzTnqQK9maY244mDYW4AMn8HzFZbCjKWB+gqNNjfM0IHWkuAVobQAZ4CiVj3yvrWKMqX7odF/qig5zx+xl0kHLeBAz7UicCsgQyb6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIb9XscagTatieP261BYNkfJ1+4Ez0zJlZwjQhdGrr8=;
 b=biUBw0ZMRuU94RkWpSqyqc7WwNc4hZtqRf2CUNJo0FDtAqbexumi5R+/ZOw/oivfuj//4f+Hn10nUS4grD4cyy8pGLTM2llpCZBRQopL5Aj2m7fnr6OHtichiWvSvnFJLg9zfcoXDR4qXeSLoZQ1Vc82bHNIwDbj3a1wu/YSq9c=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2660.eurprd04.prod.outlook.com (2603:10a6:203:3a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 03:21:34 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 03:21:34 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 02/14] media:Add nt8 and nt10 video format.
Date:   Tue, 27 Jul 2021 11:20:45 +0800
Message-Id: <ee482c18fdaae121e3c9495d07b0f3eb1661e36e.1627353315.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1627353315.git.ming.qian@nxp.com>
References: <cover.1627353315.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 03:21:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2484d8c-d16a-492b-8949-08d950ada2f0
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2660500981A5A56EFAF2286EE7E99@AM5PR0401MB2660.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WGutr2C/KmJ5SG7b3u8nziJ9lkcUXorDPGicslL8yw2ojBB8rmtuNC6U7MqcgcMno71A90R1IkLm0pAcNwnGfG08x8AdTJKSE3CNX1gWqIzEvJFUhToZ9iQrQPZCGiQFxq8zm5uztgpvjP8pmT/Q33OI9TGwpkUA1PoVlL9K6/4cZUquFv60hKJy8SObG8JP3/cbBQdmbi71qXJ6bYJdNhE7itTIGBF0C4n0niFhl6XThSFZWD4bsFLsZk3lANOB/1DeY54s4TmVIMFi3tWncq15bAcnxaSlRlhLjBjnGBDcRCLNPrhrAGeHeFWmcsTWwXQaD/zaZ2vj7ZAi2XshRFGU+JjdODZjIYnEPd0eMW29tN7I2zQj+JGNi1mSpI+453zey6NIIreDRPL2yRW10yMmUwRpeX8wwEOYa/jzbHK6WFhk1PQSsqqIdExQXjk47aaCaUJrKjVAmm5Zx072BSas3Ne9HNxokXe002dVzjZ7OsPBIElh+49P6bAVSy28KL/FcAhPW/94kFh74mglyii17fD6FwquHb5LF4DKGTXkcl7oVBKM+yA0Wsfa5ziRSaVXl/CrrumLx3n1Ld/BZ9WEW+PJDMkLICPu66bWWcOont6s8J8glcdl7pIuw8UrFdvHDkOPdzZY/wX4MHyNFn0pCXkbzsS/sQVskAFvIojtT7cdK7eInvLiENmhw386akJpLM0JNZdAIbGsizMc8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(38100700002)(4326008)(7416002)(66556008)(38350700002)(6486002)(8676002)(956004)(186003)(2616005)(66476007)(52116002)(478600001)(7696005)(8936002)(44832011)(86362001)(5660300002)(316002)(6666004)(36756003)(2906002)(66946007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hKPQW1SsyFpVJrgC/X7WWLV7b7ZXZvPXcMAirYAdwdo1vbux6l/X6nivVo4t?=
 =?us-ascii?Q?rePT2hNULmAesWkhikT2V8WzSulfNSLQ3vYlLQfqbe1y17vrSzet0q2S+fDX?=
 =?us-ascii?Q?jlMunrwSdI6q4MpO/Oy45UA5gix/HHlE1j3zSCeyNbAqGLuSVeoBE8nnv+6Y?=
 =?us-ascii?Q?Wjqz5TQysIjEERg6n5rLYW+VYGK6y1Xm5njKZIr0ZwCMSj5ewkPgrINA2BU0?=
 =?us-ascii?Q?n7G0tGJiXFeg2B+GR78kt6RC0HRNpYM2lg/7RmKMKtlhYIPtydxGmTLRdnOm?=
 =?us-ascii?Q?80wRxInWx9fdvG+Ogg2yPbPN1IVLMch4Bc+NbuMZd809A8PIozNwm8aRlp7f?=
 =?us-ascii?Q?xytzg88NHM8bmsMxsLiP6uJUeEMr3oFomKCBckXpupS8L51J5H/rmzwaOiCX?=
 =?us-ascii?Q?8h2aTgTV4ywAzVeXb4OGG4y6/i6r5wQwTXqgE9l0/9J5w0IRZBXfNsFAuxVI?=
 =?us-ascii?Q?ipmV1eEHTNQyIfc8rXHikvWW3IueiGT19RvYVe4CY6H7J3fABNpv7HbLncnl?=
 =?us-ascii?Q?qIY/GyEVP36aR89X+9JiHPuxhjl8UMEJVL9iD/8zP3MVpoKY8FJiBsGKTtWN?=
 =?us-ascii?Q?8Ij1XnWiYG989eUv4Ki98i6fMunQdXM3hkmjkJvahcm/PdRXkLG3zvMLb/s+?=
 =?us-ascii?Q?Q6mILjGqKFiPsM57pc5XqggL34/V41vcHDY0RiSKWJYS1GZ1U891jIEGxKY5?=
 =?us-ascii?Q?Y2UQ+z6VHwjlKNL/LqVo/nQUH5oPYdiiHnF4oyqpsb8tNPJRBgq1iA9N0+XK?=
 =?us-ascii?Q?gUWFHiNSweD9iaiH2kr+IdGAZvjFafBkbiX9p0mILOzBtkzz669naaTbsXcc?=
 =?us-ascii?Q?Pz2lKnbYdCWRgQ00Xw67boQNPGT2K2MmjwZH112WDwrRL5XmsApFZq6Fr+09?=
 =?us-ascii?Q?Ikzgj+RZ+7w3yj+uv3eYzaCp4tg/H8GQwhY8bFs18cgLM7tBBdzXyU95AkhL?=
 =?us-ascii?Q?0IQJ+dTVwyEcqj981KD7YUrH8Du6OXLzqsTOXWoTtpuj2SneORRou0Te9Am1?=
 =?us-ascii?Q?P89qQsY+wjKkejUeY6jyS172ridtj81L37ypCbsdiE2mGFwXj4VZoRui8VkV?=
 =?us-ascii?Q?QLHch2dDnfimn1cFuEUuiy8182R7bFOU41yRzVFqjfjDoXt9J0ikVmZq8DTX?=
 =?us-ascii?Q?JksuR+zt91Zb8USdNbrUpvUwan+YS5pDayjXhsImedlFnkBpC1h2X8cUXqwe?=
 =?us-ascii?Q?jzrY2kj1Jh8gQS6qOSEAyOMDD2VAfVsxPz73DjmQGWvtM0IfgmFaNLlhwLWx?=
 =?us-ascii?Q?og1xlFmgVkiX5XqrFQxT+Y6athOT1eqVD7WzAvxchUZbXkl1EILMawbS6Sda?=
 =?us-ascii?Q?EtKVVxzNkX618KuOqVF2yhlB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2484d8c-d16a-492b-8949-08d950ada2f0
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 03:21:34.4432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSawhhEm+EMP4EylPG5yfUtKy54Jbj7EhX8Tmms/lFjgg9B1zbzvupjGWRZy27Uk6OC4JKDJ/N9FZ6AKymahIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2660
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
 .../userspace-api/media/v4l/pixfmt-reserved.rst   | 15 +++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c              |  2 ++
 include/uapi/linux/videodev2.h                    |  2 ++
 3 files changed, 19 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index c9231e18859b..2deae49210a7 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -256,3 +256,18 @@ please make a proposal on the linux-media mailing list.
 	of tiles, resulting in 32-aligned resolutions for the luminance plane
 	and 16-aligned resolutions for the chrominance plane (with 2x2
 	subsampling).
+    * .. _V4L2-PIX-FMT-NT8:
+
+      - ``V4L2_PIX_FMT_NT8``
+      - 'NA12'
+      - Two-planar NV12-based format used by the video engine found on Amphion decoder,
+    with 8x128 tiles for the luminance plane and chrominance plane.
+    The number of bytes in one luminance or chrominance row must be divisible by 256.
+    * .. _V4L2-PIX-FMT-NT10:
+
+      - ``V4L2_PIX_FMT_NT10``
+      - 'NT12'
+      - NT10 is a tiled YUV format with 10-bits per pixel with interleaved UV.
+    It's used by the video engine found on Amphion decoder,
+    with 8x128 tiles for the luminance plane and chrominance plane.
+    The number of bytes in one luminance or chrominance row must be divisible by 256.
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index eeff398fbdcc..34e6415e5722 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1402,6 +1402,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
 	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
+	case V4L2_PIX_FMT_NT8:		descr = "Amphion Tiled 8x128 NV12"; break;
+	case V4L2_PIX_FMT_NT10:		descr = "Amphion Tiled 8x128 10-bit"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 534eaa4d39bc..4836590a690c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -740,6 +740,8 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
 #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
+#define V4L2_PIX_FMT_NT8      v4l2_fourcc('N', 'A', '1', '2') /* Amphion Tiled 8x128 NV12 Format */
+#define V4L2_PIX_FMT_NT10     v4l2_fourcc('N', 'T', '1', '2') /* Amphion Tiled 8x128 10 bit Format */
 
 /* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
 #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
-- 
2.32.0


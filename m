Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5292A2356
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 04:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbgKBDKl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 22:10:41 -0500
Received: from mail-am6eur05on2083.outbound.protection.outlook.com ([40.107.22.83]:60192
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727883AbgKBDKk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 22:10:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/+BH2B5xOGN41WOrojweZOCi9IHfK60NvTcPbwgItndyh/txrcmk3QyIa2VkueSBiXaE/il4Y9aGJdpOo+iBlBzzk+G8FYow3Zp+4KhODrjf53gL/XKDOysARoyGRjrO0IebOSv1qOImg9NZL5x/sLEdTntAknNLua9+wMBuiijtbpswcxnR0DP2mPwVRYRm2aJQtU56YAavLGhFjexR1VwEg4oGERZI0NASI7s/tCUN2nO88krzulkRqr2k7re9Kr2QH7JVlFGSzqXE9CTc7n8Jc+YdegPXJIi5vWsr8dQzU0z6QRIsm+kJ1yijI0hay9SVhJaPETD4LweeHhD2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yMD4Wz4QFd+9EyF0WjHoRFqnk5QYX6Y0mzrwKzR/iI=;
 b=jk6hMCTSCb+bIENVgCfHDi/PH6xkw6jTyYSjSe7ONubShYPE4cTZCF/svqWxF9U+X17Fr8jwgdZDLE4Pc4QyWOJp/SjAS5LDrWJGTylzrvWdpvYWYRdD4hJUZ8V4v5j6Rr4bZ1VC1AZ4Wrt156aVLYZWGKQgUEekIVogs5e6QpBCp3K7ISjXDs1EsvyqHjB+HHXEqzVbspTaBwFofQFuwds8+pYQmnEgmJqJMbtdLtRiul2jjkj7R1v4b9C3ibpFQrehU3BXiKDDrnj7f4L35XUI4ASBMAntFJvqLQksiDvo0uEkJ7iHz/5ZqVup6BdrmqWAR2Y3XHADKySYsvUe1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yMD4Wz4QFd+9EyF0WjHoRFqnk5QYX6Y0mzrwKzR/iI=;
 b=WEysVUep0JR+ibZOcbuz92VXMHpHwaxpCINsDcFkcG5KXcyPWfkUZgbWivgJrZzdXJrTCViHNMFoTAvAd5bFSDEo0110r7OeZfw2odHbBnCnX2ONqKcZ5u9GY0DOqBrY3ioPylOseEBtf28w+jcyZWGkEEhVPYKynTuX58E2ttA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5173.eurprd04.prod.outlook.com (2603:10a6:20b:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 03:10:13 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 03:10:12 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v4 11/11] media: imx-jpeg: Use v4l2 jpeg helpers in mxc-jpeg
Date:   Mon,  2 Nov 2020 05:08:21 +0200
Message-Id: <20201102030821.3049-12-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.170.94]
X-ClientProxiedBy: AM0PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::33) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.170.94) by AM0PR06CA0128.eurprd06.prod.outlook.com (2603:10a6:208:ab::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 03:10:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2cae1702-4772-4b61-1aa1-08d87edcd02e
X-MS-TrafficTypeDiagnostic: AM6PR04MB5173:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5173075A67C7E109780906BACE100@AM6PR04MB5173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MG90xhXOZBTb4TaDtdarG4wwzAAMM+gOZb/0oqbYPKZlBOtzox3JeDoJyh4M22f8erULOh4iR8ZT4dZSNqJ0m9Nz2lu7WszhXrGaxAMYqhJV22FR3W+mzdk+YmonRf7cUlu1MZbbZIp2y/Yre/NE7PezlT0xjxHb7+cdGy6FNJ2HlC/rauQzROzPRVs59b1cmyAcqlRmzyKUbUCzi1ZnP9gi+cz9Xdbs8BPB8DU4svN4CYWkC5D7QJRZw2Nbub/CAIbZ8R5ZC24y8tFS6KHUDsWl8CLiFBGPC2vfXVWxEc2TA/Pjtm5z7ujRgk3uJo0sCUtN8JybY0mUCRstHdcFRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(5660300002)(478600001)(30864003)(86362001)(16526019)(186003)(8936002)(83380400001)(6512007)(6666004)(26005)(2906002)(6486002)(316002)(4326008)(66946007)(8676002)(52116002)(956004)(6506007)(1076003)(66476007)(2616005)(7416002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: voL5wha14p1qE69D4O+Ias60jihDkdb5hXXJhRu6VLQkP7FZkjRpHOUW3rKDf0HCWxOCWhjpxr6jGCFQCqg0kFCkJFVVpBJtgfFTO51Sen0ECR+qLJJaY43xJEZUj2TRSTdDuhGOs7irmpeu3fbaFZhdG+u4V0VOkAFMgs+WzkRM/trQsLkhtQz5in2w3s0t0ldRyT9bzYhuQsQD+37/fRw7k0K40WUTeRB3LdQWMMhm/AiCKs0OnM6cg+y7C+xEsniA2Mg7rLX/QqEzUvY1SHfwJIwrT61lWtzXmk2GfTXLGKTd7ajzCFF+Mj9Xj+FUlpJ2I8Hzf0p2LD1oqSdyrwFl40vE22bfktGCHVw+7WWgfopsAjt+lrKtyEr1k5euxqEDYbKEdvvR/7+GsKZu+etFvhObW0k9LXEOZgSWUHyhKa5stJRjrYqWC/n8XvtCV+8v/l8/rvsF+fseISOkOJbqtIsb0A08LMTKPYGQ+WCmgTwaBH8yGThp9ZZhqiw2uRyvOwvEz8NBXDzqBNBWCWtcAnESFf6IuDsJDOUoCjRkK3BrQ19n8pcw3H7X2YsKVyLrJUAv8QVnbVRooevlj672c5kUMjSb21JVr/Gjhs4rtQfPaUD+QhW718T2MYfQUro2qAjQYsVfMbVX65YuVA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cae1702-4772-4b61-1aa1-08d87edcd02e
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 03:10:12.5471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+6CRb8kkqmkzmPeb+dG560NNwobPOgwilOB5Tl7NEWBI5Kf70nvNAmaO93HxPXcmGc5yCYT+1/xZSDOr80czw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5173
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Use v4l2_jpeg_parse_header in mxc_jpeg_parse, remove the old
parsing way, which was duplicated in other jpeg drivers.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 drivers/media/platform/imx-jpeg/Kconfig    |   1 +
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 261 ++++++---------------
 drivers/media/platform/imx-jpeg/mxc-jpeg.h |  26 +-
 3 files changed, 83 insertions(+), 205 deletions(-)

diff --git a/drivers/media/platform/imx-jpeg/Kconfig b/drivers/media/platform/imx-jpeg/Kconfig
index 7cc89e5eff90..d875f7c88cda 100644
--- a/drivers/media/platform/imx-jpeg/Kconfig
+++ b/drivers/media/platform/imx-jpeg/Kconfig
@@ -4,6 +4,7 @@ config VIDEO_IMX8_JPEG
 	depends on VIDEO_DEV && VIDEO_V4L2
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
+	select V4L2_JPEG_HELPER
 	default m
 	help
 	  This is a video4linux2 driver for the i.MX8 QXP/QM integrated
diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index d87f99caf124..61c6a3bd8cbd 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -52,6 +52,7 @@
 #include <linux/pm_domain.h>
 #include <linux/string.h>
 
+#include <media/v4l2-jpeg.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-common.h>
@@ -65,12 +66,16 @@ static struct mxc_jpeg_fmt mxc_formats[] = {
 	{
 		.name		= "JPEG",
 		.fourcc		= V4L2_PIX_FMT_JPEG,
+		.subsampling	= -1,
+		.nc		= -1,
 		.colplanes	= 1,
 		.flags		= MXC_JPEG_FMT_TYPE_ENC,
 	},
 	{
 		.name		= "RGB", /*RGBRGB packed format*/
 		.fourcc		= V4L2_PIX_FMT_RGB24,
+		.subsampling	= V4L2_JPEG_CHROMA_SUBSAMPLING_444,
+		.nc		= 3,
 		.depth		= 24,
 		.colplanes	= 1,
 		.h_align	= 3,
@@ -80,6 +85,8 @@ static struct mxc_jpeg_fmt mxc_formats[] = {
 	{
 		.name		= "ARGB", /* ARGBARGB packed format */
 		.fourcc		= V4L2_PIX_FMT_ARGB32,
+		.subsampling	= V4L2_JPEG_CHROMA_SUBSAMPLING_444,
+		.nc		= 4,
 		.depth		= 32,
 		.colplanes	= 1,
 		.h_align	= 3,
@@ -89,6 +96,8 @@ static struct mxc_jpeg_fmt mxc_formats[] = {
 	{
 		.name		= "YUV420", /* 1st plane = Y, 2nd plane = UV */
 		.fourcc		= V4L2_PIX_FMT_NV12,
+		.subsampling	= V4L2_JPEG_CHROMA_SUBSAMPLING_420,
+		.nc		= 3,
 		.depth		= 12, /* 6 bytes (4Y + UV) for 4 pixels */
 		.colplanes	= 2, /* 1 plane Y, 1 plane UV interleaved */
 		.h_align	= 4,
@@ -98,6 +107,8 @@ static struct mxc_jpeg_fmt mxc_formats[] = {
 	{
 		.name		= "YUV422", /* YUYV */
 		.fourcc		= V4L2_PIX_FMT_YUYV,
+		.subsampling	= V4L2_JPEG_CHROMA_SUBSAMPLING_422,
+		.nc		= 3,
 		.depth		= 16,
 		.colplanes	= 1,
 		.h_align	= 4,
@@ -107,6 +118,8 @@ static struct mxc_jpeg_fmt mxc_formats[] = {
 	{
 		.name		= "YUV444", /* YUVYUV */
 		.fourcc		= V4L2_PIX_FMT_YUV24,
+		.subsampling	= V4L2_JPEG_CHROMA_SUBSAMPLING_444,
+		.nc		= 3,
 		.depth		= 24,
 		.colplanes	= 1,
 		.h_align	= 3,
@@ -116,6 +129,8 @@ static struct mxc_jpeg_fmt mxc_formats[] = {
 	{
 		.name		= "Gray", /* Gray (Y8/Y12) or Single Comp */
 		.fourcc		= V4L2_PIX_FMT_GREY,
+		.subsampling	= V4L2_JPEG_CHROMA_SUBSAMPLING_GRAY,
+		.nc		= 1,
 		.depth		= 8,
 		.colplanes	= 1,
 		.h_align	= 3,
@@ -406,33 +421,6 @@ static enum mxc_jpeg_image_format mxc_jpeg_fourcc_to_imgfmt(u32 fourcc)
 	}
 }
 
-static int mxc_jpeg_imgfmt_to_fourcc(enum mxc_jpeg_image_format imgfmt,
-				     u32 *fourcc)
-{
-	switch (imgfmt) {
-	case MXC_JPEG_GRAY:
-		*fourcc = V4L2_PIX_FMT_GREY;
-		return 0;
-	case MXC_JPEG_YUV422:
-		*fourcc = V4L2_PIX_FMT_YUYV;
-		return 0;
-	case MXC_JPEG_YUV420:
-		*fourcc =  V4L2_PIX_FMT_NV12;
-		return 0;
-	case MXC_JPEG_YUV444:
-		*fourcc =  V4L2_PIX_FMT_YUV24;
-		return 0;
-	case MXC_JPEG_RGB:
-		*fourcc =  V4L2_PIX_FMT_RGB24;
-		return 0;
-	case MXC_JPEG_ARGB:
-		*fourcc =  V4L2_PIX_FMT_ARGB32;
-		return 0;
-	default:
-		return 1;
-	}
-}
-
 static struct mxc_jpeg_q_data *mxc_jpeg_get_q_data(struct mxc_jpeg_ctx *ctx,
 						   enum v4l2_buf_type type)
 {
@@ -1152,45 +1140,6 @@ static void mxc_jpeg_stop_streaming(struct vb2_queue *q)
 	release_active_buffers(q, VB2_BUF_STATE_ERROR);
 }
 
-struct mxc_jpeg_stream {
-	u8 *addr;
-	u32 loc;
-	u32 end;
-};
-
-static u8 get_byte(struct mxc_jpeg_stream *stream)
-{
-	u8 ret;
-
-	if (stream->loc >= stream->end)
-		return -1;
-	ret = stream->addr[stream->loc];
-	stream->loc++;
-	return ret;
-}
-
-static int get_sof(struct device *dev,
-		   struct mxc_jpeg_stream *stream,
-		   struct mxc_jpeg_sof *sof)
-{
-	int i;
-
-	if (stream->loc + sizeof(struct mxc_jpeg_sof) >= stream->end)
-		return -1;
-	memcpy(sof, &stream->addr[stream->loc], sizeof(struct mxc_jpeg_sof));
-	_bswap16(&sof->length);
-	_bswap16(&sof->height);
-	_bswap16(&sof->width);
-	dev_dbg(dev, "JPEG SOF: precision=%d\n", sof->precision);
-	dev_dbg(dev, "JPEG SOF: height=%d, width=%d\n",
-		sof->height, sof->width);
-	for (i = 0; i < sof->components_no; i++) {
-		dev_dbg(dev, "JPEG SOF: comp_id=%d, H=0x%x, V=0x%x\n",
-			sof->comp[i].id, sof->comp[i].v, sof->comp[i].h);
-	}
-	return 0;
-}
-
 static int mxc_jpeg_valid_comp_id(struct device *dev,
 				  struct mxc_jpeg_sof *sof,
 				  struct mxc_jpeg_sos *sos)
@@ -1220,45 +1169,18 @@ static int mxc_jpeg_valid_comp_id(struct device *dev,
 	return valid;
 }
 
-static enum mxc_jpeg_image_format
-mxc_jpeg_get_image_format(struct device *dev, const struct mxc_jpeg_sof *sof)
+static u32 mxc_jpeg_get_image_format(struct device *dev,
+				     const struct v4l2_jpeg_header header)
 {
-	if (sof->components_no == 1) {
-		dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_GRAY\n");
-		return MXC_JPEG_GRAY;
-	}
-	if (sof->components_no == 3) {
-		if (sof->comp[0].h == 2 && sof->comp[0].v == 2 &&
-		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
-		    sof->comp[2].h == 1 && sof->comp[2].v == 1){
-			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_YUV420\n");
-			return MXC_JPEG_YUV420;
-		}
-		if (sof->comp[0].h == 2 && sof->comp[0].v == 1 &&
-		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
-		    sof->comp[2].h == 1 && sof->comp[2].v == 1){
-			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_YUV422\n");
-			return MXC_JPEG_YUV422;
-		}
-		if (sof->comp[0].h == 1 && sof->comp[0].v == 1 &&
-		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
-		    sof->comp[2].h == 1 && sof->comp[2].v == 1){
-			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_YUV444\n");
-			return MXC_JPEG_YUV444;
-		}
-	}
-	if (sof->components_no == 4) {
-		if (sof->comp[0].h == 1 && sof->comp[0].v == 1 &&
-		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
-		    sof->comp[2].h == 1 && sof->comp[2].v == 1 &&
-		    sof->comp[3].h == 1 && sof->comp[3].v == 1){
-			/* this is not tested */
-			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_ARGB\n");
-			return MXC_JPEG_ARGB;
-		}
-	}
+	int i;
+
+	for (i = 0; i < MXC_JPEG_NUM_FORMATS; i++)
+		if (mxc_formats[i].subsampling == header.frame.subsampling &&
+		    mxc_formats[i].nc == header.frame.num_components)
+			return mxc_formats[i].fourcc;
+
 	dev_err(dev, "Could not identify image format\n");
-	return MXC_JPEG_INVALID;
+	return 0;
 }
 
 static void mxc_jpeg_bytesperline(struct mxc_jpeg_q_data *q,
@@ -1312,112 +1234,71 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
 	struct device *dev = ctx->mxc_jpeg->dev;
 	struct mxc_jpeg_q_data *q_data_out, *q_data_cap;
 	enum v4l2_buf_type cap_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	struct mxc_jpeg_stream stream;
-	bool notfound = true;
-	bool app14 = false;
 	bool src_chg = false;
-	u8 app14_transform = 0;
-	struct mxc_jpeg_sof sof, *psof = 0;
-	struct mxc_jpeg_sos *psos = 0;
-	u8 byte, *next = 0;
-	enum mxc_jpeg_image_format img_fmt;
 	u32 fourcc;
+	struct v4l2_jpeg_header header;
+	struct v4l2_jpeg_app14_data app14;
+	struct mxc_jpeg_sof *psof = 0;
+	struct mxc_jpeg_sos *psos = 0;
+	int ret;
 
-	memset(&sof, 0, sizeof(struct mxc_jpeg_sof));
-	stream.addr = src_addr;
-	stream.end = size;
-	stream.loc = 0;
-	*dht_needed = true;
-	while (notfound) {
-		byte = get_byte(&stream);
-		if (byte == -1)
-			return -EINVAL;
-		if (byte != 0xff)
-			continue;
-		do {
-			byte = get_byte(&stream);
-		} while (byte == 0xff);
-		if (byte == -1)
-			return false;
-		if (byte == 0)
-			continue;
-		switch (byte) {
-		case DHT:
-			/* DHT marker present, no need to inject default one */
-			*dht_needed = false;
-			break;
-		case SOF2: /* Progressive DCF frame definition */
-			dev_err(dev,
-				"Progressive JPEG not supported by hardware");
-			return -EINVAL;
-		case SOF1: /* Extended sequential DCF frame definition */
-		case SOF0: /* Baseline sequential DCF frame definition */
-			if (get_sof(dev, &stream, &sof) == -1)
-				break;
-			next = stream.addr + stream.loc;
-			psof = (struct mxc_jpeg_sof *)next;
-			break;
-		case SOS:
-			next = stream.addr + stream.loc;
-			psos = (struct mxc_jpeg_sos *)next;
-			notfound = false;
-			break;
-		case APP14:
-			app14 = true;
-			/*
-			 * Application Data Syntax is:
-			 * 2 bytes(APPn:0xFF,0xEE), 2 bytes(Lp), Ap1...ApLp-2
-			 * The transform flag is in Ap12
-			 * stream.loc is now on APPn-0xEE byte
-			 */
-			app14_transform = *(stream.addr + stream.loc + 12 + 1);
-			break;
-		default:
-			notfound = true;
-		}
+	memset(&header, 0, sizeof(header));
+	header.app14 = &app14;
+	ret = v4l2_jpeg_parse_header((void *)src_addr, size, &header);
+	if (ret < 0) {
+		dev_err(dev, "Error parsing JPEG stream markers\n");
+		return ret;
 	}
+
+	/* if DHT marker present, no need to inject default one */
+	*dht_needed = (header.num_dht == 0);
+
 	q_data_out = mxc_jpeg_get_q_data(ctx,
 					 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	if (q_data_out->w == 0 && q_data_out->h == 0) {
 		dev_warn(dev, "Invalid user resolution 0x0");
 		dev_warn(dev, "Keeping resolution from JPEG: %dx%d",
-			 sof.width, sof.height);
-		 q_data_out->w = sof.width;
-		 q_data_out->h = sof.height;
-	} else if (sof.width != q_data_out->w || sof.height != q_data_out->h) {
+			 header.frame.width, header.frame.height);
+		 q_data_out->w = header.frame.width;
+		 q_data_out->h = header.frame.height;
+	} else if (header.frame.width != q_data_out->w ||
+		   header.frame.height != q_data_out->h) {
 		dev_err(dev,
 			"Resolution mismatch: %dx%d (JPEG) versus %dx%d(user)",
-			sof.width, sof.height, q_data_out->w, q_data_out->h);
+			header.frame.width, header.frame.height,
+			q_data_out->w, q_data_out->h);
 		return -EINVAL;
 	}
-	if (sof.width % 8 != 0 || sof.height % 8 != 0) {
+	if (header.frame.width % 8 != 0 || header.frame.height % 8 != 0) {
 		dev_err(dev, "JPEG width or height not multiple of 8: %dx%d\n",
-			sof.width, sof.height);
+			header.frame.width, header.frame.height);
 		return -EINVAL;
 	}
-	if (sof.width > MXC_JPEG_MAX_WIDTH ||
-	    sof.height > MXC_JPEG_MAX_HEIGHT) {
+	if (header.frame.width > MXC_JPEG_MAX_WIDTH ||
+	    header.frame.height > MXC_JPEG_MAX_HEIGHT) {
 		dev_err(dev, "JPEG width or height should be <= 8192: %dx%d\n",
-			sof.width, sof.height);
+			header.frame.width, header.frame.height);
 		return -EINVAL;
 	}
-	if (sof.width < MXC_JPEG_MIN_WIDTH ||
-	    sof.height < MXC_JPEG_MIN_HEIGHT) {
+	if (header.frame.width < MXC_JPEG_MIN_WIDTH ||
+	    header.frame.height < MXC_JPEG_MIN_HEIGHT) {
 		dev_err(dev, "JPEG width or height should be > 64: %dx%d\n",
-			sof.width, sof.height);
+			header.frame.width, header.frame.height);
 		return -EINVAL;
 	}
-	if (sof.components_no > MXC_JPEG_MAX_COMPONENTS) {
+	if (header.frame.num_components > V4L2_JPEG_MAX_COMPONENTS) {
 		dev_err(dev, "JPEG number of components should be <=%d",
-			MXC_JPEG_MAX_COMPONENTS);
+			V4L2_JPEG_MAX_COMPONENTS);
 		return -EINVAL;
 	}
 	/* check and, if necessary, patch component IDs*/
+	psof = (struct mxc_jpeg_sof *)header.sof.start;
+	psos = (struct mxc_jpeg_sos *)header.sos.start;
 	if (!mxc_jpeg_valid_comp_id(dev, psof, psos))
 		dev_warn(dev, "JPEG component ids should be 0-3 or 1-4");
 
-	img_fmt = mxc_jpeg_get_image_format(dev, &sof);
-	if (img_fmt == MXC_JPEG_INVALID)
+	fourcc = mxc_jpeg_get_image_format(dev, header);
+	if (fourcc == 0)
 		return -EINVAL;
 
 	/*
@@ -1425,12 +1306,11 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
 	 * encoded with 3 components have RGB colorspace, see Recommendation
 	 * ITU-T T.872 chapter 6.5.3 APP14 marker segment for colour encoding
 	 */
-	if (img_fmt == MXC_JPEG_YUV444 && app14 && app14_transform == 0)
-		img_fmt = MXC_JPEG_RGB;
-
-	if (mxc_jpeg_imgfmt_to_fourcc(img_fmt, &fourcc)) {
-		dev_err(dev, "Fourcc not found for %d", img_fmt);
-		return -EINVAL;
+	if (fourcc == V4L2_PIX_FMT_YUV24 || fourcc == V4L2_PIX_FMT_RGB24) {
+		if (header.app14 && header.app14->transform_flag == 0)
+			fourcc = V4L2_PIX_FMT_RGB24;
+		else
+			fourcc = V4L2_PIX_FMT_YUV24;
 	}
 
 	/*
@@ -1438,10 +1318,11 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
 	 * detected from the jpeg output stream
 	 */
 	q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
-	if (q_data_cap->w != sof.width || q_data_cap->h != sof.height)
+	if (q_data_cap->w != header.frame.width ||
+	    q_data_cap->h != header.frame.height)
 		src_chg = true;
-	q_data_cap->w = sof.width;
-	q_data_cap->h = sof.height;
+	q_data_cap->w = header.frame.width;
+	q_data_cap->h = header.frame.height;
 	q_data_cap->fmt = mxc_jpeg_find_format(ctx, fourcc);
 	q_data_cap->w_adjusted = q_data_cap->w;
 	q_data_cap->h_adjusted = q_data_cap->h;
@@ -1469,7 +1350,7 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
 	}
 
 	/* setup bytesperline/sizeimage for capture queue */
-	mxc_jpeg_bytesperline(q_data_cap, sof.precision);
+	mxc_jpeg_bytesperline(q_data_cap, header.frame.precision);
 	mxc_jpeg_sizeimage(q_data_cap);
 
 	/*
diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/imx-jpeg/mxc-jpeg.h
index 5c9abeaa8bd6..a88ecccf0a47 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.h
@@ -42,6 +42,8 @@ enum mxc_jpeg_mode {
  * struct jpeg_fmt - driver's internal color format data
  * @name:	format description
  * @fourcc:	fourcc code, 0 if not applicable
+ * @subsampling subsampling of jpeg components
+ * @nc:		number of color components
  * @depth:	number of bits per pixel
  * @colplanes:	number of color planes (1 for packed formats)
  * @h_align:	horizontal alignment order (align to 2^h_align)
@@ -49,13 +51,15 @@ enum mxc_jpeg_mode {
  * @flags:	flags describing format applicability
  */
 struct mxc_jpeg_fmt {
-	char	*name;
-	u32	fourcc;
-	int	depth;
-	int	colplanes;
-	int	h_align;
-	int	v_align;
-	u32	flags;
+	char					*name;
+	u32					fourcc;
+	enum v4l2_jpeg_chroma_subsampling	subsampling;
+	int					nc;
+	int					depth;
+	int					colplanes;
+	int					h_align;
+	int					v_align;
+	u32					flags;
 };
 
 struct mxc_jpeg_desc {
@@ -121,14 +125,6 @@ struct mxc_jpeg_dev {
 	struct device_link		**pd_link;
 };
 
-/* JPEG marker identifiers */
-#define SOF0				0xC0
-#define SOF1				0xC1
-#define SOF2				0xC2
-#define SOS				0xDA
-#define DHT				0xC4
-#define APP14				0xEE
-
 /**
  * struct mxc_jpeg_sof_comp - JPEG Start Of Frame component fields
  * @id:				component id
-- 
2.17.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78CB2F1F81
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 20:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391286AbhAKTby (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 14:31:54 -0500
Received: from mail-vi1eur05on2045.outbound.protection.outlook.com ([40.107.21.45]:23264
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391271AbhAKTbx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 14:31:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xq5uPeyVXq3Gt9f0IE+bbMXxoQdiu1m4xNfsowJAH0A1awWpjDi1yM4KoMP12N+FYM6tkCv60UjOpRA6rOiaVit4WbGHwtz1Uiuft3URdaPJ9BkpLe1JxzrY98UJuCMLNherzU1G1lr07EGs0vqW1OBAVVRM99Plaha5msEFVLfvdn2b2KfdOo94fLVmSp9FELwOV5G5K7CUqvqPrZU01HBUeKLr63VhFNUPHRhUjMOV1ckF9Vi307snDCalvvtRBvk15w3xri3Csl4y/PrvzH7xgLT7GX2hc8y8+S3p+YXDxyi3DQhftjIhBAfkFeojoW1rpJaMuCtYsSHbE+LgpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmMclxao4cOqTDbPf9KsvvdkUch5pH0+lyimbF7tV94=;
 b=Xt4FQ6HSrO688LjxSmQs+dfEqVL7n8frHXvvU8aGzgRBTeY1806409qMiTUa7B2Q0+IkGm2YP0aQLh9NwRgZ5wl4s2/g3dWNfEcIyAHC2g9RjOWlDLJ1v2zJJlNLC5mDZ+J7Xy0Q4pWiSOPW0jWu12f42ru/YqyGaWewiz02UAkz4Fy8BHrwwLS/s/4oeWHC/wSGhXlTa7k3G3uEYTkxzw4Lj3qbUZO5BCqmu/SAUbi1DIA7qduUK7qX1KU2GZ0o7BP130+xC9Zi2YYrFz/iV7cKF+oIFm1wTpld3C3QKBj91VrFyPo0q+2iT+IfhO0XdSA+CBkWrabfkHMG9hY7Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmMclxao4cOqTDbPf9KsvvdkUch5pH0+lyimbF7tV94=;
 b=TcdIXBwaotcJ640NkdasQPKFMJn36YdRdUnCA7DocMYE3Bvapc+yJdJMaEGaAA2E4OidploL7bdwpk6dYvMU2LLqaNPgukyChJ2DOlkCtUG3x5TXSIwysVUUV2nVbBaDs5fBi+W57V84MgQPADaDMFhPH98ol+B1jvHwsxmrO1A=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4424.eurprd04.prod.outlook.com (2603:10a6:20b:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Mon, 11 Jan
 2021 19:29:08 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%6]) with mapi id 15.20.3742.011; Mon, 11 Jan 2021
 19:29:08 +0000
From:   Mirela Rabulea <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com
Subject: [PATCH v7 9/9] media: imx-jpeg: Use v4l2 jpeg helpers in mxc-jpeg
Date:   Mon, 11 Jan 2021 21:28:22 +0200
Message-Id: <20210111192822.12178-10-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
References: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [178.138.194.64]
X-ClientProxiedBy: VI1PR07CA0296.eurprd07.prod.outlook.com
 (2603:10a6:800:130::24) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (178.138.194.64) by VI1PR07CA0296.eurprd07.prod.outlook.com (2603:10a6:800:130::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Mon, 11 Jan 2021 19:29:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b8dbd1c2-66d5-4369-0a9e-08d8b6672aa5
X-MS-TrafficTypeDiagnostic: AM6PR04MB4424:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB442411E9E167CED03394F43DCEAB0@AM6PR04MB4424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: URb5RthkyqB2xrc0Vo9+Txy3xELKVoss/fvzVhWA8xMZcpFMCcqjWQCba6z665FaaT4l2/jqJdo/m8kIPtU8vwlG696urZK3Q6SjmG9YWP1YUTaLqir06Ik9Nlm8o49howUq5DW7Xlawko8uoa3euC3ePXm6vfNW+ePUNvokmuy9EH9+o5IMZEh2pPORncIszFidYs00zz6+6AUBWLWDlHU3hCytlH5d06+ZkqTUaLMEdOsckY9gfZCdqmVFavzRvUqBwx9vMWzwcaOFEzJmaecR+NzPA45x+3wtIUe0CrUFR2usEVpt8rmgOXH9jsjNK+69KT3xcsnPU4AqKOs+X/lb9yYZtjVj27jI+QbRyABbSl4D5mvzPaxyL7bUKX37Rp+LzPwPy2VgcZ4grdpPAkvNbCrbaTenEvB1PLGVt2dsNTyyfF0gMFhVQegKbrh/FdhzEE3JZolbRFe3NTmyOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(6486002)(6666004)(7416002)(5660300002)(52116002)(66946007)(316002)(69590400011)(478600001)(4326008)(66476007)(66556008)(1076003)(8936002)(2906002)(6512007)(2616005)(956004)(44832011)(8676002)(26005)(16526019)(186003)(6506007)(83380400001)(30864003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bbNnEFRSKpEvW5ZZNprmacy8zbewYIqUi8gmckroKnHJrNAJXHi5ez+Wh7bQ?=
 =?us-ascii?Q?py8jC7iRiRhLxx1iPRGQasTnSo2+es1MEn8D3Gi4kCeQXqzMfmzrdLKCeuXy?=
 =?us-ascii?Q?gMSs4jhK34vUmHZtn0dQvBrfD6IuvrhfjcOgAmjqi9dgMrnvFSd6BFHZTrwD?=
 =?us-ascii?Q?lBcV6uoBCQP5UYdom/ZAsQZN3aM35s9zsJNT/kGy8z2zo4ZpmqhEyFpPQQmq?=
 =?us-ascii?Q?FNeNJQi8b/1ZR/mENSmP6jGnBtcgtKJ+r+n2EcClCJ73lY8Ym2Cd3z9vtyIy?=
 =?us-ascii?Q?4DIqgj7ce5052NmqFYyVvM0HFBOLCUVbCZbykQjn9iw6zq/vdaK3vNbYRZeh?=
 =?us-ascii?Q?yxxSEvwE3ukpDoAo0/s0jXwKiGoYnMvuMNVDnRPOkbGYxnpCRy1VBS51NKG8?=
 =?us-ascii?Q?4FdeNtxZmpmhtV4lE8J8WSvmtbUa/4SdPUEdJXjwSKGr//ki4DwjzXOeA+17?=
 =?us-ascii?Q?nwdYud+H1lfq6YG3qizKBFok2A98MwSEQc+qoyyCJaUDiGU6K6f4LwSh57J7?=
 =?us-ascii?Q?q1Az/ZjcsssaAqMZ9IIzfc418MqzFPNdRi3i45ePqIMZEdeGeQLdihG/bKPU?=
 =?us-ascii?Q?Nj0/qhtMOP/FDkQKNuFzboXLVpxqWxmWxWDeaLHN7EUCVEtDcVTUkRHvQBoo?=
 =?us-ascii?Q?FKUqdk7RJcYrAZOzJDSgBeLkqGbGpJReQvzo1ouchll7lt2QFAdFl+AObk51?=
 =?us-ascii?Q?7t99H/dhKB6ks7aHlZzcJypgPjU5QGCEfWTuP0yD6UFdXAD+cdXQdCxamk1U?=
 =?us-ascii?Q?dPOT8HcrtEMY47XwM9H39LrAA2WMwb6rD7yC7pFtZsuhwhGTi5bJQoWsr1TX?=
 =?us-ascii?Q?QFWATxlMpE76vqUa2RFVXcyqhs78wB+Kc8HbbAOjBLTz3Meni+8OIilRIyon?=
 =?us-ascii?Q?ky3IOYQAfNqiSW089NORvnuN8JgG5ouobqWxXFcDpqQhLELXLW/7OaClXsoJ?=
 =?us-ascii?Q?0aZhMol0DTek6wynKIsdfkk0ir+UQR4MAmdW9xZUJRmp1ntj6pO2eQHgZrSZ?=
 =?us-ascii?Q?JZWG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 19:29:08.5272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: b8dbd1c2-66d5-4369-0a9e-08d8b6672aa5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZixYMUiS6oaNx2iC0ahzodJpWTzQNxtxkKHqv+foUzpRwuasOFo8AUhJRpvATsGgSyN2Yh7JLhP15xoc7G3Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4424
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Use v4l2_jpeg_parse_header in mxc_jpeg_parse, remove the old
parsing way, which was duplicated in other jpeg drivers.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 drivers/media/platform/imx-jpeg/Kconfig    |   1 +
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 267 ++++++---------------
 drivers/media/platform/imx-jpeg/mxc-jpeg.h |  26 +-
 3 files changed, 80 insertions(+), 214 deletions(-)

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
index 9f1052779c58..b19fc98c1ce3 100644
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
@@ -384,33 +399,6 @@ static enum mxc_jpeg_image_format mxc_jpeg_fourcc_to_imgfmt(u32 fourcc)
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
@@ -1130,45 +1118,6 @@ static void mxc_jpeg_stop_streaming(struct vb2_queue *q)
 	release_active_buffers(q, VB2_BUF_STATE_ERROR);
 }
 
-struct mxc_jpeg_stream {
-	u8 *addr;
-	u32 loc;
-	u32 end;
-};
-
-static int get_byte(struct mxc_jpeg_stream *stream)
-{
-	int ret;
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
@@ -1198,45 +1147,18 @@ static int mxc_jpeg_valid_comp_id(struct device *dev,
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
@@ -1290,122 +1212,69 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
 	struct device *dev = ctx->mxc_jpeg->dev;
 	struct mxc_jpeg_q_data *q_data_out, *q_data_cap;
 	enum v4l2_buf_type cap_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	struct mxc_jpeg_stream stream;
-	bool notfound = true;
-	bool app14 = false;
 	bool src_chg = false;
-	u8 app14_transform = 0;
-	struct mxc_jpeg_sof sof, *psof = NULL;
-	struct mxc_jpeg_sos *psos = NULL;
-	int byte;
-	u8 *next = NULL;
-	enum mxc_jpeg_image_format img_fmt;
 	u32 fourcc;
+	struct v4l2_jpeg_header header;
+	struct mxc_jpeg_sof *psof = NULL;
+	struct mxc_jpeg_sos *psos = NULL;
+	int ret;
 
-	memset(&sof, 0, sizeof(struct mxc_jpeg_sof));
-	stream.addr = src_addr;
-	stream.end = size;
-	stream.loc = 0;
-	*dht_needed = true;
+	memset(&header, 0, sizeof(header));
+	ret = v4l2_jpeg_parse_header((void *)src_addr, size, &header);
+	if (ret < 0) {
+		dev_err(dev, "Error parsing JPEG stream markers\n");
+		return ret;
+	}
 
-	/* check stream starts with SOI */
-	byte = get_byte(&stream);
-	if (byte == -1 || byte != 0xFF)
-		return -EINVAL;
-	byte = get_byte(&stream);
-	if (byte == -1 || byte != 0xD8)
-		return -EINVAL;
+	/* if DHT marker present, no need to inject default one */
+	*dht_needed = (header.num_dht == 0);
 
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
-	}
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
@@ -1413,12 +1282,11 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
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
+		if (header.app14_tf == V4L2_JPEG_APP14_TF_CMYK_RGB)
+			fourcc = V4L2_PIX_FMT_RGB24;
+		else
+			fourcc = V4L2_PIX_FMT_YUV24;
 	}
 
 	/*
@@ -1426,10 +1294,11 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
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
@@ -1455,7 +1324,7 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
 		(fourcc >> 24) & 0xff);
 
 	/* setup bytesperline/sizeimage for capture queue */
-	mxc_jpeg_bytesperline(q_data_cap, sof.precision);
+	mxc_jpeg_bytesperline(q_data_cap, header.frame.precision);
 	mxc_jpeg_sizeimage(q_data_cap);
 
 	/*
diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/imx-jpeg/mxc-jpeg.h
index ef1670dafeb4..313b09f831a4 100644
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
@@ -117,14 +121,6 @@ struct mxc_jpeg_dev {
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


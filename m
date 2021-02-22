Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7EF1321FD0
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 20:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbhBVTOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 14:14:36 -0500
Received: from mail-eopbgr50048.outbound.protection.outlook.com ([40.107.5.48]:46215
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232905AbhBVTMJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 14:12:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxU1xOiDX3rJrk/9YTbSUOWMkQ0V0Yrmhk3vB2lj+3Y93jPwS1mVoiCr0dTW5YoVFlWY1/1YzbM8x08bdkyWWJBp9PvmZjArUo9u2nTNc1p7ZsejRa7fl2husM5YOZwjkMb2sQPk1kaaqnqfrF9zlMjWjTeaBQkYuAasWeWdDDZXrlDKihV74uNvQ9PczPBxTy4b59+0f3WAwKasWVdPMH1uc/FYdEktVwumGfVaoGl1BeuKYynyBZ39AXYr8gOPNf5/rdVnW3nbDX8+dhdnOUtj009CAMD5bqgpYW9XyQdt46qfY9JULsX/FW5qM7vxlv7B1f2BZwVPi9h0u/B7uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/mQI0yvKPGOZAYO2J/OCVTnTx+xpDg11h0hg0Z2aVA=;
 b=PIRBGaMvBXkEL19bJwQksSASlNhHe6G+1HiIyNE+H7EFoUaKoRYvku+ow6eOfa5RVTUyJOS+to2cJOpwFalw/kRAsd2M1fRMJSLG3CVfNM8eaiNLLLzBvLMymcBZiSM3wCN6NMMqfv9Rnz992VOxrH4O0iXXhq27XOVEZ9R4ethlUKJswM31pTKrUZwANEqzrTBYIlInuBe7ZI8O+dxMSsJpbiP+jFRhG2slQqLRVBNyFksssWCiOTNCUaB0uATPTYPqwG9VWHsktYVZ1jZ9NZA4PVtQbDQ3pyIB9ch8VQ9v4/d+GUb5xcdJnZnLHN9qMR8bmrhVRSt9ZoIRicJLSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/mQI0yvKPGOZAYO2J/OCVTnTx+xpDg11h0hg0Z2aVA=;
 b=eXlIuW2Jb1DPd7sPDLkVJf7m9YiUwFUKIACmP+CjdKeesVvD8HPVNDjRtS5PaTpRxfxxfKuhXjbonsRlj7EqrOjgjb5wwWSdpe1ubVxxPdBHSpUDJvCd8UQMHR47XMfiFI2oDbgU2ZwaXy6/lAz8IIQC6TFGz1kur4C7J6hlPH0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7591.eurprd04.prod.outlook.com (2603:10a6:20b:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Mon, 22 Feb
 2021 19:08:20 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 19:08:20 +0000
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
Subject: [PATCH v8 9/9] media: imx-jpeg: Use v4l2 jpeg helpers in mxc-jpeg
Date:   Mon, 22 Feb 2021 21:07:38 +0200
Message-Id: <20210222190738.2346378-10-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222190738.2346378-1-mirela.rabulea@oss.nxp.com>
References: <20210222190738.2346378-1-mirela.rabulea@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (86.124.171.30) by FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend Transport; Mon, 22 Feb 2021 19:08:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aeb3be2f-d7af-4a60-ff4d-08d8d7653820
X-MS-TrafficTypeDiagnostic: AS8PR04MB7591:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB759151FC1C2FC2DA1D958AEACE819@AS8PR04MB7591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bp5J4zXtUZWkwjhyXN/whVEASCluZA+YF7k09g4YkG0Hs1p7rO0ZuU1itzwEHAArJSxK69FMGHql4JuM+Pa65ZH0JPkR/YynxZPYOijdD8Tkg0ISdMTeZHTgcHgsdKo1l5PcWsyPbHKH3UqEce1i7Zd1urZQ1fCGHLaYdGUWkYyZ6cBHUhOlN2mpkShs9j89jaYiJdL08SOT2x+6Id35pJ/jR02mqNVTJkSunnlamBZddJ+voaqQ9AJ305FQQG+sN6cEophN2cqn0WzxNfUvcBMKgrijHTf5ST31/uxA3mWBS69P6VGwXCJTRjhBL614aMQZDSyVIeTo0rY/x4WtW9HI2uTmUo8QGe4N8L7gIUJ3LqFHh0GKgFebuEt8C1f/9lVbs9Pa6q3xHeYD47aJJ0h9K7rQN2XXlEMuB3QTbys/jAXo6Rh1WpeBwh2+BEhoi++1gJwq8vDG8TIAmVbnM8BSYOFKITzz+rJzTSE559n6AVZr4kQ2+FJbWhXf/kU23HY6yWozqpwgvQNZG0/3Co4hqDPHepeuDWYTBtBf7a3cvkvF/prV+5LSs3gMmYiODXm6faKquRsfr1W4Sq3hHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(316002)(6666004)(2906002)(30864003)(83380400001)(956004)(2616005)(52116002)(8936002)(186003)(69590400012)(1076003)(66476007)(6506007)(86362001)(44832011)(66946007)(5660300002)(478600001)(66556008)(6512007)(6486002)(7416002)(4326008)(16526019)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/FGDOk1TxQZeWnepVQMZFqrEEWzEAip4JcmDfSRS+FTtPZ+jADWX8QbKn/nI?=
 =?us-ascii?Q?niFJsghWaCBAnaHYdyjI852qK0IZiYI6rAJ2xBKwc93IvinfczNVaRzo0gbg?=
 =?us-ascii?Q?7fNEkGl4moKAB0X7QwAi769djrdgXGi7pwXkN4XBcwmJH66hZUNhaikSeGPL?=
 =?us-ascii?Q?+poUDIFewoPtQ/lRPVyv4MEHH6NotSRLPM0P77ScTsXOarAKVGFmfhOWrZwc?=
 =?us-ascii?Q?0PK7N7CGq3D06hSS5H5KJRqMgI0oZNpbNHHwS5pb3A2EjoOye6pLkVAgJll7?=
 =?us-ascii?Q?zFm8OSaQWb/Md5dvzbKg7GXK4eXOKl2wZr0k149Yv0ttu70za2xOJEKXoMOB?=
 =?us-ascii?Q?OhvkZ1HR+ezQuOgicZrTLyYFBHlpRPCQKOAByv3Ez79TGl8X54S0SdakHA20?=
 =?us-ascii?Q?GjP9wlGsuFgdlplJ37FlHNYiHZii3y8yj9cNyjLT1G9zMwjHm+RW8g/OPH39?=
 =?us-ascii?Q?Nci6n/4F/bdgw0++3of0YSMLeCHOlpQpXOWWDjjmmnYSzoxqSKT0+WaCTuJQ?=
 =?us-ascii?Q?qGe6T01NNUU53LvUwKhN99VsTq9379wF0d6mKMthI8iQchKpIboyB0/Gsdaz?=
 =?us-ascii?Q?lIrGJZ2uo6VGk3BxYeQ8UpNSDq/vQHCVj3dZIsdXDocO2oPdAWr8uUg2xLEj?=
 =?us-ascii?Q?g7WJaWOQw2cgMvXKKnnhMIcQKnywzMCDoTQrpAc0JxtvyU0hZWROHCpSF3up?=
 =?us-ascii?Q?bObW/Y3BI9UmgxeUfty6MLZYyiGFMdietqPJoENWfTAl9y8Fth4R/nuW73Ld?=
 =?us-ascii?Q?Wod4HXlWnaZ29tYIqZthCf20d0N+7qGlT3VmYBzLZdX6Gb2lo43i+HKymDEF?=
 =?us-ascii?Q?Jdjl5t67RDxcpkSJs0hotmZOVl0LGFYfQWVzm8TPvlyL6RTBnzGsH4Co+p3S?=
 =?us-ascii?Q?JPY9ZKL//7e27ph3+QNPyqdnQDH6q6qCqzqBz0LWol9B5bqtzjEFpSBlff9d?=
 =?us-ascii?Q?tLhvBuI3QrCnJQB/LPBEiq8u6GLTLQZZcRYFKMCrPgFT9LkUPu2W1bFzjXPw?=
 =?us-ascii?Q?0TUmj33Gya14rM7iWsYYLZfbIHIaeJFlbj2hFLJt2WsRH//x7oyJ2ZEi/fYn?=
 =?us-ascii?Q?HhBu9Dgt9hjrG0WvR9s7uuQGtjj9v9szEuxXUCmfPLbNJ5ETRo7uFlOtHwWW?=
 =?us-ascii?Q?epgV9hBfrJqO7hTCCwLPqpHsAWxVzokShImHv58Z87unJ4fTeyZwMYej7Lxt?=
 =?us-ascii?Q?tMefADJF5huwb1F4eyyQxbwlDkZcXHB4fDvWhldkYQg8d3H1G+QaifZgz9VO?=
 =?us-ascii?Q?8671ghyOayoS9bCqeVKYRli0TCVVE/hhrL6c40920mfzxJlDx0s0KXbTB5tr?=
 =?us-ascii?Q?xopew/sELb8VHTN6WrVAjLfSB+ntTjR04Kkk34GuIKEJZw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb3be2f-d7af-4a60-ff4d-08d8d7653820
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 19:08:20.7979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SBbxSjHL8ad6buZVimpqYCstIGTQakzi2ur46fj7JuATuZA9e81VRloS8F8QgiC5la498z9Y1tqFrz/w75i+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7591
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Use v4l2_jpeg_parse_header in mxc_jpeg_parse, remove the old
parsing way, which was duplicated in other jpeg drivers.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v8:
  Move the app14_tf fixup in mxc_jpeg_get_image_format() and let this function
return the correct format
  Print subsampling and number of components in case fourcc couldn't be identified
  Added Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

 drivers/media/platform/imx-jpeg/Kconfig    |   1 +
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 284 ++++++---------------
 drivers/media/platform/imx-jpeg/mxc-jpeg.h |  26 +-
 3 files changed, 92 insertions(+), 219 deletions(-)

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
index 109c04e222b4..65d30f30ed26 100644
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
@@ -1093,45 +1081,6 @@ static void mxc_jpeg_stop_streaming(struct vb2_queue *q)
 	}
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
@@ -1161,45 +1110,37 @@ static int mxc_jpeg_valid_comp_id(struct device *dev,
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
+	int i;
+	u32 fourcc = 0;
+
+	for (i = 0; i < MXC_JPEG_NUM_FORMATS; i++)
+		if (mxc_formats[i].subsampling == header.frame.subsampling &&
+		    mxc_formats[i].nc == header.frame.num_components) {
+			fourcc = mxc_formats[i].fourcc;
+			break;
 		}
+	if (fourcc == 0) {
+		dev_err(dev, "Could not identify image format nc=%d, subsampling=%d\n",
+			header.frame.num_components,
+			header.frame.subsampling);
+		return fourcc;
 	}
-	if (sof->components_no == 4) {
-		if (sof->comp[0].h == 1 && sof->comp[0].v == 1 &&
-		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
-		    sof->comp[2].h == 1 && sof->comp[2].v == 1 &&
-		    sof->comp[3].h == 1 && sof->comp[3].v == 1){
-			/* this is not tested */
-			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_ARGB\n");
-			return MXC_JPEG_ARGB;
-		}
+	/*
+	 * If the transform flag from APP14 marker is 0, images that are
+	 * encoded with 3 components have RGB colorspace, see Recommendation
+	 * ITU-T T.872 chapter 6.5.3 APP14 marker segment for colour encoding
+	 */
+	if (fourcc == V4L2_PIX_FMT_YUV24 || fourcc == V4L2_PIX_FMT_RGB24) {
+		if (header.app14_tf == V4L2_JPEG_APP14_TF_CMYK_RGB)
+			fourcc = V4L2_PIX_FMT_RGB24;
+		else
+			fourcc = V4L2_PIX_FMT_YUV24;
 	}
-	dev_err(dev, "Could not identify image format\n");
-	return MXC_JPEG_INVALID;
+
+	return fourcc;
 }
 
 static void mxc_jpeg_bytesperline(struct mxc_jpeg_q_data *q,
@@ -1253,146 +1194,81 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
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
-		q_data_out->w = sof.width;
-		q_data_out->h = sof.height;
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
-		return -EINVAL;
-
-	/*
-	 * If the transform flag from APP14 marker is 0, images that are
-	 * encoded with 3 components have RGB colorspace, see Recommendation
-	 * ITU-T T.872 chapter 6.5.3 APP14 marker segment for colour encoding
-	 */
-	if (img_fmt == MXC_JPEG_YUV444 && app14 && app14_transform == 0)
-		img_fmt = MXC_JPEG_RGB;
-
-	if (mxc_jpeg_imgfmt_to_fourcc(img_fmt, &fourcc)) {
-		dev_err(dev, "Fourcc not found for %d", img_fmt);
+	fourcc = mxc_jpeg_get_image_format(dev, header);
+	if (fourcc == 0)
 		return -EINVAL;
-	}
 
 	/*
 	 * set-up the capture queue with the pixelformat and resolution
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
@@ -1418,7 +1294,7 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
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
2.25.1


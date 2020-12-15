Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 822DC2DABE4
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 12:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728836AbgLOLVZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 06:21:25 -0500
Received: from mail-eopbgr130083.outbound.protection.outlook.com ([40.107.13.83]:62016
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728806AbgLOLVS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 06:21:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C35pTI9yrg1hv2FYhut50yf2ghtYloIqY4r2Wfu+GCwUiAyzHXt+rNrzuUUBDJP/W9XCb/RDnbktQMPnkiQKvFXc7xryvg4rId8jyOkYufo4CHq/ZXJqzmn0L38IOyy0RuYGlQeSHzQicfaOwkGy6PEPrlhhXbXv33OKXFtoWK3RG5W/CiCeUzBEEfpqDdDj8WMFnypK3y1DkY1rtud1Uxi3GhhyJvS8YIJCFDYMmxN/l4A686naLk+cg6bXvKfWe3K6ORaHp0OTtbDJHm1PNAcw2+6e5cZFDGAuCZNc0tjcLln+xuM021JWE0GDO1nTBt6SImxDL7LaqKThck8iAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMfnj/YvO+laExqG8E6E6Lt0HAvvqUQrSEG8FkOyP8M=;
 b=X7ohF2hH9AML+V3lWqwKeCEiqAwIBdLSw2dVOUmUyTSdxxBYXjG7VnDjvNuqGZrhbN3ghfCriS+AIPOLkRmlFLy1TZbGgsne6hJ8uhrLBytgUo8+xtSymPcT6lI+RWosPiiup7OTpQxSFQ4BMdGuTEXso28vJSkoLesJADu3JQ9a7zE4Jaut8y3rKOU3E+7/Rj0hqX29T9jK9j9XWVk3knZ6jU96DoxkCuS50RHe/88kuR1OHfnTVe5k9+a+dRbXllWFeOZwFjXFUBe06jlKWBEKqXlX3RIWrqej2XAOF2DxDuEjnErb31pMIDAb/NXI+c4/zOH/OBtOloI5k4Pt3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMfnj/YvO+laExqG8E6E6Lt0HAvvqUQrSEG8FkOyP8M=;
 b=HCGl0KwGKLeI5pVvC4DsAjn+yQ519pS7CgoGvNoyeQ53wfVesg0A3ErcJiHjhq73L4mkMF+WF0L3+vnlp4JA3uuoy4dgKKQxj2ft8fuQzmFcV3R3SMAg3/KiA/s0FLrP3hdEav2n8OCFMZSElLBi+XpWp8wGV0bVqDGLoAAt3ms=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM5PR0402MB2737.eurprd04.prod.outlook.com (2603:10a6:203:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Tue, 15 Dec
 2020 11:19:36 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3654.024; Tue, 15 Dec 2020
 11:19:36 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
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
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v6 6/9] media: Add parsing for APP14 data segment in jpeg helpers
Date:   Tue, 15 Dec 2020 13:18:40 +0200
Message-Id: <20201215111843.30269-7-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215111843.30269-1-mirela.rabulea@oss.nxp.com>
References: <20201215111843.30269-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [79.115.51.151]
X-ClientProxiedBy: VI1PR09CA0178.eurprd09.prod.outlook.com
 (2603:10a6:800:120::32) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (79.115.51.151) by VI1PR09CA0178.eurprd09.prod.outlook.com (2603:10a6:800:120::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 11:19:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 926c390e-b73a-4fe3-7f17-08d8a0eb4e40
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2737:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2737137368E71569F67E8F00CEC60@AM5PR0402MB2737.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SH6x+fdV0v3R8Iga3lj28D13csxeTGQPR2Bqvguvp0ClbvgH+IbblD04W3TtvHkorc+cDSnP4aSBYAT4zHyVZAALRPu5hHj9Nz/trHMNVsee1KzEehSe+5e0N+ip30FOXb3jHXoIzYo2BeHkaOVMQ6QoOAc5BGhgGX38HKoQQVzw82WP8KtXedLqaiyRrxtEdFBI48YSKVMv4vG/p90sxgQHDuzrUwhRBdLekZ8sMpr/G28U8MMftWZcbgJHcpATsdaJ/fscuD4U9/CB02D/au0977Gvj764ImIvOPKNPburDa03CVsV9AQ2UznH+V1MwFpIhK8bgg7pP2KCnucm6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(2616005)(16526019)(8936002)(52116002)(2906002)(1076003)(956004)(66946007)(6486002)(66556008)(66476007)(498600001)(6512007)(86362001)(8676002)(7416002)(83380400001)(6506007)(186003)(4326008)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8Bs1Gw8NUKuu0tS5+T8IDkguos3fuZz3+EJJ8+5uu9+6ssMml1TU6gsyfPZT?=
 =?us-ascii?Q?kFwyZSqOBHEwqSOj/ZfwUD0WFMXhxPyqIi3cYiNy48ddSerzP0rPf7MGYfus?=
 =?us-ascii?Q?OGEbTbxx2Rp7CjQELfpTRPzrrt1+I6Tb5cywqoyBxj8vsncnR4SsMYffI566?=
 =?us-ascii?Q?fCQZkIlMrvSk28/aEdqRsrPYS6Pox3CST/9jvAK0Fe9BPszfowNh8ulRaExj?=
 =?us-ascii?Q?Y9VY1sK0thjPVeltwWTvNykm2QGFSdnuWi1ltw4l37ocfyihxY6KMpXCXmHe?=
 =?us-ascii?Q?Csam1Juh4R71UvEP+ylovOj50iAWzslVknm4B5BugCJMjokBpVO1Tutg71RL?=
 =?us-ascii?Q?Z9pczzRxO4KUTJLUwnoHiJEzneq2UKGoPc9o4VF3nYd5/kqjyicIFBrneZOx?=
 =?us-ascii?Q?lCGjY6scdlRw6cji7Xs4nYdnMGC+Fgeb2vbeneKFEc/giqZOKcVRCkeFU3XI?=
 =?us-ascii?Q?GnxSW8bqtBmalJP9MDXlMS0doC828wzbGY8cMS8yz04lD47l9E+xOj1HQ89p?=
 =?us-ascii?Q?HYtuVRc/b+6eWWZkpDeYByrlzjLkZ/MJfhcriO1r8/YQYjqUtS7FhSwqlBbN?=
 =?us-ascii?Q?bK2kfOSSEu2u2MREyV2rGfofRcaUaMA4s7/fbtrWVrm/TW2UArsrAyo5lw0Y?=
 =?us-ascii?Q?R1Tl/K/ZJlNpDtNKCdFntg+/vGdu1IQaKUy7tOL1xVUZz70NWTxOt1SFxxRs?=
 =?us-ascii?Q?Z5UDg/xd1TmZrWoJDHkNF2JcatBk7j4/h9+NXWIcBFLeRI9YA0/95GJil/QD?=
 =?us-ascii?Q?LxJ4p9Mj3hZMsRFoE1Pxnv0xa0CYXGZW6GbSVnf+bmCJzgjUFQQtB9ctxUCN?=
 =?us-ascii?Q?4ZGFNV1ctv1EIp16p/fpwEi3jHD3ngNXMo54auESEshcxQByNH9mRNhkPP6r?=
 =?us-ascii?Q?t4CYMNI9ab8de5a4fCWIJg8pGC7xniRn5R9g7kVALioTJ8tFTbAieC5UpJgk?=
 =?us-ascii?Q?zbBPeXvE2o7MKkpgSkPNhZCBGOS7C3VcqzzkFXJ5dwsFSJHb7lopZRa+VVvp?=
 =?us-ascii?Q?Vt8w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 11:19:36.1724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 926c390e-b73a-4fe3-7f17-08d8a0eb4e40
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sl6Y/IsOgtPAfWlMz7rgkGKm7xl7pWppwDKLTG/UazDFt+Zncfq2th48BPnaxQY7kT5yp8qBaeTiSxL5qAPGwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2737
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

According to Rec. ITU-T T.872 (06/2012) 6.5.3
APP14 segment is for color encoding, it contains a transform flag, which
may have values of 0, 1 and 2 and are interpreted as follows:
0 - CMYK for images that are encoded with four components
  - RGB for images that are encoded with three components
1 - An image encoded with three components using YCbCr colour encoding.
2 - An image encoded with four components using YCCK colour encoding.

This is used in imx-jpeg decoder, to distinguish between
YUV444 and RGB24.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v6:
  Switch variable to lowercase Lp->lp
  Check for "Adobe\0" in Ap1..6
  Make the transform flag an enum
  Removed a change in comment section, a leftover from a previous version
  Thanks Philipp for feedback.

 drivers/media/v4l2-core/v4l2-jpeg.c | 43 +++++++++++++++++++++++++++--
 include/media/v4l2-jpeg.h           | 18 ++++++++++++
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 8947fd95c6f1..d1483e7a775c 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -45,6 +45,7 @@ MODULE_LICENSE("GPL");
 #define DHP	0xffde	/* hierarchical progression */
 #define EXP	0xffdf	/* expand reference */
 #define APP0	0xffe0	/* application data */
+#define APP14	0xffee	/* application data for colour encoding */
 #define APP15	0xffef
 #define JPG0	0xfff0	/* extensions */
 #define JPG13	0xfffd
@@ -444,8 +445,41 @@ static int jpeg_skip_segment(struct jpeg_stream *stream)
 	return jpeg_skip(stream, len - 2);
 }
 
+/* Rec. ITU-T T.872 (06/2012) 6.5.3 */
+static int jpeg_parse_app14_data(struct jpeg_stream *stream)
+{
+	int ret;
+	int lp;
+	int skip;
+	int tf;
+
+	lp = jpeg_get_word_be(stream);
+	if (lp < 0)
+		return lp;
+
+	/* Check for "Adobe\0" in Ap1..6 */
+	if (strncmp(stream->curr, "Adobe\0", 6))
+		return -EINVAL;
+
+	/* get to Ap12 */
+	ret = jpeg_skip(stream, 11);
+	if (ret < 0)
+		return -EINVAL;
+
+	tf = jpeg_get_byte(stream);
+	if (tf < 0)
+		return tf;
+
+	skip = lp - 2 - 11;
+	ret = jpeg_skip(stream, skip);
+	if (ret < 0)
+		return -EINVAL;
+	else
+		return tf;
+}
+
 /**
- * jpeg_parse_header - locate marker segments and optionally parse headers
+ * v4l2_jpeg_parse_header - locate marker segments and optionally parse headers
  * @buf: address of the JPEG buffer, should start with a SOI marker
  * @len: length of the JPEG buffer
  * @out: returns marker segment positions and optionally parsed headers
@@ -476,6 +510,9 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 	if (marker != SOI)
 		return -EINVAL;
 
+	/* init value to signal if this marker is not present */
+	out->app14_tf = -EINVAL;
+
 	/* loop through marker segments */
 	while ((marker = jpeg_next_marker(&stream)) >= 0) {
 		switch (marker) {
@@ -519,7 +556,9 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 			ret = jpeg_parse_restart_interval(&stream,
 							&out->restart_interval);
 			break;
-
+		case APP14:
+			out->app14_tf = jpeg_parse_app14_data(&stream);
+			break;
 		case SOS:
 			ret = jpeg_reference_segment(&stream, &out->sos);
 			if (ret < 0)
diff --git a/include/media/v4l2-jpeg.h b/include/media/v4l2-jpeg.h
index ddba2a56c321..c1904aa3f7cc 100644
--- a/include/media/v4l2-jpeg.h
+++ b/include/media/v4l2-jpeg.h
@@ -87,6 +87,22 @@ struct v4l2_jpeg_scan_header {
 	/* Ss, Se, Ah, and Al are not used by any driver */
 };
 
+/**
+ * enum v4l2_jpeg_app14_tf - APP14 transform flag
+ * According to Rec. ITU-T T.872 (06/2012) 6.5.3
+ * APP14 segment is for color encoding, it contains a transform flag,
+ * which may have values of 0, 1 and 2 and are interpreted as follows:
+ * @V4L2_JPEG_APP14_TF_CMYK_RGB: CMYK for images encoded with four components
+ *                               RGB for images encoded with three components
+ * @V4L2_JPEG_APP14_TF_YCBCR: an image encoded with three components using YCbCr
+ * @V4L2_JPEG_APP14_TF_YCCK: an image encoded with four components using YCCK
+ */
+enum v4l2_jpeg_app14_tf {
+	V4L2_JPEG_APP14_TF_CMYK_RGB	= 0,
+	V4L2_JPEG_APP14_TF_YCBCR	= 1,
+	V4L2_JPEG_APP14_TF_YCCK		= 2,
+};
+
 /**
  * struct v4l2_jpeg_header - parsed JPEG header
  * @sof: pointer to frame header and size
@@ -100,6 +116,7 @@ struct v4l2_jpeg_scan_header {
  *                  order, optional
  * @restart_interval: number of MCU per restart interval, Ri
  * @ecs_offset: buffer offset in bytes to the entropy coded segment
+ * @app14_tf: transform flag from app14 data
  *
  * When this structure is passed to v4l2_jpeg_parse_header, the optional scan,
  * quantization_tables, and huffman_tables pointers must be initialized to NULL
@@ -119,6 +136,7 @@ struct v4l2_jpeg_header {
 	struct v4l2_jpeg_reference *huffman_tables;
 	u16 restart_interval;
 	size_t ecs_offset;
+	enum v4l2_jpeg_app14_tf app14_tf;
 };
 
 int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out);
-- 
2.17.1


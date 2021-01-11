Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 486C62F1F6A
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 20:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403850AbhAKTbQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 14:31:16 -0500
Received: from mail-vi1eur05on2062.outbound.protection.outlook.com ([40.107.21.62]:26273
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732738AbhAKTbQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 14:31:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHl5bzEzCsyB/JPeG7D+mS2K1VmAha4LStHhAAXGin9E+3OEG+QbdIiBMCn2KfpCg6yVUnVRPXHpCyVDrKA04zDlUoEfUbOT/ZHpREao2K8zqZGPS0tCr94MTeQtJcAEYrQx6FWV8Adte3i4ZaSGj9thCAB7n5bY87GWDD1c9BchZY34tmQN+9YzA+7tbnyko+X5kz/8vgyjysp0FJTQ2bdasmu0S4B0cWrMz8azQvmFjkbBsxsH1gG5s/cjbjfxxq5/noYe/rVLGO2uqkZysQCDXeaOxLtlmrJoXF4Ek5SWf7MzVxbmkKo9NLAekzM3qSuBWQWTL4dygnIHyrU3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpZVxHSn4+uVzbT/jFjb+zAYcl3bzm2CH3tgr7WTN2c=;
 b=QJ8glIeou61tnPFfWFKsd7fWo3BiSVzeb+oG5Qc7rU7jUoVNXWxjVH4wNV+Q0CTT8HVZK7BVMdDyJJkEevtAV0EpILWcwkcfF+E4MtofX2UkURndtIt5YPBErK2bvB+dcTZ8Ge/pLzeTra0sK+nT+sD7we5/KhjmEyxlgZqxRsz9/mA2Loj6G0qEsTySxLJ28/kZFLxnYtr4IU0LITe3d3lNE7v9+5HDi1tTAAu+Kldr0WN94WuM9cGxs0XoIZhCVwzvtoROPo8+LcGuPtij2deddRFJF7UcKnlB8EFsqzweyg9fOHoobz08d+92ZrNzMU2WnglzLts0XiKHudPb5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpZVxHSn4+uVzbT/jFjb+zAYcl3bzm2CH3tgr7WTN2c=;
 b=jY70G9I9YblSL9EUdCsxNBFCXS49B/LHp/UAQHFY58qyqqcr4SsSFt6PyluPBpP35fDlho5F/aG+Qk9DOXS064wcqzEqKp62hx458mMuJiuQZ5y0Gl9MYTw5ur7ry5nfjRpjHXq4p4SyBKnZhHEhph0BFdOULUMyLuB027G0LA0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4424.eurprd04.prod.outlook.com (2603:10a6:20b:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Mon, 11 Jan
 2021 19:28:57 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%6]) with mapi id 15.20.3742.011; Mon, 11 Jan 2021
 19:28:57 +0000
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
Subject: [PATCH v7 6/9] media: Add parsing for APP14 data segment in jpeg helpers
Date:   Mon, 11 Jan 2021 21:28:19 +0200
Message-Id: <20210111192822.12178-7-mirela.rabulea@oss.nxp.com>
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
Received: from localhost.localdomain (178.138.194.64) by VI1PR07CA0296.eurprd07.prod.outlook.com (2603:10a6:800:130::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Mon, 11 Jan 2021 19:28:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5e069d5d-73d9-408a-fbc4-08d8b667241b
X-MS-TrafficTypeDiagnostic: AM6PR04MB4424:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB44249BA665FEF299DB761666CEAB0@AM6PR04MB4424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sQeUNkAgvSK561D66NqhHf9eKSkqbcr1xhtl1AbtvfNNiErUhxT6z21NHZIBwhAXHnjZ0TwjiaNKPadOuAvuBjTPRCpefqSQtlINmmUOOJuxik1wYpVQvURJaixO9vxRQUh+NpfAZLyArGhhEt1nIDee0EqDA2P2Sp7O1AJmCPFkEbkJ8pbf2TZmc1MWRWpaLuwIcsGPGA9fpvsrBP/oKL5awYulk7CJWsATUEvoOn+mRm0ROJlUt5a6ZjjzEFPB+Mfcr2wvCE3vs4Vmrrj2E0/wd88r3NYBC02hp95hjJoiDbmNgocHAJ7C6B7PsuBvLqw43O4lBmMX0D4On5/cz8ljGFsI61NbhyTiG6KC5H//LzY/alw4XtiIKhtSi1P/pSKAvAJi+K3yNdj8tQ5BsqQPo4BAR29KPYgsEfPs5TrrDGUtmtHgW786emTazRe9PxT2Ei7YcnzaQb8rHYNEKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(6486002)(6666004)(7416002)(5660300002)(52116002)(66946007)(316002)(69590400011)(478600001)(4326008)(66476007)(66556008)(1076003)(8936002)(2906002)(6512007)(2616005)(956004)(44832011)(8676002)(26005)(16526019)(186003)(6506007)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Zi+0kvPWSbTlmoI+0L/Dm+0lzOV2ROOgfWNuJKtODu3yqnoVqadB0BRpgjNv?=
 =?us-ascii?Q?IA/Qe/YYbcWULPaD81ZjLGGfvCQgQZbxQHRnjxeDR2LG93Ytxs5oDGJGMpZv?=
 =?us-ascii?Q?CBDXwnGW8wTfgA07X24a1ar7gOlbmkg1R6Wb1WPnLSC0uOtXWAn+ZapD8d0n?=
 =?us-ascii?Q?OR5jldpMGBSmCcrUWPW3YlJY+od8G53fGFGgQTS1rGXlhlCJKVWOF8P0Y2l9?=
 =?us-ascii?Q?RHrPXz86McVJ9+Ctwd2nb73KPgl/nswwxGpde7zKllJrFARkAsL4VOUcyltS?=
 =?us-ascii?Q?0bhGDjBrgCwpnpcGaPqMw/4pRz++/Viwkc92Ni2bOVygI/JCE3ZOa6zNF5aL?=
 =?us-ascii?Q?ik5/+kvzGQdWFrLQcqYLJoVilaEL3v653GuNc8RWc0XyqprbQg2/kxCl+5tQ?=
 =?us-ascii?Q?thftNqGglfnjeV56NX54NclHZa0pdEuW3kR++7sqgfSZpZ+EqQVqL4s9CDTP?=
 =?us-ascii?Q?pA7FzlXRfAjt9z/p+ORcZLmU7pRBv/Sj8y+6YOTAPP+u/NVRWjoIRBQzjO9w?=
 =?us-ascii?Q?EIOFnFV4CRBRQwfb7e5a2sltZmgTMl4FSi/8/jHVvxuHRXK6G0I4lKjOo/xR?=
 =?us-ascii?Q?A2Rl8F0BWXsON9iaPs7ZaDZvT006XTVT5ru2eEJPDvfGK23SCs14cFDmEPMR?=
 =?us-ascii?Q?oNr9ms1rISaX2TfCWenqSYRnLZ8jhOorrEG5mtZ2wF8pPh7z0CG1NG+ZugvX?=
 =?us-ascii?Q?If9t9A0c3/F+aXZzAMKd93PNZPq63Z1734IoOU9RVYPB8CechMj9Z5UYai8l?=
 =?us-ascii?Q?zs58KB9LbkrK1k0uxMvEZ6Lx9Qe/ktFPSax1gSukShSuB5+jTURjoP6yd/5U?=
 =?us-ascii?Q?qaefWQkYtMIpfaYG76u8NIqBCMUTSh9xfPXTN9YWNTyp/G1rB6i48JBB4XkT?=
 =?us-ascii?Q?6mg//wSQRUx5gGXkDhhg8gQqf+auYdURHLjOvXyDDIxbzBA0KXxtzYMjeNDr?=
 =?us-ascii?Q?K13I5JDz21aYzuycCKE03lGeVvYRURGgRNRwLFnnIt+7DIxUsVBZKIWln3a0?=
 =?us-ascii?Q?XV+z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 19:28:57.5702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e069d5d-73d9-408a-fbc4-08d8b667241b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kY/6HlsuKQuYgI5jWyz2CuwtfEzzNxri7edWkdVbdubziHJ4Q9PXYclImOvFHxRRLbPeWpOhpzHGaAWsMbUsIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4424
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
Changes in v7:
  Check there are 6 bytes available in the stream before checking for "Adobe\0"
  Change jpeg_parse_app14_data function to differentiate between the 3 scenarios: app14 missing, or app14 present but with/without parsing errors:
    App14 missing => Added V4L2_JPEG_APP14_TF_UNKNOWN to the enum v4l2_jpeg_app14_tf, use it to indicate app14 & TF is missing
	App14 present without parsing errors => Return the transform flag value as enum v4l2_jpeg_app14_tf (new paramater of jpeg_parse_app14_data function)
    App14 present with parsing errors => Return -EINVAL from jpeg_parse_app14_data, also return from calling function (v4l2_jpeg_parse_header) when this error is met.

 drivers/media/v4l2-core/v4l2-jpeg.c | 47 +++++++++++++++++++++++++++--
 include/media/v4l2-jpeg.h           | 20 ++++++++++++
 2 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 8947fd95c6f1..8d5fedb136dd 100644
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
@@ -444,8 +445,44 @@ static int jpeg_skip_segment(struct jpeg_stream *stream)
 	return jpeg_skip(stream, len - 2);
 }
 
+/* Rec. ITU-T T.872 (06/2012) 6.5.3 */
+static int jpeg_parse_app14_data(struct jpeg_stream *stream,
+				 enum v4l2_jpeg_app14_tf *tf)
+{
+	int ret;
+	int lp;
+	int skip;
+
+	lp = jpeg_get_word_be(stream);
+	if (lp < 0)
+		return lp;
+
+	/* Check for "Adobe\0" in Ap1..6 */
+	if (stream->curr + 6 > stream->end ||
+	    strncmp(stream->curr, "Adobe\0", 6))
+		return -EINVAL;
+
+	/* get to Ap12 */
+	ret = jpeg_skip(stream, 11);
+	if (ret < 0)
+		return ret;
+
+	ret = jpeg_get_byte(stream);
+	if (ret < 0)
+		return ret;
+
+	*tf = ret;
+
+	skip = lp - 2 - 11;
+	ret = jpeg_skip(stream, skip);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 /**
- * jpeg_parse_header - locate marker segments and optionally parse headers
+ * v4l2_jpeg_parse_header - locate marker segments and optionally parse headers
  * @buf: address of the JPEG buffer, should start with a SOI marker
  * @len: length of the JPEG buffer
  * @out: returns marker segment positions and optionally parsed headers
@@ -476,6 +513,9 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 	if (marker != SOI)
 		return -EINVAL;
 
+	/* init value to signal if this marker is not present */
+	out->app14_tf = V4L2_JPEG_APP14_TF_UNKNOWN;
+
 	/* loop through marker segments */
 	while ((marker = jpeg_next_marker(&stream)) >= 0) {
 		switch (marker) {
@@ -519,7 +559,10 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 			ret = jpeg_parse_restart_interval(&stream,
 							&out->restart_interval);
 			break;
-
+		case APP14:
+			ret = jpeg_parse_app14_data(&stream,
+						    &out->app14_tf);
+			break;
 		case SOS:
 			ret = jpeg_reference_segment(&stream, &out->sos);
 			if (ret < 0)
diff --git a/include/media/v4l2-jpeg.h b/include/media/v4l2-jpeg.h
index ddba2a56c321..bae5a68bab6a 100644
--- a/include/media/v4l2-jpeg.h
+++ b/include/media/v4l2-jpeg.h
@@ -87,6 +87,24 @@ struct v4l2_jpeg_scan_header {
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
+ * @V4L2_JPEG_APP14_TF_UNKNOWN: indicate app14 is not present
+ */
+enum v4l2_jpeg_app14_tf {
+	V4L2_JPEG_APP14_TF_CMYK_RGB	= 0,
+	V4L2_JPEG_APP14_TF_YCBCR	= 1,
+	V4L2_JPEG_APP14_TF_YCCK		= 2,
+	V4L2_JPEG_APP14_TF_UNKNOWN	= -1,
+};
+
 /**
  * struct v4l2_jpeg_header - parsed JPEG header
  * @sof: pointer to frame header and size
@@ -100,6 +118,7 @@ struct v4l2_jpeg_scan_header {
  *                  order, optional
  * @restart_interval: number of MCU per restart interval, Ri
  * @ecs_offset: buffer offset in bytes to the entropy coded segment
+ * @app14_tf: transform flag from app14 data
  *
  * When this structure is passed to v4l2_jpeg_parse_header, the optional scan,
  * quantization_tables, and huffman_tables pointers must be initialized to NULL
@@ -119,6 +138,7 @@ struct v4l2_jpeg_header {
 	struct v4l2_jpeg_reference *huffman_tables;
 	u16 restart_interval;
 	size_t ecs_offset;
+	enum v4l2_jpeg_app14_tf app14_tf;
 };
 
 int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out);
-- 
2.17.1


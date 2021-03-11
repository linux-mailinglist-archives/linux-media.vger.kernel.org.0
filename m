Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EE63368AD
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 01:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhCKAaw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 19:30:52 -0500
Received: from mail-eopbgr60049.outbound.protection.outlook.com ([40.107.6.49]:63532
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229813AbhCKAae (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 19:30:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6rVxosIUV0EEeklRs39JbrTMK/6AP6UJcB+XXqEQX3Pa6nCwdlSG16JXw3nJvq3smB85bEHreBSovhoiNE/fuOmMuBLSVRDpa0OG34afWNZWLtruaMRTd2VappH+enJotJ9TJqwEFZeKXHC3GadybWkyWEkDyUTm9LZwj77zzG+YKYoZLg7llJADvZjMG9zqEQBOxM3FQBkDY3wpy8H9V4CooKq43wMOO1Ba0cmyc9G6JznxGeP4yNfAOQnneuEFGzAlPCkkKy/nIpaz3z26ZE4Ftp9byWofSqLxhWEOQW0imNOhT076GwT6tYWOeaeLF1iyNqdwDWCigwPvcSxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=En9A3bJBvMl6vaACC7iTS0CnBjnbctvi8A/pih+0Kjo=;
 b=irkM3NmhnaosLkAG8sZTWwQr1l+JgnWy2Y5YRMmFEievcBwk6OvMBcXPTrP0d22rtAPNqBis2a1BDGUg6MPb3rH+BszgZbj/7zgs9hby0b1j2QfcEMR9zU/aAkLO/kzT0Y4GGpAOORtGF8X52hTeKsqJrfHGrjRAd+HOpQF2YrlxzCF1QIvBM2vBmZnDXyDglQJwoBzaavLnHYYZLhBbAe9cOm4NLgotL9apAna6+k6/Ce0phzINQc5bnE8qXt39XPfB2yNatNigvV//qDOfMpbP9U26XMTS/LcMO5W5zlD2E3A0G0TQuwzdEjVrc0xAV3dHuDmhxFHwoL/hnKpGwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=En9A3bJBvMl6vaACC7iTS0CnBjnbctvi8A/pih+0Kjo=;
 b=MFYgyXczUg0bNSBD1ICHk/x/tzkR5Kr1HDgJ04jEGS+6zYJrdGBFfSQZR/F51MqF52LNaFic2B6H1zaCTUgKNfILrzc0qAsAGj9YLML86ysg68lGxxbKNBBDQeAT1K4sB5TS4gkVuGI9LS4wRAEEjuYImVQKrxYOLw8phrpIYI4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7959.eurprd04.prod.outlook.com (2603:10a6:20b:289::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Thu, 11 Mar
 2021 00:30:31 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3912.029; Thu, 11 Mar 2021
 00:30:31 +0000
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
Subject: [PATCH v9 3/8] media: Add parsing for APP14 data segment in jpeg helpers
Date:   Thu, 11 Mar 2021 02:28:49 +0200
Message-Id: <20210311002854.13687-4-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
References: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::24) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1P190CA0011.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:2b::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 00:30:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 67045e26-0426-440e-4fca-08d8e424e0b3
X-MS-TrafficTypeDiagnostic: AS8PR04MB7959:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB795934FD701ADE9B54403597CE909@AS8PR04MB7959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tps1RVC4baAjToQ8qQP+TORx8WgF+UY7KJnxuU4CxupQjzr0khVAJrUgdDvtYqGbrR6D/ffgedpHox5rumYtxHBqAYqLSqEYIYJfoC1wqAb3BezHK0eWEsOASymSW/zkLkNuMDiIKZoMZeplQ9DtZh/H8FB5Jc0eutEhxTLJeQLPtFt5tdbgBvIQq0WKIHagodh5qJOY7GYKWe+0ysnTXSlLrr3gBw6Uy34DEpfQcei/Ddo/dVvu8PFIncXgUtKZlVTao9rDm6iN8Cr8SeKa1YDlevXqSRrghLk3IABJw70jSoVTGXBRNSdKv5GrKHad0SutXaFWyget2KvYVMUz1f6l/d+IRIToIl5ottpkPEiiWzwakF3vbSQ+q3zMAVSjftRmZmKsmgIBaN2lrtmfKeNwSoK/1h9vMIMEOz5cj7tzSD/g1vGuvLXIzAJJRCqrhWhrBD5FXakyL7GERD6PhxNMJbrqVIhAl53fjXb1XEu+oZDry7kMiM8kPkVBLZs0bjgxJpovre+v5Y03vACzHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(366004)(956004)(2616005)(66556008)(66476007)(2906002)(66946007)(1076003)(316002)(7416002)(83380400001)(4326008)(478600001)(52116002)(6486002)(6512007)(186003)(26005)(16526019)(86362001)(6666004)(5660300002)(8676002)(6506007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xgPp7Zm8G7ECB9REgubeqljwkd86lhochNLj36+CmOhxSH6gVjyt3lCHs+TI?=
 =?us-ascii?Q?52Jp3JHAJDwY4oz6I2UJxMmImLFQDqv1mvcdFkt5I+gY5gWPst5yhCuJ6E20?=
 =?us-ascii?Q?rWZ6cfDFapIpmcTGLI+jCUcbT/LGF7GZa57EPNj/A9P28TH4dYsbMCxMJNdj?=
 =?us-ascii?Q?5RLEZhaHijcyTbLr/2d48Yn+m7bYDAMGqjzpGfM5EZBGZT8ahtgJqeCTFoVI?=
 =?us-ascii?Q?VEyBXNDCPAUTYwhy4XBcjds5QrH/TothuGRsZWeZ3u2QLC7Ba+cnqIRnTgKQ?=
 =?us-ascii?Q?B5FZU3G4qd7rdLaQvU1O+A0BfItt7pmD98poHQ1SUFiymfezCcoEgDyvkG9P?=
 =?us-ascii?Q?CBhcwjYTRfGgj4JVyYygICVLsOK2DIwxW7fhD5vxhCNxcW+EW+giczxNf5qw?=
 =?us-ascii?Q?m4TKVP4Af//oDtzriwa6mBzfVOJaLVwLEVjkr63Iq8/FwzW6j9YKTuR28yWO?=
 =?us-ascii?Q?20kBkV5KtHpNS3jbbxu/WH58nSrr1IkgPfV1OSmH1BoKKTus3zQ/AutEzFMe?=
 =?us-ascii?Q?8dGmmuJaJ8yFacQINbZ1+JH0NUqnl8/hZNEkV/UN9IKI9R3PAmTb1IxnnYOx?=
 =?us-ascii?Q?1VTtnntcZxQu4V3SaJJHpAC7s/48NTBar+S/LudhuxBzfJK0gyuXR5QlBV2y?=
 =?us-ascii?Q?ts00ejYqNxSLMTXHORosXU/udCno6SeLK/FDlq2MKf64TRBWfP8pGozNQ9R6?=
 =?us-ascii?Q?hwCP20+1qBwn3Qs86lm6RPUnH8mk3mii/kg45b4pVVmchTSuV0CaXSi6mKqn?=
 =?us-ascii?Q?g8ypkf63okAB0kYpbLRWYsxe1pirWLKHwR9XCrpkHKieOZYXHF62EthE703b?=
 =?us-ascii?Q?ZJq1Ya+x5ouEL2J0Q8NVojVUtWjWg3ejlEmEJ/bSVDEbK2dFzLgZnvdfP+Vv?=
 =?us-ascii?Q?79HEaLQlWmdbqAAL16kDMiGoWVf7+EcNSutrQH1RgukVPqWa6KO0+145BBZu?=
 =?us-ascii?Q?mUIkwM/Q1aqvXkIh75P/LQDBOtaIpWerftaZdmnuB8QGcp9eRmW9XS8iFH5h?=
 =?us-ascii?Q?+yZzRFbOzxTz6wwM8BgVJGBodDX+uYyVkEKZiKw/aQEhmGwqePwT1CyZyDY4?=
 =?us-ascii?Q?S22ZYb6P1RwRwWEJ1c5VkGVukU5YuUuTJTvDQkisuiECXZNJW7hDgStWR/zC?=
 =?us-ascii?Q?uAXdlyUuZo5N3xh9e60GALaPc44fX1ArwuBolfggNhJQvth/RuJAeErPenns?=
 =?us-ascii?Q?3/y7AvjldzUTFYc+MmA4JXbnhvkLX07+kGqUjioLy+b+d3EsEHlg3NGt6bux?=
 =?us-ascii?Q?MuAeqq83FN3NejPOO2p2UD+0Sj/XZQSEVs7cbBDxhtbLir3eRbpvvp10k+4I?=
 =?us-ascii?Q?x2bxjFWCo4OsDchcaineDSq9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67045e26-0426-440e-4fca-08d8e424e0b3
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 00:30:31.4227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1euvg0HV+GAa9gZxeXFbM1CnlGIKCoiI/JM7US+JsU3+7y+4bMdoLZeDyf5BvJuy3Gf8RTfjKSzglIToGA0COw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7959
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/v4l2-core/v4l2-jpeg.c | 42 ++++++++++++++++++++++++++++-
 include/media/v4l2-jpeg.h           | 20 ++++++++++++++
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 9071b6cc6d0e..ede40f2a5456 100644
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
@@ -444,6 +445,39 @@ static int jpeg_skip_segment(struct jpeg_stream *stream)
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
+	/* skip the rest of the segment, this ensures at least it is complete */
+	skip = lp - 2 - 11;
+	return jpeg_skip(stream, skip);
+}
+
 /**
  * v4l2_jpeg_parse_header - locate marker segments and optionally parse headers
  * @buf: address of the JPEG buffer, should start with a SOI marker
@@ -476,6 +510,9 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 	if (marker != SOI)
 		return -EINVAL;
 
+	/* init value to signal if this marker is not present */
+	out->app14_tf = V4L2_JPEG_APP14_TF_UNKNOWN;
+
 	/* loop through marker segments */
 	while ((marker = jpeg_next_marker(&stream)) >= 0) {
 		switch (marker) {
@@ -519,7 +556,10 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
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


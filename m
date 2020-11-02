Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20D72A234D
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 04:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgKBDK3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 22:10:29 -0500
Received: from mail-am6eur05on2083.outbound.protection.outlook.com ([40.107.22.83]:60192
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727808AbgKBDK1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 22:10:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVOH4M+QVYcnZE9F5n5y8N9L18PyfHUXvnqDEISklR+hTgas9ss4P0mByjDsGBv0vasIuTXUwabkaImjJRESALDPnAL/f5+SauqYKpzOJwSGoxuz/jTtq0xLi0f0VClnuEnOhNThacu0CSjzk5oNxcke+F0d/afeF8JwKOGwezvbA10/isqzWwM4j1q+Q7M0uhTfCBGwYAJg2ZrOjSePMCW6lS3p2IrzgFnyVdi08CAVFSqlhljk7Ysx77lQGIwuPy+g5wal1I7/j8pWdlbY6X+i3yCl2dr4y9S5Pf2bcCq1wVgBO2Si/UaI47r+H0wRn6TkF/koPwO0zEvRKpluyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOaS06nBIWAqc+zmGDEOAwaic8rZBc4QZ/isHwcYedM=;
 b=g8JN/VJm8oN91MgJwnUXk3sWt01f210Oq1RmpGl6nxspem1Cl4MfRv6RXOycVISE4nWeubDmevvZZMlpvS9bowZH+It2dFOOGuIQqVx4bdSMun9fQkgGh/Y544KXpZOwQ0ktk4OqRLQd7dLKGoBMzrPgolXZ3qy1NtG06C7hHa0tvpv3E3/cVccn0/BKYNYJvn1+sPwAY1NL/0optPE/82UrHLUXzZXUfrBzGS/XUx/qHXoGcLVfgvC0Luue4AxFkVZB4UidOerPKnSwjgVsoPVOSDHzNwzbEltrilRwakt4NhIwcpoUWBVAhVREuAU/ZkgiX5ZmLwVyDi5UljiZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOaS06nBIWAqc+zmGDEOAwaic8rZBc4QZ/isHwcYedM=;
 b=Yyd+5krf8eqnIUMu1MljXHgJoIvqYjrZRxLEc/wSn7wwG7MEFjo+zj37mbzQJqe4USkq68FMb18JiEQ/0ukXrlyxjDQrZbhbgKEiGsRZCIyn4jhS3+4s5H+t/tHGAeG/YOwlQXdkvtDHfdr6ccpnCu/hqYTLd+kqWZ+cmI11EvY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5173.eurprd04.prod.outlook.com (2603:10a6:20b:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 03:10:08 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 03:10:08 +0000
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
Subject: [PATCH v4 08/11] media: Add parsing for APP14 data segment in jpeg helpers
Date:   Mon,  2 Nov 2020 05:08:18 +0200
Message-Id: <20201102030821.3049-9-mirela.rabulea@oss.nxp.com>
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
Received: from fsr-ub1664-134.ea.freescale.net (86.124.170.94) by AM0PR06CA0128.eurprd06.prod.outlook.com (2603:10a6:208:ab::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 03:10:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 91b8a701-eaa0-427a-095e-08d87edccd97
X-MS-TrafficTypeDiagnostic: AM6PR04MB5173:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5173424DDAADC2D25DB749BCCE100@AM6PR04MB5173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l7yctgjKOYym5K8ThjT6539Vq/SNndGRPNeaiY2PCzbGdNaemfDHsuerB48LdfWSTVPB2pM5oJPjWSjuA3OTeLguRbeBtIIR5nPdWYEPZCYCoIFIle76pd91iQrZcpW7eDlYRos0+YDPro1db1J9o6utewXS+PxcsfjbaE9U6nQYkIqmEWGWIjAurjfx99TQ+FQBYDk0YjwDzrqGncGzYjW08YdfHoDrcdkUujEt5e3Uz07Xipcegu+qegmG59E4uB3dxph4uY0HJS007RhlN4OJZUpyD6+pwJQRxTp+Zd37scSJBCBVA++xcEqpJ7r6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(5660300002)(478600001)(86362001)(16526019)(186003)(8936002)(83380400001)(6512007)(6666004)(26005)(2906002)(6486002)(316002)(4326008)(66946007)(8676002)(52116002)(956004)(6506007)(1076003)(66476007)(2616005)(7416002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: d27UqU1SB8MsU1ZNfesvSpdB2p51YXVp3+D5x7+7pzwqOCCKt6nxmDevsjuaf0KSQW9zf6G1woSzYCKCnzQOj6rhGFyj++GXoKWBkXSPzFJ5pxUZCs38tyfk9XzTAVpfAjBkdAFDPpeh+jvLaUaQAvVmIDzUjcaBMtPnDLCZuzbE9tv1iu2HEU/n6Fj6bE9ZFlPB8kAugz/BRzoCyfqzSaLoEZ0Cv3DHPgBQlvmHgEZSeSKUmaGbfj4ZqLNMeO3qslVMN4OdIZmyIjNVhtPw42RWF96K4BGu7HDn7hbLs+L9PRDofkKq4QZZOV2KFqzjR417WAfmIHGn01VfJHAlop/fX464cSeYsJ1wc6JlsZedBqwh8QCraI8UkXOMJBHIz3ByuiEpYaRGocPB2Il6BgK3MXqkqWPlnSWzAxx4LBRbOGUBPhcXg+WPT34HgHEah6XsFbrw63R0jsJigfFGz7VEm/WVpkPzCre9jKWr/ryKx2X/f6z8m3F/IqJR0N4VxBYrMuT0YyWk4xdAY4TFG3F6obJqZHJmdZ/j8W+UtXnc0dB3SR0Xv2ZFm12FWH3yAkMK7yRs5eWO6B6EK3Sz42eBAS+x2RIile4BNEmnFIE12zm1VgFlc/wlJ7PLf+YH6pHKrvmfKVpdANaTbj0baQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b8a701-eaa0-427a-095e-08d87edccd97
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 03:10:08.1816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPnsYoIeCHgeUS0iiknFMSEMtn1+uccfEOtXwf24BdADYytVYxPMS1/0BSPVGXpVMgQTHmqr0Sfvpi0za/VntQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5173
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
 drivers/media/v4l2-core/v4l2-jpeg.c | 39 +++++++++++++++++++++++++++--
 include/media/v4l2-jpeg.h           | 16 ++++++++++--
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 8947fd95c6f1..a8198f98c158 100644
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
@@ -444,8 +445,35 @@ static int jpeg_skip_segment(struct jpeg_stream *stream)
 	return jpeg_skip(stream, len - 2);
 }
 
+/* Rec. ITU-T T.872 (06/2012) 6.5.3 */
+static int jpeg_parse_app14_data(struct jpeg_stream *stream,
+				 struct v4l2_jpeg_app14_data *app14)
+{
+	int Lp;
+	int skip;
+	int tf;
+
+	if (!app14)
+		return 0; /* do not parse */
+
+	Lp = jpeg_get_word_be(stream);
+	if (Lp < 0)
+		return Lp;
+	app14->len = Lp;
+
+	/* get to Ap12 */
+	jpeg_skip(stream, 11);
+	tf = jpeg_get_byte(stream);
+	if (tf < 0)
+		return tf;
+	app14->transform_flag = tf;
+
+	skip = Lp - 2 - 11;
+	return jpeg_skip(stream, skip);
+}
+
 /**
- * jpeg_parse_header - locate marker segments and optionally parse headers
+ * v4l2_jpeg_parse_header - locate marker segments and optionally parse headers
  * @buf: address of the JPEG buffer, should start with a SOI marker
  * @len: length of the JPEG buffer
  * @out: returns marker segment positions and optionally parsed headers
@@ -476,6 +504,10 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 	if (marker != SOI)
 		return -EINVAL;
 
+	/* init value to signal if this marker is not present */
+	if (out->app14)
+		out->app14->len = -1;
+
 	/* loop through marker segments */
 	while ((marker = jpeg_next_marker(&stream)) >= 0) {
 		switch (marker) {
@@ -519,7 +551,10 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 			ret = jpeg_parse_restart_interval(&stream,
 							&out->restart_interval);
 			break;
-
+		case APP14:
+			ret = jpeg_parse_app14_data(&stream,
+						    out->app14);
+			break;
 		case SOS:
 			ret = jpeg_reference_segment(&stream, &out->sos);
 			if (ret < 0)
diff --git a/include/media/v4l2-jpeg.h b/include/media/v4l2-jpeg.h
index ddba2a56c321..2b02d89f20b4 100644
--- a/include/media/v4l2-jpeg.h
+++ b/include/media/v4l2-jpeg.h
@@ -87,6 +87,16 @@ struct v4l2_jpeg_scan_header {
 	/* Ss, Se, Ah, and Al are not used by any driver */
 };
 
+/**
+ * struct v4l2_jpeg_app14_data - APP14 data segment
+ * @len: Lp application data segment length, becomes -1 if APP14 is not present
+ * @transform_flag: Ap12 byte for color encoding
+ */
+struct v4l2_jpeg_app14_data {
+	u16 len;
+	u8 transform_flag;
+};
+
 /**
  * struct v4l2_jpeg_header - parsed JPEG header
  * @sof: pointer to frame header and size
@@ -98,12 +108,13 @@ struct v4l2_jpeg_scan_header {
  * @quantization_tables: references to four quantization tables, optional
  * @huffman_tables: references to four Huffman tables in DC0, DC1, AC0, AC1
  *                  order, optional
+ * @app14: pointer to app14 data, optional
  * @restart_interval: number of MCU per restart interval, Ri
  * @ecs_offset: buffer offset in bytes to the entropy coded segment
  *
  * When this structure is passed to v4l2_jpeg_parse_header, the optional scan,
- * quantization_tables, and huffman_tables pointers must be initialized to NULL
- * or point at valid memory.
+ * quantization_tables, huffman_tables and app14 pointers must be initialized
+ * to NULL or point at valid memory.
  */
 struct v4l2_jpeg_header {
 	struct v4l2_jpeg_reference sof;
@@ -117,6 +128,7 @@ struct v4l2_jpeg_header {
 	struct v4l2_jpeg_scan_header *scan;
 	struct v4l2_jpeg_reference *quantization_tables;
 	struct v4l2_jpeg_reference *huffman_tables;
+	struct v4l2_jpeg_app14_data *app14;
 	u16 restart_interval;
 	size_t ecs_offset;
 };
-- 
2.17.1


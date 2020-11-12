Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47DA72AFF58
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgKLFcN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:32:13 -0500
Received: from mail-eopbgr60055.outbound.protection.outlook.com ([40.107.6.55]:38372
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728065AbgKLDJp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 22:09:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwuVsWGx1jdaSEuJb0YyeSj1MpUZDLnpIQY5BcWLmSytTDp+QW+yUaclfYQIUiiZ9cXGZeQL/BB96nf/a4y0Rg5Lu957RUeMgxbsuYheAb3a8Xv0y1dWuLn1ooEO4mV3A/q3HcRljLGvEIM2DEfHNZ6Aw9HkMCQlYrj8iDjMKtFaOpfyAUD8RwhkUd2HuHC0y4W9K4UNq2VxT6ER/d0WHhD4ktSaJ0TCjnVd1hrtt732Dp/Ao5SUScLm3e2y5i+EqnNBKBzaMr80JV0PE8sBOCjbhMNeEVkzTHH501tV7pH1lqqgmuZeqiIaojoHvSYaKwuuff9xZq962WPFhW3J1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHlhL5sJH8kU1rLprL/8aiRRca0eAOxmLP6P1uHXqZE=;
 b=lf8LNWiXd6/YxOc2vAJZvg0pzbqlcbBFPCYstOQufro0MTamYZebHI15U2hb6MjLXf4RyczbbvWB+I+7rpo7xipBFDKi/ErN3Gc8J7DxQrjf4yltn3xfawhAjZtxhL785WnE+XDak04TtFCV5dO78nv4DtqWKiemnG1lTE8t2M63OHkNW8F3eTerWlh1LCqjod5gUjSz2gUni+imY5CLDqWWWwnLOACMi+cztz7XPcr2AvMX94TYdr9dOkA7l03SBPIQN9sAXaVZvN+0JwMgXLAyUfPAAU2dzYl5vi2eCemmn8NieTTuNOQi3IrPZ4hCuu2DnM7vqxUNqJEcJZ8bJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHlhL5sJH8kU1rLprL/8aiRRca0eAOxmLP6P1uHXqZE=;
 b=Tn81TagLmpaEzUY0vZzh3MX+IvN6PY0DjZzdS7VbvoeIKi/jPolPFOgIY+lktNp0Fni79dBG5zOPkngrj32GCTgetS6/+i8WAjd18LtZkPlYVYQPlgphD6Hd/VtKDwgfttF08jjDVqKb/GlCho8uV+J/Tmy5MUypfaLAG9iHPSg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 03:07:13 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 03:07:13 +0000
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
Subject: [PATCH v5 07/10] media: Add parsing for APP14 data segment in jpeg helpers
Date:   Thu, 12 Nov 2020 05:05:54 +0200
Message-Id: <20201112030557.8540-8-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.138]
X-ClientProxiedBy: AM0PR06CA0100.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::41) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.138) by AM0PR06CA0100.eurprd06.prod.outlook.com (2603:10a6:208:fa::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 03:07:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1587e722-ad7e-42dd-24eb-08d886b80d34
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6997E76986D650E1AD0CAE45CEE70@AM7PR04MB6997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HIC0Mf9gDw2u3WBq3/jLHfp/8xLJN/TDpDTodo4FtVU0roaavxhYf0Gv8LV4S9Zu7pblsiwP7/WQ2BBWB3XM2uzauWaRifZkg0W77kaGoYjQk0OPbyp3FAP+CJy2UMTScm6za+JoumqTsyAoLzqpma28WHxKvxSXkwBeKJe+5MQT7+TYLoWEsQoJj1r9+nyNqjIP9fTRsN4mR81j7aCmkUNKsVtWdtro7YQ7qe4L+Uzvvhs9DVDtoVlHnnDUxnOdV/cd6jGq9gl2n5XDwjkNwZqGTIiM2LhLD2Y0rxnX6G0JPflpoGjk4x3HyNYwV2ku96wGlxHY6sRL9MrdYwnpeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(6666004)(1076003)(316002)(26005)(478600001)(6506007)(4326008)(6512007)(66946007)(66476007)(186003)(6486002)(2906002)(66556008)(5660300002)(16526019)(8676002)(52116002)(86362001)(7416002)(8936002)(2616005)(956004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: /VccLhr9P8nwwKxqUDLrVTxBxQp/7FOAHI6J/U+TPHVUNHo+VLdsOt/gmfQ1y6hjgXHik92BmSLjI+f9n6KG6LWc7ler/K74YaAHByK1WayWJHvq6NLj2uqHw6d3IBXleuu1M0jC0ocZEg35I5M+vXmlOZLW65S0FA+gW/Dw1yi+XI0wH0H4seJcGim/DXSlZiw2W9uaNnvk32wNCVcx5AhRl3J9JZB1uJ+xSJBotJ8eD093BXTFkthkRuVdmQBiDpjs0Pe9iT0sXMYHpYr4TTaX+h4dycNCsTIaZddWeOAEbJPxwRpvw4CPTkTniXNujG9PpmCk6PtolsqbMwdAsBI3KMV5MPrroirXj4BWc9wPQ+wi8PoDvWvdYJogqoK3R52Gys+czfm8pYZgvMUMoUEkIB2TDhNX9JiAIoSQLHwEkYUuRHon9DYi75F/SEgpUjZHivgXYbFKsD+cO8vh0Ks7XU7OyW9AEPQ+iZaF9bVWsylbWYL11S486lmSqnTEoD/95fZrgWWzC5F2gJGsIU1XbFuyZI2D3mc1ZWnNmsyHlKTuiahnX2p/HoBlgzBTG28PfkJfw3DqdH21b3vJJUIDUM3PVnAofynH+CvXVrasGbLacQBzQu63mnI+ETQnfvV8J+HmtV9d8Q9DbBakUVOCCSb+7sav6L0LKZcYJRg1R47XU0CU+Qps25tl4eJZo6kR+5g0llo10lLZ2SVKLEz5JL5fwxqHg1J/jScxRG0nOe1Q/IBZR76CiCUepqWRRPffa+FKCu21ADGNL4KJ9YQuVEBu/y6xNnksMblXFF/TuA55uhtYCmDrVmAWo2YuhtWx0D0P4xyIVM0KkrXZMXAoonNOGes4MKKIkhLTpKr254wUhV6bxKBGOe6Mx/R/xpbczaqsxnt2YvwILrfj2w==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1587e722-ad7e-42dd-24eb-08d886b80d34
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 03:07:13.0398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aecxRH9Xq5rtOijJ9pN+H8NFNZ2RfRkEQEuWiZFHrGlDbJLjtF0oRJg3aulN3+uhm6URMuWjesensosRhA9XbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
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
Changes in v5:
This was patch 8 in previous version
Replaced a struct for app14 data with just an int, since the 
transform flag is the only meaningfull information from this segment

 drivers/media/v4l2-core/v4l2-jpeg.c | 39 +++++++++++++++++++++++++++--
 include/media/v4l2-jpeg.h           |  6 +++--
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 8947fd95c6f1..3181ce544f79 100644
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
@@ -444,8 +445,37 @@ static int jpeg_skip_segment(struct jpeg_stream *stream)
 	return jpeg_skip(stream, len - 2);
 }
 
+/* Rec. ITU-T T.872 (06/2012) 6.5.3 */
+static int jpeg_parse_app14_data(struct jpeg_stream *stream)
+{
+	int ret;
+	int Lp;
+	int skip;
+	int tf;
+
+	Lp = jpeg_get_word_be(stream);
+	if (Lp < 0)
+		return Lp;
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
+	skip = Lp - 2 - 11;
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
@@ -476,6 +506,9 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 	if (marker != SOI)
 		return -EINVAL;
 
+	/* init value to signal if this marker is not present */
+	out->app14_tf = -EINVAL;
+
 	/* loop through marker segments */
 	while ((marker = jpeg_next_marker(&stream)) >= 0) {
 		switch (marker) {
@@ -519,7 +552,9 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
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
index ddba2a56c321..008e0476d928 100644
--- a/include/media/v4l2-jpeg.h
+++ b/include/media/v4l2-jpeg.h
@@ -100,10 +100,11 @@ struct v4l2_jpeg_scan_header {
  *                  order, optional
  * @restart_interval: number of MCU per restart interval, Ri
  * @ecs_offset: buffer offset in bytes to the entropy coded segment
+ * @app14_tf: transform flag from app14 data
  *
  * When this structure is passed to v4l2_jpeg_parse_header, the optional scan,
- * quantization_tables, and huffman_tables pointers must be initialized to NULL
- * or point at valid memory.
+ * quantization_tables and huffman_tables pointers must be initialized
+ * to NULL or point at valid memory.
  */
 struct v4l2_jpeg_header {
 	struct v4l2_jpeg_reference sof;
@@ -119,6 +120,7 @@ struct v4l2_jpeg_header {
 	struct v4l2_jpeg_reference *huffman_tables;
 	u16 restart_interval;
 	size_t ecs_offset;
+	int app14_tf;
 };
 
 int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out);
-- 
2.17.1


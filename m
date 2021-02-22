Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18816321FC4
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 20:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhBVTNe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 14:13:34 -0500
Received: from mail-am6eur05on2078.outbound.protection.outlook.com ([40.107.22.78]:48096
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230024AbhBVTKg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 14:10:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKK1vxhSyDGwbS1d1OHIXyzwAEwI/+noesynCkGk/ockC3DEGg6280T/YJFdZqo4Vennc8uVXrqntMlx8WWve9na9htfzNPIrLFVYxUbu12YeDAxKYqPru+7LSh5AwksfNDjIdh4zhUl2Nz3N+30kg+YG9dUtM1vQqaJF2V4J8TZnwiB5SftrOu4GSalD7bfXSPoh1XOGyuJzSn4izayLgRov0+l4m8Cd7lgdqTVZ3s28evtotDkbjfgTQmYHcbexIOMpWQDZTfWGrjY6J0Jx1C8rvFyHcfxm85vXPbc9f2dftXVVAR6F0r26RVDOTr8KgJuKYN5zpCu/MDXBXNJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kip8swhP6V1qygpr5Fgl1xPD3zylIQrW/cFpRxi61w=;
 b=iglbtGUsfTh4H54PgYkRl52EBmqqw7zIyvPoj32ymKRnMgsDvcQK0VhILrk3HwCn7IAKzX9Hx3C/i31HdsVxnLO9DIiwdlFVVl6/9eKLWqEI2bMKdyHQ9RQhJbYNcReoQfFPdAHayQMdG+N4tIUpVgr6ehaiQQe71LBl0WWYfA542XeYPjTP8dhanCkoM1MLg0Npq0rWfeZUYhO+J2QV/4N5ekwcSZ6KmplgWCR2Qnup9jm/WQ5P4RcfXDbIit1iafkqrcs9oax2aG/mfiKtOoZc9uF/fn1stkwV9akhCKUKUPgT0llr7f1UGyRot1TSbDV0WlXrg1v35YI1bZS+fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kip8swhP6V1qygpr5Fgl1xPD3zylIQrW/cFpRxi61w=;
 b=lnrqZ9KvlLjwB0PfL+vmvzZcXDFZtaN2jc6kkA0G3PNyL0ZneqWDdN+ku9fyZnEgnc4BMU10zTygo6ydkaZl6PpwoIsaGBDdUz2uNROOhqdKakziV762w5gl1MH2+eXLjgopGOAQi95ZB3J993AuCLdBXP8pBMCT1icPalKK0Fg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7591.eurprd04.prod.outlook.com (2603:10a6:20b:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Mon, 22 Feb
 2021 19:08:16 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 19:08:16 +0000
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
Subject: [PATCH v8 6/9] media: Add parsing for APP14 data segment in jpeg helpers
Date:   Mon, 22 Feb 2021 21:07:35 +0200
Message-Id: <20210222190738.2346378-7-mirela.rabulea@oss.nxp.com>
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
Received: from localhost.localdomain (86.124.171.30) by FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend Transport; Mon, 22 Feb 2021 19:08:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 15af462e-0871-49f5-bf29-08d8d765357b
X-MS-TrafficTypeDiagnostic: AS8PR04MB7591:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7591B7EA4DB4B08F4A6AF46ECE819@AS8PR04MB7591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oGdSL8WTCMqDI1nzIa9GsRMX+xYUbZZuolTmCy/0HZbqOUwG/rJtQFFCBElMpXO0E+usB2jizN3M7Fmh+C/1t+BSV+SEhivPToQi2mzZkXQoa5jYBKvtSiEF5Dp752L1AmgKlhseDH7UN4M2AogD86601Xui9NBjN3GQUzwCU3wN+9XFwZ/j7s6+MYCuzUKfP8GsocCb/rSGN1yPW+hZhnfGllIBBPD/DM/ZMyWZKi5lf2JUfyooNwWEsrWnT+gJftnVMW8dX3N0fi2Q9hywVRqjK+zJxqyme0peIFOTms5yqr42/MGsOwitQ+Gtca3oo47u+AWvE+R4VC6WgiMgAM9QFv+n3NpHpiegoBsKhGesFKuVEyuA46/xgNfzazNbwMFqXl05mOv3b2curnDhJB1QNd9N2KeXqNTGBiyJ88/RJB+FCRz16IDdvDUQre6N2FIjl5GRaUejg4EMBV1QsEKvrWUycCC1uj0WxpkmqBO+KL0yRESxogwSbN/2DAI6UGemIgtdLyzlziA38lVuuoQ/R2xruPNdzQHNMYuYMW8ej+7bj0UJ7XcojWu18PbdBsC5LVxt9s0r+oYqBYCEUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(316002)(6666004)(2906002)(83380400001)(956004)(2616005)(52116002)(8936002)(186003)(69590400012)(1076003)(66476007)(6506007)(86362001)(44832011)(66946007)(5660300002)(478600001)(66556008)(6512007)(6486002)(7416002)(4326008)(16526019)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ppWbyETKf/wzJFDnU/kjLhwOAMt9dgk8lObgf/KtF5uu+EPbQut/1ShRY7+l?=
 =?us-ascii?Q?+TP+iigRPFMIvh/A3QPgyAHUGXv2hKDRUId2BwHUBtgT5sj2cGMlrZuLTS8w?=
 =?us-ascii?Q?90bBlNSy0dIAnBvg8U4P66rOWP2Xtxe6TFa/0tHBFfNU1PaPBbjR4B4i1u6e?=
 =?us-ascii?Q?T6dMFnnRlQ5uZEfY40IsZsMtItBpAELJmkBdkAyqO1F2YCfrrZVBhtYfXOeR?=
 =?us-ascii?Q?DSZPA8uEju/KcHIa61DcnfRe0H/KAmpyMrvGE5yit81DehpPCCoxBT7EhvAK?=
 =?us-ascii?Q?iU+50UQgf+LNLQKoy4mpGeB3ovFaN7adgm+8ILSyp/Nh1jxrReq8SM5ko11D?=
 =?us-ascii?Q?N0n1MU0U42H8szCXNEAnPS8SmwfTaRl4T+HRApuABkV9VUXDUhiQcwBW7yDJ?=
 =?us-ascii?Q?XVnbLeYtyKlpwz0ZciyrI5ARluAyTAYczg8qPNyCnx5wFgRxPa/yKy+vWt2N?=
 =?us-ascii?Q?YeDvhh2+OMmfk/mbq6Su9yYyMiXoaZ+D8782lVWIfM8QuvqbdspikLI02QUI?=
 =?us-ascii?Q?/x3re8MF+rA5eWz09dRNTX3HYo9NEnjZ+KBbi/g48lCQyJt/tbidW4TxBQck?=
 =?us-ascii?Q?e3IRgNah/c86qzfktVowIdgzUj1jW6BtYi0E1iDj8G9WwEXI7nkBFSdExz0K?=
 =?us-ascii?Q?tb8KwgE5q24N3fXsmf6IDoAbwwuhediRGvt9O0CVlKdy5O8xqAPu+8kYf4bl?=
 =?us-ascii?Q?h1qIlb+i96G6U1uKc8cpsIlqHFtorjPXV6cgbQ4oauqZtIKxF84IlSYMjHmC?=
 =?us-ascii?Q?PdXAYWrXhmYeZAD6ZdBUNqnquDUZpQnd3QSsVeIO5YPGbrMp3peYEzIajZB0?=
 =?us-ascii?Q?VYOJcsJ2Tkd3UYqjxHzdXoesWq89WmxjgPvWoZmA87CafO5jdMDsyKyOZ/AW?=
 =?us-ascii?Q?Dbmh8n5A11lHxBRwX6tALxtfnsKDnFGJX8qL3wFm3Nmjb3eLtO1ep0AVqm9B?=
 =?us-ascii?Q?FBJ5zgaVOcqi1ZQoqMfst0IAGwREamLgzv1HycYJZA/sa9T4vbyLxvZ/jZ8y?=
 =?us-ascii?Q?pWa6oQajpfinvJBhfW1LydXVYC8nJT9n5RssUdE5pudS0q4auBwZWkOx9/bE?=
 =?us-ascii?Q?u5LPUHMS6bOzwDdTA3WPkTqhBCVm5f62LaX+U72tOwxuQ/oLrTmjy6ui8enk?=
 =?us-ascii?Q?A1xrQFBkOlXSG4zB0lRHEALvW5InQvv5YyIQa3tYiY2Usxn8IPlFxUftAX7L?=
 =?us-ascii?Q?1ExjVoPGHpZRcEdfIV4RciCPz6v5BDFsPrfzN+hEWINBnWvey38teO5nreKP?=
 =?us-ascii?Q?6UuTNiHLCE0AC76h7jOJySeCLjGK8a6AGTXI073bAJ2KHWCu469VN6yfXgqA?=
 =?us-ascii?Q?jRATNwNcPaDENuLK8y8otEji8bQHdyp7A6zSuwq2ZY+Mrw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15af462e-0871-49f5-bf29-08d8d765357b
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 19:08:16.4214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZ2FMnPq/sHzM2qSCRcCKPVsiPg+SXt6CqqQtt6ndUC21uLsRMiQtLbbCjw65FrCvLSHrHkG56Wi9Gp+Sh09KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7591
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
Changes in v8:
  Simplified end of jpeg_parse_app14_data, and added one more comment
  Added Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

 drivers/media/v4l2-core/v4l2-jpeg.c | 44 +++++++++++++++++++++++++++--
 include/media/v4l2-jpeg.h           | 20 +++++++++++++
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 8947fd95c6f1..ede40f2a5456 100644
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
- * jpeg_parse_header - locate marker segments and optionally parse headers
+ * v4l2_jpeg_parse_header - locate marker segments and optionally parse headers
  * @buf: address of the JPEG buffer, should start with a SOI marker
  * @len: length of the JPEG buffer
  * @out: returns marker segment positions and optionally parsed headers
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
2.25.1


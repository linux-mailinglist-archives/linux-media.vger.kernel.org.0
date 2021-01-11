Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3662C2F1F59
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 20:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390769AbhAKT3u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 14:29:50 -0500
Received: from mail-vi1eur05on2062.outbound.protection.outlook.com ([40.107.21.62]:26273
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388087AbhAKT3t (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 14:29:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+mhxbQ6BMCGuFfIPylI7BLQXpAikDXYipiaLK0jiyfVGm+EXHfLB/cwM34k6A/5x4Um4J+jv8P/c1xdt/52sy55zlUfKk2QNWYAygFha6zkV2S7O2sSXd5xVolfp3hzEjpx8oLgqt5DrwKic/GyWkx4oP5trbSFPEcu2uA3jSJjeR9X2uF1954ptqmdiXpF6LhnfdjNovgkvNfipGmsiWllZqMG4Ww7QxIatMd4a5lrn0XVYg3rP2qcppgqyYrmkgzIaZ7+BTUVNO6PaKnOb+I3Wlik+1DqQucMmfbfDP9Zx4H87jzINjQC9QwQ0tuMeg7lGgnOxRo0pSQnhavI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BEqKE0WEshYpnx2ix+u2iKrTnBWwv1GsrFu5KzTqGo=;
 b=RA/cfOU2sfmLqCLdFya7UsLzty2OJ7KJTeF0bmjYLMd0cP0L7krln527MtSqgNJZJKKj/EHlAjIv2ZbKjpIzRmZwoljLMjIOXNeWeO2zXjz68a8+IVroF8MJ9qu2fu8tF9sEczoHROJl/fMWXoVkAYkvENs9Vln9ZnnLw3pQJg1fQh9QWZRYqxfpNBhg1Uvr1urM9IK/4FON3oxLyzy7PtonO68dYZUQutNW1yMwfnhNsXStQJtRmtVWAdm9akOpnV6mh0RMHt8GcKuGRlEz7JchBP2xRhc7fNd8OgvV6RnDUdPlkqON7zAiF5t2uRUhmzE1YShwJ7Po0Wjk8HSRiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BEqKE0WEshYpnx2ix+u2iKrTnBWwv1GsrFu5KzTqGo=;
 b=IuwLQWuXcnZ3WXOeXSYl4JD9bAvFM1ymw1c6MQO/qRFqkJLwUeyy22Vq2Grv7vUS8royTVLHwcLr+7e9CL2BnZF9NPn1O5VdJdRgFKRCcUFIt1Zv9I9BoNCCK3+SMSkC+9SwQIB1vtXcc5T23LV1M0RP1W52y9ge7lHKizrwod4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4424.eurprd04.prod.outlook.com (2603:10a6:20b:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Mon, 11 Jan
 2021 19:28:40 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%6]) with mapi id 15.20.3742.011; Mon, 11 Jan 2021
 19:28:40 +0000
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
Subject: [PATCH v7 1/9] media: v4l: Add packed YUV444 24bpp pixel format
Date:   Mon, 11 Jan 2021 21:28:14 +0200
Message-Id: <20210111192822.12178-2-mirela.rabulea@oss.nxp.com>
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
Received: from localhost.localdomain (178.138.194.64) by VI1PR07CA0296.eurprd07.prod.outlook.com (2603:10a6:800:130::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Mon, 11 Jan 2021 19:28:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb9605fb-45ab-449a-bfdd-08d8b6671a14
X-MS-TrafficTypeDiagnostic: AM6PR04MB4424:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4424CE6C2B0B05EA17C2932ECEAB0@AM6PR04MB4424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dKEKanaLtmCzKhuauPyR4q2KSGGomREwo0+TkNeT2W/igdYWBitq+i3G93k6T9oZSVZVlUQBXfyhNvK7cA0x4PxOgJP3PaH251Zjx9YAQw5EGBEvmefSONHvjDOdU0Lu7FITel4nI2I5V3Z6ILQ4ucl9XW2oQ5J0QspxEyU1YtqnIzXTXUDFa9/fHYmDIwGNQYSLYOt0e1pVIMi8Mi5Icej6nkhjbsFFTtVff6TVjlWo7y2lhzc4timTVIgwoBPeT0gz0aaIolhaxKaCpWUnecG+Rap1OU8dDvtMyj1mNgRBJiyUpbcJLxC8m5ZDU1VgLJiTySy3bWG4iq8LGTIOv2DEn/nClc5l01EN6Rm6axywEav4R8OMo1LE0II+q7HGQzH6z/nR6rHfenODot77yWKEvKh7MrnI74EvnR0usJzzzSixP4s1AiXgDNH3d6xeUveUhYHeUfqeypUsoSJUrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(6486002)(6666004)(7416002)(5660300002)(52116002)(66946007)(316002)(69590400011)(478600001)(4326008)(66476007)(66556008)(1076003)(8936002)(2906002)(19627235002)(6512007)(2616005)(956004)(44832011)(8676002)(26005)(16526019)(186003)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iTNpcAqHSlK9AQu+G7etf+nRWQRAFAi06a5fQKOoRgf4n+TM/AS7Zr0quijW?=
 =?us-ascii?Q?aOQ3O+/Ik0Ym755MSYaCEqPB7W6VoGJSrW3Wy8UvsngPD2vnWS+OpgGy8Qum?=
 =?us-ascii?Q?kyG7vM4+bJAMlLEnm4p8gPjyhU/Q7+yejHqmXkLS2t9FDiKyhsA67wwh8XOq?=
 =?us-ascii?Q?DBUxw6bdNtia9/g83dfpB+eh/VI5eugLq0JnG0cdKTX3ICrn88U53puV9LN1?=
 =?us-ascii?Q?17NDk2hG+FM3yJT152YnUmm+KEChC+kVzsppyPBN0CQxDg+WtVqdOaYQFKd3?=
 =?us-ascii?Q?tySdfDzddidq4bAcW8B1OPQ/9plpWJpVw4B0qub7Y/OXVBSVymfcNj8r09LN?=
 =?us-ascii?Q?9P0a3M5EDa6F1AuWhyChdoR42xTX2gWj14ZYNix/sGJe0LAkrfwuDy5rgBNG?=
 =?us-ascii?Q?oJayE66mTv18IDpU54e0r95O6IjPMbIcMJaSEfZrbDA89XtiE+0pM/ufLLgX?=
 =?us-ascii?Q?JuGkT1pX7QYVtC6DcizkyhoKz7s6wCDLlHPnFPOkRnIQM9FMJrNIo0vQI7/V?=
 =?us-ascii?Q?4qibjIRzAw0UVCL/A0IuvXi/jyykKhxvzxSzKE+UDJmyQLzd145z1HNg1eAT?=
 =?us-ascii?Q?fUGg2PH+BbkKiBs3CVAVetgg1WAo8UnfogLL8pZ76bNmMeaDWTqmppxLWzqb?=
 =?us-ascii?Q?dLyvImdqSSq3e1la3Va8TA9GKBiR4Ggt4XlAs1UU4942JXyIl3JRiXshG9VO?=
 =?us-ascii?Q?U1xFRC2slRKuA1aAKP7Z3bk1/cnMvdCzwdSVMi1XGoLx1CJSJcRFxRqp4zXi?=
 =?us-ascii?Q?3O5qZ9lGZbeywPa/9WXfRdzlbLSG7dNrKRixN5mUGj2yNhog0rNZd6g2CltX?=
 =?us-ascii?Q?NtlXFCQPvgrpsFVhboI+0LUWidAaRxPM8WBvawbupUEqJP03ybGZi51xSo3E?=
 =?us-ascii?Q?6gXCOs72/yWoOFstpdIkxyMxKM4+u6LbZ/Q9O2rYh9P3Z7nAP5+w5k/q7PMY?=
 =?us-ascii?Q?4Wc0iT2iO+6snL64JEM4vErCjD99wGmhefLL9V3lH8NB2sctLHUXoJ5BbqfG?=
 =?us-ascii?Q?rdmn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 19:28:40.7291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9605fb-45ab-449a-bfdd-08d8b6671a14
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/J3Jwiq+UdP8Eje/BxW0uDyLFrGCDrnwN1NvkUSOE+FnN5NQR7PIfyoZDgTlfDYJZxhQ0EW3dyP0xWqdTVggw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4424
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

The added format is V4L2_PIX_FMT_YUV24, this is a packed
YUV 4:4:4 format, with 8 bits for each component, 24 bits
per sample.

This format is used by the i.MX 8QuadMax and i.MX 8DualXPlus/8QuadXPlus
JPEG encoder/decoder.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../userspace-api/media/v4l/pixfmt-packed-yuv.rst      | 10 ++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c                   |  1 +
 include/uapi/linux/videodev2.h                         |  1 +
 3 files changed, 12 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index eb551b57557e..4515f713decf 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -220,6 +220,16 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
       - Y'\ :sub:`7-0`
       - X\ :sub:`7-0`
 
+    * .. _V4L2-PIX-FMT-YUV24:
+
+      - ``V4L2_PIX_FMT_YUV24``
+      - 'YUV3'
+
+      - Y'\ :sub:`7-0`
+      - Cb\ :sub:`7-0`
+      - Cr\ :sub:`7-0`
+      - -\
+
 .. note::
 
     - The alpha component is expected to contain a meaningful value that can be
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 3198abdd538c..611768409d0b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1304,6 +1304,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_YUV444:	descr = "16-bit A/XYUV 4-4-4-4"; break;
 	case V4L2_PIX_FMT_YUV555:	descr = "16-bit A/XYUV 1-5-5-5"; break;
 	case V4L2_PIX_FMT_YUV565:	descr = "16-bit YUV 5-6-5"; break;
+	case V4L2_PIX_FMT_YUV24:	descr = "24-bit YUV 4:4:4 8-8-8"; break;
 	case V4L2_PIX_FMT_YUV32:	descr = "32-bit A/XYUV 8-8-8-8"; break;
 	case V4L2_PIX_FMT_AYUV32:	descr = "32-bit AYUV 8-8-8-8"; break;
 	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 79dbde3bcf8d..9e4359be04eb 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -586,6 +586,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_YUV444  v4l2_fourcc('Y', '4', '4', '4') /* 16  xxxxyyyy uuuuvvvv */
 #define V4L2_PIX_FMT_YUV555  v4l2_fourcc('Y', 'U', 'V', 'O') /* 16  YUV-5-5-5     */
 #define V4L2_PIX_FMT_YUV565  v4l2_fourcc('Y', 'U', 'V', 'P') /* 16  YUV-5-6-5     */
+#define V4L2_PIX_FMT_YUV24   v4l2_fourcc('Y', 'U', 'V', '3') /* 24  YUV-8-8-8     */
 #define V4L2_PIX_FMT_YUV32   v4l2_fourcc('Y', 'U', 'V', '4') /* 32  YUV-8-8-8-8   */
 #define V4L2_PIX_FMT_AYUV32  v4l2_fourcc('A', 'Y', 'U', 'V') /* 32  AYUV-8-8-8-8  */
 #define V4L2_PIX_FMT_XYUV32  v4l2_fourcc('X', 'Y', 'U', 'V') /* 32  XYUV-8-8-8-8  */
-- 
2.17.1


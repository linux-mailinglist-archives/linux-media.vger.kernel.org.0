Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F9B3368A5
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 01:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhCKAat (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 19:30:49 -0500
Received: from mail-eopbgr60048.outbound.protection.outlook.com ([40.107.6.48]:57828
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229570AbhCKAa0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 19:30:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+MbZvKqrD45YyWHfQcBVNLcC6SHALanQIhhcfZDI+HLK1xRtDh97rxrWlgMRW6D4LtWder0qfRXC9tJZTdcAnFOLRW1yjyY8bEQJP3Wvlps26ts01J/jqmsj5rRoRthkdqrunsMiVXNjwK5Bx9NH0FB+PhF6D/qVkGf+ju4du/N5XKG+xrVe1gGzpT08HIKbh2dbIT/6NMyyLYTyDpVOpLVAi11THPzHdJpsDrQh+d3creraoGuvRzSjCHSCEVJDk5Y/gyDDupiVUp0ckH/LnHiNYl2eA8PCfknl2iPJzmv+daMRHg7EgBYPAdVunLw9IK+ETN1V5baTVALw2qnIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxv9QQ2fu4n/bYdY2l1vKLDfPRtnMLfgUHF3INVnLRw=;
 b=PKjoePicPY+eQgUkJpEbDd6VAdVYp1LvsWSEC09cBknR/HNVKbzaB9z9wkVws/hf4HINzhgMpjji0oSwakqp3NqSj1eTUUbwK6klsNO3X26uxmk8JaKZTaUD7LNTJrgc3n6p1jqMDqdXlYPG27HnOCKeUab8bR+AIoLhAz0ffNt21BAqjEq9tk/OJmXNutHdlseDHlYCD8gzGHhN4QM+QFrMLuhQ9s3LbUr3PBOUo6LT2c/5FfS5jO3+38bHm67Quno0KjGQaDZogWFzx/ED+vPnOM3CXFp9yuUF/lI5iYXxOqK9+USe9CQmPbNI05+c3y/PrDN51/swBq2MP8JHtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxv9QQ2fu4n/bYdY2l1vKLDfPRtnMLfgUHF3INVnLRw=;
 b=A3rAmeSefgDoSe+NsA4G+QejxYoa9SdN1vU3COtXEIwXO3ebIL3N3P0Q7MfmHua8eErBqnlAvyogz4WU03R8rJ+VQaxGLu1fPPUT5S27l9FVAi7qWqCnmkWkbzPSmikcpL0DrZj8+JVVoxWDW+0xw5PixFOdNpx1orgudq0CNBA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7959.eurprd04.prod.outlook.com (2603:10a6:20b:289::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Thu, 11 Mar
 2021 00:30:24 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3912.029; Thu, 11 Mar 2021
 00:30:24 +0000
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
Subject: [PATCH v9 1/8] media: v4l: Add packed YUV444 24bpp pixel format
Date:   Thu, 11 Mar 2021 02:28:47 +0200
Message-Id: <20210311002854.13687-2-mirela.rabulea@oss.nxp.com>
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
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1P190CA0011.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:2b::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 00:30:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1f792506-b21e-4f43-532d-08d8e424dc33
X-MS-TrafficTypeDiagnostic: AS8PR04MB7959:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7959314D7C1D9E7A253A48B2CE909@AS8PR04MB7959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o38qbghILn4ARvbqG5MVchnDWVrTMRJO4M/TCCEET1uGi0meJYaseXLQGyPy7Tx9Nffgz/ce/2GMuVJi6C5lQInBf/wDO5sbqPUo+z4iCbXRTykhiWTEen1sou8rfdUPdXDlbLb8ekDf07+4EW/cj+zq7qfr30OVAXZgjKn7/H6fO8/Gu9E/j6qX38O66craSR1hLOubvzPKcUUB55X7w/72Z27Tf5bqyJrt35FH3ximIdGxXWQrXY1I14PWRB9jW/swh1FsovItDBxSEIzlXrCEkKgS+7wCwILlY1LAnjts0f/TmnfkapozEuqEkKu+RZnMuyekOrXQfErrAU+aIyU+G8Uyf8xYC7jD34Y1ee1T3RzdZXa+kFkeYGIHR3k4Gb3UzXADyC0jjC46lZe3tMtWvt0/K7WzP7A6jHanUZFxNm4GSRoFzW+wP1+8+zoYQ8/CnmyxVRjABZPMuUv9Ua3stQOZ/Xmxd708v38Tso4/29U3Gf1beFJjq5thErvE+BFC62FYbT2eLllWtIIFXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(366004)(956004)(2616005)(66556008)(66476007)(2906002)(66946007)(1076003)(316002)(7416002)(4326008)(478600001)(52116002)(6486002)(6512007)(186003)(26005)(16526019)(86362001)(6666004)(19627235002)(5660300002)(8676002)(6506007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?s1T0zeQ0uZurmG3RTYk8kxUi5zcA9ad04DlJKF2N1UmATDkXwXdssXR22oKQ?=
 =?us-ascii?Q?QVPQX508t7ZihaYBXszYV4Q336uVqtsuzDWQRFauwXo7ZPssNkrrWboZyxHB?=
 =?us-ascii?Q?z8gLJv5pXxmbMdD77PMT3xqQZdYl4/toer3dFtQ+RJeWu+PF1TUp4lwN7VWE?=
 =?us-ascii?Q?hgyvfFwNhPUsFn/ZTOtM/S3oSyEUoinfwRXWTyEL9gHAaFekUnEGH+OQFiqR?=
 =?us-ascii?Q?VDitqSKe7AdaNSZbBNcZvhL07g2U/vk/kIy6kHZPe4TLXbNayJsbshXHxHhO?=
 =?us-ascii?Q?az4qiuzB6krciRa0NT9JOASikeD1tMtCwJI6t8xSyKDl6Q6OyB3awV0DG9fH?=
 =?us-ascii?Q?TfHvo16bN8qXqHTjnYpEwQWVNhPe+9ZHx0YRxNDoIeKITyE0r7Qoxs+WhUBp?=
 =?us-ascii?Q?ObfrfUAG8PmlVKFFfmtOio3Y1DtD6JjR2jIjSAhjAQsk3f4cn5Fhf1rgLKgI?=
 =?us-ascii?Q?IGWViJGivcNXO6vv1h6lhRsIAzIXqF6F3/Z+IuLwsoalxBpWrKr79s/1sLtS?=
 =?us-ascii?Q?tp2FzzhuZ7SIl14b8W9UH10UOSigtUwdqD10XQHVAhDvAiwaxTjnfhTyTSCV?=
 =?us-ascii?Q?alRU/7y3cMuHmcmoSBtv1EU8/e25cCeEyafQXM7Dj8H4tgQ5aMC2vzl3Ms9N?=
 =?us-ascii?Q?bvvV4qD/rd6qvik4XOm8JEpG9VzS/jISPmNwS/Rh1GppvCU2/UecRfjxZHaa?=
 =?us-ascii?Q?5lCPuvkqNPmlQoy5zVUjzs1gHWhgXmyFF21xKpthDDp8c5uqthJVxJqSS5sr?=
 =?us-ascii?Q?Pe6H90grpl/kAjm+K9POa3ZIoP4B/Q3Vf15Ux93Lk+GxZzId/YklG8xe2Fwo?=
 =?us-ascii?Q?mZhpAG2xigvojf8YT3HE5iK5XqYblj9sYdGbFCVLNfT1E1IsSkVAMVXfcykR?=
 =?us-ascii?Q?QRqkVcgMthrag0Tl4pZ0cQ8WXIiN7L/ShV4mshXkiixEDUzMJoWOVXDL+lHO?=
 =?us-ascii?Q?WIyrZ3PtoTt1vopnu7HHGpcLIZRFwkHpArpNun8U+r4AQN62PHDobQ7EbtU8?=
 =?us-ascii?Q?Ed7iHG6g6CF4mb5jYbxGReEISvlEDFcbKIwiFCWQzFESmFawBIFEoq/QGwSF?=
 =?us-ascii?Q?59ddpPhhSWbOdD1eIb0cxkykBlIdM5Ua2DSM8ycRu0yxw/maCEPRATadPkeI?=
 =?us-ascii?Q?z5cYwa278F3WB//KUQZqrJsongqW5C7YOb7z0K9ZfzkErrdGJzj/lk4oS0YR?=
 =?us-ascii?Q?jFFTcIdITEhVBK5gvF4iSxcTC9xKa3TepBAY1KV624BKc0uxIEcocmD0wJOD?=
 =?us-ascii?Q?OxO95MBhWxBLkyTIsIdu6+2TxoZvDHGXABn9NpoNQPj/7hTZMgoQaRRWCS7D?=
 =?us-ascii?Q?DwfiAYsqb02HPY7hg4v3haRe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f792506-b21e-4f43-532d-08d8e424dc33
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 00:30:23.9270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hi+rs6vSu1V8ApX0qxb7SVnCHuYWCjLthMxydtyxg2Fx+IGa8cBfsqPWBTumSInIUCl7FrklFp976NNUbThxTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7959
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
index 560fd2ead8ca..65520c3af7cf 100644
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
index 31d1342e61e8..9a160283b3ae 100644
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


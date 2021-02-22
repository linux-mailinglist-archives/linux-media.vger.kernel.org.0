Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732AD321FB3
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 20:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbhBVTKR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 14:10:17 -0500
Received: from mail-am6eur05on2078.outbound.protection.outlook.com ([40.107.22.78]:48096
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232779AbhBVTJJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 14:09:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEYZzPHH64eee9rgtzCohuLSjVtIfoEjxRq6L8eBCkBuPdZG1ZI4JYmE9IXIWL9jhCzIhPvipy7uwZJtBqeERQVlKLsH3qqpEvg+NowUX+4uC5Y02Xk4N47cARMiLdBkxUeSoOgpK5gWDp0bzfafbo7CMXhM++3d2x5oKqmeBm8PTWNjg6RuvcPYeDrOb16o/XQIa23MUghy3XLJVCmogjVblL9bF2Ltb2JNw1ARiUCn78QwcuPFWs1X1OUwVrCrKWHao5jC0rqgIOHUzgtsyfJOaEh20vpIYTZzRznVkgX7OC6Qi2odHIdThYoVS09r43epM4C7D65zcGuvbxhxIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y377lFt38eYyXweL5wQ0CYE92kPldku3Y5QbHt3qLho=;
 b=AUljz1vsQqnQBK3kkgYcYv43X1ExI/34u4Vx91Zr2ExiShRUQoY7QqT2lNMSUPIHG0JBGm2p2mlyAjCxMXP+J1fePwLr6fgPEYoBYbMj74aDXdnhDI7Jq9GPsFfqpa/T4E4/6itn/Rl69dyfSjxQVqjlZ+G2Yqwb7QlnEN9Lz/K10jba0hMrscin32/j1lfFViEEHgD9sAS4REPk/V+KAzY4nthspdOPar9C0PWEq1d/pgCpAZzoDWLnUqqTGeSVSVJWEBIBtXf271jurR7pECgpmQM6LtW+BBHlSboyrnkaJWO6Klf4pJedf1+XMNoI6d6agEpIkFy0kXdd7j0BiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y377lFt38eYyXweL5wQ0CYE92kPldku3Y5QbHt3qLho=;
 b=dltf1fenIr9fP0fzDKXPMclw6zxFUkAnS4aBE4XMhxP5UP/qM1TZ515P4qgGKBzCrExP/n9OhGv9Zqu2RN1rh45aZ++XoDP+9MntR6tQ0eeQkE0/wSjanNTLXVxx+mNGCjr6jQEpWz6ye9HEMMCC+efxe1dz+f/87m3CyHUPIOM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7591.eurprd04.prod.outlook.com (2603:10a6:20b:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Mon, 22 Feb
 2021 19:08:08 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 19:08:08 +0000
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
Subject: [PATCH v8 1/9] media: v4l: Add packed YUV444 24bpp pixel format
Date:   Mon, 22 Feb 2021 21:07:30 +0200
Message-Id: <20210222190738.2346378-2-mirela.rabulea@oss.nxp.com>
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
Received: from localhost.localdomain (86.124.171.30) by FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend Transport; Mon, 22 Feb 2021 19:08:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 36dbacd2-7461-4bc2-5d90-08d8d76530a6
X-MS-TrafficTypeDiagnostic: AS8PR04MB7591:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB75915002859AB4EC3265C02BCE819@AS8PR04MB7591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sU2bgnJ5Aj1d83L3GaZ/ZkE/T8JdF1NS9SahhxcXImPp3Tl1JG05t7ufA3Kpa89yZWXg1r3VjKU60o/CPEJNNLONtH+14ax7v/jEHuxtQeaBWLKtG4A4fV3MlOxGyY1dz1Rd6QjaiFgZet5Q2pMuvUUb8KRbllC1h/+wKDnkS/rMNZQNrC6bOmGzbbFb9xNaR+nIKrqsuIs4u2WsH5MnAGIbsssVd+MVEF8sRLEaqSjrWzwnq6DqF3Iip6+Y1PXZjcmePxspcbv7yQZjRgeQmrVHQg2QeiJZiLJkp72l2Okvr0Un0EvswV1tQMZm9ni54lkbPqYxWptr27d/jVXpvQITwr+rl/yC39K9onMm26wvNRo9qmUiy33iTvhkkcQJf+qhHqaz6UqGxVPk+87SVcTpfJaD6RR88NE97pNr01lE4QcKFyvye8nNlctbV32EF1EfhRywiwshS/jkN29xMPcg9F6olD6YdTc95rUzMTH0Fpi3OO7q3gtgcPPxauN2i4NQoXLO7HmSk8E4Uwb7GR2NxFrPwNOpDCvP9ZuiHsuQNVNbarzf9WaUBgRVemRPNqijBMd7VCfJYbmSEpcQUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(19627235002)(316002)(6666004)(2906002)(956004)(2616005)(52116002)(8936002)(186003)(69590400012)(1076003)(66476007)(6506007)(86362001)(44832011)(66946007)(5660300002)(478600001)(66556008)(6512007)(6486002)(7416002)(4326008)(16526019)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IKUeGgAs8HE5QRqvcCG/kKOo1rYAtqWv7wgGfQLOdPHQuFm76lZvjIrnfhq2?=
 =?us-ascii?Q?Qk6AF/NC38ZZoJrgKBhhaxVx+Fjgf8d7kwG26qbR59HWuoe4pfjFc5L2RyZ7?=
 =?us-ascii?Q?DSkW15gh2Q4HKDZ1PVx5S7/byaTchNDavJ4xt1xcUhE1B55u3+7jwnBi8o7c?=
 =?us-ascii?Q?7OTvmjIoA40MTWxVX1+mZZUNZfi1I+E688TO9DUSL7pA0X+lga+BtFo/iqD6?=
 =?us-ascii?Q?mHv3Siy1nCSnD7ym2EJv10SF33oPQlsfuCEfCFYJ1H33g7+lMxt+z5/Tk4Ow?=
 =?us-ascii?Q?c5Hjrsdu9H3JJ0IeKaCPi5a+0NjXZZ7QvMXNkdW0p1T0cxD2nzHH+WYcAGW2?=
 =?us-ascii?Q?RHANaIN/XJZnK/r6PVyTau0rhU5DkGfH/3gtOrPlFIgqzCARgddSDC8+kbSF?=
 =?us-ascii?Q?CsPgWOVAgVgQ4jgErkYIa/m2VJI+cbWQK1BfZZR+2x2j81TwEYnB0w+pNe4R?=
 =?us-ascii?Q?XFE9jXtmD7Klg9JJv66+mKwU/wL4G6txeOSB41kFcyuQnlzQ0f6U8Elu3fvr?=
 =?us-ascii?Q?dNlxXNkgB9ViBz0MtgW3iOD15JUgI5puKe20o9ONIYxaKobYwbvy6MN9mps9?=
 =?us-ascii?Q?dzWLmdBLnDzo3PitDCLpVJ0Mc0vt4/MZoHftt0hYoyobz2zND6QjNY/Qfqvq?=
 =?us-ascii?Q?h6cXQvK86vYsm3MqSKrANeI8c/i6zLlUx2lwPAmsQs7w1ZDKHDQslwooq/bb?=
 =?us-ascii?Q?XcnuNkvDj9NAeHsx4mFgqWL99ykIJoPY9JtXwk/dPAqmWEdd8kQl1hpgSZBg?=
 =?us-ascii?Q?i48hoQ3YcJ+nK3+XgRVlUi/WWndlGZz5tNNbaznh9xpD7LiNKyfB7hrlPIgW?=
 =?us-ascii?Q?dRcWSEFdCJys4mhaZ9P8h2R3wSOCtOqlB0jIRE2S+g+VU13rfFIffqg6l2cz?=
 =?us-ascii?Q?ZFnaPZDs0hTuLXf+UQQH0vcbK6VBKGouG38MNlq4VnKQU2BwY6RHb2inN7ZR?=
 =?us-ascii?Q?3Q4Ce8UcNq78I28fw+n7KlFG+FFNcs3I/Pymsg6cioQCMJWygIjiA6X7DKNq?=
 =?us-ascii?Q?oaNHDFmiiYZs1GEmDzr1RPtoUVw2uMH1TxQQ55HeLHeMfsPhKRuWJuyyohS9?=
 =?us-ascii?Q?LPq9M5vX+Pf8nRI1kQKGTi6KSzTSMLgeTQsFNpWAggDxD5WC13q7KGv7YJTX?=
 =?us-ascii?Q?xvZy5LvA87jQmg/TSTxP7YNxNWvsUdmoYfzY1w893PNkdDNpxslHfxNMxnxG?=
 =?us-ascii?Q?NqNgoHRF6X99LpaV4VRw/yYi1otIbHD9JiAfH9zuSLaY7B0QP+FKyp/uI/rI?=
 =?us-ascii?Q?L+DDdatFcaOhqO4EW1VizaN69cA92MrCFOhgdYZ+ZMTm6uWgvr2h8voHsv3A?=
 =?us-ascii?Q?tkAbRCT0qJvDWhdJt6Dh5e2B?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36dbacd2-7461-4bc2-5d90-08d8d76530a6
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 19:08:08.4481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sa5ng1ZEzOEQ8yyOLwNhCeIyk3EOisAqVHOm/Tug9prfUAUq92XDnagSznECddipUZZ8OLlC1nR8nzwWTPRW+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7591
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
2.25.1


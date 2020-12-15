Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFDD62DABF0
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 12:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728747AbgLOLUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 06:20:31 -0500
Received: from mail-eopbgr130083.outbound.protection.outlook.com ([40.107.13.83]:62016
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725535AbgLOLUX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 06:20:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njh0hlS8SarXhbMTKEk5+TLSaIMLqc2fxHKSZh+pkcgeXsVZDEQ+nWvqmbFy8rW3gnPMGjPwEbwaz2P8aaR93giSoX7S9XZkxoAOB+tYfreWavAPE8ddTpI7SlbwlIyGRPIqYexhgq6geVm8syVcXLp2G8dVaVVR/+r6QUAWL+YOU+StOBEIjFVuuMevRfQ+1W49AyxXuo659ZBhH4oY5D+3xcPBQRiC54aDgZMcnA9Q4TucabS+NdsmZkeI4RdD3mjjqYXWqIn2O0YiOdomme9Sr4BL/qx/SCj1Gj4SdauSLGrdbTfSrxS1ExPLRT2p1eN5OOQibikwZYvF4FPzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fjSSztFyXmrWlXW+9CELpnV1LCInU/n3kAg5nfEWgI=;
 b=bpiMFH7ejxjkxf2B5nw8+D8HlCSVmYRDudA2oA4JLgsrCi6BMv9HuiRF9rJRa6HTZMz9BpkMtkxy4gTxbFJz5GpCBFvZNvAAvIRshNC8FQAV6Mx3V2JzZwyEX+P07bwUws8vSVSpAbzLDFL1jlR9dw62Bp4mOgyJaucZdznTyEdKlxmpxvnr4GcoZRjrapWAn9/XZHhE4tq5vIvizgTaKon9qaB64NIQS7uzN2PwwMLUuvJcLn9JjK6X0/su2zWhfCCoU/ijKftSvK7eKyuDDJo14aVKCy7yYHSTo7S+HrPmswXqCx7fBV/+C2q1RICnxpm75frDNUaEoseR6Jx4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fjSSztFyXmrWlXW+9CELpnV1LCInU/n3kAg5nfEWgI=;
 b=BnvbBlfYb7QSDhKC+5xSh4OjjmLZ9xNwYnyEi+j8RcqTgNlg5+rj/eg2Qa3y9L4I28JAauUNKYiRpiMWU68PPBr5E4DToxUu2O2ucVTsQBUEQfxqeWO5z9pU7YlxaJnu0r7S+lyonG7FAPJzBwq2NxQbjMa2Yws1I1Vi5N+5zqg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM5PR0402MB2737.eurprd04.prod.outlook.com (2603:10a6:203:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Tue, 15 Dec
 2020 11:19:09 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3654.024; Tue, 15 Dec 2020
 11:19:09 +0000
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
Subject: [PATCH v6 1/9] media: v4l: Add packed YUV444 24bpp pixel format
Date:   Tue, 15 Dec 2020 13:18:35 +0200
Message-Id: <20201215111843.30269-2-mirela.rabulea@oss.nxp.com>
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
Received: from fsr-ub1664-134.ea.freescale.net (79.115.51.151) by VI1PR09CA0178.eurprd09.prod.outlook.com (2603:10a6:800:120::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 11:19:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b6e7f218-79bf-4b30-d6f9-08d8a0eb3e72
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2737:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2737277FDB53BAD8C526F21ACEC60@AM5PR0402MB2737.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0UGXzk4bAVB8DydHAtREkjZ1CdeJXLGIkQuGm2ywZYAFnlf79aAI1CZFvdmXSVtDfAuimTaymU/8XRdYrvqe8WKW5dpfRm1eT0Gf3UCGq+P0zz5oKxIZ+uwd9ewMJA/uuY+K7Tq8QIXGowA/LKDmB2XkJg0NH8S6lS4mS0E3G5joVP81YCVeRQIBlqzPqjqvmQEAGVHI9o5ZEtaDGnDAKLROsSOSnn6phNQcpEbeJhXEeWjSI6LVdHx6q4k7hM5rB6T3TwhaeWJi1qwOnL3FE2vAr2rS4vQ5EiAjLcAuFiHNYTUnxBcPoU2gwowjgby3FHSHK6G/TxuUJJaGEaE19Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(2616005)(16526019)(8936002)(52116002)(2906002)(1076003)(19627235002)(956004)(66946007)(6486002)(66556008)(66476007)(498600001)(6512007)(86362001)(8676002)(7416002)(83380400001)(6506007)(186003)(4326008)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OMKowvX+lw+/KUuFmzL/k0JqJPEItHwfbgKkG8e4C2PbaZWcD4cqNuVYNzWR?=
 =?us-ascii?Q?bcT19/rEhH/HQXVFNHnQmKVZL6H8iGnyUi++CnBrPlhO7PxaRffrT+KCFQg0?=
 =?us-ascii?Q?ebquZLl5xnU1lBUmxD9zwW9Zgb3fEbIPKqHQwpOPtqydcLG+BfamzD3sjueE?=
 =?us-ascii?Q?Nsqan6UOI7GZPZ5tr2uJp0TfnM6/iW04eahPa7lS3mu9uR40Q0gBX/oElXwt?=
 =?us-ascii?Q?BBYQXo5HIX92eDBC+dZvpyEmAUMcZD6baVt+QQKchRy0AMt7LX7QdqfXs9Lh?=
 =?us-ascii?Q?DRW6ktBx31+vDvVDdMdO354MYOtCMwfWzhItbJ0xaZR/a9zqV0yt26db1ACX?=
 =?us-ascii?Q?evj1tJU9FQ/CPUCOsEDBj/XWUvbkuZyQEYGsWiTWmxnrJYNvQJxt0YhOdCu5?=
 =?us-ascii?Q?APP2HAqv+gylEl9EZ71JOEQ73qhf+XHXzw8D2HH8WX0uj+sfjp3WJMldppPZ?=
 =?us-ascii?Q?R2738L7JLGQO4HoWlPOEjliwETr6GoVjtdoEvGzhYje3Avgx9McJZhcoOBRz?=
 =?us-ascii?Q?+uSzYUsvr0YxDzohE7Vc54265Z3yTDPN8QIjz6vHIReq6OjOgv/JfW7grra5?=
 =?us-ascii?Q?bqF5/aa/hbE1i+sw4VVMlVGTo1wq9q87BeuWy64SBuNvRAlJ4YM7DOMbFmm5?=
 =?us-ascii?Q?vLwPKc0U2WoNHmHVwq3Iz2strNxfDrAhoYXKhcZqlKr+pUO3tzB/pYFHkJk5?=
 =?us-ascii?Q?Xv+QRK7XgWiMnv5nIUS+CW8yTrEePI95361t24eGIxzy2PN/Ormq6cqBvDmL?=
 =?us-ascii?Q?FWb+6NieVZdQqgndc907cCB2qfotRmBOy8uMqsVRSnQ1V41XIVGaYTvyLhC1?=
 =?us-ascii?Q?ofMwWFlBnAy68GWGPOSF06FGoEURD5eV0WpCl39Y9JapMmo1/rraF8JGEZra?=
 =?us-ascii?Q?tgOjClZu752DNRaEh3ah2NNQy3QJAnlfqxyArAeCD5+cuYk64Q1uDpKrc9r9?=
 =?us-ascii?Q?oqGiEkIV6XV1RFyAEAokvZt8aIRuLnID/SHctVhgggEJgPzJvk2QVikvSn8N?=
 =?us-ascii?Q?R4aa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 11:19:09.7178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e7f218-79bf-4b30-d6f9-08d8a0eb3e72
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmW9yZoVjZxrm+TwGG7aQJMSTQUCeP1oy7/QSGANRFktD9whJd+3P9nnoAsNLGwqgXU5dJq1IjFvf45ceUgx7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2737
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
Changes in v6:
  Updates due to Laurent Pinchart's commit:
  2f2a387e9fa4 media: doc: pixfmt-packed-yuv: Express 4:4:4 formats in a more compact way

  Added V4L2_PIX_FMT_YUV24 in the "Packed YUV Image Formats (8bpc)" table

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


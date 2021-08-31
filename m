Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5183FC0FA
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 05:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239579AbhHaDBG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 23:01:06 -0400
Received: from mail-eopbgr00056.outbound.protection.outlook.com ([40.107.0.56]:15430
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239478AbhHaDBA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 23:01:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMv/HC2T1TgMPCElZ6TN1AT5yYWs0SL2/NavWNE/nNbzVwvslDROI83tvNT2E2o+J68MfkQX0/OrafiNZM9It8pZIjjdIGhFWSC6XsyTP/aqjUIjovTtzt5ESL4mt2LQGudCt0hlGx4zYwXh/gCiaWrbfTraaNPcRRUY2oeC3O3LYn3j1Tya696k08/jw3q5OWYeCoynv2OumYZeuTdLlYyx0bguFRb4DjY115dTtUAxtSCLxJ4rtQpPO/aZZfB1R2lgVF6HfazAnBpdFElPGit4ICxkATh+296y9ZiH6e1BMI0B4J9FYSWUOZ0PJ99RJy/tt7eE9owMgYCGOpQ8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhxRUPnEwlV4CgYdBTvE2xDk5TIbD3YkypRNoc0XgM4=;
 b=NXb+6OFT+RrF3U8PtrQtdxTz5pfXZUHAUHLqVcs0TgZnjmY/IMOgQ5uiI5QTmmvuNIZuNnu+LsoITbvaviJ1Zdd0OLHp2144xsGceqLmpbiyMpeRUcPeHFG8E0rra5667UHwMdcJVliaxgvTZCwr+L4KvKuc5y6f6OHzX97az/dKckmioaRvz7JU/9xUx3fXObkKlO9OgPoBOGPmVa6EwL0BP6mNZhfR32Z3uFBCzYlaQ/hgA1W4Qjg8u9lL4atRgQclf2T9/o9zVv/FqNKDVq3oqRzCOUa9cf1Ws7n6uN1sZnEDRnVSS0JsvI3WXM+cRbIbye+KM3ijJuY0nQ8Nsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhxRUPnEwlV4CgYdBTvE2xDk5TIbD3YkypRNoc0XgM4=;
 b=EljPCc6RlStr/LOG+L85XjqVWP+DF8A0dZ/z8+oJYp5rCWze3bEuZboG/FbwU06eu7iAeL2UKVrTk+BD84enCqauzXkJ0DWj3nQmuYYKcu+ry0lMCdUgktdyT96IfkOgQz7P6BFNYWnujsbqeIvSf+nRUTZIABs5ibXfQ34iPvM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4888.eurprd04.prod.outlook.com (2603:10a6:20b:12::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 03:00:04 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 03:00:04 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 02/14] media:Add nt8 and nt10 video format.
Date:   Tue, 31 Aug 2021 10:59:03 +0800
Message-Id: <981eee1270fb47658f7821d59525ff4c53c30644.1630377507.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1630377507.git.ming.qian@nxp.com>
References: <cover.1630377507.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19 via Frontend Transport; Tue, 31 Aug 2021 03:00:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ebdf336-9577-4547-0ddf-08d96c2b6e51
X-MS-TrafficTypeDiagnostic: AM6PR04MB4888:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4888AFE0F0FCB98FBA515FA4E7CC9@AM6PR04MB4888.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ePWMt7eRCeYzOinA89xxIxMmz8HlrXCo4kRyqCFvtktaPgiPMnR4m62LCAxwUBmMZOctN54uyJhL1Bu6/0APcqBo3zWBSLqIzhziW/TCliqwgcA09bIUlilIAO2E4a2kBCCnL082sQR0F1aqbUxrvZPI242ve08EwEM329uFNP8PxEtHmVEi1qay/I8phFyr5UbZ0agGdgc2Ep6ah1ayd8qkE82nkYdior5ysKAe7Pt5mm+QPne3/0wJzxhQALCKykJpdBZz0SIwNDDdbP+TrO1Z5vopcRGe+BwHvvCd3BCFAYe6syT0ctBCBTKCOLcBEWZKGFQpLYgauA9q9UJ+YJxD9ec21Yn/7avMrwtEAWgHhvRDHX1pB6GRevRHS00A5fkvuzvQoY4wRweD+e6JMyEfPaJ7eh+4BbVKIWN58ut4YA2NIiPk3io60BiVwiieeWAsxRcEYoedXOvyhaM5Kh6PWaWFFMUdB/a5Wz4x3XNe3P8r/bsglZu9o/F4D6+TIorMk7YU16M1fGBABg0LXHPH0w2vbTexbhtpzFOXP3udk++Bw4RgO0DLDRnN8FU08EimTOhlDGBBtqBhZA7YDl6aJ47OCIpbG80PFimU6XXOkGzR5JhMkHQPTguaTU43PerYoxQRGe3pj+ktCPXV2KJ0CHTgpXn8d51aI8KmksLPhhM1l+C14AzopEgi0J+WZ8unN0hbgzA2Z/Gty/kN3Aa++jD7KY+3SnHJVYgKTkJGJP+hQJ73RIAyA1+BEzDAAo5FadEo3r+kzKrkQ1v5dT8M8MMGuOToiMRQ3Mweqf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(6486002)(36756003)(8676002)(2616005)(186003)(38350700002)(966005)(38100700002)(2906002)(5660300002)(8936002)(44832011)(478600001)(956004)(26005)(7696005)(83380400001)(316002)(7416002)(66556008)(66476007)(66946007)(52116002)(86362001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6I+o/X2cy7gbbBFJQTtNez9G9fShy8FQeSX5CkejktAM8kF8Nlxa2npwAK5z?=
 =?us-ascii?Q?/ob8o2RTvtoJkJKVoJxrsrIAMHJFesyPb5zy4rOlAiECGTl4i5jd6X3J0zqw?=
 =?us-ascii?Q?K6Fe6/dtjoZkC9WFwP/0fbLHDP/WHcAp0XQzRKJ65penpGTUdHsjwk2WoNuy?=
 =?us-ascii?Q?5EoE47NqUksU0XvotQOhx+qmoXIoEywpHMAfS+EQGfd/8FYPeKl1DPhW8YH7?=
 =?us-ascii?Q?nZ+TqZdnGJV/L6mwUshNrVv6KrNYaDp3hePz/N0rTu53oAXwdtf6AfyVprmq?=
 =?us-ascii?Q?/bvdhGp0QNAvRTyadRSAVOlp6NciaIR9Ecl/lZ6kAbKocSp5HQu2G1rIOmOr?=
 =?us-ascii?Q?M41w548g8h3XyFaoiNhr/hnGJz1PCVdGdb01G3tTWgxN3vilziVfsmDq3im/?=
 =?us-ascii?Q?vmHSh58fGw7FIsnY93/tl6UgXlMt90SsQkDoIW7UI6QrAg5v1obFi6BLyWEx?=
 =?us-ascii?Q?H9nArq6Yllydl4TNEjTqVUQDzeSlD3rDBccdjFWcEiJzq0gHpb7j5VdKeqEW?=
 =?us-ascii?Q?m73qIvHeREVyGmOmRS6em1UnJ7wdIKO6BhLj+uJ4+uN1/D7vH7TvjLOC/WnF?=
 =?us-ascii?Q?H7DiaDbWY1tpMmH4gpnrr/ayYb3wrjedycEsx6pQ0Pzzd4bxztRD31t5ejNU?=
 =?us-ascii?Q?R7sLueU5iJor+DOQewjD8IDTfvXiDiAO5jms7Dukrq3nACX7v8McXCe3U6yJ?=
 =?us-ascii?Q?fB5ljf9Izs7KZQr8lqxIkm7tVScl1OBMIlFDEObNVqRxa0/epRFHkQZt3qz2?=
 =?us-ascii?Q?tI7EPg3k7n9pLq8ajvkvI5v4yzHICPvuwo9Xlia3MGBnQKoythmF27htTTei?=
 =?us-ascii?Q?TBQrTBhJ/laxf3SHd1OvivRsWUhA6Bfvo08y5x1B1XM1FP29BwT3hBj2qQoE?=
 =?us-ascii?Q?Xd7lz6ESnZq15daP6RzRdMB9QSAnPR6DFyMBAcKjakFz45BC6bPbhOCyDqof?=
 =?us-ascii?Q?h6O7eWcbHtKeNCk2SBHAlD7bWF3uUFxFtxz2DOHLO+eYnR5TN9RELG9J2xm+?=
 =?us-ascii?Q?JTHN+CaKz2E4z5CC59zEztfbre5VWr6t+ypRkDU2va8cCNEOgnrD1IChmBqS?=
 =?us-ascii?Q?YQNM15pAFR17UWDLcv/JEcRwBlRT1XoOU/U74RWlg89MBkUAhqdKF3gQUSPR?=
 =?us-ascii?Q?4VGCw5stRyGn78mvv/IlbVk4h571umTsTI//IjxsLllzAIcnqNuIjKLqKuiT?=
 =?us-ascii?Q?ysR/Tub7CBFdWZhbtaab/Ki89JpWU3WLePtpKvFpps4D7LFZeWIRmybD+n6b?=
 =?us-ascii?Q?ceMAm9KEukDmg2E3K9OxwrzqT4jHD7Owt9vY0KGJ/yM3DZaA5vJ5V9RExiKn?=
 =?us-ascii?Q?BBxhZ6Q+wgdwE/SfcnHIWbb5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebdf336-9577-4547-0ddf-08d96c2b6e51
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 03:00:04.1833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGEOM5zLAKdMFBmgZGz8QhP6tLgX0UzENnwJyVKe3UKgWtjWiP6RpVQJzWiPqFCZQpBl9urZ0w0LoVp0vXL20w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4888
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

NT8 is 8-bit tiled nv12 format used by amphion decoder.
NT10 is 10-bit tiled format used by amphion decoder.
The tile size is 8x128

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst | 15 +++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c              |  2 ++
 include/uapi/linux/videodev2.h                    |  4 ++++
 3 files changed, 21 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 090c091affd2..ce3419d95691 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -254,6 +254,8 @@ of the luma plane.
 
 .. _V4L2-PIX-FMT-NV12MT:
 .. _V4L2-PIX-FMT-NV12MT-16X16:
+.. _V4L2_PIX_FMT_NV12_8L128:
+.. _V4L2_PIX_FMT_NV12_10BE_8L128:
 
 NV12MT and MV12MT_16X16
 -----------------------
@@ -276,6 +278,19 @@ If the vertical resolution is an odd number of macroblocks, the last row of
 macroblocks is stored in linear order. The layouts of the luma and chroma
 planes are identical.
 
+``V4L2_PIX_FMT_NV12_8L128`` stores pixel in 2D 8x128 tiles, and stores
+tiles linearly in memory. The line stride must be aligned to a multiple of 256.
+The image height must be aligned to a multiple of 128. The layouts of the
+luma and chroma planes are identical.
+
+``V4L2_PIX_FMT_NV12_10BE_8L128`` stores 10 bits pixel in 2D 8x128 tiles,
+and stores tiles linearly in memory. the data is arranged at the big end.
+The line stride must be aligned to a multiple of 256 bytes.  The image
+height must be aligned to a multiple of 128.  The layouts of the luma
+and chroma planes are identical. Note the tile size is 8bytes multiplied
+by 128 bytes, it means that the low bits and high bits of one pixel
+may be in differnt tiles.
+
 .. _nv12mt:
 
 .. kernel-figure:: nv12mt.svg
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 05d5db3d85e5..22f97a1cfbeb 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1367,6 +1367,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
+	case V4L2_PIX_FMT_NV12_8L128:		descr = "Y/CbCr 4:2:0 (8x128 Linear)"; break;
+	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "Y/CbCr 4:2:0 10BE(8x128 Linear)"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9260791b8438..167c0e40ec06 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -627,6 +627,10 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_YUV444M v4l2_fourcc('Y', 'M', '2', '4') /* 24  YUV444 planar */
 #define V4L2_PIX_FMT_YVU444M v4l2_fourcc('Y', 'M', '4', '2') /* 24  YVU444 planar */
 
+/* Tiled YUV formats */
+#define V4L2_PIX_FMT_NV12_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
+#define V4L2_PIX_FMT_NV12_10BE_8L128 v4l2_fourcc('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
+
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
 #define V4L2_PIX_FMT_SGBRG8  v4l2_fourcc('G', 'B', 'R', 'G') /*  8  GBGB.. RGRG.. */
-- 
2.32.0


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BFA40265C
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 11:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242955AbhIGJvG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 05:51:06 -0400
Received: from mail-eopbgr30047.outbound.protection.outlook.com ([40.107.3.47]:18390
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242772AbhIGJvE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Sep 2021 05:51:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfeITNZdVORuf2y/f6hG0G5pF8qVCejocw/clcgb+LbXPc6wv8RGIDisux00QdoHeGiN+PuLKdIMrj0QxvX1g/rb8OMsxTLqTJxe4NJuXsT5YDqD+63mCp21no8fuhtW2PipDu+K6CeXGPKRHWmkfBE9BLSst2dExxvsemPwu8bjpbub66zieneeBFqiIZfvTES/NGXamhnyYcHm7fTpTOpJg0K4CJkrQ0EQxdEEbz1qO1l/ZTSpVH4hDRIRjFJVOcVYBN6NBVlafB/m0+10ambz27vj7Pff7ylvDKNVQOXG547TKI9MP3TbOhW6IefRyuIOIbBWHQNtjXRV6yKZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OhxRUPnEwlV4CgYdBTvE2xDk5TIbD3YkypRNoc0XgM4=;
 b=cnsdtedxVUmcqu7vDFK6OGDCZ9myrvxB/HIWqAQPqyw28+nAcp1JYLEnV4D0tcMwihGwwBUHbkuo+BE+xXKIxw9PAnBWA/BLfH05pcxEeDXfagaEyc+d7ePEsoSSymcGGvxaEyW/BJqw/aHFaUaf1GPfwBSOrfom69EBktbQ5mJ1a925xmeM126yMkgv7hZB1Rm3G2kHPHzKGpjr/XiFNuCOIo/D5udsYQZoMU6ul0WnRopWE/+sEbgG2PijG4+B09UqQpteZXOjmSJS5H5B4gQo54Touc72YoBIv08u8Zs8lzj6xj1jM0U7I3E+zU7Cyxu5azoeanMx8++JMbnzJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhxRUPnEwlV4CgYdBTvE2xDk5TIbD3YkypRNoc0XgM4=;
 b=jF5GiOebZqR++Wb8qmzAfeT1XNVx8hDzoGiRkpBb2uW4W2yMco4fYFFLJYBBrkpsmwODQ5pdQeWBGGBbA/njs1VQgOH0n/U0yw+x3jDzS7pttbqPuFUaQUez7nwJ/PvHx0jq+YV2p2F+1eO5vNDzYBTyJ9jCsxPjqG1p7uSxzwY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB7767.eurprd04.prod.outlook.com (2603:10a6:20b:288::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 09:49:56 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 09:49:56 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 02/15] media:Add nt8 and nt10 video format.
Date:   Tue,  7 Sep 2021 17:49:09 +0800
Message-Id: <ed68bb2ba3d3491ff508cce482303ad9485b8c09.1631002447.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1631002447.git.ming.qian@nxp.com>
References: <cover.1631002447.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0097.apcprd02.prod.outlook.com
 (2603:1096:4:92::13) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR02CA0097.apcprd02.prod.outlook.com (2603:1096:4:92::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 09:49:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5fcc56f-137a-46fe-1d89-08d971e4d927
X-MS-TrafficTypeDiagnostic: AS8PR04MB7767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7767B4889B2455293C3B420DE7D39@AS8PR04MB7767.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLiosQ/yyTo9Ml8CDc49Gt+9EzJSp6/5doKDjZY1vHrAFPDqZ4iXXV9O2ZYZj+yVLvW5WW2ECg0TdfMIVaupUwJfzzEr8cGB8CrIiXVhCwxhsjsCu32/ERPG2agW1qCnVbI32zZdiHelgKlr/6zfDREi009I45GvvJxpz74sLQ4TRolB9AHrLE2T3wCgk7yrygmvTTvEM69ldhLTdeqdTSl6zf/aILL+14sWESXUe1oWOvPuAtevZ9YnDDDhmPQ4TmU9NznVrTAnuhZSuffSvjrCVTVpnpeRvLAtAYkCrLdc04kLpy7fO7BVP87ndGJAuP6ZhMz5VjouGm8z9AaE1Y4X6VC3lq2ms0AtY/WesOUpFFGgmJeTSETOn0NauxSq8DQggAxcMKDW5AV3ZYlCOaWLFzedrngC/rbSIi3RO+nWOiwhvFdl9LVSGHT1SzZzXSUUZTYjq37Jbn/1aOC/QbgS3ZPmWuZT7S1EfaKdT3OD8x4v3m6H9rLIQvuatZf/AVzKbeDdXG7HJxuaYV+Ml3rIDZfpR5FeAPGSdGk/td81D98sW1qx/yy14zHlIuvWCYH2Dt/4zt7P8e0YCWcjh+fd1qpQMA0+rZTmy2FCsAdS5v7iMd5VPrr94ri7ii6IShUfyn3kn8lcXB1BCLb1pg0Kx81ngT/nmilcCcuWNwuQvSrB2vGXt8SWQvMi+Y521bHmAOVVrjUFBQGY0VdyyGRi1z14qA8NsASQwMxqGFUjbCjaM5blc8dJtclkfVTfTJEE7tXhgp6ENo28u20y4T0LPaPdjavPsO2q1NBYIMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(4326008)(186003)(86362001)(7416002)(316002)(8936002)(478600001)(8676002)(6666004)(36756003)(966005)(44832011)(83380400001)(2616005)(956004)(38100700002)(2906002)(38350700002)(26005)(52116002)(66476007)(66556008)(6486002)(5660300002)(7696005)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EKjcIDb7Q606oqHJMhHsn7tWlqZby5PEdoviIyoz2UqEl/M+LlcLqatn1QkV?=
 =?us-ascii?Q?aJotFzL8YPtvBqadNGwY+wYsP2XGUqDFlSeeGxNWEkDoqjm0a7CirnTpB5Tm?=
 =?us-ascii?Q?wwE9Asq64i7HZz8cl0YDVFodlAR5kzp2gnmlVmLtfSPfryphP1gSD+NKTJbF?=
 =?us-ascii?Q?gr/9zBlDpvtayIrur7zE73DOMVh1r+G2/6a4yPek0nqMdyKmA0mTKAIxjyY7?=
 =?us-ascii?Q?mBSRSaTrAHOCF8Owu+E1kwKYq8H+iBlnAYpjDLNYLbXUkUe+7aMATe3H7zoM?=
 =?us-ascii?Q?FzBASvpOrD9EsXnIb7BpmyIY+zuyfFPNd+X/6YUW1z1PQFFxG81b6oeLyVi4?=
 =?us-ascii?Q?bDiaWMd/Le+QWnKFPxZmFLqi3b7JUntvWnQEfdIbVRaRMHgdUAE6ClbruyCZ?=
 =?us-ascii?Q?fPj6oNdYrgng5Xwj5e0hays3o69ZhWx0D7ltxzvjQgys4ick3X9vvmAqjE2R?=
 =?us-ascii?Q?lK/D3MwsqnzGiMYQsGzTAlv1p9mI4ASlqnaFYCs7hd9yqO/gjLZmTlETnLSi?=
 =?us-ascii?Q?NKdOYPEm/A9s3WV8JN1btm7BQFSS+V+yffN2M9whvsANGeXSj78Z7Vo3qnw/?=
 =?us-ascii?Q?nmRydAOddXu4OXwQE/eQDcCBhKKcZA56iGl1gHn78q2fVbFOQHb0E0AR2/zZ?=
 =?us-ascii?Q?6Q6YS/PoprrGyTV3ELNfRW/xbb2JbWRIBuwN9aScGb+NnTPOhIAfZWlsyiXL?=
 =?us-ascii?Q?/dUAv1lEKXwu2WMkvgZtQNkC+llgvTWF3pxkUO/hzzHq09MOwotgDSheiubn?=
 =?us-ascii?Q?LMcKGldnbC77emgVvqedpsOtuG114Y8NRitjl1SrrvUJsnm3fshy2wXZxsPP?=
 =?us-ascii?Q?liNFRtCHPvHwbktsYhhWmgJUtDOgeunSdeN9eCdsXO68RiTJpSmX7mMUdysb?=
 =?us-ascii?Q?7rmZcMkhtSVm/EfQfJZGuBsTCMSdjMJpYa/caSQvkoeQWLPaayAfWy/SUO+V?=
 =?us-ascii?Q?ewkuxm5XHphOH5IIqTU70zGBXRfwpLtIPt15Q9V6uVWTrucUCzLoBOBUxsl9?=
 =?us-ascii?Q?qwDdDUXHUJ60iK7W1h7WYvcBJeYSnsUDi5LyyFoqDlD8FZgMWQHpq7l567yp?=
 =?us-ascii?Q?oo6ABQD/C5ey2kK3+1if+VdA9WurHN7HapRdcoCYQ7mfi7aqEV6qXCuygfmp?=
 =?us-ascii?Q?1+jVKEoC0OLPpfazjIEYtzltCYZFNNC6CTUA5W38pRJP1v+trbrHvsgpgSXs?=
 =?us-ascii?Q?5dKXtmQRMPMZcYDZdJs0mI+UJ/kBRpOVehGz9JdknvFIDHY7UUeq7OHcXy8y?=
 =?us-ascii?Q?4NGIvnnjiArKFDDZ+ThHwYbuEet/W4b0LKLibdKRw6EMYCHvNBpYsjq652pV?=
 =?us-ascii?Q?QFvN/qPUt+HcIq5jspjCOBzI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fcc56f-137a-46fe-1d89-08d971e4d927
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:49:56.1516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cctXQjXjIZbfPe5hUaFUCpgFYG5UsZLE9Lzricr3bVKaS/EYsDTHbqG4IMPfHTEy1KeaTW012uCLGgiEKwrWKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7767
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


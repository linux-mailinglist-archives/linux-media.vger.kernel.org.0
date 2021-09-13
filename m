Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18734087CC
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 11:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238497AbhIMJNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 05:13:13 -0400
Received: from mail-eopbgr50086.outbound.protection.outlook.com ([40.107.5.86]:40567
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238465AbhIMJNK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 05:13:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRC0KsUzY4GEbTHTRzHU7pNP0kuSE993sogxL+SZqN1b22/6yOpQLFSrXwV82tvBp92KzjPTp7iAFhld0l0PGj1ckwIFc09LnindSvZjAhQ9/QUocxm/U05kvj9z+2kThid107h8oWYg4KGO3hP+epgN39cNWRsfNkQILdHghDVVwrbctwEgNfdkGhqgU2n7FM01hWyfzHU3yhPaJxw+WR/HE/5mW+hjqSbRcwRHeSJaYnbZTsA15TZKs7Nip5IuiNMtZ+efU11Aoavy4waZcKlzTl34dRIN91a8N+7iJCV92W7FJgE/K7bsf7pO41cvE+mRSGc8iFT6q8qS7y7jaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OhxRUPnEwlV4CgYdBTvE2xDk5TIbD3YkypRNoc0XgM4=;
 b=JyvJTaDvKY/MEZnLS5mgpjK4iZx+QNLe1aUrlORzO/i+8RCOd6k932DdRbrsr6RbdUBsUCgODjNWh3QgDTk1/A1Gmwq+a+f378sXx1cR2ptKVTzI5ePaSKoMb4rvs3QLw4QUeVulPvCq22k0+Tq9cJkLlwSdSpLroPDE/njgdZswGEEclLUE8xY9g6uTvxXi/Sa/yCazx9WeN1CWvzcg6A/zLfsLfPIR1mK7h/CmrXiUstH8HqGtGt8nIdutOlTGJv2GgSdAHrRFgVxSliSzo8MbUcso75jv39lsyGC4RIpffqEX9yY8yK+PocHC4sLShZtJBFCzW7i9huEWpGMwrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhxRUPnEwlV4CgYdBTvE2xDk5TIbD3YkypRNoc0XgM4=;
 b=iKA0O9VeNO4sC1lrDrEqCfp8V7vd+bHnVQpG6YxMmt50NjIjqhOcwRs3t6H6eNI5lmeJ9DUbnfmgQIDwj3pzSiufx/CyNEhlcn+O/JuX+NVIYbMSIblsJ+cbgh31s82RD0ojBoW4EvkcrctsbAopTxb/rq+R4S+8Q7f0PktGlpY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB6134.eurprd04.prod.outlook.com (2603:10a6:20b:b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 09:11:52 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 09:11:52 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 02/13] media:Add nt8 and nt10 video format.
Date:   Mon, 13 Sep 2021 17:11:04 +0800
Message-Id: <ed68bb2ba3d3491ff508cce482303ad9485b8c09.1631521295.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1631521295.git.ming.qian@nxp.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0101.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::27) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR01CA0101.apcprd01.prod.exchangelabs.com (2603:1096:3:15::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16 via Frontend Transport; Mon, 13 Sep 2021 09:11:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4127cfa4-7c85-4434-efd7-08d976968645
X-MS-TrafficTypeDiagnostic: AM6PR04MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB61349D471372B54B5776E00CE7D99@AM6PR04MB6134.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: deyQfTBrxLs6FY/1lCE3UYFemAmhfF3MpV5G9oXpNpaEmw18VUFTiToxagnzo/DwS8Ptqc1yDt8kyFMXlbOXb+nyYa0IQzFDzZJN6dcZcj6qYoRzLRBbX1nxmMEbKirFxlpUlHOpngwX1uAOKu1Qwzx9fMJyIjFKE0P669XsXf0r5dkyHt64kzSaiiEp0Q1DSiHQhCNAr0/8ZgtgLAzKDwPeI+i7suFBbeH6mjkoZOL2C3ezo6k6b3znGapn0hqDtkmQuaLyL39hZ/F6c9ctAcFpz6c+t6LONXGcKO4F/RO2L9de5Fr3aaDT6SCVs5kHJgm0zKYLxHHxF4rNvGJplI0GXxL3Tvp+XV8QdK+ouk8ZXI+f5FlMMkGAfAjnTZX9Hb31944MT+Ua83vKaPpzEul2JchIKQOhukbq2u8gJSYuVw77wzN2e67OeyfZtOhoRnbxrlLtUoHYvlgpKeYyy1w12CrNOEdKDRd89apBpPynSzbC4I1oEY84WUo3LwcpzGunwNtqWyr3PBRIpbGan5EsLJYrMEP5Oq5KplYXdEZtwCxz+aKzaHmRodAsKz9YD3j5VWRtgaVnG7yebLhFWMZTX8j8b0GeZ6OzC4SIZLMsahApAPWQbwiysr3K285jguRGed+xy++4NZf03/pNT0ZDyff/LwXaotxCphSUa+Ss96Da2RMK1WVe96smPK17PfaPL3XEtu+x25Mhi08qqCvilhrP3T00R51gyURC32yx5buJLRn3fDbTwoDFfTP/NqxYrFTXHG54q9pjt5apIfgYNV1pSIj0yOV3I9cSdDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(38350700002)(36756003)(7696005)(52116002)(44832011)(86362001)(66476007)(66946007)(2616005)(7416002)(186003)(2906002)(956004)(478600001)(4326008)(8676002)(26005)(8936002)(83380400001)(966005)(6486002)(5660300002)(66556008)(316002)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EXskNi6Pcv/uqhSXYccXf7iR5Qhx1gdbN0MAe02VQVQiTwmeb8EAv0cL0vWp?=
 =?us-ascii?Q?p3DZ3iObBakKPoaqMDay2tZf91VzsUfdZtHZlWx3x0D1exuLIbJxliQD99QM?=
 =?us-ascii?Q?bIkJejZivWVkpGgTcPqt9QYtsrMk0ASiy9EMOKJxfSsIF2bCwa9To6jXF4el?=
 =?us-ascii?Q?M5/J1eaKqTHQHeCiaqYidMB/XaPT0Jnh3xUMu1yUGCXcUuuAP1VoWomLM3lq?=
 =?us-ascii?Q?yFZ1Uur3UXL8nSEaVv1XSRQZqr7aGyMRaoaHoqllpX3pnN17iBx/yhess/u8?=
 =?us-ascii?Q?N81PBBxoA2fH+u4tNsACIOihA/v9VOC2SL70LnxOKGOu78Frdeas4F0fvvpx?=
 =?us-ascii?Q?vVTFo4U/Wp3Lphn/r3CIb+u6eDYzmnXAAS4ElT5Xnh4JuPdqIhXGfbuja6v6?=
 =?us-ascii?Q?Enz8fC7anEfpeMN4AMubX5HCAS315Kn3ewbttGuwYU/4CA4h2IpIXExem5dA?=
 =?us-ascii?Q?TWpcD3F1PVhCTD3FPtLQRMZfG4ryOu5tPupWI0RWD7r27lcrK/yoxJBzzJLc?=
 =?us-ascii?Q?z3h9OeMiPN6z6zxpZHi6K6yoiEewvbQsADv61O9DzT/cAMIL4jmsbV/b0NTQ?=
 =?us-ascii?Q?dH8K+x/ikA8NJhcm/XiIQrsIFztAA4Z9s5W5oruKzRm5KbD1A12pKiLxHayK?=
 =?us-ascii?Q?K8fnbF1aWFokiGc3goyqT8Fz4q71rzir1oD5kCGTc7vtK/74qK3Nk0TXZFhh?=
 =?us-ascii?Q?95f2Qtw0FMPbpORmyLvuFwQXPKBsjNOzyv0N4Bd8jAT3LlV5Lk+/en7QjZJW?=
 =?us-ascii?Q?pJNXDNqIfVtpbMeqLMBY4NrxU6QLDUO1y0cnsA1q++bMmASgTnNI+i73YZa4?=
 =?us-ascii?Q?jP0DOBRYHPwINs9QI5jMv/xvAOsuVe3iahA/Axk3i8CPOVWAW0xa5jWfv4Hh?=
 =?us-ascii?Q?OSx7WevPeSiPR4umg2B3ShTFS8G4afit/swLdc+oq6uQscq94dPAGZhfmpm6?=
 =?us-ascii?Q?zPiAqHVmm1iMOAj9BAcOuK8LEhuFjIQLQAugfDXcyBhGg1U2XiIFJ+/ynMdN?=
 =?us-ascii?Q?f1VZvutRq83s5+E4x2OJrwX3/Qzf/WUKO59ClJMhe00YvuLfQETA5AMeposq?=
 =?us-ascii?Q?OUIYSDz08oM3o03CKOmDFCLMl/7uPjh31NJtkvsYjPdNRPqWe4bqqt4ffS0g?=
 =?us-ascii?Q?PU9a1LbgJ91yJUh2OBbf1uCqplJ8eBAj72M/gwRHHP7TxR41Q92zbZNuoqz8?=
 =?us-ascii?Q?fABcz38pmaEC9WhbjXF4qp9lvbfInMKWygFpgtlGE8kq4DWxEz2aJmOeyK4u?=
 =?us-ascii?Q?Nq3d5TeYsGai/TBzmLBbxCz3Y//ofvaetyNqwozVOgUyhnjbOG7yjST+bQ19?=
 =?us-ascii?Q?POcQpvZDxLT+j8EO/xula1/c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4127cfa4-7c85-4434-efd7-08d976968645
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 09:11:52.1427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHgFAXleDobHXWx55Ss0RxFVMTKLpX/VML55JsAi2nK2DQR2vbMnJ5D0gx9BBLbMqi+yYy2J/cGL5lpP1SClUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6134
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


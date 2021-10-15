Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D34542EC18
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 10:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235376AbhJOI0U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 04:26:20 -0400
Received: from mail-eopbgr10082.outbound.protection.outlook.com ([40.107.1.82]:31998
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235308AbhJOIZn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 04:25:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awKNHh8aGC3C9XevbeRnz9a/QOClBNyHA2cUO7RpBwy/AOOpIggOfsfC7erxURRXDKW7fiCNnKAmG1TGXxglR3cZkdwRIpFAnhZ8I+p+bKHNJL6nYiYf5W9kdcA7ngVdURQ5w7ZW3ZKLyI0t7WYMGT0B1CuanX/W+HHZWQJTpUa+zWIvna9R1WSn2Fh2LCvNsKdN/zakbSAENSCf4Zqkp4a0ZyOY/SiBKJsoY+80PqgoSpoCAXHj6KyjaW/TyR/v6sJLP8Wj8MrCPNAa3GFOBke0376yhqxVSxdm0c63QL/12Pv0ZyFsadZcmOF+UPqfPMITugrEojRgD4wU6jIvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkA5BDzuVm3hGAYRVh5eL4H4ij1Lxg88124qDM58R4w=;
 b=BYNbwm75DemkMjgHsvmi04K6ezDk6/rB6jG/CvN7tHKIX6iSu67olwdOq+4sAlrAtuN3INR52FV4Tzs2goRRi9HKaA9w+hwD6Yw4ltdzWEHR2rIYk7fyviblVcvvq7eeYyLR9irCAHWBPIj3nBSpbczoh3xMTOPcMVejS2yzSp62bbx/aDV4ZTAjTV1zO2SJUui2IdO0TWimPHs/XzTJO6K4hlolvY/SGMby7nztEZPNIhspJDuheZx4RwP95wQjGt0RYavswxF03au2IQy2dVYfcCis6BUX29yy7CScOR3EVICvy3Fdm51BwDt7BXzRCWv6ZvvYFYk2loGtEuESXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkA5BDzuVm3hGAYRVh5eL4H4ij1Lxg88124qDM58R4w=;
 b=P2PUQlTSbIXHfs97nzXGIMIP0i1ROTO9PhcXLEgmKcPXWjONjLBSzs5AGHXaykdjkQ2XpdPMw12fA03PpswI+LwqdDio1dclpuoK5SCNDBkd+5gkM2Yodtr406hnEK+J6KoN5wqgZit3o3Sh3HpeR/Z39KJghZ/3DmnFXyvutOQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB5750.eurprd04.prod.outlook.com (2603:10a6:20b:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 08:22:57 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Fri, 15 Oct 2021
 08:22:57 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 02/13] media:Add nv12mt_8l128 and nv12mt_10be_8l128 video format.
Date:   Fri, 15 Oct 2021 16:21:51 +0800
Message-Id: <fdd55b0a1f0f7ad9920979f895bfc3012426af64.1634282966.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1634282966.git.ming.qian@nxp.com>
References: <cover.1634282966.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SI2PR02CA0003.apcprd02.prod.outlook.com (2603:1096:4:194::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 08:22:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c91d82ed-fd1c-4dbd-742a-08d98fb4fe30
X-MS-TrafficTypeDiagnostic: AM6PR04MB5750:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5750FB1EF6B1EDD889B6A89EE7B99@AM6PR04MB5750.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1CJvykYbIrxbXAEOS2qkxK70OXzh3aeGBmE/HfRzrU8JWz+IGv+3f06+anntxC1MrHPxtsv61LcDqrM70cL46IMBXYdBpydJb5OFsWU4TG7becNT5IsAoIGYUSYkuqPLqDLfeeWq+KRpgtGN8fta9KMIu/RvpH7VI0AEfoD/WUFB60Hf6Jog+ipVTIc6uLfaVXfkpN3d1zMsgL7UK7u7olV1qiFxdpAjab3beP6+QBw6HPr0whaIjktbJsSWmQQLK8TquyPSe1ZgDmiW+WAI1Oz2AMq4dC/RzpkqFcBCSzKyjxJHzmxb9LKTwsjRoKZwby9A9/6IW5NjGGLKj6DmncmzL0nwQdvs6ic3FlwSUYd1d9j5xlRJKgCjyN+xuD62biU/z3IqlcPwx602Il3lEldC/exJTT1MSEZEJh/bbjr9P70nYVlbhPJOZXGiO4/oFHPImPkS68aYAFAJI+Wc+KR35kYC0PHZuGU1FirjHPwVOsqzpC9007qKYKt9cZmk20fhCbDcLCXNcF8X2bc3XI3zVPHLiKPF4CNbsVqar1JGofVewF4uj1Hvtu7WJKl2B5k4xJBDh3I0oGL+97bNbDtFEmCD6BVYK5jAtCm35SVI9lj6ALGQrp1nHNrNsCHwjE989xV/UzKsH+nscAAIxWRMEU7RrEbF7iDL4T2EKSscD5W+x+tzb+YRRxh5N3xZIq4DWrOyTPMygcCmXAoBqSi1C4VY4XUY/fc44wrgima8hdGisCWm653YnZU4XIJRzHDaUWpL3H4yIHm/v0Y7AWgL/1q5pSgH33sIpJ8WO+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66556008)(66476007)(7696005)(316002)(26005)(66946007)(2906002)(4326008)(508600001)(966005)(8936002)(2616005)(38100700002)(5660300002)(44832011)(36756003)(956004)(7416002)(86362001)(52116002)(38350700002)(8676002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EaiINpmhQt/xy18eTP5VGWEEXaJtE0it+rKBK+0ojAzmKUzxbOnIQ7hvSsEX?=
 =?us-ascii?Q?I2plJcbcm/ncMixIAtJcyuOhdQDjiACUaBlp1x1LaLwDVDqYT3TDCsfNOPI/?=
 =?us-ascii?Q?dnux3aT0JYQHLogU4NFd1vc2Y7+F7/UL66aI4Ax4rs8iDTbd3P1j/RG19fTS?=
 =?us-ascii?Q?b/qAOLCFkaxVEZlFfVgNSklILfcoxXphCeA1z19xtYxC7zG0RoNtXpTXrpXk?=
 =?us-ascii?Q?zZxUjqn3m4+vYYF0eiAD74wJUDZiZIUl7wUsK3k2XSM6fRqrqdUSsWfgzdkL?=
 =?us-ascii?Q?Dn8qhHnbBGrFUL3QX0MYtycK8m/IxkzQGvM+E2m5eetHLr5k3gUCNtOM2tgX?=
 =?us-ascii?Q?LMYIbTpp2Y9MtBZ6AYE+X8vqGp8rnp94WOzXIkqkV4WkHDUxS2XzYawrT/Vt?=
 =?us-ascii?Q?9twtWJAcjoUamhzpE5uSZhaFDtH7TLFIrZuwDmPOdiugZ09ttiNF6dcO/B+G?=
 =?us-ascii?Q?I9TVt+FnRd+9yPlQtCCw3BjJs8FYlbtUdDeyfOugxL6NFEQeizkvgvMJXbeg?=
 =?us-ascii?Q?OO/nPKl4oaJMheDXvfiigme0yHKZBb9aBdhuZ+m2v25P+yx/JYUszOaaSZX1?=
 =?us-ascii?Q?Y6ILMaCH0xjB+QTM0U234qSQOtn3ZdCayQiEE7CQlqXaYZjSE6JL0Gp8HMNz?=
 =?us-ascii?Q?RF3UvpqmUF7OT/JjsU22RCm4s15oqw9t/SVD7S6BnWW0BCaOkrJ/9eWLe/1E?=
 =?us-ascii?Q?cbIPx3RXg9sHOQM27/EdO+c7a5KU4JIIGaCIY3IZpbZB8REcqqy9Ivdba/iX?=
 =?us-ascii?Q?CVDMqWTpNheXGwtyoALfuCZQvPC884t/T/m55C0YowsG2DDUQwt74NtOJE8I?=
 =?us-ascii?Q?v4pmiASy76BJ0dAdSe/0YVq3gxUjP/2Dzfto+2gO1uESE6q1CX8JRYLRL/cM?=
 =?us-ascii?Q?qlZN9ZpfIkOQD5ImHxCDMysEs6UEVjtV0FASW0M+JHy4pRFkjctVO2wWxU5q?=
 =?us-ascii?Q?Jf5UMmFA3DVuag/262p8ktY8lqHYLC7lvn2ugE8Ankcff/I/bpnq3fTfFIXv?=
 =?us-ascii?Q?24UNPDDivF33vkpK/0By23U61uLYjN7sxacEQwlwhZb8eU7+5fX8tQo1dxnn?=
 =?us-ascii?Q?vRk+ykqCqdhphTrmbQraQkxhfAiDxi8jvHhOh/M7x1YkycsYTWrrApUCF/DE?=
 =?us-ascii?Q?dlaSO2uH5XKrspV/ZED/hqp8KBXbL/JNAjmmy3/zVzAhugfyEsHG9YAqoHiy?=
 =?us-ascii?Q?Q4P/osYRAuZA7lsQwj8zFbRanNQp0+vcYxsyyejwBs//zYFxu82d3bbdDRko?=
 =?us-ascii?Q?8QtToyhnUKvoKARtIRXzsPvZf8FE1rfXoWboQ4oud40kkBFFDoeH5gIhzyGy?=
 =?us-ascii?Q?F1Xvt2WCJsLU1AuPlJhC52eO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91d82ed-fd1c-4dbd-742a-08d98fb4fe30
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:22:57.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0SAxkWRbO6y+d1ylQHHC8S66fV93pKq0mTtu46zptzNKarPipOlHBuqxWoh9hpjP0yJDycDGbISOcAWF4ezVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5750
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

nv12mt_8l128 is 8-bit tiled nv12 format used by amphion decoder.
nv12mt_10be_8l128 is 10-bit tiled format used by amphion decoder.
The tile size is 8x128

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst | 15 +++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c              |  2 ++
 include/uapi/linux/videodev2.h                    |  2 ++
 3 files changed, 19 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 3a09d93d405b..fc3baa2753ab 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -257,6 +257,8 @@ of the luma plane.
 .. _V4L2-PIX-FMT-NV12-4L4:
 .. _V4L2-PIX-FMT-NV12-16L16:
 .. _V4L2-PIX-FMT-NV12-32L32:
+.. _V4L2_PIX_FMT_NV12MT_8L128:
+.. _V4L2_PIX_FMT_NV12MT_10BE_8L128:
 
 Tiled NV12
 ----------
@@ -296,6 +298,19 @@ tiles linearly in memory. The line stride and image height must be
 aligned to a multiple of 32. The layouts of the luma and chroma planes are
 identical.
 
+``V4L2_PIX_FMT_NV12MT_8L128`` is similar to ``V4L2_PIX_FMT_NV12M`` but stores
+pixel in 2D 8x128 tiles, and stores tiles linearly in memory.
+The image height must be aligned to a multiple of 128.
+The layouts of the luma and chroma planes are identical.
+
+``V4L2_PIX_FMT_NV12MT_10BE_8L128`` is similar to ``V4L2_PIX_FMT_NV12M`` but stores
+10 bits pixel in 2D 8x128 tiles, and stores tiles linearly in memory.
+the data is arranged at the big end.
+The image height must be aligned to a multiple of 128.
+The layouts of the luma and chroma planes are identical.
+Note the tile size is 8bytes multiplied by 128 bytes,
+it means that the low bits and high bits of one pixel may be in differnt tiles.
+
 .. _nv12mt:
 
 .. kernel-figure:: nv12mt.svg
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 31d0109ce5a8..4c6480fa29e4 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1388,6 +1388,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
+	case V4L2_PIX_FMT_NV12MT_8L128:	descr = "NV12M (8x128 Linear)"; break;
+	case V4L2_PIX_FMT_NV12MT_10BE_8L128:	descr = "NV12M 10BE(8x128 Linear)"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index f118fe7a9f58..9443c3109928 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -632,6 +632,8 @@ struct v4l2_pix_format {
 /* Tiled YUV formats, non contiguous planes */
 #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 64x32 tiles */
 #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
+#define V4L2_PIX_FMT_NV12MT_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
+#define V4L2_PIX_FMT_NV12MT_10BE_8L128 v4l2_fourcc('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
 
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
-- 
2.33.0


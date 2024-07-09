Return-Path: <linux-media+bounces-14747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690092B91B
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 14:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02A301F22DE2
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 12:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F88E15887F;
	Tue,  9 Jul 2024 12:13:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2137.outbound.protection.partner.outlook.cn [139.219.17.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5D13C3C9;
	Tue,  9 Jul 2024 12:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720527235; cv=fail; b=odhDp92IDIATf2cYhT68AEmfuwVlMfMDvOogKxUwO+YuzKjrMwuwlSUV5SEjlO0yau38Gq/2DdKCm1PAUpgDbENvadEBJ3gMRtJ5kr2627zrwEsQLW0ol+ixsgyps1FaPoNbUkzA1PMSUKeZW1H7uIZAZdO5ZavlnKM/quHgitE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720527235; c=relaxed/simple;
	bh=YXVf4i/sN9NU5gh6kvXcYEZKgS+BTdiwt8q4OM1BUc8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jXbnKluBiDG/GyJit+wJmJD0BGU7FTHaFHNhWqXeWZcKJEVHvOzelNmH+OOBt1eeSBZ6nwNpGUOKNhmVS2ilqkMBtund9Br05IftgzWhVHZK7cSzTqoTih7/nPbMPlq2Ds/HDrkYexezP78QX6Py2FqbCc88Zb+d9t0eH/fuUNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6vObatM8uIQh5TmBD38iST38A+WkouQOFm+c0J6z2Aow7nVP2E8vdNugiySHbMaSLuYMLSS74dBSrY+tR4SFphjSw2Ncbi0qZ546VI8+lWTGUc40NiWt7QbNMSvTggakKl2uwN4tURO0vCa3tHba++bMHsBnEs12NYJ5ZfsRRrN1eNM0TzdI1ocpwIPkFJYQbl52/R4NaNp1a5/QgA0owJVYzmehFwSsjqe64VfsQ8JQXIKXkKdMDU2nxdIRA+t2hjPjfY00ZYVtSkDTG2amvWEFHbLnsAlCashfNJ4FuwctnOlu+L8A/Oyp2Y4aupUZ3sPFZj0J5WvsKbG25v9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7QPFBE9U0w7r8drB9DKAoS+4PQ5oP4sBCYlmsaH0hA=;
 b=URaSewCn4A26Zr0RiNzv3RVZ8wLO8iBdOaVi38fYyKoBLHFG/JAWZ8wGi/bPrtbs6C4NlR/7aHEN73yzgmxSMwlCFDBA/OE7jnRRtQ3T5SH5iBI/D7J8rWU0hHMxSFMUci06LwQyU6MySmHY9LNQNZ6mOPBSC4qypC/HjW4sQ2KMIj6IGPAJh4EtdP31KIGLdRjiCmHUquZ+o77Iw1K/mA+lya8B3UlpepS/Qm6bU32jf847kHPYfEYJONgw3cWsGWC86SWLM7sV8a+vdyq0GR/+DKEJa37kPlrgtTqF9Dk0WcxWkmw5+PdgFlJYugTFyqgm3ZSCqAyjhQUmraEh/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:35 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:35 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 03/14] media: videodev2.h, v4l2-ioctl: Add StarFive ISP meta buffer format
Date: Tue,  9 Jul 2024 01:38:13 -0700
Message-Id: <20240709083824.430473-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1271:EE_
X-MS-Office365-Filtering-Correlation-Id: e98e7261-49af-4425-c8a2-08dc9ff285c6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	3zeAzqPTbg8RNZZH6UOHa3x+OnTlCep5HB17CCiKG4kyDatL3N3yq6PI1zb3NZQ5HhX5oIm9yFexk/hJammyqZ32LUJL+rnv+CnXyBhSn7IbTyC6ZYrRemRoYFfJ5ll+2dLtl0wb7znJ85KSn4Z96mHqialhxnzOUNOpA+MAh0iNryZFlaWTM+MsqLHbyhyijbVF+l7ECPiCnpLTLomNw0l+3sOqqtsSyMzVU9cqmY6WAfFSEMZGDS8OlV/JxXrXSMfYtyJBpO0Cey9fnFEt1Yz2ZznfOzD4xsWPh0clEjsENf7bUdFG5XmsVAXARYxU3/KygEqzuSC/M2MyG+pJbln4lqqLT42mfgW732hp5RBDspYEqHrF13swlEZWSZAExoMnk0+QixTksUewVdeqx/p3/S3cjnTeka43e6nrMMLENvNVCoTDFEM/kRExnhr6plEmO4AGWJoQYspxknqTeQ+XRIQnWwN5d9PuNn6xle315iGdrH1sH0wKnVChhCTFOAta/7hEU0yv0seJ3dqsWmFS12j0Qp5ly1gQoxCcBKd3Ju5JGaPp2htysL/o98jD6TMzjv+Jg7peUTdTD9gdsgtKliybUq3GXYEXOOJwJEDD/hQJzAO5v4dcVdr3zqrb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SsdPeC37s9Mg9lqPQwM5fOKx6+AOjgY1ONfdZeTY6GrddXZo2o6blvWqR6F4?=
 =?us-ascii?Q?qyDK+7Kl9XeqOO7lgXJWC76P0JMXYUdXWXKagjJNEFbRaQ9Kn2zDDUrSsgai?=
 =?us-ascii?Q?2/I41HQu9tq076kVUGrwr0yJtXdncRqK8kH+5CSD5KfG0gwFVuqL57BnGjkr?=
 =?us-ascii?Q?P0lL+MGMBdAgAy6bb/XsPoCoX8eh+ClZSIsmUshHSST3Dlh5mxuqhavS9wYC?=
 =?us-ascii?Q?BY8t6Vm1x/IsBLTWMO/+VKxYqfL9IDtDIKZnNX97B68/wUysCLTm/+BasG70?=
 =?us-ascii?Q?NK/pfrkAuKfCdV3cj1hCGmlFegzyDcfFRfj6/iS22rQCCdPKAWiCpbMAg3sG?=
 =?us-ascii?Q?Gr9WC60eNBu2SMBaDzdtIjiCUAugA+B3bzyxqRpZajdO+y60J46gAHz22dTZ?=
 =?us-ascii?Q?JDICdf/TPN5ZeGgqeIHN6oyvDPP1uR24LaA0G/zQRo8r5Tj0OOyn/Ivt7EE3?=
 =?us-ascii?Q?BUN28Cc6ReuVFVcHeqrJM2cYuVm64nGnVb1RCMQELmefWUB6T9a0nhvD0L+i?=
 =?us-ascii?Q?GZ7mHQOwuiox0Sgju12qTpve7r+Vt6CmFe2C2bCRPSIu7pQY3C+06YX/gjy+?=
 =?us-ascii?Q?gW7i0ntfR/LCz1zspkNftNAewinHy+8jTXsZ7NlkKQH0dZA/QQsb96krz0AM?=
 =?us-ascii?Q?c1IJv2xQjydJ/dMwUj08hZiqlIdhObOvkCUraLiaPhQR6cUeYtTc9S0Rk1Gn?=
 =?us-ascii?Q?HGbmrVXHgb3BRhxIWZuw4GbMai6lalr2suBk4gXF2j+KqAi0sP8+mMFzGfG6?=
 =?us-ascii?Q?1FoLXPkXeKIl3kAsnH0ARGsm9akvt5TFL9m0ALaaRl/y5FIlu56pH1GAS9gC?=
 =?us-ascii?Q?mA1U4C8dc31fhN83G0drAs7t642L2SqK00gZqgeoj5dPWa//L3oXeikBtkSs?=
 =?us-ascii?Q?ULj555ukSntVcaxQitFkfKlVLqHRLJvqCJZbOyrmgAScmUrIh2BlmbAF9U4c?=
 =?us-ascii?Q?NtICHG5V1X9eXl23tui+72dzFsqPXWCcQKhrkMrn7VwcUY8jl+BlwEKcaJzJ?=
 =?us-ascii?Q?5cHJGlj6lex9xyAMTRczj0lewp+7y+FHFBaMfKFPUGrHL60C3TIAxif9A2Z0?=
 =?us-ascii?Q?dX85X1ihfWuhgK4rdjNKcRaEQrW/i4ObQV3/SBBBDHS8hkYVKVjAA86h3AJB?=
 =?us-ascii?Q?C3ftPCEFUmQwWAE2N2/zsnHTbIerKC/GZf1uIJ+WTJKKTrkrL3ES1gca/DSF?=
 =?us-ascii?Q?ZONusxJHGi6DEW0+94EJTSsqwAZ9xdf3rb/iCiog5U1NpWA6G3LLNtwEHFMq?=
 =?us-ascii?Q?owILuYiN0JOd42gk+VAO22XE57N25/CcqPIrhhbOrbFlpaecvGPGcAZajuW4?=
 =?us-ascii?Q?ChmlE3SgNdQDZysgfFhY9xJ8cXIhzv/4R+3ANBYrdvQy6aAqoJkbte2PtQkA?=
 =?us-ascii?Q?kUB5kePeWnoNyBNFONfemehve9KD8da7NQyfUFlcauhnxa8B8oWKbn9VzdDy?=
 =?us-ascii?Q?kiZRC7d1Naww4NwoLzkvkNPHUS3zKvthrn9UcQYwm/BUM8uzv08iHAMP6Z/v?=
 =?us-ascii?Q?dfQblaadVah195E9o19dLi5sZusnkmk2ELioQga0NiN0UVO56Ft39GsF+pFU?=
 =?us-ascii?Q?NGBKv1cyF2mId+N5u2E11QO/B3TITFdmaZrqnIN0kHQmrqf4hBvNYao819vW?=
 =?us-ascii?Q?ZdRt3KYJeMU9mz1fCnlxIcs=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e98e7261-49af-4425-c8a2-08dc9ff285c6
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:35.6296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KRyTcXmWzV3ZGc3QKrD/p292/y3Sn5eddM9Rea7JuGpAD+Mu5Zacsxp6w2/5NEiaPmisOLp56Upd5XOYLbv1rLNyngQgJLlKszhb+dh1BWhxDrdznNV5aThw+bY3WXS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

Add the StarFive ISP specific metadata format
V4L2_META_FMT_STF_ISP_PARAMS & V4L2_META_FMT_STF_ISP_STAT_3A for 3A.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 4c76d17b4629..8770bfb31c5c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1456,6 +1456,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
+	case V4L2_META_FMT_STF_ISP_PARAMS:	descr = "StarFive ISP 3A Parameters"; break;
+	case V4L2_META_FMT_STF_ISP_STAT_3A:	descr = "StarFive ISP 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index fe6b67e83751..cfcbfe9bf973 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -841,6 +841,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+/* Vendor specific - used for StarFive JH7110 ISP camera sub-system */
+#define V4L2_META_FMT_STF_ISP_PARAMS	v4l2_fourcc('S', 'T', 'F', 'P') /* StarFive ISP 3A Parameters */
+#define V4L2_META_FMT_STF_ISP_STAT_3A	v4l2_fourcc('S', 'T', 'F', 'S') /* StarFive ISP 3A Statistics */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
-- 
2.25.1



Return-Path: <linux-media+bounces-14732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DADA892B251
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 686F81F22E3F
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 08:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26A615358F;
	Tue,  9 Jul 2024 08:40:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16251552FC;
	Tue,  9 Jul 2024 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514405; cv=fail; b=FLdLyeoWxHv/L7cWP80miNtR9DlZbfO2Jw88og3RR9Wje4vALJ9+zpG/C8MEHB3gxwXJsd/M8AU3WeISouNT3W24Rq0Ysdv2Ceatcl9lw4PGTxGqAdNqahRyZq67O4pjDz5qjH1Py1EXkap7gmM2JVmN56XDoEe2i4x/1yI2DfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514405; c=relaxed/simple;
	bh=XjJKkics5oMbBQtYcpr9yL22hoFeuD/czTzMkW9bu0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FZPhsC/B5cNW2CQfb82RGVHaMu0Dtnr1uDug4j7dSGSCSY/d1CYQw21V1aYjk+PmaQDVZ/RPvjGc0sdjwfddUglEvHlVtavsHUoAK2KngPvzf0eXkDOCkvhRPmy7Ejn92Y4LJcE9St3u/6IUk26it7voPFvw8wzVefEEgv6ow2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ixyh6j+lT3mx+5si5iOGnmpIFWMTkUfoybgfu/4EQiCJ/Pc1u4yQRxfIEs7hkT4VhVDoZ1Ex4n7NJy8uHD3vInizmTgDVrPLSHCNl6hWzOf6PN14xIB8AbwF1TnJw9X3tCYT+GyigroGsWbKB5A3f7DpYrigimRWWUY6Ihp5uMpS2V19Zc3V5yIgln02WUFKarpHSTViDM8MTVVyp8+W1Gw8K4NRwkZr8JzopAUkX3yhCL9Gc2lIsIPoeG2PXr3Citj76RO943/SS2y1yeE9FgxEfoGuBdKa7YNvXKgNvwce258uUPUaWqrEfsMlZ92sICnwCS4hplnJih0qm9Pb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=379HMc1/LSUOcf9HcMn7Zcj0bVXtl3Wt0/nMNbeCe5o=;
 b=SdxjGE7BUUfoLqlI3ueB6pXooL0Q26nVVMoJmTzIT+3UKogRFe20NiVpE8Rz4g91wNTyaOCQVshMJUiTSeF9FVU3pDu9DW3tXs4BjBl8gcMjXRAsYyPJkou7xFo9p2TzVlbYkbdtKf5TRsD/3hKFfmRslrUBUGExxvCcnWm6bfc7VMuPBNaxyyG2FFlasryJ999kQ/MKdNrbWjcdc2Wq8IE+oYK5OLNBtIP63c/AmCSCKN5FUAEbRSegPU7p889bLP/oPa/bzZnBJpJboYJKHMd68uWSiVGlcjR1xHAdQNJ6KfeSRNMrPfk2wHdCQ9D4ngR8QX+GY1H9h8tAwaRz8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:43 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:43 +0000
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
Subject: [PATCH v5 10/14] staging: media: starfive: Add V4L2_CAP_IO_MC capability
Date: Tue,  9 Jul 2024 01:38:20 -0700
Message-Id: <20240709083824.430473-11-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2c97d4d9-a910-4e36-928a-08dc9ff28aaa
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	0UQ8+xBk2k/3pI7ljw8Dm8R/LOJAAvj9Vawt3uaHPuzYtXYEfuAb1XkHzMuERR10kFTh+ndrLVYFv3w88jrpQ2jh4EWR9eB2LSmS1hR8rXFdzf7OBis0S+nU4nr+rVwiZ3ejmVoKHRzXpo8fq5n2xNO2LUGsAII0sLu2q+4R6TESpBasg4qZ3ySaDiSana9UaUyryktc5yEGd6HKedExYbmrohcNxK5uYHVWC9+Ap30YyMGW6Qlcvhcr9V7Q089qLXKwyqMDUXLNRx7rKtaYBigHh4RrxZOvCIcuSmBeuoaCBUf2uKZ0k6qeFkBdxKZr2wwqeGB7iaxdafX1ReTWSUVY0loi1KUswzxRU7BLM2FyeKPNy9EBGEtPeVgvP4v5nsYqOL6qQ4qEQCp3OhUmKC4iLjUHT2PPZcEtX5/sFHQ0GakyeFaXzLP8l7hId4GLA4Pg1MnX8AIv0Ba6cbEVPH8HCUcIm8mQCJVVwNg71KGzdJdzsBGYzxi5OFraSCLJonBWzZuGGdmmY2z+zZeDqtguizs8tUGlKVoEr2xppQQjGLoN5QxlAdcsVtiJYGvwRh82oBCG2PS8UVogmpIppugJyrM8kC6UwgoSLZOnRETdh8/tdUyYWzYYtx2VBXV0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vS/hfPhqo8wZisFlGbNIr4pNM5iM7uwVC6iXexyZepe8qQ18gX+GzUrM10gs?=
 =?us-ascii?Q?fGJ/L311a496ZP/75A5DskUzqYCa6K/qT3uBjC1bvCt8mTRT9qJgrpBXk7nK?=
 =?us-ascii?Q?S23fBSAPjBi5uqqI2U7NS3N1ti1Wm5RFOdFjSOwSDTBn0qwAVoJKPChUyP6g?=
 =?us-ascii?Q?R709msYMiD4jIulJMH6VKg8FlJppAO/X0oWavyds7uRzUNcL5oKiE4Nb2q0v?=
 =?us-ascii?Q?jbwRhMmm2udrbsjvW4m//pt7bKjYv7Uy38MSYVm7fJAP/IsCaydH+Z9XALwc?=
 =?us-ascii?Q?Oaf6en+ZxPB7QcidZ6RH/GqPtLhPPqKJGFClw/95DD/GFJF1htqF7Eo6FRe2?=
 =?us-ascii?Q?6guqU8rJDxNEts8zzM1N4Uc4vZKn6kACYU0jZtVHkdUDWxCFyhDx4S2ZAc4G?=
 =?us-ascii?Q?Vp2+QHuHllB442NPp8XWJmZ6czchzVuXf9bDnIvhGAx5mb2I9TWWjOde1m7z?=
 =?us-ascii?Q?cEBtVw9nnDJat8mXiuDfayB54HXxvxJzAefT+KSQpjWuJb6A71AnR4IHHYCn?=
 =?us-ascii?Q?oLkKpoI8INX1rp6nY0LNxL2Fpd0dsUeyMPqJL0PrfG+TsggeeCx9QvBirLAp?=
 =?us-ascii?Q?o2LjjRzVRxD4GGr6zEgd3aFeVO7Ts8UoRHDT7qO79Au5fA9lmZ8rOrezlOJL?=
 =?us-ascii?Q?uXXeoHzVj2fBFBTPYpdqeg9sCyDxzNvcvuKlKE1D7jBGvj+nTwuCGB10J+AV?=
 =?us-ascii?Q?jcah2DsYzMPxjICQJX7N6rlD2/yXzKdmGLwH/RRh3XNbGlgnmiyBzWQzUxkZ?=
 =?us-ascii?Q?ZGb0MMvaRHvKmfAWLYqDaMDrKbzxmI3J0vviv9pl0riTlyEerCTqVCJxBMou?=
 =?us-ascii?Q?e4/27jdFvZsWRvMzRZ2Jy8l9z04Jg8A83tLk19tgddGXK7KaO3lrWPgS1ZGh?=
 =?us-ascii?Q?od8t29CeZJ5T6bebu+SKr4t4PamOhYgEmQiPtA2CR8/MlfyZDut7ft/gsQ9X?=
 =?us-ascii?Q?fVYPYa7as2rCCzyDXtDDlNBc9T+25mWiDtt1dY7uDqwMwRo+flv94zPgn9QE?=
 =?us-ascii?Q?phc1rZ/iuzFiU6FCVEPNSFw9/Otb3VfEOl9YCcTEoK/EG6Ko9Xn3CX2+l+Hz?=
 =?us-ascii?Q?zpE2rFUTmRiV4/qHNw2geNP+Jn6kwkDQ5DAIzezKqcTcQOvI21mtqetpj1wz?=
 =?us-ascii?Q?3U9G6gwRSuUwmg/xZAa0oIUIqjfP0+pU44/VfBnYioqSrYntZ/0k66ywOY0c?=
 =?us-ascii?Q?6hYRD27UnHqWb96Smy+vuJvFq/9VtMC3A3DGVnYR6l2VeBGGOzLGkMAlc3EY?=
 =?us-ascii?Q?IfSWjpOPJHHr5ukiO6CGpo8GgryqqOwxrz2JTDshr7NZeU4weTxAc9Jij31q?=
 =?us-ascii?Q?rToiCRxSe2jhPeDek6vhJOb2WfYBm4v2hehJfYugs3GFOApaJHqYD9Odc/hy?=
 =?us-ascii?Q?4ZAKzEAemhU1D9vCEjq+peuNma6RsQ86mECf+3h5ZrKIckOcEm2BYdnoAYT7?=
 =?us-ascii?Q?eJP1UPFJxTaGS0tEdY/VsvlqeV7EifoK4Uvmc6VRt9VsDsHpN4C+bB2s7dVY?=
 =?us-ascii?Q?XSNd9hwqXe8mvauNOVsFE0MCRu+rNyHwMyHZ1ID37erfzb4fv5Q/6n96Sh92?=
 =?us-ascii?Q?hNtM1HO2OkAKaWmsC3MStR1qdHkosAt8owqPSjlzcyzLMw8G1FnVpe2qmDjY?=
 =?us-ascii?Q?iIGQYU3m5c6ONfSe0XPJ0MM=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c97d4d9-a910-4e36-928a-08dc9ff28aaa
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:43.8109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MY8CWRGFkPWHsoxjQNshVcxnec1IioFDFpyv+zCVdK1mI9SiMmUn/IBTZhbeX1FrJXFpbuD4G/RQE6Ghn+7C5pwJTLOi9q0EaYGTnMPmqZyeC59a4T9e+p4ojCVT52ss
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

Add V4L2_CAP_IO_MC capabality for video device. User space can enumerate
formats by mbus code.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/staging/media/starfive/camss/stf-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
index 2203605ec9c7..8c6c45d8b7a1 100644
--- a/drivers/staging/media/starfive/camss/stf-video.c
+++ b/drivers/staging/media/starfive/camss/stf-video.c
@@ -668,7 +668,7 @@ int stf_video_register(struct stfcamss_video *video,
 	}
 
 	vdev->fops = &stf_vid_fops;
-	vdev->device_caps |= V4L2_CAP_STREAMING;
+	vdev->device_caps |= V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
 	vdev->entity.ops = &stf_media_ops;
 	vdev->vfl_dir = VFL_DIR_RX;
 	vdev->release = stf_video_release;
-- 
2.25.1



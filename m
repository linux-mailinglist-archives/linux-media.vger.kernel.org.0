Return-Path: <linux-media+bounces-14729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A9D92B24A
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B6EA1C21B39
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 08:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B4E15442F;
	Tue,  9 Jul 2024 08:39:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47537153582;
	Tue,  9 Jul 2024 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514399; cv=fail; b=mQeDcXt17Xvo6S8uU25fePATM8qjWMY7O43W0YGEbr+UUPp7KiF+sKDMSjRYq4wc/QWh4P40v8jydzIbbeMM1xUDI481Bf1gUFvsOEtUnaeCocvjaQyaw9ymbJl1DKyqPmHtRxvJQ2jPJGs4ArO/npLiuFennP3DN8F0JEfdCRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514399; c=relaxed/simple;
	bh=pFAFH5nqcgUyjxT4/ObOrkt7mfrFPzk7iNLCb3InQnM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z4E7GpEAj02OQYqYMIio33tzY5sqvtjq805nlAPxFXiGXtBfgcrSmNsXfm7GF27KQ88/PtOvFdesu22sy7bRC9fw3jecC4TkDQR7Mzb+JEcW3xn4Uuhc2PSFnheiFgCyER0xGXQCMI/BojMvpLumyMVUihX6EVtHEy0fslut2D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjWC/vE+tbNHhaURnZTeiYZqia0wIasa2i9hHuNYgneVbbASV8fPvl/xhJuPsTRi/U7XDkQlUBfXK2du3D35wby8OW5jqYP9O7B7rKT36fdWz1GukFP6iGplGGS5T9PFqD2MQBc0Iye/gqnqxLc9Qyk4qqM09X8hqWmDsrB8fMvfCZpHZpKS5vqJRXOXE0PQm6NQ8wzDyW2SlxFCyG4/0wlabbSMDXcQrJ5cfEweM34xxvyLEYS9wSxHwnsZXUxyXvOEEI61+E4K+Sehkw4nnOW3aKbi+7snI19ULToCJb1xwrm4a+ri1FNMYPyiU7gdWA4/7wX93MQsE5w6rXJeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGpyPzRRm17ntogV+3bvGdPa+rVfC9YEIC5vX1kewGI=;
 b=HS93KLtX+fuz4VTkH3pxoBOu449sx/JH92EcxlXvQAn6b5IIxH11HDa3a0UK6fZmBaKoit6ZJk6yd0octOb70IOwRrzswN6NO5SkIIPTFl7ms+28ZUf4x6TgSbsKy3S9TnAdbGtkoAr3MIKiunFUSeXaTJUkupdAzOsu0/s196yCwDDhBNwuLqLb97PvQxoC+cpGOoUKvPfY3/FztobK5id28JbfdexVskMuApTRrakkd/qwj/hTmDoNtv5r3xtJQl9qIgP51vuWirdya8rdUPAwYybX8dpadQo3HdQ0Trf7XZ3lFb2FgCsQQrw1WyNzWMWUKkx276LZk2o592YrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:42 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:42 +0000
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
Subject: [PATCH v5 09/14] staging: media: starfive: Update ISP initialise config for 3A
Date: Tue,  9 Jul 2024 01:38:19 -0700
Message-Id: <20240709083824.430473-10-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7a652380-6162-4e52-a2fd-08dc9ff28a01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	5pG1jZnnHzGudLxD0iRAO9oK7HuCfQ0grfC/qMRL/09Hd6C0GGf9nXp36hOq/OSS2Heegg7Bi6P1dhI7UMywM0HqMYSDbAMiLDwZmVoucSXg16TjUBjc1z+04FioCkvitTUw1tid+5gQpmVH3tHfaKyJPE8xPP84hqzvWREQZhYDnPWAKqeWDp+FenEv3MhjJdY8HFtXoXtvSGqOr4v1l7aj+6kPf5qRjz9ic21nSVxddWX98Nns20OFLjSpCiJRM91zPjVCPIy0lJIpH8J1uGEVmXn91NEMc0Sx7+DPsvCBgClaeVW6NWsAJhLUKqY0pgWnK7fabu8xGhPMPNXN5x+k35Mj8T1Pvbfd74RFvnszv9GkOD7NV8yAbD7YvmBkVEDnfAtPAUizAkW4boyLynzv9Zvc8PYZois7SOnaVHdpkApXGpQy0cUIdVH2AUpmRccW6W3m4JCTHUAm6K7hsSpmisVQxdxfkIXqbFGw/BSGmwP6fIqwQikmSWfE4s1EG2B2NhjA/lB0aF6f5frtnYLysUz8Rkwgpju4ACfdpUcsEGSZTyBWD0nd3JHn+PVYAn78gAqLX7QN5EkV92EQ4syRclNN2XKfa2+SoCCEsYaRIooTU3rgwxKdXmEnS0r8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IWYUVbTwBk+piTq4Yr0O69Zg8AksYhrBrpIcYbU6ltJ7NnphnLzerEGnW8AQ?=
 =?us-ascii?Q?TFm0ozkoz7yb4NmBZ06qxaTdin9hWLT7HpnUYsDUWqfvtlwTgP5uN5GD0NPY?=
 =?us-ascii?Q?DlqNaV4uF+BpYD3QBifgHYXM4L+f+9UHfcTd7ZHIRCaSjfkfOsUq6Jhcvh1+?=
 =?us-ascii?Q?9wpucPk5P6TwnF+tELpcfj2tt605c+tE2869gtJo8TV6ZvPLzOAMdvj1K4g/?=
 =?us-ascii?Q?eUHZ3p1Gqdkd1w2rOYbnpdsRjMSd9lbTQGSvUmW0M1HYjtQVlxTcjj8NpcXL?=
 =?us-ascii?Q?A5cjlpLJCOpm3TGrYzTdcBcVEJign7iakXbKfuNKYRSdZfwGrRRstqVM9QG0?=
 =?us-ascii?Q?mrnJq0FJy1lgqEzJoaVr+NuhKs+VCiQh/6sIZM8QQh1Kv9jH1IFuwdeET8kW?=
 =?us-ascii?Q?s2LqPoRh1EPsbQ8DmasM0VIC/fTXcUCxlz4sKvxWRp/JP26slkU5lqawnz7X?=
 =?us-ascii?Q?vo8+E9P63LQhDMNxeyMzPCoNRDV9ZaRkeUTDk3WXvL/Fsgtm2sDH43tkXaA7?=
 =?us-ascii?Q?vcwSe2L4N+u/GuNjr3mS9R4WtdhZPEwm/1Cme9LJy20xLyZtY6n2qkDOqYhl?=
 =?us-ascii?Q?uOKnDE6e7IF6nlZSv8kvKyx/PZFt1leOhoE68+JGqVU+7d5zCTvxIZ7xtHHZ?=
 =?us-ascii?Q?tEDCcgALiGNneEWAqQ5bSKfi7abKn563524vsMz0fNXwBcBZ/XXiMAFlqq2H?=
 =?us-ascii?Q?EixnQr9JlJT9CYJiRH2fgk3vDg2LPQ2ccwQD2+GM3Ghc4NtYrmz4xrByCfYi?=
 =?us-ascii?Q?+fAy2SuFbX6ct0L76tbTT4hfAgpL6EuC4fBnCQEQhBnysy7GUA9ogVb2tzh4?=
 =?us-ascii?Q?9QGAQ4xwQpxHSyOaBqk5YawRaAo0DZWzMc9gxIu2iAueevMLY50fqmU5DxKH?=
 =?us-ascii?Q?Dpas33ZYCIFON9E7391R0LNFyK3E09qqmRWVcIMdRYgLTkxdASLLFi1+bJ2g?=
 =?us-ascii?Q?KsrnWdbon93nD47Iw2xp/sO7KMxcCIC8DCUOVQnGu2Gb6C7kxCzmHxWE/Bwd?=
 =?us-ascii?Q?cqI77rPCHbNLEZgRfSXr1HaxXfOEC3F59KGdzGFW12k3jHmgn+HEzqw676t2?=
 =?us-ascii?Q?xzXdNLvllVqK1lpOhGRtRcwzyTDlM/TbkGbSzcn+TuBMVaeplO+saUPbpgtD?=
 =?us-ascii?Q?a5PfRpVd+3aO3Ojx9PaECC4JKZBFiSYCNyJX+HW9s4H0qYAV8yq/r1OeFdwF?=
 =?us-ascii?Q?x6uIprJdJX6yw8gzaqQqTExT8naKWmw3TH3+WqaGl0EK0N+nRe4FLhKEWwWW?=
 =?us-ascii?Q?nSwYz2WhxNDPrIqUb2kxhfcHqZME/XrKOJ0xRVgGyzwnNReREq16enX62Fo5?=
 =?us-ascii?Q?RMmMhJj5NG5FXqTIZCtC/mKcnWgQj5F6JiZJdiVs71GugxESFsO4MnBxax2r?=
 =?us-ascii?Q?e7Rz2jVNgymz1Aj7v7JVqXveS52omLV+cBZrzar35cUBynKJjfD+72/0jbvl?=
 =?us-ascii?Q?LFoDJR3krIm1WGjeO6ITIZUA+if68bkeuXojfInJaB/ZXzMLwZGJKPH6ybYd?=
 =?us-ascii?Q?A+/Hkccq6CDzOUYl8wL/G0RoIrkm+qVGhqa1D1mbMXCKYC7Tc7ZLIc6vgjJ7?=
 =?us-ascii?Q?yiWRtlq3RUFZ4kGp0s/dp7z3r0M//y6qNs62h8o8sTsZMbsK55nNEKeFjYaY?=
 =?us-ascii?Q?YunyvbokPBd/nOqAjiR1Y9E=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a652380-6162-4e52-a2fd-08dc9ff28a01
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:42.6754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSuQR366FA9KTvb687SPbp80AegVOD5H5c9hthfSoNQAQef6I9FL8a8LuqhbqmOOhZnZliiQonHHOGUMQO+NnK3KIn7RrwjW/Lyl4Y92BP7TpVEWWeznVreC8BxVN1HE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

Upadte ISP initialise for 3A statistics collection data.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../media/starfive/camss/stf-isp-hw-ops.c     | 23 +++++++++++++++++++
 .../staging/media/starfive/camss/stf-isp.h    | 21 +++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
index 3b18d09f2cc6..0bc5e36f952e 100644
--- a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
+++ b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
@@ -300,6 +300,25 @@ static void stf_isp_config_sat(struct stfcamss *stfcamss)
 	stf_isp_reg_write(stfcamss, ISP_REG_YADJ1, YOMAX(0x3ff) | YOMIN(0x1));
 }
 
+static void stf_isp_config_sc(struct stfcamss *stfcamss)
+{
+	stf_isp_reg_write(stfcamss, ISP_REG_SCD_CFG_1, AXI_ID(0));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_CFG_0, HSTART(0) | VSTART(0xc));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_CFG_1,
+			  SC_WIDTH(0x1d) | SC_HEIGHT(0x15) |
+			  AWB_PS_GRB_BA(0x10) | SEL_TYPE(0x3));
+}
+
+static void stf_isp_config_yhist(struct stfcamss *stfcamss)
+{
+	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_0, 0);
+	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_1,
+			  YH_WIDTH(0x77f) | YH_HEIGHT(0x437));
+	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_2,
+			  YH_DEC_ETW(2) | YH_DEC_ETH(1));
+	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_3, 0);
+}
+
 int stf_isp_reset(struct stf_isp_dev *isp_dev)
 {
 	stf_isp_reg_set_bit(isp_dev->stfcamss, ISP_REG_ISP_CTRL_0,
@@ -332,7 +351,11 @@ void stf_isp_init_cfg(struct stf_isp_dev *isp_dev)
 	stf_isp_config_sharpen(isp_dev->stfcamss);
 	stf_isp_config_dnyuv(isp_dev->stfcamss);
 	stf_isp_config_sat(isp_dev->stfcamss);
+	stf_isp_config_sc(isp_dev->stfcamss);
+	stf_isp_config_yhist(isp_dev->stfcamss);
 
+	stf_isp_reg_write(isp_dev->stfcamss, ISP_REG_DUMP_CFG_1,
+			  DUMP_BURST_LEN(3) | DUMP_SD(0xb80));
 	stf_isp_reg_write(isp_dev->stfcamss, ISP_REG_CSI_MODULE_CFG,
 			  CSI_DUMP_EN | CSI_SC_EN | CSI_AWB_EN |
 			  CSI_LCCF_EN | CSI_OECF_EN | CSI_OBC_EN | CSI_DEC_EN);
diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/staging/media/starfive/camss/stf-isp.h
index 0af7b367e57a..eca3ba1ade75 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.h
+++ b/drivers/staging/media/starfive/camss/stf-isp.h
@@ -110,9 +110,19 @@
 
 #define ISP_REG_SCD_CFG_0			0x098
 
+#define ISP_REG_SCD_CFG_1			0x09c
+#define AXI_ID(n)				((n) << 24)
+
+#define ISP_REG_SC_CFG_0			0x0b8
+#define VSTART(n)				((n) << 16)
+#define HSTART(n)				((n) << 0)
+
 #define ISP_REG_SC_CFG_1			0x0bc
 #define ISP_SC_SEL_MASK				GENMASK(31, 30)
 #define SEL_TYPE(n)				((n) << 30)
+#define AWB_PS_GRB_BA(n)			((n) << 16)
+#define SC_HEIGHT(n)				((n) << 8)
+#define SC_WIDTH(n)				((n) << 0)
 
 #define ISP_REG_LCCF_CFG_2			0x0e0
 #define ISP_REG_LCCF_CFG_3			0x0e4
@@ -312,6 +322,17 @@
 #define DNRM_F(n)				((n) << 16)
 #define CCM_M_DAT(n)				((n) << 0)
 
+#define ISP_REG_YHIST_CFG_0			0xcc8
+
+#define ISP_REG_YHIST_CFG_1			0xccc
+#define YH_HEIGHT(n)				((n) << 16)
+#define YH_WIDTH(n)				((n) << 0)
+
+#define ISP_REG_YHIST_CFG_2			0xcd0
+#define YH_DEC_ETH(n)				((n) << 16)
+#define YH_DEC_ETW(n)				((n) << 0)
+
+#define ISP_REG_YHIST_CFG_3			0xcd4
 #define ISP_REG_YHIST_CFG_4			0xcd8
 
 #define ISP_REG_YHIST_ACC_0			0xd00
-- 
2.25.1



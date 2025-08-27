Return-Path: <linux-media+bounces-41205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4EB38A6B
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 21:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FBB75E42D2
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 19:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8307B2EE276;
	Wed, 27 Aug 2025 19:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dFOJ0zTJ"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C3030CDA1
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 19:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756323996; cv=fail; b=UOALPxf/R9VQxQXRNBWVwRIeV6HMwDJOvZjXsX1jTuiwyvceOMpIYasTzny6FwfiyU6InO4Uzvg0pFvq+b2BSitM43lKqf17Pu7aX9UAiBfGSXmHvQqayS9MlOApznNybKO8E5vUPDK1OEEPfgIRjvsr44/OVRldiJs5PDCnULY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756323996; c=relaxed/simple;
	bh=BDtzOcc6/vjKJEZbzKgubc21BJwsURpbS5nBQdBdC0c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/85D2l1fg2R3vCsumRO6mvbnao/MD4uXxJ2mM2B4HHmtNskY+x6XMZYvCXxXJBM3kQ/+eCwXcxyNBzPrbtAWM3vyNr/9wjYdWoZm9kKKqC2BVRNUodw2J9fVswZsHO34ezjZqNJcEplAIyAixi2TgYUk8VyBATQQqIWJi5wiIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dFOJ0zTJ; arc=fail smtp.client-ip=40.107.92.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNFFglTIJZf0+a1D46RYo8/6KfoDfKr4tk8RGG3t+007i93qjAnJXWeC4Q4Dpm58GOMFzMVBY+ddVE4JAFELQ5aMXTIrVmCmcqqJeAw0gB+//8g/yogZ+dO6q8RmbIYcK9wFpSMLvLXhEmtG8Nj29Vok33QVYFlKiRBNCzDmLlyKWmAzsCAMhoJUI5tx00daa45wDgoQ1SSDD9Ci3ZPPSL/oZdvg4kWLntBm/geefoUmIwZIadbbb08i3QoYq824dmjH2sjueT+IF/o4Q9t/n0kXUP8erkeSq236Z7x76rkDHiXeV79w+JUcHPli4R9b/N6DroX4xbN92viVkXsftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyYrgVk7De/g+Ylpd8zDzUJz/9yxnRBLlJLz+KPr+lk=;
 b=GXdSMWBmG0sOaPlY//yRn3M1Sfa9nlPLFMtTazVoOzkA3zuy/D+FozPJEUYAtsr1AVj3x+uRQjC6h/iGNk2Fxilzi8NVMG7rnsRf9gXltEIv6QAST+APwUyG9x4ntO/eTZeE6Mu3xICpDD7m6tZZF/RLn9kx985yjvvezb8lql5zFOMAgg1Pm7HwkJ88MLzBYsvvJ2TcGGkxSxrviT515cvzv90+kvrUbI7RycQ+DHbkLm1Z+XVyXli1bdUvdJZHExCvx5pRS8U8jEN34H1g0xiLPDHnu5uDrvo7jR19+XeaFelASKGglVVshtd4/oPPO4ttxxnT3mMrn2v7ul5nrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyYrgVk7De/g+Ylpd8zDzUJz/9yxnRBLlJLz+KPr+lk=;
 b=dFOJ0zTJSHVAHr3Q75/V8FOk9jbmNJiyBKE6+uH0mpFMUphhrYg2sZTK4SEsIu6/bjdJonFGxf8N3aGPCFfcCE2WPF3UKOtwynR9+VjWR5zKx3buL+7HPgLC4DshuxUlAIT3iesKUvkMWj4O2flxzXWXXrAFljVR+dxQ9sYrx0k=
Received: from BY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:1d0::35)
 by DS0PR12MB7771.namprd12.prod.outlook.com (2603:10b6:8:138::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Wed, 27 Aug
 2025 19:46:29 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::a2) by BY5PR04CA0025.outlook.office365.com
 (2603:10b6:a03:1d0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Wed,
 27 Aug 2025 19:46:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 19:46:29 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 14:46:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 12:46:27 -0700
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 14:46:27 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <linux-media@vger.kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vishal Sagar
	<vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Subject: [PATCH 2/3] media: xilinx: vip: Fix UNINIT warnings
Date: Wed, 27 Aug 2025 12:46:25 -0700
Message-ID: <20250827194626.3194465-3-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250827194626.3194465-1-anatoliy.klymenko@amd.com>
References: <20250827194626.3194465-1-anatoliy.klymenko@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|DS0PR12MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c895679-6c16-4d8a-2c1e-08dde5a26a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?az389pPAKU8GqjT76lFwmKss5yhI033xepkDahI+G+yPRSGr90MnvFAortxz?=
 =?us-ascii?Q?gYqEdzaVEydJVSev9D1MK2OnIUs7tO/Chh/cQqLI97Rye+wSqq8zvihAF8Ub?=
 =?us-ascii?Q?wdHx/40UdA2T7/V7zlZJoUzHagBUCQKD5ZlB0lk2p5Lqu+H2LzmUW7PxbXIo?=
 =?us-ascii?Q?/+9iECSMKLuB1thVg4ugmyx4YDQy712oDKr5iv+n398u4Ma9HeXG81pdmYdi?=
 =?us-ascii?Q?8gxm0coREMGrJ8YLLPkzUitB77ExTC5Z5FXOvri1uEmUzbGIPYup5/N5X0RD?=
 =?us-ascii?Q?uiyxXJ/TzY/PeTbdAg0j04Jr6jo9SzT2TZ1CFFu9/fvQ+wsZ7z1IZxDzsoxY?=
 =?us-ascii?Q?G1FjxerGiTxucaHfRo8dHFHKrMb5ULh4H8kSvun9mZap/ClhQvgqB87PaSn5?=
 =?us-ascii?Q?H+oZnmYjFOBlStKPBWFoSbxgQigKzgB0sRAEuWgnwmzkyMJSF77KiewH2ZqH?=
 =?us-ascii?Q?ept0pgga4W6Pja5TXqrtzZf9DWT19p+zI3uax6YTkL+5Msd5rihxkreLCo4c?=
 =?us-ascii?Q?OUPPczBCis878d0XbETdnDJJAh/jhALPJrZjkbgzvBWq4VJyOCbsVslLYmDm?=
 =?us-ascii?Q?Zvbw6L2AvhYz0iiYlroAZLPGM1HKmhCcpjbcCJaxVMlq/V9ZYSr9iWJPQxZ5?=
 =?us-ascii?Q?H3QlikMAWlgsqUtZ5ON9NyUXPkLL/nrvbcy5z7wkcSLSw7XmzjBPffwxRrgL?=
 =?us-ascii?Q?yECS9Zv2APtVsDROAltaWzX5yNkxmUu7bKXHBwwTSdr+8DtzkXhpOnwfFmoO?=
 =?us-ascii?Q?UmVr87OpP3UZNJjS2MF5IQ8WKA8tri/NBWLzcP4Use/PKuhMRvmYZh1EG+2M?=
 =?us-ascii?Q?zIKz4XGA0fS0eq3rAnoqP1Dawu6h4FBU7+UMKRUTDhsPgPNShAFGB/2UuU4N?=
 =?us-ascii?Q?Gd8V7nmND36jxeBWsy11H/VvP4jcImugZAoveu34oz5LNQYeG5UYnuBp3qBz?=
 =?us-ascii?Q?iPe0c9+9rIhPT0kH01Ppdm6ED8RspuZduJt0MsopD263EFKsCu6RaGg50OKW?=
 =?us-ascii?Q?x8NvLMuSAD/6p4zvFYvuDHb5G06X515nAJsh/Dh0fCSoM5v1rmhjwyq0gWqS?=
 =?us-ascii?Q?oYbhaTpeeGaFUrkFztinI1Qj3A0FSl8mxh82r6UT1sfUyqH8+CLIicGCpRjp?=
 =?us-ascii?Q?p5BJHmMZn6+JUU671wNnokdcwVbAzhNI0TPHslkS8P2bcOsgMlijVED2eb7r?=
 =?us-ascii?Q?Ia24M4Q0LIFqFsvH/OUI1YHHptm8WdPpClF33akh/utJwXmviXpL/McoEtwJ?=
 =?us-ascii?Q?iBaAGD/TRW6xM1ExBcnZ4/HafZ73uzCK9feoPWah8MIDnK6tq/Lp7SGnSNLL?=
 =?us-ascii?Q?C/E9Ma+fstDAt+GkoS1xj9bfM4iyPiYdAddsvr0nBmHe4eWJRsdcPo6vKpvN?=
 =?us-ascii?Q?JGpiHIadbueATHJotHFrA0q1W5YQzJv9a01T6LnXAzQ66NAvdFfuRnO+QBDp?=
 =?us-ascii?Q?oMK60c8b4KUevtpjRwxx34568rKMGvsKXuW+to+Qoe3IjYlPCr8skV8J26sj?=
 =?us-ascii?Q?Srdu/5vnPrAtmkb4BdAPjV/CPsUlWbjIDJFh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 19:46:29.1751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c895679-6c16-4d8a-2c1e-08dde5a26a9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7771

From: Jeegar Patel <jeegar.patel@xilinx.com>

This patch fixes UNINIT type coverity warnings.

Warnings:
Event uninit_use: Using uninitialized value "vf_code".
Event uninit_use: Using uninitialized value "width".

Signed-off-by: Jeegar Patel <jeegar.patel@xilinx.com>
Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
---
 drivers/media/platform/xilinx/xilinx-vip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
index 0374aae160c0..fa637a625126 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.c
+++ b/drivers/media/platform/xilinx/xilinx-vip.c
@@ -104,9 +104,9 @@ EXPORT_SYMBOL_GPL(xvip_get_format_by_fourcc);
 const struct xvip_video_format *xvip_of_get_format(struct device_node *node)
 {
 	const char *pattern = "mono";
-	unsigned int vf_code;
+	unsigned int vf_code = 0;
 	unsigned int i;
-	u32 width;
+	u32 width = 0;
 	int ret;
 
 	ret = of_property_read_u32(node, "xlnx,video-format", &vf_code);
-- 
2.25.1



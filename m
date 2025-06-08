Return-Path: <linux-media+bounces-34312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5AAAD12C9
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 16:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26BD77A53B5
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 14:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBC3254858;
	Sun,  8 Jun 2025 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IPQm2PDy"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8E625394B;
	Sun,  8 Jun 2025 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749394223; cv=fail; b=JiwFuJxQdFuSunNtrwJYcPGINDwymFsszmFXTGjIxupkPxiiK2v36RpolQQi4C2eXgDhtL7pQYZEYviomNUgS96LavVrCOPpbhclQHnqyw4UZ0z5H2jFpeDV/R5DLzx2/Z9vUBt5OswCQhtleI5QKqyGokmU1RUM+2IAZp/XeyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749394223; c=relaxed/simple;
	bh=aWK1OUF1jH7AgPWeSeDAyHAuSvulQBQJLWrdq74sWxQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S8tSJAoVShGEIrJds6PTIknjDu+MKHJfCAIdUt0uKymUrF968PkKkXh50FOtJLhWxFVh9qlxQ0VNdsU76zjvJ/AT/3xTHFiUKARez3eZLCrU8/K6wBgtQWx+BztD+V03E/Ygjb/9qEMtGBJ5nwZMqYSlCRmFeZCVaEe2aMQUuWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IPQm2PDy; arc=fail smtp.client-ip=40.107.237.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nF1DCU7KpP0JTlqodTU7BxzcZuX17sLghHaqhScrc+mA/bGp4CvudMfoyEq272ZlJpr3tirM9WKy5uTyC/m+tiWqeiTWNgTVwiRM7N7qwSxjNhUwBKEVQhXS9ahmLycYY48nii/4zwK1BFSirGrGLigU89veUceMXHKuj0fckYbQ5D9idLOHRxkJrikp9fOp2tHGOaGGDqGvu00CRIz47LxNjKcaCd9e+lX1ox+CAsiDNFBbS1SqghsJsfmQtB67RgZHDaVfb/xMskeQySaBPbfl8RJ67dscVi3OM8d1Bm9pSgtFB9OMO9+0nAmivpNNA1rggHkfefCIpQDLyxGq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKyumb23X64NDqw+1Ucot2U4KTo4HZ7P2r8lXshFAMU=;
 b=D7JrnCGvKLFNTk5vLqHYzVd9QdjamloTyMTCENJsHJhYEjMWF9xDRankN2y0E4Z9iQ91xzjYKoLMKf9qkvR/IonDZITVMR7B8L0WlZeEBsmutApvYC98KLNAMu4teHktLtxgp223qro53sryDaHnto1mcU0riJLxEaIPMQGWDuhuekM6FltDvO7MHDLtYT9NHt0qIINHE5vyc6X4fR3V1TFuD+WQ0M0YME4m7f8K1mh7D44/pNlaPcpeLg1QFkZEc1g9Cn2aSv9Ru83eVv8fyO5IikTJkbH7eP2vdAVOtn8LBi4BEpXTroV4tKdvr10V/gwfCYX1XFt0ocfbojE/Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKyumb23X64NDqw+1Ucot2U4KTo4HZ7P2r8lXshFAMU=;
 b=IPQm2PDym7qS3Bix8QQvcPm6FsPQYEQ/Vl4xex78kN0xSSHkmpA8jvNNFdUpZ+0xTGetbWCBLpgC7gfajxAuW7t6+mzm4RSJBiTBZaII63Bd3nwdD1lgZLFQG6fsJH6KKYbAiF1VkM/Lj0hSUbo4X+yphfsRi5dDZd1kmhW7kEY=
Received: from SJ0PR05CA0202.namprd05.prod.outlook.com (2603:10b6:a03:330::27)
 by MW3PR12MB4395.namprd12.prod.outlook.com (2603:10b6:303:5c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Sun, 8 Jun
 2025 14:50:17 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::2d) by SJ0PR05CA0202.outlook.office365.com
 (2603:10b6:a03:330::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.14 via Frontend Transport; Sun,
 8 Jun 2025 14:50:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Sun, 8 Jun 2025 14:50:16 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 8 Jun
 2025 09:50:10 -0500
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <Svetoslav.Stoilov@amd.com>, <bin.du@amd.com>, "Bin
 Du" <Bin.Du@amd.com>
Subject: [PATCH v1 9/9] MAINTAINERS: add entry for AMD isp 4 driver
Date: Sun, 8 Jun 2025 22:49:16 +0800
Message-ID: <20250608144916.222835-10-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250608144916.222835-1-Bin.Du@amd.com>
References: <20250608144916.222835-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|MW3PR12MB4395:EE_
X-MS-Office365-Filtering-Correlation-Id: 8982f6e7-71b2-4fc9-5672-08dda69bc86c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u2I/3i3Kv+nW3CkV+LkQoizcRErQgiH21tLUr0UETsRlGr3pGeZ1ozvV7v/w?=
 =?us-ascii?Q?/HHvbgcK4TS1XKMPmN0o1GbjuTRDV/UgzUGzDF56SHjkMBmFl7cW/eMYDxxf?=
 =?us-ascii?Q?x4zbw+GkTCWFQlxT4pP2zQ2kylUAzIpqr3bQ5+fEgcc3aS9G/eWfkuZx3HeS?=
 =?us-ascii?Q?09mGs+jNqTiMH8u2Atut2d/E7a2hgbHILI7JWO30GgGNOuuim2JIhy4gxILK?=
 =?us-ascii?Q?Ydq4xY3rM0vUakHrtEFHUS4x5eCOJ/r/DvoqC5JthaSKiC1q3mpRPGmHrRpP?=
 =?us-ascii?Q?N6eV+q20PdfuPk0o7ksnzoUulPsZcLq1PXDSKWf7UhgBAaNm1/+MmwCVriLj?=
 =?us-ascii?Q?chZcQ11ZTkUGeoo7fQGCqZNrtxHGOFMdFTGvG5rGmTXbX6oj0wJPcxUsFwhY?=
 =?us-ascii?Q?mjZURamBb9Om8W1IIvPfGbNg6WrmcS6K0a8dv80M6cmCmhYLqf/B1YN8hNC8?=
 =?us-ascii?Q?dRQALxxSUtTASZdM61toX8+abHKfh9/twGp6/A2BnxF2+H//tU+GZCqQCgOz?=
 =?us-ascii?Q?ogYSiy90Yi0IB100zCzuafD0jEIkZLuEosFR+LAjN5R2do033kU4qnrRE9DZ?=
 =?us-ascii?Q?dVu1ZckNmEYzlLWyDoY8dK8ILCMmP72gByRF0jFNUq2kX0QUxVGXEADgi47O?=
 =?us-ascii?Q?SE/UVNsmyHukFypOg1p19XfWAeDd97roy0QREc6HNBa8NTP+kYVkH8dEzLNp?=
 =?us-ascii?Q?5Vk0CLFVlgLysNWfgEg5HvYFfNqbjPbcPRw3gNGkuz5YOGWClGxYBemh/syw?=
 =?us-ascii?Q?nSunhdKnfCOCljQR6luLrtLuLjXUgMd04D8O8siTRwzo1y+JMMS4YUQE92lN?=
 =?us-ascii?Q?ytlU8z0abDFa6dCxMIpLz4qhKY/sSTDGxb6z3FGPquYfn5WUuIjhViPeE92s?=
 =?us-ascii?Q?Bt6r57kpya3o4Dmj3B7yDw44M7Styfb/QBSgfRgY+5JvZvsg7aDGidVZODJs?=
 =?us-ascii?Q?mOa09xZB4goDf2tKj4b/oliQLMkzudAJuOe+LfZo4yJpEm1Hr2EtswoXQpUc?=
 =?us-ascii?Q?a1YK9X57RtJBGsuyga3qR5Ebz4fCRVtVdgaTy8o7/TvHBpr05sdU8+P+3Qo0?=
 =?us-ascii?Q?6EvUKru5maEE1P0i9c8EubwLLc1NBLBfgUjqHAKMdnm92TlPtnjFnaAqaJEV?=
 =?us-ascii?Q?CF3LiZ5pJpwKWq40mN22YK9wV/udjvHmNuVn4OWh8dL7nfm4nzgqwYpkljIf?=
 =?us-ascii?Q?EZeTbXGnuMluIoVJgN9f8LY+RIjk8Ml+oXIdchgaZ802rugbQveR0Y9OSOJJ?=
 =?us-ascii?Q?Z5T41mfQrI4YQfBezMiI988f1uraOadpdlTzrFIYv3RV1ohTeqn0R3KtIMeK?=
 =?us-ascii?Q?29twzm2LCBYbO3/Kt2b5s8+ebIbxdzKyyRnKieOrmwYtW/t0y6cZ4G1LEI7Z?=
 =?us-ascii?Q?16iSxN/kId2jR5LKLEAf4XzGarzUPrXG7FmmS5T5+ptppq7Q22o0CONdgBdQ?=
 =?us-ascii?Q?DpKMaZICiLptTsqYPwT2Et63mUVExmQUIUPdFm0RjuB1Wl3K2vCGN7fXePB1?=
 =?us-ascii?Q?iVyPPxlNGWDqt4QammHtGhNSPfXEBv4VWem8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 14:50:16.7705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8982f6e7-71b2-4fc9-5672-08dda69bc86c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4395

Signed-off-by: Bin Du <Bin.Du@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Change-Id: I715f1318f02e4a689fefc98fc983caca9c448ef2
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10893c91b1c1..15070afb14b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1107,6 +1107,16 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	drivers/iommu/amd/
 F:	include/linux/amd-iommu.h
 
+AMD ISP4 DRIVER
+M:	Bin Du <bin.du@amd.com>
+M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	drivers/media/platform/amd/Kconfig
+F:	drivers/media/platform/amd/Makefile
+F:	drivers/media/platform/amd/isp4/*
+
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
 L:	amd-gfx@lists.freedesktop.org
-- 
2.34.1



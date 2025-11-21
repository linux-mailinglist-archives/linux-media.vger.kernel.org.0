Return-Path: <linux-media+bounces-47561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B62ADC78790
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 11:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 900B33646C6
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 10:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B0E342C8E;
	Fri, 21 Nov 2025 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yfWYXVaB"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013009.outbound.protection.outlook.com [40.93.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F97F3126AC;
	Fri, 21 Nov 2025 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763720086; cv=fail; b=pPkDr19jRHNuWir2BNivPeW/Bv3PbAwbKT/HvLi0OnZm6iQelmelsphkRC2SMcFFHRSeM31DCnAANKQcBChDNBlQOFUzirmFu4nWVB++z8xz4A1ifqbNuMSjKnjnw5zRdLex7ozwW5aSUrQc1On2CW8eLodqp9xiWlsVk18Xl3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763720086; c=relaxed/simple;
	bh=8yzQsEa4QA1ppXKUhEMgAZoFMF8THC67MItBNlqHOQU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3QchWCmCYLT8ZC8Ymu8iNjPHMZZZDxNrTAQp5aKcraVJ0zbMV6giKpwHX7oAqL0VsHFoLzJpFY6M/i+FOxPpkx293i1oV4LtpcPvjQ6FbDgivVENXMhYiFkIVAgY0rZYr58I70B8dbcvNbrIfZBZkWVaVRVH5hwL5U1GX0kQUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yfWYXVaB; arc=fail smtp.client-ip=40.93.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaIUuXVdRnbBZHtJ7S0onzXha00o8YxqiE8uvc1jVB7GDLCqoIVUeWce7k6/RQ65xe9BzLMXvLNaaKcn8Kopo35dswfJmDWEFot1vafmrGtspalezX3Pqv80szPZzNxGarzdRbNehWn1N5mOawQV5Jd+ReVMt4WWtyUdIhQfHq2ZYqnq0l9hVWpRDcTdDrjRiXsGf7x2ADO+uI2OVOcvDP2s89osEtV+ZqxjZbHRzBSVJF/cs/V6BgEndHT6SnY4vn1tFSjPpsKpm42MDTH6vlDZ60KuHBPZleYH5lnBdG+gDsPlyadb06lxTRJiH2s6y8m19qmghiTD0hRY+HbxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMvkpJTbjkC409mU3vAxaYJp3UAUDSMDluh8CSC6Udc=;
 b=JQ5dAkR/aMIgVz3fZ/gj3dSxKDKjhbECo90nU8wcZ/DOXQT9Qtnp+wg9ZWIBiyloYlnhpdrVN8V4A31fh5c+/FIO2wrGH2rC867H11/WhEe0PvZz9wpC7QchJKRi9JIc9PM4NK88VwesspTTDVBmRXQcYtLjHmm0A+NyQPecDi7pMLWseRPNtwmoVguXmAsFtc7yi7alZLk/AaN9IApunz2z9UZfMYgGGY3yOaOos5rCUwyPQbWN33LPqK+cpGwsYjRSPQ7b00s9tjc/6ZztWDT+750G2xLtRcx6kV7rit0GaCMDCLl469+BDxZTUi+64xt6sSscxbAsTZsn2iu+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMvkpJTbjkC409mU3vAxaYJp3UAUDSMDluh8CSC6Udc=;
 b=yfWYXVaBmcyOE4q4LyK7DoCm1GNCfclhk1sgx6j4NTr7QfiWpK8hl6e0iKgKfhPTbj/tpAb8MQ8iwJGa4O/Qlexs3Z9QlYlY1lCl9kWVzj/SUfP8a1ANx66L1b1EMI8ZhYI9+hn3eVqcmfn8HKQLLcHv/cSaR2BoKrqfVkln6Ao=
Received: from MN2PR07CA0025.namprd07.prod.outlook.com (2603:10b6:208:1a0::35)
 by SJ5PPF183341E5B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:14:34 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:1a0:cafe::54) by MN2PR07CA0025.outlook.office365.com
 (2603:10b6:208:1a0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:14:33 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:14:31 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
	<Felix.Kuehling@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v3 09/28] drm/amdgpu: pass the entity to use to ttm public functions
Date: Fri, 21 Nov 2025 11:12:19 +0100
Message-ID: <20251121101315.3585-10-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|SJ5PPF183341E5B:EE_
X-MS-Office365-Filtering-Correlation-Id: f71f6a36-8ec8-4a37-6317-08de28e6c459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LVanKeRASMrlZvxJa6RxaJ5vZHbPcw17VFJqustRLxAbC8IdDFKOtCBBBYdM?=
 =?us-ascii?Q?F23mma9qxKwEZzRbzOT56h2IrPPi+XVegdhBRU2npJjsLQAt4AOOV3uFUyhg?=
 =?us-ascii?Q?HjrfECWxJyE3UZrH4NKAvN/YODJ8U0PCExRdYH5bHznuMwg1wzlh3hiO6Nd1?=
 =?us-ascii?Q?VAicGP/DmS5AEzC0oEDhCm4sQzyKjxNAbNhcQ3+e4F7ocFaInBPbpbloYD4h?=
 =?us-ascii?Q?COzJinyAoP6LbbFvPQnIS7BGEtleWO6VSv2QlfpQrXWtkWH2p8iZg0VukQKp?=
 =?us-ascii?Q?y2wAyLACzT9xp9Hmy9EG48Hwm0m7dsTuVchEJONxrj35mVASkAqkIYXMfe2f?=
 =?us-ascii?Q?M5nc4qC039ZBvqST0g0MxmeBR6pk+oM7NLU/49GXmOq05e2jf7D1EYTzacLq?=
 =?us-ascii?Q?KzXNdwGNf3niRoPVIawCt4RYxjlWVq5gOnk88QcuEt9QLFaI4n0uMzj5sRQw?=
 =?us-ascii?Q?u15AUz4K+UZIY+vBFddFOXKAgEmIk2NPmJSgDyAe0QBcOCOYn+7L2XvwAsZN?=
 =?us-ascii?Q?zuVYiFtWOMw1HHBauMOg8X2DRnlgjMuVPr7RYowwVvnBg2Lcs48/Gu+/Cyjo?=
 =?us-ascii?Q?G5/W3gy2cHhSMKOUVa0E5fJe21zk/JQstJWx9LuySOP7ORXxFdCTc7zRgq2y?=
 =?us-ascii?Q?hQGQQgRR/tQocf8ngxBKrIZ/cE225jALdmPvNPn32NGyPyimqjMHRU1foywN?=
 =?us-ascii?Q?Lys4LzBvoynTgSmMz5x8cOeh6GYV6NQw3vEcQnMRFK/3FPJHjyypI3tHjlfC?=
 =?us-ascii?Q?0lNqaEsEa2uqb+vqMxtzgMG4sMHvwqtkds8U2oQwIU+O+NlCcvKeKQfRUZt+?=
 =?us-ascii?Q?29iOwlQKaSx2TnLVPTGv/OizCsNZFtchW3vxwCr06eLqX2I41IahZ+3GQeKi?=
 =?us-ascii?Q?iWJwtZbqlGgkzv5TedQoDBH5VUFVk5I1/jmb6Q7HPfHp48IDs5QxjqlTSj7V?=
 =?us-ascii?Q?AzLwb9hRU7b8qoj02rkd63i+dWesNVk5oO7Ugo8Cl2StBz2QcKqE5S6m6B/0?=
 =?us-ascii?Q?0zFG0V/TSvX7bmlRXYBd6sDVzaXI2nyt+6eDjRCZMnLKaM+QrUFHBOMZ0a91?=
 =?us-ascii?Q?Dwe+U+XrtYlve3WBvu+Rekra+E+fhbDTQZ+A+rOy5nBXcce6uYv8Y5a8ndwh?=
 =?us-ascii?Q?ACyTpAyX1usVxCfE6xsbhVwMPYCGY7oLj2nQ32VLBwvCUkKO7g59D5s26BMD?=
 =?us-ascii?Q?ers/GLLOeYhg2M31sBIrTmMmXEnAK2Tcs0fKJnl0ZzjYre4GOxwkmloGBUgH?=
 =?us-ascii?Q?j+olmf+N6825Y2Oeg8FvBcPJCUlymGARF8TtG3mIZrfNt78lePR57xTCLIjh?=
 =?us-ascii?Q?jMoNimAzvQU6otjMMLHlFybkXlWA9u5qV/D4ors1ZT0jVQUOF/gHWN5SO+4H?=
 =?us-ascii?Q?4MffpcxO6A48xFSMylUmInPSaNAPnsORNWQroVFSANKUp8IGPvpHzFzvYlOi?=
 =?us-ascii?Q?7Q+h3kxHQx8g8dNfICZ6oiP+b6canxT2BRIaYB2cRitsE9EW4sPlS4J4tL+p?=
 =?us-ascii?Q?yJW18BQMHq7FyL3zWsC2wtLg85fOnrgZLFsBcPUsTIA4Tx4ztSX4BQP4YJ5l?=
 =?us-ascii?Q?LB1TF7s1Ko+g3oUb1CY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:14:33.4560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f71f6a36-8ec8-4a37-6317-08de28e6c459
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF183341E5B

This way the caller can select the one it wants to use.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 34 +++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       | 16 +++++----
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  3 +-
 5 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
index 3636b757c974..a050167e76a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
@@ -37,7 +37,8 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
 
 	stime = ktime_get();
 	for (i = 0; i < n; i++) {
-		r = amdgpu_copy_buffer(adev, saddr, daddr, size, NULL, &fence,
+		r = amdgpu_copy_buffer(adev, &adev->mman.default_entity,
+				       saddr, daddr, size, NULL, &fence,
 				       false, 0);
 		if (r)
 			goto exit_do_move;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 926a3f09a776..858eb9fa061b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1322,8 +1322,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
-			       AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
+	r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
+			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3d850893b97f..1d3afad885da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -359,7 +359,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 							     write_compress_disable));
 		}
 
-		r = amdgpu_copy_buffer(adev, from, to, cur_size, resv,
+		r = amdgpu_copy_buffer(adev, entity, from, to, cur_size, resv,
 				       &next, true, copy_flags);
 		if (r)
 			goto error;
@@ -414,8 +414,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 
-		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
-				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
+		r = amdgpu_fill_buffer(&adev->mman.move_entity,
+				       abo, 0, NULL, &wipe_fence,
+				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
@@ -2258,7 +2259,9 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 						   DMA_RESV_USAGE_BOOKKEEP);
 }
 
-int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
+int amdgpu_copy_buffer(struct amdgpu_device *adev,
+		       struct amdgpu_ttm_buffer_entity *entity,
+		       uint64_t src_offset,
 		       uint64_t dst_offset, uint32_t byte_count,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
@@ -2282,7 +2285,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 	max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
 	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
 	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
-	r = amdgpu_ttm_prepare_job(adev, &adev->mman.move_entity, num_dw,
+	r = amdgpu_ttm_prepare_job(adev, entity, num_dw,
 				   resv, vm_needs_flush, &job,
 				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
 	if (r)
@@ -2411,22 +2414,18 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 	return r;
 }
 
-int amdgpu_fill_buffer(struct amdgpu_bo *bo,
-			uint32_t src_data,
-			struct dma_resv *resv,
-			struct dma_fence **f,
-			bool delayed,
-			u64 k_job_id)
+int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
+		       struct amdgpu_bo *bo,
+		       uint32_t src_data,
+		       struct dma_resv *resv,
+		       struct dma_fence **f,
+		       u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_ttm_buffer_entity *entity;
 	struct dma_fence *fence = NULL;
 	struct amdgpu_res_cursor dst;
 	int r;
 
-	entity = delayed ? &adev->mman.clear_entity :
-			   &adev->mman.move_entity;
-
 	if (!adev->mman.buffer_funcs_enabled) {
 		dev_err(adev->dev,
 			"Trying to clear memory with ring turned off.\n");
@@ -2443,13 +2442,14 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(adev, &adev->mman.default_entity,
+		r = amdgpu_ttm_map_buffer(adev, entity,
 					  &bo->tbo, bo->tbo.resource, &dst,
 					  1, false, &cur_size, &to);
 		if (r)
 			goto error;
 
-		r = amdgpu_ttm_fill_mem(adev, entity, src_data, to, cur_size, resv,
+		r = amdgpu_ttm_fill_mem(adev, entity,
+					src_data, to, cur_size, resv,
 					&next, true, k_job_id);
 		if (r)
 			goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 41bbc25680a2..9288599c9c46 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -167,7 +167,9 @@ int amdgpu_ttm_init(struct amdgpu_device *adev);
 void amdgpu_ttm_fini(struct amdgpu_device *adev);
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
 					bool enable);
-int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
+int amdgpu_copy_buffer(struct amdgpu_device *adev,
+		       struct amdgpu_ttm_buffer_entity *entity,
+		       uint64_t src_offset,
 		       uint64_t dst_offset, uint32_t byte_count,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
@@ -175,12 +177,12 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 			    struct dma_resv *resv,
 			    struct dma_fence **fence);
-int amdgpu_fill_buffer(struct amdgpu_bo *bo,
-			uint32_t src_data,
-			struct dma_resv *resv,
-			struct dma_fence **fence,
-			bool delayed,
-			u64 k_job_id);
+int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
+		       struct amdgpu_bo *bo,
+		       uint32_t src_data,
+		       struct dma_resv *resv,
+		       struct dma_fence **f,
+		       u64 k_job_id);
 
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
 void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index ade1d4068d29..9c76f1ba0e55 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -157,7 +157,8 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 			goto out_unlock;
 		}
 
-		r = amdgpu_copy_buffer(adev, gart_s, gart_d, size * PAGE_SIZE,
+		r = amdgpu_copy_buffer(adev, entity,
+				       gart_s, gart_d, size * PAGE_SIZE,
 				       NULL, &next, true, 0);
 		if (r) {
 			dev_err(adev->dev, "fail %d to copy memory\n", r);
-- 
2.43.0



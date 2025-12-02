Return-Path: <linux-media+bounces-48075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1013C9AFB8
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 10:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 29DFC3478D5
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 09:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B4E30F93B;
	Tue,  2 Dec 2025 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VLraA/ri"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7448E212548;
	Tue,  2 Dec 2025 09:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764668985; cv=fail; b=Gt5HCnZ2mGXvMcYP8+XkehWin2PYk68wpYlRP2vdIQ0hErXPjzv80C3+H6LyR4/0ZIJQ0Z1gSp/UUGVk3rxfRh9IoWuVc7VUwHINnuS5A5SZh8DHbqK+9uS7eOysG7WRL7mJ7t8zAtINwqZDVI5hkuVN4Iute6e0ozW1iYavzIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764668985; c=relaxed/simple;
	bh=j142ta9SZ1nD/9l2rLjvWuFOzTKH6vCXy8bRzZLzies=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lDNkjJS6/djnlh1TkX3bcTfC1zbsSAYmKYPC5BphLCo7RuLbdQNXNN8CB2U5lMFpFDTLwRTMdZnJimMNfGrSoIio9xdibU4v8OR5I+ajrBTmeNnAlMa3eqgJcac1qh9DIK8gDKklNmpsKe7VAC+oPA78l6vVgF3QMo9avEREMk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VLraA/ri; arc=fail smtp.client-ip=52.101.56.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgaMjvmhaly3hMstA+rVDZ7iyxFeTC36sUQfiM+qL9wQQWReEay+qSBLAmnGhwqGtJLTM6aRCoY3npaZSpVltt/cA/RJJHfdpa7ds3ezXmaOK9uPp5tjFPwngAFU9bYRJQJd3kAIeIvtq3SKdoFffCXLWiKZ/c7yJfWz0T1gysuOWBMovdL0cyglktXQjD3hsTH9jsmcHL+VJALtT4Uj12hm7DKL1qQQjmWLlImKLp7NptXbfiOX6HaFe9VSltPAa+d8rA+l563Q9AVv97CjCwAyNbtnGxSmXW3LjQN1TIT037ihuYwvxh7o9a/EN7FeOXYirP5h6BjtxKCkbkp/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0d9N0PwT6civBu8V+Xr14rC1hBE4nef2qZPrEPvAyBY=;
 b=Z0fqUJc6+CpLhXpyQD1AECJRtG0YSYv9vFIetsK0/VZwH6ObPYE/a9LNvR5n99PQalyRFgnQU5rzba4NhRe79lOLY+vrb++95MIMOKEsgAUB4HHcvyRMYcunbetEZyAX9Nq6y9cNhhc6qBc2pymDuW3mqNt0IkWY+ge0IXWEW6OuStw2xrktQTsvqwnemqzmCe4brQurItgY+xc9T9nFxM5AhIX1vLL6U0wAO7o2e5K9ZH7xTOng6r34h6udnttC+uEuA046cTirZBBIeNh3QwzI/NTAMqkLkeArtRE3ZtR13jRl65WN8r4F0RHj1C4xDvz+RrIkE+st8thoKXkjuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0d9N0PwT6civBu8V+Xr14rC1hBE4nef2qZPrEPvAyBY=;
 b=VLraA/ri8Po8wH0Msw1LOo5uHyCtt7chaG45UT8sus6rUDnRjC9KYUCywrXElq7H+bGdSyMGI/VKY99cCLjy7vaYUVLtGrwrnyAWpVpMBOvycw7FzXf8SWHaUCCNWVxxXbY+f26LXFf5yqVOok/G4qqoe+F6bKjsg7vjB+Z47Mk=
Received: from MW4PR03CA0177.namprd03.prod.outlook.com (2603:10b6:303:8d::32)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 09:49:39 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:303:8d:cafe::a6) by MW4PR03CA0177.outlook.office365.com
 (2603:10b6:303:8d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 09:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:49:39 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Dec 2025 03:49:27 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
	<sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v4 02/13] drm/amdgpu: add amdgpu_ttm_job_submit helper
Date: Tue, 2 Dec 2025 10:47:12 +0100
Message-ID: <20251202094738.15614-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f236c38-31f9-4f60-df6c-08de31881c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SW1JdVorN25KUlNrWE5mZVhIam9KVDZIcG5wbHZWTjJreEZndk1udm9HblNx?=
 =?utf-8?B?ckJBdDZKZnl5dGYwS1VOUzg4MUhSNE54U25jUDVEaXRqWG1uRC92cjNmRGpX?=
 =?utf-8?B?OCt0elpYc3VaM3VEcDQ3d0tVNTVQeHRwZ0NKRFZCZlhHbEpKeWNNcHUxQzBi?=
 =?utf-8?B?QURkWnFhMVVpd3Q0RVFaVHRUZXV4cmROR003L1JwMlhBQjA4bSttY1QxbjF2?=
 =?utf-8?B?SHBqTlRTa2pTVDd4Yy9SK2EvVmk3Y3hZUy9ZN2thRTZJU3JJbEdFTWpqbTRn?=
 =?utf-8?B?SzNnWUxSWW1sQ05obE0zcUZqd3Y4VmZWN3VrU3Uva1hVS1EwY09leFlEb0pq?=
 =?utf-8?B?bURaVEZ6b0VpZmtFV3ZSa2JKTnhEZVdTMU9wcURrMVZ2NUlxb1N3QW83MFE1?=
 =?utf-8?B?RCtNMDk5UzluSGZETldVeGtCeU11bUlrRUxBTDZwODhlTUJrU3d3c3NxZG4y?=
 =?utf-8?B?M1hqRFZEcG1oemE1YVJvOFlxUTBTWVR1ZXB6STIvVTRZaXIwT0pQYVhPZXha?=
 =?utf-8?B?QXBtNitDODMzVzdiM0lqbXl3REJWbndIelhVeVJlSlhjSEpPaTFOMGhUVlc1?=
 =?utf-8?B?OWEzeEl3RklSOWo2RHZ4YmJjYnljRlRsVzRpdG03enJhcU95ak82NlpEeWp0?=
 =?utf-8?B?ZDhsNFB4L01EaDFXNkR0TTNiUllKaGR1enJYeEs3RkkxbXp4WTdneDdmS3Rq?=
 =?utf-8?B?WjZlY0xsMm1YZWhwNzBkZ2V4ZGNKTVhpbDRZdVpUTkFHWGg5UVoyYVFrbkJC?=
 =?utf-8?B?b3U3ck5sTHBqdlR2OWM1V2R3RlV6MzIzRThieVJ3THlYOUgzUUMyMWlGUzRo?=
 =?utf-8?B?ZVV5MnRNU2N6YW83dVVCK3AyOGwxb1E1V3dmTnlSLzQ0cndrNFRkOGY0SG9l?=
 =?utf-8?B?b3NOa242bVB5azhNRWphR1JoOFFmZURsbGFzeVB5bTBRdlV0Njd2ZUV1elMz?=
 =?utf-8?B?VUxMZkkvL1JLSjBrSnhVNVNpLzB2Rk1Nd24vRU1CeVFSSWRvTDRDbE9ieUVV?=
 =?utf-8?B?YzVCNHlEc1JnNTFnYTZUWUlGTmRKRnBwOU1JS2FSQnRDSCttZHkwNUM1VU1y?=
 =?utf-8?B?S1Fvdi9DQ2N1bUp4Wi9wc1dVbnJpRmFyNW1mLzY1b0JaOVArODJxcjNQeXRu?=
 =?utf-8?B?Y1R4eTU1YVVhUm1LZm9VTldpSm1WM0RlamoxRXA5czluOEh1dFk4WTY0cVg2?=
 =?utf-8?B?ZHU4bmdXcGE2Q1NuekNXOXozQ3p2eVJ2eldPWFVZMm1VeS9XK256cFhVQTcw?=
 =?utf-8?B?RzlwdHlCU25wUk1SY3AzQy9HbnZNNzdyNnZ6SGhNcEo3SGxrMW10cDVEQWZN?=
 =?utf-8?B?aVVBTk1kNFhqNzdPenMvNVRaa1IwTVRzMEFEZlpLVzFDeDBWcUhITWNXd3Vq?=
 =?utf-8?B?ZzVBRGlhS3hVM0pReTR5dURLdXBVUTl6NWRCUFRta01YZ0hzeTVXRTIyellC?=
 =?utf-8?B?OVJDcDlzcklzVGZYNDU2YmNWYzN1SGdYMTlrTy9RaXRFRWVhUVJ0bXRyTnJO?=
 =?utf-8?B?d01FbllyU2lmZ3VKbFFWNzY4Lzh6Z1hqSXFNZzc0Z2VGWllEbzNXQVZsNm1J?=
 =?utf-8?B?Nk9wR2o4ek5MeUZUZ3Z1M2J4V0R1Y1R0L1Vtbm94bVVnZ1NTR3JhSGFZaU1D?=
 =?utf-8?B?b1hMUDhCVHQ2bzBFUjl3SHNWUW1vNWIyd2VCYWg1SENnNWZNSHFhU0s0WE56?=
 =?utf-8?B?cGExTkQyZWF0cGhrS0phYmtXV2s4WHFnTUtET255aWtNZys5ODBNWEpZL0hj?=
 =?utf-8?B?MkZld2JpTVh2QmRxTTAySDhuTFVtOWxFRWVtSDk5eXcwdnBXc1VKTUJDYXpE?=
 =?utf-8?B?UUlnMmxFcmZaR09mY1lrMVcvanJnVGxQQlhWT0hHOGJuVXhORTZERUpSbjln?=
 =?utf-8?B?Wk4xVnAvL09IQllFVEJ2Vld4L3p3bWN5R2JkZ1RlWCtBYVdTWitRQ2Nid2da?=
 =?utf-8?B?cEoxSUYxNGFsVHJCUGlXZE53ditXSTg2ei9oVzBjMWxPbFJFZ2ZVamx1SXg4?=
 =?utf-8?B?TEYrNWUrbm1CR2JjamdUR0g5SW94dWdTMmIvWVJlODZzTi94c3ZyampPLzNI?=
 =?utf-8?B?dWdVOW02TzJUNlAxc1N2ODFHaUIvTWtNb3UxSTE4SWh4c1pnNUZLMVRkYS9v?=
 =?utf-8?Q?czlg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:49:39.1373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f236c38-31f9-4f60-df6c-08de31881c43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726

Deduplicate the IB padding code and will also be used
later to check locking.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 34 ++++++++++++-------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 843a0e483268..ae3ad19667df 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -162,6 +162,18 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 	*placement = abo->placement;
 }
 
+static struct dma_fence *
+amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 num_dw)
+{
+	struct amdgpu_ring *ring;
+
+	ring = adev->mman.buffer_funcs_ring;
+	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
+	WARN_ON(job->ibs[0].length_dw > num_dw);
+
+	return amdgpu_job_submit(job);
+}
+
 /**
  * amdgpu_ttm_map_buffer - Map memory into the GART windows
  * @bo: buffer object to map
@@ -184,7 +196,6 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	unsigned int offset, num_pages, num_dw, num_bytes;
 	uint64_t src_addr, dst_addr;
-	struct amdgpu_ring *ring;
 	struct amdgpu_job *job;
 	void *cpu_addr;
 	uint64_t flags;
@@ -239,10 +250,6 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
 				dst_addr, num_bytes, 0);
 
-	ring = adev->mman.buffer_funcs_ring;
-	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
-	WARN_ON(job->ibs[0].length_dw > num_dw);
-
 	flags = amdgpu_ttm_tt_pte_flags(adev, bo->ttm, mem);
 	if (tmz)
 		flags |= AMDGPU_PTE_TMZ;
@@ -260,7 +267,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
 		amdgpu_gart_map_vram_range(adev, pa, 0, num_pages, flags, cpu_addr);
 	}
 
-	dma_fence_put(amdgpu_job_submit(job));
+	dma_fence_put(amdgpu_ttm_job_submit(adev, job, num_dw));
 	return 0;
 }
 
@@ -1497,10 +1504,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
 				PAGE_SIZE, 0);
 
-	amdgpu_ring_pad_ib(adev->mman.buffer_funcs_ring, &job->ibs[0]);
-	WARN_ON(job->ibs[0].length_dw > num_dw);
-
-	fence = amdgpu_job_submit(job);
+	fence = amdgpu_ttm_job_submit(adev, job, num_dw);
 	mutex_unlock(&adev->mman.gtt_window_lock);
 
 	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
@@ -2286,11 +2290,9 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 		byte_count -= cur_size_in_bytes;
 	}
 
-	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
-	WARN_ON(job->ibs[0].length_dw > num_dw);
-	*fence = amdgpu_job_submit(job);
 	if (r)
 		goto error_free;
+	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
 
 	return r;
 
@@ -2308,7 +2310,6 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
 			       u64 k_job_id)
 {
 	unsigned int num_loops, num_dw;
-	struct amdgpu_ring *ring;
 	struct amdgpu_job *job;
 	uint32_t max_bytes;
 	unsigned int i;
@@ -2332,10 +2333,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
 		byte_count -= cur_size;
 	}
 
-	ring = adev->mman.buffer_funcs_ring;
-	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
-	WARN_ON(job->ibs[0].length_dw > num_dw);
-	*fence = amdgpu_job_submit(job);
+	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
 	return 0;
 }
 
-- 
2.43.0



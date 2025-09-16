Return-Path: <linux-media+bounces-42603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C2B58ED1
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 09:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F15561B25FD3
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 07:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598E72E4254;
	Tue, 16 Sep 2025 07:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gKO/ndzt"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077592DECBF;
	Tue, 16 Sep 2025 07:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758006563; cv=fail; b=JGzp1B3zyTkNRmZjVvB1OsO2KFI36Wd5XoTG1MzqSN+/qwz/avtqgrPq/AsMyJStQhsEoJB/8nXcK1RBxZNTTF5ErOn29UzfjRPVonOliBQYMZXgOWaFLcCa2OOtafwVBM7QWNBSWgRr3Lz5m5b8MAJ0mxtrVE0BF4ryL66Wi/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758006563; c=relaxed/simple;
	bh=310yzaPXt3Tmtod4xIx0f7+Q6gAmdHIYxoz3XY6j1xc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GRo2jEmBoUP7UQ4TCDEOQkgacbdxPvpdhP++vdEsW8fjBderHzB6sUcmjDoOAJ8f7hYJAz8kmzReNxBkiN48nwBhf4Yfh21ZSUIZhf2PUNRqDnd031kahbiqspjwO9wZdYtFhBH/Ddw5PoyhV2U4N02RqULfCCID8nzv9eFfy8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gKO/ndzt; arc=fail smtp.client-ip=40.93.194.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpcvQgv06Zi6IG2sNmu/j0R6vmbuu5uUr7GOt+wfO7noAP+f/tvpWl+iyhD5ze4M+7cGWJvZD1B2YSLBKNR1lWUbCyC8va1t8X+4GKxPpJ/d677kRhUmDPzHsHWm42FFu8drKvUMnU4LcdMSec8Eudr5/8ndJ0BiLhTHFdoDRlKsLTeObHSFxvbW0Pd4Onhnp1RHpOQM2n+0zsg4r+/G7LS5JQ0N4877VC9dtbpudvrQC/WBi2NdZShbQva86ZGnEMSKfoGwJ9mD8bucz3AP8mFgc4xdCDLCAOxRFaJM8I8259bRYWHFuwHLabh6a/RC5iqPFgJxPLHhG/c8vUq5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWRdjq1mFPXQS+Kel5TizbGImLeRY3CN76/d23PpHy8=;
 b=EYX+JNKlSnMNe2E0pH2OWb+fP7fdPhziS4uLOLN9gfKCX8MoSypKr4px3NprgPWUezCkVk9EGfvK6em9WA8IqgKAGhdLszq5iDznuYzwJPb6NDzW/161o80V2JKpngPNZ7uo/A2rgCFaqWQoY0b/dqUVtABT50ZRpazqGxEgpbBu3DvA6Qjfqvm3diW8mDQVekRCUkazmroKrfxJsyEdR6VwiP1tjcf7sAdtibScEv6/XKPbAz2FOjxtJjyNwirZz69bD2gOpY32rFoqMkXsExFzEbhoKJD4su1V1gUdd7mZdEo03D6awr5dIxWBvnEBfi1+0Hu0ATFXyUU9C/cvog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWRdjq1mFPXQS+Kel5TizbGImLeRY3CN76/d23PpHy8=;
 b=gKO/ndztHl9y4SVSV4oGHM2NMlfYt9RM9B2hmZpIh3rBTohbXRrdH9BYL2J9OkkvHZ9doqpm4pIDZr8kUhlTYAMxwIFKBbF/VVjpyJSg6+qox1afGoa5lWJpcyQuJcQUbf+pqW2OzLjftNe0NyPHfLTSjuQQxegwAd4Rhu41a9s=
Received: from MW3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:303:2b::17)
 by IA0PPF6483BC7EA.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bcf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Tue, 16 Sep
 2025 07:09:17 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:303:2b:cafe::b3) by MW3PR05CA0012.outlook.office365.com
 (2603:10b6:303:2b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12 via Frontend Transport; Tue,
 16 Sep 2025 07:09:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 07:09:16 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Sep
 2025 00:09:14 -0700
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
	<sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v1 1/2] drm/amdgpu: make non-NULL out fence mandatory
Date: Tue, 16 Sep 2025 09:08:44 +0200
Message-ID: <20250916070846.5107-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|IA0PPF6483BC7EA:EE_
X-MS-Office365-Filtering-Correlation-Id: 63424a22-5b60-4369-7ba2-08ddf4eff2d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2ks3k1pSuDa7CoR/xROnaNU7LupOuPIsl3vcFa4i5ur6Ku6ZAxdeMffImGzy?=
 =?us-ascii?Q?1Kq9uanUU1P0w/rIqJYbjJ+Z8Dqnyo1x4z+2E7ANFZFDf6skQYMcsQ4aifSZ?=
 =?us-ascii?Q?0yLNHdQTxoh/sg5BDFhDDPzLeJbc8kLEXfg9S6trhTwM42gPI8kE8rKFC37B?=
 =?us-ascii?Q?wj1klMsqljVXm9bLL2c+hoBC36A4H2isKQidlDi9elq32W/0BP+EdbEcQWjQ?=
 =?us-ascii?Q?/rdlrcJRTG4my8Odk5OA70kIiRSaaADu0i2pZvOZQfYFgf+oDPyLhwrAfAXc?=
 =?us-ascii?Q?2glW7qGwRjngsmCSmJ2MPaWtxcY6Yz+J3yWsxD1EC6gy1twuxe846XfOxyJ4?=
 =?us-ascii?Q?my48GRFeHqTNLi3N+pKHxHMKeAxKWsmYO4Fa7amTq+FPYxL6uTJu6GLxPFYB?=
 =?us-ascii?Q?NfI7Rp9/aLXdWv/QO+Q6id21bzsJh0oAl2yjRzhRqRlTbLSNnrm2XH37pHsq?=
 =?us-ascii?Q?if2VJmI0/95Sead+Jj1kSptmfouAqt7/3JbgIT1/oDaYoG4J8wptChoDZHA4?=
 =?us-ascii?Q?kMm4aQSMPfpmpkPqmOpaOjOtu4S/OgVuWfds4uPtLgdXvfQT3ixEcwkezBhy?=
 =?us-ascii?Q?ZAM+fdpqjF0kwMl2XtNUg0OBPmvr0R/3C0V7VotD0k05+jP/Bwsk6NnmRZB6?=
 =?us-ascii?Q?fNzcEz3p5LrSaTmOGg7Tmyi4hqoEHSuQZdqXjT5h1QZywbB5tP3eesvj03n3?=
 =?us-ascii?Q?nrDplJc8p0uCDXiv3fFvkoNGKv3P3B8oDm3bteG9xZUoma1jdyXq6Y1RDvqM?=
 =?us-ascii?Q?ug6o72mtgPp9LeKzr+oTC9qIj2b1klGJMIq006bqX8ENkZ0LjFXhKFwrNScg?=
 =?us-ascii?Q?3pWoe8Rwo4gxjkcaUm/0ZqFVrDxRKSS6F6kd75lhbHeWYibKmS2Q1DBtJu/W?=
 =?us-ascii?Q?/znJvk1oJ2qBRjNKMlJLATHseOXdQsArKELWDmeUrfk1tNPMXbS3yPnuD2X1?=
 =?us-ascii?Q?zuiUEF3qtVXPro0Bz4JhOgJTnMLnKyeBHyMrevBUu7nXA2zXL5jGztJCMiUQ?=
 =?us-ascii?Q?pzCsD85+QyZMNvqOh/t79O+BxPuyL9j01cT1S+nbKKMPCDH3RnwCSnB7WmB9?=
 =?us-ascii?Q?lI0UVxheRC2RUSWAYyHrXzkpKJ8uOBauqZIKg36k9gWxmUG3ALQogbvFpI4u?=
 =?us-ascii?Q?q0endEU2PgyxVGk1G/aYz2Tq+XVq5fdoHlj5Kkha0aWhcu2RcZhuC46nxGMi?=
 =?us-ascii?Q?gY5tdXg1dZY3pig3weRoEHph14FrJseMOXNkbHAb0474uiXxK2GXtoKtwCxZ?=
 =?us-ascii?Q?Fso5RDbJaV3tnARscByoIjGa1+hnjRUShqy04MjwyJ8QVLj8jw5T8d+ekmAX?=
 =?us-ascii?Q?dMJHzx/rcqFzsBBYtFy8gqADfbn5vo8hWiX+WOJgmwauPE7cgbUWvyM5dlkK?=
 =?us-ascii?Q?J9r/IPGDeXE3fc/CTjw6kFEUyteRbygAdo19HCK1EOS0N7O7rDNv+sKLAuUN?=
 =?us-ascii?Q?ixMu3E5P4U0VVVA+kO+stPeG6q3TGm5siH2eVclX1jx5Enu5q/DNP/eBbd34?=
 =?us-ascii?Q?tRGOMJC84MFxUMPDibTWhBPAAhciKtWoUk2a?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 07:09:16.3317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63424a22-5b60-4369-7ba2-08ddf4eff2d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF6483BC7EA

amdgpu_ttm_copy_mem_to_mem has a single caller, make sure the out
fence is non-NULL to simplify the code.
Since none of the pointers should be NULL, we can enable
__attribute__((nonnull))__.

While at it make the function static since it's only used from
amdgpuu_ttm.c.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 17 ++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  6 ------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 27ab4e754b2a..70b817b5578d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -284,12 +284,13 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
  * move and different for a BO to BO copy.
  *
  */
-int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
-			       const struct amdgpu_copy_mem *src,
-			       const struct amdgpu_copy_mem *dst,
-			       uint64_t size, bool tmz,
-			       struct dma_resv *resv,
-			       struct dma_fence **f)
+__attribute__((nonnull))
+static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
+				      const struct amdgpu_copy_mem *src,
+				      const struct amdgpu_copy_mem *dst,
+				      uint64_t size, bool tmz,
+				      struct dma_resv *resv,
+				      struct dma_fence **f)
 {
 	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
 	struct amdgpu_res_cursor src_mm, dst_mm;
@@ -363,9 +364,7 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 	}
 error:
 	mutex_unlock(&adev->mman.gtt_window_lock);
-	if (f)
-		*f = dma_fence_get(fence);
-	dma_fence_put(fence);
+	*f = fence;
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index bb17987f0447..07ae2853c77c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -170,12 +170,6 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence, bool direct_submit,
 		       bool vm_needs_flush, uint32_t copy_flags);
-int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
-			       const struct amdgpu_copy_mem *src,
-			       const struct amdgpu_copy_mem *dst,
-			       uint64_t size, bool tmz,
-			       struct dma_resv *resv,
-			       struct dma_fence **f);
 int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 			    struct dma_resv *resv,
 			    struct dma_fence **fence);
-- 
2.43.0



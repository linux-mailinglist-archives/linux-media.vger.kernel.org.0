Return-Path: <linux-media+bounces-58025-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ANWEjh8z2kKwwYAu9opvQ
	(envelope-from <linux-media+bounces-58025-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:37:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D84793922DB
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 344D5300683A
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F6637CD45;
	Fri,  3 Apr 2026 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wzifKhzJ"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013000.outbound.protection.outlook.com [40.107.201.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D63C305E3B;
	Fri,  3 Apr 2026 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205428; cv=fail; b=gWwCGxoo6ZqWgvpl+ZIGTZFDUY7VHsrsWh380hsKgGGE3YOK+aKm2+h+xpAM7ws8k4I9WD+QuWqwjPZHi1cM/70vI8ggKu+2OMeAnrdcPvW3iHXG4PzGITs/Z4wBDqPMyTYUqqEWFQbGBqm4qtKKK4YSpgj3mEYQ1DQXgGtM9CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205428; c=relaxed/simple;
	bh=cIwj4Iyzggj02pxlnPNoRSwzwHtr6kJMkTe5gnBMXik=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QTcrb9qza5pkVaZwJ1TRaPlJTBnZgbSq1KhJ59rn2+jdYptOMCggiwT+L7St8hsox4R/XI5LMkaAQpxAmT1WOFDG4SBe4dlcU5+ah4Vpt4sOSdKkjdoyRu+DxAjK644H4eI/V2Z5LjQQRDmgUawZcntA49qkyWU7n6LeRQtFpec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wzifKhzJ; arc=fail smtp.client-ip=40.107.201.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHod9/hHQbmf1XLauvlljvBGz4YC8Z/If6yKfxZVjwl8a5cxL72svczLrUHv7YVDaRzNaLB/VP7vrDp2+q1RXQsJiyRAkPOR+jvh5OovLm+aLxZNcK/TLIhlDsoxcmaqQ5mHN2xlD4K6vEktgYFPfc4iIvfoOJHMzhVhvaYGTHJ+h+sjZqNZ07xQUnlzfwcKtgT2hEJ1Y941o98vjkcXZ6oVmqVU4OJuzQtzhLOhycWT9PgOpvA4leBTqlVJTRDGxXnkplaTmRyj8iC9Hug1XH72y2ATvcAYv+caAuvJ7a0RwIj77qt/Wn7lPOztr7MDh4DzIg37q1GD4ZrecC9c2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1h8pnlJ39hX1IFSX/lDpuXWKDZEnzKcVeCu8IMge1I=;
 b=o5xZJUiVHfrBnqHs7lY1IFK3xBToJuDO5QUQjvnQvGk6ocYemYcPjIEJ7P15Ph2dB1qoxpNPzrt+XiIoI4wYRp4qx9JGNB8n1uRKG0NVWfwcrX5ZcW9BM5yGs+EJnY1Fob09Z8/2xZIFQc6Ru385HBObkA0EYyV46da79cfd/Qq0gq4ebpG2ljMGLFIhzl3tYRJdkIcfmXn+QWN67S9CIAEgYR+JTSd5iQoufEnVzk26A5MMq/x0iAE8qsvFqBBzu5mi8AjYFgMbYmE99EfRQS1CVso+xGlWEgSA4RLvAjPPmLLatTRze4trXd1tKsBrPcoUOFpiBUVqbaDdoie9Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1h8pnlJ39hX1IFSX/lDpuXWKDZEnzKcVeCu8IMge1I=;
 b=wzifKhzJOfJ0nX8AFqFHlOI7z2T5t0dJHzxCTOx4esgYeB7rqiTRoPD/w6pVKE3oOoMbN2kMtUPptW13Uhp/eGmvEvoluSZhSxNvWlZTjmPoilmbFH+IuXpny+YAi7uFB44gTVmANai3OCsA9/eznrW6OnIThejO0EkOCAnt9vQ=
Received: from SJ0PR05CA0090.namprd05.prod.outlook.com (2603:10b6:a03:332::35)
 by IA1PR12MB8262.namprd12.prod.outlook.com (2603:10b6:208:3f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 08:37:02 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::bd) by SJ0PR05CA0090.outlook.office365.com
 (2603:10b6:a03:332::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.15 via Frontend Transport; Fri,
 3 Apr 2026 08:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 3 Apr 2026 08:37:02 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 3 Apr 2026 03:36:59 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
	<sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v5 5/7] drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
Date: Fri, 3 Apr 2026 10:35:53 +0200
Message-ID: <20260403083602.1771-5-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403083602.1771-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260403083602.1771-1-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|IA1PR12MB8262:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de6d7d6-6eb9-468c-f869-08de915c2dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NYhasdBWoxl8gZFRi5ORxgiJ9cAEk+JAvBQZw1QdAk8GE+N0Gk8XJ53XgpE7R1lrztiUnn5udncqksdrqbrHG+CtCTXJQx3WcYpcDbQ4kZGpXdcALZDJnCF8BaYY4paw9mIWJ35m/wlBc/1L4jE5uuTNagmP1Dq0bSIxIexYav/hQ1i9TQIUT0PZUiaYN43BelgYQ+GaHO/ryychqOrOgpJBNZfc30jEWvxqe8SoHjs92PzIkv5gS1Zr9mWvubT9e5rnt/I9Mxec7pDI1EOLFaylYTAgl5OU3Syz8haHGCclX44OasCkS/fmDAJEIsx8TmUwxJbojVggJXlqZHILJ12cw1l3iY7yLqeDMOIVYsNmHcLlW0V3UyVynitCrL45wzWovjdV0vywVoSoP+2vxD9lLcRnmpSOdTa2ocx00wISO4+gnhaSWIF+fPjaq9xX7xbWcP41bMxfVz1i3aBKMxNx/E9lXHsHNnmvUlenKNxsJR4sZXUt182lQUKvRmXArZ0I1M09F2g85HN44TWzUiIRmY2jJchuOWE69VAeSgshzGytrNcE3iGGPbC0vJlWegTcuTse8+9gpRXHFLblNTPGk07i/Jqlmzk8Jl4g2Pa2dofQ8scZDLaS8w7BY7JRI5B0iX0CLLzvis7/Y4oWTLtXMY8YRYrBkbKbOCe+hVPXEzYgv3NGKrpuXWPySaOavGm46SzKcnMiDNl0x7v6Ta7BknvxTJnckEuSkELVYySbDwDvIWfONGlikFUIZGuKR8OmoSHrEdn2xt0EsoQLfg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9sZn2k7zQE71RCb8lsUU9rKz/j3d4w9VrG2d/gLHvO/O3ETO3ORiChK+Ks+n8dAsKuks0XNLrZjhTUjDxG1A2GrmcT09eyptuWzaKsvGCI140uzwgimTgbHM1aXmBuIOXwYqD86/exOVdan34dUssYBjEZoNKJGJ5OZB0jq86r9RD6T3KtEQFhRlF35MxXkRIQdeLN1YWq1MRgBMwzEhpVHZR2zz1Ft1/AVeESSt1MUAILNAB0P8YOSzdR2qh6wcq8Kn5OoMejO3f+npc0ZzLIZdM/+/E8tGLOhH/Yf2njNUDG1TkAcgHfCg3vQSQqEix6thx8TnwEEsmCTlnx4OXVGPc4FJtzJzlE9s7dmRkS+j+4C6yBuVJCPZkYBTKPYfVOIDwNl549r6i+X6XYwOjk80ZzOrsgNVVnri4/V++aMwJfGSBVQ7rGypl7p+SfTL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 08:37:02.2945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de6d7d6-6eb9-468c-f869-08de915c2dc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8262
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58025-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D84793922DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's doing the same thing as amdgpu_fill_buffer(src_data=0), so drop it.

The only caveat is that amdgpu_res_cleared() return value is only valid
right after allocation.

---
v2: introduce new "bool consider_clear_status" arg
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 16 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 88 +++++-----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  6 +-
 3 files changed, 32 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 66c20dd46d12..d0884bbffa75 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -717,13 +717,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
 		struct dma_fence *fence;
 
-		r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
+		r = amdgpu_fill_buffer(amdgpu_ttm_next_clear_entity(adev),
+				       bo, 0, NULL, &fence,
+				       true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (unlikely(r))
 			goto fail_unreserve;
 
-		dma_resv_add_fence(bo->tbo.base.resv, fence,
-				   DMA_RESV_USAGE_KERNEL);
-		dma_fence_put(fence);
+		if (fence) {
+			dma_resv_add_fence(bo->tbo.base.resv, fence,
+					   DMA_RESV_USAGE_KERNEL);
+			dma_fence_put(fence);
+		}
 	}
 	if (!bp->resv)
 		amdgpu_bo_unreserve(bo);
@@ -1326,8 +1330,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 		goto out;
 
 	r = amdgpu_fill_buffer(amdgpu_ttm_next_clear_entity(adev),
-			       abo, 0, &bo->base._resv,
-			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
+			       abo, 0, &bo->base._resv, &fence,
+			       false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 648ad344e89c..a3d0998b8cec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -418,7 +418,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 		r = amdgpu_fill_buffer(entity, abo, 0, NULL, &wipe_fence,
-				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
+				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
@@ -2572,76 +2572,25 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
 }
 
 /**
- * amdgpu_ttm_clear_buffer - clear memory buffers
- * @bo: amdgpu buffer object
- * @resv: reservation object
- * @fence: dma_fence associated with the operation
+ * amdgpu_fill_buffer - fill a buffer with a given value
+ * @entity: entity to use
+ * @bo: the bo to fill
+ * @src_data: the value to set
+ * @resv: fences contained in this reservation will be used as dependencies.
+ * @out_fence: the fence from the last clear will be stored here. It might be
+ *             NULL if no job was run.
+ * @dependency: optional input dependency fence.
+ * @consider_clear_status: true if region reported as cleared by amdgpu_res_cleared()
+ *                         are skipped.
+ * @k_job_id: trace id
  *
- * Clear the memory buffer resource.
- *
- * Returns:
- * 0 for success or a negative error code on failure.
  */
-int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
-			    struct dma_resv *resv,
-			    struct dma_fence **fence)
-{
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_ttm_buffer_entity *entity;
-	struct amdgpu_res_cursor cursor;
-	u64 addr;
-	int r = 0;
-
-	if (!adev->mman.buffer_funcs_enabled)
-		return -EINVAL;
-
-	if (!fence)
-		return -EINVAL;
-	entity = &adev->mman.clear_entities[0];
-	*fence = dma_fence_get_stub();
-
-	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
-
-	mutex_lock(&entity->lock);
-	while (cursor.remaining) {
-		struct dma_fence *next = NULL;
-		u64 size;
-
-		if (amdgpu_res_cleared(&cursor)) {
-			amdgpu_res_next(&cursor, cursor.size);
-			continue;
-		}
-
-		/* Never clear more than 256MiB at once to avoid timeouts */
-		size = min(cursor.size, 256ULL << 20);
-
-		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &cursor,
-					  0, false, &size, &addr);
-		if (r)
-			goto err;
-
-		r = amdgpu_ttm_fill_mem(adev, entity, 0, addr, size, resv,
-					&next, true,
-					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
-		if (r)
-			goto err;
-
-		dma_fence_put(*fence);
-		*fence = next;
-
-		amdgpu_res_next(&cursor, size);
-	}
-err:
-	mutex_unlock(&entity->lock);
-
-	return r;
-}
-
 int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		       struct amdgpu_bo *bo,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
-		       struct dma_fence **f,
+		       struct dma_fence **out_fence,
+		       bool consider_clear_status,
 		       u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
@@ -2659,6 +2608,11 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		struct dma_fence *next;
 		uint64_t cur_size, to;
 
+		if (consider_clear_status && amdgpu_res_cleared(&dst)) {
+			amdgpu_res_next(&dst, dst.size);
+			continue;
+		}
+
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
@@ -2680,9 +2634,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	}
 error:
 	mutex_unlock(&entity->lock);
-	if (f)
-		*f = dma_fence_get(fence);
-	dma_fence_put(fence);
+	*out_fence = fence;
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index a6249252948b..436a3e09a178 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -187,14 +187,12 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags);
-int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
-			    struct dma_resv *resv,
-			    struct dma_fence **fence);
 int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		       struct amdgpu_bo *bo,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
-		       struct dma_fence **f,
+		       struct dma_fence **out_fence,
+		       bool consider_clear_status,
 		       u64 k_job_id);
 struct amdgpu_ttm_buffer_entity *amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev);
 
-- 
2.43.0



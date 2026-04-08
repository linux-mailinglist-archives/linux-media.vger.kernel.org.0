Return-Path: <linux-media+bounces-58217-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD5AMp8q1mkUBggAu9opvQ
	(envelope-from <linux-media+bounces-58217-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 12:14:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E1F3BA603
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 12:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48EEA30DB4D1
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 10:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F34A3B6BF7;
	Wed,  8 Apr 2026 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hkDTTvs0"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86573B5306;
	Wed,  8 Apr 2026 10:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642856; cv=fail; b=rNVvNNF9Dew7UXDRT2i8zVCwH+QCPYbl0SGXVG3hfTEbFZ5K/30eQDYBUHxt3AUU4wgeE1dCk1xYaWUNpBeRB+tyO8MP4HzRQaCAy8Pvq7TVao3JS535AgnAOCM/wOa/gwQOaAFV97DHPLIe7ORFHrNU7D/vwOIrBmR2vHuJPbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642856; c=relaxed/simple;
	bh=uDOX9svzFmJOUu+OOMWNpcM2Wzc6m/tC/5LzqfBVWeM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8ouOEkpA4ki54WpGhWkFXfoHq5Hu6uentgyPkQ8heoFY0Z6qhhiHi5i1x1U1XhUvZTOWWrxB6ezPiVbbJgH5BOEn+l6O2yBXCECg5E2WQHbUXKWQSs2iGWdFcUe70sA84KbWPNt6EJDE4ysr2PE7pbHyGKXpOvjcnKO2AJUKXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hkDTTvs0; arc=fail smtp.client-ip=40.93.194.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evXnz6OtruBl5pJj/ECM8KLmRJ5DYjp2COhCqkivoIEOrMvSa7npe149XcpKGB1fqwkOb94z45QrhJ8emrkhliCX9dYzJLIVJIMuKb3lZ+wi85IJ7WmFJZtHxsWOxRa4FzwwiFRDP4H7Qk0Ff1JGK+PGSNPZCg0Imc9XfdHFah1t+viGcATN/9xH+1eAXpq8Tq+m6CFoTZ9U17lTfJLREm8TFY6ZnjrFiFp8TIWS6i7h8grUrxo4aeG4N8E9/EWCeTWQol0/XKFFoGEWv1g62wcvvFIFgWn8IUyOpHQJADu4paX6IuAFnQPH/AUs+2xwJbARQ2KHJahi4qCQxwm6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U43/arQtkQq2ldwXFqvC3Jwdig4eZ+ndkT0p4LuTxE=;
 b=RRH9nVPE16rgEZQ/NuiYpVZLZRvpmWQIttxQu8XuEqKeGKRz/c4rSpWe09Nqp5GTHOQU5dfzRjnOSR6oQAw6rOgg4flNXCrR3XYmEqm8mpAa2RU/tnS43Hfd8XLS+QwpY/Hxm9+2GIdfccgXzwGD1dikpafvMCgPb+SW4b4yPGrCnVbKUvDpimw232UzsLyv4osWTG8cT3Ufv6bF4j12Uygk9O2UX4njTSQ+YLgRl2QwvZ9Y4HXFQd9YsdXzm0THj+kqJtYqZdfEyJJx4ABTvlWBR+nED70PoCD/ZmHuOwy5m1iNkMHTVFiNiGCK+Pg1tH13gBStlZC1GodATz0ynw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U43/arQtkQq2ldwXFqvC3Jwdig4eZ+ndkT0p4LuTxE=;
 b=hkDTTvs000ON+5tdD6ya1SfHR/QGGnfTxDpsnTV0xXlInss6L4pmsMeE1LF+O6K7FVuCO2A0Oz2ngZCWijgeASVJtnAWic+Mil0g0JcsGQ8bwK7qZgs/rjZYuLoRrUtuqJjw+ykhBvj01vczDNNKS1ozA6iJa3JRnrt5a2F6N2E=
Received: from DM6PR11CA0066.namprd11.prod.outlook.com (2603:10b6:5:14c::43)
 by IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 10:07:22 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:14c:cafe::a2) by DM6PR11CA0066.outlook.office365.com
 (2603:10b6:5:14c::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Wed,
 8 Apr 2026 10:07:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 10:07:22 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 8 Apr 2026 05:07:20 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
	<sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v6 5/8] drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
Date: Wed, 8 Apr 2026 12:03:16 +0200
Message-ID: <20260408100327.1372-5-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408100327.1372-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260408100327.1372-1-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|IA1PR12MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: ee365a65-3325-42d2-f36a-08de9556a04f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	V6dbIoBKoo3ldil9lbhw7H2TWbWD5mdWZ7c91XRNXUGWECIAlV/G0VnXvj0bzqLLN5+t8PZ8QoVEpQ2Tdfbxd3GbybEXrGp0EN7GRbjXBbvG26CONlIEyjqXabfQPB0UUtvdP+t6VqD3CVfFQWJDQiTSMn2rC8wWqueytzXErad6msi6w3KXJw0YaCASJmdbd7OQwjH1R5OOuzdU7E+xNqw9QNvuzKv8oia55ITqCGj+LtK9GXgjPRY6k1KDnttx7rmtHFDs8b8sHLCYiPKj0bVM897NXRJPPb7oXQFE/B41WXodpauQApC3Zc8zwyxK6OjC56aOmdyk4Aj6K9OkMTNRTpp8vVE5Ob9nsnzes5oeE+tSyHEhK/gGQ27+3rFflwNrwJZGyCPZcdVfVAuRbli3THZVmNjfzqv59hGC89Q8nuS6lE3AZss0o66A9O22b3aH2O3O6TkDduoaQ/bGOFF4Ja2RFAsxqm4HL6MWaioeH+gYLFd0uGK9PU1UNJUdlAHbgtKebBjhPnPkQrjYBs+9R36NCmbxgtzXR3tym3jC3KCtZfzi4qb43lgcRbeBBIG0PgGWg5C+e+8jOR+kOJnMTNwqobNvxZNqLbj96yXIs8ulN6DgK9WpImYVBZLVzUQ+gP8D6SjePRplWJil/bLHcAiIt6VOeiB6A3gz6X+PqhVAe3j8Fyaa3BjXC8XYWqpRzZBaftIVHdMQvwLGhOpopijnbdy928SKpS6MkbsMWsP6YoH7oGTfeB9rrTf6JB9XK7aYD/0GKAIrOZho/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lawBUQDFr62KEBk4SU5HJfe+Mhu4vZGTcpXpWNOwKQD1MaLRr18lTEbG58oF/7bhO1E5UBvcHfi/fOx4yauySmVHEu8hCLo8KsO6RdJGtt4/zPX7fgwGictFgG4lQ6310tRw48Xi+a4U/KMQLILkkkmYPjYe6fQ0B3HuucDT11S85n5YY7qYvtuHzBzboJtLHVHlM8CA9cKFGGe1JXwlD8YlKerFaIDi8CxD9DUiZG0PZm95luEvdLH0EdBzy6h4V7FUeprY6ro+jbg2hZtS9YsqVfOtoE8zH1oCpmOBAo2e8oGyaBULITf9sGmRxb2sCmalqEcg9nBt92phteEgiUe9X8v5dDiVjSb4+5lAByCSLq8kZarrJC6HEgu9cA2Z9Kp0s0EkRgLzaiQCC2JNYMMheQEpDhvseKE1MM17saV/7Ogu+O8czSlVGEnDyCEH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:07:22.1670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee365a65-3325-42d2-f36a-08de9556a04f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6460
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58217-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31E1F3BA603
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's doing the same thing as amdgpu_fill_buffer(src_data=0), so drop it.

The only caveat is that amdgpu_res_cleared() return value is only valid
right after allocation.

---
v2: introduce new "bool consider_clear_status" arg
v6: dont pass a NULL resv when calling amdgpu_fill_buffer from
    amdgpu_bo_create
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 16 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 88 +++++-----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  6 +-
 3 files changed, 32 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 66c20dd46d12..bdeca80cd77d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -717,13 +717,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
 		struct dma_fence *fence;
 
-		r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
+		r = amdgpu_fill_buffer(amdgpu_ttm_next_clear_entity(adev),
+				       bo, 0, bo->tbo.base.resv, &fence,
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
index 7b92f240eea7..7af11623263d 100644
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
@@ -2573,76 +2573,25 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
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
@@ -2660,6 +2609,11 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		struct dma_fence *next;
 		uint64_t cur_size, to;
 
+		if (consider_clear_status && amdgpu_res_cleared(&dst)) {
+			amdgpu_res_next(&dst, dst.size);
+			continue;
+		}
+
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
@@ -2681,9 +2635,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
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



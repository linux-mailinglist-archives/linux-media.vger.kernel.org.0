Return-Path: <linux-media+bounces-58026-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBnDF0R9z2mvwgYAu9opvQ
	(envelope-from <linux-media+bounces-58026-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:41:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7787392393
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08EA230A94B0
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9337637C110;
	Fri,  3 Apr 2026 08:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Qnnv1BcZ"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AAE64;
	Fri,  3 Apr 2026 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205441; cv=fail; b=Y6Uqi8vQ97Vb1JCG7OBb2i1ML3fBXzyPefabs8wBhjVUD5uW3TJMW+gqruKrtyanCjyTUvQ/pU1k+pCVnka+ZaQeVFdcUWxwDxW1gYsQzqqfhnFvIs6nDhe9ptCpN+WbRK5W0x6V+Um3onmL19ji0DV963lvtQE7dmaXpC5aj4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205441; c=relaxed/simple;
	bh=wpM2F6fW2VviMK3JDTWo+9Y+1Hyy1zMIWe3ei5GkWUA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U+CdI2Ka/xXX6PLhikphRSxqh9HDVePGJ40qgGHUWQjF99zAATE7GjCzrbV14kbYcAmcXK3tinJFY9Y8/FKmg+feDzhg9j7Yu5RxHKSrsZz4PmC7V82YygKNKDhvolqfHQtixfRyGIPRx3p+c6DUSVnvlU6cxDntjcAFPYxEzXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Qnnv1BcZ; arc=fail smtp.client-ip=52.101.43.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2RCgVRn+yp36nT6ms/9bNuLjh0KDPOilNP7ZjcuZtcYX+iqu+YL7Z/2BS+jI9EnPmMU6NHh4/hS4pq5BieQqnYQdBfEHzcfqSwOrTV19XHfPYxRhU11M0QMS9tqymfSvh6642yJ3BtT93BZydEcB4cLkA2wDG1kqavRj3fkmOfnQjU0gaOhRBV+tEk1p2QVCSqSd06S/hab55Ls65M6ENtrzvFYYisKvXAtnnMxqA5jvX1TYaAVdDKd9QNGAExsKGBgXU5EuxBXkMfOplMxgYQZZwMr/5oO0+bakSdcGTgIWBT59id5Fl4dzBg9OBzYjzBEOaTaIAETDnSnrQQ8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryMxY/LUgK6bFkIZLfE4qne7H3Zb47m4Jobg0VE1agU=;
 b=hFkeptrHJ0YJgjx5GGWCHGaYl23yH50VsenwzPA1IYY23HsVgqCeTgHDxclARapoM5tXEW93fysfaRWtLHZZ/oJh7D/bWwDqXjfOtmP6pbp7jWRFDOw48gxD3Wkk/yUml33hO2OiJRxlnp1892CgB+LQPOUJ+omZyGvRlxGlaQT18xTcUJnNVd+hIYjEPGvgyJpyZDqsMojl+nuD/CQT12+dbV5Ql8a5Lultvk3yJR8wMZVGBJIP9+Jkr3Q6BJThciJprEaa5tGW/dK6ITNO8DSqevfieDJBLFvi7/T8xJ6DMk99y0NkN1BJLp7Ub1AtxqboA+X1q7wRGP6swzI8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryMxY/LUgK6bFkIZLfE4qne7H3Zb47m4Jobg0VE1agU=;
 b=Qnnv1BcZD992q4bzzlbKYwlArznbQ0bQY2IyVfIb9oAiMRwqNNbM28Gb9Kff4aIWNQxjGBPsHzmy33oNpyCmzni8iis1Z8I1etvUusB2Dy5npdmiax9F3DJ9fsvL/0GW2xdrjjRKyxAk/wFxE+V9Q7HnqC1cLrzbqKpCyYQZVT8=
Received: from SJ0PR03CA0210.namprd03.prod.outlook.com (2603:10b6:a03:2ef::35)
 by MW5PR12MB5650.namprd12.prod.outlook.com (2603:10b6:303:19e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Fri, 3 Apr
 2026 08:37:12 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::f0) by SJ0PR03CA0210.outlook.office365.com
 (2603:10b6:a03:2ef::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.20 via Frontend Transport; Fri,
 3 Apr 2026 08:37:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 3 Apr 2026 08:37:11 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 3 Apr 2026 03:37:07 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
	<sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v5 6/7] drm/amdgpu: rename amdgpu_fill_buffer as amdgpu_ttm_clear_buffer
Date: Fri, 3 Apr 2026 10:35:54 +0200
Message-ID: <20260403083602.1771-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403083602.1771-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260403083602.1771-1-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|MW5PR12MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1ec0b7-7b69-44db-2ec8-08de915c3357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nGKW9Z5mYPS1/Cw8juY47q8VZPXRUJnhk4FTfnnzZkQihtCiUiqBtXcm8o/t83CoFbvOmLdGDx4un1FwgtnBGJSKEJ3iVqAhO/rwDivDB4fpaq7c4JYP8ktbm/nMGRtTXt4cP7zwBVPdYZbRcnFCITjZLh1aXvDaMObjkyHjFPxpV/3xT+qX3ZsR8HChAP1W2jnYOt0geN6u/+wuTotKtEfZKN834UKRKI10M5DYRWpoYIcOvdpkdcikyB8E15o9TWXw6j7Hn8xNzQW3isl+K8HoWcHl5XnfJnZoRX6YXiHD1L44n2VcgfvWbyfjFULdV0c9Fg7vykN+VaVeIDrtiVqwbz4woIfuawEr/XyTQ2hN+EXNkRUBJB1m7kDk4qWYyGk6CZUKsluDwn9t4CxJq+dnK6rfKVK6G4BeFbJIfp82QTCJaPxhh+2uh7rm/gpWlU9vpTJjhT1XXVDMFKRrvg6ZLmKXgCx6RribtJXr1IJNfn2Pb16FSURCj+ri0MpYq/IbTLtp9tPb7gNaNm/hJb+5dmjpEgSxjHo+GXwKeq5sAkFhina+9WREF86iYsZA21yHh3Y5O2zrJRlUXjq6/8vA4i5m41mYIUFDNqGW+OR52yP1te2/mpMvtbL3MAjbxvNj2wTROSpdNmBk6SnPLi85u09+7M7bgWZ/Nc/5bocNSm+EpsOOXaFNnzKTp3PDOjEwTbbsWgkHbvyIB8QbytIo9kwroUjzc+PR7+bpHyaPBBLHNC8f6R92lpR9HQiW26mBpFC/MvmK9PI9WIRlrg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6+dqMqU2/brdOu8tWy4hJ/S92SKsu+fNM6nwLdjcXGOfq8Pn43G/C50SvyiYcyhiBcC98jHQRQ7OwxBDqkZvGIbki8+bZeXB07WEkaOUOoQwPce6v6TbKhA4rPLOaPkmZR5BQomchnXGZKvzodXTELuXpi9hlUKflwNwt7ze9+mjSZ5TKU7Ic6pwTI9IzlfqBCVnB0enlPX3P5IjVYUDChLGfeW5SqquB6ohJlltN8JgM1Sgj/6fCoaIynRhgK5c92UhZC+ZTE5MPJNbP4qoPhR4QFVu0WaYJS7ARTZG686ZyQqtSZHFNM4HnAQ9UWboYXTBHUoVTxDJD/HB4teovgQn6ZB750ulIiH6hoZxtVjDHrOmTqAbL9Ws+W8btQaGNcW6YN3QAvQy/aCDGqDy/1/+kwgNJOGiBP+C63AXeBtn7pyiqBkWjZ2Z20OlRVDh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 08:37:11.6212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1ec0b7-7b69-44db-2ec8-08de915c3357
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5650
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
	TAGGED_FROM(0.00)[bounces-58026-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: B7787392393
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is the only use case for this function.

---
v2: amdgpu_ttm_clear_buffer instead of amdgpu_clear_buffer
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 +++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 23 ++++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    | 13 ++++++------
 3 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index d0884bbffa75..195cb1c814d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -717,9 +717,9 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
 		struct dma_fence *fence;
 
-		r = amdgpu_fill_buffer(amdgpu_ttm_next_clear_entity(adev),
-				       bo, 0, NULL, &fence,
-				       true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
+		r = amdgpu_ttm_clear_buffer(amdgpu_ttm_next_clear_entity(adev),
+					    bo, NULL, &fence,
+					    true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (unlikely(r))
 			goto fail_unreserve;
 
@@ -1329,9 +1329,9 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(amdgpu_ttm_next_clear_entity(adev),
-			       abo, 0, &bo->base._resv, &fence,
-			       false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
+	r = amdgpu_ttm_clear_buffer(amdgpu_ttm_next_clear_entity(adev),
+				    abo, &bo->base._resv, &fence,
+				    false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index a3d0998b8cec..e74f9f8a88dc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -417,8 +417,8 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	if (old_mem->mem_type == TTM_PL_VRAM &&
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
-		r = amdgpu_fill_buffer(entity, abo, 0, NULL, &wipe_fence,
-				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
+		r = amdgpu_ttm_clear_buffer(entity, abo, NULL, &wipe_fence,
+					    false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
@@ -2572,26 +2572,23 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
 }
 
 /**
- * amdgpu_fill_buffer - fill a buffer with a given value
+ * amdgpu_ttm_clear_buffer - fill a buffer with 0
  * @entity: entity to use
  * @bo: the bo to fill
- * @src_data: the value to set
  * @resv: fences contained in this reservation will be used as dependencies.
  * @out_fence: the fence from the last clear will be stored here. It might be
  *             NULL if no job was run.
- * @dependency: optional input dependency fence.
  * @consider_clear_status: true if region reported as cleared by amdgpu_res_cleared()
  *                         are skipped.
  * @k_job_id: trace id
  *
  */
-int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
-		       struct amdgpu_bo *bo,
-		       uint32_t src_data,
-		       struct dma_resv *resv,
-		       struct dma_fence **out_fence,
-		       bool consider_clear_status,
-		       u64 k_job_id)
+int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_entity *entity,
+			    struct amdgpu_bo *bo,
+			    struct dma_resv *resv,
+			    struct dma_fence **out_fence,
+			    bool consider_clear_status,
+			    u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct dma_fence *fence = NULL;
@@ -2622,7 +2619,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 			goto error;
 
 		r = amdgpu_ttm_fill_mem(adev, entity,
-					src_data, to, cur_size, resv,
+					0, to, cur_size, resv,
 					&next, true, k_job_id);
 		if (r)
 			goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 436a3e09a178..d7b14d5cac77 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -187,13 +187,12 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags);
-int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
-		       struct amdgpu_bo *bo,
-		       uint32_t src_data,
-		       struct dma_resv *resv,
-		       struct dma_fence **out_fence,
-		       bool consider_clear_status,
-		       u64 k_job_id);
+int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_entity *entity,
+			    struct amdgpu_bo *bo,
+			    struct dma_resv *resv,
+			    struct dma_fence **out_fence,
+			    bool consider_clear_status,
+			    u64 k_job_id);
 struct amdgpu_ttm_buffer_entity *amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev);
 
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
-- 
2.43.0



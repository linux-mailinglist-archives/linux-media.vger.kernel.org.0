Return-Path: <linux-media+bounces-58218-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO3/NXIq1mkUBggAu9opvQ
	(envelope-from <linux-media+bounces-58218-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 12:14:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5013BA5EC
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 12:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9320307EB79
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 10:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0964C3AEF24;
	Wed,  8 Apr 2026 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4PRTmYSP"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013042.outbound.protection.outlook.com [40.93.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590933B6BF5;
	Wed,  8 Apr 2026 10:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642863; cv=fail; b=rQh1vwR5ae97tofmkZ5hxAA2+4UHCtPzmmY5qeeJvCdOVJQURHGJbzs3O3zjzAe7yl9gsY2cbBBQ8WdqA3/6puQPIQqVpuqF/Oheik3O4CwWo/NpkaX72CdLHbqp3S0hmMm08sXM/Ywu1X2GSZhB01dnskyOqRCvuuWbwSZeycA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642863; c=relaxed/simple;
	bh=r23Cy0NaiwsCt1GBCYK/Hu0KkL0swat9Hh9HVvFM7NE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EXuR14rEmbS60BGs64Cto1xogU1TKaMJJ6FzI2gOSl+bblvJkqZ/N+layJGlpuprqrwlFTLiCpoyMdyAlOuOV3rXgO/WIg8jd04n2p3Qvf83Md7j6AO9R8cPG7/Ka4rOktlV03jzak5qZcbUi0FHF7Hyeq2TuW5UTZOz1HDm2Nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4PRTmYSP; arc=fail smtp.client-ip=40.93.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3DZNHxDsx1BMAfmBI5MVelhvos/SUuKvK14lqpUn+Agg1ERqbdY0XUrh9rTQ8sxgBSdRY4kuWdskqy8CNoDlmghC2NPvvloC/z5yq3+sdMpBL9lgbzIB9NfS7a4T4UVF25Zjz3ugswJ1au5aYYYI0hEUUoNWpf/j+bVHB9wjd/QGQAint7Db7uKnE4Wg7ijSl2LG7GRbs69TXaP/6EQURp1gWIyDKI3isVAkbxfVvm4kOdhV5SK5bXMOs0CoBO0HMHspA4LXNB20UznM1Jxy12ImlQ+rZpwPzQLz/5AV1J7b1DikX2Li/ihYs/ILsQF4M7ip4LHKyQMgGqnogSMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KU/qZn6yp8Db2YGZP5eiexytoV3LmXULmALLIdcdl7A=;
 b=iMHVIBrpSGEDdN0j1hJ2wnCc2b5Pxp7n37RGAzRawafnwwWWHk4GDS3S0zCU0pURWVz0eByZkpfKERb3vmLGsma06R9l6nA+55URkHrQw9Mw3rhZiR76cusX4dllclC+2WiK+mwab1UYJRVI5UcEqrOapDz02GCZLQDWqNXb6RBDTBKohGuA4+D5FuEBLT4yivEEGVqDNoBBo4nJmsopwPqpQwGnOh4ZkE+RVMVqrNQNPiDPZMDgfSpw7sVtYueV8DxALiiBoptYHDpnakCQpykt/lEDvilZJrbIdWCb81ON69wad1F/ZnWOzZsuFuE+YTUns7ts4Zg+q/FKtoPiDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KU/qZn6yp8Db2YGZP5eiexytoV3LmXULmALLIdcdl7A=;
 b=4PRTmYSPgqKFiaFEErDBVnh0Jge/H0d//Wn5jtjreT/SEFeFNgkw8N3igCbRroLxFrOKK6yx2qqsnjGAVckErhjJxnO/pR7J/wcL1rA+1MWiVLQpwg1GWVy3kaBEHQBG8ZgGqSNddquglQ04vdfP0N6sjHmthpJVwKRxCTbUzLg=
Received: from PH2PEPF0000384F.namprd17.prod.outlook.com (2603:10b6:518:1::71)
 by IA0PR12MB8748.namprd12.prod.outlook.com (2603:10b6:208:482::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 10:07:28 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2a01:111:f403:f912::1) by PH2PEPF0000384F.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Wed,
 8 Apr 2026 10:07:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 10:07:27 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 8 Apr 2026 05:07:25 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
	<sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v6 6/8] drm/amdgpu: rename amdgpu_fill_buffer as amdgpu_ttm_clear_buffer
Date: Wed, 8 Apr 2026 12:03:17 +0200
Message-ID: <20260408100327.1372-6-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|IA0PR12MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: cc8bbeaf-1796-48a9-343a-08de9556a3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	H06rEIuQ6CXK5GrgaI6HFgrUdciIcVpkL+af7Lan9Q7VDfOw36RErD2wQsN89D8EumLKXqtYxuOBMpurpODWq/SIYQZIoNtcBUQZhvbn8eBLqOVI0V7/wCul2mF/7HrzNcwd4AMKtzYc0GXFolDQFh/s+a34NWFxlf6laRgzDfKBMLRlnWb38CXA9meCDNWhzCiWvzU8UX4HVq6tVnIxGQ23RwcltOog6aiYfph2gwTdkeID//Qh4rWBknk3AfMVg7qbalRPbua14A2JgbvPTiDHohay9S8GoO5WUYlK9kRHw8fInu+HAbaOURbDhbxNw8/RelN3uQjHMHtzSoCJP7uB8RNnqGJPBQyJg/gBI+t9AbuWC6N7RGW8axt9mkYLia1vpYO+VIi09U9kIayzcJkOjSKwDRpRKR2lVnFv7iwkZ56Xp5p4H7/MNo46NN/zWqNFnq/lTo0TW5tbZp3OWON98dK4eUwCtgeKu70nF7eEq/DDjlEEKc+vzzSk6M9Z2NIR1z0disqzKp5iK6lXBuBPejK87aFBYSY/NuBUbMq3XsoxYDKXR5ljBT3xLoaqoI7D2+ZcnFJFm8uI8DZOohtCpHOGHyJfe98JboXJ8v4XCvg0sqqVS+Cujga5neUfncW45PKzdGv4BV9rfm/kaGc8Pf3dx1RVu2/oWbUT98jj+lpdvc/yMCvN1RQsjOBBbHvcVoAsKaXalNHbj7Qqyn8M9zCHmx1gKWZq50E3udaAPsOu/mgRgRGRrpbZ/2VALRWt8xCKmnwatUEB9kE8/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fXbEHWFQFlW0AjH2hKN7oUdfqgzhlyg5MoQRY0AnYHy3dpJe1MzA3GkUEX/NIfZ1qmtLRacjCDiFmM+cfiajVtwuUsPTN13ko3BuQHm0+VaNmaPO8dfZp8BH6ztQo6nbkjw/6Ige95+K56dK0MqTRBKLcQI76Hgz0qTJQCUGVWiCgGKvmqOlZSw1nGCoIUZDlaiWgkC7I2qW5dj+F/uxmYKoFCLjbn1zkb7V2gPvDUdOSvLQtXzrzTUqZjPuZ2GVItazmKRLMNhKuIw6FIoVnwhPq8h3tSGYKH+pEFZZd8LSXAZvIpLEoDGuLWLKCwye/czxgTNXAMi4e/umKrZSyLM1dOrFToYoykbkzoyf3G5Ivz047GiejPy5scWpYMqLuMviMAoxwgIHULYRnkyhLc45agiTi32QLDR3GDl6OF6px3uCx1Kqu4TslFxs3Ggg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:07:27.9507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8bbeaf-1796-48a9-343a-08de9556a3bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8748
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
	TAGGED_FROM(0.00)[bounces-58218-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 7A5013BA5EC
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
index bdeca80cd77d..4dd7c712b8c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -717,9 +717,9 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
 		struct dma_fence *fence;
 
-		r = amdgpu_fill_buffer(amdgpu_ttm_next_clear_entity(adev),
-				       bo, 0, bo->tbo.base.resv, &fence,
-				       true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
+		r = amdgpu_ttm_clear_buffer(amdgpu_ttm_next_clear_entity(adev),
+					    bo, bo->tbo.base.resv, &fence,
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
index 7af11623263d..8d778cbce1aa 100644
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
@@ -2573,26 +2573,23 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
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
@@ -2623,7 +2620,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
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



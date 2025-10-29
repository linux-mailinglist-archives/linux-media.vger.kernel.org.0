Return-Path: <linux-media+bounces-45929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB18C19517
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 10:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D453C1A66600
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 09:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F8831E0E1;
	Wed, 29 Oct 2025 09:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yCDsHwsM"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA9283FD9;
	Wed, 29 Oct 2025 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761729088; cv=fail; b=CKMVGry6MlUdLDOYy9vU9UBF8XgZrOogtUAQkQZFk8l2jSkxZIaP7hqrPk84aZLZzhc5MLcuKtzyb71EsH/6hSdx9hc8trOPYImR+rUAQvKAPu1nA50oZREy6z4uppfXAfVp8XhFCXudf5fgvdptGgVZvcNZFkbFDQL93HGw/9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761729088; c=relaxed/simple;
	bh=S2S7eAMatI5tneVKp86CAvpP+RhuiGNUcQws4KB3CDE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZzcQF5UcPtahmmYTXU569mxwIQldUmt8X9/6LC3a3EkInH+LBfUvHGmG4NQ9dPDtnMHThthA2aP0K8fAUShlrS63rJZCvfRYiYd9Y733pJd4x36NOsnHZhjxfuXEqW912KDXA0cDxUoLvc09iLdl2096UknIfFilWVURvZEm9so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yCDsHwsM; arc=fail smtp.client-ip=52.101.56.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCbTEMD40DzSj6JHMQG6RlHAPpyRQTMDSHlMyel5gFVftjy7Wp4mXWn5k/mABQX1gAiRZYIR4ifLQCWo9f5UlhtiAs7MYn8HXm+T3afCNEvftFtd5YZJTqg6LEYHBBQvvDVXId7oKv10GMM/fNG15Vttp0V1PfIGCoJUsvHFhnGSYdHH5PikoCeAsEZzKAeowEVPkVeH3X3AdgCtotnIr7gW4ovLS9UDDPg1TjMoYj07UwZ9vez6Z1cuFuGl8PjHyYUj3eFt94nYmX2sbPsaG/Et8A/t+avjDRH1kBTVTd6ITX5E34IATaS0z/7ufFLQOonTGU+YL9g0+11j++zt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYEZMNdDHnQvp43EQ0z67oy2BWoeTy2Bkh33Yh9ro9s=;
 b=k8NNKJuCjM6bVbBaUHl2D6OkMFuJBxWma5h1srUlonxPedq/mlMU6bNVv1uBmkrpJ/gyVrGTmTiQHv34BnBV/Ed1omFN4j5bK+eGZjH4SVEwdS2TxDReauDB6e02MaOilOdvieAx/yvn6X3dYAhb/E6gEFRkaOHKpmzm+ZrAP1SeqiMCJNa6HbKviwzfw56wn+JRByIn/KPbk5uUQ986nvfoa6UtRTJr4YV8+pTdAAwAIt8QPIBOqJesevgFhTeKGQn+Md/7g0FGFlMrQ1EiE6Ow3/JdCEIsFieVY8lcqwuUJqQHvrFTs83oIWg3kwHnwCivxUPtglUYQgnR8YJdaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYEZMNdDHnQvp43EQ0z67oy2BWoeTy2Bkh33Yh9ro9s=;
 b=yCDsHwsMvOa4KVN7aojms7kWcWmkJTDiLGsq8SVooWgyXwj40z6w13ktvfUCDAZqWBtrVjUS0UmkmDLjoZgGAiEik0PKzCOkVc3i/EEUmjPthw5YsSH+J3h8QWrrwOkS+ljHNC6h/rS7xqrqs2n29d9th9Mi08ACKIOJ5EdEoeE=
Received: from MN2PR20CA0022.namprd20.prod.outlook.com (2603:10b6:208:e8::35)
 by BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 09:11:22 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:e8:cafe::3c) by MN2PR20CA0022.outlook.office365.com
 (2603:10b6:208:e8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 09:11:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 09:11:22 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 29 Oct 2025 02:11:19 -0700
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
	<dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
	<sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v1] drm/sched: fix deadlock in drm_sched_entity_kill_jobs_cb
Date: Wed, 29 Oct 2025 10:11:03 +0100
Message-ID: <20251029091103.1159-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|BY5PR12MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: 026e1c61-7025-4e33-57dd-08de16cb2116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGo3Nm1MN3cvZkJGazZ3VHNwNW1rMU5yMEc3aUNpbzA4RFhCd0kwd1ZiTklV?=
 =?utf-8?B?azg5QmhIMlYyVDd6NHE1SS9yaGZ5NFlxMGlsWFpCcVdYb2xWWkFCVzVLcytQ?=
 =?utf-8?B?dFpaTzE2YytiVGNxb214VHp1Q2JqcGxjTDNZZTJValhhR3BHVXpKdjFubk9X?=
 =?utf-8?B?TnY4bk5iUHZ2VGlBdXJWektkb242aGRVVktNbUxxWWN2V1RkNGNOSWtkRnJU?=
 =?utf-8?B?L2k5dms5SDZqZjlkRi9yU2lzam1UeUZlS0JMNzB0dno1akFqRnlpNm9iVkR3?=
 =?utf-8?B?dThrQnhBVTN6RW9UNTNQVkZlUHhVK3RHN1daSlBYSXNtdFNIc1N4OFJPS2JM?=
 =?utf-8?B?QnIranpaVVoydUQ1YWlqaEpUYXJ4VURoL2YvSVVhQWM1eVVyZjBNSkE0Sko3?=
 =?utf-8?B?N2svcWxTckc2dXdiRXp1RWdSN1gvZTc5Z2tSYXBRbjBzQVlRTG4rRnYvR3Vw?=
 =?utf-8?B?QkVIbWE0RXBmV0RXKzNLc3dPNG5tSG1qZkdGSjl3MkIvWmNQRDZuTXJjY2Fm?=
 =?utf-8?B?UHVBNHh1c05LbjlnMGdJU1AzSloydEZzbVNCVVZ0a0lJdklXZkJ0bnRZc0Zq?=
 =?utf-8?B?UzZ0WjlBU1V0RDhrdTVGdHJmNGtwc2VVMmtRMjQ4VCtzcHBiaUlsNGZkS0g4?=
 =?utf-8?B?Ti85endWKzVVbVU4Uy8yZlFzTGVtY3ArQW51Um11NEp0bFBnekxub2ZaTDdt?=
 =?utf-8?B?dXFHdlc3TmlDbFc1WGRCQW9xTDk0bkgvUFEzZHJXSGpXR05YZ3VtREt0MXpT?=
 =?utf-8?B?WXZPWWl1ZFhkMHphdzg0RUNCQzNPcHlKK2kvcjdhalg2MjEvVWRKTlZpMS8z?=
 =?utf-8?B?aDYrUExUb0dGY1N1d0V4TEVjM1dpUTBCZElXRDN4WU90MTJOY2J3YVNIeGRR?=
 =?utf-8?B?dHlTbUhUTUw2VXV2NnVYbjRxRXFhS1Vwc2Q4cEJ6UytoQi8wbjE0TGxPekcx?=
 =?utf-8?B?bnRsQ2ZHNHk0VTJlM3RQNU9IdmJKMzdLYmVSY0tGUVVvek5nTEFSWVduNzY0?=
 =?utf-8?B?MW1QSW1GSXI5WHlPNU9kdjZoVVBsM00xRmRlbTY0bUhydXVEelBXdTVrc0ZO?=
 =?utf-8?B?akFYR1pES1V6T2dyanp5dWxNcWV6ckdOZUUxaExHZEJveHR5M0pxVmp4L0Jo?=
 =?utf-8?B?Qkk3OWsraEcrOUNtcWJ5Y3FPdmxnVXpGa1hYNFNoYlF1RndJK1MxRU5MZXFk?=
 =?utf-8?B?TGw3T0x2enZiYis4dE5qNlBkSk95M1pLNEk0TUV4aHpEd2s4TXdlcmZpbUto?=
 =?utf-8?B?WjdrcXE4UDVMdVVtTUJLL0VZbGNmZDJmZlFNM3NZTEJ1UzFZTU95Wkt5YmhJ?=
 =?utf-8?B?WW1weFlDMVh4ZFVyay9VczQvN25IR29CaW9DY2ljbitaeDhQSG03cDNxNjA4?=
 =?utf-8?B?cVJhYjNDMjNpd0ZqOEIyTVlWSG5paWJpSCsvcVVYdi9TNm1ubkl6aFdueU1C?=
 =?utf-8?B?a0dyN0ZGMi9YUHpVZG4wUmkwWnJCaC9oM3Y1aTRrcWxaWkxpS1RNOTZuM2xW?=
 =?utf-8?B?U2tZMGFKVldyK3drY3NpQUZjNDYrWkxnRzJDV1dURldzZFpNaGZOTzR1YmNJ?=
 =?utf-8?B?TWJDT0hNc2NsSEFYYzVnc2tkT29Nc250UEk5U2UrQktHcEdLKy9ocFYwekpY?=
 =?utf-8?B?YlI1dlNKTldrcXVBb092enFiQ3NKWnZLaGhIcnFNa1N2ZWsvL3hmQ3ZXMDlr?=
 =?utf-8?B?blU3aENjVVhuSStzeXFLS20waVE0TVF1UVR4UmxvRzUrWGRMUVlxYk5VMkls?=
 =?utf-8?B?UU91L0tlOUFUbzVrTi9SMmNCcFpmcUNVQ1p4RlZmR2lRMnBQbGpQR1R3SUJp?=
 =?utf-8?B?SEZnSmxQM1NCTzRaWUFIZWRtMkZSQ3ZHaU5yV2hJV1dkQkg5N2V1aGFkVnJw?=
 =?utf-8?B?MkJCOUp5VW9oamRDRTFNQ1JpT0cveG9Eelc5ZzVZYktIU25mdHRaMkJBS1U5?=
 =?utf-8?B?U05zOWpUK3M5RjhJNjlVeSt6VjNNSWM4WXdyUUs3Y0lzQUxqTjZpeHVZZUFK?=
 =?utf-8?B?ZW1yZ0xBRzl5eXU1MjdQdGdIaUozc3F0Q3ArV2FZbFNseFJoSnNOOGdpSVd5?=
 =?utf-8?Q?fviA9Z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 09:11:22.2033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 026e1c61-7025-4e33-57dd-08de16cb2116
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211

https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908 pointed out
a possible deadlock:

[ 1231.611031]  Possible interrupt unsafe locking scenario:

[ 1231.611033]        CPU0                    CPU1
[ 1231.611034]        ----                    ----
[ 1231.611035]   lock(&xa->xa_lock#17);
[ 1231.611038]                                local_irq_disable();
[ 1231.611039]                                lock(&fence->lock);
[ 1231.611041]                                lock(&xa->xa_lock#17);
[ 1231.611044]   <Interrupt>
[ 1231.611045]     lock(&fence->lock);
[ 1231.611047]
                *** DEADLOCK ***

My initial fix was to replace xa_erase by xa_erase_irq, but Christian
pointed out that calling dma_fence_add_callback from a callback can
also deadlock if the signalling fence and the one passed to
dma_fence_add_callback share the same lock.

To fix both issues, the code iterating on dependencies and re-arming them
is moved out to drm_sched_entity_kill_jobs_work.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++++-----------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index c8e949f4a568..fe174a4857be 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -173,26 +173,15 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
 }
 EXPORT_SYMBOL(drm_sched_entity_error);
 
+static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
+					  struct dma_fence_cb *cb);
+
 static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
 {
 	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
-
-	drm_sched_fence_scheduled(job->s_fence, NULL);
-	drm_sched_fence_finished(job->s_fence, -ESRCH);
-	WARN_ON(job->s_fence->parent);
-	job->sched->ops->free_job(job);
-}
-
-/* Signal the scheduler finished fence when the entity in question is killed. */
-static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
-					  struct dma_fence_cb *cb)
-{
-	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
-						 finish_cb);
+	struct dma_fence *f;
 	unsigned long index;
 
-	dma_fence_put(f);
-
 	/* Wait for all dependencies to avoid data corruptions */
 	xa_for_each(&job->dependencies, index, f) {
 		struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
@@ -220,6 +209,21 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 		dma_fence_put(f);
 	}
 
+	drm_sched_fence_scheduled(job->s_fence, NULL);
+	drm_sched_fence_finished(job->s_fence, -ESRCH);
+	WARN_ON(job->s_fence->parent);
+	job->sched->ops->free_job(job);
+}
+
+/* Signal the scheduler finished fence when the entity in question is killed. */
+static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
+					  struct dma_fence_cb *cb)
+{
+	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
+						 finish_cb);
+
+	dma_fence_put(f);
+
 	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
 	schedule_work(&job->work);
 }
-- 
2.43.0



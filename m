Return-Path: <linux-media+bounces-33040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B248EABFA46
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 17:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDC301882B7E
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C798223DFF;
	Wed, 21 May 2025 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O3cL0oHo"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5FF221F0D;
	Wed, 21 May 2025 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842437; cv=fail; b=HzJ1akrJDOhGpNPssbr1fOy3WbzIkxR2FtC19AnElJNuWium5BVCRaESeh+1zqwqaHr5ZLxHd31SLRPIDfws29CSt2tp405Nm20aHEHkCn+D/mOHCFkJ+AqxmQl3IkcnyRdrFPcUtVejxAZmmeD1zQLgZvCLHLu4VgEadyTE85Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842437; c=relaxed/simple;
	bh=O0CwZt+7H+MQFldTjXuiyxYlCez+w7LttflFoKcdV/4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZKfcSbHgud/tPZoZlxO4GuZvqLmMAQwIuq5Lg0hh+jbZWxM7wMNAtl2qR/nhXcLtSzLTxMdnIM7zdcoSGKHMhiQMLoRumrCKS2dO7WYUQ0GHVxp5xYDJn42p7sHKmZvd0BQvHj1St3Yc29RJOSrisn2YaBnDd4+nglCKkrgeux4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O3cL0oHo; arc=fail smtp.client-ip=40.107.92.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4ZXk6tKWqPGQORv25Q9hcvGPzz3X8dQHcF6Q8kuZP0cl2XjYUo0bCXLloR0rgstt0bVuJGy4dHySYa1FO8Ij6s1kVrRmd4Pa11b0L2cWIUMJ/2nC7kc6zCyEPgERklRJQ+UzHMWv66iSP2MZEvt6CTBmgNKIDd6gpoZ0ImVdT1hM3C8dfJKIlTpnfOWbHMNv31IFmVblkZk/O5YYXkuDxZ/rwg4YVaoqes5xx4MUQpgT+Hj0S7g2/ipg6dXo+3Y59EPEDgFu3jbB/5i1FjqR2nLDXwdp8HE+MZLvE3jkWqU0sxN+XyZrobxIlsU6MyOM3uvpmLAbdN5eLo4ViUCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHYMYNGFF9uKuQ3khXkbLAwz3Hd5pM8+94Ze52BPEZA=;
 b=tBDIjp6HByrP9ou/OIGe3+oMVtL/8vcB+mqf7PKM9JH9X/rNOmP7TBP11Vepb5DAC2BbhE5TWBA1f32eDNTlRGPRLKbhxs+lyOdBQr3p37uE+TGY1Zw3lSdvDTA7FMO6yD2oudyZtf5GObGKpxB7/6IaTxv9VF8kLDMCmCXdBPWyJgTKY97GExufL/4Se2/mvUgWJtq2raCDUQ3FbYDD8zz1OM4kKKzK1E093rAAMxWnDC/vKUbrysQSRUQtzmISnRwAjHlQXj/AW031SvTsHZhTWWeqtLNJyUbFrM7WIaIpHZ9/Cb0qXDVc8QC2pMJWrpkRJvqixz2xc+o8E10hLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHYMYNGFF9uKuQ3khXkbLAwz3Hd5pM8+94Ze52BPEZA=;
 b=O3cL0oHoE1XnnWvhYo/G9h356tMWoX2vATtF7fMmLYlFl3zazbT5NQDbPEGWW3QuaXmHu0Z93IS/Jwdjvrd9n1alCzZlB2iVYXTQ/PQ+Cl0XM5bVoh6OO2OQFoCRTG68s/LeZVRd/Qn+E/tvZTSV1HZQqd1XKado8vPfo8O//58=
Received: from DM6PR01CA0004.prod.exchangelabs.com (2603:10b6:5:296::9) by
 CYYPR12MB8855.namprd12.prod.outlook.com (2603:10b6:930:bb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.31; Wed, 21 May 2025 15:47:10 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::a9) by DM6PR01CA0004.outlook.office365.com
 (2603:10b6:5:296::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 15:46:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 15:47:10 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 10:47:07 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
	<dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
	<sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v10 05/10] drm/sched: Trace dependencies for GPU jobs
Date: Wed, 21 May 2025 17:45:07 +0200
Message-ID: <20250521154531.10541-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521154531.10541-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250521154531.10541-1-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|CYYPR12MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d90d36-0849-4abd-c576-08dd987ebf8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VmpsoM0w0hyUyddkAGO/qv/WYGPKyn3K9uTzw1Up8rTjjck9CqpgEVn4gH2d?=
 =?us-ascii?Q?t+TGP+nWoUEtZ8MMxVUK9NWbLdj4XtDvJKY22ow6FVWtObv6km++OdWpZx0Z?=
 =?us-ascii?Q?vCAH6gOqC+d+cjRxXdBWMtZXhGPkyst3giZdPctvOpCoe47z5LrCNX73MRaR?=
 =?us-ascii?Q?vd4rqiHC/xu7B4K0tUsElluoadGomv6INdanbRRtF5s7NluHcZukk83Ifzeg?=
 =?us-ascii?Q?eZ+5cjTp3ohIu65447laqmBpO8ojrBj1a3gbKhIqJvBwlZ2pRxeWPZ/KfKCZ?=
 =?us-ascii?Q?pY1wf2u7KOOgzWOqsta15Lysw561yl9wSu8mJ9kT8gLDuTIti96h9O4VXR9c?=
 =?us-ascii?Q?OyUZlJtZ1lSaQHJMEwxMN7OZjGgizYP1dQ/6n+NKETI4oO6imjAujQkcomDt?=
 =?us-ascii?Q?zxzru0pqr2GYab3rtJQLF8N0ArXnMTsThDg9Ga2a+kbBRmq7Wi1WvcOntDr5?=
 =?us-ascii?Q?rlE27IVKQpUfKaizKhnAvbb757nuiCOD8tboFGG0jJ9QqLjVEFz7/1zlw0xB?=
 =?us-ascii?Q?oFdsvsHdu5EKfYkdWlz4K33u2WsMulKdazikvJ5qjUefq80qya4mW36LiXdg?=
 =?us-ascii?Q?7GsvdfeJbsKLfywmqlne5Oa8he9OOJf6hq1EkUSzKjs+4PngN4jNJQa0rFlr?=
 =?us-ascii?Q?TBZ0KgshNmK2t45jTf+Mtll0kUU2SBKmWLVjf1a/XKjvzKgkOLzAXeWO7Pkx?=
 =?us-ascii?Q?syfgg3el6e5A9NmbfwlB67g+SV50Z4GXNPO1orEvbHnHJppfxmDqqvIRAEul?=
 =?us-ascii?Q?D1Mwa+MoH9WzzfmShWARCNrxINZjdJsYq7az9AzpyKPX3w2B5Fbk8trfJaw+?=
 =?us-ascii?Q?SdqHGlvgJM5hM9azV1FRM6QOYR/oT5RSoxVMTfxrwbdpFRufh6QZyxGwNRbL?=
 =?us-ascii?Q?S9+D4sHn4h4xJd/NCf10n+RH+f8AGnrtK0qMACluiiYMBG73e1z9yahKCd99?=
 =?us-ascii?Q?364e9Zr6rbW1oLUjOufCElhKdPIxgPX8p6Q063GCiLTes2ZlMHXSKsJ7DE8I?=
 =?us-ascii?Q?koRcjIjx39IFvvO34BjiUvw8cVOAiKFXMR5Icl+T4WUG6xqz5JxrstPayiws?=
 =?us-ascii?Q?NpH1usBcEGXtDXXmZLCHTUIsnCGEPGTsvNzK17H4VYrDFBjQnWNj66g1KUwS?=
 =?us-ascii?Q?YmRmhw7SRVIlgjGSNCkzksS1RhFb1M4OSSr05Eq4TpHxCFm1gg29xqH/R5CT?=
 =?us-ascii?Q?eLNf8S+1sfyB936S2/9dQbHAAMY242BDmKVR0lyxBgBF5wpFOg38FS92g2wY?=
 =?us-ascii?Q?xYvXkxl7sHXO8viyvDviVp5Ev+JFs+VQab+6e3KPIDJSBQstF3adBhh7HuCL?=
 =?us-ascii?Q?RNeoLniZWr6x0+8O4bSBR1ayLynypcW9CyTyDgdquW2sTG1CyjNjeNKVq+nV?=
 =?us-ascii?Q?emtPy5H1JSgRNTP6bXHK6b6bUZh4hqW1D1Z/1OEhemf2Ep5ytzt1dJEVZals?=
 =?us-ascii?Q?cdirdb+avBxFF0VC+Ipg5qmePBBt1M3LbZZgw6in7MFTxja5TglOHMgKKLw8?=
 =?us-ascii?Q?9bAT1JEIV7iPLGA8ctoBNwkcpFoGNaGBywwCvN249cC4PaMwyxkmx44QAw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:47:10.2585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d90d36-0849-4abd-c576-08dd987ebf8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8855

We can't trace dependencies from drm_sched_job_add_dependency
because when it's called the job's fence is not available yet.

So instead each dependency is traced individually when
drm_sched_entity_push_job is used.

Tracing the dependencies allows tools to analyze the dependencies
between the jobs (previously it was only possible for fences
traced by drm_sched_job_wait_dep).

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 23 +++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_entity.c      |  8 +++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 6f5bd05131aa..5d9992ad47d3 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -87,6 +87,29 @@ TRACE_EVENT(drm_sched_process_job,
 		      __entry->fence_context, __entry->fence_seqno)
 );
 
+TRACE_EVENT(drm_sched_job_add_dep,
+	TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
+	TP_ARGS(sched_job, fence),
+	TP_STRUCT__entry(
+		    __field(u64, fence_context)
+		    __field(u64, fence_seqno)
+		    __field(u64, id)
+		    __field(u64, ctx)
+		    __field(u64, seqno)
+		    ),
+
+	TP_fast_assign(
+		    __entry->fence_context = sched_job->s_fence->finished.context;
+		    __entry->fence_seqno = sched_job->s_fence->finished.seqno;
+		    __entry->id = sched_job->id;
+		    __entry->ctx = fence->context;
+		    __entry->seqno = fence->seqno;
+		    ),
+	TP_printk("fence=%llu:%llu, id=%llu depends on fence=%llu:%llu",
+		  __entry->fence_context, __entry->fence_seqno, __entry->id,
+		  __entry->ctx, __entry->seqno)
+);
+
 TRACE_EVENT(drm_sched_job_wait_dep,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
 	    TP_ARGS(sched_job, fence),
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index bd39db7bb240..be579e132711 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -587,6 +587,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	ktime_t submit_ts;
 
 	trace_drm_sched_job(sched_job, entity);
+
+	if (trace_drm_sched_job_add_dep_enabled()) {
+		struct dma_fence *entry;
+		unsigned long index;
+
+		xa_for_each(&sched_job->dependencies, index, entry)
+			trace_drm_sched_job_add_dep(sched_job, entry);
+	}
 	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 
-- 
2.43.0



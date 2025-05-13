Return-Path: <linux-media+bounces-32359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4936AB4D36
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 09:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4542E3ABF1C
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 07:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281A11F2BAE;
	Tue, 13 May 2025 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="iO297zAx"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE291F151D
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122342; cv=none; b=Oc580y16hWyElFWNkLe8/4tcZODUg9zG+ruitLpbs/qCazdj4aqOW2LL1weSF6X2OaV7rw1kXZB6ye86S7oNau9EWeKSsqYvUza8jpk5yMR1ndCGa7Asv9Qx/z09qPJLBh/x7Z8ULKT+cveDB0I7wPFLk2Y0B7WhlX0O1k0Pu+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122342; c=relaxed/simple;
	bh=o7Y7oxzfjUt2JvqbcXZfaoPya3wigB+XD2dgTBnmgO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uhjIrzLXN42OGI2Euswm6KysgrirMMPvF2q+eN1SKiRzYqdnKDwZ49YvcL+so9epQA8ZfcNKSoOopZcvphL9R12UQBrGqzCs8NCQhDzX26+Jib6Kcw6L55vlJOYxblbTs1I9KVCeIOsRZGqYhloKrf4CPLf1+6QAraBMg2mP7EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=iO297zAx; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ho3rz1YCBup49UXIrD6pA9C2v3Zz4Fvtf4G3Zu60qMA=; b=iO297zAxbHE+8lLFv6fLSQw3//
	p5STzJDtuOBaz3moN8Z5HQ0dvf3gcDD++omh+R/3fcczRG3AbyC8jMwMATypt+hQsWhqABplI34bu
	1vm/YroQImaemjOQLlv5v5DoDbESWINdy65PI0w6rYDryEHp9ctgBUoiUlHF9yBVjRt/CupgLO1pE
	ENeYD7+MmlkBFW7kFheltwuSfb1G4IhUyM1KjM902pFSxP5eKnz8z3nAcPnYlfsueEAA4e5FhND6m
	9ClDamiqB37FuBHVE/nXLiAR4B7JU9/nVx2Hq3atjmikj5waR0Npd94Q08aDPRfy6uMeroehTT4S0
	npfwqRKA==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uEkF3-007TvD-BI; Tue, 13 May 2025 09:45:27 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC v3 05/10] drm/amdgpu: Use dma-fence driver and timeline name helpers
Date: Tue, 13 May 2025 08:45:08 +0100
Message-ID: <20250513074513.81727-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
References: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Access the dma-fence internals via the previously added helpers.

Drop the macro while at it, since the length is now more manageable.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 11dd2e0f7979..4c61e4168f23 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -32,9 +32,6 @@
 #define TRACE_SYSTEM amdgpu
 #define TRACE_INCLUDE_FILE amdgpu_trace
 
-#define AMDGPU_JOB_GET_TIMELINE_NAME(job) \
-	 job->base.s_fence->finished.ops->get_timeline_name(&job->base.s_fence->finished)
-
 TRACE_EVENT(amdgpu_device_rreg,
 	    TP_PROTO(unsigned did, uint32_t reg, uint32_t value),
 	    TP_ARGS(did, reg, value),
@@ -168,7 +165,7 @@ TRACE_EVENT(amdgpu_cs_ioctl,
 	    TP_ARGS(job),
 	    TP_STRUCT__entry(
 			     __field(uint64_t, sched_job_id)
-			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
+			     __string(timeline, dma_fence_timeline_name(&job->base.s_fence->finished))
 			     __field(unsigned int, context)
 			     __field(unsigned int, seqno)
 			     __field(struct dma_fence *, fence)
@@ -194,7 +191,7 @@ TRACE_EVENT(amdgpu_sched_run_job,
 	    TP_ARGS(job),
 	    TP_STRUCT__entry(
 			     __field(uint64_t, sched_job_id)
-			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
+			     __string(timeline, dma_fence_timeline_name(&job->base.s_fence->finished))
 			     __field(unsigned int, context)
 			     __field(unsigned int, seqno)
 			     __string(ring, to_amdgpu_ring(job->base.sched)->name)
@@ -585,8 +582,6 @@ TRACE_EVENT(amdgpu_reset_reg_dumps,
 		      __entry->address,
 		      __entry->value)
 );
-
-#undef AMDGPU_JOB_GET_TIMELINE_NAME
 #endif
 
 /* This part must be outside protection */
-- 
2.48.0



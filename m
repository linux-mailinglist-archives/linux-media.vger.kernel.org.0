Return-Path: <linux-media+bounces-66178-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rXtqGUHYRGrr1woAu9opvQ
	(envelope-from <linux-media+bounces-66178-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:05:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B51596EB6EF
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:05:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=m6QTuUxg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66178-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66178-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03AD930DC529
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 08:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0A63F0A88;
	Wed,  1 Jul 2026 08:59:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEC03EFFD4;
	Wed,  1 Jul 2026 08:59:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896384; cv=none; b=F0j5GvXR3jwEtJL49kOrwKLh0JV5uz95yaVhce0665VrsZxTqdSFvFc93tt+GDJ648GaeOebLnDcl3vDbuZ/Njf8FKHukrFNU9j/OzEOFd2Gi+d2YoXMHQ+4Ybt3ElknkDOygawjrhCtvJVqHr1JCpFk8H860Gg7mC226gul50s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896384; c=relaxed/simple;
	bh=C0zqSXZ4AuItRGAfhY1/njMw23vg/zqbo9biCVBDSgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WlhTD/Tykqr6TZblIclMDRglubLS04d5VQLKk8cxEKRxhi9pC7QjBigSMoaCT1Db9dnynDkWI5Hx9lrLgK9frgWm2Oezn5EEICyprupeQTr6eJxg2EkwHhvwPRrWT58arr2Km06nW6yHcCSQZhNll6c0gXqdOS28+vZT4TiEjmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6QTuUxg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3781F000E9;
	Wed,  1 Jul 2026 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782896383;
	bh=0lRsz+bsd59r/YXRL4xu3uteL9lA+FSwzHtZ025wxN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m6QTuUxgqiakjeh4Srm3Evvf+x8GPJPlS/3Lskx8UQXFHBicETcE5qifKdaVarGO2
	 RPvCyOkZJ9PVEKt3cydgiN3nEpUYCSwX+UTu5SVKcIeDunip/TfvEh8XllbD5Imi26
	 nKSGoJIL4UA6IOSO+vRvjfRYAwNW4GGgLb3fx0COd0rV+bdQYmMRRG9LgyivRygHbd
	 NH2vo8wRMNzbomkC5/PBjRpDtLgLiDnp1U+AeZ9Z9HhEUAvWaZfpYv2BsSSF4Xk8t0
	 /f+srLd0t6QmSU/4RiTfp34vrlFjWGE2QQ7oQbtgh7pb0W64HiMELyYrKC/Yx8h+mI
	 NZWhqmKpP6Piw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Marco Pagani <marco.pagani@linux.dev>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/5] drm/sched: Lock spsc_queue in drm_sched_entity_pop_job()
Date: Wed,  1 Jul 2026 10:59:18 +0200
Message-ID: <20260701085920.3253248-4-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701085920.3253248-2-phasta@kernel.org>
References: <20260701085920.3253248-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[intel.com,kernel.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,linaro.org,linux.dev,igalia.com,collabora.com];
	FORGED_SENDER(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:marco.pagani@linux.dev,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66178-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B51596EB6EF

Cleanup work in the preceding commit added locking to
drm_sched_entity_pop_job(). This cleanup causes a slightly sub-optimal
lock cycle with drm_sched_rq_pop_entity().

sched_entity also utilizes the lockless spsc_queue (partially already
used simultaneously with locks), which was marked for removal in

commit 6e7eb171ac96 ("Documentation: drm: Add entry for removing spsc_queue to TODO list")

To remove the lock-cycle mentioned above, the unlock must be moved
downwards, also locking the lockless queue.

Guard spsc_queue_pop() in drm_sched_entity_pop_job() with the lock and
document why that is being done.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 91aec20611ad..5cf0af91faf2 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -529,9 +529,17 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	spin_lock(&entity->lock);
 	prev_last_scheduled = entity->last_scheduled;
 	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
-	spin_unlock(&entity->lock);
 
+	/* Preceding cleanup work made it necessary to add the spinlock
+	 * to this function. spsc_queue, a lockless queue, is now
+	 * counterintuitively guarded by the lock as well. spsc_queue is queued
+	 * for removal (see DRM TODO list), so this somewhat serves as a
+	 * preparational step.
+	 *
+	 * TODO: Replace spsc_queue completely with a locked (h)list.
+	 */
 	spsc_queue_pop(&entity->job_queue);
+	spin_unlock(&entity->lock);
 
 	dma_fence_put(prev_last_scheduled);
 	drm_sched_rq_pop_entity(entity);
-- 
2.54.0



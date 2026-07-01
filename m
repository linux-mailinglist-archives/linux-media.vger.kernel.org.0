Return-Path: <linux-media+bounces-66179-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uRGEBNHXRGrB1woAu9opvQ
	(envelope-from <linux-media+bounces-66179-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:03:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3556EB6B4
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:03:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="mRJyP7j/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66179-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66179-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C28193085722
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 08:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBF93F0A90;
	Wed,  1 Jul 2026 08:59:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AAF3C81B5;
	Wed,  1 Jul 2026 08:59:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896389; cv=none; b=vEEKWqM5sAsWGBwKen4NEQmOTjNnQwlvtvU+tnHCl4fa0fYAyoI/QyT1vJ7kto5BUV3pcu+eUtRPVX91NJ8rosp/dEM4YiRA1HhWY24kPl3pQxBwoSQ0AFvcSopHD4klWLNNCTq78NbGtmI3pXNZibt3ulyEfhFMUmWFXfT4MfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896389; c=relaxed/simple;
	bh=qPm4CM876PoUWazpFSd9EhldaMWqJ5ceNYLjCd6ht5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMg88hFzQC1Vu6RJ/KQ7V5qz7joCvC3r7hFpIuDhSrRCreZ9St9YJfptaZkb/VVeZg0QuoPRXU6M+PFB8qmfHELvkCliuEyL8ItIqFQx8wolcOApP0DfwCkzuWDkmdtJcH27YEz2r7dJi6RYLfLvdbP+coKMxuDsEZYhxpDtdmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRJyP7j/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184091F00A3A;
	Wed,  1 Jul 2026 08:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782896387;
	bh=iZAhHXGtjOwctuSESrqjb/h//3iNlg1eMfjJgUlrvZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mRJyP7j/RCXvc/gtQYunFK4hD8zFzBnadLMrxpO8DSoKayGBw5x7XDZ9K54jPSyJN
	 ikbW4Ztj/mql0/sqzPFxP5C40Sxk115RYWGvpvFtm3Bbm3UOXjAWnyaZ01z4fj+RVP
	 /5qLE4pXFC0F45srB5WM8W0TNKHAi4I9SGK7Y6sXhBJh6ReoqiH3eLF9Hj5cwfV0mW
	 N8AxZ/oLawBxIwcROAhNZhs+I8h3nzMmEPxV8vHuJMx7mxMCZxZCxV8LOoFN+JENAp
	 rL1+KVAx5rTCOU1/+TK9E3hp+YtzMkvGpdu4r2EX0T+SRmdFiZp4jik8+qWy0kkiZt
	 Vcl/UhOTP1rew==
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
Subject: [PATCH 3/5] drm/sched: Avoid lock cycle for sched_entity
Date: Wed,  1 Jul 2026 10:59:19 +0200
Message-ID: <20260701085920.3253248-5-phasta@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-66179-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E3556EB6B4

Previous cleanup commits created a slightly sub-optimal lock-cycle
between the two functions drm_sched_entity_pop_job() and
drm_sched_rq_pop_entity().

Avoid the lock-cycle by moving the locking from
drm_sched_rq_pop_entity() to drm_sched_entity_pop_job(). Add the
appropriate lockdep check.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
 drivers/gpu/drm/scheduler/sched_rq.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 5cf0af91faf2..0fc1213a0d3f 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -539,10 +539,10 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 * TODO: Replace spsc_queue completely with a locked (h)list.
 	 */
 	spsc_queue_pop(&entity->job_queue);
+	drm_sched_rq_pop_entity(entity);
 	spin_unlock(&entity->lock);
 
 	dma_fence_put(prev_last_scheduled);
-	drm_sched_rq_pop_entity(entity);
 
 	/* Jobs and entities might have different lifecycles. Since we're
 	 * removing the job from the entities queue, set the jobs entity pointer
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index 044546bcb5f8..97363f9ef8bc 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -319,11 +319,12 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 	struct drm_sched_job *next_job;
 	struct drm_sched_rq *rq;
 
+	lockdep_assert_held(&entity->lock);
+
 	/*
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
-	spin_lock(&entity->lock);
 	rq = entity->rq;
 	spin_lock(&rq->lock);
 	next_job = drm_sched_entity_queue_peek(entity);
@@ -340,7 +341,6 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 		drm_sched_entity_save_vruntime(entity, min_vruntime);
 	}
 	spin_unlock(&rq->lock);
-	spin_unlock(&entity->lock);
 }
 
 /**
-- 
2.54.0



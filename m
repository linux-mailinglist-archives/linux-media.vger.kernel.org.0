Return-Path: <linux-media+bounces-66181-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pZDWCkXXRGqU1woAu9opvQ
	(envelope-from <linux-media+bounces-66181-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:00:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1090E6EB67C
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:00:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FS3Ejs7T;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66181-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66181-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E10993050BCC
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 09:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8C53F20FF;
	Wed,  1 Jul 2026 08:59:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DD03F0A85;
	Wed,  1 Jul 2026 08:59:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896397; cv=none; b=NI0dJlwhmZ+xUQnSKvH4FHO5FBXdHYRlwcahIUQt9ykqPjlsRBYBBkQBPTe7DM0ds4kkKbR5BXqIzg6SkU6x5S6Iq/3KqN4aHhz7Pa+x1Hc4Z/SwoBlwJTDa8IsctE4O0+ykxtdQ2N2m8MbFw+5PYszaQx27rbW2wq697pLNT9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896397; c=relaxed/simple;
	bh=5N/IFJPEpeM9l+vd9YrRmXphyIfOwIAp27+WTTgr0q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=duNQHwi2sYhIwBJ9IS5S4f+SJsRGm2xWS/x3Ykc9A2+9eTKyi8dZbXOXVY7973SF/74FmZf5HuMVEeOEHrxTJnEJjBEcdhTmyZ3ywFg9vkkD+4DHzQeyC5JNSkdAxb3RLTSZXcwMuJDIlU8LsqSt/uj7zIsQYlK0JZsAGI2MZWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FS3Ejs7T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDAE1F000E9;
	Wed,  1 Jul 2026 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782896396;
	bh=sq9yVGjU7Aarfc6/TDWlud/Yv0zasvTjRqyAyAYsNn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FS3Ejs7TaXikZXz8JLom3RSefBMT3XBVPlGPTXvLeXtyZUzWj+4NsQCLhY5PtnSit
	 PojGDW5OawhX02JGW8tT7ydJpl+PEDueaHbP5NaUpxAExsk97vmKW1YZWx8d/Zmkus
	 UDFmmAPMVqXhSRse5AMD0vpyzb9GQCbSgujG8vYWhbhcr+hAmKzoUvzGZcA/Kn4fp3
	 1IsHiz6/kdnP74rgQ9HbTqyYhrKrvVCm7ETD2JGZuh+K52k63QS90MSt46vDPVyivM
	 P/M/oAlZ9LxYFoG97BQQsY2KsA/s6zQGcs7S2otWihWlN1sEGT66nGAinRfaxRZgaA
	 kOJDXt2R5v+xQ==
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
Subject: [PATCH 5/5] drm/sched: Remove entity->entity_idle
Date: Wed,  1 Jul 2026 10:59:21 +0200
Message-ID: <20260701085920.3253248-7-phasta@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-66181-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:marco.pagani@linux.dev,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,kernel.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,linaro.org,linux.dev,igalia.com,collabora.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RSPAMD_EMAILBL_FAIL(0.00)[phasta@kernel.org:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1090E6EB67C

The completion entity->entity_idle only existed because the entity was
not properly locked through it's spinlock. The completion served to
inform waiters about whether the entity is actually idle, which is
something locking (previously added to drm_sched_entity_is_idle()) can
fully achieve.

Remove the surplus completion.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 9 ---------
 drivers/gpu/drm/scheduler/sched_main.c   | 2 --
 drivers/gpu/drm/scheduler/sched_rq.c     | 1 -
 include/drm/gpu_scheduler.h              | 7 -------
 4 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index cb03d6a36578..23536dcfa96a 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -136,10 +136,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
 	entity->rq = &sched_list[0]->rq;
 	RB_CLEAR_NODE(&entity->rb_tree_node);
-	init_completion(&entity->entity_idle);
-
-	/* We start in an idle state. */
-	complete_all(&entity->entity_idle);
 
 	spin_lock_init(&entity->lock);
 	spsc_queue_init(&entity->job_queue);
@@ -285,12 +281,7 @@ void drm_sched_entity_kill(struct drm_sched_entity *entity)
 	spin_lock(&entity->lock);
 	entity->stopped = true;
 	drm_sched_rq_remove_entity(entity->rq, entity);
-	spin_unlock(&entity->lock);
 
-	/* Make sure this entity is not used by the scheduler at the moment */
-	wait_for_completion(&entity->entity_idle);
-
-	spin_lock(&entity->lock);
 	prev = entity->last_scheduled;
 	dma_fence_get(prev);
 	spin_unlock(&entity->lock);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index d2ca01b31ee4..b90220794a14 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -997,7 +997,6 @@ static void drm_sched_run_job_work(struct work_struct *w)
 
 	sched_job = drm_sched_entity_pop_job(entity);
 	if (!sched_job) {
-		complete_all(&entity->entity_idle);
 		drm_sched_run_job_queue(sched);
 		return;
 	}
@@ -1013,7 +1012,6 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	 * refcount has been incremented for the scheduler already.
 	 */
 	fence = sched->ops->run_job(sched_job);
-	complete_all(&entity->entity_idle);
 	drm_sched_fence_scheduled(s_fence, fence);
 
 	if (!IS_ERR_OR_NULL(fence)) {
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index 97363f9ef8bc..54aba1ef0d7a 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -373,7 +373,6 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 				return ERR_PTR(-ENOSPC);
 			}
 
-			reinit_completion(&entity->entity_idle);
 			break;
 		}
 	}
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 176ff1f936cd..55260cbe880a 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -221,13 +221,6 @@ struct drm_sched_entity {
 	 */
 	bool 				stopped;
 
-	/**
-	 * @entity_idle:
-	 *
-	 * Signals when entity is not in use, used to sequence entity cleanup in
-	 * drm_sched_entity_fini().
-	 */
-	struct completion		entity_idle;
 
 	/**
 	 * @oldest_job_waiting:
-- 
2.54.0



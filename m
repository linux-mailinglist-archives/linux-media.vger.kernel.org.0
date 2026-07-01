Return-Path: <linux-media+bounces-66176-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EaCJGS3YRGre1woAu9opvQ
	(envelope-from <linux-media+bounces-66176-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:04:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B43D66EB6DF
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:04:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WCQghcL8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66176-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66176-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7250930B7503
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 08:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D5A3603E9;
	Wed,  1 Jul 2026 08:59:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFF83C81B5;
	Wed,  1 Jul 2026 08:59:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896376; cv=none; b=jMjQ0YcR2Kv5P3tjSfwKMqK3snW9+i8JL1FNs4fPVp4EcE0JaN8Plk4yKu7Xi6gCiG5Z2nYV6eRFhplN/P6521ddvXhmQmNnQQe0315RLRZCQhf23JMG2w7F1oOvCeA7zTF/n8WnNlTMwFtBBEiJYt3oWSGk90/0PRM8Xh1nJBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896376; c=relaxed/simple;
	bh=IxrNDAv5vrB63pc3xzFukuLRALDslmw69nRgwDEAP+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cLH1f99bsLqIvG5p1HYzr++FRZjG9LAEFrygJFSwFcnwaSoFrpE4TdsR1ovWJNaXjMCE3Jsg3ZbvrbGk+RNwB3EfvdyRlJWvTBalFST9DV5BOyRHujGel0RBphGIEIQjXJLHyWEBf/G9yiQH5A/LloVO5TxWFe0Ns9f7G35R99A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCQghcL8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499651F000E9;
	Wed,  1 Jul 2026 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782896375;
	bh=w5ZcDaSIWJHhsB2aS76I+S5sLCFLK36Re5/LClq2P3s=;
	h=From:To:Cc:Subject:Date;
	b=WCQghcL8Gyoc7pTau3w1rhDbGRntu0Ul5m1QW5vCJYrmLPaPYBTKgD8G2Yw97mg+d
	 a3lZBYQ0v9ua4cDTmHBgXA93vHell+O5yM8CqxoyBovHk3xTf1rvRZ1+bwJR5tSRVO
	 RqgH8q0Z3xiH0fWma3aYUgx/tLtxDXN8Xe0FEJa5K+7BPt9DdGPPMzHoGLZnR/XnwI
	 n5sFHhkloKzA3SzailwtIA9qgVgf9Qlxt4t6bOdzVhUMFlWc5iNdlvzwg4l1LMJ0ev
	 oPJq7nC62rTzFXRBP2/GOuoWn8QlnTUW4SnbLvi9a5y7hOouB2dQN83sRzvUcUZN9s
	 FUyavMb0Et3ag==
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
Subject: [PATCH 0/5] drm/sched: Introduce the miracle of locking to entity
Date: Wed,  1 Jul 2026 10:59:16 +0200
Message-ID: <20260701085920.3253248-2-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
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
	TAGGED_FROM(0.00)[bounces-66176-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B43D66EB6DF

Both Tvrtko [1] and I [2] have recently proposed some improvals for
drm_sched.

While taking Tvrtko's feedback into account for my patch, I realized
that both his and my patch can be fully replaced with a bigger and far
more beautiful series.

If I am not mistaken, it turns out that the entire entity->entity_idle
completion is also nothing but a workaround around the grave mistake of
not using the greatest helper with parallel programming that exists in
computer science: Locking.

This series adds locking to the last_scheduled field and all checks
related to detect the idleness of the entity. As before, the
job_scheduled event queue causes the periodic checks.

This way, we can get rid of memory barriers, RCU, a few lines of code,
make things more readable, understandable...


Tested with drm-sched-unit tests. I'm a bit busy right now, but wanted
to show you guys the idea. Before merging I'd test it more exhaustively
with Nouveau.

Greetings,
Philipp

[1] https://lore.kernel.org/dri-devel/20260611123423.39819-1-tvrtko.ursulin@igalia.com/
[2] https://lore.kernel.org/dri-devel/20260626081942.2122144-2-phasta@kernel.org/


Philipp Stanner (5):
  drm/sched: Protect entity->last_scheduled with spinlock
  drm/sched: Lock spsc_queue in drm_sched_entity_pop_job()
  drm/sched: Avoid lock cycle for sched_entity
  drm/sched: Lock drm_sched_entity_is_idle()
  drm/sched: Remove entity->entity_idle

 drivers/gpu/drm/scheduler/sched_entity.c | 75 +++++++++++-------------
 drivers/gpu/drm/scheduler/sched_main.c   |  2 -
 drivers/gpu/drm/scheduler/sched_rq.c     |  5 +-
 include/drm/gpu_scheduler.h              | 16 ++---
 4 files changed, 41 insertions(+), 57 deletions(-)


base-commit: be4f10d44757211fd656fa57f37034657f26c883
-- 
2.54.0



Return-Path: <linux-media+bounces-65700-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8wHkEElPPmrxDAkAu9opvQ
	(envelope-from <linux-media+bounces-65700-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 12:07:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A576CBEBD
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 12:07:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PZs6rUkY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65700-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65700-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BD47306381C
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 10:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5023EB7FF;
	Fri, 26 Jun 2026 10:05:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA47218B0F;
	Fri, 26 Jun 2026 10:05:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468348; cv=none; b=PjxODKDDrshXPvCIium7EfA0BDQUq11zMWyFxWhog/xcffCdqiNIseG/aqtqtksbIpccuwxHKuPjKPjbXD46ecAOAYjUQBBwC2xgFaPZ745Tby7B4k6BgZHUNPC9DvxJVpfnLx3SAsBQOuIv3bA8dB4PoZ1il9KZmXMddk991QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468348; c=relaxed/simple;
	bh=on9Q0e33q3+ivfeVYwsV14w3mzatq3uHmWd8eu5xlJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eupasVUVyh17EQkyvKeEBLBWBLUG7vv7JOA/frc/lz1oZzJqObUeHxfHtwUdsNjeOoWG3bQK9jAFaDOQ28fOS6MEU4v5S9AdHniF5Wgz1u3UhfAwXF8IMfxnfNW61icWF5QmHYHtLlfK3w1h6sd8JTFcuOdeb1BZZ5Blyr5cpQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZs6rUkY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83101F000E9;
	Fri, 26 Jun 2026 10:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782468346;
	bh=XPOnL3YaXcY5m5ZE7tv6kcrdVXllWoBe5sPRf2jXnF4=;
	h=From:To:Cc:Subject:Date;
	b=PZs6rUkYf9rAESRZeLEJuYSARXc9W6t080JPfO71cLYWXcyEgTuFTkHXIYKclq6gG
	 euJHYHsWp6jtUC8y3lCHYOjKKbyhia1WduFm6BhN3rQxzTUQIYvkAKMeNnseHV8hl6
	 bsbCOzZzZgga2sfNdrNj21lttW90LocD4TXyKqy5Y+zx1DOxX/5rmUN8YcbZc9pMW9
	 sMtuu+LOqvFonMMC2nK+Jsih17DBX4ORaR4DrbrCSkN0qbULQ6sH5MmidGqOBqadZu
	 p8hOYT6WDeHqrnd3lP3LA4fyeVVf4cfm114K50otfqHf4cGHPOrsNb4iEDgcfutswq
	 26VioYZkSBhCA==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] dma-buf: dma-fence: Fix potential NULL pointer dereference
Date: Fri, 26 Jun 2026 12:04:42 +0200
Message-ID: <20260626100442.2202221-2-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65700-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:tvrtko.ursulin@igalia.com,m:andre.draszik@linaro.org,m:dakr@kernel.org,m:gary@garyguo.net,m:paulmck@kernel.org,m:boqun@kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:phasta@kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95A576CBEBD

The commit mentioned in the fixes tag below introduced a mechanism
through which fence producers can fully decouple from fence consumers.
This, desirable, mechanism is based on the fence's signaled-bit as the
"decoupling point".

A sophisticated interaction between RCU and atomic instructions attempts
to ensure that fence consumers can still interact with fence producers
through the dma_fence_ops, callback pointers into the producer.

This is the desired behavior: to check for decoupling, the signaled-bit
is first checked. If it's not yet signaled, RCU ensures that the ops
pointer cannot yet be NULL.

Hereby, dma_fence_signal_timestamp_locked() first sets the signaled-bit,
and then sets the ops pointer to NULL. Readers first load the ops
pointer, and then check through the signaled-bit whether the pointer can
legally be accessed.

These set and load operations could occur out of order on weakly ordered
platforms. Hence, we need to enforce strict ordering all the time.

Add the appropriate memory barriers.

Cc: stable@vger.kernel.org
Fixes: f4cc3ab824d6 ("dma-buf: protected fence ops by RCU v8")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Tested with dmabuf and drm_sched unit tests.

Memory barriers are notoriously difficult, so I would appreciate if some
of the more experienced folks can check this. Notably, I am not sure
whether the smp_wmb() is necessary.

The documentation for test_and_set_bit() makes the mysterious statement
"This is an atomic fully-ordered operation (implied full memory
barrier)", but the kcsan_mb() seems to be some sort of debugging
barrier, and in any case the docu doesn't make it obvious to me whether
that "full barrier" comes before or after the bit setting takes place.

Moreover, in my opinion we should order dma_fence_is_signaled(), too –
but if we agree to merge Christian's new series [1] that need should
disappear.


[1] https://lore.kernel.org/dri-devel/20260624122917.2483-1-christian.koenig@amd.com/ 
---
 drivers/dma-buf/dma-fence.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index c7ea1e75d38a..2e80b01499de 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -363,6 +363,18 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      &fence->flags)))
 		return;
 
+	/*
+	 * Fully order setting of the bit above with setting of the ops pointer
+	 * to NULL below, so that all parties can use the signaled flag to
+	 * detect that the fence decoupled from its ops in a safe manner.
+	 *
+	 * The counter parts of this barrier are in dma_fence_timeline_name()
+	 * and dma_fence_driver_name(). All other future parties that rely on
+	 * the signaled flag for valid access to the ops pointer will need a
+	 * memory barrier.
+	 */
+	smp_wmb();
+
 	trace_dma_fence_signaled(fence);
 
 	/*
@@ -1170,6 +1182,12 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
 
 	/* RCU protection is required for safe access to returned string */
 	ops = rcu_dereference(fence->ops);
+	/*
+	 * Fully order the dereference above with the flag check. Otherwise,
+	 * ops could be dereferenced as a NULL pointer. The barrier's
+	 * counterpart is in dma_fence_signal_timestamp_locked().
+	 */
+	smp_rmb();
 	if (!dma_fence_test_signaled_flag(fence))
 		return (const char __rcu *)ops->get_driver_name(fence);
 	else
@@ -1203,6 +1221,12 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
 
 	/* RCU protection is required for safe access to returned string */
 	ops = rcu_dereference(fence->ops);
+	/*
+	 * Fully order the dereference above with the flag check. Otherwise,
+	 * ops could be dereferenced as a NULL pointer. The barrier's
+	 * counterpart is in dma_fence_signal_timestamp_locked().
+	 */
+	smp_rmb();
 	if (!dma_fence_test_signaled_flag(fence))
 		return (const char __rcu *)ops->get_driver_name(fence);
 	else

base-commit: cdeb2ccd993ed8647adbbda2c3b103aa717fd6f7
-- 
2.54.0



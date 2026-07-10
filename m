Return-Path: <linux-media+bounces-67276-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n5j5F3nTUGpf5gIAu9opvQ
	(envelope-from <linux-media+bounces-67276-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:11:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F144173A010
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:11:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UGZPDPor;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67276-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67276-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B03F300EE8A
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5271405C47;
	Fri, 10 Jul 2026 11:11:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399843FBB73
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:11:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681910; cv=none; b=RtyaLZ5lo7cqGCZwXRJs0jP5ESmXn/yBiFsNraeGigYJ+NgNTzCHf9j+dqAeBJV5+5aMS24sZLkMqo2/B/SjRyyNgN+HAvLJ1zWArSR2gPUlfXdjZlhjulWnJ71u/9e3PaCZsa3P2UgqIpTokVdUHPcguDGWFz36BqirHWyTXdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681910; c=relaxed/simple;
	bh=D9rlp8UB3ZeNUY4IKzC96uiU7FzAZqBtGc5oAf55fz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SKz4iHw/J7cFgOwHH9nSUHl9nXoqlN+rVAnOrEXrR3IwLwlHi3Q2pEQCj40nE7Em2hn3tqPAr9fWkGikWusUXL2U1CaeCKMgam1uUJAznZjA7s9UyZ0akKk8VYTdwA2fXAhCLuB1b96h0czJC5cf9Vm3Gcih8DriBL/uFJwEZ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGZPDPor; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE5E1F00A3A;
	Fri, 10 Jul 2026 11:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783681908;
	bh=0PLLyLI2j//GUgtVT8c/zuMx8753q7rr5Eh14L9MmFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UGZPDPorEr93lT1wkOSrgcUsic7CByy5YhdSnHoL2Fcii47Y20fYGAQr3XP1hlzic
	 jVTo2esD58h+q5J9ljEAbJdNeUSugy4iUV+g58bnvJyUPzYhnhzpV8Pg5qLMJqh+2P
	 paFMfTRNmNFJhE6kNil4VcIz+x0at4NAISIWfUcQhQZ9LUkfhrV+sJRR8mGU83LMQU
	 3kkt102KuylqPsQha8bQTwJb4JLsNcX7sJsUs+qGROiLXnTgUX1Y1tb7TVOH4l0QHe
	 HSy1YbDPAinhUmHAmxO2iKxHSboCVlioVUICxU2QsfcL6fx3GA04vsmlqFEd69C1wq
	 hqUIQFmbM9P5A==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 3/8] media: cec/core: handle core events like normal events
Date: Fri, 10 Jul 2026 13:07:31 +0200
Message-ID: <8c24b50600c465a0559f23febd02a60d2455b13b.1783681656.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783681656.git.hverkuil+cisco@kernel.org>
References: <cover.1783681656.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67276-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F144173A010

Currently there is a distinction between core events
(CEC_EVENT_STATE_CHANGE and CEC_EVENT_LOST_MSGS) and other
events. The core events do not require memory allocations,
so are a bit faster, but they are also limited to just a
single event: if a new event comes in, then that replaces
the old one.

It's all overly complicated, and with only one state change
event it is easy to miss state changes.

So just drop that optimization, and allow for up to 3
state change events.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-adap.c | 34 +++++++++++++++----------------
 drivers/media/cec/core/cec-api.c  |  5 ++---
 include/media/cec.h               |  2 --
 3 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 0c2f4660a7bd..bbd5395fa67d 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -80,9 +80,9 @@ void cec_queue_event_fh(struct cec_fh *fh,
 			const struct cec_event *new_ev, u64 ts)
 {
 	static const u16 max_events[CEC_NUM_EVENTS] = {
-		1, 1, 800, 800, 8, 8, 8, 8
+		3, 1, 800, 800, 8, 8, 8, 8
 	};
-	struct cec_event_entry *entry;
+	struct cec_event_entry *new_entry, *entry;
 	unsigned int ev_idx = new_ev->event - 1;
 
 	if (WARN_ON(ev_idx >= ARRAY_SIZE(fh->events)))
@@ -92,36 +92,34 @@ void cec_queue_event_fh(struct cec_fh *fh,
 		ts = ktime_get_ns();
 
 	mutex_lock(&fh->lock);
-	if (ev_idx < CEC_NUM_CORE_EVENTS)
-		entry = &fh->core_events[ev_idx];
-	else
-		entry = kmalloc_obj(*entry);
-	if (entry) {
+	new_entry = kmalloc_obj(*new_entry);
+	if (new_entry) {
 		if (new_ev->event == CEC_EVENT_LOST_MSGS &&
 		    fh->queued_events[ev_idx]) {
+			entry = list_first_entry(&fh->events[ev_idx],
+						 struct cec_event_entry, list);
 			entry->ev.lost_msgs.lost_msgs +=
 				new_ev->lost_msgs.lost_msgs;
+			kfree(new_entry);
 			goto unlock;
 		}
-		entry->ev = *new_ev;
-		entry->ev.ts = ts;
+		new_entry->ev = *new_ev;
+		new_entry->ev.ts = ts;
 
 		if (fh->queued_events[ev_idx] < max_events[ev_idx]) {
 			/* Add new msg at the end of the queue */
-			list_add_tail(&entry->list, &fh->events[ev_idx]);
+			list_add_tail(&new_entry->list, &fh->events[ev_idx]);
 			fh->queued_events[ev_idx]++;
 			fh->total_queued_events++;
 			goto unlock;
 		}
 
-		if (ev_idx >= CEC_NUM_CORE_EVENTS) {
-			list_add_tail(&entry->list, &fh->events[ev_idx]);
-			/* drop the oldest event */
-			entry = list_first_entry(&fh->events[ev_idx],
-						 struct cec_event_entry, list);
-			list_del(&entry->list);
-			kfree(entry);
-		}
+		list_add_tail(&new_entry->list, &fh->events[ev_idx]);
+		/* drop the oldest event */
+		entry = list_first_entry(&fh->events[ev_idx],
+					 struct cec_event_entry, list);
+		list_del(&entry->list);
+		kfree(entry);
 	}
 	/* Mark that events were lost */
 	entry = list_first_entry_or_null(&fh->events[ev_idx],
diff --git a/drivers/media/cec/core/cec-api.c b/drivers/media/cec/core/cec-api.c
index 103ded79526f..a491d7fc8a71 100644
--- a/drivers/media/cec/core/cec-api.c
+++ b/drivers/media/cec/core/cec-api.c
@@ -345,8 +345,7 @@ static long cec_dqevent(struct cec_adapter *adap, struct cec_fh *fh,
 
 	if (copy_to_user(parg, &ev->ev, sizeof(ev->ev)))
 		err = -EFAULT;
-	if (ev_idx >= CEC_NUM_CORE_EVENTS)
-		kfree(ev);
+	kfree(ev);
 	fh->queued_events[ev_idx]--;
 	fh->total_queued_events--;
 
@@ -673,7 +672,7 @@ static int cec_release(struct inode *inode, struct file *filp)
 		list_del(&entry->list);
 		kfree(entry);
 	}
-	for (i = CEC_NUM_CORE_EVENTS; i < CEC_NUM_EVENTS; i++) {
+	for (i = 0; i < CEC_NUM_EVENTS; i++) {
 		while (!list_empty(&fh->events[i])) {
 			struct cec_event_entry *entry =
 				list_first_entry(&fh->events[i],
diff --git a/include/media/cec.h b/include/media/cec.h
index 0c8e86115b6f..5aff399e69e6 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -85,7 +85,6 @@ struct cec_event_entry {
 	struct cec_event	ev;
 };
 
-#define CEC_NUM_CORE_EVENTS 2
 #define CEC_NUM_EVENTS CEC_EVENT_PIN_5V_HIGH
 
 struct cec_fh {
@@ -101,7 +100,6 @@ struct cec_fh {
 	struct list_head	events[CEC_NUM_EVENTS]; /* queued events */
 	u16			queued_events[CEC_NUM_EVENTS];
 	unsigned int		total_queued_events;
-	struct cec_event_entry	core_events[CEC_NUM_CORE_EVENTS];
 	struct list_head	msgs; /* queued messages */
 	unsigned int		queued_msgs;
 };
-- 
2.53.0



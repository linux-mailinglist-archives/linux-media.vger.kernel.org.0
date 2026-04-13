Return-Path: <linux-media+bounces-58657-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJdrEiTA3Gn5VwkAu9opvQ
	(envelope-from <linux-media+bounces-58657-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 12:06:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC823EA34D
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 12:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1681B300ACA1
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0A43B895A;
	Mon, 13 Apr 2026 10:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="R/IMmElT"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036AA3B47DA
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 10:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074763; cv=none; b=CaJDkziyPGh0Q7b1vmM5szzdT7hq/fmSkzmHkHEPX5LnyTC6ERq9c+gXDzXyMTAD5xxE5BxUHBEEhDZXvEFnzFb0aTHBMFbbKg6g+iiwI17yYGngWBNfC7FBMjlGagaNrcA6q3slElsIEJRaiJgPOFT22++lNQX3hHxobOefun4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074763; c=relaxed/simple;
	bh=JE86fUV3JkQQOuZTWVbOsqjdNcACrK+Bo67HebW+w7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D43MVuZuwcsXXgwE5Ob8cKMt0zb7SGceqnUtVZyhc9U710anDhByOZgEbtNgCNNebXQlXyh1sYPMgdTaXm3NdUhWcPl/eiYZqu+xIBmLD9D+u1HdAXXqOrsE4HNLvX+iusvHEU3vSSRHV0xQV2NVnveGMOfF812Wso5NuVNWI9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=R/IMmElT; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4qZm5GjLEkNnItijTnEA/o58JyXKmIqseWHH1wpMnFg=; b=R/IMmElTo+BDxNJiuORDMRvnGF
	UFfqosgh1qSxrCUITT6MnlvMb7TjnfHhWuZVoPu5u8Gjc1uSpA2/m5aY/1iSivz6FHUN3VhQmZwlj
	t/rT8H3qrAlPPfld5SdK//j6Pp9Eqr5QVEqHQfMkvV20O1rIcRoBeGydWMd0x+xAQkzJreV4wdPdK
	Xcqdn/QPSDjXlMqJpY9O5rzekJEVm9gULpxIFe9oUidG2JqG/4jxBUkVwgUA9RP6ReYPLdwkfjZo4
	Za8BwLt+V5aiWTuT5L2A7POGOYs1IFh07gajKQl68cCxFdoqeygr/l20N4LUaU9yEOHvdHcBlmE7d
	HQ07MDMA==;
Received: from [90.240.106.137] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wCEAw-00FL6F-Ie; Mon, 13 Apr 2026 12:05:50 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/3] dma-fence: Fix potential tracepoint null pointer dereferences
Date: Mon, 13 Apr 2026 11:05:25 +0100
Message-ID: <20260413100526.15729-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260413100526.15729-1-tvrtko.ursulin@igalia.com>
References: <20260413100526.15729-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.64 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58657-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.911];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,collabora.com:email]
X-Rspamd-Queue-Id: CEC823EA34D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Trace_dma_fence_signaled, trace_dma_fence_wait_end and
trace_dma_fence_destroy can all dereference a null fence->ops pointer
after it has been reset on fence signalling.

Lets use the safe string getters for most tracepoints to a void this.

But for the signalling tracepoint, we move it to before the fence->ops
is reset and special case its definition in order to avoid losing the
driver and timeline information.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
Cc: Christian König <christian.koenig@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-fence.c      |  3 ++-
 include/trace/events/dma_fence.h | 29 +++++++++++++++++++++++++++--
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index a2aa82f4eedd..b3bfa6943a8e 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -363,6 +363,8 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      &fence->flags)))
 		return;
 
+	trace_dma_fence_signaled(fence);
+
 	/*
 	 * When neither a release nor a wait operation is specified set the ops
 	 * pointer to NULL to allow the fence structure to become independent
@@ -377,7 +379,6 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 
 	fence->timestamp = timestamp;
 	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
-	trace_dma_fence_signaled(fence);
 
 	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
 		INIT_LIST_HEAD(&cur->node);
diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
index 3abba45c0601..220bf71446e8 100644
--- a/include/trace/events/dma_fence.h
+++ b/include/trace/events/dma_fence.h
@@ -9,12 +9,37 @@
 
 struct dma_fence;
 
+DECLARE_EVENT_CLASS(dma_fence,
+
+	TP_PROTO(struct dma_fence *fence),
+
+	TP_ARGS(fence),
+
+	TP_STRUCT__entry(
+		__string(driver, dma_fence_driver_name(fence))
+		__string(timeline, dma_fence_timeline_name(fence))
+		__field(unsigned int, context)
+		__field(unsigned int, seqno)
+	),
+
+	TP_fast_assign(
+		__assign_str(driver);
+		__assign_str(timeline);
+		__entry->context = fence->context;
+		__entry->seqno = fence->seqno;
+	),
+
+	TP_printk("driver=%s timeline=%s context=%u seqno=%u",
+		  __get_str(driver), __get_str(timeline), __entry->context,
+		  __entry->seqno)
+);
+
 /*
  * Safe only for call sites which are guaranteed to not race with fence
  * signaling,holding the fence->lock and having checked for not signaled, or the
  * signaling path itself.
  */
-DECLARE_EVENT_CLASS(dma_fence,
+DECLARE_EVENT_CLASS(dma_fence_ops,
 
 	TP_PROTO(struct dma_fence *fence),
 
@@ -67,7 +92,7 @@ DEFINE_EVENT(dma_fence, dma_fence_enable_signal,
 	TP_ARGS(fence)
 );
 
-DEFINE_EVENT(dma_fence, dma_fence_signaled,
+DEFINE_EVENT(dma_fence_ops, dma_fence_signaled,
 
 	TP_PROTO(struct dma_fence *fence),
 
-- 
2.52.0



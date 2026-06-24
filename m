Return-Path: <linux-media+bounces-65551-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KzhuAMfOO2r3dQgAu9opvQ
	(envelope-from <linux-media+bounces-65551-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:34:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B26BE2A2
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:34:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OulW5dzW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65551-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65551-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1293315D0F2
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A7733F582;
	Wed, 24 Jun 2026 12:29:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2B531352B
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 12:29:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304168; cv=none; b=LR3OyMExt+AXvXO/1ibRF9HJSsG8+lztPMffuKFdhxX6IkQPC+B7KIinQNbRSt2q6Sczy+j72SEwfEnTy8qnbYth6TsRP2xRUKooaBflQcNjrbnXhjjcmRefMscbYhprUwT+BoUlajjgyaQBIIRrE3kCagtg4Cxpo0pWFQK+CDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304168; c=relaxed/simple;
	bh=+Jrtdrm6BStJKaSFuMwjKeGwZkBNWC8Zu0TxcLLTEJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PSVFNJhAbtDCJGPAE8PObOlNmrNoRvtLJlqxy/7ZevFYEo5MpsF0TLcdzDiiFlFrSCEO7WPZldaItHzL4I8s578U65zp6xmo3smXJzxICavET3l9uwl/idrPZsQeeefDPiTxXN76t9LLkfKFBJGWDDlbBXSEiODOcMcmnO3BUxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OulW5dzW; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-462342ac290so1238778f8f.2
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 05:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304165; x=1782908965; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e+wf2elqBE83cLAMddkXjWEzB4Lp80uvCyXariA02m8=;
        b=OulW5dzWp7T7WlVSoksJZaZYN3tATdoPL/xrpqZo1woALgXcXGlKzsoUyfVOn1jh1a
         WswMhdNIJm9ulcKuQHiPRMN0nU0iWrvSDrSaNZhCJdkksS8sljGMgwg5u/OaFsuBm8I7
         KZJVKi7MNmZLU+Q6wHJMGjIR3pSyzcrVpLfx8aA58Nf99wQFhA3EdFmqe2UXBrpIXdrn
         deQhUnD8TDUarQjCD+oG9qERCQF2FitmNkinbnnHwkE1L7SxKyw8L5Xps6fh5zr2uDeP
         pQqKUXBXTV3NBf0jQo5RvlwreXL3YOOV9wdxfK0TF/2vrKBhmJBBvp8KakqMo9y+TfUe
         VMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304165; x=1782908965;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e+wf2elqBE83cLAMddkXjWEzB4Lp80uvCyXariA02m8=;
        b=JVLHbQEOGlJwby2Y6rPhBl0n0n67H7J8vCA1tfv2PRI/Mztgeig/XYoHEhhpMAQqXl
         kFDMPN4FI/IThA1LbOygDkmQ5sMyUEjjsZbXifWHr5f7va7akpQ9YTCqZZB3GVTm2bCa
         C4v+nFe98WPbn7bPU1HklJ0iw1zhK+XMwbcQibXRA6fDaUF1+j8hsRucpPeZ8IrTatra
         X3U4zMC4KwSykjSeM6CR5YAIuqy9Y36ZFBg/wH73dNFwxdYyCVOKj+aiaur4XVD227ID
         VJg99z9UPwyUoaEEhfcHNQOEYqGWzyUdpzx7wjpWsczrtYcEGLxjtYprxjpJ6FuQ8nbJ
         FsOg==
X-Forwarded-Encrypted: i=1; AHgh+Rpe4X84UzB73wryO4+85FnCGrLwGvIgqYHPCpdRN5CxSEFIdLjJ5A9zUhIoKnR9UU2n6W/89oQRW8IMyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTIo/zTibuPTqEzKbjXDXY5IvTPuRCovlsXpxOovMcZRoK1IB/
	hBS3yY8DWaoZVt+iRrjgjg7XIiOO4B6wrrsBR+kgW2RanzG9AKydqcHe
X-Gm-Gg: AfdE7ck49PeIS77wChsSa40nWAj1oNW3RxiSsQxVylmxseGoqkt4gM05ON0H2Porr5k
	0X8N/A7waQNaNWGDG3bYjUA2+zB/CXebP/awG+XJrp0yuEP0y3i3Y4KhEL3Ltq+E71B8DAukBtn
	PjIx3WGCtro7EHy1WohPjnU17R1jAWXbRAsRFIiPaDq7Z7eW3cW8YFO9KnH+CCljJfB1/NvpR/C
	xk6Qre4eVfZ6+qdGI4Nt0J0zAnJ7kLWhygQ08ASEQuBGnnF0B83DgzmWMhKQnwvVX/3WP2NcMyD
	hb4nT6KBwzv3XNFhRX9yGcUjUgLrEdrUQQ8IrXi1NtAN9mspYWPsWqapVa2xuql8CDOL5xLopWL
	mXteAsbNWC3YwZQJQ0uOC/Vg9JTd4w2lZlJsTTS35HhZtqiHGxzqP7m3cLma9Nq2vx1vTCyY2HL
	2cnN3JLNsjFqbj9w/CH2C1K6Mo6SM5ad3MajvQ
X-Received: by 2002:a05:6000:46cc:b0:460:1957:1b33 with SMTP id ffacd0b85a97d-46ad8c2448dmr7855512f8f.3.1782304165478;
        Wed, 24 Jun 2026 05:29:25 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157e:3500:2be7:1a89:41c5:9239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c9787dddbsm3896530f8f.3.2026.06.24.05.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:29:25 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: phasta@kernel.org,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	tvrtko.ursulin@igalia.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 06/10] drm/xe: stop using dma_fence_is_signaled_locked
Date: Wed, 24 Jun 2026 13:13:30 +0200
Message-ID: <20260624122917.2483-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624122917.2483-1-christian.koenig@amd.com>
References: <20260624122917.2483-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65551-lists,linux-media=lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:tvrtko.ursulin@igalia.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[christian.koenig@amd.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:replyto,amd.com:email,amd.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A1B26BE2A2

This use case is a bit more complicated since the irq worker is
actually the one signaling the fence.

The patch should not indroduce any functional change, but the code can
probably be cleaned up quite a bit after the full patch set lands.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 14720623ad00..a4e0278559b8 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -16,6 +16,8 @@
 
 static struct kmem_cache *xe_hw_fence_slab;
 
+static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence);
+
 int __init xe_hw_fence_module_init(void)
 {
 	xe_hw_fence_slab = kmem_cache_create("xe_hw_fence",
@@ -47,6 +49,16 @@ static void fence_free(struct rcu_head *rcu)
 		kmem_cache_free(xe_hw_fence_slab, fence);
 }
 
+static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
+{
+	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
+	struct xe_device *xe = fence->xe;
+	u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
+
+	return dma_fence->error ||
+		!__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno);
+}
+
 static void hw_fence_irq_run_cb(struct irq_work *work)
 {
 	struct xe_hw_fence_irq *irq = container_of(work, typeof(*irq), work);
@@ -60,7 +72,9 @@ static void hw_fence_irq_run_cb(struct irq_work *work)
 			struct dma_fence *dma_fence = &fence->dma;
 
 			trace_xe_hw_fence_try_signal(fence);
-			if (dma_fence_is_signaled_locked(dma_fence)) {
+			if (dma_fence_test_signaled_flag(dma_fence) ||
+			    xe_hw_fence_signaled(dma_fence)) {
+				dma_fence_signal_locked(dma_fence);
 				trace_xe_hw_fence_signal(fence);
 				list_del_init(&fence->irq_link);
 				dma_fence_put(dma_fence);
@@ -120,8 +134,6 @@ void xe_hw_fence_ctx_finish(struct xe_hw_fence_ctx *ctx)
 {
 }
 
-static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence);
-
 static struct xe_hw_fence_irq *xe_hw_fence_irq(struct xe_hw_fence *fence)
 {
 	return container_of(fence->dma.extern_lock, struct xe_hw_fence_irq,
@@ -142,16 +154,6 @@ static const char *xe_hw_fence_get_timeline_name(struct dma_fence *dma_fence)
 	return fence->name;
 }
 
-static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
-{
-	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
-	struct xe_device *xe = fence->xe;
-	u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
-
-	return dma_fence->error ||
-		!__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno);
-}
-
 static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
 {
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
-- 
2.43.0



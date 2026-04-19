Return-Path: <linux-media+bounces-59105-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACPdMQv/5GkVdAEAu9opvQ
	(envelope-from <linux-media+bounces-59105-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 18:12:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AB94249DC
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 18:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29998301FFBB
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 16:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DE929E0F6;
	Sun, 19 Apr 2026 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HznOBMEh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40046295DAC
	for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776615157; cv=none; b=CzQvPpv98FPBN4ShggKZyLU6OCM/Y90RHv+y48FZONVQ0xDbMmeYPYv6kuDVegNFx/hAwSe2iPt8Bj+yWRIydZljknK1yuWDNUS9zWzWUczowLmL6WyzzZ/7QQY3TtP47VSVVSs8Fgow4UU7A462hD3hXGDeknax8VCtb5rXYKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776615157; c=relaxed/simple;
	bh=6TROq5XU8fpGmkxwOEqRCkJZI5Po9h42BuGo6+mvmk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lXRdBN6APVMSPhoQo2UfDogQPVK+B5sJQo4vuDbS8PIt1Ybm+tYp1aoniQf5GImohBATkoll+63Sacw4TsxQBPxCjx2b8JzpyserJXkMAfE/0TXCXD4I1UmgW3qrsMQziD8ppK7i5v26MiAc0M4YNq2qYotuxph5DKCvNUFuQfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HznOBMEh; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cb3bae8d3eso198825985a.1
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 09:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776615155; x=1777219955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B17bAyfAm7uzzttww80XtUu6/K1MgSIE6Bs+vc9UHtw=;
        b=HznOBMEhx/c230S9LKk1dua6oCbdfZpcCccoeUKOaEVRf+kWwKC8e5NIWDogOxSw5l
         iOnY1WtdoqurKtj6UNUtoAi1zw9PClQR8VNf/0FZzC2u/3JGHfPcCkUEsAzoARkKhI0z
         SlKXcSc34ZpjHxZkm+Bvp24wAauzmD9os+zzAFiNldPe3JEYVip6P82RLkfWpqLWInHY
         GlwrhsHihDQVbQgstrFh9id76UP5Ust3PjNkLa0AnyiN7R+rkBoyMM0Nhf9AG+yNSVxp
         yEkD6nLdCjJDp9c42mJ+YgaLWApO0tsWzjkTaYlzcr/+Jv3+niEMJ1mkrSnOD4vXO68H
         zPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776615155; x=1777219955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B17bAyfAm7uzzttww80XtUu6/K1MgSIE6Bs+vc9UHtw=;
        b=sTmtrTjHGAcHw9J0ziRG6uRIlOf6YOmj8uhk4wvs77TTbBBTUOIKbtImjUY7oveLhY
         VVMSMgHJ50LDEuvBJwyuNToQi3oqa6D05L0GhIj754j4cpu956u1Pi/ysPGp/XwhQRcW
         FJgb+TQSCZBqYCXSOB8Z2GAUlHEw7iARynHzoD45pNi2np0enDDQRJtJGkfSYFFNlalT
         2E0s29b0vICH9mPazHAUN3Q3FoUCFS8qW9RD49m4d+u+YLB42uafFUPSoMIgJxFxWZVI
         8rRP4k1wTqcFRQ6N6hYKndngUv3ExPJ5WTuMsVA3U7dEl3GomYigg0+LX+8jXwWbs5p1
         PpWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cOWj9+dVyKCfPgb8Wgf+klXTqBep/6pYElNDtysVAIX4QzW+01qQgPQqsb2O9quR5kdEL9LNHM7SVsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWiv0LqWJAjr3En4WiHOM8RiskAoQanBAlaa5/F+Ya6AYwW0mD
	250a3FSW1WHvonxoyBPmx+rShylJytmrtP0+6KA8El1ztaPYBqrzD6Uy
X-Gm-Gg: AeBDievT4iktyEMzkAUMv70bLZGPiVcbNE7chLM2TpItgB52ejZqq94WJVGzuIqaVLf
	a8Laci6QS9SpKMXX6rtFfYMEKGmYFJ7Y3glKBTuN8uVMDmlRUyVbNv0orHFbLLnCbIQBTLZS4Vu
	3TpCjqivtwA0GX+lZ1F+mjTUhrMsHbTdosW+RpOEwo53Yq3PrBpuYJr3Wkvdd9o8vw4AA4JDUGh
	ZFmT6T65VQmhJWOq/s8VowKnA72q2fPJ7wjN10nr88u6vdm4EO8CT68yc/UtTxSR7O+ovjoZCc3
	YMRfZ1OYJjRfoycO4yZjcVfMj95I73Z3Ewbwy+fSuUEja6mBZpsj0HnsNnVgmHtJjO3tPpGutBC
	SHKkm0warxBsWW3tAjdY0Bd035Abx3/UcrjhZ1PifYJ6bPY6NeGgmU7YYSYKlDt7YAadYpSJ1Eo
	YSZ5AHh162/7eqMAxVVx19BjAqahQC1YD9LydGGUlX4J/Hb0G/UOPO6yPZm/EaaF5aCLW8z79oZ
	E7NwzcO6bR6zW8xctPn1Vj6aOoo6GE=
X-Received: by 2002:a05:620a:2844:b0:8b2:1ee9:dcfb with SMTP id af79cd13be357-8e78f82cf5emr1427279685a.8.1776615155112;
        Sun, 19 Apr 2026 09:12:35 -0700 (PDT)
Received: from server0 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d8edb795sm598271385a.25.2026.04.19.09.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 09:12:34 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Sam Day <me@samcday.com>,
	Christian Brauner <brauner@kernel.org>,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian Koenig <christian.koenig@amd.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] usb: gadget: f_fs: serialize DMABUF cancel against request completion
Date: Sun, 19 Apr 2026 12:12:27 -0400
Message-ID: <20260419161227.1587668-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59105-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2AB94249DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ffs_epfile_dmabuf_io_complete() calls usb_ep_free_request() on the
completed request but leaves priv->req, the back-pointer that
ffs_dmabuf_transfer() set on submission, pointing at the freed
memory.  A later FUNCTIONFS_DMABUF_DETACH ioctl or
ffs_epfile_release() on the close path still sees priv->req
non-NULL under ffs->eps_lock:

    if (priv->ep && priv->req)
            usb_ep_dequeue(priv->ep, priv->req);

so usb_ep_dequeue() is called on a freed usb_request.

On dummy_hcd the dequeue path only walks a live queue and
pointer-compares, so the freed pointer reads without faulting and
KASAN requires an explicit check at the FunctionFS call site to
surface the use-after-free.  On SG-capable in-tree UDCs the
dequeue path dereferences the supplied request immediately:

  * chipidea's ep_dequeue() does
    container_of(req, struct ci_hw_req, req) and reads
    hwreq->req.status before acquiring its own lock.
  * cdnsp's cdnsp_gadget_ep_dequeue() reads request->status first.

The narrower option of clearing priv->req via cmpxchg() in the
completion does not close the race: the completion runs without
eps_lock, so a cancel path holding eps_lock can still observe
priv->req non-NULL, race a concurrent completion that clears and
frees, and pass the freed pointer to usb_ep_dequeue().  A slightly
longer fix that moves the free into the cleanup work is needed.

Same class of lifetime race as the recent usbip-vudc timer fix [1].

Take eps_lock in the sole place that mutates priv->req from the
callback direction by moving usb_ep_free_request() out of the
completion into ffs_dmabuf_cleanup(), the existing work handler
scheduled by ffs_dmabuf_signal_done() on
ffs->io_completion_wq.  Clear priv->req there under eps_lock
before freeing, and only clear if priv->req still names our
request (a subsequent ffs_dmabuf_transfer() on the same
attachment may have queued a new one).

This keeps the existing dummy_hcd sync-dequeue invariant: the
completion callback is still invoked by the UDC without
eps_lock held (dummy_hcd drops its own lock before calling the
callback), and the callback now takes no f_fs lock at all.
Serialization against the cancel path happens in cleanup, which
runs from the workqueue with no f_fs lock held on entry.

The priv ref count protects the containing ffs_dmabuf_priv:
ffs_dmabuf_transfer() takes a ref via ffs_dmabuf_get(), cleanup
drops it via ffs_dmabuf_put(), so priv stays live for the
cleanup even after the cancel path's list_del + ffs_dmabuf_put.

The ffs_dmabuf_transfer() error path no longer frees usb_req
inline: fence->req and fence->ep are set before usb_ep_queue(),
so ffs_dmabuf_cleanup() (scheduled by the error-path
ffs_dmabuf_signal_done()) owns the free regardless of whether
the queue succeeded.

Reproduced under KASAN on both detach and close paths against
dummy_hcd with an observability hook
(kasan_check_byte(priv->req) immediately before usb_ep_dequeue)
at the two FunctionFS cancel sites to surface the stale-pointer
access; the hook is not part of this patch.  The KASAN
allocator / free stacks in the captured splats identify the
same request: alloc in dummy_alloc_request, free in
dummy_timer, fault reached from ffs_epfile_release (close) and
from the FUNCTIONFS_DMABUF_DETACH ioctl (detach).  With the
patch applied, both paths are silent under the same hook.

The bug is reached from the FunctionFS device node, which in
real deployments is owned by the privileged gadget daemon
(adbd, UMS, composite gadget services, etc.); it is not
reachable from unprivileged userspace or from a USB host on the
cable.  FunctionFS mounts default to GLOBAL_ROOT_UID, but the
filesystem supports uid=, gid=, and fmode= delegation to a
non-root gadget daemon, so on real deployments the attacker may
be a less-privileged service rather than root.

Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
Link: https://lore.kernel.org/all/20260417163552.807548-1-michael.bommarito@gmail.com/ [1]
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/usb/gadget/function/f_fs.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 815639506520..75912ce6ab55 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -150,6 +150,8 @@ struct ffs_dma_fence {
 	struct dma_fence base;
 	struct ffs_dmabuf_priv *priv;
 	struct work_struct work;
+	struct usb_ep *ep;
+	struct usb_request *req;
 };
 
 struct ffs_epfile {
@@ -1385,6 +1387,21 @@ static void ffs_dmabuf_cleanup(struct work_struct *work)
 	struct ffs_dmabuf_priv *priv = dma_fence->priv;
 	struct dma_buf_attachment *attach = priv->attach;
 	struct dma_fence *fence = &dma_fence->base;
+	struct usb_request *req = dma_fence->req;
+	struct usb_ep *ep = dma_fence->ep;
+
+	/*
+	 * eps_lock pairs with the cancel paths so they cannot pass a freed
+	 * req to usb_ep_dequeue().  Only clear if priv->req still names ours;
+	 * a re-queue on the same attachment may have taken that slot.
+	 */
+	spin_lock_irq(&priv->ffs->eps_lock);
+	if (priv->req == req)
+		priv->req = NULL;
+	spin_unlock_irq(&priv->ffs->eps_lock);
+
+	if (ep && req)
+		usb_ep_free_request(ep, req);
 
 	ffs_dmabuf_put(attach);
 	dma_fence_put(fence);
@@ -1414,8 +1431,8 @@ static void ffs_epfile_dmabuf_io_complete(struct usb_ep *ep,
 					  struct usb_request *req)
 {
 	pr_vdebug("FFS: DMABUF transfer complete, status=%d\n", req->status);
+	/* req is freed by ffs_dmabuf_cleanup() under eps_lock. */
 	ffs_dmabuf_signal_done(req->context, req->status);
-	usb_ep_free_request(ep, req);
 }
 
 static const char *ffs_dmabuf_get_driver_name(struct dma_fence *fence)
@@ -1699,6 +1716,10 @@ static int ffs_dmabuf_transfer(struct file *file,
 	usb_req->context  = fence;
 	usb_req->complete = ffs_epfile_dmabuf_io_complete;
 
+	/* ffs_dmabuf_cleanup() frees usb_req via these two fields. */
+	fence->req = usb_req;
+	fence->ep = ep->ep;
+
 	cookie = dma_fence_begin_signalling();
 	ret = usb_ep_queue(ep->ep, usb_req, GFP_ATOMIC);
 	dma_fence_end_signalling(cookie);
@@ -1708,7 +1729,6 @@ static int ffs_dmabuf_transfer(struct file *file,
 	} else {
 		pr_warn("FFS: Failed to queue DMABUF: %d\n", ret);
 		ffs_dmabuf_signal_done(fence, ret);
-		usb_ep_free_request(ep->ep, usb_req);
 	}
 
 	spin_unlock_irq(&epfile->ffs->eps_lock);
-- 
2.53.0



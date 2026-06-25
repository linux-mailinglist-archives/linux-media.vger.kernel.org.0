Return-Path: <linux-media+bounces-65636-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A4G7NhknPWr+xwgAu9opvQ
	(envelope-from <linux-media+bounces-65636-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:03:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F486C5DFA
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:03:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=uELMjqwE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65636-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65636-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 126063048229
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 12:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A023E4C9F;
	Thu, 25 Jun 2026 12:59:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAA43E4C88;
	Thu, 25 Jun 2026 12:59:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782392387; cv=none; b=UWIQLs3UKX+It6jFH8StT+RbhoUSzcWTY6xgkx1pxM3Z9oB/sRrk1zWC1ryOMJiJEEMeLniV/WBQFjN/b0UB0DmQ0KaKeR00LJjMvBO7rcrbLvDbDdTUGlX2yLnjPlBXXcsrRrPnSToo9IsY/NW150Mye2XjKAKwxm/Pkdj4cPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782392387; c=relaxed/simple;
	bh=mO7H6CxT0xr+TQeP349f5rakbVigIjKs7/5ZqaY0c0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MlY5nlSeugA+Cv8FpXK5gfV/1HIuc5A8RzP/4Rp1IHfiOQXRlBsbSi3O1DSjbHnJPDQeLwjb4Kd7WmIN/G3kw2Cu2npg5EYDWPy+YroXnx32Tp3AW4y+ZdX7EDq9pO+bXrEmVO4tBGM8JAA9lspxmKISE/O5rwj2iaxD2ZN7zy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uELMjqwE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78D90C2BCC9;
	Thu, 25 Jun 2026 12:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782392387;
	bh=mO7H6CxT0xr+TQeP349f5rakbVigIjKs7/5ZqaY0c0M=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=uELMjqwEc9cuNIZ9EZXe417st4SjO8Eqjfufuo4TNIS42GumU3HjMtRc1om7aVi29
	 2+xxquT4GkhO+EZgPUv+a0ELnDTYJQ6+mF+cmik1ZhoHTaEFl3Qbj6s5wXeAo5DN01
	 bpN923Jns0yOVJ4q9xr2jve+LbnlADFLH8kAnQJmqks/GcHeGiCdCRWm3F5chlYJgn
	 ieMfWf+YPwc56ExhaMzkzU4Jjd3mg8a/dw311QVSxaM82qpWb+HYqQmwMeoHlHu95U
	 1CBklZ/8IfpZu+JAbD+B2zVA+pTIvta2NJmnmEkImc8E8bbNAsXmnJe6a+HpEv4zyJ
	 jlIz23rvzwU5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED16CDE007;
	Thu, 25 Jun 2026 12:59:47 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Date: Thu, 25 Jun 2026 07:59:47 -0500
Subject: [PATCH v2] udmabuf: serialize the sg_table cache under the
 reservation lock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260625-b4-disp-a9216ef0-v2-1-4819401e7086@proton.me>
X-B4-Tracking: v=1; b=H4sIAEImPWoC/x3MPQqAMAxA4atIZgMx1fpzFXGoNtUsKi2IIN7d4
 vgN7z2QJKokGIoHolya9NgzuCxg2dy+CqrPBia2ZLnBuUav6UTXc2UlEHqynWmNC4EayNkZJej
 9L8fpfT8en+qmYgAAAA==
To: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Cc: linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782392386; l=5019;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=0aLxTibrMJBplO9IaIusxbrB77zTe9eUcVQQojgli4k=;
 b=zfW2oXU7nK7VvHH7SPh3ROeiAWU/E6kCQj/YLWII1KAa1frlENS4D3ORc9JKoaiwI2Ubu1rR8
 HfvM7IB5/FGBP7MJr09SzYCaFkTDbxlxphHNAX+6fwPF72Xrklv+JOO
X-Developer-Key: i=hexlabsecurity@proton.me; a=ed25519;
 pk=dmppBMZNLLoPzxHi9l8tZDzEZUunPbgsYqIZYXeUrL0=
X-Endpoint-Received: by B4 Relay for hexlabsecurity@proton.me/proton with
 auth_id=814
X-Original-From: Bryam Vargas <hexlabsecurity@proton.me>
Reply-To: hexlabsecurity@proton.me
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65636-lists,linux-media=lfdr.de,hexlabsecurity.proton.me];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:kraxel@redhat.com,m:linux-kernel@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:gurchetansingh@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[hexlabsecurity@proton.me];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,proton.me:replyto,proton.me:email,proton.me:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9F486C5DFA

From: Bryam Vargas <hexlabsecurity@proton.me>

begin_cpu_udmabuf() builds and caches ubuf->sg with an unserialised
check-then-set, and end_cpu_udmabuf() reads the same field unlocked. The
core invokes both cpu-access hooks without holding the reservation lock and
DMA_BUF_IOCTL_SYNC is unlocked, so concurrent SYNC ioctls on a shared
udmabuf fd race on ubuf->sg: two begins can both observe NULL and both call
get_sg_table(), and the later store orphans the earlier table and its DMA
mapping, which release_udmabuf() never frees. Each won race permanently
leaks an sg_table and an unbalanced DMA mapping.

Serialize both hooks under the buffer's reservation lock, as panfrost and
panthor do. Take it interruptibly: the lock can be held across a wait for
hardware to finish, so an uninterruptible acquire would park a SYNC
ioctl in TASK_UNINTERRUPTIBLE. dma_buf_begin/end_cpu_access() already
annotate might_lock() on that lock, so taking it here matches the
documented contract. Single-threaded callers are unaffected.

Fixes: 284562e1f348 ("udmabuf: implement begin_cpu_access/end_cpu_access hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
---
v2: Take the reservation lock interruptibly (dma_resv_lock_interruptible())
    in both hooks instead of the uninterruptible dma_resv_lock(), and return
    the error; the lock can be held across a wait for hardware to finish, so
    an uninterruptible acquire could park a SYNC ioctl in
    TASK_UNINTERRUPTIBLE. With a NULL ww_acquire_ctx the call returns only 0
    or -EINTR, so a single error check is enough. (Christian König)
v1: https://lore.kernel.org/all/20260625-b4-disp-67d1f3db-v1-1-a47fb9edab9e@proton.me/

Same leak-with-dangling-pointer class as CVE-2024-56712 (export_udmabuf()
error path) -- a distinct site the 2024 fix does not cover.

udmabuf is the only exporter that lazily builds its sg_table cache inside the
cpu-access hook without serialising the check-then-set. The exporters that do
comparable in-hook cache work all take a lock first: panfrost and panthor
dma_resv_lock() (both hooks), omapdrm omap_obj->lock around its lazy page-get,
the dma-heaps buffer->lock, and the TTM/GEM exporters (amdgpu, i915, xe) their
object's reservation lock. tegra and videobuf2 take no lock here because they
only sync an sg_table built earlier, so there is nothing to serialise.

Confirmed with an out-of-tree A/B exercising the begin/begin race: this driver
built as a module with get_sg_table()/put_sg_table() counting allocations
against frees, driven by a userspace racer that creates 3000 udmabufs and fires
DMA_BUF_IOCTL_SYNC(SYNC_START) from N threads on each shared fd. The lock
serialises the check-then-set identically whether it is taken interruptibly or
not; the run below used the reservation lock:

  arm                            leaked sg_tables (of 3000 buffers)
  vulnerable, 4 threads          4761
  control, 1 thread              0
  patched (resv lock), 4 threads 0

One sg_table and its DMA mapping leak per won race; the single-thread control
does not leak, isolating the race; with the lock the lazy-init runs once per
buffer (3000 allocations, zero leaked). end_cpu_udmabuf() is locked for the
same field too: an unlocked end could otherwise observe the transient IS_ERR
store begin makes before resetting ubuf->sg to NULL, and dereference it. In a
tighter 5000-iteration loop the unpatched leak runs around 15-20 MB/s of slab.
---
 drivers/dma-buf/udmabuf.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index bced421c0d65..d6a137f0de1f 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -226,6 +226,10 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
 	struct device *dev = ubuf->device->this_device;
 	int ret = 0;
 
+	ret = dma_resv_lock_interruptible(buf->resv, NULL);
+	if (ret)
+		return ret;
+
 	if (!ubuf->sg) {
 		ubuf->sg = get_sg_table(dev, buf, direction);
 		if (IS_ERR(ubuf->sg)) {
@@ -238,6 +242,8 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
 		dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
 	}
 
+	dma_resv_unlock(buf->resv);
+
 	return ret;
 }
 
@@ -246,12 +252,20 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
 {
 	struct udmabuf *ubuf = buf->priv;
 	struct device *dev = ubuf->device->this_device;
+	int ret = 0;
+
+	ret = dma_resv_lock_interruptible(buf->resv, NULL);
+	if (ret)
+		return ret;
 
 	if (!ubuf->sg)
-		return -EINVAL;
+		ret = -EINVAL;
+	else
+		dma_sync_sgtable_for_device(dev, ubuf->sg, direction);
 
-	dma_sync_sgtable_for_device(dev, ubuf->sg, direction);
-	return 0;
+	dma_resv_unlock(buf->resv);
+
+	return ret;
 }
 
 static const struct dma_buf_ops udmabuf_ops = {

---
base-commit: 7eed1fb17959e721031555e5b5654083fe6a7d02
change-id: 20260625-b4-disp-a9216ef0-d068373aff05

Best regards,
-- 
Bryam Vargas <hexlabsecurity@proton.me>




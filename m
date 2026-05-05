Return-Path: <linux-media+bounces-60430-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED/XGl75+WmNFgMAu9opvQ
	(envelope-from <linux-media+bounces-60430-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:06:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 260DF4CF0E5
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34B9A301FF21
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4874547ECF3;
	Tue,  5 May 2026 14:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ueNYOVD9"
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F3E47F2E5;
	Tue,  5 May 2026 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989963; cv=none; b=lceAlGPm6V3oWOuedumKgwomG835TRHcbl1AFlCOHrNkm7C6DzxnVuAUb+q7LAA+qvF/HL6ejjPKp0M+2emR7QisN9Gi3p2Qxk99UR7TusKHFfFJlonP0CqHTTqx+GZfWQO/zkjtBrETJMXTHlSklOyhwWm7OS5aP3WSYYcnsto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989963; c=relaxed/simple;
	bh=C/HPVhAFNazZLtwqgmXIczamjt4yPbAq/jYAjnd19+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bSXoTIWEASVmGADgrgCOTZFN2oe8v3HYTBcXbkQakvUZyXRNFQY5BhlxC6915+DP4zRBr2gU+QEeLqZYawiGgL5NmLqugWSs81WGw8AancV1D4Tcvztfm4DCBTrATnlMZE2N3qu+bJun+dzVpuPzBKpg2HD6gzrg45as83NLXS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ueNYOVD9; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61DEC24C0;
	Tue,  5 May 2026 07:05:51 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40ACC3F763;
	Tue,  5 May 2026 07:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777989956; bh=C/HPVhAFNazZLtwqgmXIczamjt4yPbAq/jYAjnd19+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ueNYOVD9kubk4sYtRy9DR4f5wtZSWKw5rtSXMp4ZLjhwgwh+PGLr/5j+wnjkNYR0e
	 43fSiim7+DW2GxEZ1FFtajXYSiMT0yg41SnB/LR8RK/+ubBqvc+l6kVEdkRcAOU9d0
	 bL17Dwe0tuiIVK5IbFF8rMoz4zVG6E1olq+7461A=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH 6/8] drm/panthor: Explicit expansion of locked VM region
Date: Tue,  5 May 2026 16:05:12 +0200
Message-ID: <20260505140516.1372388-7-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505140516.1372388-1-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 260DF4CF0E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60430-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ketil.johnsen@arm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Currently the panthor_vm_lock_region() function will implicitly expand
an already locked VM region. This can be problematic because the caller
do not reliably know if it needs to call panthor_vm_unlock_region()
or not.

Worth noting, there is currently no known issues with this as the code
is written today.

This change introduces panthor_vm_expand_region() which will only work
if there is already a locked VM region. This again means that the
original lock and unlock functions can work as a pair. This pairing is
needed for subsequent protected memory changes.

Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 69 +++++++++++++++++++--------
 1 file changed, 50 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index fc930ee158a52..07f54176ec1bf 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1701,15 +1701,36 @@ static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
 	struct panthor_device *ptdev = vm->ptdev;
 	int ret = 0;
 
-	/* sm_step_remap() can call panthor_vm_lock_region() to account for
-	 * the wider unmap needed when doing a partial huge page unamp. We
-	 * need to ignore the lock if it's already part of the locked region.
-	 */
-	if (start >= vm->locked_region.start &&
-	    start + size <= vm->locked_region.start + vm->locked_region.size)
-		return 0;
+	if (drm_WARN_ON(&ptdev->base, vm->locked_region.size))
+		return -EINVAL;
+
+	mutex_lock(&ptdev->mmu->as.slots_lock);
+	if (vm->as.id >= 0 && size) {
+		/* Lock the region that needs to be updated */
+		gpu_write64(ptdev, AS_LOCKADDR(vm->as.id),
+			    pack_region_range(ptdev, &start, &size));
+
+		/* If the lock succeeded, update the locked_region info. */
+		ret = as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_LOCK);
+	}
 
-	/* sm_step_remap() may need a locked region that isn't a strict superset
+	if (!ret) {
+		vm->locked_region.start = start;
+		vm->locked_region.size = size;
+	}
+	mutex_unlock(&ptdev->mmu->as.slots_lock);
+
+	return ret;
+}
+
+static int panthor_vm_expand_region(struct panthor_vm *vm, u64 start, u64 size)
+{
+	struct panthor_device *ptdev = vm->ptdev;
+	u64 end;
+	int ret = 0;
+
+	/* This function is here to handle the following case:
+	 * sm_step_remap() may need a locked region that isn't a strict superset
 	 * of the original one because of having to extend unmap boundaries beyond
 	 * it to deal with partial unmaps of transparent huge pages. What we want
 	 * in those cases is to lock the union of both regions. The new region must
@@ -1717,16 +1738,24 @@ static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
 	 * boundaries in a remap operation can only shift up or down respectively,
 	 * but never otherwise.
 	 */
-	if (vm->locked_region.size) {
-		u64 end = max(vm->locked_region.start + vm->locked_region.size,
-			      start + size);
 
-		drm_WARN_ON_ONCE(&vm->ptdev->base, (start + size <= vm->locked_region.start) ||
-				 (start >= vm->locked_region.start + vm->locked_region.size));
+	/* This function can only expand an already locked region */
+	if (drm_WARN_ON(&ptdev->base, !vm->locked_region.size))
+		return -EINVAL;
 
-		start = min(start, vm->locked_region.start);
-		size = end - start;
-	}
+	/* Early out if requested range is already locked */
+	if (start >= vm->locked_region.start &&
+	    start + size <= vm->locked_region.start + vm->locked_region.size)
+		return 0;
+
+	end = max(vm->locked_region.start + vm->locked_region.size,
+		  start + size);
+
+	drm_WARN_ON_ONCE(&ptdev->base, (start + size <= vm->locked_region.start) ||
+			 (start >= vm->locked_region.start + vm->locked_region.size));
+
+	start = min(start, vm->locked_region.start);
+	size = end - start;
 
 	mutex_lock(&ptdev->mmu->as.slots_lock);
 	if (vm->as.id >= 0 && size) {
@@ -2252,11 +2281,13 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
 	unmap_hugepage_align(&op->remap, &unmap_start, &unmap_range);
 
 	/* If the range changed, we might have to lock a wider region to guarantee
-	 * atomicity. panthor_vm_lock_region() bails out early if the new region
-	 * is already part of the locked region, so no need to do this check here.
+	 * atomicity.
 	 */
 	if (!unmap_vma->evicted) {
-		panthor_vm_lock_region(vm, unmap_start, unmap_range);
+		ret = panthor_vm_expand_region(vm, unmap_start, unmap_range);
+		if (ret)
+			return ret;
+
 		panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
 	}
 
-- 
2.43.0



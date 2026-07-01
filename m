Return-Path: <linux-media+bounces-66271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iRkkK15LRWro+AoAu9opvQ
	(envelope-from <linux-media+bounces-66271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:16:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 849CF6F0432
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:16:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=MTc2Z+6v;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66271-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66271-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF429308F87C
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 17:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48FE38F25C;
	Wed,  1 Jul 2026 17:13:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1C838F244;
	Wed,  1 Jul 2026 17:13:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782926015; cv=none; b=eiZwhfk7bdLd+KJYN412j6hjDoikmhnJg/rsi+gTnQhijcVG1xUzf6KEPRqU9f/9kIPEdu6vr8E6RKSkob/6F239RYUu7IZO1JOFXL7TAy7m+xpMIwkKsBwQ7mA4z94eEfJ+4KcIk0Ohi/nhgIEQCs7bcXhgZrUfWwMUqcapogQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782926015; c=relaxed/simple;
	bh=XCXjwIudh7sloFiAUwYTQrZbtM/DR9K27hSQ6CYK6l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ga0NE7W3dbABukr9fF6fBCmoL8UXkobXtN20BxCKhpoDcuvxRR9RBD/yI5hYs55wThTxyy0aVsfmCPyzTD9FA96hw4fITTD2YYX2PbivvyBdJgBadnub/qc53cowo1Av0K3Cz/Y8mN9N2CsMaTyh16LfLUaxjMwezCS5frRJcfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=MTc2Z+6v; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1782926012;
	bh=Q4lZ550ybxWQxs4+qwb7DSTICCoZdlY7ieYoG/TumGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MTc2Z+6vDG37Ev7joQ/4pHYfX8lTNjgvRtzLAqn21/a5Q6iN7r4feiSLAjeP+ANmX
	 u5EGR4RYA/PhEzm9jwUdOIEtcPHd0jc0HI8nDR3IKyNYKnX8RiN7E2N+L0jy4lXFgP
	 HDBlHzqlbUA5Rr2V6uQJVVTs9QbRimHjjob1jyhUDHcPQTU8Fp+D3HcnkjX1cdC02r
	 xgTh3UPDMxwQZBfkJ+UFgXO9qA0NWF4rMzYe6SG2dbkNYxp1MxOHT+kSXUcT/k/RGC
	 U8YUqmAoBhM75cKymwn5ZfsuSYiU13TCBVqga+0hC3yyIrwdMrTNEMrvDRcdQxcOOg
	 0PDABTUDz6afA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gr66g21PNz4wgb;
	Thu, 02 Jul 2026 03:13:31 +1000 (AEST)
From: Matt Evans <matt@ozlabs.org>
To: Alex Williamson <alex@shazbot.org>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Pranjal Shrivastava <praan@google.com>
Cc: Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v4 08/10] vfio/pci: Support mmap() of a VFIO DMABUF
Date: Wed,  1 Jul 2026 18:12:20 +0100
Message-ID: <20260701171245.90111-9-matt@ozlabs.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260701171245.90111-1-matt@ozlabs.org>
References: <20260701171245.90111-1-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66271-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:kevin.tian@intel.com,m:praan@google.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 849CF6F0432

A VFIO DMABUF can export a subset of a BAR to userspace by fd; add
support for mmap() of this fd.  This provides another route for a
process to map BARs, in which the process can only map a specific
subset of a BAR represented by the exported DMABUF.

mmap() support enables userspace driver designs that safely delegate
access to BAR sub-ranges to other client processes by sharing a DMABUF
fd, without having to share the (omnipotent) VFIO device fd with them.

Since the main VFIO BAR mmap() is now DMABUF-aware, the new mmap() reuses
the existing vm_ops.

The lifecycle of an exported DMABUF remains decoupled from that of the
device fd it came from, i.e. the device fd could be closed with DMABUF
VMAs present, meaning a fault on a VMA could happen concurrently with
vfio_pci_dma_buf_cleanup().

To deal with this scenario, the fault handler now temporarily takes a
VFIO device registration to ensure the vdev remains valid, and then
vdev->memory_lock can be taken on it.

Signed-off-by: Matt Evans <matt@ozlabs.org>
---
 drivers/vfio/pci/vfio_pci_core.c   | 83 +++++++++++++++++++++++++++---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 34 ++++++++++++
 drivers/vfio/pci/vfio_pci_priv.h   |  1 +
 3 files changed, 110 insertions(+), 8 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index d8cd7d752781..cd15b934912b 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -12,6 +12,8 @@
 
 #include <linux/aperture.h>
 #include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-resv.h>
 #include <linux/eventfd.h>
 #include <linux/file.h>
 #include <linux/interrupt.h>
@@ -1739,19 +1741,78 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 	vm_fault_t ret = VM_FAULT_SIGBUS;
 
 	/*
-	 * We can rely on the existence of both a DMABUF (priv) and
-	 * the VFIO device it was exported from (vdev).  This fault's
-	 * VMA was established using vfio_pci_core_mmap_prep_dmabuf()
-	 * which transfers ownership of the VFIO device fd to the
-	 * DMABUF, and so the VFIO device is held open because the
-	 * VMA's vm_file (DMABUF) is open.
+	 * The only thing this can rely on is that the DMABUF relating
+	 * to the VMA's vm_file exists (priv).
 	 *
-	 * Since vfio_pci_dma_buf_cleanup() cannot have happened,
-	 * vdev must be valid; we can take memory_lock.
+	 * A DMABUF for a VFIO device fd mmap() holds a reference to
+	 * the original VFIO device fd, but an explicitly-exported
+	 * DMABUF does not.  The original fd might have closed,
+	 * meaning this fault can race with
+	 * vfio_pci_dma_buf_cleanup(), meaning the buffer could have
+	 * been revoked (in which case priv->vdev might be NULL), and
+	 * the VFIO device registration might have been dropped.
+	 *
+	 * With the goal of taking vdev->memory_lock in a world where
+	 * vdev might not still exist:
+	 *
+	 * 1. Take the resv lock on the DMABUF:
+	 *  - If racing cleanup got in first, the buffer is revoked;
+	 *    stop/exit if so.
+	 *  - If we got in first, the buffer is not revoked so vdev is
+	 *    non-NULL, accessible, and cleanup _has not yet put the
+	 *    VFIO device registration_.  So, the device refcount must
+	 *    be >0.
+	 *
+	 * 2. Take vfio_device registration (refcount guaranteed >0
+	 *    hereafter).
+	 *
+	 * 3. Unlock the DMABUF's resv lock:
+	 *  - A racing cleanup can now complete.
+	 *  - But, the device refcount >0, meaning the vfio_device
+	 *    (and vfio_pcie_core device vdev) have not yet been
+	 *    freed.  vdev is accessible, even if the DMABUF has been
+	 *    revoked or cleanup has happened, because
+	 *    vfio_unregister_group_dev() can't complete.
+	 *
+	 * 4. Take the vdev->memory_lock
+	 *  - Either the DMABUF is usable, or has been cleaned up.
+	 *    Whichever, it can no longer change under us.
+	 *  - Test the DMABUF revocation status again: if it was
+	 *    revoked between 1 and 4 return a SIGBUS. Otherwise,
+	 *    return a PFN.
+	 *  - It's not necessary to also take the resv lock, because
+	 *    the status/vdev can't change while memory_lock is held.
+	 *
+	 * 5. Unlock, done.
 	 */
+
+	dma_resv_lock(priv->dmabuf->resv, NULL);
+
+	if (priv->revoked) {
+		pr_debug_ratelimited("%s VA 0x%lx, pgoff 0x%lx: DMABUF revoked/cleaned up\n",
+				     __func__, vmf->address, vma->vm_pgoff);
+		dma_resv_unlock(priv->dmabuf->resv);
+		return VM_FAULT_SIGBUS;
+	}
+
+	/* If the buffer isn't revoked, vdev is valid */
 	vdev = priv->vdev;
 
+	if (!vfio_device_try_get_registration(&vdev->vdev)) {
+		/*
+		 * If vdev != NULL (above), the registration should
+		 * already be >0 and so this try_get should never
+		 * fail.
+		 */
+		dev_warn(&vdev->pdev->dev, "%s: Unexpected registration failure\n",
+			 __func__);
+		dma_resv_unlock(priv->dmabuf->resv);
+		return VM_FAULT_SIGBUS;
+	}
+	dma_resv_unlock(priv->dmabuf->resv);
+
 	scoped_guard(rwsem_read, &vdev->memory_lock) {
+		/* Revocation status must be re-read, under memory_lock */
 		if (!priv->revoked) {
 			int pres = vfio_pci_dma_buf_find_pfn(priv, vma,
 							     vmf->address,
@@ -1770,6 +1831,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 			    __func__, order, pfn, vmf->address,
 			    vma->vm_pgoff, (unsigned int)ret);
 
+	vfio_device_put_registration(&vdev->vdev);
 	return ret;
 }
 
@@ -1785,6 +1847,11 @@ static const struct vm_operations_struct vfio_pci_mmap_ops = {
 #endif
 };
 
+void vfio_pci_set_vma_ops(struct vm_area_struct *vma)
+{
+	vma->vm_ops = &vfio_pci_mmap_ops;
+}
+
 int vfio_pci_core_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma)
 {
 	struct vfio_pci_core_device *vdev =
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 08c56e2803ad..50b713249341 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -27,6 +27,39 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 
 	return 0;
 }
+
+static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+
+	/*
+	 * dma_buf_mmap_internal() has asserted that the VMA is
+	 * contained within the DMABUF size before calling this.
+	 *
+	 * Also, if we observe that the buffer is revoked now then
+	 * refuse the mmap().  This is a belt-and-braces early failure
+	 * to ease debugging a revoked buffer being used.  Userspace
+	 * might also race an mmap() against an explicit revocation,
+	 * or an action doing a temporary revoke; race scenarios are
+	 * still safe because the fault handler ultimately prevents
+	 * access to a revoked buffer if it isn't caught here.
+	 */
+	if (READ_ONCE(priv->revoked))
+		return -ENODEV;
+	if ((vma->vm_flags & VM_SHARED) == 0)
+		return -EINVAL;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
+	/* See comments in vfio_pci_core_mmap() re VM_ALLOW_ANY_UNCACHED. */
+	vm_flags_set(vma, VM_ALLOW_ANY_UNCACHED | VM_IO | VM_PFNMAP |
+		     VM_DONTEXPAND | VM_DONTDUMP);
+	vma->vm_private_data = priv;
+	vfio_pci_set_vma_ops(vma);
+
+	return 0;
+}
 #endif /* CONFIG_VFIO_PCI_DMABUF */
 
 static void vfio_pci_dma_buf_done(struct kref *kref)
@@ -94,6 +127,7 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
 #ifdef CONFIG_VFIO_PCI_DMABUF
 	.attach = vfio_pci_dma_buf_attach,
+	.mmap = vfio_pci_dma_buf_mmap,
 #endif
 	.map_dma_buf = vfio_pci_dma_buf_map,
 	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index a8671d63b9ca..c3fa35381679 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -141,6 +141,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 				   unsigned int res_index);
 void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
 void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
+void vfio_pci_set_vma_ops(struct vm_area_struct *vma);
 
 #ifdef CONFIG_VFIO_PCI_DMABUF
 int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
-- 
2.50.1 (Apple Git-155)



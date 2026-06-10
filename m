Return-Path: <linux-media+bounces-64481-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TMbgHhyLKWpeZAMAu9opvQ
	(envelope-from <linux-media+bounces-64481-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:04:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E966B258
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:04:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=G1xPYaIJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64481-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64481-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90CE63130584
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC1D4968FD;
	Wed, 10 Jun 2026 15:44:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DEB4A341D;
	Wed, 10 Jun 2026 15:44:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106292; cv=none; b=C91nyIONI6NgGIIVz7u3JjcWpjnXRd91VTAQu2W/GgzGEZ0k+AiUnMt3Pqw9pDnswtmUFrm/kQNxpv7owht6rVXmiEQ/6RBemxyJ6x1JosWJTO1s0yAxj5UP2xdj05QIY+4nwOSWGWczGBkMLUH+lpGSieZOhKjLDb1B7GMzN68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106292; c=relaxed/simple;
	bh=1UPy0+jstqjozkkX6bUdRaUaC838rs1Kx+yzHzv8bfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gOf1OMah8wLxNxMAa32C1hJ5VabM/fO18+YcYzM0RPt7kc2sPwTtk5ppYUbzDJtu1EXAE4UREF3/Kco6xQ9BNNrAtHDzTsS492kcs1ueNoISbP1nbasuSe6/kJwEObMH2tboJKoxSuSiSylDnFHd4dCOCgFN5VtXK4xPLLf/fDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=G1xPYaIJ; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1781106289;
	bh=aJyeen9kINDBKg2wPtns9G/7s9pY4peP7oa0tgvXC78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G1xPYaIJr9vxtUE/ibBG5tg6dCKe4UiKcBx0vyo7O0zdx1PnR94FH26yjivk4SeC1
	 MB3ZPTrxC3VjKblW1TmtGkez5JrEAF3ZJb9sCnKVB1yG/gAYZ+OdSELrQT/BqbiQvU
	 cBq0BhfU8GYV2uZOMysU1sq81oXmft9smQwMNxZ8+uV02oc65we2Vmc+jHfabiPZhU
	 An+9C7Ugr6838PXx3XopVZO//iiipJb8vSCndaCRXymfgeRljC5+HvERdxX97z26Ng
	 sX/BohZdS0ACF/xx59/bKW+VVLs0jsYzRbpyWvtxTzwGnD3ECh6LFPNSdebWVWgwKx
	 dAFLBDKbY7tpg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gb98034lDz4wck;
	Thu, 11 Jun 2026 01:44:48 +1000 (AEST)
From: Matt Evans <matt@ozlabs.org>
To: Alex Williamson <alex@shazbot.org>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>
Cc: Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v3 7/9] vfio/pci: Support mmap() of a VFIO DMABUF
Date: Wed, 10 Jun 2026 16:43:21 +0100
Message-ID: <20260610154327.37758-8-matt@ozlabs.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610154327.37758-1-matt@ozlabs.org>
References: <20260610154327.37758-1-matt@ozlabs.org>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64481-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ozlabs.org:dkim,ozlabs.org:email,ozlabs.org:mid,ozlabs.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C6E966B258

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
 drivers/vfio/pci/vfio_pci_core.c   | 80 ++++++++++++++++++++++++++----
 drivers/vfio/pci/vfio_pci_dmabuf.c | 36 ++++++++++++++
 drivers/vfio/pci/vfio_pci_priv.h   |  2 +
 3 files changed, 109 insertions(+), 9 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 5ea0bd4e7876..508a5eca910a 100644
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
@@ -1735,19 +1737,78 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
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
@@ -1766,6 +1827,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 			    __func__, order, pfn, vmf->address,
 			    vma->vm_pgoff, (unsigned int)ret);
 
+	vfio_device_put_registration(&vdev->vdev);
 	return ret;
 }
 
@@ -1774,7 +1836,7 @@ static vm_fault_t vfio_pci_mmap_page_fault(struct vm_fault *vmf)
 	return vfio_pci_mmap_huge_fault(vmf, 0);
 }
 
-static const struct vm_operations_struct vfio_pci_mmap_ops = {
+const struct vm_operations_struct vfio_pci_mmap_ops = {
 	.fault = vfio_pci_mmap_page_fault,
 #ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
 	.huge_fault = vfio_pci_mmap_huge_fault,
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 8f7f1b909b94..2fb09a2c0f6b 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -27,6 +27,41 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 
 	return 0;
 }
+
+static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+
+	/*
+	 * If we observe that the buffer is revoked now then refuse
+	 * the mmap().  This is a belt-and-braces early failure to
+	 * ease debugging a revoked buffer being used.  Userspace
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
+	/*
+	 * dma_buf_mmap_internal() has asserted that the VMA is
+	 * contained within the DMABUF size before calling this.
+	 */
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
+	/* See comments in vfio_pci_core_mmap() re VM_ALLOW_ANY_UNCACHED. */
+	vm_flags_set(vma, VM_ALLOW_ANY_UNCACHED | VM_IO | VM_PFNMAP |
+		     VM_DONTEXPAND | VM_DONTDUMP);
+	vma->vm_private_data = priv;
+	vma->vm_ops = &vfio_pci_mmap_ops;
+
+	return 0;
+}
 #endif /* CONFIG_VFIO_PCI_DMABUF */
 
 static void vfio_pci_dma_buf_done(struct kref *kref)
@@ -94,6 +129,7 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
 #ifdef CONFIG_VFIO_PCI_DMABUF
 	.attach = vfio_pci_dma_buf_attach,
+	.mmap = vfio_pci_dma_buf_mmap,
 #endif
 	.map_dma_buf = vfio_pci_dma_buf_map,
 	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index 10833aabd7fb..db2e2aeae88f 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -38,6 +38,8 @@ struct vfio_pci_dma_buf {
 	u8 revoked : 1;
 };
 
+extern const struct vm_operations_struct vfio_pci_mmap_ops;
+
 bool vfio_pci_intx_mask(struct vfio_pci_core_device *vdev);
 void vfio_pci_intx_unmask(struct vfio_pci_core_device *vdev);
 
-- 
2.50.1 (Apple Git-155)



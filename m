Return-Path: <linux-media+bounces-58892-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E66OFLi4GlhnAAAu9opvQ
	(envelope-from <linux-media+bounces-58892-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:21:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C6040EB44
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8400304EF26
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CCB3CE4A7;
	Thu, 16 Apr 2026 13:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="OP2wVGOM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963713CD8CD;
	Thu, 16 Apr 2026 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345549; cv=none; b=KyoK4+3QEpORngduervsNuqF4M6TYmEiG2xJAXaIwCRH0Zq0EwtXOq7LHypNOEMPNsoygAVOqTxs67ZhMAdeTpmVQlHA1wRDVrdqju4gduWm2i9kV80z3+mIRtvadgBnuubK4Xh6YTtGa0XLvI2bfBy5cCjm1Udsg4C9Ssnxl3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345549; c=relaxed/simple;
	bh=Py81t9gRcyVUn+lsnKR5DaErrwZGJfKWsIomqtXuuJs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W4lE+3+Z7U5I7aO2aenz7GgC2MaY+yPnjpeb4zl4DTxadKM1ICjIHKbeOXDtIKcUqBZUlLHh7boNujP11In8wgB21OMhfl3xzaGdyaeykx6NkR4u6K2I8IXH6yFEpaMrNB2kZ94rhWxxUjxXlb4cefMthAwPWNoklAoeT1Aih8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=OP2wVGOM; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FM0WG32967981;
	Thu, 16 Apr 2026 06:18:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=kXoTGsoetkek2MAn+6LONZFFTzQ7WxVN5lvdEQHBxVM=; b=OP2wVGOMM/+Z
	Osvc6nvoWnS5BK+tCkG5TnDs6+ifwPRcQ1d0kKO/u4C4ul7MaxOAnZ1qmPl63EFC
	UN/dqbldWbfqrhBpyU0WnTZB6dQoPYN+NAcMwYyzYcxYCu0nZpV4ANWH2xYiW/3J
	ZvzA8iOG2EuYC8zsN3Mp2hEizUrpyR8IYJ96kgqWs3jZE1jF5pBhiQIKFpY9I0pk
	Pt1rRfhjXaHSq7bA5FB4w9pfpfUDI8wOpxCbjkuoN8QiL4corIWOPeQyBToZubHS
	8F2x64cTt6uSugktelH8SduInIjzWvBlxeXQQax3zduVdcAjano2PSQqn1kGbzUn
	EMQ/CgLL3w==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dh86521k7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Apr 2026 06:18:50 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::2d) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Thu, 16 Apr
 2026 13:18:49 +0000
From: Matt Evans <mattev@meta.com>
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
CC: Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal
	<ankita@nvidia.com>,
        Pranjal Shrivastava <praan@google.com>,
        Alistair Popple
	<apopple@nvidia.com>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <kvm@vger.kernel.org>
Subject: [PATCH 7/9] vfio/pci: Support mmap() of a VFIO DMABUF
Date: Thu, 16 Apr 2026 06:17:50 -0700
Message-ID: <20260416131815.2729131-8-mattev@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260416131815.2729131-1-mattev@meta.com>
References: <20260416131815.2729131-1-mattev@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PJ8/P/qC c=1 sm=1 tr=0 ts=69e0e1ba cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=xtH7KyWI9dI7BmFOsl-x:22 a=VabnemYjAAAA:8 a=KDxd6JyZDO1E9H-QfAEA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: iQnS-hDi1kQgsb64GoSQSz5lL8o7V5EU
X-Proofpoint-ORIG-GUID: iQnS-hDi1kQgsb64GoSQSz5lL8o7V5EU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyNyBTYWx0ZWRfX8/4gRa9wzHUf
 RjjzET/LDVWLNjfifzxIIn/Sbimr/o3ddfvj7x0uC4DH8n+rW0sS9v5E5L3CKBGizcyaw6NMzmQ
 l+PclLlDdc0aqBwpcTz9x4M19vYIxfZTl0eKJVzJYrOTanAQwh/TCT2LPDyQTO7bQ/JBW9MOlI2
 ypbiNhtkGkVbvLr2c7+N/nHzVZNBgNa6YC3n1p3f6oCWeYNqmeJkSuS6rhkSA4s7PFNuzW32cCv
 paF7C+bCOACqGwDj/ni/e1IeLZhXUkFzaVpJie+CLCrI5pDkAzdXkUluOkDN4Uq27zdTulGLzTa
 7n460f2aQbYYcRYHQ3HQc2+GSvvCV8BhJrsvC1g2tEk7OoMmLUed4cKHLqThqc32UE1B1/At/EU
 wG4h8SRF3jIn2+VPNgzoEiRTm+TqYSHWQ5VEgna2JMy2CjhvU+2qAM6Bb6jq+5fkV7wwKU/owfV
 fY7da/FVIgTdA//aWLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-58892-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,meta.com:email,meta.com:dkim,meta.com:mid]
X-Rspamd-Queue-Id: C1C6040EB44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A VFIO DMABUF can export a subset of a BAR to userspace by fd; add
support for mmap() of this fd.  This provides another route for a
process to map BARs, except one where the process can only map a specific
subset of a BAR represented by the exported DMABUF.

mmap() support enables userspace driver designs that safely delegate
access to BAR sub-ranges to other client processes by sharing a DMABUF
fd, without having to share the (omnipotent) VFIO device fd with them.

Since the main VFIO BAR mmap() is now DMABUF-aware, this path reuses
the existing vm_ops.  But, since the lifecycle of an exported DMABUF
is still decoupled from that of the device fd it came from, the device
fd might now be closed concurrent with a VMA fault.

Extra synchronisation is added to deal with the possibility of a fault
racing with the DMABUF cleanup path.  (Note that this differs to a
DMABUF implicitly created on the mmap() path, which holds ownership of
the device fd and so prevents close-during-fault scenarios in order to
maintain the same user-facing behaviour on close.)  It does this by
temporarily taking a VFIO device registration to ensure vdev remains
valid, then vdev->memory_lock can be taken.

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/vfio_pci_core.c   | 79 ++++++++++++++++++++++++++----
 drivers/vfio/pci/vfio_pci_dmabuf.c | 28 +++++++++++
 drivers/vfio/pci/vfio_pci_priv.h   |  2 +
 3 files changed, 99 insertions(+), 10 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 464b63585bef..cad126cf8737 100644
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
@@ -1703,20 +1705,76 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
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
+	 * vfio_pci_dma_buf_cleanup(), meaning priv->vdev might be
+	 * NULL, and the VFIO device registration might have been
+	 * dropped.
+	 *
+	 * With the goal of taking vdev->memory_lock in a world where
+	 * vdev might not still exist:
+	 *
+	 * 1. Take the resv lock on the DMABUF:
+	 *  - If racing cleanup got in first, vdev == NULL and buffer
+	 *    is revoked; stop/exit if so.
+	 *  - If we got in first, vdev is non-NULL, accessible, and
+	 *    cleanup _has not yet put the VFIO device registration_,
+	 *    so the device refcount must be >0.
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
 	vdev = READ_ONCE(priv->vdev);
 
+	if (READ_ONCE(priv->revoked) || !vdev) {
+		pr_debug_ratelimited("%s VA 0x%lx, pgoff 0x%lx: DMABUF revoked/cleaned up\n",
+				     __func__, vmf->address, vma->vm_pgoff);
+		dma_resv_unlock(priv->dmabuf->resv);
+		return VM_FAULT_SIGBUS;
+	}
+	/* vdev is usable */
+
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
-		if (!priv->revoked) {
+		if (!READ_ONCE(priv->revoked)) {
 			int pres = vfio_pci_dma_buf_find_pfn(priv, vma,
 							     vmf->address,
 							     order, &pfn);
@@ -1734,6 +1792,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 				    vma->vm_pgoff, (unsigned int)ret);
 	}
 
+	vfio_device_put_registration(&vdev->vdev);
 	return ret;
 }
 
@@ -1742,7 +1801,7 @@ static vm_fault_t vfio_pci_mmap_page_fault(struct vm_fault *vmf)
 	return vfio_pci_mmap_huge_fault(vmf, 0);
 }
 
-static const struct vm_operations_struct vfio_pci_mmap_ops = {
+const struct vm_operations_struct vfio_pci_mmap_ops = {
 	.fault = vfio_pci_mmap_page_fault,
 #ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
 	.huge_fault = vfio_pci_mmap_huge_fault,
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 04c7733fe712..cc477f46a7d5 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -27,6 +27,33 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 
 	return 0;
 }
+
+static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+	u64 req_len, req_start;
+
+	if (priv->revoked)
+		return -ENODEV;
+	if ((vma->vm_flags & VM_SHARED) == 0)
+		return -EINVAL;
+
+	req_len = vma->vm_end - vma->vm_start;
+	req_start = vma->vm_pgoff << PAGE_SHIFT;
+	if (req_start + req_len > priv->size)
+		return -EINVAL;
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
@@ -94,6 +121,7 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
 #ifdef CONFIG_VFIO_PCI_DMABUF
 	.attach = vfio_pci_dma_buf_attach,
+	.mmap = vfio_pci_dma_buf_mmap,
 #endif
 	.map_dma_buf = vfio_pci_dma_buf_map,
 	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index a8edbee6ce56..f837d6c8bddc 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -37,6 +37,8 @@ struct vfio_pci_dma_buf {
 	u8 revoked : 1;
 };
 
+extern const struct vm_operations_struct vfio_pci_mmap_ops;
+
 bool vfio_pci_intx_mask(struct vfio_pci_core_device *vdev);
 void vfio_pci_intx_unmask(struct vfio_pci_core_device *vdev);
 
-- 
2.47.3



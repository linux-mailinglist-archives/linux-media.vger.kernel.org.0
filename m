Return-Path: <linux-media+bounces-62872-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLdsDwfHFmpVrwcAu9opvQ
	(envelope-from <linux-media+bounces-62872-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:27:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CAE5E2ADE
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFDD630415E1
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0D53F8705;
	Wed, 27 May 2026 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="Qv2+VQdL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459CF8F7D;
	Wed, 27 May 2026 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877465; cv=none; b=VkMLoLBwcV5rXz2tLDvRAHkcyG11KQATo9J9kvNHm4jJGVy0z1JNeb2ReBb4PQCe4j5nBjJgDSUjDEX9yK9FuzS3iwhel85KqR344Cwa3JKpyC7nvvonuu38dZNo876c2XtQNhKMudo8eiFBbtAMgSVHfbiIIYEIZAuOHcI0eK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877465; c=relaxed/simple;
	bh=ncCBVvQTtvDaSl0squf7Wcsrj4qkLgcHdVihZtQlQAU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p7+/epsMN4kdidOY+f3U4TDs+/Z9gomSrINgH0cmBKeejNjcdLB7/EOb+cUQaNIpAzJqUtGF/4gZbN9P2AwSCVs84hn3UHHOPoiGi/VgexKSmD0g1WmfzDpFxhJScfprPOmvIS+CikwVDteDcyfpstoffvNhH9UqL1qI4N5lAS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=Qv2+VQdL; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R3o4pC2171432;
	Wed, 27 May 2026 03:23:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=mMTWJVtqzN8WN4dwueBfEElMWJlOMrlZgPcLhQSbOns=; b=Qv2+VQdLFLoS
	TWkvzBVVzX/ToteJDpPD3TB7BeiWHfw9hOFTitblyXyQzwPmMlKmbqXKFqV6vIh5
	2ixnkO0/6Ip++U3/xt+4xsLCXxUSDrwMHoGa7EyYsXDgSFJnIIhaFHprWs0sMkxd
	qQQH0tbTigGvUiJL7dS8/Cm82HRgYszpPKoEAzNuvJYv3HS5ebOtNwh7ggG4PGu9
	ZN8LoulK0YKHJPBfJ5LuVgOH5yMRj5oXVXhnyZ7XuQjB7HYINgJgbvvGvnN4dv5+
	RgFBhZy00HjSRldH/51MvsXQ4nVZQkl2upfUKZuIMXhUBVCX6TQ8Eyog2xm5Mory
	99XDQOaV6A==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4edpnga4aa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 May 2026 03:23:55 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 27 May
 2026 10:23:54 +0000
From: Matt Evans <mattev@meta.com>
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Bjorn Helgaas
	<bhelgaas@google.com>,
        Logan Gunthorpe <logang@deltatee.com>
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
        <kvm@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: [PATCH v2 7/9] vfio/pci: Support mmap() of a VFIO DMABUF
Date: Wed, 27 May 2026 03:23:10 -0700
Message-ID: <20260527102319.100128-8-mattev@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260527102319.100128-1-mattev@meta.com>
References: <20260527102319.100128-1-mattev@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PoCiWHpBth1VXSDGH90Ek6hz48wd8lLz
X-Authority-Analysis: v=2.4 cv=PME/P/qC c=1 sm=1 tr=0 ts=6a16c63b cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=kkcUborcUVj0H7zxAXTl:22 a=VabnemYjAAAA:8 a=KDxd6JyZDO1E9H-QfAEA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEwMCBTYWx0ZWRfXwCXkhWzkxdJM
 iMIstgE2tPmnMtJy1rlnARPbo25cZyNWE5PS9j8CgG99Z9hXSVCoLJG8WwPFpa/MrUaVzaiLvHx
 EhXAu7HhXOI3xKGexPehDKjZETeXcwqx5TkWAfXOltQIeULa0gbY9Zmd+SjRNmndeSdFjxO9RfL
 GMJpnJjHdzLHi2gCgCUwIACoI43GKBYHel3tYA1+FSJE+EPnp20HdB0hpszKcJG42y0wZ8rzZkl
 N+q5Cqb6KujTqUiec9G/zhZ27KHzc/4r3HuMDnS6FhV/Yg48CI7jl2o7t+tSqNdbR5dPW+tnue2
 RA9YTmylx8h8bJMIYUkuJJy9FL3wHOaQp0oHfEQeyciPkmz+0BwOqY2sji9trsb2FcYvmbSDQgl
 dlPYW7lw3EnIlwRpGbMDMFhoimWYZtMwxaJyUipYVpqQwMLTy/2iJHwxGn6IgMIhQtcnpUTbjM5
 hOMKjRQqTYVz8mhedzA==
X-Proofpoint-ORIG-GUID: PoCiWHpBth1VXSDGH90Ek6hz48wd8lLz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
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
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-62872-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,meta.com:email,meta.com:mid,meta.com:dkim]
X-Rspamd-Queue-Id: D3CAE5E2ADE
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
 drivers/vfio/pci/vfio_pci_dmabuf.c | 27 ++++++++++
 drivers/vfio/pci/vfio_pci_priv.h   |  2 +
 3 files changed, 99 insertions(+), 9 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index cfea59806a4f..41e049fa9a8a 100644
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
@@ -1742,19 +1744,77 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
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
 	vdev = READ_ONCE(priv->vdev);
 
+	if (priv->revoked || !vdev) {
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
+		/* Revocation status must be re-read, under memory_lock */
 		if (!priv->revoked) {
 			int pres = vfio_pci_dma_buf_find_pfn(priv, vma,
 							     vmf->address,
@@ -1773,6 +1833,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 				    vma->vm_pgoff, (unsigned int)ret);
 	}
 
+	vfio_device_put_registration(&vdev->vdev);
 	return ret;
 }
 
@@ -1781,7 +1842,7 @@ static vm_fault_t vfio_pci_mmap_page_fault(struct vm_fault *vmf)
 	return vfio_pci_mmap_huge_fault(vmf, 0);
 }
 
-static const struct vm_operations_struct vfio_pci_mmap_ops = {
+const struct vm_operations_struct vfio_pci_mmap_ops = {
 	.fault = vfio_pci_mmap_page_fault,
 #ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
 	.huge_fault = vfio_pci_mmap_huge_fault,
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 733607371082..4b3b15655f1d 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -27,6 +27,32 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 
 	return 0;
 }
+
+static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+
+	if (priv->revoked)
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
@@ -94,6 +120,7 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
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
2.47.3



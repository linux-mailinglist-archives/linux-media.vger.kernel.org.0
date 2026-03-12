Return-Path: <linux-media+bounces-55528-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJirD/IKs2kMRwAAu9opvQ
	(envelope-from <linux-media+bounces-55528-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:50:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA95827755B
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D7D1321BEEE
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416C83FFABB;
	Thu, 12 Mar 2026 18:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="vZQUqDmr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4512D6E6C;
	Thu, 12 Mar 2026 18:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341217; cv=none; b=sRn5Ggbk5ZoBbmgZsw3m2wTksk1ua8AP6Pj0Mtsi0fYxT07SXO5SLziRYXBwK+jVFH5hYTfhgmvnc6BhQdonmiuJS4AEKX5Ci69+DPL/urh+4LgY7O3wV1PZuCM2blV2SGINwAffLczxarFvsNKUH8oixTNakcGqFeNXj5C0Tdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341217; c=relaxed/simple;
	bh=rdm1w5qspSSlVXdGgJm7AT3pPM1P3uGk48Z/3E6fMmo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d/pzt0yiWxuuxCwXAEN+BklyqInLOj8j/YvQ7qow7vG55t82uINZ5xnxJESECH2a5AByQqxI+4606v1uqE6klwbdxdC49l4+8aNB8UljamhZleeJU77uyc08Le/+enfEIEZOZM8YH3ocvlg6CAwjj5XJorV2jAjdUvFkN8gvDZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=vZQUqDmr; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 62CHL0IC3607800;
	Thu, 12 Mar 2026 11:46:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=jMiaUo8paSIO6PvAm6fwqjCbL0AMR9nz9Pv6QzgxClo=; b=vZQUqDmrPRzH
	aby+BVb+xSnrlRlkIPf1HPM5AjklHUdl/1MyVvaCNwZhzzzieBnf5sImbjpSLOMK
	hVPOCjrcKIFDKqNskM72BJD+6BYLU/xVRl7XO5NohqbIACQn4DkZvcTdlrvf+yJa
	eu3A5OXJKhKrnz4k/YGx0/bc0DxwErZH7Mec6a4U0mewhODAduqSsh2q846AoIeA
	aSO315SG60eWA2SlyK0Fy2qhSzhMOzzQtzJ5pMdr8pU2EGg4cg8KXwtk9bQFhA/P
	hVwabFDY+IoiXw69FDUrYegRG88qA/blMh3HMWNfMv8aR5etBynKs6p20Uxe0tvR
	HMY4UpIQWg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by m0089730.ppops.net (PPS) with ESMTPS id 4cv1te9t9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 11:46:41 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 12 Mar
 2026 18:46:39 +0000
From: Matt Evans <mattev@meta.com>
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
        Mahmoud Adam
	<mngyadam@amazon.de>,
        David Matlack <dmatlack@google.com>
CC: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>,
        Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal
	<ankita@nvidia.com>,
        Pranjal Shrivastava <praan@google.com>,
        Alistair Popple
	<apopple@nvidia.com>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <kvm@vger.kernel.org>
Subject: [RFC v2 PATCH 05/10] vfio/pci: Convert BAR mmap() to use a DMABUF
Date: Thu, 12 Mar 2026 11:46:03 -0700
Message-ID: <20260312184613.3710705-6-mattev@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260312184613.3710705-1-mattev@meta.com>
References: <20260312184613.3710705-1-mattev@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MSBTYWx0ZWRfXyhmrcqMaf9cL
 A3pNUN53l2yWME+vnW47eHfegXVnnGkUNJ12uX+gGA3qWRiAzNMOhgPCNhheaMbiSyZb3eG3abu
 DaIi9rYLAfD51G4mcx6iOKMhi1opTwFUSE+aMP1Li6FOlOt7AwDWCNbVv+SDoVPCrpbEAWa9tHm
 +65vpSUPPJmp7W+cB+q1+uRvGLaQXkaLgz/tfSvcDJQ6N4shRNITg3nuZ0UYoTNigNrZ/or+UO0
 Eu5pem7UtNy8VjEOFCVk8Clx+u9mDumD5/Ukto3sV7ZipjwKnEHCHzJn1lKEFuKufEaMmYpC6Qt
 Nmy1YnUx55KtI5L2iKOx00sP1uI4aWKqeEuvA3JngTZrYaRT2sqkLIeCep16JR9mwAtcr6UAO7v
 DNLob3grQ6rEvv2pOoVphcQnE6et93gD6IF4Ec9vbgI55t9X3R9ejR8SAJX0Pf1PGq9wQAiSaZU
 PivFcd8n3ak7RJa6vpA==
X-Proofpoint-ORIG-GUID: ieEjwAOBeG8b1DGaKPt6nf1RNWsafjwu
X-Authority-Analysis: v=2.4 cv=QoJTHFyd c=1 sm=1 tr=0 ts=69b30a11 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=855S8uPTkML1Oy45N9_h:22 a=VabnemYjAAAA:8 a=KljUu2FEy107lt1Px6sA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: ieEjwAOBeG8b1DGaKPt6nf1RNWsafjwu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55528-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[meta.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: AA95827755B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the VFIO device fd fops->mmap to create a DMABUF representing
the BAR mapping, and make the VMA fault handler look up PFNs from the
corresponding DMABUF.  This supports future code mmap()ing BAR
DMABUFs, and iommufd work to support Type1 P2P.

First, vfio_pci_core_mmap() uses the new
vfio_pci_core_mmap_prep_dmabuf() helper to export a DMABUF
representing a single BAR range.  Then, the vfio_pci_mmap_huge_fault()
callback is updated to understand revoked buffers, and uses the new
vfio_pci_dma_buf_find_pfn() helper to determine the PFN for a given
fault address.

Now that the VFIO DMABUFs can be mmap()ed, vfio_pci_dma_buf_move() and
vfio_pci_dma_buf_cleanup() need to zap PTEs on revocation and cleanup
paths.

CONFIG_VFIO_PCI_CORE now unconditionally depends on
CONFIG_DMA_SHARED_BUFFER.  CONFIG_VFIO_PCI_DMABUF remains, to
conditionally include support for VFIO_DEVICE_FEATURE_DMA_BUF, and
depends on CONFIG_PCI_P2PDMA.

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/Kconfig           |  3 +-
 drivers/vfio/pci/Makefile          |  3 +-
 drivers/vfio/pci/vfio_pci_core.c   | 73 ++++++++++++++++++++----------
 drivers/vfio/pci/vfio_pci_dmabuf.c | 14 ++++++
 drivers/vfio/pci/vfio_pci_priv.h   | 11 +----
 5 files changed, 67 insertions(+), 37 deletions(-)

diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index 1e82b44bda1a..bf5c64d1fe22 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -6,6 +6,7 @@ config VFIO_PCI_CORE
 	tristate
 	select VFIO_VIRQFD
 	select IRQ_BYPASS_MANAGER
+	select DMA_SHARED_BUFFER
 
 config VFIO_PCI_INTX
 	def_bool y if !S390
@@ -56,7 +57,7 @@ config VFIO_PCI_ZDEV_KVM
 	  To enable s390x KVM vfio-pci extensions, say Y.
 
 config VFIO_PCI_DMABUF
-	def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
+	def_bool y if PCI_P2PDMA
 
 source "drivers/vfio/pci/mlx5/Kconfig"
 
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index e0a0757dd1d2..bab7a33a2b31 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -1,8 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
+vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o vfio_pci_dmabuf.o
 vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
-vfio-pci-core-$(CONFIG_VFIO_PCI_DMABUF) += vfio_pci_dmabuf.o
 obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
 
 vfio-pci-y := vfio_pci.o
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index f9ed3374d268..41224efa58d8 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1648,18 +1648,6 @@ void vfio_pci_memory_unlock_and_restore(struct vfio_pci_core_device *vdev, u16 c
 	up_write(&vdev->memory_lock);
 }
 
-static unsigned long vma_to_pfn(struct vm_area_struct *vma)
-{
-	struct vfio_pci_core_device *vdev = vma->vm_private_data;
-	int index = vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
-	u64 pgoff;
-
-	pgoff = vma->vm_pgoff &
-		((1U << (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
-
-	return (pci_resource_start(vdev->pdev, index) >> PAGE_SHIFT) + pgoff;
-}
-
 vm_fault_t vfio_pci_vmf_insert_pfn(struct vfio_pci_core_device *vdev,
 				   struct vm_fault *vmf,
 				   unsigned long pfn,
@@ -1692,23 +1680,45 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 					   unsigned int order)
 {
 	struct vm_area_struct *vma = vmf->vma;
-	struct vfio_pci_core_device *vdev = vma->vm_private_data;
-	unsigned long addr = vmf->address & ~((PAGE_SIZE << order) - 1);
-	unsigned long pgoff = (addr - vma->vm_start) >> PAGE_SHIFT;
-	unsigned long pfn = vma_to_pfn(vma) + pgoff;
+	struct vfio_pci_dma_buf *priv = vma->vm_private_data;
+	struct vfio_pci_core_device *vdev;
+	unsigned long pfn;
 	vm_fault_t ret = VM_FAULT_FALLBACK;
+	int pres;
+
+	vdev = READ_ONCE(priv->vdev);
 
-	if (is_aligned_for_order(vma, addr, pfn, order)) {
-		scoped_guard(rwsem_read, &vdev->memory_lock)
-			ret = vfio_pci_vmf_insert_pfn(vdev, vmf, pfn, order);
+	/*
+	 * A fault might occur after vfio_pci_dma_buf_cleanup() has
+	 * revoked and destroyed the vdev's DMABUFs, and annulled
+	 * vdev.  After creation, vdev is only ever written in
+	 * cleanup.
+	 */
+	if (!vdev)
+		return VM_FAULT_SIGBUS;
+
+	pres = vfio_pci_dma_buf_find_pfn(priv, vma, vmf->address, order, &pfn);
+
+	if (pres == 0) {
+		scoped_guard(rwsem_read, &vdev->memory_lock) {
+			/*
+			 * A buffer's revocation/unmap and status
+			 * change occurs whilst holding memory_lock,
+			 * so protects against racing faults.
+			 */
+			if (priv->revoked)
+				ret = VM_FAULT_SIGBUS;
+			else
+				ret = vfio_pci_vmf_insert_pfn(vdev, vmf, pfn, order);
+		}
+	} else if (pres != -EAGAIN) {
+		ret = VM_FAULT_SIGBUS;
 	}
 
 	dev_dbg_ratelimited(&vdev->pdev->dev,
-			   "%s(,order = %d) BAR %ld page offset 0x%lx: 0x%x\n",
-			    __func__, order,
-			    vma->vm_pgoff >>
-				(VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT),
-			    pgoff, (unsigned int)ret);
+			    "%s(order = %d) PFN 0x%lx, VA 0x%lx, pgoff 0x%lx: 0x%x\n",
+			    __func__, order, pfn, vmf->address, vma->vm_pgoff,
+			    (unsigned int)ret);
 
 	return ret;
 }
@@ -1773,7 +1783,20 @@ int vfio_pci_core_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma
 	if (ret)
 		return ret;
 
-	vma->vm_private_data = vdev;
+	/*
+	 * Create a DMABUF with a single range corresponding to this
+	 * mapping, and wire it into vma->vm_private_data.  The VMA's
+	 * vm_file becomes that of the DMABUF, and the DMABUF takes
+	 * ownership of the VFIO device file (put upon DMABUF
+	 * release).  This maintains the behaviour of a live VMA
+	 * mapping holding the VFIO device file open.
+	 */
+	ret = vfio_pci_core_mmap_prep_dmabuf(vdev, vma,
+					     pci_resource_start(pdev, index),
+					     pgoff, req_len);
+	if (ret)
+		return ret;
+
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 76db340ba592..197f50365ee1 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -9,6 +9,7 @@
 
 MODULE_IMPORT_NS("DMA_BUF");
 
+#ifdef CONFIG_VFIO_PCI_DMABUF
 static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 				   struct dma_buf_attachment *attachment)
 {
@@ -25,6 +26,7 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 
 	return 0;
 }
+#endif /* CONFIG_VFIO_PCI_DMABUF */
 
 static void vfio_pci_dma_buf_done(struct kref *kref)
 {
@@ -89,7 +91,9 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 }
 
 static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
+#ifdef CONFIG_VFIO_PCI_DMABUF
 	.attach = vfio_pci_dma_buf_attach,
+#endif
 	.map_dma_buf = vfio_pci_dma_buf_map,
 	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
 	.release = vfio_pci_dma_buf_release,
@@ -219,6 +223,7 @@ static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
 	return 0;
 }
 
+#ifdef CONFIG_VFIO_PCI_DMABUF
 /*
  * This is a temporary "private interconnect" between VFIO DMABUF and iommufd.
  * It allows the two co-operating drivers to exchange the physical address of
@@ -428,6 +433,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	kfree(dma_ranges);
 	return ret;
 }
+#endif /* CONFIG_VFIO_PCI_DMABUF */
 
 int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 				   struct vm_area_struct *vma,
@@ -490,6 +496,10 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 	struct vfio_pci_dma_buf *tmp;
 
 	lockdep_assert_held_write(&vdev->memory_lock);
+	/*
+	 * Holding memory_lock ensures a racing VMA fault observes
+	 * priv->revoked properly.
+	 */
 
 	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
 		if (!get_file_active(&priv->dmabuf->file))
@@ -507,6 +517,8 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 			if (revoked) {
 				kref_put(&priv->kref, vfio_pci_dma_buf_done);
 				wait_for_completion(&priv->comp);
+				unmap_mapping_range(priv->dmabuf->file->f_mapping,
+						    0, priv->size, 1);
 			} else {
 				/*
 				 * Kref is initialize again, because when revoke
@@ -550,6 +562,8 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 		dma_resv_unlock(priv->dmabuf->resv);
 		kref_put(&priv->kref, vfio_pci_dma_buf_done);
 		wait_for_completion(&priv->comp);
+		unmap_mapping_range(priv->dmabuf->file->f_mapping,
+				    0, priv->size, 1);
 		vfio_device_put_registration(&vdev->vdev);
 		fput(priv->dmabuf->file);
 	}
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index 5fd3a6e00a0e..37ece9b4b5bd 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -132,13 +132,13 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
 int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 				   struct vm_area_struct *vma,
 				   u64 phys_start, u64 pgoff, u64 req_len);
+void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
+void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
 
 #ifdef CONFIG_VFIO_PCI_DMABUF
 int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 				  struct vfio_device_feature_dma_buf __user *arg,
 				  size_t argsz);
-void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
-void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
 #else
 static inline int
 vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
@@ -147,13 +147,6 @@ vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 {
 	return -ENOTTY;
 }
-static inline void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
-{
-}
-static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev,
-					 bool revoked)
-{
-}
 #endif
 
 #endif
-- 
2.47.3



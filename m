Return-Path: <linux-media+bounces-58890-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMj/HEjj4GmcnAAAu9opvQ
	(envelope-from <linux-media+bounces-58890-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:25:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E862E40EC80
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41ED831B16A0
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9FE3CA4A1;
	Thu, 16 Apr 2026 13:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="PbmtBS8U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5D03B95F8;
	Thu, 16 Apr 2026 13:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345540; cv=none; b=OgrvInYWGuGoMyaxMzeGzilc62GDzpuPkizDccTvakZuGoBqDp2CbJxUGZRn624Uat86UK5UNJNml06A0GDbEkkJZ590x3qe1crFhn/FTt6h8nLe3nFwTFOBwnPq989plDOb3Ac5McmnZ205V91ctzgtdohuK21mCsRSZNz8hiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345540; c=relaxed/simple;
	bh=ZLFYviURK0Jo5iJa3jn+hbjPLtjzafodUV7KOzOUSq4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QCgZOXLIEVkae0pkIeEP5dKg9cJJ4bDhday7kP4l4t8L4y3GrxwVmml4mp73YjjSazV/ytq7sjEecol2DRljjtF2S8+Ixp5XWbYVt7/6t9MZXqBtdIYurGw/pVU41ypaosbyHRgBriRMkvnT/6NlThv5yVFHn58at+Igehsbqdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=PbmtBS8U; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G0Fkku3059899;
	Thu, 16 Apr 2026 06:18:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=xcqwl6TFNi9lbH5ZbEfmbrASxld9aPm7XILdLR5hDuE=; b=PbmtBS8UVhGy
	7/ikrQLR1jDE8fdoVXr/Dn78NV5SXkwEVI35WOop8savYDliIr9MAUqru5AJNndg
	pgBnvyBtMONl4gchK4PbYtbBrGWBFsCdHvMAD1MdMAj7cqhdb1cZQqybY+DBRd0j
	q9lRVEUSSviDD3Y3sKQRfnQgNZ2tSOoI9MnlCtT1243yXHZtnPICG9sGCo2NbI7A
	8OVZl7rCipzeX4UZAMenERYzWijk6TrtRG90pLbGCkn5X97I9X4pvD14N+BFXWjU
	L0k5jPYGCFLKzAEzG0vEMHWpgXhKNOLCLsHqf2ds2OxHZDY9Uf6/O9EanZZ3BPrq
	8zeBAoVOXA==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dh84x1sr8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Apr 2026 06:18:43 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::8e35) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Thu, 16 Apr
 2026 13:18:41 +0000
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
Subject: [PATCH 4/9] vfio/pci: Convert BAR mmap() to use a DMABUF
Date: Thu, 16 Apr 2026 06:17:47 -0700
Message-ID: <20260416131815.2729131-5-mattev@meta.com>
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
X-Proofpoint-GUID: 5wG2NqFMX-CSQTPQEWwcr7atughMWOTQ
X-Proofpoint-ORIG-GUID: 5wG2NqFMX-CSQTPQEWwcr7atughMWOTQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyNyBTYWx0ZWRfX8eTe3XWZIs1V
 4OveRSM3MIECkcsD80wWvzRc1bmIHRlwK4J84yVihsm5heBwuJc/hQkLGLGPWlrlyve5RyN13FU
 uRGK2ge2H9DsPHljVseFQTNJt7mdUUXJFUeM5tPDQh79lqLzNxHPJv1VxkSR7wf06wKQ7VoG0tT
 bryDGV8kVi/UKAL5DDVNNZQCgln1+RNLGSE9NSIn0mvSsrcvImgO6IVTWdtOaOUG+SJ+blfzbtZ
 ugzSfg0+YIXYlsOHwGpAH+4m5uIUL3O7M5ZpQAPpTEbPVGgPiCs3JeofQInwkUi2hENpRaFMTZL
 kIgVTR6kQJCMdSo0SMFA79VFErhv6J++ItVrpN2Bc5TbLyPPiPvVLHlpAGwHQfd0NtuspbyzlfB
 A2U4zyIJgZ96O0NeBhM3gS6or7eToQdwNxSdpQaCda+nL7G5i/Tw6Zf9RCFA/ZLNPW+eVxFfD6A
 ROWkeoHyj5iOXcYss0A==
X-Authority-Analysis: v=2.4 cv=aepRWxot c=1 sm=1 tr=0 ts=69e0e1b3 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=tpM8CJlwf7uhpglF1g9U:22 a=VabnemYjAAAA:8 a=kVk1raE1mBRInjEOdVoA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
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
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-58890-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,meta.com:email,meta.com:dkim,meta.com:mid]
X-Rspamd-Queue-Id: E862E40EC80
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
 drivers/vfio/pci/vfio_pci_core.c   | 86 ++++++++++++++++++------------
 drivers/vfio/pci/vfio_pci_dmabuf.c | 14 +++++
 drivers/vfio/pci/vfio_pci_priv.h   | 11 +---
 5 files changed, 71 insertions(+), 46 deletions(-)

diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index 296bf01e185e..2074f2a941e1 100644
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
index 6138f1bf241d..881452ea89be 100644
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
index 4e9091e5fcc2..c00a61d61250 100644
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
@@ -1687,23 +1675,42 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 					   unsigned int order)
 {
 	struct vm_area_struct *vma = vmf->vma;
-	struct vfio_pci_core_device *vdev = vma->vm_private_data;
-	unsigned long addr = vmf->address & ~((PAGE_SIZE << order) - 1);
-	unsigned long pgoff = (addr - vma->vm_start) >> PAGE_SHIFT;
-	unsigned long pfn = vma_to_pfn(vma) + pgoff;
-	vm_fault_t ret = VM_FAULT_FALLBACK;
-
-	if (is_aligned_for_order(vma, addr, pfn, order)) {
-		scoped_guard(rwsem_read, &vdev->memory_lock)
-			ret = vfio_pci_vmf_insert_pfn(vdev, vmf, pfn, order);
-	}
+	struct vfio_pci_dma_buf *priv = vma->vm_private_data;
+	struct vfio_pci_core_device *vdev;
+	unsigned long pfn = 0;
+	vm_fault_t ret = VM_FAULT_SIGBUS;
+
+	/*
+	 * We can rely on the existence of both a DMABUF (priv) and
+	 * the VFIO device it was exported from (vdev).  This fault's
+	 * VMA was established using vfio_pci_core_mmap_prep_dmabuf()
+	 * which transfers ownership of the VFIO device fd to the
+	 * DMABUF, and so the VFIO device is held open because the
+	 * VMA's vm_file (DMABUF) is open.
+	 *
+	 * Since vfio_pci_dma_buf_cleanup() cannot have happened,
+	 * vdev must be valid; we can take memory_lock.
+	 */
+	vdev = READ_ONCE(priv->vdev);
+
+	scoped_guard(rwsem_read, &vdev->memory_lock) {
+		if (!priv->revoked) {
+			int pres = vfio_pci_dma_buf_find_pfn(priv, vma,
+							     vmf->address,
+							     order, &pfn);
+
+			if (pres == 0)
+				ret = vfio_pci_vmf_insert_pfn(vdev, vmf,
+							      pfn, order);
+			else if (pres == -EAGAIN)
+				ret = VM_FAULT_FALLBACK;
+		}
 
-	dev_dbg_ratelimited(&vdev->pdev->dev,
-			   "%s(,order = %d) BAR %ld page offset 0x%lx: 0x%x\n",
-			    __func__, order,
-			    vma->vm_pgoff >>
-				(VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT),
-			    pgoff, (unsigned int)ret);
+		dev_dbg_ratelimited(&vdev->pdev->dev,
+				    "%s(order = %d) PFN 0x%lx, VA 0x%lx, pgoff 0x%lx: 0x%x\n",
+				    __func__, order, pfn, vmf->address,
+				    vma->vm_pgoff, (unsigned int)ret);
+	}
 
 	return ret;
 }
@@ -1726,7 +1733,7 @@ int vfio_pci_core_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma
 		container_of(core_vdev, struct vfio_pci_core_device, vdev);
 	struct pci_dev *pdev = vdev->pdev;
 	unsigned int index;
-	u64 phys_len, req_len, pgoff, req_start;
+	u64 phys_len, req_len;
 	int ret;
 
 	index = vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
@@ -1753,11 +1760,9 @@ int vfio_pci_core_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma
 
 	phys_len = PAGE_ALIGN(pci_resource_len(pdev, index));
 	req_len = vma->vm_end - vma->vm_start;
-	pgoff = vma->vm_pgoff &
-		((1U << (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
-	req_start = pgoff << PAGE_SHIFT;
+	vma->vm_pgoff &= VFIO_PCI_OFFSET_MASK >> PAGE_SHIFT;
 
-	if (req_start + req_len > phys_len)
+	if ((vma->vm_pgoff << PAGE_SHIFT) + req_len > phys_len)
 		return -EINVAL;
 
 	/*
@@ -1768,7 +1773,20 @@ int vfio_pci_core_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma
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
+					     req_len, index);
+	if (ret)
+		return ret;
+
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 3554afbc8ebc..a12432825e5e 100644
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
@@ -245,6 +249,7 @@ static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
 	return 0;
 }
 
+#ifdef CONFIG_VFIO_PCI_DMABUF
 /*
  * This is a temporary "private interconnect" between VFIO DMABUF and iommufd.
  * It allows the two co-operating drivers to exchange the physical address of
@@ -453,6 +458,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	kfree(dma_ranges);
 	return ret;
 }
+#endif /* CONFIG_VFIO_PCI_DMABUF */
 
 int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 				   struct vm_area_struct *vma,
@@ -530,6 +536,10 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 	struct vfio_pci_dma_buf *tmp;
 
 	lockdep_assert_held_write(&vdev->memory_lock);
+	/*
+	 * Holding memory_lock ensures a racing VMA fault observes
+	 * priv->revoked properly.
+	 */
 
 	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
 		if (!get_file_active(&priv->dmabuf->file))
@@ -547,6 +557,8 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 			if (revoked) {
 				kref_put(&priv->kref, vfio_pci_dma_buf_done);
 				wait_for_completion(&priv->comp);
+				unmap_mapping_range(priv->dmabuf->file->f_mapping,
+						    0, priv->size, 1);
 			} else {
 				/*
 				 * Kref is initialize again, because when revoke
@@ -594,6 +606,8 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 		if (!was_revoked) {
 			kref_put(&priv->kref, vfio_pci_dma_buf_done);
 			wait_for_completion(&priv->comp);
+			unmap_mapping_range(priv->dmabuf->file->f_mapping,
+					    0, priv->size, 1);
 		}
 		vfio_device_put_registration(&vdev->vdev);
 		fput(priv->dmabuf->file);
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index 3cff1b7eb47b..868a54ba482c 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -137,13 +137,13 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 				   struct vm_area_struct *vma,
 				   u64 phys_start, u64 req_len,
 				   unsigned int res_index);
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
@@ -152,13 +152,6 @@ vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
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



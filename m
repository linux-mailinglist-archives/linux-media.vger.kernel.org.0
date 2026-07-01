Return-Path: <linux-media+bounces-66266-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MP8yJa9MRWow+QoAu9opvQ
	(envelope-from <linux-media+bounces-66266-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:21:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E23796F04F1
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:21:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=FoKRHzqb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66266-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66266-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 172DC312EA38
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 17:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5737738B7A5;
	Wed,  1 Jul 2026 17:13:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258FF38A72C;
	Wed,  1 Jul 2026 17:13:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925993; cv=none; b=RBWYJ8dETYOxD7ruYoP6PdUBPlLw87ItFUnVRCHbhPWqb7eX57DkAqI+16Ta6ib6MaQikW8XsNsbVwSacChQ2oipZqE7gyEMPUcm/deidzhtmykEcAaJSUwEadSXw3hW0qoVpnoEkJsX8j8BoJrZJTZ6PpoXOH0TVmzV9JI9NGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925993; c=relaxed/simple;
	bh=Cs2DG5nhGp1GIvHKawf2qJ6NdbMnpgx2MNAmd1iro90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pArpOuoKe9qiLzXT6vJRNizUuB2ro7Xv37YSGPaZi4k+7mgWWsA4RiqvQQIuZf9LJ9/6MPHA7fuHFRFdzGv+evdMOIuqgKzRgAulOKapee/6p8sJgpfRCosMUs1aYeZHuNzpzA0vgLoHlRIanlnhmuP3nIS+Skh+97ojOGD2uyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=FoKRHzqb; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1782925990;
	bh=21YoWpaREF69wPZR+ZwSgS++Z1CmuvRdIfMGPu6N1ec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FoKRHzqbJ9ZWqUNJgs8NK2LPGtOR9SHm0ll3PMkiK4t73p3mfSJmg2Et7jpdHg5OX
	 zo+rbHtIqDQCW0k0Fmzq4SkWIiHMIcQs5MlGM6xCx/KMoL9j1+BXnr97Jhi6gu7Nul
	 4TAHC40hIDXQCt3hCEzXdK6km419FHrDz/EsN+xZ59ypStrsuVReckXcydVmCdPo65
	 B0DYlBGuxM7xU6J7BELDYlAN2he0VSuNI68AJJkRKeSnljg4sAG9TgSylIpHiUhi6p
	 3jt7EEMlyeoVw1TZQfJWch0G6yDiMbelO/3RFlTwv3SRghtiktqbQcMyg6r90H9c1R
	 97tFE543UhJ+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gr66F4nhkz4wq4;
	Thu, 02 Jul 2026 03:13:09 +1000 (AEST)
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
Subject: [PATCH v4 03/10] vfio/pci: Add a helper to look up PFNs for DMABUFs
Date: Wed,  1 Jul 2026 18:12:15 +0100
Message-ID: <20260701171245.90111-4-matt@ozlabs.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66266-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E23796F04F1

Add vfio_pci_dma_buf_find_pfn(), which a VMA fault handler can use to
find a PFN.

This supports multi-range DMABUFs, which typically would be used to
represent scattered spans but might even represent overlapping or
aliasing spans of PFNs.

Because this is intended to be used in vfio_pci_core.c, we also need
to expose the struct vfio_pci_dma_buf in the vfio_pci_priv.h header.

Signed-off-by: Matt Evans <matt@ozlabs.org>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 153 ++++++++++++++++++++++++++---
 drivers/vfio/pci/vfio_pci_priv.h   |  20 ++++
 2 files changed, 160 insertions(+), 13 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 1a177ce7de54..2e9adc3fe0f7 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -9,19 +9,6 @@
 
 MODULE_IMPORT_NS("DMA_BUF");
 
-struct vfio_pci_dma_buf {
-	struct dma_buf *dmabuf;
-	struct vfio_pci_core_device *vdev;
-	struct list_head dmabufs_elm;
-	size_t size;
-	struct phys_vec *phys_vec;
-	struct p2pdma_provider *provider;
-	u32 nr_ranges;
-	struct kref kref;
-	struct completion comp;
-	u8 revoked : 1;
-};
-
 static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 				   struct dma_buf_attachment *attachment)
 {
@@ -106,6 +93,146 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
 	.release = vfio_pci_dma_buf_release,
 };
 
+int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *priv,
+			      struct vm_area_struct *vma,
+			      unsigned long fault_addr,
+			      unsigned int order,
+			      unsigned long *out_pfn)
+{
+	/*
+	 * Given a VMA (start, end, pgoffs) and a fault address,
+	 * search the corresponding DMABUF's phys_vec[] to find the
+	 * range representing the address's offset into the VMA, and
+	 * its PFN.
+	 *
+	 * The phys_vec[] ranges represent contiguous spans of VAs
+	 * upwards from the buffer offset 0; the actual PFNs might be
+	 * in any order, overlap/alias, etc.  Calculate an offset of
+	 * the desired page given VMA start/pgoff and address, then
+	 * search upwards from 0 to find which span contains it.
+	 *
+	 * On success, a valid PFN for a page sized by 'order' is
+	 * returned into out_pfn.
+	 *
+	 * Failure occurs if:
+	 * - A hugepage would cross the edge of the VMA,
+	 * - A hugepage isn't entirely contained within a range
+	 *   (including where it straddles the boundary between
+	 *   ranges),
+	 * - We find a range, but the final PFN isn't aligned to the
+	 *   requested order.
+	 *
+	 * Upon failure, -EAGAIN is returned and the caller is
+	 * expected to try again with a smaller order, which will
+	 * eventually succeed (order=0 will always work).
+	 *
+	 * It's suboptimal if DMABUFs are created with neighbouring
+	 * ranges that are physically contiguous, since hugepages
+	 * can't straddle range boundaries.  (The construction of the
+	 * ranges should merge them in this case.)
+	 *
+	 * Finally, vma_pgoff_adjust is used with a DMABUF created for
+	 * a VFIO BAR mmap: a BAR mapped with vm_pgoff > 0 creates a
+	 * DMABUF such that byte 0 of the VMA corresponds to byte 0 of
+	 * the DMABUF and byte 'vm_pgoff << PAGE_SHIFT' into the BAR.
+	 * To avoid double-offsetting in this scenario, subtracting
+	 * vma_pgoff_adjust from this (non-zero) vm_pgoff generates
+	 * the effective offset.
+	 */
+
+	const unsigned long pagesize = PAGE_SIZE << order;
+	unsigned long vma_off = ((vma->vm_pgoff - priv->vma_pgoff_adjust) <<
+				 PAGE_SHIFT) & VFIO_PCI_OFFSET_MASK;
+	unsigned long rounded_page_addr = ALIGN_DOWN(fault_addr, pagesize);
+	unsigned long rounded_page_end = rounded_page_addr + pagesize;
+	unsigned long fault_offset;
+	unsigned long fault_offset_end;
+	unsigned long range_start_offset = 0;
+	unsigned int i;
+	int ret;
+
+	if (rounded_page_addr < vma->vm_start || rounded_page_end > vma->vm_end) {
+		if (order > 0)
+			return -EAGAIN;
+
+		/* A fault address outside of the VMA is absurd. */
+		dev_warn_ratelimited(
+			&priv->vdev->pdev->dev,
+			"Fault addr 0x%lx outside VMA 0x%lx-0x%lx\n",
+			fault_addr, vma->vm_start, vma->vm_end);
+		return -EFAULT;
+	}
+
+	/*
+	 * fault_offset[_end] is the span within the DMABUF
+	 * corresponding to the faulting page:
+	 */
+	if (unlikely(check_add_overflow(rounded_page_addr - vma->vm_start,
+					vma_off, &fault_offset) ||
+		     check_add_overflow(fault_offset, pagesize,
+					&fault_offset_end)))
+		return -EFAULT;
+
+	/*
+	 * Iterate over ranges in the buffer, summing their lengths:
+	 * range_start_offset represents the current range's starting
+	 * offset in the buffer (from 0 upwards).
+	 *
+	 * A failure for order == 0 is unexpected, and triggers a
+	 * fault/warn.
+	 */
+	ret = (order == 0) ? -EFAULT : -EAGAIN;
+
+	for (i = 0; i < priv->nr_ranges; i++) {
+		size_t range_len = priv->phys_vec[i].len;
+
+		/* Early exit if range starts after the page end */
+		if (fault_offset_end <= range_start_offset)
+			break;
+
+		if (fault_offset >= range_start_offset &&
+		    fault_offset_end <= range_start_offset + range_len) {
+			/*
+			 * The faulting page is wholly contained
+			 * within the span represented by this range,
+			 * so validate PFN alignment for the order.
+			 * The if() condition ensures the pfn
+			 * arithmetic won't overflow.
+			 */
+			unsigned long pfn =
+				((fault_offset - range_start_offset) +
+				 priv->phys_vec[i].paddr) >> PAGE_SHIFT;
+
+			if (IS_ALIGNED(pfn, 1 << order)) {
+				*out_pfn = pfn;
+				ret = 0;
+			}
+			/*
+			 * Else order > 0; EAGAIN retries with smaller
+			 * order
+			 */
+			break;
+		}
+		range_start_offset += range_len;
+	}
+
+	if (order == 0 && ret != 0)
+		/*
+		 * The address fell outside of the span represented by
+		 * the (concatenated) ranges.  As setup of a mapping
+		 * ensures that the VMA is <= the total size of the
+		 * ranges this should never happen.  If it does, warn
+		 * and SIGBUS.
+		 */
+		dev_warn_ratelimited(
+			&priv->vdev->pdev->dev,
+			"No range for addr 0x%lx, order %d: VMA 0x%lx-0x%lx pgoff 0x%lx, %u ranges, size 0x%zx\n",
+			fault_addr, order, vma->vm_start, vma->vm_end,
+			vma->vm_pgoff, priv->nr_ranges, priv->size);
+
+	return ret;
+}
+
 /*
  * This is a temporary "private interconnect" between VFIO DMABUF and iommufd.
  * It allows the two co-operating drivers to exchange the physical address of
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index fca9d0dfac90..c8f6f959056a 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -23,6 +23,20 @@ struct vfio_pci_ioeventfd {
 	bool			test_mem;
 };
 
+struct vfio_pci_dma_buf {
+	struct dma_buf *dmabuf;
+	struct vfio_pci_core_device *vdev;
+	struct list_head dmabufs_elm;
+	size_t size;
+	struct phys_vec *phys_vec;
+	struct p2pdma_provider *provider;
+	u32 nr_ranges;
+	struct kref kref;
+	struct completion comp;
+	unsigned long vma_pgoff_adjust;
+	u8 revoked : 1;
+};
+
 bool vfio_pci_intx_mask(struct vfio_pci_core_device *vdev);
 void vfio_pci_intx_unmask(struct vfio_pci_core_device *vdev);
 
@@ -114,6 +128,12 @@ static inline bool vfio_pci_is_vga(struct pci_dev *pdev)
 	return (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
 }
 
+int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
+			      struct vm_area_struct *vma,
+			      unsigned long address,
+			      unsigned int order,
+			      unsigned long *out_pfn);
+
 #ifdef CONFIG_VFIO_PCI_DMABUF
 int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 				  struct vfio_device_feature_dma_buf __user *arg,
-- 
2.50.1 (Apple Git-155)



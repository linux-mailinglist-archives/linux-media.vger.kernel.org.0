Return-Path: <linux-media+bounces-62868-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBT1FavHFmpVrwcAu9opvQ
	(envelope-from <linux-media+bounces-62868-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:30:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C335F5E2BAA
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 008CB307FC38
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995873F2113;
	Wed, 27 May 2026 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="tqzopi5q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCDB3F0A81;
	Wed, 27 May 2026 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877444; cv=none; b=MgGN04wCx8MqVGiOWTxZPRrGPyO1LS4fy2DqdtounkKF1DmZS3UjTRXqaba29rapAVzd/qpzQ5lBZSEHu9e4oeyps/6ZdQ29FH9rHzwFPpmv2R0VtGFReNdyMjUDiuzV68ofqYVaWbTagNO4HV7/7dyJenw57BtsCkJJZr0KDdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877444; c=relaxed/simple;
	bh=PZQ1NL5LNqE9qVR+w8+NeV5LdnBkdprTA6joRKshK6E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JhGPscZ79GQEuCFhFj77P2IFRsDiuXmwoegEkruaJVfmz7NBoSLU7Mm3gG2tu2D+uI/Oy4GmeJ9ipS2dIrfupWq+LlBFmdTdstJDuuR+1vwfnAfWqyFMMUhtzUzji5pvLH30ELdl4qTEfhPnEnIERFzUea4CwSQM/iU2ytqU2c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=tqzopi5q; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R6QKQZ2299940;
	Wed, 27 May 2026 03:23:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=dwK9cW3HySDjv45f+xGjayqXcS0t4ugLKylgiA/Ko2M=; b=tqzopi5qRKhJ
	08rKa5mgCwQgsIUBH0JQVnYGGU1ycg4GK8gy+nCc+Q/2p+UrS3EIhAE+jwOS6/yX
	pPALzlx4cVABGnVHeLvPQHsS10cI3Vv7dRMT6oUiOxsWLSSzf9zGNICyIzddySwe
	J1YDofbCOhFkC7llUSTPDylVx/ZP19+CsYeK1pIN4QWhmTetGcv/snErBrdaeenC
	HSKSHCozQIJvQ+4Kjs1zwabapVFzUt6WiNvEwBI0UwRuGImLw4L8T0F15RQJlKgZ
	9ZbKIdmeMRowCwDUZOIf1IGDpDbu6m1hvo5W8MOmaQHStg47GTMOKnKiCJ33abzS
	+ugnTOqBDw==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4edubfrxwj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 May 2026 03:23:33 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::8e35) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 27 May
 2026 10:23:31 +0000
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
Subject: [PATCH v2 2/9] vfio/pci: Add a helper to look up PFNs for DMABUFs
Date: Wed, 27 May 2026 03:23:05 -0700
Message-ID: <20260527102319.100128-3-mattev@meta.com>
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
X-Proofpoint-GUID: cNZHWaKIG3WvwPrUAPiwwYt1dJ0-HxI1
X-Proofpoint-ORIG-GUID: cNZHWaKIG3WvwPrUAPiwwYt1dJ0-HxI1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEwMCBTYWx0ZWRfX9qsZQTS07TM8
 xe4DJ06j4mUpIz1a/LVnINHSwogH6NheNnzTw7vONeRQ6SChsGVS3+2cDNwNGw0mZf0GprOd6OP
 lkttfKYAhlakum46vQNpBL9tUJlS+Ajel8RvyJarVlDwLe4/OTncySrG+46Ud3Tb91Op9TbRha7
 E6S1Vwlu85CfIHmk8//O2dwyGR/TWD7dkwSrE9R94AjFcxVjdGcmzIp8bQ6EcuusDS6IZfnJsBV
 achGkOdn6r6qrGYDeE6Fd6uyDHTd/bA8b3UXY4NOnWe9yVe3YMCAyUHUjCz4+8XhEdmR3p051Pn
 SLGVLPfVTGvTEU4VINguukeQIAf8RXabPfph1tEBRqVvIRuZ1Z5VdF7ZIWA4leGXLbFC/7opc0x
 ExNRO6cWCkflZoqbPqCiWjbc8hHFqi4RA95e7lCJJL4VrhMcjtfJ+Yx82fNbNXaJrCygOHZfZXi
 PQvbvvI/iMV0TVkXYdg==
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a16c625 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_1IyUuN4QrATX339ibzo:22 a=VabnemYjAAAA:8 a=BHKhlg6EwROUgAhvwz4A:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-62868-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,meta.com:mid,meta.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C335F5E2BAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add vfio_pci_dma_buf_find_pfn(), which a VMA fault handler can use to
find a PFN.

This supports multi-range DMABUFs, which typically would be used to
represent scattered spans but might even represent overlapping or
aliasing spans of PFNs.

Because this is intended to be used in vfio_pci_core.c, we also need
to expose the struct vfio_pci_dma_buf in the vfio_pci_priv.h header.

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 142 ++++++++++++++++++++++++++---
 drivers/vfio/pci/vfio_pci_priv.h   |  20 ++++
 2 files changed, 149 insertions(+), 13 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index c16f460c01d6..0d132c4ca95f 100644
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
@@ -106,6 +93,135 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
 	.release = vfio_pci_dma_buf_release,
 };
 
+int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
+			      struct vm_area_struct *vma,
+			      unsigned long address,
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
+	 * - The page would cross the edge of the VMA
+	 * - The page isn't entirely contained within a range
+	 * - We find a range, but the final PFN isn't aligned to the
+	 *   requested order.
+	 *
+	 * (Upon failure, the caller is expected to try again with a
+	 * smaller order; the tests above will always succeed for
+	 * order=0 as the limit case.)
+	 *
+	 * It's suboptimal if DMABUFs are created with neigbouring
+	 * ranges that are physically contiguous, since hugepages
+	 * can't straddle range boundaries.  (The construction of the
+	 * ranges vector should merge such ranges.)
+	 *
+	 * Finally, vma_pgoff_adjust is used for a DMABUF representing
+	 * a VFIO BAR mmap, which is created from the start of the
+	 * offset region.  It should be zero, or equal vm_pgoff.
+	 */
+
+	const unsigned long pagesize = PAGE_SIZE << order;
+	unsigned long vma_off = ((vma->vm_pgoff - vpdmabuf->vma_pgoff_adjust) <<
+				 PAGE_SHIFT) & VFIO_PCI_OFFSET_MASK;
+	unsigned long rounded_page_addr = ALIGN_DOWN(address, pagesize);
+	unsigned long rounded_page_end = rounded_page_addr + pagesize;
+	unsigned long page_buf_offset;
+	unsigned long range_buf_offset = 0;
+	unsigned int i;
+
+	if (rounded_page_addr < vma->vm_start || rounded_page_end > vma->vm_end) {
+		if (order > 0)
+			return -EAGAIN;
+
+		/* A fault address outside of the VMA is absurd. */
+		WARN(1, "Fault addr 0x%lx outside VMA 0x%lx-0x%lx\n",
+		     address, vma->vm_start, vma->vm_end);
+		return -EFAULT;
+	}
+
+	if (vpdmabuf->vma_pgoff_adjust != 0 &&
+	    vpdmabuf->vma_pgoff_adjust != (vma->vm_pgoff &
+					   (VFIO_PCI_OFFSET_MASK >> PAGE_SHIFT))) {
+		WARN(1, "Unexpected vma_pgoff_adjust 0x%lx (vm_pgoff 0x%lx)\n",
+		     vpdmabuf->vma_pgoff_adjust, vma->vm_pgoff);
+		return -EFAULT;
+	}
+
+	if (unlikely(check_add_overflow(rounded_page_addr - vma->vm_start,
+					vma_off, &page_buf_offset)))
+		return -EFAULT;
+
+	for (i = 0; i < vpdmabuf->nr_ranges; i++) {
+		unsigned long page_buf_offset_end;
+		size_t range_len = vpdmabuf->phys_vec[i].len;
+		phys_addr_t range_start = vpdmabuf->phys_vec[i].paddr;
+
+		if (unlikely(check_add_overflow(page_buf_offset, pagesize,
+						&page_buf_offset_end)))
+			return -EFAULT;
+		/*
+		 * If the current range starts after the page's span,
+		 * this and any future range won't match.  Bail early.
+		 */
+		if (page_buf_offset_end <= range_buf_offset)
+			break;
+
+		if (page_buf_offset >= range_buf_offset &&
+		    page_buf_offset_end <= range_buf_offset + range_len) {
+			/*
+			 * The faulting page is wholly contained
+			 * within the span represented by the range.
+			 * Validate PFN alignment for the order:
+			 */
+			unsigned long pfn = (range_start + page_buf_offset -
+					     range_buf_offset) / PAGE_SIZE;
+
+			if (IS_ALIGNED(pfn, 1 << order)) {
+				*out_pfn = pfn;
+				return 0;
+			}
+			/* Retry with smaller order */
+			return -EAGAIN;
+		}
+		range_buf_offset += range_len;
+	}
+
+	/*
+	 * A hugepage straddling a range boundary will fail to match a
+	 * range, but the address will (eventually) match when retried
+	 * with a smaller page.
+	 */
+	if (order > 0)
+		return -EAGAIN;
+
+	/*
+	 * If we get here, the address fell outside of the span
+	 * represented by the (concatenated) ranges.  Setup of a
+	 * mapping must ensure that the VMA is <= the total size of
+	 * the ranges, so this should never happen.  But, if it does,
+	 * force SIGBUS for the access and warn.
+	 */
+	WARN_ONCE(1, "No range for addr 0x%lx, order %d: VMA 0x%lx-0x%lx pgoff 0x%lx, %u ranges, size 0x%zx\n",
+		  address, order, vma->vm_start, vma->vm_end, vma->vm_pgoff,
+		  vpdmabuf->nr_ranges, vpdmabuf->size);
+
+	return -EFAULT;
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
2.47.3



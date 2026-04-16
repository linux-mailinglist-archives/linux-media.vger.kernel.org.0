Return-Path: <linux-media+bounces-58887-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fwJMMw7j4GmcnAAAu9opvQ
	(envelope-from <linux-media+bounces-58887-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:24:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2148840EC3D
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F3AA319CB47
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEB13BFE4F;
	Thu, 16 Apr 2026 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="q9zn+5qL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191AF3BB9F8;
	Thu, 16 Apr 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345528; cv=none; b=frjQPX6dhONuWA2IETlvuPLbiCGfl/AxU01fNQfmFXc+cQfdRbOqpRh4haJ4Oe7G+59HWQLcLFzSaC6IoR9Bu7EOngxr2peQwmkKQz0Wtlj/YxiNTr2W9wSCZfDelb0rfY8a2hIBsNxWHC0I/TvWPPjIuTrgVIoCwiO/2k98C+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345528; c=relaxed/simple;
	bh=OVyyLfEZRxUbMwDPYgMyZz73rpUFL0V3NT9sJS3e7kk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uqkjdQ3FmTuQfSGI3cXz2ZyMLru4J/a0c7MXcBxhCWMs4yIqIwY6k93CmH0QZfwTNPvwRS2YvXe+nSClk3f9ykc6yQjF9MwaikGu93YWIO+uNsmTdcwfoeJWTnCzBjtXsI6G9rAeHCF7i9WmiQL/+ykuuDdOQcp5CWFyEWGVnYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=q9zn+5qL; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G51Pjg2882190;
	Thu, 16 Apr 2026 06:18:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=eSmgUWsE5Z0tfgLMREnOpAUpUl+vKjlw9UTKmkFxfSc=; b=q9zn+5qLNa5E
	Q/ZRg9TfFs2bCP51SG1li/ZmMyfyAKYUZ8FlcS853FSv7VKH6Uh8hy2jCBAtl0nb
	ntFKB+NgqsnOcQB4kts8nzCzNIFOhtWaepYpDTo0GdfbaVFfPoZ6R+PlCN5z4ifg
	zSf8IBz6E3YlkxUQSSUmto/XmEXb6sFmDIitmDgS3Sf+oahyh8Obji4ZJ9VvMh3O
	jrvPaSPnEKx5ybAmnTAFlZS9XWqPFJQXbhrvjVz5MfVak3SDXAN9e8jg1KDjkVmV
	96xWnLObLBHEZqxkbXX4EHy320ieE6iLlYQc54Lz1SvYPJK5wai3iz1EzFL3lvxL
	03ZIiqT+hw==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dh85d2013-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Apr 2026 06:18:31 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1c::1b) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Thu, 16 Apr
 2026 13:18:30 +0000
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
Subject: [PATCH 2/9] vfio/pci: Add a helper to look up PFNs for DMABUFs
Date: Thu, 16 Apr 2026 06:17:45 -0700
Message-ID: <20260416131815.2729131-3-mattev@meta.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyNiBTYWx0ZWRfXw1lPbPcGkRox
 CqcJzA2hswqmmCNE0gWQ7ygPBylo8ll14hVE0aw3lTG82LgU9Fl9jEzarqldyEsQZM1/5SRomkU
 nTW8vgDGfi6y02yLBBGWMg0ewxGAtGNZB1MWQ4Yf/Q1+ISCdREMepNtChdvo1Xn+Cy/IfglNwju
 49u2q6TXeO9bMXSFImOyMHZOpM0dHqWxg2Gw1rU1bMEiSEM1rDzdy1Rv3wtxmTIZQRHqjWrrzaM
 6UzZDFzf7MPYsUkLeak02u3ry3Cm6i4sasZrhIYuEsUq6LI8HE1wwQwKwgNezwlgit+chA9lY0m
 1AFTKFlgpURZ3DQH7gy9sXlnir37U6RP0uLquCk8X0zDUYBMJUpU20hO3lzF1wQ2qS3ab7wMLjV
 H8TQqgey2oWWywFMAC+3ptQCa6QILfAs+vKdWhqSIeC/Q6htjKiD/S7vWIVkSI835eYv/6s0R1D
 jO8ks8oGES8rhNo7ojQ==
X-Proofpoint-ORIG-GUID: LqvuGlBZXxDoxGhZ1DAhPLPr-erZsXWI
X-Authority-Analysis: v=2.4 cv=Xfm5Co55 c=1 sm=1 tr=0 ts=69e0e1a7 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=VabnemYjAAAA:8 a=Yodn40Sd1KWp2EMRI-0A:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: LqvuGlBZXxDoxGhZ1DAhPLPr-erZsXWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
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
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-58887-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,meta.com:dkim,meta.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2148840EC3D
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
 drivers/vfio/pci/vfio_pci_dmabuf.c | 124 ++++++++++++++++++++++++++---
 drivers/vfio/pci/vfio_pci_priv.h   |  19 +++++
 2 files changed, 130 insertions(+), 13 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 04478b7415a0..8b6bae56bbf2 100644
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
@@ -106,6 +93,117 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
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
+	 */
+
+	const unsigned long pagesize = PAGE_SIZE << order;
+	unsigned long rounded_page_addr = address & ~(pagesize - 1);
+	unsigned long rounded_page_end = rounded_page_addr + pagesize;
+	unsigned long buf_page_offset;
+	unsigned long buf_offset = 0;
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
+	if (unlikely(check_add_overflow(rounded_page_addr - vma->vm_start,
+					vma->vm_pgoff << PAGE_SHIFT, &buf_page_offset)))
+		return -EFAULT;
+
+	for (i = 0; i < vpdmabuf->nr_ranges; i++) {
+		size_t range_len = vpdmabuf->phys_vec[i].len;
+		phys_addr_t range_start = vpdmabuf->phys_vec[i].paddr;
+
+		/*
+		 * If the current range starts after the page's span,
+		 * this and any future range won't match.  Bail early.
+		 */
+		if (buf_page_offset + pagesize <= buf_offset)
+			break;
+
+		if (buf_page_offset >= buf_offset &&
+		    buf_page_offset + pagesize <= buf_offset + range_len) {
+			/*
+			 * The faulting page is wholly contained
+			 * within the span represented by the range.
+			 * Validate PFN alignment for the order:
+			 */
+			unsigned long pfn = (range_start >> PAGE_SHIFT) +
+				((buf_page_offset - buf_offset) >> PAGE_SHIFT);
+
+			if (IS_ALIGNED(pfn, 1 << order)) {
+				*out_pfn = pfn;
+				return 0;
+			}
+			/* Retry with smaller order */
+			return -EAGAIN;
+		}
+		buf_offset += range_len;
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
index fca9d0dfac90..317170a5b407 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -23,6 +23,19 @@ struct vfio_pci_ioeventfd {
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
+	u8 revoked : 1;
+};
+
 bool vfio_pci_intx_mask(struct vfio_pci_core_device *vdev);
 void vfio_pci_intx_unmask(struct vfio_pci_core_device *vdev);
 
@@ -114,6 +127,12 @@ static inline bool vfio_pci_is_vga(struct pci_dev *pdev)
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



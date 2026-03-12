Return-Path: <linux-media+bounces-55534-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PaDDJQKs2kMRwAAu9opvQ
	(envelope-from <linux-media+bounces-55534-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:48:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A050E2774F9
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2A62307198F
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CB240242E;
	Thu, 12 Mar 2026 18:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="sg4ubl55"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93588401A1C;
	Thu, 12 Mar 2026 18:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341229; cv=none; b=K9SGkO+qyd2xPAPnpNCXMU7drVkFhWObdrsexN9GiRUsEdXd12gNSRJjm1TS3GnBTcCctBvlJ/yB/BiFYeXCrGMyUw1Tq6vGI+eOqkjHoNy0uMbcwVUGCmWly+sLmFuPjizZbxkX6mJ0Lbuwu6dhDh8Z6gM5wnE09D2R+IXz4oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341229; c=relaxed/simple;
	bh=Bacgd0qQjADZty87pzUieZ2F62uqHuBS0aNqi3JHHmg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IVFi2aEVW+i0bcxzmJSZ/hG8y5zo59470FPeRQNvYGm8Xey+y7NRKCMjWNJmnHVchcanSPOcuRzf43bQTMSoDuNTnXPeDhv8muNLl4irmI9OoC1FhM3VI5EGpaMFjPkUm6tAJeL5xigfkirO3whHYhczPslLWpwG4mwJLdE9gK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=sg4ubl55; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CHOTDS1805133;
	Thu, 12 Mar 2026 11:46:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=giWODZ+S8k6fpZRnxvO34oUUO4s5pygsXFnhWvTEKzg=; b=sg4ubl55NazG
	qVUHo/c+K2tCbDe5hm6/mVJQUJrLK96pFKHPkpWIYXGNjfBVIvC5T+41fe5AWCwa
	zALcvvLTQ5++1L+5+nq1to5CBxitHPiOu7Bw2KQgldXpEn/Za2y4EknLJio+1hAP
	DdGlkta7a8O9Cx9dLgsIE/xgXbR0SAf6sQ4FJNaOKe5oIs/aingQUnoySXzXQT0C
	QzdmbHJ/TBMOpOcN/jZ9zZL6kf0/YOgjouEoW+6y41Cx0/tE4hUcWlIH1QEd+9od
	V4o5FFCBNxroiLVJYGJN+XO3IiirP25+kP5XxGDF9j+nHmxcSSY6TkhMRtX+lqWb
	9kqt7osEAA==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cuytuvk6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 11:46:52 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::7cb7) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 12 Mar
 2026 18:46:51 +0000
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
Subject: [RFC v2 PATCH 09/10] vfio/pci: Add mmap() attributes to DMABUF feature
Date: Thu, 12 Mar 2026 11:46:07 -0700
Message-ID: <20260312184613.3710705-10-mattev@meta.com>
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
X-Authority-Analysis: v=2.4 cv=WKtyn3sR c=1 sm=1 tr=0 ts=69b30a1c cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=JnKecZnUtZousrUlYMGU:22 a=VabnemYjAAAA:8 a=ZZip-zt6qTTd7FoaoeoA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: RFpW0x6_sBMQCOROfH6RjBKGMUM_JHHy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MSBTYWx0ZWRfX/r6l02q19NCa
 Hukc4vvWd5CNLxy6AloCnP4dOLsgPctiR2Fw/lDsGBe6oeEcGk+2q/SSH/0jZLyhsLGh363UkKp
 tsLATz9toKL8Sl/JfJhfH+ihnRbPDhp2na/SodIeVdIflIuhwRATy6d2uUrKkrW7GtYS3Jwi4SZ
 OvvOKFCC17LsxfeJjp5pZEPWONdgzVfATXmKuT5NkOLk6Y3eToNtmtCRIqkHb14b1Y7rMrLL8zC
 Mm/n+HZm7k2NLjWXSDVW1DhxS0hg3FvsSGgvmJzSLPHIwlsalx3wltZmYQ9srJql+Y9nc1/zdHo
 j6VLGND/SycL8wTKLzTQn9yvfIp0WMWBhHCvo+XxbbSjeBKzSSJl22lcySX2/f1XcS7a6I+GKFe
 9Jk0oMG4ofXh6KxB9rhxmGWB5fDbdJsuEOORIGjxKFh6KXuTP0mGXTLEDRl666+TJvG45mfD73V
 qWJFNzbEavhU5JhZEWQ==
X-Proofpoint-GUID: RFpW0x6_sBMQCOROfH6RjBKGMUM_JHHy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55534-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A050E2774F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A new field is reserved in vfio_device_feature_dma_buf.flags to
request CPU-facing memory type attributes for mmap()s of the buffer.
Add a flag VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_WC, which results in WC
PTEs for the DMABUF's BAR region.

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 15 +++++++++++++--
 drivers/vfio/pci/vfio_pci_priv.h   |  1 +
 include/uapi/linux/vfio.h          | 12 +++++++++---
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 362207cf7e71..ed5b80f6911e 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -42,7 +42,10 @@ static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *
 	if (req_start + req_len > priv->size)
 		return -EINVAL;
 
-	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	if (priv->attrs == VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_WC)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+	else
+		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
 	/* See comments in vfio_pci_core_mmap() re VM_ALLOW_ANY_UNCACHED. */
@@ -343,6 +346,12 @@ static int validate_dmabuf_input(struct vfio_device_feature_dma_buf *dma_buf,
 	size_t length = 0;
 	u32 i;
 
+	if ((dma_buf->flags != 0) &&
+	    ((dma_buf->flags & ~VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_MASK) ||
+	     ((dma_buf->flags & VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_MASK) !=
+	      VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_WC)))
+		return -EINVAL;
+
 	for (i = 0; i < dma_buf->nr_ranges; i++) {
 		u64 offset = dma_ranges[i].offset;
 		u64 len = dma_ranges[i].length;
@@ -386,7 +395,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
 		return -EFAULT;
 
-	if (!get_dma_buf.nr_ranges || get_dma_buf.flags)
+	if (!get_dma_buf.nr_ranges)
 		return -EINVAL;
 
 	/*
@@ -429,6 +438,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	priv->vdev = vdev;
 	priv->nr_ranges = get_dma_buf.nr_ranges;
 	priv->size = length;
+	priv->attrs = get_dma_buf.flags & VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_MASK;
 	ret = vdev->pci_ops->get_dmabuf_phys(vdev, &priv->provider,
 					     get_dma_buf.region_index,
 					     priv->phys_vec, dma_ranges,
@@ -488,6 +498,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 	priv->vdev = vdev;
 	priv->nr_ranges = nr_ranges;
 	priv->size = req_len;
+	priv->attrs = 0;
 	priv->phys_vec[0].paddr = phys_start + (pgoff << PAGE_SHIFT);
 	priv->phys_vec[0].len = req_len;
 
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index c5a9e06bf81a..562de3cc88f4 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -40,6 +40,7 @@ struct vfio_pci_dma_buf {
 	u32 nr_ranges;
 	struct kref kref;
 	struct completion comp;
+	u32 attrs;
 	enum vfio_pci_dma_buf_status status;
 };
 
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index c1b3fa880aa1..fbbe1adea533 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1521,7 +1521,9 @@ struct vfio_device_feature_bus_master {
  * etc. offset/length specify a slice of the region to create the dmabuf from.
  * nr_ranges is the total number of (P2P DMA) ranges that comprise the dmabuf.
  *
- * flags should be 0.
+ * flags contains:
+ * - A field for userspace mapping attribute: by default, suitable for regular
+ *   MMIO. Alternate attributes (such as WC) can be selected.
  *
  * Return: The fd number on success, -1 and errno is set on failure.
  */
@@ -1535,8 +1537,12 @@ struct vfio_region_dma_range {
 struct vfio_device_feature_dma_buf {
 	__u32	region_index;
 	__u32	open_flags;
-	__u32   flags;
-	__u32   nr_ranges;
+	__u32	flags;
+	/* Flags sub-field reserved for attribute enum */
+#define VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_MASK		(0xf << 28)
+#define VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_UC		(0 << 28)
+#define VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_WC		(1 << 28)
+	__u32	nr_ranges;
 	struct vfio_region_dma_range dma_ranges[] __counted_by(nr_ranges);
 };
 
-- 
2.47.3



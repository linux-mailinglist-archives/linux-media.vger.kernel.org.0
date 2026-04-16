Return-Path: <linux-media+bounces-58888-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G6gBCrj4GlhnAAAu9opvQ
	(envelope-from <linux-media+bounces-58888-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:24:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 595D340EC5B
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B076C3129115
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BD43242BE;
	Thu, 16 Apr 2026 13:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="DMd8tAhp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C91339E185;
	Thu, 16 Apr 2026 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345528; cv=none; b=S06E5L+FX3pZ3StITi0BbBVkpNz626NfHfCzhGZdgfJOefwrYlCwTVSZjN4vABRIhtplPdu1p05Q6XqZM/DFbo965SAAWWFuDSyfoIwDaVNQgANo5wk4xO/wfi09R2/7+EKAr54LBuzLwghh7LmiAtIdv+IYCmjd788FWJI/tjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345528; c=relaxed/simple;
	bh=N+eufCz4yUFyEIIENQYARJE2vkXNc234Yf3UvKGxLxk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LkqpOImDZmT7pOBobGJBrHV3CsFa+caTJz/BWP11jwqZ+1nVzNbyP1PaE5rZBK4fpFI62md19MqH9dFPReYGR1YmI9MZJJ4DrRV6N6yr/Hbjhoa3uwm0zCsA3m7QSemMF+Mm66CgeCoeAJ9Kac5yRUZF30TrWXHmH7kMsnQrFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=DMd8tAhp; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 63G8D34W2796640;
	Thu, 16 Apr 2026 06:18:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=EfdyYjdxTLYHB3RCNsRMczA2dYHIQJkje+Q84vXd7oE=; b=DMd8tAhpLd4k
	iFTCkOWx9ebIOLwJNgIRiPbar6L/XuCNcDbMRCr+wOIXx1jpu4Ays+A2N+iv1JtG
	kFpTlEKtS9gIH/H/qA8WX/Q6qoJ7zaFS3ACkhih6wdod1Lz4xGehMD0YErf4CjvA
	Z4RNmVcMpbhTkOevFbAnCKl1m0asH3C1ywSZAEmS48WtknWQGU/9JDApEqCSLS9S
	OOG3HMRYZe0gA27uwzLreqF17I0AgSZ3ij6btuVH/BeQzoyYajcLcDh614XB6rKI
	GF0b13q72hdaExAX+ktYlQjiLrkk8Umd129WkM1KeK+T0vdeIqT8lIKEkA6Xtfm5
	uLHhmIBkDg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by m0001303.ppops.net (PPS) with ESMTPS id 4dh84r1wkd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Apr 2026 06:18:35 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::7cb7) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Thu, 16 Apr
 2026 13:18:33 +0000
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
Subject: [PATCH 3/9] vfio/pci: Add a helper to create a DMABUF for a BAR-map VMA
Date: Thu, 16 Apr 2026 06:17:46 -0700
Message-ID: <20260416131815.2729131-4-mattev@meta.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyNiBTYWx0ZWRfX6Y9qt80N7mLm
 GYL5ULqAVXiCAQsgEuMpTTZzBdMJbMFP8x4DI9DBMnv8ykJP0CPCmzNTsVQuw+l6Bt03LMhmTiw
 HKfiy+ug9VrhGLIUhNnXsc0oyL8jATzDAhE71WYToLXcWlqKvAeN4Djuc6ieEuPflEqkxaqQ6Rq
 rzsMSmhZcHoFc6nFca54jV5JBgY+1lu6+KZdkB9EOU64C+5e83Kj1yOeLV6XIcBeb/zNA6jDpQw
 k2FBTTlG/xBzdCN2uJL3c1A3U7F+M/P6kc6YVS5XpeowTYHwgzFVBl1FAxNf0i7q60AMKKcz1Xr
 2KlswnNdF8VmRY9TD+mukdJxFby5ADt652YaXzhBjJ/wtpjm3S8qX9CKtkDv+/iIhiR806rKE+8
 THybE9FB9Fg+9zWal+/lwQt9EPzRz9E+UgvAkMUDH9hnWkI+nUuiojOwSeU4YuLpYQKYCvi3i+Q
 M3hfOhNjktNRFhmDq0w==
X-Authority-Analysis: v=2.4 cv=Ceg4Irrl c=1 sm=1 tr=0 ts=69e0e1ab cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=Dv35txUGz5gI0hTa:21 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22 a=VabnemYjAAAA:8
 a=c_N19DIyldVR5FlEXhEA:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: dCL44EaIcBe97jCd_xfyBQjfLULU7LHN
X-Proofpoint-ORIG-GUID: dCL44EaIcBe97jCd_xfyBQjfLULU7LHN
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
	TAGGED_FROM(0.00)[bounces-58888-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,meta.com:email,meta.com:dkim,meta.com:mid]
X-Rspamd-Queue-Id: 595D340EC5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This helper, vfio_pci_core_mmap_prep_dmabuf(), creates a single-range
DMABUF for the purpose of mapping a PCI BAR.  This is used in a future
commit by VFIO's ordinary mmap() path.

This function transfers ownership of the VFIO device fd to the
DMABUF, which fput()s when it's released.

Refactor the existing vfio_pci_core_feature_dma_buf() to split out
export code common to the two paths, VFIO_DEVICE_FEATURE_DMA_BUF and
this new VFIO_BAR mmap().

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 143 +++++++++++++++++++++++------
 drivers/vfio/pci/vfio_pci_priv.h   |   5 +
 2 files changed, 118 insertions(+), 30 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 8b6bae56bbf2..3554afbc8ebc 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -82,6 +82,8 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 		up_write(&priv->vdev->memory_lock);
 		vfio_device_put_registration(&priv->vdev->vdev);
 	}
+	if (priv->vfile)
+		fput(priv->vfile);
 	kfree(priv->phys_vec);
 	kfree(priv);
 }
@@ -204,6 +206,45 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
 	return -EFAULT;
 }
 
+/*
+ * Create a DMABUF corresponding to priv, add it to vdev->dmabufs list
+ * for tracking (meaning cleanup or revocation will zap it), and take
+ * a vfio_device registration.
+ */
+static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
+				  struct vfio_pci_dma_buf *priv, uint32_t flags)
+{
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+
+	if (!vfio_device_try_get_registration(&vdev->vdev))
+		return -ENODEV;
+
+	exp_info.ops = &vfio_pci_dmabuf_ops;
+	exp_info.size = priv->size;
+	exp_info.flags = flags;
+	exp_info.priv = priv;
+
+	priv->dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(priv->dmabuf)) {
+		vfio_device_put_registration(&vdev->vdev);
+		return PTR_ERR(priv->dmabuf);
+	}
+
+	kref_init(&priv->kref);
+	init_completion(&priv->comp);
+
+	/* dma_buf_put() now frees priv */
+	INIT_LIST_HEAD(&priv->dmabufs_elm);
+	down_write(&vdev->memory_lock);
+	dma_resv_lock(priv->dmabuf->resv, NULL);
+	priv->revoked = !__vfio_pci_memory_enabled(vdev);
+	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
+	dma_resv_unlock(priv->dmabuf->resv);
+	up_write(&vdev->memory_lock);
+
+	return 0;
+}
+
 /*
  * This is a temporary "private interconnect" between VFIO DMABUF and iommufd.
  * It allows the two co-operating drivers to exchange the physical address of
@@ -322,7 +363,6 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 {
 	struct vfio_device_feature_dma_buf get_dma_buf = {};
 	struct vfio_region_dma_range *dma_ranges;
-	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct vfio_pci_dma_buf *priv;
 	size_t length;
 	int ret;
@@ -392,34 +432,9 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	kfree(dma_ranges);
 	dma_ranges = NULL;
 
-	if (!vfio_device_try_get_registration(&vdev->vdev)) {
-		ret = -ENODEV;
+	ret = vfio_pci_dmabuf_export(vdev, priv, get_dma_buf.open_flags);
+	if (ret)
 		goto err_free_phys;
-	}
-
-	exp_info.ops = &vfio_pci_dmabuf_ops;
-	exp_info.size = priv->size;
-	exp_info.flags = get_dma_buf.open_flags;
-	exp_info.priv = priv;
-
-	priv->dmabuf = dma_buf_export(&exp_info);
-	if (IS_ERR(priv->dmabuf)) {
-		ret = PTR_ERR(priv->dmabuf);
-		goto err_dev_put;
-	}
-
-	kref_init(&priv->kref);
-	init_completion(&priv->comp);
-
-	/* dma_buf_put() now frees priv */
-	INIT_LIST_HEAD(&priv->dmabufs_elm);
-	down_write(&vdev->memory_lock);
-	dma_resv_lock(priv->dmabuf->resv, NULL);
-	priv->revoked = !__vfio_pci_memory_enabled(vdev);
-	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
-	dma_resv_unlock(priv->dmabuf->resv);
-	up_write(&vdev->memory_lock);
-
 	/*
 	 * dma_buf_fd() consumes the reference, when the file closes the dmabuf
 	 * will be released.
@@ -430,8 +445,6 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 
 	return ret;
 
-err_dev_put:
-	vfio_device_put_registration(&vdev->vdev);
 err_free_phys:
 	kfree(priv->phys_vec);
 err_free_priv:
@@ -441,6 +454,76 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	return ret;
 }
 
+int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
+				   struct vm_area_struct *vma,
+				   u64 phys_start, u64 req_len,
+				   unsigned int res_index)
+{
+	struct vfio_pci_dma_buf *priv;
+	const unsigned int nr_ranges = 1;
+	int ret;
+
+	priv = kzalloc_obj(*priv);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->phys_vec = kzalloc_obj(*priv->phys_vec);
+	if (!priv->phys_vec) {
+		ret = -ENOMEM;
+		goto err_free_priv;
+	}
+
+	/*
+	 * The mmap() request's vma->vm_offs might be non-zero, but
+	 * the DMABUF is created from _offset zero_ of the BAR.  The
+	 * portion between zero and the vm_offs is inaccessible
+	 * through this VMA, but this approach keeps the
+	 * /proc/<pid>/maps offset somewhat consistent with the
+	 * pre-DMABUF code.  Size includes the offset portion.
+	 *
+	 * This differs from an mmap() of an explicitly-exported
+	 * DMABUF which is an arbitrary slice of the BAR, would be
+	 * created with the desired offset+size, and would usually be
+	 * mmap()ed with pgoff = 0.
+	 *
+	 * Both are equivalent and vfio_pci_dma_buf_find_pfn() finds
+	 * the same PFNs.
+	 */
+	priv->vdev = vdev;
+	priv->nr_ranges = nr_ranges;
+	priv->size = (vma->vm_pgoff << PAGE_SHIFT) + req_len;
+	priv->provider = pcim_p2pdma_provider(vdev->pdev, res_index);
+	if (!priv->provider) {
+		ret = -EINVAL;
+		goto err_free_phys;
+	}
+
+	priv->phys_vec[0].paddr = phys_start;
+	priv->phys_vec[0].len = priv->size;
+
+	ret = vfio_pci_dmabuf_export(vdev, priv, O_CLOEXEC | O_RDWR);
+	if (ret)
+		goto err_free_phys;
+
+	/*
+	 * The VMA gets the DMABUF file so that other users can locate
+	 * the DMABUF via a VA.  Ownership of the original VFIO device
+	 * file being mmap()ed transfers to priv, and is put when the
+	 * DMABUF is released.
+	 */
+	priv->vfile = vma->vm_file;
+	vma->vm_file = priv->dmabuf->file;
+	vma->vm_private_data = priv;
+
+	return 0;
+
+err_free_phys:
+	kfree(priv->phys_vec);
+err_free_priv:
+	kfree(priv);
+	return ret;
+}
+
 void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 {
 	struct vfio_pci_dma_buf *priv;
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index 317170a5b407..3cff1b7eb47b 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -30,6 +30,7 @@ struct vfio_pci_dma_buf {
 	size_t size;
 	struct phys_vec *phys_vec;
 	struct p2pdma_provider *provider;
+	struct file *vfile;
 	u32 nr_ranges;
 	struct kref kref;
 	struct completion comp;
@@ -132,6 +133,10 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
 			      unsigned long address,
 			      unsigned int order,
 			      unsigned long *out_pfn);
+int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
+				   struct vm_area_struct *vma,
+				   u64 phys_start, u64 req_len,
+				   unsigned int res_index);
 
 #ifdef CONFIG_VFIO_PCI_DMABUF
 int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
-- 
2.47.3



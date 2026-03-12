Return-Path: <linux-media+bounces-55532-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL+IIUEKs2kMRwAAu9opvQ
	(envelope-from <linux-media+bounces-55532-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:47:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BD0277497
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2C89304026B
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D78C4014A9;
	Thu, 12 Mar 2026 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="sQe13Fme"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01CE3FFAB6;
	Thu, 12 Mar 2026 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341223; cv=none; b=GQJlZZ1+8q6nyAJbWJVmgBQIegTLn4Itw1o69tjNQMG9hE6hSxhOy+6fAu5MoIpYhgEUd37GM5Av5ZJFIqDRnU5v1v7cPz+cTfRFb6dl7jQt9RL278IiGeYz7JZuNg+UV0XvOF7zN82Ws1ePWqZ9R1i1D0a5MHChvawBDP/CNMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341223; c=relaxed/simple;
	bh=rPZHviA827I0RrNblyUlBtmzE+gRDe3I7XUG7V09gK8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hyIArvQZ2/Id7hleTY9Cmf1V9tHxO68uFEQfAt2bWjnh4Bzh3qDM14zxEY43ddFcF7y5PK810GHnZ+tB0qTCqPzkLfWS31C+sOKSIXjZ6rD/swZ0LFM8gouZwcKa6COuUpwUGIztREKJMEViWJJo/0YV6FuRgjoDfI8vG3Qntws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=sQe13Fme; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 62CHs6hG736960;
	Thu, 12 Mar 2026 11:46:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=ZrlwwZVUdcMNUJAX32tIRUCuImsZe5FshFy6zCbtrbE=; b=sQe13FmeJUaM
	Wt7xRE0a3ver+QCEpyBcUDV2Xsw3KljnCngbtDXhbLKBDmt1tZAHdRf+ae65fSGO
	EngT5lcQF1HVd5y11X4moY4ftfrdtPn8Et0ngQwNiZPVUJnaotF646yfYW3iYcly
	gkY0TmYia8qH8Cc43dmFWn2Sc01EF1IKbf6wotXlMbJXLnq6CJIbir/KJU6g/adI
	yWPJreIK/FML5rXRXTD1ej8Gv4Sc06XByslUjsTRMj9+MfYQ9rp4wTA+PrErZwIt
	H7uwzx1JPZj1oou2HG7Jjrrsx7w5ZxwmoaGzf7lF2YROFlpUvpzlwv7T3mKhGPLs
	hEUamEY+fg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by m0001303.ppops.net (PPS) with ESMTPS id 4cv29xs1t8-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 11:46:40 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1c::1b) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 12 Mar
 2026 18:46:37 +0000
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
Subject: [RFC v2 PATCH 04/10] vfio/pci: Add a helper to create a DMABUF for a BAR-map VMA
Date: Thu, 12 Mar 2026 11:46:02 -0700
Message-ID: <20260312184613.3710705-5-mattev@meta.com>
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
X-Proofpoint-ORIG-GUID: yWV221Ynv3RiRAhf8YGWx40uCR8JGEaY
X-Proofpoint-GUID: yWV221Ynv3RiRAhf8YGWx40uCR8JGEaY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MSBTYWx0ZWRfX/K+cZwc/d5h4
 V6UbyYW1PpDsWHpDykBPG55BoC9bmrkIgEjod/kyYfCZwsghhpb7cNg2vHWh/ZDoykXawDCY3gg
 WNFQ8IabTZPwZMLaygob6CVGYjkVCBr0934NDsM4Vi9gT9Ue/210UIXPAUsOqCrJ3g1GHe9924S
 IYkrfslpsKmUb/X6On+VEYfGr8oM5p66v2bRmxtpxSEWtdAipF+2wjJHs+AyTRzKSF7/zt4nFCs
 XXqy4txRhV5cjLIARoSin8zcXja3aIPJtCxf0HecQy4b8yxTn4fV/ylb19KDsawTfSEpHdRaLr0
 ebSliXkTZozR1TSrESNexyVL0pfMF1q0H8fBa9AgyHq5bJ9SiG1S9KKQT2rg2Zjb6LtFktYguTm
 TFDK5eYH4/H5G2d6iXfBouFh7Ly75KmiUI6A+v5o1I3Wk2MPwfFRIhX+sG5W1Qu7HqZ7o60ae14
 PkOKk+c2+mLA1IpwvZg==
X-Authority-Analysis: v=2.4 cv=G4YR0tk5 c=1 sm=1 tr=0 ts=69b30a10 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=Dv35txUGz5gI0hTa:21 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22 a=VabnemYjAAAA:8
 a=tb9bu44HMbSD3pB8wWYA:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55532-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 27BD0277497
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
 drivers/vfio/pci/vfio_pci_dmabuf.c | 131 +++++++++++++++++++++--------
 drivers/vfio/pci/vfio_pci_priv.h   |   4 +
 2 files changed, 102 insertions(+), 33 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 63140528dbea..76db340ba592 100644
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
@@ -182,6 +184,41 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
 	return -EFAULT;
 }
 
+static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
+				  struct vfio_pci_dma_buf *priv, uint32_t flags,
+				  size_t size, bool status_ok)
+{
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+
+	if (!vfio_device_try_get_registration(&vdev->vdev))
+		return -ENODEV;
+
+	exp_info.ops = &vfio_pci_dmabuf_ops;
+	exp_info.size = size;
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
+	priv->revoked = !status_ok;
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
@@ -300,7 +337,6 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 {
 	struct vfio_device_feature_dma_buf get_dma_buf = {};
 	struct vfio_region_dma_range *dma_ranges;
-	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct vfio_pci_dma_buf *priv;
 	size_t length;
 	int ret;
@@ -369,46 +405,20 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	kfree(dma_ranges);
 	dma_ranges = NULL;
 
-	if (!vfio_device_try_get_registration(&vdev->vdev)) {
-		ret = -ENODEV;
+	ret = vfio_pci_dmabuf_export(vdev, priv, get_dma_buf.open_flags,
+				     priv->size,
+				     __vfio_pci_memory_enabled(vdev));
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
 	 */
 	ret = dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
-	if (ret < 0)
-		goto err_dma_buf;
-	return ret;
+	if (ret >= 0)
+		return ret;
 
-err_dma_buf:
 	dma_buf_put(priv->dmabuf);
-err_dev_put:
 	vfio_device_put_registration(&vdev->vdev);
 err_free_phys:
 	kfree(priv->phys_vec);
@@ -419,6 +429,61 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	return ret;
 }
 
+int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
+				   struct vm_area_struct *vma,
+				   u64 phys_start,
+				   u64 pgoff,
+				   u64 req_len)
+{
+	struct vfio_pci_dma_buf *priv;
+	const unsigned int nr_ranges = 1;
+	int ret;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->phys_vec = kcalloc(nr_ranges, sizeof(*priv->phys_vec),
+				 GFP_KERNEL);
+	if (!priv->phys_vec) {
+		ret = -ENOMEM;
+		goto err_free_priv;
+	}
+
+	priv->vdev = vdev;
+	priv->nr_ranges = nr_ranges;
+	priv->size = req_len;
+	priv->phys_vec[0].paddr = phys_start + (pgoff << PAGE_SHIFT);
+	priv->phys_vec[0].len = req_len;
+
+	/*
+	 * Creates a DMABUF, adds it to vdev->dmabufs list for
+	 * tracking (meaning cleanup or revocation will zap them), and
+	 * registers with vfio_device:
+	 */
+	ret = vfio_pci_dmabuf_export(vdev, priv, O_CLOEXEC, priv->size, true);
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
index 5cc8c85a2153..5fd3a6e00a0e 100644
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
@@ -128,6 +129,9 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
 			      unsigned long address,
 			      unsigned int order,
 			      unsigned long *out_pfn);
+int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
+				   struct vm_area_struct *vma,
+				   u64 phys_start, u64 pgoff, u64 req_len);
 
 #ifdef CONFIG_VFIO_PCI_DMABUF
 int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
-- 
2.47.3



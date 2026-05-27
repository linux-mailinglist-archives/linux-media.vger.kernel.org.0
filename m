Return-Path: <linux-media+bounces-62866-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMbZJW3HFmpVrwcAu9opvQ
	(envelope-from <linux-media+bounces-62866-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:29:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2033F5E2B4A
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04A583066A87
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CF53F167C;
	Wed, 27 May 2026 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="mBkEP+7h"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5403F0A9E;
	Wed, 27 May 2026 10:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877440; cv=none; b=sefG4LXafrbM7Y2tuJhkrTX1AGyPoIYPeWpBz0eC2ruiTURfCUY3+aBj2b3VE8fp0wjQ8xHSPi3Rr79LzQQK3k1Llcz6aaPnwXMnm6jSJZcMd8Iy54oBcjrAoj675ZkdTkZFSEbuhUT3HsG9qU2nyVIsElLgRUipVIwqkWPnvig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877440; c=relaxed/simple;
	bh=/ZWxarv3AE81fMxzHYBMsdTe2MZ+6AnCBgKeRE/bKk8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tkxBJdB/MpwAyBjOFu/5xYsvtNyYCqF07XWOpi8Uv2nS6x5by9rcNqzMjoUQ+JD930lB5bv7Cf6m9OFNBXcRkzzhcnIWp9BAGC1BbmTTtAaBqrEgopmWzVQiFmmDjHP2bj8piJE/Uz58GVCLDp9ymg12p3JdBrXqJe1doRbHgEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=mBkEP+7h; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R6Idd12507771;
	Wed, 27 May 2026 03:23:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=Yuf1e99Hyt9m1Y+SOOekZ0anPKoS02wo2j6VEIXeXMg=; b=mBkEP+7hQfUH
	SAYv2vG+a/uc1Cbfnzs79Jd7zwdaVO/7pQVLeviKZkbaiQ+KDtdq58vbDM8nL5kd
	Qv9QwSgpxcKjXFdTLXdMgfcP0qhPR3qFUZ/cEBaXF2QXRYKZiZJMk2Y0vYfIcaN4
	hRVASclojQjuQVvQ4FCwMcVQdXDl616niFvjFeySXbp0yvmGXX+MHsiHifhTwfSl
	Ow5ZihL/a8Ggfzpz53B+rKyzyU5swMyeaOuOiiz1SCNvXesIuFLpRis0IUxGWSIp
	61g9q0F+TtFauidQxZ+wfgUnJUALU9qIiZE2fPaYGyp9uOO3OODFfwwx1CKx+tq1
	YCB6EgPhFg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4edpnga485-18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 May 2026 03:23:36 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 27 May
 2026 10:23:35 +0000
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
Subject: [PATCH v2 3/9] vfio/pci: Add a helper to create a DMABUF for a BAR-map VMA
Date: Wed, 27 May 2026 03:23:06 -0700
Message-ID: <20260527102319.100128-4-mattev@meta.com>
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
X-Proofpoint-GUID: ldLGxNKgwkPJ6fDYNndm2sdErj-fsz_V
X-Authority-Analysis: v=2.4 cv=PME/P/qC c=1 sm=1 tr=0 ts=6a16c628 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=Dv35txUGz5gI0hTa:21 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=kkcUborcUVj0H7zxAXTl:22 a=VabnemYjAAAA:8
 a=nU6Csegrn5W5CUOfz84A:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEwMCBTYWx0ZWRfX3j17/4CUnBUa
 E91HJyg2HDm1k5qdWHPJ/Yd7P0V5mbrJWqCWr0lC/uecb1QHqZnPi7mMjSpV0Q0W8z/pi4jDioF
 CZaSqu0LuRumuaROo880Azue7AAI62b/R2fw15uS8oxW68l1hMhJOlu5oFJt6WX1rli6DIDOLvL
 f/jOZXcgV3qTrbIErJeyv1eJanUtxTWvLbSqgVmZC+qYA3N5uzzBg5KLfY9apBiUVU38d+JIMzm
 dd974AvBv0MLFeHI20xOqPAM52G2UedBthv5giwrNPj2uvpupdUEIJeZUpLugqXEvdtKVYJpGFf
 UpGlzSE/NKuomgmnZRiVnY3RS82zX0Kn4RSNvqXIDIkEBRbaYnoN9UE3m1ZCZv6rcX45En22q++
 CsLySv3SkF9hLcJ43L7XFzfKiY9Uf9IxkEwcdzs7Tv6e+DQrRT1PydiQvZxN0RPgkTybU0H6w0w
 Ot9/X+N6BPJkEqlg3xw==
X-Proofpoint-ORIG-GUID: ldLGxNKgwkPJ6fDYNndm2sdErj-fsz_V
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
	TAGGED_FROM(0.00)[bounces-62866-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 2033F5E2B4A
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
 drivers/vfio/pci/vfio_pci_dmabuf.c | 140 ++++++++++++++++++++++-------
 drivers/vfio/pci/vfio_pci_priv.h   |   5 ++
 2 files changed, 115 insertions(+), 30 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 0d132c4ca95f..782408c08a5e 100644
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
@@ -222,6 +224,45 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
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
@@ -340,7 +381,6 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 {
 	struct vfio_device_feature_dma_buf get_dma_buf = {};
 	struct vfio_region_dma_range *dma_ranges;
-	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct vfio_pci_dma_buf *priv;
 	size_t length;
 	int ret;
@@ -400,34 +440,9 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
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
@@ -438,8 +453,6 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 
 	return ret;
 
-err_dev_put:
-	vfio_device_put_registration(&vdev->vdev);
 err_free_phys:
 	kfree(priv->phys_vec);
 err_free_priv:
@@ -449,6 +462,73 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	return ret;
 }
 
+int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
+				   struct vm_area_struct *vma,
+				   u64 phys_start, u64 req_len,
+				   unsigned int res_index)
+{
+	struct vfio_pci_dma_buf *priv;
+	const unsigned int nr_ranges = 1;
+	unsigned long vma_pgoff = vma->vm_pgoff & (VFIO_PCI_OFFSET_MASK >> PAGE_SHIFT);
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
+	 * The DMABUF begins from the mmap()'s BAR offset, i.e. the
+	 * start of the VMA corresponds to byte 0 of the DMABUF and
+	 * byte (vma_pgoff << PAGE_SHIFT) of the BAR.
+	 *
+	 * vfio_pci_dma_buf_find_pfn() reverses this offset using
+	 * vma_pgoff_adjust, so that ultimately a fault's offset from
+	 * the start of the _VMA_ has a consistent usage whether the
+	 * VMA originates from an mmap() of the VFIO device here or a
+	 * direct DMABUF mmap().
+	 */
+	priv->vdev = vdev;
+	priv->size = req_len;
+	priv->nr_ranges = nr_ranges;
+	priv->vma_pgoff_adjust = vma_pgoff;
+	priv->provider = pcim_p2pdma_provider(vdev->pdev, res_index);
+	if (!priv->provider) {
+		ret = -EINVAL;
+		goto err_free_phys;
+	}
+
+	priv->phys_vec[0].paddr = phys_start + ((u64)vma_pgoff << PAGE_SHIFT);
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
index c8f6f959056a..06dc0fd3e230 100644
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
@@ -133,6 +134,10 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
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



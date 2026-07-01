Return-Path: <linux-media+bounces-66267-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tb4mGvxKRWrW+AoAu9opvQ
	(envelope-from <linux-media+bounces-66267-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:14:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED636F03EC
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:14:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=Qv46fvvC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66267-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66267-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 913613057065
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 17:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1621399D02;
	Wed,  1 Jul 2026 17:13:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7140538BF72;
	Wed,  1 Jul 2026 17:13:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925998; cv=none; b=i31kFjZpEncaq7c04pjrPa40yFu4tgdgoqQ4xZRUJznoKbgBV1dp2t3mJA9vfGY+6F8GUlc75KpvkGemyOWoF7nIUal1Oy0A8AINnSAXJADe8fy1v0prPcqtEgjAoWOzAGig8yTgDeqWlsF46+VDTV3Xa2q4wlXooz7RekU9UyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925998; c=relaxed/simple;
	bh=zKRvAar4JbqCXjdZJUyBQ3ACkebWFeOes02niF9TSuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ruAJ0ZLhc6scNlX+v29yJvns0ebDfMezsT0fXcdhonltbZmYqo6gmbnMauiqM6X7qhh0w6yQETl33aXIqmw0W0OUbzxq6uaUTDO84l3OcejD82h/o20mjBGFxj4Pu1OoQCxrS4ienuqaya/K4ES4iKuoLpUaXOSWLJ3nLkmjqYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=Qv46fvvC; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1782925995;
	bh=eY93fh2KSDLyniZWo9od85k9kjH1JtWK4SZcHMqiklM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qv46fvvCVfKZJTQbHw56M6fpkZ7STIm1Au92glt1i5V3VZH9k97QHmflkIb80BF4M
	 NQndvCvV4A7mncW1E0o1GaUwkx2aTEEctoAAGEJ5NxJf8qpgkU458Y+F9M0OPFGDMJ
	 AoDMq7BCZRGPwrGYlf2yYlQwuzh9CXGNIe87vQ4RifuD5QVhbn/lIvwGeVp0RSyKqe
	 rZI5VJYpV74/IseCI3bY+9oKwivn/9gcA3mfxDZy4m0TpycR1bUl2xk6dD5jgOEcVf
	 DtB/Ye4qGUZuoQX8l1/JiArpEvoubK5WvVBIQIWM3hZreKjfIa4wOwsca4ffhvB3/f
	 DQhjTX/ctK6BA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gr66L0ySdz4wgb;
	Thu, 02 Jul 2026 03:13:14 +1000 (AEST)
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
Subject: [PATCH v4 04/10] vfio/pci: Add a helper to create a DMABUF for a BAR-map VMA
Date: Wed,  1 Jul 2026 18:12:16 +0100
Message-ID: <20260701171245.90111-5-matt@ozlabs.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66267-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3ED636F03EC

This helper, vfio_pci_core_mmap_prep_dmabuf(), creates a single-range
DMABUF for the purpose of mapping a PCI BAR.  This is used in a future
commit by VFIO's ordinary mmap() path.

This function transfers ownership of the VFIO device fd to the
DMABUF, which fput()s when it's released.

Refactor the existing vfio_pci_core_feature_dma_buf() to split out
export code common to the two paths, VFIO_DEVICE_FEATURE_DMA_BUF and
this new VFIO_BAR mmap().

Signed-off-by: Matt Evans <matt@ozlabs.org>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 142 +++++++++++++++++++++++------
 drivers/vfio/pci/vfio_pci_priv.h   |   5 +
 2 files changed, 117 insertions(+), 30 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 2e9adc3fe0f7..9a80acc1ab19 100644
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
@@ -233,6 +235,45 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *priv,
 	return ret;
 }
 
+/*
+ * Create a DMABUF corresponding to priv, add it to vdev->dmabufs list
+ * for tracking (meaning cleanup or revocation will zap it), and take
+ * a vfio_device registration.
+ */
+static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
+				  struct vfio_pci_dma_buf *priv, u32 flags)
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
@@ -351,7 +392,6 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 {
 	struct vfio_device_feature_dma_buf get_dma_buf = {};
 	struct vfio_region_dma_range *dma_ranges;
-	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct vfio_pci_dma_buf *priv;
 	size_t length;
 	int ret;
@@ -411,34 +451,9 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
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
@@ -449,8 +464,6 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 
 	return ret;
 
-err_dev_put:
-	vfio_device_put_registration(&vdev->vdev);
 err_free_phys:
 	kfree(priv->phys_vec);
 err_free_priv:
@@ -460,6 +473,75 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	return ret;
 }
 
+int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
+				   struct vm_area_struct *vma,
+				   u64 phys_start, u64 req_len,
+				   unsigned int res_index)
+{
+	struct vfio_pci_dma_buf *priv;
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
+	priv->nr_ranges = 1;
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
+	 * Ownership of the DMABUF file transfers to the VMA so that
+	 * other users can locate the DMABUF via a VA.  Ownership of
+	 * the original VFIO device file being mmap()ed transfers to
+	 * priv, and is put when the DMABUF is released.  This
+	 * intentionally does not use get_file()/vma_set_file()
+	 * because the references are already held, and ownership
+	 * moves.
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
2.50.1 (Apple Git-155)



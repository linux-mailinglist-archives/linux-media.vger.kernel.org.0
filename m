Return-Path: <linux-media+bounces-64482-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UBhMLamNKWpwZQMAu9opvQ
	(envelope-from <linux-media+bounces-64482-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:15:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F34366B46E
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:15:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=qz0aAdJz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64482-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64482-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 193B53030927
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF684B8DFB;
	Wed, 10 Jun 2026 15:45:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C644943E49B;
	Wed, 10 Jun 2026 15:44:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106300; cv=none; b=dOQQ24xozJ61sNz/2rsGiJSBuJhGcSNt+x7j0XQ9tD+dHselp9g2NwxrChEMU9RmfbGbJ8YEjiD1xceomeSuqzFEMEM+0G7Qi05NRwbpJZfUXxD5yYuCEX2f8+B+XRYONtoG2m868O+DjPMLzrKF7B7/KUHd7WYoZmrKYnifzUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106300; c=relaxed/simple;
	bh=WfY2dVh5XOkd0pj54ZERKahxR2OZEnju4GymnSzedsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mkTeio/sfSXHOBPu7IQpyDweRHDc9N9efFFXBhOTs3dOusOY9FpcdWkxnSh5CvLe2KOyG5HxzZptn1fXnXmMJUbMnaG5TWgV9Qhwyn9ViV8bF4oMnlRaYoVoyU2SOw9Ye3tzO3chJVRjBUCfORPZUvVDV8PYjVS9ogMwF0p64ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=qz0aAdJz; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1781106297;
	bh=vq4Co5UCuZiCB6S/1h9DN6xspuD9NojY/on5I5eQX6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qz0aAdJzmhg/zhg2cccHdqbn/LHf0E/rNf0yeEt9+g/AKyZR2/3pTPFD9On4EZJ1U
	 eJBFgGUzwmb+ZZ4Gl8otVyxKdwzIXa1wd2schkd8GoOSPGdVPHvqlLX5Ru/vHu8zwG
	 PUm4qxWGUuBkLhZCEtu+iT9yzS3wQf0XguW+/Y11PEcRIpZioqHU9vrxHjS1elfq8i
	 pN5IfgbnxZjC8P+4Mt2lTIQwRcY0Oa1ExcOIDcyIXwgD8Qzr3EuP3tJAYk8cLlvShs
	 19hEe6aoEHNvaAh8z3bZ/ovI0BIPP4m0MnunplyeAhUhR2mOdBa16SxuptamG5ltRR
	 uQ3CkoCwW9ZZw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gb9883Mycz4x87;
	Thu, 11 Jun 2026 01:44:56 +1000 (AEST)
From: Matt Evans <matt@ozlabs.org>
To: Alex Williamson <alex@shazbot.org>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>
Cc: Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v3 8/9] vfio/pci: Permanently revoke a DMABUF on request
Date: Wed, 10 Jun 2026 16:43:22 +0100
Message-ID: <20260610154327.37758-9-matt@ozlabs.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610154327.37758-1-matt@ozlabs.org>
References: <20260610154327.37758-1-matt@ozlabs.org>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64482-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:dkim,ozlabs.org:email,ozlabs.org:mid,ozlabs.org:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F34366B46E

Expand the VFIO DMABUF revocation state to three states:
Not revoked, temporarily revoked, and permanently revoked.

The first two are for existing transient revocation, e.g. across a
function reset, and the DMABUF is put into the last in response to a
new VFIO feature VFIO_DEVICE_FEATURE_DMA_BUF.

VFIO_DEVICE_FEATURE_DMA_BUF passes a DMABUF by fd and requests that
the DMABUF is permanently revoked.  On success, it's guaranteed that
the buffer can never be imported/attached/mmap()ed in future, that
dynamic imports have been cleanly detached, and that all mappings have
been made inaccessible/PTEs zapped.

This is useful for lifecycle management, to reclaim VFIO PCI BAR
ranges previously delegated to a subordinate client process: The
driver process can ensure that the loaned resources are revoked when
the client is deemed "done", and exported ranges can be safely re-used
elsewhere.

Refactor the revocation code out of vfio_pci_dma_buf_move() to a
function common to move and the new feature request path.

Signed-off-by: Matt Evans <matt@ozlabs.org>
---
 drivers/vfio/pci/vfio_pci_core.c   |   6 +-
 drivers/vfio/pci/vfio_pci_dmabuf.c | 169 ++++++++++++++++++++++-------
 drivers/vfio/pci/vfio_pci_priv.h   |  19 +++-
 include/uapi/linux/vfio.h          |  20 ++++
 4 files changed, 173 insertions(+), 41 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 508a5eca910a..064906b25467 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1573,6 +1573,8 @@ int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
 	case VFIO_DEVICE_FEATURE_DMA_BUF:
 		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
+	case VFIO_DEVICE_FEATURE_DMA_BUF_REVOKE:
+		return vfio_pci_core_feature_dma_buf_revoke(vdev, flags, arg, argsz);
 	default:
 		return -ENOTTY;
 	}
@@ -1784,7 +1786,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 
 	dma_resv_lock(priv->dmabuf->resv, NULL);
 
-	if (priv->revoked) {
+	if (priv->status != VFIO_PCI_DMABUF_OK) {
 		pr_debug_ratelimited("%s VA 0x%lx, pgoff 0x%lx: DMABUF revoked/cleaned up\n",
 				     __func__, vmf->address, vma->vm_pgoff);
 		dma_resv_unlock(priv->dmabuf->resv);
@@ -1809,7 +1811,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 
 	scoped_guard(rwsem_read, &vdev->memory_lock) {
 		/* Revocation status must be re-read, under memory_lock */
-		if (!priv->revoked) {
+		if (priv->status == VFIO_PCI_DMABUF_OK) {
 			int pres = vfio_pci_dma_buf_find_pfn(priv, vma,
 							     vmf->address,
 							     order, &pfn);
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 2fb09a2c0f6b..b47411992ab6 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -19,7 +19,7 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 	if (!attachment->peer2peer)
 		return -EOPNOTSUPP;
 
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return -ENODEV;
 
 	if (!dma_buf_attach_revocable(attachment))
@@ -41,7 +41,7 @@ static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *
 	 * still safe because the fault handler ultimately prevents
 	 * access to a revoked buffer if it isn't caught here.
 	 */
-	if (READ_ONCE(priv->revoked))
+	if (READ_ONCE(priv->status) != VFIO_PCI_DMABUF_OK)
 		return -ENODEV;
 	if ((vma->vm_flags & VM_SHARED) == 0)
 		return -EINVAL;
@@ -81,7 +81,7 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
 
 	dma_resv_assert_held(priv->dmabuf->resv);
 
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return ERR_PTR(-ENODEV);
 
 	ret = dma_buf_phys_vec_to_sgt(attachment, priv->provider,
@@ -291,7 +291,8 @@ static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
 	INIT_LIST_HEAD(&priv->dmabufs_elm);
 	down_write(&vdev->memory_lock);
 	dma_resv_lock(priv->dmabuf->resv, NULL);
-	priv->revoked = !__vfio_pci_memory_enabled(vdev);
+	priv->status = __vfio_pci_memory_enabled(vdev) ? VFIO_PCI_DMABUF_OK :
+		VFIO_PCI_DMABUF_TEMP_REVOKED;
 	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
 	dma_resv_unlock(priv->dmabuf->resv);
 	up_write(&vdev->memory_lock);
@@ -322,7 +323,7 @@ int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
 		return -EOPNOTSUPP;
 
 	priv = attachment->dmabuf->priv;
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return -ENODEV;
 
 	/* More than one range to iommufd will require proper DMABUF support */
@@ -591,6 +592,64 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 	return ret;
 }
 
+/* Set the DMABUF's revocation status (OK or temporarily/permanently revoked) */
+static void vfio_pci_dma_buf_set_status(struct vfio_pci_dma_buf *priv,
+					enum vfio_pci_dma_buf_status new_status)
+{
+	bool was_revoked;
+
+	lockdep_assert_held_write(&priv->vdev->memory_lock);
+
+	if (priv->status == VFIO_PCI_DMABUF_PERM_REVOKED ||
+	    priv->status == new_status) {
+		return;
+	}
+
+	dma_resv_lock(priv->dmabuf->resv, NULL);
+	was_revoked = (priv->status == VFIO_PCI_DMABUF_TEMP_REVOKED);
+
+	if (new_status != VFIO_PCI_DMABUF_OK) {
+		priv->status = new_status; /* Temp or permanently revoked */
+
+		if (was_revoked) {
+			/*
+			 * TEMP_REVOKED is being upgraded to
+			 * PERM_REVOKED.  The buffer is already gone,
+			 * don't wait on it again.
+			 */
+			dma_resv_unlock(priv->dmabuf->resv);
+			return;
+		}
+	}
+
+	dma_buf_invalidate_mappings(priv->dmabuf);
+	dma_resv_wait_timeout(priv->dmabuf->resv,
+			      DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
+	dma_resv_unlock(priv->dmabuf->resv);
+	if (new_status != VFIO_PCI_DMABUF_OK) {
+		kref_put(&priv->kref, vfio_pci_dma_buf_done);
+		wait_for_completion(&priv->comp);
+		unmap_mapping_range(priv->dmabuf->file->f_mapping,
+				    0, priv->size, 1);
+		/*
+		 * Re-arm the registered kref reference and the
+		 * completion so the post-revoke state matches the
+		 * post-creation state.	 An un-revoke followed by a
+		 * new mapping needs the kref to be non-zero before
+		 * kref_get(), and vfio_pci_dma_buf_cleanup()
+		 * delegates its drain back through this revoke
+		 * path on a possibly-already-revoked dma-buf.
+		 */
+		kref_init(&priv->kref);
+		reinit_completion(&priv->comp);
+	} else {
+		dma_resv_lock(priv->dmabuf->resv, NULL);
+		priv->status = VFIO_PCI_DMABUF_OK;
+		dma_resv_unlock(priv->dmabuf->resv);
+	}
+}
+
 void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 {
 	struct vfio_pci_dma_buf *priv;
@@ -599,44 +658,15 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 	lockdep_assert_held_write(&vdev->memory_lock);
 	/*
 	 * Holding memory_lock ensures a racing VMA fault observes
-	 * priv->revoked properly.
+	 * priv->status properly.
 	 */
 
 	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
 		if (!get_file_active(&priv->dmabuf->file))
 			continue;
-
-		if (priv->revoked != revoked) {
-			dma_resv_lock(priv->dmabuf->resv, NULL);
-			if (revoked)
-				priv->revoked = true;
-			dma_buf_invalidate_mappings(priv->dmabuf);
-			dma_resv_wait_timeout(priv->dmabuf->resv,
-					      DMA_RESV_USAGE_BOOKKEEP, false,
-					      MAX_SCHEDULE_TIMEOUT);
-			dma_resv_unlock(priv->dmabuf->resv);
-			if (revoked) {
-				kref_put(&priv->kref, vfio_pci_dma_buf_done);
-				wait_for_completion(&priv->comp);
-				unmap_mapping_range(priv->dmabuf->file->f_mapping,
-						    0, priv->size, 1);
-				/*
-				 * Re-arm the registered kref reference and the
-				 * completion so the post-revoke state matches the
-				 * post-creation state.  An un-revoke followed by a
-				 * new mapping needs the kref to be non-zero before
-				 * kref_get(), and vfio_pci_dma_buf_cleanup()
-				 * delegates its drain back through this revoke
-				 * path on a possibly-already-revoked dma-buf.
-				 */
-				kref_init(&priv->kref);
-				reinit_completion(&priv->comp);
-			} else {
-				dma_resv_lock(priv->dmabuf->resv, NULL);
-				priv->revoked = false;
-				dma_resv_unlock(priv->dmabuf->resv);
-			}
-		}
+		vfio_pci_dma_buf_set_status(priv, revoked ?
+					    VFIO_PCI_DMABUF_TEMP_REVOKED :
+					    VFIO_PCI_DMABUF_OK);
 		fput(priv->dmabuf->file);
 	}
 }
@@ -668,3 +698,66 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 	}
 	up_write(&vdev->memory_lock);
 }
+
+#ifdef CONFIG_VFIO_PCI_DMABUF
+int vfio_pci_core_feature_dma_buf_revoke(
+	struct vfio_pci_core_device *vdev, u32 flags,
+	struct vfio_device_feature_dma_buf_revoke __user *arg,
+	size_t argsz)
+{
+	struct vfio_device_feature_dma_buf_revoke db_revoke;
+	struct vfio_pci_dma_buf *priv;
+	struct dma_buf *dmabuf;
+	int ret;
+
+	if (!vdev->pci_ops || !vdev->pci_ops->get_dmabuf_phys)
+		return -EOPNOTSUPP;
+
+	ret = vfio_check_feature(flags, argsz,
+				 VFIO_DEVICE_FEATURE_SET,
+				 sizeof(db_revoke));
+	if (ret != 1)
+		return ret;
+
+	if (copy_from_user(&db_revoke, arg, sizeof(db_revoke)))
+		return -EFAULT;
+
+	dmabuf = dma_buf_get(db_revoke.dmabuf_fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	priv = dmabuf->priv;
+	/*
+	 * Sanity-check the DMABUF is really a vfio_pci_dma_buf _and_
+	 * relates to the VFIO device it was provided with.
+	 *
+	 * If the DMABUF relates to this vdev then priv->vdev is
+	 * stable because this open fd prevents cleanup.
+	 *
+	 * If it relates to a different vdev, reading priv->vdev might
+	 * race with a concurrent cleanup on that device.  But if so,
+	 * it points to a non-matching vdev or NULL and is unusable
+	 * either way.
+	 */
+	if (dmabuf->ops != &vfio_pci_dmabuf_ops ||
+	    READ_ONCE(priv->vdev) != vdev) {
+		ret = -ENODEV;
+		goto out_put_buf;
+	}
+
+	scoped_guard(rwsem_write, &vdev->memory_lock) {
+		if (priv->status == VFIO_PCI_DMABUF_PERM_REVOKED) {
+			ret = -EBADFD;
+		} else {
+			vfio_pci_dma_buf_set_status(priv,
+						    VFIO_PCI_DMABUF_PERM_REVOKED);
+			ret = 0;
+		}
+	}
+
+out_put_buf:
+	dma_buf_put(dmabuf);
+
+	return ret;
+}
+#endif /* CONFIG_VFIO_PCI_DMABUF */
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index db2e2aeae88f..3c2f2575b670 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -23,6 +23,12 @@ struct vfio_pci_ioeventfd {
 	bool			test_mem;
 };
 
+enum vfio_pci_dma_buf_status {
+	VFIO_PCI_DMABUF_OK = 0,
+	VFIO_PCI_DMABUF_TEMP_REVOKED = 1,
+	VFIO_PCI_DMABUF_PERM_REVOKED = 2,
+};
+
 struct vfio_pci_dma_buf {
 	struct dma_buf *dmabuf;
 	struct vfio_pci_core_device *vdev;
@@ -35,7 +41,7 @@ struct vfio_pci_dma_buf {
 	struct kref kref;
 	struct completion comp;
 	unsigned long vma_pgoff_adjust;
-	u8 revoked : 1;
+	enum vfio_pci_dma_buf_status status;
 };
 
 extern const struct vm_operations_struct vfio_pci_mmap_ops;
@@ -148,6 +154,10 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
 int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 				  struct vfio_device_feature_dma_buf __user *arg,
 				  size_t argsz);
+int vfio_pci_core_feature_dma_buf_revoke(
+	struct vfio_pci_core_device *vdev, u32 flags,
+	struct vfio_device_feature_dma_buf_revoke __user *arg,
+	size_t argsz);
 #else
 static inline int
 vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
@@ -156,6 +166,13 @@ vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 {
 	return -ENOTTY;
 }
+static inline int vfio_pci_core_feature_dma_buf_revoke(
+	struct vfio_pci_core_device *vdev, u32 flags,
+	struct vfio_device_feature_dma_buf_revoke __user *arg,
+	size_t argsz)
+{
+	return -ENOTTY;
+}
 #endif
 
 #endif
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 5de618a3a5ee..697c0bb4b9bc 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1534,6 +1534,26 @@ struct vfio_device_feature_dma_buf {
  */
 #define VFIO_DEVICE_FEATURE_MIG_PRECOPY_INFOv2  12
 
+/**
+ * Given a dma_buf fd previously created by
+ * VFIO_DEVICE_FEATURE_DMA_BUF, a SET of this feature requests that
+ * access to the corresponding DMABUF is immediately and permanently
+ * revoked.  On successful return, the buffer is not accessible
+ * through any mmap() or dma-buf import.  The buffer is permanently
+ * disabled, and VFIO refuses all map, mmap, attach, etc. requests.
+ *
+ * Return: 0 on success, -1 and errno is set on failure:
+ *
+ *  EBADF, EINVAL: dmabuf_fd is not a DMABUF fd.
+ *  ENODEV: The dmabuf_fd does not match this VFIO device.
+ *  EBADFD: The DMABUF is already revoked.
+ */
+#define VFIO_DEVICE_FEATURE_DMA_BUF_REVOKE 13
+
+struct vfio_device_feature_dma_buf_revoke {
+	__s32	dmabuf_fd;
+};
+
 /* -------- API for Type1 VFIO IOMMU -------- */
 
 /**
-- 
2.50.1 (Apple Git-155)



Return-Path: <linux-media+bounces-62873-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFC3Cw/HFmpVrwcAu9opvQ
	(envelope-from <linux-media+bounces-62873-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:27:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C03865E2AF3
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A111F30448CA
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1393F888A;
	Wed, 27 May 2026 10:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="hRjql4s7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CC33B5846;
	Wed, 27 May 2026 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877466; cv=none; b=e2uTa1rDkBqaxEyMGibvJO1qmBXYNHvDQ/tWsihgS+gpTY3feOBqaC0FGcrpjeQimNuaIA3f2U5MG1B4JZAv8n81nOHO2EjdT98zCA7WZOOwHVbbX/1TSU7VPCh7asRu3GlB1LIRxCN79rkohdnRUL2uCYcGj+tRY6cwpi+kRJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877466; c=relaxed/simple;
	bh=gXmqQgOY3MoDdgrghS3/WxvlEk6KZJMxjRC5hrfhQVk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jq563YkQZPbkCfplYzxhRk88RJ1L+DXvvpwCR3ZRdLBRKX8g7wQPHuV0rT+jy7B5yzPrb8yY/h9OuCYnL53m8/uiD3hvqH9VVSidA5kHCGEoHPjyS694Cv15iyL0N9PsQ6KDP84xOudBdJrc3PIHDoZVixLiIvAK11nom/qbKt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=hRjql4s7; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R6blq12159197;
	Wed, 27 May 2026 03:23:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=ZixgUTNQUyVbAGjzEHapm+pMGUGzkDhRb4vcBz7Wr1U=; b=hRjql4s7bz3s
	4Vgx4rt781bmGwkydDfKuLoQLrj5ywu+V4flYU1VRspYnNVQFN7BTrzrkd6BZX68
	vj7W9K58ilKBjWW1OIohmCQF0meDaOILDK4hQAkBWm97hcZgGsONBsEATqjS9jy2
	OKfRbqbkf6J+FHdc1V30ASHSijxuqhIUnBwFQ5Pg8i6hCocy2vQkpxI9JKwxtEvs
	3wiViyFQO6DkD+fYqiZaWL/U64Y9UtT8ZALtDKM/6tUbiAMr8CtGtzcTugha3Epl
	FEmksD004YkRD726LBZLLqqUkLoQZCZj6sb8IbTO3TBAH5CAD2qq1sSI0QRk3l9c
	2FgO+u2TzQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4edugs0x99-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 May 2026 03:23:59 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::7cb7) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 27 May
 2026 10:23:57 +0000
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
Subject: [PATCH v2 8/9] vfio/pci: Permanently revoke a DMABUF on request
Date: Wed, 27 May 2026 03:23:11 -0700
Message-ID: <20260527102319.100128-9-mattev@meta.com>
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
X-Authority-Analysis: v=2.4 cv=D4537PRj c=1 sm=1 tr=0 ts=6a16c63f cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=VabnemYjAAAA:8 a=H5rW_VwydN-1pwcJZSMA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: 6m3oTYDHo4rBVsAK3cdFCdh0p9msGDEe
X-Proofpoint-GUID: 6m3oTYDHo4rBVsAK3cdFCdh0p9msGDEe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEwMCBTYWx0ZWRfX7W6ACu/MGsNJ
 806ayi1obUxtor1wHahQavfnb0uB7iCKn+2VdevWQzzMoXf12a7peFYsYcg26UUbGSWdgDTAjnY
 Ez0dMVnBg7//nL1AiTMfvJW+7afDutgP5PkaHRuoqOymq8WODvdPwBnLeN/jC/fv9CS0480gE39
 O7eOCCxF0pCh+Oiu1t5SD6lfpc8jsZan5J+SqpVSsD1RjhUNLtbta/azUhKgdQMu7AwXKqVxcrG
 d3202JA0qrE9aaQxafgiCU5HXvhaUa6B7wKKZBUUHOkSRbJtsTWtN+86DgKj7evmbcwpDCs0Xto
 2dFXn+0z/zTMRNegCjL2PWz7htkMdALd2/4ZzR63/tpVsN5vceuR90KBXscgP+8Kq/5m/Zuubhb
 VhEVnsQTIpfQwIDnzbU8Z/sFVOHAgRverSFgLModT1QR0W0ozcmFi+0NHMEhFEAfX1N/9OMWtla
 s1Ix53bgu2VdGcWZp8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
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
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-62873-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,meta.com:email,meta.com:mid,meta.com:dkim]
X-Rspamd-Queue-Id: C03865E2AF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Expand the VFIO DMABUF revocation state to three states:
Not revoked, temporarily revoked, and permanently revoked.

The first two are for existing transient revocation, e.g. across a
function reset, and the DMABUF is put into the last in response to a
new ioctl(VFIO_DEVICE_PCI_DMABUF_REVOKE) request.

This VFIO device fd ioctl() passes a DMABUF by fd and requests that
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
function common to move and the new ioctl path.

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/vfio_pci_core.c   |  21 ++++-
 drivers/vfio/pci/vfio_pci_dmabuf.c | 146 +++++++++++++++++++++--------
 drivers/vfio/pci/vfio_pci_priv.h   |  14 ++-
 include/uapi/linux/vfio.h          |  30 ++++++
 4 files changed, 170 insertions(+), 41 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 41e049fa9a8a..5184b3cac160 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1500,6 +1500,21 @@ static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
 				  ioeventfd.fd);
 }
 
+static int vfio_pci_ioctl_dmabuf_revoke(struct vfio_pci_core_device *vdev,
+					struct vfio_pci_dmabuf_revoke __user *arg)
+{
+	unsigned long minsz = offsetofend(struct vfio_pci_dmabuf_revoke, dmabuf_fd);
+	struct vfio_pci_dmabuf_revoke revoke;
+
+	if (copy_from_user(&revoke, arg, minsz))
+		return -EFAULT;
+
+	if (revoke.argsz < minsz)
+		return -EINVAL;
+
+	return vfio_pci_dma_buf_revoke(vdev, revoke.dmabuf_fd);
+}
+
 long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 			 unsigned long arg)
 {
@@ -1522,6 +1537,8 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 		return vfio_pci_ioctl_reset(vdev, uarg);
 	case VFIO_DEVICE_SET_IRQS:
 		return vfio_pci_ioctl_set_irqs(vdev, uarg);
+	case VFIO_DEVICE_PCI_DMABUF_REVOKE:
+		return vfio_pci_ioctl_dmabuf_revoke(vdev, uarg);
 	default:
 		return -ENOTTY;
 	}
@@ -1792,7 +1809,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 	dma_resv_lock(priv->dmabuf->resv, NULL);
 	vdev = READ_ONCE(priv->vdev);
 
-	if (priv->revoked || !vdev) {
+	if (priv->status != VFIO_PCI_DMABUF_OK || !vdev) {
 		pr_debug_ratelimited("%s VA 0x%lx, pgoff 0x%lx: DMABUF revoked/cleaned up\n",
 				     __func__, vmf->address, vma->vm_pgoff);
 		dma_resv_unlock(priv->dmabuf->resv);
@@ -1815,7 +1832,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 
 	scoped_guard(rwsem_read, &vdev->memory_lock) {
 		/* Revocation status must be re-read, under memory_lock */
-		if (!priv->revoked) {
+		if (priv->status == VFIO_PCI_DMABUF_OK) {
 			int pres = vfio_pci_dma_buf_find_pfn(priv, vma,
 							     vmf->address,
 							     order, &pfn);
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 4b3b15655f1d..3fa14760898f 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -19,7 +19,7 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 	if (!attachment->peer2peer)
 		return -EOPNOTSUPP;
 
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return -ENODEV;
 
 	if (!dma_buf_attach_revocable(attachment))
@@ -32,7 +32,7 @@ static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *
 {
 	struct vfio_pci_dma_buf *priv = dmabuf->priv;
 
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return -ENODEV;
 	if ((vma->vm_flags & VM_SHARED) == 0)
 		return -EINVAL;
@@ -72,7 +72,7 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
 
 	dma_resv_assert_held(priv->dmabuf->resv);
 
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return ERR_PTR(-ENODEV);
 
 	ret = dma_buf_phys_vec_to_sgt(attachment, priv->provider,
@@ -287,7 +287,8 @@ static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
 	INIT_LIST_HEAD(&priv->dmabufs_elm);
 	down_write(&vdev->memory_lock);
 	dma_resv_lock(priv->dmabuf->resv, NULL);
-	priv->revoked = !__vfio_pci_memory_enabled(vdev);
+	priv->status = __vfio_pci_memory_enabled(vdev) ? VFIO_PCI_DMABUF_OK :
+		VFIO_PCI_DMABUF_TEMP_REVOKED;
 	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
 	dma_resv_unlock(priv->dmabuf->resv);
 	up_write(&vdev->memory_lock);
@@ -318,7 +319,7 @@ int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
 		return -EOPNOTSUPP;
 
 	priv = attachment->dmabuf->priv;
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return -ENODEV;
 
 	/* More than one range to iommufd will require proper DMABUF support */
@@ -585,6 +586,63 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 	return ret;
 }
 
+static void __vfio_pci_dma_buf_revoke(struct vfio_pci_dma_buf *priv, bool revoked,
+				      bool permanently)
+{
+	bool was_revoked;
+
+	lockdep_assert_held_write(&priv->vdev->memory_lock);
+
+	if ((priv->status == VFIO_PCI_DMABUF_PERM_REVOKED) ||
+	    (priv->status == VFIO_PCI_DMABUF_OK && !revoked) ||
+	    (priv->status == VFIO_PCI_DMABUF_TEMP_REVOKED && revoked && !permanently)) {
+		return;
+	}
+
+	dma_resv_lock(priv->dmabuf->resv, NULL);
+	was_revoked = priv->status != VFIO_PCI_DMABUF_OK;
+
+	if (revoked)
+		priv->status = permanently ? VFIO_PCI_DMABUF_PERM_REVOKED :
+			VFIO_PCI_DMABUF_TEMP_REVOKED;
+
+	/*
+	 * If TEMP_REVOKED is being upgraded to PERM_REVOKED, the
+	 * buffer is already gone.  Don't wait on it again.
+	 */
+	if (was_revoked && revoked) {
+		dma_resv_unlock(priv->dmabuf->resv);
+		return;
+	}
+
+	dma_buf_invalidate_mappings(priv->dmabuf);
+	dma_resv_wait_timeout(priv->dmabuf->resv,
+			      DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
+	dma_resv_unlock(priv->dmabuf->resv);
+	if (revoked) {
+		kref_put(&priv->kref, vfio_pci_dma_buf_done);
+		wait_for_completion(&priv->comp);
+		unmap_mapping_range(priv->dmabuf->file->f_mapping,
+				    0, priv->size, 1);
+		/*
+		 * Re-arm the registered kref reference and the
+		 * completion so the post-revoke state matches the
+		 * post-creation state.  An un-revoke followed by a
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
@@ -593,44 +651,13 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
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
+		__vfio_pci_dma_buf_revoke(priv, revoked, false);
 		fput(priv->dmabuf->file);
 	}
 }
@@ -662,3 +689,46 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 	}
 	up_write(&vdev->memory_lock);
 }
+
+#ifdef CONFIG_VFIO_PCI_DMABUF
+int vfio_pci_dma_buf_revoke(struct vfio_pci_core_device *vdev, int dmabuf_fd)
+{
+	struct vfio_pci_dma_buf *priv;
+	struct dma_buf *dmabuf;
+	int ret = 0;
+
+	dmabuf = dma_buf_get(dmabuf_fd);
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
+	if (dmabuf->ops != &vfio_pci_dmabuf_ops || priv->vdev != vdev) {
+		ret = -ENODEV;
+		goto out_put_buf;
+	}
+
+	scoped_guard(rwsem_write, &vdev->memory_lock) {
+		if (priv->status == VFIO_PCI_DMABUF_PERM_REVOKED)
+			ret = -EBADFD;
+		else
+			__vfio_pci_dma_buf_revoke(priv, true, true);
+	}
+
+ out_put_buf:
+	dma_buf_put(dmabuf);
+
+	return ret;
+}
+#endif /* CONFIG_VFIO_PCI_DMABUF */
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index db2e2aeae88f..a1e0f4fcb1dc 100644
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
@@ -148,6 +154,7 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
 int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 				  struct vfio_device_feature_dma_buf __user *arg,
 				  size_t argsz);
+int vfio_pci_dma_buf_revoke(struct vfio_pci_core_device *vdev, int dmabuf_fd);
 #else
 static inline int
 vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
@@ -156,6 +163,11 @@ vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 {
 	return -ENOTTY;
 }
+static inline int vfio_pci_dma_buf_revoke(struct vfio_pci_core_device *vdev,
+					  int dmabuf_fd)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 5de618a3a5ee..02366e9f8e16 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1321,6 +1321,36 @@ struct vfio_precopy_info {
 
 #define VFIO_MIG_GET_PRECOPY_INFO _IO(VFIO_TYPE, VFIO_BASE + 21)
 
+/**
+ * VFIO_DEVICE_PCI_DMABUF_REVOKE - _IO(VFIO_TYPE, VFIO_BASE + 22)
+ *
+ * This ioctl is used on the device FD, and requests that access to
+ * the buffer corresponding to the DMABUF FD parameter is immediately
+ * and permanently revoked.  On successful return, the buffer is not
+ * accessible through any mmap() or dma-buf import.  The request fails
+ * if the buffer is pinned; otherwise, the exporter marks the buffer
+ * as inaccessible and uses the move_notify callback to inform
+ * importers of the change.  The buffer is permanently disabled, and
+ * VFIO refuses all map, mmap, attach, etc. requests.
+ *
+ * Returns:
+ *
+ * Return: 0 on success, -1 and errno set on failure:
+ *
+ *  ENODEV if the associated dmabuf FD no longer exists/is closed,
+ *         or is not a DMABUF created for this device.
+ *  EINVAL if the dmabuf_fd parameter isn't a DMABUF.
+ *  EBADF if the dmabuf_fd parameter isn't a valid file number.
+ *  EBADFD if the buffer has already been revoked.
+ *
+ */
+struct vfio_pci_dmabuf_revoke {
+	__u32 argsz;
+	__s32 dmabuf_fd;
+};
+
+#define VFIO_DEVICE_PCI_DMABUF_REVOKE _IO(VFIO_TYPE, VFIO_BASE + 22)
+
 /*
  * Upon VFIO_DEVICE_FEATURE_SET, allow the device to be moved into a low power
  * state with the platform-based power management.  Device use of lower power
-- 
2.47.3



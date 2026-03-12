Return-Path: <linux-media+bounces-55533-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPGNGn0Ks2kMRwAAu9opvQ
	(envelope-from <linux-media+bounces-55533-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:48:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB012774C4
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CEB83092661
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90594401A33;
	Thu, 12 Mar 2026 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="u2tzEWYC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2BB3FFABB;
	Thu, 12 Mar 2026 18:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341225; cv=none; b=YYHZ2sfuGHG14jzOJ444t1GUvWVlt5KmkX9gihDXYK1y3kMZjndA1VifVLYgSdoyZI4so+io96ryts5cro9Y4ikseZ8JF61+LZ/QWd1hsMj7CF6hHoEYOZbvzLBdCkWMPl/dbX0T1DWjwkf/sFqWBletzob1xkrYlyRc6o+iEPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341225; c=relaxed/simple;
	bh=Utw/Es7pXLWXcN8K+dQHB/cNk/s8HBwsdfPDuj6wStA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O+Xr5yQz4NoqKHeQKGyTKKcOh2sJK8unkHS+OQvUSx0J15HP7E6N9vJ1/kR4sBh1S6rkLGM911app7hz/dzpIWXxcgr+8+nCirGuQ68NsRxF74oTctGes6imMME2qBW/gnMj4qHslmv4gtI8tYtk7KsBqeVTdCAitVFtBZF2gQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=u2tzEWYC; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CGlVwu2379095;
	Thu, 12 Mar 2026 11:46:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=S9Q1m7Yawtoc96ydzMvMquqkIEeOdQ3R30MlZU1sEBY=; b=u2tzEWYCBQ0d
	NrjMBD7z6OjDS9pcEp0bjxszrsZbfPEzpKzEDTKyf9t8TcI+4LjeopaZRnvW/uLj
	ePfgZ73J8LVPgh/p5na7fEPbHX/HNInQn0aPsWlv9K0QQknKxh9wrXVJEkRm1ALj
	CRGeu+R3wp9ehtnCXZpww3ZyiH1wTKFPQPv7YGdVA0gKmfA8CNjEZ8gC+WWH4hrn
	Fx3dYAX/xQnX/pN+aO8besxYJ2zBwmzKiI/Uwm1bsO1kmleaEp8yamHJcRAbFOLF
	10Ng60bzPECiaKlHwxzjNEq1FzIsOtFReokMAaXpkWo1qhiah+1UZkTDF4V84Y2d
	Fk8qtNOdng==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cv1araj18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 11:46:49 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:fe::f072) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 12 Mar
 2026 18:46:48 +0000
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
Subject: [RFC v2 PATCH 08/10] vfio/pci: Permanently revoke a DMABUF on request
Date: Thu, 12 Mar 2026 11:46:06 -0700
Message-ID: <20260312184613.3710705-9-mattev@meta.com>
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
X-Proofpoint-ORIG-GUID: l-6exdQ2mUDfMVKoUXcgg-AHq58Jx64f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MSBTYWx0ZWRfX59qQJdyiusot
 LNnaykwobaXYBrYKroTvvZzrcI5N57VMUK1Q61CVooUv3SyN3/O9tC/U1PLMVRFDmZoeQ11vbAQ
 M4ocF8/R+KdtA9fi1ZRLHNKDS4jXfymZSk+HwDXaY7UVPqxS/AF/nQJFbRfDCxc4Tlkk51b4yYS
 bnTU4/k02zchJJA9uUdmqq8RqAz1C4U3QjRtie3zDbgXoAsTt0X4v0G3sUlz0ywRTBZKFdiR5HK
 e6aXjTCgu0ZJb5udPCVPMF1qdB4iZkttzyXsI/bynOkCSQPm3wX7fsRbY2Di8mdIfEMzMNaTZ6L
 JHGjZ6PDeSriTlx5qPLaB2OFNTsdO0+7iyfArxuGX57yihDDH2qPTwzQ6uHdsPrMzgdVfAjDgpf
 rWXLVZmtnLJel+qDqxn03BXlKf3mYd/f1j7Y18k9WbhawIQF0AUFm/pOmTV+l+vbOZiiJ+5Gy1T
 P+MaGJGHAwJc2pbO9Kw==
X-Proofpoint-GUID: l-6exdQ2mUDfMVKoUXcgg-AHq58Jx64f
X-Authority-Analysis: v=2.4 cv=NYPrFmD4 c=1 sm=1 tr=0 ts=69b30a19 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=VabnemYjAAAA:8 a=GvNw_QJiROG6ZKnmDkIA:9
 a=gKebqoRLp9LExxC7YDUY:22
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
	TAGGED_FROM(0.00)[bounces-55533-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: EEB012774C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Expand the VFIO DMABUF revocation state to three states:
Not revoked, temporarily revoked, and permanently revoked.

The first two are for existing transient revocation, e.g. across a
function reset, and the DMABUF is put into the last in response to a
new ioctl(VFIO_DEVICE_PCI_DMABUF_REVOKE) request.

This VFIO device fd ioctl passes a DMABUF by fd and requests that the
DMABUF is permanently revoked.  On success, it's guaranteed that the
buffer can never be imported/attached/mmap()ed in future, that dynamic
imports have been cleanly detached, and all mappings made
inaccessible/PTEs zapped.

This is useful for lifecycle management, to reclaim VFIO PCI BAR
ranges previously delegated to a subordinate client process: The
driver process can ensure that the loaned resources are revoked when
the client is deemed "done", and exported ranges can be safely re-used
elsewhere.

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/vfio_pci_core.c   |  16 +++-
 drivers/vfio/pci/vfio_pci_dmabuf.c | 136 ++++++++++++++++++++---------
 drivers/vfio/pci/vfio_pci_priv.h   |  14 ++-
 include/uapi/linux/vfio.h          |  30 +++++++
 4 files changed, 154 insertions(+), 42 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 4f411a0b980c..c7760dd3a5f0 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1461,6 +1461,18 @@ static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
 				  ioeventfd.fd);
 }
 
+static int vfio_pci_ioctl_dmabuf_revoke(struct vfio_pci_core_device *vdev,
+					struct vfio_device_ioeventfd __user *arg)
+{
+	unsigned long minsz = offsetofend(struct vfio_pci_dmabuf_revoke, dmabuf_fd);
+	struct vfio_pci_dmabuf_revoke revoke;
+
+	if (copy_from_user(&revoke, arg, minsz))
+		return -EFAULT;
+
+	return vfio_pci_dma_buf_revoke(vdev, revoke.dmabuf_fd);
+}
+
 long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 			 unsigned long arg)
 {
@@ -1483,6 +1495,8 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 		return vfio_pci_ioctl_reset(vdev, uarg);
 	case VFIO_DEVICE_SET_IRQS:
 		return vfio_pci_ioctl_set_irqs(vdev, uarg);
+	case VFIO_DEVICE_PCI_DMABUF_REVOKE:
+		return vfio_pci_ioctl_dmabuf_revoke(vdev, uarg);
 	default:
 		return -ENOTTY;
 	}
@@ -1690,7 +1704,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 			 * change occurs whilst holding memory_lock,
 			 * so protects against racing faults.
 			 */
-			if (priv->revoked)
+			if (priv->status != VFIO_PCI_DMABUF_OK)
 				ret = VM_FAULT_SIGBUS;
 			else
 				ret = vfio_pci_vmf_insert_pfn(vdev, vmf, pfn, order);
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index ab665db66904..362207cf7e71 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -18,7 +18,7 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 	if (!attachment->peer2peer)
 		return -EOPNOTSUPP;
 
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return -ENODEV;
 
 	if (!dma_buf_attach_revocable(attachment))
@@ -32,7 +32,7 @@ static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *
 	struct vfio_pci_dma_buf *priv = dmabuf->priv;
 	u64 req_len, req_start;
 
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
@@ -243,7 +243,8 @@ static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
 	INIT_LIST_HEAD(&priv->dmabufs_elm);
 	down_write(&vdev->memory_lock);
 	dma_resv_lock(priv->dmabuf->resv, NULL);
-	priv->revoked = !status_ok;
+	priv->status = status_ok ? VFIO_PCI_DMABUF_OK :
+		VFIO_PCI_DMABUF_TEMP_REVOKED;
 	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
 	dma_resv_unlock(priv->dmabuf->resv);
 	up_write(&vdev->memory_lock);
@@ -274,7 +275,7 @@ int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
 		return -EOPNOTSUPP;
 
 	priv = attachment->dmabuf->priv;
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return -ENODEV;
 
 	/* More than one range to iommufd will require proper DMABUF support */
@@ -518,6 +519,48 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 	return ret;
 }
 
+static void __vfio_pci_dma_buf_revoke(struct vfio_pci_dma_buf *priv, bool revoked,
+				      bool permanently)
+{
+	if ((priv->status == VFIO_PCI_DMABUF_PERM_REVOKED) ||
+	    (priv->status == VFIO_PCI_DMABUF_OK && !revoked) ||
+	    (priv->status == VFIO_PCI_DMABUF_TEMP_REVOKED && revoked && !permanently)) {
+		return;
+	}
+
+	dma_resv_lock(priv->dmabuf->resv, NULL);
+	if (revoked)
+		priv->status = permanently ?
+			VFIO_PCI_DMABUF_PERM_REVOKED : VFIO_PCI_DMABUF_TEMP_REVOKED;
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
+	} else {
+		/*
+		 * Kref is initialize again, because when revoke
+		 * was performed the reference counter was decreased
+		 * to zero to trigger completion.
+		 */
+		kref_init(&priv->kref);
+		/*
+		 * There is no need to wait as no mapping was
+		 * performed when the previous status was
+		 * priv->status == *REVOKED.
+		 */
+		reinit_completion(&priv->comp);
+		dma_resv_lock(priv->dmabuf->resv, NULL);
+		priv->status = VFIO_PCI_DMABUF_OK;
+		dma_resv_unlock(priv->dmabuf->resv);
+	}
+}
+
 void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 {
 	struct vfio_pci_dma_buf *priv;
@@ -526,45 +569,13 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
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
-			} else {
-				/*
-				 * Kref is initialize again, because when revoke
-				 * was performed the reference counter was decreased
-				 * to zero to trigger completion.
-				 */
-				kref_init(&priv->kref);
-				/*
-				 * There is no need to wait as no mapping was
-				 * performed when the previous status was
-				 * priv->revoked == true.
-				 */
-				reinit_completion(&priv->comp);
-				dma_resv_lock(priv->dmabuf->resv, NULL);
-				priv->revoked = false;
-				dma_resv_unlock(priv->dmabuf->resv);
-			}
-		}
+		__vfio_pci_dma_buf_revoke(priv, revoked, false);
 		fput(priv->dmabuf->file);
 	}
 }
@@ -582,7 +593,7 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 		dma_resv_lock(priv->dmabuf->resv, NULL);
 		list_del_init(&priv->dmabufs_elm);
 		priv->vdev = NULL;
-		priv->revoked = true;
+		priv->status = VFIO_PCI_DMABUF_PERM_REVOKED;
 		dma_buf_invalidate_mappings(priv->dmabuf);
 		dma_resv_wait_timeout(priv->dmabuf->resv,
 				      DMA_RESV_USAGE_BOOKKEEP, false,
@@ -597,3 +608,48 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 	}
 	up_write(&vdev->memory_lock);
 }
+
+#ifdef CONFIG_VFIO_PCI_DMABUF
+int vfio_pci_dma_buf_revoke(struct vfio_pci_core_device *vdev, int dmabuf_fd)
+{
+	struct vfio_pci_core_device *db_vdev;
+	struct dma_buf *dmabuf;
+	struct vfio_pci_dma_buf *priv;
+	int ret = 0;
+
+	dmabuf = dma_buf_get(dmabuf_fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	/*
+	 * The DMABUF is a user-provided fd, so sanity-check it's
+	 * really a vfio_pci_dma_buf _and_ relates to the VFIO device
+	 * that it was provided for:
+	 */
+	if (dmabuf->ops != &vfio_pci_dmabuf_ops) {
+		ret = -ENODEV;
+		goto out_put_buf;
+	}
+
+	priv = dmabuf->priv;
+	db_vdev = READ_ONCE(priv->vdev);
+
+	if (!db_vdev || db_vdev != vdev) {
+		ret = -ENODEV;
+		goto out_put_buf;
+	}
+
+	scoped_guard(rwsem_read, &vdev->memory_lock) {
+		if (priv->status == VFIO_PCI_DMABUF_PERM_REVOKED) {
+			ret = -EBADFD;
+			break;
+		}
+		__vfio_pci_dma_buf_revoke(priv, true, true);
+	}
+
+ out_put_buf:
+	dma_buf_put(dmabuf);
+
+	return ret;
+}
+#endif /* CONFIG_VFIO_PCI_DMABUF */
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index b16a8d22563c..c5a9e06bf81a 100644
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
@@ -34,7 +40,7 @@ struct vfio_pci_dma_buf {
 	u32 nr_ranges;
 	struct kref kref;
 	struct completion comp;
-	u8 revoked : 1;
+	enum vfio_pci_dma_buf_status status;
 };
 
 extern const struct vm_operations_struct vfio_pci_mmap_ops;
@@ -140,6 +146,7 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
 int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 				  struct vfio_device_feature_dma_buf __user *arg,
 				  size_t argsz);
+int vfio_pci_dma_buf_revoke(struct vfio_pci_core_device *vdev, int dmabuf_fd);
 #else
 static inline int
 vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
@@ -148,6 +155,11 @@ vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
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
index bb7b89330d35..c1b3fa880aa1 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1307,6 +1307,36 @@ struct vfio_precopy_info {
 
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
+	__u32 dmabuf_fd;
+};
+
+#define VFIO_DEVICE_PCI_DMABUF_REVOKE _IO(VFIO_TYPE, VFIO_BASE + 22)
+
 /*
  * Upon VFIO_DEVICE_FEATURE_SET, allow the device to be moved into a low power
  * state with the platform-based power management.  Device use of lower power
-- 
2.47.3



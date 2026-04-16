Return-Path: <linux-media+bounces-58893-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IjdB6Xj4GlhnAAAu9opvQ
	(envelope-from <linux-media+bounces-58893-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:27:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC73740ECCE
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E247B31C0C88
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080653CEB9C;
	Thu, 16 Apr 2026 13:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="fJpOY5fp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B613C5DDD;
	Thu, 16 Apr 2026 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345549; cv=none; b=n6yFZ27jfePfhPi+gB6N4lLuT49Z6dTJqKTDfRmTpJ1p4Zgbuz8Ecm8iTmL8DlNMGliK8N3yVLvm14r8gjcbqg2c47KvYZfFo+fNk0I03P49Ba+CiHk0c0A2GSAmK/GlPg4V4ISfI2hf6LKTGx2i2UZSMvvmhPXmgyhiS8bkhTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345549; c=relaxed/simple;
	bh=FPcFx4FLZmXjsG+TRRDApVERsLIzaZw4whndiCZkRkk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K6VYM9f/q0O0FP+vidfZ6SF2BQRB+dPNiKENFjulg66IL11NXB20jQlMrMTZjbRaNSwluhy3t219YSKqOwoxvYuL1wTAuj8kcelzUrcmNg1/vacYQnIP5QyWcFonx83v86OlpYiSwkSMkGTNZ7JOetmUHUc7tL/Q6mtTWxRC3dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=fJpOY5fp; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FMSs604138810;
	Thu, 16 Apr 2026 06:18:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=SEN56UVYmy5rvuhAOFv6AeV2YQpGpOxPS75j442IO94=; b=fJpOY5fpkqby
	52ddaA5Glwu2fMTzGD4tbq3QY4+i5o4ksKNRSg83D66dLokxIx7zHuYBUPcZTWL9
	5eFkQyrRDTFYjgHNNkfx8cxJLf4WipoIvLfHngxNTXbyNVyoLLaaSYFy111l0QHX
	fZbZohlGFMNYcaCCmFvlxpR7HDlZfxfRitTEUfz8Ib/McLXPSyxOac7TcMfEIKH8
	ttb9rS2am70d2Bps4+eMwDHUP2Gc2PFTxIRMQkZnDStuYVDZOEjBeNUmLQT5itUO
	yGTKWwyxSVYf8Uac1fmldYE9xnxhl++SjFV0AzWJZGM9YY0oXzlAPQh1TK9WV7zC
	7LyyeVLYGw==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dh84w1rnh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Apr 2026 06:18:53 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:fe::f072) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Thu, 16 Apr
 2026 13:18:52 +0000
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
Subject: [PATCH 8/9] vfio/pci: Permanently revoke a DMABUF on request
Date: Thu, 16 Apr 2026 06:17:51 -0700
Message-ID: <20260416131815.2729131-9-mattev@meta.com>
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
X-Proofpoint-ORIG-GUID: Ozw6H9Amcb7foMieE6xO4OrJT8cNdKRh
X-Authority-Analysis: v=2.4 cv=OYioyBTY c=1 sm=1 tr=0 ts=69e0e1bd cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_1IyUuN4QrATX339ibzo:22 a=VabnemYjAAAA:8 a=JgBNHPj_VUcJpbbFxpoA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyNiBTYWx0ZWRfX2vBVezmgynAl
 4Jeypb3sgty5/5OH9xcz+plKJsTMvLft4uSz+qx8cBuOQTCmFPGtDLkmtIv1uFe+P1CM1uBHbTc
 wIpC3KlkTA1qzW8qXD5FFInpwf5mg0Q6gq+psFMS7i8E450z+sDsZMG6PrIYuSiJPlv1XNnlQDg
 566NK8hZqp/gd3UsIItCiA0YJZ47f6lS0oPjKf2+xWHXlxYE4OWiNZPgLPI/nHS1/ngLAvTzv5Y
 m/9soJAKbuzl6cCH5Oh27hBth/L5gYyaPwDZODkXrL8jPue+DEr9ecKTDAQZEkJa+DupP3s59nw
 jQJxVQk+WFJ1WJ3IHUVVkWwsqKxGikk25hCqFZDCQEhnH/9Vhw3HDr8U7YnWSjk0eBIeeCLsQxB
 6Dea+guPLwNyxHWXV4pAHfiisgKrx6VYQiKhz2nZ2+ev/9zDTxeNIvJV0VMiy+LHKDXTJ7yXsud
 dqzrU+U4hP8BMqz+BuQ==
X-Proofpoint-GUID: Ozw6H9Amcb7foMieE6xO4OrJT8cNdKRh
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
	TAGGED_FROM(0.00)[bounces-58893-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: AC73740ECCE
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
 drivers/vfio/pci/vfio_pci_core.c   |  21 +++-
 drivers/vfio/pci/vfio_pci_dmabuf.c | 158 +++++++++++++++++++++--------
 drivers/vfio/pci/vfio_pci_priv.h   |  14 ++-
 include/uapi/linux/vfio.h          |  30 ++++++
 4 files changed, 179 insertions(+), 44 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index cad126cf8737..59582fcfba97 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1461,6 +1461,21 @@ static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
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
@@ -1483,6 +1498,8 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 		return vfio_pci_ioctl_reset(vdev, uarg);
 	case VFIO_DEVICE_SET_IRQS:
 		return vfio_pci_ioctl_set_irqs(vdev, uarg);
+	case VFIO_DEVICE_PCI_DMABUF_REVOKE:
+		return vfio_pci_ioctl_dmabuf_revoke(vdev, uarg);
 	default:
 		return -ENOTTY;
 	}
@@ -1752,7 +1769,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 	dma_resv_lock(priv->dmabuf->resv, NULL);
 	vdev = READ_ONCE(priv->vdev);
 
-	if (READ_ONCE(priv->revoked) || !vdev) {
+	if (READ_ONCE(priv->status) != VFIO_PCI_DMABUF_OK || !vdev) {
 		pr_debug_ratelimited("%s VA 0x%lx, pgoff 0x%lx: DMABUF revoked/cleaned up\n",
 				     __func__, vmf->address, vma->vm_pgoff);
 		dma_resv_unlock(priv->dmabuf->resv);
@@ -1774,7 +1791,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 	dma_resv_unlock(priv->dmabuf->resv);
 
 	scoped_guard(rwsem_read, &vdev->memory_lock) {
-		if (!READ_ONCE(priv->revoked)) {
+		if (READ_ONCE(priv->status) == VFIO_PCI_DMABUF_OK) {
 			int pres = vfio_pci_dma_buf_find_pfn(priv, vma,
 							     vmf->address,
 							     order, &pfn);
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index cc477f46a7d5..48ec4da2db8b 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -19,7 +19,7 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 	if (!attachment->peer2peer)
 		return -EOPNOTSUPP;
 
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return -ENODEV;
 
 	if (!dma_buf_attach_revocable(attachment))
@@ -33,7 +33,7 @@ static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *
 	struct vfio_pci_dma_buf *priv = dmabuf->priv;
 	u64 req_len, req_start;
 
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return -ENODEV;
 	if ((vma->vm_flags & VM_SHARED) == 0)
 		return -EINVAL;
@@ -73,7 +73,7 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
 
 	dma_resv_assert_held(priv->dmabuf->resv);
 
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return ERR_PTR(-ENODEV);
 
 	ret = dma_buf_phys_vec_to_sgt(attachment, priv->provider,
@@ -270,7 +270,8 @@ static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
 	INIT_LIST_HEAD(&priv->dmabufs_elm);
 	down_write(&vdev->memory_lock);
 	dma_resv_lock(priv->dmabuf->resv, NULL);
-	priv->revoked = !__vfio_pci_memory_enabled(vdev);
+	priv->status = __vfio_pci_memory_enabled(vdev) ? VFIO_PCI_DMABUF_OK :
+		VFIO_PCI_DMABUF_TEMP_REVOKED;
 	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
 	dma_resv_unlock(priv->dmabuf->resv);
 	up_write(&vdev->memory_lock);
@@ -301,7 +302,7 @@ int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
 		return -EOPNOTSUPP;
 
 	priv = attachment->dmabuf->priv;
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return -ENODEV;
 
 	/* More than one range to iommufd will require proper DMABUF support */
@@ -581,6 +582,64 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
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
+		priv->status = permanently ?
+			VFIO_PCI_DMABUF_PERM_REVOKED : VFIO_PCI_DMABUF_TEMP_REVOKED;
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
@@ -589,45 +648,13 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
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
@@ -647,8 +674,8 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 		dma_resv_lock(priv->dmabuf->resv, NULL);
 		list_del_init(&priv->dmabufs_elm);
 		priv->vdev = NULL;
-		was_revoked = priv->revoked;
-		priv->revoked = true;
+		was_revoked = (priv->status != VFIO_PCI_DMABUF_OK);
+		priv->status = VFIO_PCI_DMABUF_PERM_REVOKED;
 		dma_buf_invalidate_mappings(priv->dmabuf);
 		dma_resv_wait_timeout(priv->dmabuf->resv,
 				      DMA_RESV_USAGE_BOOKKEEP, false,
@@ -665,3 +692,52 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 	}
 	up_write(&vdev->memory_lock);
 }
+
+#ifdef CONFIG_VFIO_PCI_DMABUF
+int vfio_pci_dma_buf_revoke(struct vfio_pci_core_device *vdev, int dmabuf_fd)
+{
+	struct dma_buf *dmabuf;
+	struct vfio_pci_dma_buf *priv;
+	int ret = 0;
+
+	dmabuf = dma_buf_get(dmabuf_fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	/*
+	 * Sanity-check the DMABUF is really a vfio_pci_dma_buf _and_
+	 * (below) relates to the VFIO device it was provided with:
+	 */
+	if (dmabuf->ops != &vfio_pci_dmabuf_ops) {
+		ret = -ENODEV;
+		goto out_put_buf;
+	}
+
+	priv = dmabuf->priv;
+
+	scoped_guard(rwsem_write, &vdev->memory_lock) {
+		struct vfio_pci_core_device *db_vdev = READ_ONCE(priv->vdev);
+
+		/*
+		 * Reading priv->vdev inside the lock is conservative,
+		 * because cleanup (changes vdev) is (today) prevented
+		 * from running concurrently by the VFIO device fd
+		 * being held open by the caller, ioctl.
+		 */
+		if (!db_vdev || db_vdev != vdev) {
+			ret = -ENODEV;
+			break;
+		}
+
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
index f837d6c8bddc..eac5606ca161 100644
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
@@ -147,6 +153,7 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
 int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 				  struct vfio_device_feature_dma_buf __user *arg,
 				  size_t argsz);
+int vfio_pci_dma_buf_revoke(struct vfio_pci_core_device *vdev, int dmabuf_fd);
 #else
 static inline int
 vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
@@ -155,6 +162,11 @@ vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
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
index 5de618a3a5ee..77225ed8115f 100644
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



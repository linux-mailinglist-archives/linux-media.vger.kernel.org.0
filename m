Return-Path: <linux-media+bounces-55531-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC5sOVYKs2kMRwAAu9opvQ
	(envelope-from <linux-media+bounces-55531-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:47:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E4D2774A6
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D94DE30234E2
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E25D4014BA;
	Thu, 12 Mar 2026 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="WqHNbiOg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02733FFAB7;
	Thu, 12 Mar 2026 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341223; cv=none; b=WQK5vNQsJtL1pN1748qIGpQFEKatq3yGZmioS6rX49xk21dLggfS8fVlMWF1wNmUFfaSzDJP09Z53eG/kNgEzs09GuQlrWxSVAcFunljvM1JHEaDXlnsKMOZzVpjICDfH/p0mVrgF1zQsoULm/iqZsGAkPBk/TyciXaP34nN2TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341223; c=relaxed/simple;
	bh=GOdY4wd/HctSiuzrEenqd9IFEk1ypoMJCGQ+RTBImuI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ooq8ZqgKCYhdb1uUxINf2o0AmA6fgIrUqV13dIwb0V7WdJ1Dus38zaFlpcKodwBGZPSR4h5s/hdfbeQFIiFA9Hh3LuF9wWyispDBzacuHor+xG+RQDmoyYrBQbxnskHdUHYCru9X3Vy2h/9XjbMTA+PqcBxHY3KTayEfU9pCmoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=WqHNbiOg; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 62CHs6k0736979;
	Thu, 12 Mar 2026 11:46:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=nQ0NTbM3AYdSaDAlDnUoFAR+oIqF3e53gqfw5fumC6Q=; b=WqHNbiOgtMnY
	KZUFTmRb3szCrdLPMjbW82ZJ4f+Yd6pTF/t0z5cyQHLp3GjRgOpqO84wNDRMAUXN
	sPtKykZ7Gu26/iyb+w56QmWG1kClfIHg8rINgCb8RxepzufDo33g0IvjvxFdyhFp
	WFXdRjuYNUgcWreJAWQuiAwYjpvOtxRDa7OhWDew7IWP4/Jpy6+bihLjle+rfcZZ
	S0rFxVPZNzMiC0JVem4/dqBAqN8GIIcu8MYVhr+zVkLxv1ucZ3XJHGkX+74BGDLx
	ob7ycZCWuTsz7ngATDO7YqmHxQitBsmKXH9d9by39AS1kngVKSkHGOJ8n7GjfujC
	rAg7Ud12KA==
Received: from mail.thefacebook.com ([163.114.134.16])
	by m0001303.ppops.net (PPS) with ESMTPS id 4cv29xs1wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 11:46:47 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::7cb7) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 12 Mar
 2026 18:46:45 +0000
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
Subject: [RFC v2 PATCH 07/10] vfio/pci: Support mmap() of a VFIO DMABUF
Date: Thu, 12 Mar 2026 11:46:05 -0700
Message-ID: <20260312184613.3710705-8-mattev@meta.com>
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
X-Proofpoint-ORIG-GUID: c4yAgDi8HR127ryudnVYdfUUMGMNsyBC
X-Proofpoint-GUID: c4yAgDi8HR127ryudnVYdfUUMGMNsyBC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MSBTYWx0ZWRfX1ghAmUdJowLL
 XDJiTXWxmuLG6OXMjTliHOewYUs+dUs2dL/xf3iO8wLn+b93oHtBSh9h/D6d0OIzujYv+50wBTz
 DhSkcbN+miFYXRmgWdhBefPEw1COEWMkfzBsjYhgn4qQRBq23gBF4CLxAaqcjyP6sxvpbuFuVbQ
 vqar4s6btpbLJMQZRMWQPTUr+yYcU1VqqJO7emMOUZaP+LZWM4/VQcRgf0BE5Vrc/v3cEQL0I1S
 QCXo4n4bllgDadEPX8MBBT0dLyk5CvAvHoYCK6N0WfBwpcgxoDLzx75SSEKCZ9Lgl8SiPiQin3Q
 FTZh1kfpV+kZy5/kDs30o242q5+tt1E188j4rpR6UDq4m2QqgA3b7Th7YmgaxQQFJCOYp7kVtIb
 AkJ49JC6ETQMtTrX9UKD9/TNDq0RdMQSbTzRrgmzsf+rMIXuTHeVeZ89eN6t8/1XOVotMLTSWQj
 tB6Tv+a0XeFYQqQUeKg==
X-Authority-Analysis: v=2.4 cv=G4YR0tk5 c=1 sm=1 tr=0 ts=69b30a17 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=VabnemYjAAAA:8 a=uu1nMVSziu4KC_xke-YA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55531-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 78E4D2774A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A VFIO DMABUF can export a subset of a BAR to userspace by fd; add
support for mmap() of this fd.  This provides another route for a
process to map BARs, except one where the process can only map a specific
subset of a BAR represented by the exported DMABUF.

mmap() support enables userspace driver designs that safely delegate
access to BAR sub-ranges to other client processes by sharing a DMABUF
fd, without having to share the (omnipotent) VFIO device fd with them.

Since the main VFIO BAR mmap() path is now DMABUF-aware, this path
reuses the existing vm_ops.

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/vfio_pci_core.c   |  2 +-
 drivers/vfio/pci/vfio_pci_dmabuf.c | 28 ++++++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_priv.h   |  2 ++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 9e9ad97c2f7f..4f411a0b980c 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1712,7 +1712,7 @@ static vm_fault_t vfio_pci_mmap_page_fault(struct vm_fault *vmf)
 	return vfio_pci_mmap_huge_fault(vmf, 0);
 }
 
-static const struct vm_operations_struct vfio_pci_mmap_ops = {
+const struct vm_operations_struct vfio_pci_mmap_ops = {
 	.fault = vfio_pci_mmap_page_fault,
 #ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
 	.huge_fault = vfio_pci_mmap_huge_fault,
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 197f50365ee1..ab665db66904 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -26,6 +26,33 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 
 	return 0;
 }
+
+static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+	u64 req_len, req_start;
+
+	if (priv->revoked)
+		return -ENODEV;
+	if ((vma->vm_flags & VM_SHARED) == 0)
+		return -EINVAL;
+
+	req_len = vma->vm_end - vma->vm_start;
+	req_start = vma->vm_pgoff << PAGE_SHIFT;
+	if (req_start + req_len > priv->size)
+		return -EINVAL;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
+	/* See comments in vfio_pci_core_mmap() re VM_ALLOW_ANY_UNCACHED. */
+	vm_flags_set(vma, VM_ALLOW_ANY_UNCACHED | VM_IO | VM_PFNMAP |
+				  VM_DONTEXPAND | VM_DONTDUMP);
+	vma->vm_private_data = priv;
+	vma->vm_ops = &vfio_pci_mmap_ops;
+
+	return 0;
+}
 #endif /* CONFIG_VFIO_PCI_DMABUF */
 
 static void vfio_pci_dma_buf_done(struct kref *kref)
@@ -93,6 +120,7 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
 #ifdef CONFIG_VFIO_PCI_DMABUF
 	.attach = vfio_pci_dma_buf_attach,
+	.mmap = vfio_pci_dma_buf_mmap,
 #endif
 	.map_dma_buf = vfio_pci_dma_buf_map,
 	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index e201c96bbb14..b16a8d22563c 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -37,6 +37,8 @@ struct vfio_pci_dma_buf {
 	u8 revoked : 1;
 };
 
+extern const struct vm_operations_struct vfio_pci_mmap_ops;
+
 bool vfio_pci_intx_mask(struct vfio_pci_core_device *vdev);
 void vfio_pci_intx_unmask(struct vfio_pci_core_device *vdev);
 
-- 
2.47.3



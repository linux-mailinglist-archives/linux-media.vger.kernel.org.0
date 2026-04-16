Return-Path: <linux-media+bounces-58889-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBgBGEDj4GlhnAAAu9opvQ
	(envelope-from <linux-media+bounces-58889-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:25:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51B40EC71
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57CA6303AB76
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1C23C0601;
	Thu, 16 Apr 2026 13:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="E9q2FNnQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E949939E185;
	Thu, 16 Apr 2026 13:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345539; cv=none; b=FGplEm2sCGy9yLj9ImeOGEs/enXUdWKnFudexpKoBMXrdaguA6+YnF5+d1R61D54JbBkkP3S3hlqyp24nbTY+VRcciA6geiubMh9ULqD2b0iIDGdutC1hdGDDHkLgDMaYzjEn7nTamLNrr++d+C5gOCveN5ZOoYGUnfxutzIC/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345539; c=relaxed/simple;
	bh=9bJhLRPbBath4yLXd4IyGt3YpmfQ4OA4d3IgqdC3pUc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tYzKVnpevdmHamWlssBCIGZ+AIjT5X/Vtzw4+no4rNa7KXryMA0izNIK0ZJkvpZnm/EkAr+Q6IV7Nh1K5yx54j2WXxGi0RfoS+O8OyyRQA9kXnGZQbaS7q1ihoMslQmR62TovFM2C2NQ4SHtVHPDear3EX47JBa2L5m+uwRn/KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=E9q2FNnQ; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G4Q9pW3203131;
	Thu, 16 Apr 2026 06:18:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=iTNAuwSiBRgPAjZmQLfOkizde4HCQ7hisKa2aJG19b4=; b=E9q2FNnQLmSa
	quxk3DncgPKrbkIYi9lB3nr2phNOoFkscrZTlnxACXmFyI2NwAPjcf/iLlRjj8sE
	TAULw7QlVh0Qzlb+bkaNCXNMaVd7LdswBMdJk5nv5INkHV9UfBDjD9ZnOaov4o4Z
	v8vuoYod7YMiErd/AV8adAb/uqE0Xekxkj5hmCZx2l3jopOsMc4LxV8iIAb+1PL4
	ufXFon8jCcUMu4M1HkSSVnpaw/5czBWp87t3Pyxh2v8Djet09RUsa+unyW2v+0sb
	zvaozCTHZf3c5hlbs8NDxLf/SAH/XkJwuS/02rb2XIFCkGTwC5wZqmtKcjamnL3L
	Z1hWNPrL9Q==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dh8551x0w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Apr 2026 06:18:45 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1c::1b) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Thu, 16 Apr
 2026 13:18:44 +0000
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
Subject: [PATCH 5/9] vfio/pci: Provide a user-facing name for BAR mappings
Date: Thu, 16 Apr 2026 06:17:48 -0700
Message-ID: <20260416131815.2729131-6-mattev@meta.com>
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
X-Authority-Analysis: v=2.4 cv=Fuw1OWrq c=1 sm=1 tr=0 ts=69e0e1b5 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=kkcUborcUVj0H7zxAXTl:22 a=VabnemYjAAAA:8 a=3OuInECnMAfxEXBjkJUA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: KtX4RQyQeJBe1k-4hJ-K_Qc_DBJP82zF
X-Proofpoint-GUID: KtX4RQyQeJBe1k-4hJ-K_Qc_DBJP82zF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyNiBTYWx0ZWRfXyIzy/ycBhTVA
 vgHGBcFtAf77DgN8K4R6LrcYubNhG87+p9fIC9r4rPVeMA9bHO3AHATEDhirQvUHlA9GW7ojm5g
 zJ6aS0D1QhrVkaO8TRCpRsr1v6N4/JM4IOQqw1GVwLOI5AgpiGMmYvTE9iK9bTc9UAQSwMN+l2o
 6j2qc4DG7Q3orzdJbQtSBy/gviSj6r7izI9LSHiqaH+vGz6bxA4UZ+vCz/feu4R4mokVAb/Nam1
 XLhARODJwUhHLqufnpiZ57c5V+Cblju/Y1e87UxV80MwtqIwwL0z2/pPuxoqDbENPIs6pwAzS3P
 BWIAdEViJ3IZCNHY0lLcuypYu7X5GisqE9lUKVdzZnVLCAmHDeZ/QMzAPdZybdKeN5sWwZm5B0w
 mPuHlOcgq127JG5S8vxaWaLQiF3ZFZBwPxAM+K80YHiMbK4FD41M29SJLmbfepqqqAQaYW87YRI
 TMk96/pRjwKbdTtrueg==
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
	TAGGED_FROM(0.00)[bounces-58889-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: DC51B40EC71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since converting BAR mmap()s to using DMABUFs, we lose the original
device path in /proc/<pid>/maps, lsof, etc.  Generate a debug-oriented
synthetic 'filename' based on the cdev, plus BDF, plus resource index.

This applies only to BAR mappings via the VFIO device fd, as
explicitly-exported DMABUFs are named by userspace via the
DMA_BUF_SET_NAME ioctl.

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index a12432825e5e..04c7733fe712 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -4,6 +4,7 @@
 #include <linux/dma-buf-mapping.h>
 #include <linux/pci-p2pdma.h>
 #include <linux/dma-resv.h>
+#include <uapi/linux/dma-buf.h>
 
 #include "vfio_pci_priv.h"
 
@@ -467,6 +468,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 {
 	struct vfio_pci_dma_buf *priv;
 	const unsigned int nr_ranges = 1;
+	char *bufname;
 	int ret;
 
 	priv = kzalloc_obj(*priv);
@@ -479,6 +481,20 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 		goto err_free_priv;
 	}
 
+	bufname = kzalloc(DMA_BUF_NAME_LEN, GFP_KERNEL);
+	if (!bufname) {
+		ret = -ENOMEM;
+		goto err_free_phys;
+	}
+
+	/*
+	 * Maximum size of the friendly debug name is
+	 * vfio1234567890:ffff:ff:3f.7-9 = 30, which fits within
+	 * DMA_BUF_NAME_LEN.
+	 */
+	snprintf(bufname, DMA_BUF_NAME_LEN, "%s:%s/%x",
+		 dev_name(&vdev->vdev.device), pci_name(vdev->pdev), res_index);
+
 	/*
 	 * The mmap() request's vma->vm_offs might be non-zero, but
 	 * the DMABUF is created from _offset zero_ of the BAR.  The
@@ -501,7 +517,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 	priv->provider = pcim_p2pdma_provider(vdev->pdev, res_index);
 	if (!priv->provider) {
 		ret = -EINVAL;
-		goto err_free_phys;
+		goto err_free_name;
 	}
 
 	priv->phys_vec[0].paddr = phys_start;
@@ -509,7 +525,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 
 	ret = vfio_pci_dmabuf_export(vdev, priv, O_CLOEXEC | O_RDWR);
 	if (ret)
-		goto err_free_phys;
+		goto err_free_name;
 
 	/*
 	 * The VMA gets the DMABUF file so that other users can locate
@@ -521,8 +537,15 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
 	vma->vm_file = priv->dmabuf->file;
 	vma->vm_private_data = priv;
 
+	spin_lock(&priv->dmabuf->name_lock);
+	kfree(priv->dmabuf->name);
+	priv->dmabuf->name = bufname;
+	spin_unlock(&priv->dmabuf->name_lock);
+
 	return 0;
 
+err_free_name:
+	kfree(bufname);
 err_free_phys:
 	kfree(priv->phys_vec);
 err_free_priv:
-- 
2.47.3



Return-Path: <linux-media+bounces-62871-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKLgMBzIFmpVrwcAu9opvQ
	(envelope-from <linux-media+bounces-62871-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:31:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E93555E2C1B
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76CBC309AF4C
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7844F3F58C6;
	Wed, 27 May 2026 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="oDklvi3p"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647623E51CE;
	Wed, 27 May 2026 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877459; cv=none; b=LCQQZaUrXcSrvR5PhO9OOf9BSTQPrb8ywrXIEaI5eMJR8VRDuOUrMk40cA8d5xSuf4rpJFE4FWgPaehGqaXvO+iUpPtNA+q36rcqmcoT1U/VAIX8xRGy9JGRhqRa1M6x5sWiXxVhfgGIRF3WrgtsMy5EnV4YEWmcIfCYxIfi8BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877459; c=relaxed/simple;
	bh=o8/Uos2+gfnyfcJrdePV6OdJL2QRuEmEiET7CKM4BE4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=okTPjUsikXflfWLT1IJ9OJQDwDGGmCIEaU4VU+TgeJItp0FFj4JGeXm/6VV9IQZm7e+Yp/kk9uWYSHQxm+D8ibXtjR4QBw1JF6DL+a0387FwyH/iU7N9tYz56NKMMmgm7QLCHCFOIOfnCP2Rrz6C603QJeH+qws7iNDcFhx/arU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=oDklvi3p; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 64R3BPu42788695;
	Wed, 27 May 2026 03:23:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=lKKu0h9afTECSWfDN1dTmPgNktwiSaCV9lSdHiVErV0=; b=oDklvi3pd80N
	+lmPlK6nTAPp9nhZm6j4opcvHJUBQvl8CQDODqDOjWrIcZ+8z+2MNh1XnSsnxV9+
	I2gFHrauLsUBiPC8f0AA30BAU7xTXqlqIwVBxEHSFJVQrVrvn8puIdZCvH5bN3cL
	yXGagb3nSvdYbQ2Wk9hVVLjoIJjLd4huVhfKXS8Lje7DgfhUfrXG6UN5cw+oMHsD
	IWZ82xgrpII2LXr87oLRASidhCxgyXYeer77nbqbyChYg6oVdYWnrSBKimpJ3Lox
	ZgWyfrL6uj/42kiTl7sXcAaxdiZ/WD4SQQRKEdQ39VRWkpFLJpxxoqkMjMgCCRxl
	8gBFy/83Yw==
Received: from mail.thefacebook.com ([163.114.134.16])
	by m0089730.ppops.net (PPS) with ESMTPS id 4edrg4hm2m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 May 2026 03:23:52 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 27 May
 2026 10:23:51 +0000
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
Subject: [PATCH v2 6/9] vfio/pci: Clean up BAR zap and revocation
Date: Wed, 27 May 2026 03:23:09 -0700
Message-ID: <20260527102319.100128-7-mattev@meta.com>
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
X-Proofpoint-GUID: DAzYb5ML5xxxyld5fCoI4GYgI3HX5aCE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEwMCBTYWx0ZWRfXzdm/Kj9qVG7W
 eD3SLCh3qDd22593lUuBd8Mo/hJo5xzogJ4OAs7akDkrhuxgUwg6EFAZ+w6UU16SXQzf5PAwQg6
 E/J8qCtuoRe1EBCOJqm8q3BPd8/yJmBNMJIyWkJE2qSDsGyyacXux6dSD+I2Hky4Rdzi1F8CykO
 9jWJY1aY5cus1fsCCjNcxUU0PvJfyb8ted2ATpku35mfop/tAXvBrvV208+KUZ+UNjreFlxEalp
 I5PEUA3Zjvlhx31x9k5VkW068ZYWFfReYXU/xmzhPgSX9IhwpmjMGLAVJzTFdheP/UOxACHztA0
 CcdbQ3WcXKSquRjRtsjZfJDe6/O0oYXxlnV6bRG1Dg06CogXxlVFA6UijuJDMTWpMrAgv1q+cA5
 oiI9chJVfcxfM5dt2azouMGDv6woYR4gHwpa1vZPRklgaWLCnS/1Ai4OYIa/UT7nyzj5NcUj1kv
 ALG86fVGkVtNAqQAtwQ==
X-Proofpoint-ORIG-GUID: DAzYb5ML5xxxyld5fCoI4GYgI3HX5aCE
X-Authority-Analysis: v=2.4 cv=Ov1/DS/t c=1 sm=1 tr=0 ts=6a16c639 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=855S8uPTkML1Oy45N9_h:22 a=VabnemYjAAAA:8 a=c4k9Xcs0TiChc187yiQA:9
 a=O8hF6Hzn-FEA:10 a=gKebqoRLp9LExxC7YDUY:22
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
	TAGGED_FROM(0.00)[bounces-62871-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: E93555E2C1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Previously, vfio_pci_zap_bars() (and the wrapper
vfio_pci_zap_and_down_write_memory_lock()) calls were paired with
calls of vfio_pci_dma_buf_move().

This commit replaces them a unified new function,
vfio_pci_zap_revoke_bars() containing both the vfio_pci_dma_buf_move()
and the unmap_mapping_range(), making it harder for callers to omit
one.  It adds a wrapper, vfio_pci_lock_zap_revoke_bars(), which takes
the write memory_lock before zapping, and adds a new
vfio_pci_unrevoke_bars() for the re-enable path.

However, as of "vfio/pci: Convert BAR mmap() to use a DMABUF" the
unmap_mapping_range() to zap is entirely redundant for plain vfio-pci,
since the DMABUFs used for BAR mappings already zap PTEs when the
vfio_pci_dma_buf_move() occurs.

One exception remains as a FIXME: in nvgrace-gpu, some BAR VMAs
conditionally use custom vm_ops, which have not moved to be backed by
DMABUFs.  If these BARs are mmap()ed, the vdev enables the existing
behaviour of unmap_mapping_range() for the device fd address space.

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/nvgrace-gpu/main.c |  5 +++
 drivers/vfio/pci/vfio_pci_config.c  | 30 ++++++-------
 drivers/vfio/pci/vfio_pci_core.c    | 66 ++++++++++++++++++++---------
 drivers/vfio/pci/vfio_pci_priv.h    |  3 +-
 include/linux/vfio_pci_core.h       |  1 +
 5 files changed, 66 insertions(+), 39 deletions(-)

diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
index 15e2f03c6cd4..cfa649200a7f 100644
--- a/drivers/vfio/pci/nvgrace-gpu/main.c
+++ b/drivers/vfio/pci/nvgrace-gpu/main.c
@@ -364,6 +364,8 @@ static int nvgrace_gpu_mmap(struct vfio_device *core_vdev,
 	struct nvgrace_gpu_pci_core_device *nvdev =
 		container_of(core_vdev, struct nvgrace_gpu_pci_core_device,
 			     core_device.vdev);
+	struct vfio_pci_core_device *vdev =
+		container_of(core_vdev, struct vfio_pci_core_device, vdev);
 	struct mem_region *memregion;
 	u64 req_len, pgoff, end;
 	unsigned int index;
@@ -374,6 +376,9 @@ static int nvgrace_gpu_mmap(struct vfio_device *core_vdev,
 	if (!memregion)
 		return vfio_pci_core_mmap(core_vdev, vma);
 
+	/* Non-DMABUF BAR mappings need an extra zap */
+	vdev->bar_needs_zap = true;
+
 	/*
 	 * Request to mmap the BAR. Map to the CPU accessible memory on the
 	 * GPU using the memory information gathered from the system ACPI
diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index a10ed733f0e3..8bfab0da481c 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -590,12 +590,10 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
 		virt_mem = !!(le16_to_cpu(*virt_cmd) & PCI_COMMAND_MEMORY);
 		new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
 
-		if (!new_mem) {
-			vfio_pci_zap_and_down_write_memory_lock(vdev);
-			vfio_pci_dma_buf_move(vdev, true);
-		} else {
+		if (!new_mem)
+			vfio_pci_lock_zap_revoke_bars(vdev);
+		else
 			down_write(&vdev->memory_lock);
-		}
 
 		/*
 		 * If the user is writing mem/io enable (new_mem/io) and we
@@ -631,7 +629,7 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
 		*virt_cmd |= cpu_to_le16(new_cmd & mask);
 
 		if (__vfio_pci_memory_enabled(vdev))
-			vfio_pci_dma_buf_move(vdev, false);
+			vfio_pci_unrevoke_bars(vdev);
 		up_write(&vdev->memory_lock);
 	}
 
@@ -712,16 +710,14 @@ static int __init init_pci_cap_basic_perm(struct perm_bits *perm)
 static void vfio_lock_and_set_power_state(struct vfio_pci_core_device *vdev,
 					  pci_power_t state)
 {
-	if (state >= PCI_D3hot) {
-		vfio_pci_zap_and_down_write_memory_lock(vdev);
-		vfio_pci_dma_buf_move(vdev, true);
-	} else {
+	if (state >= PCI_D3hot)
+		vfio_pci_lock_zap_revoke_bars(vdev);
+	else
 		down_write(&vdev->memory_lock);
-	}
 
 	vfio_pci_set_power_state(vdev, state);
 	if (__vfio_pci_memory_enabled(vdev))
-		vfio_pci_dma_buf_move(vdev, false);
+		vfio_pci_unrevoke_bars(vdev);
 	up_write(&vdev->memory_lock);
 }
 
@@ -908,11 +904,10 @@ static int vfio_exp_config_write(struct vfio_pci_core_device *vdev, int pos,
 						 &cap);
 
 		if (!ret && (cap & PCI_EXP_DEVCAP_FLR)) {
-			vfio_pci_zap_and_down_write_memory_lock(vdev);
-			vfio_pci_dma_buf_move(vdev, true);
+			vfio_pci_lock_zap_revoke_bars(vdev);
 			pci_try_reset_function(vdev->pdev);
 			if (__vfio_pci_memory_enabled(vdev))
-				vfio_pci_dma_buf_move(vdev, false);
+				vfio_pci_unrevoke_bars(vdev);
 			up_write(&vdev->memory_lock);
 		}
 	}
@@ -993,11 +988,10 @@ static int vfio_af_config_write(struct vfio_pci_core_device *vdev, int pos,
 						&cap);
 
 		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP)) {
-			vfio_pci_zap_and_down_write_memory_lock(vdev);
-			vfio_pci_dma_buf_move(vdev, true);
+			vfio_pci_lock_zap_revoke_bars(vdev);
 			pci_try_reset_function(vdev->pdev);
 			if (__vfio_pci_memory_enabled(vdev))
-				vfio_pci_dma_buf_move(vdev, false);
+				vfio_pci_unrevoke_bars(vdev);
 			up_write(&vdev->memory_lock);
 		}
 	}
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index c5f934905ce0..cfea59806a4f 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -319,8 +319,7 @@ static int vfio_pci_runtime_pm_entry(struct vfio_pci_core_device *vdev,
 	 * The vdev power related flags are protected with 'memory_lock'
 	 * semaphore.
 	 */
-	vfio_pci_zap_and_down_write_memory_lock(vdev);
-	vfio_pci_dma_buf_move(vdev, true);
+	vfio_pci_lock_zap_revoke_bars(vdev);
 
 	if (vdev->pm_runtime_engaged) {
 		up_write(&vdev->memory_lock);
@@ -406,7 +405,7 @@ static void vfio_pci_runtime_pm_exit(struct vfio_pci_core_device *vdev)
 	down_write(&vdev->memory_lock);
 	__vfio_pci_runtime_pm_exit(vdev);
 	if (__vfio_pci_memory_enabled(vdev))
-		vfio_pci_dma_buf_move(vdev, false);
+		vfio_pci_unrevoke_bars(vdev);
 	up_write(&vdev->memory_lock);
 }
 
@@ -1256,6 +1255,8 @@ static int vfio_pci_ioctl_set_irqs(struct vfio_pci_core_device *vdev,
 	return ret;
 }
 
+static void vfio_pci_zap_revoke_bars(struct vfio_pci_core_device *vdev);
+
 static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
 				void __user *arg)
 {
@@ -1264,7 +1265,7 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
 	if (!vdev->reset_works)
 		return -EINVAL;
 
-	vfio_pci_zap_and_down_write_memory_lock(vdev);
+	down_write(&vdev->memory_lock);
 
 	/*
 	 * This function can be invoked while the power state is non-D0. If
@@ -1277,10 +1278,11 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
 	 */
 	vfio_pci_set_power_state(vdev, PCI_D0);
 
-	vfio_pci_dma_buf_move(vdev, true);
+	vfio_pci_zap_revoke_bars(vdev);
+
 	ret = pci_try_reset_function(vdev->pdev);
 	if (__vfio_pci_memory_enabled(vdev))
-		vfio_pci_dma_buf_move(vdev, false);
+		vfio_pci_unrevoke_bars(vdev);
 	up_write(&vdev->memory_lock);
 
 	return ret;
@@ -1648,20 +1650,44 @@ ssize_t vfio_pci_core_write(struct vfio_device *core_vdev, const char __user *bu
 }
 EXPORT_SYMBOL_GPL(vfio_pci_core_write);
 
-static void vfio_pci_zap_bars(struct vfio_pci_core_device *vdev)
+static void vfio_pci_zap_revoke_bars(struct vfio_pci_core_device *vdev)
 {
-	struct vfio_device *core_vdev = &vdev->vdev;
-	loff_t start = VFIO_PCI_INDEX_TO_OFFSET(VFIO_PCI_BAR0_REGION_INDEX);
-	loff_t end = VFIO_PCI_INDEX_TO_OFFSET(VFIO_PCI_ROM_REGION_INDEX);
-	loff_t len = end - start;
+	lockdep_assert_held_write(&vdev->memory_lock);
+	vfio_pci_dma_buf_move(vdev, true);
 
-	unmap_mapping_range(core_vdev->inode->i_mapping, start, len, true);
+	/*
+	 * All VFIO PCI BARs are backed by DMABUFs, with the current
+	 * exception of the nvgrace-gpu device which uses its own
+	 * vm_ops for a subset of BARs.  For this, BAR mappings are
+	 * still made in the vdev's address_space, and a zap is
+	 * required.  The tracking is crude, and will (harmlessly)
+	 * continue to zap if the special BAR is unmapped, but that
+	 * behaviour isn't the common case.
+	 *
+	 * FIXME: This can go away if the special nvgrace-gpu mapping
+	 * is converted to use DMABUF.
+	 */
+	if (vdev->bar_needs_zap) {
+		struct vfio_device *core_vdev = &vdev->vdev;
+		loff_t start = VFIO_PCI_INDEX_TO_OFFSET(VFIO_PCI_BAR0_REGION_INDEX);
+		loff_t end = VFIO_PCI_INDEX_TO_OFFSET(VFIO_PCI_ROM_REGION_INDEX);
+		loff_t len = end - start;
+
+		unmap_mapping_range(core_vdev->inode->i_mapping,
+				    start, len, true);
+	}
 }
 
-void vfio_pci_zap_and_down_write_memory_lock(struct vfio_pci_core_device *vdev)
+void vfio_pci_lock_zap_revoke_bars(struct vfio_pci_core_device *vdev)
 {
 	down_write(&vdev->memory_lock);
-	vfio_pci_zap_bars(vdev);
+	vfio_pci_zap_revoke_bars(vdev);
+}
+
+void vfio_pci_unrevoke_bars(struct vfio_pci_core_device *vdev)
+{
+	lockdep_assert_held_write(&vdev->memory_lock);
+	vfio_pci_dma_buf_move(vdev, false);
 }
 
 u16 vfio_pci_memory_lock_and_enable(struct vfio_pci_core_device *vdev)
@@ -2517,9 +2543,10 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 		}
 
 		/*
-		 * Take the memory write lock for each device and zap BAR
-		 * mappings to prevent the user accessing the device while in
-		 * reset.  Locking multiple devices is prone to deadlock,
+		 * Take the memory write lock for each device and
+		 * zap/revoke BAR mappings to prevent the user (or
+		 * peers) accessing the device while in reset.
+		 * Locking multiple devices is prone to deadlock,
 		 * runaway and unwind if we hit contention.
 		 */
 		if (!down_write_trylock(&vdev->memory_lock)) {
@@ -2527,8 +2554,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 			break;
 		}
 
-		vfio_pci_dma_buf_move(vdev, true);
-		vfio_pci_zap_bars(vdev);
+		vfio_pci_zap_revoke_bars(vdev);
 	}
 
 	if (!list_entry_is_head(vdev,
@@ -2558,7 +2584,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 	list_for_each_entry_from_reverse(vdev, &dev_set->device_list,
 					 vdev.dev_set_list) {
 		if (vdev->vdev.open_count && __vfio_pci_memory_enabled(vdev))
-			vfio_pci_dma_buf_move(vdev, false);
+			vfio_pci_unrevoke_bars(vdev);
 		up_write(&vdev->memory_lock);
 	}
 
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index d38e1b98b2e9..10833aabd7fb 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -83,7 +83,8 @@ void vfio_config_free(struct vfio_pci_core_device *vdev);
 int vfio_pci_set_power_state(struct vfio_pci_core_device *vdev,
 			     pci_power_t state);
 
-void vfio_pci_zap_and_down_write_memory_lock(struct vfio_pci_core_device *vdev);
+void vfio_pci_lock_zap_revoke_bars(struct vfio_pci_core_device *vdev);
+void vfio_pci_unrevoke_bars(struct vfio_pci_core_device *vdev);
 u16 vfio_pci_memory_lock_and_enable(struct vfio_pci_core_device *vdev);
 void vfio_pci_memory_unlock_and_restore(struct vfio_pci_core_device *vdev,
 					u16 cmd);
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index 7accd0eac457..e35e82c24c8c 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -127,6 +127,7 @@ struct vfio_pci_core_device {
 	bool			needs_pm_restore:1;
 	bool			pm_intx_masked:1;
 	bool			pm_runtime_engaged:1;
+	bool			bar_needs_zap:1;
 	struct pci_saved_state	*pci_saved_state;
 	struct pci_saved_state	*pm_save;
 	int			ioeventfds_nr;
-- 
2.47.3



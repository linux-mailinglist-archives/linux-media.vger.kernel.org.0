Return-Path: <linux-media+bounces-55530-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OcHNzYLs2kMRwAAu9opvQ
	(envelope-from <linux-media+bounces-55530-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:51:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EDC2775B0
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68419323E455
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51B840148D;
	Thu, 12 Mar 2026 18:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="Tn/GQ8s9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A813F7A89;
	Thu, 12 Mar 2026 18:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341222; cv=none; b=g/cAc8j+rpZAC7sFcnrPSMNLdkiFK/pSiFZxlXHemlkfFHWn8zcEzemOli1rGbYP6OeGvBItIcPSSfhpolqO3AL9TDOA4Lw9sYEg1YtBx5FQeMWLQCibQNocgHwGHP3Bqayt2haQI59N1/TABLgoDx/tMRp7R1mCq7a5/4IwjtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341222; c=relaxed/simple;
	bh=hU7/9IlWIe9sxkJKxPxFHvq+tVfjwA/O2IR+SVzpBb8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q+LIlw84dUb6S/G45mIJffO703Z7fu8yqk+ugjRu0QQgUnOt2RSmKZeF9HbrZEYpNxxjStdpsbpjd28VH1pfCXe/ouCI6aJXtUm95fN1yBVUsmBI2LIIMmawxT+yoHRlV3JOH+w3OuW5KRUtgZdunzTe+JJHf6LQKEIRKOt7dTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=Tn/GQ8s9; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 62CHL0IH3607800;
	Thu, 12 Mar 2026 11:46:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=nKEE9T7WtP3i7pddwSt2rehphB9a6sw4YvWdHQEL+mA=; b=Tn/GQ8s9vw4X
	h/tV/+MwT7qMfZlJRUMsUM4rdlmz46VY15DZca0XLiBMjoICfXmjSpyLMbeSTke+
	eQSXf/aGyfp30qqN87iXUpOi2J6hRTQQKHEOCL/RzXsBf3UN3P3Esn9ozUKA6cjf
	B3vzUMMf9XsjJLuANByLEOZQZrQLNwMsL/ppQmC8jpqWQPRLm/6o16R3Xhw0BAQY
	9IRoR66Zh92ujOx+myb88+fA6OV6Jx4N0U+hNBg3JExuYcf8VvvvT1vNG1RHCdNk
	7N22u/Acpza+qlPF1HgdtW3J3ro1vJ94hu6Azm+O7J7+UZmm7klCw5qBmoTanas9
	Zmd57cJYZA==
Received: from mail.thefacebook.com ([163.114.134.16])
	by m0089730.ppops.net (PPS) with ESMTPS id 4cv1te9t9d-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 11:46:43 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::150d) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 12 Mar
 2026 18:46:43 +0000
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
Subject: [RFC v2 PATCH 06/10] vfio/pci: Remove vfio_pci_zap_bars()
Date: Thu, 12 Mar 2026 11:46:04 -0700
Message-ID: <20260312184613.3710705-7-mattev@meta.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MSBTYWx0ZWRfX7EzWGssMXe7X
 PJNMb5cf9dkFCzFFeZxryoWwC8yUo3ePXkgGEbFkhHn1dLa48DyWe2d8Lw696N6HxKjc5AlRUUa
 +CHbndXP005ysohRSr+908PwQ42QCkZ+z/gT9hL5iHmt+Ghxk7Bf6cgQuIprXUqetQTxtMei8Qw
 ms39Fu7+XYHhMXGosRCqWHJynAFrVOVthjAfBROPtetn71IHI+e3yU1fHsebgCPfaaDpCKmWE0I
 /EOJgGXehxLiC2apof2s2Rsd+xXKD5JGKrzGU6+OfASwaLbOYMgr6VxuA+6A8JV+OsRakb0DxWf
 Ha5oVwKmZduSrFGwjixBkpeklpIigwI9aFPRWIAWFtARpDCSY2UWycm0WD9MXzVeFdmte/EXP+A
 ZjmZiRIkNbXQmo6etVFAK9qmn5Q9KRNEA4C3XNuWME8NQ78Bf3mNHStmxBPJxQ5NLFMpL8eSboT
 1jWUdII9DO9sEY50CLg==
X-Proofpoint-ORIG-GUID: 2FnSa1b1xUyjhSFio7_aR8yhzALZdgDt
X-Authority-Analysis: v=2.4 cv=QoJTHFyd c=1 sm=1 tr=0 ts=69b30a14 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=855S8uPTkML1Oy45N9_h:22 a=VabnemYjAAAA:8 a=o4lYeIOqc9WSjTI1-WMA:9
 a=O8hF6Hzn-FEA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: 2FnSa1b1xUyjhSFio7_aR8yhzALZdgDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55530-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 47EDC2775B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

vfio_pci_zap_bars() and the wrapper
vfio_pci_zap_and_down_write_memory_lock() are redundant as of
"vfio/pci: Convert BAR mmap() to use a DMABUF".  The DMABUFs used for
BAR mappings already zap PTEs via the existing
vfio_pci_dma_buf_move(), which notifies changes to the BAR space
(e.g. around reset).

Remove the old functions, and the various points needing to zap BARs
become slightly cleaner.

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/vfio_pci_config.c | 18 ++++++------------
 drivers/vfio/pci/vfio_pci_core.c   | 30 +++++++-----------------------
 drivers/vfio/pci/vfio_pci_priv.h   |  1 -
 3 files changed, 13 insertions(+), 36 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index b4e39253f98d..c7ed28be1104 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -590,12 +590,9 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
 		virt_mem = !!(le16_to_cpu(*virt_cmd) & PCI_COMMAND_MEMORY);
 		new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
 
-		if (!new_mem) {
-			vfio_pci_zap_and_down_write_memory_lock(vdev);
+		down_write(&vdev->memory_lock);
+		if (!new_mem)
 			vfio_pci_dma_buf_move(vdev, true);
-		} else {
-			down_write(&vdev->memory_lock);
-		}
 
 		/*
 		 * If the user is writing mem/io enable (new_mem/io) and we
@@ -712,12 +709,9 @@ static int __init init_pci_cap_basic_perm(struct perm_bits *perm)
 static void vfio_lock_and_set_power_state(struct vfio_pci_core_device *vdev,
 					  pci_power_t state)
 {
-	if (state >= PCI_D3hot) {
-		vfio_pci_zap_and_down_write_memory_lock(vdev);
+	down_write(&vdev->memory_lock);
+	if (state >= PCI_D3hot)
 		vfio_pci_dma_buf_move(vdev, true);
-	} else {
-		down_write(&vdev->memory_lock);
-	}
 
 	vfio_pci_set_power_state(vdev, state);
 	if (__vfio_pci_memory_enabled(vdev))
@@ -908,7 +902,7 @@ static int vfio_exp_config_write(struct vfio_pci_core_device *vdev, int pos,
 						 &cap);
 
 		if (!ret && (cap & PCI_EXP_DEVCAP_FLR)) {
-			vfio_pci_zap_and_down_write_memory_lock(vdev);
+			down_write(&vdev->memory_lock);
 			vfio_pci_dma_buf_move(vdev, true);
 			pci_try_reset_function(vdev->pdev);
 			if (__vfio_pci_memory_enabled(vdev))
@@ -993,7 +987,7 @@ static int vfio_af_config_write(struct vfio_pci_core_device *vdev, int pos,
 						&cap);
 
 		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP)) {
-			vfio_pci_zap_and_down_write_memory_lock(vdev);
+			down_write(&vdev->memory_lock);
 			vfio_pci_dma_buf_move(vdev, true);
 			pci_try_reset_function(vdev->pdev);
 			if (__vfio_pci_memory_enabled(vdev))
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 41224efa58d8..9e9ad97c2f7f 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -319,7 +319,7 @@ static int vfio_pci_runtime_pm_entry(struct vfio_pci_core_device *vdev,
 	 * The vdev power related flags are protected with 'memory_lock'
 	 * semaphore.
 	 */
-	vfio_pci_zap_and_down_write_memory_lock(vdev);
+	down_write(&vdev->memory_lock);
 	vfio_pci_dma_buf_move(vdev, true);
 
 	if (vdev->pm_runtime_engaged) {
@@ -1229,7 +1229,7 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
 	if (!vdev->reset_works)
 		return -EINVAL;
 
-	vfio_pci_zap_and_down_write_memory_lock(vdev);
+	down_write(&vdev->memory_lock);
 
 	/*
 	 * This function can be invoked while the power state is non-D0. If
@@ -1613,22 +1613,6 @@ ssize_t vfio_pci_core_write(struct vfio_device *core_vdev, const char __user *bu
 }
 EXPORT_SYMBOL_GPL(vfio_pci_core_write);
 
-static void vfio_pci_zap_bars(struct vfio_pci_core_device *vdev)
-{
-	struct vfio_device *core_vdev = &vdev->vdev;
-	loff_t start = VFIO_PCI_INDEX_TO_OFFSET(VFIO_PCI_BAR0_REGION_INDEX);
-	loff_t end = VFIO_PCI_INDEX_TO_OFFSET(VFIO_PCI_ROM_REGION_INDEX);
-	loff_t len = end - start;
-
-	unmap_mapping_range(core_vdev->inode->i_mapping, start, len, true);
-}
-
-void vfio_pci_zap_and_down_write_memory_lock(struct vfio_pci_core_device *vdev)
-{
-	down_write(&vdev->memory_lock);
-	vfio_pci_zap_bars(vdev);
-}
-
 u16 vfio_pci_memory_lock_and_enable(struct vfio_pci_core_device *vdev)
 {
 	u16 cmd;
@@ -2487,10 +2471,11 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 		}
 
 		/*
-		 * Take the memory write lock for each device and zap BAR
-		 * mappings to prevent the user accessing the device while in
-		 * reset.  Locking multiple devices is prone to deadlock,
-		 * runaway and unwind if we hit contention.
+		 * Take the memory write lock for each device and
+		 * revoke all DMABUFs, which will prevent any access
+		 * to the device while in reset.  Locking multiple
+		 * devices is prone to deadlock, runaway and unwind if
+		 * we hit contention.
 		 */
 		if (!down_write_trylock(&vdev->memory_lock)) {
 			ret = -EBUSY;
@@ -2498,7 +2483,6 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 		}
 
 		vfio_pci_dma_buf_move(vdev, true);
-		vfio_pci_zap_bars(vdev);
 	}
 
 	if (!list_entry_is_head(vdev,
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index 37ece9b4b5bd..e201c96bbb14 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -78,7 +78,6 @@ void vfio_config_free(struct vfio_pci_core_device *vdev);
 int vfio_pci_set_power_state(struct vfio_pci_core_device *vdev,
 			     pci_power_t state);
 
-void vfio_pci_zap_and_down_write_memory_lock(struct vfio_pci_core_device *vdev);
 u16 vfio_pci_memory_lock_and_enable(struct vfio_pci_core_device *vdev);
 void vfio_pci_memory_unlock_and_restore(struct vfio_pci_core_device *vdev,
 					u16 cmd);
-- 
2.47.3



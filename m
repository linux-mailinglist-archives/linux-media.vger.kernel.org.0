Return-Path: <linux-media+bounces-45614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02927C0BCA8
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 05:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 128283BB131
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 04:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC3923EA98;
	Mon, 27 Oct 2025 04:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBQnTI/V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A4F274B59
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 04:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761540523; cv=none; b=hgyBRlvMPPgPwLyRrqDsw7p+7PIVyhJr9dro7p4uG8iX0i5kfXJUJ5zLHr0/srZV5D9HOQ/IapEgYkSZjH9YCS+YivQxazXmZwDD4A20i1jd1RZIHR6i8BTFaZNZAmJGtA/chzrZ3DRj1ZSyFTHGe/9lDLAdtwLcKpJwvdGecuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761540523; c=relaxed/simple;
	bh=MY2fLmxjj0+IXtVwTx8EQEka44NV8taZsq9/RrkuNEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xp8tRuhh4qhN1bF6nMvO7jYvesQd9jUz4cmTqqTcpCHKHgSn7zsgMNRGrFqEZUIHTLuRpjdOqJcT7ia6uOJH5sfbaGhr1EjzDvBHzhl1fzrFloGxG/jtA53Z+LzABZsO7Kqsh/2+2KM7i31x6Wle6tFiDGlLx9EX9j7cb81QEuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBQnTI/V; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761540521; x=1793076521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MY2fLmxjj0+IXtVwTx8EQEka44NV8taZsq9/RrkuNEQ=;
  b=ZBQnTI/VKtO/9rveH99/NTqyb6Zw6169FMwIn/SJXACQ42OGv5QXVJw6
   l/WhgByP6tvJVKVcCkO74M00H0ReM0sLpWAvbW6qwkyOMaVi68YfVdagU
   THtT+hnVSZVqmEo/hbIf5VTRrPcKb+dmTW5LW9EouQeOefU81FuXm2boM
   r8HSTeqYDxGFgiocdsvQaHmVhkSm7EPNlnol/nzxnnxMUelmah3FJYK1z
   Z2IwRWC+Mr5iDTFSvjCF7KBI39SRZ+YPEgtIUMGsKFplNFQG5wB4ypm5e
   VhTUNvbnzT9lmSySfE2di9cZ6vTqW4+wICAsENKu35sluSZQyEOd205RV
   A==;
X-CSE-ConnectionGUID: ZdXQY0PDSUu4A7JNuxIsVQ==
X-CSE-MsgGUID: qEVNdD5zQZqooeZhRJRHcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63521071"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63521071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 21:48:37 -0700
X-CSE-ConnectionGUID: RLdqt1RDQS69UsDQU8chBg==
X-CSE-MsgGUID: 8o8rQyF1QmS1jRYIxKdJSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="188992992"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 21:48:38 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [RFC v2 6/8] drm/xe/pf: Add a helper function to get a VF's backing object in LMEM
Date: Sun, 26 Oct 2025 21:44:18 -0700
Message-ID: <20251027044712.1676175-7-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To properly import a dmabuf that is associated with a VF (or that
originates in a Guest VM that includes a VF), we need to know where
in LMEM the VF's allocated regions exist. Therefore, introduce a
new helper to return the object that backs the VF's regions in LMEM.

v2:
- Make the helper return the LMEM object instead of the start address

v3:
- Move the declaration of the helper under other lmem helpers (Michal)

v4:
- Take a ref on the LMEM obj while holding the PF master mutex (Matt)

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 24 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6344b5205c08..2f09b67438fc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1535,6 +1535,30 @@ u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid)
 	return size;
 }
 
+/**
+ * xe_gt_sriov_pf_config_get_lmem_obj - Get VF's LMEM BO.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function can only be called on PF.
+ *
+ * Return: BO that is backing VF's quota in LMEM.
+ */
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt,
+						 unsigned int vfid)
+{
+	struct xe_gt_sriov_config *config;
+	struct xe_bo *lmem_obj;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	config = pf_pick_vf_config(gt, vfid);
+	lmem_obj = config->lmem_obj;
+	xe_bo_get(lmem_obj);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return lmem_obj;
+}
+
 /**
  * xe_gt_sriov_pf_config_set_lmem - Provision VF with LMEM.
  * @gt: the &xe_gt (can't be media)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 513e6512a575..bbc5c238cbf6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -36,6 +36,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 					u64 size);
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
 
 u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
-- 
2.50.1



Return-Path: <linux-media+bounces-23188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACF49ECB8C
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 12:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4CD5282CE5
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 11:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22956211A2C;
	Wed, 11 Dec 2024 11:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SH0SlKBf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81721238E27
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 11:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733917752; cv=none; b=L9Z2BQhxv77IS6ANGOKHvuevnKYt2pm5Ar5he/lMgTGa9RG0phFM8SrB4MmatTs3436TNAqDuNXFST9fAk6qmpjE1sAxTIt7WX3pnracTWxyBtY78WepjZnZGnSPj0XUwgB5hPK0otZV6b8v2zk4QKKmZ20LY+S3IV3y70ADwWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733917752; c=relaxed/simple;
	bh=GSrvbpk4niDM7X4iEqtVh9Y4OSoLjgaMadQ+iStTweU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qQMS03WDy45hl06nFA996uRQ0oefXLMCvHE2YPIznAeo+tsJD021ftOOh7UQiM74sVpR0GTxD77e7B1k0MHWdKCZOmhLbsBEVXsDwgCzOfhoBLxqoGx8IYH3u0P/apVj+EXXtVCxMeZMo19zcQxf+uYzAzaFNegztPHokld6LwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SH0SlKBf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733917751; x=1765453751;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GSrvbpk4niDM7X4iEqtVh9Y4OSoLjgaMadQ+iStTweU=;
  b=SH0SlKBfFxCUPp6ruXmKDA120Ly1X7z7J42/xYEa1aviK1WyI206/nbx
   +Fp6q10IXSzqWaZb37hzsCFAl7WsIm5YQe+iKP4I1Sjn3CH27HKrGMXXm
   fkKethnALmrgbrFuvLyEXz530UqlsREmgXLE5aQoXhqGJn+7nfeKo8uHK
   r/RH+RzyfQGRmuZTNdurj+zCRoLXJqHNJQXIZw29pQl7ddajtp91jiOSb
   bkJH8ywl01tqtsvrbcYwSpbM8QkRui6LNmLRthfKBuCLKW1YHVbNWD2xx
   TGamRM4vIaQmsWvl47FjYMP1Hp/T1nb4xlQ2EpLN+nEWa6fn2od7Op/80
   Q==;
X-CSE-ConnectionGUID: 5EDzi6oCQ9ahX6bhhVFUwg==
X-CSE-MsgGUID: XdCtdPfXT9mEV6fYZDXINA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34434564"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="34434564"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 03:49:10 -0800
X-CSE-ConnectionGUID: lh0xzkuvS/Km5nDmwg7wFA==
X-CSE-MsgGUID: lnSFMewAQBaX2wkyX+gtKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133157634"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.100.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 03:49:09 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Genes Lists <lists@sapience.com>
Subject: [PATCH v2] media: intel/ipu6: remove cpu latency qos request on error
Date: Wed, 11 Dec 2024 12:49:05 +0100
Message-Id: <20241211114905.368044-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix cpu latency qos list corruption like below. It happens when
we do not remove cpu latency request on error path and free
corresponding memory.

[   30.634378] l7 kernel: list_add corruption. prev->next should be next (ffffffff9645e960), but was 0000000100100001. (prev=ffff8e9e877e20a8).
[   30.634388] l7 kernel: WARNING: CPU: 2 PID: 2008 at lib/list_debug.c:32 __list_add_valid_or_report+0x83/0xa0
<snip>
[   30.634640] l7 kernel: Call Trace:
[   30.634650] l7 kernel:  <TASK>
[   30.634659] l7 kernel:  ? __list_add_valid_or_report+0x83/0xa0
[   30.634669] l7 kernel:  ? __warn.cold+0x93/0xf6
[   30.634678] l7 kernel:  ? __list_add_valid_or_report+0x83/0xa0
[   30.634690] l7 kernel:  ? report_bug+0xff/0x140
[   30.634702] l7 kernel:  ? handle_bug+0x58/0x90
[   30.634712] l7 kernel:  ? exc_invalid_op+0x17/0x70
[   30.634723] l7 kernel:  ? asm_exc_invalid_op+0x1a/0x20
[   30.634733] l7 kernel:  ? __list_add_valid_or_report+0x83/0xa0
[   30.634742] l7 kernel:  plist_add+0xdd/0x140
[   30.634754] l7 kernel:  pm_qos_update_target+0xa0/0x1f0
[   30.634764] l7 kernel:  cpu_latency_qos_update_request+0x61/0xc0
[   30.634773] l7 kernel:  intel_dp_aux_xfer+0x4c7/0x6e0 [i915 1f824655ed04687c2b0d23dbce759fa785f6d033]

Reported-by: Genes Lists <lists@sapience.com>
Closes: https://lore.kernel.org/linux-media/c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com/
Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
v2: add Closes tag

 drivers/media/pci/intel/ipu6/ipu6-isys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 77f9c7319868..8df1d83a74b5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1133,6 +1133,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 free_fw_msg_bufs:
 	free_fw_msg_bufs(isys);
 out_remove_pkg_dir_shared_buffer:
+	cpu_latency_qos_remove_request(&isys->pm_qos);
 	if (!isp->secure_mode)
 		ipu6_cpd_free_pkg_dir(adev);
 remove_shared_buffer:
-- 
2.34.1



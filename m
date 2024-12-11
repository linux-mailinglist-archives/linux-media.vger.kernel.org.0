Return-Path: <linux-media+bounces-23176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F189EC850
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 10:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4661163246
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 09:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CBB1FA8E6;
	Wed, 11 Dec 2024 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i62ojJKC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802181FA8C6;
	Wed, 11 Dec 2024 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733907980; cv=none; b=pGSVWaXb2gt3cs+rr0Ai8ERQsCqGIaD7ZwdSpTPHnTWb5AW4FoOFvgNxJwAoTDMuD+nvEzXN8FAQk7Vq0/EIauCTyChsjEpV9QL5w6uE8iPMnDfNvvcRYzdmyPBvwOLVK2LRJhGF66dHdLXrXsLToLzJiAybAzE8Ly9zR6wmFIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733907980; c=relaxed/simple;
	bh=zUACrUiU3HIEv81WvXCD0ET0rMmf3bs5iPDadw1KWho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gP34//1aW01jy8c0Zs23b+su65fxHGbAg7aPFkUSBv/JzqLW9MiZYt7tTEiIwzzyiDocEeHL4htaVKj3l34UYlyS+BrztZ7px2T65cZ/X6pY/E3kvqah4cxC3P6JSi6yhMOHkxqLUlXWnqNIKWU+PxxnPluE9qwh5RInKLQPnJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i62ojJKC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733907979; x=1765443979;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zUACrUiU3HIEv81WvXCD0ET0rMmf3bs5iPDadw1KWho=;
  b=i62ojJKCqBB2rmEqK0WqnAL6iuS6MOV0JwnWpENVf8wtUeJkgiN7HS+v
   8UFujAFCdAvqUAw6/Wgfwd30yEjMhPQP93YdUdkxomWkKXAdSbxpk2F/W
   Ch5HkbqP0gsOWk1BBGti4xUKeXwsJrG7OmjpF538VkXcbnc3AFyDnsdAx
   i+j++9uQeTrDvLU0DJ5dS3QnmxkddKkoDVSX2BQjGdC0+GDhM7S1MKMz5
   QPq2xuZWkDTwuQikvToZICPpb9fGl5YSz4Fsff6HOTncraOfdAk2xsvDJ
   OGLe7G9IwKogFxEy+6RcmahUcVJ/69YVLsv5cB5fEqfGkQt/BxFyG2/Di
   g==;
X-CSE-ConnectionGUID: vvmCBk9aSvGRe2ddbs/urw==
X-CSE-MsgGUID: TCOaQKTNSM+BFAOgKX0BTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34403244"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="34403244"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 01:06:18 -0800
X-CSE-ConnectionGUID: 8WgFk9AJT3+js7PAv7S9Ug==
X-CSE-MsgGUID: o7umYhKmSjSPjl+qNc2p9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="95557176"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.100.183])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 01:06:16 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Genes Lists <lists@sapience.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: intel/ipu6: remove cpu latency qos request on error
Date: Wed, 11 Dec 2024 10:06:13 +0100
Message-Id: <20241211090613.346775-1-stanislaw.gruszka@linux.intel.com>
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
Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
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



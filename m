Return-Path: <linux-media+bounces-49698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B73CE9773
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4F363015E39
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1538B2D1F61;
	Tue, 30 Dec 2025 10:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xs95XspX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940E521254B
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091939; cv=none; b=ZIL4G0d4qKK0loyucvVRt1efhmVKq68wgEfXF0KTn1357OWt7a0FnCXT5KBS5hcghTW3DvwMTF9rC1mAUKhivcPiDUSz6N1y5VFUvW7vf5adr2VcpIijCNg5IQE5kM/pjFW8I9OUDH5sO3W0WXTYhMxp6ikh+ZwRx4ZiMM2Xe+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091939; c=relaxed/simple;
	bh=lakatMwLuiUGM/200WhL8SUhz6xRcSamUgWk1KEoGeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gif2Nv/0mPZ7rjQqx51FYsTskzMrOdtMDLXMlqsGYuQpJvtEg/0sdq1Qx22SMi0JWXUC9bf/k3jiRdlP+45pOY3yWT7GX/WqC6sWK3kKEHMpPBBsubAJ/6QYo0+FVC8r7p5ylkbTm/cRny0+fBIxTONBa4uZlGCI54nrOFBuwR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xs95XspX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767091938; x=1798627938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lakatMwLuiUGM/200WhL8SUhz6xRcSamUgWk1KEoGeo=;
  b=Xs95XspXQtg7u8D/A9ksfnvSKc/eLwZIGNkivA6S4EjReEpl2+gXISoy
   eoOnksrW753zVP5CRIgaSF0bLPOo2KWupa0sKyH63ldDdmv4E4F3KoFOp
   JZQxskGu1nZv83UQ7w3xLoQDwxxuNxQHwgnS2PhEcVdfaIgaURWjE8/ch
   mor2qGjTizmqEe5nLx00FcPKXtSeZJLzGzw9Ud4F50vVkbcOsGa35jBAX
   TO9Ql0cFpv/OCCaD+XMBqdieJFXTD0UVvupE+0KBwxLeG3qRIXeEB6XaA
   6MKQzxaLQ2p+ZkYkyllxovGyiukhH1agLe8wCG8cWkyJwGsjnHv8purHQ
   A==;
X-CSE-ConnectionGUID: qd8OWmSzSiS7iVF0pXyqtg==
X-CSE-MsgGUID: REfX29l5TuqL6XUUynuy6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94148716"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94148716"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:17 -0800
X-CSE-ConnectionGUID: 4Xu37x7KSoKoWtBmBygVkA==
X-CSE-MsgGUID: 27H8irCfT9yuBbEGUTgu3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201186891"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:15 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7E316121D87;
	Tue, 30 Dec 2025 12:52:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaXKw-0000000FQY5-0r4j;
	Tue, 30 Dec 2025 12:52:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 03/13] media: ipu6: Remove redundant driver data checks
Date: Tue, 30 Dec 2025 12:52:12 +0200
Message-ID: <20251230105222.3676928-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
References: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both runtime PM resume and suspend callbacks check whether the driver's
data is set for the device. This is done in probe(); drop the redundant
checks.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index eb45544a9f05..4855eeb24980 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -857,9 +857,6 @@ static int isys_runtime_pm_resume(struct device *dev)
 	unsigned long flags;
 	int ret;
 
-	if (!isys)
-		return 0;
-
 	ret = ipu6_mmu_hw_init(adev->mmu);
 	if (ret)
 		return ret;
@@ -884,13 +881,9 @@ static int isys_runtime_pm_resume(struct device *dev)
 static int isys_runtime_pm_suspend(struct device *dev)
 {
 	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
-	struct ipu6_isys *isys;
+	struct ipu6_isys *isys = dev_get_drvdata(dev);
 	unsigned long flags;
 
-	isys = dev_get_drvdata(dev);
-	if (!isys)
-		return 0;
-
 	spin_lock_irqsave(&isys->power_lock, flags);
 	isys->power = 0;
 	spin_unlock_irqrestore(&isys->power_lock, flags);
-- 
2.47.3



Return-Path: <linux-media+bounces-49146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C17B5CCF3E9
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 10:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F657305845A
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DDD2F6586;
	Fri, 19 Dec 2025 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgZniDmW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE892F5492
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138321; cv=none; b=KYWQKtr7JX0Tt3gHm2fQ89YZHqaMAUqzm8PeZAt9el6/b8iEvHFdVTCf1aCuzzDeqFMVKLQaeowrYaaCEHwb9+3RNdpJYDz9I/SkPqF/8eQ19/zA4kcpiPdKivgnLh63/MQym8224X88eBooSc51mfmPOCVVz7cUfteFae5thZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138321; c=relaxed/simple;
	bh=lakatMwLuiUGM/200WhL8SUhz6xRcSamUgWk1KEoGeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IysuYb6iKH9u1g4woYdNMRDEvPBcjvJMuDQzLymNunTQclFml55pp100VTmLajBzLYhgdSYuIcGPWznP2qm25mkeuMQ65bbGOr46C7ZljQvYmvHrA9sPzgpbsLmZuEze9kQFGH7jjwo0EJVkGpU54Jv+fellzX+V6FMmHQUfKPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgZniDmW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138319; x=1797674319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lakatMwLuiUGM/200WhL8SUhz6xRcSamUgWk1KEoGeo=;
  b=hgZniDmWluZZMFyRCMyKv5AEDYrv41FfmzuNvcf1mzBccJ7T6w5qA3TD
   xrETUXd95cZEqdQp2gRYmJ4Rtef/ScltZkD0YoHr4hmAzAmK0YIzkVIuE
   STA7zIq/RX2UtgFLPHEshffp9YqnO6j3tq7a/WsJADJUhV1qbAPPapMMi
   ixK3h3/6HSqOpDKi8jmuJ4zqa32362Ytefqah/mcsf9vcpgRoL/y7ddjO
   x7zNaxdOUGKrSP0h+lmRZGYxOIkvWi/OsxN3ezQLNoLOWIdMka9YMLpnr
   sFLzHhgQX+VMxyt/wwDwj1++/WhPkXmVTaaatUm9f1z69gfymIAX2sJzt
   A==;
X-CSE-ConnectionGUID: 8hPk6gB8QmipHpyM3znpNg==
X-CSE-MsgGUID: PdfGmDdAQ8qJmw0gFunDLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945159"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71945159"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:34 -0800
X-CSE-ConnectionGUID: KzkU+mhmQ4yz5M8TnZDKUA==
X-CSE-MsgGUID: B3UkKNwZSH6rdchR1OfR0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="197973376"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:33 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 019FA121DA4;
	Fri, 19 Dec 2025 11:58:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vWXFl-0000000BsRY-2mox;
	Fri, 19 Dec 2025 11:58:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 03/13] media: ipu6: Remove redundant driver data checks
Date: Fri, 19 Dec 2025 11:58:19 +0200
Message-ID: <20251219095829.2830843-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
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



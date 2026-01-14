Return-Path: <linux-media+bounces-50669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB59D1DBE6
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AAFD300DCA0
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68395381703;
	Wed, 14 Jan 2026 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6/Mxfbu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953DB30E0D2
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384511; cv=none; b=RS56VTFhde+bVa2Z+ZlvBwvxFcULbNlpXe+0JWDxrNA7q7TPSONN1MpB5o3446geYdI7ZU7g/JUIYRBchJbid+crrKSfQjoIaN23T/e/CLMP3HR+2wuo/afz5bn3ZyIdrR/Home3IS94vW6HzAQy9m1v1G9arwwhr/6BR28jAd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384511; c=relaxed/simple;
	bh=aDmKJxwmre4U7D8lVRO3WB7ls4MzgUFmBj6Zje9LMrw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pD8Sk06smWfyiaV9P5X5QoEeN54+9Dzy9SJxgP1HJIYeUcbrHTqdqkaiFTaW1xnpstjw9LLKP+f6WjsbRm0NZPKf9OohdEoWVkfz70Mh8vJUp2MkEH0VvqvOi0a9hErwsef7sUpgqFCOvDNMYKwCOpEjTOFwp046mL8x4n88Hds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6/Mxfbu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768384510; x=1799920510;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aDmKJxwmre4U7D8lVRO3WB7ls4MzgUFmBj6Zje9LMrw=;
  b=S6/MxfbulmDsNRUkPvwAwnfYBo3Ujgg2Bwckfv5X6ogcFdf1alurdMmI
   Ddh4i/bXSzl0+VfhR7n8wNHaqjGduuOeahQ7UpygRkAMOKirN7U9GMUDg
   wtPbLkb9qAecitt1q+W65MvcidGJ7Xruh+51uFDtv1kpF6ZP5fecwZ1u1
   BppMwd6mt0U3IZd7BiEqxuoO7CPbn9Tb23ZUFWjgHTs+IP0L9ZMyMPIjd
   4DkXL5Sl3VSCGdojNCCsqQKIkpqNJBInXI//xv9InZEwYk4eOA/zT5rlh
   BVXLIH03RO8VhuJutr0NVRXevT4gjnO6L7uNbe2LhFyGAQzvvLkNg14jt
   Q==;
X-CSE-ConnectionGUID: R3Xd5aSjSsmkNHhKGzpSIQ==
X-CSE-MsgGUID: APmD12wdTESG2gwmGsp0gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68887283"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="68887283"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 01:55:10 -0800
X-CSE-ConnectionGUID: wC8sNW89ToaAqX+ZEqFmrA==
X-CSE-MsgGUID: 4wq+okFpRCSbMm2LbKcNnQ==
X-ExtLoop1: 1
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.116])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 01:55:09 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 512B711F9B2
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 11:55:07 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfxal-00000000T5X-0HWV
	for linux-media@vger.kernel.org;
	Wed, 14 Jan 2026 11:55:07 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: ipu6: Update e-mail addresses
Date: Wed, 14 Jan 2026 11:55:07 +0200
Message-ID: <20260114095507.111807-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove Hongju's e-mail address that no longer works.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 2 +-
 drivers/media/pci/intel/ipu6/ipu6.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index fc0ec0a4b8f5..551dd5027dc8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1373,7 +1373,7 @@ MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
 MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
 MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
 MODULE_AUTHOR("Yunliang Ding <yunliang.ding@intel.com>");
-MODULE_AUTHOR("Hongju Wang <hongju.wang@intel.com>");
+MODULE_AUTHOR("Hongju Wang");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Intel IPU6 input system driver");
 MODULE_IMPORT_NS("INTEL_IPU6");
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 1f4f20b9c94d..63db64b75d56 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -841,6 +841,6 @@ MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
 MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
 MODULE_AUTHOR("Qingwu Zhang <qingwu.zhang@intel.com>");
 MODULE_AUTHOR("Yunliang Ding <yunliang.ding@intel.com>");
-MODULE_AUTHOR("Hongju Wang <hongju.wang@intel.com>");
+MODULE_AUTHOR("Hongju Wang");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Intel IPU6 PCI driver");
-- 
2.47.3



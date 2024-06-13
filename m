Return-Path: <linux-media+bounces-13202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B406790778F
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 17:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA2CE1C22762
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 15:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244F212EBC2;
	Thu, 13 Jun 2024 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYn8cIes"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EEC4C6B
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718294009; cv=none; b=L6+2G6qsBk0eIF29delqmLbYh4KrvD+d2iRG+1ew71L5E7BIoCa1dBM6HOgqxesqHElk2OArwKMsZLB5QC55ET6/b4FcPehgFoNZxKm9VDmC/MlJpbq5dWUd0ANFGJlmFEs31M3hNp75rH3g0TZnmxtWMW8eDxgJHI2LwBA1HBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718294009; c=relaxed/simple;
	bh=rI09vXtiQaoVk1Bp1c/l0arsuj0l/55M1tBQU3nr+Ew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hjLGR3FpqpZ8CykuF/JiJTzjiNwxpSiCMlDGz0NmdidOj1lAp/LpFknEUM4zZ9uXhCzo2+6l36Zb3wKh9KwF3j/FOZUQSciy/77K423ZSlZKT29orfpcvjZborBiCdtXRxP39CyR1IGcpKRlHIUrCi2uNQY8+BaffYjmtIMMuZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYn8cIes; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718294008; x=1749830008;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rI09vXtiQaoVk1Bp1c/l0arsuj0l/55M1tBQU3nr+Ew=;
  b=hYn8cIesVs62BgBCGpOplfO7LnVU8IwYZ2avMMVjmEFUMlEQsBgBFm2G
   0KPeb7RmK8wfF0wKmVhO2Pnh/67YrqWoRUVngEEknWdafzqBeyT9+V4oG
   Q9A0eXZw8iGXaPKgW0WHf8rBgsnaNVaK/bGYaYd8ofNCFf6p5gXETwySR
   RvlpBNQvUPC+0oEd/c3FC9SZMrsv9jtyYuEb6SsWkuNu6UbTujfo5ayth
   vCoifW79olSyJyRaXviA46GJ7sCDeeSsc2veFc2vp274+TPp+5D0oRunj
   5QM0mXrYuNU/jJSEOJwyH3IoFRHtOuKJmLVjJj5sd1SiqPEkpBcZVh4ZD
   w==;
X-CSE-ConnectionGUID: K/1xuNilRSeQk8jVYpIrAw==
X-CSE-MsgGUID: ShlQNWboSfq5vdheGFqB+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25802948"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="25802948"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 08:53:27 -0700
X-CSE-ConnectionGUID: bVXBR9OPR5+LNQ6PVdu1Hw==
X-CSE-MsgGUID: eSlrnabpRLqzBP2qlO13tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="40154603"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 08:53:26 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9718811FA94;
	Thu, 13 Jun 2024 18:53:23 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sHmlP-009yO1-1j;
	Thu, 13 Jun 2024 18:53:23 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	wentong.wu@intel.com
Subject: [PATCH 1/1] media: ivsc: Depend on IPU_BRIDGE or not IPU_BRIDGE
Date: Thu, 13 Jun 2024 18:53:13 +0300
Message-Id: <20240613155313.2377069-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ivsc drivers may use the ipu-bridge but currently it's possible to
link the ivsc to the kernel and ipu-bridge as a module. This won't work.
Require that the ipu-bridge is either linked to the kernel or disabled if
ivsc is linked to the kernel as well, by depending on IPU_BRIDGE or
!IPU_BRIDGE.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406132238.3hXHG7nB-lkp@intel.com/
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ivsc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ivsc/Kconfig b/drivers/media/pci/intel/ivsc/Kconfig
index 407a800c81bc..a7d9607ecdc6 100644
--- a/drivers/media/pci/intel/ivsc/Kconfig
+++ b/drivers/media/pci/intel/ivsc/Kconfig
@@ -4,6 +4,7 @@
 config INTEL_VSC
 	tristate "Intel Visual Sensing Controller"
 	depends on INTEL_MEI && ACPI && VIDEO_DEV
+	depends on IPU_BRIDGE || !IPU_BRIDGE
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
-- 
2.39.2



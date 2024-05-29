Return-Path: <linux-media+bounces-12133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2748D8D2B8B
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 05:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6D0A286FFB
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 03:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F6715B139;
	Wed, 29 May 2024 03:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwopyzL8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A81A273DC
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 03:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716954277; cv=none; b=JASjWYz4/dsxFdVZlP1Cmu7QYt25s3kC/RwCkKVx+JsQpnj7D5/knjHYYHfvumfMGLBHE5Agicr78ttj+xe6xRlwvDShKw3dsgrRXw5ctVyWfftkSI7n5/g1bFsNz7ELDU87goy1/RTirtiuDbPADqXNyEhB/7XeHwPm5yIPo/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716954277; c=relaxed/simple;
	bh=GjmhgaikhwIwfDu0rQMWFgnhulBxUgwpGMPxgY+LmIg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XaedfOj//YZdmC+Dmofrw3tjvy+VQdnA3D66+gX6BBdBSMMSBg1ndbAKrCyT4d726xNQmn6NwylGZH3DEoWskKWzBPiOjpKDV+JLlNHmLKFNwBF/Se8Ng08EzjIEypG6+fDIe+hgWlPa6hhLkRMnY1k+Glpvdqc7JaWbjpcqHik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwopyzL8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716954276; x=1748490276;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GjmhgaikhwIwfDu0rQMWFgnhulBxUgwpGMPxgY+LmIg=;
  b=PwopyzL8UJncFWdm6Hjm7MKBX1WX+zWRQ98H6nEjPM2q24UgRBRTSUz1
   ViP4q+OYajWDGySij1yqyWgeA1kgJUuyl5LC34wtM9zLxr4FH0DoZ173e
   Un+QJFoB90VTkM9xPSyjKlXDPGhDqLQmKgUuvhZfo2kl81k1scaocCoB5
   V5Gy0cpQpbmxyQeHZu8M5lqK6FZ5JVF0zOqj3sAZpI9Ku2O5IQ/6+fofW
   fY+SMEMpn3nKc1pVroprrq5JRP5oE8QHNfRhql2qTDmEnh9tI4lhLNQ5x
   BA4GDPX3SjsZ9QRCxGMQJtazViCXVK2MKIjbMbJTe65vQNv3icAi02Ey/
   Q==;
X-CSE-ConnectionGUID: OIZyT7MiQYKh0mgRAJbzXw==
X-CSE-MsgGUID: Dd/CZsJTQNqCDaGeG7j80w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="16283669"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="16283669"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 20:44:35 -0700
X-CSE-ConnectionGUID: 1UvLgbcNQr6nWBhPe40p0w==
X-CSE-MsgGUID: +zlM1KZ0THmHi4PZ1cuRFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="40277326"
Received: from icg-hal3.bj.intel.com ([172.16.127.200])
  by orviesa004.jf.intel.com with ESMTP; 28 May 2024 20:44:33 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: tian.shu.qiu@intel.com
Subject: [PATCH 1/2] media: intel/ipu6: update the maximum supported csi2 port number to 6
Date: Wed, 29 May 2024 11:44:32 +0800
Message-Id: <20240529034432.113999-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

IPU6EP on Meteor Lake SoC supports maximum 6 csi2 ports instead of 4.

Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device driver")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index d2bebd208461..56d453378de9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -285,7 +285,7 @@ EXPORT_SYMBOL_NS_GPL(ipu6_configure_spc, INTEL_IPU6);
 #define IPU6_ISYS_CSI2_NPORTS		4
 #define IPU6SE_ISYS_CSI2_NPORTS		4
 #define IPU6_TGL_ISYS_CSI2_NPORTS	8
-#define IPU6EP_MTL_ISYS_CSI2_NPORTS	4
+#define IPU6EP_MTL_ISYS_CSI2_NPORTS	6
 
 static void ipu6_internal_pdata_init(struct ipu6_device *isp)
 {
-- 
2.34.1



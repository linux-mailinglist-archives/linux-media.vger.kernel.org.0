Return-Path: <linux-media+bounces-29908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB504A83F6B
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 11:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AA13447EC5
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 09:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A542686AB;
	Thu, 10 Apr 2025 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7tYGwq/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1882F26AA92
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278739; cv=none; b=UHA6KPD3Io2cRUkJjvokiNpvf5oYjtNRvoojlRMw8scCgd/cYbSBeXHe6SB3toaJyDSStNGJjzflPzsDWIQmqroBl2nCfXL2Rv/3IyWsN3mX7V/bllq3n0lS+IF5F2AJpjnw647aBfpdndJ46pHSbrRI9dLeXljYEZ78qP05xMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278739; c=relaxed/simple;
	bh=zXA7HPbj0xT1BdxfGNSGzw1jBzkGSxI0vrrV9UAG/oA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CcKhDSM477LQWIhp7h1Mcjsr/t4DXdhXpHbzhlbpeobtZX0cs+tc5ukR7RC6i01Bcvpf3zT8Ue9pDvq1BPRsfQXdPMgWIWsoJgjzvkUYFkvJ4axp0SKxCTVaVtp6xtDtHk22CuArhlnBWXxvS5m5yVGjtXtdaAnex5xI1uiPSJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7tYGwq/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744278739; x=1775814739;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zXA7HPbj0xT1BdxfGNSGzw1jBzkGSxI0vrrV9UAG/oA=;
  b=d7tYGwq/4fkb7wzpGfbdqpTVnjZXvL7paETnD0nT+2BNkTNpYaa9LC/A
   /+aEbmSxnogoyc//yHV4ZLeEMVOHvJzMYc0FtpZaavnYOkcpRqPzNYUpg
   HgaPTWhxf6z/JlZJj2P5tVmfOcOSZ1h+e5LAi8EYzC/AOsVyuBiU7lDgt
   qq6dnk7iWvbzL2DiETwZ71DAeUTwZz2i9kd5vMwxj9A3uzKbwglUWlq+B
   RyosvbnWLFie2k7FOZOEPCFBsD0p+SaJl0YoqYza9PQZtGyI5w5oPLR2X
   XUWkppAWMx5SAFBa8L7YtPwv8Jt6TCqJ/W3j4vYTMgyQ834Q7kEMH/Vxx
   A==;
X-CSE-ConnectionGUID: o1Rel+AAQwSbIeQ2xRouDA==
X-CSE-MsgGUID: Xsldx8r7TsiDYRoK3E1JiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="56769317"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="56769317"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 02:52:18 -0700
X-CSE-ConnectionGUID: to7rG4PcQK+os10+luZxhA==
X-CSE-MsgGUID: NTP1LnysRE6XX4ahDs2hhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128819056"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.254.14])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 02:52:16 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH] media: intel/ipu6: Minor dma_mask clenaup
Date: Thu, 10 Apr 2025 11:52:13 +0200
Message-Id: <20250410095213.47236-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused dma_mask field and ipu-dma.h includes.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-bus.h | 1 -
 drivers/media/pci/intel/ipu6/ipu6-dma.h | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.h b/drivers/media/pci/intel/ipu6/ipu6-bus.h
index b790f9cc37e3..a08c5468d536 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-bus.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.h
@@ -26,7 +26,6 @@ struct ipu6_bus_device {
 	struct ipu6_mmu *mmu;
 	struct ipu6_device *isp;
 	const struct ipu6_buttress_ctrl *ctrl;
-	u64 dma_mask;
 	const struct firmware *fw;
 	struct sg_table fw_sgt;
 	u64 *pkg_dir;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
index 2882850d9366..ae9b9a5df57f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
@@ -4,9 +4,6 @@
 #ifndef IPU6_DMA_H
 #define IPU6_DMA_H
 
-#include <linux/dma-map-ops.h>
-#include <linux/dma-mapping.h>
-#include <linux/iova.h>
 #include <linux/iova.h>
 #include <linux/scatterlist.h>
 #include <linux/types.h>
-- 
2.34.1



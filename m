Return-Path: <linux-media+bounces-19523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 211B099BE54
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 05:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B517FB230D6
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 03:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7318136331;
	Mon, 14 Oct 2024 03:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d21lIH+p"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22812AAE2
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 03:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728877663; cv=none; b=fuRXWMsz1njLZNZIOqSCfQ8/tgGmRhEhwrmhxF4uPYn4yH564fhDMSVBQBC0ajreVHMTBI/82rmCKwpUkEg1+ISest5reD+scyTTeUFQRC+NqRX5bqyA0XbyY/s+zPYkRYZN4G3Ac4C9sm/Auamq5MJ/UTrfhSgtABJJAIoCDcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728877663; c=relaxed/simple;
	bh=Vs7S8+pmBnlsTpJk/AFlBUY1hhosAmX9KeNTn9zII/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aH6nzLLEgAxe3OXu86a/65qU/FGUav74nbjY8drGA2419AzVBcLO6z9LqxntojOw2PWyYy/ceV11IQhtBjXqveSToyJbjWTVyJ62OB3Pge3KTBi5YCSRPj1+Ukl7wuY3wexnKHDyvRyhALKz6ZnSu+v+jzikus58bAdgUfLq+L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d21lIH+p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728877661; x=1760413661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vs7S8+pmBnlsTpJk/AFlBUY1hhosAmX9KeNTn9zII/c=;
  b=d21lIH+pTUaCN50GcTnqnn8YG9V9Tk7IV2T8JR/m+QQgfxRjKzQA1YTd
   wYKhwnQhMlJ9zw2tE4yAUx1jssQfUnSBEiMBC7HDobG0H7LVx06IuKGNA
   qLN93gL7qQ2SuwSPAk+LbwkM9LUtXJHGMcAUT7+0oJbadxPcOGI7fS/R0
   tw6m+6EItSYKfJUyOVdRrfUfjj61xlzVYPk7XbEsW1ZbpVtVolR9QxUzX
   5ZTaCxzWirDuVKCEFB7b9eMRz+Km0ILTb8/qgULfbm9i6Ex/4UCbhx9TA
   BqDIaOZ4HJRK8SPhHOKhAzXC+flnQ1gC2T6lqCCz3AuFDBGTyuPJ4PID5
   w==;
X-CSE-ConnectionGUID: ocjz1M9TSVaaQj6LRc+uNQ==
X-CSE-MsgGUID: oT90aNViQ0KuOO+PaBQbGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="53632126"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="53632126"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 20:47:41 -0700
X-CSE-ConnectionGUID: DA9uZfGRQt2qqHUgyUdWiw==
X-CSE-MsgGUID: 9xPk/Nb/SK2zDWhFBcnOqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77076867"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa006.fm.intel.com with ESMTP; 13 Oct 2024 20:47:39 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: hch@lst.de,
	andriy.shevchenko@linux.intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH 4/5] Documentation: ipu6: remove the dma_ops part from the doc
Date: Mon, 14 Oct 2024 11:47:31 +0800
Message-Id: <20241014034732.3109440-4-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014034732.3109440-1-bingbu.cao@intel.com>
References: <20241014034732.3109440-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

dma_ops override is not in code anymore, so remove it.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 Documentation/driver-api/media/drivers/ipu6.rst | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/ipu6.rst b/Documentation/driver-api/media/drivers/ipu6.rst
index 6e1dd19b36fb..88f6498e74db 100644
--- a/Documentation/driver-api/media/drivers/ipu6.rst
+++ b/Documentation/driver-api/media/drivers/ipu6.rst
@@ -98,21 +98,6 @@ The IPU6 driver exports its own DMA operations. The IPU6 driver will update the
 page table entries for each DMA operation and invalidate the MMU TLB after each
 unmap and free.
 
-.. code-block:: none
-
-    const struct dma_map_ops ipu6_dma_ops = {
-	   .alloc = ipu6_dma_alloc,
-	   .free = ipu6_dma_free,
-	   .mmap = ipu6_dma_mmap,
-	   .map_sg = ipu6_dma_map_sg,
-	   .unmap_sg = ipu6_dma_unmap_sg,
-	   ...
-    };
-
-.. Note:: IPU6 MMU works behind IOMMU so for each IPU6 DMA ops, driver will call
-	  generic PCI DMA ops to ask IOMMU to do the additional mapping if VT-d
-	  enabled.
-
 Firmware file format
 ====================
 
-- 
2.34.1



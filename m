Return-Path: <linux-media+bounces-19727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4129A0325
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 09:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC4141F21D51
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 07:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2BC1D14FC;
	Wed, 16 Oct 2024 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjKUB0Ee"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4771D0BA0
	for <linux-media@vger.kernel.org>; Wed, 16 Oct 2024 07:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729065197; cv=none; b=sjreVWBbLLnUWdzh8UzbKUiNnSZbIByZy/YZDYtyP04JeBxVStKXYjzuKWjdoJEkRuQTu+iakQACxkQySNi/JTRaH7LMTVvhGWZUzcnJCXbU/DChgoTqt8eVUKcGU8W+FOihTqKsUXyRJrQdr895n/MX3SMDb+uLpw76aPNzduw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729065197; c=relaxed/simple;
	bh=Vs7S8+pmBnlsTpJk/AFlBUY1hhosAmX9KeNTn9zII/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LwVVX+XSzqHOY00iTmgIWswlun1nIASBTp++IZgIPcEOfyDdrMLfnMHQm82gS/SFk87ST/RXtm1K9K/A0gXOMhEZ13HELXuCgDynmi6ovjxHP43kPRt+Kmi0nURSFwu3yh418w/zWshmutojRP6AU8+923XLbGWbqr5MtcmIhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjKUB0Ee; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729065196; x=1760601196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vs7S8+pmBnlsTpJk/AFlBUY1hhosAmX9KeNTn9zII/c=;
  b=OjKUB0EezzxzkgEoucmMZDE6fxXeM+lb0l2owp2GOrxyIb78DI/va+Zp
   81uq00pBOxytQsqPVH3kOElGJAexQr+v99dOPN3REpUY0LElF+4rt2ZWq
   akXQcTwrQV545F3/1nkc+voyZq1De3BZYLJpWYbInxdCRa/lL/gMLHLnB
   vFlFd+FAY5tMhX50HA9nEEhECPMeSEQFqvdiXYywce4zjwdO2lcbGFNFY
   jSlpgiBqvnOOaSinoZL3jeF5FgtD4vxxqbOaX8nP7xyERGjjwAynMab+S
   LoEAqZOq1yX5bWxRnLL7zjFl3TwOMppSMh0bwFFAsrpt+61P/jXluWwUX
   Q==;
X-CSE-ConnectionGUID: iVC4i8c0QEWQrpu0fGjlMA==
X-CSE-MsgGUID: FWL6L0NWRZmUCcSqHd1TLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27971561"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="27971561"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 00:53:15 -0700
X-CSE-ConnectionGUID: mhM6YtwTQJaHER5eZog2pw==
X-CSE-MsgGUID: /wSnSrNJQrCiRvUMbHmZgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78313768"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa006.jf.intel.com with ESMTP; 16 Oct 2024 00:53:13 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hch@lst.de
Cc: andriy.shevchenko@linux.intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH v2 4/5] Documentation: ipu6: remove the dma_ops part from the doc
Date: Wed, 16 Oct 2024 15:53:04 +0800
Message-Id: <20241016075305.508934-4-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016075305.508934-1-bingbu.cao@intel.com>
References: <20241016075305.508934-1-bingbu.cao@intel.com>
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



Return-Path: <linux-media+bounces-19726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBF59A0324
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 09:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A60F91F218D1
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 07:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5B71CC8AB;
	Wed, 16 Oct 2024 07:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBMPcMzI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB8B1C8FB4
	for <linux-media@vger.kernel.org>; Wed, 16 Oct 2024 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729065194; cv=none; b=XyBywlAjNKtEYr9iarh/btBZOS1jZncfaFfufGQdog4JPPn2X/xEeOzXA3ny/PNYl2Opkz6MHauHp6eeZbLvRzYaT3Sa6rFSp7xbiAm8NoDc1XQShhJ9NqgKeZy1LNQciR9RFT3FP6gIPXB+4bFb3yfkeBbu/4QrjhcDmXvhiV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729065194; c=relaxed/simple;
	bh=wH5nHMB6h0vPqr7wQ0QEBlatD5kJirp+3vXUtoKjz5g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FPdXO+E1uCR4wnS6dK4FG9pmpFmXF8ORQTEZOGuXpeo7TYpDVEX6OsHk1QtTmVlXJbCIGxNI18FuFIzxmMYvCCruagrpFp6BvtVmFcXPCCN0yEsARmcMRS3tHBmCpA3T7llisSFmcgeDZDA2bRoYwKEY3Zd3/Nl5QP4u+6zxnPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBMPcMzI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729065193; x=1760601193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wH5nHMB6h0vPqr7wQ0QEBlatD5kJirp+3vXUtoKjz5g=;
  b=gBMPcMzI+lbjJOcGwPL7Jqb9klXCqlnpIuBR/akeFMN7ceffx+bVnr9C
   4+HLwl7dcxns9JGyKEP2Ncagpg9qwrzczld2o2vrMS1Z9HiNKSr6wMthA
   EXcxNQXCSABzhQ/FexLkhcJjJgVj/dAOLiCyfQt0F3uGQvp7B27dLD5MA
   R1N1bswCmyh+ODPB0JTo9j9/Bl9NXaj8UJFfp5peCBAVhBhoGY69EIsyt
   SKOsAb4c0YfoPVKxvhbMP0lMBRK5ttIcxBBCQzSoj/Mw6XgS9XmixSR8S
   7VSvE+UIuH+afJ8S1ToVsmBNGOvjfEBVKOQPtMo8d82f1UW1tBttl5+iJ
   Q==;
X-CSE-ConnectionGUID: PGu25sHyRmaL6wvLiz7Dvw==
X-CSE-MsgGUID: /nqp2x2CTIW4Tru5YDlYUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27971558"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="27971558"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 00:53:13 -0700
X-CSE-ConnectionGUID: QpFK6NFeRyaX8HpJwIYRrA==
X-CSE-MsgGUID: snlv2PEgShWLaO3ffavXsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78313753"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa006.jf.intel.com with ESMTP; 16 Oct 2024 00:53:11 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hch@lst.de
Cc: andriy.shevchenko@linux.intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH v2 3/5] media: ipu6: remove architecture DMA ops dependency in Kconfig
Date: Wed, 16 Oct 2024 15:53:03 +0800
Message-Id: <20241016075305.508934-3-bingbu.cao@intel.com>
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

IPU6 driver doesn't override the dma_ops of device now, it doesn't
depends on the ARCH_HAS_DMA_OPS, so remove the dependency in Kconfig.

Fixes: de6c85bf918e ("dma-mapping: clearly mark DMA ops as an architecture feature")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/Kconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
index ec6c1ea329ed..cd1c54529357 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -4,12 +4,6 @@ config VIDEO_INTEL_IPU6
 	depends on VIDEO_DEV
 	depends on X86 && X86_64 && HAS_DMA
 	depends on IPU_BRIDGE || !IPU_BRIDGE
-	#
-	# This driver incorrectly tries to override the dma_ops.  It should
-	# never have done that, but for now keep it working on architectures
-	# that use dma ops
-	#
-	depends on ARCH_HAS_DMA_OPS
 	select AUXILIARY_BUS
 	select IOMMU_IOVA
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.34.1



Return-Path: <linux-media+bounces-19522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C199BE53
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 05:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB1CB1C21D22
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 03:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6741D130E4A;
	Mon, 14 Oct 2024 03:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWsCydIp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAD37602D
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 03:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728877661; cv=none; b=lyIEu+Cs4yhxmChvx3qXQ+MWtMyNfMC/42Dk6pUuU58uqq/e9RwdxLFXbtRmJE2ceVadQL8CqR2KEx+BuV8chvolRtd9AqFxtgePgLJMr23stWigONOrf9BbOfgfqXLRvs/A9fp16OXtA/J51Hwyy+dSJ+nypK+UtLMAy44V+p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728877661; c=relaxed/simple;
	bh=wH5nHMB6h0vPqr7wQ0QEBlatD5kJirp+3vXUtoKjz5g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RWtfb227qpPTOG6jwqcJ71OrybJuido1XsVAyrAFl2ObshA51TCPUk4c7wdGhj7i2jYV1VU1u9wJTd1mmTFjl2jV14GiIo9ZoUW6hAIPHM84r+Q8U3QMfLYrLB0MHtG48OeloeMgBQH9va2pY9Sv3BrKMmzALtBr88uzfjDv69Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWsCydIp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728877660; x=1760413660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wH5nHMB6h0vPqr7wQ0QEBlatD5kJirp+3vXUtoKjz5g=;
  b=SWsCydIpJVQgfGm+viqzhaFXMCpuNnVFbwv5hbP+llSqjUfyoSqUq/XM
   i8gEDb0Xd0NuIaTZQyJ6+dv9XoewCR54hvv8H9Pm+PdJ8prlfU9M3d2PI
   k8kzXY5neWbFkT58cuNjlHLRGIapXPovNOD6LGE7JMmzORz8aEg42LWdP
   5699D6airrGYgE6wr1QKGVDxfpk5Mg8NfLwYj1hgEs2UoN8APdxqS2VBA
   CdwNPhF8ALaPLx1GA+LvFBNly1TTlhcgHSQUe0QGRjFC/xvveRyGfpGx/
   EtOeZAPKQGdU1OJ+Won6IKVt7bXRyLTH7Jo/LURrB22s6Ofe9J+ohaSRs
   Q==;
X-CSE-ConnectionGUID: Zf7yttthShKnnw3eps6+HA==
X-CSE-MsgGUID: U0uerKBjSdmrqIfCl934ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="53632124"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="53632124"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 20:47:40 -0700
X-CSE-ConnectionGUID: A5quZuoeSOCtTs/E2z/E3w==
X-CSE-MsgGUID: r3gmTKziT+WH3o3Daj2QbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77076860"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa006.fm.intel.com with ESMTP; 13 Oct 2024 20:47:38 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: hch@lst.de,
	andriy.shevchenko@linux.intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH 3/5] media: ipu6: remove architecture DMA ops dependency in Kconfig
Date: Mon, 14 Oct 2024 11:47:30 +0800
Message-Id: <20241014034732.3109440-3-bingbu.cao@intel.com>
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



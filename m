Return-Path: <linux-media+bounces-15066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CCC933821
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 09:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35EF11C22603
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 07:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC911BF53;
	Wed, 17 Jul 2024 07:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgAdG3v4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717EA156E4
	for <linux-media@vger.kernel.org>; Wed, 17 Jul 2024 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721202055; cv=none; b=b7kqHA9UEimebd9aZpRXiczVEdUfMYSUb8V434GeuldhBvTFtik/xStKC5tlEbO5vZ6YEOSITQmcgqnVAaquXPZvyjPA9iZfoFGlUiIIX0RAEnA7Z7eZy3ttsPnKZpBVp5v/wUvPlGvPTgUGkXbPJg+nRwiaYV7jp/CXAVPQqT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721202055; c=relaxed/simple;
	bh=STrcyBot0ToOTTEdCawvquzUA6pTHf+wkKpGd/rPzoY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=dQ3mFbllj+BTlMIxrX/W5g0kT/xk6TSk0tvzc3kmII38AT8kDr75JfmWDh0Y/zo+qZvBl16j4OCaOWTyQJVPlbvyFBvrBo//zWI69Ae8EC9aox2sTxeyW6pevA+GWhvzf4lfek7P/P7F2cGmnjZoF7K801QnRWlocEHfhN5ZaFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgAdG3v4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721202053; x=1752738053;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=STrcyBot0ToOTTEdCawvquzUA6pTHf+wkKpGd/rPzoY=;
  b=EgAdG3v40AUD+miHWmvTSmT9m5K5VvlO3PFA7OJfhWAmknZAX1dlITYx
   pbvCiFABD4n510ZD1I8qbmWubT0t6pu3HPhygNqMzk4KmZvCh/OlvKSd3
   eCmY3k4M0xBbY2ipL48lUNk7NQMgNvMjQud8nLdvOVwApgsR/LHsVHb9I
   MYZKU1ZPFvJfTSGNhxi7qU2LdypoTzCgXO04fD/8TpKmUShu4rZI/vnHG
   lnqFayHRxV1ZnyU0kQnBwpkmV3WXeUBJAAxT7XiUSazzjziVrY7DrHXlW
   ItEvdsWqNtRHh+FffCM2Orhwu4nZz4Vt/buwHnc4x7zrwocbzKZ0bFtyh
   A==;
X-CSE-ConnectionGUID: dNFkyPS1Rs6m5RdJwHzHXw==
X-CSE-MsgGUID: p0OKJkGYT3qX9B+bR82JPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18641091"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="18641091"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 00:40:53 -0700
X-CSE-ConnectionGUID: LQlWsfsRQfy9SRsWGjFgqA==
X-CSE-MsgGUID: lIzc5MEnSgma8fxvoDBSaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="50172097"
Received: from icg-hal3.bj.intel.com ([172.16.127.200])
  by orviesa010.jf.intel.com with ESMTP; 17 Jul 2024 00:40:52 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl
Subject: [PATCH] media: intel/ipu6: select AUXILIARY_BUS in Kconfig
Date: Wed, 17 Jul 2024 15:40:50 +0800
Message-Id: <20240717074050.4067898-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Intel IPU6 PCI driver need register its devices on auxiliary
bus, so it needs to select the AUXILIARY_BUS in Kconfig.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407161833.7BEFXejx-lkp@intel.com/
Fixes: c70281cc83d6 ("media: intel/ipu6: add Kconfig and Makefile")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
index 154343080c82..70f4c8b772a3 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_INTEL_IPU6
 	depends on ACPI || COMPILE_TEST
 	depends on VIDEO_DEV
 	depends on X86 && X86_64 && HAS_DMA
+	select AUXILIARY_BUS
 	select DMA_OPS
 	select IOMMU_IOVA
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.34.1



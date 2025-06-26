Return-Path: <linux-media+bounces-35924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC249AE94CE
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 05:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62FE55A4F2A
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 03:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C30620C00C;
	Thu, 26 Jun 2025 03:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BT9e+BF4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BB41CAA79
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750910350; cv=none; b=fHn0fagnndd/WVM5E6+xwTXr7GrJO8aHsJ67evH0o91EtaQukLiEScI9KNNlaGdEBsgIzDN0ic5/cNwbbj7SCD2keWE8gmunD8an3Dd5HfkUhj9nlIPmCipRSCZS/NO8O7chjSyCzPbuP530ZigAd8cpnSSKs2hhwq1Qq+upvwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750910350; c=relaxed/simple;
	bh=GjY1cKyF4nERIybjqqKwBUr5AbqPmUJFJ20bZmYrNzQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eqUP45z7y/vH5fpzjWZVUa/aY3hdEZtsyZP2nHySyDtqylgpIZVlhGr/DzvsxIffPhTkml11uOABcbfwI4UJYUXfg+ASFMd36W7gz3RshaEr1W2b49BQrbs7i3aSHelCG5xNFOw3SXKiUd4CAZm5alurHOYH4vVGl+kdICSgPYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BT9e+BF4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750910348; x=1782446348;
  h=date:from:to:cc:subject:message-id;
  bh=GjY1cKyF4nERIybjqqKwBUr5AbqPmUJFJ20bZmYrNzQ=;
  b=BT9e+BF43Ra8p+NGvRKXXeGzMNzPlFJgUdN01MTNZgjsIFasCOj5yUEV
   3BMUcoeYCh4Ul0jqx6ec+GjCy0G+qEl8vZuS9w7FqPj56e2lqO27Qb+yz
   py9pxqnkaeLsYnd7lXblWx16lj4v0Fg7nnM1RxLYxzb0azI+7JCyS4LtF
   x37mr34rpzh+upvwJgJy2DZ/IKLb2QFpFqBnhJVGGCO0O1PKilZONzuN2
   ScMTAHynHP08suWAh2/m3BnQUB71uPpJfTkfHUL4sLBMvuUHNymvDOSUI
   sUZOdcJIcbHPi893B5o6tZNxyzlkeIyXiUe4TMFJUtF9AUSA4s7KUAue5
   g==;
X-CSE-ConnectionGUID: r4Y3MTMmTMCSXTg1xkuEYg==
X-CSE-MsgGUID: rY0p195PTtalXAmW3b2bCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="40811574"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="40811574"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 20:59:07 -0700
X-CSE-ConnectionGUID: c/JA4WC9R86kDsqqc+bnQw==
X-CSE-MsgGUID: FXrjRNOAQryfBTqOoe5YTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="152163060"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Jun 2025 20:59:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUdlP-000TiU-2l;
	Thu, 26 Jun 2025 03:59:03 +0000
Date: Thu, 26 Jun 2025 11:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu7] BUILD SUCCESS WITH WARNING
 0542d88a01679ac03a980f7d53daefe8caebe345
Message-ID: <202506261124.kw9KjMrH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu7
branch HEAD: 0542d88a01679ac03a980f7d53daefe8caebe345  media: staging/ipu7: add Makefile, Kconfig and to-do file for IPU7

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202506252004.5hMovDGZ-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202506261100.HLBItoq7-lkp@intel.com

    drivers/staging/media/ipu7/ipu7-boot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
    drivers/staging/media/ipu7/ipu7-boot.c:212:6: warning: variable 'total_queue_size' set but not used [-Wunused-but-set-variable]
    drivers/staging/media/ipu7/ipu7-buttress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
    drivers/staging/media/ipu7/ipu7-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
    drivers/staging/media/ipu7/ipu7-mmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
    drivers/staging/media/ipu7/ipu7.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- alpha-allyesconfig
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-002-20250625
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-004-20250625
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allmodconfig
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allyesconfig
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-001-20250625
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-002-20250625
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-003-20250625
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-004-20250625
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-005-20250625
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-006-20250625
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- openrisc-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allmodconfig
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allyesconfig
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allmodconfig
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allyesconfig
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-allmodconfig
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allmodconfig
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allnoconfig
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allyesconfig
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-allyesconfig
|   `-- drivers-staging-media-ipu7-ipu7-boot.c:warning:variable-total_queue_size-set-but-not-used
|-- x86_64-buildonly-randconfig-001-20250626
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-002-20250626
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-003-20250626
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-004-20250626
|   |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|   `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
`-- x86_64-buildonly-randconfig-005-20250626
    |-- drivers-staging-media-ipu7-ipu7-boot.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
    |-- drivers-staging-media-ipu7-ipu7-buttress.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
    |-- drivers-staging-media-ipu7-ipu7-dma.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
    |-- drivers-staging-media-ipu7-ipu7-mmu.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
    `-- drivers-staging-media-ipu7-ipu7.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing

elapsed time: 1092m

configs tested: 110
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250625    gcc-11.5.0
arc                   randconfig-001-20250626    clang-20
arc                   randconfig-002-20250625    gcc-12.4.0
arc                   randconfig-002-20250626    clang-20
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250625    clang-21
arm                   randconfig-001-20250626    clang-20
arm                   randconfig-002-20250625    gcc-11.5.0
arm                   randconfig-002-20250626    clang-20
arm                   randconfig-003-20250625    gcc-13.3.0
arm                   randconfig-003-20250626    clang-20
arm                   randconfig-004-20250625    gcc-15.1.0
arm                   randconfig-004-20250626    clang-20
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250625    gcc-11.5.0
arm64                 randconfig-001-20250626    clang-20
arm64                 randconfig-002-20250625    clang-20
arm64                 randconfig-002-20250626    clang-20
arm64                 randconfig-003-20250625    gcc-12.3.0
arm64                 randconfig-003-20250626    clang-20
arm64                 randconfig-004-20250625    clang-20
arm64                 randconfig-004-20250626    clang-20
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250625    clang-20
i386        buildonly-randconfig-001-20250626    clang-20
i386        buildonly-randconfig-002-20250625    gcc-12
i386        buildonly-randconfig-002-20250626    clang-20
i386        buildonly-randconfig-003-20250625    gcc-12
i386        buildonly-randconfig-003-20250626    clang-20
i386        buildonly-randconfig-004-20250625    gcc-12
i386        buildonly-randconfig-004-20250626    clang-20
i386        buildonly-randconfig-005-20250625    clang-20
i386        buildonly-randconfig-005-20250626    clang-20
i386        buildonly-randconfig-006-20250625    clang-20
i386        buildonly-randconfig-006-20250626    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250626    clang-20
x86_64      buildonly-randconfig-002-20250626    clang-20
x86_64      buildonly-randconfig-003-20250626    clang-20
x86_64      buildonly-randconfig-004-20250626    clang-20
x86_64      buildonly-randconfig-005-20250626    clang-20
x86_64      buildonly-randconfig-006-20250626    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


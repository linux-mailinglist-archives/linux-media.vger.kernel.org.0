Return-Path: <linux-media+bounces-36406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62DAEF61B
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97B597AA78B
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 11:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB892727FF;
	Tue,  1 Jul 2025 11:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCUgMh3+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0AB26F44D
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367982; cv=none; b=HZg+bBlvMA4HFAchdQLgeCxuBq4Dcuu5qdqxMMIkRp5h4gWfkbnT0NzlK9xXKBurz+LctOiF/2d1ocQ8tT+knLsfCXjBPKOWXTNdY5ibAQ6fEIQw4anNhLUh/S8qeI3VajdlgCn2jwvCpGPJ3RGP1x+L7ZfJHh08SeifDx8nkws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367982; c=relaxed/simple;
	bh=KRpfEuO2Tw38mNRrq+q12z+0o0Oofv/8Qe13+/mLdDQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E11ohAjXHttF0iUFvJCLpQZ9y7ZHkjiTiUJxP/O/obbDs8qV12hSYfYVMDRv07f2WKWK0FT9Homfv3qztAnwgF7ldVOJr7AHKvBanXozBKtHjlUx5P8ZBJnSFHtJVVmYVmFoqm6LhqupVONU2K1Zyl132UKhXkVr0jz6rqZVEuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCUgMh3+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751367980; x=1782903980;
  h=date:from:to:cc:subject:message-id;
  bh=KRpfEuO2Tw38mNRrq+q12z+0o0Oofv/8Qe13+/mLdDQ=;
  b=LCUgMh3+pTGUMPaa7OiQnX8Ub8kzQ2syc4/tmcuaJ/ixEPh3Svx5/fBq
   6/VXSnz2Ir4M4HJ8qHG3MreFtSJjSglbBaKcXp1KOuOsPx0/fOt0/1dUx
   oErXxH6IgXdLzuJVNkAL8REbWd869s4E61F6zNnkJZVAqVNev+HIAQ4Av
   REIN4+BcgQ0URPOVFvy8zfmBTlSctsn5N6Zmuq6G/I7pwr6Iy9ynx3NjR
   p3snZjC/YoJ/PvKFifokvgTphHOnsKFXsHJzbJf38j+G7NQrBnogvxdpL
   vZcVBQDrwufNPtJGGKA5oy1zmqCXRjKcTd6JvJYfYey96w1iSVVGLlpzF
   g==;
X-CSE-ConnectionGUID: 4y6ZbYCfRqSvZC6gr8ktTg==
X-CSE-MsgGUID: a16QihDDSJ2gT9wZgc7pmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53490170"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53490170"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 04:06:19 -0700
X-CSE-ConnectionGUID: zVKwvfzzQK2OV3ysNljzWw==
X-CSE-MsgGUID: mJOPpPcaTCWhmQxQ7sQ1vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153213116"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Jul 2025 04:06:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWYoZ-000a38-1r;
	Tue, 01 Jul 2025 11:06:15 +0000
Date: Tue, 01 Jul 2025 19:05:17 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS WITH WARNING
 35392e855abf7d02ad3b061cbc75c7c7c37f0577
Message-ID: <202507011945.4wmnhcSq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 35392e855abf7d02ad3b061cbc75c7c7c37f0577  media: i2c: max96714: Drop check on number of active routes

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202506181950.r9PRdV59-lkp@intel.com

    drivers/media/platform/renesas/vsp1/vsp1_vspx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- alpha-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- alpha-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-003-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-004-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-sama5_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-003-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-004-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-003-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-004-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-005-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-006-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-randconfig-141-20250701
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-amcore_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-m5275evb_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- mips-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- mips-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- mips-eyeq6_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- openrisc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- openrisc-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc64-alldefconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-currituck_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-motionpro_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-mpc8313_rdb_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-randconfig-003-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc64-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc64-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc64-randconfig-003-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-apsh4a3a_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-ecovec24_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-espt_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-rsk7201_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-secureedge5410_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-sh7724_generic_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-sh7757lcr_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc64-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc64-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc64-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-i386_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-x86_64_defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-002-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-003-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-004-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-005-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-006-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-randconfig-161-20250701
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-rhel-9.4-rust
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- xtensa-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- xtensa-randconfig-001-20250630
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
`-- xtensa-randconfig-002-20250630
    `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing

elapsed time: 1463m

configs tested: 128
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250630    gcc-10.5.0
arc                   randconfig-002-20250630    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-21
arm                   randconfig-001-20250630    clang-21
arm                   randconfig-002-20250630    gcc-12.4.0
arm                   randconfig-003-20250630    gcc-14.3.0
arm                   randconfig-004-20250630    clang-21
arm                           sama5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250630    gcc-9.5.0
arm64                 randconfig-002-20250630    gcc-14.3.0
arm64                 randconfig-003-20250630    clang-21
arm64                 randconfig-004-20250630    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250630    gcc-15.1.0
csky                  randconfig-002-20250630    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250630    clang-16
hexagon               randconfig-002-20250630    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250630    clang-20
i386        buildonly-randconfig-002-20250630    gcc-12
i386        buildonly-randconfig-003-20250630    clang-20
i386        buildonly-randconfig-004-20250630    gcc-12
i386        buildonly-randconfig-005-20250630    gcc-12
i386        buildonly-randconfig-006-20250630    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250630    gcc-15.1.0
loongarch             randconfig-002-20250630    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                       m5275evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250630    gcc-14.2.0
nios2                 randconfig-002-20250630    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250630    gcc-8.5.0
parisc                randconfig-002-20250630    gcc-8.5.0
parisc64                         alldefconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   currituck_defconfig    clang-21
powerpc                   motionpro_defconfig    clang-21
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250630    clang-18
powerpc               randconfig-002-20250630    clang-21
powerpc               randconfig-003-20250630    gcc-13.3.0
powerpc64             randconfig-001-20250630    gcc-10.5.0
powerpc64             randconfig-002-20250630    gcc-14.3.0
powerpc64             randconfig-003-20250630    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250630    gcc-8.5.0
riscv                 randconfig-002-20250630    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250630    gcc-8.5.0
s390                  randconfig-002-20250630    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20250630    gcc-15.1.0
sh                    randconfig-002-20250630    gcc-15.1.0
sh                          rsk7201_defconfig    gcc-15.1.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250630    gcc-8.5.0
sparc                 randconfig-002-20250630    gcc-8.5.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250630    gcc-8.5.0
sparc64               randconfig-002-20250630    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250630    clang-21
um                    randconfig-002-20250630    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250630    gcc-12
x86_64      buildonly-randconfig-002-20250630    clang-20
x86_64      buildonly-randconfig-003-20250630    clang-20
x86_64      buildonly-randconfig-004-20250630    clang-20
x86_64      buildonly-randconfig-005-20250630    gcc-12
x86_64      buildonly-randconfig-006-20250630    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250630    gcc-13.3.0
xtensa                randconfig-002-20250630    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


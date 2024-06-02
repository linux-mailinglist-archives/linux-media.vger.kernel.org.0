Return-Path: <linux-media+bounces-12385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9277C8D73F2
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 07:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B14761C209EF
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 05:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523F9134BC;
	Sun,  2 Jun 2024 05:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbO9A1Aj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC9218026
	for <linux-media@vger.kernel.org>; Sun,  2 Jun 2024 05:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717307684; cv=none; b=ss7v59YaRZ4U9KiOC9lOVfwmu5/9/DYTFsqueLW0S725ZyjQViCkstJ6eaZgY7zEjEw7NAYW4+M9a7NQIx3wl93QX0Q9qKIPDvd9j1zhV3QmlG225sUWWu23h3F4hPeJK/5/p5JEniwBAOii2Dr1mjvqomvhcb/ooK2nVFPtoUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717307684; c=relaxed/simple;
	bh=37CQPOgVbZdW4LY8kk55Qcca0EthR5JhMuwxwaa0uag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H18EYQ8Ey4+AhF0frgAlEC2AP4EHaRQ/3rOD6I0uAM3wfxDI/ZRID6VGCdP7n64ECdoDDzulU5Nm34Sozm/LxY2gWibwcdVkJXZbgvO//XoEPHA0GmxUdiZU3/IB/nItWFz2xHwhv2LCrQtq9g0xWej1HqYsMOuL7+SPikg7A8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbO9A1Aj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717307682; x=1748843682;
  h=date:from:to:cc:subject:message-id;
  bh=37CQPOgVbZdW4LY8kk55Qcca0EthR5JhMuwxwaa0uag=;
  b=HbO9A1Aj+vBzh0sgbj2HBolAU6qvYLo/VO73SzEDa13GsCsq/0+qpVds
   yD8M0KXy1jRU14zxWfwcX+8mR6i1lZWuXe6gqbLESnSTk+LjFBz1Q8Gfj
   lUyP2pzQ2FVoKksFhXN3oyYcIe/HsOFazG3QGRppvOGHnF9WnDoe5d06D
   BtAcfF2A2ko4ytHTE0FiixyaOmFWe7Fd1I+VQZmGnlUFLehjO2tTFXvUC
   FVbdOlZ4rwFHdbhxq5JUtVym5O5o+NDtFz6LvrcT4fh/Kp+BGWkJa0zhM
   MCX+0q7jgfaezEOO9VIfd22C+HrJm0m1LCTHZdRrlO+S1aPb+98bnxmvq
   g==;
X-CSE-ConnectionGUID: 8oT1bOYCRW+SZ9IfhbmYMA==
X-CSE-MsgGUID: DtG+SC3hQWWjugzktl8Rvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="14041190"
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="14041190"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 22:54:42 -0700
X-CSE-ConnectionGUID: +d3C1hL7R4umWIC87i5XTQ==
X-CSE-MsgGUID: fWaDcnTvRj+U366s1v6YPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="37191415"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2024 22:54:40 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDeAv-000Jn5-2H;
	Sun, 02 Jun 2024 05:54:37 +0000
Date: Sun, 02 Jun 2024 13:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:test] BUILD REGRESSION
 94e408a1547ef00f59477a072c6f943d62d7a097
Message-ID: <202406021332.aURBE5ml-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git test
branch HEAD: 94e408a1547ef00f59477a072c6f943d62d7a097  drivers: media: max96717: stop the csi receiver before the source

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202406011928.HPsUpFHI-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202406011955.oq2igodk-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202406012008.jtWUB0XV-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202406012053.0Av3nXna-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/media/i2c/max96714.c:675:16: error: too many arguments to function 'i2c_mux_add_adapter'
drivers/media/i2c/max96714.c:675:46: error: too many arguments to function call, expected 3, have 4
drivers/media/i2c/max96717.c:124:16: error: too many arguments to function 'i2c_mux_add_adapter'
drivers/media/i2c/max96717.c:124:46: error: too many arguments to function call, expected 3, have 4

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- arc-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- arc-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- arm-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- arm-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- csky-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- csky-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- i386-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- i386-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- loongarch-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- m68k-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- m68k-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- microblaze-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- microblaze-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- mips-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- nios2-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- nios2-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- openrisc-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- parisc-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- parisc-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- powerpc-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- s390-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- sh-allmodconfig
|   `-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- sh-allyesconfig
|   `-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- sparc-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- sparc64-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- sparc64-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|-- um-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
`-- xtensa-allyesconfig
    |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
    `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-i2c_mux_add_adapter
clang_recent_errors
|-- arm64-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-call-expected-have
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-call-expected-have
|-- hexagon-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-call-expected-have
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-call-expected-have
|-- hexagon-allyesconfig
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-call-expected-have
|-- powerpc-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-call-expected-have
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-call-expected-have
|-- riscv-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-call-expected-have
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-call-expected-have
|-- riscv-allyesconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-call-expected-have
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-call-expected-have
|-- s390-allmodconfig
|   |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-call-expected-have
|   `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-call-expected-have
`-- x86_64-allyesconfig
    |-- drivers-media-i2c-max96714.c:error:too-many-arguments-to-function-call-expected-have
    `-- drivers-media-i2c-max96717.c:error:too-many-arguments-to-function-call-expected-have

elapsed time: 1242m

configs tested: 222
configs skipped: 5

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240601   gcc  
arc                   randconfig-001-20240602   gcc  
arc                   randconfig-002-20240601   gcc  
arc                   randconfig-002-20240602   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                      integrator_defconfig   clang
arm                       multi_v4t_defconfig   clang
arm                         mv78xx0_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240601   clang
arm                   randconfig-002-20240601   clang
arm                   randconfig-003-20240601   gcc  
arm                   randconfig-003-20240602   gcc  
arm                   randconfig-004-20240601   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240601   gcc  
arm64                 randconfig-002-20240601   clang
arm64                 randconfig-002-20240602   gcc  
arm64                 randconfig-003-20240601   clang
arm64                 randconfig-004-20240601   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240601   gcc  
csky                  randconfig-001-20240602   gcc  
csky                  randconfig-002-20240601   gcc  
csky                  randconfig-002-20240602   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240601   clang
hexagon               randconfig-002-20240601   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240601   clang
i386         buildonly-randconfig-002-20240601   gcc  
i386         buildonly-randconfig-002-20240602   gcc  
i386         buildonly-randconfig-003-20240601   gcc  
i386         buildonly-randconfig-004-20240601   gcc  
i386         buildonly-randconfig-005-20240601   gcc  
i386         buildonly-randconfig-006-20240601   clang
i386                                defconfig   clang
i386                  randconfig-001-20240601   clang
i386                  randconfig-002-20240601   gcc  
i386                  randconfig-003-20240601   clang
i386                  randconfig-004-20240601   gcc  
i386                  randconfig-004-20240602   gcc  
i386                  randconfig-005-20240601   clang
i386                  randconfig-006-20240601   gcc  
i386                  randconfig-011-20240601   gcc  
i386                  randconfig-012-20240601   gcc  
i386                  randconfig-013-20240601   gcc  
i386                  randconfig-014-20240601   gcc  
i386                  randconfig-014-20240602   gcc  
i386                  randconfig-015-20240601   clang
i386                  randconfig-015-20240602   gcc  
i386                  randconfig-016-20240601   clang
i386                  randconfig-016-20240602   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240601   gcc  
loongarch             randconfig-001-20240602   gcc  
loongarch             randconfig-002-20240601   gcc  
loongarch             randconfig-002-20240602   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                       lemote2f_defconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240601   gcc  
nios2                 randconfig-001-20240602   gcc  
nios2                 randconfig-002-20240601   gcc  
nios2                 randconfig-002-20240602   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240601   gcc  
parisc                randconfig-001-20240602   gcc  
parisc                randconfig-002-20240601   gcc  
parisc                randconfig-002-20240602   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      katmai_defconfig   clang
powerpc               randconfig-001-20240601   gcc  
powerpc               randconfig-002-20240601   gcc  
powerpc               randconfig-002-20240602   gcc  
powerpc               randconfig-003-20240601   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240601   clang
powerpc64             randconfig-002-20240601   clang
powerpc64             randconfig-002-20240602   gcc  
powerpc64             randconfig-003-20240601   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240601   clang
riscv                 randconfig-002-20240601   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240601   gcc  
s390                  randconfig-001-20240602   gcc  
s390                  randconfig-002-20240601   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240601   gcc  
sh                    randconfig-001-20240602   gcc  
sh                    randconfig-002-20240601   gcc  
sh                    randconfig-002-20240602   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240601   gcc  
sparc64               randconfig-001-20240602   gcc  
sparc64               randconfig-002-20240601   gcc  
sparc64               randconfig-002-20240602   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240601   gcc  
um                    randconfig-001-20240602   gcc  
um                    randconfig-002-20240601   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240601   clang
x86_64       buildonly-randconfig-002-20240601   clang
x86_64       buildonly-randconfig-002-20240602   clang
x86_64       buildonly-randconfig-003-20240601   gcc  
x86_64       buildonly-randconfig-003-20240602   clang
x86_64       buildonly-randconfig-004-20240601   gcc  
x86_64       buildonly-randconfig-005-20240601   clang
x86_64       buildonly-randconfig-005-20240602   clang
x86_64       buildonly-randconfig-006-20240601   gcc  
x86_64       buildonly-randconfig-006-20240602   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240601   gcc  
x86_64                randconfig-002-20240601   clang
x86_64                randconfig-002-20240602   clang
x86_64                randconfig-003-20240601   clang
x86_64                randconfig-003-20240602   clang
x86_64                randconfig-004-20240601   clang
x86_64                randconfig-005-20240601   gcc  
x86_64                randconfig-005-20240602   clang
x86_64                randconfig-006-20240601   clang
x86_64                randconfig-006-20240602   clang
x86_64                randconfig-011-20240601   clang
x86_64                randconfig-012-20240601   clang
x86_64                randconfig-012-20240602   clang
x86_64                randconfig-013-20240601   clang
x86_64                randconfig-013-20240602   clang
x86_64                randconfig-014-20240601   gcc  
x86_64                randconfig-015-20240601   gcc  
x86_64                randconfig-015-20240602   clang
x86_64                randconfig-016-20240601   gcc  
x86_64                randconfig-071-20240601   clang
x86_64                randconfig-072-20240601   gcc  
x86_64                randconfig-072-20240602   clang
x86_64                randconfig-073-20240601   clang
x86_64                randconfig-074-20240601   gcc  
x86_64                randconfig-074-20240602   clang
x86_64                randconfig-075-20240601   clang
x86_64                randconfig-075-20240602   clang
x86_64                randconfig-076-20240601   gcc  
x86_64                randconfig-076-20240602   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240601   gcc  
xtensa                randconfig-001-20240602   gcc  
xtensa                randconfig-002-20240601   gcc  
xtensa                randconfig-002-20240602   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


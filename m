Return-Path: <linux-media+bounces-43706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD0BB5E44
	for <lists+linux-media@lfdr.de>; Fri, 03 Oct 2025 06:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AFE724E3314
	for <lists+linux-media@lfdr.de>; Fri,  3 Oct 2025 04:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F2B1D799D;
	Fri,  3 Oct 2025 04:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnBPYdzf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F4213A3ED
	for <linux-media@vger.kernel.org>; Fri,  3 Oct 2025 04:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759465170; cv=none; b=iANGd3UUIZ6Zz6gPWkDZXMXuK51/xFdpDRD4D2IQ7za2K4hm4hxZM2kVAfF7D9CWXW2XFrXT9yMxhGf1nFm0Ni0PQd63sBW1Z98Iwgk1gjb7o78QBSuhUQ3FlQjMW0HI7ZInyDGTKgE4TKl178kCXkelbP/7bthzSVucNHv9E5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759465170; c=relaxed/simple;
	bh=bgXcuu19A480X0mDBbQEPqfCiOKy3Ifdr8M3r1GjReg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bzg+H0ppbRtYMeja+gaR5pR/BYSEOOShTM8qI8raTI/IUcb8dTw/Hc2tOR195FiK78ZOAs56geLB0yYplGt0nlKqZJVzwkWwLndBRx0amN37RX6Ik9nPK64fPsibsMi/qp6jA75xxqeX+nUIDxHZmxoF326KBc+j/O6x5Dwvzfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnBPYdzf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759465168; x=1791001168;
  h=date:from:to:cc:subject:message-id;
  bh=bgXcuu19A480X0mDBbQEPqfCiOKy3Ifdr8M3r1GjReg=;
  b=LnBPYdzfxxyLrYVqVtUuDYWT6gZLuWPyWwMrq50usXJ+Brkv0R06vkBw
   r8JqSTq4jU3spzrs3exrrMyixs/0vl6j9bXKhysYHUKZfQHvL2mD3fpOG
   Zt1Rl6QVQ8LbmHpeci8CQ1LJsAKmNMaQ9nw4jHh4dqxHWXxqh7l9VtAty
   RSVT5Kl6RUKS2E0HBp9XpVyl8kIN2YJ0jeVid9VyO6zCiQNo2X/5OaZC8
   O7IeI9vKjcIeS2bseBU/KJZeUO0NdCqx6V41IJMu4+lWy5QBnPuabdbPi
   7cl9wfkFcrwC15+Z0NFvZEZJfNiq/5Ia/dZFs3m3HJ2IGlQhylisVfU89
   g==;
X-CSE-ConnectionGUID: HXSBkhQDS1uRFM09SXAn1w==
X-CSE-MsgGUID: njjqqRi8ST+zAkqFSd7H+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="49305526"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="49305526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 21:19:26 -0700
X-CSE-ConnectionGUID: am4FztM1Sa2NUSMNgGVNsQ==
X-CSE-MsgGUID: ji4yFBHyQRCslW+uUTNuJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="216326442"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Oct 2025 21:19:25 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4XGM-0004Ih-0k;
	Fri, 03 Oct 2025 04:19:22 +0000
Date: Fri, 03 Oct 2025 12:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:container-of] BUILD SUCCESS
 e7d9d7690bdf60c1c0c4eb71d4522be887781396
Message-ID: <202510031213.rIr0PFXZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git container-of
branch HEAD: e7d9d7690bdf60c1c0c4eb71d4522be887781396  media: mc: Make macros to obtain containers const-aware

elapsed time: 1060m

configs tested: 237
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20251002    gcc-12.5.0
arc                   randconfig-001-20251003    gcc-12.5.0
arc                   randconfig-002-20251002    gcc-12.5.0
arc                   randconfig-002-20251003    gcc-12.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                   randconfig-001-20251002    gcc-12.5.0
arm                   randconfig-001-20251003    gcc-12.5.0
arm                   randconfig-002-20251002    clang-22
arm                   randconfig-002-20251003    gcc-12.5.0
arm                   randconfig-003-20251002    clang-22
arm                   randconfig-003-20251003    gcc-12.5.0
arm                   randconfig-004-20251002    clang-20
arm                   randconfig-004-20251003    gcc-12.5.0
arm                        spear6xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251002    gcc-8.5.0
arm64                 randconfig-001-20251003    gcc-12.5.0
arm64                 randconfig-002-20251002    clang-22
arm64                 randconfig-002-20251003    gcc-12.5.0
arm64                 randconfig-003-20251002    clang-22
arm64                 randconfig-003-20251003    gcc-12.5.0
arm64                 randconfig-004-20251002    clang-22
arm64                 randconfig-004-20251003    gcc-12.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251002    gcc-15.1.0
csky                  randconfig-001-20251003    clang-22
csky                  randconfig-002-20251002    gcc-9.5.0
csky                  randconfig-002-20251003    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251002    clang-22
hexagon               randconfig-001-20251003    clang-22
hexagon               randconfig-002-20251002    clang-16
hexagon               randconfig-002-20251003    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251002    clang-20
i386        buildonly-randconfig-001-20251003    gcc-14
i386        buildonly-randconfig-002-20251002    gcc-14
i386        buildonly-randconfig-002-20251003    gcc-14
i386        buildonly-randconfig-003-20251002    clang-20
i386        buildonly-randconfig-003-20251003    gcc-14
i386        buildonly-randconfig-004-20251002    clang-20
i386        buildonly-randconfig-004-20251003    gcc-14
i386        buildonly-randconfig-005-20251002    gcc-14
i386        buildonly-randconfig-005-20251003    gcc-14
i386        buildonly-randconfig-006-20251002    clang-20
i386        buildonly-randconfig-006-20251003    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251003    clang-20
i386                  randconfig-002-20251003    clang-20
i386                  randconfig-003-20251003    clang-20
i386                  randconfig-004-20251003    clang-20
i386                  randconfig-005-20251003    clang-20
i386                  randconfig-006-20251003    clang-20
i386                  randconfig-007-20251003    clang-20
i386                  randconfig-011-20251003    gcc-14
i386                  randconfig-012-20251003    gcc-14
i386                  randconfig-013-20251003    gcc-14
i386                  randconfig-014-20251003    gcc-14
i386                  randconfig-015-20251003    gcc-14
i386                  randconfig-016-20251003    gcc-14
i386                  randconfig-017-20251003    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251002    gcc-15.1.0
loongarch             randconfig-001-20251003    clang-22
loongarch             randconfig-002-20251002    clang-18
loongarch             randconfig-002-20251003    clang-22
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           xway_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251002    gcc-11.5.0
nios2                 randconfig-001-20251003    clang-22
nios2                 randconfig-002-20251002    gcc-10.5.0
nios2                 randconfig-002-20251003    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251002    gcc-9.5.0
parisc                randconfig-001-20251003    clang-22
parisc                randconfig-002-20251002    gcc-8.5.0
parisc                randconfig-002-20251003    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20251002    gcc-8.5.0
powerpc               randconfig-001-20251003    clang-22
powerpc               randconfig-002-20251002    gcc-9.5.0
powerpc               randconfig-002-20251003    clang-22
powerpc               randconfig-003-20251002    clang-22
powerpc               randconfig-003-20251003    clang-22
powerpc                     redwood_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251002    clang-22
powerpc64             randconfig-001-20251003    clang-22
powerpc64             randconfig-002-20251002    clang-22
powerpc64             randconfig-002-20251003    clang-22
powerpc64             randconfig-003-20251002    clang-22
powerpc64             randconfig-003-20251003    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20251002    clang-22
riscv                 randconfig-001-20251003    clang-20
riscv                 randconfig-002-20251002    clang-22
riscv                 randconfig-002-20251003    clang-20
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251002    gcc-14.3.0
s390                  randconfig-001-20251003    clang-20
s390                  randconfig-002-20251002    gcc-11.5.0
s390                  randconfig-002-20251003    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251002    gcc-13.4.0
sh                    randconfig-001-20251003    clang-20
sh                    randconfig-002-20251002    gcc-15.1.0
sh                    randconfig-002-20251003    clang-20
sh                          sdk7780_defconfig    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sh                        sh7785lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251002    gcc-8.5.0
sparc                 randconfig-001-20251003    clang-20
sparc                 randconfig-002-20251002    gcc-15.1.0
sparc                 randconfig-002-20251003    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251002    clang-22
sparc64               randconfig-001-20251003    clang-20
sparc64               randconfig-002-20251002    gcc-8.5.0
sparc64               randconfig-002-20251003    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251002    clang-22
um                    randconfig-001-20251003    clang-20
um                    randconfig-002-20251002    clang-22
um                    randconfig-002-20251003    clang-20
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251002    gcc-13
x86_64      buildonly-randconfig-001-20251003    clang-20
x86_64      buildonly-randconfig-002-20251002    clang-20
x86_64      buildonly-randconfig-002-20251003    clang-20
x86_64      buildonly-randconfig-003-20251002    clang-20
x86_64      buildonly-randconfig-003-20251003    clang-20
x86_64      buildonly-randconfig-004-20251002    clang-20
x86_64      buildonly-randconfig-004-20251003    clang-20
x86_64      buildonly-randconfig-005-20251002    gcc-14
x86_64      buildonly-randconfig-005-20251003    clang-20
x86_64      buildonly-randconfig-006-20251002    gcc-14
x86_64      buildonly-randconfig-006-20251003    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251003    gcc-14
x86_64                randconfig-002-20251003    gcc-14
x86_64                randconfig-003-20251003    gcc-14
x86_64                randconfig-004-20251003    gcc-14
x86_64                randconfig-005-20251003    gcc-14
x86_64                randconfig-006-20251003    gcc-14
x86_64                randconfig-007-20251003    gcc-14
x86_64                randconfig-008-20251003    gcc-14
x86_64                randconfig-071-20251003    gcc-14
x86_64                randconfig-072-20251003    gcc-14
x86_64                randconfig-073-20251003    gcc-14
x86_64                randconfig-074-20251003    gcc-14
x86_64                randconfig-075-20251003    gcc-14
x86_64                randconfig-076-20251003    gcc-14
x86_64                randconfig-077-20251003    gcc-14
x86_64                randconfig-078-20251003    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251002    gcc-8.5.0
xtensa                randconfig-001-20251003    clang-20
xtensa                randconfig-002-20251002    gcc-12.5.0
xtensa                randconfig-002-20251003    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


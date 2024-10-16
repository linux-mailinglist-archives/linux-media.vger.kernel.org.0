Return-Path: <linux-media+bounces-19722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA1D9A030C
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 09:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCF93B26462
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 07:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2131C6F6D;
	Wed, 16 Oct 2024 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpPrsjly"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391B918B478
	for <linux-media@vger.kernel.org>; Wed, 16 Oct 2024 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729065009; cv=none; b=V0lagiF9kCPb+8e4xEnQ2ZX+RnSWBkVTRcMRQVKt505Ymkze6wNpL4Np0oZiQa5XUUOzWeEKd+f2N9CLC5Anpg6xeiDTmCPfLGCf0AMDhFF6UYT8rDp5FmKzOKsvxqSEsePGIYtuwQ7AC0g1Db6pjXOhzpSFi/BXb30NNxJVmZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729065009; c=relaxed/simple;
	bh=rN84+l42OwUixUC3w/wW+u4+oe9Qo/0B67hx8CJMO4E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=id6ZtqAUcDmcvPTjGmfrX5WmDJQqoZ1yBXuL9CrtljQFmueuW/DpnLv05tIg1iqXu4rEfdaA95HZIQzZckn14UQ/q68tbyPbnRhB7fF8UR2C0oocUlWRwsLBwvQDjgcQdsdeknAnI1Dnt+nLE5hDHbYa4ZiIGRcIeacBgGNov2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpPrsjly; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729065007; x=1760601007;
  h=date:from:to:cc:subject:message-id;
  bh=rN84+l42OwUixUC3w/wW+u4+oe9Qo/0B67hx8CJMO4E=;
  b=OpPrsjlyGZYc4h+xjOoyLp5G3bywPblkMas53oXFq9YY9JVzgwfLth1k
   HBcpjhaDuiTVSkcJB0+KAfOki/1lBt7TGl+jDVZidcTNbYOnsSj6iw3Ws
   exuY36FqacrZeqC7gg9Hu64FkMbdTYWm96ptUAkpUTgc9IxiIMYYb8iFu
   7Pfi/3FjVpeueLEiHbAVS/Ny1ntnr3NOlRDdwaHKkfIqcEP0MHZ1WfqY5
   9uQvjVA+pt9eZYcUCFUwSpysBtgKAjvBBqRyZIZtlr1ANfcvHCRkGkDvM
   98Eje0QT2a3vw7fyfL4Qk7VSTiuw3b+9bQoW2IE2qB34VxQCN0yRjP5Hb
   Q==;
X-CSE-ConnectionGUID: x2HBFCRSSkeUG2CANAkR/A==
X-CSE-MsgGUID: F/bHSr+iS1WNZGxqtNhp1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28697140"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="28697140"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 00:50:06 -0700
X-CSE-ConnectionGUID: lqxDarP2TlCpZT+T52Nm/A==
X-CSE-MsgGUID: 443xjcd8SPm2qiRwS42hpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="82117489"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Oct 2024 00:50:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0ynD-000KXr-14;
	Wed, 16 Oct 2024 07:50:03 +0000
Date: Wed, 16 Oct 2024 15:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:fixes] BUILD SUCCESS
 fa88dc7db176c79b50adb132a56120a1d4d9d18b
Message-ID: <202410161511.cxM5D2Pi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git fixes
branch HEAD: fa88dc7db176c79b50adb132a56120a1d4d9d18b  media: dvb-core: add missing buffer index check

elapsed time: 1584m

configs tested: 167
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-13.2.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                               allnoconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241016    clang-20
arc                   randconfig-002-20241016    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                         at91_dt_defconfig    gcc-13.2.0
arm                                 defconfig    gcc-14.1.0
arm                   milbeaut_m10v_defconfig    gcc-13.2.0
arm                          pxa910_defconfig    gcc-13.2.0
arm                   randconfig-001-20241016    clang-20
arm                   randconfig-002-20241016    clang-20
arm                   randconfig-003-20241016    clang-20
arm                   randconfig-004-20241016    clang-20
arm                         s3c6400_defconfig    gcc-13.2.0
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241016    clang-20
arm64                 randconfig-002-20241016    clang-20
arm64                 randconfig-003-20241016    clang-20
arm64                 randconfig-004-20241016    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241016    clang-20
csky                  randconfig-002-20241016    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241016    clang-20
hexagon               randconfig-002-20241016    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241016    gcc-11
i386        buildonly-randconfig-002-20241016    gcc-11
i386        buildonly-randconfig-003-20241016    gcc-11
i386        buildonly-randconfig-004-20241016    gcc-11
i386        buildonly-randconfig-005-20241016    gcc-11
i386        buildonly-randconfig-006-20241016    gcc-11
i386                                defconfig    clang-18
i386                  randconfig-001-20241016    gcc-11
i386                  randconfig-002-20241016    gcc-11
i386                  randconfig-003-20241016    gcc-11
i386                  randconfig-004-20241016    gcc-11
i386                  randconfig-005-20241016    gcc-11
i386                  randconfig-006-20241016    gcc-11
i386                  randconfig-011-20241016    gcc-11
i386                  randconfig-012-20241016    gcc-11
i386                  randconfig-013-20241016    gcc-11
i386                  randconfig-014-20241016    gcc-11
i386                  randconfig-015-20241016    gcc-11
i386                  randconfig-016-20241016    gcc-11
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241016    clang-20
loongarch             randconfig-002-20241016    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          eyeq5_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241016    clang-20
nios2                 randconfig-002-20241016    clang-20
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241016    clang-20
parisc                randconfig-002-20241016    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                    amigaone_defconfig    gcc-13.2.0
powerpc                      chrp32_defconfig    gcc-13.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-13.2.0
powerpc                      pcm030_defconfig    gcc-13.2.0
powerpc               randconfig-001-20241016    clang-20
powerpc               randconfig-002-20241016    clang-20
powerpc               randconfig-003-20241016    clang-20
powerpc                  storcenter_defconfig    gcc-13.2.0
powerpc64             randconfig-001-20241016    clang-20
powerpc64             randconfig-002-20241016    clang-20
powerpc64             randconfig-003-20241016    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241016    clang-20
riscv                 randconfig-002-20241016    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241016    clang-20
s390                  randconfig-002-20241016    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-13.2.0
sh                        edosk7760_defconfig    gcc-13.2.0
sh                    randconfig-001-20241016    clang-20
sh                    randconfig-002-20241016    clang-20
sh                          sdk7780_defconfig    gcc-13.2.0
sh                   sh7770_generic_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc32_defconfig    gcc-13.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241016    clang-20
sparc64               randconfig-002-20241016    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241016    clang-20
um                    randconfig-002-20241016    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241016    gcc-12
x86_64      buildonly-randconfig-002-20241016    gcc-12
x86_64      buildonly-randconfig-003-20241016    gcc-12
x86_64      buildonly-randconfig-004-20241016    gcc-12
x86_64      buildonly-randconfig-005-20241016    gcc-12
x86_64      buildonly-randconfig-006-20241016    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241016    gcc-12
x86_64                randconfig-002-20241016    gcc-12
x86_64                randconfig-003-20241016    gcc-12
x86_64                randconfig-004-20241016    gcc-12
x86_64                randconfig-005-20241016    gcc-12
x86_64                randconfig-006-20241016    gcc-12
x86_64                randconfig-011-20241016    gcc-12
x86_64                randconfig-012-20241016    gcc-12
x86_64                randconfig-013-20241016    gcc-12
x86_64                randconfig-014-20241016    gcc-12
x86_64                randconfig-015-20241016    gcc-12
x86_64                randconfig-016-20241016    gcc-12
x86_64                randconfig-071-20241016    gcc-12
x86_64                randconfig-072-20241016    gcc-12
x86_64                randconfig-073-20241016    gcc-12
x86_64                randconfig-074-20241016    gcc-12
x86_64                randconfig-075-20241016    gcc-12
x86_64                randconfig-076-20241016    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241016    clang-20
xtensa                randconfig-002-20241016    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


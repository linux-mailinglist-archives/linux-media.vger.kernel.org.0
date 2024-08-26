Return-Path: <linux-media+bounces-16741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A9695E60F
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 02:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EEE42811F3
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 00:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5B210F7;
	Mon, 26 Aug 2024 00:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHoUem6B"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECFE3D66
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 00:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724632439; cv=none; b=LJPdI6KVyQ+ysypNAjWFuqs9qizfBybJnDrYQZFdK3cGMpDO/aKiutpKvKgrJMrUqwTPFA+BAYoQYVJhTnh0Yi6mb0DyN2hqxbS1l2urSexZh77qS43xRQtye5k+Vx+Hq/vk1d2Zc/5cfdznHnjO1igKwLD5YfAyRL16orxR1Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724632439; c=relaxed/simple;
	bh=NR0iCGRGL+EvMJQ34XuXVKDKefBQkm/kUe8P58j9ZfE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QYM3WRdIR1OlICxvR8CyfcDeo2B0dYACrQJuo5d206XThRgO33MRZe+ZO3M1qss/HgNKLSxoMJHRZIjkZCXctwtlJ6Vqg58XXKMQJKHElI7or+/j+2qAsjVEhai331NeAkA3NWWC+v+YattaxGCJFjTVDCKUJqGnqkVtvk1RWvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHoUem6B; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724632437; x=1756168437;
  h=date:from:to:cc:subject:message-id;
  bh=NR0iCGRGL+EvMJQ34XuXVKDKefBQkm/kUe8P58j9ZfE=;
  b=hHoUem6BXYA6NBzV9L1T5XmUt+kw/F1sZYH3cP2DX4JeJii3VvN3psNb
   KUPb7J8YlYaatYfSAvoyGShYfJERt96Zo/cgh1BaWswZWoAK8Z6mc22q9
   rn2b6g6am71Jx2PU9PElOg+KeO22kWuyFd9xUQQlZ2wVdt/CdX9sNfqut
   2aVN62q6Hmw3jOiww/FKIG1lk2sHYK4tjZvSrWVuOP3p4PuNHhHw10rgP
   QwUM+j/zwOR9ceIYLmGZbMzPfcDzpDEJh5w5HMWzvxvPHK26q2LEJWhkF
   BKXSW4jO/l+1TxIpkFW8KOKhWJ/s2nAc8rfEW6Z2OiKuI5Lyr30dc1X3d
   Q==;
X-CSE-ConnectionGUID: 9/tkT22pRTWZDgfnk/NHjg==
X-CSE-MsgGUID: XNXDliFjRjaQjz9UpNnQSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="23202517"
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; 
   d="scan'208";a="23202517"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 17:33:56 -0700
X-CSE-ConnectionGUID: EXeP2vkuQqq+qKoJ1+Sx4w==
X-CSE-MsgGUID: ScZV5dYEQqyRz5ZWTRzaQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; 
   d="scan'208";a="62313987"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Aug 2024 17:33:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siNg9-000FWB-1M;
	Mon, 26 Aug 2024 00:33:53 +0000
Date: Mon, 26 Aug 2024 08:33:22 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 ea2e2ea551abf0ce8350f82e8cd431b7f8a1e5e9
Message-ID: <202408260819.6kxUJ402-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: ea2e2ea551abf0ce8350f82e8cd431b7f8a1e5e9  media: dt-bindings: qcom,sc7280-venus: Allow one IOMMU entry

elapsed time: 1017m

configs tested: 211
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsimosci_defconfig   gcc-12.3.0
arc                   randconfig-001-20240825   gcc-13.2.0
arc                   randconfig-002-20240825   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                          ixp4xx_defconfig   gcc-12.3.0
arm                       multi_v4t_defconfig   clang-20
arm                        multi_v7_defconfig   gcc-14.1.0
arm                       netwinder_defconfig   gcc-12.3.0
arm                   randconfig-001-20240825   clang-20
arm                   randconfig-002-20240825   gcc-14.1.0
arm                   randconfig-003-20240825   gcc-14.1.0
arm                   randconfig-004-20240825   gcc-14.1.0
arm                           stm32_defconfig   gcc-12.3.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240825   clang-20
arm64                 randconfig-002-20240825   gcc-14.1.0
arm64                 randconfig-003-20240825   clang-20
arm64                 randconfig-004-20240825   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240825   gcc-14.1.0
csky                  randconfig-002-20240825   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240825   clang-20
hexagon               randconfig-002-20240825   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240825   clang-18
i386         buildonly-randconfig-002-20240825   clang-18
i386         buildonly-randconfig-003-20240825   clang-18
i386         buildonly-randconfig-004-20240825   gcc-12
i386         buildonly-randconfig-005-20240825   clang-18
i386         buildonly-randconfig-006-20240825   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240825   gcc-12
i386                  randconfig-002-20240825   gcc-12
i386                  randconfig-003-20240825   gcc-12
i386                  randconfig-004-20240825   gcc-12
i386                  randconfig-005-20240825   clang-18
i386                  randconfig-006-20240825   clang-18
i386                  randconfig-011-20240825   clang-18
i386                  randconfig-012-20240825   gcc-11
i386                  randconfig-013-20240825   clang-18
i386                  randconfig-014-20240825   clang-18
i386                  randconfig-015-20240825   clang-18
i386                  randconfig-016-20240825   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240825   gcc-14.1.0
loongarch             randconfig-002-20240825   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                       bvme6000_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5272c3_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                      bmips_stb_defconfig   gcc-12.3.0
mips                     decstation_defconfig   gcc-13.2.0
mips                          eyeq5_defconfig   gcc-14.1.0
mips                           gcw0_defconfig   clang-20
mips                            gpr_defconfig   clang-20
mips                           ip30_defconfig   gcc-14.1.0
mips                           jazz_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240825   gcc-14.1.0
nios2                 randconfig-002-20240825   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240825   gcc-14.1.0
parisc                randconfig-002-20240825   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                       ebony_defconfig   clang-20
powerpc                 linkstation_defconfig   gcc-12.3.0
powerpc                  mpc866_ads_defconfig   gcc-12.3.0
powerpc                  mpc885_ads_defconfig   gcc-12.3.0
powerpc                      pcm030_defconfig   gcc-12.3.0
powerpc               randconfig-001-20240825   gcc-14.1.0
powerpc               randconfig-002-20240825   gcc-14.1.0
powerpc64             randconfig-001-20240825   gcc-14.1.0
powerpc64             randconfig-003-20240825   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_virt_defconfig   gcc-12.3.0
riscv                 randconfig-001-20240825   gcc-14.1.0
riscv                 randconfig-002-20240825   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240825   clang-20
s390                  randconfig-002-20240825   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                 kfr2r09-romimage_defconfig   gcc-14.1.0
sh                    randconfig-001-20240825   gcc-14.1.0
sh                    randconfig-002-20240825   gcc-14.1.0
sh                          rsk7201_defconfig   gcc-14.1.0
sh                      rts7751r2d1_defconfig   gcc-12.3.0
sh                   rts7751r2dplus_defconfig   gcc-12.3.0
sh                           se7724_defconfig   gcc-12.3.0
sh                             sh03_defconfig   gcc-14.1.0
sh                           sh2007_defconfig   gcc-12.3.0
sh                             shx3_defconfig   gcc-12.3.0
sh                             shx3_defconfig   gcc-14.1.0
sparc                            alldefconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240825   gcc-14.1.0
sparc64               randconfig-002-20240825   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   clang-20
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-12
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240825   gcc-12
um                    randconfig-002-20240825   gcc-12
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                           alldefconfig   gcc-12.3.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240825   gcc-12
x86_64       buildonly-randconfig-002-20240825   gcc-12
x86_64       buildonly-randconfig-003-20240825   gcc-12
x86_64       buildonly-randconfig-004-20240825   clang-18
x86_64       buildonly-randconfig-005-20240825   clang-18
x86_64       buildonly-randconfig-006-20240825   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240825   clang-18
x86_64                randconfig-002-20240825   gcc-12
x86_64                randconfig-003-20240825   clang-18
x86_64                randconfig-004-20240825   clang-18
x86_64                randconfig-005-20240825   clang-18
x86_64                randconfig-006-20240825   gcc-12
x86_64                randconfig-011-20240825   gcc-12
x86_64                randconfig-012-20240825   gcc-12
x86_64                randconfig-013-20240825   clang-18
x86_64                randconfig-014-20240825   gcc-12
x86_64                randconfig-015-20240825   clang-18
x86_64                randconfig-016-20240825   clang-18
x86_64                randconfig-071-20240825   clang-18
x86_64                randconfig-072-20240825   clang-18
x86_64                randconfig-073-20240825   gcc-12
x86_64                randconfig-074-20240825   clang-18
x86_64                randconfig-075-20240825   gcc-12
x86_64                randconfig-076-20240825   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                       common_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240825   gcc-14.1.0
xtensa                randconfig-002-20240825   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


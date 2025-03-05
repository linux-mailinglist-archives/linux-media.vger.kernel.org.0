Return-Path: <linux-media+bounces-27650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81430A5059C
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 17:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81FC6165EBF
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 16:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7453819DF61;
	Wed,  5 Mar 2025 16:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BjIGDvIg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FC5151992
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 16:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741193357; cv=none; b=CCztv91ZISE7RARAYo/SMhnwnqezTTPgkcs/OKpBZmWWTKRv6WWAAHVBKkpq0O+Uz1e5KI/Gl2i3d2KXQB6OOaqJaWDpCw3NmPM1MUURF5ZzBkvx0E/7+nN+PN4QYrvv2Ulkwh/71A4zYG7O3pnxCjy5IgoXAqxy9ZDccRZdrdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741193357; c=relaxed/simple;
	bh=MkASYEdga6iLfw4VllshOumZ+ExmpaIft4d1+lw3rOw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T5k3xN/AW9K+sRvI1EZ17lQLLjaIWoU489lc38TJjD7ek371yIIOU7B+DrXbtijKxEiF63ZZVRvg0gwliRL7jtziUQ8oTKgcxJ5sWu47ZYDJXgw8oIUUgrZUiLw/QmQueMmUMpkDUYvvLBEmLlHlvOp7mTo+8b3tlJHIoMygdXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BjIGDvIg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741193356; x=1772729356;
  h=date:from:to:cc:subject:message-id;
  bh=MkASYEdga6iLfw4VllshOumZ+ExmpaIft4d1+lw3rOw=;
  b=BjIGDvIgxKK7z0NOGRYRx3fRbgP+iQKi6w7UniCzQOhQd//wFmhz+iQQ
   t0t2cfB/OXsbaHxRruAN1IZ/pMhboYZo+eQ9PuZ+ZzIc6giikZA5xaxWk
   IAiiprp4oUalshkTFHAaxOVt+2KRGbWg9xv4hQn5VaDEkkKGrJ7tF/AWe
   mFCHLAN+uyOiRpUU7sfBbA7un8Zu/v/5+dOpCpd0wtkNucDB9I3bOjzEF
   QfI/xUa1ebXf6jheGUeKuVGcUlozWrfobfSt4ERcxaG6vOlWfc51+qqJT
   kVXo0vW8qvpf1Xy97bQzP5mQbu4eF9q/cfEaTkEh1Q5af+2ZgsWc9PTHn
   g==;
X-CSE-ConnectionGUID: mpphqtalTS6s7qgwhUlNTA==
X-CSE-MsgGUID: vP4BmOwuTX2Enco6MiwctQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42297368"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="42297368"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 08:49:12 -0800
X-CSE-ConnectionGUID: TM29sStoSz+bS06lHmi02Q==
X-CSE-MsgGUID: LxOgACJDR3+vP6d1A0ygVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119662956"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2025 08:49:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tprv5-000LFk-0l;
	Wed, 05 Mar 2025 16:48:37 +0000
Date: Thu, 06 Mar 2025 00:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS WITH WARNING
 d84f66b64b763277de4a99cca88cccede13ec914
Message-ID: <202503060046.En438hRy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: d84f66b64b763277de4a99cca88cccede13ec914  media: i2c: ds90ub9xx: Set serializer temperature ramp

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202503050359.6DYrXi6o-lkp@intel.com

    Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/i2c/ov7670.txt

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-allnoconfig
    `-- Warning:MAINTAINERS-references-a-file-that-doesn-t-exist:Documentation-devicetree-bindings-media-i2c-ov7670.txt

elapsed time: 1458m

configs tested: 181
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                         haps_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250305    gcc-13.2.0
arc                   randconfig-001-20250305    gcc-14.2.0
arc                   randconfig-002-20250305    gcc-13.2.0
arc                   randconfig-002-20250305    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                      footbridge_defconfig    gcc-13.2.0
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20250305    gcc-14.2.0
arm                   randconfig-002-20250305    clang-19
arm                   randconfig-002-20250305    gcc-14.2.0
arm                   randconfig-003-20250305    gcc-14.2.0
arm                   randconfig-004-20250305    gcc-14.2.0
arm                        spear3xx_defconfig    gcc-13.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250305    clang-15
arm64                 randconfig-001-20250305    gcc-14.2.0
arm64                 randconfig-002-20250305    gcc-14.2.0
arm64                 randconfig-003-20250305    clang-21
arm64                 randconfig-003-20250305    gcc-14.2.0
arm64                 randconfig-004-20250305    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250305    gcc-14.2.0
csky                  randconfig-002-20250305    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250305    clang-21
hexagon               randconfig-001-20250305    gcc-14.2.0
hexagon               randconfig-002-20250305    clang-18
hexagon               randconfig-002-20250305    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250305    clang-19
i386        buildonly-randconfig-002-20250305    clang-19
i386        buildonly-randconfig-003-20250305    clang-19
i386        buildonly-randconfig-004-20250305    clang-19
i386        buildonly-randconfig-005-20250305    clang-19
i386        buildonly-randconfig-006-20250305    clang-19
i386        buildonly-randconfig-006-20250305    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250305    clang-19
i386                  randconfig-002-20250305    clang-19
i386                  randconfig-003-20250305    clang-19
i386                  randconfig-004-20250305    clang-19
i386                  randconfig-005-20250305    clang-19
i386                  randconfig-006-20250305    clang-19
i386                  randconfig-007-20250305    clang-19
i386                  randconfig-011-20250305    gcc-11
i386                  randconfig-012-20250305    gcc-11
i386                  randconfig-013-20250305    gcc-11
i386                  randconfig-014-20250305    gcc-11
i386                  randconfig-015-20250305    gcc-11
i386                  randconfig-016-20250305    gcc-11
i386                  randconfig-017-20250305    gcc-11
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250305    gcc-14.2.0
loongarch             randconfig-002-20250305    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250305    gcc-14.2.0
nios2                 randconfig-002-20250305    gcc-14.2.0
openrisc                          allnoconfig    clang-15
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    gcc-13.2.0
parisc                            allnoconfig    clang-15
parisc                            allnoconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250305    gcc-14.2.0
parisc                randconfig-002-20250305    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                           allnoconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc                  mpc866_ads_defconfig    gcc-14.2.0
powerpc                     powernv_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250305    clang-17
powerpc               randconfig-001-20250305    gcc-14.2.0
powerpc               randconfig-002-20250305    gcc-14.2.0
powerpc               randconfig-003-20250305    gcc-14.2.0
powerpc                     tqm8540_defconfig    gcc-13.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-13.2.0
powerpc64             randconfig-001-20250305    clang-19
powerpc64             randconfig-001-20250305    gcc-14.2.0
powerpc64             randconfig-002-20250305    clang-17
powerpc64             randconfig-002-20250305    gcc-14.2.0
powerpc64             randconfig-003-20250305    clang-19
powerpc64             randconfig-003-20250305    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250305    clang-19
riscv                 randconfig-001-20250305    gcc-14.2.0
riscv                 randconfig-002-20250305    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250305    gcc-14.2.0
s390                  randconfig-002-20250305    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                          polaris_defconfig    gcc-14.2.0
sh                    randconfig-001-20250305    gcc-14.2.0
sh                    randconfig-002-20250305    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-13.2.0
sh                             shx3_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250305    gcc-14.2.0
sparc                 randconfig-002-20250305    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250305    gcc-14.2.0
sparc64               randconfig-002-20250305    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-15
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250305    clang-19
um                    randconfig-001-20250305    gcc-14.2.0
um                    randconfig-002-20250305    gcc-12
um                    randconfig-002-20250305    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250305    clang-19
x86_64      buildonly-randconfig-002-20250305    clang-19
x86_64      buildonly-randconfig-002-20250305    gcc-12
x86_64      buildonly-randconfig-003-20250305    clang-19
x86_64      buildonly-randconfig-004-20250305    clang-19
x86_64      buildonly-randconfig-004-20250305    gcc-12
x86_64      buildonly-randconfig-005-20250305    clang-19
x86_64      buildonly-randconfig-006-20250305    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250305    gcc-12
x86_64                randconfig-002-20250305    gcc-12
x86_64                randconfig-003-20250305    gcc-12
x86_64                randconfig-004-20250305    gcc-12
x86_64                randconfig-005-20250305    gcc-12
x86_64                randconfig-006-20250305    gcc-12
x86_64                randconfig-007-20250305    gcc-12
x86_64                randconfig-008-20250305    gcc-12
x86_64                randconfig-071-20250305    clang-19
x86_64                randconfig-072-20250305    clang-19
x86_64                randconfig-073-20250305    clang-19
x86_64                randconfig-074-20250305    clang-19
x86_64                randconfig-075-20250305    clang-19
x86_64                randconfig-076-20250305    clang-19
x86_64                randconfig-077-20250305    clang-19
x86_64                randconfig-078-20250305    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250305    gcc-14.2.0
xtensa                randconfig-002-20250305    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


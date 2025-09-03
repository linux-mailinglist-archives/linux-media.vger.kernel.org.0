Return-Path: <linux-media+bounces-41627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9264AB4141B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 07:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C0981B272D2
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 05:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6A02D3756;
	Wed,  3 Sep 2025 05:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ilp+XSAu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160D932F775
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 05:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756875947; cv=none; b=B7PgUJTBmcmjvQxBvV/osUAZxan8dagwRWRR3weoR0wiFgdXVjNAlVzRfnPpomQVV1CTDqNwHNeulCLtDBopnl6RG1UJ1GeOD9mGTsqcxg4NJHbhKJcsXoPnAmtpdaDR+5Fqj3+PILD2q3sMvw+8LLZhp39PIwg3wWBCcHUJzS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756875947; c=relaxed/simple;
	bh=9Og0DK2WNPj5D7ZKQOIjHCHULbdBf+lK4OtXGNC1crk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nl/qlo/9STNFdZ8H0p4HrNaLphNzkKEo524ZBapep7aYWkakDmsXbWc1yjn+YYNV0A8eumkJt95CD1acela5dXh8XeOBg2Hbb51JrxCAkgK7kHmcplejZ0QjHrv99eiwhXDis+VCQ4E+nKmW7+ReVpaErswnjlpv50PqwGIckBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ilp+XSAu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756875946; x=1788411946;
  h=date:from:to:cc:subject:message-id;
  bh=9Og0DK2WNPj5D7ZKQOIjHCHULbdBf+lK4OtXGNC1crk=;
  b=Ilp+XSAumEBA4ShQ7LggMzDycfx8kttfvc9jERKSKz7jJXzp6M+WLCTK
   cEu2rcMWzysvRVr/XybAaRBOEdURreHpRLKSCdtdOOgwOIKlwnK27UG3w
   n/HF6zaWjfFyY+wKtubA0XRVOpxrbfRxZOuh2+wdx+RGkhT1I485+ossl
   nOk4Rjg+TxK+W2t49FOoNra7uqL+YYd2avUz5+6kE6SiPzijD/c5+1QJP
   pqm2tnGD9oAkT+cIif3DGZtr8hKnxA/leWXSpXaH3oRZ8+E/+K9pCKwjK
   ct3b3ZF9Xlb898XRXBCWG+CS0V41BnJ1MqPS8WcMhwDPf0vUt0vAm9Dez
   A==;
X-CSE-ConnectionGUID: dgg8r971Sx2cyyJvikcdfg==
X-CSE-MsgGUID: gOVpR1GGT6SSoWr1YNOgEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="84599619"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="84599619"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 22:05:45 -0700
X-CSE-ConnectionGUID: 3KawYjBNSumpP1ScDCjhww==
X-CSE-MsgGUID: etWCtQJ3Sl6k7zxQ8oqgwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="171636849"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Sep 2025 22:05:44 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utfgd-0003N1-04;
	Wed, 03 Sep 2025 05:05:37 +0000
Date: Wed, 03 Sep 2025 13:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 fefcce5ab179ebc5662e64f0095694b206088842
Message-ID: <202509031312.GsbUVyAT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: fefcce5ab179ebc5662e64f0095694b206088842  media: i2c: add ov2735 image sensor driver

elapsed time: 1262m

configs tested: 253
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20250902    gcc-11.5.0
arc                   randconfig-001-20250903    gcc-8.5.0
arc                   randconfig-002-20250902    gcc-9.5.0
arc                   randconfig-002-20250903    gcc-8.5.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                       imx_v6_v7_defconfig    gcc-15.1.0
arm                            mmp2_defconfig    gcc-15.1.0
arm                   randconfig-001-20250902    gcc-15.1.0
arm                   randconfig-001-20250903    gcc-8.5.0
arm                   randconfig-002-20250902    gcc-8.5.0
arm                   randconfig-002-20250903    gcc-8.5.0
arm                   randconfig-003-20250902    clang-22
arm                   randconfig-003-20250903    gcc-8.5.0
arm                   randconfig-004-20250902    clang-22
arm                   randconfig-004-20250903    gcc-8.5.0
arm                           spitz_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250902    gcc-8.5.0
arm64                 randconfig-001-20250903    gcc-8.5.0
arm64                 randconfig-002-20250902    clang-22
arm64                 randconfig-002-20250903    gcc-8.5.0
arm64                 randconfig-003-20250902    gcc-12.5.0
arm64                 randconfig-003-20250903    gcc-8.5.0
arm64                 randconfig-004-20250902    clang-22
arm64                 randconfig-004-20250903    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250902    gcc-14.3.0
csky                  randconfig-001-20250903    gcc-10.5.0
csky                  randconfig-002-20250902    gcc-12.5.0
csky                  randconfig-002-20250903    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250902    clang-18
hexagon               randconfig-001-20250903    gcc-10.5.0
hexagon               randconfig-002-20250902    clang-22
hexagon               randconfig-002-20250903    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250902    clang-20
i386        buildonly-randconfig-001-20250903    clang-20
i386        buildonly-randconfig-002-20250902    clang-20
i386        buildonly-randconfig-002-20250903    clang-20
i386        buildonly-randconfig-003-20250902    gcc-12
i386        buildonly-randconfig-003-20250903    clang-20
i386        buildonly-randconfig-004-20250902    clang-20
i386        buildonly-randconfig-004-20250903    clang-20
i386        buildonly-randconfig-005-20250902    gcc-12
i386        buildonly-randconfig-005-20250903    clang-20
i386        buildonly-randconfig-006-20250902    clang-20
i386        buildonly-randconfig-006-20250903    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250903    gcc-12
i386                  randconfig-002-20250903    gcc-12
i386                  randconfig-003-20250903    gcc-12
i386                  randconfig-004-20250903    gcc-12
i386                  randconfig-005-20250903    gcc-12
i386                  randconfig-006-20250903    gcc-12
i386                  randconfig-007-20250903    gcc-12
i386                  randconfig-011-20250903    gcc-12
i386                  randconfig-012-20250903    gcc-12
i386                  randconfig-013-20250903    gcc-12
i386                  randconfig-014-20250903    gcc-12
i386                  randconfig-015-20250903    gcc-12
i386                  randconfig-016-20250903    gcc-12
i386                  randconfig-017-20250903    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250902    clang-22
loongarch             randconfig-001-20250903    gcc-10.5.0
loongarch             randconfig-002-20250902    clang-22
loongarch             randconfig-002-20250903    gcc-10.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                       m5275evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250902    gcc-9.5.0
nios2                 randconfig-001-20250903    gcc-10.5.0
nios2                 randconfig-002-20250902    gcc-11.5.0
nios2                 randconfig-002-20250903    gcc-10.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250902    gcc-8.5.0
parisc                randconfig-001-20250903    gcc-10.5.0
parisc                randconfig-002-20250902    gcc-11.5.0
parisc                randconfig-002-20250903    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                    ge_imp3a_defconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    gcc-15.1.0
powerpc                     mpc5200_defconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250902    gcc-9.5.0
powerpc               randconfig-001-20250903    gcc-10.5.0
powerpc               randconfig-002-20250902    gcc-8.5.0
powerpc               randconfig-002-20250903    gcc-10.5.0
powerpc               randconfig-003-20250902    gcc-11.5.0
powerpc               randconfig-003-20250903    gcc-10.5.0
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250902    gcc-12.5.0
powerpc64             randconfig-001-20250903    gcc-10.5.0
powerpc64             randconfig-002-20250902    clang-22
powerpc64             randconfig-002-20250903    gcc-10.5.0
powerpc64             randconfig-003-20250902    clang-22
powerpc64             randconfig-003-20250903    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250902    gcc-13.4.0
riscv                 randconfig-001-20250903    gcc-12.5.0
riscv                 randconfig-002-20250902    clang-22
riscv                 randconfig-002-20250903    gcc-12.5.0
s390                             alldefconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250902    clang-22
s390                  randconfig-001-20250903    gcc-12.5.0
s390                  randconfig-002-20250902    gcc-10.5.0
s390                  randconfig-002-20250903    gcc-12.5.0
s390                       zfcpdump_defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250902    gcc-12.5.0
sh                    randconfig-001-20250903    gcc-12.5.0
sh                    randconfig-002-20250902    gcc-12.5.0
sh                    randconfig-002-20250903    gcc-12.5.0
sh                           se7751_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250902    gcc-14.3.0
sparc                 randconfig-001-20250903    gcc-12.5.0
sparc                 randconfig-002-20250902    gcc-8.5.0
sparc                 randconfig-002-20250903    gcc-12.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250902    clang-20
sparc64               randconfig-001-20250903    gcc-12.5.0
sparc64               randconfig-002-20250902    gcc-9.5.0
sparc64               randconfig-002-20250903    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250902    gcc-12
um                    randconfig-001-20250903    gcc-12.5.0
um                    randconfig-002-20250902    gcc-12
um                    randconfig-002-20250903    gcc-12.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250902    clang-20
x86_64      buildonly-randconfig-001-20250903    clang-20
x86_64      buildonly-randconfig-002-20250902    clang-20
x86_64      buildonly-randconfig-002-20250903    clang-20
x86_64      buildonly-randconfig-003-20250902    clang-20
x86_64      buildonly-randconfig-003-20250903    clang-20
x86_64      buildonly-randconfig-004-20250902    gcc-12
x86_64      buildonly-randconfig-004-20250903    clang-20
x86_64      buildonly-randconfig-005-20250902    gcc-12
x86_64      buildonly-randconfig-005-20250903    clang-20
x86_64      buildonly-randconfig-006-20250902    gcc-12
x86_64      buildonly-randconfig-006-20250903    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250903    clang-20
x86_64                randconfig-002-20250903    clang-20
x86_64                randconfig-003-20250903    clang-20
x86_64                randconfig-004-20250903    clang-20
x86_64                randconfig-005-20250903    clang-20
x86_64                randconfig-006-20250903    clang-20
x86_64                randconfig-007-20250903    clang-20
x86_64                randconfig-008-20250903    clang-20
x86_64                randconfig-071-20250903    clang-20
x86_64                randconfig-072-20250903    clang-20
x86_64                randconfig-073-20250903    clang-20
x86_64                randconfig-074-20250903    clang-20
x86_64                randconfig-075-20250903    clang-20
x86_64                randconfig-076-20250903    clang-20
x86_64                randconfig-077-20250903    clang-20
x86_64                randconfig-078-20250903    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250902    gcc-9.5.0
xtensa                randconfig-001-20250903    gcc-12.5.0
xtensa                randconfig-002-20250902    gcc-10.5.0
xtensa                randconfig-002-20250903    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


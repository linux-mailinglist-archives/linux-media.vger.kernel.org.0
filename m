Return-Path: <linux-media+bounces-26166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B860A36572
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 19:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6317C3AD1C1
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 18:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198A7269AE8;
	Fri, 14 Feb 2025 18:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgmJaAEt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B403B2698B8
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739556537; cv=none; b=VKUBT9bEgei+MvlvGrf9wdHYKwdAwbKTGiAaScroOLjS/Xwew4KrsrKNFCS6eJH6IO0xk8bUT76yAdX0/bFI5z+f396Znx/rTS+j7mAObnRFxuzzqDa/IDoAmt/BjMsloo3Uiex474tMtOq3wux4NF8UIXqiU7dMLGMSTCq56E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739556537; c=relaxed/simple;
	bh=cuDGSrO0Q1FMmb3e4Tdf2NRa9GbQ0Z1notYqdwd9nxs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QCar7pwNJgi2fRUtowXtzv2bnUeoc7MLnIAk+DMln0QWDmLSK9IsG0rHxGJqFQR2g7w6iJ6Ouxm9x+0L95IROyZC90vQ84FQI0GyObKpvRqrFmjf5u8SaOwNz4sxHHct7KbZkwGZZbrNPvJbDEMl8pAX9H9+B79rSKp15ji7TII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgmJaAEt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739556536; x=1771092536;
  h=date:from:to:cc:subject:message-id;
  bh=cuDGSrO0Q1FMmb3e4Tdf2NRa9GbQ0Z1notYqdwd9nxs=;
  b=UgmJaAEtpIkHBLw9lZmGUO5UmSGD/tTa+G3lYQJtFT4lgNmkZjdoKGpp
   oC4B+DFf4PfF74Jynf9nz9IilXowwaHM8CwBlvxnTnmnReRUpPN+yD5n+
   Nqpr8a57U9dKUkaoqOYOz0+FgFG4926HqFEDYFDPcBpgoG9uS7RWFwgUc
   WeCzHaSeq6Yp0NOG0qj5nUVYGVY6fyNlyLw7mJMsypA5P8zAnUtFWSKId
   DkbSAP3EdpzBfhREPfpsUUhgKU0soDU+Zf3xqsq571jBCnHUysnHJmo6S
   WJ2nCy7L36Dsm5fcftY5qAjmyAZIvBKbkc0xgRvj/3CRl4V6yJHjoFkMO
   w==;
X-CSE-ConnectionGUID: vh9t56/gRa2zZpiHHUrq/w==
X-CSE-MsgGUID: Zejm5fweSw+AC4lX3jYivw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40025247"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40025247"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 10:08:56 -0800
X-CSE-ConnectionGUID: SQXM4TN0T7uz/s6oUdCGZA==
X-CSE-MsgGUID: pqAHfpLfTZiyXtF/ZoXZtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113480206"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Feb 2025 10:08:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj07P-001A0B-2c;
	Fri, 14 Feb 2025 18:08:51 +0000
Date: Sat, 15 Feb 2025 02:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 87d199af7f765cccde18934e8b656b95b395cacb
Message-ID: <202502150254.8dpisLHf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 87d199af7f765cccde18934e8b656b95b395cacb  media: dw9719: Add DW9761 support

elapsed time: 1117m

configs tested: 212
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20250214    gcc-13.2.0
arc                   randconfig-001-20250214    gcc-14.2.0
arc                   randconfig-002-20250214    gcc-13.2.0
arc                   randconfig-002-20250214    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                                 defconfig    gcc-14.2.0
arm                   randconfig-001-20250214    clang-16
arm                   randconfig-001-20250214    gcc-14.2.0
arm                   randconfig-002-20250214    gcc-14.2.0
arm                   randconfig-003-20250214    clang-21
arm                   randconfig-003-20250214    gcc-14.2.0
arm                   randconfig-004-20250214    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250214    gcc-14.2.0
arm64                 randconfig-002-20250214    gcc-14.2.0
arm64                 randconfig-003-20250214    gcc-14.2.0
arm64                 randconfig-004-20250214    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250214    clang-21
csky                  randconfig-001-20250214    gcc-14.2.0
csky                  randconfig-002-20250214    clang-21
csky                  randconfig-002-20250214    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250214    clang-21
hexagon               randconfig-002-20250214    clang-15
hexagon               randconfig-002-20250214    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250214    gcc-12
i386        buildonly-randconfig-002-20250214    gcc-12
i386        buildonly-randconfig-003-20250214    clang-19
i386        buildonly-randconfig-003-20250214    gcc-12
i386        buildonly-randconfig-004-20250214    gcc-12
i386        buildonly-randconfig-005-20250214    gcc-12
i386        buildonly-randconfig-006-20250214    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250214    gcc-12
i386                  randconfig-002-20250214    gcc-12
i386                  randconfig-003-20250214    gcc-12
i386                  randconfig-004-20250214    gcc-12
i386                  randconfig-005-20250214    gcc-12
i386                  randconfig-006-20250214    gcc-12
i386                  randconfig-007-20250214    gcc-12
i386                  randconfig-011-20250214    clang-19
i386                  randconfig-012-20250214    clang-19
i386                  randconfig-013-20250214    clang-19
i386                  randconfig-014-20250214    clang-19
i386                  randconfig-015-20250214    clang-19
i386                  randconfig-016-20250214    clang-19
i386                  randconfig-017-20250214    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250214    clang-21
loongarch             randconfig-001-20250214    gcc-14.2.0
loongarch             randconfig-002-20250214    clang-21
loongarch             randconfig-002-20250214    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250214    clang-21
nios2                 randconfig-001-20250214    gcc-14.2.0
nios2                 randconfig-002-20250214    clang-21
nios2                 randconfig-002-20250214    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250214    clang-21
parisc                randconfig-001-20250214    gcc-14.2.0
parisc                randconfig-002-20250214    clang-21
parisc                randconfig-002-20250214    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250214    clang-21
powerpc               randconfig-001-20250214    gcc-14.2.0
powerpc               randconfig-002-20250214    clang-18
powerpc               randconfig-002-20250214    clang-21
powerpc               randconfig-003-20250214    clang-21
powerpc64             randconfig-001-20250214    clang-18
powerpc64             randconfig-001-20250214    clang-21
powerpc64             randconfig-002-20250214    clang-21
powerpc64             randconfig-002-20250214    gcc-14.2.0
powerpc64             randconfig-003-20250214    clang-21
powerpc64             randconfig-003-20250214    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250214    clang-16
riscv                 randconfig-001-20250214    clang-18
riscv                 randconfig-002-20250214    clang-16
riscv                 randconfig-002-20250214    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250214    clang-16
s390                  randconfig-001-20250214    gcc-14.2.0
s390                  randconfig-002-20250214    clang-16
s390                  randconfig-002-20250214    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250214    clang-16
sh                    randconfig-001-20250214    gcc-14.2.0
sh                    randconfig-002-20250214    clang-16
sh                    randconfig-002-20250214    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250214    clang-16
sparc                 randconfig-001-20250214    gcc-14.2.0
sparc                 randconfig-002-20250214    clang-16
sparc                 randconfig-002-20250214    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250214    clang-16
sparc64               randconfig-001-20250214    gcc-14.2.0
sparc64               randconfig-002-20250214    clang-16
sparc64               randconfig-002-20250214    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250214    clang-16
um                    randconfig-001-20250214    gcc-12
um                    randconfig-002-20250214    clang-16
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250214    clang-19
x86_64      buildonly-randconfig-001-20250214    gcc-12
x86_64      buildonly-randconfig-002-20250214    clang-19
x86_64      buildonly-randconfig-002-20250214    gcc-12
x86_64      buildonly-randconfig-003-20250214    gcc-12
x86_64      buildonly-randconfig-004-20250214    clang-19
x86_64      buildonly-randconfig-004-20250214    gcc-12
x86_64      buildonly-randconfig-005-20250214    gcc-12
x86_64      buildonly-randconfig-006-20250214    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250214    clang-19
x86_64                randconfig-002-20250214    clang-19
x86_64                randconfig-003-20250214    clang-19
x86_64                randconfig-004-20250214    clang-19
x86_64                randconfig-005-20250214    clang-19
x86_64                randconfig-006-20250214    clang-19
x86_64                randconfig-007-20250214    clang-19
x86_64                randconfig-008-20250214    clang-19
x86_64                randconfig-071-20250214    gcc-12
x86_64                randconfig-072-20250214    gcc-12
x86_64                randconfig-073-20250214    gcc-12
x86_64                randconfig-074-20250214    gcc-12
x86_64                randconfig-075-20250214    gcc-12
x86_64                randconfig-076-20250214    gcc-12
x86_64                randconfig-077-20250214    gcc-12
x86_64                randconfig-078-20250214    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250214    clang-16
xtensa                randconfig-001-20250214    gcc-14.2.0
xtensa                randconfig-002-20250214    clang-16
xtensa                randconfig-002-20250214    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


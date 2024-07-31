Return-Path: <linux-media+bounces-15621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE5B942883
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4E64284D5C
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 07:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427F11A76C3;
	Wed, 31 Jul 2024 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLmE+PpX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A9123BB
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722412770; cv=none; b=iWzSO+EP3A7FYvvyu7amiaLDuIHIEPQkIpzZ/QwXquYZml25WLkOrkifp3DQU0PF9eqpUUjo/JXvu4Dya3r6ptETbvo5x/jCZTlVg2GQrPcye7ZpjLa0G9FXFLo05Zoc2y53DylMRL2RWeIil+BVcrA3VuNoUbDE1hXoLjhTmgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722412770; c=relaxed/simple;
	bh=bdMbQ2GqiCaVrTK6/1gjkDe8EdILGcnOpqC6UxeEr5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l1Vx/8fxSvHDZVE87N6mvJvHLIx3nnX03Sml6X8boeUR0oK7GstQo3mfni2gHEQp/M9NKz9S7bBql1TeKcUENDWIbUntWJQ4uZMZQACohU3bWXOQqrTlquqbaudAeNgWn3e6W4tpsCgcxDWf5f2SMAht/z8OZjptiasf1NXzdpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLmE+PpX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722412769; x=1753948769;
  h=date:from:to:cc:subject:message-id;
  bh=bdMbQ2GqiCaVrTK6/1gjkDe8EdILGcnOpqC6UxeEr5M=;
  b=CLmE+PpXniwoLNsGedpF7qrQW/4zvzeS5d9nGoQ+V/eAMwc98w6q4ZGQ
   vUhGCdx7i6u0dBBLyDLW+Rso/k769QNt3VzZAZNoKd0nB7Owk6twU0dcR
   CtIvXZ9GHb+YlGZLSHtdS4dU8gs2XxyFJEICau5KzvllfUBlM1GrTPogo
   Vu5Do5swiU1lf1ivWTVomp6jtv3tggywo1YF0CcRVxwr9QIDq7PINCWG8
   YD7ynAkzJnpQ4ciy721hwmEpLXad1PDpeFTKrZQT4pq4N19thAu+Nl9Xk
   oGqBYGTsdyeZb5RiQdkzYBxeOy7g9xMHeBwA3a0d9A2MGCt1/4WfWPyK5
   w==;
X-CSE-ConnectionGUID: thI3vsjFT06J3Y5kXvoQ3Q==
X-CSE-MsgGUID: MswHz2epQDiPbLsRv4teaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="19864884"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="19864884"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 00:59:28 -0700
X-CSE-ConnectionGUID: uPdnE4l7TXiln2sdM234Uw==
X-CSE-MsgGUID: YMEa82Y/QpW2aKzy4gf40w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="54528785"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Jul 2024 00:59:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ4F2-000u1O-04;
	Wed, 31 Jul 2024 07:59:24 +0000
Date: Wed, 31 Jul 2024 15:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:fixes] BUILD SUCCESS
 914f8961879de6fadd166ebd75151a778481e09a
Message-ID: <202407311523.Wexbq62D-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git fixes
branch HEAD: 914f8961879de6fadd166ebd75151a778481e09a  media: v4l: Fix missing tabular column hint for Y14P format

elapsed time: 1469m

configs tested: 281
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240730   gcc-13.2.0
arc                   randconfig-001-20240731   gcc-13.2.0
arc                   randconfig-002-20240730   gcc-13.2.0
arc                   randconfig-002-20240731   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                     am200epdkit_defconfig   gcc-14.1.0
arm                       aspeed_g4_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-14.1.0
arm                         lpc18xx_defconfig   gcc-14.1.0
arm                          moxart_defconfig   gcc-14.1.0
arm                       netwinder_defconfig   gcc-14.1.0
arm                          pxa910_defconfig   gcc-14.1.0
arm                   randconfig-001-20240730   gcc-13.2.0
arm                   randconfig-001-20240731   gcc-13.2.0
arm                   randconfig-002-20240730   gcc-13.2.0
arm                   randconfig-002-20240731   gcc-13.2.0
arm                   randconfig-003-20240730   gcc-13.2.0
arm                   randconfig-003-20240731   gcc-13.2.0
arm                   randconfig-004-20240730   gcc-13.2.0
arm                   randconfig-004-20240731   gcc-13.2.0
arm                        shmobile_defconfig   gcc-14.1.0
arm                           tegra_defconfig   gcc-14.1.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                            allyesconfig   clang-20
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240730   gcc-13.2.0
arm64                 randconfig-001-20240731   gcc-13.2.0
arm64                 randconfig-002-20240730   gcc-13.2.0
arm64                 randconfig-002-20240731   gcc-13.2.0
arm64                 randconfig-003-20240730   gcc-13.2.0
arm64                 randconfig-003-20240731   gcc-13.2.0
arm64                 randconfig-004-20240730   gcc-13.2.0
arm64                 randconfig-004-20240731   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240730   gcc-13.2.0
csky                  randconfig-001-20240731   gcc-13.2.0
csky                  randconfig-002-20240730   gcc-13.2.0
csky                  randconfig-002-20240731   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240730   gcc-13
i386         buildonly-randconfig-001-20240731   clang-18
i386         buildonly-randconfig-002-20240730   gcc-13
i386         buildonly-randconfig-002-20240731   clang-18
i386         buildonly-randconfig-003-20240730   gcc-13
i386         buildonly-randconfig-003-20240731   clang-18
i386         buildonly-randconfig-004-20240730   gcc-13
i386         buildonly-randconfig-004-20240731   clang-18
i386         buildonly-randconfig-005-20240730   gcc-13
i386         buildonly-randconfig-005-20240731   clang-18
i386         buildonly-randconfig-006-20240730   gcc-13
i386         buildonly-randconfig-006-20240731   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240730   gcc-13
i386                  randconfig-001-20240731   clang-18
i386                  randconfig-002-20240730   gcc-13
i386                  randconfig-002-20240731   clang-18
i386                  randconfig-003-20240730   gcc-13
i386                  randconfig-003-20240731   clang-18
i386                  randconfig-004-20240730   gcc-13
i386                  randconfig-004-20240731   clang-18
i386                  randconfig-005-20240730   gcc-13
i386                  randconfig-005-20240731   clang-18
i386                  randconfig-006-20240730   gcc-13
i386                  randconfig-006-20240731   clang-18
i386                  randconfig-011-20240730   gcc-13
i386                  randconfig-011-20240731   clang-18
i386                  randconfig-012-20240730   gcc-13
i386                  randconfig-012-20240731   clang-18
i386                  randconfig-013-20240730   gcc-13
i386                  randconfig-013-20240731   clang-18
i386                  randconfig-014-20240730   gcc-13
i386                  randconfig-014-20240731   clang-18
i386                  randconfig-015-20240730   gcc-13
i386                  randconfig-015-20240731   clang-18
i386                  randconfig-016-20240730   gcc-13
i386                  randconfig-016-20240731   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240730   gcc-13.2.0
loongarch             randconfig-001-20240731   gcc-13.2.0
loongarch             randconfig-002-20240730   gcc-13.2.0
loongarch             randconfig-002-20240731   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         amcore_defconfig   gcc-14.1.0
m68k                          amiga_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5272c3_defconfig   gcc-14.1.0
m68k                          multi_defconfig   gcc-14.1.0
m68k                        mvme16x_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                             allmodconfig   clang-20
mips                              allnoconfig   gcc-13.2.0
mips                             allyesconfig   clang-20
mips                       bmips_be_defconfig   gcc-14.1.0
mips                  decstation_64_defconfig   gcc-14.1.0
mips                           ip22_defconfig   gcc-14.1.0
mips                      loongson3_defconfig   gcc-14.1.0
mips                         rt305x_defconfig   gcc-14.1.0
nios2                            alldefconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240730   gcc-13.2.0
nios2                 randconfig-001-20240731   gcc-13.2.0
nios2                 randconfig-002-20240730   gcc-13.2.0
nios2                 randconfig-002-20240731   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240730   gcc-13.2.0
parisc                randconfig-001-20240731   gcc-13.2.0
parisc                randconfig-002-20240730   gcc-13.2.0
parisc                randconfig-002-20240731   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                    adder875_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   bluestone_defconfig   gcc-14.1.0
powerpc                          g5_defconfig   gcc-14.1.0
powerpc                   lite5200b_defconfig   gcc-14.1.0
powerpc                     mpc5200_defconfig   gcc-14.1.0
powerpc                     mpc83xx_defconfig   gcc-14.1.0
powerpc               randconfig-002-20240730   gcc-13.2.0
powerpc               randconfig-002-20240731   gcc-13.2.0
powerpc               randconfig-003-20240730   gcc-13.2.0
powerpc               randconfig-003-20240731   gcc-13.2.0
powerpc                     tqm5200_defconfig   gcc-14.1.0
powerpc                     tqm8541_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240730   gcc-13.2.0
powerpc64             randconfig-001-20240731   gcc-13.2.0
powerpc64             randconfig-002-20240730   gcc-13.2.0
powerpc64             randconfig-002-20240731   gcc-13.2.0
powerpc64             randconfig-003-20240730   gcc-13.2.0
powerpc64             randconfig-003-20240731   gcc-13.2.0
riscv                            alldefconfig   gcc-14.1.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240730   gcc-13.2.0
riscv                 randconfig-001-20240731   gcc-13.2.0
riscv                 randconfig-002-20240730   gcc-13.2.0
riscv                 randconfig-002-20240731   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240730   gcc-13.2.0
s390                  randconfig-001-20240731   gcc-13.2.0
s390                  randconfig-002-20240730   gcc-13.2.0
s390                  randconfig-002-20240731   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-14.1.0
sh                        edosk7705_defconfig   gcc-14.1.0
sh                          kfr2r09_defconfig   gcc-14.1.0
sh                          landisk_defconfig   gcc-14.1.0
sh                            migor_defconfig   gcc-14.1.0
sh                    randconfig-001-20240730   gcc-13.2.0
sh                    randconfig-001-20240731   gcc-13.2.0
sh                    randconfig-002-20240730   gcc-13.2.0
sh                    randconfig-002-20240731   gcc-13.2.0
sh                          rsk7201_defconfig   gcc-14.1.0
sh                   rts7751r2dplus_defconfig   gcc-14.1.0
sh                           se7712_defconfig   gcc-14.1.0
sh                        sh7763rdp_defconfig   gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig   gcc-14.1.0
sh                            shmin_defconfig   gcc-14.1.0
sh                          urquell_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240730   gcc-13.2.0
sparc64               randconfig-001-20240731   gcc-13.2.0
sparc64               randconfig-002-20240730   gcc-13.2.0
sparc64               randconfig-002-20240731   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240730   gcc-13.2.0
um                    randconfig-001-20240731   gcc-13.2.0
um                    randconfig-002-20240730   gcc-13.2.0
um                    randconfig-002-20240731   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240730   clang-18
x86_64       buildonly-randconfig-001-20240731   gcc-13
x86_64       buildonly-randconfig-002-20240730   clang-18
x86_64       buildonly-randconfig-002-20240731   gcc-13
x86_64       buildonly-randconfig-003-20240730   clang-18
x86_64       buildonly-randconfig-003-20240731   gcc-13
x86_64       buildonly-randconfig-004-20240730   clang-18
x86_64       buildonly-randconfig-004-20240731   gcc-13
x86_64       buildonly-randconfig-005-20240730   clang-18
x86_64       buildonly-randconfig-005-20240731   gcc-13
x86_64       buildonly-randconfig-006-20240730   clang-18
x86_64       buildonly-randconfig-006-20240731   gcc-13
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240730   clang-18
x86_64                randconfig-001-20240731   gcc-13
x86_64                randconfig-002-20240730   clang-18
x86_64                randconfig-002-20240731   gcc-13
x86_64                randconfig-003-20240730   clang-18
x86_64                randconfig-003-20240731   gcc-13
x86_64                randconfig-004-20240730   clang-18
x86_64                randconfig-004-20240731   gcc-13
x86_64                randconfig-005-20240730   clang-18
x86_64                randconfig-005-20240731   gcc-13
x86_64                randconfig-006-20240730   clang-18
x86_64                randconfig-006-20240731   gcc-13
x86_64                randconfig-011-20240730   clang-18
x86_64                randconfig-011-20240731   gcc-13
x86_64                randconfig-012-20240730   clang-18
x86_64                randconfig-012-20240731   gcc-13
x86_64                randconfig-013-20240730   clang-18
x86_64                randconfig-013-20240731   gcc-13
x86_64                randconfig-014-20240730   clang-18
x86_64                randconfig-014-20240731   gcc-13
x86_64                randconfig-015-20240730   clang-18
x86_64                randconfig-015-20240731   gcc-13
x86_64                randconfig-016-20240730   clang-18
x86_64                randconfig-016-20240731   gcc-13
x86_64                randconfig-071-20240730   clang-18
x86_64                randconfig-071-20240731   gcc-13
x86_64                randconfig-072-20240730   clang-18
x86_64                randconfig-072-20240731   gcc-13
x86_64                randconfig-073-20240730   clang-18
x86_64                randconfig-073-20240731   gcc-13
x86_64                randconfig-074-20240730   clang-18
x86_64                randconfig-074-20240731   gcc-13
x86_64                randconfig-075-20240730   clang-18
x86_64                randconfig-075-20240731   gcc-13
x86_64                randconfig-076-20240730   clang-18
x86_64                randconfig-076-20240731   gcc-13
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                          iss_defconfig   gcc-14.1.0
xtensa                  nommu_kc705_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240730   gcc-13.2.0
xtensa                randconfig-001-20240731   gcc-13.2.0
xtensa                randconfig-002-20240730   gcc-13.2.0
xtensa                randconfig-002-20240731   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


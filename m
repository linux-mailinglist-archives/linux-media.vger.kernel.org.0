Return-Path: <linux-media+bounces-28535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E07DA6AAA3
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 17:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ABC53A37A1
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 16:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E702223311;
	Thu, 20 Mar 2025 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bq+nkE2Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78103222580
	for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742486485; cv=none; b=VDStzgfT3qw1QO30HTgkzsKmt04LhnDErOCVIWJ6rV/gvrOlw/Nzax1waqWwVFW8eh4RwRCyWJoi8l2aoQOCExR07xuVnY3VArVgIsi4p7q3OIKOrS3qUQ4GxCCcqPiE7l+weD2Rsw3ELqxgMf3aJ00Gez8nw9+PnXeeBI58jIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742486485; c=relaxed/simple;
	bh=p0HiUeRhwGgoWrtmWLbTt6AUBlVP+agS7oKU/Rnzzsc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uNRKbQrUJzkFVK1s6/AR+qEgwXnAEzJNeFMEH5lrv1myKPH5xs8ORkGkiC9O2Rjia5avt120kK40Z+0lvPBeP3EH/jZ5gNw7kpepc4Qdvy0OaBEoa80oZ9XPIDCFdWrxAXmDcerncZvLLjKuBVr+wrR3somnpGs/jxGTB+mHQxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bq+nkE2Z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742486483; x=1774022483;
  h=date:from:to:cc:subject:message-id;
  bh=p0HiUeRhwGgoWrtmWLbTt6AUBlVP+agS7oKU/Rnzzsc=;
  b=bq+nkE2Z65Z12PZir9t+ueQxWvNGMmPZsDMAWSR4MJQhbloGCclEbHM3
   J2ra5zyWdIO1ri/q1Qt4vqGd6a7lE+sp5K9XSPRrnchD9jWDnf/yqou/8
   Xax3VKhqzxxv/7gEv1HAWYF3OR2bkOPWyvbx9nplGyKAd8oXiDawHHmDy
   Q5GnfPbO8Pamfu4S8Hqk90A87sgrvmHOQUV+VBM+eDU7F+bQrpPCMhxWR
   eC490oQsKD2F7/t73L/HwJ5RNRS80iYGgXKO2V6hefUYcETHfnsi9PHKG
   t3AfsCjsdKzmt3u8F+4l1fKQ0iEqFCrU8269Q+mVmnG4+YYVSn9tYQQrB
   Q==;
X-CSE-ConnectionGUID: p5kOD546SUSc0IgQtk8+dQ==
X-CSE-MsgGUID: DsQSe52bQZqMtZK5l9qIlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43739076"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="43739076"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 09:01:23 -0700
X-CSE-ConnectionGUID: EtK6B0ilS0esoJlix2vMVQ==
X-CSE-MsgGUID: C7RL4EhbRauupRibfJS+hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="123104580"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Mar 2025 09:01:21 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvIKd-0000ZD-1Y;
	Thu, 20 Mar 2025 16:01:19 +0000
Date: Fri, 21 Mar 2025 00:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 22577ec933050a30b5c7cbdf85c0615da11aaf37
Message-ID: <202503210014.XO8UXR8e-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 22577ec933050a30b5c7cbdf85c0615da11aaf37  media: intel/ipu6: Remove unused dev field from ipu6_isys_queue

elapsed time: 1451m

configs tested: 224
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-9.3.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    clang-15
arc                   randconfig-001-20250320    gcc-10.5.0
arc                   randconfig-001-20250320    gcc-7.5.0
arc                   randconfig-002-20250320    gcc-7.5.0
arc                   randconfig-002-20250320    gcc-8.5.0
arm                              allmodconfig    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-6.5.0
arm                       aspeed_g5_defconfig    clang-15
arm                                 defconfig    gcc-14.2.0
arm                             mxs_defconfig    clang-15
arm                   randconfig-001-20250320    clang-20
arm                   randconfig-001-20250320    gcc-7.5.0
arm                   randconfig-002-20250320    clang-16
arm                   randconfig-002-20250320    gcc-7.5.0
arm                   randconfig-003-20250320    gcc-7.5.0
arm                   randconfig-003-20250320    gcc-8.5.0
arm                   randconfig-004-20250320    gcc-6.5.0
arm                   randconfig-004-20250320    gcc-7.5.0
arm                           tegra_defconfig    clang-15
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    clang-15
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250320    clang-21
arm64                 randconfig-001-20250320    gcc-7.5.0
arm64                 randconfig-002-20250320    clang-21
arm64                 randconfig-002-20250320    gcc-7.5.0
arm64                 randconfig-003-20250320    clang-19
arm64                 randconfig-003-20250320    gcc-7.5.0
arm64                 randconfig-004-20250320    gcc-7.5.0
arm64                 randconfig-004-20250320    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250320    gcc-10.5.0
csky                  randconfig-001-20250320    gcc-12.4.0
csky                  randconfig-002-20250320    gcc-12.4.0
csky                  randconfig-002-20250320    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250320    clang-18
hexagon               randconfig-001-20250320    gcc-12.4.0
hexagon               randconfig-002-20250320    clang-21
hexagon               randconfig-002-20250320    gcc-12.4.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250320    gcc-12
i386        buildonly-randconfig-002-20250320    clang-20
i386        buildonly-randconfig-003-20250320    clang-20
i386        buildonly-randconfig-004-20250320    clang-20
i386        buildonly-randconfig-005-20250320    gcc-12
i386        buildonly-randconfig-006-20250320    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250320    clang-20
i386                  randconfig-002-20250320    clang-20
i386                  randconfig-003-20250320    clang-20
i386                  randconfig-004-20250320    clang-20
i386                  randconfig-005-20250320    clang-20
i386                  randconfig-006-20250320    clang-20
i386                  randconfig-007-20250320    clang-20
i386                  randconfig-011-20250320    gcc-12
i386                  randconfig-012-20250320    gcc-12
i386                  randconfig-013-20250320    gcc-12
i386                  randconfig-014-20250320    gcc-12
i386                  randconfig-015-20250320    gcc-12
i386                  randconfig-016-20250320    gcc-12
i386                  randconfig-017-20250320    gcc-12
loongarch                        allmodconfig    gcc-12.4.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    clang-15
loongarch             randconfig-001-20250320    gcc-12.4.0
loongarch             randconfig-001-20250320    gcc-14.2.0
loongarch             randconfig-002-20250320    gcc-12.4.0
m68k                             allmodconfig    gcc-8.5.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-6.5.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-9.3.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-9.3.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-15
mips                         rt305x_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250320    gcc-12.4.0
nios2                 randconfig-001-20250320    gcc-6.5.0
nios2                 randconfig-002-20250320    gcc-12.4.0
openrisc                          allnoconfig    clang-15
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-10.5.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250320    gcc-12.4.0
parisc                randconfig-001-20250320    gcc-13.3.0
parisc                randconfig-002-20250320    gcc-11.5.0
parisc                randconfig-002-20250320    gcc-12.4.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-5.5.0
powerpc                           allnoconfig    clang-15
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      arches_defconfig    clang-15
powerpc                      bamboo_defconfig    clang-15
powerpc                 mpc8313_rdb_defconfig    clang-15
powerpc               randconfig-001-20250320    gcc-12.4.0
powerpc               randconfig-001-20250320    gcc-6.5.0
powerpc               randconfig-002-20250320    clang-21
powerpc               randconfig-002-20250320    gcc-12.4.0
powerpc               randconfig-003-20250320    clang-21
powerpc               randconfig-003-20250320    gcc-12.4.0
powerpc64             randconfig-001-20250320    clang-21
powerpc64             randconfig-001-20250320    gcc-12.4.0
powerpc64             randconfig-002-20250320    gcc-12.4.0
powerpc64             randconfig-002-20250320    gcc-8.5.0
powerpc64             randconfig-003-20250320    clang-21
powerpc64             randconfig-003-20250320    gcc-12.4.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250320    clang-21
riscv                 randconfig-002-20250320    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                             allyesconfig    gcc-8.5.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250320    gcc-5.5.0
s390                  randconfig-002-20250320    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                               allmodconfig    gcc-9.3.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                               allyesconfig    gcc-7.5.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    clang-15
sh                            migor_defconfig    clang-15
sh                    randconfig-001-20250320    gcc-14.2.0
sh                    randconfig-002-20250320    gcc-10.5.0
sh                          sdk7780_defconfig    clang-15
sparc                            allmodconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-6.5.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250320    gcc-7.5.0
sparc                 randconfig-002-20250320    gcc-7.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250320    gcc-5.5.0
sparc64               randconfig-002-20250320    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-15
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250320    gcc-12
um                    randconfig-002-20250320    clang-16
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250320    clang-20
x86_64      buildonly-randconfig-002-20250320    clang-20
x86_64      buildonly-randconfig-002-20250320    gcc-12
x86_64      buildonly-randconfig-003-20250320    clang-20
x86_64      buildonly-randconfig-004-20250320    clang-20
x86_64      buildonly-randconfig-005-20250320    clang-20
x86_64      buildonly-randconfig-006-20250320    clang-20
x86_64      buildonly-randconfig-006-20250320    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250320    clang-20
x86_64                randconfig-002-20250320    clang-20
x86_64                randconfig-003-20250320    clang-20
x86_64                randconfig-004-20250320    clang-20
x86_64                randconfig-005-20250320    clang-20
x86_64                randconfig-006-20250320    clang-20
x86_64                randconfig-007-20250320    clang-20
x86_64                randconfig-008-20250320    clang-20
x86_64                randconfig-071-20250320    gcc-12
x86_64                randconfig-072-20250320    gcc-12
x86_64                randconfig-073-20250320    gcc-12
x86_64                randconfig-074-20250320    gcc-12
x86_64                randconfig-075-20250320    gcc-12
x86_64                randconfig-076-20250320    gcc-12
x86_64                randconfig-077-20250320    gcc-12
x86_64                randconfig-078-20250320    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-15
xtensa                randconfig-001-20250320    gcc-9.3.0
xtensa                randconfig-002-20250320    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


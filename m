Return-Path: <linux-media+bounces-42388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3D9B541C7
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 06:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 971CAA03EB1
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 04:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9CC26F2B9;
	Fri, 12 Sep 2025 04:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NclAsvcW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF59F25A321
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 04:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757652723; cv=none; b=p/xhNQ8gRKXAC6c9hAmkIphWhqdwTmgL2H4oYpcUHyj0v2zHFigcwOXtjI8chPoy3oRQ6oaf5y8NUGZJphL0HXh3ZDMz3F8MP0Pwoe+imDRZO/trVFOhMA7YMrfhmPikoheMCDoX1Pwr9TvVnW5/l+fRO/qXKcXvJUMTDlI5l68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757652723; c=relaxed/simple;
	bh=+KxnTu/47gIdJX4116gTkHZG51pAE+uggmLM3o1/Bas=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FHLZoj0xNGk7ZJ/nUPeXgYTbfnoaYaxb5/aLVER9fx3fGjIEOCboXVd+JuBSvqV2/WQyn2bnrIVWTcdmr9nh+3a0CjaQVhwy8dnR/Gnq45cnMPSWr4r2N32B+q3ekHpf+rFO5qQXTuWwf3k2fh/mU++lCO8/KRJ4uB6tCJrMCnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NclAsvcW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757652722; x=1789188722;
  h=date:from:to:cc:subject:message-id;
  bh=+KxnTu/47gIdJX4116gTkHZG51pAE+uggmLM3o1/Bas=;
  b=NclAsvcW2SgQ9iRCySBV9uDs3CkpzT0K2mkAq/YbVaWaPsakbjLwkK7N
   bJYOCzYHzGOzXbKu/eDHA1FQ301NWS9ZloZULnVMyRSa0lJJzBHL2WhH3
   q69yfa9XQTugKtBk8LDBqY5s0OCyCHb/lkzJHYR4kJqf6nw/r7RMEL5cW
   b7BKoCKMfNvjAPhAxNwzByZojDU19VdzI2PQvT2XHs2/spo4x6vV6wUtp
   JelRAKEOJvzWz4RNm0LC1VJDf0ugKyA91/IBWUyS/I/ZSVoU30u6dcTNl
   1pIjAEncPBxCoazhfkY9V5qa+cO7PnUaPnvgo7IC0y8alkh4lthksyBkz
   A==;
X-CSE-ConnectionGUID: T9HqfibZSxS7NE5pkzGQBA==
X-CSE-MsgGUID: 6j3eyJOjTjmw56kt2sR1jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="47564103"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="47564103"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 21:52:00 -0700
X-CSE-ConnectionGUID: 9xlt6LJLTZCrguEanvDcaQ==
X-CSE-MsgGUID: hcd5JN+fTw+L1YRwjzhWeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="174656391"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2025 21:51:59 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwvlN-0000qu-0w;
	Fri, 12 Sep 2025 04:51:57 +0000
Date: Fri, 12 Sep 2025 12:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 ecba852dc9f4993f4f894ea1f352564560e19a3e
Message-ID: <202509121212.Vs3RSWWh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: ecba852dc9f4993f4f894ea1f352564560e19a3e  media: redrat3: use int type to store negative error codes

elapsed time: 1272m

configs tested: 241
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250911    gcc-8.5.0
arc                   randconfig-001-20250912    clang-19
arc                   randconfig-002-20250911    gcc-12.5.0
arc                   randconfig-002-20250912    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   randconfig-001-20250911    clang-22
arm                   randconfig-001-20250912    clang-19
arm                   randconfig-002-20250911    gcc-14.3.0
arm                   randconfig-002-20250912    clang-19
arm                   randconfig-003-20250911    clang-22
arm                   randconfig-003-20250912    clang-19
arm                   randconfig-004-20250911    clang-16
arm                   randconfig-004-20250912    clang-19
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250911    gcc-13.4.0
arm64                 randconfig-001-20250912    clang-19
arm64                 randconfig-002-20250911    gcc-8.5.0
arm64                 randconfig-002-20250912    clang-19
arm64                 randconfig-003-20250911    gcc-8.5.0
arm64                 randconfig-003-20250912    clang-19
arm64                 randconfig-004-20250911    clang-22
arm64                 randconfig-004-20250912    clang-19
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20250911    gcc-15.1.0
csky                  randconfig-001-20250912    clang-22
csky                  randconfig-002-20250911    gcc-13.4.0
csky                  randconfig-002-20250912    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250911    clang-20
hexagon               randconfig-001-20250912    clang-22
hexagon               randconfig-002-20250911    clang-22
hexagon               randconfig-002-20250912    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250911    clang-20
i386        buildonly-randconfig-001-20250912    gcc-13
i386        buildonly-randconfig-002-20250911    clang-20
i386        buildonly-randconfig-002-20250912    gcc-13
i386        buildonly-randconfig-003-20250911    clang-20
i386        buildonly-randconfig-003-20250912    gcc-13
i386        buildonly-randconfig-004-20250911    clang-20
i386        buildonly-randconfig-004-20250912    gcc-13
i386        buildonly-randconfig-005-20250911    clang-20
i386        buildonly-randconfig-005-20250912    gcc-13
i386        buildonly-randconfig-006-20250911    clang-20
i386        buildonly-randconfig-006-20250912    gcc-13
i386                                defconfig    clang-20
i386                  randconfig-001-20250912    gcc-14
i386                  randconfig-002-20250912    gcc-14
i386                  randconfig-003-20250912    gcc-14
i386                  randconfig-004-20250912    gcc-14
i386                  randconfig-005-20250912    gcc-14
i386                  randconfig-006-20250912    gcc-14
i386                  randconfig-007-20250912    gcc-14
i386                  randconfig-011-20250912    gcc-14
i386                  randconfig-012-20250912    gcc-14
i386                  randconfig-013-20250912    gcc-14
i386                  randconfig-014-20250912    gcc-14
i386                  randconfig-015-20250912    gcc-14
i386                  randconfig-016-20250912    gcc-14
i386                  randconfig-017-20250912    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250911    gcc-15.1.0
loongarch             randconfig-001-20250912    clang-22
loongarch             randconfig-002-20250911    gcc-15.1.0
loongarch             randconfig-002-20250912    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                          amiga_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250911    gcc-11.5.0
nios2                 randconfig-001-20250912    clang-22
nios2                 randconfig-002-20250911    gcc-8.5.0
nios2                 randconfig-002-20250912    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250911    gcc-8.5.0
parisc                randconfig-001-20250912    clang-22
parisc                randconfig-002-20250911    gcc-8.5.0
parisc                randconfig-002-20250912    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250911    gcc-8.5.0
powerpc               randconfig-001-20250912    clang-22
powerpc               randconfig-002-20250911    gcc-15.1.0
powerpc               randconfig-002-20250912    clang-22
powerpc               randconfig-003-20250911    gcc-8.5.0
powerpc               randconfig-003-20250912    clang-22
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250911    clang-22
powerpc64             randconfig-001-20250912    clang-22
powerpc64             randconfig-002-20250911    gcc-11.5.0
powerpc64             randconfig-002-20250912    clang-22
powerpc64             randconfig-003-20250911    gcc-8.5.0
powerpc64             randconfig-003-20250912    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250911    clang-20
riscv                 randconfig-001-20250912    gcc-15.1.0
riscv                 randconfig-002-20250911    clang-22
riscv                 randconfig-002-20250912    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250911    gcc-11.5.0
s390                  randconfig-001-20250912    gcc-15.1.0
s390                  randconfig-002-20250911    clang-16
s390                  randconfig-002-20250912    gcc-15.1.0
s390                       zfcpdump_defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250911    gcc-9.5.0
sh                    randconfig-001-20250912    gcc-15.1.0
sh                    randconfig-002-20250911    gcc-15.1.0
sh                    randconfig-002-20250912    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250911    gcc-15.1.0
sparc                 randconfig-001-20250912    gcc-15.1.0
sparc                 randconfig-002-20250911    gcc-15.1.0
sparc                 randconfig-002-20250912    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250911    gcc-8.5.0
sparc64               randconfig-001-20250912    gcc-15.1.0
sparc64               randconfig-002-20250911    clang-20
sparc64               randconfig-002-20250912    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250911    clang-22
um                    randconfig-001-20250912    gcc-15.1.0
um                    randconfig-002-20250911    gcc-14
um                    randconfig-002-20250912    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250911    gcc-14
x86_64      buildonly-randconfig-001-20250912    clang-20
x86_64      buildonly-randconfig-002-20250911    gcc-14
x86_64      buildonly-randconfig-002-20250912    clang-20
x86_64      buildonly-randconfig-003-20250911    clang-20
x86_64      buildonly-randconfig-003-20250912    clang-20
x86_64      buildonly-randconfig-004-20250911    clang-20
x86_64      buildonly-randconfig-004-20250912    clang-20
x86_64      buildonly-randconfig-005-20250911    clang-20
x86_64      buildonly-randconfig-005-20250912    clang-20
x86_64      buildonly-randconfig-006-20250911    gcc-14
x86_64      buildonly-randconfig-006-20250912    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250912    gcc-14
x86_64                randconfig-002-20250912    gcc-14
x86_64                randconfig-003-20250912    gcc-14
x86_64                randconfig-004-20250912    gcc-14
x86_64                randconfig-005-20250912    gcc-14
x86_64                randconfig-006-20250912    gcc-14
x86_64                randconfig-007-20250912    gcc-14
x86_64                randconfig-008-20250912    gcc-14
x86_64                randconfig-071-20250912    clang-20
x86_64                randconfig-072-20250912    clang-20
x86_64                randconfig-073-20250912    clang-20
x86_64                randconfig-074-20250912    clang-20
x86_64                randconfig-075-20250912    clang-20
x86_64                randconfig-076-20250912    clang-20
x86_64                randconfig-077-20250912    clang-20
x86_64                randconfig-078-20250912    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250911    gcc-12.5.0
xtensa                randconfig-001-20250912    gcc-15.1.0
xtensa                randconfig-002-20250911    gcc-8.5.0
xtensa                randconfig-002-20250912    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


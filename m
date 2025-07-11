Return-Path: <linux-media+bounces-37454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6530B0141F
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 09:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E2F43BFE73
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 07:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DAF51E47A8;
	Fri, 11 Jul 2025 07:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jn8wIjJ1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8280619AD89
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752217978; cv=none; b=Nykeye1sdfBeNfE1o6wWeSi3lDcpWhzdEMTgvIik9YO0MV5+2afCzZf6V9nflamE/ERBzHDTCcMzOkBkz9+BCrWCdnPgFWKszfT7hUnsU0OX+PRBjln9J6MNZEtJxVyN0y/c+Kf8sSLqiSpRX5d7AqFKwM9ka6ECLw57qXZ83dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752217978; c=relaxed/simple;
	bh=t9fO/UXfsGwT4ZQYr+CnvGgED+J0yNAgQOIcAaPvrQc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tiu/XkhVGB984Xw1fwbawND93ttdhOspjsa6f+XJ/NVJG+PnseTiv9pEyF8nrvPXtsMGiF3PwNvSA0tXh4POkpxZX90bJlfe7XIPh4bO7W5VnmIH2FZBCYNDdMvb5787e5ZIxKo95kuiu7S9OQV/7gFFiKx9yEGKBUCMFaTWIrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jn8wIjJ1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752217976; x=1783753976;
  h=date:from:to:cc:subject:message-id;
  bh=t9fO/UXfsGwT4ZQYr+CnvGgED+J0yNAgQOIcAaPvrQc=;
  b=Jn8wIjJ1J9+QioACG9Rg1QQ9F6tXlNq6GGUxTbzr3DO86TAZujplM9/C
   P/Evg8LXp/BsKRa7niFdkoIee7hwOvQsnkOuNjd9BH4R/AUjWcmLBcrNA
   ihccAm753nGF+cUEs6aJ4DLwTyI8ohwTOy4osyRxiUCe5MpdsAwIa4e0D
   1AEaOy5lijkWnJ0KVPTzfqIUos3VL/F0tOfmh9Ba6lEkLxVQxi+Ct2Jnf
   XlJ/8Mo1u/SPs3s6SDWPzWNAQxEPIeKtiAJJmq9ixx/G+sekEEUBXkKuO
   eDqyKxnMuxCZ+4xwYiJIlAECDJe9QTkOGBqjst1PC8ujCHF5jLFM91R+a
   w==;
X-CSE-ConnectionGUID: AH7xOMZHTk2DwVvhO58Fkg==
X-CSE-MsgGUID: 4SSuE40CRR2xQo1g0/t3AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54447625"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="54447625"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 00:12:56 -0700
X-CSE-ConnectionGUID: 7CscyIeYQKaRvDKSqdvh8w==
X-CSE-MsgGUID: 7EtIeUNMQ8Waqs3uvE6aVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="155706530"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jul 2025 00:12:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua7wC-00063X-0P;
	Fri, 11 Jul 2025 07:12:52 +0000
Date: Fri, 11 Jul 2025 15:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 2ad401b4493081d64975f2e00ef1850aa67434fa
Message-ID: <202507111516.jFrZSMBN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: 2ad401b4493081d64975f2e00ef1850aa67434fa  media: ivsc: Add MAINTAINERS entry

elapsed time: 1212m

configs tested: 122
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                   randconfig-001-20250710    gcc-15.1.0
arc                   randconfig-002-20250710    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250710    gcc-8.5.0
arm                   randconfig-002-20250710    clang-21
arm                   randconfig-003-20250710    clang-21
arm                   randconfig-004-20250710    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250710    clang-21
arm64                 randconfig-002-20250710    clang-21
arm64                 randconfig-003-20250710    gcc-8.5.0
arm64                 randconfig-004-20250710    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250710    gcc-15.1.0
csky                  randconfig-002-20250710    gcc-15.1.0
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250710    clang-21
hexagon               randconfig-002-20250710    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250710    gcc-12
i386        buildonly-randconfig-002-20250710    gcc-12
i386        buildonly-randconfig-003-20250710    clang-20
i386        buildonly-randconfig-004-20250710    gcc-11
i386        buildonly-randconfig-005-20250710    clang-20
i386        buildonly-randconfig-006-20250710    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250710    gcc-14.3.0
loongarch             randconfig-002-20250710    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250710    gcc-9.3.0
nios2                 randconfig-002-20250710    gcc-12.4.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                       virt_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250710    gcc-8.5.0
parisc                randconfig-002-20250710    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                     kmeter1_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250710    gcc-12.4.0
powerpc               randconfig-002-20250710    gcc-9.3.0
powerpc               randconfig-003-20250710    gcc-8.5.0
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250710    gcc-11.5.0
powerpc64             randconfig-002-20250710    clang-17
powerpc64             randconfig-003-20250710    gcc-14.3.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250710    gcc-15.1.0
riscv                 randconfig-002-20250710    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250710    gcc-14.3.0
s390                  randconfig-002-20250710    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250710    gcc-15.1.0
sh                    randconfig-002-20250710    gcc-13.4.0
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sh                           se7206_defconfig    gcc-15.1.0
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250710    gcc-13.4.0
sparc                 randconfig-002-20250710    gcc-14.3.0
sparc64               randconfig-001-20250710    gcc-8.5.0
sparc64               randconfig-002-20250710    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250710    gcc-11
um                    randconfig-002-20250710    clang-16
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250710    gcc-12
x86_64      buildonly-randconfig-002-20250710    gcc-12
x86_64      buildonly-randconfig-003-20250710    gcc-12
x86_64      buildonly-randconfig-004-20250710    clang-20
x86_64      buildonly-randconfig-005-20250710    clang-20
x86_64      buildonly-randconfig-006-20250710    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250710    gcc-12.4.0
xtensa                randconfig-002-20250710    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


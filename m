Return-Path: <linux-media+bounces-28531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E23A6A4ED
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 12:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CF507A4483
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 11:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9027421CC40;
	Thu, 20 Mar 2025 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bd18i8A5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602C179C4
	for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 11:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742470060; cv=none; b=EJ2h0tf8pLA5WxnLJoaZEPBjOHfaZU/wTQvWDlUVEOB1URHieDbmouw21Dtwjc+hv/Zny7a2DZdzvarUZHx/pDz13ZA05QgU+N3yVHWTloxR2gaJq8lmKkqcaG5qZFwZT++ao39mhYlh6WBGqwn+1yltPEouUM6rEdcIzNN1pGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742470060; c=relaxed/simple;
	bh=RmJbITof6fuca+NjCHkifcqotx59oyrgXYxQ2ykPzeA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=okMEGtfmqQrMrLq2ihllUhMud3vEXHpbv/NfGmDiwrDhy97ayTVBwfEHN/ysCtZyOSP1lnYbwLs9Oj8gP9zFK0CLQ+wlt/rVkG8FzFZDjIdLkTWwuRpphDiHWLm6eIdR1IswQIWKf1eoE4eYPINlHZSIQEZmgiOoHX39/BMUEF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bd18i8A5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742470057; x=1774006057;
  h=date:from:to:cc:subject:message-id;
  bh=RmJbITof6fuca+NjCHkifcqotx59oyrgXYxQ2ykPzeA=;
  b=Bd18i8A5mfWPMe1urRN2hwHuAxP8NNmO+kiI4OI7mM/wSUiYEG9atDv2
   L5pN9+JZADpsc+Zln+xH3WCsO84i5RELYyl6t6gjK6H9M9htIxXHgxxnP
   4g+4h3qa6jT0lVYRkfvKcLqPT9zlSdFM2xON8dZ+oNH+Y/Mwbd870rEUG
   5WkzbNVIM16BT+VxR4BctNL9w82pDO2BAJqOStk85hfdbh93mpAKVkQ6n
   +tiYgtyP0pIY4e3xRy5YsZBTgcPfCQb19dR3iRi9L3QgBZhl03Dlv1JON
   KWqiPeC3XXeUGI7zbS6PgEP6O0g1pER+1MTToh8QetemCta+GDAHp5Rhb
   A==;
X-CSE-ConnectionGUID: O96AtKVkQHCj7p6sbI1Dgw==
X-CSE-MsgGUID: /5/cwNAWQpaRzUa7ov4roA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="31280919"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="31280919"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 04:27:36 -0700
X-CSE-ConnectionGUID: Be0kkvL3Ta2AZBKhhzU8/Q==
X-CSE-MsgGUID: ZneUZFpxQnyTHFJkGX4OBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="154063671"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 Mar 2025 04:27:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvE3h-0000OZ-27;
	Thu, 20 Mar 2025 11:27:33 +0000
Date: Thu, 20 Mar 2025 19:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 90f9ede8f2b31b0e4100cdef8a7e772c17e5797e
Message-ID: <202503201910.YxsG0qO4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 90f9ede8f2b31b0e4100cdef8a7e772c17e5797e  media: i2c: lt6911uxe: add two selects to Kconfig

elapsed time: 1452m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-9.3.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250319    gcc-14.2.0
arc                   randconfig-002-20250319    gcc-14.2.0
arm                              allmodconfig    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-6.5.0
arm                         assabet_defconfig    clang-18
arm                   randconfig-001-20250319    clang-18
arm                   randconfig-002-20250319    clang-21
arm                   randconfig-003-20250319    clang-20
arm                   randconfig-004-20250319    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250319    gcc-7.5.0
arm64                 randconfig-002-20250319    gcc-7.5.0
arm64                 randconfig-003-20250319    gcc-7.5.0
arm64                 randconfig-004-20250319    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250319    gcc-9.3.0
csky                  randconfig-002-20250319    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250319    clang-21
hexagon               randconfig-002-20250319    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250319    gcc-12
i386        buildonly-randconfig-002-20250319    gcc-12
i386        buildonly-randconfig-003-20250319    gcc-12
i386        buildonly-randconfig-004-20250319    clang-20
i386        buildonly-randconfig-005-20250319    gcc-12
i386        buildonly-randconfig-006-20250319    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-12.4.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250319    gcc-14.2.0
loongarch             randconfig-002-20250319    gcc-14.2.0
m68k                             allmodconfig    gcc-8.5.0
m68k                              allnoconfig    gcc-5.5.0
m68k                             allyesconfig    gcc-6.5.0
microblaze                       allmodconfig    gcc-9.3.0
microblaze                        allnoconfig    gcc-11.5.0
microblaze                       allyesconfig    gcc-9.3.0
mips                              allnoconfig    gcc-10.5.0
nios2                             allnoconfig    gcc-8.5.0
nios2                 randconfig-001-20250319    gcc-11.5.0
nios2                 randconfig-002-20250319    gcc-5.5.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-10.5.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250319    gcc-10.5.0
parisc                randconfig-002-20250319    gcc-10.5.0
powerpc                          allmodconfig    gcc-5.5.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250319    gcc-9.3.0
powerpc               randconfig-002-20250319    clang-21
powerpc               randconfig-003-20250319    clang-21
powerpc64             randconfig-001-20250319    clang-20
powerpc64             randconfig-002-20250319    gcc-5.5.0
powerpc64             randconfig-003-20250319    clang-21
riscv                            allmodconfig    clang-21
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250319    clang-20
riscv                 randconfig-002-20250319    clang-17
s390                             allmodconfig    clang-18
s390                             allyesconfig    gcc-8.5.0
s390                  randconfig-001-20250319    gcc-6.5.0
s390                  randconfig-002-20250319    gcc-8.5.0
sh                               allmodconfig    gcc-9.3.0
sh                                allnoconfig    gcc-10.5.0
sh                               allyesconfig    gcc-7.5.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250319    gcc-11.5.0
sh                    randconfig-002-20250319    gcc-5.5.0
sparc                            allmodconfig    gcc-6.5.0
sparc                             allnoconfig    gcc-6.5.0
sparc                 randconfig-001-20250319    gcc-6.5.0
sparc                 randconfig-002-20250319    gcc-8.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250319    gcc-8.5.0
sparc64               randconfig-002-20250319    gcc-6.5.0
um                               allmodconfig    clang-19
um                               allyesconfig    gcc-12
um                    randconfig-001-20250319    gcc-12
um                    randconfig-002-20250319    gcc-11
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250319    clang-20
x86_64      buildonly-randconfig-002-20250319    clang-20
x86_64      buildonly-randconfig-003-20250319    gcc-12
x86_64      buildonly-randconfig-004-20250319    gcc-11
x86_64      buildonly-randconfig-005-20250319    clang-20
x86_64      buildonly-randconfig-006-20250319    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250319    gcc-10.5.0
xtensa                randconfig-002-20250319    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


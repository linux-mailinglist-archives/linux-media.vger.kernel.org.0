Return-Path: <linux-media+bounces-45566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D944C0A4E2
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 09:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BCFE634AB88
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 08:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073B1285CAD;
	Sun, 26 Oct 2025 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFxsWJuO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D926256C84
	for <linux-media@vger.kernel.org>; Sun, 26 Oct 2025 08:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761468695; cv=none; b=N4opuaYRGF4ST+edRxmbg+HeQeIbvdEp8IZL6qLXe48llzvutXjEmRvRJiJgbHGdkx4BdJyIGiHYFbqHbjam/yYkCyR4Id9q7Q7o7G4ax/fcj3Ho8G3yQpPs8I1fI3Mw9J7DBoPuzsPLGDeExwXwTx25b+6QRL/6P0DMtqH0M1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761468695; c=relaxed/simple;
	bh=SJk3+ksOHX5qVwtgeF5uEy7rf4ncJ8OahR57YlQiP3w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DmkLUO6Lir3w4C0zhlHANyaJbthy44U5RzJxqkrSRDO5q5YmlfhuSzOlMKiDlqKfMWBVNWxxNbQKS5TsGyYLTFSPGTIo/m+rzzC8oy1JGx+AvRUtcbF/SuxL1ytVcgyK6YrvvThwHkKHuXuW9nuN19GSR6skkmjmaPxaNDYHMGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFxsWJuO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761468694; x=1793004694;
  h=date:from:to:cc:subject:message-id;
  bh=SJk3+ksOHX5qVwtgeF5uEy7rf4ncJ8OahR57YlQiP3w=;
  b=bFxsWJuOgrht+XxKOmTBFyCKNDizlvOAPRrHzxjzyRi3QikVaJrV+1MC
   KswqFwQQLXusJYWJCL3/XmMNF9IrY7WOetQJv2+pmkhcmdrktvruTmtCu
   A5rDNTgC8gh2bPhqx8Bjo/bs3sP1BVh1qXiinTHT6wjuBPjBEAv3pI5HJ
   WWh/5zzvbOGin9eUETXGSRHTbhcmK/kYdbm7W8EQe3o1MUXg4FJFCsUVe
   ho9yTnW5+AYYOfw15vsxLreVewDL9w28Nl6dGSKkKLGTJdaGMACO1dM+j
   ry2EG8cTppVcWYjGqV9gN5tu7pAWjqBPDA+GHuRHLieqJ9XvFk3MfPVVF
   Q==;
X-CSE-ConnectionGUID: 7aMNiZS7SVWANPqYbCjg1Q==
X-CSE-MsgGUID: 43dty4SNSCWwBFB+0nw+mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63281171"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="63281171"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 01:51:34 -0700
X-CSE-ConnectionGUID: XD41CE4nQhKG3yMMVFq3mg==
X-CSE-MsgGUID: qGCOnXz5QK2v35+E+hoG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="189094013"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Oct 2025 01:51:32 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCwTF-000Fzt-0O;
	Sun, 26 Oct 2025 08:51:26 +0000
Date: Sun, 26 Oct 2025 16:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 f31234a3c645cae59dd05a1d388230ab54c791ae
Message-ID: <202510261611.SbqjNgmc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: f31234a3c645cae59dd05a1d388230ab54c791ae  media: ov02c10: Support hflip and vflip

elapsed time: 727m

configs tested: 133
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251026    gcc-13.4.0
arc                   randconfig-002-20251026    gcc-9.5.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                           h3600_defconfig    gcc-15.1.0
arm                        multi_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20251026    clang-22
arm                   randconfig-002-20251026    clang-20
arm                   randconfig-003-20251026    clang-17
arm                   randconfig-004-20251026    clang-20
arm                        vexpress_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251026    gcc-15.1.0
arm64                 randconfig-002-20251026    clang-22
arm64                 randconfig-003-20251026    gcc-8.5.0
arm64                 randconfig-004-20251026    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251026    gcc-15.1.0
csky                  randconfig-002-20251026    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251026    clang-18
hexagon               randconfig-002-20251026    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251026    gcc-14
i386        buildonly-randconfig-002-20251026    clang-20
i386        buildonly-randconfig-003-20251026    gcc-14
i386        buildonly-randconfig-004-20251026    clang-20
i386        buildonly-randconfig-005-20251026    clang-20
i386        buildonly-randconfig-006-20251026    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251026    clang-22
loongarch             randconfig-002-20251026    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        maltaup_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251026    gcc-8.5.0
nios2                 randconfig-002-20251026    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251026    gcc-12.5.0
parisc                randconfig-002-20251026    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251026    gcc-13.4.0
powerpc               randconfig-002-20251026    gcc-8.5.0
powerpc               randconfig-003-20251026    gcc-10.5.0
powerpc64             randconfig-001-20251026    gcc-10.5.0
powerpc64             randconfig-002-20251026    gcc-12.5.0
powerpc64             randconfig-003-20251026    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251026    gcc-15.1.0
riscv                 randconfig-002-20251026    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-002-20251026    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251026    gcc-15.1.0
sh                    randconfig-002-20251026    gcc-15.1.0
sh                           se7750_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251026    gcc-12.5.0
sparc                 randconfig-002-20251026    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251026    gcc-8.5.0
sparc64               randconfig-002-20251026    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251026    clang-22
um                    randconfig-002-20251026    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251026    clang-20
x86_64      buildonly-randconfig-002-20251026    gcc-12
x86_64      buildonly-randconfig-003-20251026    gcc-14
x86_64      buildonly-randconfig-004-20251026    gcc-14
x86_64      buildonly-randconfig-005-20251026    clang-20
x86_64      buildonly-randconfig-006-20251026    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-002-20251026    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


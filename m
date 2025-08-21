Return-Path: <linux-media+bounces-40654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D17B302AA
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 21:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8AC5AE10F4
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 19:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D46B3469EE;
	Thu, 21 Aug 2025 19:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBbHC9/o"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF096BFCE
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 19:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755803472; cv=none; b=deZVATehnyhLHXBKLqfZOP8URhJ4e2aU287obFz+UlZl1KO6BT4fiSVsP4wrvsP3mP00Knhxi3Ig0Hvp54Zovq7g1j4ixuOEEDb/G8TPdmfzKFWfongSGIPbkYXuLOdxikw53MacLck41fAxx6uwqSFdjZl6rnAOWSg7Jl6guik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755803472; c=relaxed/simple;
	bh=qAEPKohd3RF8zHAJ90wMVIHJFN75qLAHkzJ3xl0mo7o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TK2XaZudB1E/fHJosrgoBK+j+tGO0GkuG3oJbrJKkLJpEBrFd4nRXxLpw51QBFWuyaYO8Qlf2K9/l4/WCpT2zVuPP4+M20c9h/TNbKIZnzSsnxOey4hTZnpawuyc0HrnRB+RQb+sk2Qj6r562+xIIf9to+i94YLw0aTbYCoju/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBbHC9/o; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755803471; x=1787339471;
  h=date:from:to:cc:subject:message-id;
  bh=qAEPKohd3RF8zHAJ90wMVIHJFN75qLAHkzJ3xl0mo7o=;
  b=iBbHC9/oyzQ0qtwAmaUZv2QCUg7dX7nlz8GPD2kPT4LBu66c3uP30cx3
   oo27tUgjILjSKo9IeI23YwBwfnvr7VMZPoLrNoHfk/IbhtyGYeij8uu44
   L+jWd1juNXFSiSfijhMrCXH40/tUxWEMGhgUZV9f2ysUBQ/X+KCBTOZen
   +gaY4bPaIrQAofTMVCWWAkMwZZBpIJrvrzJp9Qk9hB0xUhtbeT7V+lzx8
   75SJGYsD0/9cwJgqIEuINA3rkcv2aZh4omTLsiSVe69h2BqqDuBukwgzP
   5pf1ED8Bs5NQlYjOAS1hmFS4xraZxf/mk/pnF+GN3eR5Is21UdO3utiZ9
   w==;
X-CSE-ConnectionGUID: Qw+IbCWEQg+h6HZJsrZzfw==
X-CSE-MsgGUID: qo7Qt4CyQHqtUDUydoR3bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57815977"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57815977"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 12:11:10 -0700
X-CSE-ConnectionGUID: e7NQPVLIR72L82NqegZ4tQ==
X-CSE-MsgGUID: XaBRbWOnRuOLPx9RBIkFFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168909961"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Aug 2025 12:11:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upAgl-000KbW-0a;
	Thu, 21 Aug 2025 19:11:07 +0000
Date: Fri, 22 Aug 2025 03:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:eusb2] BUILD SUCCESS
 212a3aef36084c34cb46b3fea89711f7952213eb
Message-ID: <202508220326.VqubwXTX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git eusb2
branch HEAD: 212a3aef36084c34cb46b3fea89711f7952213eb  media: uvcvideo: eUSB2 double isochronous bandwidth support

elapsed time: 1450m

configs tested: 110
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250821    gcc-9.5.0
arc                   randconfig-002-20250821    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                         mv78xx0_defconfig    clang-19
arm                   randconfig-001-20250821    gcc-13.4.0
arm                   randconfig-002-20250821    clang-22
arm                   randconfig-003-20250821    clang-22
arm                   randconfig-004-20250821    clang-22
arm                          sp7021_defconfig    gcc-15.1.0
arm                       versatile_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250821    clang-22
arm64                 randconfig-002-20250821    clang-22
arm64                 randconfig-003-20250821    gcc-11.5.0
arm64                 randconfig-004-20250821    gcc-13.4.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250821    gcc-13.4.0
csky                  randconfig-002-20250821    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250821    clang-20
hexagon               randconfig-002-20250821    clang-22
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250821    gcc-12
i386        buildonly-randconfig-002-20250821    gcc-12
i386        buildonly-randconfig-003-20250821    clang-20
i386        buildonly-randconfig-004-20250821    gcc-12
i386        buildonly-randconfig-005-20250821    gcc-12
i386        buildonly-randconfig-006-20250821    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250821    gcc-14.3.0
loongarch             randconfig-002-20250821    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        qi_lb60_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250821    gcc-9.5.0
nios2                 randconfig-002-20250821    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250821    gcc-12.5.0
parisc                randconfig-002-20250821    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250821    clang-17
powerpc               randconfig-002-20250821    clang-22
powerpc               randconfig-003-20250821    gcc-9.5.0
powerpc64             randconfig-002-20250821    clang-22
powerpc64             randconfig-003-20250821    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250821    clang-17
riscv                 randconfig-002-20250821    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250821    gcc-14.3.0
s390                  randconfig-002-20250821    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250821    gcc-15.1.0
sh                    randconfig-002-20250821    gcc-13.4.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250821    gcc-14.3.0
sparc                 randconfig-002-20250821    gcc-15.1.0
sparc64               randconfig-001-20250821    gcc-8.5.0
sparc64               randconfig-002-20250821    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250821    clang-19
um                    randconfig-002-20250821    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250821    clang-20
x86_64      buildonly-randconfig-002-20250821    clang-20
x86_64      buildonly-randconfig-003-20250821    clang-20
x86_64      buildonly-randconfig-004-20250821    gcc-12
x86_64      buildonly-randconfig-005-20250821    clang-20
x86_64      buildonly-randconfig-006-20250821    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250821    gcc-11.5.0
xtensa                randconfig-002-20250821    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


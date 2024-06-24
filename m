Return-Path: <linux-media+bounces-14031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F149146B9
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E8B31F2471F
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E71E13247D;
	Mon, 24 Jun 2024 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUKlKXvY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEBE18E29
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719222831; cv=none; b=mOUHq2GMkFMiw6BnBdw9pPOHe+ZEnqzEw+Cb44N8q0DhKbbi6IM3h3Hg88qW5tNjD34V2dj1uNPHOs2g3YQIIUSZ8REM+XKmoDV/+hRGPnpT7rbpGbmumpPZMot1pxhtYTqviRxu8m4/VmGMklRBKL8tdyAU3/BV7j633XDmZi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719222831; c=relaxed/simple;
	bh=7fZgtzBeRSr0HRJCazoFR1DwQVt6mEBQMsa8qhgcO/8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nuECaX8mb6CG27IfoPkoAUsqFkNt4FgZt5IqGHIpxL3jyDaA5DOfF/ZzB2sbzu022psJ8xqm7P9krsPE90Y0Wv+9FSwPgdhUOhJVZqsKQCdodxjmO9uE6XF+yAzqjFo46f+YJzKPRaxNKOxHaGj7PPA8fB9CmSkmTnlLnk03vCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUKlKXvY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719222830; x=1750758830;
  h=date:from:to:cc:subject:message-id;
  bh=7fZgtzBeRSr0HRJCazoFR1DwQVt6mEBQMsa8qhgcO/8=;
  b=NUKlKXvY5zRwzZt55yBhjn9VePl5fL6+FVTNldPwIuUWbgEOGFnee8cF
   2es6EaeSmLQmG7JTJainEEypUnbxJXy1Pk73ermkXs57Bn5ky3R2yMAkY
   tmE/ne7UuHBDwQ/e8EZQ6xpxMAn3rqpa977s6RY7PEUANT7k3U7jE7OcO
   leTIsJb3SwPf6EeMElS+5EfIrKlOTA7np/knTCbipECQHRboXg/klluAy
   9/wgKjjm5fI3wnYLS/S6V0SnnlNB9n3Gn3CumiE6kPEZokLNXdBYVa5Zy
   gXZL/XIt9JmE5hmxkE/a6dyXQkfZAFHxjRyw2HFsxc/WSbf59fmvTysHU
   A==;
X-CSE-ConnectionGUID: n9oECVM4SWOKYKDqpP/2qQ==
X-CSE-MsgGUID: AgqggznoT9SE/uz5i8Wudw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15874405"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="15874405"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 02:53:49 -0700
X-CSE-ConnectionGUID: HGyD0nyGS/uHoj8Bgb9uTw==
X-CSE-MsgGUID: J5yNVx7hRtaryWZ+lAFwUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43688696"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jun 2024 02:53:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLgOP-000CYq-1T;
	Mon, 24 Jun 2024 09:53:45 +0000
Date: Mon, 24 Jun 2024 17:53:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 25698102a2785b65aebf74b227c31e6f9825655d
Message-ID: <202406241736.wRX0jqRR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 25698102a2785b65aebf74b227c31e6f9825655d  MAINTAINERS: delete email for Anton Sviridenko

elapsed time: 1469m

configs tested: 119
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240623   gcc-13.2.0
arc                   randconfig-002-20240623   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                                 defconfig   clang-14
arm                   randconfig-001-20240623   gcc-13.2.0
arm                   randconfig-002-20240623   gcc-13.2.0
arm                   randconfig-003-20240623   gcc-13.2.0
arm                   randconfig-004-20240623   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240623   clang-15
arm64                 randconfig-002-20240623   clang-19
arm64                 randconfig-003-20240623   clang-19
arm64                 randconfig-004-20240623   clang-19
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240623   gcc-13.2.0
csky                  randconfig-002-20240623   gcc-13.2.0
hexagon                           allnoconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240623   clang-19
hexagon               randconfig-002-20240623   clang-19
i386         buildonly-randconfig-001-20240623   clang-18
i386         buildonly-randconfig-002-20240623   clang-18
i386         buildonly-randconfig-003-20240623   clang-18
i386         buildonly-randconfig-004-20240623   gcc-13
i386         buildonly-randconfig-005-20240623   clang-18
i386         buildonly-randconfig-006-20240623   clang-18
i386                  randconfig-001-20240623   gcc-9
i386                  randconfig-002-20240623   clang-18
i386                  randconfig-003-20240623   gcc-13
i386                  randconfig-004-20240623   clang-18
i386                  randconfig-005-20240623   gcc-7
i386                  randconfig-006-20240623   clang-18
i386                  randconfig-011-20240623   clang-18
i386                  randconfig-012-20240623   gcc-8
i386                  randconfig-013-20240623   clang-18
i386                  randconfig-014-20240623   clang-18
i386                  randconfig-015-20240623   gcc-8
i386                  randconfig-016-20240623   clang-18
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240623   gcc-13.2.0
loongarch             randconfig-002-20240623   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240623   gcc-13.2.0
nios2                 randconfig-002-20240623   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240623   gcc-13.2.0
parisc                randconfig-002-20240623   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240623   gcc-13.2.0
powerpc               randconfig-002-20240623   clang-15
powerpc               randconfig-003-20240623   clang-19
powerpc64             randconfig-001-20240623   gcc-13.2.0
powerpc64             randconfig-002-20240623   clang-19
powerpc64             randconfig-003-20240623   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240623   clang-19
riscv                 randconfig-002-20240623   clang-19
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240623   gcc-13.2.0
s390                  randconfig-002-20240623   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240623   gcc-13.2.0
sh                    randconfig-002-20240623   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240623   gcc-13.2.0
sparc64               randconfig-002-20240623   gcc-13.2.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240623   gcc-7
um                    randconfig-002-20240623   clang-19
um                           x86_64_defconfig   clang-15
x86_64       buildonly-randconfig-001-20240623   clang-18
x86_64       buildonly-randconfig-002-20240623   clang-18
x86_64       buildonly-randconfig-003-20240623   clang-18
x86_64       buildonly-randconfig-004-20240623   clang-18
x86_64       buildonly-randconfig-005-20240623   clang-18
x86_64       buildonly-randconfig-006-20240623   clang-18
x86_64                randconfig-001-20240623   gcc-13
x86_64                randconfig-002-20240623   gcc-13
x86_64                randconfig-003-20240623   clang-18
x86_64                randconfig-004-20240623   gcc-13
x86_64                randconfig-005-20240623   gcc-8
x86_64                randconfig-006-20240623   clang-18
x86_64                randconfig-011-20240623   clang-18
x86_64                randconfig-012-20240623   gcc-13
x86_64                randconfig-013-20240623   clang-18
x86_64                randconfig-014-20240623   clang-18
x86_64                randconfig-015-20240623   gcc-13
x86_64                randconfig-016-20240623   clang-18
x86_64                randconfig-071-20240623   gcc-13
x86_64                randconfig-072-20240623   gcc-13
x86_64                randconfig-073-20240623   clang-18
x86_64                randconfig-074-20240623   clang-18
x86_64                randconfig-075-20240623   gcc-13
x86_64                randconfig-076-20240623   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240623   gcc-13.2.0
xtensa                randconfig-002-20240623   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


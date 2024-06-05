Return-Path: <linux-media+bounces-12584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BDC8FCA65
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 13:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69BF0B21C3E
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 11:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7EC192B98;
	Wed,  5 Jun 2024 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jz2e2a0S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B18A8F6A
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 11:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717586796; cv=none; b=Wtagz7JjcgQ6YgvlIyQwlyaVBOR2eaXJoXUS7lY7mheWSkLN9UUq35hg6pemPldhdG6m3DK89SMvUoAoR399xhPd8+oiE1JZNwWWLB3OJDXPLraddtILDdZCRpIkKA0/vYtmjQUWgVatyLpiLPnfJG7K19+NARmq9sw9RCu0BZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717586796; c=relaxed/simple;
	bh=GWzrW3wten3elmyE8eG+xa0Je6gu04Pb2LtllLroCI0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cgfcJYsTnqzUyKkmZ+yMn73nkJuapzVs5LC58aThk8LCTPJ4ZYWez6CncnUlYQcX2iZj6Isz/X0NYfbumSZy4ZS0IdNCcKlDYbfNicVFNhM9p8ZOnghusWzkYEocOb3sLaD1xYicifXAAnP4cdcsZXfG+h8fby75kGRGenJfqds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jz2e2a0S; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717586796; x=1749122796;
  h=date:from:to:cc:subject:message-id;
  bh=GWzrW3wten3elmyE8eG+xa0Je6gu04Pb2LtllLroCI0=;
  b=jz2e2a0SYU9L8+cuCS170JvKue+pG39LKaq6Yc0O1QcEzRWnX5MrcWnm
   G/wA9j7xMchT9HCSWJt7Pkud7VeQPS4lKjz/IeK/TodQ2l5lFn+k/oMPc
   6BW1IuOwNrSFlucaK4tD2arzHbQxAjHMBuZHrZBKsCQH58bpfEjiZX51V
   VeVUAq0ouhBq3LQUsBH49L339aMDrx9dq7WEsX0zjQ2nuJ4KqN0nK2hmS
   6BuXaPps3mrpIOpdhQ+vcQpVUbvJjceerMMyuUssIWSQ751bDOl6gFZ0I
   jS2nQFxQDb2YSppLSa7k6/47KXRNwEIDZLYstG2hUEkPa3he4LQby7V9j
   g==;
X-CSE-ConnectionGUID: j4pNlyHYSg+h/MVg/DsOcg==
X-CSE-MsgGUID: qRlsGnPXSjC3oPHagSEl7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="25595378"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="25595378"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 04:26:35 -0700
X-CSE-ConnectionGUID: 8GauirotRnaDYmnavT259Q==
X-CSE-MsgGUID: rUXzf842QuKzVerkKkkpOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="68383432"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Jun 2024 04:26:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEoml-0001RY-0k;
	Wed, 05 Jun 2024 11:26:31 +0000
Date: Wed, 05 Jun 2024 19:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref] BUILD SUCCESS
 f31af465888a80c3334a9b3558b746f0d827cb3f
Message-ID: <202406051926.LajNyaMh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git media-ref
branch HEAD: f31af465888a80c3334a9b3558b746f0d827cb3f  media: Documentation: Document media device memory safety helper

elapsed time: 1505m

configs tested: 165
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240605   gcc  
arc                   randconfig-002-20240605   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           omap1_defconfig   gcc  
arm                   randconfig-004-20240605   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240605   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240605   gcc  
csky                  randconfig-002-20240605   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240604   gcc  
i386         buildonly-randconfig-002-20240604   clang
i386         buildonly-randconfig-003-20240604   clang
i386         buildonly-randconfig-004-20240604   gcc  
i386         buildonly-randconfig-005-20240604   clang
i386         buildonly-randconfig-006-20240604   clang
i386                                defconfig   clang
i386                  randconfig-001-20240604   clang
i386                  randconfig-002-20240604   clang
i386                  randconfig-003-20240604   clang
i386                  randconfig-004-20240604   clang
i386                  randconfig-005-20240604   gcc  
i386                  randconfig-006-20240604   gcc  
i386                  randconfig-011-20240604   clang
i386                  randconfig-012-20240604   gcc  
i386                  randconfig-013-20240604   gcc  
i386                  randconfig-014-20240604   clang
i386                  randconfig-015-20240604   clang
i386                  randconfig-016-20240604   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240605   gcc  
loongarch             randconfig-002-20240605   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240605   gcc  
nios2                 randconfig-002-20240605   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240605   gcc  
parisc                randconfig-002-20240605   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc               randconfig-001-20240605   gcc  
powerpc               randconfig-002-20240605   gcc  
powerpc               randconfig-003-20240605   gcc  
powerpc64             randconfig-001-20240605   gcc  
powerpc64             randconfig-003-20240605   gcc  
riscv                            alldefconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240605   gcc  
riscv                 randconfig-002-20240605   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240605   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240605   gcc  
sh                    randconfig-002-20240605   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240605   gcc  
sparc64               randconfig-002-20240605   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240605   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240605   gcc  
x86_64       buildonly-randconfig-002-20240605   gcc  
x86_64       buildonly-randconfig-003-20240605   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-003-20240605   gcc  
x86_64                randconfig-006-20240605   gcc  
x86_64                randconfig-012-20240605   gcc  
x86_64                randconfig-014-20240605   gcc  
x86_64                randconfig-016-20240605   gcc  
x86_64                randconfig-071-20240605   gcc  
x86_64                randconfig-073-20240605   gcc  
x86_64                randconfig-074-20240605   gcc  
x86_64                randconfig-075-20240605   gcc  
x86_64                randconfig-076-20240605   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240605   gcc  
xtensa                randconfig-002-20240605   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


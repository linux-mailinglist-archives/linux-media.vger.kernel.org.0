Return-Path: <linux-media+bounces-5060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D06852D56
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 11:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC0EC1F26B84
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 10:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5EF225A6;
	Tue, 13 Feb 2024 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlDgSGdc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF47D381A1
	for <linux-media@vger.kernel.org>; Tue, 13 Feb 2024 09:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707818388; cv=none; b=PAq9C34zra29xXYjkM34bkrWM2Zy1jpvw8qCsB9uUT7y5leO7kJWIVfLutsS+5EJLDTvkwseYoMyBqvLt0MwRYRFwof/g3rwZHhA13w9m75l90YCgXYbjuUZAWyem3jZVK9JHhYCvCwL/sBGTanbDAin2F3RpO4vf7cZdq3WFQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707818388; c=relaxed/simple;
	bh=tb3tWbOJWPcOL+tXuRLR7Xhj0yw6HagUE+i79Dx2bGU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I+6PsfqhLxkok3KS/cJhYUaRVLqkZn9XxeATfIQzA3uT+2x3MIy7TlECbd6kujuv95ro7YmhZ2wRaDKOOG0/qskzokPp6JH10IrEmwS7qG7VcuxCvyE/mLnn5pUuZeqX9JwzENnH8XuHvIlcI/40sN1ZojWfkr4xnbq+hSevlzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlDgSGdc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707818387; x=1739354387;
  h=date:from:to:cc:subject:message-id;
  bh=tb3tWbOJWPcOL+tXuRLR7Xhj0yw6HagUE+i79Dx2bGU=;
  b=dlDgSGdc0P8sncLVCwjvVy7UlqFURWNnj5ZAUP53D0gWmDm6zx1K8FBZ
   v3FkRph/52MO9M2UIEyqa/f4lY6nHXupR7/IDWcT581MHBQ62ZtSPsArG
   rS4KkYrksbR5D/CSstzZoy//Xdqyc5l8KQbcWt3sZ+mFWOYfkmsbLORe7
   zsMkecJvGliUik2HjVOBtqdX759Mp/GVHrCiJrrdSYldJLjXcyCgzS5m9
   52gv1qjse61IlIDltolDnQvZII2LaPuSeVJEuf1R37mWn521iTnl0Gh3R
   FqWUuQuqi3lgDjH1h1c/Xs9CRj9Y6wrOovMycuxrOJJPxGNf0uMiJl+Ui
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1957782"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1957782"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 01:59:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="3196800"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Feb 2024 01:59:45 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZpZm-0007eI-2y;
	Tue, 13 Feb 2024 09:59:42 +0000
Date: Tue, 13 Feb 2024 17:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6] BUILD SUCCESS
 3ea9c93895598423edb49a9a2784278742b8af58
Message-ID: <202402131737.gx8M3uJr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6
branch HEAD: 3ea9c93895598423edb49a9a2784278742b8af58  media: ivsc: csi: Swap SINK and SOURCE pads

elapsed time: 1456m

configs tested: 176
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
arc                                 defconfig   gcc  
arc                   randconfig-001-20240212   gcc  
arc                   randconfig-002-20240212   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          moxart_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                   randconfig-001-20240212   gcc  
arm                   randconfig-002-20240212   clang
arm                   randconfig-003-20240212   clang
arm                   randconfig-004-20240212   clang
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240212   clang
arm64                 randconfig-002-20240212   clang
arm64                 randconfig-003-20240212   clang
arm64                 randconfig-004-20240212   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240212   gcc  
csky                  randconfig-002-20240212   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240212   clang
hexagon               randconfig-002-20240212   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240212   clang
i386         buildonly-randconfig-002-20240212   gcc  
i386         buildonly-randconfig-003-20240212   gcc  
i386         buildonly-randconfig-004-20240212   clang
i386         buildonly-randconfig-005-20240212   gcc  
i386         buildonly-randconfig-006-20240212   clang
i386                                defconfig   clang
i386                  randconfig-001-20240212   gcc  
i386                  randconfig-002-20240212   clang
i386                  randconfig-003-20240212   clang
i386                  randconfig-004-20240212   gcc  
i386                  randconfig-005-20240212   clang
i386                  randconfig-006-20240212   gcc  
i386                  randconfig-011-20240212   gcc  
i386                  randconfig-012-20240212   gcc  
i386                  randconfig-013-20240212   gcc  
i386                  randconfig-014-20240212   gcc  
i386                  randconfig-015-20240212   gcc  
i386                  randconfig-016-20240212   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20240212   gcc  
loongarch             randconfig-002-20240212   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   clang
mips                       bmips_be_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240212   gcc  
nios2                 randconfig-002-20240212   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240212   gcc  
parisc                randconfig-002-20240212   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       ppc64_defconfig   clang
powerpc               randconfig-001-20240212   clang
powerpc               randconfig-002-20240212   gcc  
powerpc               randconfig-003-20240212   clang
powerpc64             randconfig-001-20240212   clang
powerpc64             randconfig-002-20240212   gcc  
powerpc64             randconfig-003-20240212   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240212   gcc  
riscv                 randconfig-002-20240212   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240212   clang
s390                  randconfig-002-20240212   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                    randconfig-001-20240212   gcc  
sh                    randconfig-002-20240212   gcc  
sh                          rsk7264_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240212   gcc  
sparc64               randconfig-002-20240212   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240212   clang
um                    randconfig-002-20240212   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240212   clang
x86_64       buildonly-randconfig-002-20240212   clang
x86_64       buildonly-randconfig-003-20240212   clang
x86_64       buildonly-randconfig-004-20240212   clang
x86_64       buildonly-randconfig-005-20240212   clang
x86_64       buildonly-randconfig-006-20240212   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240212   gcc  
x86_64                randconfig-002-20240212   gcc  
x86_64                randconfig-003-20240212   gcc  
x86_64                randconfig-004-20240212   gcc  
x86_64                randconfig-005-20240212   gcc  
x86_64                randconfig-006-20240212   gcc  
x86_64                randconfig-011-20240212   gcc  
x86_64                randconfig-012-20240212   gcc  
x86_64                randconfig-013-20240212   clang
x86_64                randconfig-014-20240212   gcc  
x86_64                randconfig-015-20240212   gcc  
x86_64                randconfig-016-20240212   clang
x86_64                randconfig-071-20240212   gcc  
x86_64                randconfig-072-20240212   gcc  
x86_64                randconfig-073-20240212   clang
x86_64                randconfig-074-20240212   gcc  
x86_64                randconfig-075-20240212   gcc  
x86_64                randconfig-076-20240212   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240212   gcc  
xtensa                randconfig-002-20240212   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


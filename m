Return-Path: <linux-media+bounces-37518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CDCB01F60
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 16:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56C2D1C42BA1
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 14:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262B12D0C6B;
	Fri, 11 Jul 2025 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeWHdw+3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B2E6ADD
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752245085; cv=none; b=GHR70h/xadq4SKwLlFFvAUy3iub6P9VRaSn5USVHb+RmRUEGVURjxg+VZNyHpfJXZSMZV4ERu6fpWR6/5xt+ySRQY2XddZQz7rpfBmmuiayIFpxVdj4t6V73yTxhSWiXgwNEgM597rn2wgiJa8+jBgXJWV+hsALtYkIIMERNf8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752245085; c=relaxed/simple;
	bh=v2/uI/E8nkbPg0/2phUTDOQaQwwanBnVUBUOwOzZX3k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z3RjtE428erHlAewTCaZJQrX0TECGbRyQBFBtvctwz8hMTb5R9RcziH9f5uttEjlEt5Je6ZOa0+9IjgbBXTGi6FmYwVckBPZxpriiUSiDhyLbk94ztIsHfQXLK+1mF1v8xh4IR1mUuPZw2cgXe+MhLxw0yAn6+aCJBjOzlPsThI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FeWHdw+3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752245084; x=1783781084;
  h=date:from:to:cc:subject:message-id;
  bh=v2/uI/E8nkbPg0/2phUTDOQaQwwanBnVUBUOwOzZX3k=;
  b=FeWHdw+362cznhiI6XvFpfBwzU0BdGpMWx7MRhmv91dTQJjbhxkjqA7V
   2pXMHalkMNeGHmAhRbKgJfZrjnfRne8K1ewFmH6Z7rOe4CY6LhEJ7IBg3
   ZmW39RQ8xmTzutbygc0U4s1VfcgvXjzKrBKVi5bU6F7JtrkvfFJMQkGGO
   KKqW2LXUsHCXFReL0tFgJhkY5xnh0HHgd2iLhE8+XXnQpbHd3JXOZAFx9
   yZ5lDbYxwUbLRheBEgMrCAgXnqlfE6hKEpaQgdUmxr7URkORPRfyh+DWy
   8HhaYcLyamYtCS/3rqg1p6bpiL530+Zh8TLGRM62ST3iCISXgPuRTe2KM
   w==;
X-CSE-ConnectionGUID: 3DoAxvDFQN6jIeBfL8+N2Q==
X-CSE-MsgGUID: dUvAeGsXSoKLCYT9tTupiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65991785"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="65991785"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 07:44:43 -0700
X-CSE-ConnectionGUID: xMpT4HYPTgGGdKG9uIZJEQ==
X-CSE-MsgGUID: j1JnmXh0TmSlMVjkdzAm9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="187363069"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jul 2025 07:44:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaEzO-0006TH-0H;
	Fri, 11 Jul 2025 14:44:38 +0000
Date: Fri, 11 Jul 2025 22:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 cee06ca7a6748f7d5d7ea40876dcbc0af26bf34e
Message-ID: <202507112207.JzTqoEiP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: cee06ca7a6748f7d5d7ea40876dcbc0af26bf34e  media: imx8mq-mipi-csi2: Fix error code in imx8mq_mipi_csi_parse_dt()

elapsed time: 1445m

configs tested: 126
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                   randconfig-001-20250711    gcc-8.5.0
arc                   randconfig-002-20250711    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250711    clang-19
arm                   randconfig-002-20250711    clang-21
arm                   randconfig-003-20250711    gcc-15.1.0
arm                   randconfig-004-20250711    clang-20
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250711    clang-18
arm64                 randconfig-002-20250711    clang-21
arm64                 randconfig-003-20250711    gcc-12.3.0
arm64                 randconfig-004-20250711    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250711    gcc-14.3.0
csky                  randconfig-002-20250711    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250711    clang-19
hexagon               randconfig-002-20250711    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250711    gcc-12
i386        buildonly-randconfig-002-20250711    gcc-12
i386        buildonly-randconfig-003-20250711    clang-20
i386        buildonly-randconfig-004-20250711    clang-20
i386        buildonly-randconfig-005-20250711    gcc-11
i386        buildonly-randconfig-006-20250711    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250711    clang-21
loongarch             randconfig-002-20250711    clang-21
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
nios2                 randconfig-001-20250711    gcc-10.5.0
nios2                 randconfig-002-20250711    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                       virt_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250711    gcc-12.4.0
parisc                randconfig-002-20250711    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                     kmeter1_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250711    clang-18
powerpc               randconfig-002-20250711    clang-21
powerpc               randconfig-003-20250711    clang-21
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250711    clang-21
powerpc64             randconfig-002-20250711    clang-21
powerpc64             randconfig-003-20250711    gcc-13.4.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250711    gcc-8.5.0
riscv                 randconfig-002-20250711    gcc-12.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250711    clang-21
s390                  randconfig-002-20250711    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250711    gcc-12.4.0
sh                    randconfig-002-20250711    gcc-15.1.0
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sh                           se7206_defconfig    gcc-15.1.0
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250711    gcc-10.3.0
sparc                 randconfig-002-20250711    gcc-12.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250711    gcc-8.5.0
sparc64               randconfig-002-20250711    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250711    clang-20
um                    randconfig-002-20250711    clang-19
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250711    clang-20
x86_64      buildonly-randconfig-002-20250711    clang-20
x86_64      buildonly-randconfig-003-20250711    clang-20
x86_64      buildonly-randconfig-004-20250711    gcc-12
x86_64      buildonly-randconfig-005-20250711    clang-20
x86_64      buildonly-randconfig-006-20250711    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250711    gcc-9.3.0
xtensa                randconfig-002-20250711    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


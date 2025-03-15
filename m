Return-Path: <linux-media+bounces-28280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3D6A629ED
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 10:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76FCD3ADBF3
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 09:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A621F4607;
	Sat, 15 Mar 2025 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JS/tFaUq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BD9D531
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 09:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742030474; cv=none; b=f+XEzdCCQAsicd4FtQgedB8fxxri4+NHKjkcvT50VGpjQWmKYizPWv8m19yM/zEKsei3blfs+n58wGmRmZS5sT9aJIxuo4ZfmAkL4HFGjwvUmqvpQQJjmlVxMt2NgDc3SYFekpK1SCC/b0l/6cwSL/c69EWDeUJCKG2G/E+vj6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742030474; c=relaxed/simple;
	bh=JLOIQxchqRM4v3q0YtHsA2LZiVtn8HlbKIdMjKWT4Ks=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CzT9YKyUiTF3NMIEjRE3UtinKruXv3m9gKvbwtf92DWx69dCx+nGe0dH+T3+8NzJ7cwBf2Own1gErnf+89lQvvpbyX4qC6uCWG4w47dBXKv2SdjX8QvP7K4dLgwk9XnkK0I8fvVtbWQZpiOcMYfTIZ0QYRN6cFa/BGhLBeo3Z5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JS/tFaUq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742030473; x=1773566473;
  h=date:from:to:cc:subject:message-id;
  bh=JLOIQxchqRM4v3q0YtHsA2LZiVtn8HlbKIdMjKWT4Ks=;
  b=JS/tFaUqXDeZpipWiZPnB6lO8DhIk+xmruTjsNZgJVx/xSrN6t8+9YCo
   xUiwCSxmgnOzxxrEaov8rvH3FafzJVcBawGFhO09S0SnIYjjWAmlMH/kj
   dVBNP4Vr87H3XLrtjO+nQYIf+P/AkTpAXEc3HTxZDQGqAtoqcp6ZFNwKt
   NYFuWQCm6YYxDz3d5djZJjJ0VfzVqA8zZipdTGoxUC1pkw/dGpPl9Wv9h
   YRXyGITG5eJoL8dNY3rrS1ALZa1V+sbUf0n6MNH/X6BTUWnt6hATamrDc
   WU9t0tAT/h50IayMZVKOP5f1xX10BHiNDZbsHPxLBQGkqVR+mxAZ/SziM
   A==;
X-CSE-ConnectionGUID: 73n42wStSnaOiY+9CGEV1Q==
X-CSE-MsgGUID: 1XOmHcW4QC+KRKazEcDE1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="53393273"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="53393273"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 02:21:12 -0700
X-CSE-ConnectionGUID: K8kwEbl8QSKLZXe2pAzIpg==
X-CSE-MsgGUID: yoRpjOxeSyuN+QyR1Wf6pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="121314681"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Mar 2025 02:21:10 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttNhc-000BCy-0q;
	Sat, 15 Mar 2025 09:21:08 +0000
Date: Sat, 15 Mar 2025 17:21:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 a4159ca71306042d87e1646340014088b38bcfbf
Message-ID: <202503151757.YQqSWKa9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: a4159ca71306042d87e1646340014088b38bcfbf  media: intel/ipu6: Constify ipu6_buttress_ctrl structure

elapsed time: 1448m

configs tested: 101
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250314    gcc-13.2.0
arc                   randconfig-002-20250314    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    clang-21
arm                   randconfig-001-20250314    clang-21
arm                   randconfig-002-20250314    gcc-14.2.0
arm                   randconfig-003-20250314    gcc-14.2.0
arm                   randconfig-004-20250314    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250314    gcc-14.2.0
arm64                 randconfig-002-20250314    clang-21
arm64                 randconfig-003-20250314    clang-15
arm64                 randconfig-004-20250314    clang-21
csky                  randconfig-001-20250314    gcc-14.2.0
csky                  randconfig-002-20250314    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250314    clang-21
hexagon               randconfig-002-20250314    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250314    clang-19
i386        buildonly-randconfig-002-20250314    clang-19
i386        buildonly-randconfig-003-20250314    gcc-12
i386        buildonly-randconfig-004-20250314    gcc-12
i386        buildonly-randconfig-005-20250314    gcc-12
i386        buildonly-randconfig-006-20250314    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250314    gcc-14.2.0
loongarch             randconfig-002-20250314    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-18
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250314    gcc-14.2.0
nios2                 randconfig-002-20250314    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250314    gcc-14.2.0
parisc                randconfig-002-20250314    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                       eiger_defconfig    clang-17
powerpc               randconfig-001-20250314    clang-21
powerpc               randconfig-002-20250314    gcc-14.2.0
powerpc               randconfig-003-20250314    gcc-14.2.0
powerpc64             randconfig-001-20250314    gcc-14.2.0
powerpc64             randconfig-002-20250314    clang-17
powerpc64             randconfig-003-20250314    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250314    clang-19
riscv                 randconfig-002-20250314    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250314    gcc-14.2.0
s390                  randconfig-002-20250314    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250314    gcc-14.2.0
sh                    randconfig-002-20250314    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250314    gcc-14.2.0
sparc                 randconfig-002-20250314    gcc-14.2.0
sparc64               randconfig-001-20250314    gcc-14.2.0
sparc64               randconfig-002-20250314    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250314    gcc-12
um                    randconfig-002-20250314    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250314    clang-19
x86_64      buildonly-randconfig-002-20250314    clang-19
x86_64      buildonly-randconfig-003-20250314    gcc-12
x86_64      buildonly-randconfig-004-20250314    clang-19
x86_64      buildonly-randconfig-005-20250314    gcc-12
x86_64      buildonly-randconfig-006-20250314    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250314    gcc-14.2.0
xtensa                randconfig-002-20250314    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


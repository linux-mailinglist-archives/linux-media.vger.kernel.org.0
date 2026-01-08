Return-Path: <linux-media+bounces-50247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7D8D05331
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 18:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67ED030119B8
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 17:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158142DCBEB;
	Thu,  8 Jan 2026 17:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0nz9jlM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCFB2E336F
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767894724; cv=none; b=kwZed3tc1fAigjXBc/VbJBs7DHK2AGJY+N/C1IR0Y4jGbRqNgCh6OLbSSl/ieTty9UVbXFEYYdZfy+/uarR9iJcCF8mRr7nPgH3EhNKL0QLMHiv6adlZJrpHy97R5oTovcGfRRjPYlHtaik0Tkh2DWFRnA/Vd5AUWYf6NOwd33k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767894724; c=relaxed/simple;
	bh=xRvDMnzDtn5Y7YqEBciqA7z0Av0tHF02W51dGiIA4pg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HKlaiVdZkDAdsIW1w6zg2WPiV2hZkM2emCVUd0bzJO4ujyh3z32tSFFlGoV0KiaE21S59YcKR0v0uDlE//QWAIspWvS7yhmxrmtUMJS+dgKVf/X8lpVpMYrN7BMp9XwsUqldGTLJ/Nqmo/IS3clJgu7Hy2548Qh77WRYnnpw4I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0nz9jlM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767894723; x=1799430723;
  h=date:from:to:cc:subject:message-id;
  bh=xRvDMnzDtn5Y7YqEBciqA7z0Av0tHF02W51dGiIA4pg=;
  b=d0nz9jlMtZcvSHSEjVexiwCA/ofYX7oMBG6Jy1onlELiUFVogqIN/Bmt
   mwgEAWGKeJQ8vk4NG07cc4OWj+kWjVvoI/1Lx6iGr4tt0R8l2Gr09sQ9S
   fhi66yJuM6K4Ix38yQTjxk0H25C2o1cjWujMCIrs3aD/wSudXOC69ppWb
   Ia5ccHnk0dlxtAD1GPcYLKifOsnatX4KhaDV9pPB7zCbQ9dgua6U6Hgnz
   CQj5R9QeIhHx8SzsWsPlbYmM2nZTT2+zDZnMLQKQw6NXifXKTpQdglOvP
   4QdDW7m7f/Y7ghVulTI/n5U8ElQvnyOuC7TEWTnOBHyZOIhws9pD7fWzP
   g==;
X-CSE-ConnectionGUID: KP5IFyVmT4aSUaQ97xCrvw==
X-CSE-MsgGUID: c9cKlsJ2RfSYuyd6GihKBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69352024"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69352024"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 09:52:02 -0800
X-CSE-ConnectionGUID: mcuHqXJWQ3G/T5icFoy1sg==
X-CSE-MsgGUID: 1LCDu0tUSua5B9MVQzFiSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203044490"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Jan 2026 09:52:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vduAw-0000000051A-3T7w;
	Thu, 08 Jan 2026 17:51:58 +0000
Date: Fri, 09 Jan 2026 01:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:fixes] BUILD SUCCESS
 69d6c6fc79eb3a8309691250a3b0a9c1870c1f83
Message-ID: <202601090119.15BN2hcS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git fixes
branch HEAD: 69d6c6fc79eb3a8309691250a3b0a9c1870c1f83  media: ov02c10: Remove unnecessary hflip and vflip pointers

elapsed time: 1610m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20260108    gcc-9.5.0
arc                   randconfig-002-20260108    gcc-9.5.0
arm                               allnoconfig    gcc-15.1.0
arm                            hisi_defconfig    gcc-15.1.0
arm                   randconfig-001-20260108    gcc-9.5.0
arm                   randconfig-002-20260108    gcc-9.5.0
arm                   randconfig-003-20260108    gcc-9.5.0
arm                   randconfig-004-20260108    gcc-9.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20260108    gcc-10.5.0
arm64                 randconfig-002-20260108    gcc-10.5.0
arm64                 randconfig-003-20260108    gcc-10.5.0
arm64                 randconfig-004-20260108    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20260108    gcc-10.5.0
csky                  randconfig-002-20260108    gcc-10.5.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon               randconfig-001-20260108    gcc-8.5.0
hexagon               randconfig-002-20260108    gcc-8.5.0
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20260108    clang-20
i386        buildonly-randconfig-002-20260108    clang-20
i386        buildonly-randconfig-003-20260108    clang-20
i386        buildonly-randconfig-004-20260108    clang-20
i386        buildonly-randconfig-005-20260108    clang-20
i386        buildonly-randconfig-006-20260108    clang-20
i386                  randconfig-001-20260108    gcc-14
i386                  randconfig-002-20260108    gcc-14
i386                  randconfig-003-20260108    gcc-14
i386                  randconfig-004-20260108    gcc-14
i386                  randconfig-005-20260108    gcc-14
i386                  randconfig-006-20260108    gcc-14
i386                  randconfig-007-20260108    gcc-14
i386                  randconfig-011-20260108    gcc-14
i386                  randconfig-012-20260108    gcc-14
i386                  randconfig-013-20260108    gcc-14
i386                  randconfig-014-20260108    gcc-14
i386                  randconfig-015-20260108    gcc-14
i386                  randconfig-016-20260108    gcc-14
i386                  randconfig-017-20260108    gcc-14
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260108    gcc-8.5.0
loongarch             randconfig-002-20260108    gcc-8.5.0
m68k                              allnoconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
mips                  decstation_64_defconfig    gcc-15.1.0
mips                      loongson3_defconfig    gcc-15.1.0
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260108    gcc-8.5.0
nios2                 randconfig-002-20260108    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260108    clang-22
parisc                randconfig-002-20260108    clang-22
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                  mpc866_ads_defconfig    gcc-15.1.0
powerpc               randconfig-001-20260108    clang-22
powerpc               randconfig-002-20260108    clang-22
powerpc64             randconfig-001-20260108    clang-22
powerpc64             randconfig-002-20260108    clang-22
riscv                             allnoconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20260108    gcc-13.4.0
riscv                 randconfig-002-20260108    gcc-13.4.0
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20260108    gcc-13.4.0
sh                                allnoconfig    clang-22
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260108    gcc-13.4.0
sh                    randconfig-002-20260108    gcc-13.4.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260108    gcc-8.5.0
sparc                 randconfig-002-20260108    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260108    gcc-8.5.0
sparc64               randconfig-002-20260108    gcc-8.5.0
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260108    gcc-8.5.0
um                    randconfig-002-20260108    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260108    gcc-14
x86_64      buildonly-randconfig-002-20260108    gcc-14
x86_64      buildonly-randconfig-003-20260108    gcc-14
x86_64      buildonly-randconfig-004-20260108    gcc-14
x86_64      buildonly-randconfig-005-20260108    gcc-14
x86_64      buildonly-randconfig-006-20260108    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260108    gcc-12
x86_64                randconfig-002-20260108    gcc-12
x86_64                randconfig-003-20260108    gcc-12
x86_64                randconfig-004-20260108    gcc-12
x86_64                randconfig-005-20260108    gcc-12
x86_64                randconfig-006-20260108    gcc-12
x86_64                randconfig-011-20260108    clang-20
x86_64                randconfig-012-20260108    clang-20
x86_64                randconfig-013-20260108    clang-20
x86_64                randconfig-014-20260108    clang-20
x86_64                randconfig-015-20260108    clang-20
x86_64                randconfig-016-20260108    clang-20
x86_64                randconfig-071-20260108    gcc-14
x86_64                randconfig-072-20260108    gcc-14
x86_64                randconfig-073-20260108    gcc-14
x86_64                randconfig-074-20260108    gcc-14
x86_64                randconfig-075-20260108    gcc-14
x86_64                randconfig-076-20260108    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                randconfig-001-20260108    gcc-8.5.0
xtensa                randconfig-002-20260108    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


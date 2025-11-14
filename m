Return-Path: <linux-media+bounces-47125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00BC5DF98
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 16:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B01D450649A
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 15:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C07432F76B;
	Fri, 14 Nov 2025 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEyFHf5Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6BB3396E8
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 15:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133532; cv=none; b=odP4PwRWilAZCPiLzTYyz3dR3wYAED2zc6/+SnAT1NWI4Lx4UuPWAauCc5o14FTiNfWpwyqOZZwhfW5BkHDo2VnEJhjqSvOlJVm6csHlq2APqelfwMdVQyXlk5N2OkOHJIvBdQDIKsCc76XRpOjEkRzuQDn0T18icTTNKF4IBYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133532; c=relaxed/simple;
	bh=9CzDe/AZvrpfyh4c9appA8OCIOXFc6d1qL/pbBL9ex0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=psp/Ab4cBmvMZuErK3yDB7lKHBpkM13+Qz2Na7s1OMsbLa81TUiWFtPjQBU4MIldhzMmJvbGcCUZ7aLONh97breyXBoqOpuyRypL6qALcryOPsypmnMnfc6f8Rs66jMGAZErEuCr/aBKsr9K7ISkZ5oqUCtHVgmQBih4yATX6pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEyFHf5Q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763133531; x=1794669531;
  h=date:from:to:cc:subject:message-id;
  bh=9CzDe/AZvrpfyh4c9appA8OCIOXFc6d1qL/pbBL9ex0=;
  b=QEyFHf5QTIdiZw0cgM7IhNGz1pGVnbfFeIG6USCQRbBzPX1bDLRlvibG
   Bi/2U3OjsGFYzzUjh2ZdJoseGA9AVyE3Y/3JqnHyoYm9mAE4GoerdKcjP
   qhSTjAsWzwxwcoGY/SZ0VMeOtmQT+Ps5JCr58ozbn/jQ/x0zdolPzR9ox
   tOxZfk2ABYdYrVbgeTRqA425w0bpDLbSXcG3QKHHJA4N9PDQlOYmSSVSD
   OG5b3iepB9Sff1RHbbDXi5y5XgdOmoHlRHNLdCNjyE8rACV+pFIrG9XnO
   4V/4sJ+maWOi5yFGvYPJr0E8EwANy44XOfxZ0U8tGa/3zTmLYvN3/P25N
   A==;
X-CSE-ConnectionGUID: gVz9qVuUT7WmfWdxNd4ZUA==
X-CSE-MsgGUID: xin2ExU2Sf6LeyaXRLl3yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="64435134"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="64435134"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 07:18:50 -0800
X-CSE-ConnectionGUID: y8C0c8bZTwqcIygG6Ny5CA==
X-CSE-MsgGUID: kymcgpE0Q/qGIWu1wDMNgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="194240945"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Nov 2025 07:18:49 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJvZW-0006hj-2g;
	Fri, 14 Nov 2025 15:18:46 +0000
Date: Fri, 14 Nov 2025 23:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 29ae148fa88934bfd81af2a616816f9e22559b7c
Message-ID: <202511142336.xTkNoVJf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 29ae148fa88934bfd81af2a616816f9e22559b7c  Merge tag 'v6.18-rc5' into media-next

elapsed time: 4487m

configs tested: 109
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251112    gcc-8.5.0
arc                   randconfig-001-20251114    gcc-8.5.0
arc                   randconfig-002-20251112    gcc-9.5.0
arc                   randconfig-002-20251114    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251112    gcc-8.5.0
arm                   randconfig-001-20251114    gcc-15.1.0
arm                   randconfig-002-20251112    clang-22
arm                   randconfig-002-20251114    gcc-14.3.0
arm                   randconfig-003-20251112    clang-22
arm                   randconfig-003-20251114    clang-22
arm                   randconfig-004-20251112    gcc-14.3.0
arm                   randconfig-004-20251114    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-004-20251114    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251112    clang-16
hexagon               randconfig-001-20251114    clang-22
hexagon               randconfig-002-20251112    clang-22
hexagon               randconfig-002-20251114    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251114    gcc-14
i386        buildonly-randconfig-002-20251114    clang-20
i386        buildonly-randconfig-003-20251114    clang-20
i386        buildonly-randconfig-004-20251114    gcc-14
i386        buildonly-randconfig-005-20251114    clang-20
i386        buildonly-randconfig-006-20251114    gcc-14
i386                  randconfig-001-20251114    clang-20
i386                  randconfig-002-20251114    clang-20
i386                  randconfig-003-20251114    clang-20
i386                  randconfig-004-20251114    gcc-14
i386                  randconfig-005-20251114    gcc-14
i386                  randconfig-006-20251114    clang-20
i386                  randconfig-007-20251114    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251112    gcc-15.1.0
loongarch             randconfig-001-20251114    clang-18
loongarch             randconfig-002-20251112    gcc-13.4.0
loongarch             randconfig-002-20251114    clang-22
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251112    gcc-11.5.0
nios2                 randconfig-001-20251114    gcc-10.5.0
nios2                 randconfig-002-20251112    gcc-11.5.0
nios2                 randconfig-002-20251114    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251112    gcc-9.5.0
parisc                randconfig-002-20251112    gcc-8.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251112    clang-22
powerpc               randconfig-002-20251112    clang-22
powerpc64             randconfig-001-20251112    clang-22
powerpc64             randconfig-002-20251112    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251114    gcc-13.4.0
riscv                 randconfig-002-20251114    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251114    gcc-8.5.0
s390                  randconfig-002-20251114    gcc-11.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251114    gcc-10.5.0
sh                    randconfig-002-20251114    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251114    gcc-14.3.0
sparc                 randconfig-002-20251114    gcc-12.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251114    gcc-8.5.0
sparc64               randconfig-002-20251114    gcc-14.3.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251114    gcc-13
um                    randconfig-002-20251114    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251114    clang-20
x86_64      buildonly-randconfig-002-20251114    gcc-14
x86_64      buildonly-randconfig-003-20251114    gcc-14
x86_64      buildonly-randconfig-004-20251114    clang-20
x86_64      buildonly-randconfig-005-20251114    clang-20
x86_64      buildonly-randconfig-006-20251114    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251114    clang-20
x86_64                randconfig-002-20251114    gcc-14
x86_64                randconfig-003-20251114    clang-20
x86_64                randconfig-004-20251114    clang-20
x86_64                randconfig-005-20251114    gcc-12
x86_64                randconfig-006-20251114    gcc-14
x86_64                randconfig-071-20251114    clang-20
x86_64                randconfig-072-20251114    clang-20
x86_64                randconfig-073-20251114    clang-20
x86_64                randconfig-074-20251114    clang-20
x86_64                randconfig-075-20251114    gcc-14
x86_64                randconfig-076-20251114    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251114    gcc-14.3.0
xtensa                randconfig-002-20251114    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


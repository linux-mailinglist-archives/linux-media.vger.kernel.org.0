Return-Path: <linux-media+bounces-47172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4017BC61091
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 06:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 798C6353E6C
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 05:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C50522578A;
	Sun, 16 Nov 2025 05:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1/jG/w0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D935E1494D9
	for <linux-media@vger.kernel.org>; Sun, 16 Nov 2025 05:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763272093; cv=none; b=uEYnTMfFXP8HXDcWFSCcoXT4nwFaTRkfCI3AvcNvieEDyGIFA7jBezikacdT/iIu2vyECJi1hIRI3M9zCrbUAndmAz+9cazVcepSoktaOr+/b5imZJpIKtKTGOPTRDm5m3h+U8Ce2fLMwu/ce5KOtOyaZMDGHh9p/XLlbs1ZWss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763272093; c=relaxed/simple;
	bh=VwLiL5zEE5wCUBXJmU4o2TdZd/fugaN1OLS8/XrjKus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XX+Y3AKJpI+3rSi5A471My0eweIQ7OyvrIefANHZqfm8jYhgGxySCF8asKgteaCBGs3Q9dhiOucEVTytxeHjetLNmIXKFJ7Uxyf3+YQ7c13OB8Iax2l3gNapViUOsd2+Ko2GR4GQiiyhjZmMSAABJri5Iy7h6pZ0+OMADFlcWI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1/jG/w0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763272092; x=1794808092;
  h=date:from:to:cc:subject:message-id;
  bh=VwLiL5zEE5wCUBXJmU4o2TdZd/fugaN1OLS8/XrjKus=;
  b=f1/jG/w0mc/1ZBcX2twqjhXl1Jc8N2s3XzUUNzMWPguVv0a+OMeN7ZGn
   7dTzstHRJazaplRnaRdfBNytF4JV9DtQNwew6oPhwT0NoZ6wcd+us/Z65
   rozBBg0TsgJIflbdZd0yQgC2JNhGJrdUqIVLlycqR224HD7jlxfzU/d0p
   8I+y08PMGHwfruf008e69EBLUjNumvtAHqzVTfjqf6cFXAntseECgRkBs
   J02mISugr8vbLzj5YUd85xYsmNqhTivEvvOIZjYX5CK/Z+qINJ+xSNfEj
   VzorQvN69YP9yFIvIDiurH/wUM1ZiA67yi/8QUjvp1/7gWK9h25QlBnpx
   w==;
X-CSE-ConnectionGUID: JSQeKsPCTou1BVZQ+X6EvA==
X-CSE-MsgGUID: 15ammgIwRp6Pdj58tEVeVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="64310829"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="64310829"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 21:48:11 -0800
X-CSE-ConnectionGUID: rsp7kxoXSoiskefyk6kkNQ==
X-CSE-MsgGUID: QBG+MttxSMeJO4a70OZyJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="189969595"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2025 21:48:10 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKVcO-0008X1-0L;
	Sun, 16 Nov 2025 05:48:08 +0000
Date: Sun, 16 Nov 2025 13:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 a2e51f925d009d835a81138a9ed1b4a144ebb254
Message-ID: <202511161346.tvcmjo2m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: a2e51f925d009d835a81138a9ed1b4a144ebb254  media: rockchip: rkcif: add support for rk3568 vicap mipi capture

elapsed time: 2271m

configs tested: 105
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                              alldefconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251115    gcc-13.4.0
arc                   randconfig-002-20251115    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251115    clang-22
arm                   randconfig-002-20251115    gcc-8.5.0
arm                   randconfig-003-20251115    gcc-10.5.0
arm                   randconfig-004-20251115    clang-22
arm                           sunxi_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251115    gcc-8.5.0
arm64                 randconfig-002-20251115    clang-18
arm64                 randconfig-003-20251115    gcc-13.4.0
arm64                 randconfig-004-20251115    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251115    gcc-15.1.0
csky                  randconfig-002-20251115    gcc-9.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251115    clang-16
hexagon               randconfig-002-20251115    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251116    clang-20
i386        buildonly-randconfig-002-20251116    clang-20
i386        buildonly-randconfig-003-20251116    clang-20
i386        buildonly-randconfig-004-20251116    gcc-14
i386        buildonly-randconfig-005-20251116    clang-20
i386        buildonly-randconfig-006-20251116    clang-20
i386                  randconfig-001-20251116    gcc-14
i386                  randconfig-002-20251116    clang-20
i386                  randconfig-003-20251116    gcc-14
i386                  randconfig-004-20251116    gcc-14
i386                  randconfig-005-20251116    clang-20
i386                  randconfig-006-20251116    clang-20
i386                  randconfig-007-20251116    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251115    clang-18
loongarch             randconfig-002-20251115    gcc-13.4.0
m68k                              allnoconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip28_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251115    gcc-8.5.0
nios2                 randconfig-002-20251115    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251115    gcc-8.5.0
parisc                randconfig-002-20251115    gcc-8.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    clang-22
powerpc               randconfig-001-20251115    clang-19
powerpc               randconfig-002-20251115    gcc-8.5.0
powerpc64             randconfig-001-20251115    gcc-11.5.0
powerpc64             randconfig-002-20251115    gcc-14.3.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                    nommu_k210_defconfig    clang-22
riscv                 randconfig-001-20251115    clang-22
riscv                 randconfig-002-20251115    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251115    clang-17
s390                  randconfig-002-20251115    gcc-8.5.0
sh                                allnoconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251115    gcc-12.5.0
sh                    randconfig-002-20251115    gcc-15.1.0
sh                          rsk7264_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251116    gcc-8.5.0
sparc                 randconfig-002-20251116    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251116    gcc-15.1.0
sparc64               randconfig-002-20251116    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251116    clang-17
um                    randconfig-002-20251116    gcc-13
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251116    clang-20
x86_64      buildonly-randconfig-002-20251116    clang-20
x86_64      buildonly-randconfig-003-20251116    clang-20
x86_64      buildonly-randconfig-004-20251116    gcc-13
x86_64      buildonly-randconfig-005-20251116    clang-20
x86_64      buildonly-randconfig-006-20251116    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251116    gcc-8.5.0
xtensa                randconfig-002-20251116    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


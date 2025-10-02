Return-Path: <linux-media+bounces-43665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7E3BB469F
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 17:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9676189B91C
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 15:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BA8236A70;
	Thu,  2 Oct 2025 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJStMfoE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1578D224B04
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759420645; cv=none; b=lFD4QF78Re8+Vr51bVGu4qUqys3QOQm4ZNSFQswjT4p9tC6iO/nDYw6t6Zb8VwwUUOZdTFlN6i+Vqcgpu5mreKv9tNcsWRR665LFzt+yst6HoI226zjm1PCKohjyqbdltjjvMEQou+bUcCIDeO4KQ87Y3QkA/xP6ilBHw1sHwyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759420645; c=relaxed/simple;
	bh=79ylAI/g4B0Jh4oXG3kjit/WlWUkCYobqp+f+aLV0kY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nKTNWRqtP85VcPld0HBVkzAGkWQiiDIxlojxxmLgidbursSNH7UhF0Z2HcakYdCEYEf7bFgwS3Xrp3/EWguHl2nWhrYYKyjOuI+vK1gWJTW800CSoYQY/sKRHTsF8c1dC6rFBwA2SUTQpNnuEcEIBfPaUAyinmM3Z5guP22Da5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJStMfoE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759420645; x=1790956645;
  h=date:from:to:cc:subject:message-id;
  bh=79ylAI/g4B0Jh4oXG3kjit/WlWUkCYobqp+f+aLV0kY=;
  b=NJStMfoEVmY9KCdcN1KJ44z2u5M5Qfp8WAP9fuqJMQyOzpOaPXeSKVUn
   MAr1TQhX1c0OWYaEmUXA+g5X3IL1XzfY475DqRBeGsA51omOoVbYKoSlP
   JUwtfA2TUpnmbHmRjvMbLjKAunLMD928PLmZx72uDG/EtyQ2APP/4n3Jp
   m2Ip/5zHECS9TR9rmEACgSZgwczfTe5TO4f2jluGU5WnxCqZZh37Y4tV/
   2R/bttKKaStuAl7FqvHZ0GLni6+x6vd7JlJAz3CEAUB7q5WrSEu37ANo6
   T7fha4WjmX09MDXtE/71N/K5KSzotdCtAXsSePyIPJpGDpgaLjN2Dk1Yl
   Q==;
X-CSE-ConnectionGUID: Hg16DFvbSY6qlWqCt7I7Ww==
X-CSE-MsgGUID: E++g/YrgQleqFAc32R72mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="87158530"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="87158530"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 08:57:24 -0700
X-CSE-ConnectionGUID: Uda6CsEARuqPAVl7bJqehg==
X-CSE-MsgGUID: qzyYOhI1TGC0o4JsZrcT/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="210037322"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Oct 2025 08:57:23 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4LgG-0003ul-1e;
	Thu, 02 Oct 2025 15:57:20 +0000
Date: Thu, 02 Oct 2025 23:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS
 9d456633245d013e7f9213f26a9f465cdb902861
Message-ID: <202510022350.6Gj6GBM1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 9d456633245d013e7f9213f26a9f465cdb902861  media: uapi: Add more media bus codes for generic raw formats

elapsed time: 1564m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251001    gcc-8.5.0
arc                   randconfig-002-20251001    gcc-8.5.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                           h3600_defconfig    gcc-15.1.0
arm                      integrator_defconfig    clang-22
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-001-20251001    gcc-14.3.0
arm                   randconfig-002-20251001    clang-22
arm                   randconfig-003-20251001    gcc-12.5.0
arm                   randconfig-004-20251001    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251001    clang-22
arm64                 randconfig-002-20251001    gcc-9.5.0
arm64                 randconfig-003-20251001    gcc-8.5.0
arm64                 randconfig-004-20251001    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251001    gcc-13.4.0
csky                  randconfig-002-20251001    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251001    clang-22
hexagon               randconfig-002-20251001    clang-22
i386        buildonly-randconfig-001-20251001    clang-20
i386        buildonly-randconfig-002-20251001    clang-20
i386        buildonly-randconfig-003-20251001    gcc-14
i386        buildonly-randconfig-004-20251001    clang-20
i386        buildonly-randconfig-005-20251001    clang-20
i386        buildonly-randconfig-006-20251001    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251001    gcc-13.4.0
loongarch             randconfig-002-20251001    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251001    gcc-11.5.0
nios2                 randconfig-002-20251001    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251001    gcc-8.5.0
parisc                randconfig-002-20251001    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    clang-22
powerpc               randconfig-001-20251001    gcc-8.5.0
powerpc               randconfig-002-20251001    clang-22
powerpc               randconfig-003-20251001    clang-22
powerpc64             randconfig-001-20251001    gcc-8.5.0
powerpc64             randconfig-002-20251001    clang-22
powerpc64             randconfig-003-20251001    gcc-13.4.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251001    clang-22
riscv                 randconfig-002-20251001    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251001    clang-22
s390                  randconfig-002-20251001    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251001    gcc-13.4.0
sh                    randconfig-002-20251001    gcc-11.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251001    gcc-15.1.0
sparc                 randconfig-002-20251001    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251001    gcc-8.5.0
sparc64               randconfig-002-20251001    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251001    gcc-14
um                    randconfig-002-20251001    gcc-14
um                           x86_64_defconfig    clang-22
x86_64      buildonly-randconfig-001-20251001    clang-20
x86_64      buildonly-randconfig-002-20251001    clang-20
x86_64      buildonly-randconfig-003-20251001    clang-20
x86_64      buildonly-randconfig-004-20251001    clang-20
x86_64      buildonly-randconfig-005-20251001    clang-20
x86_64      buildonly-randconfig-006-20251001    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251001    gcc-15.1.0
xtensa                randconfig-002-20251001    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


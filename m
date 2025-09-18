Return-Path: <linux-media+bounces-39863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05939B25BAD
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 08:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 030531C848DB
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 06:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07BC23A9B1;
	Thu, 14 Aug 2025 06:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbuD38MJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDECD199FBA
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 06:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755152171; cv=none; b=DFzkmYyu2ZDvhUYHffkCxanXeKGKXHXXIF5tp+o3pv2PUrFe7dMH581BsjASCX3v7lpUWkWIkvjJhWsOU3LUFmrF7b8Am3Ukclynn8sGU94OGzF3GLjjZSGXvJFv/aVB7/icjBpOS7hvpeetpPxKgcKFgcz4Z1PVheGdeucuybs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755152171; c=relaxed/simple;
	bh=0eFEJbyQZECGtNp5WAZOvRo3hKj1Gmm3UE7Rstttgjs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Eq9Rzcu71tLYV6r6QaOpc6RJS6N+vxVliddh8e0ZFHjCD5HrmRpwipa73HBIIcumFbRi6UUWGC9t4dsDbWboYmHr0DX1xtLr2xVaaq8sI3BXy4a2cbQ+o/LwlaWfEoEXO40spqbHxqaIq90CatcZg5OVJg+CZJObjql4sqabg9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LbuD38MJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755152169; x=1786688169;
  h=date:from:to:cc:subject:message-id;
  bh=0eFEJbyQZECGtNp5WAZOvRo3hKj1Gmm3UE7Rstttgjs=;
  b=LbuD38MJ6zS25VOMk6LAZxMwbTdYtyQM1/+NizvQDvrakCg8k9Hn2CtA
   tn5fmmOcHhmbk5VZBh1+uMEMTaOV0Jvlp0IJLV1I39RZFucBAZ4pZvTpM
   vAYxMY2ZHqucHWHaIY41bTIu81cSA6+yLK6s4BijmsunDJiDZHwrnV2qS
   MKfp5axlmZr1v7mfpwX/+nvVw8ftMWTST3xMlg9aqAFffSGWHejfrk1yw
   Wya9B/tF7MqxurK1vFhfoyfhyGhSCmDY2/ZaackwWYD3iDlGfDtXeyfFs
   QUQzwEAiHgZYE8qsQfQ1XMohUyozqbn5misFBN3NEUXZHmEn63jzrBsDe
   Q==;
X-CSE-ConnectionGUID: eKDK2Dp1QfyQBV22VuQFFQ==
X-CSE-MsgGUID: 7SyQ5c5iQRy+pudnuf2OJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="75031308"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="75031308"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 23:16:08 -0700
X-CSE-ConnectionGUID: 6mpTcourQICC1J7Fh2NAyw==
X-CSE-MsgGUID: VE6S5Z+ZQXaTTCrxrQxzbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="203864091"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2025 23:16:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umRFs-000Ae4-2F;
	Thu, 14 Aug 2025 06:16:04 +0000
Date: Thu, 14 Aug 2025 14:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 078f1a7eb48eef9b3cb78bcd2254356f3a332358
Message-ID: <202508141434.umc1EMip-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 078f1a7eb48eef9b3cb78bcd2254356f3a332358  media: staging: Rename second ioctl handlers argument to 'void *priv'

elapsed time: 1201m

configs tested: 243
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              alldefconfig    clang-22
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                        nsimosci_defconfig    clang-22
arc                   randconfig-001-20250813    gcc-11.5.0
arc                   randconfig-001-20250814    gcc-10.5.0
arc                   randconfig-002-20250813    gcc-8.5.0
arc                   randconfig-002-20250814    gcc-10.5.0
arc                           tb10x_defconfig    clang-22
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                       multi_v4t_defconfig    clang-22
arm                        mvebu_v7_defconfig    clang-22
arm                   randconfig-001-20250813    clang-22
arm                   randconfig-001-20250814    gcc-10.5.0
arm                   randconfig-002-20250813    gcc-8.5.0
arm                   randconfig-002-20250814    gcc-10.5.0
arm                   randconfig-003-20250813    clang-22
arm                   randconfig-003-20250814    gcc-10.5.0
arm                   randconfig-004-20250813    gcc-8.5.0
arm                   randconfig-004-20250814    gcc-10.5.0
arm                         s3c6400_defconfig    clang-22
arm                        spear3xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250813    clang-22
arm64                 randconfig-001-20250814    gcc-10.5.0
arm64                 randconfig-002-20250813    gcc-12.5.0
arm64                 randconfig-002-20250814    gcc-10.5.0
arm64                 randconfig-003-20250813    clang-22
arm64                 randconfig-003-20250814    gcc-10.5.0
arm64                 randconfig-004-20250813    clang-22
arm64                 randconfig-004-20250814    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250813    gcc-14.3.0
csky                  randconfig-001-20250814    gcc-10.5.0
csky                  randconfig-002-20250813    gcc-13.4.0
csky                  randconfig-002-20250814    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250813    clang-22
hexagon               randconfig-001-20250814    gcc-10.5.0
hexagon               randconfig-002-20250813    clang-22
hexagon               randconfig-002-20250814    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250813    gcc-11
i386        buildonly-randconfig-001-20250814    clang-20
i386        buildonly-randconfig-002-20250813    clang-20
i386        buildonly-randconfig-002-20250814    clang-20
i386        buildonly-randconfig-003-20250813    gcc-11
i386        buildonly-randconfig-003-20250814    clang-20
i386        buildonly-randconfig-004-20250813    clang-20
i386        buildonly-randconfig-004-20250814    clang-20
i386        buildonly-randconfig-005-20250813    gcc-12
i386        buildonly-randconfig-005-20250814    clang-20
i386        buildonly-randconfig-006-20250813    gcc-12
i386        buildonly-randconfig-006-20250814    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250814    clang-20
i386                  randconfig-002-20250814    clang-20
i386                  randconfig-003-20250814    clang-20
i386                  randconfig-004-20250814    clang-20
i386                  randconfig-005-20250814    clang-20
i386                  randconfig-006-20250814    clang-20
i386                  randconfig-007-20250814    clang-20
i386                  randconfig-011-20250814    gcc-12
i386                  randconfig-012-20250814    gcc-12
i386                  randconfig-013-20250814    gcc-12
i386                  randconfig-014-20250814    gcc-12
i386                  randconfig-015-20250814    gcc-12
i386                  randconfig-016-20250814    gcc-12
i386                  randconfig-017-20250814    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250813    clang-19
loongarch             randconfig-001-20250814    gcc-10.5.0
loongarch             randconfig-002-20250813    gcc-15.1.0
loongarch             randconfig-002-20250814    gcc-10.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250813    gcc-11.5.0
nios2                 randconfig-001-20250814    gcc-10.5.0
nios2                 randconfig-002-20250813    gcc-8.5.0
nios2                 randconfig-002-20250814    gcc-10.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250813    gcc-14.3.0
parisc                randconfig-001-20250814    gcc-10.5.0
parisc                randconfig-002-20250813    gcc-8.5.0
parisc                randconfig-002-20250814    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      ppc44x_defconfig    clang-22
powerpc               randconfig-001-20250813    clang-18
powerpc               randconfig-001-20250814    gcc-10.5.0
powerpc               randconfig-002-20250813    clang-22
powerpc               randconfig-002-20250814    gcc-10.5.0
powerpc               randconfig-003-20250813    clang-20
powerpc               randconfig-003-20250814    gcc-10.5.0
powerpc64             randconfig-001-20250813    clang-22
powerpc64             randconfig-001-20250814    gcc-10.5.0
powerpc64             randconfig-002-20250813    gcc-8.5.0
powerpc64             randconfig-002-20250814    gcc-10.5.0
powerpc64             randconfig-003-20250813    clang-17
powerpc64             randconfig-003-20250814    gcc-10.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250813    clang-22
riscv                 randconfig-001-20250814    clang-22
riscv                 randconfig-002-20250813    gcc-14.3.0
riscv                 randconfig-002-20250814    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250813    clang-22
s390                  randconfig-001-20250814    clang-22
s390                  randconfig-002-20250813    clang-18
s390                  randconfig-002-20250814    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250813    gcc-9.5.0
sh                    randconfig-001-20250814    clang-22
sh                    randconfig-002-20250813    gcc-9.5.0
sh                    randconfig-002-20250814    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250813    gcc-8.5.0
sparc                 randconfig-001-20250814    clang-22
sparc                 randconfig-002-20250813    gcc-15.1.0
sparc                 randconfig-002-20250814    clang-22
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250813    gcc-8.5.0
sparc64               randconfig-001-20250814    clang-22
sparc64               randconfig-002-20250813    clang-20
sparc64               randconfig-002-20250814    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250813    gcc-12
um                    randconfig-001-20250814    clang-22
um                    randconfig-002-20250813    gcc-11
um                    randconfig-002-20250814    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250813    gcc-12
x86_64      buildonly-randconfig-001-20250814    clang-20
x86_64      buildonly-randconfig-002-20250813    clang-20
x86_64      buildonly-randconfig-002-20250814    clang-20
x86_64      buildonly-randconfig-003-20250813    gcc-12
x86_64      buildonly-randconfig-003-20250814    clang-20
x86_64      buildonly-randconfig-004-20250813    clang-20
x86_64      buildonly-randconfig-004-20250814    clang-20
x86_64      buildonly-randconfig-005-20250813    clang-20
x86_64      buildonly-randconfig-005-20250814    clang-20
x86_64      buildonly-randconfig-006-20250813    gcc-12
x86_64      buildonly-randconfig-006-20250814    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250814    clang-20
x86_64                randconfig-002-20250814    clang-20
x86_64                randconfig-003-20250814    clang-20
x86_64                randconfig-004-20250814    clang-20
x86_64                randconfig-005-20250814    clang-20
x86_64                randconfig-006-20250814    clang-20
x86_64                randconfig-007-20250814    clang-20
x86_64                randconfig-008-20250814    clang-20
x86_64                randconfig-071-20250814    gcc-12
x86_64                randconfig-072-20250814    gcc-12
x86_64                randconfig-073-20250814    gcc-12
x86_64                randconfig-074-20250814    gcc-12
x86_64                randconfig-075-20250814    gcc-12
x86_64                randconfig-076-20250814    gcc-12
x86_64                randconfig-077-20250814    gcc-12
x86_64                randconfig-078-20250814    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250813    gcc-10.5.0
xtensa                randconfig-001-20250814    clang-22
xtensa                randconfig-002-20250813    gcc-12.5.0
xtensa                randconfig-002-20250814    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


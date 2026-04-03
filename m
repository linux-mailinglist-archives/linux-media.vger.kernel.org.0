Return-Path: <linux-media+bounces-58007-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMhdIGRHz2luuwYAu9opvQ
	(envelope-from <linux-media+bounces-58007-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 06:51:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 632A9390FB8
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 06:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63E243012A98
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 04:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F6834C990;
	Fri,  3 Apr 2026 04:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BoA7r6rx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB817081A
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 04:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775191901; cv=none; b=aPxhCL+BWDC3W9Rbt/Wxqg2jOzpTq5ieqRaCd/EtX7TKOtKajdoCDctrcW1Ix6wNOz3CIel59/jEiI7ZmgLYUYBxNQEowQ/MtxJTB0cA3aT2yD/2kY71uF3AG3tbP2F6ugZSPQAP5q5uRKcQvJ7dc6sAqlXyEud38NyJbIJa7Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775191901; c=relaxed/simple;
	bh=MsRCeLpVucDUqOxN6cU/JBXx1wA10rw2H0SByi+9P7M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=diSpZp6slkP4MbmdbMk2tgbmNwpNONfYsks8vNVb8jYXGyugoc0FwwJiC5PLlxfZEbgRDhQH8qBvGNeYDN9ZYqmJQp7HakEzF1ze7HMDg3j9XzG6dTI55peTDzytde0HYSGNkIx/DCbwCtZG9nuOI+VUCZsif8wiPSRo2Pstdm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BoA7r6rx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775191899; x=1806727899;
  h=date:from:to:cc:subject:message-id;
  bh=MsRCeLpVucDUqOxN6cU/JBXx1wA10rw2H0SByi+9P7M=;
  b=BoA7r6rxTc0MSQuO//7kBB84VyOHa5ZzkP8/VapX2tAPdw5RPUAVI3rP
   s+ACJcfwC/e5Hu4FQGgwKwvSCEiYRnMlIJAwGtPJ3tLndWWnf1LFy+IUA
   06sgSvDWKkI5SMrrerICdChc0l5vr98XcXWevr+oZay1geC6MFlVslj/P
   PAtEK9lAP9gp+U0A2vHQf6vWhSI/OCnXxhLNzBIEuL81VckxS2qN/Ez2W
   8BbjgTvF9IGVC2ox7kX8OylFOYjeirXDKZzT9dlFuAzJxqpEY0S6OuPOW
   X50au3UO47bQlD8AW45HjzDHs1PR7vd6KfdT8b+1f3EkSNqw3qpAzf8e5
   w==;
X-CSE-ConnectionGUID: QI3y83HlS0e/8Uc2yhLKuA==
X-CSE-MsgGUID: VDG2eEEiTbaBFlRen2j+cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86877204"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86877204"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 21:51:39 -0700
X-CSE-ConnectionGUID: QQ/k5B+XQc+Ka8OOtCuTtg==
X-CSE-MsgGUID: duOgOveWQA6A1OB5X7EFiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250373264"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Apr 2026 21:51:34 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8WVH-000000000pj-2Qwi;
	Fri, 03 Apr 2026 04:51:31 +0000
Date: Fri, 03 Apr 2026 12:50:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:pld] BUILD REGRESSION
 352b88b108f14823297a6a40306ee4cc6e2b36a8
Message-ID: <202604031244.N9RVX4HZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-58007-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 632A9390FB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git pld
branch HEAD: 352b88b108f14823297a6a40306ee4cc6e2b36a8  media: ipu-bridge: Prioritise _PLD over SSDB in rotation

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202604022233.XxAwrVdV-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202604022300.ObDwjXBo-lkp@intel.com

    drivers/media/v4l2-core/v4l2-fwnode.c:831:3: error: call to undeclared function '__acpi_handle_debug'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    include/linux/acpi.h:1275:33: error: implicit declaration of function '__acpi_handle_debug'; did you mean 'acpi_handle_debug'? [-Werror=implicit-function-declaration]
    include/linux/acpi.h:1275:33: error: implicit declaration of function '__acpi_handle_debug'; did you mean 'acpi_handle_debug'? [-Wimplicit-function-declaration]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- include-linux-acpi.h:error:implicit-declaration-of-function-__acpi_handle_debug
|-- arc-allmodconfig
|   `-- include-linux-acpi.h:error:implicit-declaration-of-function-__acpi_handle_debug
|-- arm-allyesconfig
|   `-- include-linux-acpi.h:error:implicit-declaration-of-function-__acpi_handle_debug
|-- hexagon-allmodconfig
|   `-- drivers-media-v4l2-core-v4l2-fwnode.c:error:call-to-undeclared-function-__acpi_handle_debug-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- m68k-allyesconfig
|   `-- include-linux-acpi.h:error:implicit-declaration-of-function-__acpi_handle_debug
|-- nios2-allmodconfig
|   `-- include-linux-acpi.h:error:implicit-declaration-of-function-__acpi_handle_debug
|-- openrisc-allmodconfig
|   `-- include-linux-acpi.h:error:implicit-declaration-of-function-__acpi_handle_debug
|-- parisc-allyesconfig
|   `-- include-linux-acpi.h:error:implicit-declaration-of-function-__acpi_handle_debug
|-- s390-allmodconfig
|   `-- drivers-media-v4l2-core-v4l2-fwnode.c:error:call-to-undeclared-function-__acpi_handle_debug-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- sh-allmodconfig
|   `-- include-linux-acpi.h:error:implicit-declaration-of-function-__acpi_handle_debug
|-- sh-allyesconfig
|   `-- include-linux-acpi.h:error:implicit-declaration-of-function-__acpi_handle_debug
|-- sparc64-allmodconfig
|   `-- drivers-media-v4l2-core-v4l2-fwnode.c:error:call-to-undeclared-function-__acpi_handle_debug-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- um-allmodconfig
|   `-- drivers-media-v4l2-core-v4l2-fwnode.c:error:call-to-undeclared-function-__acpi_handle_debug-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- um-allyesconfig
|   `-- include-linux-acpi.h:error:implicit-declaration-of-function-__acpi_handle_debug
`-- xtensa-allyesconfig
    `-- include-linux-acpi.h:error:implicit-declaration-of-function-__acpi_handle_debug

elapsed time: 746m

configs tested: 195
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260403    gcc-10.5.0
arc                   randconfig-002-20260403    gcc-10.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                         orion5x_defconfig    clang-23
arm                   randconfig-001-20260403    gcc-10.5.0
arm                   randconfig-002-20260403    gcc-10.5.0
arm                   randconfig-003-20260403    gcc-10.5.0
arm                   randconfig-004-20260403    gcc-10.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260403    gcc-13.4.0
arm64                 randconfig-002-20260403    gcc-13.4.0
arm64                 randconfig-003-20260403    gcc-13.4.0
arm64                 randconfig-004-20260403    gcc-13.4.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260403    gcc-13.4.0
csky                  randconfig-002-20260403    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260403    clang-23
hexagon               randconfig-002-20260403    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260403    gcc-14
i386        buildonly-randconfig-002-20260403    clang-20
i386        buildonly-randconfig-002-20260403    gcc-14
i386        buildonly-randconfig-003-20260403    gcc-14
i386        buildonly-randconfig-004-20260403    gcc-14
i386        buildonly-randconfig-005-20260403    gcc-14
i386        buildonly-randconfig-006-20260403    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260403    gcc-14
i386                  randconfig-002-20260403    gcc-14
i386                  randconfig-003-20260403    gcc-14
i386                  randconfig-004-20260403    gcc-14
i386                  randconfig-005-20260403    gcc-14
i386                  randconfig-006-20260403    gcc-14
i386                  randconfig-007-20260403    gcc-14
i386                  randconfig-011-20260403    clang-20
i386                  randconfig-012-20260403    clang-20
i386                  randconfig-013-20260403    clang-20
i386                  randconfig-014-20260403    clang-20
i386                  randconfig-015-20260403    clang-20
i386                  randconfig-016-20260403    clang-20
i386                  randconfig-017-20260403    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260403    clang-23
loongarch             randconfig-002-20260403    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260403    clang-23
nios2                 randconfig-002-20260403    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260403    gcc-10.5.0
parisc                randconfig-002-20260403    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260403    gcc-10.5.0
powerpc               randconfig-002-20260403    gcc-10.5.0
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260403    gcc-10.5.0
powerpc64             randconfig-002-20260403    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260403    clang-23
riscv                 randconfig-002-20260403    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260403    clang-23
s390                  randconfig-002-20260403    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                     magicpanelr2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260403    clang-23
sh                    randconfig-002-20260403    clang-23
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260403    clang-20
sparc                 randconfig-002-20260403    clang-20
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260403    clang-20
sparc64               randconfig-002-20260403    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260403    clang-20
um                    randconfig-002-20260403    clang-20
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260403    clang-20
x86_64      buildonly-randconfig-002-20260403    clang-20
x86_64      buildonly-randconfig-003-20260403    clang-20
x86_64      buildonly-randconfig-004-20260403    clang-20
x86_64      buildonly-randconfig-005-20260403    clang-20
x86_64      buildonly-randconfig-006-20260403    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260403    clang-20
x86_64                randconfig-002-20260403    clang-20
x86_64                randconfig-003-20260403    clang-20
x86_64                randconfig-004-20260403    clang-20
x86_64                randconfig-005-20260403    clang-20
x86_64                randconfig-006-20260403    clang-20
x86_64                randconfig-011-20260403    gcc-14
x86_64                randconfig-012-20260403    gcc-14
x86_64                randconfig-013-20260403    gcc-14
x86_64                randconfig-014-20260403    gcc-14
x86_64                randconfig-015-20260403    gcc-14
x86_64                randconfig-016-20260403    gcc-14
x86_64                randconfig-071-20260403    gcc-14
x86_64                randconfig-072-20260403    gcc-14
x86_64                randconfig-073-20260403    gcc-14
x86_64                randconfig-074-20260403    gcc-14
x86_64                randconfig-075-20260403    gcc-14
x86_64                randconfig-076-20260403    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260403    clang-20
xtensa                randconfig-002-20260403    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


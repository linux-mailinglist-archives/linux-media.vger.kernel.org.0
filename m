Return-Path: <linux-media+bounces-55282-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFEzFpa2sGlvmQIAu9opvQ
	(envelope-from <linux-media+bounces-55282-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 01:25:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C8811259C74
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 01:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E5970301AA9C
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 00:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2834327C00;
	Wed, 11 Mar 2026 00:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c38e+D6+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F931DF985
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 00:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188529; cv=none; b=YPTe2IAV12eo/7aa6M3NXxJVMCGsBPmOFCyuG6njyTiCZ6eXKouT1UXUs2WXUbaKC1qGUi1gE9kPFGgNtnlbVm5rxp4uPZtShUmi3dWCEMELcWKgS45wAqTyudvinrtgHHCufO+vuipfFueiDfwL4espWVyS1s2WJ3O7OpPrRd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188529; c=relaxed/simple;
	bh=oHWe+AoXXkzg4LzTjrBT6JUN6m3Cuh1zjlzaNPQQM5Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YfCPFYAYPLscbFavIOpTJLM9InSa5eTqgYnFWkYKJxz++jcJ9xb6aHqtaqy46LlpvwaSsGahvB4HMgtLz7U132BaTfnqVXQpYl67ETS6M+MBbYVSJIWwugh3YMhyASX1WTrzbvxZ3Vjnw3pXjCXUSypBWDqT7SqoVfP+Av8QQ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c38e+D6+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773188525; x=1804724525;
  h=date:from:to:cc:subject:message-id;
  bh=oHWe+AoXXkzg4LzTjrBT6JUN6m3Cuh1zjlzaNPQQM5Y=;
  b=c38e+D6+hhPiW2DBL8pjdBw1C4doe1xp0k/GPmHsu+MmOoxme6hc2OXI
   Ig8di/xyzRp7SJ7q6WcNosh3vlFKrDogdu+NPOTgpxZMQ9vx9Ca30eAtC
   cyGDwr2JL2oNqpuJ8kiO7PCGeM5EDoR4pbzZ+e0zvpONqY/M86bvI5F4V
   BUCdrdchtt0WYXzEJxyGpazOrB2ItViD+pktYI4gal+KhkGkAL5Yi1Y4Z
   xUp0yEnzHsYac6eJBPenCCJHUi+Sh7N+QOdtCaBLVR+gm9lYSnq5yYvId
   ttarrmR11mQvUHo5rFOBMjcHNgUiO3cnswVheFNML5bUE/XjtiIFiN5VM
   w==;
X-CSE-ConnectionGUID: hzT0jdEWRAe/5/babKmITA==
X-CSE-MsgGUID: 2LYvyL7OTJO2czEkjYNGYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85726935"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85726935"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 17:22:04 -0700
X-CSE-ConnectionGUID: ek6tYQ9qRXayvX7pe/r0Ww==
X-CSE-MsgGUID: 6GsAr+4+RN6wlT0mzhoxPg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Mar 2026 17:22:02 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w07Kp-000000000Qz-2MzU;
	Wed, 11 Mar 2026 00:21:59 +0000
Date: Wed, 11 Mar 2026 08:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 fe10e12126f557dbf7f975ecd7b25b6dd375f7f7
Message-ID: <202603110854.UwqTC0ow-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: C8811259C74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55282-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:mid]
X-Rspamd-Action: no action

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: fe10e12126f557dbf7f975ecd7b25b6dd375f7f7  media: v4l2-fwnode: Return -EPROBE_DEFER on parsing NULL endpoints

elapsed time: 727m

configs tested: 248
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260311    gcc-8.5.0
arc                   randconfig-002-20260311    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                           omap1_defconfig    gcc-15.2.0
arm                   randconfig-001-20260311    gcc-8.5.0
arm                   randconfig-002-20260311    gcc-8.5.0
arm                   randconfig-003-20260311    gcc-8.5.0
arm                   randconfig-004-20260311    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260311    gcc-12.5.0
arm64                 randconfig-002-20260311    gcc-12.5.0
arm64                 randconfig-003-20260311    gcc-12.5.0
arm64                 randconfig-004-20260311    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260311    gcc-12.5.0
csky                  randconfig-002-20260311    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260310    gcc-11.5.0
hexagon               randconfig-001-20260311    gcc-8.5.0
hexagon               randconfig-002-20260310    gcc-11.5.0
hexagon               randconfig-002-20260311    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260311    clang-20
i386        buildonly-randconfig-002-20260311    clang-20
i386        buildonly-randconfig-003-20260311    clang-20
i386        buildonly-randconfig-004-20260311    clang-20
i386        buildonly-randconfig-005-20260311    clang-20
i386        buildonly-randconfig-006-20260311    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260310    clang-20
i386                  randconfig-001-20260311    gcc-14
i386                  randconfig-002-20260310    clang-20
i386                  randconfig-002-20260311    gcc-14
i386                  randconfig-003-20260310    clang-20
i386                  randconfig-003-20260311    gcc-14
i386                  randconfig-004-20260310    clang-20
i386                  randconfig-004-20260311    gcc-14
i386                  randconfig-005-20260310    clang-20
i386                  randconfig-005-20260311    gcc-14
i386                  randconfig-006-20260310    clang-20
i386                  randconfig-006-20260311    gcc-14
i386                  randconfig-007-20260310    clang-20
i386                  randconfig-007-20260311    gcc-14
i386                  randconfig-011-20260310    gcc-14
i386                  randconfig-011-20260311    gcc-14
i386                  randconfig-012-20260310    clang-20
i386                  randconfig-012-20260311    gcc-14
i386                  randconfig-013-20260310    gcc-14
i386                  randconfig-013-20260311    gcc-14
i386                  randconfig-014-20260310    clang-20
i386                  randconfig-014-20260311    gcc-14
i386                  randconfig-015-20260310    clang-20
i386                  randconfig-015-20260311    gcc-14
i386                  randconfig-016-20260310    gcc-14
i386                  randconfig-016-20260311    gcc-14
i386                  randconfig-017-20260310    gcc-14
i386                  randconfig-017-20260311    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260310    gcc-11.5.0
loongarch             randconfig-001-20260311    gcc-8.5.0
loongarch             randconfig-002-20260310    gcc-11.5.0
loongarch             randconfig-002-20260311    gcc-8.5.0
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
nios2                 randconfig-001-20260310    gcc-11.5.0
nios2                 randconfig-001-20260311    gcc-8.5.0
nios2                 randconfig-002-20260310    gcc-11.5.0
nios2                 randconfig-002-20260311    gcc-8.5.0
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
parisc                randconfig-001-20260310    gcc-14.3.0
parisc                randconfig-001-20260310    gcc-15.2.0
parisc                randconfig-001-20260311    clang-23
parisc                randconfig-002-20260310    gcc-13.4.0
parisc                randconfig-002-20260310    gcc-15.2.0
parisc                randconfig-002-20260311    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260310    gcc-15.2.0
powerpc               randconfig-001-20260310    gcc-9.5.0
powerpc               randconfig-001-20260311    clang-23
powerpc               randconfig-002-20260310    clang-23
powerpc               randconfig-002-20260310    gcc-15.2.0
powerpc               randconfig-002-20260311    clang-23
powerpc                 xes_mpc85xx_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260310    gcc-15.2.0
powerpc64             randconfig-001-20260311    clang-23
powerpc64             randconfig-002-20260310    gcc-15.2.0
powerpc64             randconfig-002-20260310    gcc-8.5.0
powerpc64             randconfig-002-20260311    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        sh7785lcr_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260310    gcc-12.5.0
sparc                 randconfig-001-20260311    gcc-8.5.0
sparc                 randconfig-002-20260310    gcc-12.5.0
sparc                 randconfig-002-20260311    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260310    gcc-12.5.0
sparc64               randconfig-001-20260311    gcc-8.5.0
sparc64               randconfig-002-20260310    gcc-12.5.0
sparc64               randconfig-002-20260311    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260310    gcc-12.5.0
um                    randconfig-001-20260311    gcc-8.5.0
um                    randconfig-002-20260310    gcc-12.5.0
um                    randconfig-002-20260311    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260310    gcc-14
x86_64      buildonly-randconfig-001-20260311    clang-20
x86_64      buildonly-randconfig-002-20260310    gcc-14
x86_64      buildonly-randconfig-002-20260311    clang-20
x86_64      buildonly-randconfig-003-20260310    gcc-14
x86_64      buildonly-randconfig-003-20260311    clang-20
x86_64      buildonly-randconfig-004-20260310    gcc-14
x86_64      buildonly-randconfig-004-20260311    clang-20
x86_64      buildonly-randconfig-005-20260310    gcc-14
x86_64      buildonly-randconfig-005-20260311    clang-20
x86_64      buildonly-randconfig-006-20260310    gcc-14
x86_64      buildonly-randconfig-006-20260311    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260310    clang-20
x86_64                randconfig-001-20260311    gcc-14
x86_64                randconfig-002-20260310    clang-20
x86_64                randconfig-002-20260311    gcc-14
x86_64                randconfig-003-20260310    clang-20
x86_64                randconfig-003-20260311    gcc-14
x86_64                randconfig-004-20260310    clang-20
x86_64                randconfig-004-20260311    gcc-14
x86_64                randconfig-005-20260310    clang-20
x86_64                randconfig-005-20260311    gcc-14
x86_64                randconfig-006-20260310    clang-20
x86_64                randconfig-006-20260311    gcc-14
x86_64                randconfig-011-20260310    gcc-14
x86_64                randconfig-011-20260311    gcc-13
x86_64                randconfig-012-20260310    clang-20
x86_64                randconfig-012-20260311    gcc-13
x86_64                randconfig-013-20260310    gcc-14
x86_64                randconfig-013-20260311    gcc-13
x86_64                randconfig-014-20260310    clang-20
x86_64                randconfig-014-20260311    gcc-13
x86_64                randconfig-015-20260310    gcc-14
x86_64                randconfig-015-20260311    gcc-13
x86_64                randconfig-016-20260310    clang-20
x86_64                randconfig-016-20260311    gcc-13
x86_64                randconfig-071-20260311    gcc-14
x86_64                randconfig-072-20260311    gcc-14
x86_64                randconfig-073-20260311    gcc-14
x86_64                randconfig-074-20260311    gcc-14
x86_64                randconfig-075-20260311    gcc-14
x86_64                randconfig-076-20260311    gcc-14
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
xtensa                randconfig-001-20260310    gcc-12.5.0
xtensa                randconfig-001-20260311    gcc-8.5.0
xtensa                randconfig-002-20260310    gcc-12.5.0
xtensa                randconfig-002-20260311    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


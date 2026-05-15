Return-Path: <linux-media+bounces-61651-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKzAEoPzBmohpQIAu9opvQ
	(envelope-from <linux-media+bounces-61651-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:20:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFF554D387
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C266B304A41A
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC9E44CF29;
	Fri, 15 May 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+UqWDBM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFEB44B662
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840017; cv=none; b=oCGWPaujojppMKlvtkul0YLT6nwIJb/VtfD/YtMPIvRNef0s0Lu5+N7p73mel1X5RimNtktgju8UhN5tv6PltDqFC7UvRhHa2jh7e6VmU+xIUEAYVjrYFyyWPWJaME85qW5BoQPeh1Gi51wgIzQzYqcJHxXzJmN/9gzg+pMvlPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840017; c=relaxed/simple;
	bh=p2jpo76dpZBPOtPCX13uD9JRU3TkHvzWgHM7D9zSYgM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bkAZfe+L16BJIXni82TXNg5w+DvTGE/Gv83vmicQCdZrQxAYV8w4Dxe6Lw/sbFWLVVn3hytnfLHb3C8tBKI1HJp//lyf2T/o2imKlv0Y6dXsj8s6LboD8kdMBlKx/44CES4LcI+E86y9b7tKrHONNZKitUS72OK3N+kvim3MwSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+UqWDBM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778840016; x=1810376016;
  h=date:from:to:cc:subject:message-id;
  bh=p2jpo76dpZBPOtPCX13uD9JRU3TkHvzWgHM7D9zSYgM=;
  b=k+UqWDBMi0XNnGUPJ9W3JZ3AOhMoKbcSkYmfw81F3JoM49w6kVeN4daV
   /Q1V6Ua+io1tYHF8/noPurNUvfjRH6hsETvOefysqcxJ91cNTHQAenVnD
   BbAae4NUw+q+M6+Ykpa4L7e/nq9mJLtulrPSrGmrObRcp7L7UJc5Jazez
   9Ej7YUpvOkhYcvGqDEkBDZrxN3vZ2S5KhjseE8jvdo8m4tUAelEEoZe0Y
   qQidOvzW05vaiWEXHPVESk1XGhirpYbGCNKDyt+84jITY0xZDVaOY1wh5
   qAxrw73DFTc2lT1j04wpS392REfcKSdrrWTLWk7Ca38V5NKrAxTc+shX8
   Q==;
X-CSE-ConnectionGUID: rg1AtescSDe2dGaaFZIJWA==
X-CSE-MsgGUID: 164H1ug0RRSBIgA7qoOgvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="82361072"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="82361072"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 03:13:35 -0700
X-CSE-ConnectionGUID: Nrk12udIQtuNUimTY8d/hg==
X-CSE-MsgGUID: U55jOlHKSd+v6vjuDGc66g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="234405449"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 May 2026 03:13:34 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNpXP-000000001KN-2iX3;
	Fri, 15 May 2026 10:13:07 +0000
Date: Fri, 15 May 2026 18:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cvs] BUILD SUCCESS WITH WARNING
 b4dc6955e91d5c1a1c5e43cabb923227c3ed1225
Message-ID: <202605151846.IZ3JMHf1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: DFFF554D387
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-61651-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

tree/branch: git://linuxtv.org/sailus/media_tree.git cvs
branch HEAD: b4dc6955e91d5c1a1c5e43cabb923227c3ed1225  media: ipu-bridge: Add CVS support for IPU bridge driver

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202605151250.o6FD59VY-lkp@intel.com

    include/media/ipu6-pci-table.h:18:35: warning: 'ipu6_pci_tbl' defined but not used [-Wunused-const-variable=]

Warning ids grouped by kconfigs:

recent_errors
|-- i386-allmodconfig
|   `-- include-media-ipu6-pci-table.h:warning:ipu6_pci_tbl-defined-but-not-used
`-- i386-allyesconfig
    `-- include-media-ipu6-pci-table.h:warning:ipu6_pci_tbl-defined-but-not-used

elapsed time: 762m

configs tested: 230
configs skipped: 3

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
arc                   randconfig-001-20260515    clang-23
arc                   randconfig-002-20260515    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260515    clang-23
arm                   randconfig-002-20260515    clang-23
arm                   randconfig-003-20260515    clang-23
arm                   randconfig-004-20260515    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260515    gcc-11.5.0
arm64                 randconfig-002-20260515    gcc-11.5.0
arm64                 randconfig-003-20260515    gcc-11.5.0
arm64                 randconfig-004-20260515    gcc-11.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260515    gcc-11.5.0
csky                  randconfig-002-20260515    gcc-11.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260515    gcc-11.5.0
hexagon               randconfig-001-20260515    gcc-8.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260515    gcc-11.5.0
hexagon               randconfig-002-20260515    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260515    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260515    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260515    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260515    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260515    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260515    gcc-14
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    clang-20
i386                  randconfig-001-20260515    clang-20
i386                           randconfig-002    clang-20
i386                  randconfig-002-20260515    clang-20
i386                           randconfig-003    clang-20
i386                  randconfig-003-20260515    clang-20
i386                           randconfig-004    clang-20
i386                  randconfig-004-20260515    clang-20
i386                           randconfig-005    clang-20
i386                  randconfig-005-20260515    clang-20
i386                           randconfig-006    clang-20
i386                  randconfig-006-20260515    clang-20
i386                           randconfig-007    clang-20
i386                  randconfig-007-20260515    clang-20
i386                  randconfig-011-20260515    gcc-14
i386                  randconfig-012-20260515    gcc-14
i386                  randconfig-013-20260515    gcc-14
i386                  randconfig-014-20260515    gcc-14
i386                  randconfig-015-20260515    gcc-14
i386                  randconfig-016-20260515    gcc-14
i386                  randconfig-017-20260515    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260515    gcc-11.5.0
loongarch             randconfig-001-20260515    gcc-8.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260515    gcc-11.5.0
loongarch             randconfig-002-20260515    gcc-8.5.0
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
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260515    gcc-11.5.0
nios2                 randconfig-001-20260515    gcc-8.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260515    gcc-11.5.0
nios2                 randconfig-002-20260515    gcc-8.5.0
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
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260515    gcc-8.5.0
parisc                         randconfig-002    gcc-8.5.0
parisc                randconfig-002-20260515    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                        randconfig-001    gcc-8.5.0
powerpc               randconfig-001-20260515    gcc-8.5.0
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260515    gcc-8.5.0
powerpc64                      randconfig-001    gcc-8.5.0
powerpc64             randconfig-001-20260515    gcc-8.5.0
powerpc64                      randconfig-002    gcc-8.5.0
powerpc64             randconfig-002-20260515    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-15.2.0
riscv                 randconfig-001-20260515    gcc-15.2.0
riscv                          randconfig-002    gcc-15.2.0
riscv                 randconfig-002-20260515    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260515    gcc-15.2.0
s390                           randconfig-002    gcc-15.2.0
s390                  randconfig-002-20260515    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260515    gcc-15.2.0
sh                             randconfig-002    gcc-15.2.0
sh                    randconfig-002-20260515    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260515    gcc-8.5.0
sparc                 randconfig-002-20260515    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260515    gcc-8.5.0
sparc64               randconfig-002-20260515    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260515    gcc-8.5.0
um                    randconfig-002-20260515    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260515    gcc-14
x86_64      buildonly-randconfig-002-20260515    gcc-14
x86_64      buildonly-randconfig-003-20260515    gcc-14
x86_64      buildonly-randconfig-004-20260515    gcc-14
x86_64      buildonly-randconfig-005-20260515    gcc-14
x86_64      buildonly-randconfig-006-20260515    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260515    clang-20
x86_64                randconfig-002-20260515    clang-20
x86_64                randconfig-003-20260515    clang-20
x86_64                randconfig-004-20260515    clang-20
x86_64                randconfig-005-20260515    clang-20
x86_64                randconfig-006-20260515    clang-20
x86_64                randconfig-011-20260515    clang-20
x86_64                randconfig-012-20260515    clang-20
x86_64                randconfig-013-20260515    clang-20
x86_64                randconfig-014-20260515    clang-20
x86_64                randconfig-015-20260515    clang-20
x86_64                randconfig-016-20260515    clang-20
x86_64                randconfig-071-20260515    gcc-12
x86_64                randconfig-072-20260515    gcc-12
x86_64                randconfig-073-20260515    gcc-12
x86_64                randconfig-074-20260515    gcc-12
x86_64                randconfig-075-20260515    gcc-12
x86_64                randconfig-076-20260515    gcc-12
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
xtensa                randconfig-001-20260515    gcc-8.5.0
xtensa                randconfig-002-20260515    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


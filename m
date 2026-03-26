Return-Path: <linux-media+bounces-57133-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eYTEIFjuxGnv5AQAu9opvQ
	(envelope-from <linux-media+bounces-57133-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 09:29:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B92A3331591
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 09:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1EC80305679E
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 08:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C0B3BA23A;
	Thu, 26 Mar 2026 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="js6s5VJN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1378C3B775D
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 08:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513513; cv=none; b=tzsqitdsRrOFvbWBrQWf2CjdvlDeuWe9rSmou3OQbLvExrlJWTDnA+7I4gRcfHNL8xSYOMsq2NiJuZ977f8lvtlY6+Mp93eOnLhnaXm8pDY5h0wIwtxG6UU1Rr8UmtuDBFp18r7AkPUuQVvRZTvCCQdELvd24qRFcCv/RugbD2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513513; c=relaxed/simple;
	bh=vcU3JzI/wtmZNbkukI/o3r1yKPRyrSlR1d1bPYpOxrQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t76EKc5v5OruRQFZpFiQ1m517H+KCzIR9Q0g3xBPbvNmO04/ykaVJNFKVI//XuEPTLkQf0lJyBWstnPrVsp6iM6hP/SJykl7W6SRX3UDZEtGnYx8aJ3DDu1WLH74cNX6Qhc/l9i5b9aHEnLdPMcpvq0Xta9Tf7j3JGON6DMYB0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=js6s5VJN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774513511; x=1806049511;
  h=date:from:to:cc:subject:message-id;
  bh=vcU3JzI/wtmZNbkukI/o3r1yKPRyrSlR1d1bPYpOxrQ=;
  b=js6s5VJNKRMxp7LI2fd+abb/UZafIKPrsIeumgEFFGGUMsOHcXjsrpmK
   LXyDSQVifcvKY3J9f+6wKCruzspqrSqvs6nHXME/1pyvT6Elp0Zl1pI3X
   mJgyMLWVlDeq/ns4VhywwntDyQYXWGe3RP1B23pZSKuiWgupHdP23CcFe
   DGmGkTW3xEo1yexyUOgz3DdU70KhLwhEn02VwS2/7MHCpSZQO+b7yBHaB
   rFcb+YvW086i16l6wlvWl1aYe62nfLt8XBdKsKULebN3XikRprKycQ0YD
   L5i6VPtxNw6lGKYJuOcpTWtM20oJlEY5hadA8SSCqimJEC8qf/uW++woz
   Q==;
X-CSE-ConnectionGUID: tRI09JEuQH6h6P9eL2KfDQ==
X-CSE-MsgGUID: hMIpzPeMRW+AHI5U4kSS/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86939075"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="86939075"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 01:25:10 -0700
X-CSE-ConnectionGUID: xkd4VVPTTgKHQ7N72mT8tw==
X-CSE-MsgGUID: 8Z+LCtlSQzCBb/QfUXnlyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="220091150"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Mar 2026 01:25:08 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5g1a-000000008fZ-2tdn;
	Thu, 26 Mar 2026 08:25:06 +0000
Date: Thu, 26 Mar 2026 16:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 80dce41759a75f90cf78db1aa98256e70f94441c
Message-ID: <202603261644.0Uu4FokW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-57133-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: B92A3331591
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: 80dce41759a75f90cf78db1aa98256e70f94441c  media: v4l2-subdev: Fail {enable,disable}_streams and s_streaming nicely

elapsed time: 750m

configs tested: 165
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260326    gcc-8.5.0
arc                   randconfig-002-20260326    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                        keystone_defconfig    gcc-15.2.0
arm                   randconfig-001-20260326    gcc-8.5.0
arm                   randconfig-002-20260326    gcc-8.5.0
arm                   randconfig-003-20260326    gcc-8.5.0
arm                   randconfig-004-20260326    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260326    clang-19
arm64                 randconfig-002-20260326    clang-19
arm64                 randconfig-003-20260326    clang-19
arm64                 randconfig-004-20260326    clang-19
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260326    clang-19
csky                  randconfig-002-20260326    clang-19
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260326    gcc-8.5.0
hexagon               randconfig-002-20260326    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260326    gcc-14
i386        buildonly-randconfig-002-20260326    gcc-14
i386        buildonly-randconfig-003-20260326    gcc-14
i386        buildonly-randconfig-004-20260326    gcc-14
i386        buildonly-randconfig-005-20260326    gcc-14
i386        buildonly-randconfig-006-20260326    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260326    gcc-14
i386                  randconfig-002-20260326    gcc-14
i386                  randconfig-003-20260326    gcc-14
i386                  randconfig-004-20260326    gcc-14
i386                  randconfig-005-20260326    gcc-14
i386                  randconfig-006-20260326    gcc-14
i386                  randconfig-007-20260326    gcc-14
i386                  randconfig-011-20260326    clang-20
i386                  randconfig-012-20260326    clang-20
i386                  randconfig-013-20260326    clang-20
i386                  randconfig-014-20260326    clang-20
i386                  randconfig-015-20260326    clang-20
i386                  randconfig-016-20260326    clang-20
i386                  randconfig-017-20260326    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260326    gcc-8.5.0
loongarch             randconfig-002-20260326    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ip30_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260326    gcc-8.5.0
nios2                 randconfig-002-20260326    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260326    clang-19
parisc                randconfig-002-20260326    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260326    clang-19
powerpc               randconfig-002-20260326    clang-19
powerpc64             randconfig-001-20260326    clang-19
powerpc64             randconfig-002-20260326    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260326    clang-23
riscv                 randconfig-002-20260326    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260326    clang-23
s390                  randconfig-002-20260326    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260326    clang-23
sh                    randconfig-002-20260326    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260326    gcc-14
sparc                 randconfig-002-20260326    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260326    gcc-14
sparc64               randconfig-002-20260326    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260326    gcc-14
um                    randconfig-002-20260326    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260326    clang-20
x86_64      buildonly-randconfig-002-20260326    clang-20
x86_64      buildonly-randconfig-003-20260326    clang-20
x86_64      buildonly-randconfig-004-20260326    clang-20
x86_64      buildonly-randconfig-005-20260326    clang-20
x86_64      buildonly-randconfig-006-20260326    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260326    clang-20
x86_64                randconfig-002-20260326    clang-20
x86_64                randconfig-003-20260326    clang-20
x86_64                randconfig-004-20260326    clang-20
x86_64                randconfig-005-20260326    clang-20
x86_64                randconfig-006-20260326    clang-20
x86_64                randconfig-011-20260326    gcc-14
x86_64                randconfig-012-20260326    gcc-14
x86_64                randconfig-013-20260326    gcc-14
x86_64                randconfig-014-20260326    gcc-14
x86_64                randconfig-015-20260326    gcc-14
x86_64                randconfig-016-20260326    gcc-14
x86_64                randconfig-071-20260326    gcc-14
x86_64                randconfig-072-20260326    gcc-14
x86_64                randconfig-073-20260326    gcc-14
x86_64                randconfig-074-20260326    gcc-14
x86_64                randconfig-075-20260326    gcc-14
x86_64                randconfig-076-20260326    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260326    gcc-14
xtensa                randconfig-002-20260326    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


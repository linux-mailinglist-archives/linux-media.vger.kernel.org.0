Return-Path: <linux-media+bounces-56221-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGRvN+DWummfcAIAu9opvQ
	(envelope-from <linux-media+bounces-56221-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 17:46:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C3F2BF8BD
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 17:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E04B306AEFA
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 16:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE04A3A382E;
	Wed, 18 Mar 2026 16:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6hhKZco"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9938E28C5B1
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850996; cv=none; b=MWzLMxcON7pSf/XC08jWUlwEFSR21k92I2H4kWa7OhXNOsGIulhG9l/CttMaA/fXfcnC8+HiLXffZL4SJNOBrnSQdBmf95sfsRU3UojudQxVuuntnArEqkpkwFjJOg9w2Mq/RsCROTZsRo6J+yIdT+RKTxjwBIhlg2dbU+YQXoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850996; c=relaxed/simple;
	bh=HhrIQaUz2VMI4JNq/c0H6GkLSd1a8vD8DJKm4WKiJLY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O4bNGRshi3xBqIV/CLjoJCZIA3A2k4zYnWGu2QeEZkYukl4RvtYt+M/JG2yU5N2vJJU4A5YLpg6OyedBXBkoTbIyMEJuh864pzS7knmSVFjclmK+joAGoT3txuGUJMbKaUBunCvWKx1G3qYLIVbdjZDBEZ1yKddbRl7MDMUeaKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6hhKZco; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773850994; x=1805386994;
  h=date:from:to:cc:subject:message-id;
  bh=HhrIQaUz2VMI4JNq/c0H6GkLSd1a8vD8DJKm4WKiJLY=;
  b=a6hhKZcok4PbUkrdP44tb/NqWtd0CneDWlF7oq2/IMxPdjG/9in8myCO
   8FuFznig1MXqqHBjTElrfUW5jmh66Qrz8tKljC2dJ2ge71OpGreP/J1Ld
   rTG2cZNX5fkwBTxG1+whkwBt+zyeNMLl9IlhdPcUbtzwca3zmvIsBU/jq
   3aITL/HpefRAyb7gbGT4ixHv6WRrVoXiAgVDqa6Q4nTcvV0ahnI5hzqkc
   ZA3yaxKosZtMzBQUyiTlvNSGtUqVCZfUVDutGUuvNSGhEzMuZ2OuhvdYX
   G+dk4dY91AoKKYrBTfOc8XAhzOZdLZqGuzXOEF5ep2Zk05zSJa5Oz46K3
   w==;
X-CSE-ConnectionGUID: RYmvNt92R6mjMlMQfDjS7Q==
X-CSE-MsgGUID: HXWaHAwkQPyX3iNNqNk3wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85542336"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="85542336"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 09:23:13 -0700
X-CSE-ConnectionGUID: iVw/X2xhS6CDqZozYbEckA==
X-CSE-MsgGUID: kPbe/3cLRKqtp854CR0jqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="220104345"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Mar 2026 09:23:11 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2tfp-0000000037t-13Va;
	Wed, 18 Mar 2026 16:23:09 +0000
Date: Thu, 19 Mar 2026 00:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 c006fc896a2e67907a35a5a282acc0422d8b5f59
Message-ID: <202603190009.AAVb6nFe-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56221-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 63C3F2BF8BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: c006fc896a2e67907a35a5a282acc0422d8b5f59  media: subdev: Split v4l2_subdev_get_frame_desc_passthrough() into locked and unlocked

elapsed time: 1559m

configs tested: 245
configs skipped: 6

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
arc                   randconfig-001-20260318    gcc-14.3.0
arc                   randconfig-001-20260318    gcc-8.5.0
arc                   randconfig-002-20260318    gcc-14.3.0
arc                   randconfig-002-20260318    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260318    clang-23
arm                   randconfig-001-20260318    gcc-8.5.0
arm                   randconfig-002-20260318    clang-23
arm                   randconfig-002-20260318    gcc-8.5.0
arm                   randconfig-003-20260318    clang-23
arm                   randconfig-003-20260318    gcc-8.5.0
arm                   randconfig-004-20260318    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260318    clang-23
arm64                 randconfig-001-20260318    gcc-8.5.0
arm64                 randconfig-002-20260318    clang-23
arm64                 randconfig-002-20260318    gcc-15.2.0
arm64                 randconfig-003-20260318    clang-23
arm64                 randconfig-004-20260318    clang-23
arm64                 randconfig-004-20260318    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260318    clang-23
csky                  randconfig-001-20260318    gcc-13.4.0
csky                  randconfig-002-20260318    clang-23
csky                  randconfig-002-20260318    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260318    clang-23
hexagon               randconfig-001-20260318    gcc-8.5.0
hexagon               randconfig-002-20260318    clang-23
hexagon               randconfig-002-20260318    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260318    clang-20
i386        buildonly-randconfig-001-20260318    gcc-14
i386        buildonly-randconfig-002-20260318    gcc-14
i386        buildonly-randconfig-003-20260318    clang-20
i386        buildonly-randconfig-003-20260318    gcc-14
i386        buildonly-randconfig-004-20260318    gcc-14
i386        buildonly-randconfig-005-20260318    gcc-14
i386        buildonly-randconfig-006-20260318    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260318    gcc-14
i386                  randconfig-002-20260318    gcc-14
i386                  randconfig-003-20260318    clang-20
i386                  randconfig-003-20260318    gcc-14
i386                  randconfig-004-20260318    gcc-14
i386                  randconfig-005-20260318    clang-20
i386                  randconfig-005-20260318    gcc-14
i386                  randconfig-006-20260318    gcc-14
i386                  randconfig-007-20260318    gcc-14
i386                  randconfig-011-20260318    gcc-14
i386                  randconfig-012-20260318    gcc-13
i386                  randconfig-013-20260318    clang-20
i386                  randconfig-014-20260318    clang-20
i386                  randconfig-015-20260318    clang-20
i386                  randconfig-016-20260318    clang-20
i386                  randconfig-017-20260318    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260318    clang-23
loongarch             randconfig-001-20260318    gcc-8.5.0
loongarch             randconfig-002-20260318    gcc-15.2.0
loongarch             randconfig-002-20260318    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                         apollo_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260318    gcc-8.5.0
nios2                 randconfig-002-20260318    gcc-11.5.0
nios2                 randconfig-002-20260318    gcc-8.5.0
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
parisc                randconfig-001-20260318    gcc-11.5.0
parisc                randconfig-001-20260318    gcc-15.2.0
parisc                randconfig-002-20260318    gcc-11.5.0
parisc                randconfig-002-20260318    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      ppc44x_defconfig    clang-23
powerpc               randconfig-001-20260318    clang-23
powerpc               randconfig-001-20260318    gcc-11.5.0
powerpc               randconfig-002-20260318    gcc-11.5.0
powerpc               randconfig-002-20260318    gcc-12.5.0
powerpc                     tqm8548_defconfig    clang-23
powerpc64             randconfig-001-20260318    gcc-11.5.0
powerpc64             randconfig-002-20260318    clang-23
powerpc64             randconfig-002-20260318    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260318    gcc-13.4.0
riscv                 randconfig-001-20260318    gcc-15.2.0
riscv                 randconfig-002-20260318    gcc-12.5.0
riscv                 randconfig-002-20260318    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260318    gcc-11.5.0
s390                  randconfig-001-20260318    gcc-15.2.0
s390                  randconfig-002-20260318    gcc-15.2.0
s390                  randconfig-002-20260318    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260318    gcc-15.2.0
sh                    randconfig-001-20260318    gcc-9.5.0
sh                    randconfig-002-20260318    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260318    gcc-13.4.0
sparc                 randconfig-001-20260318    gcc-8.5.0
sparc                 randconfig-002-20260318    gcc-13.4.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260318    gcc-13.4.0
sparc64               randconfig-001-20260318    gcc-8.5.0
sparc64               randconfig-002-20260318    gcc-13.4.0
sparc64               randconfig-002-20260318    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260318    gcc-13.4.0
um                    randconfig-001-20260318    gcc-14
um                    randconfig-002-20260318    clang-23
um                    randconfig-002-20260318    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260318    gcc-14
x86_64      buildonly-randconfig-002-20260318    gcc-14
x86_64      buildonly-randconfig-003-20260318    gcc-14
x86_64      buildonly-randconfig-004-20260318    clang-20
x86_64      buildonly-randconfig-004-20260318    gcc-14
x86_64      buildonly-randconfig-005-20260318    clang-20
x86_64      buildonly-randconfig-005-20260318    gcc-14
x86_64      buildonly-randconfig-006-20260318    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260318    clang-20
x86_64                randconfig-001-20260318    gcc-14
x86_64                randconfig-002-20260318    gcc-14
x86_64                randconfig-003-20260318    gcc-14
x86_64                randconfig-004-20260318    gcc-14
x86_64                randconfig-005-20260318    gcc-14
x86_64                randconfig-006-20260318    clang-20
x86_64                randconfig-006-20260318    gcc-14
x86_64                randconfig-011-20260318    clang-20
x86_64                randconfig-012-20260318    clang-20
x86_64                randconfig-012-20260318    gcc-14
x86_64                randconfig-013-20260318    clang-20
x86_64                randconfig-013-20260318    gcc-14
x86_64                randconfig-014-20260318    clang-20
x86_64                randconfig-015-20260318    clang-20
x86_64                randconfig-015-20260318    gcc-14
x86_64                randconfig-016-20260318    clang-20
x86_64                randconfig-071-20260318    gcc-14
x86_64                randconfig-072-20260318    gcc-14
x86_64                randconfig-073-20260318    clang-20
x86_64                randconfig-074-20260318    gcc-14
x86_64                randconfig-075-20260318    gcc-14
x86_64                randconfig-076-20260318    gcc-14
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
xtensa                randconfig-001-20260318    gcc-13.4.0
xtensa                randconfig-001-20260318    gcc-8.5.0
xtensa                randconfig-002-20260318    gcc-13.4.0
xtensa                randconfig-002-20260318    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


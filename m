Return-Path: <linux-media+bounces-67200-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GGVEByLmT2q1pwIAu9opvQ
	(envelope-from <linux-media+bounces-67200-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 20:19:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF75734312
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 20:19:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="AzVS9mO/";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67200-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67200-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68DBB30128FA
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 18:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1AE4DBD67;
	Thu,  9 Jul 2026 18:19:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5CC4DB553
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 18:19:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621147; cv=none; b=eLwuMC3L9TQom4yLySffYKQRghEkgKJxHOTE0GN+fq7mf2ZAbu88DGzbyK2BQDICJefIhxhHeRUwca1GQnKD8QQA61EegbdTNEbWxFJClbQ+/g5aPv087B4z/iuIxL3hzl4eufUHdOwo2hcyxMdA5xMdLsI5bj1N1rh+xQOqm6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621147; c=relaxed/simple;
	bh=T89z5kjHIC2cSRghZsoj0/xLDhrYaiEYCAMKHQN34+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hH6u8Yc6FFdNgIQhEgLtoxgsiBZIl4VwRGGx8lQA4puvopFHCbubJ+WAZG+ksorW9w/y/dHAU0BD6ki3IRYjRu3Ef216cY7xiUCPzmFW9TBJnGUrdXRADrCMO2wEsl0HGbvkn9JNSmmPCQkGYTPzW64j0oynJfgvZtzsuvFLiuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzVS9mO/; arc=none smtp.client-ip=192.198.163.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783621145; x=1815157145;
  h=date:from:to:cc:subject:message-id;
  bh=T89z5kjHIC2cSRghZsoj0/xLDhrYaiEYCAMKHQN34+8=;
  b=AzVS9mO//0igSh6+BmXUVNT0Ph2yGjogexpBS+OmSXcCfDI1KgHaLBX9
   dsftIObEJvqzzpb/oM06P4NzNtBUr03QlSFS4xYA2Nr8A3OC+xGSwA9CO
   RWxlE7v0m5938NeYRPM9q9/u4TqIgLlotmIZfCDz3mG5uGPwRUXgwaRdD
   QK/Mqcte+fJfnBg273sTt/ILwsdo72L+ODEqkDxHq+WYYrsxz3HnuZpxI
   ZBud7ujIvTMEcVX3AeiYWa09PT7AOoEkqX+Vl3wEPmK+auaTck4LP8cqz
   e5Neeq+TZpBTilvtQOuOlsMhDZflFvSJ4XT6LWiCUtFUgG9XVtIKKAIQ0
   g==;
X-CSE-ConnectionGUID: kKHT/DUPSNKqJXDsU+XhuA==
X-CSE-MsgGUID: Su5KVhRfRIiWnt1YNprGHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84429470"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84429470"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 11:19:05 -0700
X-CSE-ConnectionGUID: QVfzN5l3TPeYW9DoByVl0Q==
X-CSE-MsgGUID: /dUeLdg/SkO+WARoSt9gmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252003379"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 09 Jul 2026 11:19:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whtKv-00000000Hyz-0cfr;
	Thu, 09 Jul 2026 18:19:01 +0000
Date: Fri, 10 Jul 2026 02:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 bf40cc53b1e00c312046f6dd88e9054bc91865af
Message-ID: <202607100256.EKZ4sqxu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67200-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CF75734312

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: bf40cc53b1e00c312046f6dd88e9054bc91865af  media: i2c: imx678: Add driver for Sony IMX678

elapsed time: 955m

configs tested: 147
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260709    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260709    gcc-8.5.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260709    gcc-14.3.0
arm                            randconfig-002    gcc-15.2.0
arm                   randconfig-002-20260709    clang-23
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260709    gcc-14.3.0
arm                            randconfig-004    gcc-13.4.0
arm                   randconfig-004-20260709    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-14.3.0
arm64                 randconfig-001-20260709    clang-22
arm64                          randconfig-002    gcc-8.5.0
arm64                 randconfig-002-20260709    gcc-8.5.0
arm64                          randconfig-003    clang-20
arm64                 randconfig-003-20260709    clang-22
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260709    gcc-8.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-13.4.0
csky                  randconfig-001-20260709    gcc-14.3.0
csky                           randconfig-002    gcc-14.3.0
csky                  randconfig-002-20260709    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260709    clang-17
hexagon               randconfig-002-20260709    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260709    gcc-14
i386        buildonly-randconfig-002-20260709    gcc-14
i386        buildonly-randconfig-003-20260709    gcc-13
i386        buildonly-randconfig-004-20260709    gcc-14
i386        buildonly-randconfig-005-20260709    clang-22
i386        buildonly-randconfig-006-20260709    gcc-14
i386                                defconfig    clang-22
i386                  randconfig-011-20260709    clang-22
i386                  randconfig-012-20260709    gcc-14
i386                  randconfig-013-20260709    clang-22
i386                  randconfig-014-20260709    gcc-14
i386                  randconfig-015-20260709    clang-22
i386                  randconfig-016-20260709    clang-22
i386                  randconfig-017-20260709    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260709    clang-18
loongarch             randconfig-002-20260709    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                      malta_kvm_defconfig    gcc-16.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260709    gcc-8.5.0
nios2                 randconfig-002-20260709    gcc-8.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260710    gcc-9.5.0
parisc                randconfig-002-20260710    gcc-11.5.0
parisc64                            defconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260710    gcc-14.3.0
powerpc               randconfig-002-20260710    clang-17
powerpc64             randconfig-001-20260710    clang-23
powerpc64             randconfig-002-20260710    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260709    clang-23
riscv                 randconfig-002-20260709    gcc-10.5.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                  randconfig-001-20260709    clang-17
s390                  randconfig-002-20260709    clang-22
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260709    gcc-16.1.0
sh                    randconfig-002-20260709    gcc-12.5.0
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260709    gcc-15.2.0
sparc                 randconfig-002-20260709    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64               randconfig-001-20260709    gcc-15.2.0
sparc64               randconfig-002-20260709    clang-23
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260709    gcc-14
um                    randconfig-002-20260709    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-22
x86_64                              defconfig    gcc-14
x86_64                         randconfig-001    gcc-14
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-006-20260709    gcc-14
x86_64                randconfig-013-20260709    gcc-14
x86_64                randconfig-014-20260709    clang-22
x86_64                randconfig-015-20260709    gcc-13
x86_64                randconfig-071-20260709    gcc-14
x86_64                randconfig-072-20260709    gcc-14
x86_64                randconfig-073-20260709    gcc-13
x86_64                randconfig-074-20260709    gcc-14
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-076-20260709    clang-22
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260709    gcc-8.5.0
xtensa                randconfig-002-20260709    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


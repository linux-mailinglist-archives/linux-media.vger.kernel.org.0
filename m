Return-Path: <linux-media+bounces-62073-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKy1G0XJC2pSNQUAu9opvQ
	(envelope-from <linux-media+bounces-62073-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:21:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C864A576651
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD5B6304423C
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 02:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC46314B62;
	Tue, 19 May 2026 02:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1W+0jaC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79BC30C15F
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 02:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779157212; cv=none; b=WTX7rUydyyv1SuMAip1DU2Ewkyg4aehfqn/thtWVek1uat4R2zUaky6aF1AmLC6le3In+FzQbIykecSfOa99+CDTzgLyKABYFmMv3zdb5hmf3zWfRohzCYhXvTHuBoDFgCame7j4QtlmkQFPap6Z76sBdsY/824VKcStifVTV+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779157212; c=relaxed/simple;
	bh=/00N0dtm68aD1ephhtjfyW0lm5R5kWg2DQ4lK1Oz+Ew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ADZx8kBTTl87zKXQbKEeGk+lzmbCizKNYnLuNsuICmV1RX1/VcHrM3WnDIvz5fgmttoX7h3waDa9RgOTh6PBfkxUuRAGKQmwAix8JrmFPF/cPwwrF/k4cKlpngjFUdIv4GZX8uQfP6vxAH3MYcs+n1ItGg9fqJ9CRrdwjWV2PUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1W+0jaC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779157211; x=1810693211;
  h=date:from:to:cc:subject:message-id;
  bh=/00N0dtm68aD1ephhtjfyW0lm5R5kWg2DQ4lK1Oz+Ew=;
  b=M1W+0jaCr2Tj3H3yQqctNT/608jN5fJxU1aUufF8O7tmysEqzzITGhHA
   AhEbP+RqUfSUygbd5j6qDLOOZiBCr6lN6lJBROFa9upoRiwReAfvpL1SM
   XcoJr7e4/NHzvBiB4EXhbpxnyJJgl1Xg7Zli0d2uzJlxq/YgXJr5OXRWA
   ObnJ6vDUon0h6sCXMGeU+VZQ+c4sk3s1b+ki5oPZbxIPeFC8V+2bx4Z2q
   j14MJAmq9teIpW9BSUNy+0Hv4g4/k2rxXATxvTKwADEfgdAGDF2roWYZW
   LXEBEMgQr1OHDCdx3r6G179fQWieoSDCJFgcGsEqTVBBmXEXzzZg+vRID
   Q==;
X-CSE-ConnectionGUID: UrJ9oh4gSEeX38o8k7921g==
X-CSE-MsgGUID: V7A0qbZESbKvvPgHoRlkiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79876576"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79876576"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:20:11 -0700
X-CSE-ConnectionGUID: f4BRMyJ4QV+3gnNTBJk+sw==
X-CSE-MsgGUID: tkapHVdTRS6m95zlVWjlcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235169317"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2026 19:20:09 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPA37-000000000DT-08Mw;
	Tue, 19 May 2026 02:19:24 +0000
Date: Tue, 19 May 2026 10:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 d97d13c24d7893abcfb80d38630ce74daaa1434c
Message-ID: <202605191014.uTRHvTqK-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-62073-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxtv.org:url,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: C864A576651
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: d97d13c24d7893abcfb80d38630ce74daaa1434c  media: imon: Add iMON VFD HID OEM v1.2 key mappings

elapsed time: 837m

configs tested: 300
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260518    gcc-9.5.0
arc                   randconfig-001-20260519    clang-23
arc                   randconfig-001-20260519    gcc-9.5.0
arc                   randconfig-002-20260518    gcc-8.5.0
arc                   randconfig-002-20260519    clang-23
arc                   randconfig-002-20260519    gcc-10.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260518    clang-23
arm                   randconfig-001-20260519    clang-23
arm                   randconfig-002-20260518    gcc-8.5.0
arm                   randconfig-002-20260519    clang-23
arm                   randconfig-003-20260518    gcc-8.5.0
arm                   randconfig-003-20260519    clang-23
arm                   randconfig-004-20260518    gcc-10.5.0
arm                   randconfig-004-20260519    clang-23
arm                   randconfig-004-20260519    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260518    clang-17
arm64                 randconfig-001-20260519    gcc-8.5.0
arm64                 randconfig-002-20260518    gcc-8.5.0
arm64                 randconfig-002-20260519    gcc-8.5.0
arm64                 randconfig-003-20260518    gcc-15.2.0
arm64                 randconfig-003-20260519    gcc-8.5.0
arm64                 randconfig-004-20260518    clang-23
arm64                 randconfig-004-20260519    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260518    gcc-15.2.0
csky                  randconfig-001-20260519    gcc-8.5.0
csky                  randconfig-002-20260518    gcc-11.5.0
csky                  randconfig-002-20260519    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    clang-17
hexagon               randconfig-001-20260518    clang-16
hexagon               randconfig-001-20260519    clang-23
hexagon               randconfig-001-20260519    gcc-10.5.0
hexagon                        randconfig-002    clang-23
hexagon               randconfig-002-20260518    clang-23
hexagon               randconfig-002-20260519    clang-23
hexagon               randconfig-002-20260519    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260518    clang-20
i386        buildonly-randconfig-001-20260519    gcc-12
i386        buildonly-randconfig-002-20260518    clang-20
i386        buildonly-randconfig-002-20260519    gcc-12
i386        buildonly-randconfig-003-20260518    gcc-14
i386        buildonly-randconfig-003-20260519    gcc-12
i386        buildonly-randconfig-004-20260518    gcc-14
i386        buildonly-randconfig-004-20260519    gcc-12
i386        buildonly-randconfig-005-20260518    gcc-14
i386        buildonly-randconfig-005-20260519    gcc-12
i386        buildonly-randconfig-006-20260518    clang-20
i386        buildonly-randconfig-006-20260519    gcc-12
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260519    gcc-14
i386                  randconfig-002-20260519    gcc-14
i386                  randconfig-003-20260519    gcc-14
i386                  randconfig-004-20260519    gcc-14
i386                  randconfig-005-20260519    gcc-12
i386                  randconfig-005-20260519    gcc-14
i386                  randconfig-006-20260519    clang-20
i386                  randconfig-006-20260519    gcc-14
i386                  randconfig-007-20260519    clang-20
i386                  randconfig-007-20260519    gcc-14
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260518    gcc-14
i386                  randconfig-011-20260519    gcc-14
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260518    clang-20
i386                  randconfig-012-20260519    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260518    gcc-14
i386                  randconfig-013-20260519    gcc-14
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260518    gcc-14
i386                  randconfig-014-20260519    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260518    clang-20
i386                  randconfig-015-20260519    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260518    gcc-14
i386                  randconfig-016-20260519    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260518    gcc-14
i386                  randconfig-017-20260519    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    clang-18
loongarch             randconfig-001-20260518    gcc-15.2.0
loongarch             randconfig-001-20260519    clang-18
loongarch             randconfig-001-20260519    clang-23
loongarch             randconfig-001-20260519    gcc-10.5.0
loongarch                      randconfig-002    gcc-13.4.0
loongarch             randconfig-002-20260518    clang-23
loongarch             randconfig-002-20260519    clang-23
loongarch             randconfig-002-20260519    gcc-10.5.0
loongarch             randconfig-002-20260519    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    gcc-15.2.0
m68k                        m5407c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        bcm47xx_defconfig    clang-18
mips                     decstation_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260518    gcc-11.5.0
nios2                 randconfig-001-20260519    gcc-10.5.0
nios2                 randconfig-001-20260519    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260518    gcc-11.5.0
nios2                 randconfig-002-20260519    gcc-10.5.0
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
parisc                randconfig-001-20260518    gcc-15.2.0
parisc                randconfig-001-20260519    gcc-12.5.0
parisc                randconfig-001-20260519    gcc-8.5.0
parisc                randconfig-002-20260518    gcc-12.5.0
parisc                randconfig-002-20260519    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260518    clang-23
powerpc               randconfig-001-20260519    clang-23
powerpc               randconfig-001-20260519    gcc-8.5.0
powerpc               randconfig-002-20260518    clang-23
powerpc               randconfig-002-20260519    gcc-8.5.0
powerpc64             randconfig-001-20260518    gcc-11.5.0
powerpc64             randconfig-001-20260519    clang-23
powerpc64             randconfig-001-20260519    gcc-8.5.0
powerpc64             randconfig-002-20260518    clang-23
powerpc64             randconfig-002-20260519    gcc-14.3.0
powerpc64             randconfig-002-20260519    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260519    gcc-13.4.0
riscv                 randconfig-002-20260519    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260519    gcc-13.4.0
s390                  randconfig-002-20260519    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260519    gcc-13.4.0
sh                    randconfig-002-20260519    gcc-13.4.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260518    gcc-15.2.0
sparc                 randconfig-001-20260519    gcc-14.3.0
sparc                 randconfig-002-20260518    gcc-15.2.0
sparc                 randconfig-002-20260519    gcc-14.3.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260518    clang-23
sparc64               randconfig-001-20260519    gcc-14.3.0
sparc64               randconfig-002-20260518    clang-23
sparc64               randconfig-002-20260519    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260518    clang-16
um                    randconfig-001-20260519    gcc-14.3.0
um                    randconfig-002-20260518    clang-23
um                    randconfig-002-20260519    gcc-14.3.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260518    clang-20
x86_64      buildonly-randconfig-001-20260519    gcc-14
x86_64      buildonly-randconfig-002-20260518    clang-20
x86_64      buildonly-randconfig-002-20260519    gcc-14
x86_64      buildonly-randconfig-003-20260518    clang-20
x86_64      buildonly-randconfig-003-20260519    gcc-14
x86_64      buildonly-randconfig-004-20260518    gcc-14
x86_64      buildonly-randconfig-004-20260519    gcc-14
x86_64      buildonly-randconfig-005-20260518    gcc-14
x86_64      buildonly-randconfig-005-20260519    gcc-14
x86_64      buildonly-randconfig-006-20260518    clang-20
x86_64      buildonly-randconfig-006-20260519    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260518    gcc-14
x86_64                randconfig-001-20260519    clang-20
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260518    clang-20
x86_64                randconfig-002-20260519    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260518    gcc-14
x86_64                randconfig-003-20260519    clang-20
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260518    gcc-14
x86_64                randconfig-004-20260519    clang-20
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260518    gcc-14
x86_64                randconfig-005-20260519    clang-20
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260518    gcc-14
x86_64                randconfig-006-20260519    clang-20
x86_64                randconfig-011-20260519    clang-20
x86_64                randconfig-011-20260519    gcc-14
x86_64                randconfig-012-20260519    clang-20
x86_64                randconfig-013-20260519    clang-20
x86_64                randconfig-014-20260519    clang-20
x86_64                randconfig-014-20260519    gcc-14
x86_64                randconfig-015-20260519    clang-20
x86_64                randconfig-016-20260519    clang-20
x86_64                randconfig-071-20260519    gcc-14
x86_64                randconfig-072-20260519    gcc-14
x86_64                randconfig-073-20260519    gcc-14
x86_64                randconfig-074-20260519    gcc-14
x86_64                randconfig-075-20260519    gcc-14
x86_64                randconfig-076-20260519    gcc-14
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
xtensa                randconfig-001-20260518    gcc-12.5.0
xtensa                randconfig-001-20260519    gcc-14.3.0
xtensa                randconfig-002-20260518    gcc-9.5.0
xtensa                randconfig-002-20260519    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


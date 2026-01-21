Return-Path: <linux-media+bounces-51240-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yESEKM/fcGnCaQAAu9opvQ
	(envelope-from <linux-media+bounces-51240-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:16:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 459E858423
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78B0C5A639D
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 13:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0283F23CD;
	Wed, 21 Jan 2026 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mCdWYyyH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EBB352C40
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 13:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769002722; cv=none; b=FEWGfb/yMPBUYJOCH3rBub/enhYIdvpcHaQWSKPBgCw9dCPKWXsbm/aBlCgYBKeuD2m2ZVZ51i8LJaPuY6Zb8KT1P78RfNvPQCXuhQArL1QWKVkWKr5hf7Qe1PcuH2MJddXP3hj34E/5uHjAs9XwmGtjBQkZCk6tpbV3sVjFWFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769002722; c=relaxed/simple;
	bh=A94AKHpcGvOJWxpWkAXJyeMeY1C/eDKGmzrvDs131/8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KaRKTZst5F9LvhsHqRAwqyfWTSVIRN5rZNIcR7ivpF7XYRL9E4YVL6vv7VAvMpPPGTIgjfbQTlYmgLDEFz3ZQTCd69z0lJkI5MvBUuuCrk7djx6FhlgrfSSRzLn04yA/r1Q50HJIZt/wbyIo1T9uDImFenpjQZEAd+M2Mc8SESE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mCdWYyyH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769002721; x=1800538721;
  h=date:from:to:cc:subject:message-id;
  bh=A94AKHpcGvOJWxpWkAXJyeMeY1C/eDKGmzrvDs131/8=;
  b=mCdWYyyHVSn5jOjkB8HbXartO6BwM0RmYFNe7JZlKuAzvlMWv3P6u6iB
   +4aWYS2vBFuZmGaetn+J0lS8C4fpLMspnb0mcf739Ml/3ELml/DkOIfPT
   MAGn+B7D73RqYFKnPKKExTJLptkjIaRX8sNulV4+g9saPAd8vBHeoXqOb
   AY06HAa7Ink3E2w24kQ+w+5ERFWPcS0VusSCrkIUqICNLfiAbm1x6QQAf
   ysYkrJEBuvaFWQxMVl2o7JOlHc4sF8JpDV/O+gQQ/c0lK/mt8kGzjkXxl
   QicTjYZ3bIZwSNUxqPm4DndR46WLnzI30jRmLXRCe0g/Fi3ZkU7wOu47n
   A==;
X-CSE-ConnectionGUID: Zjy4ghm8TSyUbW9kVU+Ykg==
X-CSE-MsgGUID: edjYGPKVTneCkoBbl0oSWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70321742"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70321742"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 05:38:40 -0800
X-CSE-ConnectionGUID: ABy31fn8QDGFmT84lzjp6A==
X-CSE-MsgGUID: V+8BK1EHSiG5R+iLMUTUSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="210957466"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jan 2026 05:38:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viYPs-00000000RGX-1bTW;
	Wed, 21 Jan 2026 13:38:36 +0000
Date: Wed, 21 Jan 2026 21:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 dde659d37036c6edf5eeef81274b43fe12dfad53
Message-ID: <202601212110.jNy3clww-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51240-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[xs4all.nl];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 459E858423
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: dde659d37036c6edf5eeef81274b43fe12dfad53  media: iris: Introduce vpu ops for vpu4 with necessary hooks

elapsed time: 1146m

configs tested: 236
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.2.0
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260121    clang-18
arc                   randconfig-002-20260121    clang-18
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                        neponset_defconfig    gcc-15.2.0
arm                   randconfig-001-20260121    clang-18
arm                   randconfig-002-20260121    clang-18
arm                   randconfig-003-20260121    clang-18
arm                   randconfig-004-20260121    clang-18
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260121    gcc-15.2.0
arm64                 randconfig-002-20260121    clang-22
arm64                 randconfig-002-20260121    gcc-15.2.0
arm64                 randconfig-003-20260121    clang-22
arm64                 randconfig-003-20260121    gcc-15.2.0
arm64                 randconfig-004-20260121    gcc-12.5.0
arm64                 randconfig-004-20260121    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260121    gcc-15.2.0
csky                  randconfig-001-20260121    gcc-9.5.0
csky                  randconfig-002-20260121    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260121    clang-19
hexagon               randconfig-001-20260121    gcc-15.2.0
hexagon               randconfig-002-20260121    clang-22
hexagon               randconfig-002-20260121    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260121    clang-20
i386        buildonly-randconfig-002-20260121    clang-20
i386        buildonly-randconfig-002-20260121    gcc-14
i386        buildonly-randconfig-003-20260121    clang-20
i386        buildonly-randconfig-003-20260121    gcc-13
i386        buildonly-randconfig-004-20260121    clang-20
i386        buildonly-randconfig-005-20260121    clang-20
i386        buildonly-randconfig-006-20260121    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260121    clang-20
i386                  randconfig-002-20260121    clang-20
i386                  randconfig-003-20260121    clang-20
i386                  randconfig-004-20260121    clang-20
i386                  randconfig-005-20260121    clang-20
i386                  randconfig-006-20260121    clang-20
i386                  randconfig-007-20260121    clang-20
i386                  randconfig-011-20260121    gcc-14
i386                  randconfig-012-20260121    gcc-14
i386                  randconfig-013-20260121    clang-20
i386                  randconfig-013-20260121    gcc-14
i386                  randconfig-014-20260121    gcc-12
i386                  randconfig-014-20260121    gcc-14
i386                  randconfig-015-20260121    gcc-14
i386                  randconfig-016-20260121    gcc-14
i386                  randconfig-017-20260121    clang-20
i386                  randconfig-017-20260121    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260121    gcc-15.2.0
loongarch             randconfig-002-20260121    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.2.0
m68k                            q40_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-15.2.0
mips                   sb1250_swarm_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260121    gcc-11.5.0
nios2                 randconfig-001-20260121    gcc-15.2.0
nios2                 randconfig-002-20260121    gcc-10.5.0
nios2                 randconfig-002-20260121    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260121    gcc-9.5.0
parisc                randconfig-002-20260121    gcc-13.4.0
parisc                randconfig-002-20260121    gcc-9.5.0
parisc64                         alldefconfig    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     kmeter1_defconfig    gcc-15.2.0
powerpc                         ps3_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260121    clang-22
powerpc               randconfig-001-20260121    gcc-9.5.0
powerpc               randconfig-002-20260121    clang-22
powerpc               randconfig-002-20260121    gcc-9.5.0
powerpc                     taishan_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260121    clang-22
powerpc64             randconfig-001-20260121    gcc-9.5.0
powerpc64             randconfig-002-20260121    clang-22
powerpc64             randconfig-002-20260121    gcc-9.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260121    clang-16
riscv                 randconfig-002-20260121    clang-16
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260121    clang-16
s390                  randconfig-002-20260121    clang-16
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                               j2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260121    clang-16
sh                    randconfig-002-20260121    clang-16
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260121    gcc-8.5.0
sparc                 randconfig-002-20260121    gcc-8.5.0
sparc                       sparc64_defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260121    gcc-13.4.0
sparc64               randconfig-001-20260121    gcc-8.5.0
sparc64               randconfig-002-20260121    gcc-15.2.0
sparc64               randconfig-002-20260121    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260121    gcc-14
um                    randconfig-001-20260121    gcc-8.5.0
um                    randconfig-002-20260121    gcc-14
um                    randconfig-002-20260121    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260121    clang-20
x86_64      buildonly-randconfig-002-20260121    clang-20
x86_64      buildonly-randconfig-003-20260121    clang-20
x86_64      buildonly-randconfig-004-20260121    clang-20
x86_64      buildonly-randconfig-005-20260121    clang-20
x86_64      buildonly-randconfig-006-20260121    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260121    clang-20
x86_64                randconfig-002-20260121    clang-20
x86_64                randconfig-003-20260121    clang-20
x86_64                randconfig-004-20260121    clang-20
x86_64                randconfig-005-20260121    clang-20
x86_64                randconfig-006-20260121    clang-20
x86_64                randconfig-011-20260121    gcc-14
x86_64                randconfig-012-20260121    gcc-14
x86_64                randconfig-013-20260121    gcc-14
x86_64                randconfig-014-20260121    gcc-14
x86_64                randconfig-015-20260121    gcc-14
x86_64                randconfig-016-20260121    gcc-14
x86_64                randconfig-071-20260121    clang-20
x86_64                randconfig-072-20260121    clang-20
x86_64                randconfig-073-20260121    clang-20
x86_64                randconfig-074-20260121    clang-20
x86_64                randconfig-075-20260121    clang-20
x86_64                randconfig-076-20260121    clang-20
x86_64                randconfig-076-20260121    gcc-13
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.2.0
xtensa                       common_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260121    gcc-14.3.0
xtensa                randconfig-001-20260121    gcc-8.5.0
xtensa                randconfig-002-20260121    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


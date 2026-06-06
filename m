Return-Path: <linux-media+bounces-64030-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CSGjMGuFJGqV7wEAu9opvQ
	(envelope-from <linux-media+bounces-64030-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 22:39:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8E964E4FB
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 22:39:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=dfyh0bkd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64030-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64030-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6B383018AC4
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 20:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5DA3B777B;
	Sat,  6 Jun 2026 20:39:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C701419A4
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 20:38:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780778340; cv=none; b=k4e/Yg7c1jhfWnBrhx1omTKAMEwz1Feslkif+xMZJ0du2DlglWIrYmGfFYei0VoEFvOJpkvUsKx4b6hS6jIgGfrQpol6jg9viBBHsoa4gP8uM+2onmJ2PS06ePWt4Q4tF7GHrIZXG4ZgyCYMPhqwta/bYaSyP2ik6Y/QTTQPuck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780778340; c=relaxed/simple;
	bh=Te8CRxJ9ESR1oIsjNZGYuJrrrc9Cf0MB7To6fFL0ORM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OMYyTwrnCB3KMUfXRoFlCWGgXX7sLf2ozD3U1hHu/tzy42DiopVVspFYpcTgPU69XdhPjWSE4WETcACSj1+SlwNdrIbtvuIilF32yEriIjM3ptSq3wTfgF3RBFm0hFKcYyD9meDNMqGCrLx1rvdL+2ONKhXmhWsPpVYmZijEuBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfyh0bkd; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780778339; x=1812314339;
  h=date:from:to:cc:subject:message-id;
  bh=Te8CRxJ9ESR1oIsjNZGYuJrrrc9Cf0MB7To6fFL0ORM=;
  b=dfyh0bkdPxcN1Ss3FCrJL9j8o8EFoJBrsv6+ZWUXGMy6/POkUgKokGq4
   NM5v8tf5ajBzZ4GWRLmxZEnfxOpuVpNf8hZY6lZMUOAhldHybg2zVUTlA
   1l4Sk1kGyDC8YsvPCcr0CDUBn5S1mIZtGcS0gYMx+aWqrySbiBYUPCSLS
   jtHpBJckn9/05ndxYI99sAm+WmcSlfQx9HsTylpIi3g2xIOsoZynxmhy3
   GqSg4oozDrwYhT5nHgKLTfl9dooi3hFQT7lFN1z0LHiY9NLSkBQs+9Kp9
   4ualbSr8HuX5SthsjDgIsFniuDxSM+ncKdI21ji1wCLK7UB0oL2EMjt1f
   Q==;
X-CSE-ConnectionGUID: e3wN4cE2QpqwjJ2IRikOTA==
X-CSE-MsgGUID: dBTqs4UkQ3SBUNt3yWXltg==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="85458466"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="85458466"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 13:38:58 -0700
X-CSE-ConnectionGUID: DAE5US2DQvGlyuAHqUvniA==
X-CSE-MsgGUID: 3YNDd5vzT+qNlziefnPiew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="240692778"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2026 13:38:56 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVxnC-00000000HIw-09MX;
	Sat, 06 Jun 2026 20:38:54 +0000
Date: Sun, 07 Jun 2026 04:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 06cb687a5132fcffe624c0070576ab852ac6b568
Message-ID: <202606070450.Vr308tJV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64030-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:mid,intel.com:from_mime,intel.com:dkim,linuxtv.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A8E964E4FB

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 06cb687a5132fcffe624c0070576ab852ac6b568  media: v4l2-fwnode: Fix subdev owner overwritten in v4l2_async_register_subdev_sensor()

elapsed time: 2126m

configs tested: 285
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-17
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260606    clang-23
arc                   randconfig-001-20260606    gcc-12.5.0
arc                   randconfig-002-20260606    clang-23
arc                   randconfig-002-20260606    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-17
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260606    clang-17
arm                   randconfig-001-20260606    clang-23
arm                   randconfig-002-20260606    clang-23
arm                   randconfig-002-20260606    gcc-10.5.0
arm                   randconfig-003-20260606    clang-23
arm                   randconfig-004-20260606    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260606    clang-23
arm64                 randconfig-001-20260606    gcc-10.5.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260606    clang-23
arm64                 randconfig-002-20260606    gcc-8.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260606    clang-23
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260606    clang-23
arm64                 randconfig-004-20260606    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260606    clang-23
csky                  randconfig-001-20260606    gcc-10.5.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260606    clang-23
csky                  randconfig-002-20260606    gcc-9.5.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260606    clang-20
hexagon               randconfig-001-20260606    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260606    clang-23
hexagon               randconfig-002-20260606    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260606    clang-22
i386        buildonly-randconfig-001-20260606    gcc-13
i386        buildonly-randconfig-002-20260606    clang-22
i386        buildonly-randconfig-002-20260606    gcc-13
i386        buildonly-randconfig-003-20260606    clang-22
i386        buildonly-randconfig-003-20260606    gcc-13
i386        buildonly-randconfig-004-20260606    gcc-13
i386        buildonly-randconfig-004-20260606    gcc-14
i386        buildonly-randconfig-005-20260606    clang-22
i386        buildonly-randconfig-005-20260606    gcc-13
i386        buildonly-randconfig-006-20260606    gcc-13
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260606    clang-20
i386                  randconfig-002-20260606    clang-20
i386                  randconfig-003-20260606    clang-20
i386                  randconfig-004-20260606    clang-20
i386                  randconfig-005-20260606    clang-20
i386                  randconfig-006-20260606    clang-20
i386                  randconfig-007-20260606    clang-20
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260606    clang-20
i386                  randconfig-011-20260606    clang-22
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260606    clang-20
i386                  randconfig-012-20260606    gcc-14
i386                           randconfig-013    clang-20
i386                  randconfig-013-20260606    clang-20
i386                  randconfig-013-20260606    gcc-12
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260606    clang-20
i386                  randconfig-014-20260606    clang-22
i386                           randconfig-015    clang-20
i386                  randconfig-015-20260606    clang-20
i386                  randconfig-015-20260606    clang-22
i386                           randconfig-016    clang-20
i386                  randconfig-016-20260606    clang-20
i386                  randconfig-016-20260606    gcc-14
i386                           randconfig-017    clang-20
i386                  randconfig-017-20260606    clang-20
i386                  randconfig-017-20260606    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260606    clang-23
loongarch             randconfig-001-20260606    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260606    clang-23
loongarch             randconfig-002-20260606    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-17
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      malta_kvm_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-17
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260606    gcc-11.5.0
nios2                 randconfig-001-20260606    gcc-9.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260606    gcc-11.5.0
nios2                 randconfig-002-20260606    gcc-9.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-17
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-16.1.0
openrisc                    or1ksim_defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-17
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260606    gcc-8.5.0
parisc                randconfig-002-20260606    gcc-10.5.0
parisc                randconfig-002-20260606    gcc-8.5.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-17
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260606    clang-23
powerpc               randconfig-001-20260606    gcc-8.5.0
powerpc               randconfig-002-20260606    clang-23
powerpc               randconfig-002-20260606    gcc-8.5.0
powerpc64             randconfig-001-20260606    gcc-15.2.0
powerpc64             randconfig-001-20260606    gcc-8.5.0
powerpc64             randconfig-002-20260606    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-17
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    clang-17
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260606    gcc-12.5.0
riscv                 randconfig-001-20260606    gcc-8.5.0
riscv                          randconfig-002    gcc-8.5.0
riscv                 randconfig-002-20260606    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-8.5.0
s390                  randconfig-001-20260606    gcc-13.4.0
s390                  randconfig-001-20260606    gcc-8.5.0
s390                           randconfig-002    gcc-8.5.0
s390                  randconfig-002-20260606    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-17
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                             randconfig-001    gcc-8.5.0
sh                    randconfig-001-20260606    gcc-10.5.0
sh                    randconfig-001-20260606    gcc-8.5.0
sh                             randconfig-002    gcc-8.5.0
sh                    randconfig-002-20260606    gcc-16.1.0
sh                    randconfig-002-20260606    gcc-8.5.0
sparc                             allnoconfig    clang-17
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260606    gcc-11.5.0
sparc                 randconfig-001-20260606    gcc-13.4.0
sparc                 randconfig-002-20260606    gcc-11.5.0
sparc                 randconfig-002-20260606    gcc-16.1.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260606    gcc-11.5.0
sparc64               randconfig-001-20260606    gcc-12.5.0
sparc64               randconfig-002-20260606    gcc-11.5.0
sparc64               randconfig-002-20260606    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260606    clang-23
um                    randconfig-001-20260606    gcc-11.5.0
um                    randconfig-002-20260606    gcc-11.5.0
um                    randconfig-002-20260606    gcc-14
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-17
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260606    clang-22
x86_64      buildonly-randconfig-001-20260606    gcc-14
x86_64      buildonly-randconfig-002-20260606    clang-22
x86_64      buildonly-randconfig-002-20260606    gcc-14
x86_64      buildonly-randconfig-003-20260606    gcc-14
x86_64      buildonly-randconfig-004-20260606    gcc-13
x86_64      buildonly-randconfig-004-20260606    gcc-14
x86_64      buildonly-randconfig-005-20260606    clang-22
x86_64      buildonly-randconfig-005-20260606    gcc-14
x86_64      buildonly-randconfig-006-20260606    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260606    gcc-14
x86_64                randconfig-002-20260606    gcc-14
x86_64                randconfig-003-20260606    gcc-14
x86_64                randconfig-004-20260606    gcc-14
x86_64                randconfig-005-20260606    gcc-14
x86_64                randconfig-006-20260606    gcc-14
x86_64                randconfig-011-20260606    clang-22
x86_64                randconfig-011-20260606    gcc-14
x86_64                randconfig-012-20260606    clang-22
x86_64                randconfig-012-20260606    gcc-14
x86_64                randconfig-013-20260606    gcc-14
x86_64                randconfig-014-20260606    clang-22
x86_64                randconfig-014-20260606    gcc-14
x86_64                randconfig-015-20260606    clang-22
x86_64                randconfig-015-20260606    gcc-14
x86_64                randconfig-016-20260606    clang-22
x86_64                randconfig-016-20260606    gcc-14
x86_64                randconfig-071-20260606    clang-20
x86_64                randconfig-072-20260606    gcc-14
x86_64                randconfig-073-20260606    clang-20
x86_64                randconfig-074-20260606    clang-20
x86_64                randconfig-075-20260606    clang-20
x86_64                randconfig-076-20260606    gcc-13
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-17
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260606    gcc-11.5.0
xtensa                randconfig-001-20260606    gcc-8.5.0
xtensa                randconfig-002-20260606    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


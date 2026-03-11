Return-Path: <linux-media+bounces-55449-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH5oDS3QsWmQFQAAu9opvQ
	(envelope-from <linux-media+bounces-55449-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 21:27:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A613269F82
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 21:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B759301C179
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 20:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB3238D684;
	Wed, 11 Mar 2026 20:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atZbMjhS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FC02F8BEE
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 20:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773260822; cv=none; b=JrYA2VBE/IV4IdOHjLZS11PDRy8hrYguN5uSZLx7BbWtyTW0mtaw3TaGBeg43OJ58v+dyrsehFBHm52Hc4zf83qXbELyoDTGhvIPkKYk/AZDjBRK6VyVobOyB1glkhtlSb3yVU2e6q6VUC56ox/t+doJEwmWs6BGsaefUZc1Ndk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773260822; c=relaxed/simple;
	bh=HAwdogVQx2BkY0WWGlBCDhJRnsxkB10xr1ISf6/Ly+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lXMMDHDSz5jS8/+PVLTu30ZIVulU7aHdtT6xlUSNq2MSN86uJxhkBiTSaUmsSVJLlxyrW7Qjf6/kyLy0dKiVuQExnOxUzpRpGb0q64M91BZhKiiAAGrPYrl/3mPtrP7WVx/MaK/wh4ihSqBW/QNH2bwP9FGW5oHJpzfrXnKYWUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atZbMjhS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773260820; x=1804796820;
  h=date:from:to:cc:subject:message-id;
  bh=HAwdogVQx2BkY0WWGlBCDhJRnsxkB10xr1ISf6/Ly+M=;
  b=atZbMjhSs4V30LhuMJ0dJK3+Vlb2rJz5gWP92nW7Nd2dfgeeyKb6dhtu
   Ffmt799JyIJaeBBJx//Qqw7hmqf5cyx3eUeVDMo+RMweO+S+1hRI6pTto
   uoY+hni9R23LmnduzDMB8ADooIbktkBRu277yvYoCUM71J7pw1yzwNnAZ
   uHtBfLwfazg++rcyqV4GO6ZMKNWP+HgY9diAjUF2BgFDN4oDK15GAu38t
   NGmVT3+nvfnVeq+CwAqGo6YNv+xgJixB2od5IH7QrA94SvO7SleVm7xSN
   NPuqxffglcehZcxDM6cloWBQw5duD485s33Cex6Yf8WpKF0TIyM8NZd6W
   g==;
X-CSE-ConnectionGUID: BJ4lGjSIQ5ORNAVTQLKGZA==
X-CSE-MsgGUID: XU4ukgp8QgmhYpXt2NZU5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77948982"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="77948982"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 13:26:59 -0700
X-CSE-ConnectionGUID: sGjxbW2tTD6o8mpVVev5QA==
X-CSE-MsgGUID: aQCKNrT0SEiuWb1/6nnuiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="218441226"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Mar 2026 13:26:57 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Q8t-000000001gn-2fIp;
	Wed, 11 Mar 2026 20:26:55 +0000
Date: Thu, 12 Mar 2026 04:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:fixes] BUILD SUCCESS
 883d9ac20824e991f6945448165fa8a1b74dd5e5
Message-ID: <202603120435.TpnM9Pma-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55449-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid,linuxtv.org:url]
X-Rspamd-Queue-Id: 6A613269F82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git fixes
branch HEAD: 883d9ac20824e991f6945448165fa8a1b74dd5e5  media: rkvdec: reduce stack usage in rkvdec_init_v4l2_vp9_count_tbl()

elapsed time: 737m

configs tested: 230
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
arc                   randconfig-001-20260311    gcc-8.5.0
arc                   randconfig-001-20260312    gcc-8.5.0
arc                   randconfig-002-20260311    gcc-8.5.0
arc                   randconfig-002-20260312    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260311    gcc-8.5.0
arm                   randconfig-001-20260312    gcc-8.5.0
arm                   randconfig-002-20260311    gcc-8.5.0
arm                   randconfig-002-20260312    gcc-8.5.0
arm                   randconfig-003-20260311    gcc-8.5.0
arm                   randconfig-003-20260312    gcc-8.5.0
arm                   randconfig-004-20260311    gcc-8.5.0
arm                   randconfig-004-20260312    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260311    gcc-12.5.0
arm64                 randconfig-001-20260312    clang-18
arm64                 randconfig-002-20260311    gcc-12.5.0
arm64                 randconfig-002-20260312    clang-18
arm64                 randconfig-003-20260311    gcc-12.5.0
arm64                 randconfig-003-20260312    clang-18
arm64                 randconfig-004-20260311    gcc-12.5.0
arm64                 randconfig-004-20260312    clang-18
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260311    gcc-12.5.0
csky                  randconfig-001-20260312    clang-18
csky                  randconfig-002-20260311    gcc-12.5.0
csky                  randconfig-002-20260312    clang-18
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260311    gcc-8.5.0
hexagon               randconfig-001-20260312    gcc-11.5.0
hexagon               randconfig-002-20260311    gcc-8.5.0
hexagon               randconfig-002-20260312    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260311    clang-20
i386        buildonly-randconfig-002-20260311    clang-20
i386        buildonly-randconfig-003-20260311    clang-20
i386        buildonly-randconfig-004-20260311    clang-20
i386        buildonly-randconfig-005-20260311    clang-20
i386        buildonly-randconfig-006-20260311    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260311    gcc-14
i386                  randconfig-002-20260311    gcc-14
i386                  randconfig-003-20260311    gcc-14
i386                  randconfig-004-20260311    gcc-14
i386                  randconfig-005-20260311    gcc-14
i386                  randconfig-006-20260311    gcc-14
i386                  randconfig-007-20260311    gcc-14
i386                  randconfig-011-20260311    gcc-14
i386                  randconfig-012-20260311    gcc-14
i386                  randconfig-013-20260311    gcc-14
i386                  randconfig-014-20260311    gcc-14
i386                  randconfig-017-20260311    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260311    gcc-8.5.0
loongarch             randconfig-001-20260312    gcc-11.5.0
loongarch             randconfig-002-20260311    gcc-8.5.0
loongarch             randconfig-002-20260312    gcc-11.5.0
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
nios2                 randconfig-001-20260311    gcc-8.5.0
nios2                 randconfig-001-20260312    gcc-11.5.0
nios2                 randconfig-002-20260311    gcc-8.5.0
nios2                 randconfig-002-20260312    gcc-11.5.0
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
parisc                randconfig-001-20260311    clang-23
parisc                randconfig-001-20260312    clang-23
parisc                randconfig-002-20260311    clang-23
parisc                randconfig-002-20260312    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260311    clang-23
powerpc               randconfig-001-20260312    clang-23
powerpc               randconfig-002-20260311    clang-23
powerpc               randconfig-002-20260312    clang-23
powerpc64             randconfig-001-20260311    clang-23
powerpc64             randconfig-001-20260312    clang-23
powerpc64             randconfig-002-20260311    clang-23
powerpc64             randconfig-002-20260312    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260311    gcc-15.2.0
riscv                 randconfig-002-20260311    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260311    gcc-15.2.0
s390                  randconfig-002-20260311    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                          landisk_defconfig    gcc-15.2.0
sh                    randconfig-001-20260311    gcc-15.2.0
sh                    randconfig-002-20260311    gcc-15.2.0
sh                           se7751_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260311    gcc-8.5.0
sparc                 randconfig-002-20260311    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260311    gcc-8.5.0
sparc64               randconfig-002-20260311    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260311    gcc-8.5.0
um                    randconfig-002-20260311    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260311    clang-20
x86_64      buildonly-randconfig-001-20260312    gcc-14
x86_64      buildonly-randconfig-002-20260311    clang-20
x86_64      buildonly-randconfig-002-20260312    gcc-14
x86_64      buildonly-randconfig-003-20260311    clang-20
x86_64      buildonly-randconfig-003-20260312    gcc-14
x86_64      buildonly-randconfig-004-20260311    clang-20
x86_64      buildonly-randconfig-004-20260312    gcc-14
x86_64      buildonly-randconfig-005-20260311    clang-20
x86_64      buildonly-randconfig-005-20260312    gcc-14
x86_64      buildonly-randconfig-006-20260311    clang-20
x86_64      buildonly-randconfig-006-20260312    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260311    gcc-14
x86_64                randconfig-002-20260311    gcc-14
x86_64                randconfig-003-20260311    gcc-14
x86_64                randconfig-004-20260311    gcc-14
x86_64                randconfig-005-20260311    gcc-14
x86_64                randconfig-006-20260311    gcc-14
x86_64                randconfig-011-20260311    gcc-13
x86_64                randconfig-012-20260311    gcc-13
x86_64                randconfig-013-20260311    gcc-13
x86_64                randconfig-014-20260311    gcc-13
x86_64                randconfig-015-20260311    gcc-13
x86_64                randconfig-016-20260311    gcc-13
x86_64                randconfig-071-20260311    gcc-14
x86_64                randconfig-072-20260311    clang-20
x86_64                randconfig-072-20260311    gcc-14
x86_64                randconfig-073-20260311    gcc-13
x86_64                randconfig-073-20260311    gcc-14
x86_64                randconfig-074-20260311    gcc-13
x86_64                randconfig-074-20260311    gcc-14
x86_64                randconfig-075-20260311    gcc-14
x86_64                randconfig-076-20260311    gcc-13
x86_64                randconfig-076-20260311    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                               rhel-9.4    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                          rhel-9.4-func    gcc-14
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                    rhel-9.4-kselftests    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260311    gcc-8.5.0
xtensa                randconfig-002-20260311    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


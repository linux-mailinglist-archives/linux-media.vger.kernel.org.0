Return-Path: <linux-media+bounces-51244-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNBXOH7icGkhawAAu9opvQ
	(envelope-from <linux-media+bounces-51244-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:28:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 595A6586B9
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E096788E3A2
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 13:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F3846AED6;
	Wed, 21 Jan 2026 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dC0CCPda"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A612BEC5A
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003502; cv=none; b=L8bhZrA/oLjdEgBIKgHLsFroGTpw/M+FxhMqmvQrDjeAJU5ymxFAr3p4fw+ZzXgr7359jBrvQIYBKWycv/MThnhxPXnlI0lBWiuW0iJSUxIu+Fs3uaPScPkI+kl3j5J73pc2wYmohYZQVnoQyW/lFTsSRuLNZhDS7hLW4m44Xfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003502; c=relaxed/simple;
	bh=mtCMiLxG/zVfFRL2uBsfFhwhC07yKurcB1NshUYMYEE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tBYXLkCwK2WY5JZAumlyD50WuLBfaTJZogR1MA2QJjbRW1TUXhtIdT49JSGcbk5xnbBvnNr0PPQI/DxB3scgSs2LEIxL/1C68FRY7F66iYMXXHNc76MV6oZDOv8isXyGWTcj4jYC1xdI+a08oljaaFn0CKmJrycU+IKWtooaLBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dC0CCPda; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769003501; x=1800539501;
  h=date:from:to:cc:subject:message-id;
  bh=mtCMiLxG/zVfFRL2uBsfFhwhC07yKurcB1NshUYMYEE=;
  b=dC0CCPdaVChDGSlIavr3PzCjgTPoxlQLro2WsCEq+TbafX1ngoC0md4U
   sczhWDbgUIrnV5UUdcjWUIGVUlGcFmWJu7jOac88eFpLJIfWr+LiknvRN
   7Lg0RVyS4JzHcjNeXn4bUNiyvY5oajUJvhgxWbsinygHNcrXd2gBcUWv7
   CNmrFFyhy/OdraURitr5XLPZUt2Qv4wsxwKGBn04SxJRkbn0mVTTDEb86
   yb09cE8bUccxUakKPAxldW7ehF5OQhBjUVc0XXc8kQw7Uu6T+IzavZFBh
   vfwYvkoNdQ9zYoOlkHaKxd3dfG6tD/YLCuq1Ubd6TNsRa85uLxxu3EtJZ
   Q==;
X-CSE-ConnectionGUID: U57TlAueT42/zjlHb0ip3A==
X-CSE-MsgGUID: qkwapFo0SLC0YCGMMNGf8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87807412"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="87807412"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 05:51:40 -0800
X-CSE-ConnectionGUID: nGq8+svjS4iO+yfJk/3kqA==
X-CSE-MsgGUID: ylb2QaFsT92xPRpkDlcGZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="210617557"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Jan 2026 05:51:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viYcS-00000000RH3-2vmF;
	Wed, 21 Jan 2026 13:51:36 +0000
Date: Wed, 21 Jan 2026 21:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 063befb259f3efeb0119f3853efad3b17d3e3f3d
Message-ID: <202601212123.pq6Y5Cdw-lkp@intel.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51244-lists,linux-media=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 595A6586B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 063befb259f3efeb0119f3853efad3b17d3e3f3d  media: synopsys: add driver for the designware mipi csi-2 receiver

elapsed time: 869m

configs tested: 149
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                            hsdk_defconfig    gcc-15.2.0
arc                   randconfig-001-20260121    gcc-8.5.0
arc                   randconfig-002-20260121    gcc-10.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.2.0
arm                   randconfig-001-20260121    clang-20
arm                   randconfig-002-20260121    gcc-15.2.0
arm                   randconfig-003-20260121    clang-18
arm                   randconfig-004-20260121    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260121    gcc-15.2.0
arm64                 randconfig-002-20260121    clang-22
arm64                 randconfig-003-20260121    clang-22
arm64                 randconfig-004-20260121    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260121    gcc-9.5.0
csky                  randconfig-002-20260121    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20260121    clang-19
hexagon               randconfig-002-20260121    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260121    clang-20
i386        buildonly-randconfig-002-20260121    gcc-14
i386        buildonly-randconfig-003-20260121    gcc-13
i386        buildonly-randconfig-004-20260121    clang-20
i386        buildonly-randconfig-005-20260121    clang-20
i386        buildonly-randconfig-006-20260121    clang-20
i386                  randconfig-001-20260121    gcc-14
i386                  randconfig-011-20260121    gcc-14
i386                  randconfig-012-20260121    gcc-14
i386                  randconfig-013-20260121    clang-20
i386                  randconfig-014-20260121    gcc-12
i386                  randconfig-015-20260121    gcc-14
i386                  randconfig-016-20260121    gcc-14
i386                  randconfig-017-20260121    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20260121    gcc-15.2.0
loongarch             randconfig-002-20260121    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-15.2.0
mips                      bmips_stb_defconfig    clang-22
mips                           ip32_defconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20260121    gcc-11.5.0
nios2                 randconfig-002-20260121    gcc-10.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260121    gcc-9.5.0
parisc                randconfig-002-20260121    gcc-13.4.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      katmai_defconfig    clang-22
powerpc                      mgcoge_defconfig    clang-22
powerpc               randconfig-001-20260121    clang-22
powerpc               randconfig-002-20260121    clang-22
powerpc64             randconfig-001-20260121    clang-22
powerpc64             randconfig-002-20260121    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20260121    clang-16
riscv                 randconfig-002-20260121    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                  randconfig-001-20260121    gcc-9.5.0
s390                  randconfig-002-20260121    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                        apsh4ad0a_defconfig    gcc-15.2.0
sh                    randconfig-001-20260121    gcc-14.3.0
sh                    randconfig-002-20260121    gcc-9.5.0
sh                      rts7751r2d1_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260121    gcc-8.5.0
sparc                 randconfig-002-20260121    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64               randconfig-001-20260121    gcc-13.4.0
sparc64               randconfig-002-20260121    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20260121    gcc-14
um                    randconfig-002-20260121    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-002-20260121    gcc-14
x86_64                randconfig-001-20260121    clang-20
x86_64                randconfig-002-20260121    gcc-14
x86_64                randconfig-003-20260121    gcc-14
x86_64                randconfig-004-20260121    gcc-14
x86_64                randconfig-005-20260121    clang-20
x86_64                randconfig-006-20260121    clang-20
x86_64                randconfig-011-20260121    gcc-14
x86_64                randconfig-012-20260121    clang-20
x86_64                randconfig-013-20260121    gcc-14
x86_64                randconfig-014-20260121    gcc-14
x86_64                randconfig-015-20260121    clang-20
x86_64                randconfig-016-20260121    gcc-14
x86_64                randconfig-071-20260121    clang-20
x86_64                randconfig-072-20260121    clang-20
x86_64                randconfig-073-20260121    clang-20
x86_64                randconfig-074-20260121    clang-20
x86_64                randconfig-075-20260121    clang-20
x86_64                randconfig-076-20260121    gcc-13
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260121    gcc-14.3.0
xtensa                randconfig-002-20260121    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


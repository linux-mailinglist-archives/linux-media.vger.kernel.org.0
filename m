Return-Path: <linux-media+bounces-67533-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LL96MAeyVWoMrwAAu9opvQ
	(envelope-from <linux-media+bounces-67533-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 05:50:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5282A750B4E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 05:50:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="HWSszmf/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67533-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67533-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0A2F3018885
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 03:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCA738A71B;
	Tue, 14 Jul 2026 03:50:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF88B223707
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 03:50:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784001026; cv=none; b=nEgclFnxQm29tQBNQOJSHqIjG11DrV40eWP2rMK+lF7zTUEC5KPzYE1cc7g2aqLtuOGpAI19G4zS8YMdlv8alClf+8kWNgLY1gM0vFd7ZYvF70Jxo36fnDTrKCpvEKebolRrLd7bO4/V5r0fHvjiJqbinJsKni8CL6grPa6qV2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784001026; c=relaxed/simple;
	bh=t/k9UaVSNsozWAe8g2mRxUSvnVcwTrG7TcWC8yfqxWA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WZJY/BkuJqiHamx+gbR9jBo1atQssMeffIjx1mbcmcGLH0n4KoFnB9aQO2VjWCtJarp84gX7YeJjyDrAsY5iYhYsZSby6JN45ZlA8Gr5bRxVmt6aF9C4Gxu5ZxKuJj6ZmyLFEyNRjAttM3qOHTvFaP0mtiyQ7nbImN9RDFRe37Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWSszmf/; arc=none smtp.client-ip=192.198.163.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784001024; x=1815537024;
  h=date:from:to:cc:subject:message-id;
  bh=t/k9UaVSNsozWAe8g2mRxUSvnVcwTrG7TcWC8yfqxWA=;
  b=HWSszmf/jCLrQslWJYsnTO0hn3LNGaw+fUrRd0VdlG1TN/4O5so55Yov
   2s8P+iKyDRENz/ELEKOP/21TH/8jiukIgjdh679kh0ouKISjBO48v8WYp
   Av6rstpjdfGTdbc5Jf1zUAuzmvA3UWTN4En9VtNib08QFQTbW+XJesflN
   iYEDI75XDWP/DyDotASELkrDOQm4zXy39ZSSDGNN15QVJtS6Je1vvEZGE
   kgzZW6n+J+BE4QgtankH8YlXl7TXFnyScAvMVLC65SGGG79VBAlSuBDD7
   GR9oqBh58HB593W//9dYrc09CgLu0r64zqVQd7zb9zFQjASeg9lko7BAe
   g==;
X-CSE-ConnectionGUID: LlLbeovuQ7ar32VxmxQhPA==
X-CSE-MsgGUID: NbY40J8bSbORrr17S9dfrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95262665"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95262665"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 20:50:24 -0700
X-CSE-ConnectionGUID: yRTu+7qvTRKfHlu0a/14Pw==
X-CSE-MsgGUID: yB1VlS3mQm2FdGYKnygy9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278997980"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jul 2026 20:50:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjUA0-00000000MNt-0x7d;
	Tue, 14 Jul 2026 03:50:20 +0000
Date: Tue, 14 Jul 2026 11:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media:next] BUILD SUCCESS
 38d9078f8bb3e07973fbc7152a1f6f1318fedee2
Message-ID: <202607141128.wkRxypaj-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67533-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:dkim,intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5282A750B4E

tree/branch: https://git.linuxtv.org/media.git next
branch HEAD: 38d9078f8bb3e07973fbc7152a1f6f1318fedee2  media: replace linux/gpio.h inclusions

elapsed time: 5296m

configs tested: 385
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              alldefconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    clang-23
arc                   randconfig-001-20260710    clang-23
arc                   randconfig-001-20260711    gcc-13.4.0
arc                   randconfig-001-20260714    clang-23
arc                            randconfig-002    clang-23
arc                   randconfig-002-20260710    clang-23
arc                   randconfig-002-20260711    gcc-13.4.0
arc                   randconfig-002-20260714    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                          ixp4xx_defconfig    gcc-16.1.0
arm                            randconfig-001    clang-23
arm                   randconfig-001-20260710    clang-23
arm                   randconfig-001-20260711    gcc-13.4.0
arm                   randconfig-001-20260714    clang-23
arm                            randconfig-002    clang-23
arm                   randconfig-002-20260710    clang-23
arm                   randconfig-002-20260711    gcc-13.4.0
arm                   randconfig-002-20260714    clang-23
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260710    clang-23
arm                   randconfig-003-20260711    gcc-13.4.0
arm                   randconfig-003-20260714    clang-23
arm                            randconfig-004    clang-23
arm                   randconfig-004-20260710    clang-23
arm                   randconfig-004-20260711    gcc-13.4.0
arm                   randconfig-004-20260714    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260710    clang-23
arm64                 randconfig-001-20260710    gcc-10.5.0
arm64                 randconfig-001-20260711    gcc-16.1.0
arm64                 randconfig-001-20260714    clang-17
arm64                 randconfig-001-20260714    gcc-16.1.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260710    clang-23
arm64                 randconfig-002-20260710    gcc-10.5.0
arm64                 randconfig-002-20260711    gcc-16.1.0
arm64                 randconfig-002-20260714    clang-23
arm64                 randconfig-002-20260714    gcc-16.1.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260710    clang-23
arm64                 randconfig-003-20260710    gcc-10.5.0
arm64                 randconfig-003-20260711    gcc-16.1.0
arm64                 randconfig-003-20260714    clang-17
arm64                 randconfig-003-20260714    gcc-16.1.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260710    clang-23
arm64                 randconfig-004-20260710    gcc-10.5.0
arm64                 randconfig-004-20260711    gcc-16.1.0
arm64                 randconfig-004-20260714    clang-23
arm64                 randconfig-004-20260714    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260710    clang-23
csky                  randconfig-001-20260710    gcc-10.5.0
csky                  randconfig-001-20260711    gcc-16.1.0
csky                  randconfig-001-20260714    gcc-16.1.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260710    clang-23
csky                  randconfig-002-20260710    gcc-10.5.0
csky                  randconfig-002-20260711    gcc-16.1.0
csky                  randconfig-002-20260714    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260710    gcc-12.5.0
hexagon               randconfig-001-20260711    gcc-16.1.0
hexagon               randconfig-001-20260714    gcc-16.1.0
hexagon               randconfig-002-20260710    gcc-12.5.0
hexagon               randconfig-002-20260711    gcc-16.1.0
hexagon               randconfig-002-20260714    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260710    clang-22
i386        buildonly-randconfig-001-20260711    gcc-14
i386        buildonly-randconfig-001-20260714    clang-22
i386        buildonly-randconfig-002-20260710    clang-22
i386        buildonly-randconfig-002-20260711    gcc-14
i386        buildonly-randconfig-002-20260714    clang-22
i386        buildonly-randconfig-003-20260710    clang-22
i386        buildonly-randconfig-003-20260711    gcc-14
i386        buildonly-randconfig-003-20260714    clang-22
i386        buildonly-randconfig-004-20260710    clang-22
i386        buildonly-randconfig-004-20260711    gcc-14
i386        buildonly-randconfig-004-20260714    clang-22
i386        buildonly-randconfig-005-20260710    clang-22
i386        buildonly-randconfig-005-20260711    gcc-14
i386        buildonly-randconfig-005-20260714    clang-22
i386        buildonly-randconfig-006-20260710    clang-22
i386        buildonly-randconfig-006-20260711    gcc-14
i386        buildonly-randconfig-006-20260714    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260710    clang-22
i386                  randconfig-001-20260714    gcc-13
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260710    clang-22
i386                  randconfig-002-20260714    gcc-13
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260710    clang-22
i386                  randconfig-003-20260714    gcc-13
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260710    clang-22
i386                  randconfig-004-20260714    gcc-13
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260710    clang-22
i386                  randconfig-005-20260714    gcc-13
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260710    clang-22
i386                  randconfig-006-20260714    gcc-13
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260710    clang-22
i386                  randconfig-007-20260714    gcc-13
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260710    gcc-14
i386                  randconfig-011-20260711    gcc-13
i386                  randconfig-011-20260714    clang-22
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260710    gcc-14
i386                  randconfig-012-20260711    gcc-13
i386                  randconfig-012-20260714    clang-22
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260710    gcc-14
i386                  randconfig-013-20260711    gcc-13
i386                  randconfig-013-20260714    clang-22
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260710    gcc-14
i386                  randconfig-014-20260711    gcc-13
i386                  randconfig-014-20260714    clang-22
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260710    gcc-14
i386                  randconfig-015-20260711    gcc-13
i386                  randconfig-015-20260714    clang-22
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260710    gcc-14
i386                  randconfig-016-20260711    gcc-13
i386                  randconfig-016-20260714    clang-22
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260710    gcc-14
i386                  randconfig-017-20260711    gcc-13
i386                  randconfig-017-20260714    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260710    gcc-12.5.0
loongarch             randconfig-001-20260711    gcc-16.1.0
loongarch             randconfig-001-20260714    gcc-16.1.0
loongarch             randconfig-002-20260710    gcc-12.5.0
loongarch             randconfig-002-20260711    gcc-16.1.0
loongarch             randconfig-002-20260714    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                   sb1250_swarm_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260710    gcc-12.5.0
nios2                 randconfig-001-20260711    gcc-16.1.0
nios2                 randconfig-001-20260714    gcc-16.1.0
nios2                 randconfig-002-20260710    gcc-12.5.0
nios2                 randconfig-002-20260711    gcc-16.1.0
nios2                 randconfig-002-20260714    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260710    clang-17
parisc                randconfig-001-20260714    clang-17
parisc                randconfig-002-20260710    clang-17
parisc                randconfig-002-20260714    clang-17
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                       eiger_defconfig    clang-23
powerpc                 mpc836x_rdk_defconfig    clang-23
powerpc               randconfig-001-20260710    clang-17
powerpc               randconfig-001-20260714    clang-17
powerpc               randconfig-002-20260710    clang-17
powerpc               randconfig-002-20260714    clang-17
powerpc64             randconfig-001-20260710    clang-17
powerpc64             randconfig-001-20260714    clang-17
powerpc64             randconfig-002-20260710    clang-17
powerpc64             randconfig-002-20260714    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260710    clang-17
riscv                 randconfig-001-20260711    gcc-8.5.0
riscv                 randconfig-001-20260714    clang-17
riscv                 randconfig-001-20260714    gcc-10.5.0
riscv                 randconfig-002-20260710    clang-17
riscv                 randconfig-002-20260711    gcc-8.5.0
riscv                 randconfig-002-20260714    gcc-10.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260710    clang-17
s390                  randconfig-001-20260711    gcc-8.5.0
s390                  randconfig-001-20260714    gcc-10.5.0
s390                  randconfig-001-20260714    gcc-8.5.0
s390                  randconfig-002-20260710    clang-17
s390                  randconfig-002-20260711    gcc-8.5.0
s390                  randconfig-002-20260714    clang-23
s390                  randconfig-002-20260714    gcc-10.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             espt_defconfig    gcc-16.1.0
sh                    randconfig-001-20260710    clang-17
sh                    randconfig-001-20260711    gcc-8.5.0
sh                    randconfig-001-20260714    gcc-10.5.0
sh                    randconfig-002-20260710    clang-17
sh                    randconfig-002-20260711    gcc-8.5.0
sh                    randconfig-002-20260714    gcc-10.5.0
sh                    randconfig-002-20260714    gcc-12.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260711    gcc-16.1.0
sparc                 randconfig-001-20260714    gcc-8.5.0
sparc                 randconfig-002-20260711    gcc-16.1.0
sparc                 randconfig-002-20260714    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260711    gcc-16.1.0
sparc64               randconfig-001-20260714    gcc-8.5.0
sparc64               randconfig-002-20260711    gcc-16.1.0
sparc64               randconfig-002-20260714    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260711    gcc-16.1.0
um                    randconfig-001-20260714    gcc-8.5.0
um                    randconfig-002-20260711    gcc-16.1.0
um                    randconfig-002-20260714    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260710    clang-22
x86_64      buildonly-randconfig-001-20260711    gcc-14
x86_64      buildonly-randconfig-001-20260714    gcc-14
x86_64      buildonly-randconfig-002-20260710    clang-22
x86_64      buildonly-randconfig-002-20260711    gcc-14
x86_64      buildonly-randconfig-002-20260714    gcc-14
x86_64      buildonly-randconfig-003-20260710    clang-22
x86_64      buildonly-randconfig-003-20260711    gcc-14
x86_64      buildonly-randconfig-003-20260714    gcc-14
x86_64      buildonly-randconfig-004-20260710    clang-22
x86_64      buildonly-randconfig-004-20260711    gcc-14
x86_64      buildonly-randconfig-004-20260714    gcc-14
x86_64      buildonly-randconfig-005-20260710    clang-22
x86_64      buildonly-randconfig-005-20260711    gcc-14
x86_64      buildonly-randconfig-005-20260714    gcc-14
x86_64      buildonly-randconfig-006-20260710    clang-22
x86_64      buildonly-randconfig-006-20260711    gcc-14
x86_64      buildonly-randconfig-006-20260714    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260710    clang-22
x86_64                randconfig-001-20260710    gcc-14
x86_64                randconfig-001-20260714    clang-22
x86_64                randconfig-001-20260714    gcc-14
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260710    clang-22
x86_64                randconfig-002-20260710    gcc-14
x86_64                randconfig-002-20260714    clang-22
x86_64                randconfig-002-20260714    gcc-12
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260710    clang-22
x86_64                randconfig-003-20260710    gcc-14
x86_64                randconfig-003-20260714    clang-22
x86_64                randconfig-003-20260714    gcc-14
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260710    clang-22
x86_64                randconfig-004-20260710    gcc-14
x86_64                randconfig-004-20260714    clang-22
x86_64                randconfig-004-20260714    gcc-14
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260710    clang-22
x86_64                randconfig-005-20260710    gcc-14
x86_64                randconfig-005-20260714    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260710    clang-22
x86_64                randconfig-006-20260710    gcc-14
x86_64                randconfig-006-20260714    clang-22
x86_64                randconfig-011-20260710    clang-22
x86_64                randconfig-011-20260711    gcc-14
x86_64                randconfig-011-20260714    clang-22
x86_64                randconfig-012-20260710    clang-22
x86_64                randconfig-012-20260711    gcc-14
x86_64                randconfig-012-20260714    clang-22
x86_64                randconfig-013-20260710    clang-22
x86_64                randconfig-013-20260711    gcc-14
x86_64                randconfig-013-20260714    clang-22
x86_64                randconfig-014-20260710    clang-22
x86_64                randconfig-014-20260711    gcc-14
x86_64                randconfig-014-20260714    clang-22
x86_64                randconfig-015-20260710    clang-22
x86_64                randconfig-015-20260711    gcc-14
x86_64                randconfig-015-20260714    clang-22
x86_64                randconfig-016-20260710    clang-22
x86_64                randconfig-016-20260711    gcc-14
x86_64                randconfig-016-20260714    clang-22
x86_64                randconfig-071-20260710    gcc-14
x86_64                randconfig-071-20260714    gcc-14
x86_64                randconfig-072-20260710    gcc-14
x86_64                randconfig-072-20260714    gcc-14
x86_64                randconfig-073-20260710    gcc-14
x86_64                randconfig-073-20260714    gcc-14
x86_64                randconfig-074-20260710    gcc-14
x86_64                randconfig-074-20260714    gcc-14
x86_64                randconfig-075-20260710    gcc-14
x86_64                randconfig-075-20260714    gcc-14
x86_64                randconfig-076-20260710    gcc-14
x86_64                randconfig-076-20260714    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260711    gcc-16.1.0
xtensa                randconfig-001-20260714    gcc-8.5.0
xtensa                randconfig-002-20260711    gcc-16.1.0
xtensa                randconfig-002-20260714    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


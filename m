Return-Path: <linux-media+bounces-56629-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFv6ETPiv2ml9wMAu9opvQ
	(envelope-from <linux-media+bounces-56629-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 13:36:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A04FC2E93BB
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 13:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFBD2301BC39
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 12:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076ED37C108;
	Sun, 22 Mar 2026 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGUl88/L"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210ED2AE68
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182564; cv=none; b=KpqOCfJTxp+5mT8WzlDaRIrJsXcdmOJyf2rI0g+5Jm4/0jJwO3FWOEzY0lgVxpS6HdHSphTs8JQjdP1qta+NvAOpUfHXrfHlIIvMOa7Aji/vdlMQUzdlFJ8P46t5IG2UcI5mGsdsfx/CTrhw6k1BUAuyLsj9lptDU68nkBTuQGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182564; c=relaxed/simple;
	bh=ZaAWD8caKvuGn7byJ06Zey+JUVFhvrQN7wWyJMXIiiI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YHaZ2O5b1Yc9uJb4haHBwUNK2GSV60wieNrqlcBE94KhsKkYmv8QR1ipbxdlnP8HMNb6C9dcqhXpywO381rFi4VSelmuKhGi+YBC0d5tQKJ2BCCqFAy9xnpHY+f2qkoL/9Z9V29joAkDDnf1WL7ZYCBR4Ll1Ki1nvnL0PGTw1rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGUl88/L; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774182563; x=1805718563;
  h=date:from:to:cc:subject:message-id;
  bh=ZaAWD8caKvuGn7byJ06Zey+JUVFhvrQN7wWyJMXIiiI=;
  b=iGUl88/Lgudkz4USO9A8GTLT5NP5T2TYAD5qo3ZHLGwXC0TuEUP5xdBL
   HCsFjKSgIxsy3uRvyhZ+oMbS7fHnR4MkzqparjZXcTP8u2Sl/iuvz010z
   qU9jbozVinWmAP9MbxsDIYWAATWYawWZXGd6oGgRtUWvyjXMb+uAskMFB
   4k18shqZbLPMY3SUC5oK872ITx43Ma4zYdkaVivRq+MGA1DCc8NDpB3pS
   MFDuOSMPkme9AQFpBLG+90Nfqky6gjQAtLbO96SmBR4pt/ge1RaWVk7u4
   4XmqR1dWnlPSUM81zKobhm6pEZAp+Xl2YYjc66svAHhW+xW1M6qRGIZwj
   A==;
X-CSE-ConnectionGUID: CByGRg7+Q9uEQKUJBvHAPw==
X-CSE-MsgGUID: hCvgpjmlTuGE+WtykUx2Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75173156"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75173156"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 05:29:22 -0700
X-CSE-ConnectionGUID: 2+JvjBsTTDy0jWdO7mOiEg==
X-CSE-MsgGUID: t8MqFlO0QWic8kAXBygThg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Mar 2026 05:29:21 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Hvi-0000000027N-3Lj3;
	Sun, 22 Mar 2026 12:29:18 +0000
Date: Sun, 22 Mar 2026 20:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 896499d2c37c2e34f0328e9015113b50d80b670e
Message-ID: <202603222014.evUziDQs-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-56629-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: A04FC2E93BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: 896499d2c37c2e34f0328e9015113b50d80b670e  media: v4l2-subdev: Return an error from set streaming if not supported

elapsed time: 769m

configs tested: 201
configs skipped: 2

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
arc                   randconfig-001-20260322    gcc-14.3.0
arc                   randconfig-002-20260322    gcc-14.3.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260322    gcc-14.3.0
arm                   randconfig-002-20260322    gcc-14.3.0
arm                   randconfig-003-20260322    gcc-14.3.0
arm                   randconfig-004-20260322    gcc-14.3.0
arm                           sama5_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260322    gcc-11.5.0
arm64                 randconfig-002-20260322    gcc-11.5.0
arm64                 randconfig-003-20260322    clang-23
arm64                 randconfig-003-20260322    gcc-11.5.0
arm64                 randconfig-004-20260322    clang-23
arm64                 randconfig-004-20260322    gcc-11.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260322    gcc-11.5.0
csky                  randconfig-002-20260322    gcc-11.5.0
csky                  randconfig-002-20260322    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260322    gcc-11.5.0
hexagon               randconfig-002-20260322    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260322    clang-20
i386        buildonly-randconfig-002-20260322    clang-20
i386        buildonly-randconfig-003-20260322    clang-20
i386        buildonly-randconfig-004-20260322    clang-20
i386        buildonly-randconfig-005-20260322    clang-20
i386        buildonly-randconfig-006-20260322    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260322    gcc-14
i386                  randconfig-002-20260322    gcc-14
i386                  randconfig-003-20260322    gcc-14
i386                  randconfig-004-20260322    gcc-14
i386                  randconfig-005-20260322    gcc-14
i386                  randconfig-006-20260322    gcc-14
i386                  randconfig-007-20260322    gcc-14
i386                  randconfig-011-20260322    gcc-13
i386                  randconfig-012-20260322    gcc-13
i386                  randconfig-013-20260322    gcc-13
i386                  randconfig-014-20260322    gcc-13
i386                  randconfig-015-20260322    gcc-13
i386                  randconfig-016-20260322    gcc-13
i386                  randconfig-017-20260322    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260322    gcc-11.5.0
loongarch             randconfig-002-20260322    gcc-11.5.0
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
nios2                 randconfig-001-20260322    gcc-11.5.0
nios2                 randconfig-002-20260322    gcc-11.5.0
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
parisc                randconfig-001-20260322    clang-23
parisc                randconfig-002-20260322    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     powernv_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260322    clang-23
powerpc               randconfig-002-20260322    clang-23
powerpc                    socrates_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260322    clang-23
powerpc64             randconfig-002-20260322    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260322    gcc-12.5.0
riscv                 randconfig-002-20260322    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260322    gcc-12.5.0
s390                  randconfig-002-20260322    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260322    gcc-12.5.0
sh                    randconfig-002-20260322    gcc-12.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260322    gcc-14
sparc                 randconfig-002-20260322    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260322    gcc-14
sparc64               randconfig-002-20260322    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260322    gcc-14
um                    randconfig-002-20260322    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260322    clang-20
x86_64      buildonly-randconfig-002-20260322    clang-20
x86_64      buildonly-randconfig-003-20260322    clang-20
x86_64      buildonly-randconfig-004-20260322    clang-20
x86_64      buildonly-randconfig-005-20260322    clang-20
x86_64      buildonly-randconfig-006-20260322    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260322    clang-20
x86_64                randconfig-002-20260322    clang-20
x86_64                randconfig-003-20260322    clang-20
x86_64                randconfig-004-20260322    clang-20
x86_64                randconfig-005-20260322    clang-20
x86_64                randconfig-006-20260322    clang-20
x86_64                randconfig-011-20260322    gcc-14
x86_64                randconfig-012-20260322    gcc-14
x86_64                randconfig-013-20260322    gcc-14
x86_64                randconfig-014-20260322    gcc-14
x86_64                randconfig-015-20260322    gcc-14
x86_64                randconfig-016-20260322    gcc-14
x86_64                randconfig-071-20260322    gcc-14
x86_64                randconfig-072-20260322    gcc-14
x86_64                randconfig-073-20260322    gcc-14
x86_64                randconfig-074-20260322    gcc-14
x86_64                randconfig-075-20260322    gcc-14
x86_64                randconfig-076-20260322    gcc-14
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
xtensa                randconfig-001-20260322    gcc-14
xtensa                randconfig-002-20260322    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-59353-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 39hWKUqp6WkxgwIAu9opvQ
	(envelope-from <linux-media+bounces-59353-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 07:08:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA8144D25A
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 07:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 640E83020013
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 05:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2FF37DE83;
	Thu, 23 Apr 2026 05:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKJMM5jg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15A521E098
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776920898; cv=none; b=HAL0StB+Fa5H1eYg7DMW3g8wLaSNGSFTBBTcjOmla1Q/1of8o7sDucMQX2eGr/opWWmVWS9/ZflyqK9IfnScXWLt3y9SpASeO6I9NSX6sMfiABoHUsIj/hv6MFucyA4eoTtRFiEQdTBI58cwdEsr0lmkJQidugwgdJh6TcAc97A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776920898; c=relaxed/simple;
	bh=bEnXhjGtJKZkIxbePW+p6Asdoj4j4AQB0wL6iuk50WA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RntI7i8ytCYVSGW6Ntb823Ui9csnW0xCmKV9M6OSXwjKW/JgWx9GlUKS8UrnN9kq6hgcMSfMvoVUPma/sXe153QGHKcWS8YqQ1DN1mVLSHjNrdQTDaKq0/F3kvHn/JxumTwRb3uGfkxJx5iPzhbMpZf7tqK16CWewTFsNy0rEk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKJMM5jg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776920897; x=1808456897;
  h=date:from:to:cc:subject:message-id;
  bh=bEnXhjGtJKZkIxbePW+p6Asdoj4j4AQB0wL6iuk50WA=;
  b=AKJMM5jgsYfxK4cnGsTXUHcxg9+gun5sGahHpRM6oT6Y6SrhoU8+I7bD
   eHImO+XNUAW+gks09pGG1aCGPEfrmxYxNdNd35MduSxPPf0FW5qVsS67r
   gE4YPkDPpfYgYQ3e2ydTHBe5s86zZ55lcn/ZSQiRNTY9dqIpe4xFdEM3B
   1iN4zm3S8mAggWnObYo7g1Z2Z7US2Rs99f4w4KiZ9+2fu+UfMbyTzKPi3
   lUWtjoiJ8WrMLsYMIXDZBL75RwL/IZdQmsHisXkpv6kiJRLVWizHfYbQz
   RHCAW4rPkflMmsYywbjUPUlXckVnOKvHKi4RNumAcM7RTb3UVpC2scYWa
   Q==;
X-CSE-ConnectionGUID: LFKOADyvS6qbJR/CE9vuVg==
X-CSE-MsgGUID: FVmdOMhfTbKaG8tURLROYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81745167"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="81745167"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 22:08:16 -0700
X-CSE-ConnectionGUID: QzYP/lceRC+HJ2oLVT9xpQ==
X-CSE-MsgGUID: a3kBb6RCRDqaa5jLqNPcOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="236547828"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Apr 2026 22:08:14 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFmIN-000000001Vb-3cJ3;
	Thu, 23 Apr 2026 05:08:11 +0000
Date: Thu, 23 Apr 2026 13:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:atomisp] BUILD SUCCESS
 2bddfe854e4c7cbdb7e4dbe101e3dee65a3f511a
Message-ID: <202604231329.XON4GX8s-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59353-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: EAA8144D25A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git atomisp
branch HEAD: 2bddfe854e4c7cbdb7e4dbe101e3dee65a3f511a  media: atomisp: use kmalloc_objs for array allocations

elapsed time: 933m

configs tested: 81
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arc         randconfig-001-20260423    gcc-15.2.0
arc         randconfig-002-20260423    gcc-8.5.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm         randconfig-001-20260423    gcc-10.5.0
arm         randconfig-002-20260423    clang-23
arm         randconfig-003-20260423    clang-23
arm         randconfig-004-20260423    clang-23
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
arm64       randconfig-003-20260423    gcc-14.3.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky        randconfig-001-20260423    gcc-10.5.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
hexagon     randconfig-001-20260423    clang-16
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260423    gcc-9.5.0
parisc      randconfig-002-20260423    gcc-13.4.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc           ep8248e_defconfig    gcc-15.2.0
powerpc     randconfig-001-20260423    clang-23
powerpc     randconfig-002-20260423    clang-23
powerpc64   randconfig-001-20260423    clang-23
powerpc64   randconfig-002-20260423    gcc-10.5.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
riscv       randconfig-002-20260423    gcc-12.5.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
s390        randconfig-002-20260423    gcc-10.5.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh                        defconfig    gcc-15.2.0
sparc                   allnoconfig    gcc-15.2.0
sparc       randconfig-001-20260423    gcc-11.5.0
sparc       randconfig-002-20260423    gcc-8.5.0
sparc64                allmodconfig    clang-23
sparc64     randconfig-001-20260423    clang-23
sparc64     randconfig-002-20260423    gcc-10.5.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
um          randconfig-001-20260423    clang-18
um          randconfig-002-20260423    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa      randconfig-001-20260423    gcc-8.5.0
xtensa      randconfig-002-20260423    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


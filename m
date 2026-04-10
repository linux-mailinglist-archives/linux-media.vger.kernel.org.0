Return-Path: <linux-media+bounces-58565-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNglO5Y82WkKnwgAu9opvQ
	(envelope-from <linux-media+bounces-58565-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 20:08:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2C63DB54B
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 20:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BEC15300B531
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 18:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D773E3D8C;
	Fri, 10 Apr 2026 18:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H61qczGg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B243D3CFF40
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 18:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775844497; cv=none; b=jmIceCbOjYydVFVQY7fmx8VTc0oHxs74ezOT+JAzHBnXAH0wP3VfwvkwL3jpQqHZGuac9PtXfJKuAdg8MaQYt3bTfwP/4kAN2z/K/UwAsLqX2e8XWe3/5ExquQsiu/JV1j9fkFCGX9oBuz6CUTCNpUTSx+mffU4fSOxG+OP9Uck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775844497; c=relaxed/simple;
	bh=B8Qjb416IfbSYt0i6Nzi8JTtBNeQPG8CCdHpjTs1djY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AjXpye0s8eLxtU5xrWOlPUYArUxf3gyXldwz9JQWk2YDIly9CtRno3hJJzGhD+BUKyYoKNLNz0h9h9Y8fLq0YrvKAIkUkZZyeMuFaT9+uYny9t6Qfp7yuESnrweVexhw3eKpBNzJu5wEbiJPGC/MBYLXf9+1alBPxpKtZZnMVZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H61qczGg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775844495; x=1807380495;
  h=date:from:to:cc:subject:message-id;
  bh=B8Qjb416IfbSYt0i6Nzi8JTtBNeQPG8CCdHpjTs1djY=;
  b=H61qczGgtKaINbSm/l1JQqxiM0kST9rfwLzi8nqebWCeaBPADbX8o42Q
   cDil+7WrgugWPkwec+Z427tI4NVQoGHqV9A0XCu6gUWN+JMSQxsjzCrUd
   6vbO6sbE0UJXXiFXwdO56xkozJTjCFTvPyLqloo2GVlyfxPj6GGHpONlp
   yCZOXEsR6hLL344wh7tV7LUFLQT1BOZuu3uFucsVLFM2UanCNtaXBBGo+
   d+nHChP2nP6OU+Nqh2V4+/R9vozPQJvknWL9j9OBwym6lYvZgWc5d5LTh
   Yvq467XAQ2qx7Obm0AKWaW5tSn9Znr1BhPcME3hfdSL8ZRXHtZdqmjQYw
   Q==;
X-CSE-ConnectionGUID: w7cgpXNdRXeucwfnPvhUUQ==
X-CSE-MsgGUID: J/m9NCEcRsCMUTPfWanKKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="99511936"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="99511936"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 11:08:15 -0700
X-CSE-ConnectionGUID: JR03lZIYRv67Rl/m0t8v+g==
X-CSE-MsgGUID: wffT0CE3Sxe3jHKtkVLWTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="222670784"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2026 11:08:11 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBGH3-000000004BJ-0XtS;
	Fri, 10 Apr 2026 18:08:09 +0000
Date: Sat, 11 Apr 2026 02:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:int3472] BUILD SUCCESS
 7e7d0572300a208d7965fe33ef1fa7edabc98582
Message-ID: <202604110212.oFqYfsIw-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58565-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB2C63DB54B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git int3472
branch HEAD: 7e7d0572300a208d7965fe33ef1fa7edabc98582  Use MS-15A3 for MSI Prestige AI+ 16 (squash to Antti's patch)

elapsed time: 729m

configs tested: 162
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260410    gcc-8.5.0
arc                   randconfig-002-20260410    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260410    gcc-8.5.0
arm                   randconfig-002-20260410    gcc-8.5.0
arm                   randconfig-003-20260410    gcc-8.5.0
arm                   randconfig-004-20260410    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260410    gcc-10.5.0
arm64                 randconfig-002-20260410    gcc-10.5.0
arm64                 randconfig-003-20260410    gcc-10.5.0
arm64                 randconfig-004-20260410    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260410    gcc-10.5.0
csky                  randconfig-002-20260410    gcc-10.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260410    gcc-15.2.0
hexagon               randconfig-002-20260410    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260410    clang-20
i386        buildonly-randconfig-002-20260410    clang-20
i386        buildonly-randconfig-003-20260410    clang-20
i386        buildonly-randconfig-004-20260410    clang-20
i386        buildonly-randconfig-005-20260410    clang-20
i386        buildonly-randconfig-006-20260410    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260410    gcc-14
i386                  randconfig-002-20260410    gcc-14
i386                  randconfig-003-20260410    gcc-14
i386                  randconfig-004-20260410    gcc-14
i386                  randconfig-005-20260410    gcc-14
i386                  randconfig-006-20260410    gcc-14
i386                  randconfig-007-20260410    gcc-14
i386                  randconfig-011-20260410    clang-20
i386                  randconfig-012-20260410    clang-20
i386                  randconfig-013-20260410    clang-20
i386                  randconfig-014-20260410    clang-20
i386                  randconfig-015-20260410    clang-20
i386                  randconfig-016-20260410    clang-20
i386                  randconfig-017-20260410    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260410    gcc-15.2.0
loongarch             randconfig-002-20260410    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        vocore2_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260410    gcc-15.2.0
nios2                 randconfig-002-20260410    gcc-15.2.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260410    gcc-14.3.0
parisc                randconfig-002-20260410    gcc-14.3.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260410    gcc-14.3.0
powerpc               randconfig-002-20260410    gcc-14.3.0
powerpc64             randconfig-001-20260410    gcc-14.3.0
powerpc64             randconfig-002-20260410    gcc-14.3.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260410    clang-23
sparc                 randconfig-002-20260410    clang-23
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260410    clang-23
sparc64               randconfig-002-20260410    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260410    clang-23
um                    randconfig-002-20260410    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260410    clang-20
x86_64      buildonly-randconfig-002-20260410    clang-20
x86_64      buildonly-randconfig-003-20260410    clang-20
x86_64      buildonly-randconfig-004-20260410    clang-20
x86_64      buildonly-randconfig-005-20260410    clang-20
x86_64      buildonly-randconfig-006-20260410    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260410    clang-20
x86_64                randconfig-002-20260410    clang-20
x86_64                randconfig-003-20260410    clang-20
x86_64                randconfig-004-20260410    clang-20
x86_64                randconfig-005-20260410    clang-20
x86_64                randconfig-006-20260410    clang-20
x86_64                randconfig-011-20260410    gcc-14
x86_64                randconfig-012-20260410    gcc-14
x86_64                randconfig-013-20260410    gcc-14
x86_64                randconfig-014-20260410    gcc-14
x86_64                randconfig-015-20260410    gcc-14
x86_64                randconfig-016-20260410    gcc-14
x86_64                randconfig-071-20260410    clang-20
x86_64                randconfig-072-20260410    clang-20
x86_64                randconfig-073-20260410    clang-20
x86_64                randconfig-074-20260410    clang-20
x86_64                randconfig-075-20260410    clang-20
x86_64                randconfig-076-20260410    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260410    clang-23
xtensa                randconfig-002-20260410    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


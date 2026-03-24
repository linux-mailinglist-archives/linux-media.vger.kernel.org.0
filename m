Return-Path: <linux-media+bounces-56811-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE2QMw49wmmCagQAu9opvQ
	(envelope-from <linux-media+bounces-56811-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:28:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5884303F61
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A51331635FC
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 07:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517483B47C4;
	Tue, 24 Mar 2026 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2xBY9Gx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E353932D4
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 07:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774336295; cv=none; b=GLpQTjgSsRI0Kx70472+/9s6cleYeZo3jDsjLBXiR8sno1GXiOVo7b3tonzd1Md/UJCcHyeLZ5nUybvmXkrY6cUz4mP1av281Xg+TMWZMHoqh9cqWiBra0W4tl08qZKxy0/3mAruIsHubKqN97CusW6A/UQpPtJ1ksdAW39YlLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774336295; c=relaxed/simple;
	bh=oxh+KVIp4LZDxKzMohp0VChHjBb4qF5rpmqF5blb1B4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gFGTfHPo4BQHeQV+KiqbKi2Lv3lnTctpKt+dkT3OA8lXdfW6J+Xp15hFwfy7b0GXsxPZZWjSRrsX5REloeGQOyQV/tQ+uyUVpTVFXPALpPAofPY7H4uUNo9+8+Y9eeM5j8cOaqiI7eLiRUMrsEb1lAEjDBrZfM7mFQF+bFKtgco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2xBY9Gx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774336288; x=1805872288;
  h=date:from:to:cc:subject:message-id;
  bh=oxh+KVIp4LZDxKzMohp0VChHjBb4qF5rpmqF5blb1B4=;
  b=C2xBY9GxuXBfRnzHZ3jBMfHF9g7uowfS+nSv9eJYXwsnp0lgsHexZ1k7
   V9DG/JpNcbwGLzgPPPGUfVpAaXGqVR1mUKSOyQXz2Rest0obZFg6Fm3Xn
   Qryo/0XmmFbFaHj9cy0vm/KZPN9FtVbPD0VP3bRSQFMnatDilfzu1urM/
   r4RDIRz2jvNmVI4AgIik8PmoaS5/wJmub6375fKNfpzzxLTQqqI4kRP70
   8zqhG8VxInUtlk2A3qN0VoSYftHOszoHkDU1p5go7SdPAxDgm7mWjIHME
   8k0gS6OAOvg2WBHmAWI+cXXzm/rkvjAZur2rAXY5alNqrloFpD4WdwgLG
   Q==;
X-CSE-ConnectionGUID: 8SgHTt3DQcWLsFgR9OgG0A==
X-CSE-MsgGUID: lxHc+yl5SS+t9lPgPMMheQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74529948"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74529948"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 00:11:27 -0700
X-CSE-ConnectionGUID: ciNz6AzPQaiHsQ5WrDpv1g==
X-CSE-MsgGUID: FFttSiyrQtWqEz9E6iyTVw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Mar 2026 00:11:25 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4vv9-00000000489-0G4h;
	Tue, 24 Mar 2026 07:11:23 +0000
Date: Tue, 24 Mar 2026 15:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 f6c511b24e9ebabbdc9a333dd1b1a9170add3952
Message-ID: <202603241538.Jgi2NhLQ-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56811-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B5884303F61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: f6c511b24e9ebabbdc9a333dd1b1a9170add3952  staging: media: ipu7: Update TODO

elapsed time: 737m

configs tested: 163
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
arc                   randconfig-001-20260324    gcc-8.5.0
arc                   randconfig-002-20260324    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260324    gcc-8.5.0
arm                   randconfig-002-20260324    gcc-8.5.0
arm                   randconfig-003-20260324    gcc-8.5.0
arm                   randconfig-004-20260324    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260324    gcc-13.4.0
arm64                 randconfig-002-20260324    gcc-13.4.0
arm64                 randconfig-003-20260324    gcc-13.4.0
arm64                 randconfig-004-20260324    gcc-13.4.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260324    gcc-13.4.0
csky                  randconfig-002-20260324    gcc-13.4.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260324    gcc-12
i386        buildonly-randconfig-002-20260324    gcc-12
i386        buildonly-randconfig-003-20260324    gcc-12
i386        buildonly-randconfig-004-20260324    gcc-12
i386        buildonly-randconfig-005-20260324    gcc-12
i386        buildonly-randconfig-006-20260324    gcc-12
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260324    clang-20
i386                  randconfig-002-20260324    clang-20
i386                  randconfig-003-20260324    clang-20
i386                  randconfig-004-20260324    clang-20
i386                  randconfig-005-20260324    clang-20
i386                  randconfig-006-20260324    clang-20
i386                  randconfig-007-20260324    clang-20
i386                  randconfig-011-20260324    gcc-13
i386                  randconfig-012-20260324    gcc-13
i386                  randconfig-013-20260324    gcc-13
i386                  randconfig-014-20260324    gcc-13
i386                  randconfig-015-20260324    gcc-13
i386                  randconfig-016-20260324    gcc-13
i386                  randconfig-017-20260324    gcc-13
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
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
mips                           mtx1_defconfig    clang-23
mips                          rb532_defconfig    clang-18
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260324    gcc-8.5.0
parisc                randconfig-002-20260324    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260324    gcc-8.5.0
powerpc               randconfig-002-20260324    gcc-8.5.0
powerpc64             randconfig-001-20260324    gcc-8.5.0
powerpc64             randconfig-002-20260324    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260324    clang-23
riscv                 randconfig-002-20260324    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260324    clang-23
s390                  randconfig-002-20260324    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260324    clang-23
sh                    randconfig-002-20260324    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260324    gcc-14
sparc                 randconfig-002-20260324    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260324    gcc-14
sparc64               randconfig-002-20260324    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260324    gcc-14
um                    randconfig-002-20260324    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260324    gcc-14
x86_64      buildonly-randconfig-002-20260324    gcc-14
x86_64      buildonly-randconfig-003-20260324    gcc-14
x86_64      buildonly-randconfig-004-20260324    gcc-14
x86_64      buildonly-randconfig-005-20260324    gcc-14
x86_64      buildonly-randconfig-006-20260324    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260324    clang-20
x86_64                randconfig-002-20260324    clang-20
x86_64                randconfig-003-20260324    clang-20
x86_64                randconfig-004-20260324    clang-20
x86_64                randconfig-005-20260324    clang-20
x86_64                randconfig-006-20260324    clang-20
x86_64                randconfig-011-20260324    gcc-14
x86_64                randconfig-012-20260324    gcc-14
x86_64                randconfig-013-20260324    gcc-14
x86_64                randconfig-014-20260324    gcc-14
x86_64                randconfig-015-20260324    gcc-14
x86_64                randconfig-016-20260324    gcc-14
x86_64                randconfig-071-20260324    gcc-12
x86_64                randconfig-072-20260324    gcc-12
x86_64                randconfig-073-20260324    gcc-12
x86_64                randconfig-074-20260324    gcc-12
x86_64                randconfig-075-20260324    gcc-12
x86_64                randconfig-076-20260324    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260324    gcc-14
xtensa                randconfig-002-20260324    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


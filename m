Return-Path: <linux-media+bounces-57381-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEnWMQkGx2nWRgUAu9opvQ
	(envelope-from <linux-media+bounces-57381-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:34:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0593D34BFBC
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF2943056648
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B17E39281D;
	Fri, 27 Mar 2026 22:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWuJQLzF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF2939E198
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 22:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774650878; cv=none; b=I0WOWyPK+sPtNC66UmOeqoRvCbEiGbbihOANQLRKc41YAK66n0hS64fISfKATBHZ6/PSn1qEfiBIPl3jlpJmOfmggoRyUNlbJrgx6XRxDilkxicft1HXW17ck2lrWrOD8jXG71uT4o3/IlHbY9SGSPPBR30/Jgam+TM15F61NyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774650878; c=relaxed/simple;
	bh=xvFkxSz1UvYjbdONVR8Tv6J3WZtQsE20JOH0+mgVdTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Jovvtox72/inbpBUHkZP+M5afAIC4Cn203KozdXHytaBJWsafVwYUOcuUs/mjaRpOH36GwEKAJEAMwheKszkflWmmADW51JJIngbdZ10NTuA/ii0QbKlMjYW/IRiDToJoUuGszNaLiTj+EQ9jYVhSLh6wZUYWWpmKVGGfxQFqgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWuJQLzF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774650875; x=1806186875;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xvFkxSz1UvYjbdONVR8Tv6J3WZtQsE20JOH0+mgVdTE=;
  b=gWuJQLzFfYMNzebt9/MYSY/YARtlOu7w5VR2B4U/590dvPBjNLmOO6Fp
   KlQ/ApABFsOny3jPTPS/jrzvr3gp/enTACE1gwua7bhEMBqKTHGIOIcIL
   fh35MycRqdrfHW48xMP9tbQtZ75dK4Hi12c/P/UjV0cJKO7w51V9+5J7Y
   TxwPXfskHjMcme9lZVEOEe73vjbo+04KDJMyEyMrqwCueQjQ10CEBxsTh
   YJLizvaK5/1Ht8+dw4FKdr1lQ4rc/ez+QbVlEjGflp7QInPfbhb/ZhTYt
   1FSVgyjh559JknFUo7EYXlg3UZvOR7YQh0gujfZuriKyxYNuLldcu9G9K
   Q==;
X-CSE-ConnectionGUID: xPh3pI/kQ6ar1y3u3h5/2A==
X-CSE-MsgGUID: OzisThJxSNeyrRCWOns6OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74913744"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="74913744"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 15:34:34 -0700
X-CSE-ConnectionGUID: kWyV5B0AQ56i8FDJb4BSKQ==
X-CSE-MsgGUID: PH0AdbULQ0aduZJP2UcM+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="225343923"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Mar 2026 15:34:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Fl8-00000000Apb-1vrI;
	Fri, 27 Mar 2026 22:34:30 +0000
Date: Sat, 28 Mar 2026 06:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 c47a45fed2a6569b89bd8e376cf8c874fa8d74a4
Message-ID: <202603280616.IVpmLO2V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57381-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 0593D34BFBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: c47a45fed2a6569b89bd8e376cf8c874fa8d74a4  media: dw9719: Add b=
ack the I=C2=B2C device id table

elapsed time: 893m

configs tested: 143
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260327    gcc-11.5.0
arc                   randconfig-002-20260327    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260327    gcc-8.5.0
arm                   randconfig-002-20260327    clang-23
arm                   randconfig-003-20260327    clang-18
arm                   randconfig-004-20260327    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260327    clang-23
arm64                 randconfig-002-20260327    clang-18
arm64                 randconfig-003-20260327    gcc-9.5.0
arm64                 randconfig-004-20260327    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260327    gcc-15.2.0
csky                  randconfig-002-20260327    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260328    clang-23
hexagon               randconfig-002-20260328    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260327    clang-20
i386        buildonly-randconfig-002-20260327    clang-20
i386        buildonly-randconfig-003-20260327    gcc-14
i386        buildonly-randconfig-004-20260327    clang-20
i386        buildonly-randconfig-005-20260327    clang-20
i386        buildonly-randconfig-006-20260327    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-011-20260327    clang-20
i386                  randconfig-012-20260327    gcc-14
i386                  randconfig-013-20260327    gcc-12
i386                  randconfig-014-20260327    gcc-12
i386                  randconfig-015-20260327    clang-20
i386                  randconfig-016-20260327    gcc-14
i386                  randconfig-017-20260327    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260328    clang-23
loongarch             randconfig-002-20260328    gcc-15.2.0
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
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260328    gcc-11.5.0
nios2                 randconfig-002-20260328    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260327    gcc-8.5.0
parisc                randconfig-002-20260327    gcc-8.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                     akebono_defconfig    clang-23
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260327    gcc-8.5.0
powerpc               randconfig-002-20260327    clang-18
powerpc64             randconfig-001-20260327    clang-23
powerpc64             randconfig-002-20260327    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260327    clang-23
riscv                 randconfig-002-20260327    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260327    clang-23
s390                  randconfig-002-20260327    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260327    gcc-14.3.0
sh                    randconfig-002-20260327    gcc-13.4.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260327    gcc-14.3.0
sparc                 randconfig-002-20260327    gcc-13.4.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260327    clang-23
sparc64               randconfig-002-20260327    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260327    gcc-14
um                    randconfig-002-20260327    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260328    gcc-14
x86_64      buildonly-randconfig-002-20260328    clang-20
x86_64      buildonly-randconfig-003-20260328    clang-20
x86_64      buildonly-randconfig-004-20260328    clang-20
x86_64      buildonly-randconfig-005-20260328    gcc-14
x86_64      buildonly-randconfig-006-20260328    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260327    clang-20
x86_64                randconfig-002-20260327    clang-20
x86_64                randconfig-003-20260327    gcc-14
x86_64                randconfig-004-20260327    clang-20
x86_64                randconfig-005-20260327    gcc-14
x86_64                randconfig-006-20260327    gcc-14
x86_64                randconfig-071-20260328    gcc-12
x86_64                randconfig-074-20260328    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260327    gcc-14.3.0
xtensa                randconfig-002-20260327    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-56175-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMngBhlBumnMTQIAu9opvQ
	(envelope-from <linux-media+bounces-56175-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 07:07:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E47A2B6323
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 07:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E3D7300D14D
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 06:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DAE36405A;
	Wed, 18 Mar 2026 06:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hE6onpZo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD881363C7A
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 06:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773813997; cv=none; b=dcD9kWzpG8Ut6coxEiLWmaC+t/bqR/I6rhr83si+rCQ3o/F7WvByz85KuN+ICIjoGDX7BAwoUirr3tLd0Aye0plS4K2Lb4lHMcBAID+skawo9ndW+I5GLAe4OJVdAJn0K98ojKXNVvuREu/fLI7g55DQtbm8FfTZm5CSSCkw44s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773813997; c=relaxed/simple;
	bh=LVsNCMkpZYpOnW+cYmjQg8nRKLH887lSlGEbK30R/WQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u5ca46S0qXpuqVMDhg2pcjUD1KcDebOmna6gve5Yy4LWPR0IJpUAogmSeRJvcnqD6FaaCrYekaqM9B6dRkFeVGga7AbqvCDP6P7uoxA60s3AuQedQkdDvlPVO8weZd2YPOTl3enFX+L1+9lZxg/VPynFvrJz53DPbveW97rnTSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hE6onpZo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773813995; x=1805349995;
  h=date:from:to:cc:subject:message-id;
  bh=LVsNCMkpZYpOnW+cYmjQg8nRKLH887lSlGEbK30R/WQ=;
  b=hE6onpZoA6lPiW0OBwhwMzYb92hJGCIKQnTit9sps3ZrR9elvXFt1W8j
   u23J0yafYwo9jAUiFLkA22iOk9xsa2cxtnN4BAVFktcMcJSCjQ7Lpjl9D
   yosyLxicapz01z0GxhS+xr8dpTp11M5Wj1XhtoA9PaDi2ocDUXss2Fjtf
   Qtl1uyn5oQ9XNhiuR+i0HDZU2CCI2nxa6n97tHsH7yh5gLlJyogoqnsx5
   Zpzi7QID5Uuvoutv175i6zmmHGttkMSl2JqcZbDNadTutjM4yahL8tZLe
   4NQ5Fsj5jpRJBu5fyRBu8mm0dPEQuMY/WC8X8LtEpTMaEZ+gjLTvJvf08
   w==;
X-CSE-ConnectionGUID: 1/Ibhb0GS8akspw6Wk9+lA==
X-CSE-MsgGUID: sjTl6j6ITp+aYd+1iIoCuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74748023"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74748023"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 23:06:34 -0700
X-CSE-ConnectionGUID: ic/TTK+zToK0FMdjcKDI7w==
X-CSE-MsgGUID: +VGFlOsuQ8ytL/HcBY2P+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="245535458"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Mar 2026 23:06:32 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2k33-000000002bb-2Djl;
	Wed, 18 Mar 2026 06:06:29 +0000
Date: Wed, 18 Mar 2026 14:06:15 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 a93a51f42ac354425a252210183c4151d991f75d
Message-ID: <202603181409.tsTrY1Lf-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56175-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid,linuxtv.org:url]
X-Rspamd-Queue-Id: 6E47A2B6323
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: a93a51f42ac354425a252210183c4151d991f75d  media: lirc: increase IR_MAX_DURATION to send extended code sequences

elapsed time: 869m

configs tested: 174
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
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260318    gcc-8.5.0
arc                   randconfig-002-20260318    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-23
arm                   randconfig-001-20260318    gcc-8.5.0
arm                   randconfig-002-20260318    gcc-8.5.0
arm                   randconfig-003-20260318    gcc-8.5.0
arm                   randconfig-004-20260318    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260318    clang-23
arm64                 randconfig-002-20260318    clang-23
arm64                 randconfig-003-20260318    clang-23
arm64                 randconfig-004-20260318    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260318    clang-23
csky                  randconfig-002-20260318    clang-23
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260318    gcc-8.5.0
hexagon               randconfig-002-20260318    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260318    gcc-14
i386        buildonly-randconfig-002-20260318    gcc-14
i386        buildonly-randconfig-003-20260318    gcc-14
i386        buildonly-randconfig-004-20260318    gcc-14
i386        buildonly-randconfig-005-20260318    gcc-14
i386        buildonly-randconfig-006-20260318    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-011-20260318    clang-20
i386                  randconfig-012-20260318    clang-20
i386                  randconfig-013-20260318    clang-20
i386                  randconfig-014-20260318    clang-20
i386                  randconfig-015-20260318    clang-20
i386                  randconfig-016-20260318    clang-20
i386                  randconfig-017-20260318    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260318    gcc-8.5.0
loongarch             randconfig-002-20260318    gcc-8.5.0
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
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260318    gcc-8.5.0
nios2                 randconfig-002-20260318    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260318    gcc-11.5.0
parisc                randconfig-002-20260318    gcc-11.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260318    gcc-11.5.0
powerpc               randconfig-002-20260318    gcc-11.5.0
powerpc64             randconfig-001-20260318    gcc-11.5.0
powerpc64             randconfig-002-20260318    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260318    gcc-15.2.0
riscv                 randconfig-002-20260318    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260318    gcc-15.2.0
s390                  randconfig-002-20260318    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260318    gcc-15.2.0
sh                    randconfig-002-20260318    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260318    gcc-13.4.0
sparc                 randconfig-002-20260318    gcc-13.4.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260318    gcc-13.4.0
sparc64               randconfig-002-20260318    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260318    gcc-13.4.0
um                    randconfig-002-20260318    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260318    gcc-14
x86_64      buildonly-randconfig-002-20260318    gcc-14
x86_64      buildonly-randconfig-003-20260318    gcc-14
x86_64      buildonly-randconfig-004-20260318    gcc-14
x86_64      buildonly-randconfig-005-20260318    gcc-14
x86_64      buildonly-randconfig-006-20260318    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260318    gcc-14
x86_64                randconfig-002-20260318    gcc-14
x86_64                randconfig-003-20260318    gcc-14
x86_64                randconfig-004-20260318    gcc-14
x86_64                randconfig-005-20260318    gcc-14
x86_64                randconfig-006-20260318    gcc-14
x86_64                randconfig-011-20260318    clang-20
x86_64                randconfig-012-20260318    clang-20
x86_64                randconfig-013-20260318    clang-20
x86_64                randconfig-014-20260318    clang-20
x86_64                randconfig-015-20260318    clang-20
x86_64                randconfig-016-20260318    clang-20
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
xtensa                randconfig-001-20260318    gcc-13.4.0
xtensa                randconfig-002-20260318    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


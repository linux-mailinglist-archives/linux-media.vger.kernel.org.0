Return-Path: <linux-media+bounces-65889-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U1RQKkFDQmoJ3AkAu9opvQ
	(envelope-from <linux-media+bounces-65889-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:04:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 519B46D8A08
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:04:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=NH0Cpx9j;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65889-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65889-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EDEC3024E5D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91903FB7FF;
	Mon, 29 Jun 2026 10:02:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EB33FA5EF
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 10:02:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727355; cv=none; b=KDljO5LJTjsHue4y/8ccY/oJvzLLHRR9NJsm3ba2S5R68v3ZLXRPlzg+d/tal0U3drpL9TFTMuXGvv51ED785AQ8+XaElKuCpR8lwag2d70g92RP2tQh59DQ8g2mqaZ6sf/ao34BEIsmSpKCO4nU9qY3ZIGLLixb3QS0Jp6iISk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727355; c=relaxed/simple;
	bh=lAARYK6HmQxdOkbbAOivX1sVGZ/bBXG9uwEbTl4nCn8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VHBe4iPO7cm9fV7poQ7quzmk/VWxCBoHXAYvnZdOFSabnhm5s8xV/6zywM8jX0HM65t3LnhRLiXK4biCGgP0TuzSSerfN5kbh7eDYfRZPP211hBPKPDVC58Zxjy4BF7SkIiS8CjZhovXIDEZSSk1c2DrPz3AS6ubhyrly70ue0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NH0Cpx9j; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782727352; x=1814263352;
  h=date:from:to:cc:subject:message-id;
  bh=lAARYK6HmQxdOkbbAOivX1sVGZ/bBXG9uwEbTl4nCn8=;
  b=NH0Cpx9jvQcDz3C+UAL35J7b4Rsgkr7VqbvNTtAUE8aUYNkXjbyDlmGA
   YrjEi2J7XCvfmfMJZPQq99nuTLnZW6acqUG3ZC3CgkVnguL/9b/7qxKHl
   idrHH0lN2w81eCDeIhsBV+w0rk7WttQY5Ydx/eRpQ8maadT3vcQwHZK8H
   Jbr3aaasbuR4mY1SwC2LsE+byNvYbutLwudk755J30dzNnc9ZbtyYElHS
   dFBBbOFZipxsZdrFcA6Jts0/Ofz5oDk2ntv92OSO09fqTme6i7ltqMotc
   Wzkuy4l0ZkpcR7WAViBWXqX0QAalnJgl0EwNPoUdXHF44l9jyc+LnS7u3
   w==;
X-CSE-ConnectionGUID: G7mGJjczSHuINRSJqP4+Ag==
X-CSE-MsgGUID: oY9yEZvrTJKTFkKBEMe68w==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="85958919"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="85958919"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 03:02:31 -0700
X-CSE-ConnectionGUID: cr1RQMGEQESNlevyyX3d6A==
X-CSE-MsgGUID: vFyDK8XHSfO143/mBsQXjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="256323463"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 Jun 2026 03:02:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1we8os-000000007Gf-1NoU;
	Mon, 29 Jun 2026 10:02:26 +0000
Date: Mon, 29 Jun 2026 18:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre] BUILD SUCCESS WITH WARNING
 66c090febbc3c412ced4e71cb69f47b05eea0331
Message-ID: <202606291856.nltpWndg-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-65889-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 519B46D8A08

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-pre
branch HEAD: 66c090febbc3c412ced4e71cb69f47b05eea0331  media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606291022.4ZXe8Dz4-lkp@intel.com

    Warning: drivers/media/i2c/cvs/v4l2.c:203 function parameter 'ci' not described in 'cvs_csi_set_fmt'

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt
|-- arm64-randconfig-001-20260629
|   `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt
|-- i386-allmodconfig
|   `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt
|-- i386-allyesconfig
|   `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt
|-- i386-randconfig-001-20260629
|   `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt
|-- i386-randconfig-017-20260629
|   `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt
|-- loongarch-allmodconfig
|   `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt
|-- loongarch-allyesconfig
|   `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt
|-- loongarch-randconfig-r121-20260629
|   `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt
|-- riscv-allmodconfig
|   `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt
|-- riscv-allyesconfig
|   `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt
|-- x86_64-allmodconfig
|   `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt
|-- x86_64-allyesconfig
|   `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt
`-- x86_64-randconfig-r054-20260629
    `-- Warning:drivers-media-i2c-cvs-v4l2.c-function-parameter-ci-not-described-in-cvs_csi_set_fmt

elapsed time: 728m

configs tested: 267
configs skipped: 5

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260629    clang-17
arc                   randconfig-001-20260629    gcc-16.1.0
arc                   randconfig-002-20260629    clang-17
arc                   randconfig-002-20260629    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                      footbridge_defconfig    clang-23
arm                   randconfig-001-20260629    clang-17
arm                   randconfig-001-20260629    gcc-10.5.0
arm                   randconfig-002-20260629    clang-17
arm                   randconfig-003-20260629    clang-17
arm                   randconfig-003-20260629    clang-23
arm                   randconfig-004-20260629    clang-17
arm                   randconfig-004-20260629    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260629    gcc-16.1.0
arm64                 randconfig-002-20260629    clang-22
arm64                 randconfig-002-20260629    gcc-16.1.0
arm64                 randconfig-003-20260629    clang-23
arm64                 randconfig-003-20260629    gcc-16.1.0
arm64                 randconfig-004-20260629    clang-20
arm64                 randconfig-004-20260629    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260629    gcc-10.5.0
csky                  randconfig-001-20260629    gcc-16.1.0
csky                  randconfig-002-20260629    gcc-12.5.0
csky                  randconfig-002-20260629    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260629    clang-22
hexagon               randconfig-001-20260629    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260629    clang-23
hexagon               randconfig-002-20260629    gcc-11.5.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260629    clang-22
i386        buildonly-randconfig-001-20260629    gcc-14
i386        buildonly-randconfig-002-20260629    gcc-13
i386        buildonly-randconfig-002-20260629    gcc-14
i386        buildonly-randconfig-003-20260629    gcc-14
i386        buildonly-randconfig-004-20260629    clang-22
i386        buildonly-randconfig-004-20260629    gcc-14
i386        buildonly-randconfig-005-20260629    gcc-14
i386        buildonly-randconfig-006-20260629    clang-22
i386        buildonly-randconfig-006-20260629    gcc-14
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260629    clang-22
i386                  randconfig-002-20260629    clang-22
i386                  randconfig-003-20260629    clang-22
i386                  randconfig-003-20260629    gcc-14
i386                  randconfig-004-20260629    clang-22
i386                  randconfig-005-20260629    clang-22
i386                  randconfig-006-20260629    clang-22
i386                  randconfig-007-20260629    clang-22
i386                  randconfig-011-20260629    gcc-14
i386                  randconfig-012-20260629    gcc-14
i386                  randconfig-013-20260629    gcc-14
i386                  randconfig-014-20260629    gcc-14
i386                  randconfig-015-20260629    clang-22
i386                  randconfig-015-20260629    gcc-14
i386                  randconfig-016-20260629    clang-22
i386                  randconfig-016-20260629    gcc-14
i386                  randconfig-017-20260629    clang-22
i386                  randconfig-017-20260629    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260629    gcc-11.5.0
loongarch             randconfig-001-20260629    gcc-12.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260629    clang-23
loongarch             randconfig-002-20260629    gcc-11.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                       m5475evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260629    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260629    gcc-11.5.0
nios2                 randconfig-002-20260629    gcc-8.5.0
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
parisc                randconfig-001-20260629    gcc-9.5.0
parisc                randconfig-002-20260629    gcc-11.5.0
parisc                randconfig-002-20260629    gcc-9.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                        icon_defconfig    gcc-16.1.0
powerpc                     ksi8560_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260629    gcc-10.5.0
powerpc               randconfig-001-20260629    gcc-9.5.0
powerpc               randconfig-002-20260629    gcc-8.5.0
powerpc               randconfig-002-20260629    gcc-9.5.0
powerpc64             randconfig-001-20260629    gcc-8.5.0
powerpc64             randconfig-001-20260629    gcc-9.5.0
powerpc64             randconfig-002-20260629    gcc-8.5.0
powerpc64             randconfig-002-20260629    gcc-9.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260629    clang-17
riscv                 randconfig-001-20260629    gcc-12.5.0
riscv                 randconfig-002-20260629    clang-16
riscv                 randconfig-002-20260629    clang-17
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260629    clang-17
s390                  randconfig-001-20260629    gcc-8.5.0
s390                  randconfig-002-20260629    clang-17
s390                  randconfig-002-20260629    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                               j2_defconfig    gcc-16.1.0
sh                    randconfig-001-20260629    clang-17
sh                    randconfig-001-20260629    gcc-10.5.0
sh                    randconfig-002-20260629    clang-17
sh                    randconfig-002-20260629    gcc-12.5.0
sh                   sh7770_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260629    gcc-15.2.0
sparc                 randconfig-002-20260629    gcc-15.2.0
sparc                 randconfig-002-20260629    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260629    gcc-15.2.0
sparc64               randconfig-001-20260629    gcc-8.5.0
sparc64               randconfig-002-20260629    gcc-13.4.0
sparc64               randconfig-002-20260629    gcc-15.2.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260629    gcc-14
um                    randconfig-001-20260629    gcc-15.2.0
um                    randconfig-002-20260629    clang-22
um                    randconfig-002-20260629    gcc-15.2.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260629    clang-22
x86_64      buildonly-randconfig-002-20260629    clang-22
x86_64      buildonly-randconfig-003-20260629    clang-22
x86_64      buildonly-randconfig-004-20260629    clang-22
x86_64      buildonly-randconfig-005-20260629    clang-22
x86_64      buildonly-randconfig-006-20260629    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260629    gcc-14
x86_64                randconfig-002-20260629    clang-22
x86_64                randconfig-002-20260629    gcc-14
x86_64                randconfig-003-20260629    gcc-14
x86_64                randconfig-004-20260629    gcc-14
x86_64                randconfig-005-20260629    clang-22
x86_64                randconfig-005-20260629    gcc-14
x86_64                randconfig-006-20260629    gcc-14
x86_64                randconfig-011-20260629    clang-22
x86_64                randconfig-011-20260629    gcc-13
x86_64                randconfig-012-20260629    clang-22
x86_64                randconfig-012-20260629    gcc-13
x86_64                randconfig-013-20260629    clang-22
x86_64                randconfig-013-20260629    gcc-13
x86_64                randconfig-014-20260629    clang-22
x86_64                randconfig-014-20260629    gcc-13
x86_64                randconfig-015-20260629    gcc-13
x86_64                randconfig-016-20260629    gcc-13
x86_64                randconfig-016-20260629    gcc-14
x86_64                randconfig-071-20260629    clang-22
x86_64                randconfig-072-20260629    clang-22
x86_64                randconfig-073-20260629    clang-22
x86_64                randconfig-073-20260629    gcc-14
x86_64                randconfig-074-20260629    clang-22
x86_64                randconfig-075-20260629    clang-22
x86_64                randconfig-075-20260629    gcc-14
x86_64                randconfig-076-20260629    clang-22
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
xtensa                randconfig-001-20260629    gcc-15.2.0
xtensa                randconfig-002-20260629    gcc-15.2.0
xtensa                randconfig-002-20260629    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


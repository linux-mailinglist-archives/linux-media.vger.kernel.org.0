Return-Path: <linux-media+bounces-62573-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBk+NGAlEGoYUQYAu9opvQ
	(envelope-from <linux-media+bounces-62573-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 11:44:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7216F5B166B
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 11:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8837300D87C
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 09:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7234D3BED33;
	Fri, 22 May 2026 09:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+kEQcl/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E5F3B3C0D
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443033; cv=none; b=C6DrKXbZ8nuYRvpgehOvkMFihqmOvx+ZMUacRB3HbtdJlo8OOZniWoXavoYkAhIJLzJK5xrNNd5oH1NpJ93bRkx87ZirW/AfPq2APVSe2oNM6U+to2SgM3ZeawQj7e+m6syRGpreOR3LiJn5HkSmZJKvhgSLFoVH+LdS3Evj/1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443033; c=relaxed/simple;
	bh=sYj/hqWB0TCHAPjEOk+BzmpxxRSS4jXHAoOSKQFYYNs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MxhZJ/f+SefFPRcDz9yHXr5n1e6d/5WvARK40gq1M+b0IL23tt9/6fLan5TS/uEJk9mYWH6SbjAz72Qu5gYBzVpu0B8ZGXSCI2zkm2PZjwi+0WwZv8JOK+g6693q1oP/yHNViZzXrow/JoqLqi+7SvUHQe9O10j0ox+C+g6aydo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+kEQcl/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779443028; x=1810979028;
  h=date:from:to:cc:subject:message-id;
  bh=sYj/hqWB0TCHAPjEOk+BzmpxxRSS4jXHAoOSKQFYYNs=;
  b=R+kEQcl/6U4Qq8IzjxDpbE1rK9iD0p3Mb2gOfrw0Y5fRejB8rob2pO8g
   XOcr7YDUEgnBmvCF98LjEOnlAzrDFa6R3MO+P7Ug+IpmLEx84mNFWxZkB
   swiRYRH2UHSum6zxrfirCERVXQHSCo9LE9/RFAbahIedzO6my1hyKTGxF
   Y0Lozk5c+R0YhpPDocTA7YEQQ1L+1YZl48667vschkw4JX0hbKzHaLBRo
   NjcBbpLCf6pVY+8gQ7R8YSDkfxQsHhve8wXMvW862hHDj6m1ZIUIpPyjm
   yMaGkHsP3WCx8bfii/qAhTlsMoGm7+L1gUlyBL3GnM2nXhw/svMZwT+Be
   g==;
X-CSE-ConnectionGUID: ghrqrQZrTkGlTUPAMbbzlA==
X-CSE-MsgGUID: GLQ2DxLhT3GsJdGdc8g3kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80223791"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80223791"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 02:43:47 -0700
X-CSE-ConnectionGUID: pAWukSUgSZaAi8ETJVnKqw==
X-CSE-MsgGUID: YKImnPvRT62CXJ8D9ha5MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="236437201"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 May 2026 02:43:46 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQMPw-000000002A7-00Od;
	Fri, 22 May 2026 09:43:44 +0000
Date: Fri, 22 May 2026 17:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 a3d78e74dd3ed04797ea351edb7f0a19b961c063
Message-ID: <202605221729.Dm4Br0c1-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-62573-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7216F5B166B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: a3d78e74dd3ed04797ea351edb7f0a19b961c063  media: uvcvideo: Only do uvc_video_get_time() if needed

elapsed time: 734m

configs tested: 73
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
arm64       randconfig-001-20260522    clang-20
arm64       randconfig-002-20260522    gcc-14.3.0
arm64       randconfig-003-20260522    clang-23
arm64       randconfig-004-20260522    gcc-10.5.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky        randconfig-001-20260522    gcc-15.2.0
csky        randconfig-002-20260522    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
loongarch   randconfig-001-20260522    clang-23
loongarch   randconfig-002-20260522    gcc-15.2.0
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
nios2       randconfig-001-20260522    gcc-8.5.0
nios2       randconfig-002-20260522    gcc-8.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260522    gcc-14.3.0
parisc      randconfig-002-20260522    gcc-8.5.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc     randconfig-001-20260522    clang-20
powerpc     randconfig-002-20260522    clang-18
powerpc64   randconfig-001-20260522    gcc-10.5.0
powerpc64   randconfig-002-20260522    gcc-12.5.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
s390                 randconfig-001    gcc-11.5.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh                   randconfig-001    gcc-15.2.0
sparc                   allnoconfig    gcc-15.2.0
sparc64                allmodconfig    clang-23
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


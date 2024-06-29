Return-Path: <linux-media+bounces-14406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC13691CF09
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 22:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E17021C20B29
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 20:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF2C7E111;
	Sat, 29 Jun 2024 20:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHGe+vUG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB3B13B792
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 20:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719693581; cv=none; b=D9QTdRLaw8uixjfDUyZaAz5MrstLAexRA2gGN8f47c2JyF61EynzP5j0rxaGtUyyRpBbGCk9hgWUFeziWwVDmlE/XHBSqffsfhFJG84rAIWEDerI3D+ITEuN8KzdcqRDhC0Y49I77AYzK2rwX+qmD/iZwpO6J3Uxsw/gYsfoq/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719693581; c=relaxed/simple;
	bh=KdKmPVnGS58gWXJ6m0S5tXbsEy9YtHA40qEyV1Ze118=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CON310mroKpKe07bEVxgU446rWjiNfDfItbbDNDugFVFH+/TGdFYpo9OZ5il4eEqW7Rrh2XVw7cw23rFjzOK0X878HXly6QPsIl2/mvruPKjQxKsAlommyh4oZtzRD3rPM9z1kk/Z4AoxQnzAg/bi6N+axOZftzAhOyxpcSca4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHGe+vUG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719693579; x=1751229579;
  h=date:from:to:cc:subject:message-id;
  bh=KdKmPVnGS58gWXJ6m0S5tXbsEy9YtHA40qEyV1Ze118=;
  b=cHGe+vUGDVAGb04LtLYbPl1aPvg+/xECMGcHRysS7MyvTmDCYsvTO7ZT
   KOY+WyuBuBlg2OKbI0yLYy6Mx2hrmsNTLonDZNjNAtD7hrfUYCxhiUpjk
   7VF5KxcvorQs2BCPTsTTY4KeF00Llhl/Jg8Ijk237lN8jSi/wOaanxoMH
   t0p+J1rJb2+fqeh9GdnvzgUaR3HMrF65T4otsKMTenllwtBWVhHsxtd/1
   dQQ7t19tHw+Qs9tiHdRY1x6+KhXD9azewfJd5Ls5XrBbLm+nWm9DiY6cI
   pB4hMKrM6wy3YXw/+9+yOsAKd8wG2m5Otlvj+C9lLBE6KM8j9yTkw1qAw
   w==;
X-CSE-ConnectionGUID: e+lzKo6sQfefa7dM8FNRaw==
X-CSE-MsgGUID: ZQ2WYAkhS/mhx811OhO0GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11118"; a="34293756"
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="34293756"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2024 13:39:39 -0700
X-CSE-ConnectionGUID: 6FBvoO3ATGiJlrqhLU5pMQ==
X-CSE-MsgGUID: EmqOUMNxSDS6M2peeGdWfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="45493985"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Jun 2024 13:39:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNer9-000KHc-20;
	Sat, 29 Jun 2024 20:39:35 +0000
Date: Sun, 30 Jun 2024 04:39:02 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 ec84aa3ac6310438a56d1a6a3f364a5e5bfb48a0
Message-ID: <202406300400.Rhxgfya5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: ec84aa3ac6310438a56d1a6a3f364a5e5bfb48a0  media: imx-mipi-csis: Use v4l2_subdev_enable_streams()

elapsed time: 3735m

configs tested: 72
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240629   gcc-13.2.0
arc                   randconfig-002-20240629   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                   randconfig-001-20240629   gcc-13.2.0
arm                   randconfig-002-20240629   gcc-13.2.0
arm                   randconfig-003-20240629   gcc-13.2.0
arm                   randconfig-004-20240629   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240629   gcc-13.2.0
arm64                 randconfig-002-20240629   gcc-13.2.0
arm64                 randconfig-003-20240629   gcc-13.2.0
arm64                 randconfig-004-20240629   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240629   gcc-13.2.0
csky                  randconfig-002-20240629   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240629   gcc-13.2.0
loongarch             randconfig-002-20240629   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240629   gcc-13.2.0
nios2                 randconfig-002-20240629   gcc-13.2.0
parisc                randconfig-001-20240629   gcc-13.2.0
parisc                randconfig-002-20240629   gcc-13.2.0
powerpc               randconfig-001-20240629   gcc-13.2.0
powerpc               randconfig-002-20240629   gcc-13.2.0
powerpc               randconfig-003-20240629   gcc-13.2.0
powerpc64             randconfig-001-20240629   gcc-13.2.0
powerpc64             randconfig-002-20240629   gcc-13.2.0
powerpc64             randconfig-003-20240629   gcc-13.2.0
riscv                 randconfig-001-20240629   gcc-13.2.0
riscv                 randconfig-002-20240629   gcc-13.2.0
s390                  randconfig-001-20240629   gcc-13.2.0
s390                  randconfig-002-20240629   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                    randconfig-001-20240629   gcc-13.2.0
sh                    randconfig-002-20240629   gcc-13.2.0
sparc64               randconfig-001-20240629   gcc-13.2.0
sparc64               randconfig-002-20240629   gcc-13.2.0
um                    randconfig-001-20240629   gcc-13.2.0
um                    randconfig-002-20240629   gcc-13.2.0
x86_64       buildonly-randconfig-001-20240629   clang-18
x86_64       buildonly-randconfig-002-20240629   clang-18
x86_64       buildonly-randconfig-003-20240629   clang-18
x86_64       buildonly-randconfig-004-20240629   clang-18
x86_64       buildonly-randconfig-005-20240629   clang-18
x86_64       buildonly-randconfig-006-20240629   clang-18
x86_64                randconfig-001-20240629   clang-18
x86_64                randconfig-002-20240629   clang-18
x86_64                randconfig-003-20240629   clang-18
x86_64                randconfig-004-20240629   clang-18
x86_64                randconfig-005-20240629   clang-18
x86_64                randconfig-006-20240629   clang-18
x86_64                randconfig-011-20240629   clang-18
x86_64                randconfig-012-20240629   clang-18
x86_64                randconfig-013-20240629   clang-18
x86_64                randconfig-014-20240629   clang-18
x86_64                randconfig-015-20240629   clang-18
x86_64                randconfig-016-20240629   clang-18
x86_64                randconfig-071-20240629   clang-18
x86_64                randconfig-072-20240629   clang-18
x86_64                randconfig-073-20240629   clang-18
x86_64                randconfig-074-20240629   clang-18
x86_64                randconfig-075-20240629   clang-18
x86_64                randconfig-076-20240629   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240629   gcc-13.2.0
xtensa                randconfig-002-20240629   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-14490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB3591E93D
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 22:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83EB91F228B8
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 20:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED5C17164C;
	Mon,  1 Jul 2024 20:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qrli+LvJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B2416FF48
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 20:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719864520; cv=none; b=FmlPBj1EQ7A/JfpUQYyIlYNGjVLWsG4taAphCiYEWTJyIG7dgFkwBwV2ZrFGM72oSgtBhK2/PlP7tl6xi/Xnhizo4Ar0bufmDabNd+tC3z8NXHevbKPQaEeRLltruyFF/24SzhCARQIsoZmfD2z4okxjQRk8f0Mh2BeXVe8LBGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719864520; c=relaxed/simple;
	bh=0xdJNMs9vnglFzCAwcj/yuvCZm1yP4NgFLxs1FYc36s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O305MAOaCMQOLZa7PrsX8UAmjk1FeCL43oX1mvzV2kIm9KOdN8C4wtxAPSaL3gUaqQ70Y82jYKxg99M75EHqJjyamYavM75pzjkfzN7bNgP7vXwhLb+scu0YVCA4J7NUPEVi1d3pw7h9/9z7t4ZT0Dul/vtI2+94ootMIIuX9iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qrli+LvJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719864518; x=1751400518;
  h=date:from:to:cc:subject:message-id;
  bh=0xdJNMs9vnglFzCAwcj/yuvCZm1yP4NgFLxs1FYc36s=;
  b=Qrli+LvJGilhIGmLg/RSLSWQifcPatBt0/Ly92two7mqukV4u4NNe4/L
   EawPgfg6UmJmK5Swajr7HYLwnYAmR5Ba9cPu3dEBSdU78thMs9MpCGZEj
   +Qdf5orYxJCfbh9Y2FcQebDA6wikIY3WZSJYlfKyP0SXw018339RuhkD3
   Hyw5IsmxHr9ggws0O8nd4DvbHbk77wqsY0bqZd2jHGQ3gi/7bWA/mzVuH
   GfIRpjkLabS8UIHk3MZck/nX/St3MK7CWTcBGJYQGexyJnEHkud5bwA69
   ToxyegJT5q8TAM/nDUVhbp3amOc8D/azkAIqstZc1ST/GB+4jMcGpIERI
   Q==;
X-CSE-ConnectionGUID: h1ujS8ELR/2wT0Rk+n3ZBQ==
X-CSE-MsgGUID: LexFMLwHSJCzATJ73E/PuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17146841"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; 
   d="scan'208";a="17146841"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 13:08:37 -0700
X-CSE-ConnectionGUID: SLdqtukqR0q18OuSG42kaw==
X-CSE-MsgGUID: 75EQiGdqT0STeTph0Brvmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; 
   d="scan'208";a="45768525"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Jul 2024 13:08:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sONKE-000NJz-0j;
	Mon, 01 Jul 2024 20:08:34 +0000
Date: Tue, 02 Jul 2024 04:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:test] BUILD SUCCESS
 63fda4b94eccdf9b3056b35020b753eb26d411d8
Message-ID: <202407020427.f3dijyKJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git test
branch HEAD: 63fda4b94eccdf9b3056b35020b753eb26d411d8  media: dt-bindings: i2c: add GalaxyCore GC05A2 image sensor

elapsed time: 14492m

configs tested: 44
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240622   gcc-13
i386         buildonly-randconfig-004-20240622   gcc-13
i386         buildonly-randconfig-005-20240622   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240622   gcc-10
i386                  randconfig-003-20240622   gcc-13
i386                  randconfig-004-20240622   gcc-13
i386                  randconfig-006-20240622   gcc-13
i386                  randconfig-011-20240622   gcc-9
i386                  randconfig-012-20240622   gcc-7
loongarch                        allmodconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
riscv                            allmodconfig   clang-19
riscv                            allyesconfig   clang-19
s390                             allmodconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allyesconfig   gcc-13
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


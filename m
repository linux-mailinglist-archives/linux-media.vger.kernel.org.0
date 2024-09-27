Return-Path: <linux-media+bounces-18708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45185988AC5
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 21:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40A201C216F3
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 19:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987E7184532;
	Fri, 27 Sep 2024 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlXh2CxH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B337136E37
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 19:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727465626; cv=none; b=Xsn4BMmX38vLzsXehCGo1fJyQCYjgram01Zv7jwFcHQgjXiweSVaFAVBQQ+YxG8/1JL5v0ItEUikffsjup0r6OIe3L4lzbdNH5MvKXxY5buc6qvZm4rYEMWZ2P8/TccaRkycwjnKpiCOOyB8s5L3n9id021f6lnPzoHQvCXpNYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727465626; c=relaxed/simple;
	bh=VtKm1D+eTjKspe+wU9fgbczjqWgBvlPCo8eDaNVkYSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fv5xqogW7dRq0nD8rWii/uDPT41eSxVw9zgqVTweJNcy3ZNp50kwry/r1eAcVjqdDblpB5cxx6Ntx5vwJSyJQCUxMAqDiSXYrH3cLpiL3De9V0nimtwBPSBvltcnQjQM1dN7WKljJSHGnIq7aw7Yac2CwCHmDMrcAN4tIpnwF+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlXh2CxH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727465623; x=1759001623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VtKm1D+eTjKspe+wU9fgbczjqWgBvlPCo8eDaNVkYSc=;
  b=dlXh2CxHC4tGd0pg5xUu7Iwjreyox0pQWAXddvIc03eNIG1/Fxz6HT45
   8jKx45p/iEBGJo/hn7s/CuhK8B41m4cIln/G22SCXzdUyMCZEtZrMV526
   xnvD/o5MF0CfLR/cMKj8vmyvfN3EFhYoVxsV1/1yMBKI264x1QelcwOmQ
   Rmil23XeFWvFX5qixTPgWR/R7v2JLPSrxnVMl6VWBkRDWGE7GWqkiwRCr
   J87KAIw8RFK4jhN1MgRCVtSUXqg7Et7QtdYhGhTXCsnSLs8s77usKavKd
   79RXiuqWZz3ksR+2CPOHH32GGx/AQhZhq2JjJBkHJybjLFHFbawfE5r/a
   Q==;
X-CSE-ConnectionGUID: wB+qVVW9SjKTe1xVsCU/JQ==
X-CSE-MsgGUID: 5MDUP5GXSLe7myM8FpajAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26425592"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="26425592"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 12:33:43 -0700
X-CSE-ConnectionGUID: FDip5hJ2QfSLFX9zTUax1Q==
X-CSE-MsgGUID: BCg7wusuS8GC0QT3qfHXsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72931493"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Sep 2024 12:33:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suGif-000MXl-24;
	Fri, 27 Sep 2024 19:33:37 +0000
Date: Sat, 28 Sep 2024 03:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	andriy.shevchenko@intel.com, sakari.ailus@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: Re: [PATCH] media: ipu6: remove redundant dependency in Kconfig
Message-ID: <202409280345.yuxEscvz-lkp@intel.com>
References: <20240927021613.2158020-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927021613.2158020-1-bingbu.cao@intel.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11 next-20240927]
[cannot apply to media-tree/master linuxtv-media-stage/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/bingbu-cao-intel-com/media-ipu6-remove-redundant-dependency-in-Kconfig/20240927-103017
base:   linus/master
patch link:    https://lore.kernel.org/r/20240927021613.2158020-1-bingbu.cao%40intel.com
patch subject: [PATCH] media: ipu6: remove redundant dependency in Kconfig
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409280345.yuxEscvz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280345.yuxEscvz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280345.yuxEscvz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/ipu6.c: In function 'ipu6_pkg_dir_configure_spc':
>> drivers/media/pci/intel/ipu6/ipu6.c:250:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     250 |         prog = (struct ipu6_cell_program *)((u64)isp->cpd_fw->data + pg_offset);
         |                                             ^
>> drivers/media/pci/intel/ipu6/ipu6.c:250:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     250 |         prog = (struct ipu6_cell_program *)((u64)isp->cpd_fw->data + pg_offset);
         |                ^
--
   In file included from <command-line>:
   drivers/media/pci/intel/ipu6/ipu6-cpd.c: In function 'ipu6_cpd_parse_module_data':
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:47: note: in expansion of macro '__bf_shf'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) &        \
         |                                               ^~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:47: note: in expansion of macro '__bf_shf'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) &        \
         |                                               ^~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:34: note: in expansion of macro '__bf_cast_unsigned'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:34: note: in expansion of macro '__bf_cast_unsigned'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
   In file included from drivers/media/pci/intel/ipu6/ipu6-cpd.c:6:
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:25: note: in expansion of macro 'FIELD_PREP'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/bitfield.h:116:63: note: in definition of macro 'FIELD_PREP'
     116 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                                               ^~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bitfield.h:116:63: note: in definition of macro 'FIELD_PREP'
     116 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                                               ^~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
      48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:154:36: note: in expansion of macro 'PKG_DIR_TYPE_MASK'
     154 |                         FIELD_PREP(PKG_DIR_TYPE_MASK, id) |
         |                                    ^~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:155:25: note: in expansion of macro 'FIELD_PREP'
     155 |                         FIELD_PREP(PKG_DIR_VERSION_MASK, ver);
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:47:33: note: in expansion of macro 'GENMASK'
      47 | #define PKG_DIR_VERSION_MASK    GENMASK(47, 32)
         |                                 ^~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:155:36: note: in expansion of macro 'PKG_DIR_VERSION_MASK'
     155 |                         FIELD_PREP(PKG_DIR_VERSION_MASK, ver);
         |                                    ^~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-cpd.c:155:25: note: in expansion of macro 'FIELD_PREP'
     155 |                         FIELD_PREP(PKG_DIR_VERSION_MASK, ver);
         |                         ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/__compiletime_assert_475 +517 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  503  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  504  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  505  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  506  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  507  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  508   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  509   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  510   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  511   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  512   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  513   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  514   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  515   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  516  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @517  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  518  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


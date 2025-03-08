Return-Path: <linux-media+bounces-27858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F97A57951
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 09:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C987189553B
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 08:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A801A9B5B;
	Sat,  8 Mar 2025 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hmqtb5QK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC0E1A3A8A;
	Sat,  8 Mar 2025 08:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741422848; cv=none; b=kWUIGMRWZopGq+XA7DSSglw6i1xZTqMU9uJDIw/KPD/8kZR3g4LCm75DJoa42fhSWO4vVvkBgXOBKWM6c/8BQhXV66Px7tTSz4xYmZzVuIybIs+ggsg6dRSkH6SXMYkIdhRJrmeCAo3WntJXQySjGVRsme9m3+SoTlVJeEuveJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741422848; c=relaxed/simple;
	bh=LH2+T0QAD0UxbiKqy/L79i19LDeAFIIo7Md0GnOb1VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0iAvHfimviymfKEqTh9V0tE/zplbbMv/6QKP6V0ZjfvurFBhyAMExSE4j2RVuA95Cd679/tl6QhE0lyHfk/xt4XNtxmjYX2IghaY69d+zBLQeN+l0zLulmOWRxDFGdgTnaukwcTjn/ANK2Lzm6refTewUphtyXER/Zj4CvzOmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hmqtb5QK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741422847; x=1772958847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LH2+T0QAD0UxbiKqy/L79i19LDeAFIIo7Md0GnOb1VQ=;
  b=Hmqtb5QKecexhNi1RHkLMPScm+Gol+KVVQW0+AcaR/Zd5oY9oB8vcsQF
   D8ja/p0pcXQH6PWCDSoZFRw/wY4ZFw7NDpC6mzfvs+Ak1eUHaPmOEeLHo
   29XKKSK0XyiNgEmoUvSRpqCrTIJZeEAyFZOFKb1k+kJm+P39CiM1vH563
   Lz+Ud/ser8DU6EZOcsb+9gq/1csyjD90P4XY5yLNAPgG32y6lwkwk4czp
   z50tRhj+BB1h+8MyFjrVFXzsdPNmmehxgfrsNrXrcPsUWz7/lPyy+D1Hz
   iLlm4AoYvLgRkUNSNibTxnWJOOxh5Ny/uY3xjN5Vy/iA43vMXx7QjrWrU
   w==;
X-CSE-ConnectionGUID: Gi2IEbM5SIOFmjwQoTzUUA==
X-CSE-MsgGUID: ugk1ClSwQ0ufvCW8vY+fLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="41635319"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="41635319"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 00:34:06 -0800
X-CSE-ConnectionGUID: SH3bswzARZGNPjjgn111MA==
X-CSE-MsgGUID: jQ/CXBJlSbOks17MVn0W5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150479269"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 Mar 2025 00:34:02 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqpd9-0001iC-1V;
	Sat, 08 Mar 2025 08:33:59 +0000
Date: Sat, 8 Mar 2025 16:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	tomm.merciai@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/17] media: rzg2l-cru: Add register mapping support
Message-ID: <202503081652.V24IMXGL-lkp@intel.com>
References: <20250303160834.3493507-12-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303160834.3493507-12-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tommaso-Merciai/media-dt-bindings-renesas-rzg2l-csi2-Document-Renesas-RZ-V2H-P-SoC/20250304-002513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250303160834.3493507-12-tommaso.merciai.xr%40bp.renesas.com
patch subject: [PATCH v4 11/17] media: rzg2l-cru: Add register mapping support
config: sh-randconfig-r112-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081652.V24IMXGL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250308/202503081652.V24IMXGL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081652.V24IMXGL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c: In function '__rzg2l_cru_write_constant':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON failed: offset >= RZG2L_CRU_MAX_REG
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:80:9: note: in expansion of macro 'BUILD_BUG_ON'
      80 |         BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
         |         ^~~~~~~~~~~~
--
   In file included from <command-line>:
   rzg2l-video.c: In function '__rzg2l_cru_write_constant':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON failed: offset >= RZG2L_CRU_MAX_REG
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   rzg2l-video.c:80:9: note: in expansion of macro 'BUILD_BUG_ON'
      80 |         BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_304 +542 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  528  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  529  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  530  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  531  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  532  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  533   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  534   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  535   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  536   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  537   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  538   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  539   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  540   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  541  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @542  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  543  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


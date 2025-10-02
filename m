Return-Path: <linux-media+bounces-43592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2B6BB35E7
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 10:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F13673B9E11
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 08:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0052FD7B3;
	Thu,  2 Oct 2025 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4PZyLJP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388F92DC339;
	Thu,  2 Oct 2025 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759395470; cv=none; b=eMXebll6BbZ70Shjk/H/QKpKiv9RXKzwc0YFvjUovCyo/JUiwIDpEWnt8BL1jzvTI1aoQGxiZMM3EUZmu8FstoA7FyMkOM0d4SI0w6eCOJabkmyyZ1Ja/XDfF3dUYnPPRehslS+kYXaREAHu4GJM1J2GuhztiLPtzT5YwMoKmJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759395470; c=relaxed/simple;
	bh=LegO47tSfad1vBLbX6WbNYDpIZl2X+4QkLFnoPuYMl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtcmn8rv79tUlXeK6aH42agsdibIpgXSy9CkSWGuYGo8X7Vpr3mwOzGzjAIx3DBP1nlQAi8O0/tS3hjJRsXeKirfqpeXTvakLZNG82bOFgtom+WEOYZQm9yA1Gd/CKSP4dilwWsEihi0auYxaO3ivNE99nzhkvu+ZRLrR+uvEu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4PZyLJP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759395468; x=1790931468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LegO47tSfad1vBLbX6WbNYDpIZl2X+4QkLFnoPuYMl8=;
  b=g4PZyLJPHYqxFoaMVZG905VY1qhg+APhzNPriWQI4CSY653LVH9CB4Pu
   Q3rinF0uIQ48HDB1e7bKuZbsuj8j1ZeaAibV7twBaNvKrqmMDH4yJazZb
   NOERv6jcoj7lnSUC25DoMIX3bbT6Pk99MllRn8M6nbXEre23SNFnujxYd
   E+0wNF2YvpK1pvbkxBuPsvLlShEhnbL+tFxRUnP80VVofpdCh8n/mPXo9
   qh+5gdM4LpQLJcza767wT638wltK4mkXHjuOkKCYStZYgJ9yuz4u4bToj
   SXVQgkjJ7z5/VCHweJBNZYnOWZiI9QRaJW8zEj9+6DoTRVJoSC0urUpNw
   A==;
X-CSE-ConnectionGUID: NubWKHxATU+AU6pheklKBQ==
X-CSE-MsgGUID: R5SA43MERv6FmAsKE4K3ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="84294939"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="84294939"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 01:57:47 -0700
X-CSE-ConnectionGUID: Nzz4uHEQQHqZmeXuClZ4uA==
X-CSE-MsgGUID: M9+AZGiDSHyaawOzQefN3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="183024479"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Oct 2025 01:57:46 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4F89-0003gF-2g;
	Thu, 02 Oct 2025 08:57:41 +0000
Date: Thu, 2 Oct 2025 16:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] media: iris: Add support for AV1 format in iris
 decoder
Message-ID: <202510021620.4BVCZwgf-lkp@intel.com>
References: <20251001-av1_irisdecoder-v1-3-9fb08f3b96a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-av1_irisdecoder-v1-3-9fb08f3b96a0@oss.qualcomm.com>

Hi Deepa,

kernel test robot noticed the following build errors:

[auto build test ERROR on afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepa-Guthyappa-Madivalara/media-uapi-videodev2-Add-support-for-AV1-stateful-decoder/20251002-030314
base:   afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
patch link:    https://lore.kernel.org/r/20251001-av1_irisdecoder-v1-3-9fb08f3b96a0%40oss.qualcomm.com
patch subject: [PATCH 3/5] media: iris: Add support for AV1 format in iris decoder
config: s390-randconfig-001-20251002 (https://download.01.org/0day-ci/archive/20251002/202510021620.4BVCZwgf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510021620.4BVCZwgf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510021620.4BVCZwgf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/iris/iris_platform_sm8250.c:20:24: error: array type has incomplete element type 'struct iris_fmt'
      20 | static struct iris_fmt platform_fmts_sm8250_dec[] = {
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/iris/iris_platform_sm8250.c:21:10: error: 'IRIS_FMT_H264' undeclared here (not in a function)
      21 |         [IRIS_FMT_H264] = {
         |          ^~~~~~~~~~~~~
>> drivers/media/platform/qcom/iris/iris_platform_sm8250.c:25:10: error: 'IRIS_FMT_HEVC' undeclared here (not in a function)
      25 |         [IRIS_FMT_HEVC] = {
         |          ^~~~~~~~~~~~~
>> drivers/media/platform/qcom/iris/iris_platform_sm8250.c:29:10: error: 'IRIS_FMT_VP9' undeclared here (not in a function)
      29 |         [IRIS_FMT_VP9] = {
         |          ^~~~~~~~~~~~
   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/pm_domain.h:11,
                    from drivers/media/platform/qcom/iris/iris_core.h:10,
                    from drivers/media/platform/qcom/iris/iris_platform_sm8250.c:6:
   include/linux/compiler.h:197:82: error: expression in static assertion is not an integer
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:202:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/media/platform/qcom/iris/iris_platform_sm8250.c:356:32: note: in expansion of macro 'ARRAY_SIZE'
     356 |         .inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
         |                                ^~~~~~~~~~
>> drivers/media/platform/qcom/iris/iris_platform_sm8250.c:20:24: warning: 'platform_fmts_sm8250_dec' defined but not used [-Wunused-variable]
      20 | static struct iris_fmt platform_fmts_sm8250_dec[] = {
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~


vim +20 drivers/media/platform/qcom/iris/iris_platform_sm8250.c

    19	
  > 20	static struct iris_fmt platform_fmts_sm8250_dec[] = {
  > 21		[IRIS_FMT_H264] = {
    22			.pixfmt = V4L2_PIX_FMT_H264,
    23			.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
    24		},
  > 25		[IRIS_FMT_HEVC] = {
    26			.pixfmt = V4L2_PIX_FMT_HEVC,
    27			.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
    28		},
  > 29		[IRIS_FMT_VP9] = {
    30			.pixfmt = V4L2_PIX_FMT_VP9,
    31			.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
    32		}
    33	};
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


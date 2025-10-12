Return-Path: <linux-media+bounces-44214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E83FBD0BAB
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 21:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 779994ED5CE
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 19:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CB62F3C0C;
	Sun, 12 Oct 2025 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ir/i7x9S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112E52EDD78;
	Sun, 12 Oct 2025 19:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297104; cv=none; b=PqWis5jPLOYGuTMCoMw/dh26PmYkNoypKjUU1aWuwGqPdoFm7SRHSOmvAf9QqIBXR4uj+WdEB2h00ylj55XQP+BKiku8J+m9pP7OhbjuVpQER0+7iHGTjkvxYbmSZsWJBfqnrjXiSGD4snVXy4WZ28RtvVYddoncAc6Vp4i6RvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297104; c=relaxed/simple;
	bh=bUeIQzQMvtVSx2wlqAfCOMciN9kUQ2iGtUINKzACuuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPfTh8BWgbmNWZX/lSlxZbSLx/0Oi3tDat6kbb2Kx3jkHtIloMIiemYyC4MaMQGhxgjCOSFD2J8oSlJjQhL0vsQ6wNXKa/My79IWDS5GterSqsmMXPVJ9CtxfKSNF9AAGXXwmvK2q0dvXS5EAyxG/e6TW+2lZQpLVhdfsy1SaOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ir/i7x9S; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760297102; x=1791833102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bUeIQzQMvtVSx2wlqAfCOMciN9kUQ2iGtUINKzACuuM=;
  b=Ir/i7x9S6C4xO2PgOAQDbIL6u2t7uzwK5+OZZozWnJXm5/OgE4uA9/TE
   fxZDdnCUTK0XfH2zqvt8aZRJM2vIsMjOVReh+WdANfRGa3TsEEfFsId06
   Az4AZtkcN1G9JNyNE6r0Dtw03wD3tC+1DMq36pi0iIFxfyL68C4FH0LjW
   bEG0+sgtGreHs+SP2NCgrV2zqM6I4oR7M9app/iOk2AAnsSBTtZHT1D/m
   mZpRgeM2Jor6OHHNWCe0FvokUYXe9nCYjiX0BoeXMpVMu+6kVn6kPfrBg
   lmNHq2X6EouZ+pY7RDw2c0BmWZjjXBFc5v0eNdvbO1Nl9eOjk0c7JhRvJ
   g==;
X-CSE-ConnectionGUID: cu9JRMdyRJO30E9l/RuyDA==
X-CSE-MsgGUID: 9G/f9YBIRV6JmraURsgcAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="73128673"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="73128673"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 12:25:01 -0700
X-CSE-ConnectionGUID: uXC0FsY1Q4mxJbSbMfk11A==
X-CSE-MsgGUID: uFBe9pJFSSCDRWNUq8rVtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="185831798"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Oct 2025 12:24:59 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v81ge-0004Yd-1o;
	Sun, 12 Oct 2025 19:24:56 +0000
Date: Mon, 13 Oct 2025 03:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] media: iris: enable support for SC7280 platform
Message-ID: <202510130211.Ujh708qh-lkp@intel.com>
References: <20251012-iris-sc7280-v2-8-d53a1a4056c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251012-iris-sc7280-v2-8-d53a1a4056c3@oss.qualcomm.com>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0b2f041c47acb45db82b4e847af6e17eb66cd32d]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/media-iris-turn-platform-caps-into-constants/20251013-002837
base:   0b2f041c47acb45db82b4e847af6e17eb66cd32d
patch link:    https://lore.kernel.org/r/20251012-iris-sc7280-v2-8-d53a1a4056c3%40oss.qualcomm.com
patch subject: [PATCH v2 8/8] media: iris: enable support for SC7280 platform
config: arm64-randconfig-002-20251013 (https://download.01.org/0day-ci/archive/20251013/202510130211.Ujh708qh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510130211.Ujh708qh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510130211.Ujh708qh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/qcom/iris/iris_platform_gen1.c:15:10: fatal error: iris_platform_sc7280.h: No such file or directory
    #include "iris_platform_sc7280.h"
             ^~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +15 drivers/media/platform/qcom/iris/iris_platform_gen1.c

    14	
  > 15	#include "iris_platform_sc7280.h"
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


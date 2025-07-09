Return-Path: <linux-media+bounces-37173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E738AFDFDD
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 08:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58BE1583342
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 06:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B3126B75C;
	Wed,  9 Jul 2025 06:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B98YZ77j"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E4878C91;
	Wed,  9 Jul 2025 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752042056; cv=none; b=n//L8qPwG4xbI4Uc2gNtqyTZoK/PoMGRY1mlyDTbHC+qg4ofhyUbcp00+FydU2xvLpQcnGtyRwXxa/rFbaBmokRq7TLhYG2YnLEk5lJI6cU6oIxDSACbYeY0mK51+f9mGiRSCkqdDa1j0HA7t66WRWSNI4773faMJoreQDFO5dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752042056; c=relaxed/simple;
	bh=jpf7GN1ILP/Fhm7204GJfAH89v4Oue2jmt399gQml9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5H/hEjmveJeMrvMca221uQlSWj8VWJgKgReP1I3+J3iyzdC+iulAXXOcycwO3xGe74scHicHFBVJ+GotRaVQNmIU1B6I0cS8/ZiyQvC1PWL+lAG/TiFSema/9c/AwFFStekzf9tioIjaaDwHvETl4TyZreUN2Ex6DoR43VHsOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B98YZ77j; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752042054; x=1783578054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jpf7GN1ILP/Fhm7204GJfAH89v4Oue2jmt399gQml9w=;
  b=B98YZ77jE0v8jXhF2YMd7WGI36+kE8REeiWollu17pGbAbpGFHg2iy7v
   dLhvagz2OFMUWPHERUfcUQu37yIiTHHbOfRbYTs6d4skVsqBg7SvLnZ8W
   2LR5C/ISocjMiPOQQVtiW5O493DJUv6KA8iddoYnm5Eb3xSEYWF5PG06w
   8Rhjg2IJZrjKHKh58HXniU1BDUgtdPRoi6ULhXdOAVo/2AMl+fPj4HfQn
   sSJi+qrFMnkF+5Whg3nWB6iyznT+PSnR1jBgkmI16jVASBzPWpdZ6hNjK
   kDeEI2z/UICHHcp/7NMRXsfS+ke085e1+S4v71/Dw0NCbLyayFaIKJHsF
   Q==;
X-CSE-ConnectionGUID: PsMzEh+ASsOr3fdoa7auCQ==
X-CSE-MsgGUID: P95tzP4HSF+qQ/qQwCwqfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65744598"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="65744598"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 23:20:53 -0700
X-CSE-ConnectionGUID: r0xqCEgwRhurC5eP5ba1jQ==
X-CSE-MsgGUID: AXwoEScWRV6uHZc8eOhWXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="179366208"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jul 2025 23:20:50 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZOAh-0003BD-25;
	Wed, 09 Jul 2025 06:20:47 +0000
Date: Wed, 9 Jul 2025 14:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 5/8] media: v4l2-common: Introduce v4l2-params.c
Message-ID: <202507091324.p3wVWAxc-lkp@intel.com>
References: <20250708-extensible-parameters-validation-v1-5-9fc27c9c728c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-extensible-parameters-validation-v1-5-9fc27c9c728c@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build errors:

[auto build test ERROR on a8598c7de1bcd94461ca54c972efa9b4ea501fb9]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-uapi-Introduce-V4L2-extensible-params/20250708-184651
base:   a8598c7de1bcd94461ca54c972efa9b4ea501fb9
patch link:    https://lore.kernel.org/r/20250708-extensible-parameters-validation-v1-5-9fc27c9c728c%40ideasonboard.com
patch subject: [PATCH 5/8] media: v4l2-common: Introduce v4l2-params.c
config: i386-buildonly-randconfig-002-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091324.p3wVWAxc-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091324.p3wVWAxc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091324.p3wVWAxc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: vb2_plane_vaddr
   >>> referenced by v4l2-params.c
   >>>               drivers/media/v4l2-core/v4l2-params.o:(v4l2_params_buffer_validate) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


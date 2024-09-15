Return-Path: <linux-media+bounces-18299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A893E9797DC
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 18:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1D6AB218E3
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 16:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B271C9EAE;
	Sun, 15 Sep 2024 16:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="do3LLPZ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B91522F19;
	Sun, 15 Sep 2024 16:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726418637; cv=none; b=K4AiyXZpReu07IYQWde1dvpUA6HMGj6uBKk7v8GT154enagJAdv+5/c9L7IjQ01jdgzb3V9R/0CvWcHM9VJbdipV/OWgPcSUq+UFsp4CkAfD5Wxzb+PLLMjvZWipf09B1vGNJ0SlcufLVyv05TcICpOUt541msn1GYd7QWrNMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726418637; c=relaxed/simple;
	bh=jtr1z9sq//ff08X+wS3ZIAFe7Sp8ILl0NmP39G+1LZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0hMlcGMNarScDlemDCwJSwpBtdVuIeOu9luR+cGGMg3vcEDrx1NiroEO5YAhAtoFQ717cUcoxlOESnyNsqPs0CauTe14pN4cnxIxQEXlk1MR2uuJ+1/uh1O5h+ezGLQ5HWBT7pLoc44qRsGrSX6oSmr8NRb7GMqCzJhoh2dIdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=do3LLPZ6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726418636; x=1757954636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jtr1z9sq//ff08X+wS3ZIAFe7Sp8ILl0NmP39G+1LZo=;
  b=do3LLPZ6JwDrhavvcGLroxbCAdmRZRcH1beKl7tFCDTvsEeTRuZdqxan
   NX1G/C227HGYp41TWYXo/Axm5dHXT38ZLMejE0MOhuYrAd4BDISoDK2Yn
   VNNMsx36ThTZawRpaOi3gxwn/9Nm+y0ZpMSH0MhcjQ32CnjnW0SxcByYN
   dMXcpUZb7FH+PcHWfe5VZ3M+GA3JAAo2Phm4KpCJj+8at4RlS+V8iVtQ4
   SF6aG+3szPq251VbwMZjanCnjxzWNM+gnenHNfARh3XndWXUlmNX2Uqkt
   hdQm3DKcNWIe8dCgvOknPW34TSsJDEUxramoOgX8FbXX+Y9pN+S+CUAmG
   g==;
X-CSE-ConnectionGUID: LZYDj255Sy+kIQ/SmqTYMA==
X-CSE-MsgGUID: oYJXL8k3QoGjFW+2y5tmwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="35938936"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="35938936"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 09:43:55 -0700
X-CSE-ConnectionGUID: Ac/7OfB2S9Kj8B5ZUPZ0VQ==
X-CSE-MsgGUID: lf7J0Mv/TKS5oTaaBKo4uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="73255176"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Sep 2024 09:43:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spsLl-0008qk-23;
	Sun, 15 Sep 2024 16:43:49 +0000
Date: Mon, 16 Sep 2024 00:43:18 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel@collabora.com,
	=?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <202409160050.m7VEd3pY-lkp@intel.com>
References: <20240913124857.389630-2-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240913124857.389630-2-adrian.larumbe@collabora.com>

Hi Adrián,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11 next-20240913]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panthor-introduce-job-cycle-and-timestamp-accounting/20240913-205038
base:   linus/master
patch link:    https://lore.kernel.org/r/20240913124857.389630-2-adrian.larumbe%40collabora.com
patch subject: [PATCH v6 1/5] drm/panthor: introduce job cycle and timestamp accounting
config: i386-buildonly-randconfig-002-20240915 (https://download.01.org/0day-ci/archive/20240916/202409160050.m7VEd3pY-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160050.m7VEd3pY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160050.m7VEd3pY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_341 marked "dontcall-error": min(ringbuf_size - start, size) signedness error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


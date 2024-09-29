Return-Path: <linux-media+bounces-18737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 087DF98921E
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 02:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEADA284020
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 00:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEC15CB8;
	Sun, 29 Sep 2024 00:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgGtaTUn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B7E382;
	Sun, 29 Sep 2024 00:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727569571; cv=none; b=MOGzCH7MG5N34XOTFJCh/vds3u1FMa7CZVdH5jMjeN66W0dWuHL7Uim0htI1cNGbq0haERv9r6eryXThGnDnRpb8IfTwREmhCV1bEUH2OY9EwMwrlGAA7tBy5rsIm/bD0iy/UPkPNXWdrUWO8BehMHF4S8u0MNdbxIHgORk+pco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727569571; c=relaxed/simple;
	bh=EwYvhotwgMeB4AfN253GUIcoDG6KLpKAA6s5FiZ2mT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2JM/fuzQdpbIH0jw4U52Zxot9v9XJc691cTySJuLKHLVbZM0fWGDz+Gq3z1d0ivhufOSkkTArHS25X1BKqFlp2UIMBbwQqG9d3j0I7D+DZYhwBxc9OfFobhHpam26r0ytfsm5g4cA1jPj1yA9OV94lz1rf5SV1vBuyAQ4mH3mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgGtaTUn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727569568; x=1759105568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EwYvhotwgMeB4AfN253GUIcoDG6KLpKAA6s5FiZ2mT4=;
  b=BgGtaTUnaLDELYVrjZHozl35WG3eZTiUr+Kko8bIIck/1WpCMS9MtfOE
   810MOM8+yzu/RqYRUDhMy419p0r+ZR/x0T+VCqsEozXD93nxX6pcdk6uE
   e4CtrxG/d2I4WRPoR3T14SEgItxf+mXq3dma8oe6+FJpTIIWrImsGDMV2
   LVJvdTggSUNJHaSA4Ra0wX6YUgzwJLV/+BqQFPYKrrv+hhQHVTA9zsalt
   8wU4L9N52ncF0QfraXfx3u4GzRScjoTZB6QUo7Ek56JtnlLNWnYQya/lh
   NkE59KXgAk6x/kzyQuTKOgLjBJ5u0K7P/KQZaKRxAml71OFVca5IfBUKw
   w==;
X-CSE-ConnectionGUID: fv9GcW+xRMOGIitKySQgjg==
X-CSE-MsgGUID: yHP6FbZTSo2pFHm5pvGRAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26489601"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26489601"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 17:26:07 -0700
X-CSE-ConnectionGUID: IJEpIeM8S9G5HFY76Z8rCQ==
X-CSE-MsgGUID: w7lS5/EoSa6dINB4l2OmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="77427612"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2024 17:26:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suhlB-000NmF-1f;
	Sun, 29 Sep 2024 00:26:01 +0000
Date: Sun, 29 Sep 2024 08:25:38 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	=?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v8 3/5] drm/panthor: add DRM fdinfo support
Message-ID: <202409291048.zLqDeqpO-lkp@intel.com>
References: <20240923230912.2207320-4-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923230912.2207320-4-adrian.larumbe@collabora.com>

Hi Adrián,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11 next-20240927]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panthor-introduce-job-cycle-and-timestamp-accounting/20240924-071018
base:   linus/master
patch link:    https://lore.kernel.org/r/20240923230912.2207320-4-adrian.larumbe%40collabora.com
patch subject: [PATCH v8 3/5] drm/panthor: add DRM fdinfo support
config: arm-randconfig-002-20240929 (https://download.01.org/0day-ci/archive/20240929/202409291048.zLqDeqpO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291048.zLqDeqpO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291048.zLqDeqpO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/gpu/drm/panthor/panthor_drv.c:7:
   drivers/gpu/drm/panthor/panthor_drv.c: In function 'panthor_gpu_show_fdinfo':
>> drivers/gpu/drm/panthor/panthor_drv.c:1389:45: error: implicit declaration of function 'arch_timer_get_cntfrq' [-Wimplicit-function-declaration]
    1389 |                                             arch_timer_get_cntfrq()));
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:40:39: note: in definition of macro 'DIV_ROUND_DOWN_ULL'
      40 |         ({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })
         |                                       ^~
   drivers/gpu/drm/panthor/panthor_drv.c:1388:28: note: in expansion of macro 'DIV_ROUND_UP_ULL'
    1388 |                            DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
         |                            ^~~~~~~~~~~~~~~~


vim +/arch_timer_get_cntfrq +1389 drivers/gpu/drm/panthor/panthor_drv.c

  1377	
  1378	static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
  1379					    struct panthor_file *pfile,
  1380					    struct drm_printer *p)
  1381	{
  1382		if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_ALL)
  1383			panthor_fdinfo_gather_group_samples(pfile);
  1384	
  1385		if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP) {
  1386	#ifdef CONFIG_ARM_ARCH_TIMER
  1387			drm_printf(p, "drm-engine-panthor:\t%llu ns\n",
  1388				   DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
> 1389						    arch_timer_get_cntfrq()));
  1390	#endif
  1391		}
  1392		if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_CYCLES)
  1393			drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);
  1394	
  1395		drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate);
  1396		drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
  1397	}
  1398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


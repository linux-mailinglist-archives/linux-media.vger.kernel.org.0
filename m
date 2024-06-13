Return-Path: <linux-media+bounces-13145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFB79061C0
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 04:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10E271F223D8
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 02:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E434978283;
	Thu, 13 Jun 2024 02:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqVMf8tG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11DA17C69;
	Thu, 13 Jun 2024 02:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718245655; cv=none; b=pmQS7pY7s13Qywp0aww4gSl2WwpUDELIuaEO32+nGMUyCfsKmZxuhsyBrUOaN7nm5qt8IQIY5gCb7MWykjKub9eo/9hvAU/dGaBQmbOBnQGGUJvigHsN16cACH98Z6x3/zSj4geXrdYvouF3uGpybcqnbZWXUFU2aJwV+ZM1/l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718245655; c=relaxed/simple;
	bh=Nh2RzwaSTxJgbNfHmt3JRc0uEjv3nRlrnUDcdTPlwq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3RToR2RuO20+68BSmKwTH/o6gngfxyApY3ktFUNv/JybdAmfzTkq9KKkqnSyfWZ+PoJUoXd/knUiscM4cbi9x6gD0f7LjbA8FosQD9DVPSIfJCIbx9Kc0PDGSbBOFYMh1iIIHA0bSZdwgXNdfg4t9nINKG7rGqVZi42w7njGjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqVMf8tG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718245652; x=1749781652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nh2RzwaSTxJgbNfHmt3JRc0uEjv3nRlrnUDcdTPlwq8=;
  b=VqVMf8tGl0GqyXf6C+Zjq2AeJzt1xBJ84PfSOq3v7Y4ep5FX/UYPtzCy
   wZ6csTKR3JwYsOeY3bqkkvLXN4JrH4bE/Vg0xUlCwISPKqOh4WVoqI0Sl
   uNy20oVW98cCuOD9N328bD80BkXnt5dtcCuY4Zg4EKQf18J9zLxLqXGTa
   gsB+s375A3pv965i/g+gcJeH8SIX6uUjm98enI9q6JMdoBMDKpemc5tla
   du6VocFv4RmgXGT6fae5ZKq4EXCahJTdxuabawLgBAq1I7glE5XgWyPX0
   AMxTqPMi6YDj1PnyOcQ3fT/IBdPfwPYtDOEnE1bRg/xenBHy3KjFFMQn2
   w==;
X-CSE-ConnectionGUID: XxZwVx+tS1yirIUFxQCBqg==
X-CSE-MsgGUID: ikPWenUVQ22a0doG6kiIbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14762594"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14762594"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 19:27:32 -0700
X-CSE-ConnectionGUID: Hfsi00ypS3ujyFebs+qM4w==
X-CSE-MsgGUID: ZXcO7e85TC+r/0EEzcI5Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44371511"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2024 19:27:26 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHaBP-00027m-2g;
	Thu, 13 Jun 2024 02:27:23 +0000
Date: Thu, 13 Jun 2024 10:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 6/9] accel/rocket: Add a new driver for Rockchip's NPU
Message-ID: <202406131022.1JKNS7me-lkp@intel.com>
References: <20240612-6-10-rocket-v1-6-060e48eea250@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-6-10-rocket-v1-6-060e48eea250@tomeuvizoso.net>

Hi Tomeu,

kernel test robot noticed the following build errors:

[auto build test ERROR on 83a7eefedc9b56fe7bfeff13b6c7356688ffa670]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomeu-Vizoso/iommu-rockchip-Add-compatible-for-rockchip-rk3588-iommu/20240612-215814
base:   83a7eefedc9b56fe7bfeff13b6c7356688ffa670
patch link:    https://lore.kernel.org/r/20240612-6-10-rocket-v1-6-060e48eea250%40tomeuvizoso.net
patch subject: [PATCH 6/9] accel/rocket: Add a new driver for Rockchip's NPU
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240613/202406131022.1JKNS7me-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131022.1JKNS7me-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131022.1JKNS7me-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/clk.h:13,
                    from drivers/accel/rocket/rocket_drv.c:4:
>> drivers/accel/rocket/rocket_drv.c:213:31: error: 'rocket_pm_ops' undeclared here (not in a function); did you mean 'rocket_probe'?
     213 |                 .pm = pm_ptr(&rocket_pm_ops),
         |                               ^~~~~~~~~~~~~
   include/linux/kernel.h:48:44: note: in definition of macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/accel/rocket/rocket_drv.c:213:23: note: in expansion of macro 'pm_ptr'
     213 |                 .pm = pm_ptr(&rocket_pm_ops),
         |                       ^~~~~~


vim +213 drivers/accel/rocket/rocket_drv.c

   207	
   208	static struct platform_driver rocket_driver = {
   209		.probe = rocket_probe,
   210		.remove_new = rocket_remove,
   211		.driver	 = {
   212			.name = "rocket",
 > 213			.pm = pm_ptr(&rocket_pm_ops),
   214			.of_match_table = dt_match,
   215		},
   216	};
   217	module_platform_driver(rocket_driver);
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


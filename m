Return-Path: <linux-media+bounces-32159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4B7AB1A11
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 18:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 214523B67F3
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 16:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079AD2367B8;
	Fri,  9 May 2025 16:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJ2IZ8YG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9C82367B6
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 16:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806975; cv=none; b=LE73xLguaOuolKtE6o+4Nd32rhsyPMUtUG8OpiArnp90+1rGWjrBXO9UctW1jxvia2vDmbE44xZaZ0wn9RwYf5fhqLpraQmxJd2oEUKFUiJp7NZS0aCjXR/P/y4VJKC148ZakF5TJJctbLhQfx7sRGfp4BZXNkHZdJ2WOebyUWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806975; c=relaxed/simple;
	bh=XyHuZb+2c9rFfzdBWVKs85hmlHEpI8WlKCKeS6Exhag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZQAYu/Hr/dgjap0+hXQ8p6Kbov7U+V0knR9mk7mQMj+huhxUsQV0xCDIHsyI491fJJoKfXk7XyYIZzQb0J+G6Q8ea8HKA9bgNJFMlHxi/tYEl3bgIcNoKWVqsyU+dsH4qFL4Xz/wA/aU9WaRw8ziXChFQgBe7dg+fpJv4NfvdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJ2IZ8YG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746806973; x=1778342973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XyHuZb+2c9rFfzdBWVKs85hmlHEpI8WlKCKeS6Exhag=;
  b=EJ2IZ8YGzGPwxLRKkM3MFTdwrf9k3XTperSGky5l3GxjGLxJ7z8j+XXv
   CtQxNHNM0KFWfsvMKXgt6mIxZEqK8EMKdrvBuWAtpu/p2aRIXnVZIdK9I
   +1ZPcA4ico3q1nIPBVpIURsYTo+ZTNvAx9LAMxfu24vRqLYqksfzGsE7m
   6Z8Nx9OVucqhnnzrDJXFWCGVZd+GcEARdjpy7BJ0YfKf8B1CjvVQLn0Hw
   1psjimBbP/S66jlqJI/640HQTBooVVdkpSGcIIuo0iPToUW57UKzGgbxK
   jU3hjLXoL0fGfkuQEHVZo5dPAcF1/Fea5FFi4tYYMkzJmSOlhSY6PFtQw
   w==;
X-CSE-ConnectionGUID: YEAW/0H+QUCg33A2POWTTQ==
X-CSE-MsgGUID: tTPPMDYNQl24qAHLMiMCTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48511354"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="48511354"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 09:09:32 -0700
X-CSE-ConnectionGUID: KRmn/rxES5m2F/ire068VA==
X-CSE-MsgGUID: cseGCHO+QbaUiry0XjwDnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="136352515"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 May 2025 09:09:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDQHw-000CEZ-04;
	Fri, 09 May 2025 16:09:28 +0000
Date: Sat, 10 May 2025 00:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Mathis Foerst <mathis.foerst@mt.com>
Subject: Re: [PATCH 03/13] media: mt9m114: Use aptina-PLL helper to get PLL
 values
Message-ID: <202505092306.PFANn3Fo-lkp@intel.com>
References: <20250504101336.18748-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504101336.18748-4-hdegoede@redhat.com>

Hi Hans,

kernel test robot noticed the following build errors:

[auto build test ERROR on sailus-media-tree/master]
[also build test ERROR on linuxtv-media-pending/master linus/master media-tree/master v6.15-rc5 next-20250509]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-aptina-pll-Debug-log-p1-min-and-max-values/20250505-114824
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20250504101336.18748-4-hdegoede%40redhat.com
patch subject: [PATCH 03/13] media: mt9m114: Use aptina-PLL helper to get PLL values
config: i386-randconfig-005-20250509 (https://download.01.org/0day-ci/archive/20250509/202505092306.PFANn3Fo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505092306.PFANn3Fo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505092306.PFANn3Fo-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/xe/xe_migrate.o: in function `pte_update_cmd_size':
   drivers/gpu/drm/xe/xe_migrate.c:1561: undefined reference to `__udivdi3'
   ld: drivers/media/i2c/mt9m114.o: in function `mt9m114_clk_init':
>> drivers/media/i2c/mt9m114.c:2268: undefined reference to `aptina_pll_calculate'


vim +2268 drivers/media/i2c/mt9m114.c

  2233	
  2234	/* -----------------------------------------------------------------------------
  2235	 * Probe & Remove
  2236	 */
  2237	
  2238	static int mt9m114_clk_init(struct mt9m114 *sensor)
  2239	{
  2240		unsigned int link_freq;
  2241		/*
  2242		 * TODO these limits have been copied from mt9p031.c, with out_clock_max
  2243		 * increased from 360000000 to 400000000 to get the same PLL settings as
  2244		 * in the static register lists for 24 MHz and 19.2 MHz ext clock freq.
  2245		 * These should be verified / adjusted by someone with access to
  2246		 * the full MT9M114 datasheet.
  2247		 */
  2248		static const struct aptina_pll_limits limits = {
  2249			.ext_clock_min = 6000000,
  2250			.ext_clock_max = 27000000,
  2251			.int_clock_min = 2000000,
  2252			.int_clock_max = 13500000,
  2253			.out_clock_min = 180000000,
  2254			.out_clock_max = 400000000,
  2255			.pix_clock_max = 96000000,
  2256			.n_min = 1,
  2257			.n_max = 64,
  2258			.m_min = 16,
  2259			.m_max = 255,
  2260			.p1_min = 1,
  2261			.p1_max = 128,
  2262		};
  2263		int ret;
  2264	
  2265		sensor->pll.ext_clock = sensor->clk_freq;
  2266		sensor->pll.pix_clock = MT9M114_DEF_PIXCLOCK;
  2267	
> 2268		ret = aptina_pll_calculate(&sensor->client->dev, &limits, &sensor->pll);
  2269		if (ret)
  2270			return ret;
  2271	
  2272		/*
  2273		 * Calculate the pixel rate and link frequency. The CSI-2 bus is clocked
  2274		 * for 16-bit per pixel, transmitted in DDR over a single lane. For
  2275		 * parallel mode, the sensor ouputs one pixel in two PIXCLK cycles.
  2276		 */
  2277		sensor->pixrate = sensor->clk_freq * sensor->pll.m
  2278				/ (sensor->pll.n * sensor->pll.p1);
  2279	
  2280		link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
  2281			  ? sensor->pixrate * 8 : sensor->pixrate * 2;
  2282	
  2283		if (sensor->bus_cfg.nr_of_link_frequencies != 1 ||
  2284		    sensor->bus_cfg.link_frequencies[0] != link_freq) {
  2285			dev_err(&sensor->client->dev, "Unsupported DT link-frequencies\n");
  2286			return -EINVAL;
  2287		}
  2288	
  2289		return 0;
  2290	}
  2291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


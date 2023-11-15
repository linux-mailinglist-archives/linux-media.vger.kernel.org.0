Return-Path: <linux-media+bounces-373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AFB7EC43C
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 14:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7FF4281395
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 13:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4528200B2;
	Wed, 15 Nov 2023 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVFZEQMH"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED9B1EB5C
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 13:59:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF517B3
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 05:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700056761; x=1731592761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oDAG9U9fPnXH4/W5TINxeu6R/Ejjv31ZgA04gxsa7NI=;
  b=OVFZEQMHhXMnxtRWMSTU62oN3FO6qznfOHNtDVxXEKLMzTRFLb1TWqFt
   AyK+4x6oUbT8UjA0jqnUcLeYCnU0e0iClsyo9/s93yWUiD8GQqzzkDTE5
   P3OH2GVbOJ3f4CUrzEstdvifD7xWu8wWIqWHErPecRzGVimfxf0sGEW2V
   uRLn03J1BAP0dn+sQ4enOTmmqDbD17wgd6aleIE/gLnMtKXJnFh1XLGGV
   nqHrtn94ds8yGlIWtT0aM+q7J4YJbEkVMjDwNQUbow1mrCs7mUhHVDvc2
   y7mOQtGX9NYxtcx0TbACgarC053CT2/NCGJTUV1f3KJxZinVWFXTWydqU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="375918798"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="375918798"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:59:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="758502870"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="758502870"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Nov 2023 05:59:19 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3GQG-0000NQ-1m;
	Wed, 15 Nov 2023 13:59:16 +0000
Date: Wed, 15 Nov 2023 21:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for OmniVision OV64A40
Message-ID: <202311152102.decxO6op-lkp@intel.com>
References: <20231114182831.220823-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114182831.220823-3-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 61ab89c1916219ccbeca9f6cefb1680212de8d1c]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-dt-bindings-Add-OmniVision-OV64A40/20231115-035231
base:   61ab89c1916219ccbeca9f6cefb1680212de8d1c
patch link:    https://lore.kernel.org/r/20231114182831.220823-3-jacopo.mondi%40ideasonboard.com
patch subject: [PATCH v2 2/2] media: i2c: Add driver for OmniVision OV64A40
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231115/202311152102.decxO6op-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152102.decxO6op-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152102.decxO6op-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ov64a40.c:2808:31: warning: no previous prototype for 'ov64a40_get_timings' [-Wmissing-prototypes]
    2808 | const struct ov64a40_timings *ov64a40_get_timings(struct ov64a40 *ov64a40)
         |                               ^~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov64a40.c: In function 'ov64a40_remove':
   drivers/media/i2c/ov64a40.c:3609:25: warning: unused variable 'ov64a40' [-Wunused-variable]
    3609 |         struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
         |                         ^~~~~~~
   drivers/media/i2c/ov64a40.c: At top level:
>> drivers/media/i2c/ov64a40.c:3175:12: warning: 'ov64a40_power_on' defined but not used [-Wunused-function]
    3175 | static int ov64a40_power_on(struct device *dev)
         |            ^~~~~~~~~~~~~~~~
   drivers/media/i2c/ov64a40.c:119:18: warning: 'ov64a40_link_freq_menu' defined but not used [-Wunused-const-variable=]
     119 | static const s64 ov64a40_link_freq_menu[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~


vim +/ov64a40_power_on +3175 drivers/media/i2c/ov64a40.c

  3174	
> 3175	static int ov64a40_power_on(struct device *dev)
  3176	{
  3177		struct v4l2_subdev *sd = dev_get_drvdata(dev);
  3178		struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
  3179		int ret;
  3180	
  3181		ret = ov64a40_enable(dev);
  3182		if (ret)
  3183			return ret;
  3184	
  3185		/*
  3186		 * The first configuration sequence is pretty long, so we write it
  3187		 * once at power-on time to avoid doing it in consecutive
  3188		 * start_streaming calls.
  3189		 */
  3190		return cci_multi_reg_write(ov64a40->cci, ov64a40_init,
  3191					   ARRAY_SIZE(ov64a40_init), NULL);
  3192	}
  3193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


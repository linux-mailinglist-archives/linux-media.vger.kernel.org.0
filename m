Return-Path: <linux-media+bounces-18728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C313A988DA2
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 04:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F20441C218F4
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 02:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F288C199EAD;
	Sat, 28 Sep 2024 02:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5kUnnWh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4FF199E81;
	Sat, 28 Sep 2024 02:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727492043; cv=none; b=qzFoA0DLOxvb+uMxKnc/8rJJpJYF2gLmNfMHXoRP/MhbyZG90QDgXBvzTn+y+M9VNHVSstyQYPwJKX/SeNG1Eeuj6Bng+HsuvmajBIhGvIYI8aE0qQlEZClzgG10D35CN7/O8YpWebispXDUNaFniPjqOcQRuDQSgaK0qwY4P40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727492043; c=relaxed/simple;
	bh=BV8w8Vm2w5/mKh9u/gfHZJjU+0E/OmKnKZ/LdAM7IfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2a+xkePj/sCqaZV1BnY2wGGTmwE0pjOkyA66gK1okQkbVlhVWrcZLfnzdWDgON1sH+2fU1dIIs4QiVKelrLCrct083uN8hHL0IKJtjbEVkD7GEooRhTcKrnz6cCvqyQKbxqcTZ7ShVQ1JAcrxtqF2tHwvqeQ1gZU4aMqTjMsNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5kUnnWh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727492042; x=1759028042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BV8w8Vm2w5/mKh9u/gfHZJjU+0E/OmKnKZ/LdAM7IfM=;
  b=W5kUnnWhI2FHO1fGLK8+rtBoaY3K7+eW8hBFaE8OUQAj3PyE/nUAMD1G
   TaV2p4TlJIke19JjA6lsX5pHDFKwh+XsC9jXeTfOXkEZXIutAz04jNgXh
   snsbaP3HJudchafdfkvgUmos+Z3/Au1mxWn5QL2Vx6vr26pS0wl6dGT78
   uZkYyuhe3cqEvSBYtqbM3pi6q9DqhhZ5uYVN/RMMR6y+9fasXDXOA2crD
   ucJ7+rbDGZvXBAxs9oYY3uVs4Sh4q3grEsg+yDd1U/jxFQ8b9mi7bStUj
   YJRwr0ZFWMxOPclxUSvC0KGzzV/zoKPSmBtp9pTKdHZ3GO4YtUuIKrX5a
   Q==;
X-CSE-ConnectionGUID: 3gS4FYDATA+HPdB+WtFqaA==
X-CSE-MsgGUID: p34t7ukOQn2FeNcKVaVILQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26779800"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26779800"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 19:54:01 -0700
X-CSE-ConnectionGUID: CJLPsEPNRPSAPDvP2YIm2w==
X-CSE-MsgGUID: cpyZrmvCQ2i9/Vu6ukZ0wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73513464"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Sep 2024 19:53:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suNal-000Mrb-0r;
	Sat, 28 Sep 2024 02:53:55 +0000
Date: Sat, 28 Sep 2024 10:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>, Benoit Parrot <bparrot@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v2 1/3] media: ti: cal: Use str_up_down()
Message-ID: <202409281008.pouaXQCm-lkp@intel.com>
References: <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org>

Hi Ricardo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 075dbe9f6e3c21596c5245826a4ee1f1c1676eb8]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Ribalda/media-ti-cal-Use-str_up_down/20240927-180438
base:   075dbe9f6e3c21596c5245826a4ee1f1c1676eb8
patch link:    https://lore.kernel.org/r/20240927-cocci-6-12-v2-1-1c6ad931959b%40chromium.org
patch subject: [PATCH v2 1/3] media: ti: cal: Use str_up_down()
config: arc-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281008.pouaXQCm-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281008.pouaXQCm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281008.pouaXQCm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/platform/ti/cal/cal-camerarx.c: In function 'cal_camerarx_power':
>> drivers/media/platform/ti/cal/cal-camerarx.c:897:2: error: unterminated argument list invoking macro "phy_err"
     897 | }
         |  ^
>> drivers/media/platform/ti/cal/cal-camerarx.c:193:17: error: 'phy_err' undeclared (first use in this function)
     193 |                 phy_err(phy, "Failed to power %s complexio\n",
         |                 ^~~~~~~
   drivers/media/platform/ti/cal/cal-camerarx.c:193:17: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/media/platform/ti/cal/cal-camerarx.c:193:24: error: expected ';' at end of input
     193 |                 phy_err(phy, "Failed to power %s complexio\n",
         |                        ^
         |                        ;
   ......
   drivers/media/platform/ti/cal/cal-camerarx.c:192:9: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     192 |         if (i == 10)
         |         ^~
   drivers/media/platform/ti/cal/cal-camerarx.c:192:9: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
>> drivers/media/platform/ti/cal/cal-camerarx.c:193:17: error: expected declaration or statement at end of input
     193 |                 phy_err(phy, "Failed to power %s complexio\n",
         |                 ^~~~~~~
   drivers/media/platform/ti/cal/cal-camerarx.c: At top level:
>> drivers/media/platform/ti/cal/cal-camerarx.c:168:13: warning: 'cal_camerarx_power' defined but not used [-Wunused-function]
     168 | static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/ti/cal/cal-camerarx.c:133:13: warning: 'cal_camerarx_config' defined but not used [-Wunused-function]
     133 | static void cal_camerarx_config(struct cal_camerarx *phy, s64 link_freq)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/ti/cal/cal-camerarx.c:108:13: warning: 'cal_camerarx_enable' defined but not used [-Wunused-function]
     108 | static void cal_camerarx_enable(struct cal_camerarx *phy)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/ti/cal/cal-camerarx.c:80:13: warning: 'cal_camerarx_lane_config' defined but not used [-Wunused-function]
      80 | static void cal_camerarx_lane_config(struct cal_camerarx *phy)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/ti/cal/cal-camerarx.c:48:12: warning: 'cal_camerarx_get_ext_link_freq' defined but not used [-Wunused-function]
      48 | static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/phy_err +897 drivers/media/platform/ti/cal/cal-camerarx.c

af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  886  
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  887  void cal_camerarx_destroy(struct cal_camerarx *phy)
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  888  {
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  889  	if (!phy)
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  890  		return;
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  891  
5acc3e22c25359 drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-12-07  892  	v4l2_device_unregister_subdev(&phy->subdev);
e7bbe653fd9a76 drivers/media/platform/ti/cal/cal-camerarx.c Tomi Valkeinen   2023-06-19  893  	v4l2_subdev_cleanup(&phy->subdev);
5acc3e22c25359 drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-12-07  894  	media_entity_cleanup(&phy->subdev.entity);
27f86b9bff79e1 drivers/media/platform/ti-vpe/cal-camerarx.c Tomi Valkeinen   2021-06-14  895  	of_node_put(phy->source_ep_node);
27f86b9bff79e1 drivers/media/platform/ti-vpe/cal-camerarx.c Tomi Valkeinen   2021-06-14  896  	of_node_put(phy->source_node);
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06 @897  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


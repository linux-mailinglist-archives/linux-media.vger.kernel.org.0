Return-Path: <linux-media+bounces-25914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 205B1A2EC9B
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 13:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 905833A2F5D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDEA22FF5C;
	Mon, 10 Feb 2025 12:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdubI4DA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBFE227593
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 12:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190739; cv=none; b=pBqLI+co8UiBFTNWT9GgQjLUy6dtI6L8Pg2bgENiAMgE1vHPJ1bgrO8KBsBJ9dO8EdyAbcHAXtihECsmrYnh5wQaX5U1xAHJEfOmqWNkxyXPeJ4AWQfzrFo1z9psf7VgnTPZcw+agJwJ4+JZDc5qwm1QSsOreDFgDTjX1mTmJ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190739; c=relaxed/simple;
	bh=+qBRqr/aNXkkQK8qu5cBgY8PD2i7Npl7eo8CQTFkvP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVEbrqzJ+RGYcLLfpBuzBPdsdB1aPvoTKw2iXjNDyDkQl7IxarpTsbGI6CEZIbmv1TBG6tqGysZkuTjgiECXC8BrGt13xa3DtTPhpLqdBPJNmwK/WpDLXH0oNASOP8Mg1B1mTCxtwubcJSopiBiD8Gq0/VqLXgLCSzm/fah5uhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdubI4DA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739190738; x=1770726738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+qBRqr/aNXkkQK8qu5cBgY8PD2i7Npl7eo8CQTFkvP8=;
  b=WdubI4DAHz7lS1xRu+XJ3IzzJMl6P+c/CKZQmIDmcmxS2ICSWLTfhDKa
   apISW3AT7SFWbXNxF1SgxVicD6fjTez2NN+7m2SPbKf3VB74qh4SBkxhZ
   XJqH/1QPF943Mc6gtZb8J4xpL5JMthZFeaWoGnVbJGmB+UsejOaNtwy32
   b7NS+EcNzGqHBkuiCkFyeYUoZafrjV2sFaK/KlKTb/9ZH0ANsB0yur4XO
   mVQlPAyuDRk5fvprigObBX0b51tSikYqi+gjCTWrYAogCS+Ze4n4D1sEU
   F/f/rQkiMrozG3MhgEwjotmXopaDCUyOksBdbq9l2cgg9uJ6Wbhb78nmV
   Q==;
X-CSE-ConnectionGUID: BD9JY4C7RDiFuwI4WXjq7w==
X-CSE-MsgGUID: SBOY9FJ4QYiqibvYAQ37HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="38969397"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="38969397"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 04:32:18 -0800
X-CSE-ConnectionGUID: wZBZ9DCvQf+mItphXQwWLA==
X-CSE-MsgGUID: 0Df2HQYDQyCSPIw2YlrbRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="117244519"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Feb 2025 04:32:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thSxP-0012k9-28;
	Mon, 10 Feb 2025 12:32:11 +0000
Date: Mon, 10 Feb 2025 20:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl, ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	daxing.li@intel.com, dongcheng.yan@linux.intel.com,
	ong.hock.yu@intel.com, balamurugan.c@intel.com, wei.a.fu@intel.com
Subject: Re: [PATCH v5] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <202502102022.iul448ho-lkp@intel.com>
References: <20250210060923.2434047-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210060923.2434047-1-dongcheng.yan@intel.com>

Hi Dongcheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongcheng-Yan/media-i2c-add-lt6911uxe-hdmi-bridge-driver/20250210-141140
base:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
patch link:    https://lore.kernel.org/r/20250210060923.2434047-1-dongcheng.yan%40intel.com
patch subject: [PATCH v5] media: i2c: add lt6911uxe hdmi bridge driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250210/202502102022.iul448ho-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502102022.iul448ho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502102022.iul448ho-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/lt6911uxe.c:46:2: error: initialization of non-aggregate type '__u32' (aka 'unsigned int') with a designated initializer list
      46 |         V4L2_INIT_BT_TIMINGS(
         |         ^~~~~~~~~~~~~~~~~~~~~
      47 |                 160, 3840,                              /* min/max width */
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                 120, 2160,                              /* min/max height */
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |                 50000000, 594000000,                    /* min/max pixelclock */
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                 V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      51 |                 V4L2_DV_BT_STD_CVT,
         |                 ~~~~~~~~~~~~~~~~~~~
      52 |                 V4L2_DV_BT_CAP_PROGRESSIVE | V4L2_DV_BT_CAP_CUSTOM |
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      53 |                 V4L2_DV_BT_CAP_REDUCED_BLANKING)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/v4l2-dv-timings.h:17:2: note: expanded from macro 'V4L2_INIT_BT_TIMINGS'
      17 |         { .bt = { _width , ## args } }
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/lt6911uxe.c:444:7: error: no member named 'link_freq' in 'struct v4l2_mbus_config'
     444 |         cfg->link_freq = lt6911uxe->cur_mode.link_freq;
         |         ~~~  ^
   2 errors generated.


vim +46 drivers/media/i2c/lt6911uxe.c

    42	
    43	static const struct v4l2_dv_timings_cap lt6911uxe_timings_cap_4kp30 = {
    44		.type = V4L2_DV_BT_656_1120,
    45		/* Pixel clock from REF_01 p. 20. Min/max height/width are unknown */
  > 46		V4L2_INIT_BT_TIMINGS(
    47			160, 3840,				/* min/max width */
    48			120, 2160,				/* min/max height */
    49			50000000, 594000000,			/* min/max pixelclock */
    50			V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
    51			V4L2_DV_BT_STD_CVT,
    52			V4L2_DV_BT_CAP_PROGRESSIVE | V4L2_DV_BT_CAP_CUSTOM |
    53			V4L2_DV_BT_CAP_REDUCED_BLANKING)
    54	};
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


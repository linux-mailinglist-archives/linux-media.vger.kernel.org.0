Return-Path: <linux-media+bounces-27186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F359AA49070
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 05:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85E077A79BD
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 04:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8E01AC892;
	Fri, 28 Feb 2025 04:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPXOOuZX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E8F192B66
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 04:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740717515; cv=none; b=CkB2vFhzmPbtZgFkYe79mczdiNCw5msHROSUumah+t7e4bT93t54n8H6nJnjtltJXOPGHbolTV4g3qtlIIMpkbV+J63MVpBTmufm4Y14Laf5JTdB/Y27gjcELd98JK4eE7DSZE9z2l1vMnracJ73rU3hZjyN6B5PsDY++ySdoDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740717515; c=relaxed/simple;
	bh=F4h6uqLQf88ZF0CcTF2u793SdiYR3nlpxj5BCH2s6UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1MsCFPQGNjHnTGecM2vCwLWXNv32bsTNqAh2wAt8Eh753xOMAp7s4+GG5CPlsefNkn+Bq+snWN6P5ueZ41yzpdpkd2e/7moQ6mCH7zkE+DgaC6ncbjY4PZfcJPgxRFoehd5VZl0mn3avFekXlNVbGkwKHzReTZoJiXUfkR1wQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPXOOuZX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740717514; x=1772253514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F4h6uqLQf88ZF0CcTF2u793SdiYR3nlpxj5BCH2s6UE=;
  b=GPXOOuZXqvmUviVSF/b3QTjbCzmVf0j9Qxk1SRsXlVY6OxZOo5DowpOm
   lSihD2dsZ3+IRSJ8Zwa/4T8Cyry5U0VYKddRKvMUq0QlfTHPgNGhJbI36
   qRzigrgAAIJCDKd4ul6+orvT1p3uNROP2XHxyujw7BB2/plcqV4SUe81x
   HZ7dHnHM5EqgRWM8lKsvMmWmE98iU9GY4kJvxFdJ+NcJ61JO0CXIcESnD
   Cz7grRHcVNqh55PNWnbnQNWT7US6F1nmraL9CQhRf1Dqp3PQGJ6cInlmc
   KKQ0ytzoAJuLOIIugTRmZGzE8H923mlG8ROpQ/IIXidL4RbEWjwQtfhaw
   Q==;
X-CSE-ConnectionGUID: BfbP9knpTLGSRHXtkxcdpg==
X-CSE-MsgGUID: JmRgKKpPRwCGSHZ9KEpAyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41484324"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="41484324"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 20:38:33 -0800
X-CSE-ConnectionGUID: RTsMSm40QyyDs/YUauQc/g==
X-CSE-MsgGUID: jOuaaF4oSF6qKGbvabxZDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121354165"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Feb 2025 20:38:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tns8p-000EQ6-0I;
	Fri, 28 Feb 2025 04:38:27 +0000
Date: Fri, 28 Feb 2025 12:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl, ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	daxing.li@intel.com, dongcheng.yan@linux.intel.com,
	ong.hock.yu@intel.com, balamurugan.c@intel.com, wei.a.fu@intel.com,
	xiaohong.zou@intel.com
Subject: Re: [PATCH v6] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <202502281242.hJEk5bLj-lkp@intel.com>
References: <20250227061641.499763-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227061641.499763-1-dongcheng.yan@intel.com>

Hi Dongcheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on a64dcfb451e254085a7daee5fe51bf22959d52d3]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongcheng-Yan/media-i2c-add-lt6911uxe-hdmi-bridge-driver/20250227-141956
base:   a64dcfb451e254085a7daee5fe51bf22959d52d3
patch link:    https://lore.kernel.org/r/20250227061641.499763-1-dongcheng.yan%40intel.com
patch subject: [PATCH v6] media: i2c: add lt6911uxe hdmi bridge driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250228/202502281242.hJEk5bLj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502281242.hJEk5bLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281242.hJEk5bLj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/lt6911uxe.c:46:2: error: initialization of non-aggregate type '__u32' (aka 'unsigned int') with a designated initializer list
      46 |         V4L2_INIT_BT_TIMINGS(160, 3840,                 /* min/max width */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      47 |                              120, 2160,                 /* min/max height */
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                              50000000, 594000000,       /* min/max pixelclock */
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |                              V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                              V4L2_DV_BT_STD_CVT,
         |                              ~~~~~~~~~~~~~~~~~~~
      51 |                              V4L2_DV_BT_CAP_PROGRESSIVE |
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                              V4L2_DV_BT_CAP_CUSTOM |
         |                              ~~~~~~~~~~~~~~~~~~~~~~~
      53 |                              V4L2_DV_BT_CAP_REDUCED_BLANKING)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/v4l2-dv-timings.h:17:2: note: expanded from macro 'V4L2_INIT_BT_TIMINGS'
      17 |         { .bt = { _width , ## args } }
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/lt6911uxe.c:426:7: error: no member named 'link_freq' in 'struct v4l2_mbus_config'
     426 |         cfg->link_freq = lt6911uxe->cur_mode.link_freq;
         |         ~~~  ^
   2 errors generated.


vim +46 drivers/media/i2c/lt6911uxe.c

    42	
    43	static const struct v4l2_dv_timings_cap lt6911uxe_timings_cap_4kp30 = {
    44		.type = V4L2_DV_BT_656_1120,
    45		/* Pixel clock from REF_01 p. 20. Min/max height/width are unknown */
  > 46		V4L2_INIT_BT_TIMINGS(160, 3840,			/* min/max width */
    47				     120, 2160,			/* min/max height */
    48				     50000000, 594000000,	/* min/max pixelclock */
    49				     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
    50				     V4L2_DV_BT_STD_CVT,
    51				     V4L2_DV_BT_CAP_PROGRESSIVE |
    52				     V4L2_DV_BT_CAP_CUSTOM |
    53				     V4L2_DV_BT_CAP_REDUCED_BLANKING)
    54	};
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


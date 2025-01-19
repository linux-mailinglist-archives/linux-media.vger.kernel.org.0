Return-Path: <linux-media+bounces-24913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FE2A1637F
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 19:18:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8388F3A5050
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 18:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AC31DF756;
	Sun, 19 Jan 2025 18:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvY/GGED"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1119F36D
	for <linux-media@vger.kernel.org>; Sun, 19 Jan 2025 18:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737310680; cv=none; b=SqiERG9l9hovMsjSRPrHo9rgSlQuFmNqfK+QkMFGthGne+8fzxFoi9aCGfhtPvASZRRfO56jHuL8sa0JDb2oKf+47VlZ4pFw6/sdYJBxaO8ZEuG4567RGwPjsjLLMkMrVKcoT41EhYa67m5o+GRJcG1arO4PpGAjTA6vsAlWxAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737310680; c=relaxed/simple;
	bh=id4HJV1/TzS8NjIQd/64ur704QkdK+Utcl+bVVjN6Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyL5OIh5kjGPkPg2vt0w9eAt/JssYRpAR/mxjFchq6GJvRrokYYkwL46Q/cE+lp47fK5gQjJ2fB2zWV8LYGLaIWcDQAz1aedxgy6zPJaNXlQVhGAuaTtxgYwjoRRNvT7xoASiXExtyJr0bCOz1ccmkMwXnaRJIBNtKZQl3DZZ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvY/GGED; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737310679; x=1768846679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=id4HJV1/TzS8NjIQd/64ur704QkdK+Utcl+bVVjN6Tk=;
  b=IvY/GGEDD4Uh22EPVThEWVUE3SZ+2JW3pOOrqdNhfZ3ieQll3pyhlee4
   ifmIy+01uVKameHXmkbFNa5wZqwrCeNMlpkJ/PFUPSdkOmQjpIB+qH255
   jGq0HdVoHbMcEBqzaBjtf5OdsgmYiu5TEIPxKT8f61yU+6nxqttAVYBYD
   +QOMFYg17TjoDN0IXx+E/32xaQNELBL7UTh8DnDCjfILb3K09VZ/4pnam
   uLl1a/fuNaZvdDnUwOPGXVK/TZLpsAZtCBobkC45vXA6PiF+PVRTjac2Q
   ACQhTNJZDT8TU9SiNLGharKPcxdLU8Z4isWEHAjL2UfZS8O+KcdCIUavB
   Q==;
X-CSE-ConnectionGUID: Qu5A2dKNQ+CpGHODc7V3vA==
X-CSE-MsgGUID: 8gwH3E+GSQy8ClvYXsX40Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37557909"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37557909"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 10:17:58 -0800
X-CSE-ConnectionGUID: 2prkNUdlTjaDs+Gqgj/E7g==
X-CSE-MsgGUID: Qx84ZA2iTXq906znTGp9AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111378358"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jan 2025 10:17:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZZrp-000VhD-0u;
	Sun, 19 Jan 2025 18:17:49 +0000
Date: Mon, 20 Jan 2025 02:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>, Dan Scally <djrscally@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benoit Parrot <bparrot@ti.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	"Duc-Long, Le" <duclong.linux@gmail.com>
Subject: Re: [PATCH v9 9/9] media: v4l: Convert the users of
 v4l2_get_link_freq to call it on a pad
Message-ID: <202501200228.jk1X695m-lkp@intel.com>
References: <20250119143904.114991-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119143904.114991-10-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c4b7779abc6633677e6edb79e2809f4f61fde157]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-Support-passing-media-pad-argument-to-v4l2_get_link_freq/20250119-224053
base:   c4b7779abc6633677e6edb79e2809f4f61fde157
patch link:    https://lore.kernel.org/r/20250119143904.114991-10-sakari.ailus%40linux.intel.com
patch subject: [PATCH v9 9/9] media: v4l: Convert the users of v4l2_get_link_freq to call it on a pad
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250120/202501200228.jk1X695m-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501200228.jk1X695m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501200228.jk1X695m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/qcom/camss/camss.c: In function 'camss_get_pixel_clock':
   drivers/media/platform/qcom/camss/camss.c:2057:9: error: 'sensor_pad' undeclared (first use in this function); did you mean 'sensor'?
    2057 |         sensor_pad = camss_find_sensor_pad(entity);
         |         ^~~~~~~~~~
         |         sensor
   drivers/media/platform/qcom/camss/camss.c:2057:9: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from include/linux/clk.h:13,
                    from drivers/media/platform/qcom/camss/camss.c:10:
   include/linux/container_of.h:20:35: error: invalid type argument of unary '*' (have 'int')
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                   ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1132:17: note: in expansion of macro 'container_of'
    1132 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss.c:2061:18: note: in expansion of macro 'media_entity_to_v4l2_subdev'
    2061 |         subdev = media_entity_to_v4l2_subdev(sensor_pad->entity);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:21:35: error: invalid type argument of unary '*' (have 'int')
      21 |                       __same_type(*(ptr), void),                        \
         |                                   ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1132:17: note: in expansion of macro 'container_of'
    1132 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss.c:2061:18: note: in expansion of macro 'media_entity_to_v4l2_subdev'
    2061 |         subdev = media_entity_to_v4l2_subdev(sensor_pad->entity);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:483:27: error: expression in static assertion is not an integer
     483 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1132:17: note: in expansion of macro 'container_of'
    1132 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss.c:2061:18: note: in expansion of macro 'media_entity_to_v4l2_subdev'
    2061 |         subdev = media_entity_to_v4l2_subdev(sensor_pad->entity);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss.c:2053:27: warning: unused variable 'sensor' [-Wunused-variable]
    2053 |         struct media_pad *sensor;
         |                           ^~~~~~


vim +/sensor +2053 drivers/media/platform/qcom/camss/camss.c

  2043	
  2044	/*
  2045	 * camss_get_pixel_clock - Get pixel clock rate from sensor
  2046	 * @entity: Media entity in the current pipeline
  2047	 * @pixel_clock: Received pixel clock value
  2048	 *
  2049	 * Return 0 on success or a negative error code otherwise
  2050	 */
  2051	int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
  2052	{
> 2053		struct media_pad *sensor;
  2054		struct v4l2_subdev *subdev;
  2055		struct v4l2_ctrl *ctrl;
  2056	
  2057		sensor_pad = camss_find_sensor_pad(entity);
  2058		if (!sensor_pad)
  2059			return -ENODEV;
  2060	
  2061		subdev = media_entity_to_v4l2_subdev(sensor_pad->entity);
  2062	
  2063		ctrl = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
  2064	
  2065		if (!ctrl)
  2066			return -EINVAL;
  2067	
  2068		*pixel_clock = v4l2_ctrl_g_ctrl_int64(ctrl);
  2069	
  2070		return 0;
  2071	}
  2072	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


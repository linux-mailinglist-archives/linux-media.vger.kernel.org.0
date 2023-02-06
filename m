Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 854FA68B483
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 04:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjBFDdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Feb 2023 22:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBFDdw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Feb 2023 22:33:52 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3278216323
        for <linux-media@vger.kernel.org>; Sun,  5 Feb 2023 19:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675654430; x=1707190430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L4kD9fBKfRQgIpz24Qms4T/rGutF9bfpQYJ1O9Unut8=;
  b=Or3CUUgj3zAnZYRVRt3TS93ryJiqZw1g7Yuy12UCUZDDjGEJIjp04wkX
   6pq/C3/oT02YW7phyifizZHeZo+xioYaiohhvcjjydBowDrZlJVdjTCTj
   GzE/oUQ2NR9GCjrYS3tOuZHu73u/X8HOVjJ/oukx3kLC/azH13xG7V6+S
   eI9i+CzV5rVCUcJ3PYixY30BZpOkTGZC7hVQPQ0syUKH/SzKQ999n8w2H
   P9ehck6UMTO8cQm/wPXKiFuVi6XgfDoK+Ze5kp6RMIL3JqMZ5HSObhFGr
   Sox6Tv96R8vEsON7GKBEUP72DffTtDow9RJQwvWcG+riPkLHxZmxDzqz2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="308766537"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="308766537"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 19:33:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="790309648"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="790309648"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Feb 2023 19:33:47 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pOsGJ-0002Me-01;
        Mon, 06 Feb 2023 03:33:47 +0000
Date:   Mon, 6 Feb 2023 11:32:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [pinchartl-media:muxed/2023.1/xilinx/api-updates 69/88]
 drivers/media/platform/xilinx/xilinx-axis-switch.c:266:30: error:
 subscripted value is neither array nor pointer nor vector
Message-ID: <202302061143.B1fKs8O8-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/pinchartl/media.git muxed/2023.1/xilinx/api-updates
head:   4d84aca55464a5384ebfc09558bbc965f6eb5218
commit: e81e65cfc035a650709f6df9f5a7bcf73f3ad4e8 [69/88] media: subdev: Add [GS]_ROUTING subdev ioctls and operations
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230206/202302061143.B1fKs8O8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2023.1/xilinx/api-updates
        git checkout e81e65cfc035a650709f6df9f5a7bcf73f3ad4e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the pinchartl-media/muxed/2023.1/xilinx/api-updates HEAD 4d84aca55464a5384ebfc09558bbc965f6eb5218 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-axis-switch.c: In function 'xvsw_get_routing':
>> drivers/media/platform/xilinx/xilinx-axis-switch.c:266:30: error: subscripted value is neither array nor pointer nor vector
     266 |                 route->routes[i].sink = xvsw->routing[i];
         |                              ^
   drivers/media/platform/xilinx/xilinx-axis-switch.c:267:30: error: subscripted value is neither array nor pointer nor vector
     267 |                 route->routes[i].source = i;
         |                              ^
   drivers/media/platform/xilinx/xilinx-axis-switch.c: In function 'xvsw_set_routing':
   drivers/media/platform/xilinx/xilinx-axis-switch.c:299:44: error: subscripted value is neither array nor pointer nor vector
     299 |                 xvsw->routing[route->routes[i].source - xvsw->xvip.num_sinks] =
         |                                            ^
   drivers/media/platform/xilinx/xilinx-axis-switch.c:300:38: error: subscripted value is neither array nor pointer nor vector
     300 |                         route->routes[i].sink;
         |                                      ^
   drivers/media/platform/xilinx/xilinx-axis-switch.c: At top level:
   drivers/media/platform/xilinx/xilinx-axis-switch.c:327:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'get_routing'; did you mean 'set_routing'?
     327 |         .get_routing = xvsw_get_routing,
         |          ^~~~~~~~~~~
         |          set_routing
   drivers/media/platform/xilinx/xilinx-axis-switch.c:327:24: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     327 |         .get_routing = xvsw_get_routing,
         |                        ^~~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:327:24: note: (near initialization for 'xvsw_pad_ops')
   drivers/media/platform/xilinx/xilinx-axis-switch.c:327:24: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_routing *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-axis-switch.c:327:24: note: (near initialization for 'xvsw_pad_ops.set_selection')
   drivers/media/platform/xilinx/xilinx-axis-switch.c:328:24: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, enum v4l2_subdev_format_whence,  struct v4l2_subdev_krouting *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_routing *)' [-Werror=incompatible-pointer-types]
     328 |         .set_routing = xvsw_set_routing,
         |                        ^~~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:328:24: note: (near initialization for 'xvsw_pad_ops.set_routing')
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:10: error: 'const struct media_entity_operations' has no member named 'has_route'
     371 |         .has_route = xvsw_has_route,
         |          ^~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     371 |         .has_route = xvsw_has_route,
         |                      ^~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: note: (near initialization for 'xvsw_media_ops')
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: error: initialization of 'int (*)(struct media_entity *, struct fwnode_endpoint *)' from incompatible pointer type 'bool (*)(struct media_entity *, unsigned int,  unsigned int)' {aka '_Bool (*)(struct media_entity *, unsigned int,  unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: note: (near initialization for 'xvsw_media_ops.get_fwnode_pad')
   cc1: some warnings being treated as errors
--
   drivers/media/platform/xilinx/xilinx-switch.c: In function 'xsw_get_routing':
>> drivers/media/platform/xilinx/xilinx-switch.c:197:30: error: subscripted value is neither array nor pointer nor vector
     197 |                 route->routes[i].sink = xsw->routing[i];
         |                              ^
   drivers/media/platform/xilinx/xilinx-switch.c:198:30: error: subscripted value is neither array nor pointer nor vector
     198 |                 route->routes[i].source = i;
         |                              ^
   drivers/media/platform/xilinx/xilinx-switch.c: In function 'xsw_set_routing':
   drivers/media/platform/xilinx/xilinx-switch.c:226:43: error: subscripted value is neither array nor pointer nor vector
     226 |                 xsw->routing[route->routes[i].source - xsw->xvip.num_sinks] =
         |                                           ^
   drivers/media/platform/xilinx/xilinx-switch.c:227:38: error: subscripted value is neither array nor pointer nor vector
     227 |                         route->routes[i].sink;
         |                                      ^
   drivers/media/platform/xilinx/xilinx-switch.c: At top level:
   drivers/media/platform/xilinx/xilinx-switch.c:292:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'get_routing'; did you mean 'set_routing'?
     292 |         .get_routing = xsw_get_routing,
         |          ^~~~~~~~~~~
         |          set_routing
   drivers/media/platform/xilinx/xilinx-switch.c:292:24: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     292 |         .get_routing = xsw_get_routing,
         |                        ^~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:292:24: note: (near initialization for 'xsw_pad_ops')
   drivers/media/platform/xilinx/xilinx-switch.c:292:24: error: initialization of 'int (*)(struct v4l2_subdev *, unsigned int,  struct v4l2_mbus_frame_desc *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_routing *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-switch.c:292:24: note: (near initialization for 'xsw_pad_ops.set_frame_desc')
   drivers/media/platform/xilinx/xilinx-switch.c:293:24: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, enum v4l2_subdev_format_whence,  struct v4l2_subdev_krouting *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_routing *)' [-Werror=incompatible-pointer-types]
     293 |         .set_routing = xsw_set_routing,
         |                        ^~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:293:24: note: (near initialization for 'xsw_pad_ops.set_routing')
   drivers/media/platform/xilinx/xilinx-switch.c:331:10: error: 'const struct media_entity_operations' has no member named 'has_route'
     331 |         .has_route = xsw_has_route,
         |          ^~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     331 |         .has_route = xsw_has_route,
         |                      ^~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: note: (near initialization for 'xsw_media_ops')
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: error: initialization of 'int (*)(struct media_entity *, struct fwnode_endpoint *)' from incompatible pointer type 'bool (*)(struct media_entity *, unsigned int,  unsigned int)' {aka '_Bool (*)(struct media_entity *, unsigned int,  unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: note: (near initialization for 'xsw_media_ops.get_fwnode_pad')
   cc1: some warnings being treated as errors


vim +266 drivers/media/platform/xilinx/xilinx-axis-switch.c

789f326f453f86 Vishal Sagar     2018-08-14  246  
789f326f453f86 Vishal Sagar     2018-08-14  247  static int xvsw_get_routing(struct v4l2_subdev *subdev,
789f326f453f86 Vishal Sagar     2018-08-14  248  			    struct v4l2_subdev_routing *route)
789f326f453f86 Vishal Sagar     2018-08-14  249  {
789f326f453f86 Vishal Sagar     2018-08-14  250  	struct xvswitch_device *xvsw = to_xvsw(subdev);
789f326f453f86 Vishal Sagar     2018-08-14  251  	unsigned int i;
789f326f453f86 Vishal Sagar     2018-08-14  252  	u32 min;
789f326f453f86 Vishal Sagar     2018-08-14  253  
789f326f453f86 Vishal Sagar     2018-08-14  254  	/* In case of tdest routing, we can't get routing */
789f326f453f86 Vishal Sagar     2018-08-14  255  	if (xvsw->tdest_routing)
789f326f453f86 Vishal Sagar     2018-08-14  256  		return -EINVAL;
789f326f453f86 Vishal Sagar     2018-08-14  257  
789f326f453f86 Vishal Sagar     2018-08-14  258  	mutex_lock(&subdev->entity.graph_obj.mdev->graph_mutex);
789f326f453f86 Vishal Sagar     2018-08-14  259  
c8d3ad56df8983 Laurent Pinchart 2022-01-04  260  	if (xvsw->xvip.num_sources < route->num_routes)
c8d3ad56df8983 Laurent Pinchart 2022-01-04  261  		min = xvsw->xvip.num_sources;
789f326f453f86 Vishal Sagar     2018-08-14  262  	else
789f326f453f86 Vishal Sagar     2018-08-14  263  		min = route->num_routes;
789f326f453f86 Vishal Sagar     2018-08-14  264  
789f326f453f86 Vishal Sagar     2018-08-14  265  	for (i = 0; i < min; ++i) {
789f326f453f86 Vishal Sagar     2018-08-14 @266  		route->routes[i].sink = xvsw->routing[i];
789f326f453f86 Vishal Sagar     2018-08-14  267  		route->routes[i].source = i;
789f326f453f86 Vishal Sagar     2018-08-14  268  	}
789f326f453f86 Vishal Sagar     2018-08-14  269  
c8d3ad56df8983 Laurent Pinchart 2022-01-04  270  	route->num_routes = xvsw->xvip.num_sources;
789f326f453f86 Vishal Sagar     2018-08-14  271  
789f326f453f86 Vishal Sagar     2018-08-14  272  	mutex_unlock(&subdev->entity.graph_obj.mdev->graph_mutex);
789f326f453f86 Vishal Sagar     2018-08-14  273  
789f326f453f86 Vishal Sagar     2018-08-14  274  	return 0;
789f326f453f86 Vishal Sagar     2018-08-14  275  }
789f326f453f86 Vishal Sagar     2018-08-14  276  

:::::: The code at line 266 was first introduced by commit
:::::: 789f326f453f8641e69a8684c7349580213067f8 v4l: xilinx: Driver support for Xilinx AXI4-Stream Switch

:::::: TO: Vishal Sagar <vishal.sagar@xilinx.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

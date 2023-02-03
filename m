Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E62A4688F0D
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 06:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbjBCFlr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 00:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjBCFlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 00:41:46 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F67687D18
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 21:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675402904; x=1706938904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LwoQ3JU/YcIaHQA4YvXt3MxFZBoKweQElkqhyQksEdc=;
  b=Jz5ibDEie7qA7Pr5DwR55EncxgSHZx0OYonQCXFj8JUUaC5U+FY112PH
   NEd59eMmpn24fqf5bvzzVvtyqHOrFC09SuHXTmROQBwgbyuWf7JEq6Fcs
   YwVl4ffMexlr/Kdj2nxWwLO2q3uAPbJcLnIpt2EKty76eqHm6/3UnXvyK
   P2MLEp2+J9tYJATVFmihIqFcIvicsi+JUHKhS9FkE+28kmmeKWC+HJ0f4
   h750fE7DIOiBA7dyiyTLkALIXWTOVAQ5uIMGaa5vB8rOTwMDDPiXjy+Q7
   Mo6Zl4qNrPm7Q6YgjIl1yx3fAsQvuzcptxnVI3q40u958iD+kzAqfkhdF
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="312317509"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="312317509"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 21:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="615589145"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="615589145"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Feb 2023 21:41:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pNopP-0000A5-1x;
        Fri, 03 Feb 2023 05:41:39 +0000
Date:   Fri, 3 Feb 2023 13:41:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [pinchartl-media:muxed/2023.1/xilinx/api-updates 69/88]
 drivers/media/platform/xilinx/xilinx-axis-switch.c:328:24: error:
 initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *,
 enum v4l2_subdev_format_whence,  struct v4l2_subdev_krouting *)' from
 incompatible pointer type 'int (*)(struct ...
Message-ID: <202302031345.B3ntLEjh-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/pinchartl/media.git muxed/2023.1/xilinx/api-updates
head:   4d84aca55464a5384ebfc09558bbc965f6eb5218
commit: e81e65cfc035a650709f6df9f5a7bcf73f3ad4e8 [69/88] media: subdev: Add [GS]_ROUTING subdev ioctls and operations
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230203/202302031345.B3ntLEjh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2023.1/xilinx/api-updates
        git checkout e81e65cfc035a650709f6df9f5a7bcf73f3ad4e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the pinchartl-media/muxed/2023.1/xilinx/api-updates HEAD 4d84aca55464a5384ebfc09558bbc965f6eb5218 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-axis-switch.c: In function 'xvsw_get_routing':
   drivers/media/platform/xilinx/xilinx-axis-switch.c:266:30: error: subscripted value is neither array nor pointer nor vector
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
   drivers/media/platform/xilinx/xilinx-axis-switch.c:327:24: error: initialization of 'int (*)(struct v4l2_subdev *, unsigned int,  struct v4l2_mbus_frame_desc *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_routing *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-axis-switch.c:327:24: note: (near initialization for 'xvsw_pad_ops.get_frame_desc')
>> drivers/media/platform/xilinx/xilinx-axis-switch.c:328:24: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, enum v4l2_subdev_format_whence,  struct v4l2_subdev_krouting *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_routing *)' [-Werror=incompatible-pointer-types]
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
   cc1: some warnings being treated as errors
--
   drivers/media/platform/xilinx/xilinx-switch.c: In function 'xsw_get_routing':
   drivers/media/platform/xilinx/xilinx-switch.c:197:30: error: subscripted value is neither array nor pointer nor vector
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
   drivers/media/platform/xilinx/xilinx-switch.c:292:24: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_routing *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-switch.c:292:24: note: (near initialization for 'xsw_pad_ops.init_cfg')
>> drivers/media/platform/xilinx/xilinx-switch.c:293:24: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, enum v4l2_subdev_format_whence,  struct v4l2_subdev_krouting *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_routing *)' [-Werror=incompatible-pointer-types]
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
   cc1: some warnings being treated as errors


vim +328 drivers/media/platform/xilinx/xilinx-axis-switch.c

789f326f453f86 Vishal Sagar     2018-08-14  320  
de3ac58d7da3da Laurent Pinchart 2021-12-13  321  static const struct v4l2_subdev_pad_ops xvsw_pad_ops = {
789f326f453f86 Vishal Sagar     2018-08-14  322  	.enum_mbus_code = xvip_enum_mbus_code,
789f326f453f86 Vishal Sagar     2018-08-14  323  	.enum_frame_size = xvip_enum_frame_size,
789f326f453f86 Vishal Sagar     2018-08-14  324  	.get_fmt = xvsw_get_format,
789f326f453f86 Vishal Sagar     2018-08-14  325  	.set_fmt = xvsw_set_format,
30c10fbc00e0e7 Laurent Pinchart 2022-01-04  326  	.link_validate = xvip_link_validate,
789f326f453f86 Vishal Sagar     2018-08-14  327  	.get_routing = xvsw_get_routing,
789f326f453f86 Vishal Sagar     2018-08-14 @328  	.set_routing = xvsw_set_routing,
30c10fbc00e0e7 Laurent Pinchart 2022-01-04  329  	.get_mbus_config = xvip_get_mbus_config,
789f326f453f86 Vishal Sagar     2018-08-14  330  };
789f326f453f86 Vishal Sagar     2018-08-14  331  

:::::: The code at line 328 was first introduced by commit
:::::: 789f326f453f8641e69a8684c7349580213067f8 v4l: xilinx: Driver support for Xilinx AXI4-Stream Switch

:::::: TO: Vishal Sagar <vishal.sagar@xilinx.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

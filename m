Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E050682F03
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 15:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbjAaOSD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 09:18:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjAaOSC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 09:18:02 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670641025B
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 06:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675174679; x=1706710679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iHHKvjzMCAU0eQt9rrTsY3mXAMZ6AMuTx+mOoRPYQaY=;
  b=cGu0PR7QQ8f+P2jpBzMEpV9V0zRuuKqszYVspQqmh5j4W1m/2a3xC+7A
   RzTE4P0TPqWgGJ6r4yZbp+8YIpXVCp/Wh+N+9CnngY1oqiDwWV597xzLH
   Vl6Seld7Ia8815bL+hG3+z+9iel7c0NgtcyQxPH92N0wAGklBMQUMYJLa
   OJV6CgvlORiXYJl4iJeHNzCL5OJLAkMLOSoiEJuOD6swet0i526+BL/nv
   PX6IZbKVCRZzUY9+LmW8FCXmXeiwihZsAUqqMFZVivrWIG8XqkyxMxyN3
   q1Uavk6HUTxIehfhoR3sJf6X5OtRj6PUECKnvvdI19L/4abLARwnXyqEr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="326511734"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="326511734"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 06:17:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="727959458"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="727959458"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Jan 2023 06:17:55 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMrSM-0004TK-35;
        Tue, 31 Jan 2023 14:17:54 +0000
Date:   Tue, 31 Jan 2023 22:17:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [pinchartl-media:muxed/2023.1/xilinx/api-updates 73/88]
 drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: error:
 initialization of 'int (*)(struct media_entity *, const struct media_pad *,
 const struct media_pad *, u32)' {aka 'int (*)(struct media_entity *, const
 struct media_pad *, const struct media...
Message-ID: <202301312256.sjXPWTd6-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/pinchartl/media.git muxed/2023.1/xilinx/api-updates
head:   4d84aca55464a5384ebfc09558bbc965f6eb5218
commit: b57c799ebf4b09154df1dceeb1267ab9ca769194 [73/88] media: subdev: Add for_each_active_route() macro
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230131/202301312256.sjXPWTd6-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2023.1/xilinx/api-updates
        git checkout b57c799ebf4b09154df1dceeb1267ab9ca769194
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

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
   drivers/media/platform/xilinx/xilinx-axis-switch.c:327:24: warning: excess elements in struct initializer
   drivers/media/platform/xilinx/xilinx-axis-switch.c:327:24: note: (near initialization for 'xvsw_pad_ops')
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
>> drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: error: initialization of 'int (*)(struct media_entity *, const struct media_pad *, const struct media_pad *, u32)' {aka 'int (*)(struct media_entity *, const struct media_pad *, const struct media_pad *, unsigned int)'} from incompatible pointer type 'bool (*)(struct media_entity *, unsigned int,  unsigned int)' {aka '_Bool (*)(struct media_entity *, unsigned int,  unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: note: (near initialization for 'xvsw_media_ops.link_setup')
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
   drivers/media/platform/xilinx/xilinx-switch.c:292:24: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_edid *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_routing *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-switch.c:292:24: note: (near initialization for 'xsw_pad_ops.set_edid')
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
>> drivers/media/platform/xilinx/xilinx-switch.c:331:22: error: initialization of 'int (*)(struct media_entity *, const struct media_pad *, const struct media_pad *, u32)' {aka 'int (*)(struct media_entity *, const struct media_pad *, const struct media_pad *, unsigned int)'} from incompatible pointer type 'bool (*)(struct media_entity *, unsigned int,  unsigned int)' {aka '_Bool (*)(struct media_entity *, unsigned int,  unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: note: (near initialization for 'xsw_media_ops.link_setup')
   cc1: some warnings being treated as errors


vim +371 drivers/media/platform/xilinx/xilinx-axis-switch.c

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
de3ac58d7da3da Laurent Pinchart 2021-12-13  332  static const struct v4l2_subdev_ops xvsw_ops = {
789f326f453f86 Vishal Sagar     2018-08-14  333  	.video = &xvsw_video_ops,
789f326f453f86 Vishal Sagar     2018-08-14  334  	.pad = &xvsw_pad_ops,
789f326f453f86 Vishal Sagar     2018-08-14  335  };
789f326f453f86 Vishal Sagar     2018-08-14  336  
789f326f453f86 Vishal Sagar     2018-08-14  337  static const struct v4l2_subdev_internal_ops xvsw_internal_ops = {
789f326f453f86 Vishal Sagar     2018-08-14  338  	.open = xvsw_open,
789f326f453f86 Vishal Sagar     2018-08-14  339  	.close = xvsw_close,
789f326f453f86 Vishal Sagar     2018-08-14  340  };
789f326f453f86 Vishal Sagar     2018-08-14  341  
789f326f453f86 Vishal Sagar     2018-08-14  342  /* -----------------------------------------------------------------------------
789f326f453f86 Vishal Sagar     2018-08-14  343   * Media Operations
789f326f453f86 Vishal Sagar     2018-08-14  344   */
789f326f453f86 Vishal Sagar     2018-08-14  345  
789f326f453f86 Vishal Sagar     2018-08-14  346  static bool xvsw_has_route(struct media_entity *entity, unsigned int pad0,
789f326f453f86 Vishal Sagar     2018-08-14  347  			   unsigned int pad1)
789f326f453f86 Vishal Sagar     2018-08-14  348  {
789f326f453f86 Vishal Sagar     2018-08-14  349  	struct xvswitch_device *xvsw =
c8d3ad56df8983 Laurent Pinchart 2022-01-04  350  		to_xvsw(media_entity_to_v4l2_subdev(entity));
789f326f453f86 Vishal Sagar     2018-08-14  351  	unsigned int sink0, sink1;
789f326f453f86 Vishal Sagar     2018-08-14  352  
789f326f453f86 Vishal Sagar     2018-08-14  353  	/* Two sinks are never connected together. */
c8d3ad56df8983 Laurent Pinchart 2022-01-04  354  	if (pad0 < xvsw->xvip.num_sinks && pad1 < xvsw->xvip.num_sinks)
789f326f453f86 Vishal Sagar     2018-08-14  355  		return false;
789f326f453f86 Vishal Sagar     2018-08-14  356  
789f326f453f86 Vishal Sagar     2018-08-14  357  	/* In TDEST routing, assume all sinks and sources are connected */
789f326f453f86 Vishal Sagar     2018-08-14  358  	if (xvsw->tdest_routing)
789f326f453f86 Vishal Sagar     2018-08-14  359  		return true;
789f326f453f86 Vishal Sagar     2018-08-14  360  
c8d3ad56df8983 Laurent Pinchart 2022-01-04  361  	sink0 = pad0 < xvsw->xvip.num_sinks
c8d3ad56df8983 Laurent Pinchart 2022-01-04  362  	       ? pad0 : xvsw->routing[pad0 - xvsw->xvip.num_sinks];
c8d3ad56df8983 Laurent Pinchart 2022-01-04  363  	sink1 = pad1 < xvsw->xvip.num_sinks
c8d3ad56df8983 Laurent Pinchart 2022-01-04  364  	      ? pad1 : xvsw->routing[pad1 - xvsw->xvip.num_sinks];
789f326f453f86 Vishal Sagar     2018-08-14  365  
789f326f453f86 Vishal Sagar     2018-08-14  366  	return sink0 == sink1;
789f326f453f86 Vishal Sagar     2018-08-14  367  }
789f326f453f86 Vishal Sagar     2018-08-14  368  
789f326f453f86 Vishal Sagar     2018-08-14  369  static const struct media_entity_operations xvsw_media_ops = {
789f326f453f86 Vishal Sagar     2018-08-14  370  	.link_validate = v4l2_subdev_link_validate,
789f326f453f86 Vishal Sagar     2018-08-14 @371  	.has_route = xvsw_has_route,
789f326f453f86 Vishal Sagar     2018-08-14  372  };
789f326f453f86 Vishal Sagar     2018-08-14  373  

:::::: The code at line 371 was first introduced by commit
:::::: 789f326f453f8641e69a8684c7349580213067f8 v4l: xilinx: Driver support for Xilinx AXI4-Stream Switch

:::::: TO: Vishal Sagar <vishal.sagar@xilinx.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

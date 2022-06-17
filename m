Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4290E54EFA2
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 05:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbiFQClb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 22:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379663AbiFQCla (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 22:41:30 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE6764D34
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 19:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655433688; x=1686969688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w9S9B8tKbo6bcRRHOKyfgE07h9LIHTcUqVkSjkiL+F0=;
  b=DhV/UOi+XBxw0IiBjIyUK5UFa86D/vniLwkzoSRL1apCCDopyQIghmYh
   kg+IhAe5GWqsTjcdiifP0BKUQaxF5y8y6H+lgeoXDOITv0MSaYtFgyvFv
   gMbBAfDgTmTyiBVxk6nH8M+prZE+DtQ2RHbQQeXpwtelq9oz4hhccjqn1
   4skMiGDC4W1BuCiVo+56m3MPwMAx9Q6LMSsQsscPDXoUsPcAeeqwQ52Em
   mV8C5eQXbDsK2YXLrfFhQwjEzB0Q0i+sOEIbYzQ0YZf8YF7D6mnkNEw0/
   aqh0XOjQBDpMSqdfUDgZCYyHT3OrBnoIsGIaNu0pc30OyefwZj+tE56H6
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268090625"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="268090625"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 19:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="560177057"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Jun 2022 19:41:25 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o21vI-000P0r-Iz;
        Fri, 17 Jun 2022 02:41:24 +0000
Date:   Fri, 17 Jun 2022 10:40:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: Re: [PATCH 7/7] media: nxp: Add i.MX8 ISI driver
Message-ID: <202206171015.qKpDS4qm-lkp@intel.com>
References: <20220616183656.19089-8-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616183656.19089-8-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v5.19-rc2 next-20220616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-nxp-i-MX8-ISI-driver/20220617-023924
base:   git://linuxtv.org/media_tree.git master
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20220617/202206171015.qKpDS4qm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/00174e85de423502abab6c6df2a63b11024aa12d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Laurent-Pinchart/media-nxp-i-MX8-ISI-driver/20220617-023924
        git checkout 00174e85de423502abab6c6df2a63b11024aa12d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/platform/nxp/imx8-isi/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

         |                                                      ;
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_init_cfg':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:207:16: error: variable 'routing' has initializer but incomplete type
     207 |         struct v4l2_subdev_krouting routing = { };
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:207:37: error: storage size of 'routing' isn't known
     207 |         struct v4l2_subdev_krouting routing = { };
         |                                     ^~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:216:51: error: invalid application of 'sizeof' to incomplete type 'struct v4l2_subdev_route'
     216 |         routes = kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL);
         |                                                   ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:221:58: error: invalid use of undefined type 'struct v4l2_subdev_route'
     221 |                 struct v4l2_subdev_route *route = &routes[i];
         |                                                          ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:223:22: error: invalid use of undefined type 'struct v4l2_subdev_route'
     223 |                 route->sink_pad = i;
         |                      ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:224:22: error: invalid use of undefined type 'struct v4l2_subdev_route'
     224 |                 route->source_pad = i + xbar->num_sinks;
         |                      ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:225:22: error: invalid use of undefined type 'struct v4l2_subdev_route'
     225 |                 route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
         |                      ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:225:32: error: 'V4L2_SUBDEV_ROUTE_FL_ACTIVE' undeclared (first use in this function); did you mean 'V4L2_SUBDEV_FORMAT_ACTIVE'?
     225 |                 route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                V4L2_SUBDEV_FORMAT_ACTIVE
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:207:37: warning: unused variable 'routing' [-Wunused-variable]
     207 |         struct v4l2_subdev_krouting routing = { };
         |                                     ^~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_enum_mbus_code':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:255:26: error: implicit declaration of function 'v4l2_subdev_state_get_opposite_stream_format' [-Werror=implicit-function-declaration]
     255 |                 format = v4l2_subdev_state_get_opposite_stream_format(state,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:257:75: error: 'struct v4l2_subdev_mbus_code_enum' has no member named 'stream'
     257 |                                                                       code->stream);
         |                                                                           ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_set_fmt':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:284:13: error: implicit declaration of function 'media_pad_is_streaming'; did you mean 'media_entity_is_streaming'? [-Werror=implicit-function-declaration]
     284 |             media_pad_is_streaming(&xbar->pads[fmt->pad]))
         |             ^~~~~~~~~~~~~~~~~~~~~~
         |             media_entity_is_streaming
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:309:59: error: 'struct v4l2_subdev_format' has no member named 'stream'
     309 |                                                        fmt->stream);
         |                                                           ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:316:37: error: 'struct v4l2_subdev_state' has no member named 'routing'
     316 |         for_each_active_route(&state->routing, route) {
         |                                     ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:316:54: error: expected ';' before '{' token
     316 |         for_each_active_route(&state->routing, route) {
         |                                                      ^~
         |                                                      ;
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: At top level:
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:337:48: warning: 'struct v4l2_subdev_krouting' declared inside parameter list will not be visible outside of this definition or declaration
     337 |                                         struct v4l2_subdev_krouting *routing)
         |                                                ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_set_routing':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:343:58: error: passing argument 3 of '__mxc_isi_crossbar_set_routing' from incompatible pointer type [-Werror=incompatible-pointer-types]
     343 |         return __mxc_isi_crossbar_set_routing(sd, state, routing);
         |                                                          ^~~~~~~
         |                                                          |
         |                                                          struct v4l2_subdev_krouting *
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:122:72: note: expected 'struct v4l2_subdev_krouting *' but argument is of type 'struct v4l2_subdev_krouting *'
     122 |                                           struct v4l2_subdev_krouting *routing)
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_enable_streams':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:376:23: error: implicit declaration of function 'v4l2_subdev_enable_streams'; did you mean 'v4l2_subdev_unlock_state'? [-Werror=implicit-function-declaration]
     376 |                 ret = v4l2_subdev_enable_streams(remote_sd, remote_pad,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       v4l2_subdev_unlock_state
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_disable_streams':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:416:23: error: implicit declaration of function 'v4l2_subdev_disable_streams' [-Werror=implicit-function-declaration]
     416 |                 ret = v4l2_subdev_disable_streams(remote_sd, remote_pad,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: At top level:
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:435:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'set_routing'
     435 |         .set_routing = mxc_isi_crossbar_set_routing,
         |          ^~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:435:24: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     435 |         .set_routing = mxc_isi_crossbar_set_routing,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:435:24: note: (near initialization for 'mxc_isi_crossbar_subdev_pad_ops')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:435:24: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_edid *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, enum v4l2_subdev_format_whence,  struct v4l2_subdev_krouting *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:435:24: note: (near initialization for 'mxc_isi_crossbar_subdev_pad_ops.get_edid')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:436:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'enable_streams'
     436 |         .enable_streams = mxc_isi_crossbar_enable_streams,
         |          ^~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:436:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     436 |         .enable_streams = mxc_isi_crossbar_enable_streams,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:436:27: note: (near initialization for 'mxc_isi_crossbar_subdev_pad_ops')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:436:27: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_edid *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, u32,  u64)' {aka 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, unsigned int,  long long unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:436:27: note: (near initialization for 'mxc_isi_crossbar_subdev_pad_ops.set_edid')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:437:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'disable_streams'
     437 |         .disable_streams = mxc_isi_crossbar_disable_streams,
         |          ^~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:437:28: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     437 |         .disable_streams = mxc_isi_crossbar_disable_streams,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:437:28: note: (near initialization for 'mxc_isi_crossbar_subdev_pad_ops')
>> drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:437:28: error: initialization of 'int (*)(struct v4l2_subdev *, unsigned int,  struct v4l2_mbus_config *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, u32,  u64)' {aka 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, unsigned int,  long long unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:437:28: note: (near initialization for 'mxc_isi_crossbar_subdev_pad_ops.get_mbus_config')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:447:10: error: 'const struct media_entity_operations' has no member named 'has_route'
     447 |         .has_route = v4l2_subdev_has_route,
         |          ^~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:447:22: error: 'v4l2_subdev_has_route' undeclared here (not in a function); did you mean 'v4l2_subdev_has_op'?
     447 |         .has_route = v4l2_subdev_has_route,
         |                      ^~~~~~~~~~~~~~~~~~~~~
         |                      v4l2_subdev_has_op
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:447:22: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:447:22: note: (near initialization for 'mxc_isi_cross_entity_ops')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:447:22: warning: excess elements in struct initializer
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:447:22: note: (near initialization for 'mxc_isi_cross_entity_ops')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_init':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:465:51: error: 'V4L2_SUBDEV_FL_MULTIPLEXED' undeclared (first use in this function)
     465 |         sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_MULTIPLEXED;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function '__mxc_isi_crossbar_set_routing':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:147:1: error: control reaches end of non-void function [-Werror=return-type]
     147 | }
         | ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_set_fmt':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:332:1: error: control reaches end of non-void function [-Werror=return-type]
     332 | }
         | ^
   At top level:
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:109:40: warning: 'mxc_isi_crossbar_default_format' defined but not used [-Wunused-const-variable=]
     109 | static const struct v4l2_mbus_framefmt mxc_isi_crossbar_default_format = {
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +437 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c

   429	
   430	static const struct v4l2_subdev_pad_ops mxc_isi_crossbar_subdev_pad_ops = {
   431		.init_cfg = mxc_isi_crossbar_init_cfg,
   432		.enum_mbus_code = mxc_isi_crossbar_enum_mbus_code,
   433		.get_fmt = v4l2_subdev_get_fmt,
   434		.set_fmt = mxc_isi_crossbar_set_fmt,
   435		.set_routing = mxc_isi_crossbar_set_routing,
   436		.enable_streams = mxc_isi_crossbar_enable_streams,
 > 437		.disable_streams = mxc_isi_crossbar_disable_streams,
   438	};
   439	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

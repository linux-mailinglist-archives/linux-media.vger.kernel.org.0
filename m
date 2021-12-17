Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D7F47834D
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 03:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbhLQCmr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 21:42:47 -0500
Received: from mga06.intel.com ([134.134.136.31]:37931 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231700AbhLQCmr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 21:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639708967; x=1671244967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0TtOHIBy35xHtjXIt6VN7YXpjKckJWib0kjrzyWcSJo=;
  b=nWvigW/LQMgiPLjEEX85LeFGuCMaUQkK0ywDR44B0A+7SASeKARkXvtA
   029985e8ZLNQUzyQjokrYXk0gsm0j87JoPHJyHSHz4phjTkFDKP/E3eBA
   VL/MkoTXlmOKChQg5sUQIZgX5kd5yyaagFSwvEfMqoVmR7Mfjp6kNVrzf
   Jnqu3Dj+4exFwp7bgHMir76jDvVbLg/eNT/CcE9y6KXdW+IzcBG8IwhU9
   lpInzhZTUgFs86/rC5S3PubVzz79a8hZueGIIwlirdcgTqYZUjfrxg3Yg
   xHExWCoorgOoeQKatBVGzsxdIAIUNCi29ZY6qiiIH8MtRBhfSqTHz7nS2
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="300438980"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="300438980"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 18:42:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="483074461"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Dec 2021 18:42:34 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1my3Cc-00047x-0n; Fri, 17 Dec 2021 02:42:34 +0000
Date:   Fri, 17 Dec 2021 10:41:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     kbuild-all@lists.01.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/5] media: adv748x: Add support for v4l2_subdev_state
Message-ID: <202112171052.3JgXYSA4-lkp@intel.com>
References: <20211216170323.141321-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216170323.141321-3-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on v5.16-rc5 next-20211215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jacopo-Mondi/media-adv748x-Add-CSI-2-VC-support/20211217-010519
base:   git://linuxtv.org/media_tree.git master
config: arc-randconfig-r043-20211216 (https://download.01.org/0day-ci/archive/20211217/202112171052.3JgXYSA4-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/beac1be47b64ce291e1647699be3f26d88028b3b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jacopo-Mondi/media-adv748x-Add-CSI-2-VC-support/20211217-010519
        git checkout beac1be47b64ce291e1647699be3f26d88028b3b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/media/i2c/adv748x/adv748x-csi2.c: In function 'adv748x_csi2_init_cfg':
>> drivers/media/i2c/adv748x/adv748x-csi2.c:146:34: error: array type has incomplete element type 'struct v4l2_subdev_route'
     146 |         struct v4l2_subdev_route routes[ADV748X_CSI2_STREAMS] = {
         |                                  ^~~~~~
>> drivers/media/i2c/adv748x/adv748x-csi2.c:152:34: error: 'V4L2_SUBDEV_ROUTE_FL_ACTIVE' undeclared (first use in this function); did you mean 'V4L2_SUBDEV_FORMAT_ACTIVE'?
     152 |                         .flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  V4L2_SUBDEV_FORMAT_ACTIVE
   drivers/media/i2c/adv748x/adv748x-csi2.c:152:34: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/media/i2c/adv748x/adv748x-csi2.c:173:37: error: storage size of 'routing' isn't known
     173 |         struct v4l2_subdev_krouting routing;
         |                                     ^~~~~~~
>> drivers/media/i2c/adv748x/adv748x-csi2.c:179:9: error: implicit declaration of function 'v4l2_subdev_lock_state'; did you mean 'v4l2_subdev_alloc_state'? [-Werror=implicit-function-declaration]
     179 |         v4l2_subdev_lock_state(state);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_subdev_alloc_state
>> drivers/media/i2c/adv748x/adv748x-csi2.c:180:15: error: implicit declaration of function 'v4l2_subdev_set_routing'; did you mean 'v4l2_subdev_notify'? [-Werror=implicit-function-declaration]
     180 |         ret = v4l2_subdev_set_routing(sd, state, &routing);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_subdev_notify
>> drivers/media/i2c/adv748x/adv748x-csi2.c:181:9: error: implicit declaration of function 'v4l2_subdev_unlock_state'; did you mean 'v4l2_subdev_alloc_state'? [-Werror=implicit-function-declaration]
     181 |         v4l2_subdev_unlock_state(state);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_subdev_alloc_state
   drivers/media/i2c/adv748x/adv748x-csi2.c:173:37: warning: unused variable 'routing' [-Wunused-variable]
     173 |         struct v4l2_subdev_krouting routing;
         |                                     ^~~~~~~
   drivers/media/i2c/adv748x/adv748x-csi2.c:146:34: warning: unused variable 'routes' [-Wunused-variable]
     146 |         struct v4l2_subdev_route routes[ADV748X_CSI2_STREAMS] = {
         |                                  ^~~~~~
   drivers/media/i2c/adv748x/adv748x-csi2.c: In function 'adv748x_csi2_init':
>> drivers/media/i2c/adv748x/adv748x-csi2.c:362:29: error: 'V4L2_SUBDEV_FL_MULTIPLEXED' undeclared (first use in this function)
     362 |                             V4L2_SUBDEV_FL_MULTIPLEXED,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/adv748x/adv748x-csi2.c:379:15: error: implicit declaration of function 'v4l2_subdev_init_finalize'; did you mean 'v4l2_subdev_init'? [-Werror=implicit-function-declaration]
     379 |         ret = v4l2_subdev_init_finalize(&tx->sd);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_subdev_init
>> drivers/media/i2c/adv748x/adv748x-csi2.c:396:9: error: implicit declaration of function 'v4l2_subdev_cleanup'; did you mean 'v4l2_subdev_call'? [-Werror=implicit-function-declaration]
     396 |         v4l2_subdev_cleanup(&tx->sd);
         |         ^~~~~~~~~~~~~~~~~~~
         |         v4l2_subdev_call
   cc1: some warnings being treated as errors


vim +146 drivers/media/i2c/adv748x/adv748x-csi2.c

   134	
   135	/* -----------------------------------------------------------------------------
   136	 * v4l2_subdev_pad_ops
   137	 *
   138	 * The CSI2 bus pads are ignorant to the data sizes or formats.
   139	 * But we must support setting the pad formats for format propagation.
   140	 */
   141	
   142	static int adv748x_csi2_init_cfg(struct v4l2_subdev *sd,
   143					 struct v4l2_subdev_state *state)
   144	{
   145		/* One route for each virtual channel. Route 0 enabled by default. */
 > 146		struct v4l2_subdev_route routes[ADV748X_CSI2_STREAMS] = {
   147			{
   148				.sink_pad = ADV748X_CSI2_SINK,
   149				.sink_stream = 0,
   150				.source_pad = ADV748X_CSI2_SOURCE,
   151				.source_stream = 0,
 > 152				.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
   153			},
   154			{
   155				.sink_pad = ADV748X_CSI2_SINK,
   156				.sink_stream = 0,
   157				.source_pad = ADV748X_CSI2_SOURCE,
   158				.source_stream = 1,
   159			},
   160			{
   161				.sink_pad = ADV748X_CSI2_SINK,
   162				.sink_stream = 0,
   163				.source_pad = ADV748X_CSI2_SOURCE,
   164				.source_stream = 2,
   165			},
   166			{
   167				.sink_pad = ADV748X_CSI2_SINK,
   168				.sink_stream = 0,
   169				.source_pad = ADV748X_CSI2_SOURCE,
   170				.source_stream = 3,
   171			},
   172		};
 > 173		struct v4l2_subdev_krouting routing;
   174		int ret;
   175	
   176		routing.num_routes = ADV748X_CSI2_STREAMS;
   177		routing.routes = routes;
   178	
 > 179		v4l2_subdev_lock_state(state);
 > 180		ret = v4l2_subdev_set_routing(sd, state, &routing);
 > 181		v4l2_subdev_unlock_state(state);
   182	
   183		return ret;
   184	}
   185	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC39247840C
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 05:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhLQEZo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 23:25:44 -0500
Received: from mga03.intel.com ([134.134.136.65]:28542 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229511AbhLQEZo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 23:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639715144; x=1671251144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=omY6dEQJJursasw1eZP0Tp34dpXgpfmQ2niOY0oc+no=;
  b=PfKIVgfI4/hCvhX2DP4Ifuto700ZIgGyZdQ0j6dSfDll2WSKJvCFWNe+
   QjtOpfEKR1kOMCMk5L/V/qX2jnYXUJOykDfYc2D5aELMk+pzuNbEl/+rG
   FL1ZFOtrRd9cgKOQgaO/Ang6xV9wXGwXXAYMce7tCjsV7zQ+GcmlEq1jh
   BhzIXiCYdhkefTTP6NSjWMG/2vMUCKdk55jH0QQsuB9I488HVL2/hWOOP
   VBOe+ZYkofVezdoZIvbJmzptPtTaUYFs3t+SLpWk6VM5qLaYAmE97trKy
   5jzigL2Ckp3WPAQN4TlLQE0l7fao8aDZew1qnFyX80+cu0wZNvgp4Cds+
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239626542"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="239626542"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 20:25:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="756355457"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Dec 2021 20:25:40 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1my4oN-0004Dj-Ue; Fri, 17 Dec 2021 04:25:39 +0000
Date:   Fri, 17 Dec 2021 12:24:45 +0800
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
Message-ID: <202112171114.znOy3iE9-lkp@intel.com>
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
config: i386-randconfig-m031-20211216 (https://download.01.org/0day-ci/archive/20211217/202112171114.znOy3iE9-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/beac1be47b64ce291e1647699be3f26d88028b3b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jacopo-Mondi/media-adv748x-Add-CSI-2-VC-support/20211217-010519
        git checkout beac1be47b64ce291e1647699be3f26d88028b3b
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/i2c/adv748x/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/media/i2c/adv748x/adv748x-csi2.c: In function 'adv748x_csi2_init_cfg':
>> drivers/media/i2c/adv748x/adv748x-csi2.c:146:27: error: array type has incomplete element type 'struct v4l2_subdev_route'
     146 |  struct v4l2_subdev_route routes[ADV748X_CSI2_STREAMS] = {
         |                           ^~~~~~
>> drivers/media/i2c/adv748x/adv748x-csi2.c:148:4: error: field name not in record or union initializer
     148 |    .sink_pad = ADV748X_CSI2_SINK,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:148:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:149:4: error: field name not in record or union initializer
     149 |    .sink_stream = 0,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:149:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:150:4: error: field name not in record or union initializer
     150 |    .source_pad = ADV748X_CSI2_SOURCE,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:150:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:151:4: error: field name not in record or union initializer
     151 |    .source_stream = 0,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:151:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:152:4: error: field name not in record or union initializer
     152 |    .flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:152:4: note: (near initialization for 'routes')
>> drivers/media/i2c/adv748x/adv748x-csi2.c:152:13: error: 'V4L2_SUBDEV_ROUTE_FL_ACTIVE' undeclared (first use in this function); did you mean 'V4L2_SUBDEV_FORMAT_ACTIVE'?
     152 |    .flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |             V4L2_SUBDEV_FORMAT_ACTIVE
   drivers/media/i2c/adv748x/adv748x-csi2.c:152:13: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/i2c/adv748x/adv748x-csi2.c:155:4: error: field name not in record or union initializer
     155 |    .sink_pad = ADV748X_CSI2_SINK,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:155:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:156:4: error: field name not in record or union initializer
     156 |    .sink_stream = 0,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:156:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:157:4: error: field name not in record or union initializer
     157 |    .source_pad = ADV748X_CSI2_SOURCE,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:157:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:158:4: error: field name not in record or union initializer
     158 |    .source_stream = 1,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:158:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:161:4: error: field name not in record or union initializer
     161 |    .sink_pad = ADV748X_CSI2_SINK,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:161:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:162:4: error: field name not in record or union initializer
     162 |    .sink_stream = 0,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:162:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:163:4: error: field name not in record or union initializer
     163 |    .source_pad = ADV748X_CSI2_SOURCE,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:163:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:164:4: error: field name not in record or union initializer
     164 |    .source_stream = 2,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:164:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:167:4: error: field name not in record or union initializer
     167 |    .sink_pad = ADV748X_CSI2_SINK,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:167:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:168:4: error: field name not in record or union initializer
     168 |    .sink_stream = 0,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:168:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:169:4: error: field name not in record or union initializer
     169 |    .source_pad = ADV748X_CSI2_SOURCE,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:169:4: note: (near initialization for 'routes')
   drivers/media/i2c/adv748x/adv748x-csi2.c:170:4: error: field name not in record or union initializer
     170 |    .source_stream = 3,
         |    ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:170:4: note: (near initialization for 'routes')
>> drivers/media/i2c/adv748x/adv748x-csi2.c:173:30: error: storage size of 'routing' isn't known
     173 |  struct v4l2_subdev_krouting routing;
         |                              ^~~~~~~
>> drivers/media/i2c/adv748x/adv748x-csi2.c:179:2: error: implicit declaration of function 'v4l2_subdev_lock_state'; did you mean 'v4l2_subdev_alloc_state'? [-Werror=implicit-function-declaration]
     179 |  v4l2_subdev_lock_state(state);
         |  ^~~~~~~~~~~~~~~~~~~~~~
         |  v4l2_subdev_alloc_state
>> drivers/media/i2c/adv748x/adv748x-csi2.c:180:8: error: implicit declaration of function 'v4l2_subdev_set_routing'; did you mean 'v4l2_subdev_notify'? [-Werror=implicit-function-declaration]
     180 |  ret = v4l2_subdev_set_routing(sd, state, &routing);
         |        ^~~~~~~~~~~~~~~~~~~~~~~
         |        v4l2_subdev_notify
>> drivers/media/i2c/adv748x/adv748x-csi2.c:181:2: error: implicit declaration of function 'v4l2_subdev_unlock_state'; did you mean 'v4l2_subdev_alloc_state'? [-Werror=implicit-function-declaration]
     181 |  v4l2_subdev_unlock_state(state);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
         |  v4l2_subdev_alloc_state
   drivers/media/i2c/adv748x/adv748x-csi2.c:173:30: warning: unused variable 'routing' [-Wunused-variable]
     173 |  struct v4l2_subdev_krouting routing;
         |                              ^~~~~~~
   drivers/media/i2c/adv748x/adv748x-csi2.c:146:27: warning: unused variable 'routes' [-Wunused-variable]
     146 |  struct v4l2_subdev_route routes[ADV748X_CSI2_STREAMS] = {
         |                           ^~~~~~
   drivers/media/i2c/adv748x/adv748x-csi2.c: In function 'adv748x_csi2_init':
>> drivers/media/i2c/adv748x/adv748x-csi2.c:362:8: error: 'V4L2_SUBDEV_FL_MULTIPLEXED' undeclared (first use in this function)
     362 |        V4L2_SUBDEV_FL_MULTIPLEXED,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/adv748x/adv748x-csi2.c:379:8: error: implicit declaration of function 'v4l2_subdev_init_finalize'; did you mean 'v4l2_subdev_init'? [-Werror=implicit-function-declaration]
     379 |  ret = v4l2_subdev_init_finalize(&tx->sd);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~
         |        v4l2_subdev_init
>> drivers/media/i2c/adv748x/adv748x-csi2.c:396:2: error: implicit declaration of function 'v4l2_subdev_cleanup'; did you mean 'v4l2_subdev_call'? [-Werror=implicit-function-declaration]
     396 |  v4l2_subdev_cleanup(&tx->sd);
         |  ^~~~~~~~~~~~~~~~~~~
         |  v4l2_subdev_call
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
 > 148				.sink_pad = ADV748X_CSI2_SINK,
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

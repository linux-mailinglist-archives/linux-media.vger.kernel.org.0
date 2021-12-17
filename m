Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7051A478592
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 08:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbhLQHbC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 02:31:02 -0500
Received: from mga18.intel.com ([134.134.136.126]:21111 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232167AbhLQHbB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 02:31:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639726261; x=1671262261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lef5dSA4LeHC9lZ2cNG+drfrdUv+KUI7A5fwZiwG8x4=;
  b=DgBv47UTgEySTQxVKpZnNli7iq1w5R4lXw6v+ArrmP3jUibZvUNH8Qmn
   2QJ+194W4h0bVcItfStpv4brYcBA+sQbHPmkEwCU4jsSVvdF+iW0orlGA
   ZxAnKOrkr+77PvIKBb7cvVOWsAVqUD0T7rhfjKVZ/vqWYbrD1ARinXnNm
   NH0MbP73uoO60DwFDCv9vFJPudTMaaAOhFUAbUdy2bpnZyk7Pe0ggiEDs
   4+eb6BWg4P3Iuw4IXafRlr5c/GhGMkpDxz4gQ+o1BzryaK0EW/I+wzS5H
   jv6fEiQLgMrcDmjXv3QRAW/Yp+CJfXsBVPJSFPxPaMGhBHmQuIM9akwTn
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="226559248"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="226559248"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 23:31:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="683289320"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Dec 2021 23:30:58 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1my7hh-0004Q1-WC; Fri, 17 Dec 2021 07:30:57 +0000
Date:   Fri, 17 Dec 2021 15:30:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     kbuild-all@lists.01.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] media: adv748x: Move format to subdev state
Message-ID: <202112171539.cPT19ZOz-lkp@intel.com>
References: <20211216170323.141321-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216170323.141321-4-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on v5.16-rc5 next-20211216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jacopo-Mondi/media-adv748x-Add-CSI-2-VC-support/20211217-010519
base:   git://linuxtv.org/media_tree.git master
config: arc-randconfig-r043-20211216 (https://download.01.org/0day-ci/archive/20211217/202112171539.cPT19ZOz-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/90158bf217d9df03d83fac378198a756af229010
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jacopo-Mondi/media-adv748x-Add-CSI-2-VC-support/20211217-010519
        git checkout 90158bf217d9df03d83fac378198a756af229010
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/media/i2c/adv748x/adv748x-csi2.c: In function 'adv748x_csi2_init_cfg':
   drivers/media/i2c/adv748x/adv748x-csi2.c:146:34: error: array type has incomplete element type 'struct v4l2_subdev_route'
     146 |         struct v4l2_subdev_route routes[ADV748X_CSI2_STREAMS] = {
         |                                  ^~~~~~
   drivers/media/i2c/adv748x/adv748x-csi2.c:152:34: error: 'V4L2_SUBDEV_ROUTE_FL_ACTIVE' undeclared (first use in this function); did you mean 'V4L2_SUBDEV_FORMAT_ACTIVE'?
     152 |                         .flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  V4L2_SUBDEV_FORMAT_ACTIVE
   drivers/media/i2c/adv748x/adv748x-csi2.c:152:34: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/i2c/adv748x/adv748x-csi2.c:173:37: error: storage size of 'routing' isn't known
     173 |         struct v4l2_subdev_krouting routing;
         |                                     ^~~~~~~
   drivers/media/i2c/adv748x/adv748x-csi2.c:179:9: error: implicit declaration of function 'v4l2_subdev_lock_state'; did you mean 'v4l2_subdev_alloc_state'? [-Werror=implicit-function-declaration]
     179 |         v4l2_subdev_lock_state(state);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_subdev_alloc_state
   drivers/media/i2c/adv748x/adv748x-csi2.c:180:15: error: implicit declaration of function 'v4l2_subdev_set_routing'; did you mean 'v4l2_subdev_notify'? [-Werror=implicit-function-declaration]
     180 |         ret = v4l2_subdev_set_routing(sd, state, &routing);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_subdev_notify
   drivers/media/i2c/adv748x/adv748x-csi2.c:181:9: error: implicit declaration of function 'v4l2_subdev_unlock_state'; did you mean 'v4l2_subdev_alloc_state'? [-Werror=implicit-function-declaration]
     181 |         v4l2_subdev_unlock_state(state);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_subdev_alloc_state
   drivers/media/i2c/adv748x/adv748x-csi2.c:173:37: warning: unused variable 'routing' [-Wunused-variable]
     173 |         struct v4l2_subdev_krouting routing;
         |                                     ^~~~~~~
   drivers/media/i2c/adv748x/adv748x-csi2.c:146:34: warning: unused variable 'routes' [-Wunused-variable]
     146 |         struct v4l2_subdev_route routes[ADV748X_CSI2_STREAMS] = {
         |                                  ^~~~~~
   drivers/media/i2c/adv748x/adv748x-csi2.c: In function 'adv748x_csi2_set_format':
>> drivers/media/i2c/adv748x/adv748x-csi2.c:198:15: error: implicit declaration of function 'v4l2_state_get_stream_format'; did you mean 'v4l2_subdev_get_try_format'? [-Werror=implicit-function-declaration]
     198 |         fmt = v4l2_state_get_stream_format(sd_state, sdformat->pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_subdev_get_try_format
>> drivers/media/i2c/adv748x/adv748x-csi2.c:199:52: error: 'struct v4l2_subdev_format' has no member named 'stream'
     199 |                                            sdformat->stream);
         |                                                    ^~
>> drivers/media/i2c/adv748x/adv748x-csi2.c:207:15: error: implicit declaration of function 'v4l2_subdev_state_get_opposite_stream_format' [-Werror=implicit-function-declaration]
     207 |         fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv748x/adv748x-csi2.c:208:68: error: 'struct v4l2_subdev_format' has no member named 'stream'
     208 |                                                            sdformat->stream);
         |                                                                    ^~
   drivers/media/i2c/adv748x/adv748x-csi2.c: At top level:
>> drivers/media/i2c/adv748x/adv748x-csi2.c:253:20: error: 'v4l2_subdev_get_fmt' undeclared here (not in a function); did you mean 'v4l2_subdev_notify'?
     253 |         .get_fmt = v4l2_subdev_get_fmt,
         |                    ^~~~~~~~~~~~~~~~~~~
         |                    v4l2_subdev_notify
   drivers/media/i2c/adv748x/adv748x-csi2.c: In function 'adv748x_csi2_init':
   drivers/media/i2c/adv748x/adv748x-csi2.c:323:29: error: 'V4L2_SUBDEV_FL_MULTIPLEXED' undeclared (first use in this function)
     323 |                             V4L2_SUBDEV_FL_MULTIPLEXED,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv748x/adv748x-csi2.c:340:15: error: implicit declaration of function 'v4l2_subdev_init_finalize'; did you mean 'v4l2_subdev_init'? [-Werror=implicit-function-declaration]
     340 |         ret = v4l2_subdev_init_finalize(&tx->sd);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_subdev_init
   drivers/media/i2c/adv748x/adv748x-csi2.c:357:9: error: implicit declaration of function 'v4l2_subdev_cleanup'; did you mean 'v4l2_subdev_call'? [-Werror=implicit-function-declaration]
     357 |         v4l2_subdev_cleanup(&tx->sd);
         |         ^~~~~~~~~~~~~~~~~~~
         |         v4l2_subdev_call
   cc1: some warnings being treated as errors


vim +198 drivers/media/i2c/adv748x/adv748x-csi2.c

   185	
   186	static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
   187					   struct v4l2_subdev_state *sd_state,
   188					   struct v4l2_subdev_format *sdformat)
   189	{
   190		struct v4l2_mbus_framefmt *fmt;
   191		int ret = 0;
   192	
   193		/* Do not allow to set format on the multiplexed source pad. */
   194		if (sdformat->pad == ADV748X_CSI2_SOURCE)
   195			return -EINVAL;
   196	
   197		v4l2_subdev_lock_state(sd_state);
 > 198		fmt = v4l2_state_get_stream_format(sd_state, sdformat->pad,
 > 199						   sdformat->stream);
   200		if (!fmt) {
   201			ret = -EINVAL;
   202			goto out;
   203		};
   204		*fmt = sdformat->format;
   205	
   206		/* Propagate format to the other end of the route. */
 > 207		fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
   208								   sdformat->stream);
   209		if (!fmt) {
   210			ret = -EINVAL;
   211			goto out;
   212		}
   213		*fmt = sdformat->format;
   214	
   215	out:
   216		v4l2_subdev_unlock_state(sd_state);
   217	
   218		return ret;
   219	}
   220	
   221	static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
   222						struct v4l2_mbus_config *config)
   223	{
   224		struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
   225	
   226		if (pad != ADV748X_CSI2_SOURCE)
   227			return -EINVAL;
   228	
   229		config->type = V4L2_MBUS_CSI2_DPHY;
   230		switch (tx->active_lanes) {
   231		case 1:
   232			config->flags = V4L2_MBUS_CSI2_1_LANE;
   233			break;
   234	
   235		case 2:
   236			config->flags = V4L2_MBUS_CSI2_2_LANE;
   237			break;
   238	
   239		case 3:
   240			config->flags = V4L2_MBUS_CSI2_3_LANE;
   241			break;
   242	
   243		case 4:
   244			config->flags = V4L2_MBUS_CSI2_4_LANE;
   245			break;
   246		}
   247	
   248		return 0;
   249	}
   250	
   251	static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
   252		.init_cfg = adv748x_csi2_init_cfg,
 > 253		.get_fmt = v4l2_subdev_get_fmt,
   254		.set_fmt = adv748x_csi2_set_format,
   255		.get_mbus_config = adv748x_csi2_get_mbus_config,
   256	};
   257	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

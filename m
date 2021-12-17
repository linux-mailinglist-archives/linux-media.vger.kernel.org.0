Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C571147838D
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 04:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232355AbhLQDNk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 22:13:40 -0500
Received: from mga09.intel.com ([134.134.136.24]:45715 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232338AbhLQDNj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 22:13:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639710819; x=1671246819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N2bRnWBMhPInwONqJ89ujZp2FaA4JtYbXKlC8M0TsQU=;
  b=Ls9qeXNzZNtEaqAoW5aMR6Gv5ARP6e51P+0y+ehSaWyClW65Jar8p3hR
   l7G3Tdi3z/EnM2I+21J9PsGCFTNkkStpEskuHCvkggfMqzQHrsbcMktmC
   fJMi9WD8QX9Tu7hlQ9FUOqOdpyP+HeJrZ42+Zg5axi5D+aKHUTBg/5DmT
   4a9QfiG7bji/mkuufAQvykJPLmoVEXUe/ckflYwK5smg5EYxJY2uWtBQh
   5aJi0CuH/EEFmbjxEwwDOm6DpoNDunfHXP+7mOWR/NHiItUsoKVstwlPh
   vrZQLEXl2Q4+ABreY7lK0xs6XERD200vsnud8wPlCK+HA3Armz12pSJPK
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239478454"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="239478454"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 19:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="464965806"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Dec 2021 19:13:35 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1my3gc-00049s-M9; Fri, 17 Dec 2021 03:13:34 +0000
Date:   Fri, 17 Dec 2021 11:12:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/5] media: adv748x: Implement .get_frame_desc()
Message-ID: <202112171102.NMwa0uem-lkp@intel.com>
References: <20211216170323.141321-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216170323.141321-5-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.16-rc5 next-20211215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jacopo-Mondi/media-adv748x-Add-CSI-2-VC-support/20211217-010519
base:   git://linuxtv.org/media_tree.git master
config: arm-randconfig-r032-20211216 (https://download.01.org/0day-ci/archive/20211217/202112171102.NMwa0uem-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/3baa5f567748a7235338c2547dcec595902888b7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jacopo-Mondi/media-adv748x-Add-CSI-2-VC-support/20211217-010519
        git checkout 3baa5f567748a7235338c2547dcec595902888b7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/i2c/adv748x/ kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/i2c/adv748x/adv748x-csi2.c:190:33: error: array has incomplete element type 'struct v4l2_subdev_route'
           struct v4l2_subdev_route routes[ADV748X_CSI2_STREAMS] = {
                                          ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:190:9: note: forward declaration of 'struct v4l2_subdev_route'
           struct v4l2_subdev_route routes[ADV748X_CSI2_STREAMS] = {
                  ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:196:13: error: use of undeclared identifier 'V4L2_SUBDEV_ROUTE_FL_ACTIVE'; did you mean 'V4L2_SUBDEV_FORMAT_ACTIVE'?
                           .flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                                    V4L2_SUBDEV_FORMAT_ACTIVE
   include/uapi/linux/v4l2-subdev.h:39:2: note: 'V4L2_SUBDEV_FORMAT_ACTIVE' declared here
           V4L2_SUBDEV_FORMAT_ACTIVE = 1,
           ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:217:30: error: variable has incomplete type 'struct v4l2_subdev_krouting'
           struct v4l2_subdev_krouting routing;
                                       ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:217:9: note: forward declaration of 'struct v4l2_subdev_krouting'
           struct v4l2_subdev_krouting routing;
                  ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:223:2: error: implicit declaration of function 'v4l2_subdev_lock_state' [-Werror,-Wimplicit-function-declaration]
           v4l2_subdev_lock_state(state);
           ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:223:2: note: did you mean 'v4l2_subdev_alloc_state'?
   include/media/v4l2-subdev.h:1144:27: note: 'v4l2_subdev_alloc_state' declared here
   struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd);
                             ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:224:8: error: implicit declaration of function 'v4l2_subdev_set_routing' [-Werror,-Wimplicit-function-declaration]
           ret = v4l2_subdev_set_routing(sd, state, &routing);
                 ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:225:2: error: implicit declaration of function 'v4l2_subdev_unlock_state' [-Werror,-Wimplicit-function-declaration]
           v4l2_subdev_unlock_state(state);
           ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:225:2: note: did you mean 'v4l2_subdev_lock_state'?
   drivers/media/i2c/adv748x/adv748x-csi2.c:223:2: note: 'v4l2_subdev_lock_state' declared here
           v4l2_subdev_lock_state(state);
           ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:241:2: error: implicit declaration of function 'v4l2_subdev_lock_state' [-Werror,-Wimplicit-function-declaration]
           v4l2_subdev_lock_state(sd_state);
           ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:242:8: error: implicit declaration of function 'v4l2_state_get_stream_format' [-Werror,-Wimplicit-function-declaration]
           fmt = v4l2_state_get_stream_format(sd_state, sdformat->pad,
                 ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:242:8: note: did you mean 'v4l2_subdev_get_try_format'?
   include/media/v4l2-subdev.h:994:1: note: 'v4l2_subdev_get_try_format' declared here
   v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
   ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:243:19: error: no member named 'stream' in 'struct v4l2_subdev_format'
                                              sdformat->stream);
                                              ~~~~~~~~  ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:251:8: error: implicit declaration of function 'v4l2_subdev_state_get_opposite_stream_format' [-Werror,-Wimplicit-function-declaration]
           fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
                 ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:252:21: error: no member named 'stream' in 'struct v4l2_subdev_format'
                                                              sdformat->stream);
                                                              ~~~~~~~~  ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:260:2: error: implicit declaration of function 'v4l2_subdev_unlock_state' [-Werror,-Wimplicit-function-declaration]
           v4l2_subdev_unlock_state(sd_state);
           ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:309:10: error: implicit declaration of function 'v4l2_subdev_lock_active_state' [-Werror,-Wimplicit-function-declaration]
           state = v4l2_subdev_lock_active_state(sd);
                   ^
>> drivers/media/i2c/adv748x/adv748x-csi2.c:309:8: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_subdev_state *' from 'int' [-Wint-conversion]
           state = v4l2_subdev_lock_active_state(sd);
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv748x/adv748x-csi2.c:312:18: error: no member named 'routing' in 'struct v4l2_subdev_state'
           route = &state->routing.routes[0];
                    ~~~~~  ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:313:8: error: implicit declaration of function 'v4l2_state_get_stream_format' [-Werror,-Wimplicit-function-declaration]
           fmt = v4l2_state_get_stream_format(state, pad, route->source_stream);
                 ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:313:54: error: incomplete definition of type 'struct v4l2_subdev_route'
           fmt = v4l2_state_get_stream_format(state, pad, route->source_stream);
                                                          ~~~~~^
   drivers/media/i2c/adv748x/adv748x-csi2.c:301:9: note: forward declaration of 'struct v4l2_subdev_route'
           struct v4l2_subdev_route *route;
                  ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:327:6: error: no member named 'type' in 'struct v4l2_mbus_frame_desc'
           fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
           ~~  ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:327:13: error: use of undeclared identifier 'V4L2_MBUS_FRAME_DESC_TYPE_CSI2'; did you mean 'V4L2_MBUS_FRAME_DESC_FL_BLOB'?
           fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                      V4L2_MBUS_FRAME_DESC_FL_BLOB
   include/media/v4l2-subdev.h:327:2: note: 'V4L2_MBUS_FRAME_DESC_FL_BLOB' declared here
           V4L2_MBUS_FRAME_DESC_FL_BLOB    = BIT(1),
           ^
   drivers/media/i2c/adv748x/adv748x-csi2.c:330:9: error: no member named 'stream' in 'struct v4l2_mbus_frame_desc_entry'
           entry->stream = 0;
           ~~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +309 drivers/media/i2c/adv748x/adv748x-csi2.c

   229	
   230	static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
   231					   struct v4l2_subdev_state *sd_state,
   232					   struct v4l2_subdev_format *sdformat)
   233	{
   234		struct v4l2_mbus_framefmt *fmt;
   235		int ret = 0;
   236	
   237		/* Do not allow to set format on the multiplexed source pad. */
   238		if (sdformat->pad == ADV748X_CSI2_SOURCE)
   239			return -EINVAL;
   240	
   241		v4l2_subdev_lock_state(sd_state);
   242		fmt = v4l2_state_get_stream_format(sd_state, sdformat->pad,
   243						   sdformat->stream);
   244		if (!fmt) {
   245			ret = -EINVAL;
   246			goto out;
   247		};
   248		*fmt = sdformat->format;
   249	
   250		/* Propagate format to the other end of the route. */
   251		fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
 > 252								   sdformat->stream);
   253		if (!fmt) {
   254			ret = -EINVAL;
   255			goto out;
   256		}
   257		*fmt = sdformat->format;
   258	
   259	out:
   260		v4l2_subdev_unlock_state(sd_state);
   261	
   262		return ret;
   263	}
   264	
   265	static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
   266						struct v4l2_mbus_config *config)
   267	{
   268		struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
   269	
   270		if (pad != ADV748X_CSI2_SOURCE)
   271			return -EINVAL;
   272	
   273		config->type = V4L2_MBUS_CSI2_DPHY;
   274		switch (tx->active_lanes) {
   275		case 1:
   276			config->flags = V4L2_MBUS_CSI2_1_LANE;
   277			break;
   278	
   279		case 2:
   280			config->flags = V4L2_MBUS_CSI2_2_LANE;
   281			break;
   282	
   283		case 3:
   284			config->flags = V4L2_MBUS_CSI2_3_LANE;
   285			break;
   286	
   287		case 4:
   288			config->flags = V4L2_MBUS_CSI2_4_LANE;
   289			break;
   290		}
   291	
   292		return 0;
   293	}
   294	
   295	static int adv748x_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
   296					       struct v4l2_mbus_frame_desc *fd)
   297	{
   298		struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
   299		struct adv748x_csi2_format_info info = {};
   300		struct v4l2_mbus_frame_desc_entry *entry;
   301		struct v4l2_subdev_route *route;
   302		struct v4l2_subdev_state *state;
   303		struct v4l2_mbus_framefmt *fmt;
   304		int ret;
   305	
   306		if (pad != ADV748X_CSI2_SOURCE)
   307			return -EINVAL;
   308	
 > 309		state = v4l2_subdev_lock_active_state(sd);
   310	
   311		/* A single route is available. */
   312		route = &state->routing.routes[0];
   313		fmt = v4l2_state_get_stream_format(state, pad, route->source_stream);
   314		if (!fmt) {
   315			ret = -EINVAL;
   316			goto out;
   317		}
   318	
   319		ret = adv748x_csi2_get_format_info(tx, fmt->code, &info);
   320		if (ret)
   321			goto out;
   322	
   323		memset(fd, 0, sizeof(*fd));
   324	
   325		/* A single stream is available. */
   326		fd->num_entries = 1;
   327		fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
   328	
   329		entry = &fd->entry[0];
   330		entry->stream = 0;
   331		entry->flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
   332		entry->length = fmt->width * fmt->height * info.bpp / 8;
   333		entry->pixelcode = fmt->code;
   334		entry->bus.csi2.vc = route->source_stream;
   335		entry->bus.csi2.dt = info.dt;
   336	
   337	out:
   338		v4l2_subdev_unlock_state(state);
   339	
   340		return ret;
   341	}
   342	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

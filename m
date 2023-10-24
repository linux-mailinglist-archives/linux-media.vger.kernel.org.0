Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3547D4516
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 03:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbjJXBnl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 21:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjJXBnk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 21:43:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95870D7D
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 18:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698111817; x=1729647817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+a8x9//eDnTZ0uv/y2OFEgBp4LBdVfbA8+3cn1ODI/c=;
  b=Dj8tJZmYlpJXMvbge2AdAWMPCJGLb6OPYIpqLi6+lP0tqiCHaiR0A1nf
   zvQCZq52RWtXwIkS92R7e9OSi6IBozcLWkFDJ7kpAmlg1jBntp8vBncug
   8vkW5e2BM0K0gPY71ul5EYT54FgXm6FuUetekbrq4DApuUkn7JcIf7ZeW
   SJHRb/GPbA9h7fhWNYKO/ft/+vtOD1sdJ0yHEl7jJvGovmcyv815iq6Eb
   F5W5vWbEowG8+oNyoN6KE1UuIVNuUrnprZr0HGp3rXO56aq3bgat0FSDE
   akZ3IEthS4yoeg4Fw9cq3v/39YbN5u5uJSezxPJtxCBCRXsX/pNnfIHag
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="418090194"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="418090194"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 18:43:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="881962239"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="881962239"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Oct 2023 18:43:34 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qv6SB-0007SX-2s;
        Tue, 24 Oct 2023 01:43:31 +0000
Date:   Tue, 24 Oct 2023 09:43:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        jacopo.mondi@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH v2 4/6] media: v4l: subdev: Make stream argument optional
 in state access functions
Message-ID: <202310240911.7Doj3ImH-lkp@intel.com>
References: <20231023123308.782592-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023123308.782592-5-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on rockchip/for-next linus/master v6.6-rc7 next-20231023]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-subdev-Also-return-pads-array-information-on-stream-functions/20231023-203626
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231023123308.782592-5-sakari.ailus%40linux.intel.com
patch subject: [PATCH v2 4/6] media: v4l: subdev: Make stream argument optional in state access functions
config: i386-buildonly-randconfig-001-20231024 (https://download.01.org/0day-ci/archive/20231024/202310240911.7Doj3ImH-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310240911.7Doj3ImH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240911.7Doj3ImH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/media/v4l2-device.h:13:0,
                    from drivers/media/v4l2-core/v4l2-subdev.c:24:
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'check_state':
>> include/media/v4l2-subdev.h:1555:9: error: implicit declaration of function '__v4l2_subdev_state_get_format___VA_OPT__'; did you mean '__v4l2_subdev_state_get_format_'? [-Werror=implicit-function-declaration]
            __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
            ^
   drivers/media/v4l2-core/v4l2-subdev.c:180:8: note: in expansion of macro 'v4l2_subdev_state_get_format'
      if (!v4l2_subdev_state_get_format(state, pad, stream))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1556:21: error: expected ')' before '__VA_OPT__'
            (state, pad __VA_OPT__(,) __VA_ARGS__)
                        ^
   drivers/media/v4l2-core/v4l2-subdev.c:180:8: note: in expansion of macro 'v4l2_subdev_state_get_format'
      if (!v4l2_subdev_state_get_format(state, pad, stream))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1555:9: error: called object is not a function or function pointer
            __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
            ^
   drivers/media/v4l2-core/v4l2-subdev.c:180:8: note: in expansion of macro 'v4l2_subdev_state_get_format'
      if (!v4l2_subdev_state_get_format(state, pad, stream))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'v4l2_subdev_get_fmt':
>> include/media/v4l2-subdev.h:1555:55: error: 'stream' undeclared (first use in this function); did you mean 'strim'?
            __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
                                                          ^
   drivers/media/v4l2-core/v4l2-subdev.c:1581:8: note: in expansion of macro 'v4l2_subdev_state_get_format'
     fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1555:55: note: each undeclared identifier is reported only once for each function it appears in
            __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
                                                          ^
   drivers/media/v4l2-core/v4l2-subdev.c:1581:8: note: in expansion of macro 'v4l2_subdev_state_get_format'
     fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1556:21: error: expected ')' before '__VA_OPT__'
            (state, pad __VA_OPT__(,) __VA_ARGS__)
                        ^
   drivers/media/v4l2-core/v4l2-subdev.c:1581:8: note: in expansion of macro 'v4l2_subdev_state_get_format'
     fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/bug.h:87:0,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:256,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:17,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/leds.h:12,
                    from drivers/media/v4l2-core/v4l2-subdev.c:13:
   drivers/media/v4l2-core/v4l2-subdev.c: In function '__v4l2_subdev_state_get_format':
   drivers/media/v4l2-core/v4l2-subdev.c:1685:27: error: 'struct v4l2_subdev_state' has no member named 'sd'
      if (WARN_ON(pad >= state->sd->entity.num_pads))
                              ^
   include/asm-generic/bug.h:168:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c: In function '__v4l2_subdev_state_get_crop':
   drivers/media/v4l2-core/v4l2-subdev.c:1719:27: error: 'struct v4l2_subdev_state' has no member named 'sd'
      if (WARN_ON(pad >= state->sd->entity.num_pads))
                              ^
   include/asm-generic/bug.h:168:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c: In function '__v4l2_subdev_state_get_compose':
   drivers/media/v4l2-core/v4l2-subdev.c:1753:27: error: 'struct v4l2_subdev_state' has no member named 'sd'
      if (WARN_ON(pad >= state->sd->entity.num_pads))
                              ^
   include/asm-generic/bug.h:168:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   In file included from include/media/v4l2-device.h:13:0,
                    from drivers/media/v4l2-core/v4l2-subdev.c:24:
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'v4l2_subdev_state_get_opposite_stream_format':
>> include/media/v4l2-subdev.h:1556:21: error: expected ')' before '__VA_OPT__'
            (state, pad __VA_OPT__(,) __VA_ARGS__)
                        ^
   drivers/media/v4l2-core/v4l2-subdev.c:1817:9: note: in expansion of macro 'v4l2_subdev_state_get_format'
     return v4l2_subdev_state_get_format(state, other_pad, other_stream);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1555:9: error: called object is not a function or function pointer
            __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
            ^
   drivers/media/v4l2-core/v4l2-subdev.c:1817:9: note: in expansion of macro 'v4l2_subdev_state_get_format'
     return v4l2_subdev_state_get_format(state, other_pad, other_stream);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-subdev.c:1818:1: error: control reaches end of non-void function [-Werror=return-type]
    }
    ^
   cc1: some warnings being treated as errors


vim +1555 include/media/v4l2-subdev.h

  1479	
  1480	/**
  1481	 * v4l2_subdev_get_fmt() - Fill format based on state
  1482	 * @sd: subdevice
  1483	 * @state: subdevice state
  1484	 * @format: pointer to &struct v4l2_subdev_format
  1485	 *
  1486	 * Fill @format->format field based on the information in the @format struct.
  1487	 *
  1488	 * This function can be used by the subdev drivers which support active state to
  1489	 * implement v4l2_subdev_pad_ops.get_fmt if the subdev driver does not need to
  1490	 * do anything special in their get_fmt op.
  1491	 *
  1492	 * Returns 0 on success, error value otherwise.
  1493	 */
  1494	int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
  1495				struct v4l2_subdev_format *format);
  1496	
  1497	/**
  1498	 * v4l2_subdev_set_routing() - Set given routing to subdev state
  1499	 * @sd: The subdevice
  1500	 * @state: The subdevice state
  1501	 * @routing: Routing that will be copied to subdev state
  1502	 *
  1503	 * This will release old routing table (if any) from the state, allocate
  1504	 * enough space for the given routing, and copy the routing.
  1505	 *
  1506	 * This can be used from the subdev driver's set_routing op, after validating
  1507	 * the routing.
  1508	 */
  1509	int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
  1510				    struct v4l2_subdev_state *state,
  1511				    const struct v4l2_subdev_krouting *routing);
  1512	
  1513	struct v4l2_subdev_route *
  1514	__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
  1515					struct v4l2_subdev_route *route);
  1516	
  1517	/**
  1518	 * for_each_active_route - iterate on all active routes of a routing table
  1519	 * @routing: The routing table
  1520	 * @route: The route iterator
  1521	 */
  1522	#define for_each_active_route(routing, route) \
  1523		for ((route) = NULL;                  \
  1524		     ((route) = __v4l2_subdev_next_active_route((routing), (route)));)
  1525	
  1526	/**
  1527	 * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev
  1528	 *					state
  1529	 * @sd: The subdevice
  1530	 * @state: The subdevice state
  1531	 * @routing: Routing that will be copied to subdev state
  1532	 * @fmt: Format used to initialize all the streams
  1533	 *
  1534	 * This is the same as v4l2_subdev_set_routing, but additionally initializes
  1535	 * all the streams using the given format.
  1536	 */
  1537	int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
  1538					     struct v4l2_subdev_state *state,
  1539					     const struct v4l2_subdev_krouting *routing,
  1540					     const struct v4l2_mbus_framefmt *fmt);
  1541	
  1542	/**
  1543	 * v4l2_subdev_state_get_format() - Get pointer to a stream format
  1544	 * @state: subdevice state
  1545	 * @pad: pad id
  1546	 * @stream: stream id (optional argument)
  1547	 *
  1548	 * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
  1549	 * stream in the subdev state.
  1550	 *
  1551	 * For stream-unaware drivers the format for the corresponding pad is returned.
  1552	 * If the pad does not exist, NULL is returned.
  1553	 */
  1554	#define v4l2_subdev_state_get_format(state, pad, ...)         \
> 1555	        __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
> 1556	        (state, pad __VA_OPT__(,) __VA_ARGS__)
  1557	#define __v4l2_subdev_state_get_format_(state, pad)     \
  1558	        __v4l2_subdev_state_get_format(state, pad, 0)
  1559	#define __v4l2_subdev_state_get_format_stream(state, pad, stream)	\
  1560	        __v4l2_subdev_state_get_format(state, pad, stream)
  1561	struct v4l2_mbus_framefmt *
  1562	__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
  1563				       unsigned int pad, u32 stream);
  1564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

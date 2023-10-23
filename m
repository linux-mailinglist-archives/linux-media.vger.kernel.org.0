Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1D5B7D3A2A
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 16:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbjJWO61 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 10:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbjJWO6F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 10:58:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C59E83
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 07:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698073083; x=1729609083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4ECOjPwldP7iThnvfBzEmk3Ar22fcucKFXp0PfnRKKw=;
  b=P8GNdhexh4xwvxsVy4TIlFTQwGyOQMdN5SlQPxaHYofOnyLPd7ZUupNE
   AwdNrcszlWFJ6sdNn3p00jZgv5TKGNNfs1JozIOofMOtfGl8JqCyB9wAn
   hoxJkMWsM2/+KM4nJPLMcNAusNddvxmQV3TQgadU7cW+U+ygH3aWXQusE
   IPdRV7RtoUxRSLLdUblB9BNqRRijFg8ArS0WDbL8ZEZALHWkSdVwKBXPa
   p08uDtS5kq0t7qIwZ/oZyxiJ+Zop00ITfl4UokjbTXNvik70i+l1zr97t
   mA91icSEhF06njkZDmNf6tTumLCqwkPhNv3qmL+pHjXpOlBNb1PIJ2tdQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="417989504"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="417989504"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 07:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="707978084"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="707978084"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Oct 2023 07:57:57 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1quwNO-00070R-2F;
        Mon, 23 Oct 2023 14:57:54 +0000
Date:   Mon, 23 Oct 2023 22:57:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        jacopo.mondi@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH v2 1/6] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <202310232249.oyXxfG4x-lkp@intel.com>
References: <20231023123308.782592-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023123308.782592-2-sakari.ailus@linux.intel.com>
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
[also build test ERROR on rockchip/for-next sailus-media-tree/streams linus/master v6.6-rc7 next-20231023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-subdev-Also-return-pads-array-information-on-stream-functions/20231023-203626
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231023123308.782592-2-sakari.ailus%40linux.intel.com
patch subject: [PATCH v2 1/6] media: v4l: subdev: Also return pads array information on stream functions
config: csky-randconfig-002-20231023 (https://download.01.org/0day-ci/archive/20231023/202310232249.oyXxfG4x-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310232249.oyXxfG4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310232249.oyXxfG4x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/leds.h:12,
                    from drivers/media/v4l2-core/v4l2-subdev.c:13:
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'v4l2_subdev_state_get_stream_format':
>> drivers/media/v4l2-core/v4l2-subdev.c:1692:41: error: 'struct v4l2_subdev_state' has no member named 'sd'
    1692 |                 if (WARN_ON(pad >= state->sd->entity.num_pads))
         |                                         ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'v4l2_subdev_state_get_stream_crop':
   drivers/media/v4l2-core/v4l2-subdev.c:1726:41: error: 'struct v4l2_subdev_state' has no member named 'sd'
    1726 |                 if (WARN_ON(pad >= state->sd->entity.num_pads))
         |                                         ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'v4l2_subdev_state_get_stream_compose':
   drivers/media/v4l2-core/v4l2-subdev.c:1760:41: error: 'struct v4l2_subdev_state' has no member named 'sd'
    1760 |                 if (WARN_ON(pad >= state->sd->entity.num_pads))
         |                                         ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~


vim +1692 drivers/media/v4l2-core/v4l2-subdev.c

  1677	
  1678	struct v4l2_mbus_framefmt *
  1679	v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
  1680					    unsigned int pad, u32 stream)
  1681	{
  1682		struct v4l2_subdev_stream_configs *stream_configs;
  1683		unsigned int i;
  1684	
  1685		if (WARN_ON(!state))
  1686			return NULL;
  1687	
  1688		if (state->pads) {
  1689			if (stream)
  1690				return NULL;
  1691	
> 1692			if (WARN_ON(pad >= state->sd->entity.num_pads))
  1693				pad = 0;
  1694	
  1695			return &state->pads[pad].try_fmt;
  1696		}
  1697	
  1698		lockdep_assert_held(state->lock);
  1699	
  1700		stream_configs = &state->stream_configs;
  1701	
  1702		for (i = 0; i < stream_configs->num_configs; ++i) {
  1703			if (stream_configs->configs[i].pad == pad &&
  1704			    stream_configs->configs[i].stream == stream)
  1705				return &stream_configs->configs[i].fmt;
  1706		}
  1707	
  1708		return NULL;
  1709	}
  1710	EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_format);
  1711	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

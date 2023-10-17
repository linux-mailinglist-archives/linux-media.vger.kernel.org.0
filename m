Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B67D7CBA77
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 08:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234391AbjJQGBL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 02:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbjJQGBJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 02:01:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630B2A2
        for <linux-media@vger.kernel.org>; Mon, 16 Oct 2023 23:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697522467; x=1729058467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bApEhKYA3K6eSUJm08ZDInbpQrr1hMR6uoo1oj6XyOo=;
  b=K9YFzbPl76l5Rn77bk1ndn/tVxd6Aobdxh7BA7bUSGww+zaDK7X36Bs1
   MLqEfhZOcQILy1Y/x4cSzy884Rb7dZuqOPaO2wHkfdPe1ME6I0LZ2VBp3
   z0CXdk2QFa5fWUHp7WlJK3KSHpyvIZVYYKMDmnsl0k8WIk6J+ZNwr9CaC
   B5Dola8TT24rodia+a0B2TKcBskuMG6hwCPNKBHX3BkIht+8oAXQGwbjN
   9DukkA5+lG6/zlsgAbmTLJJglSYTe1A4zIGYteaYaV0UgsmbPGHQfZiV7
   6bUPCraSRjBX/weAeD3pTaFrmJZs+MhHQ6IVvVHcL2pWDat99dRrbIoxy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449929452"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="449929452"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 23:01:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="872410376"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="872410376"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2023 23:01:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qsd8X-000963-27;
        Tue, 17 Oct 2023 06:01:01 +0000
Date:   Tue, 17 Oct 2023 14:00:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        jacopo.mondi@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH 3/6] media: v4l: subdev: Rename sub-device state
 information access functions
Message-ID: <202310171359.UuOwm2bc-lkp@intel.com>
References: <20231013104424.404768-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013104424.404768-4-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231016]
[also build test WARNING on linus/master v6.6-rc6]
[cannot apply to media-tree/master rockchip/for-next sailus-media-tree/streams v6.6-rc6 v6.6-rc5 v6.6-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-subdev-Also-return-pads-array-information-on-stream-functions/20231017-120800
base:   next-20231016
patch link:    https://lore.kernel.org/r/20231013104424.404768-4-sakari.ailus%40linux.intel.com
patch subject: [PATCH 3/6] media: v4l: subdev: Rename sub-device state information access functions
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310171359.UuOwm2bc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171359.UuOwm2bc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171359.UuOwm2bc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ds90ub913.c: In function 'ub913_set_fmt':
   drivers/media/i2c/ds90ub913.c:427:15: error: implicit declaration of function 'v4l2_subdev_state_get_stream_format'; did you mean 'v4l2_subdev_state_get_opposite_stream_format'? [-Werror=implicit-function-declaration]
     427 |         fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_subdev_state_get_opposite_stream_format
>> drivers/media/i2c/ds90ub913.c:427:13: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     427 |         fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
         |             ^
   cc1: some warnings being treated as errors
--
   drivers/media/i2c/ds90ub953.c: In function 'ub953_set_fmt':
   drivers/media/i2c/ds90ub953.c:561:15: error: implicit declaration of function 'v4l2_subdev_state_get_stream_format'; did you mean 'v4l2_subdev_state_get_opposite_stream_format'? [-Werror=implicit-function-declaration]
     561 |         fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_subdev_state_get_opposite_stream_format
>> drivers/media/i2c/ds90ub953.c:561:13: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     561 |         fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
         |             ^
   cc1: some warnings being treated as errors
--
   drivers/media/i2c/ds90ub960.c: In function 'ub960_configure_ports_for_streaming':
   drivers/media/i2c/ds90ub960.c:2454:23: error: implicit declaration of function 'v4l2_subdev_state_get_stream_format'; did you mean 'v4l2_subdev_state_get_opposite_stream_format'? [-Werror=implicit-function-declaration]
    2454 |                 fmt = v4l2_subdev_state_get_stream_format(state,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       v4l2_subdev_state_get_opposite_stream_format
>> drivers/media/i2c/ds90ub960.c:2454:21: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2454 |                 fmt = v4l2_subdev_state_get_stream_format(state,
         |                     ^
   drivers/media/i2c/ds90ub960.c: In function 'ub960_get_frame_desc':
   drivers/media/i2c/ds90ub960.c:2845:29: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2845 |                         fmt = v4l2_subdev_state_get_stream_format(state, pad,
         |                             ^
   drivers/media/i2c/ds90ub960.c: In function 'ub960_set_fmt':
   drivers/media/i2c/ds90ub960.c:2894:13: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2894 |         fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
         |             ^
   cc1: some warnings being treated as errors


vim +427 drivers/media/i2c/ds90ub913.c

c158d0d4ff1530 Tomi Valkeinen 2023-06-19  403  
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  404  static int ub913_set_fmt(struct v4l2_subdev *sd,
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  405  			 struct v4l2_subdev_state *state,
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  406  			 struct v4l2_subdev_format *format)
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  407  {
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  408  	struct ub913_data *priv = sd_to_ub913(sd);
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  409  	struct v4l2_mbus_framefmt *fmt;
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  410  	const struct ub913_format_info *finfo;
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  411  
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  412  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  413  	    priv->enabled_source_streams)
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  414  		return -EBUSY;
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  415  
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  416  	/* Source format is fully defined by the sink format, so not settable */
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  417  	if (format->pad == UB913_PAD_SOURCE)
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  418  		return v4l2_subdev_get_fmt(sd, state, format);
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  419  
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  420  	finfo = ub913_find_format(format->format.code);
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  421  	if (!finfo) {
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  422  		finfo = &ub913_formats[0];
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  423  		format->format.code = finfo->incode;
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  424  	}
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  425  
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  426  	/* Set sink format */
c158d0d4ff1530 Tomi Valkeinen 2023-06-19 @427  	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  428  						  format->stream);
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  429  	if (!fmt)
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  430  		return -EINVAL;
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  431  
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  432  	*fmt = format->format;
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  433  
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  434  	/* Propagate to source format, and adjust the mbus code */
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  435  	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  436  							   format->stream);
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  437  	if (!fmt)
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  438  		return -EINVAL;
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  439  
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  440  	format->format.code = finfo->outcode;
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  441  
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  442  	*fmt = format->format;
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  443  
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  444  	return 0;
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  445  }
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  446  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 472A474757D
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 17:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbjGDPmE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 11:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjGDPmD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 11:42:03 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699641B2
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688485322; x=1720021322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ehT7/R7TuxT6ZCHpO2ONzeZRM/Mr7CJDl0oZHWutu84=;
  b=YJJpGHSYeCOwG1LxYHlUUjoClCypAFO/sMs7Uz3sjLsktyIVVw0k7IL/
   LbKTEeB3jSd7qhRmKuNZnSi7jTsEI9DsIqer4gnWTmIF9lg6qKfuwGJqv
   fQKtb6YtL2Y6Io8Y5EUHz1C6Dwmh9e5SjaBog10zPb3JQxcV1zqr1lcQu
   DqRYr6BaXC4iW5WyK9cez0nrQdpFxhqJjTDEkcxREkZ0I1FIGM2r5sZbA
   ySDBjhFODgm1XEU1kvV7Zjs2eHKU64PwARbRLVpfbXAyhbJPgH/8bEf7K
   Ce5KPyqsvCN/c2gS+b+2cR5qq95R26LKeAF3yyexug3K6lQsRUXYhS0/5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="363184029"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="363184029"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 08:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="696200111"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="696200111"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Jul 2023 08:41:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qGiA9-000IKx-2o;
        Tue, 04 Jul 2023 15:41:57 +0000
Date:   Tue, 4 Jul 2023 23:41:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: Re: [PATCH 5/5] media: i2c: imx219: Simplify code handling in s_fmt
Message-ID: <202307042337.lqiNqeJW-lkp@intel.com>
References: <20230704104057.149837-6-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704104057.149837-6-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.4 next-20230704]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-i2c-imx219-Rename-mbus-codes-array/20230704-184252
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230704104057.149837-6-jacopo.mondi%40ideasonboard.com
patch subject: [PATCH 5/5] media: i2c: imx219: Simplify code handling in s_fmt
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230704/202307042337.lqiNqeJW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307042337.lqiNqeJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307042337.lqiNqeJW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/imx219.c: In function 'imx219_set_pad_format':
>> drivers/media/i2c/imx219.c:755:22: warning: unused variable 'i' [-Wunused-variable]
     755 |         unsigned int i;
         |                      ^


vim +/i +755 drivers/media/i2c/imx219.c

1283b3b8f82b90 Dave Stevenson 2020-01-20  747  
1283b3b8f82b90 Dave Stevenson 2020-01-20  748  static int imx219_set_pad_format(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen 2021-06-10  749  				 struct v4l2_subdev_state *sd_state,
1283b3b8f82b90 Dave Stevenson 2020-01-20  750  				 struct v4l2_subdev_format *fmt)
1283b3b8f82b90 Dave Stevenson 2020-01-20  751  {
1283b3b8f82b90 Dave Stevenson 2020-01-20  752  	struct imx219 *imx219 = to_imx219(sd);
1283b3b8f82b90 Dave Stevenson 2020-01-20  753  	const struct imx219_mode *mode;
1283b3b8f82b90 Dave Stevenson 2020-01-20  754  	int exposure_max, exposure_def, hblank;
22da1d56e98215 Lad Prabhakar  2020-03-10 @755  	unsigned int i;
1283b3b8f82b90 Dave Stevenson 2020-01-20  756  
1283b3b8f82b90 Dave Stevenson 2020-01-20  757  	mode = v4l2_find_nearest_size(supported_modes,
1283b3b8f82b90 Dave Stevenson 2020-01-20  758  				      ARRAY_SIZE(supported_modes),
1283b3b8f82b90 Dave Stevenson 2020-01-20  759  				      width, height,
1283b3b8f82b90 Dave Stevenson 2020-01-20  760  				      fmt->format.width, fmt->format.height);
563219f153d5f7 Jacopo Mondi   2023-07-04  761  
7471d0495584f7 Jacopo Mondi   2023-07-04  762  	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
563219f153d5f7 Jacopo Mondi   2023-07-04  763  
563219f153d5f7 Jacopo Mondi   2023-07-04  764  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
1283b3b8f82b90 Dave Stevenson 2020-01-20  765  		imx219->mode = mode;
1283b3b8f82b90 Dave Stevenson 2020-01-20  766  		/* Update limits and set FPS to default */
1283b3b8f82b90 Dave Stevenson 2020-01-20  767  		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
1283b3b8f82b90 Dave Stevenson 2020-01-20  768  					 IMX219_VTS_MAX - mode->height, 1,
1283b3b8f82b90 Dave Stevenson 2020-01-20  769  					 mode->vts_def - mode->height);
1283b3b8f82b90 Dave Stevenson 2020-01-20  770  		__v4l2_ctrl_s_ctrl(imx219->vblank,
1283b3b8f82b90 Dave Stevenson 2020-01-20  771  				   mode->vts_def - mode->height);
1283b3b8f82b90 Dave Stevenson 2020-01-20  772  		/* Update max exposure while meeting expected vblanking */
1283b3b8f82b90 Dave Stevenson 2020-01-20  773  		exposure_max = mode->vts_def - 4;
1283b3b8f82b90 Dave Stevenson 2020-01-20  774  		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
1283b3b8f82b90 Dave Stevenson 2020-01-20  775  			exposure_max : IMX219_EXPOSURE_DEFAULT;
1283b3b8f82b90 Dave Stevenson 2020-01-20  776  		__v4l2_ctrl_modify_range(imx219->exposure,
1283b3b8f82b90 Dave Stevenson 2020-01-20  777  					 imx219->exposure->minimum,
1283b3b8f82b90 Dave Stevenson 2020-01-20  778  					 exposure_max, imx219->exposure->step,
1283b3b8f82b90 Dave Stevenson 2020-01-20  779  					 exposure_def);
1283b3b8f82b90 Dave Stevenson 2020-01-20  780  		/*
1283b3b8f82b90 Dave Stevenson 2020-01-20  781  		 * Currently PPL is fixed to IMX219_PPL_DEFAULT, so hblank
1283b3b8f82b90 Dave Stevenson 2020-01-20  782  		 * depends on mode->width only, and is not changeble in any
1283b3b8f82b90 Dave Stevenson 2020-01-20  783  		 * way other than changing the mode.
1283b3b8f82b90 Dave Stevenson 2020-01-20  784  		 */
1283b3b8f82b90 Dave Stevenson 2020-01-20  785  		hblank = IMX219_PPL_DEFAULT - mode->width;
1283b3b8f82b90 Dave Stevenson 2020-01-20  786  		__v4l2_ctrl_modify_range(imx219->hblank, hblank, hblank, 1,
1283b3b8f82b90 Dave Stevenson 2020-01-20  787  					 hblank);
1283b3b8f82b90 Dave Stevenson 2020-01-20  788  	}
1283b3b8f82b90 Dave Stevenson 2020-01-20  789  
563219f153d5f7 Jacopo Mondi   2023-07-04  790  	*v4l2_subdev_get_pad_format(sd, sd_state, 0) = fmt->format;
1283b3b8f82b90 Dave Stevenson 2020-01-20  791  
1283b3b8f82b90 Dave Stevenson 2020-01-20  792  	return 0;
1283b3b8f82b90 Dave Stevenson 2020-01-20  793  }
1283b3b8f82b90 Dave Stevenson 2020-01-20  794  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

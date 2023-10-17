Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 641B67CBECE
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 11:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234839AbjJQJSd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 05:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343518AbjJQJSS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 05:18:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D6CF1
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 02:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697534296; x=1729070296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8qNZyg8MQxFEAeC3CWlx0Lj1zmmdVpGxYpOFT74a7rQ=;
  b=ge7Ntz8qcM1oCMi4uodYOcOiA1s7bOTn8pFJCnTQmVNPYVjC6S6fUS6i
   OXKanXGaSzXHUCzAz0gaiUxKoVP2AdEefM8RyEBEeohiBERHNxINtNPgq
   O6GBYrrA8M9tYDVNkuLa04JoUH5nXORkA4cI+piw0fLh4qC1HPvfl7/kX
   /xSWRmnJ1yk0eF72VYZ0+kw7cQsfXWKRp2AubHJWHKiFLcix4OgP7wuw3
   uVYJ8Mhj5qGLyDkHb673Bxg5HDp30r/6319nujlN1PvT4i/jVvoWqdJ+S
   rk32gRFJcJG1dX6au7JPjwpHCxlrFaJW53hXeQTMsR0y+U0XJ9EyUHiuq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="376107722"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="376107722"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 02:18:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="791175270"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="791175270"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Oct 2023 02:18:12 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qsgDK-0009Ob-1Y;
        Tue, 17 Oct 2023 09:18:10 +0000
Date:   Tue, 17 Oct 2023 17:17:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        jacopo.mondi@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH 5/6] media: v4l: subdev: Switch to stream-aware state
 functions
Message-ID: <202310171702.b4KH205d-lkp@intel.com>
References: <20231013104424.404768-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013104424.404768-6-sakari.ailus@linux.intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231016]
[cannot apply to media-tree/master rockchip/for-next sailus-media-tree/streams v6.6-rc6 v6.6-rc5 v6.6-rc4 linus/master v6.6-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-subdev-Also-return-pads-array-information-on-stream-functions/20231017-120800
base:   next-20231016
patch link:    https://lore.kernel.org/r/20231013104424.404768-6-sakari.ailus%40linux.intel.com
patch subject: [PATCH 5/6] media: v4l: subdev: Switch to stream-aware state functions
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310171702.b4KH205d-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171702.b4KH205d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171702.b4KH205d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx-ic-prp.c: In function '__prp_get_fmt':
>> drivers/staging/media/imx/imx-ic-prp.c:85:29: warning: unused variable 'ic_priv' [-Wunused-variable]
      85 |         struct imx_ic_priv *ic_priv = priv->ic_priv;
         |                             ^~~~~~~
--
   drivers/staging/media/imx/imx-ic-prpencvf.c: In function '__prp_get_fmt':
>> drivers/staging/media/imx/imx-ic-prpencvf.c:793:29: warning: unused variable 'ic_priv' [-Wunused-variable]
     793 |         struct imx_ic_priv *ic_priv = priv->ic_priv;
         |                             ^~~~~~~
--
   drivers/media/platform/ti/cal/cal-camerarx.c: In function 'cal_camerarx_sd_enum_mbus_code':
>> drivers/media/platform/ti/cal/cal-camerarx.c:624:30: warning: unused variable 'phy' [-Wunused-variable]
     624 |         struct cal_camerarx *phy = to_cal_camerarx(sd);
         |                              ^~~


vim +/ic_priv +85 drivers/staging/media/imx/imx-ic-prp.c

f0d9c8924e2c33 Steve Longerbeam 2017-06-07  80  
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  81  static struct v4l2_mbus_framefmt *
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  82  __prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_state *sd_state,
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  83  	      unsigned int pad, enum v4l2_subdev_format_whence which)
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  84  {
f0d9c8924e2c33 Steve Longerbeam 2017-06-07 @85  	struct imx_ic_priv *ic_priv = priv->ic_priv;
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  86  
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  87  	if (which == V4L2_SUBDEV_FORMAT_TRY)
95c1b021ae1138 Sakari Ailus     2023-10-13  88  		return v4l2_subdev_get_format(sd_state, pad, 0);
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  89  	else
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  90  		return &priv->format_mbus;
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  91  }
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  92  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

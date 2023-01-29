Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34D9767FBF5
	for <lists+linux-media@lfdr.de>; Sun, 29 Jan 2023 01:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbjA2AhI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 19:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjA2AhH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 19:37:07 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794961E1DB
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 16:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674952625; x=1706488625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ETG+RebHbnzPrGXQLj8pANSvLEAPGkpin0UbYbN0fpA=;
  b=UWWEnr0szUur73Dc5WQrxkV5AxKyY75Z7acnBAo6r1NNwccZPdbHBog0
   hYGu8ITkOcjB+SD+ki0s3JSHbch5v2YDioKCl9WEvBIDblHT62DKYYqka
   HyBVk7luvg+sGlcNinZQFCcKdKFLq7h9uAN1FLKuetEAKri4g9kVegCYn
   J/ayO9gWOoGlvtsdCqvxtY3iJl/sYTuMCD9QTmKoamLeQg530V9PVDlke
   NO7PP96C4B75LA38zYrAHK7Oldk1HC9vRQ4eo+LHqfu8ixX0J2eqZZ6zT
   1Nmef880klhf7Sfxk5AflYcFDhiqRar+y/dBnaifVMSWsGuQ1GcVs8/A6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="310970588"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="310970588"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 16:37:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="657019806"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="657019806"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Jan 2023 16:37:00 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pLvgp-0001Gk-2c;
        Sun, 29 Jan 2023 00:36:59 +0000
Date:   Sun, 29 Jan 2023 08:36:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 30/57] media: atomisp: ov2680: Rework flip ctrls
Message-ID: <202301290857.L5301E4z-lkp@intel.com>
References: <20230123125205.622152-31-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-31-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on sailus-media-tree/streams linus/master v6.2-rc5 next-20230127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-atomisp-fix-videobuf2-Kconfig-depenendency/20230123-205911
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230123125205.622152-31-hdegoede%40redhat.com
patch subject: [PATCH 30/57] media: atomisp: ov2680: Rework flip ctrls
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230129/202301290857.L5301E4z-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/94a8aa6a6e07cfbfebce3e18938f0ec11e752b04
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hans-de-Goede/media-atomisp-fix-videobuf2-Kconfig-depenendency/20230123-205911
        git checkout 94a8aa6a6e07cfbfebce3e18938f0ec11e752b04
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/ drivers/staging/media/atomisp/i2c/ kernel/sched/ net/mptcp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:555:16: warning: variable 'fmt' is uninitialized when used here [-Wuninitialized]
                   format->pad, fmt);
                                ^~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                ^~~~~~~~~~~
   include/linux/dynamic_debug.h:273:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:548:32: note: initialize the variable 'fmt' to silence this warning
           struct v4l2_mbus_framefmt *fmt;
                                         ^
                                          = NULL
   1 warning generated.


vim +/fmt +555 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c

94a8aa6a6e07cf Hans de Goede         2023-01-23  541  
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  542  static int ov2680_set_fmt(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  543  			  struct v4l2_subdev_state *sd_state,
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  544  			  struct v4l2_subdev_format *format)
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  545  {
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  546  	struct ov2680_device *dev = to_ov2680_sensor(sd);
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  547  	struct i2c_client *client = v4l2_get_subdevdata(sd);
94a8aa6a6e07cf Hans de Goede         2023-01-23  548  	struct v4l2_mbus_framefmt *fmt;
b7573661282c92 Mauro Carvalho Chehab 2021-11-03  549  	struct ov2680_resolution *res;
29400b5063db69 Hans de Goede         2021-11-07  550  	int vts, ret = 0;
bdfe0beb95eebc Mauro Carvalho Chehab 2020-04-19  551  
5589ea0745ef4f Mauro Carvalho Chehab 2020-05-19  552  	dev_dbg(&client->dev, "%s: %s: pad: %d, fmt: %p\n",
5589ea0745ef4f Mauro Carvalho Chehab 2020-05-19  553  		__func__,
5589ea0745ef4f Mauro Carvalho Chehab 2020-05-19  554  		(format->which == V4L2_SUBDEV_FORMAT_TRY) ? "try" : "set",
5589ea0745ef4f Mauro Carvalho Chehab 2020-05-19 @555  		format->pad, fmt);
5589ea0745ef4f Mauro Carvalho Chehab 2020-05-19  556  
94a8aa6a6e07cf Hans de Goede         2023-01-23  557  	res = v4l2_find_nearest_size(ov2680_res_preview, ARRAY_SIZE(ov2680_res_preview),
94a8aa6a6e07cf Hans de Goede         2023-01-23  558  				     width, height,
94a8aa6a6e07cf Hans de Goede         2023-01-23  559  				     format->format.width, format->format.height);
b7573661282c92 Mauro Carvalho Chehab 2021-11-03  560  	if (!res)
b821cea597f84e Hans de Goede         2021-11-07  561  		res = &ov2680_res_preview[N_RES_PREVIEW - 1];
b7573661282c92 Mauro Carvalho Chehab 2021-11-03  562  
94a8aa6a6e07cf Hans de Goede         2023-01-23  563  	fmt = __ov2680_get_pad_format(dev, sd_state, format->pad, format->which);
94a8aa6a6e07cf Hans de Goede         2023-01-23  564  	ov2680_fill_format(dev, fmt, res->width, res->height);
94a8aa6a6e07cf Hans de Goede         2023-01-23  565  
94a8aa6a6e07cf Hans de Goede         2023-01-23  566  	format->format = *fmt;
b7573661282c92 Mauro Carvalho Chehab 2021-11-03  567  
94a8aa6a6e07cf Hans de Goede         2023-01-23  568  	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  569  		return 0;
b7573661282c92 Mauro Carvalho Chehab 2021-11-03  570  
b7573661282c92 Mauro Carvalho Chehab 2021-11-03  571  	dev_dbg(&client->dev, "%s: %dx%d\n",
b7573661282c92 Mauro Carvalho Chehab 2021-11-03  572  		__func__, fmt->width, fmt->height);
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  573  
44a11920ac39fe Hans de Goede         2022-08-13  574  	mutex_lock(&dev->input_lock);
44a11920ac39fe Hans de Goede         2022-08-13  575  
12350633a8dbdc Hans de Goede         2021-11-07  576  	/* s_power has not been called yet for std v4l2 clients (camorama) */
eda1310b4087d6 Mauro Carvalho Chehab 2020-05-19  577  	power_up(sd);
b7573661282c92 Mauro Carvalho Chehab 2021-11-03  578  	ret = ov2680_write_reg_array(client, dev->res->regs);
cbd5b438f8c2b5 Hans de Goede         2022-08-13  579  	if (ret) {
5589ea0745ef4f Mauro Carvalho Chehab 2020-05-19  580  		dev_err(&client->dev,
5589ea0745ef4f Mauro Carvalho Chehab 2020-05-19  581  			"ov2680 write resolution register err: %d\n", ret);
cbd5b438f8c2b5 Hans de Goede         2022-08-13  582  		goto err;
cbd5b438f8c2b5 Hans de Goede         2022-08-13  583  	}
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  584  
22f2cac62dea73 Mauro Carvalho Chehab 2021-11-10  585  	vts = dev->res->lines_per_frame;
22f2cac62dea73 Mauro Carvalho Chehab 2021-11-10  586  
29400b5063db69 Hans de Goede         2021-11-07  587  	/* If necessary increase the VTS to match exposure + MARGIN */
29400b5063db69 Hans de Goede         2021-11-07  588  	if (dev->exposure > vts - OV2680_INTEGRATION_TIME_MARGIN)
29400b5063db69 Hans de Goede         2021-11-07  589  		vts = dev->exposure + OV2680_INTEGRATION_TIME_MARGIN;
29400b5063db69 Hans de Goede         2021-11-07  590  
bf46430efae7c2 Hans de Goede         2023-01-23  591  	ret = ovxxxx_write_reg16(client, OV2680_TIMING_VTS_H, vts);
cbd5b438f8c2b5 Hans de Goede         2022-08-13  592  	if (ret) {
29400b5063db69 Hans de Goede         2021-11-07  593  		dev_err(&client->dev, "ov2680 write vts err: %d\n", ret);
cbd5b438f8c2b5 Hans de Goede         2022-08-13  594  		goto err;
cbd5b438f8c2b5 Hans de Goede         2022-08-13  595  	}
29400b5063db69 Hans de Goede         2021-11-07  596  
f50559f0c9b43b Deepak R Varma        2021-04-28  597  	/*
f50559f0c9b43b Deepak R Varma        2021-04-28  598  	 * recall flip functions to avoid flip registers
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  599  	 * were overridden by default setting
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  600  	 */
94a8aa6a6e07cf Hans de Goede         2023-01-23  601  	ret = __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
94a8aa6a6e07cf Hans de Goede         2023-01-23  602  	if (ret < 0)
94a8aa6a6e07cf Hans de Goede         2023-01-23  603  		goto err;
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  604  
adea153b4f6537 Hans de Goede         2022-08-13  605  	dev->res = res;
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  606  err:
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  607  	mutex_unlock(&dev->input_lock);
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  608  	return ret;
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  609  }
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  610  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

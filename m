Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 173FD539A39
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 01:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348756AbiEaXyn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 May 2022 19:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346644AbiEaXym (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 May 2022 19:54:42 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A60429CF62
        for <linux-media@vger.kernel.org>; Tue, 31 May 2022 16:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654041281; x=1685577281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UJjCxL3vqh+P7R7LJwVPNXBXCjd+BwVohOyH2v9zvlU=;
  b=BtyAE3HR77xmSyNpHla+kMOIGWtXUwGHNspAD8+TZcfQkrvGv8Ubq0Aq
   /Hi95m0ATKiQGkVQjNAhgw2bqWU8j+lHacVEW/ycfKAaOdHazvQoJkK0Q
   zmTqoGt/i/2/hoPZPqOj+rj8k0Xt00rAz5q7J9CGZoDZhm+nfgfV4u0qE
   n2It1Dz6jTvtf9iL+eoJW14K+VVLTSOYokcu6AecXLa9noCijRl9TtoqX
   aXIpfm4+busDlLGLBd6lUJAL0My3NeDTObzYiqMTJAA+yogXnR3GS5MyU
   dw8xA4TUJiiU4+B1vsLVtBlL1OkHwNYEJEjWuzvEe3uhsro9D72EANdvL
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="338465446"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="338465446"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 16:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="904200739"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 May 2022 16:54:33 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nwBh2-0003Fi-Ox;
        Tue, 31 May 2022 23:54:32 +0000
Date:   Wed, 1 Jun 2022 07:53:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] media: s5k4ecgx: Switch to GPIO descriptors
Message-ID: <202206010746.udUX5CYK-lkp@intel.com>
References: <20220531084546.67737-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531084546.67737-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18 next-20220531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/media-s5k4ecgx-Switch-to-GPIO-descriptors/20220531-164948
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20220601/202206010746.udUX5CYK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/d6a5013d9dd546a9c9d7ed3714e861f7593b1635
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linus-Walleij/media-s5k4ecgx-Switch-to-GPIO-descriptors/20220531-164948
        git checkout d6a5013d9dd546a9c9d7ed3714e861f7593b1635
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/i2c/s5k4ecgx.c: In function 's5k4ecgx_probe':
>> drivers/media/i2c/s5k4ecgx.c:897:45: warning: missing terminating " character
     897 |         gpiod_set_consumer_name(priv->stby, "S5K4ECGX_STBY);
         |                                             ^
   drivers/media/i2c/s5k4ecgx.c:897:45: error: missing terminating " character
     897 |         gpiod_set_consumer_name(priv->stby, "S5K4ECGX_STBY);
         |                                             ^~~~~~~~~~~~~~~~
   drivers/media/i2c/s5k4ecgx.c:898:76: error: expected ')' before ';' token
     898 |         priv->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
         |                                                                            ^
         |                                                                            )
   drivers/media/i2c/s5k4ecgx.c:897:32: note: to match this '('
     897 |         gpiod_set_consumer_name(priv->stby, "S5K4ECGX_STBY);
         |                                ^
   drivers/media/i2c/s5k4ecgx.c:898:21: error: passing argument 2 of 'gpiod_set_consumer_name' from incompatible pointer type [-Werror=incompatible-pointer-types]
     898 |         priv->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
         |         ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     struct gpio_desc *
   In file included from drivers/media/i2c/s5k4ecgx.c:18:
   include/linux/gpio/consumer.h:166:65: note: expected 'const char *' but argument is of type 'struct gpio_desc *'
     166 | int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
         |                                                     ~~~~~~~~~~~~^~~~
   drivers/media/i2c/s5k4ecgx.c:927:20: error: expected ';' before '}' token
     927 |         return ret;
         |                    ^
         |                    ;
     928 | }
         | ~                   
   drivers/media/i2c/s5k4ecgx.c:895:17: error: label 'out_err' used but not defined
     895 |                 goto out_err;
         |                 ^~~~
>> drivers/media/i2c/s5k4ecgx.c:860:18: warning: unused variable 'i' [-Wunused-variable]
     860 |         int ret, i;
         |                  ^
   drivers/media/i2c/s5k4ecgx.c:928:1: error: control reaches end of non-void function [-Werror=return-type]
     928 | }
         | ^
   At top level:
   drivers/media/i2c/s5k4ecgx.c:827:12: warning: 's5k4ecgx_init_v4l2_ctrls' defined but not used [-Wunused-function]
     827 | static int s5k4ecgx_init_v4l2_ctrls(struct s5k4ecgx *priv)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +897 drivers/media/i2c/s5k4ecgx.c

   853	
   854	static int s5k4ecgx_probe(struct i2c_client *client,
   855				  const struct i2c_device_id *id)
   856	{
   857		struct s5k4ecgx_platform_data *pdata = client->dev.platform_data;
   858		struct v4l2_subdev *sd;
   859		struct s5k4ecgx *priv;
 > 860		int ret, i;
   861	
   862		if (pdata == NULL) {
   863			dev_err(&client->dev, "platform data is missing!\n");
   864			return -EINVAL;
   865		}
   866	
   867		priv = devm_kzalloc(&client->dev, sizeof(struct s5k4ecgx), GFP_KERNEL);
   868		if (!priv)
   869			return -ENOMEM;
   870	
   871		mutex_init(&priv->lock);
   872		priv->streaming = 0;
   873	
   874		sd = &priv->sd;
   875		/* Registering subdev */
   876		v4l2_i2c_subdev_init(sd, client, &s5k4ecgx_ops);
   877		/* Static name; NEVER use in new drivers! */
   878		strscpy(sd->name, S5K4ECGX_DRIVER_NAME, sizeof(sd->name));
   879	
   880		sd->internal_ops = &s5k4ecgx_subdev_internal_ops;
   881		/* Support v4l2 sub-device user space API */
   882		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
   883	
   884		priv->pad.flags = MEDIA_PAD_FL_SOURCE;
   885		sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
   886		ret = media_entity_pads_init(&sd->entity, 1, &priv->pad);
   887		if (ret)
   888			return ret;
   889	
   890		/* Request GPIO lines asserted */
   891		priv->stby = devm_gpiod_get(&client->dev, "standby", GPIOD_OUT_HIGH);
   892		if (IS_ERR(priv->stby)) {
   893			v4l2_err(sd, "failed to request gpio S5K4ECGX_STBY");
   894			ret = PTR_ERR(priv->stby);
   895			goto out_err;
   896		}
 > 897		gpiod_set_consumer_name(priv->stby, "S5K4ECGX_STBY);
   898		priv->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
   899		if (IS_ERR(priv->reset)) {
   900			v4l2_err(sd, "failed to request gpio S5K4ECGX_RST");
   901			ret = PTR_ERR(priv->reset);
   902			goto out_err;
   903		}
   904		gpiod_set_consumer_name(priv->reset, "S5K4ECGX_RST");
   905	
   906		for (i = 0; i < S5K4ECGX_NUM_SUPPLIES; i++)
   907			priv->supplies[i].supply = s5k4ecgx_supply_names[i];
   908	
   909		ret = devm_regulator_bulk_get(&client->dev, S5K4ECGX_NUM_SUPPLIES,
   910					 priv->supplies);
   911		if (ret) {
   912			dev_err(&client->dev, "Failed to get regulators\n");
   913			goto out_err;
   914		}
   915		ret = s5k4ecgx_init_v4l2_ctrls(priv);
   916		if (ret)
   917			goto out_err;
   918	
   919		priv->curr_pixfmt = &s5k4ecgx_formats[0];
   920		priv->curr_frmsize = &s5k4ecgx_prev_sizes[0];
   921	
   922		return 0;
   923	
   924	out_err:
   925		media_entity_cleanup(&priv->sd.entity);
   926	
   927		return ret;
   928	}
   929	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

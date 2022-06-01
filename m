Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E72453A4DA
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 14:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343814AbiFAMYh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jun 2022 08:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352901AbiFAMY0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jun 2022 08:24:26 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6459A80201
        for <linux-media@vger.kernel.org>; Wed,  1 Jun 2022 05:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654086250; x=1685622250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PrQDsGlYut5N5u5rWs8P/yPx85AZGxE98etCbLfpanM=;
  b=kXc88qvNT0aEN7gb4aEBtOpy2HD1gjxMYAoOgM/I+K8eFuwqyuNd6Ukp
   1HIvQxU1GKVEqIUHTzXtlPPD8JyhsA3lkH1qRkcrfE7kF8SWxF70pYUXb
   pIwfLVaFb3+Zh8tLnVBQeIjDqcO8YkmtwukFnaNvZd/jDcVQiWrWkdaON
   cMN+73Pw2tUYctw3NPVirairru2oq4MtU9Bo3goFbOEREhd55NUOhHHYa
   ZQdwf1bc/WuQfJclaYu1b2G8369acND5KLSvOJE/lr6JFtWWDwIGfL/jP
   HAM6gKFpW4SilCnRlB1YfMwoU+thZo3qZ4pCYSyJx3ng/9dlE76jrjMXE
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="263204894"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="263204894"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 05:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="581557602"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Jun 2022 05:24:00 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nwNOK-0003x6-0d;
        Wed, 01 Jun 2022 12:24:00 +0000
Date:   Wed, 1 Jun 2022 20:23:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v2] media: s5k4ecgx: Switch to GPIO descriptors
Message-ID: <202206012037.EwUL1zSZ-lkp@intel.com>
References: <20220601094100.4928-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601094100.4928-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on v5.18 next-20220601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/media-s5k4ecgx-Switch-to-GPIO-descriptors/20220601-174300
base:   git://linuxtv.org/media_tree.git master
config: hexagon-randconfig-r041-20220531 (https://download.01.org/0day-ci/archive/20220601/202206012037.EwUL1zSZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3814f4960184762bff97b188607a2b0042f3d6ba
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linus-Walleij/media-s5k4ecgx-Switch-to-GPIO-descriptors/20220601-174300
        git checkout 3814f4960184762bff97b188607a2b0042f3d6ba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/media/i2c/s5k4ecgx.c:897:38: warning: missing terminating '"' character [-Winvalid-pp-token]
           gpiod_set_consumer_name(priv->stby, "S5K4ECGX_STBY);
                                               ^
>> drivers/media/i2c/s5k4ecgx.c:897:38: error: expected expression
>> drivers/media/i2c/s5k4ecgx.c:947:26: error: use of undeclared identifier 's5k4ecgx_id'
   MODULE_DEVICE_TABLE(i2c, s5k4ecgx_id);
                            ^
>> drivers/media/i2c/s5k4ecgx.c:954:12: error: use of undeclared identifier 's5k4ecgx_remove'
           .remove = s5k4ecgx_remove,
                     ^
   drivers/media/i2c/s5k4ecgx.c:955:14: error: use of undeclared identifier 's5k4ecgx_id'
           .id_table = s5k4ecgx_id,
                       ^
>> drivers/media/i2c/s5k4ecgx.c:958:1: error: function definition is not allowed here
   module_i2c_driver(v4l2_i2c_driver);
   ^
   include/linux/i2c.h:950:2: note: expanded from macro 'module_i2c_driver'
           module_driver(__i2c_driver, i2c_add_driver, \
           ^
   include/linux/device/driver.h:260:41: note: expanded from macro 'module_driver'
   static int __init __driver##_init(void) \
                                           ^
>> drivers/media/i2c/s5k4ecgx.c:958:1: error: function definition is not allowed here
   include/linux/i2c.h:950:2: note: expanded from macro 'module_i2c_driver'
           module_driver(__i2c_driver, i2c_add_driver, \
           ^
   include/linux/device/driver.h:263:3: note: expanded from macro 'module_driver'
   } \
     ^
   include/linux/module.h:132:2: note: expanded from macro '\
   module_init'
           { return initfn; }                                      \
           ^
>> drivers/media/i2c/s5k4ecgx.c:958:1: error: function definition is not allowed here
   include/linux/i2c.h:950:2: note: expanded from macro 'module_i2c_driver'
           module_driver(__i2c_driver, i2c_add_driver, \
           ^
   include/linux/device/driver.h:265:42: note: expanded from macro 'module_driver'
   static void __exit __driver##_exit(void) \
                                            ^
>> drivers/media/i2c/s5k4ecgx.c:958:1: error: function definition is not allowed here
   include/linux/i2c.h:950:2: note: expanded from macro 'module_i2c_driver'
           module_driver(__i2c_driver, i2c_add_driver, \
           ^
   include/linux/device/driver.h:268:3: note: expanded from macro 'module_driver'
   } \
     ^
   include/linux/module.h:140:2: note: expanded from macro '\
   module_exit'
           { return exitfn; }                                      \
           ^
>> drivers/media/i2c/s5k4ecgx.c:964:36: error: expected '}'
   MODULE_FIRMWARE(S5K4ECGX_FIRMWARE);
                                      ^
   drivers/media/i2c/s5k4ecgx.c:856:1: note: to match this '{'
   {
   ^
   drivers/media/i2c/s5k4ecgx.c:947:1: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
   MODULE_DEVICE_TABLE(i2c, s5k4ecgx_id);
   ^
   include/linux/module.h:244:21: note: expanded from macro 'MODULE_DEVICE_TABLE'
   extern typeof(name) __mod_##type##__##name##_device_table               \
                       ^
   <scratch space>:94:1: note: expanded from here
   __mod_i2c__s5k4ecgx_id_device_table
   ^
>> drivers/media/i2c/s5k4ecgx.c:895:8: error: use of undeclared label 'out_err'
                   goto out_err;
                        ^
   2 warnings and 10 errors generated.


vim +897 drivers/media/i2c/s5k4ecgx.c

   853	
   854	static int s5k4ecgx_probe(struct i2c_client *client,
   855				  const struct i2c_device_id *id)
   856	{
   857		struct s5k4ecgx_platform_data *pdata = client->dev.platform_data;
   858		struct v4l2_subdev *sd;
   859		struct s5k4ecgx *priv;
   860		int ret, i;
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
 > 895			goto out_err;
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
   930	static int s5k4ecgx_remove(struct i2c_client *client)
   931	{
   932		struct v4l2_subdev *sd = i2c_get_clientdata(client);
   933		struct s5k4ecgx *priv = to_s5k4ecgx(sd);
   934	
   935		mutex_destroy(&priv->lock);
   936		v4l2_device_unregister_subdev(sd);
   937		v4l2_ctrl_handler_free(&priv->handler);
   938		media_entity_cleanup(&sd->entity);
   939	
   940		return 0;
   941	}
   942	
   943	static const struct i2c_device_id s5k4ecgx_id[] = {
   944		{ S5K4ECGX_DRIVER_NAME, 0 },
   945		{}
   946	};
 > 947	MODULE_DEVICE_TABLE(i2c, s5k4ecgx_id);
   948	
   949	static struct i2c_driver v4l2_i2c_driver = {
   950		.driver = {
   951			.name = S5K4ECGX_DRIVER_NAME,
   952		},
   953		.probe = s5k4ecgx_probe,
 > 954		.remove = s5k4ecgx_remove,
   955		.id_table = s5k4ecgx_id,
   956	};
   957	
 > 958	module_i2c_driver(v4l2_i2c_driver);
   959	
   960	MODULE_DESCRIPTION("Samsung S5K4ECGX 5MP SOC camera");
   961	MODULE_AUTHOR("Sangwook Lee <sangwook.lee@linaro.org>");
   962	MODULE_AUTHOR("Seok-Young Jang <quartz.jang@samsung.com>");
   963	MODULE_LICENSE("GPL");
 > 964	MODULE_FIRMWARE(S5K4ECGX_FIRMWARE);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

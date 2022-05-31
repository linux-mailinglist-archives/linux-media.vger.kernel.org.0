Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB6A65392D6
	for <lists+linux-media@lfdr.de>; Tue, 31 May 2022 15:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245022AbiEaN41 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 May 2022 09:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345104AbiEaN4X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 May 2022 09:56:23 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653F9AE68
        for <linux-media@vger.kernel.org>; Tue, 31 May 2022 06:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654005376; x=1685541376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ryjw+Wdkq1IqWZaPmId2Yr1FTb9LVvlGoE5/LYc0rW4=;
  b=arJN9ZQylooGrRj/FQIZY3gUao38KJaIEIyWBVNQ6c88HkCBM0B9TRE+
   WVX6CYAdCnsdamvsHyo3HCy/4mrFfchReKjdnSrrFZusv49ao+HRDHnsC
   0xIBLDeovLBCWfwClenTCLtfHaGDFv8RNbjCYWcsx73Z5ACt6b1f2M5fB
   Bhl7IpHTrAG0gEG1BMBZunp3Bzv+t8Ik+A8tjqviXp40+UCS4z+nf509D
   VGuR/Vuwl86VF8VqMB35cxhRMisfqnvMe+2kXIsJaM5HfY6+O5BuZ2/4Z
   BOHjdz3qAfdrZH8fE47GQLjrgWf4vytnisHp63bSZ56F1eVsEywt1451W
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="255128986"
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; 
   d="scan'208";a="255128986"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 06:56:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; 
   d="scan'208";a="903978552"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 May 2022 06:56:14 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nw2M1-0002lU-CW;
        Tue, 31 May 2022 13:56:13 +0000
Date:   Tue, 31 May 2022 21:55:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] media: s5k4ecgx: Switch to GPIO descriptors
Message-ID: <202205312157.9EPLfsUw-lkp@intel.com>
References: <20220531084546.67737-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531084546.67737-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on v5.18 next-20220531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/media-s5k4ecgx-Switch-to-GPIO-descriptors/20220531-164948
base:   git://linuxtv.org/media_tree.git master
config: arm-randconfig-c002-20220531 (https://download.01.org/0day-ci/archive/20220531/202205312157.9EPLfsUw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/d6a5013d9dd546a9c9d7ed3714e861f7593b1635
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linus-Walleij/media-s5k4ecgx-Switch-to-GPIO-descriptors/20220531-164948
        git checkout d6a5013d9dd546a9c9d7ed3714e861f7593b1635
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/media/i2c/s5k4ecgx.c:897:38: warning: missing terminating '"' character [-Winvalid-pp-token]
           gpiod_set_consumer_name(priv->stby, "S5K4ECGX_STBY);
                                               ^
>> drivers/media/i2c/s5k4ecgx.c:897:38: error: expected expression
>> drivers/media/i2c/s5k4ecgx.c:954:12: error: use of undeclared identifier 's5k4ecgx_remove'
           .remove = s5k4ecgx_remove,
                     ^
>> drivers/media/i2c/s5k4ecgx.c:955:14: error: use of undeclared identifier 's5k4ecgx_id'
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
>> drivers/media/i2c/s5k4ecgx.c:958:1: error: use of undeclared identifier 'v4l2_i2c_driver_init'
   include/linux/i2c.h:950:2: note: expanded from macro 'module_i2c_driver'
           module_driver(__i2c_driver, i2c_add_driver, \
           ^
   include/linux/device/driver.h:264:13: note: expanded from macro 'module_driver'
   module_init(__driver##_init); \
               ^
   <scratch space>:73:1: note: expanded from here
   v4l2_i2c_driver_init
   ^
>> drivers/media/i2c/s5k4ecgx.c:958:1: error: function definition is not allowed here
   include/linux/i2c.h:950:2: note: expanded from macro 'module_i2c_driver'
           module_driver(__i2c_driver, i2c_add_driver, \
           ^
   include/linux/device/driver.h:265:42: note: expanded from macro 'module_driver'
   static void __exit __driver##_exit(void) \
                                            ^
>> drivers/media/i2c/s5k4ecgx.c:958:1: error: use of undeclared identifier 'v4l2_i2c_driver_exit'; did you mean 'v4l2_i2c_driver'?
   include/linux/i2c.h:950:2: note: expanded from macro 'module_i2c_driver'
           module_driver(__i2c_driver, i2c_add_driver, \
           ^
   include/linux/device/driver.h:269:13: note: expanded from macro 'module_driver'
   module_exit(__driver##_exit);
               ^
   <scratch space>:89:1: note: expanded from here
   v4l2_i2c_driver_exit
   ^
   drivers/media/i2c/s5k4ecgx.c:949:26: note: 'v4l2_i2c_driver' declared here
   static struct i2c_driver v4l2_i2c_driver = {
                            ^
>> drivers/media/i2c/s5k4ecgx.c:958:1: error: initializing 'exitcall_t' (aka 'void (*)(void)') with an expression of incompatible type 'struct i2c_driver'
   module_i2c_driver(v4l2_i2c_driver);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:950:2: note: expanded from macro 'module_i2c_driver'
           module_driver(__i2c_driver, i2c_add_driver, \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:268:3: note: expanded from macro 'module_driver'
   } \
     ^
   include/linux/module.h:100:24: note: expanded from macro '\
   module_exit'
   #define module_exit(x)  __exitcall(x);
                           ^          ~
   include/linux/init.h:299:20: note: expanded from macro '__exitcall'
           static exitcall_t __exitcall_##fn __exit_call = fn
                             ^                             ~~
   <scratch space>:90:1: note: expanded from here
   __exitcall_v4l2_i2c_driver_exit
   ^
>> drivers/media/i2c/s5k4ecgx.c:964:36: error: expected '}'
   MODULE_FIRMWARE(S5K4ECGX_FIRMWARE);
                                      ^
   drivers/media/i2c/s5k4ecgx.c:856:1: note: to match this '{'
   {
   ^
>> drivers/media/i2c/s5k4ecgx.c:949:26: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
   static struct i2c_driver v4l2_i2c_driver = {
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
   947	MODULE_DEVICE_TABLE(i2c, s5k4ecgx_id);
   948	
 > 949	static struct i2c_driver v4l2_i2c_driver = {
   950		.driver = {
   951			.name = S5K4ECGX_DRIVER_NAME,
   952		},
   953		.probe = s5k4ecgx_probe,
 > 954		.remove = s5k4ecgx_remove,
 > 955		.id_table = s5k4ecgx_id,
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

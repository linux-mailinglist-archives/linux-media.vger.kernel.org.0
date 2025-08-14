Return-Path: <linux-media+bounces-39938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEACB26DC8
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 19:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C32546221B7
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 17:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3E4309DC5;
	Thu, 14 Aug 2025 17:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HD12aJ5/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DD425FA24
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 17:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755192955; cv=none; b=tsl1l+ooCpJUv2AsxKs0S2tKcu7utE1WwWxvVNg7U/wBnEnHMNoxOsfoyKpdkRx/ij2xsv6UzWCff2cJXYpDoHyL7F424FTqMziNWNB9LYzvtUUMeiRQ13wGTkZmCLmnnURnnJkuQRSamRG4W6KKDteuTNOuKXDBlFr7hlV16YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755192955; c=relaxed/simple;
	bh=vA7dghHcirnitTg5uFoDQb2W7/JU6CZNCJaXQRZsIsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m6WyE5Igdmp/Rclcdz0Jf9z5wASJJQYJr12m5OB7U/KeT0NTxmcvb7gD8OJZXRhZlCp2EkYgb3YkqHIjdzdg+UrQyZRJzMSZywIARelM+giXys9OomnNymHmQrE18D83K8qjOEpNkGwRuqaCTjiG7OQzIVYJjZzXmmSEoKk03MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HD12aJ5/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755192953; x=1786728953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vA7dghHcirnitTg5uFoDQb2W7/JU6CZNCJaXQRZsIsw=;
  b=HD12aJ5/PEHklUF9Tpaw8agPIzgtOqJ/Wx+XQvHmYFitXDfgcRuVK8Cm
   7vqOx2BvqSdQpP2k4gWmx0Nzk+p0bCbsrH3smYU9+uTzwaCg26A8aP6+J
   60ZpOq/i9FVoagWsrTHybo3Ju/pev4th1QbiSK1KC4L2A0N2ipMvRIkos
   pyjiazozoD8tcF8t421150H6fEOSxQ0Hj0bVGJBhj5pUf3oVwo4oLa/c5
   0GNtOnHHimvbKRU1uK1p+CFHUJHiGXUE/xC1zoeM2BcB9sMsc7q9TA+ai
   4HIjNwz80Ruggrn6xO2/DPUrhjOBbsVuxaKYg3d/PtgPJMFs9TEo9LEYB
   w==;
X-CSE-ConnectionGUID: SntzkCn+SzmCxZ5G9GXmUA==
X-CSE-MsgGUID: SllrhakcRWmRuWNXfXbgXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68217567"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68217567"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 10:35:53 -0700
X-CSE-ConnectionGUID: sZUuxG5XTLa/2vSs51xUlw==
X-CSE-MsgGUID: sx2H6YTPQ0eqW601HqXdlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="167630701"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 14 Aug 2025 10:35:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umbrh-000BDN-0k;
	Thu, 14 Aug 2025 17:35:49 +0000
Date: Fri, 15 Aug 2025 01:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Subject: [sailus-media-tree:devel 2/2] drivers/media/i2c/ov2735.c:938:17:
 error: call to undeclared function 'devm_v4l2_sensor_clk_get'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202508150159.xbzqi1vt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git devel
head:   7b1c48d7d525ee84c4dc79d6810171873b954c92
commit: 7b1c48d7d525ee84c4dc79d6810171873b954c92 [2/2] media: i2c: add ov2735 image sensor driver
config: x86_64-randconfig-071-20250814 (https://download.01.org/0day-ci/archive/20250815/202508150159.xbzqi1vt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150159.xbzqi1vt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150159.xbzqi1vt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ov2735.c:938:17: error: call to undeclared function 'devm_v4l2_sensor_clk_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     938 |         ov2735->xclk = devm_v4l2_sensor_clk_get(ov2735->dev, NULL);
         |                        ^
>> drivers/media/i2c/ov2735.c:938:15: error: incompatible integer to pointer conversion assigning to 'struct clk *' from 'int' [-Wint-conversion]
     938 |         ov2735->xclk = devm_v4l2_sensor_clk_get(ov2735->dev, NULL);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/devm_v4l2_sensor_clk_get +938 drivers/media/i2c/ov2735.c

   908	
   909	static int ov2735_probe(struct i2c_client *client)
   910	{
   911		struct ov2735 *ov2735;
   912		unsigned int xclk_freq;
   913		int ret;
   914	
   915		ov2735 = devm_kzalloc(&client->dev, sizeof(*ov2735), GFP_KERNEL);
   916		if (!ov2735)
   917			return -ENOMEM;
   918	
   919		ov2735->dev = &client->dev;
   920	
   921		v4l2_i2c_subdev_init(&ov2735->sd, client, &ov2735_subdev_ops);
   922		ov2735->sd.internal_ops = &ov2735_internal_ops;
   923	
   924		ov2735->cci = devm_cci_regmap_init_i2c(client, 8);
   925		if (IS_ERR(ov2735->cci))
   926			return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->cci),
   927					     "failed to initialize CCI\n");
   928	
   929		/* Set Current page to 0 */
   930		ov2735->current_page = 0;
   931	
   932		ret = devm_mutex_init(ov2735->dev, &ov2735->page_lock);
   933		if (ret)
   934			return dev_err_probe(ov2735->dev, ret,
   935					     "Failed to initialize lock\n");
   936	
   937		/* Get system clock (xvclk) */
 > 938		ov2735->xclk = devm_v4l2_sensor_clk_get(ov2735->dev, NULL);
   939		if (IS_ERR(ov2735->xclk))
   940			return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->xclk),
   941					     "failed to get xclk\n");
   942	
   943		xclk_freq = clk_get_rate(ov2735->xclk);
   944		if (xclk_freq != OV2735_XCLK_FREQ)
   945			return dev_err_probe(ov2735->dev, -EINVAL,
   946					     "xclk frequency not supported: %u Hz\n",
   947					     xclk_freq);
   948	
   949		ret = ov2735_get_regulators(ov2735);
   950		if (ret)
   951			return dev_err_probe(ov2735->dev, ret,
   952					     "failed to get regulators\n");
   953	
   954		ret = ov2735_parse_endpoint(ov2735);
   955		if (ret)
   956			return dev_err_probe(ov2735->dev, ret,
   957					     "failed to parse endpoint configuration\n");
   958	
   959		ov2735->reset_gpio = devm_gpiod_get_optional(ov2735->dev,
   960							     "reset", GPIOD_OUT_LOW);
   961		if (IS_ERR(ov2735->reset_gpio))
   962			return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->reset_gpio),
   963					     "failed to get reset GPIO\n");
   964	
   965		ov2735->enable_gpio = devm_gpiod_get_optional(ov2735->dev,
   966							      "enable", GPIOD_OUT_LOW);
   967		if (IS_ERR(ov2735->enable_gpio))
   968			return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->enable_gpio),
   969					     "failed to get enable GPIO\n");
   970	
   971		ret = ov2735_power_on(ov2735->dev);
   972		if (ret)
   973			return ret;
   974	
   975		ret = ov2735_identify_module(ov2735);
   976		if (ret)
   977			goto error_power_off;
   978	
   979		ret = ov2735_init_controls(ov2735);
   980		if (ret)
   981			goto error_power_off;
   982	
   983		/* Initialize subdev */
   984		ov2735->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
   985		ov2735->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
   986		ov2735->pad.flags = MEDIA_PAD_FL_SOURCE;
   987	
   988		ret = media_entity_pads_init(&ov2735->sd.entity, 1, &ov2735->pad);
   989		if (ret) {
   990			dev_err_probe(ov2735->dev, ret, "failed to init entity pads\n");
   991			goto error_handler_free;
   992		}
   993	
   994		ov2735->sd.state_lock = ov2735->handler.lock;
   995		ret = v4l2_subdev_init_finalize(&ov2735->sd);
   996		if (ret) {
   997			dev_err_probe(ov2735->dev, ret, "subdev init error\n");
   998			goto error_media_entity;
   999		}
  1000	
  1001		ret = devm_pm_runtime_get_noresume(ov2735->dev);
  1002		if (ret) {
  1003			dev_err_probe(ov2735->dev, ret,
  1004				      "failed to get runtime PM noresume\n");
  1005			goto error_subdev_cleanup;
  1006		}
  1007	
  1008		ret = devm_pm_runtime_set_active_enabled(ov2735->dev);
  1009		if (ret) {
  1010			dev_err_probe(ov2735->dev, ret,
  1011				      "failed to set runtime PM active+enabled\n");
  1012			goto error_subdev_cleanup;
  1013		}
  1014	
  1015		ret = v4l2_async_register_subdev_sensor(&ov2735->sd);
  1016		if (ret) {
  1017			dev_err_probe(ov2735->dev, ret,
  1018				      "failed to register ov2735 sub-device\n");
  1019			goto error_subdev_cleanup;
  1020		}
  1021	
  1022		return 0;
  1023	
  1024	error_subdev_cleanup:
  1025		v4l2_subdev_cleanup(&ov2735->sd);
  1026	
  1027	error_media_entity:
  1028		media_entity_cleanup(&ov2735->sd.entity);
  1029	
  1030	error_handler_free:
  1031		v4l2_ctrl_handler_free(ov2735->sd.ctrl_handler);
  1032	
  1033	error_power_off:
  1034		ov2735_power_off(ov2735->dev);
  1035	
  1036		return ret;
  1037	}
  1038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


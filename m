Return-Path: <linux-media+bounces-37457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F2B01546
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 09:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DBCC642B77
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 07:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5C11F63D9;
	Fri, 11 Jul 2025 07:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bG90sJSg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAD31F150B;
	Fri, 11 Jul 2025 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752220696; cv=none; b=n+k8P8Ud/iNm+6IvQbPeX1oDX0kSoGm2Lexf5lgjkVFmafgqlZdoIO9lC3WRks4m8q2Pb2095vG/WTPzpgpCePPjVMlK8FP81BtRxzWRq0jqsQ/NsoLyLRaeqFZ/T1gdAE/G5u4J+d5zLrfUP0Pst6+rgS/bckXNTqHBfEUmUxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752220696; c=relaxed/simple;
	bh=BP/IYgbQHsR2eTbv4XTSvlwTjBKMYAmm/7TXHpy8cmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOOJ4+sKiZEUZcJt6i52FdGcw4jCJU33ioZdKA5GS2zPWxdwcqcI7D2i3HtuaKg2b9fzj2hz4u4vld+Ex15/qly/+wndmlDX65QngOHWLgRLMbr/7YWi0VSJ58Aht31yZARcT32vxRH6izUBzUCEDz6ZsR7Yx0IHPLnC3E3JrZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bG90sJSg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752220694; x=1783756694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BP/IYgbQHsR2eTbv4XTSvlwTjBKMYAmm/7TXHpy8cmA=;
  b=bG90sJSgcWMUgt4t8oT4Eu7yhGn4Mk3dxMIEgdSpaUANtEPlISMOH7MF
   s87uPChuPEg4B6tJ4DWdLOsGjUpZ3pl58rA5u9PeDcdxenVAd/HN1pc14
   Uw2zCP1QX9K05o2OCSECldSagalhAnaBuDRwS/TdPzsJVK+GXfFWnhD+H
   hPdd94VvPbt1VPQgaYs110MMbYXY0TgirXqRuXn+zOusM1QPW9zGhzp28
   8bvn/tzOxzygTEAXwAMzXJhEz0x5dYkC95bDo5Msq9bH5pnjBDTwSMwWj
   zL4HHUvb53N40FdDzi/JS0tKzZ1Q1VL6hIgszQKLx9xXxB7UkZqqfxxdT
   Q==;
X-CSE-ConnectionGUID: 3JlwD9qhQsizAjTSNbPK/Q==
X-CSE-MsgGUID: nZ63csWCQc64u6NJOw93EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54451360"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="54451360"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 00:57:06 -0700
X-CSE-ConnectionGUID: eZsACcFNQ8e7Veugz75k7A==
X-CSE-MsgGUID: nhJLpbrpQvS/lqu41PHdeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="187293612"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jul 2025 00:56:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua8cr-00067D-2D;
	Fri, 11 Jul 2025 07:56:57 +0000
Date: Fri, 11 Jul 2025 15:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	sakari.ailus@linux.intel.com, krzk+dt@kernel.org,
	kieran.bingham@ideasonboard.com
Cc: oe-kbuild-all@lists.linux.dev, dave.stevenson@raspberrypi.com,
	pratap.nirujogi@amd.com, laurent.pinchart@ideasonboard.com,
	tarang.raval@siliconsignals.io,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Matthias Fend <matthias.fend@emfend.at>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>, Hao Yao <hao.yao@intel.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: add ov2735 image sensor driver
Message-ID: <202507111522.ERi7Nddk-lkp@intel.com>
References: <20250710131107.69017-3-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710131107.69017-3-hardevsinh.palaniya@siliconsignals.io>

Hi Hardevsinh,

kernel test robot noticed the following build errors:

[auto build test ERROR on sailus-media-tree/master]
[also build test ERROR on linus/master v6.16-rc5 next-20250710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hardevsinh-Palaniya/dt-bindings-media-i2c-Add-ov2735-sensor/20250710-211325
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20250710131107.69017-3-hardevsinh.palaniya%40siliconsignals.io
patch subject: [PATCH v3 2/2] media: i2c: add ov2735 image sensor driver
config: mips-randconfig-r072-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111522.ERi7Nddk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111522.ERi7Nddk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507111522.ERi7Nddk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ov2735.c:829:17: error: call to undeclared function 'devm_v4l2_sensor_clk_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     829 |         ov2735->xclk = devm_v4l2_sensor_clk_get(ov2735->dev, NULL);
         |                        ^
>> drivers/media/i2c/ov2735.c:829:15: error: incompatible integer to pointer conversion assigning to 'struct clk *' from 'int' [-Wint-conversion]
     829 |         ov2735->xclk = devm_v4l2_sensor_clk_get(ov2735->dev, NULL);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/devm_v4l2_sensor_clk_get +829 drivers/media/i2c/ov2735.c

   801	
   802	static int ov2735_probe(struct i2c_client *client)
   803	{
   804		struct ov2735 *ov2735;
   805		unsigned int xclk_freq;
   806		int ret;
   807	
   808		ov2735 = devm_kzalloc(&client->dev, sizeof(*ov2735), GFP_KERNEL);
   809		if (!ov2735)
   810			return -ENOMEM;
   811	
   812		ov2735->client = client;
   813		ov2735->dev = &client->dev;
   814	
   815		v4l2_i2c_subdev_init(&ov2735->sd, client, &ov2735_subdev_ops);
   816		ov2735->sd.internal_ops = &ov2735_internal_ops;
   817	
   818		ov2735->cci = devm_cci_regmap_init_i2c(client, 8);
   819		if (IS_ERR(ov2735->cci)) {
   820			ret = PTR_ERR(ov2735->cci);
   821			return dev_err_probe(ov2735->dev, ret, "failed to initialize CCI\n");
   822		}
   823	
   824		/* Set Current page to 0 */
   825		ov2735->current_page = 0;
   826		mutex_init(&ov2735->page_lock);
   827	
   828		/* Get system clock (xvclk) */
 > 829		ov2735->xclk = devm_v4l2_sensor_clk_get(ov2735->dev, NULL);
   830		if (IS_ERR(ov2735->xclk)) {
   831			return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->xclk),
   832					     "failed to get xclk\n");
   833		}
   834	
   835		xclk_freq = clk_get_rate(ov2735->xclk);
   836		if (xclk_freq != OV2735_XCLK_FREQ)
   837			return dev_err_probe(ov2735->dev, -EINVAL,
   838					     "xclk frequency not supported: %d Hz\n",
   839					     xclk_freq);
   840	
   841		ret = ov2735_get_regulators(ov2735);
   842		if (ret)
   843			return dev_err_probe(ov2735->dev, ret, "failed to get regulators\n");
   844	
   845		ret = ov2735_parse_endpoint(ov2735);
   846		if (ret) {
   847			dev_err(ov2735->dev, "failed to parse endpoint configuration\n");
   848			return ret;
   849		}
   850	
   851		ov2735->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
   852		if (IS_ERR(ov2735->reset_gpio))
   853			return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->reset_gpio),
   854					     "failed to get reset GPIO\n");
   855	
   856		ov2735->enable_gpio = devm_gpiod_get(&client->dev, "enable", GPIOD_OUT_LOW);
   857		if (IS_ERR(ov2735->enable_gpio))
   858			return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->enable_gpio),
   859					     "failed to get enable GPIO\n");
   860	
   861		ret = ov2735_power_on(ov2735->dev);
   862		if (ret)
   863			return ret;
   864	
   865		ret = ov2735_identify_module(ov2735);
   866		if (ret)
   867			goto error_power_off;
   868	
   869		/* This needs the pm runtime to be registered. */
   870		ret = ov2735_init_controls(ov2735);
   871		if (ret)
   872			goto error_power_off;
   873	
   874		/* Initialize subdev */
   875		ov2735->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
   876		ov2735->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
   877		ov2735->pad.flags = MEDIA_PAD_FL_SOURCE;
   878	
   879		ret = media_entity_pads_init(&ov2735->sd.entity, 1, &ov2735->pad);
   880		if (ret) {
   881			dev_err_probe(ov2735->dev, ret, "failed to init entity pads\n");
   882			goto error_handler_free;
   883		}
   884	
   885		ov2735->sd.state_lock = ov2735->handler.lock;
   886		ret = v4l2_subdev_init_finalize(&ov2735->sd);
   887		if (ret < 0) {
   888			dev_err_probe(ov2735->dev, ret, "subdev init error\n");
   889			goto error_media_entity;
   890		}
   891	
   892		pm_runtime_set_active(ov2735->dev);
   893		pm_runtime_enable(ov2735->dev);
   894	
   895		ret = v4l2_async_register_subdev_sensor(&ov2735->sd);
   896		if (ret < 0) {
   897			dev_err_probe(ov2735->dev, ret,
   898				      "failed to register ov2735 sub-device\n");
   899			goto error_subdev_cleanup;
   900		}
   901	
   902		pm_runtime_idle(ov2735->dev);
   903	
   904		return 0;
   905	
   906	error_subdev_cleanup:
   907		v4l2_subdev_cleanup(&ov2735->sd);
   908		pm_runtime_disable(ov2735->dev);
   909		pm_runtime_set_suspended(ov2735->dev);
   910	
   911	error_media_entity:
   912		media_entity_cleanup(&ov2735->sd.entity);
   913	
   914	error_handler_free:
   915		v4l2_ctrl_handler_free(ov2735->sd.ctrl_handler);
   916	
   917	error_power_off:
   918		ov2735_power_off(ov2735->dev);
   919	
   920		return ret;
   921	}
   922	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


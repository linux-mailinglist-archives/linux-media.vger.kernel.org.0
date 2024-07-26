Return-Path: <linux-media+bounces-15360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 142D093D241
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 13:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37FBB1C20D86
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 11:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C4617A5A3;
	Fri, 26 Jul 2024 11:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEifHSdH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D3717A581;
	Fri, 26 Jul 2024 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721993278; cv=none; b=Zyh+NqU3K1H+Djf5Xt9AcxYZCpQQwnRDi7MLzX5dokr0nAz5IVuV4v5/uqvIskEbo3e8SubqfGwFN3ql2p93f7yhYTtRlPSM2A1ayjLed9z+a5UyRarhG1STycH+AVIloDKXsH8YZvuEpIPtFPDcCYO6m3l9Yp8BAqSV6+LPWQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721993278; c=relaxed/simple;
	bh=aX4IHTutwEx8iY11bH0fm10oiySfI+34YoXcdz1UTWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=do3K1i6sfSc/KLcBDa7G7n9Z5BcsNch3/iKVbDQ/8/J+KfkNfohlMsvkZAB70d/hJRga1sIJJmW0AYS4Qz7zn+m7mJfVnsej5YrN4gR95r4VOLA4X1Chd/XfUvV96OhvsM6vN8ZvhWUadhGA9yubz2phTltMuBUsBjFfcQ7xjyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEifHSdH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721993276; x=1753529276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aX4IHTutwEx8iY11bH0fm10oiySfI+34YoXcdz1UTWA=;
  b=ZEifHSdHYEdXm2jihps7sC3q98WbvaiJHKAJxYU879Zq6lj0FbdNQdpZ
   vT+ETO4pwjoZflP78kaBoun4eFKWfdrhwKsv2NZJiiSosaNttaVuubr8B
   kDkDDzRuPr92ZhirA5GvvSIdADNLIVfbDSih5RV17PvYQyj521x+sqapa
   fiG9pkuNY83WA2qeC+6KrVUodyD6wXyYGlOqRJVfDBkAqhpuagDgeQGlI
   oINFW9A64hAaYvCRG0BRma7dqcg5BWSUC9TZ0fxbLvWx6TpJiCQUiYX2k
   SqZ4F3jfeoCM6EBQud1dP9HeoiwLa3n96LphuaPFNSHOmGtNxfiDRB0wA
   A==;
X-CSE-ConnectionGUID: yMC+yqVRRxu77KT1WtSk7w==
X-CSE-MsgGUID: 9f1Xr6wDQCWhcl++4JxT3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19918524"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="19918524"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 04:27:55 -0700
X-CSE-ConnectionGUID: ZY4XODahTzS5shFeH1/dWw==
X-CSE-MsgGUID: UWYmDr6fR32s3nYSoQO9lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="57829189"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jul 2024 04:27:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXJ6w-000p3w-36;
	Fri, 26 Jul 2024 11:27:46 +0000
Date: Fri, 26 Jul 2024 19:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-stm32@st-md-mailman.stormreply.com,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: constify snd_soc_component_driver struct
Message-ID: <202407261907.9WRDvix7-lkp@intel.com>
References: <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>

Hi Javier,

kernel test robot noticed the following build errors:

[auto build test ERROR on 864b1099d16fc7e332c3ad7823058c65f890486c]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Carrasco/media-i2c-tda1997x-constify-snd_soc_component_driver-struct/20240725-183542
base:   864b1099d16fc7e332c3ad7823058c65f890486c
patch link:    https://lore.kernel.org/r/20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b%40gmail.com
patch subject: [PATCH 2/2] ASoC: constify snd_soc_component_driver struct
config: i386-randconfig-012-20240726 (https://download.01.org/0day-ci/archive/20240726/202407261907.9WRDvix7-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407261907.9WRDvix7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407261907.9WRDvix7-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/cs43130.c: In function 'cs43130_i2c_probe':
>> sound/soc/codecs/cs43130.c:2608:42: error: assignment of member 'dapm_widgets' in read-only object
      soc_component_dev_cs43130.dapm_widgets =
                                             ^
>> sound/soc/codecs/cs43130.c:2610:46: error: assignment of member 'num_dapm_widgets' in read-only object
      soc_component_dev_cs43130.num_dapm_widgets =
                                                 ^
>> sound/soc/codecs/cs43130.c:2612:41: error: assignment of member 'dapm_routes' in read-only object
      soc_component_dev_cs43130.dapm_routes =
                                            ^
>> sound/soc/codecs/cs43130.c:2614:45: error: assignment of member 'num_dapm_routes' in read-only object
      soc_component_dev_cs43130.num_dapm_routes =
                                                ^
   sound/soc/codecs/cs43130.c:2619:42: error: assignment of member 'dapm_widgets' in read-only object
      soc_component_dev_cs43130.dapm_widgets =
                                             ^
   sound/soc/codecs/cs43130.c:2621:46: error: assignment of member 'num_dapm_widgets' in read-only object
      soc_component_dev_cs43130.num_dapm_widgets =
                                                 ^
   sound/soc/codecs/cs43130.c:2623:41: error: assignment of member 'dapm_routes' in read-only object
      soc_component_dev_cs43130.dapm_routes =
                                            ^
   sound/soc/codecs/cs43130.c:2625:45: error: assignment of member 'num_dapm_routes' in read-only object
      soc_component_dev_cs43130.num_dapm_routes =
                                                ^


vim +/dapm_widgets +2608 sound/soc/codecs/cs43130.c

8f1e5bf9b4408e Li Xu             2017-08-18  2479  
4a4043456cb82d Stephen Kitt      2022-03-25  2480  static int cs43130_i2c_probe(struct i2c_client *client)
8f1e5bf9b4408e Li Xu             2017-08-18  2481  {
8f1e5bf9b4408e Li Xu             2017-08-18  2482  	struct cs43130_private *cs43130;
8f1e5bf9b4408e Li Xu             2017-08-18  2483  	int ret;
8f1e5bf9b4408e Li Xu             2017-08-18  2484  	unsigned int reg;
e2bb1077cee4d1 Charles Keepax    2021-05-10  2485  	int i, devid;
8f1e5bf9b4408e Li Xu             2017-08-18  2486  
8f1e5bf9b4408e Li Xu             2017-08-18  2487  	cs43130 = devm_kzalloc(&client->dev, sizeof(*cs43130), GFP_KERNEL);
8f1e5bf9b4408e Li Xu             2017-08-18  2488  	if (!cs43130)
8f1e5bf9b4408e Li Xu             2017-08-18  2489  		return -ENOMEM;
8f1e5bf9b4408e Li Xu             2017-08-18  2490  
552206add94dd7 Maciej Strozek    2023-11-17  2491  	cs43130->dev = &client->dev;
552206add94dd7 Maciej Strozek    2023-11-17  2492  
8f1e5bf9b4408e Li Xu             2017-08-18  2493  	i2c_set_clientdata(client, cs43130);
8f1e5bf9b4408e Li Xu             2017-08-18  2494  
8f1e5bf9b4408e Li Xu             2017-08-18  2495  	cs43130->regmap = devm_regmap_init_i2c(client, &cs43130_regmap);
8f1e5bf9b4408e Li Xu             2017-08-18  2496  	if (IS_ERR(cs43130->regmap)) {
8f1e5bf9b4408e Li Xu             2017-08-18  2497  		ret = PTR_ERR(cs43130->regmap);
8f1e5bf9b4408e Li Xu             2017-08-18  2498  		return ret;
8f1e5bf9b4408e Li Xu             2017-08-18  2499  	}
8f1e5bf9b4408e Li Xu             2017-08-18  2500  
ce7944b73e7729 Maciej Strozek    2023-11-17  2501  	if (dev_fwnode(cs43130->dev)) {
ce7944b73e7729 Maciej Strozek    2023-11-17  2502  		ret = cs43130_handle_device_data(cs43130);
8f1e5bf9b4408e Li Xu             2017-08-18  2503  		if (ret != 0)
8f1e5bf9b4408e Li Xu             2017-08-18  2504  			return ret;
8f1e5bf9b4408e Li Xu             2017-08-18  2505  	}
ce7944b73e7729 Maciej Strozek    2023-11-17  2506  
8f1e5bf9b4408e Li Xu             2017-08-18  2507  	for (i = 0; i < ARRAY_SIZE(cs43130->supplies); i++)
8f1e5bf9b4408e Li Xu             2017-08-18  2508  		cs43130->supplies[i].supply = cs43130_supply_names[i];
8f1e5bf9b4408e Li Xu             2017-08-18  2509  
552206add94dd7 Maciej Strozek    2023-11-17  2510  	ret = devm_regulator_bulk_get(cs43130->dev,
8f1e5bf9b4408e Li Xu             2017-08-18  2511  				      ARRAY_SIZE(cs43130->supplies),
8f1e5bf9b4408e Li Xu             2017-08-18  2512  				      cs43130->supplies);
8f1e5bf9b4408e Li Xu             2017-08-18  2513  	if (ret != 0) {
552206add94dd7 Maciej Strozek    2023-11-17  2514  		dev_err(cs43130->dev, "Failed to request supplies: %d\n", ret);
8f1e5bf9b4408e Li Xu             2017-08-18  2515  		return ret;
8f1e5bf9b4408e Li Xu             2017-08-18  2516  	}
8f1e5bf9b4408e Li Xu             2017-08-18  2517  	ret = regulator_bulk_enable(ARRAY_SIZE(cs43130->supplies),
8f1e5bf9b4408e Li Xu             2017-08-18  2518  				    cs43130->supplies);
8f1e5bf9b4408e Li Xu             2017-08-18  2519  	if (ret != 0) {
552206add94dd7 Maciej Strozek    2023-11-17  2520  		dev_err(cs43130->dev, "Failed to enable supplies: %d\n", ret);
8f1e5bf9b4408e Li Xu             2017-08-18  2521  		return ret;
8f1e5bf9b4408e Li Xu             2017-08-18  2522  	}
8f1e5bf9b4408e Li Xu             2017-08-18  2523  
552206add94dd7 Maciej Strozek    2023-11-17  2524  	cs43130->reset_gpio = devm_gpiod_get_optional(cs43130->dev,
8f1e5bf9b4408e Li Xu             2017-08-18  2525  						      "reset", GPIOD_OUT_LOW);
e2bb1077cee4d1 Charles Keepax    2021-05-10  2526  	if (IS_ERR(cs43130->reset_gpio)) {
e2bb1077cee4d1 Charles Keepax    2021-05-10  2527  		ret = PTR_ERR(cs43130->reset_gpio);
e2bb1077cee4d1 Charles Keepax    2021-05-10  2528  		goto err_supplies;
e2bb1077cee4d1 Charles Keepax    2021-05-10  2529  	}
8f1e5bf9b4408e Li Xu             2017-08-18  2530  
8f1e5bf9b4408e Li Xu             2017-08-18  2531  	gpiod_set_value_cansleep(cs43130->reset_gpio, 1);
8f1e5bf9b4408e Li Xu             2017-08-18  2532  
8f1e5bf9b4408e Li Xu             2017-08-18  2533  	usleep_range(2000, 2050);
8f1e5bf9b4408e Li Xu             2017-08-18  2534  
e2bb1077cee4d1 Charles Keepax    2021-05-10  2535  	devid = cirrus_read_device_id(cs43130->regmap, CS43130_DEVID_AB);
e2bb1077cee4d1 Charles Keepax    2021-05-10  2536  	if (devid < 0) {
e2bb1077cee4d1 Charles Keepax    2021-05-10  2537  		ret = devid;
552206add94dd7 Maciej Strozek    2023-11-17  2538  		dev_err(cs43130->dev, "Failed to read device ID: %d\n", ret);
e2bb1077cee4d1 Charles Keepax    2021-05-10  2539  		goto err;
e2bb1077cee4d1 Charles Keepax    2021-05-10  2540  	}
8f1e5bf9b4408e Li Xu             2017-08-18  2541  
8f1e5bf9b4408e Li Xu             2017-08-18  2542  	switch (devid) {
8f1e5bf9b4408e Li Xu             2017-08-18  2543  	case CS43130_CHIP_ID:
8f1e5bf9b4408e Li Xu             2017-08-18  2544  	case CS4399_CHIP_ID:
8f1e5bf9b4408e Li Xu             2017-08-18  2545  	case CS43131_CHIP_ID:
8f1e5bf9b4408e Li Xu             2017-08-18  2546  	case CS43198_CHIP_ID:
8f1e5bf9b4408e Li Xu             2017-08-18  2547  		break;
8f1e5bf9b4408e Li Xu             2017-08-18  2548  	default:
552206add94dd7 Maciej Strozek    2023-11-17  2549  		dev_err(cs43130->dev,
8f1e5bf9b4408e Li Xu             2017-08-18  2550  			"CS43130 Device ID %X. Expected ID %X, %X, %X or %X\n",
8f1e5bf9b4408e Li Xu             2017-08-18  2551  			devid, CS43130_CHIP_ID, CS4399_CHIP_ID,
8f1e5bf9b4408e Li Xu             2017-08-18  2552  			CS43131_CHIP_ID, CS43198_CHIP_ID);
8f1e5bf9b4408e Li Xu             2017-08-18  2553  		ret = -ENODEV;
8f1e5bf9b4408e Li Xu             2017-08-18  2554  		goto err;
8f1e5bf9b4408e Li Xu             2017-08-18  2555  	}
8f1e5bf9b4408e Li Xu             2017-08-18  2556  
8f1e5bf9b4408e Li Xu             2017-08-18  2557  	cs43130->dev_id = devid;
8f1e5bf9b4408e Li Xu             2017-08-18  2558  	ret = regmap_read(cs43130->regmap, CS43130_REV_ID, &reg);
8f1e5bf9b4408e Li Xu             2017-08-18  2559  	if (ret < 0) {
552206add94dd7 Maciej Strozek    2023-11-17  2560  		dev_err(cs43130->dev, "Get Revision ID failed\n");
8f1e5bf9b4408e Li Xu             2017-08-18  2561  		goto err;
8f1e5bf9b4408e Li Xu             2017-08-18  2562  	}
8f1e5bf9b4408e Li Xu             2017-08-18  2563  
552206add94dd7 Maciej Strozek    2023-11-17  2564  	dev_info(cs43130->dev,
8f1e5bf9b4408e Li Xu             2017-08-18  2565  		 "Cirrus Logic CS43130 (%x), Revision: %02X\n", devid,
8f1e5bf9b4408e Li Xu             2017-08-18  2566  		 reg & 0xFF);
8f1e5bf9b4408e Li Xu             2017-08-18  2567  
8f1e5bf9b4408e Li Xu             2017-08-18  2568  	mutex_init(&cs43130->clk_mutex);
8f1e5bf9b4408e Li Xu             2017-08-18  2569  
8f1e5bf9b4408e Li Xu             2017-08-18  2570  	init_completion(&cs43130->xtal_rdy);
8f1e5bf9b4408e Li Xu             2017-08-18  2571  	init_completion(&cs43130->pll_rdy);
8f1e5bf9b4408e Li Xu             2017-08-18  2572  	init_completion(&cs43130->hpload_evt);
8f1e5bf9b4408e Li Xu             2017-08-18  2573  
fa91703dc2e010 Maciej Strozek    2023-11-23  2574  	if (!client->irq) {
fa91703dc2e010 Maciej Strozek    2023-11-23  2575  		dev_dbg(cs43130->dev, "IRQ not found, will poll instead\n");
fa91703dc2e010 Maciej Strozek    2023-11-23  2576  		cs43130->has_irq_line = 0;
fa91703dc2e010 Maciej Strozek    2023-11-23  2577  	} else {
552206add94dd7 Maciej Strozek    2023-11-17  2578  		ret = devm_request_threaded_irq(cs43130->dev, client->irq,
8f1e5bf9b4408e Li Xu             2017-08-18  2579  						NULL, cs43130_irq_thread,
8f1e5bf9b4408e Li Xu             2017-08-18  2580  						IRQF_ONESHOT | IRQF_TRIGGER_LOW,
8f1e5bf9b4408e Li Xu             2017-08-18  2581  						"cs43130", cs43130);
8f1e5bf9b4408e Li Xu             2017-08-18  2582  		if (ret != 0) {
552206add94dd7 Maciej Strozek    2023-11-17  2583  			dev_err(cs43130->dev, "Failed to request IRQ: %d\n", ret);
e2bb1077cee4d1 Charles Keepax    2021-05-10  2584  			goto err;
8f1e5bf9b4408e Li Xu             2017-08-18  2585  		}
fa91703dc2e010 Maciej Strozek    2023-11-23  2586  		cs43130->has_irq_line = 1;
fa91703dc2e010 Maciej Strozek    2023-11-23  2587  	}
8f1e5bf9b4408e Li Xu             2017-08-18  2588  
8f1e5bf9b4408e Li Xu             2017-08-18  2589  	cs43130->mclk_int_src = CS43130_MCLK_SRC_RCO;
8f1e5bf9b4408e Li Xu             2017-08-18  2590  
552206add94dd7 Maciej Strozek    2023-11-17  2591  	pm_runtime_set_autosuspend_delay(cs43130->dev, 100);
552206add94dd7 Maciej Strozek    2023-11-17  2592  	pm_runtime_use_autosuspend(cs43130->dev);
552206add94dd7 Maciej Strozek    2023-11-17  2593  	pm_runtime_set_active(cs43130->dev);
552206add94dd7 Maciej Strozek    2023-11-17  2594  	pm_runtime_enable(cs43130->dev);
8f1e5bf9b4408e Li Xu             2017-08-18  2595  
8f1e5bf9b4408e Li Xu             2017-08-18  2596  	switch (cs43130->dev_id) {
8f1e5bf9b4408e Li Xu             2017-08-18  2597  	case CS43130_CHIP_ID:
8f1e5bf9b4408e Li Xu             2017-08-18  2598  	case CS43131_CHIP_ID:
8f1e5bf9b4408e Li Xu             2017-08-18  2599  		memcpy(all_hp_widgets, digital_hp_widgets,
8f1e5bf9b4408e Li Xu             2017-08-18  2600  		       sizeof(digital_hp_widgets));
8f1e5bf9b4408e Li Xu             2017-08-18  2601  		memcpy(all_hp_widgets + ARRAY_SIZE(digital_hp_widgets),
8f1e5bf9b4408e Li Xu             2017-08-18  2602  		       analog_hp_widgets, sizeof(analog_hp_widgets));
8f1e5bf9b4408e Li Xu             2017-08-18  2603  		memcpy(all_hp_routes, digital_hp_routes,
8f1e5bf9b4408e Li Xu             2017-08-18  2604  		       sizeof(digital_hp_routes));
8f1e5bf9b4408e Li Xu             2017-08-18  2605  		memcpy(all_hp_routes + ARRAY_SIZE(digital_hp_routes),
8f1e5bf9b4408e Li Xu             2017-08-18  2606  		       analog_hp_routes, sizeof(analog_hp_routes));
8f1e5bf9b4408e Li Xu             2017-08-18  2607  
97b566066ffc2f Kuninori Morimoto 2018-01-29 @2608  		soc_component_dev_cs43130.dapm_widgets =
8f1e5bf9b4408e Li Xu             2017-08-18  2609  			all_hp_widgets;
97b566066ffc2f Kuninori Morimoto 2018-01-29 @2610  		soc_component_dev_cs43130.num_dapm_widgets =
8f1e5bf9b4408e Li Xu             2017-08-18  2611  			ARRAY_SIZE(all_hp_widgets);
97b566066ffc2f Kuninori Morimoto 2018-01-29 @2612  		soc_component_dev_cs43130.dapm_routes =
8f1e5bf9b4408e Li Xu             2017-08-18  2613  			all_hp_routes;
97b566066ffc2f Kuninori Morimoto 2018-01-29 @2614  		soc_component_dev_cs43130.num_dapm_routes =
8f1e5bf9b4408e Li Xu             2017-08-18  2615  			ARRAY_SIZE(all_hp_routes);
8f1e5bf9b4408e Li Xu             2017-08-18  2616  		break;
8f1e5bf9b4408e Li Xu             2017-08-18  2617  	case CS43198_CHIP_ID:
8f1e5bf9b4408e Li Xu             2017-08-18  2618  	case CS4399_CHIP_ID:
97b566066ffc2f Kuninori Morimoto 2018-01-29  2619  		soc_component_dev_cs43130.dapm_widgets =
8f1e5bf9b4408e Li Xu             2017-08-18  2620  			digital_hp_widgets;
97b566066ffc2f Kuninori Morimoto 2018-01-29  2621  		soc_component_dev_cs43130.num_dapm_widgets =
8f1e5bf9b4408e Li Xu             2017-08-18  2622  			ARRAY_SIZE(digital_hp_widgets);
97b566066ffc2f Kuninori Morimoto 2018-01-29  2623  		soc_component_dev_cs43130.dapm_routes =
8f1e5bf9b4408e Li Xu             2017-08-18  2624  			digital_hp_routes;
97b566066ffc2f Kuninori Morimoto 2018-01-29  2625  		soc_component_dev_cs43130.num_dapm_routes =
8f1e5bf9b4408e Li Xu             2017-08-18  2626  			ARRAY_SIZE(digital_hp_routes);
574ff444b9fcc2 Li Xu             2017-09-05  2627  		break;
8f1e5bf9b4408e Li Xu             2017-08-18  2628  	}
8f1e5bf9b4408e Li Xu             2017-08-18  2629  
552206add94dd7 Maciej Strozek    2023-11-17  2630  	ret = devm_snd_soc_register_component(cs43130->dev,
97b566066ffc2f Kuninori Morimoto 2018-01-29  2631  				     &soc_component_dev_cs43130,
8f1e5bf9b4408e Li Xu             2017-08-18  2632  				     cs43130_dai, ARRAY_SIZE(cs43130_dai));
8f1e5bf9b4408e Li Xu             2017-08-18  2633  	if (ret < 0) {
552206add94dd7 Maciej Strozek    2023-11-17  2634  		dev_err(cs43130->dev,
97b566066ffc2f Kuninori Morimoto 2018-01-29  2635  			"snd_soc_register_component failed with ret = %d\n", ret);
8f1e5bf9b4408e Li Xu             2017-08-18  2636  		goto err;
8f1e5bf9b4408e Li Xu             2017-08-18  2637  	}
8f1e5bf9b4408e Li Xu             2017-08-18  2638  
8f1e5bf9b4408e Li Xu             2017-08-18  2639  	regmap_update_bits(cs43130->regmap, CS43130_PAD_INT_CFG,
8f1e5bf9b4408e Li Xu             2017-08-18  2640  			   CS43130_ASP_3ST_MASK, 0);
8f1e5bf9b4408e Li Xu             2017-08-18  2641  	regmap_update_bits(cs43130->regmap, CS43130_PAD_INT_CFG,
8f1e5bf9b4408e Li Xu             2017-08-18  2642  			   CS43130_XSP_3ST_MASK, 0);
8f1e5bf9b4408e Li Xu             2017-08-18  2643  
8f1e5bf9b4408e Li Xu             2017-08-18  2644  	return 0;
e2bb1077cee4d1 Charles Keepax    2021-05-10  2645  
8f1e5bf9b4408e Li Xu             2017-08-18  2646  err:
e2bb1077cee4d1 Charles Keepax    2021-05-10  2647  	gpiod_set_value_cansleep(cs43130->reset_gpio, 0);
e2bb1077cee4d1 Charles Keepax    2021-05-10  2648  err_supplies:
e2bb1077cee4d1 Charles Keepax    2021-05-10  2649  	regulator_bulk_disable(ARRAY_SIZE(cs43130->supplies),
e2bb1077cee4d1 Charles Keepax    2021-05-10  2650  			       cs43130->supplies);
e2bb1077cee4d1 Charles Keepax    2021-05-10  2651  
8f1e5bf9b4408e Li Xu             2017-08-18  2652  	return ret;
8f1e5bf9b4408e Li Xu             2017-08-18  2653  }
8f1e5bf9b4408e Li Xu             2017-08-18  2654  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


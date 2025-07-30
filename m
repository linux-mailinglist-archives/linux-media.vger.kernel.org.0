Return-Path: <linux-media+bounces-38667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09739B16614
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 20:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0620316616F
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 18:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B92266B64;
	Wed, 30 Jul 2025 18:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jyrh/N+L"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0742222C4;
	Wed, 30 Jul 2025 18:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753899123; cv=none; b=k9eYiUoOT8b+z2fX1FmKa7oaC3mLDzna9i9UZYhVkCN9oahyptN0ahnsWJBYBHe6hFYe5mxwgOiKxKjONr7cj6Wv+wDSPMtAYAh5B23nvJDT4t7HK0h7r7xbdJB5dkEpIxhgTCbpoWGWHigjGjsbEUDHBtfFnMCWVZsT4ZMLn38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753899123; c=relaxed/simple;
	bh=1BNcfH9em3ASM4tgaNMpnzCRAFkYkHDjQ0ue4hCUnqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsbvR8DNlLkhc75uuNvDthPGIn4D2hTK2f71QVvWOmL/5EhOmT9X/Fr2zYwfRxFmtYt2WvTpJ6TjWceTnhcBZkglC3Hg4knTJYbf1XZH9Dllcoz7QxRjQ6BGFfO2gbkKfGKQ6oTsVNR0KsQNED0FDq7sHTgg68g55MCzpkj1+R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jyrh/N+L; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753899120; x=1785435120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1BNcfH9em3ASM4tgaNMpnzCRAFkYkHDjQ0ue4hCUnqE=;
  b=Jyrh/N+L6j16joSIoYhT77mclQOjOO5yGKNL0T+GGiowb0Gr0rvdK9du
   TaAgB1q+3r+7RYkB0C4vOk6rXMfWGbSiwXqJlQBoF0Nn9KKcf23yEGsqx
   vl6hsGl6qkTtSSc9LH7O8Sb3LM3pornSP5K6pS+v0SADRrUsLyWzqSlAF
   nvN4E1rZszKaewM/eMI2jm26Z5Af1EL6jDKFOt9+6uE1v5UnsJ/TO1L9W
   nwHZXbw0+M2FM5rZH1CDkjExGSmSjrRcgJwb4tbJccpGjk1VYophpbnmv
   rKbt6xA6sLqmuNDnK2zAlNOMrlqu2U1f0Z9nQ0PS8GN/yg2//4TC3wDC0
   w==;
X-CSE-ConnectionGUID: NkUjj5YBS4mKLZ5JueYUfA==
X-CSE-MsgGUID: PvT8kSTpTLeN2/A6IhdJJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56098257"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56098257"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 11:12:00 -0700
X-CSE-ConnectionGUID: u/Mk2/2LQd6EfSRLL0BpWQ==
X-CSE-MsgGUID: ADqx3ej4RZeGmtTdJ+oWmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163391638"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jul 2025 11:11:57 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhBHP-00031y-0p;
	Wed, 30 Jul 2025 18:11:55 +0000
Date: Thu, 31 Jul 2025 02:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: Add OmniVision OV6211 image sensor
 driver
Message-ID: <202507310131.4CfC6qil-lkp@intel.com>
References: <20250729231454.242748-3-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729231454.242748-3-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linuxtv-media-pending/master linus/master media-tree/master v6.16 next-20250730]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Zapolskiy/dt-bindings-media-i2c-Add-OmniVision-OV6211-image-sensor/20250730-071618
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250729231454.242748-3-vladimir.zapolskiy%40linaro.org
patch subject: [PATCH v2 2/2] media: i2c: Add OmniVision OV6211 image sensor driver
config: i386-randconfig-001-20250731 (https://download.01.org/0day-ci/archive/20250731/202507310131.4CfC6qil-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310131.4CfC6qil-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310131.4CfC6qil-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ov6211.c: In function 'ov6211_probe':
   drivers/media/i2c/ov6211.c:672:25: error: implicit declaration of function 'devm_v4l2_sensor_clk_get' [-Werror=implicit-function-declaration]
     672 |         ov6211->xvclk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/ov6211.c:672:23: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     672 |         ov6211->xvclk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
         |                       ^
   cc1: some warnings being treated as errors


vim +672 drivers/media/i2c/ov6211.c

   654	
   655	static int ov6211_probe(struct i2c_client *client)
   656	{
   657		struct ov6211 *ov6211;
   658		unsigned long freq;
   659		int ret;
   660	
   661		ov6211 = devm_kzalloc(&client->dev, sizeof(*ov6211), GFP_KERNEL);
   662		if (!ov6211)
   663			return -ENOMEM;
   664	
   665		ov6211->regmap = devm_cci_regmap_init_i2c(client, 16);
   666		if (IS_ERR(ov6211->regmap))
   667			return dev_err_probe(&client->dev, PTR_ERR(ov6211->regmap),
   668					     "failed to init CCI\n");
   669	
   670		v4l2_i2c_subdev_init(&ov6211->sd, client, &ov6211_subdev_ops);
   671	
 > 672		ov6211->xvclk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
   673		if (IS_ERR(ov6211->xvclk))
   674			return dev_err_probe(&client->dev, PTR_ERR(ov6211->xvclk),
   675					     "failed to get XVCLK clock\n");
   676	
   677		freq = clk_get_rate(ov6211->xvclk);
   678		if (freq && freq != OV6211_MCLK_FREQ_24MHZ)
   679			return dev_err_probe(&client->dev, -EINVAL,
   680					"XVCLK clock frequency %lu is not supported\n",
   681					freq);
   682	
   683		ret = ov6211_check_hwcfg(ov6211);
   684		if (ret)
   685			return dev_err_probe(&client->dev, ret,
   686					     "failed to check HW configuration\n");
   687	
   688		ov6211->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
   689							     GPIOD_OUT_HIGH);
   690		if (IS_ERR(ov6211->reset_gpio))
   691			return dev_err_probe(&client->dev, PTR_ERR(ov6211->reset_gpio),
   692					     "cannot get reset GPIO\n");
   693	
   694		ov6211->avdd = devm_regulator_get_optional(&client->dev, "avdd");
   695		if (IS_ERR(ov6211->avdd)) {
   696			ret = PTR_ERR(ov6211->avdd);
   697			if (ret != -ENODEV)
   698				return dev_err_probe(&client->dev, ret,
   699						     "Failed to get avdd regulator\n");
   700	
   701			ov6211->avdd = NULL;
   702		}
   703	
   704		ov6211->dovdd = devm_regulator_get_optional(&client->dev, "dovdd");
   705		if (IS_ERR(ov6211->dovdd)) {
   706			ret = PTR_ERR(ov6211->dovdd);
   707			if (ret != -ENODEV)
   708				return dev_err_probe(&client->dev, ret,
   709						     "Failed to get dovdd regulator\n");
   710	
   711			ov6211->dovdd = NULL;
   712		}
   713	
   714		ov6211->dvdd = devm_regulator_get_optional(&client->dev, "dvdd");
   715		if (IS_ERR(ov6211->dvdd)) {
   716			ret = PTR_ERR(ov6211->dvdd);
   717			if (ret != -ENODEV)
   718				return dev_err_probe(&client->dev, ret,
   719						     "Failed to get dvdd regulator\n");
   720	
   721			ov6211->dvdd = NULL;
   722		}
   723	
   724		/* The sensor must be powered on to read the CHIP_ID register */
   725		ret = ov6211_power_on(&client->dev);
   726		if (ret)
   727			return ret;
   728	
   729		ret = ov6211_identify_module(ov6211);
   730		if (ret) {
   731			dev_err_probe(&client->dev, ret, "failed to find sensor\n");
   732			goto power_off;
   733		}
   734	
   735		mutex_init(&ov6211->mutex);
   736		ov6211->cur_mode = &supported_modes[0];
   737	
   738		ret = ov6211_init_controls(ov6211);
   739		if (ret) {
   740			dev_err_probe(&client->dev, ret, "failed to init controls\n");
   741			goto mutex_destroy;
   742		}
   743	
   744		ov6211->sd.internal_ops = &ov6211_internal_ops;
   745		ov6211->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
   746		ov6211->sd.entity.ops = &ov6211_subdev_entity_ops;
   747		ov6211->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
   748		ov6211->pad.flags = MEDIA_PAD_FL_SOURCE;
   749		ret = media_entity_pads_init(&ov6211->sd.entity, 1, &ov6211->pad);
   750		if (ret) {
   751			dev_err_probe(&client->dev, ret,
   752				      "failed to init media entity pads\n");
   753			goto v4l2_ctrl_handler_free;
   754		}
   755	
   756		ret = v4l2_async_register_subdev_sensor(&ov6211->sd);
   757		if (ret < 0) {
   758			dev_err_probe(&client->dev, ret,
   759				      "failed to register V4L2 subdev\n");
   760			goto media_entity_cleanup;
   761		}
   762	
   763		/* Enable runtime PM and turn off the device */
   764		pm_runtime_set_active(&client->dev);
   765		pm_runtime_enable(&client->dev);
   766		pm_runtime_idle(&client->dev);
   767	
   768		return 0;
   769	
   770	media_entity_cleanup:
   771		media_entity_cleanup(&ov6211->sd.entity);
   772	
   773	v4l2_ctrl_handler_free:
   774		v4l2_ctrl_handler_free(ov6211->sd.ctrl_handler);
   775	
   776	mutex_destroy:
   777		mutex_destroy(&ov6211->mutex);
   778	
   779	power_off:
   780		ov6211_power_off(&client->dev);
   781	
   782		return ret;
   783	}
   784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


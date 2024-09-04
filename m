Return-Path: <linux-media+bounces-17512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4287896AF45
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 05:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C51D41F26C44
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 03:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B3C6E61B;
	Wed,  4 Sep 2024 03:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jM864UoA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6612E4778C
	for <linux-media@vger.kernel.org>; Wed,  4 Sep 2024 03:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725420355; cv=none; b=bE7hXr6i4pq65SC4qO3FG1IM71D9sVrweoaKFpj1RdZdAiXqFGolznfrvSpbJ1nc3pHhFTlb1Qq2FAamAcXs2c8Cp2qaJo0LKhrQZTV186cx6QYAMSFnlLTHPVlKzXUabC13Fe2Dq1sZ+j0xyeG0dyDHeWLLojnJ9OCndXGIGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725420355; c=relaxed/simple;
	bh=VFmZjNj9FlfXxc/BAtwp8dUpXFJfe3cNnJiWpc58y3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDZsbj2V1RZ2HMyexgIJdhGM++W8xXoGx+fi7CEyefJqVUSmFUgGTK5EogKJqlrYx0rmt6ppfGA4uYGNOdSzf2S4EL8aHMUiuV2S4Dn8Mf2tC3qS0MrXHXFTiwnhEHlRQOoweISq8ijt8MbDfkCQiT6eyIa9WGtpVNxmwyZeFdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jM864UoA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725420354; x=1756956354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VFmZjNj9FlfXxc/BAtwp8dUpXFJfe3cNnJiWpc58y3s=;
  b=jM864UoA7u2HoR4UgfdC8v71z1aQUe2zssemIXN+5UeUCCRtEfLK5sEl
   6rgU2EBZc53xsl2YMlQO+rwuNEtOrjqQjTKdzjj3PKGXZ3O2dAu/wy0BC
   X5UGWibeCdtPcgFjDVQcYbNaR6UkazuMksZw4aLHIgnMCPcioWjYR20g/
   VKMhiWOKlKXz8TUkvYN7V9zY+NFQVrVSifhgVpw1LVMc2jl2u5OXas3BT
   2KI0EmWVQspmEyg3k3i8IkHOSEBhK6fSWe8aKVwzckeLVi1bv+n5YIzay
   G90fR3sWQ0alrL44g0cKBbyeesf21EriB4AJGs/gEVrBmye/mKbbxagxV
   Q==;
X-CSE-ConnectionGUID: kWsjtuMvSxOCdDvLOIWBTA==
X-CSE-MsgGUID: 7ut2dhdfTpOfgalvlP0Q5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="46581772"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="46581772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 20:25:49 -0700
X-CSE-ConnectionGUID: mxVgnmvJTliBLPlCIeQrew==
X-CSE-MsgGUID: 1JLZf8SNTWGz9EGwQB6pRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="69950089"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Sep 2024 20:25:47 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slgeO-0007VA-2M;
	Wed, 04 Sep 2024 03:25:44 +0000
Date: Wed, 4 Sep 2024 11:25:40 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for AD5823 VCM
Message-ID: <202409041123.VAFdMjn2-lkp@intel.com>
References: <20240901211834.145186-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240901211834.145186-3-hdegoede@redhat.com>

Hi Hans,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master sailus-media-tree/master linus/master v6.11-rc6 next-20240903]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l-Call-s_stream-on-VCM-when-it-is-called-on-the-associated-sensor/20240902-052000
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240901211834.145186-3-hdegoede%40redhat.com
patch subject: [PATCH 2/2] media: i2c: Add driver for AD5823 VCM
config: x86_64-randconfig-076-20240904 (https://download.01.org/0day-ci/archive/20240904/202409041123.VAFdMjn2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041123.VAFdMjn2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041123.VAFdMjn2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ad5823.c:203:19: error: call to undeclared function 'devm_cci_regmap_init_i2c'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     203 |         ad5823->regmap = devm_cci_regmap_init_i2c(client, 8);
         |                          ^
>> drivers/media/i2c/ad5823.c:203:17: error: incompatible integer to pointer conversion assigning to 'struct regmap *' from 'int' [-Wint-conversion]
     203 |         ad5823->regmap = devm_cci_regmap_init_i2c(client, 8);
         |                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/devm_cci_regmap_init_i2c +203 drivers/media/i2c/ad5823.c

   193	
   194	static int ad5823_probe(struct i2c_client *client)
   195	{
   196		struct ad5823_device *ad5823;
   197		int ret;
   198	
   199		ad5823 = devm_kzalloc(&client->dev, sizeof(*ad5823), GFP_KERNEL);
   200		if (!ad5823)
   201			return -ENOMEM;
   202	
 > 203		ad5823->regmap = devm_cci_regmap_init_i2c(client, 8);
   204		if (IS_ERR(ad5823->regmap))
   205			return PTR_ERR(ad5823->regmap);
   206	
   207		ad5823->arc_mode = AD5823_ARC_RES1;
   208		ad5823->resonance_period = AD5823_RESONANCE_PERIOD;
   209	
   210		/* Optional indication of ARC mode select */
   211		device_property_read_u32(&client->dev, "adi,arc-mode",
   212					 &ad5823->arc_mode);
   213	
   214		/* Optional indication of VCM resonance period */
   215		device_property_read_u32(&client->dev, "adi,resonance-period",
   216					 &ad5823->resonance_period);
   217	
   218		ad5823->regulator = devm_regulator_get(&client->dev, "vdd");
   219		if (IS_ERR(ad5823->regulator))
   220			return dev_err_probe(&client->dev, PTR_ERR(ad5823->regulator),
   221					     "getting regulator\n");
   222	
   223		v4l2_i2c_subdev_init(&ad5823->sd, client, &ad5823_ops);
   224		ad5823->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
   225	
   226		ret = ad5823_init_controls(ad5823);
   227		if (ret)
   228			return ret;
   229	
   230		ret = media_entity_pads_init(&ad5823->sd.entity, 0, NULL);
   231		if (ret < 0)
   232			goto err_free_ctrl_handler;
   233	
   234		ad5823->sd.entity.function = MEDIA_ENT_F_LENS;
   235	
   236		/*
   237		 * We need the driver to work in the event that pm runtime is disable in
   238		 * the kernel, so power up and verify the chip now. In the event that
   239		 * runtime pm is disabled this will leave the chip on, so that the lens
   240		 * will work.
   241		 */
   242	
   243		ret = ad5823_power_up(ad5823, true);
   244		if (ret)
   245			goto err_cleanup_media;
   246	
   247		pm_runtime_set_active(&client->dev);
   248		pm_runtime_get_noresume(&client->dev);
   249		pm_runtime_enable(&client->dev);
   250	
   251		ret = v4l2_async_register_subdev(&ad5823->sd);
   252		if (ret < 0)
   253			goto err_pm_runtime;
   254	
   255		pm_runtime_set_autosuspend_delay(&client->dev, 1000);
   256		pm_runtime_use_autosuspend(&client->dev);
   257		pm_runtime_put_autosuspend(&client->dev);
   258	
   259		return ret;
   260	
   261	err_pm_runtime:
   262		pm_runtime_disable(&client->dev);
   263		pm_runtime_put_noidle(&client->dev);
   264		ad5823_power_down(ad5823);
   265	err_cleanup_media:
   266		media_entity_cleanup(&ad5823->sd.entity);
   267	err_free_ctrl_handler:
   268		v4l2_ctrl_handler_free(&ad5823->ctrls.handler);
   269	
   270		return ret;
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


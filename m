Return-Path: <linux-media+bounces-17501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EAC96AD26
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 01:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 214731C2436B
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 23:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474C71D79A5;
	Tue,  3 Sep 2024 23:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACy/Nee5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7AB647
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 23:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725407984; cv=none; b=Ysa59KM+GH6U6PLPc7VbUQXTbsUcogkLzE+dQfxBiRTeg+NIfAGcDvs/VCtyBnnnZYL1x9wDUEk0pwgaSpU+c4M+fqh2GhU+GwXkJtQ74djGqqOPgFk7kxty5vZ4TsrzVweRQgkpf0YxqyZvZGnrm/gMC0FlTK1sy4Rz/0HuJIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725407984; c=relaxed/simple;
	bh=CNz1Vi+Fd84zTPTejzsG4YlgD9vGpS7cn9/Q10iQrP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGcJKI4GENWLqInQybPNdEkzxBglv4YNzWTBSIcjs7CPjHdL+QPkiQtWAudJ3ZMTqN2wAdrCAnYuRz30szNHHq4Ufwz9UFMqLn19P6EYU5ntIjTNuv2sIvwQJ/yWNfSkAlETGACx3eutO1ZFqlhCjL4EBhvUYJc0fXrDIkIQkww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACy/Nee5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725407983; x=1756943983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CNz1Vi+Fd84zTPTejzsG4YlgD9vGpS7cn9/Q10iQrP0=;
  b=ACy/Nee5FgDZlDz0PAKADrbg420t2MBx5BG7saGhLxoAocuEE+I4gDSn
   YGidmBJcLXa6Z0/ubEz2FsRt2GGYTgosnH6dafvbbuGaxzWJQ1xaO8g2G
   GVNXAEz5FWwwbwEs+8CVRurnMB/sIRTjd5kysfIQcGX6LjSl7+DlAubRt
   GFAvrRB6MT/Qj24/J2vaHt3NtX6SxfbFJSo7/+S6VclwOf19zriJPJ1i5
   65+aH6HZTLLQJ6OYjgCxzNOHP9H01DWQdguaB3VPXP4jL55BMSgllImvq
   EPV8Amn2gUIiS4QMGF+a4nNdKvpBlnhvZ5Ry4acpcyaejM7wVwcMQOU1m
   A==;
X-CSE-ConnectionGUID: XZVaiPJDRqaeBFx/m7a9tQ==
X-CSE-MsgGUID: 2i+GzCZcSrSjoqXJys4raQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="46567706"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="46567706"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 16:59:42 -0700
X-CSE-ConnectionGUID: EIQ2o7ltTYmSBGbjnTXtzQ==
X-CSE-MsgGUID: ogmJn+noSt2qZsTJhNaZ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="88322503"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Sep 2024 16:59:40 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sldQw-0007M4-0J;
	Tue, 03 Sep 2024 23:59:38 +0000
Date: Wed, 4 Sep 2024 07:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for AD5823 VCM
Message-ID: <202409040751.A1Dm1pgG-lkp@intel.com>
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
config: x86_64-randconfig-121-20240904 (https://download.01.org/0day-ci/archive/20240904/202409040751.A1Dm1pgG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040751.A1Dm1pgG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040751.A1Dm1pgG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/i2c/ad5823.c: In function 'ad5823_probe':
>> drivers/media/i2c/ad5823.c:203:26: error: implicit declaration of function 'devm_cci_regmap_init_i2c' [-Werror=implicit-function-declaration]
     203 |         ad5823->regmap = devm_cci_regmap_init_i2c(client, 8);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/ad5823.c:203:24: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     203 |         ad5823->regmap = devm_cci_regmap_init_i2c(client, 8);
         |                        ^
   cc1: some warnings being treated as errors


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


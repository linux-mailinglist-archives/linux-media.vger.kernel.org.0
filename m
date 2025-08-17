Return-Path: <linux-media+bounces-40053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1830EB29514
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 22:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2969188F505
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 20:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B02E24469E;
	Sun, 17 Aug 2025 20:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYKRLUAG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E8F15A85A;
	Sun, 17 Aug 2025 20:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755462575; cv=none; b=Mr+azAlYwJ+PbnIZFbte6rhYeJQaM/7jB4Ar/bmyp7rTmdHWCL+4w8ZhZj2/1e3mT7EhLyGgWoSF815Umo5lHsChLMuWpvvYfjT2PGsz8jlVxFxpjIilRWsrMdkxBoqraVhOCPqw1mchS2ol19UBgrEr8VM9zYEE1WdguYSvXI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755462575; c=relaxed/simple;
	bh=ppWZMewiso+fXL0z37LmHVHmRMB25oWTq/xd6pZnMmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jt5heyp42/Y/j/ecY+c0MPt0klgYcjDIIQsA4EjDgngn2mrELjGZcMoK1EptXxaxzKyttTzBnvwx8vHrm85FGz2m8A4MznNNCVBQl+zqDcZOHl0qw/V3R7IWI+V44gyzQ9fVoYoSresHCGWat6J+ytARjmZODUeKaGJElNpstuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYKRLUAG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755462574; x=1786998574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ppWZMewiso+fXL0z37LmHVHmRMB25oWTq/xd6pZnMmM=;
  b=mYKRLUAGRop7kM17ss7nCm0jGtRjHmiqD0A6NwwGRddXLman7sTPBSE4
   qj4IvInut9kI87L0StkwI/zk9yDwMOsBkyvS4xgM7DwhBfM/k+XmKCfqz
   UB0PUwy4r7k32xvDLPXa46jp6bLX+NJZEb0kYcvOf7BmybZf4JBZqTpay
   AOlRYxpopfTdeCnrLu8yA49UA9TrRDuRW3RSekDG5KvamAx8WlsFdXHcK
   tkSucsQE8/6ozJ7dw+A/7wGAUcle6JmfPIP1WLKVhT+kyPy9FteHqOgzt
   MHjE08diTlaILSR1Ja5alTZG8F2r++W23I4IcEzhibUyA8nbp57SbWAvf
   g==;
X-CSE-ConnectionGUID: 5BZsBsRYSIyH2F6MO1aIVg==
X-CSE-MsgGUID: 5VjZAqmUSqG2J7xwxTFD2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57620823"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57620823"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 13:29:33 -0700
X-CSE-ConnectionGUID: cAhd+sPWTESoXWboyK1riA==
X-CSE-MsgGUID: Dycyod70SVmv5SFUT1hY+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167336299"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Aug 2025 13:29:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unk0A-000Di7-22;
	Sun, 17 Aug 2025 20:29:25 +0000
Date: Mon, 18 Aug 2025 04:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch via B4 Relay <devnull+git.apitzsch.eu@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Subject: Re: [PATCH 3/7] media: i2c: dw9719: Add driver_data matching
Message-ID: <202508180429.GKdrjNK9-lkp@intel.com>
References: <20250817-dw9719-v1-3-426f46c69a5a@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250817-dw9719-v1-3-426f46c69a5a@apitzsch.eu>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1357b2649c026b51353c84ddd32bc963e8999603]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Apitzsch-via-B4-Relay/dt-bindings-media-i2c-Add-DW9718S-DW9719-and-DW9761-VCM/20250818-011316
base:   1357b2649c026b51353c84ddd32bc963e8999603
patch link:    https://lore.kernel.org/r/20250817-dw9719-v1-3-426f46c69a5a%40apitzsch.eu
patch subject: [PATCH 3/7] media: i2c: dw9719: Add driver_data matching
config: riscv-randconfig-002-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180429.GKdrjNK9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180429.GKdrjNK9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508180429.GKdrjNK9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/dw9719.c:285:18: warning: cast to smaller integer type 'enum dw9719_model' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     285 |         dw9719->model = (enum dw9719_model)i2c_get_match_data(client);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +285 drivers/media/i2c/dw9719.c

   275	
   276	static int dw9719_probe(struct i2c_client *client)
   277	{
   278		struct dw9719_device *dw9719;
   279		int ret;
   280	
   281		dw9719 = devm_kzalloc(&client->dev, sizeof(*dw9719), GFP_KERNEL);
   282		if (!dw9719)
   283			return -ENOMEM;
   284	
 > 285		dw9719->model = (enum dw9719_model)i2c_get_match_data(client);
   286	
   287		dw9719->regmap = devm_cci_regmap_init_i2c(client, 8);
   288		if (IS_ERR(dw9719->regmap))
   289			return PTR_ERR(dw9719->regmap);
   290	
   291		dw9719->dev = &client->dev;
   292	
   293		dw9719->regulator = devm_regulator_get(&client->dev, "vdd");
   294		if (IS_ERR(dw9719->regulator))
   295			return dev_err_probe(&client->dev, PTR_ERR(dw9719->regulator),
   296					     "getting regulator\n");
   297	
   298		v4l2_i2c_subdev_init(&dw9719->sd, client, &dw9719_ops);
   299		dw9719->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
   300		dw9719->sd.internal_ops = &dw9719_internal_ops;
   301	
   302		ret = dw9719_init_controls(dw9719);
   303		if (ret)
   304			return ret;
   305	
   306		ret = media_entity_pads_init(&dw9719->sd.entity, 0, NULL);
   307		if (ret < 0)
   308			goto err_free_ctrl_handler;
   309	
   310		dw9719->sd.entity.function = MEDIA_ENT_F_LENS;
   311	
   312		/*
   313		 * We need the driver to work in the event that pm runtime is disable in
   314		 * the kernel, so power up and verify the chip now. In the event that
   315		 * runtime pm is disabled this will leave the chip on, so that the lens
   316		 * will work.
   317		 */
   318	
   319		ret = dw9719_power_up(dw9719, true);
   320		if (ret)
   321			goto err_cleanup_media;
   322	
   323		pm_runtime_set_active(&client->dev);
   324		pm_runtime_get_noresume(&client->dev);
   325		pm_runtime_enable(&client->dev);
   326	
   327		ret = v4l2_async_register_subdev(&dw9719->sd);
   328		if (ret < 0)
   329			goto err_pm_runtime;
   330	
   331		pm_runtime_set_autosuspend_delay(&client->dev, 1000);
   332		pm_runtime_use_autosuspend(&client->dev);
   333		pm_runtime_put_autosuspend(&client->dev);
   334	
   335		return ret;
   336	
   337	err_pm_runtime:
   338		pm_runtime_disable(&client->dev);
   339		pm_runtime_put_noidle(&client->dev);
   340		dw9719_power_down(dw9719);
   341	err_cleanup_media:
   342		media_entity_cleanup(&dw9719->sd.entity);
   343	err_free_ctrl_handler:
   344		v4l2_ctrl_handler_free(&dw9719->ctrls.handler);
   345	
   346		return ret;
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


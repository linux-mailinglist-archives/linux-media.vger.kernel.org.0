Return-Path: <linux-media+bounces-48569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA6ECB3697
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 17:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE56E3064573
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 16:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47763002DF;
	Wed, 10 Dec 2025 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0DvzGfJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B724E2F5319;
	Wed, 10 Dec 2025 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765382507; cv=none; b=ubAVd3TDqUYB/wN6Vv6PF2UZcl8FX5ieuNqAlvJkZsOS89j2kjAhUeZ8WHqgwAmJLKDo7ZM4N+JooIpL9LkmPoqul93JhMBTfd6Wb/1WStRsQFIiDp3knMFzovcUM6Ud8Nh0ktqdip4Lredhp9MsxY1qlXucdDTeWOU6hsdJU1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765382507; c=relaxed/simple;
	bh=DMqnhMd8zxOKRREuez4JnKUznfDswO5OTMuAf/gTpxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYFHgSpYixKmKAub+kzCNxLAhE9/fy7Tsn2memCSUujb5g2ql/JPTQ/3G2a56k/Xp5STHmLsuns1JZTnCtb/0sBhq3l7SE/lXrS5sK/cdik6Y6W7WbBIqJR/pJPuTthTX0tcR8ZaINL+sTgTDva53CrEZbFwEmbANK08nGy1h1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0DvzGfJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765382497; x=1796918497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DMqnhMd8zxOKRREuez4JnKUznfDswO5OTMuAf/gTpxk=;
  b=B0DvzGfJXqnPxzj7qw0oVzSCRVfP1UczCWn5ayDTmZr0i0OEbOOLSCRD
   8w4v/btnaqMohPyrDWBayFzwZyQdyg04mH22xDkFKhC6b1kZZP5r95AZd
   d1gq6d0T0pb/RVNpS8AMiXW7fNLE1hySdzQ2NjX5eAEppaGEYuxIsh7+T
   tnsawFyHM29S0Lj+1VLf4YqPkELasGHyVl4hrrx1tX46+6UREF92rbkX/
   JrOfzA1YYzAZrd+n4y6lf91Du3WAzBxsPTkro+Pe+z+lIaNsNnNPBHjA5
   fneoclgxBtdhF7/2CWhqoHPUWbT2gJv2TkVpV+fS7LJLkt312fl+tXycN
   w==;
X-CSE-ConnectionGUID: wjekO1SFTUaFUYBIRUe3yw==
X-CSE-MsgGUID: DpMOyAxZRUWKc4rmYlWmkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67243285"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="67243285"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 08:01:30 -0800
X-CSE-ConnectionGUID: eP10MpgoT5W1ZvjbyujEiA==
X-CSE-MsgGUID: W0ozWpdNQmG38ShByCNc3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196451198"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Dec 2025 08:01:24 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTMd0-000000003LZ-1ng0;
	Wed, 10 Dec 2025 16:01:22 +0000
Date: Thu, 11 Dec 2025 00:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	sakari.ailus@linux.intel.com, krzk+dt@kernel.org, robh@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: add os05b10 image sensor driver
Message-ID: <202512102347.N5BM3QL7-lkp@intel.com>
References: <20251209100017.302518-3-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209100017.302518-3-himanshu.bhavani@siliconsignals.io>

Hi Himanshu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sailus-media-tree/master]
[also build test WARNING on robh/for-next linus/master v6.18 next-20251210]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himanshu-Bhavani/dt-bindings-media-i2c-Add-os05b10-sensor/20251209-180746
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20251209100017.302518-3-himanshu.bhavani%40siliconsignals.io
patch subject: [PATCH 2/2] media: i2c: add os05b10 image sensor driver
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20251210/202512102347.N5BM3QL7-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102347.N5BM3QL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102347.N5BM3QL7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/os05b10.c:19:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/media/i2c/os05b10.c:986:44: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     986 |                               "failed to initialize CCI: %d\n", ret);
         |                                                                 ^~~
   drivers/media/i2c/os05b10.c:972:9: note: initialize the variable 'ret' to silence this warning
     972 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +/ret +986 drivers/media/i2c/os05b10.c

   967	
   968	static int os05b10_probe(struct i2c_client *client)
   969	{
   970		struct os05b10 *os05b10;
   971		unsigned int xclk_freq;
   972		int ret;
   973	
   974		os05b10 = devm_kzalloc(&client->dev, sizeof(*os05b10), GFP_KERNEL);
   975		if (!os05b10)
   976			return -ENOMEM;
   977	
   978		os05b10->client = client;
   979		os05b10->dev = &client->dev;
   980	
   981		v4l2_i2c_subdev_init(&os05b10->sd, client, &os05b10_subdev_ops);
   982	
   983		os05b10->cci = devm_cci_regmap_init_i2c(client, 16);
   984		if (IS_ERR(os05b10->cci))
   985			return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->cci),
 > 986				      "failed to initialize CCI: %d\n", ret);
   987	
   988		/* Get system clock (xclk) */
   989		os05b10->xclk = devm_v4l2_sensor_clk_get(os05b10->dev, NULL);
   990		if (IS_ERR(os05b10->xclk))
   991			return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->xclk),
   992					     "failed to get xclk\n");
   993	
   994		xclk_freq = clk_get_rate(os05b10->xclk);
   995		if (xclk_freq != OS05B10_XCLK_FREQ)
   996			return dev_err_probe(os05b10->dev, -EINVAL,
   997					     "xclk frequency not supported: %d Hz\n",
   998					     xclk_freq);
   999	
  1000		ret = os05b10_get_regulators(os05b10);
  1001		if (ret)
  1002			return dev_err_probe(os05b10->dev, ret, "failed to get regulators\n");
  1003	
  1004		ret = os05b10_parse_endpoint(os05b10);
  1005		if (ret) {
  1006			dev_err(os05b10->dev, "failed to parse endpoint configuration\n");
  1007			return ret;
  1008		}
  1009	
  1010		os05b10->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
  1011		if (IS_ERR(os05b10->reset_gpio))
  1012			return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->reset_gpio),
  1013					     "failed to get reset GPIO\n");
  1014	
  1015		ret = os05b10_power_on(os05b10->dev);
  1016		if (ret)
  1017			return ret;
  1018	
  1019		ret = os05b10_identify_module(os05b10);
  1020		if (ret)
  1021			goto error_power_off;
  1022	
  1023		/* This needs the pm runtime to be registered. */
  1024		ret = os05b10_init_controls(os05b10);
  1025		if (ret)
  1026			goto error_power_off;
  1027	
  1028		/* Initialize subdev */
  1029		os05b10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
  1030		os05b10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
  1031		os05b10->sd.internal_ops = &os05b10_internal_ops;
  1032		os05b10->pad.flags = MEDIA_PAD_FL_SOURCE;
  1033	
  1034		ret = media_entity_pads_init(&os05b10->sd.entity, 1, &os05b10->pad);
  1035		if (ret) {
  1036			dev_err_probe(os05b10->dev, ret, "failed to init entity pads\n");
  1037			goto error_handler_free;
  1038		}
  1039	
  1040		os05b10->sd.state_lock = os05b10->handler.lock;
  1041		ret = v4l2_subdev_init_finalize(&os05b10->sd);
  1042		if (ret < 0) {
  1043			dev_err_probe(os05b10->dev, ret, "subdev init error\n");
  1044			goto error_media_entity;
  1045		}
  1046	
  1047		pm_runtime_set_active(os05b10->dev);
  1048		pm_runtime_enable(os05b10->dev);
  1049	
  1050		ret = v4l2_async_register_subdev_sensor(&os05b10->sd);
  1051		if (ret < 0) {
  1052			dev_err_probe(os05b10->dev, ret,
  1053				      "failed to register os05b10 sub-device\n");
  1054			goto error_subdev_cleanup;
  1055		}
  1056	
  1057		pm_runtime_idle(os05b10->dev);
  1058	
  1059		return 0;
  1060	
  1061	error_subdev_cleanup:
  1062		v4l2_subdev_cleanup(&os05b10->sd);
  1063		pm_runtime_disable(os05b10->dev);
  1064		pm_runtime_set_suspended(os05b10->dev);
  1065	
  1066	error_media_entity:
  1067		media_entity_cleanup(&os05b10->sd.entity);
  1068	
  1069	error_handler_free:
  1070		v4l2_ctrl_handler_free(os05b10->sd.ctrl_handler);
  1071	
  1072	error_power_off:
  1073		os05b10_power_off(os05b10->dev);
  1074	
  1075		return ret;
  1076	}
  1077	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


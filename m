Return-Path: <linux-media+bounces-43463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB9BAFEFC
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 11:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C24A81923983
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 09:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94191296BA8;
	Wed,  1 Oct 2025 09:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bh4KLlOM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038BC2877F0
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759312608; cv=none; b=GBKJil2nsD1OXxgA1JflIylMu56NDSM/3i4VBLnmqe4nC+08hdFfFeCSnuqVZMgHBENScOO6QFgpxn9hLUq9FCJKUA+PVN8EQyuvF3I0avvosANKF6RL3hqcykBVnsVgRSYqhy7s9JKvOo3z94651fY4PrekUY5dJoXgbTzLTOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759312608; c=relaxed/simple;
	bh=hwjD0fhnSwJsj/0UPm0JH2EGRXyH+6nbzMp6p3WLqGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mL9k98OwqOFdaMTiD3czFAfr0uK/vy9J6fJNXK/xW5WcADgbr42fZ5BcbKgDFtFb3toemLRRYZUVD9BObZXTbQIi515CUSkyzZj4ZO8Ml0tt/56IAxPzPCU7IOzsT24mrXyScKebQofTu5+AIY9D2EDtJIHe7b8NVE0Lc350ovg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bh4KLlOM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759312606; x=1790848606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hwjD0fhnSwJsj/0UPm0JH2EGRXyH+6nbzMp6p3WLqGM=;
  b=bh4KLlOM98KIMDDEJ659bx2KVtn5SpNU4KAbA4/o9Y4gy7qW1gZfhpzW
   X0T1FwjCPrTWQv8vTJHVlZLzChnLQsdtzR5WWn+aAt6p5tjDIW8LX4m/z
   p5I+cA7ms41uBDKYb+oTydE4uSMmHFyvJTqXnS7P/5X6KoAWe09QY6stk
   1CGOxjjtCgCHy5m8k3arinisvW8gCdkKxPHFIXBRZhEqXqtS6BFj+cgOD
   klklDTsdBoYgNi8S1pAY18R7pu2rmt3VJJO6mzGwFtNQPp6yJLh5F3P2a
   yYauoilMUm48W4rDjA/bP/8jzloMHwhZiJi1OG8zlHanI9sjiROcGnCDP
   Q==;
X-CSE-ConnectionGUID: NNfeZHBvToGGowqF5tIQBw==
X-CSE-MsgGUID: Rx/P8+4iRFqnPk+/kRCGOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60618369"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="60618369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 02:56:45 -0700
X-CSE-ConnectionGUID: 4Yy1QphmQceQxcOa3v2zIg==
X-CSE-MsgGUID: wAXZZ2ixSoq1w8MHHRB0jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="178798488"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Oct 2025 02:56:44 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3tZh-0002tb-1g;
	Wed, 01 Oct 2025 09:56:41 +0000
Date: Wed, 1 Oct 2025 17:55:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 30/73]
 drivers/media/i2c/ccs/ccs-core.c:1032:6: error: 'V4L2_CID_COLOR_PATTERN'
 undeclared; did you mean 'V4L2_CID_CFA_PATTERN'?
Message-ID: <202510011715.xFrUYlcl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   ba7808a5f3363959e2cd9a8afc4bb43f1e62f659
commit: d014de35ea501c3fc66a32a680731d0eea106cbb [30/73] media: ccs: Add support for embedded data stream
config: arc-randconfig-002-20251001 (https://download.01.org/0day-ci/archive/20251001/202510011715.xFrUYlcl-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510011715.xFrUYlcl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510011715.xFrUYlcl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/ccs/ccs-core.c: In function 'ccs_init_controls':
>> drivers/media/i2c/ccs/ccs-core.c:1032:6: error: 'V4L2_CID_COLOR_PATTERN' undeclared (first use in this function); did you mean 'V4L2_CID_CFA_PATTERN'?
         V4L2_CID_COLOR_PATTERN, sensor->default_pixel_order,
         ^~~~~~~~~~~~~~~~~~~~~~
         V4L2_CID_CFA_PATTERN
   drivers/media/i2c/ccs/ccs-core.c:1032:6: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/media/i2c/ccs/ccs-core.c:1037:6: error: 'V4L2_CID_COLOR_PATTERN_FLIP' undeclared (first use in this function); did you mean 'V4L2_CID_CFA_PATTERN_FLIP'?
         V4L2_CID_COLOR_PATTERN_FLIP,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         V4L2_CID_CFA_PATTERN_FLIP
>> drivers/media/i2c/ccs/ccs-core.c:1038:6: error: 'V4L2_COLOR_PATTERN_FLIP_BOTH' undeclared (first use in this function); did you mean 'V4L2_CFA_PATTERN_FLIP_BOTH'?
         V4L2_COLOR_PATTERN_FLIP_BOTH,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         V4L2_CFA_PATTERN_FLIP_BOTH


vim +1032 drivers/media/i2c/ccs/ccs-core.c

   829	
   830	static int ccs_init_controls(struct ccs_sensor *sensor)
   831	{
   832		struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
   833		struct v4l2_fwnode_device_properties props;
   834		int rval;
   835	
   836		rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 22);
   837		if (rval)
   838			return rval;
   839	
   840		sensor->pixel_array->ctrl_handler.lock = &sensor->mutex;
   841	
   842		rval = v4l2_fwnode_device_parse(&client->dev, &props);
   843		if (rval)
   844			return rval;
   845	
   846		rval = v4l2_ctrl_new_fwnode_properties(&sensor->pixel_array->ctrl_handler,
   847						       &ccs_ctrl_ops, &props);
   848		if (rval)
   849			return rval;
   850	
   851		switch (CCS_LIM(sensor, ANALOG_GAIN_CAPABILITY)) {
   852		case CCS_ANALOG_GAIN_CAPABILITY_GLOBAL: {
   853			struct {
   854				const char *name;
   855				u32 id;
   856				s32 value;
   857			} const gain_ctrls[] = {
   858				{ "Analogue Gain m0", V4L2_CID_CCS_ANALOGUE_GAIN_M0,
   859				  CCS_LIM(sensor, ANALOG_GAIN_M0), },
   860				{ "Analogue Gain c0", V4L2_CID_CCS_ANALOGUE_GAIN_C0,
   861				  CCS_LIM(sensor, ANALOG_GAIN_C0), },
   862				{ "Analogue Gain m1", V4L2_CID_CCS_ANALOGUE_GAIN_M1,
   863				  CCS_LIM(sensor, ANALOG_GAIN_M1), },
   864				{ "Analogue Gain c1", V4L2_CID_CCS_ANALOGUE_GAIN_C1,
   865				  CCS_LIM(sensor, ANALOG_GAIN_C1), },
   866			};
   867			struct v4l2_ctrl_config ctrl_cfg = {
   868				.type = V4L2_CTRL_TYPE_INTEGER,
   869				.ops = &ccs_ctrl_ops,
   870				.flags = V4L2_CTRL_FLAG_READ_ONLY,
   871				.step = 1,
   872			};
   873			unsigned int i;
   874	
   875			for (i = 0; i < ARRAY_SIZE(gain_ctrls); i++) {
   876				ctrl_cfg.name = gain_ctrls[i].name;
   877				ctrl_cfg.id = gain_ctrls[i].id;
   878				ctrl_cfg.min = ctrl_cfg.max = ctrl_cfg.def =
   879					gain_ctrls[i].value;
   880	
   881				v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
   882						     &ctrl_cfg, NULL);
   883			}
   884	
   885			v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler,
   886					  &ccs_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
   887					  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN),
   888					  CCS_LIM(sensor, ANALOG_GAIN_CODE_MAX),
   889					  max(CCS_LIM(sensor, ANALOG_GAIN_CODE_STEP),
   890					      1U),
   891					  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN));
   892		}
   893			break;
   894	
   895		case CCS_ANALOG_GAIN_CAPABILITY_ALTERNATE_GLOBAL: {
   896			struct {
   897				const char *name;
   898				u32 id;
   899				u16 min, max, step;
   900			} const gain_ctrls[] = {
   901				{
   902					"Analogue Linear Gain",
   903					V4L2_CID_CCS_ANALOGUE_LINEAR_GAIN,
   904					CCS_LIM(sensor, ANALOG_LINEAR_GAIN_MIN),
   905					CCS_LIM(sensor, ANALOG_LINEAR_GAIN_MAX),
   906					max(CCS_LIM(sensor,
   907						    ANALOG_LINEAR_GAIN_STEP_SIZE),
   908					    1U),
   909				},
   910				{
   911					"Analogue Exponential Gain",
   912					V4L2_CID_CCS_ANALOGUE_EXPONENTIAL_GAIN,
   913					CCS_LIM(sensor, ANALOG_EXPONENTIAL_GAIN_MIN),
   914					CCS_LIM(sensor, ANALOG_EXPONENTIAL_GAIN_MAX),
   915					max(CCS_LIM(sensor,
   916						    ANALOG_EXPONENTIAL_GAIN_STEP_SIZE),
   917					    1U),
   918				},
   919			};
   920			struct v4l2_ctrl_config ctrl_cfg = {
   921				.type = V4L2_CTRL_TYPE_INTEGER,
   922				.ops = &ccs_ctrl_ops,
   923			};
   924			unsigned int i;
   925	
   926			for (i = 0; i < ARRAY_SIZE(gain_ctrls); i++) {
   927				ctrl_cfg.name = gain_ctrls[i].name;
   928				ctrl_cfg.min = ctrl_cfg.def = gain_ctrls[i].min;
   929				ctrl_cfg.max = gain_ctrls[i].max;
   930				ctrl_cfg.step = gain_ctrls[i].step;
   931				ctrl_cfg.id = gain_ctrls[i].id;
   932	
   933				v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
   934						     &ctrl_cfg, NULL);
   935			}
   936		}
   937		}
   938	
   939		if (CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
   940		    (CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING |
   941		     CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION)) {
   942			const struct v4l2_ctrl_config ctrl_cfg = {
   943				.name = "Shading Correction",
   944				.type = V4L2_CTRL_TYPE_BOOLEAN,
   945				.id = V4L2_CID_CCS_SHADING_CORRECTION,
   946				.ops = &ccs_ctrl_ops,
   947				.max = 1,
   948				.step = 1,
   949			};
   950	
   951			v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
   952					     &ctrl_cfg, NULL);
   953		}
   954	
   955		if (CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
   956		    CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION) {
   957			const struct v4l2_ctrl_config ctrl_cfg = {
   958				.name = "Luminance Correction Level",
   959				.type = V4L2_CTRL_TYPE_BOOLEAN,
   960				.id = V4L2_CID_CCS_LUMINANCE_CORRECTION_LEVEL,
   961				.ops = &ccs_ctrl_ops,
   962				.max = 255,
   963				.step = 1,
   964				.def = 128,
   965			};
   966	
   967			sensor->luminance_level =
   968				v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
   969						     &ctrl_cfg, NULL);
   970		}
   971	
   972		if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
   973		    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL ||
   974		    CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
   975		    SMIAPP_DIGITAL_GAIN_CAPABILITY_PER_CHANNEL)
   976			v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler,
   977					  &ccs_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
   978					  CCS_LIM(sensor, DIGITAL_GAIN_MIN),
   979					  CCS_LIM(sensor, DIGITAL_GAIN_MAX),
   980					  max(CCS_LIM(sensor, DIGITAL_GAIN_STEP_SIZE),
   981					      1U),
   982					  0x100);
   983	
   984		/* Exposure limits will be updated soon, use just something here. */
   985		sensor->exposure = v4l2_ctrl_new_std(
   986			&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
   987			V4L2_CID_EXPOSURE, 0, 0, 1, 0);
   988	
   989		sensor->hflip = v4l2_ctrl_new_std(
   990			&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
   991			V4L2_CID_HFLIP, 0, 1, 1, 0);
   992		sensor->vflip = v4l2_ctrl_new_std(
   993			&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
   994			V4L2_CID_VFLIP, 0, 1, 1, 0);
   995	
   996		sensor->vblank = v4l2_ctrl_new_std(
   997			&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
   998			V4L2_CID_VBLANK, 0, 1, 1, 0);
   999	
  1000		if (sensor->vblank)
  1001			sensor->vblank->flags |= V4L2_CTRL_FLAG_UPDATE;
  1002	
  1003		sensor->hblank = v4l2_ctrl_new_std(
  1004			&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
  1005			V4L2_CID_HBLANK, 0, 1, 1, 0);
  1006	
  1007		if (sensor->hblank)
  1008			sensor->hblank->flags |= V4L2_CTRL_FLAG_UPDATE;
  1009	
  1010		sensor->pixel_rate_parray = v4l2_ctrl_new_std(
  1011			&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
  1012			V4L2_CID_PIXEL_RATE, 1, INT_MAX, 1, 1);
  1013	
  1014		v4l2_ctrl_new_std_menu_items(&sensor->pixel_array->ctrl_handler,
  1015					     &ccs_ctrl_ops, V4L2_CID_TEST_PATTERN,
  1016					     ARRAY_SIZE(ccs_test_patterns) - 1,
  1017					     0, 0, ccs_test_patterns);
  1018	
  1019		if (sensor->pixel_array->ctrl_handler.error) {
  1020			dev_err(&client->dev,
  1021				"pixel array controls initialization failed (%d)\n",
  1022				sensor->pixel_array->ctrl_handler.error);
  1023			return sensor->pixel_array->ctrl_handler.error;
  1024		}
  1025	
  1026		sensor->pixel_array->sd.ctrl_handler =
  1027			&sensor->pixel_array->ctrl_handler;
  1028	
  1029		v4l2_ctrl_cluster(2, &sensor->hflip);
  1030	
  1031		v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler, NULL,
> 1032				  V4L2_CID_COLOR_PATTERN, sensor->default_pixel_order,
  1033				  sensor->default_pixel_order, 1,
  1034				  sensor->default_pixel_order);
  1035	
  1036		v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler, NULL,
> 1037				  V4L2_CID_COLOR_PATTERN_FLIP,
> 1038				  V4L2_COLOR_PATTERN_FLIP_BOTH,
  1039				  V4L2_COLOR_PATTERN_FLIP_BOTH, 1,
  1040				  V4L2_COLOR_PATTERN_FLIP_BOTH);
  1041	
  1042		v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler, NULL,
  1043				  V4L2_CID_METADATA_LAYOUT,
  1044				  V4L2_METADATA_LAYOUT_CCS,
  1045				  V4L2_METADATA_LAYOUT_CCS, 1,
  1046				  V4L2_METADATA_LAYOUT_CCS);
  1047	
  1048		rval = v4l2_ctrl_handler_init(&sensor->src->ctrl_handler, 0);
  1049		if (rval)
  1050			return rval;
  1051	
  1052		sensor->src->ctrl_handler.lock = &sensor->mutex;
  1053	
  1054		sensor->pixel_rate_csi = v4l2_ctrl_new_std(
  1055			&sensor->src->ctrl_handler, &ccs_ctrl_ops,
  1056			V4L2_CID_PIXEL_RATE, 1, INT_MAX, 1, 1);
  1057	
  1058		if (sensor->src->ctrl_handler.error) {
  1059			dev_err(&client->dev,
  1060				"src controls initialization failed (%d)\n",
  1061				sensor->src->ctrl_handler.error);
  1062			return sensor->src->ctrl_handler.error;
  1063		}
  1064	
  1065		sensor->src->sd.ctrl_handler = &sensor->src->ctrl_handler;
  1066	
  1067		return 0;
  1068	}
  1069	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


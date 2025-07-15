Return-Path: <linux-media+bounces-37798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D25B06497
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 18:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FE7A3B0FD3
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 16:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB12727FD5A;
	Tue, 15 Jul 2025 16:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a99u3zCV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187EC266B41;
	Tue, 15 Jul 2025 16:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752597986; cv=none; b=iVV9PBahF9QOUDvkb7kVqNUXyQcH54114DLO3wOVzx62d/DnBI4LqbsTqZixThaZ4iutrJBQZKStJEiiuxoaq7b/27w3BuoaHsDLhywKdr4XaWMNtl386X05rT5YWs5Et22te3XOEbWbL/r6TkMfKCK1CYVF/b1FxNwwsfhGtps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752597986; c=relaxed/simple;
	bh=22HvQ6Zc/6Amvx/zKE+rf2riMH7AWYJkNTBXe0Fqt+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVFMWaKl5mBiF440WDZwFjUGXXEe1TqhO9MQq6t/FJ3NUuzyoRwNRLVYI3a4Av1TeM7ywSQNqBbss79sweixnSLUsE+tsHEVRHNxVSnZb1gfZnFi52hnokzP/hvrG6SalwBe0tYP/qU+ZXQA/5bw+dcgNHlEgYpsIuUOVHtdWuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a99u3zCV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752597984; x=1784133984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=22HvQ6Zc/6Amvx/zKE+rf2riMH7AWYJkNTBXe0Fqt+M=;
  b=a99u3zCVj/JppbXe3h4x1YlFqE8rtHjZLgXtj1h3Y+V1oImLpGtCyRI4
   +G2sTkJd/1y9zYrT6dTaDKsgglTN/nbq3Gj66Z+NQxiW12vv+PRcN/zaM
   t9pCSeaQHiQdIS5ACdRap3bkSZ6VQBD5UJVkn/OPMtVyPctFRoHQXHD/M
   Zf+UppqE7/aOGXKSrRdCrQsrKCU/dRfDzVxnbqqBdG1XzEmRvgaSEsXOB
   aGIYVpYgDJuUV4BBShQP8/oUheteMyITpaan5ACwW64h+Sn2LfSNqIQjW
   wuREIBqlh2mXmZ3TYoGpf4C2jgMsIwos7l2XgjpHzyfLXK8FsmD2nqwJT
   Q==;
X-CSE-ConnectionGUID: zi2DDB1ZSdm9MUa0cRIZOQ==
X-CSE-MsgGUID: 54h3ffi5S1WFWRumqAonag==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58637643"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="58637643"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 09:46:23 -0700
X-CSE-ConnectionGUID: xf3H1MT2R7+w6vn/ecZazg==
X-CSE-MsgGUID: H9TKfeIRS1+rs7nicLidLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="156674092"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jul 2025 09:46:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubinG-000BLn-2i;
	Tue, 15 Jul 2025 16:46:14 +0000
Date: Wed, 16 Jul 2025 00:45:29 +0800
From: kernel test robot <lkp@intel.com>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	kieran.bingham@ideasonboard.com, bryan.odonoghue@linaro.org,
	hao.yao@intel.com, mehdi.djait@linux.intel.com,
	dongcheng.yan@linux.intel.com, hverkuil@xs4all.nl, krzk@kernel.org,
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
	jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
	grosikop@amd.com, king.li@amd.com, dantony@amd.com,
	vengutta@amd.com, Phil.Jawich@amd.com,
	Pratap Nirujogi <pratap.nirujogi@amd.com>
Subject: Re: [PATCH v4] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <202507160002.wqQBk380-lkp@intel.com>
References: <20250714205805.1329403-1-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714205805.1329403-1-pratap.nirujogi@amd.com>

Hi Pratap,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on sailus-media-tree/master linus/master v6.16-rc6 next-20250715]
[cannot apply to sailus-media-tree/streams media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pratap-Nirujogi/media-i2c-Add-OV05C10-camera-sensor-driver/20250715-050130
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250714205805.1329403-1-pratap.nirujogi%40amd.com
patch subject: [PATCH v4] media: i2c: Add OV05C10 camera sensor driver
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250716/202507160002.wqQBk380-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160002.wqQBk380-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160002.wqQBk380-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ov05c10.c: In function 'ov05c10_init_controls':
   drivers/media/i2c/ov05c10.c:790:13: warning: variable 'max_items' set but not used [-Wunused-but-set-variable]
     790 |         u32 max_items;
         |             ^~~~~~~~~
   drivers/media/i2c/ov05c10.c: In function 'ov05c10_probe':
   drivers/media/i2c/ov05c10.c:964:24: error: implicit declaration of function 'devm_v4l2_sensor_clk_get' [-Werror=implicit-function-declaration]
     964 |         ov05c10->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/ov05c10.c:964:22: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     964 |         ov05c10->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
         |                      ^
   cc1: some warnings being treated as errors


vim +964 drivers/media/i2c/ov05c10.c

   780	
   781	static int ov05c10_init_controls(struct ov05c10 *ov05c10)
   782	{
   783		struct v4l2_ctrl_handler *ctrl_hdlr = &ov05c10->ctrl_handler;
   784		const struct ov05c10_mode *mode = ov05c10->cur_mode;
   785		struct v4l2_fwnode_device_properties props;
   786		s64 pixel_rate_max;
   787		s64 exposure_max;
   788		s64 vblank_def;
   789		s64 vblank_min;
 > 790		u32 max_items;
   791		s64 hblank;
   792		int ret;
   793	
   794		ret = v4l2_fwnode_device_parse(ov05c10->dev, &props);
   795		if (ret)
   796			goto err_hdl_free;
   797	
   798		ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
   799		if (ret)
   800			return ret;
   801	
   802		max_items = ARRAY_SIZE(ov05c10_link_freq_menu_items) - 1;
   803		ov05c10->link_freq =
   804			v4l2_ctrl_new_int_menu(ctrl_hdlr,
   805					       NULL,
   806					       V4L2_CID_LINK_FREQ,
   807					       __fls(ov05c10->link_freq_bitmap),
   808					       __ffs(ov05c10->link_freq_bitmap),
   809					       ov05c10_link_freq_menu_items);
   810		if (ov05c10->link_freq)
   811			ov05c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
   812	
   813		pixel_rate_max =
   814			link_freq_to_pixel_rate(ov05c10_link_freq_menu_items[0],
   815						mode->lanes);
   816		ov05c10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
   817							V4L2_CID_PIXEL_RATE,
   818							0, pixel_rate_max,
   819							1, pixel_rate_max);
   820	
   821		vblank_def = mode->vts_def - mode->height;
   822		vblank_min = mode->vts_min - mode->height;
   823		ov05c10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops,
   824						    V4L2_CID_VBLANK,
   825						    vblank_min,
   826						    OV05C10_VTS_MAX - mode->height,
   827						    1, vblank_def);
   828	
   829		hblank = mode->hts - mode->width;
   830		ov05c10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
   831						    V4L2_CID_HBLANK,
   832						    hblank, hblank, 1, hblank);
   833		if (ov05c10->hblank)
   834			ov05c10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
   835	
   836		exposure_max = mode->vts_def - OV05C10_EXPOSURE_MAX_MARGIN;
   837		ov05c10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops,
   838						      V4L2_CID_EXPOSURE,
   839						      OV05C10_EXPOSURE_MIN,
   840						      exposure_max,
   841						      OV05C10_EXPOSURE_STEP,
   842						      exposure_max);
   843	
   844		v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
   845				  OV05C10_ANA_GAIN_MIN, OV05C10_ANA_GAIN_MAX,
   846				  OV05C10_ANA_GAIN_STEP, OV05C10_ANA_GAIN_DEFAULT);
   847	
   848		v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
   849				  OV05C10_DGTL_GAIN_MIN, OV05C10_DGTL_GAIN_MAX,
   850				  OV05C10_DGTL_GAIN_STEP, OV05C10_DGTL_GAIN_DEFAULT);
   851	
   852		v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov05c10_ctrl_ops,
   853					     V4L2_CID_TEST_PATTERN,
   854					     ARRAY_SIZE(ov05c10_test_pattern_menu) - 1,
   855					     0, 0, ov05c10_test_pattern_menu);
   856	
   857		ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov05c10_ctrl_ops,
   858						      &props);
   859		if (ret)
   860			goto err_hdl_free;
   861	
   862		if (ctrl_hdlr->error) {
   863			ret = ctrl_hdlr->error;
   864			dev_err(ov05c10->dev, "V4L2 control init failed (%d)\n", ret);
   865			goto err_hdl_free;
   866		}
   867	
   868		ov05c10->sd.ctrl_handler = ctrl_hdlr;
   869	
   870		return 0;
   871	
   872	err_hdl_free:
   873		v4l2_ctrl_handler_free(ctrl_hdlr);
   874	
   875		return ret;
   876	}
   877	
   878	static int ov05c10_parse_endpoint(struct ov05c10 *ov05c10,
   879					  struct fwnode_handle *fwnode)
   880	{
   881		struct v4l2_fwnode_endpoint bus_cfg = {
   882			.bus_type = V4L2_MBUS_CSI2_DPHY
   883		};
   884		struct device *dev = ov05c10->dev;
   885		struct fwnode_handle *ep;
   886		int ret;
   887	
   888		ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
   889		if (!ep) {
   890			dev_err(dev, "Failed to get next endpoint\n");
   891			return -ENXIO;
   892		}
   893	
   894		ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
   895		fwnode_handle_put(ep);
   896		if (ret)
   897			return ret;
   898	
   899		if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV05C10_DATA_LANES) {
   900			dev_err(dev,
   901				"number of CSI2 data lanes %d is not supported\n",
   902				bus_cfg.bus.mipi_csi2.num_data_lanes);
   903			ret = -EINVAL;
   904			goto err_endpoint_free;
   905		}
   906	
   907		ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
   908					       bus_cfg.nr_of_link_frequencies,
   909					       ov05c10_link_freq_menu_items,
   910					       ARRAY_SIZE(ov05c10_link_freq_menu_items),
   911					       &ov05c10->link_freq_bitmap);
   912		if (ret)
   913			dev_err(dev, "v4l2_link_freq_to_bitmap fail with %d\n", ret);
   914	err_endpoint_free:
   915		v4l2_fwnode_endpoint_free(&bus_cfg);
   916	
   917		return ret;
   918	}
   919	
   920	static int ov05c10_runtime_resume(struct device *dev)
   921	{
   922		struct v4l2_subdev *sd = dev_get_drvdata(dev);
   923		struct ov05c10 *ov05c10 = to_ov05c10(sd);
   924		int ret;
   925	
   926		ret = clk_prepare_enable(ov05c10->clk);
   927		if (ret) {
   928			dev_err(dev, "failed to enable clock %d\n", ret);
   929			goto error;
   930		}
   931	
   932		ov05c10_sensor_power_set(ov05c10, true);
   933	
   934	error:
   935		return ret;
   936	}
   937	
   938	static int ov05c10_runtime_suspend(struct device *dev)
   939	{
   940		struct v4l2_subdev *sd = dev_get_drvdata(dev);
   941		struct ov05c10 *ov05c10 = to_ov05c10(sd);
   942	
   943		ov05c10_sensor_power_set(ov05c10, false);
   944		clk_disable_unprepare(ov05c10->clk);
   945	
   946		return 0;
   947	}
   948	
   949	static int ov05c10_probe(struct i2c_client *client)
   950	{
   951		struct ov05c10 *ov05c10;
   952		u32 clkfreq;
   953		int ret;
   954	
   955		ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10), GFP_KERNEL);
   956		if (!ov05c10)
   957			return -ENOMEM;
   958	
   959		ov05c10->dev = &client->dev;
   960		ov05c10->cur_mode = &ov05c10_supported_modes[0];
   961	
   962		struct fwnode_handle *fwnode = dev_fwnode(ov05c10->dev);
   963	
 > 964		ov05c10->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
   965		if (IS_ERR(ov05c10->clk))
   966			return dev_err_probe(&client->dev, PTR_ERR(ov05c10->clk),
   967					     "failed to get clk\n");
   968	
   969		clkfreq = clk_get_rate(ov05c10->clk);
   970		if (clkfreq != OV05C10_REF_CLK)
   971			return dev_err_probe(ov05c10->dev, -EINVAL,
   972					     "fail invalid clock freq %u, %lu expected\n",
   973					     clkfreq, OV05C10_REF_CLK);
   974	
   975		ret = ov05c10_parse_endpoint(ov05c10, fwnode);
   976		if (ret)
   977			return dev_err_probe(ov05c10->dev, -EINVAL,
   978					     "fail to parse endpoint\n");
   979	
   980		ov05c10->enable_gpio = devm_gpiod_get(ov05c10->dev, "enable",
   981						      GPIOD_OUT_LOW);
   982		if (IS_ERR(ov05c10->enable_gpio))
   983			return dev_err_probe(ov05c10->dev,
   984					     PTR_ERR(ov05c10->enable_gpio),
   985					     "fail to get enable gpio\n");
   986	
   987		ov05c10->regmap = devm_cci_regmap_init_i2c(client, 8);
   988		if (IS_ERR(ov05c10->regmap))
   989			return dev_err_probe(ov05c10->dev, PTR_ERR(ov05c10->regmap),
   990					     "fail to init cci\n");
   991	
   992		ov05c10->cur_page = -1;
   993		ov05c10->page_ctrl_reg = OV05C10_REG_PAGE_CTL;
   994	
   995		/*
   996		 * Enable power management. The driver supports runtime PM, but needs to
   997		 * work when runtime PM is disabled in the kernel. To that end, power
   998		 * the sensor on manually here.
   999		 */
  1000		ov05c10_sensor_power_set(ov05c10, true);
  1001	
  1002		/*
  1003		 * Enable runtime PM with autosuspend. As the device has been powered
  1004		 * manually, mark it as active, and increase the usage count without
  1005		 * resuming the device.
  1006		 */
  1007		pm_runtime_set_active(ov05c10->dev);
  1008		pm_runtime_get_noresume(ov05c10->dev);
  1009		pm_runtime_enable(ov05c10->dev);
  1010		pm_runtime_set_autosuspend_delay(ov05c10->dev, 1000);
  1011		pm_runtime_use_autosuspend(ov05c10->dev);
  1012	
  1013		v4l2_i2c_subdev_init(&ov05c10->sd, client, &ov05c10_subdev_ops);
  1014	
  1015		ret = ov05c10_runtime_resume(&client->dev);
  1016		if (ret)
  1017			return dev_err_probe(&client->dev, ret,
  1018					     "failed to power-on the sensor");
  1019	
  1020		ret = ov05c10_init_controls(ov05c10);
  1021		if (ret) {
  1022			dev_err(ov05c10->dev, "fail to init ov05c10 ctl %d\n", ret);
  1023			goto err_pm;
  1024		}
  1025	
  1026		ov05c10->sd.internal_ops = &ov05c10_internal_ops;
  1027		ov05c10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
  1028		ov05c10->sd.entity.ops = &ov05c10_subdev_entity_ops;
  1029		ov05c10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
  1030	
  1031		ov05c10->pad.flags = MEDIA_PAD_FL_SOURCE;
  1032	
  1033		ret = media_entity_pads_init(&ov05c10->sd.entity, OV05C10_NUM_OF_PADS,
  1034					     &ov05c10->pad);
  1035		if (ret) {
  1036			dev_err(ov05c10->dev, "fail to init ov05c10 pads %d\n", ret);
  1037			goto err_hdl_free;
  1038		}
  1039	
  1040		ret = v4l2_subdev_init_finalize(&ov05c10->sd);
  1041		if (ret < 0) {
  1042			dev_err(ov05c10->dev, "fail to finalize ov05c10 subdev init %d\n", ret);
  1043			goto err_media_entity_cleanup;
  1044		}
  1045	
  1046		ret = v4l2_async_register_subdev_sensor(&ov05c10->sd);
  1047		if (ret) {
  1048			dev_err(ov05c10->dev, "fail to register ov05c10 subdev %d\n", ret);
  1049			goto err_media_entity_cleanup;
  1050		}
  1051	
  1052		return 0;
  1053	
  1054	err_media_entity_cleanup:
  1055		media_entity_cleanup(&ov05c10->sd.entity);
  1056	err_hdl_free:
  1057		v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);
  1058	err_pm:
  1059		pm_runtime_disable(ov05c10->dev);
  1060		pm_runtime_put_noidle(ov05c10->dev);
  1061		ov05c10_sensor_power_set(ov05c10, false);
  1062		return ret;
  1063	}
  1064	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


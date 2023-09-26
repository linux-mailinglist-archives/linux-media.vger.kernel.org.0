Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F33F17AF579
	for <lists+linux-media@lfdr.de>; Tue, 26 Sep 2023 22:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235845AbjIZUot (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Sep 2023 16:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235920AbjIZUom (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Sep 2023 16:44:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3D211D
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695761074; x=1727297074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3hZATkc12oAjOdOaGRP4gFrd4xhf+ywYnPH79VfOb9I=;
  b=SSjGpYWhIbvUvELkXBE7EIfKF2I3sTAHnegY9ioqI+70PTAhC0zihxkO
   Zvw3cXspJS0w51anpzVBn+bt0VBtHR5jFgQ8KN5CRPaz86uTa3rJr5aA/
   /0hSsX9l5Pm+5T3OJXeGnL+l/zbtHfyvKTEmL6pCzBsuhHXwLDzKq9BPT
   vk9hZs/kvPD04hgVSihkEgNlcFM6u/yCQ1OYP8bmE8YhoL/Czy4t0Cu0J
   O2Jx5pyx9ecRi+urbcGgB8Q9WiMosKKZVmMZp7FEflE9DfxKQBjL7aF5A
   1u2Affb+cKvsnVf+G8Mn/9v80Roqor2bniZsqRKpv/up6gd+augLK7fSz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445796727"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="445796727"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 13:44:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="784091622"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="784091622"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Sep 2023 13:44:33 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlEv1-0003Lb-0T;
        Tue, 26 Sep 2023 20:44:31 +0000
Date:   Wed, 27 Sep 2023 04:44:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 42/42]
 drivers/media/i2c/ov2740.c:1049:25: warning: unused variable 'j'
Message-ID: <202309270407.1ZLrOldj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   9a2e5f20d07ed3d25317c6e7bc42b79a89435ad5
commit: 9a2e5f20d07ed3d25317c6e7bc42b79a89435ad5 [42/42] hacks
config: arc-randconfig-001-20230927 (https://download.01.org/0day-ci/archive/20230927/202309270407.1ZLrOldj-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270407.1ZLrOldj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270407.1ZLrOldj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ov2740.c: In function 'ov2740_check_hwcfg':
>> drivers/media/i2c/ov2740.c:1049:25: warning: unused variable 'j' [-Wunused-variable]
    1049 |         unsigned int i, j;
         |                         ^
>> drivers/media/i2c/ov2740.c:1049:22: warning: unused variable 'i' [-Wunused-variable]
    1049 |         unsigned int i, j;
         |                      ^


vim +/j +1049 drivers/media/i2c/ov2740.c

866edc895171f1 Bingbu Cao      2020-05-11  1039  
866edc895171f1 Bingbu Cao      2020-05-11  1040  static int ov2740_check_hwcfg(struct device *dev)
866edc895171f1 Bingbu Cao      2020-05-11  1041  {
866edc895171f1 Bingbu Cao      2020-05-11  1042  	struct fwnode_handle *ep;
866edc895171f1 Bingbu Cao      2020-05-11  1043  	struct fwnode_handle *fwnode = dev_fwnode(dev);
866edc895171f1 Bingbu Cao      2020-05-11  1044  	struct v4l2_fwnode_endpoint bus_cfg = {
866edc895171f1 Bingbu Cao      2020-05-11  1045  		.bus_type = V4L2_MBUS_CSI2_DPHY
866edc895171f1 Bingbu Cao      2020-05-11  1046  	};
866edc895171f1 Bingbu Cao      2020-05-11  1047  	u32 mclk;
866edc895171f1 Bingbu Cao      2020-05-11  1048  	int ret;
866edc895171f1 Bingbu Cao      2020-05-11 @1049  	unsigned int i, j;
866edc895171f1 Bingbu Cao      2020-05-11  1050  
866edc895171f1 Bingbu Cao      2020-05-11  1051  	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
866edc895171f1 Bingbu Cao      2020-05-11  1052  	if (ret)
866edc895171f1 Bingbu Cao      2020-05-11  1053  		return ret;
866edc895171f1 Bingbu Cao      2020-05-11  1054  
a55ae53c554ed0 Andy Shevchenko 2022-07-26  1055  	if (mclk != OV2740_MCLK)
a55ae53c554ed0 Andy Shevchenko 2022-07-26  1056  		return dev_err_probe(dev, -EINVAL,
a55ae53c554ed0 Andy Shevchenko 2022-07-26  1057  				     "external clock %d is not supported\n",
a55ae53c554ed0 Andy Shevchenko 2022-07-26  1058  				     mclk);
866edc895171f1 Bingbu Cao      2020-05-11  1059  
866edc895171f1 Bingbu Cao      2020-05-11  1060  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
866edc895171f1 Bingbu Cao      2020-05-11  1061  	if (!ep)
6ad63575cf7331 Sakari Ailus    2023-09-08  1062  		return -EPROBE_DEFER;
866edc895171f1 Bingbu Cao      2020-05-11  1063  
866edc895171f1 Bingbu Cao      2020-05-11  1064  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
866edc895171f1 Bingbu Cao      2020-05-11  1065  	fwnode_handle_put(ep);
866edc895171f1 Bingbu Cao      2020-05-11  1066  	if (ret)
866edc895171f1 Bingbu Cao      2020-05-11  1067  		return ret;
866edc895171f1 Bingbu Cao      2020-05-11  1068  
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1069  	/* if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV2740_DATA_LANES) { */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1070  	/* 	ret = dev_err_probe(dev, -EINVAL, */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1071  	/* 			    "number of CSI2 data lanes %d is not supported\n", */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1072  	/* 			    bus_cfg.bus.mipi_csi2.num_data_lanes); */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1073  	/* 	goto check_hwcfg_error; */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1074  	/* } */
866edc895171f1 Bingbu Cao      2020-05-11  1075  
866edc895171f1 Bingbu Cao      2020-05-11  1076  	if (!bus_cfg.nr_of_link_frequencies) {
a55ae53c554ed0 Andy Shevchenko 2022-07-26  1077  		ret = dev_err_probe(dev, -EINVAL, "no link frequencies defined\n");
866edc895171f1 Bingbu Cao      2020-05-11  1078  		goto check_hwcfg_error;
866edc895171f1 Bingbu Cao      2020-05-11  1079  	}
866edc895171f1 Bingbu Cao      2020-05-11  1080  
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1081  	/* for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) { */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1082  	/* 	for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) { */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1083  	/* 		if (link_freq_menu_items[i] == */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1084  	/* 			bus_cfg.link_frequencies[j]) */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1085  	/* 			break; */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1086  	/* 	} */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1087  
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1088  	/* 	if (j == bus_cfg.nr_of_link_frequencies) { */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1089  	/* 		ret = dev_err_probe(dev, -EINVAL, */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1090  	/* 				    "no link frequency %lld supported\n", */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1091  	/* 				    link_freq_menu_items[i]); */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1092  	/* 		goto check_hwcfg_error; */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1093  	/* 	} */
9a2e5f20d07ed3 Sakari Ailus    2023-09-08  1094  	/* } */
866edc895171f1 Bingbu Cao      2020-05-11  1095  
866edc895171f1 Bingbu Cao      2020-05-11  1096  check_hwcfg_error:
866edc895171f1 Bingbu Cao      2020-05-11  1097  	v4l2_fwnode_endpoint_free(&bus_cfg);
866edc895171f1 Bingbu Cao      2020-05-11  1098  
866edc895171f1 Bingbu Cao      2020-05-11  1099  	return ret;
866edc895171f1 Bingbu Cao      2020-05-11  1100  }
866edc895171f1 Bingbu Cao      2020-05-11  1101  

:::::: The code at line 1049 was first introduced by commit
:::::: 866edc895171f1256aad3e81dce193447955c202 media: i2c: Add ov2740 image sensor driver

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Return-Path: <linux-media+bounces-2163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF01A80DBBC
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 21:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95B4D1F21BDC
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 20:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8805465E;
	Mon, 11 Dec 2023 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GaAu6R5M"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5730310B
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 12:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702327058; x=1733863058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2kZgK+Azl0i+jQycTVfutPvf19qddGVf1z6teDm6mjs=;
  b=GaAu6R5Mh/vSf86hdyNcuuQu3tfO4ReyJb8T7+JetR0CWMabV2UilkB4
   WM2mpEoajrq6HH2rpFPQ2kQEOe8K5gEVHlyjZSWrb8+A/JHdyUwtN1LuI
   aoO6VCBaEwEbtOJDOU4bkXR3O8cVFfdGA8DSul4AEWmwZSD+Cr8kXzbc/
   1Ww6otvDAcEWDUTaoHz4vTUQs/jBbG1ZrGqn7LnLaN0re6sDdPCInB+hj
   XShdDVDj2GXXnqhKccpRZPmkfpbZH5vBhq/ON1ylWIPWrEhKEX9YUZuJn
   onkv+a1cKyy8UNT4IgJPhTM1P6F33oweFrvZRsCtBrl8bNRSZaD6KbiLI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1576472"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1576472"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 12:37:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946469699"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="946469699"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 11 Dec 2023 12:37:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCn1w-000ISi-2u;
	Mon, 11 Dec 2023 20:37:32 +0000
Date: Tue, 12 Dec 2023 04:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 2/4] media: imx334: Use v4l2_link_frequencies_to_bitmap
 helper
Message-ID: <202312120434.56RvVcwQ-lkp@intel.com>
References: <20231211140658.366268-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211140658.366268-3-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master linus/master v6.7-rc5 next-20231211]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-Add-a-helper-for-setting-up-link-frequencies-control/20231211-220844
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231211140658.366268-3-sakari.ailus%40linux.intel.com
patch subject: [PATCH 2/4] media: imx334: Use v4l2_link_frequencies_to_bitmap helper
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231212/202312120434.56RvVcwQ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312120434.56RvVcwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120434.56RvVcwQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx334.c:1115:15: warning: unused variable 'i' [-Wunused-variable]
           unsigned int i, j;
                        ^
>> drivers/media/i2c/imx334.c:1115:18: warning: unused variable 'j' [-Wunused-variable]
           unsigned int i, j;
                           ^
   2 warnings generated.


vim +/i +1115 drivers/media/i2c/imx334.c

9746b11715c394 Martina Krasteva 2021-02-03  1100  
9746b11715c394 Martina Krasteva 2021-02-03  1101  /**
9746b11715c394 Martina Krasteva 2021-02-03  1102   * imx334_parse_hw_config() - Parse HW configuration and check if supported
9746b11715c394 Martina Krasteva 2021-02-03  1103   * @imx334: pointer to imx334 device
9746b11715c394 Martina Krasteva 2021-02-03  1104   *
9746b11715c394 Martina Krasteva 2021-02-03  1105   * Return: 0 if successful, error code otherwise.
9746b11715c394 Martina Krasteva 2021-02-03  1106   */
9746b11715c394 Martina Krasteva 2021-02-03  1107  static int imx334_parse_hw_config(struct imx334 *imx334)
9746b11715c394 Martina Krasteva 2021-02-03  1108  {
9746b11715c394 Martina Krasteva 2021-02-03  1109  	struct fwnode_handle *fwnode = dev_fwnode(imx334->dev);
9746b11715c394 Martina Krasteva 2021-02-03  1110  	struct v4l2_fwnode_endpoint bus_cfg = {
9746b11715c394 Martina Krasteva 2021-02-03  1111  		.bus_type = V4L2_MBUS_CSI2_DPHY
9746b11715c394 Martina Krasteva 2021-02-03  1112  	};
9746b11715c394 Martina Krasteva 2021-02-03  1113  	struct fwnode_handle *ep;
9746b11715c394 Martina Krasteva 2021-02-03  1114  	unsigned long rate;
e3269ea5148d39 Shravan Chippa   2023-04-14 @1115  	unsigned int i, j;
9746b11715c394 Martina Krasteva 2021-02-03  1116  	int ret;
9746b11715c394 Martina Krasteva 2021-02-03  1117  
9746b11715c394 Martina Krasteva 2021-02-03  1118  	if (!fwnode)
9746b11715c394 Martina Krasteva 2021-02-03  1119  		return -ENXIO;
9746b11715c394 Martina Krasteva 2021-02-03  1120  
9746b11715c394 Martina Krasteva 2021-02-03  1121  	/* Request optional reset pin */
9746b11715c394 Martina Krasteva 2021-02-03  1122  	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
9746b11715c394 Martina Krasteva 2021-02-03  1123  						     GPIOD_OUT_LOW);
9746b11715c394 Martina Krasteva 2021-02-03  1124  	if (IS_ERR(imx334->reset_gpio)) {
c702e2f70275db Hans Verkuil     2021-02-08  1125  		dev_err(imx334->dev, "failed to get reset gpio %ld",
c702e2f70275db Hans Verkuil     2021-02-08  1126  			PTR_ERR(imx334->reset_gpio));
9746b11715c394 Martina Krasteva 2021-02-03  1127  		return PTR_ERR(imx334->reset_gpio);
9746b11715c394 Martina Krasteva 2021-02-03  1128  	}
9746b11715c394 Martina Krasteva 2021-02-03  1129  
9746b11715c394 Martina Krasteva 2021-02-03  1130  	/* Get sensor input clock */
9746b11715c394 Martina Krasteva 2021-02-03  1131  	imx334->inclk = devm_clk_get(imx334->dev, NULL);
9746b11715c394 Martina Krasteva 2021-02-03  1132  	if (IS_ERR(imx334->inclk)) {
9746b11715c394 Martina Krasteva 2021-02-03  1133  		dev_err(imx334->dev, "could not get inclk");
9746b11715c394 Martina Krasteva 2021-02-03  1134  		return PTR_ERR(imx334->inclk);
9746b11715c394 Martina Krasteva 2021-02-03  1135  	}
9746b11715c394 Martina Krasteva 2021-02-03  1136  
9746b11715c394 Martina Krasteva 2021-02-03  1137  	rate = clk_get_rate(imx334->inclk);
9746b11715c394 Martina Krasteva 2021-02-03  1138  	if (rate != IMX334_INCLK_RATE) {
9746b11715c394 Martina Krasteva 2021-02-03  1139  		dev_err(imx334->dev, "inclk frequency mismatch");
9746b11715c394 Martina Krasteva 2021-02-03  1140  		return -EINVAL;
9746b11715c394 Martina Krasteva 2021-02-03  1141  	}
9746b11715c394 Martina Krasteva 2021-02-03  1142  
9746b11715c394 Martina Krasteva 2021-02-03  1143  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
9746b11715c394 Martina Krasteva 2021-02-03  1144  	if (!ep)
9746b11715c394 Martina Krasteva 2021-02-03  1145  		return -ENXIO;
9746b11715c394 Martina Krasteva 2021-02-03  1146  
9746b11715c394 Martina Krasteva 2021-02-03  1147  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
9746b11715c394 Martina Krasteva 2021-02-03  1148  	fwnode_handle_put(ep);
9746b11715c394 Martina Krasteva 2021-02-03  1149  	if (ret)
9746b11715c394 Martina Krasteva 2021-02-03  1150  		return ret;
9746b11715c394 Martina Krasteva 2021-02-03  1151  
9746b11715c394 Martina Krasteva 2021-02-03  1152  	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX334_NUM_DATA_LANES) {
9746b11715c394 Martina Krasteva 2021-02-03  1153  		dev_err(imx334->dev,
9746b11715c394 Martina Krasteva 2021-02-03  1154  			"number of CSI2 data lanes %d is not supported",
9746b11715c394 Martina Krasteva 2021-02-03  1155  			bus_cfg.bus.mipi_csi2.num_data_lanes);
9746b11715c394 Martina Krasteva 2021-02-03  1156  		ret = -EINVAL;
9746b11715c394 Martina Krasteva 2021-02-03  1157  		goto done_endpoint_free;
9746b11715c394 Martina Krasteva 2021-02-03  1158  	}
9746b11715c394 Martina Krasteva 2021-02-03  1159  
4b895656c4c2b2 Sakari Ailus     2023-12-11  1160  	ret = v4l2_link_frequencies_to_bitmap(imx334->dev,
4b895656c4c2b2 Sakari Ailus     2023-12-11  1161  					      bus_cfg.link_frequencies,
4b895656c4c2b2 Sakari Ailus     2023-12-11  1162  					      bus_cfg.nr_of_link_frequencies,
4b895656c4c2b2 Sakari Ailus     2023-12-11  1163  					      link_freq, ARRAY_SIZE(link_freq),
4b895656c4c2b2 Sakari Ailus     2023-12-11  1164  					      &imx334->link_freq_bitmap);
9746b11715c394 Martina Krasteva 2021-02-03  1165  
9746b11715c394 Martina Krasteva 2021-02-03  1166  done_endpoint_free:
9746b11715c394 Martina Krasteva 2021-02-03  1167  	v4l2_fwnode_endpoint_free(&bus_cfg);
9746b11715c394 Martina Krasteva 2021-02-03  1168  
9746b11715c394 Martina Krasteva 2021-02-03  1169  	return ret;
9746b11715c394 Martina Krasteva 2021-02-03  1170  }
9746b11715c394 Martina Krasteva 2021-02-03  1171  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


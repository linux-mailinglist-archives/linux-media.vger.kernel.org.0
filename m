Return-Path: <linux-media+bounces-43467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B858BB0129
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 12:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 787637AFF91
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 10:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF40E2C11F4;
	Wed,  1 Oct 2025 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltPwJR9O"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CA22C11C4
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759316272; cv=none; b=myYGJF3HUgsoxvMAtn2IL/2PzavTOWRrcl82/btbksNu7AxlJ08fIMIq3A3HS71isUxnKLR+N9S5N2YY26vRzWaNhVVZ//uR/YGNfhkwKau1+QRv9dRKd+hb2gfLJgcCccCf0dLtDyiJzlHfpwvmWYcrOs78+uqfDfXF0Ki+Vpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759316272; c=relaxed/simple;
	bh=I5UHrnDJ/jELA8m5hFTMnMMRJZOKXe8QY+tVO0EBmPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OCN9hqfRaC/Zq0u6jEXtopuslHqWkYjO4a7HbbRl+eT9Ui7Buuf2MDbuGYULhf1XUQuH+KSi2Z/EoBSHbQhf38IYwqgKxTPL+LwFWFUmFRww4j1hxhJdlTaeuV6P6s6c2MNDkgE7D/OcROw9IB9hvCa1Ilnsh1Ov/b5cZ8Hjdzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltPwJR9O; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759316270; x=1790852270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I5UHrnDJ/jELA8m5hFTMnMMRJZOKXe8QY+tVO0EBmPc=;
  b=ltPwJR9OOhMGemMHTpgtZkdH9CU70gqgjVzwaAK9iXRnobjRMSKCy5vT
   4TiS3E8Br5i/aqlEcxf+thZ+XxT10I6l36ZOwI7yiqPxZ7KnRE6ZK2nUI
   C+41gYeZdb2uEHmc7EnBzzidY3d/8saVNrx4CqKPKUptv4UuUgjFf3HPb
   oNlr5d4sWmSbCF8ToidtOlzbRy5jeDnDW5Txq2bIbbY/HjwK/095T+mVe
   /TmN+IegY5qJ9i8UPRskMp3420ob8GKtI/ZyBl5KfgOxUXJSrOuqFt5hf
   gIxNesigUAhxIaLHHHQFoZh0oRfwSUMVLM6UgS+z++iNtieCpMV2RNCZP
   g==;
X-CSE-ConnectionGUID: M9Ry+7jVSwOaRVCBqKClcg==
X-CSE-MsgGUID: V5V4X8WwQbuc2vmbo+y1Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65405462"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65405462"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 03:57:50 -0700
X-CSE-ConnectionGUID: 6XBrrRF/R2W9nsZis2V+TQ==
X-CSE-MsgGUID: TKnv1J32QOKwfxRW80R79Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="209483107"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Oct 2025 03:57:48 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3uWo-0002vX-1R;
	Wed, 01 Oct 2025 10:57:46 +0000
Date: Wed, 1 Oct 2025 18:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 47/73]
 drivers/media/i2c/ov2740.c:985:42: error: 'client' undeclared
Message-ID: <202510011855.Lg39xxNl-lkp@intel.com>
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
commit: 7b24bfc3b454db19fc1a4ad0009f6f817c9bb039 [47/73] media: ov2740: Add support for embedded data
config: csky-randconfig-002-20251001 (https://download.01.org/0day-ci/archive/20251001/202510011855.Lg39xxNl-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510011855.Lg39xxNl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510011855.Lg39xxNl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/ov2740.c: In function 'ov2740_enable_streams':
>> drivers/media/i2c/ov2740.c:985:42: error: 'client' undeclared (first use in this function)
     985 |         ret = pm_runtime_resume_and_get(&client->dev);
         |                                          ^~~~~~
   drivers/media/i2c/ov2740.c:985:42: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/i2c/ov2740.c: In function 'ov2740_disable_streams':
   drivers/media/i2c/ov2740.c:1060:25: error: 'client' undeclared (first use in this function)
    1060 |         pm_runtime_put(&client->dev);
         |                         ^~~~~~


vim +/client +985 drivers/media/i2c/ov2740.c

   970	
   971	static int ov2740_enable_streams(struct v4l2_subdev *sd,
   972					 struct v4l2_subdev_state *state, u32 pad,
   973					 u64 streams_mask)
   974	{
   975		struct ov2740 *ov2740 = to_ov2740(sd);
   976		const struct ov2740_reg_list *reg_list;
   977		int link_freq_index;
   978		int ret;
   979	
   980		if (ov2740->streaming) {
   981			ov2740->streaming |= streams_mask;
   982			return 0;
   983		}
   984	
 > 985		ret = pm_runtime_resume_and_get(&client->dev);
   986		if (ret < 0)
   987			return ret;
   988	
   989		ret = ov2740_identify_module(ov2740);
   990		if (ret)
   991			goto out_pm_put;
   992	
   993		if (ov2740->nvm)
   994			ov2740_load_otp_data(ov2740->nvm);
   995	
   996		/* Reset the sensor */
   997		ret = ov2740_write_reg(ov2740, 0x0103, 1, 0x01);
   998		if (ret) {
   999			dev_err(ov2740->dev, "failed to reset\n");
  1000			goto out_pm_put;
  1001		}
  1002	
  1003		usleep_range(10000, 15000);
  1004	
  1005		link_freq_index = ov2740->cur_mode->link_freq_index;
  1006		reg_list = &link_freq_configs[link_freq_index].reg_list;
  1007		ret = ov2740_write_reg_list(ov2740, reg_list);
  1008		if (ret) {
  1009			dev_err(ov2740->dev, "failed to set plls\n");
  1010			goto out_pm_put;
  1011		}
  1012	
  1013		reg_list = &ov2740->cur_mode->reg_list;
  1014		ret = ov2740_write_reg_list(ov2740, reg_list);
  1015		if (ret) {
  1016			dev_err(ov2740->dev, "failed to set mode\n");
  1017			goto out_pm_put;
  1018		}
  1019	
  1020		ret = __v4l2_ctrl_handler_setup(ov2740->sd.ctrl_handler);
  1021		if (ret)
  1022			goto out_pm_put;
  1023	
  1024		ret = ov2740_write_reg(ov2740, OV2740_REG_EMBEDDED_FLAG, 1,
  1025				       OV2740_EMBEDDED_FLAG_MYSTERY);
  1026		if (ret)
  1027			goto out_pm_put;
  1028	
  1029		ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
  1030				       OV2740_MODE_STREAMING);
  1031		if (ret) {
  1032			dev_err(&client->dev, "failed to start streaming\n");
  1033			goto out_pm_put;
  1034		}
  1035	
  1036		ov2740->streaming |= streams_mask;
  1037	
  1038		return 0;
  1039	
  1040	out_pm_put:
  1041		pm_runtime_put(&client->dev);
  1042	
  1043		return ret;
  1044	}
  1045	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


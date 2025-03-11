Return-Path: <linux-media+bounces-27986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A90C7A5B178
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 01:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 337B11886A79
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 00:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC2828E7;
	Tue, 11 Mar 2025 00:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKpbNtra"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB145258
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 00:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741651798; cv=none; b=FEWL1HmToYsKpg6gd/6b1+FlAytsq2wHWz/k8PimB+kPKHB4OIhh4ciyZD4o507dU4gcNOyf+JhF8xBihoZl5sRWl1J/RAZ7RyrX53F2jFwYlORud/JcE6yX4hulOHA3gKE0yO4NSkOOsZkFCKA+xlBs5KKpBVA7OfGmUbY4Rwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741651798; c=relaxed/simple;
	bh=C56vJT3WoyVaZfPzuUE7DKZkVEo5bzqgeG9ctWKY6Io=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nIc7/RlAfz2YIc1SW0vJchNTWYABBNe/a5MsblovoBs2JJtPzmTBvViaBRgEMUHxr5p342xZKJnVDlSk3M033BheaxSPYta0ZpFPeTaNb93WJP9h6Yw9d+GnogwsElTy4gtP3nYHLGS7PLCmg1F3mbM0w6fV0qHou4pgIDhC8kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKpbNtra; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741651795; x=1773187795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C56vJT3WoyVaZfPzuUE7DKZkVEo5bzqgeG9ctWKY6Io=;
  b=HKpbNtraGl/jVr8xe3EvpjjfGdKvbcx8wM/NlNBi+ITCKirJUE7fVwKE
   U8VZwGZzLe4NQASOjK61VuNNpoy87VnKA0KtsUmsqn3WL0lv7HG0JM4nC
   jL2rjfkXUDg+eKczcUBN9XZPmv0ybtAjAF42MGNXf58e4j7YUZlhuXK+/
   Hu+PxcVT2hG7hcfnpF9O67AZiv0KM1JKiNww6FWFekAoEyUQDlS79+vz1
   Zoo5bLAlXge244F6Baf1szVYdAMuC2zWq6tOojx/bu2HHYd/ihVlfSnx/
   0RrxUUEWfIHTM4IVR5rplMMuInduvaCI1wZ75CTU8XZUBdFUWWGCP2MAb
   g==;
X-CSE-ConnectionGUID: hRLdPIGFTC66y8GiMzlPSw==
X-CSE-MsgGUID: 0RBAuEV8SkWSNYer88e3Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42548528"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="42548528"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 17:09:55 -0700
X-CSE-ConnectionGUID: 8TtlTSTtR6WrN/GsR28ntQ==
X-CSE-MsgGUID: CbHgZmxCRBGHk+XKRjVJPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="120841359"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 10 Mar 2025 17:09:54 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trnBr-0006Ce-0p;
	Tue, 11 Mar 2025 00:09:49 +0000
Date: Tue, 11 Mar 2025 08:09:41 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:devel 23/23]
 drivers/media/platform/st/stm32/stm32-dcmi.c:1685:21: error: call to
 undeclared function 'devm_kmemdup_array'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202503110853.F2zqgdx0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git devel
head:   07e07f2cd3ebb7e8b62ccb8f22a16032b599c9e2
commit: 07e07f2cd3ebb7e8b62ccb8f22a16032b599c9e2 [23/23] media: stm32-dcmi: use devm_kmemdup_array()
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250311/202503110853.F2zqgdx0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110853.F2zqgdx0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110853.F2zqgdx0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/st/stm32/stm32-dcmi.c:1685:21: error: call to undeclared function 'devm_kmemdup_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1685 |         dcmi->sd_formats = devm_kmemdup_array(dcmi->dev, sd_fmts, num_fmts,
         |                            ^
>> drivers/media/platform/st/stm32/stm32-dcmi.c:1685:19: error: incompatible integer to pointer conversion assigning to 'const struct dcmi_format **' from 'int' [-Wint-conversion]
    1685 |         dcmi->sd_formats = devm_kmemdup_array(dcmi->dev, sd_fmts, num_fmts,
         |                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1686 |                                               sizeof(sd_fmts[0]), GFP_KERNEL);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/devm_kmemdup_array +1685 drivers/media/platform/st/stm32/stm32-dcmi.c

  1639	
  1640	static int dcmi_formats_init(struct stm32_dcmi *dcmi)
  1641	{
  1642		const struct dcmi_format *sd_fmts[ARRAY_SIZE(dcmi_formats)];
  1643		unsigned int num_fmts = 0, i, j;
  1644		struct v4l2_subdev *subdev = dcmi->source;
  1645		struct v4l2_subdev_mbus_code_enum mbus_code = {
  1646			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
  1647		};
  1648	
  1649		while (!v4l2_subdev_call(subdev, pad, enum_mbus_code,
  1650					 NULL, &mbus_code)) {
  1651			for (i = 0; i < ARRAY_SIZE(dcmi_formats); i++) {
  1652				if (dcmi_formats[i].mbus_code != mbus_code.code)
  1653					continue;
  1654	
  1655				/* Exclude JPEG if BT656 bus is selected */
  1656				if (dcmi_formats[i].fourcc == V4L2_PIX_FMT_JPEG &&
  1657				    dcmi->bus_type == V4L2_MBUS_BT656)
  1658					continue;
  1659	
  1660				/* Code supported, have we got this fourcc yet? */
  1661				for (j = 0; j < num_fmts; j++)
  1662					if (sd_fmts[j]->fourcc ==
  1663							dcmi_formats[i].fourcc) {
  1664						/* Already available */
  1665						dev_dbg(dcmi->dev, "Skipping fourcc/code: %4.4s/0x%x\n",
  1666							(char *)&sd_fmts[j]->fourcc,
  1667							mbus_code.code);
  1668						break;
  1669					}
  1670				if (j == num_fmts) {
  1671					/* New */
  1672					sd_fmts[num_fmts++] = dcmi_formats + i;
  1673					dev_dbg(dcmi->dev, "Supported fourcc/code: %4.4s/0x%x\n",
  1674						(char *)&sd_fmts[num_fmts - 1]->fourcc,
  1675						sd_fmts[num_fmts - 1]->mbus_code);
  1676				}
  1677			}
  1678			mbus_code.index++;
  1679		}
  1680	
  1681		if (!num_fmts)
  1682			return -ENXIO;
  1683	
  1684		dcmi->num_of_sd_formats = num_fmts;
> 1685		dcmi->sd_formats = devm_kmemdup_array(dcmi->dev, sd_fmts, num_fmts,
  1686						      sizeof(sd_fmts[0]), GFP_KERNEL);
  1687		if (!dcmi->sd_formats) {
  1688			dev_err(dcmi->dev, "Could not allocate memory\n");
  1689			return -ENOMEM;
  1690		}
  1691	
  1692		dcmi->sd_format = dcmi->sd_formats[0];
  1693		return 0;
  1694	}
  1695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


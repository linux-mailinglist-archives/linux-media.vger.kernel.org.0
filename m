Return-Path: <linux-media+bounces-27988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06726A5B669
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 03:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 789EE7A757B
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 02:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8161E2848;
	Tue, 11 Mar 2025 02:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpPSe3pO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0783FD1
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 02:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741658667; cv=none; b=s2JLer8LcRfk0WoTiApYvAV2R+5p31CBlYUNVdTILrtNOZ/AIJVZGmqqwr3JuV73UdRrGtw6DNRnxH9ipNpcvLDDR5AoRTNEsXYOnUu19cD8n9pZiZ9zrherV3EK3TcraU1AgX86Co/CGTcZRhCUEAQ065RMhqomsSW1c+tkLbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741658667; c=relaxed/simple;
	bh=MvtiFbfI7qZmdOQBCagXnPRz5QI12g8lXuJeSoMdjsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ith6Ja4FqTLBTX071BvGkX6/FCnfcXTORXj2xP1rIYN1GBZVC0Yez+mUdcxJeVZfi4HVpL6NdE5XShTOlBWioptYV5CqravYrlPPWgPKqgILiF/SK2KvmfPIlZo3zbTyhS57DBMFYyXeBQMGFN4wIh8WU+NPU4B1TXjVOcl9DJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpPSe3pO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741658665; x=1773194665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MvtiFbfI7qZmdOQBCagXnPRz5QI12g8lXuJeSoMdjsg=;
  b=ZpPSe3pOOdxjHuZf4ZHvvLZrTkyn1BJ55DBRiOAyq6l5HTboeDGokXnw
   9pb0i9xQ4w/UCXhdR83MujLZ/+WXBR7Rw0NTf3r8IqlDMTtMNNFLBZXDr
   oZ3MITFblpUAFGr3je7+QPOQ+gc7yxUoiXMpsTnK03yTbq6C96JXqxt15
   5WhhVqegdG29a2MHvNqqxSrC4AQSLnptXyn52UjGBaRO0VAtpdpDdM/rA
   6We28yUexC9qnwqE2gQQWku13aBEqom0eKhFKLVYkqOb3l3NgabMw333A
   Pfte3T13cx2jNwjBigm9jirPymS2QwmM1zqPwrZOoDPdQOzymFtNj8AMY
   g==;
X-CSE-ConnectionGUID: qRqTFVQwQWq3mZbragd+6w==
X-CSE-MsgGUID: zTPvtkCpSXixxpTGYtGJmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42792440"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="42792440"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 19:04:25 -0700
X-CSE-ConnectionGUID: Borrjp/RR4erGplN+136gQ==
X-CSE-MsgGUID: H+iIyfrdTcGLfPV6k3tjtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="121075125"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 10 Mar 2025 19:04:23 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1troyi-0006Gg-20;
	Tue, 11 Mar 2025 02:04:20 +0000
Date: Tue, 11 Mar 2025 10:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:devel 23/23]
 drivers/media/platform/st/stm32/stm32-dcmi.c:1685:26: warning: assignment to
 'const struct dcmi_format **' from 'int' makes pointer from integer without
 a cast
Message-ID: <202503110923.hRugQG84-lkp@intel.com>
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
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250311/202503110923.hRugQG84-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110923.hRugQG84-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110923.hRugQG84-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/st/stm32/stm32-dcmi.c: In function 'dcmi_formats_init':
   drivers/media/platform/st/stm32/stm32-dcmi.c:1685:28: error: implicit declaration of function 'devm_kmemdup_array'; did you mean 'devm_kmalloc_array'? [-Werror=implicit-function-declaration]
    1685 |         dcmi->sd_formats = devm_kmemdup_array(dcmi->dev, sd_fmts, num_fmts,
         |                            ^~~~~~~~~~~~~~~~~~
         |                            devm_kmalloc_array
>> drivers/media/platform/st/stm32/stm32-dcmi.c:1685:26: warning: assignment to 'const struct dcmi_format **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1685 |         dcmi->sd_formats = devm_kmemdup_array(dcmi->dev, sd_fmts, num_fmts,
         |                          ^
   cc1: some warnings being treated as errors


vim +1685 drivers/media/platform/st/stm32/stm32-dcmi.c

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


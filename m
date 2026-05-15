Return-Path: <linux-media+bounces-61631-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFcXBj6PBmoVkwIAu9opvQ
	(envelope-from <linux-media+bounces-61631-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 05:13:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBB1548ED9
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 05:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81D2430214E6
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 03:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163B43CC334;
	Fri, 15 May 2026 03:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ygo2NWH1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6E93C13FD
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 03:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778814775; cv=none; b=U+BY/VL15tknJV5CyBKVp6FEq5YtO4fL+ou5MOto6dW5vtXdvldBpGAQSHZstuGB6ddv6HGWe8GFX9DbxIisI9xpCDp6JTuapXdNN7+fnQeeJ+nP6a183z2+j1t+o0RPXUyesPVws5afBek2P8OVyWEf5jJZN2BjBnxcZ3IUJlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778814775; c=relaxed/simple;
	bh=ZaTLekDTtvIxdcbRm56u3Kh491qNXoT3bA1ULZxlAu8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Af9pfP38DMN3wNJ4mCx95Y6/EvoBEF7byREMLriavftfA0B5leROAxhgpLbWa+9uXOe1M3NHRxLaOO7cFcfgK9ZwaCZguk9kiKEn5xPekqVbuqCVrREQMXdMvHeaobca1xIwvIWQEGNBEY8xe0K/nb7BPVpCAVMq8zRkzsnBIOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ygo2NWH1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778814774; x=1810350774;
  h=date:from:to:cc:subject:message-id;
  bh=ZaTLekDTtvIxdcbRm56u3Kh491qNXoT3bA1ULZxlAu8=;
  b=Ygo2NWH11rN9TMYKlaVifKmCwUHkhhydKsmhZAvjqO4I8q04rvxVQ3l/
   QvyeWM1VSf9fJQfIyW+SAbOUEdI6JQ1E/QaA/lbSKYzLBV+Vo/3dVKVEs
   FHIhoiyPG5D4+egaGkJZsLdjrG6k5nbTf8IRGksaJV42R1ZsVfFQSBX3M
   Xvhx/m5Dej9d/RboVlUVFUCXLq5Oq+uwLlY7YVeyD5quBmgAGnIAz7avo
   m90pqIAqpObH8b/UsIztU950TCEPpNL/JuWfOneE8BvBO/2K1FrnYnFeq
   o0XBEFdRE8tJHmuGnHFRT+TIMEMhyi6DaUfNFuWCDpMqi3SdXO6EEnYXK
   g==;
X-CSE-ConnectionGUID: vs+UqkqSQ/2xNiG9mBZCsg==
X-CSE-MsgGUID: 5gSIg0NlRNWBq1P6re8v0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="82334558"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="82334558"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 20:12:53 -0700
X-CSE-ConnectionGUID: 1tOlb+whQcyzZKd5L/9bVQ==
X-CSE-MsgGUID: mNwYLrGtR12+plDjlRK6IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="268916174"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 May 2026 20:12:52 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNiyn-000000000i4-0Ups;
	Fri, 15 May 2026 03:12:49 +0000
Date: Fri, 15 May 2026 11:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:frame-desc 13/17]
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:109:25: warning: format
 '%d' expects argument of type 'int', but argument 5 has type 'long int'
Message-ID: <202605151137.DEgSW7Zb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 5EBB1548ED9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61631-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Action: no action

tree:   git://linuxtv.org/sailus/media_tree.git frame-desc
head:   a0e9f7cf4fcd819e3c994fd629a63789748d81c5
commit: 0cf56292ac3200bd6a515db66aa9ed69fa60b091 [13/17] media: rkisp1: Use v4l2_subdev_get_frame_desc()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260515/202605151137.DEgSW7Zb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151137.DEgSW7Zb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151137.DEgSW7Zb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/pm_runtime.h:11,
                    from drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:13:
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c: In function 'rkisp1_gasket_enable':
>> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:109:25: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long int' [-Wformat=]
     109 |                         "failed to get frame descriptor from '%s':%u: %d\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:108:17: note: in expansion of macro 'dev_err'
     108 |                 dev_err(rkisp1->dev,
         |                 ^~~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:109:72: note: format string is defined here
     109 |                         "failed to get frame descriptor from '%s':%u: %d\n",
         |                                                                       ~^
         |                                                                        |
         |                                                                        int
         |                                                                       %ld


vim +109 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c

fdac4ce9f4fd21 Laurent Pinchart 2024-02-16   86  
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16   87  static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16   88  				struct media_pad *source)
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16   89  {
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16   90  	struct v4l2_subdev *source_sd;
0cf56292ac3200 Sakari Ailus     2026-05-12   91  	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
0cf56292ac3200 Sakari Ailus     2026-05-12   92  		NULL;
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16   93  	unsigned int dt;
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16   94  	u32 mask;
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16   95  	u32 val;
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16   96  
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16   97  	/*
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16   98  	 * Configure and enable the gasket with the CSI-2 data type. Set the
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16   99  	 * vsync polarity as active high, as that is what the ISP is configured
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  100  	 * to expect in ISP_ACQ_PROP. Enable left justification, as the i.MX8MP
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  101  	 * ISP has a 16-bit wide input and expects data to be left-aligned.
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  102  	 */
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  103  
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  104  	source_sd = media_entity_to_v4l2_subdev(source->entity);
0cf56292ac3200 Sakari Ailus     2026-05-12  105  	fd = v4l2_subdev_get_frame_desc(source_sd, source->index,
0cf56292ac3200 Sakari Ailus     2026-05-12  106  					V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
0cf56292ac3200 Sakari Ailus     2026-05-12  107  	if (IS_ERR(fd)) {
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  108  		dev_err(rkisp1->dev,
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16 @109  			"failed to get frame descriptor from '%s':%u: %d\n",
0cf56292ac3200 Sakari Ailus     2026-05-12  110  			source_sd->name, 0, PTR_ERR(fd));
0cf56292ac3200 Sakari Ailus     2026-05-12  111  		return PTR_ERR(fd);
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  112  	}
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  113  
0cf56292ac3200 Sakari Ailus     2026-05-12  114  	if (fd->num_entries != 1) {
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  115  		dev_err(rkisp1->dev, "invalid frame descriptor for '%s':%u\n",
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  116  			source_sd->name, 0);
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  117  		return -EINVAL;
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  118  	}
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  119  
0cf56292ac3200 Sakari Ailus     2026-05-12  120  	dt = fd->entry[0].bus.csi2.dt;
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  121  
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  122  	if (rkisp1->gasket_id == 0) {
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  123  		mask = ISP_DEWARP_CONTROL_MIPI_CSI1_HS_POLARITY
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  124  		     | ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_MASK
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  125  		     | ISP_DEWARP_CONTROL_MIPI_ISP1_LEFT_JUST_MODE
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  126  		     | ISP_DEWARP_CONTROL_MIPI_ISP1_DATA_TYPE_MASK
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  127  		     | ISP_DEWARP_CONTROL_GPR_ISP_0_DISABLE;
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  128  		val = ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_POSITIVE
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  129  		    | ISP_DEWARP_CONTROL_MIPI_ISP1_LEFT_JUST_MODE
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  130  		    | ISP_DEWARP_CONTROL_MIPI_ISP1_DATA_TYPE(dt);
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  131  	} else {
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  132  		mask = ISP_DEWARP_CONTROL_MIPI_CSI2_HS_POLARITY
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  133  		     | ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_MASK
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  134  		     | ISP_DEWARP_CONTROL_MIPI_ISP2_LEFT_JUST_MODE
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  135  		     | ISP_DEWARP_CONTROL_MIPI_ISP2_DATA_TYPE_MASK
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  136  		     | ISP_DEWARP_CONTROL_GPR_ISP_1_DISABLE;
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  137  		val = ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_POSITIVE
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  138  		    | ISP_DEWARP_CONTROL_MIPI_ISP2_LEFT_JUST_MODE
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  139  		    | ISP_DEWARP_CONTROL_MIPI_ISP2_DATA_TYPE(dt);
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  140  	}
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  141  
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  142  	regmap_update_bits(rkisp1->gasket, ISP_DEWARP_CONTROL, mask, val);
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  143  
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  144  	return 0;
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  145  }
fdac4ce9f4fd21 Laurent Pinchart 2024-02-16  146  

:::::: The code at line 109 was first introduced by commit
:::::: fdac4ce9f4fd2120b439d29607f922665ffe31f6 media: rkisp1: Configure gasket on i.MX8MP

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


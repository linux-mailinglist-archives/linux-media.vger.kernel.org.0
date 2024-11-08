Return-Path: <linux-media+bounces-21187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866879C23F5
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 18:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B83028891F
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 17:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CAA522C73A;
	Fri,  8 Nov 2024 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4kA4DBU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B66221CFA6;
	Fri,  8 Nov 2024 17:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731087378; cv=none; b=OxT1kEwXDJFdIHC8bQHQ0urzAB3EJStVsFGKJoMI+uTohfx8+VKuhOxZoMwe4/OC8jfPeD8NGyCL7Db+GAM7ESQ8iIVWX8ySMs28O4L5OjuVGIEzDlhxbAGl+qxm6lyqJSv86DF0/BgQvcMFb16dWwupdLh0+7ppqEkrwrMhbV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731087378; c=relaxed/simple;
	bh=dnorJaPLf/nRbjesNrjVGRH985hdx7YMTFrtQ40VD+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDPSAEFW3MZGfdU0CGXZvidaotRddUOH5A/F0iMfR4G2NWIegif5Jd2aF+9WPkJsQlnUb6iDC9gC+9gt+ItFxl9R01b/JCSnanKGYS3BpTR+wzR+al7jRBDRe6uNS1TbozoIgC9ajoN1Ost+PJWTdk9FvOeIGsX9Cm30OmV8ixY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4kA4DBU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731087376; x=1762623376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dnorJaPLf/nRbjesNrjVGRH985hdx7YMTFrtQ40VD+8=;
  b=h4kA4DBUcYbhGtWX/nKq3/Dk6rUGxdCErnskNvo2MH0y3+zIVN9Z+7XF
   d66OZ8DTPTzx2mCWEV4guDKi83xl/1C+oeKLPOLfu6BmG2xrsm28AfsBI
   GfWrvomWkvIFIxaOakBXj0KSBONoboNk8HyxKeMSHqYMpXRgXNUpjCWd5
   qwR0YzjxH42ljyrmJzx0etK1o8vlzoHJF3hQfqQkg2RgQxPpxyeivvoQu
   TDo12hxIyvTskRMHPoBAJXWvbzRrwOyVOoWMEOuF3asEXdrK1MqZ9Qt7Y
   XXUAfCcveZ9ZrMrr5Gad0j5/pHmbMqtYtsbtGi8io0pccALpbr6Ehr3Zb
   w==;
X-CSE-ConnectionGUID: lhRv+mi4Tjm0VHbHt2NyaQ==
X-CSE-MsgGUID: 737gxq15TzOYx1pmnfmXTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30834828"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30834828"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 09:36:16 -0800
X-CSE-ConnectionGUID: msmfwkvlSdmuri2AC6/J2Q==
X-CSE-MsgGUID: JOUhS8lKROiAxWX4U998Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="116480357"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Nov 2024 09:36:13 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9Su3-000rek-0l;
	Fri, 08 Nov 2024 17:36:11 +0000
Date: Sat, 9 Nov 2024 01:36:04 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 13/15] media: i2c: ds90ub913: Add error handling to
 ub913_hw_init()
Message-ID: <202411090141.ZzfAF7jL-lkp@intel.com>
References: <20241108-ub9xx-fixes-v2-13-c7db3b2ad89f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-ub9xx-fixes-v2-13-c7db3b2ad89f@ideasonboard.com>

Hi Tomi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 98f7e32f20d28ec452afb208f9cffc08448a2652]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/media-i2c-ds90ub9x3-Fix-extra-fwnode_handle_put/20241108-173952
base:   98f7e32f20d28ec452afb208f9cffc08448a2652
patch link:    https://lore.kernel.org/r/20241108-ub9xx-fixes-v2-13-c7db3b2ad89f%40ideasonboard.com
patch subject: [PATCH v2 13/15] media: i2c: ds90ub913: Add error handling to ub913_hw_init()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241109/202411090141.ZzfAF7jL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090141.ZzfAF7jL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090141.ZzfAF7jL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/ds90ub913.c: In function 'ub913_hw_init':
>> drivers/media/i2c/ds90ub913.c:751:33: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     751 |                                 FIELD_PREP(UB913_REG_GENERAL_CFG_PCLK_RISING,
         |                                 ^~~~~~~~~~


vim +/FIELD_PREP +751 drivers/media/i2c/ds90ub913.c

   722	
   723	static int ub913_hw_init(struct ub913_data *priv)
   724	{
   725		struct device *dev = &priv->client->dev;
   726		bool mode_override;
   727		u8 mode;
   728		int ret;
   729		u8 v;
   730	
   731		ret = ub913_read(priv, UB913_REG_MODE_SEL, &v);
   732		if (ret)
   733			return ret;
   734	
   735		if (!(v & UB913_REG_MODE_SEL_MODE_UP_TO_DATE))
   736			return dev_err_probe(dev, -ENODEV,
   737					     "Mode value not stabilized\n");
   738	
   739		mode_override = v & UB913_REG_MODE_SEL_MODE_OVERRIDE;
   740		mode = v & UB913_REG_MODE_SEL_MODE_MASK;
   741	
   742		dev_dbg(dev, "mode from %s: %#x\n",
   743			mode_override ? "reg" : "deserializer", mode);
   744	
   745		ret = ub913_i2c_master_init(priv);
   746		if (ret)
   747			return dev_err_probe(dev, ret, "i2c master init failed\n");
   748	
   749		ret = ub913_update_bits(priv, UB913_REG_GENERAL_CFG,
   750					UB913_REG_GENERAL_CFG_PCLK_RISING,
 > 751					FIELD_PREP(UB913_REG_GENERAL_CFG_PCLK_RISING,
   752						   priv->pclk_polarity_rising));
   753	
   754		if (ret)
   755			return ret;
   756	
   757		return 0;
   758	}
   759	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


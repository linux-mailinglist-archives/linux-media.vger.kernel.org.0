Return-Path: <linux-media+bounces-21191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EBB9C24BD
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 19:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B40DC1C22CC4
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 18:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B171991BD;
	Fri,  8 Nov 2024 18:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2bLNFfA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EA6233D6E;
	Fri,  8 Nov 2024 18:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731089842; cv=none; b=jijtEFnBSv23kyYdPlzg8mlq6BzB4ctldXk95/ATYg7KwiqoWc7uqpimEGpVW0gRm6+zVWnEp1N8FESJZVG18ca2ZWpfd6qN0Qyz/5IHiRGyFlB1XAU8497qIsPESmHU0+9ZF8RhdDsPw3DoCl7YBGF50ODKMZbm1722/xAsIj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731089842; c=relaxed/simple;
	bh=4PaET6TkzgrHWZkK4MiM2Mhki+6QUcpFOgMPv7bRVLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uo+tUsRwDQSAqWOGUmd2modyN22Z97cutvcsFXXHpJSRUfDUvU9fA+LzQMcG2Yv+L0fbpFkP/jVX6noSP+i9/D/C3Pve+B52rVWrx5Lza0JuWHNpc9XjnWW/3BzH6CURImAXX/rA2HJUJ4pp17MMKuSbys1N/PEC2ZGOE+dKjHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2bLNFfA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731089840; x=1762625840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4PaET6TkzgrHWZkK4MiM2Mhki+6QUcpFOgMPv7bRVLs=;
  b=A2bLNFfAXkdfVPNsfTHKYx2z59prseowJXGDjZVaPrAYGAnOT1cH5Tba
   XQEx8rKuPR3wl6mBbIsCce/03V7PsAbFljWpwoug8k0S2zNMzyihPNVVx
   KmUZkHIwqSHGHxzhGF1Q9atxgLP0zXdQ0VYKxkD98GrFYduTi4I+2FLi8
   R2+gRht+w4lnmlClX4Kch4Tf+fUBX6Zr5CGjHYpxkYx3jAHdYPCc1NURP
   /wPgDD494S8GoB62dU1uQSLyZqKFvshaj7C6wnITi33kd2g3K1PnQ6XOQ
   VvD0Nlh8QfKyjS2WOzeM6vmMKRkskxg190gU9v7sTt/ShCYwREpC7ZXjT
   g==;
X-CSE-ConnectionGUID: GpJ7Al6GQfyjIOMjdj/1LQ==
X-CSE-MsgGUID: vl1ClaxcQjiwut7Gn0SJ4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="42368553"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="42368553"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 10:17:19 -0800
X-CSE-ConnectionGUID: lsmZQr7uTgq1VgyQw1S59w==
X-CSE-MsgGUID: b1luBi1TSSGnldkvh/IxyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="123200075"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Nov 2024 10:17:16 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9TXk-000rh8-21;
	Fri, 08 Nov 2024 18:17:12 +0000
Date: Sat, 9 Nov 2024 02:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 13/15] media: i2c: ds90ub913: Add error handling to
 ub913_hw_init()
Message-ID: <202411090151.d5LTbJyn-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-002-20241108 (https://download.01.org/0day-ci/archive/20241109/202411090151.d5LTbJyn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090151.d5LTbJyn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090151.d5LTbJyn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/i2c/ds90ub913.c:16:
   In file included from include/linux/i2c-atr.h:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/i2c/ds90ub913.c:751:5: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     751 |                                 FIELD_PREP(UB913_REG_GENERAL_CFG_PCLK_RISING,
         |                                 ^
   1 warning and 1 error generated.


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


Return-Path: <linux-media+bounces-12378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54E8D6FAC
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 14:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E9CD1F21894
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 12:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D80C150986;
	Sat,  1 Jun 2024 12:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMbZ4KHl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A036AAD
	for <linux-media@vger.kernel.org>; Sat,  1 Jun 2024 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717244066; cv=none; b=dCgvht+metWbTdIghLxJKrwSH0/4LOO+hbXjlrVVX2pPZuOjXHgDIiHHvnwGp1VF2TwXqctDAnDq/ZoIpwX+DGW2im6f3ev6QbYIYqQiUk5cqvqIKIx76ccLyFzdn9LY+8an4OFRu/90yIz6J4wwv7F1DqwrPObDJxRqwfYZc3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717244066; c=relaxed/simple;
	bh=GPKG7NUKXrZXWqHhfJl4sLYTYfMq09VL/mrawjC7A3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FHnStMJNEBSHzOQSTSI51I1eVJTPcEiRGeGeWi2p3s6r7YjBaEQ/Ms1SGFBLgEf1AoZfYwp9Q3/9LSv1K2egkd7rco9PzbuEmzUTkL31Ot26BtX6agagDEYej0jyQsY5TbPMrtKOHF1o4Pvqu0lbet0B+KFQBIm3Xljbvq65X5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMbZ4KHl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717244065; x=1748780065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GPKG7NUKXrZXWqHhfJl4sLYTYfMq09VL/mrawjC7A3E=;
  b=bMbZ4KHlN7TQMwA+GgyT7+5mane/5SUeNXJ1ttY/rdgCeUjtGUp2WRU5
   kRGNN3kPZgGeYpNS1q4gXyHfCLievWWP2H72Yzd8tUST3E6jS9wRSaPpW
   nNdPSrHCG5GyN5CBTK5mfEzk4iEyZXk61Ow6QzFOc+A+59NLMbMEuO863
   9HdVx3LQJ213HQAIT5Wz2j0pUV6zIlO2NAHAMcv2Qvh0F+n2ubkwVjAcy
   u1BoAEF9zJXV4Ddrk/E1cDFuml6SZJcQAfapbDhF4FJUarbFC4sUUAfBg
   D9rxRpZ7U8sBPXH6dvh17KAbQVUQZNUwe/wfQUzMP/7/FXw6+W3+P0a5I
   A==;
X-CSE-ConnectionGUID: RPI7/icbRXC9D/v1JSwFaA==
X-CSE-MsgGUID: Thne96jxSTWHcwOtnlqKTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24365566"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="24365566"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 05:14:24 -0700
X-CSE-ConnectionGUID: QqVwAY9fQG6WRALBSp92ew==
X-CSE-MsgGUID: VJtxr3MCT6uprtv0o58B7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="37055927"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2024 05:14:22 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDNcq-000Ipf-2A;
	Sat, 01 Jun 2024 12:14:20 +0000
Date: Sat, 1 Jun 2024 20:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:test 54/55] drivers/media/i2c/max96714.c:675:16:
 error: too many arguments to function 'i2c_mux_add_adapter'
Message-ID: <202406012053.0Av3nXna-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git test
head:   94e408a1547ef00f59477a072c6f943d62d7a097
commit: 3cef6383eec3ec8ac81afe294a669c2ecd8882ef [54/55] media: i2c: add MAX96714 driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240601/202406012053.0Av3nXna-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406012053.0Av3nXna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406012053.0Av3nXna-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/max96714.c: In function 'max96714_i2c_mux_init':
>> drivers/media/i2c/max96714.c:675:16: error: too many arguments to function 'i2c_mux_add_adapter'
     675 |         return i2c_mux_add_adapter(priv->mux, 0, 0, 0);
         |                ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/i2c/max96714.c:13:
   include/linux/i2c-mux.h:58:5: note: declared here
      58 | int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
         |     ^~~~~~~~~~~~~~~~~~~


vim +/i2c_mux_add_adapter +675 drivers/media/i2c/max96714.c

   666	
   667	static int max96714_i2c_mux_init(struct max96714_priv *priv)
   668	{
   669		priv->mux = i2c_mux_alloc(priv->client->adapter, &priv->client->dev,
   670					  1, 0, I2C_MUX_LOCKED | I2C_MUX_GATE,
   671					  max96714_i2c_mux_select, NULL);
   672		if (!priv->mux)
   673			return -ENOMEM;
   674	
 > 675		return i2c_mux_add_adapter(priv->mux, 0, 0, 0);
   676	}
   677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


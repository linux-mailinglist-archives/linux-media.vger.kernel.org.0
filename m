Return-Path: <linux-media+bounces-16866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E45889600B9
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 07:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A08FA28363E
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 05:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCFC74413;
	Tue, 27 Aug 2024 05:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTSZa7zV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F7B1401C
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 05:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724734856; cv=none; b=Ju36u8t79vEzxbE36zy48yyG5ObSnix0AnVGyJvJgQDhv0uxHWkksaW9bzE/HTZzuopGg/gLIvBwLW72rkMaPdGrUgBT6YiKKJ+k1WHd2OOaovkXyfeJ6RkjeSe9s4XLjFGFoBo0UiOrkmw2bnZqrfy1mE654zu/pgeCeOCRqIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724734856; c=relaxed/simple;
	bh=Jwiaej+MuS0sAw9/WHQErV8zaZ++mO5Zjkt35e8hEiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iw/lam5skeYDli2kZorPdIN3EfAG59BxFcrkkPpuCcedJoNZvtGDSVvXH1cmTVH0yEEQp8ngugc+ifavFO9BpGaFZspS90tS3kB6K0CMmS6OsC+HXWPRZgLqNXcuQzZhvfaZmAO47GCqY7ZlBewGbvCsjeztyBZnq7gL+vrKdVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTSZa7zV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724734855; x=1756270855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jwiaej+MuS0sAw9/WHQErV8zaZ++mO5Zjkt35e8hEiw=;
  b=DTSZa7zVG5hhla+NWXyenPz+vDRqf0jJVV5/1gYhxeke5LDARhjQ2J9S
   Z42+xhNVNzcUUnA3xj12DxVAT+2aLRCIPb5XcVA1GkJUNUCMVKq7RUnCb
   qZm+jiB0PKTSU7imCZPo/Ookkm1eTM/Djg8txhTTOCu3dufqZBK7PG5cR
   tiBkyKyaHg8smyri1rHi9j8sL6mOsS8wWIakMWfx9dKqdvaSpslMcVKYG
   5GlR5jMWKMwawIbv+z18oozALHueqpXSceJKKjkkmH74o9Z5mE5XyAced
   o20o6HRiV4TU/CRX+BKYC6OqCR6DefotXK3JZ5zvmkoU2KKwLpZ5oi8xn
   w==;
X-CSE-ConnectionGUID: M54awrCeTYS7szw1U4urag==
X-CSE-MsgGUID: 6OoCJitZQ8G80wFoz1ixGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13230371"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="13230371"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 22:00:55 -0700
X-CSE-ConnectionGUID: whjT/zDrQDawoCinAjACeg==
X-CSE-MsgGUID: wpj8mmTQRFCGhy5uMRjMrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="62701837"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Aug 2024 22:00:51 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sioK0-000I0C-2e;
	Tue, 27 Aug 2024 05:00:48 +0000
Date: Tue, 27 Aug 2024 13:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 4/4] media: pisp_be: Fix pm_runtime underrun in probe
Message-ID: <202408271258.YcqkRjNU-lkp@intel.com>
References: <20240826144338.463683-5-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826144338.463683-5-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.11-rc5 next-20240826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-pisp_be-Drop-reference-to-non-existing-function/20240826-224625
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240826144338.463683-5-jacopo.mondi%40ideasonboard.com
patch subject: [PATCH 4/4] media: pisp_be: Fix pm_runtime underrun in probe
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240827/202408271258.YcqkRjNU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408271258.YcqkRjNU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408271258.YcqkRjNU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1641:12: warning: 'pispbe_runtime_resume' defined but not used [-Wunused-function]
    1641 | static int pispbe_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/pispbe_runtime_resume +1641 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c

12187bd5d4f8c1 Naushir Patuck 2024-06-26  1640  
12187bd5d4f8c1 Naushir Patuck 2024-06-26 @1641  static int pispbe_runtime_resume(struct device *dev)
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1642  {
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1643  	struct pispbe_dev *pispbe = dev_get_drvdata(dev);
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1644  	int ret;
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1645  
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1646  	ret = clk_prepare_enable(pispbe->clk);
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1647  	if (ret) {
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1648  		dev_err(dev, "Unable to enable clock\n");
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1649  		return ret;
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1650  	}
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1651  
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1652  	dev_dbg(dev, "%s: Enabled clock, rate=%lu\n",
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1653  		__func__, clk_get_rate(pispbe->clk));
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1654  
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1655  	return 0;
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1656  }
12187bd5d4f8c1 Naushir Patuck 2024-06-26  1657  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


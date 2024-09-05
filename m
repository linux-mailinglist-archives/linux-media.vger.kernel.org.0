Return-Path: <linux-media+bounces-17664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F6496D663
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 12:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 121DC1C23328
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 10:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C65B1991CB;
	Thu,  5 Sep 2024 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQTxQflg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5A8198E89;
	Thu,  5 Sep 2024 10:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725533462; cv=none; b=jpunJ64E5Lh2AZ4FY+YtJ5uVBI6C1t0gXoitX7Lz0AGGgDs771giSK7N2HYWwFt4Vzp3B1ExBw9VTnn2JS46Rm/S16+/J2UqVPVITecImgojVgNXXKfST6JLTmFjaluSmDfe/eHtbBZXzkNZIoOSwSJpeDlE3HMI0A4IgKzaprQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725533462; c=relaxed/simple;
	bh=XLzeVrx0nfVBrQ3s2XfXLT+YSpUPBoeab7Ui3TUDgL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uL+f0urTMLCklFUvjx7UuwYw5M5gW+AncD3Z3ru8MQyPW9LEaZjP1XEf8yy63einvb8Evogbiezdik5Oqd5jRRkiSjRNNPpVzIWw7Tuh+Z4uUoeSjhLrt+eFsEFmrEG+kWkMs3odN231lWQKDKsvjQPl13c/s1F6n5Ri/mcOvqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQTxQflg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725533460; x=1757069460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XLzeVrx0nfVBrQ3s2XfXLT+YSpUPBoeab7Ui3TUDgL4=;
  b=RQTxQflgKxrH1tHpSd6aPLp63mW1l3K95hrztEnDW2zTlQttbtq1B6Qa
   ggBbbszqYVNWmPl9/34EyQUyWnjGsKnhbUWGXuTsat0/kXMvUmINjiyHh
   7f2sFV9ZBpVzmkbrlQgSJ226m3/zwo+EhCW3kF2HG8vFh1SDoGyic1ED3
   wbylW5QZrlWALYUl8ZSMnpcPyCDE6UY7cDLepTjw0PZNPZdbROWwfafJl
   whuQNF46G6uNlU8vRPQo8KYkJxR72RisO3UU8CpUWuC5SZqjXGcFo6WV+
   his5Prm7xz4DZen3o8Wc0j/AeZN5jgjaJ+A7vqDQNf4dS2xzJOp+tlTIF
   A==;
X-CSE-ConnectionGUID: sj2knzlMQZuh0Sbv4LmJDQ==
X-CSE-MsgGUID: sGUb/IRkT7G0L5KYaGdWaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24434643"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="24434643"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 03:50:59 -0700
X-CSE-ConnectionGUID: iHbgLJ1WSCWObw5SGIr4DQ==
X-CSE-MsgGUID: FszYRi5HTv6pW4J1GFg2qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="66326302"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Sep 2024 03:50:55 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smA4i-0009gf-1X;
	Thu, 05 Sep 2024 10:50:52 +0000
Date: Thu, 5 Sep 2024 18:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v4 3/4] media: raspberrypi: Add support for RP1-CFE
Message-ID: <202409051822.ZzUGw3XQ-lkp@intel.com>
References: <20240904-rp1-cfe-v4-3-f1b5b3d69c81@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904-rp1-cfe-v4-3-f1b5b3d69c81@ideasonboard.com>

Hi Tomi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 431c1646e1f86b949fa3685efc50b660a364c2b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/media-uapi-Add-meta-formats-for-PiSP-FE-config-and-stats/20240904-192729
base:   431c1646e1f86b949fa3685efc50b660a364c2b6
patch link:    https://lore.kernel.org/r/20240904-rp1-cfe-v4-3-f1b5b3d69c81%40ideasonboard.com
patch subject: [PATCH v4 3/4] media: raspberrypi: Add support for RP1-CFE
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240905/202409051822.ZzUGw3XQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051822.ZzUGw3XQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409051822.ZzUGw3XQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/raspberrypi/rp1-cfe/cfe.c:2445:12: warning: 'cfe_runtime_resume' defined but not used [-Wunused-function]
    2445 | static int cfe_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/raspberrypi/rp1-cfe/cfe.c:2435:12: warning: 'cfe_runtime_suspend' defined but not used [-Wunused-function]
    2435 | static int cfe_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/cfe_runtime_resume +2445 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c

  2434	
> 2435	static int cfe_runtime_suspend(struct device *dev)
  2436	{
  2437		struct platform_device *pdev = to_platform_device(dev);
  2438		struct cfe_device *cfe = platform_get_drvdata(pdev);
  2439	
  2440		clk_disable_unprepare(cfe->clk);
  2441	
  2442		return 0;
  2443	}
  2444	
> 2445	static int cfe_runtime_resume(struct device *dev)
  2446	{
  2447		struct platform_device *pdev = to_platform_device(dev);
  2448		struct cfe_device *cfe = platform_get_drvdata(pdev);
  2449		int ret;
  2450	
  2451		ret = clk_prepare_enable(cfe->clk);
  2452		if (ret) {
  2453			dev_err(dev, "Unable to enable clock\n");
  2454			return ret;
  2455		}
  2456	
  2457		return 0;
  2458	}
  2459	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


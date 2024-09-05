Return-Path: <linux-media+bounces-17671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B505396D6C8
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 13:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E87581C2504D
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8A719924A;
	Thu,  5 Sep 2024 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rFYMZ7l0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97692194A61;
	Thu,  5 Sep 2024 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725534686; cv=none; b=tOPfZfT06pRdioMYAWL97FQ+8mp67kL1GK7NcGGcDVO6GzvnzIh7vwdogTImY3WBTO3ZHaDaiUPTKnxT0zy5g5fJ+df+7wNriB5vul4+Rbb7v1euyQHNOkmL32FVrjeejiRRVpHC5xXyf2dqb3eEz6//PaDVGaY2E89E8N5vnOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725534686; c=relaxed/simple;
	bh=+Wp7h+yVKjMqDOnuzocHsFpFD+fZU7fCOYID9KB6ZEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8fpkdoAWVNUt68Fs5p2p3U8Wm/u2J7vr64KUO5oa+H40YxnODd8e1E+26KDWawIjZw4uySEBN8GiHPNxN9S1hqIMXkiEMT3qWwHebrxFfEp87lXRbORYqALAIgFQJScqbLqxAizclK9JuXXV3ixDzMIrNGbySZ0qoV7axCIVV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rFYMZ7l0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F2F13E6;
	Thu,  5 Sep 2024 13:10:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725534609;
	bh=+Wp7h+yVKjMqDOnuzocHsFpFD+fZU7fCOYID9KB6ZEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rFYMZ7l0z0n/9sZxti07wmHVLgrUZmxiqTRVmk0FxQLfTKljvqCypiEI86RwgfxH6
	 QsshlovyxJQFRu6xjHEe9+ju4aumXWcR7zJFd1bl+i1c74n9linBIt/6f1IXmDzy4l
	 qtUlbyxPaXs04Hfn6ePj2p73v41SgvcvFYoij7k4=
Date: Thu, 5 Sep 2024 14:11:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: kernel test robot <lkp@intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v4 3/4] media: raspberrypi: Add support for RP1-CFE
Message-ID: <20240905111120.GK16183@pendragon.ideasonboard.com>
References: <20240904-rp1-cfe-v4-3-f1b5b3d69c81@ideasonboard.com>
 <202409051822.ZzUGw3XQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202409051822.ZzUGw3XQ-lkp@intel.com>

On Thu, Sep 05, 2024 at 06:50:48PM +0800, kernel test robot wrote:
> Hi Tomi,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 431c1646e1f86b949fa3685efc50b660a364c2b6]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/media-uapi-Add-meta-formats-for-PiSP-FE-config-and-stats/20240904-192729
> base:   431c1646e1f86b949fa3685efc50b660a364c2b6
> patch link:    https://lore.kernel.org/r/20240904-rp1-cfe-v4-3-f1b5b3d69c81%40ideasonboard.com
> patch subject: [PATCH v4 3/4] media: raspberrypi: Add support for RP1-CFE
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240905/202409051822.ZzUGw3XQ-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051822.ZzUGw3XQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409051822.ZzUGw3XQ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/media/platform/raspberrypi/rp1-cfe/cfe.c:2445:12: warning: 'cfe_runtime_resume' defined but not used [-Wunused-function]
>     2445 | static int cfe_runtime_resume(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~~~
> >> drivers/media/platform/raspberrypi/rp1-cfe/cfe.c:2435:12: warning: 'cfe_runtime_suspend' defined but not used [-Wunused-function]
>     2435 | static int cfe_runtime_suspend(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~~~~
> vim +/cfe_runtime_resume +2445 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c

The recommended way to fix this is to switch from SET_RUNTIME_PM_OPS()
to RUNTIME_PM_OPS() and use pm_ptr() to set .driver.pm. This being said,
the driver won't work on a kernel with !CONFIG_PM given how you
implemented probe() and remove().

The pisp-be driver suffered from the same issue and Jacopo fixed it in
the last version. You can have a look at implement something similar.

>   2434	
> > 2435	static int cfe_runtime_suspend(struct device *dev)
>   2436	{
>   2437		struct platform_device *pdev = to_platform_device(dev);
>   2438		struct cfe_device *cfe = platform_get_drvdata(pdev);
>   2439	
>   2440		clk_disable_unprepare(cfe->clk);
>   2441	
>   2442		return 0;
>   2443	}
>   2444	
> > 2445	static int cfe_runtime_resume(struct device *dev)
>   2446	{
>   2447		struct platform_device *pdev = to_platform_device(dev);
>   2448		struct cfe_device *cfe = platform_get_drvdata(pdev);
>   2449		int ret;
>   2450	
>   2451		ret = clk_prepare_enable(cfe->clk);
>   2452		if (ret) {
>   2453			dev_err(dev, "Unable to enable clock\n");
>   2454			return ret;
>   2455		}
>   2456	
>   2457		return 0;
>   2458	}
>   2459	

-- 
Regards,

Laurent Pinchart


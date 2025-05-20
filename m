Return-Path: <linux-media+bounces-32862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B931AABCFE4
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BB998A49DC
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 06:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7777925D1F1;
	Tue, 20 May 2025 06:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P404pcyo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3232459C7;
	Tue, 20 May 2025 06:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747724104; cv=none; b=rYpkT7OwlagEDLFdW1yKAcTNG5JHCui+H39qGKpDiUDTv05+Q4PN/dQJihFOG1kcpK0Dd6Ab89uGo0AgljCHtsbdeymtMkicEOBe/OD+0JduCJUnGddJvDrv6MxVCIdU6xbZbpu5WfjWM0QIdGwK4ceIBQMsa43cOaU9owRLNmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747724104; c=relaxed/simple;
	bh=951dEPe5uUjapZnyCO5f89S2n2rKmDA2EaynzPnlqpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJR0DQYJMTtSW91WHPSGW3FAf5dqL3tvYf9hygJIbcH/U1MpcRFECJFy7+yu5PUepGu++pa4hslJ822bM0HrPXla68/oNHApgWVTYcYTEbYBUePt0Qos9mkj8u3TxKMlv3UOtdLxU6xbJF/neP/H+6nH3d7mh4XkBu5Unwd5zCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P404pcyo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747724103; x=1779260103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=951dEPe5uUjapZnyCO5f89S2n2rKmDA2EaynzPnlqpY=;
  b=P404pcyoGTAckvV/6F28YuxO/pTKU8Be8FWuytwy1aCRmb++WFeqv4l5
   TNl+e7EoBYaaquutt5iEEC7pLahd8tvJK3V7Rw61AR2VGFhRZomFBmVtu
   AB0jWe3xeOM2V/wxzmIwbrVmufWU2mu27HyzkjMAPO5Oq76X5uqSPeKyl
   dLEVhljMjlLhqq2fFOMFY8Sukljyk52EET3jpm9O6VkcULsqjzeTxaokB
   B4aPWcbJBJ/NakqX0OdH2zn0Wvge07m6QcNY+kS2vxEGpfYZBQoAOTNJ5
   abCCoACmIc3BR0/1xWheEtjnKA5EU6uS2sBING6HAMDD+3kMULVB8MOyU
   A==;
X-CSE-ConnectionGUID: 6TTiZ/LbR5azQMtGyAEK9Q==
X-CSE-MsgGUID: +BmqzcmGSjSmW6J8c2wJ4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="75044966"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="75044966"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 23:55:02 -0700
X-CSE-ConnectionGUID: qatfNncnTJiB6f+TJ+7iHQ==
X-CSE-MsgGUID: C8LnzUx/SrW33840p9egfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139635166"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 May 2025 23:54:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHGsL-000MFE-1M;
	Tue, 20 May 2025 06:54:57 +0000
Date: Tue, 20 May 2025 14:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 2/3] media: platform: Add Renesas Input Video Control
 block driver
Message-ID: <202505201457.ZoulCkx7-lkp@intel.com>
References: <20250519145754.454005-3-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519145754.454005-3-dan.scally@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on media-tree/master sailus-media-tree/streams sailus-media-tree/master v6.15-rc7 next-20250516]
[cannot apply to linuxtv-media-pending/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/dt-bindings-media-Add-bindings-for-the-RZ-V2H-IVC-block/20250519-230026
base:   linus/master
patch link:    https://lore.kernel.org/r/20250519145754.454005-3-dan.scally%40ideasonboard.com
patch subject: [PATCH 2/3] media: platform: Add Renesas Input Video Control block driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250520/202505201457.ZoulCkx7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201457.ZoulCkx7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201457.ZoulCkx7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c:152:12: warning: 'rzv2h_ivc_runtime_suspend' defined but not used [-Wunused-function]
     152 | static int rzv2h_ivc_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c:116:12: warning: 'rzv2h_ivc_runtime_resume' defined but not used [-Wunused-function]
     116 | static int rzv2h_ivc_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/rzv2h_ivc_runtime_suspend +152 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c

   115	
 > 116	static int rzv2h_ivc_runtime_resume(struct device *dev)
   117	{
   118		struct rzv2h_ivc *ivc = dev_get_drvdata(dev);
   119		int ret;
   120	
   121		ret = request_threaded_irq(ivc->irqnum, NULL, rzv2h_ivc_isr,
   122					   IRQF_ONESHOT, dev_driver_string(dev), dev);
   123		if (ret) {
   124			dev_err(dev, "failed to request irq\n");
   125			return ret;
   126		}
   127	
   128		ret = clk_bulk_prepare_enable(ARRAY_SIZE(ivc->clks), ivc->clks);
   129		if (ret) {
   130			dev_err(ivc->dev, "failed to enable clocks\n");
   131			goto err_free_irqnum;
   132		}
   133	
   134		ret = reset_control_bulk_deassert(ARRAY_SIZE(ivc->resets), ivc->resets);
   135		if (ret) {
   136			dev_err(ivc->dev, "failed to deassert resets\n");
   137			goto err_disable_clks;
   138		}
   139	
   140		rzv2h_ivc_global_config(ivc);
   141	
   142		return 0;
   143	
   144	err_disable_clks:
   145		clk_bulk_disable_unprepare(ARRAY_SIZE(ivc->clks), ivc->clks);
   146	err_free_irqnum:
   147		free_irq(ivc->irqnum, dev);
   148	
   149		return ret;
   150	}
   151	
 > 152	static int rzv2h_ivc_runtime_suspend(struct device *dev)
   153	{
   154		struct rzv2h_ivc *ivc = dev_get_drvdata(dev);
   155	
   156		reset_control_bulk_assert(ARRAY_SIZE(ivc->resets), ivc->resets);
   157		clk_bulk_disable_unprepare(ARRAY_SIZE(ivc->clks), ivc->clks);
   158		free_irq(ivc->irqnum, dev);
   159	
   160		return 0;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


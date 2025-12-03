Return-Path: <linux-media+bounces-48198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ECFCA1B67
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 22:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 778FC3009949
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 21:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606652DBF73;
	Wed,  3 Dec 2025 21:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gn+C2vnh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C022566E9;
	Wed,  3 Dec 2025 21:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798401; cv=none; b=nnp9TtA5X6B3Usr5uKu4HTd31PbaIshWfOitYO9TfB6mVeRXXHgi7ZjBmEaaEeIBXWtO5XALY5CiqKTltL5VFXETQZwY7O2duErGuVylPoJX8JGs7Wc6KH1Zh2gEJvI13/klsG3VNKE4dYw96LIs8YeWO6xMrw7ItDg3TaPREWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798401; c=relaxed/simple;
	bh=rKF7qiTP7ByQAwRp02xxNApztqUA1IF+VqvGoxJ0Z88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdLRh5bWOau00lQGzvtncL51PcgJnPwp6jp9PHMeWN3KzBpGAnbgmmJMWxTeuNdfTbNprYdZk6fCj8hnilbQ5Jvg9KCLiLiyFlovKzAGjVBLDYvUmS6hYjBdzwSHRU5ULwYAVQHlgEnp1IL4i8J6w961fla/PrtU45WTMSh0Beg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gn+C2vnh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764798399; x=1796334399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rKF7qiTP7ByQAwRp02xxNApztqUA1IF+VqvGoxJ0Z88=;
  b=gn+C2vnhSpkvlPDPiQFaZJkCp6qKgfHYCHjbtKYIbquEs1Ft0/b5p65q
   50QTfO1ajgbddWo4I0M8lNIdDmGtUkryifChk2T/Y5HscDtIwUR1qKDEp
   kZL0ZICyWusjH1GeC+YEUB9qLjAQZ5Xpz6LN8VbYdXsYLCWIDOEvd1G+e
   NSLMwNeAegXT+Tc0ut+zv9viyHqnYTCYinhmW4eNmoWtiZHQAP0wZUI5u
   AQIPLwj7OmI1NbAJz5YEVksxdNotfEBwIBOMsqYARfnYRu2XqM1UjMGv2
   UAnx7OH20b7dvaCoUQ3aB2ezrlpP8utsqKgb+x4bg762HaXdGOSALcqIm
   g==;
X-CSE-ConnectionGUID: 7SCOP0djSjyWxqJXjr3c9g==
X-CSE-MsgGUID: WtXsyiKZTAKRLtE1zKfL/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78159435"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="78159435"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 13:46:39 -0800
X-CSE-ConnectionGUID: YJX5cxpaRFGTIdQ9q8I2tA==
X-CSE-MsgGUID: r2+ADqXMQiy4dStaUFcV5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="199928360"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Dec 2025 13:46:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQugC-00000000DBR-0dEO;
	Wed, 03 Dec 2025 21:46:32 +0000
Date: Thu, 4 Dec 2025 05:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
Message-ID: <202512040513.mvgeYlO0-lkp@intel.com>
References: <20251203-csi_formatter-v1-2-eb9e1147b49e@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-csi_formatter-v1-2-eb9e1147b49e@nxp.com>

Hi Guoniu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1f2353f5a1af995efbf7bea44341aa0d03460b28]

url:    https://github.com/intel-lab-lkp/linux/commits/Guoniu-Zhou/media-dt-bindings-Add-CSI-Pixel-Formatter-DT-bindings/20251203-143208
base:   1f2353f5a1af995efbf7bea44341aa0d03460b28
patch link:    https://lore.kernel.org/r/20251203-csi_formatter-v1-2-eb9e1147b49e%40nxp.com
patch subject: [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20251204/202512040513.mvgeYlO0-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040513.mvgeYlO0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040513.mvgeYlO0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/nxp/imx9-csi-formatter.c:786:12: warning: 'csi_formatter_runtime_resume' defined but not used [-Wunused-function]
     786 | static int csi_formatter_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/nxp/imx9-csi-formatter.c:776:12: warning: 'csi_formatter_runtime_suspend' defined but not used [-Wunused-function]
     776 | static int csi_formatter_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx9-csi-formatter.c:763:12: warning: 'csi_formatter_system_resume' defined but not used [-Wunused-function]
     763 | static int csi_formatter_system_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx9-csi-formatter.c:758:12: warning: 'csi_formatter_system_suspend' defined but not used [-Wunused-function]
     758 | static int csi_formatter_system_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/csi_formatter_runtime_resume +786 drivers/media/platform/nxp/imx9-csi-formatter.c

   775	
 > 776	static int csi_formatter_runtime_suspend(struct device *dev)
   777	{
   778		struct v4l2_subdev *sd = dev_get_drvdata(dev);
   779		struct csi_formatter *formatter = sd_to_formatter(sd);
   780	
   781		clk_disable_unprepare(formatter->clk);
   782	
   783		return 0;
   784	}
   785	
 > 786	static int csi_formatter_runtime_resume(struct device *dev)
   787	{
   788		struct v4l2_subdev *sd = dev_get_drvdata(dev);
   789		struct csi_formatter *formatter = sd_to_formatter(sd);
   790	
   791		return clk_prepare_enable(formatter->clk);
   792	}
   793	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


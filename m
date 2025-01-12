Return-Path: <linux-media+bounces-24650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E25A0A71A
	for <lists+linux-media@lfdr.de>; Sun, 12 Jan 2025 04:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AD8F188517C
	for <lists+linux-media@lfdr.de>; Sun, 12 Jan 2025 03:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D92C1E517;
	Sun, 12 Jan 2025 03:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVCMaxOR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86595A41;
	Sun, 12 Jan 2025 03:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736653724; cv=none; b=ibRVM45dEdif21ykirwxDLX0qlifYX3gl1xmVETZgRMAqPL/epX646pP+X8qRwQ48ip2jGIgreVVt/XX/KFP7zL7sL3THb9mOKVxqCg401URXBBaX+MCXAJHZv2cROYbctv8wlzZaejmx1XxlaGl1vFrIVyAd9yJh6H2NUd58+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736653724; c=relaxed/simple;
	bh=N9IRLXfjnu8w+I0YwL4PLP/xDZRBfK3+ok5hYBXes8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFIJoySVML2+/iX41zTqccLGMDzumgTNt5kKnzbvIGu5kXSSbbVMDeLib9CYdDY1omXakDUF/ZpdGGxWIgrx8w23V55WR6/Hj8sZd1rPXTp2eXjE42NdgkoegxoD0ZKADvgR5W8N1f+Iz2hi8BQh4qtNbiWNR61cTvHsJraSQAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVCMaxOR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736653723; x=1768189723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9IRLXfjnu8w+I0YwL4PLP/xDZRBfK3+ok5hYBXes8M=;
  b=QVCMaxORlbyFW1VVf3DsKsrBlFADIRTDg2kVSa2y2qDlpqcvYoyWLYOA
   0KkBJZ2SUqS0asvoQZN71VUl/MtZtzDfKvVxWi+nRd5GgmS2Bb09CiamK
   zdDk5XWvWfb/7YuUjXmKp4PbHrRs+zoc3ipIRENOC8YFGQgpYwfD212BK
   5IxbTrYX7KZzo5DfHy6jKAGPKdgZb4oXDDfE35R1etsJPygV7ww2ejFEn
   dvK5EkFMhmlYKE1cB2RsWhGiU+GeYLTuVLc2L4MGL2cQR8FuV3z52gHYi
   W2yQouWceHfJ512bRU8xOF5hPoB4Y8Zpzr9hja/Ckl9IJe13YsvMUsP2Y
   g==;
X-CSE-ConnectionGUID: zHwOdO4kRXuQPYdj6Gk1+A==
X-CSE-MsgGUID: tPX4reFFQ2qYi1cMGh218Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="40677154"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="40677154"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 19:48:43 -0800
X-CSE-ConnectionGUID: MYldho1TQw+uWigyqCi+7Q==
X-CSE-MsgGUID: V7FMR0LaRpuZ6Z1D5+t+cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127376654"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2025 19:48:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWoxp-000LXX-0d;
	Sun, 12 Jan 2025 03:48:37 +0000
Date: Sun, 12 Jan 2025 11:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] spmi: Fix controller->node != parent->node breakage
Message-ID: <202501121127.soBkTzgY-lkp@intel.com>
References: <20250111-topic-spmi_node_breakage-v1-1-3f60111a1d19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111-topic-spmi_node_breakage-v1-1-3f60111a1d19@oss.qualcomm.com>

Hi Konrad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2b88851f583d3c4e40bcd40cfe1965241ec229dd]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/spmi-Fix-controller-node-parent-node-breakage/20250111-192215
base:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
patch link:    https://lore.kernel.org/r/20250111-topic-spmi_node_breakage-v1-1-3f60111a1d19%40oss.qualcomm.com
patch subject: [PATCH] spmi: Fix controller->node != parent->node breakage
config: hexagon-randconfig-002-20250112 (https://download.01.org/0day-ci/archive/20250112/202501121127.soBkTzgY-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121127.soBkTzgY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121127.soBkTzgY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spmi/hisi-spmi-controller.c:272:8: error: expected ')'
     272 |                                           sizeof(*spmi_controller));
         |                                           ^
   drivers/spmi/hisi-spmi-controller.c:270:35: note: to match this '('
     270 |         ctrl = devm_spmi_controller_alloc(&pdev->dev,
         |                                          ^
   1 error generated.


vim +272 drivers/spmi/hisi-spmi-controller.c

   262	
   263	static int spmi_controller_probe(struct platform_device *pdev)
   264	{
   265		struct spmi_controller_dev *spmi_controller;
   266		struct spmi_controller *ctrl;
   267		struct resource *iores;
   268		int ret;
   269	
   270		ctrl = devm_spmi_controller_alloc(&pdev->dev,
   271						  pdev->dev.of_node
 > 272						  sizeof(*spmi_controller));
   273		if (IS_ERR(ctrl)) {
   274			dev_err(&pdev->dev, "can not allocate spmi_controller data\n");
   275			return PTR_ERR(ctrl);
   276		}
   277		spmi_controller = spmi_controller_get_drvdata(ctrl);
   278		spmi_controller->controller = ctrl;
   279	
   280		iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   281		if (!iores) {
   282			dev_err(&pdev->dev, "can not get resource!\n");
   283			return -EINVAL;
   284		}
   285	
   286		spmi_controller->base = devm_ioremap(&pdev->dev, iores->start,
   287						     resource_size(iores));
   288		if (!spmi_controller->base) {
   289			dev_err(&pdev->dev, "can not remap base addr!\n");
   290			return -EADDRNOTAVAIL;
   291		}
   292	
   293		ret = of_property_read_u32(pdev->dev.of_node, "hisilicon,spmi-channel",
   294					   &spmi_controller->channel);
   295		if (ret) {
   296			dev_err(&pdev->dev, "can not get channel\n");
   297			return -ENODEV;
   298		}
   299	
   300		platform_set_drvdata(pdev, spmi_controller);
   301		dev_set_drvdata(&ctrl->dev, spmi_controller);
   302	
   303		spin_lock_init(&spmi_controller->lock);
   304	
   305		ctrl->dev.parent = pdev->dev.parent;
   306	
   307		/* Callbacks */
   308		ctrl->read_cmd = spmi_read_cmd;
   309		ctrl->write_cmd = spmi_write_cmd;
   310	
   311		ret = devm_spmi_controller_add(&pdev->dev, ctrl);
   312		if (ret) {
   313			dev_err(&pdev->dev, "spmi_controller_add failed with error %d!\n", ret);
   314			return ret;
   315		}
   316	
   317		return 0;
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-32618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCFEAB91F0
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 23:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65AFA7A9F15
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 21:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0460288C9A;
	Thu, 15 May 2025 21:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9Nb5ngX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7245B1922C4;
	Thu, 15 May 2025 21:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747345777; cv=none; b=IenKieU1f44EwsQqqXRVAYMi96tyddkXCxqQ31KZWGhPhw96WWFXrC8WzjZLb/vqT44z7DLr4hKtYzrO9U9esFQaMp0SskSiZORqCyxCoxAOhy5A+Yl45MtNFtFCGPMShJMJZtrXxDBMaA8WBTL317xDg5KxJAa909MVSq+CLF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747345777; c=relaxed/simple;
	bh=RoCc345vfJVENvuSRJcrRZFcN774itnQr3aMxr0Fyfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qN6nCkos7VZdINS0crEAa7Q3gpnIF6cd4UfUPR9HZPKzbA6W/2d6ZMPITCJumyA12FkTUe0UujYKx2v6BuZK/Y3UHekO3TTmIUMyhe5vzcc9Oq7M+evyQaOCT1Xa1ze5nxJkLp3Lk7Wbtgs4sIBwVosA59PLAzlEKqENr8HIgWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9Nb5ngX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747345774; x=1778881774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RoCc345vfJVENvuSRJcrRZFcN774itnQr3aMxr0Fyfw=;
  b=f9Nb5ngXL/wiTgmTqa6TuthzoRW9ZoUr0BAX7Ljw4dSC9EkDc/2zThVf
   QSCChxqVVeNFLoXrLAfdSiDD7emUOGo9s7PaGdtr8FKyUJMfsvTwMfBvg
   KDoCqaWOFu+RiDGcK5HtnwdUKXGy0DL+MF4OAxx18hU+1gbuX8B4IP2Dd
   1ISoKfpMcXl6qysPCwqSsTwCRuzEwzcSgyAWaXRcINYLb3S4+mWR4ALA1
   9760Zkx7c9h5nioV/ZPXfQDtgbjNhuN6+9JGevZlBK7s7DZEmY5EfQU20
   XOJHjqQ7pAed/U62RS3qW36ADJzV7lm4UxnGxW5tTqhNbv5R0VaUHjSrF
   Q==;
X-CSE-ConnectionGUID: oSFqGRcoTEeyu9Pd3NSRjA==
X-CSE-MsgGUID: Ls/q8E1hTyKc69FAV3wvwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="74706554"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="74706554"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 14:49:33 -0700
X-CSE-ConnectionGUID: gPxS+KsDQICu4S9djjz6WA==
X-CSE-MsgGUID: lV50IQaLQZ+PFDXaZT8Gcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138895866"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 14:49:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFgSD-000Ilz-07;
	Thu, 15 May 2025 21:49:25 +0000
Date: Fri, 16 May 2025 05:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v7 07/14] media: rockchip: add driver for mipi csi-2
 receiver
Message-ID: <202505160513.MZRCAdXI-lkp@intel.com>
References: <20240220-rk3568-vicap-v7-7-7581fd96a33a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v7-7-7581fd96a33a@collabora.com>

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Riesch-via-B4-Relay/Documentation-admin-guide-media-add-rockchip-camera-interface/20250514-235450
base:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
patch link:    https://lore.kernel.org/r/20240220-rk3568-vicap-v7-7-7581fd96a33a%40collabora.com
patch subject: [PATCH v7 07/14] media: rockchip: add driver for mipi csi-2 receiver
config: i386-kismet-CONFIG_VIDEO_V4L2_SUBDEV_API-CONFIG_VIDEO_ROCKCHIP_CSI-0-0 (https://download.01.org/0day-ci/archive/20250516/202505160513.MZRCAdXI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250516/202505160513.MZRCAdXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160513.MZRCAdXI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by VIDEO_ROCKCHIP_CSI
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
     Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
     Selected by [y]:
     - VIDEO_ROCKCHIP_CSI [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y]) && V4L_PLATFORM_DRIVERS [=y] && PM [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


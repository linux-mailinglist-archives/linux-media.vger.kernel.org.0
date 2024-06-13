Return-Path: <linux-media+bounces-13186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D66906A82
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 12:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DEAD284C83
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 10:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996D7142917;
	Thu, 13 Jun 2024 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqFn+x1w"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B30A142648;
	Thu, 13 Jun 2024 10:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718276160; cv=none; b=SN50Zbg2eABEBc9Kd3BdrRG5uISZp081t+NfiwsgJpHpLTtyJlUsyhdNExyy/D0leRfgxFT4/g2XDI7+oI6zxuKf5CCQyCr7B9hvA/Y0pOtZVFepYxVSTlLLEj29GekJqcv5F8Yc3yeFIs1NRYQ93lQjHp6sqxQK+HeBcG/nAA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718276160; c=relaxed/simple;
	bh=6b8ovoJTtpRLHBC4ajzYK05o5vyr6KBXY3vrPVEqJ8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8J4rkws4/3CUWkq6dyfGQUS5y+w0xLtCGKQ+xWuEOK9ESnwvWZSgqmJPl1e4iUnxBbyXWdqKxYUwam2lPI9kTRzfRiK8LlzPLbGBElnhgVQaErkv8OkgWoiF+LqlAzDXAFbsQvLPgxXdbfrSsydYMKfb/DYapOVHrrHXJf+/LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqFn+x1w; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718276159; x=1749812159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6b8ovoJTtpRLHBC4ajzYK05o5vyr6KBXY3vrPVEqJ8Q=;
  b=CqFn+x1wOCQ+MmZPdmbUXywU5A6mmHfaF+O9WYfsI2+lWkEbbejdE4OL
   8LPnkcM3Erx5DXXiVUvXIaH+mebH4sGJuT1NLHHjo/1yutUpBuzgrMcnt
   DTVPjsQcEy1kPcdTgXI73J889R5XIISGGK0t+gsqZk4XX9ulKAbX+9JBj
   jRyus3siiIr9U1+Fq+15BruAf2rPgGpLXnj3wy0jkRXGI7AqY8Z958XR6
   Erlq3TDvGqu1eCjMYcAbuHGG6kdgywaN8coCRtblWybEAvhht2V595Ccb
   bbwrXkDPj3wBSx8KZLpQKH/LFIdcrB+1kq37+F5AW3PnFtxFwjhVXR7vY
   w==;
X-CSE-ConnectionGUID: snFNkx/ZQHaw/kDTXmuvnw==
X-CSE-MsgGUID: jYcVhsXIRTmaRBdPbkNgCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="37606714"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="37606714"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 03:55:58 -0700
X-CSE-ConnectionGUID: tnrO+fJUQeGyx0/k0IZjWg==
X-CSE-MsgGUID: bKS/wAsASY+1gpvGdJC2ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="45228251"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Jun 2024 03:55:51 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHi7R-0002WE-0F;
	Thu, 13 Jun 2024 10:55:49 +0000
Date: Thu, 13 Jun 2024 18:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 6/9] accel/rocket: Add a new driver for Rockchip's NPU
Message-ID: <202406131802.9chtX0Ci-lkp@intel.com>
References: <20240612-6-10-rocket-v1-6-060e48eea250@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-6-10-rocket-v1-6-060e48eea250@tomeuvizoso.net>

Hi Tomeu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 83a7eefedc9b56fe7bfeff13b6c7356688ffa670]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomeu-Vizoso/iommu-rockchip-Add-compatible-for-rockchip-rk3588-iommu/20240612-215814
base:   83a7eefedc9b56fe7bfeff13b6c7356688ffa670
patch link:    https://lore.kernel.org/r/20240612-6-10-rocket-v1-6-060e48eea250%40tomeuvizoso.net
patch subject: [PATCH 6/9] accel/rocket: Add a new driver for Rockchip's NPU
config: arc-kismet-CONFIG_IOMMU_IO_PGTABLE_LPAE-CONFIG_DRM_ACCEL_ROCKET-0-0 (https://download.01.org/0day-ci/archive/20240613/202406131802.9chtX0Ci-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240613/202406131802.9chtX0Ci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131802.9chtX0Ci-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE when selected by DRM_ACCEL_ROCKET
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
     Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
     Selected by [y]:
     - DRM_ACCEL_ROCKET [=y] && DRM [=y] && (ARM64 || COMPILE_TEST [=y]) && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


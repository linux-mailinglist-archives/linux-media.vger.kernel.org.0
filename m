Return-Path: <linux-media+bounces-13144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EB3906185
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 04:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA3141C2157C
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 02:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA502D60A;
	Thu, 13 Jun 2024 02:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeSl3aPj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFC617C72;
	Thu, 13 Jun 2024 02:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718244392; cv=none; b=rsQdJDnxalYKy3lerHvExSUp51hQHHUXXDYchxZuXHziaDw2E1UFoy5Os5ZHKy4YmSzLe1oREycOjrBb5DQ2WuoH8NMHULY9iAK4vWM/tXb58lREmBlONlFmo46ma2f+ZHexw8ev+S3icF6hAXHd35RUGdEftlMa8GISR70ZRrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718244392; c=relaxed/simple;
	bh=8sFmvQ7Z83X7NLUoXzzUfw6X3sNAVrct6codoq1wV7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahN4vHTQZX/E29ojOqaqH00WW3uXfg6WRp4BA5txMLpg/lDvyU+3df4HZrbnyFQO7fJjZQM+e+yo1hOGwMneVpGFaip7AUaZNz5ohs14bQ9a1f6WljkIJ9uCrTVHnmtMCpZahhy4hYWfY/8MeAIKAjYTT6aTTICD9hNeZTtXyXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FeSl3aPj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718244391; x=1749780391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8sFmvQ7Z83X7NLUoXzzUfw6X3sNAVrct6codoq1wV7Q=;
  b=FeSl3aPjOjZFmnCKj9Sfa4taT7g0EXtP7ZvmJ3dBSfVbZjhjpisYgt/i
   H1QwLVH4WAf6wWP0DA4vrMmpI/ceWvokH6AeVCEyA9on2Okz8XMQ4CvWd
   MPkjG7qBcP23BD+/g8HmhLOl6+sAiZu8x+Xk9L4MmM3pvi5ssCk/C5Nsp
   iRohLlX3Iees3RD6pp2fKjbP7dId1DZpqquKNUa3QeM9bb7pWRLsqn/93
   um7uRHeiDEwCncXhYnzyYPA6QLHtGQY9de+GHuzPvM2vWH1XPf3BGJ9as
   NQUuNfzeUdSUPt1u+j44ctJxJ8BkoIVWWe3p99redMnftwDCemYJ1fHF4
   g==;
X-CSE-ConnectionGUID: WYbSL4Q3QZa2HulvPGK6oQ==
X-CSE-MsgGUID: P75acOM5TCSmz+MfFGhNRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15194300"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="15194300"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 19:06:30 -0700
X-CSE-ConnectionGUID: S0kNdoNXTeaDmFV2fIXYpQ==
X-CSE-MsgGUID: 6aVpmYIvR1+lJTRSNmEW5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44427853"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2024 19:06:24 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHZr4-000270-15;
	Thu, 13 Jun 2024 02:06:22 +0000
Date: Thu, 13 Jun 2024 10:05:59 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 6/9] accel/rocket: Add a new driver for Rockchip's NPU
Message-ID: <202406130901.oiofrkFe-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 83a7eefedc9b56fe7bfeff13b6c7356688ffa670]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomeu-Vizoso/iommu-rockchip-Add-compatible-for-rockchip-rk3588-iommu/20240612-215814
base:   83a7eefedc9b56fe7bfeff13b6c7356688ffa670
patch link:    https://lore.kernel.org/r/20240612-6-10-rocket-v1-6-060e48eea250%40tomeuvizoso.net
patch subject: [PATCH 6/9] accel/rocket: Add a new driver for Rockchip's NPU
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240613/202406130901.oiofrkFe-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130901.oiofrkFe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130901.oiofrkFe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/include/asm/processor.h:17,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/mutex.h:14,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/accel/rocket/rocket_core.c:6:
>> arch/loongarch/include/uapi/asm/ptrace.h:25:25: error: expected identifier before '(' token
      25 | #define PC              (GPR_END + 2)
         |                         ^
   drivers/accel/rocket/rocket_registers.h:53:9: note: in expansion of macro 'PC'
      53 |         PC = 0x00000100,
         |         ^~


vim +25 arch/loongarch/include/uapi/asm/ptrace.h

803b0fc5c3f2ba Huacai Chen 2022-05-31  16  
803b0fc5c3f2ba Huacai Chen 2022-05-31  17  /*
803b0fc5c3f2ba Huacai Chen 2022-05-31  18   * For PTRACE_{POKE,PEEK}USR. 0 - 31 are GPRs,
803b0fc5c3f2ba Huacai Chen 2022-05-31  19   * 32 is syscall's original ARG0, 33 is PC, 34 is BADVADDR.
803b0fc5c3f2ba Huacai Chen 2022-05-31  20   */
803b0fc5c3f2ba Huacai Chen 2022-05-31  21  #define GPR_BASE	0
803b0fc5c3f2ba Huacai Chen 2022-05-31  22  #define GPR_NUM		32
803b0fc5c3f2ba Huacai Chen 2022-05-31  23  #define GPR_END		(GPR_BASE + GPR_NUM - 1)
803b0fc5c3f2ba Huacai Chen 2022-05-31  24  #define ARG0		(GPR_END + 1)
803b0fc5c3f2ba Huacai Chen 2022-05-31 @25  #define PC		(GPR_END + 2)
803b0fc5c3f2ba Huacai Chen 2022-05-31  26  #define BADVADDR	(GPR_END + 3)
803b0fc5c3f2ba Huacai Chen 2022-05-31  27  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


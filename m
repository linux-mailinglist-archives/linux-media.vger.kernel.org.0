Return-Path: <linux-media+bounces-35124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE5CADE2CC
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 06:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4B283B95ED
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 04:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C541F1505;
	Wed, 18 Jun 2025 04:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvRQD13m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427801E3DE8;
	Wed, 18 Jun 2025 04:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750222443; cv=none; b=EIz9G2jFUC9PK1YD25fove4ai3+0fyc/peNoiw2cVqA2/CpI8bW04E1la/ygBS4z7JbTxjBTwWbUkOWQyeOmNwza5yXKsdzFjvlzE/3spN9dDKh5Zyut1iUqXQ2rCYREvsk6ylmY4fkaUjk3SKUArKal1RBy35sX8XgNI6ZnmRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750222443; c=relaxed/simple;
	bh=DEKlm+ejo/0mzszOUsL53ctVVQ1j4m3qewxhIFLcv0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLHbfGUo5xUWsK+obR0jTu9LzaVhRer8xUTjsnQPIWp8zreMJyysMT0TEERC53S5J92bZtpptOVk3bdIu2jaYfj89mMvYNSPUFVkNbj1fHuegPPi+TykYiJIQXVTFj7OgiPZ71LrmdSXCk9dkcYZuTQsiVWFxSPGzcAC/+wIW/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvRQD13m; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750222442; x=1781758442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DEKlm+ejo/0mzszOUsL53ctVVQ1j4m3qewxhIFLcv0M=;
  b=MvRQD13m/2GjqaQ3PLufxQ//8XWD9ExvXLL4pOFXwZkQEcnyOK/cBiLW
   D+Ate2EILgRIlfcGYMMsceD7+tTlsyzdCMcqQ3/sSWcChNnNTd4VQ84g0
   ObkuG84q+EIBSINWgyR5j+Ty6pTEqcQTk77BBl17uF4jXBxkRTYQnYCYm
   7gN0bG4Lai45SBffVMh6BLamaSp074blXFhfmyKBzj5anSsx8eSRl9T1x
   5OOyYjLFA1bZl2ZtxmcsfH+dnaDuXnwk+gI1tkAtyn4SAa6YZZrCdH+t2
   m8FDncTP9f8+h6aHsP64LkKnNitNMA8zcdGffWb6jbBBVxdinvbUvDWv+
   g==;
X-CSE-ConnectionGUID: Cth04GmDSQKLQV2SNHAO5A==
X-CSE-MsgGUID: aIi220FPSHKxfsVA72XTjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63460462"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="63460462"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:54:01 -0700
X-CSE-ConnectionGUID: IlMBVbuZTBeIdVORDtt5FA==
X-CSE-MsgGUID: fyNBzSTZSCeodXZuqA5+kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149026086"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jun 2025 21:53:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRko7-000JPW-1J;
	Wed, 18 Jun 2025 04:53:55 +0000
Date: Wed, 18 Jun 2025 12:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <202506181230.D53QwmdL-lkp@intel.com>
References: <20250616145607.116639-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616145607.116639-4-benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rockchip/for-next linus/master v6.16-rc2 next-20250617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-vendor-prefixes-Add-Verisilicon/20250616-225842
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250616145607.116639-4-benjamin.gaignard%40collabora.com
patch subject: [PATCH 3/5] iommu: Add verisilicon IOMMU driver
config: arm64-randconfig-r111-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181230.D53QwmdL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250618/202506181230.D53QwmdL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181230.D53QwmdL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/vsi-iommu.c:890:24: sparse: sparse: symbol 'rockchip_vsi_iommu_driver' was not declared. Should it be static?

vim +/rockchip_vsi_iommu_driver +890 drivers/iommu/vsi-iommu.c

   889	
 > 890	struct platform_driver rockchip_vsi_iommu_driver = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


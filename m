Return-Path: <linux-media+bounces-13171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98479906824
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 11:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3043E282F4A
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 09:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792EE13DB83;
	Thu, 13 Jun 2024 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQASjc/4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEDB13D633;
	Thu, 13 Jun 2024 09:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718269736; cv=none; b=kf/y1zI/9eF/mVRJ+WAg43gfTMUTCY+Dzpc9DGWX8VBesFTroLJq6fbSj0OTh8d2+I5HW1LoU8OA/gzII9KT/Y72S9wXpoMLn8toExfzQ6MBUselpqwibLgP1q2Aal0SreBKTmvfszs+avFpcxNNahx++kQjohl1Hz2CL0RRUvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718269736; c=relaxed/simple;
	bh=Nz4bq/RV/DLL86umhKgYai6V/Hg+Fl/30aSJdOT7Jbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSLA8hXQLmeeHTkJJJdBnpojG0ZneBnANW6Ka6d9aghdhtgsSug+vhQ3+2bI8ctRYicP0XWlaUPBKcmauIfKICBbhosEV0UzP2UF0oaCXZioSmyoZGHgce38PZv+ssxpcfe/2o2QbhWUmtcYdJkmsXuSWL5tC3Y3emD15iBRIBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQASjc/4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718269735; x=1749805735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nz4bq/RV/DLL86umhKgYai6V/Hg+Fl/30aSJdOT7Jbg=;
  b=QQASjc/4RRM09Uau/GdpMrjfTJsYFayIF7RtHj/9vq7y9L6jVaSMojym
   7EJYSLnD4OH9xpGYNAENo4dRARNNcC/+YB867hpFI9mSHeSrkV637h4Q0
   9Da9j7noYeBpDCROoi7Ltn+xabdrm0c9Nf6sLejlVqnYcPSXAFiLfQ6zb
   UiEJ85l6FnNo4Sjhq9kQgVSmMVs62D9jUkHnXJ1VDyplhHS/JEx7iZxjq
   HrjP4Bh143Colk/84p7nPYmCItqMbJsxAFnTt5eKM++5aJLQSq00dDpq6
   hPueK387CfY4TyuQutS/qoDL1TguZu90W27OZ54xsjwfyg3VwWW22L9UI
   Q==;
X-CSE-ConnectionGUID: 01WjDDv1SQ2piBX69Z/ADQ==
X-CSE-MsgGUID: bnfSKVH+S3KqANEzPyAHbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="26498688"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="26498688"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 02:08:54 -0700
X-CSE-ConnectionGUID: GLT45S0sQR2HOiedp1pbaw==
X-CSE-MsgGUID: EwMmexHPQzGx+7U88srY9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="45201966"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Jun 2024 02:08:48 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHgRp-0002Qs-1L;
	Thu, 13 Jun 2024 09:08:45 +0000
Date: Thu, 13 Jun 2024 17:08:09 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 8/9] accel/rocket: Add job submission IOCTL
Message-ID: <202406131640.WbBaRMbr-lkp@intel.com>
References: <20240612-6-10-rocket-v1-8-060e48eea250@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-6-10-rocket-v1-8-060e48eea250@tomeuvizoso.net>

Hi Tomeu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 83a7eefedc9b56fe7bfeff13b6c7356688ffa670]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomeu-Vizoso/iommu-rockchip-Add-compatible-for-rockchip-rk3588-iommu/20240612-215814
base:   83a7eefedc9b56fe7bfeff13b6c7356688ffa670
patch link:    https://lore.kernel.org/r/20240612-6-10-rocket-v1-8-060e48eea250%40tomeuvizoso.net
patch subject: [PATCH 8/9] accel/rocket: Add job submission IOCTL
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240613/202406131640.WbBaRMbr-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131640.WbBaRMbr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131640.WbBaRMbr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/accel/rocket/rocket_job.c:6:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/accel/rocket/rocket_job.c:6:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/accel/rocket/rocket_job.c:6:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/accel/rocket/rocket_job.c:6:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/accel/rocket/rocket_job.c:353:11: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     353 |         uint32_t status, raw_status;
         |                  ^
>> drivers/accel/rocket/rocket_job.c:353:19: warning: variable 'raw_status' set but not used [-Wunused-but-set-variable]
     353 |         uint32_t status, raw_status;
         |                          ^
   drivers/accel/rocket/rocket_job.c:40:1: warning: unused function 'to_rocket_fence' [-Wunused-function]
      40 | to_rocket_fence(struct dma_fence *fence)
         | ^~~~~~~~~~~~~~~
   10 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
   Selected by [m]:
   - DRM_ACCEL_ROCKET [=m] && DRM [=m] && (ARM64 || COMPILE_TEST [=y]) && MMU [=y]


vim +/status +353 drivers/accel/rocket/rocket_job.c

   350	
   351	static void rocket_job_handle_irq(struct rocket_core *core)
   352	{
 > 353		uint32_t status, raw_status;
   354	
   355		pm_runtime_mark_last_busy(core->dev->dev);
   356	
   357		status = rocket_read(core, REG_PC_INTERRUPT_STATUS);
   358		raw_status = rocket_read(core, REG_PC_INTERRUPT_RAW_STATUS);
   359	
   360		rocket_write(core, REG_PC_OPERATION_ENABLE, 0x0);
   361		rocket_write(core, REG_PC_INTERRUPT_CLEAR, 0x1ffff);
   362	
   363		spin_lock(&core->job_lock);
   364	
   365		if (core->in_flight_job)
   366			rocket_job_handle_done(core, core->in_flight_job);
   367	
   368		spin_unlock(&core->job_lock);
   369	}
   370	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


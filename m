Return-Path: <linux-media+bounces-49359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1DFCD6903
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 16:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F39FF3091B5F
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 15:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E96F32E142;
	Mon, 22 Dec 2025 15:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3nyI1Ff"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B8732D0E9;
	Mon, 22 Dec 2025 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766417608; cv=none; b=VTEEIJ12cUqa9u+ziIveIUjDK8RE6fBLd/VxucgB8DEMfFcrgrkH83hPOYo84f7rxguDE6iuytPfSCp2AEgmrv1k4NJo0EIy+5co7E1faiTGKZs9s8c5Cpq9elaA0637BfUzXwvM6CjjE57ZJu42P/FOi4aZn382X1JPMvMyGaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766417608; c=relaxed/simple;
	bh=oevZNtJK/umXqU3Iu+7UzKkPRbb+1+8qqTTjLfmC6wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7cHvIpvBsllMtm1FF7E79gG/dQOCQ7w8Dl0TDwgt1UOfVwfsqWsWqC+NIJEEz3p5v/X4FYtwV5rqOIaudJgRUOSPaOQ5tw5P3rYbmB20ZYpOh/rGvsq2AQEqHj4koq5Byb9s65keQVq8EdyIuGYbYhYjGGMOphVCy7pZ24GS2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3nyI1Ff; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766417607; x=1797953607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oevZNtJK/umXqU3Iu+7UzKkPRbb+1+8qqTTjLfmC6wU=;
  b=L3nyI1FfLjZjPyirgy6rU+eQju5nZXHNh9NTcof+mggV1JOoRk9Px/RJ
   FDRg+pLrzqF1NGdrrHHD8kH12AQmCFrJLjmJCiwD7AU171LjxfYn4ICOr
   dsQTnudhJ74QCOMQi4xO6wqH9HnCM0ACFDGgz7E/gLIsFBGtmyMyXRK0s
   HiDmwcEPuvHKFXkfqEgRmt2Cu3jc3uwVxvZZ03XPNJoIGNYroHHfmkLQX
   FTDgEqUqSExmXfAL0KNMF25M4I38jCKRmcuk4xBnzEh0m0WySw3NhYvhF
   GqurEIg3zrZCVIxOe20DCcRzgvYEUQihL0sji0rHUoD0x0gP+61YVjSJ+
   w==;
X-CSE-ConnectionGUID: MFVnQTJaSNSliFv3pBX/dA==
X-CSE-MsgGUID: cInLD3vRQduXKCZ75RwCwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68026712"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68026712"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 07:33:26 -0800
X-CSE-ConnectionGUID: ukAZI8NMSOiEtpG5QUZ/Uw==
X-CSE-MsgGUID: L8+GSCwISZyJ+reXBPVunA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="223033237"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2025 07:33:22 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXhuR-000000005Y0-3SMV;
	Mon, 22 Dec 2025 15:33:19 +0000
Date: Mon, 22 Dec 2025 16:32:53 +0100
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v10 5/7] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
Message-ID: <202512221600.vlUX9PF6-lkp@intel.com>
References: <20251215085349.10155-6-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215085349.10155-6-benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc2 next-20251219]
[cannot apply to robh/for-next rockchip/for-next arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-vendor-prefixes-Add-Verisilicon/20251215-165740
base:   linus/master
patch link:    https://lore.kernel.org/r/20251215085349.10155-6-benjamin.gaignard%40collabora.com
patch subject: [PATCH v10 5/7] media: verisilicon: AV1: Restore IOMMU context before decoding a frame
config: openrisc-kismet-CONFIG_VSI_IOMMU-CONFIG_VIDEO_HANTRO_ROCKCHIP-0-0 (https://download.01.org/0day-ci/archive/20251222/202512221600.vlUX9PF6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221600.vlUX9PF6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221600.vlUX9PF6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VSI_IOMMU when selected by VIDEO_HANTRO_ROCKCHIP
   WARNING: unmet direct dependencies detected for VSI_IOMMU
     Depends on [n]: IOMMU_SUPPORT [=n] && (ARCH_ROCKCHIP && ARM64 || COMPILE_TEST [=y])
     Selected by [y]:
     - VIDEO_HANTRO_ROCKCHIP [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_HANTRO [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-28279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E089A6290C
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 09:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 479BD881407
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 08:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A8C1F03C2;
	Sat, 15 Mar 2025 08:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePr/JySJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3D51DF994;
	Sat, 15 Mar 2025 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742027156; cv=none; b=pnG0zqUPG46wI1XM9jUfjgMRgQzXUdyQTlRhBPFtiPv5jAjYYactqmJpp9imprQeuQo6cVWPJhLEVBdSYaEWckVUzUYMq5jUo3AE1OB1OygXZLLhcs3iKcrEk1t4HBJLs8ye7fRJNd23OxA64nVXo6hjJN7LvmiftKNrT5nOXgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742027156; c=relaxed/simple;
	bh=VkdKPwJSbXuVY/GWIxtpTxYdiXqy9fUXpxwA7ilNpuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhurXDJuBFKsZmSVZstQFwJu9x9Uk2CuK1t0KO90HvEFWpd9p0P/Utnqs7FFlhscAQjy2yv+a42WHjghnSpinNsZLbRil7ZVj3uYjOtZopnho1o+m3udsteY8yGV1oVIPJuc/ATQTwPZX9Ssa3q7Z5NejbfK77/sPtGMUnluWIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePr/JySJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742027154; x=1773563154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VkdKPwJSbXuVY/GWIxtpTxYdiXqy9fUXpxwA7ilNpuc=;
  b=ePr/JySJTwK0VWTawwOIXc4igtUV0Zx0JRhpWx9hBzJR+hThqaYPk+2g
   tbPQZj+GR4zevYMJULysWhA0mE3vpowl9WMkQQOQBHjKVcGyvkdoXoUM/
   6w5maa4qq7qNR7wlK/lysCPSnyJAVs6abq8Dzgo5l+nrEaJjBe+1eeQhz
   i++EjEog89i9Nt05+kTYUBy2O5o0PrRGW+hhpAj9C5KQE20VOmGw3aw3N
   VUJcPkkQbCyGdToxChN0keGng72qzxRUYGj/EksbM8NBeE4PacXN04xIF
   zvWwoWIPmvgpMvnEy9GHCIfFAcn9erMX4iyvCN6Fy2bPF4G7SUleROZx2
   w==;
X-CSE-ConnectionGUID: mhf6CeSzTJ+QKEm7XexEgQ==
X-CSE-MsgGUID: fAzzUSVwTDCJnHJLYhB6Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43388362"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="43388362"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 01:25:54 -0700
X-CSE-ConnectionGUID: UBbR/qeyT+uAlIeUlwwv7A==
X-CSE-MsgGUID: uIYkhi5mSoij1+dwF9nXrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="125691055"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2025 01:25:50 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttMq4-000B9v-1M;
	Sat, 15 Mar 2025 08:25:48 +0000
Date: Sat, 15 Mar 2025 16:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH 4/5] media: vcodec: Implement manual request completion
Message-ID: <202503151605.1d1dDLuM-lkp@intel.com>
References: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b@collabora.com>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f2151613e040973c868d28c8b00885dfab69eb75]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Fricke/media-mc-add-manual-request-completion/20250314-213005
base:   f2151613e040973c868d28c8b00885dfab69eb75
patch link:    https://lore.kernel.org/r/20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b%40collabora.com
patch subject: [PATCH 4/5] media: vcodec: Implement manual request completion
config: x86_64-buildonly-randconfig-003-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151605.1d1dDLuM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151605.1d1dDLuM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151605.1d1dDLuM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c:29:13: warning: no previous prototype for function 'state_to_str' [-Wmissing-prototypes]
      29 | const char *state_to_str(enum mtk_request_state state)
         |             ^
   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c:29:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
      29 | const char *state_to_str(enum mtk_request_state state)
         |       ^
         | static 
   1 warning generated.


vim +/state_to_str +29 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c

    28	
  > 29	const char *state_to_str(enum mtk_request_state state)
    30	{
    31		switch (state) {
    32		case MTK_REQUEST_RECEIVED:
    33			return "RECEIVED";
    34		case MTK_REQUEST_LAT_DONE:
    35			return "LAT_DONE";
    36		case MTK_REQUEST_CORE_DONE:
    37			return "CORE_DONE";
    38		default:
    39			return "UNKNOWN";
    40		}
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


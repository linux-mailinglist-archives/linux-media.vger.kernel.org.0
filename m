Return-Path: <linux-media+bounces-28282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB3BA62B2A
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 11:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE68B17C7F9
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 10:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3313E1F874C;
	Sat, 15 Mar 2025 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdbSChBZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F6519F462;
	Sat, 15 Mar 2025 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742034982; cv=none; b=BZjp45t+jXVfDT/q+ThVQiG1AiA5UeChfpzINhpzX3/VNCrF10nDi1L4+ZR71zCnhW1fmAuZ86ywRdZkvtfvdlYIVf1mobZixXq5Jf+GVI33nuywqCOuA9rmIMGQJGpI1We89+/Hv28EI57BVPFo3/QICTMELXGqNBLthKoXEYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742034982; c=relaxed/simple;
	bh=6qV1PsRPK6FY5acDPimlrsGS7ltsPHOPEUhKI9EF4XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tz04R3R6f+NbZrm8R7ObSEAvqLEXqSnYJQGFcFw0+kHojqZeeDzGCYyDCm4SlGWSLaztsBObQgVn1tHA6MXqNxxPA9dBhJCAI1d/V91VE48r3dzZRJE19POTsCEI+Vg+0GJSNw1tzJQYrLsPIVcjlQtBjaTlb2VGuV2F15w0BcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdbSChBZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742034981; x=1773570981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6qV1PsRPK6FY5acDPimlrsGS7ltsPHOPEUhKI9EF4XM=;
  b=KdbSChBZ8Zvx3VP9eHCeFqPb4BCTRxYFgzwN0tL++1DGQb9hjOsncbpK
   G2aExJ9y3MfjdGc24EFzuLFIOB+eZF/yw7PEPn1tAxisFSoFtwpA40wD7
   qld4G21ILS1evihHfMcBJjGq1yGuPH0nLZ1rnfkx/zBGoca3LbyqFpXf/
   kPuz/ADsht2SNZscw5w+U/nlJOO6PMQ0TFOSjyeEUjBHdpWUQydagVge8
   +sn3D6NEI1CjOQc+OWa9UvKIaDZIsP/tpfIb+End8O/1VoZnlTe/KZIKj
   JPLZ/6Mx/Si29fhw8UTcmcp0MD6XXkij5Y4ahs6W1ENi4TBm2VFq6nRtN
   w==;
X-CSE-ConnectionGUID: daUngqJ1SS2JNp6PEpxVhw==
X-CSE-MsgGUID: 9gdcWDYIQD6FqXThQAxB6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="42432666"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="42432666"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 03:36:20 -0700
X-CSE-ConnectionGUID: eC/YFbOmQVSFCVE/Kr1wMg==
X-CSE-MsgGUID: esa9I441ThObWjVI1iQfHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="144695410"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Mar 2025 03:36:17 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttOsJ-000BGR-0F;
	Sat, 15 Mar 2025 10:36:15 +0000
Date: Sat, 15 Mar 2025 18:36:04 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH 4/5] media: vcodec: Implement manual request completion
Message-ID: <202503151824.EfaOfTwf-lkp@intel.com>
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
config: arm-randconfig-001-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151824.EfaOfTwf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151824.EfaOfTwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151824.EfaOfTwf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c:29:13: warning: no previous prototype for 'state_to_str' [-Wmissing-prototypes]
      29 | const char *state_to_str(enum mtk_request_state state)
         |             ^~~~~~~~~~~~


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


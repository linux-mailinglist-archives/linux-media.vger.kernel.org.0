Return-Path: <linux-media+bounces-29029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1551A76128
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5745188616B
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AA71D5AB7;
	Mon, 31 Mar 2025 08:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSGrLJEd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48EC13C9C4;
	Mon, 31 Mar 2025 08:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408993; cv=none; b=Kxjwuy+WSNJQ9bbGskliMF7nciQ1IVP+oOaRAHmIPeuH3vEUqjhGcsILAYk2kwP1csilJdJ+68JPF0hljz3aInM4x3hBUfEoIv1lv2gcxvZ4Qo8H1kOY5qNGrCX+KkcWga9l95BlWuBo+bzBtlKrOLErnqkQ1mLyN6SlwrsVYP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408993; c=relaxed/simple;
	bh=QGqKdfPSBPoe0ePQ6nTPzXqBmsVZuUhxOCBg+SqfvXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyased7tdRRsz/6W6r+xz1CDDZRxCaGJpYJe6sA1aCu0codkyw0rDlMl7DYcbxw3FDiYxkAoiGHu8V6Xc777ZZ5QP2Qq/OspTg1HJRxcIcdyU8UYiX8+IAujXoMCQvJ3p8D8UMVLr/Z5g+G8evw0368iNQI31w8ziNHy/ZO9VAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSGrLJEd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743408990; x=1774944990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QGqKdfPSBPoe0ePQ6nTPzXqBmsVZuUhxOCBg+SqfvXg=;
  b=LSGrLJEdB3mmXmkPNeheflDyKNofWu4JjzA78Hpg8tnTF8ph/aQX+Cem
   X4a2CR4189ZRvmBEWPl0V062QKN5vQMkqkhKzNIWb4nY7qAJGg15+hqUL
   +c9fBF3A5a4Nyc9nBHgjBq2sPtG66+8VBpAXniG25oAWy/q9/1CcO3Jin
   k1ISyKNoI9qRlFgTYsCRBzXqVr5Ao0e3i9rj2KTF9WMU8hhSnQx3Hvy87
   MAMpfhVlgd5tIzpJIVXEusPrlJ8kNT1cCr3D6BOtNBxLetb5k25MkMMGw
   jba1BJWHTwViEf4rp4AFQTs/YFI/cf2t8TzP4srsi6IDpzf9Vgwxb0enP
   Q==;
X-CSE-ConnectionGUID: WYLdVE9wQ6O6nAl1J06ggw==
X-CSE-MsgGUID: U15QznmsQkajbn3Jperi6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="48350876"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="48350876"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 01:16:30 -0700
X-CSE-ConnectionGUID: 9FkABt1SRSqJZ+qcfb5pog==
X-CSE-MsgGUID: tY7RLoEiRtijHRLb6HPV3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="126932615"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 31 Mar 2025 01:16:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzAJk-00098A-0h;
	Mon, 31 Mar 2025 08:16:24 +0000
Date: Mon, 31 Mar 2025 16:15:30 +0800
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
Message-ID: <202503311620.hhbFrG8T-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on f2151613e040973c868d28c8b00885dfab69eb75]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Fricke/media-mc-add-manual-request-completion/20250314-213005
base:   f2151613e040973c868d28c8b00885dfab69eb75
patch link:    https://lore.kernel.org/r/20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b%40collabora.com
patch subject: [PATCH 4/5] media: vcodec: Implement manual request completion
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250331/202503311620.hhbFrG8T-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503311620.hhbFrG8T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503311620.hhbFrG8T-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.o: in function `state_to_str':
>> mtk_vcodec_dec_drv.c:(.text.state_to_str+0x0): multiple definition of `state_to_str'; drivers/media/platform/chips-media/wave5/wave5-helper.o:wave5-helper.c:(.text.state_to_str+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


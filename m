Return-Path: <linux-media+bounces-11497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA458C6DD4
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 23:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05D501F220F6
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 21:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98DF15B562;
	Wed, 15 May 2024 21:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkxEuH4c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2936F15B544;
	Wed, 15 May 2024 21:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715809214; cv=none; b=MBnodDhG/02sUALg/8mP1W9s1XmgqVb2AfWdQOMNIzIX1nIkn0bgEsZDHKVSHMoOtshkNDBwfI5RSe4qme1rbthEuv+YX1ZCfb+9qzk0yFyWrPk5B8ICqj1THWGWxNkEKmio6iwt3XCLLiY8fCsGXQ9rEPa1O3C4gu++wW/RphY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715809214; c=relaxed/simple;
	bh=ZA9yOMn+MhqqxmDcjB9tY8qraread9zVz7DmZffV1hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pp+Py+wPsP96NYJ4LYBCiPmhFZblS0uVbdXRMBxykTspvPKh4gpOl1hXpEdalt/rlRMnNTz4q26oWMFNZGbULjuM+Ya+YMYDZgCpcejY+ZML2ENVxhLUNMQL0g1sL+qtlHdls4akogrmQn76+mvude8J9pUoX8F3k3cDuUnb+PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkxEuH4c; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715809211; x=1747345211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZA9yOMn+MhqqxmDcjB9tY8qraread9zVz7DmZffV1hI=;
  b=gkxEuH4cFmcl9L/MOk8gqBuzejFgUk6txd5BSAoVJRCsx0sfnHlXAsqi
   j9PcE8pb6/1cryvuOt0ZcV1cn0YttH6e82U/u4U0gvb8mQxQXGbkkZVhK
   TwdTTnf7bcEdGx1Gf4VDXM/qCu9f6iJnkmgo8S9F2CkXjTTdgUylVsiXe
   b/c4GvdNAu19Lt8ftf7WYrUiyYvyd9lA71JOxpDWpEO4jTMSqTJNLNVuR
   BmHbi5bycNrM+hRw0fAnn2JHS5zKtWFL5jccjokZ+DRehdcle1MOaPTt4
   5DutPLyQVExrY1eVLDH4orFQjyVNgXpttu4uuS+RqaPMSQhQFApC2rOaV
   A==;
X-CSE-ConnectionGUID: 3tMTA3C7TUin1IsopPJyKQ==
X-CSE-MsgGUID: OVdTU0qRSq2gkbNjOhZMXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29377285"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="29377285"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 14:40:10 -0700
X-CSE-ConnectionGUID: AnnXY3RQT/aRXH/EpxdQAg==
X-CSE-MsgGUID: j/DfK47aQCK74OmwZ7Bw2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="35976151"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2024 14:40:09 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7MM1-000DI7-2y;
	Wed, 15 May 2024 21:40:05 +0000
Date: Thu, 16 May 2024 05:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	mchehab@kernel.org, nicolas.dufresne@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH] media: verisilicon: Add reference buffers compression
Message-ID: <202405160544.3hBso24H-lkp@intel.com>
References: <20240514162054.294002-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514162054.294002-1-benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on pza/reset/next linuxtv-media-stage/master linus/master v6.9 next-20240515]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-verisilicon-Add-reference-buffers-compression/20240515-002208
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240514162054.294002-1-benjamin.gaignard%40collabora.com
patch subject: [PATCH] media: verisilicon: Add reference buffers compression
config: alpha-randconfig-r133-20240515 (https://download.01.org/0day-ci/archive/20240516/202405160544.3hBso24H-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240516/202405160544.3hBso24H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160544.3hBso24H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/platform/verisilicon/hantro_hevc.c:28:6: sparse: sparse: symbol 'hevc_use_compression' was not declared. Should it be static?

vim +/hevc_use_compression +28 drivers/media/platform/verisilicon/hantro_hevc.c

    27	
  > 28	bool hevc_use_compression;
    29	module_param_named(hevc_use_compression, hevc_use_compression, bool, 0644);
    30	MODULE_PARM_DESC(hevc_use_compression,
    31			 "Use reference frame compression for HEVC");
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


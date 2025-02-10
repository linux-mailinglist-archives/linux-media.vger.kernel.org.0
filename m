Return-Path: <linux-media+bounces-25891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F8AA2E8A8
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964C21886C9F
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C7D1C5F1F;
	Mon, 10 Feb 2025 10:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcs5z9wH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1C21C54AF;
	Mon, 10 Feb 2025 10:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182021; cv=none; b=hNcLXTCep0qNZUlliWPQSZLys+v/E/EO7Zl2zPGOnT3IQx6nXkDBEctJAoW5pq89e4xsT5K4cnkt3S686WM2YOlAuMoCg2TY/D0bZdXmLYMU4Bq+OFdAy6Wo2B/DwBpnTuLXuB5fvttmOYeDpSVximpqodaHJpxXxDOo/KLh1Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182021; c=relaxed/simple;
	bh=5uoVeSj0QN4EeZcCrlskyNvROXSluRl4IF+26szp08I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtVEttD/OsX2Af/yh5fOHPfEyoR2y0DF4dH4gtY+Z4nyXbs7/HQPVcsV55lXCSQxSYdoj/8IEq+FvoP1MsFeqYIX6+Kw+GeaDZB04nNoaAQODGtsiIGh2aLdXWbkEviP4JDi1BT6IIh5nkl59uE30sPhYaSmM0Q4l3WycDS24ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcs5z9wH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739182020; x=1770718020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5uoVeSj0QN4EeZcCrlskyNvROXSluRl4IF+26szp08I=;
  b=kcs5z9wHLHeh+oVGEtJrqvRYRRLDCb4vbj/upCCm8jyNEL8njo1TlLIP
   rAZ2NumUDroMEQu9f9gYHYsmYcD+vy9/HIT4TdLQC7X7Kvtj9W/audGBH
   rsds0lK5Fs7Sqj4NGsOG0uoSIIFRYrKT4gvVZzqzfJiorxBVoLEY37PQL
   VKWysPLdCOmk50jk41IxZoECd/zfIULTuuOAgaKJTi63kkN80wkqyCB9T
   d+yTLAe4F10Ng2oshXGza+QwNWy7uXep2Gmm+zy064+314vglGFLGGYF6
   T+bI/NkndkbBWULNp2Qzf67yHIzxJh1HxNEUBhddDLuafrDsJUXSakWmn
   Q==;
X-CSE-ConnectionGUID: gTZZ8kYRRByoLnHb4lfNKg==
X-CSE-MsgGUID: k3aytTCqT0ymGwYD4edwtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39441232"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39441232"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:06:59 -0800
X-CSE-ConnectionGUID: 7wCeTMN+S+WsBMFPG+3Jsg==
X-CSE-MsgGUID: Ag8YuZa0Q8K+IdhuN1X07A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116214442"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Feb 2025 02:06:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thQgn-0012Yd-1S;
	Mon, 10 Feb 2025 10:06:53 +0000
Date: Mon, 10 Feb 2025 18:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch via B4 Relay <devnull+git.apitzsch.eu@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Subject: Re: [PATCH v3 2/2] media: i2c: dw9719: Add of_match table
Message-ID: <202502101730.OtKFel6n-lkp@intel.com>
References: <20250209-dw9761dts-v3-2-14d3f00f0585@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250209-dw9761dts-v3-2-14d3f00f0585@apitzsch.eu>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f6629c004b193d23612641c3607e785819e97ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Apitzsch-via-B4-Relay/dt-bindings-media-i2c-Add-DW9719-and-DW9761-VCM/20250210-055506
base:   8f6629c004b193d23612641c3607e785819e97ab
patch link:    https://lore.kernel.org/r/20250209-dw9761dts-v3-2-14d3f00f0585%40apitzsch.eu
patch subject: [PATCH v3 2/2] media: i2c: dw9719: Add of_match table
config: x86_64-randconfig-161-20250210 (https://download.01.org/0day-ci/archive/20250210/202502101730.OtKFel6n-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101730.OtKFel6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101730.OtKFel6n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/dw9719.c:363:34: warning: 'dw9719_of_table' defined but not used [-Wunused-const-variable=]
     363 | static const struct of_device_id dw9719_of_table[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/dw9719_of_table +363 drivers/media/i2c/dw9719.c

   362	
 > 363	static const struct of_device_id dw9719_of_table[] = {
   364		{ .compatible = "dongwoon,dw9719" },
   365		{ .compatible = "dongwoon,dw9761" },
   366		{ }
   367	};
   368	MODULE_DEVICE_TABLE(of, dw9719_of_table);
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


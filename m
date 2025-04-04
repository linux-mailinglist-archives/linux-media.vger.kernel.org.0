Return-Path: <linux-media+bounces-29388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E45A7BC2B
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 14:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68B9A3BC543
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 12:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5411EB5C6;
	Fri,  4 Apr 2025 12:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKifZara"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADC91D7E4A;
	Fri,  4 Apr 2025 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743768024; cv=none; b=Hh19sX5//WA28pEXve281x1sl8usOKgVj+JZk0MVAkEIaNa9jWTS+TB2p4dtSVaEZolTrpdE73xJ0U0rmYqf+a6u9HCQ0gCsjoIjEd0tSt/jCPEHPudVDiIf8OkpFOZ9cA7ig+3XmQPBPi1ru+rnMaapznjZIwNUGYHq89j/Ju4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743768024; c=relaxed/simple;
	bh=GWjSo5aSfDtZUIQNVp2QpPj0kXwfTgDipP/FO55SnjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUrHhOS9FWPh03MDuqCMm8w6JFadobPfZd3I8WsL3xM0ZY5xGxtbpl+Bm1YwQHavVyctBjSWCQyWNUR1nVNMfmCiUCDTUdOxgSjhTjs/w824TN/Edhyw5dzPeEN9A81m0KSfkToFXpyGtAsW2T06SqHhcByvqM2vK5ZzoBPe3CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RKifZara; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743768022; x=1775304022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GWjSo5aSfDtZUIQNVp2QpPj0kXwfTgDipP/FO55SnjI=;
  b=RKifZaraLYrWnD3b3wymWP0djniqIFg0lkNyrX8Cm1um9EHwDTeZtoFl
   9UYrjq2WQihwtM62KEgi3ie0HvihtEFhaICb0oS2anRqnpP44c0hwfKeP
   OdpN5su+Kv8kWY0WDtg8LZoFaae/bteLqEQFat0o02HdfOBQwGHVzy4Sv
   4rRc+y2NmfSbqN+1ceoofGWHtokWbwuI92K0s4qwaudwK2W/94R4w7TI2
   yZhaaRDWw+Q8Bco8XXP5KUrogs3d79PT9m10obQJPkCPnIEaygL9dlmeu
   wHW6+BVF1D8i5LWJwR/aJvqtpvj5faV8Gt1sBykvpLCxVkSHwuDLFHon1
   g==;
X-CSE-ConnectionGUID: msah2jJrRsyVUq+d7wTKqA==
X-CSE-MsgGUID: RVPaZc9WRyKBRdUnoc4Kaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45114260"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="45114260"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 05:00:21 -0700
X-CSE-ConnectionGUID: /MbJ3UplRDydapNBUfLGqA==
X-CSE-MsgGUID: dsSjATMAQDuwaIWZGXy/0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="131999906"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Apr 2025 05:00:18 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0fia-0001D5-0g;
	Fri, 04 Apr 2025 12:00:16 +0000
Date: Fri, 4 Apr 2025 20:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthias Fend <matthias.fend@emfend.at>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH 2/2] media: i2c: add Himax HM1246 image sensor driver
Message-ID: <202504041909.gfi5uwYd-lkp@intel.com>
References: <20250403-hm1246-v1-2-30990d71bc42@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-hm1246-v1-2-30990d71bc42@emfend.at>

Hi Matthias,

kernel test robot noticed the following build errors:

[auto build test ERROR on a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthias-Fend/media-dt-bindings-i2c-add-Himax-HM1246-image-sensor/20250403-165139
base:   a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
patch link:    https://lore.kernel.org/r/20250403-hm1246-v1-2-30990d71bc42%40emfend.at
patch subject: [PATCH 2/2] media: i2c: add Himax HM1246 image sensor driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250404/202504041909.gfi5uwYd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041909.gfi5uwYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041909.gfi5uwYd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/media/i2c/hm1246.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/media/i2c/hm1246.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


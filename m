Return-Path: <linux-media+bounces-12224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D86D98D45C3
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 09:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DC38B24014
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 07:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86D24D8B0;
	Thu, 30 May 2024 07:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkYe9U7o"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC64A4D8A5;
	Thu, 30 May 2024 07:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717052899; cv=none; b=tuhwIaMJf6T9j+j+vM11dvG7vd8PDX56YsejrGj0q6G+kJmjP63TpmJ2EnqLGmRZ4k2oT9ImkrQzckgERKU2t6emmOjL2NrIqaJgV+KH1R81KixLRBgDqxNreCz+CsVZmEk1kH3hh5WDSjbVOGD1avjogNzR57UQ/wFaNO+qmLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717052899; c=relaxed/simple;
	bh=eOngNfBO9IKpFWiJMqi7+bzLez8+6qCGdcv78JuukBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOO4DRj1Mg2jfz2p3JaGvhaNoPUuLDssJNH15gGRPZ9AzVUMFq58+YSQ7KQOd7QZd+I+5rRPm4NBxbOfKndxcIc64/wLq0xb/prgmq8jNtrwWn3BKMT/XYz5YysOkSTBQzp5V+bNHn9oJGEGG3vqOUatIdwc1v92uUXqg8GPreE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkYe9U7o; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717052898; x=1748588898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eOngNfBO9IKpFWiJMqi7+bzLez8+6qCGdcv78JuukBo=;
  b=AkYe9U7o/Z5ja/lx45UxnKZqCra19pEC4ZOZpE7nhmeI9k/NNWO4guKB
   gRB/YSHkuK0b3WCJ7CY3MGxFCLQSrDvLQoK8zWciwi1whOh2i9mZbc+eA
   WU5WsDaIaqEZUMvDRzEJuEkn5/LP3QsYB6b/hxMjKZ/8qzmK+oCLUgKXt
   8o66VJH39cs/vCqYwJfypUnZkbf9BX+PVQNyO1L+V1d3riucbgYRtTkKZ
   K75y5sIKKMMpNwOQsrncK6nkAfmGBMRcskkSopSJbgyr5xH57/C/nesQr
   siW9hae4nAwDjH/h+aKFzpLMd+pQSrYW+GeLQfUoB9XDjwN+p+ElIZIHr
   A==;
X-CSE-ConnectionGUID: yVTs1YvWS2q4gp8Y7v0uMg==
X-CSE-MsgGUID: 5l8NWxn6TxGj7Chk1dmDQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13638619"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13638619"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 00:08:17 -0700
X-CSE-ConnectionGUID: RZGGqg3cRNy4RUOr84x2jw==
X-CSE-MsgGUID: b5sveOJEQ/SdioM/0Vi7qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="35697008"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 May 2024 00:08:13 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCZtS-000Evu-27;
	Thu, 30 May 2024 07:08:10 +0000
Date: Thu, 30 May 2024 15:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
	dan.scally@ideasonboard.com
Subject: Re: [PATCH v5 14/16] media: uapi: Add parameters structs to
 mali-c55-config.h
Message-ID: <202405301513.etiNs24g-lkp@intel.com>
References: <20240529152858.183799-15-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529152858.183799-15-dan.scally@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[cannot apply to linuxtv-media-stage/master sailus-media-tree/master linus/master sailus-media-tree/streams v6.10-rc1 next-20240529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/media-uapi-Add-MEDIA_BUS_FMT_RGB202020_1X60-format-code/20240529-233239
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240529152858.183799-15-dan.scally%40ideasonboard.com
patch subject: [PATCH v5 14/16] media: uapi: Add parameters structs to mali-c55-config.h
config: i386-buildonly-randconfig-004-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301513.etiNs24g-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301513.etiNs24g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301513.etiNs24g-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/media/arm/mali-c55-config.h:308:2: error: unknown type name 'bool'
     308 |         bool enabled;
         |         ^
>> ./usr/include/linux/media/arm/mali-c55-config.h:309:2: error: unknown type name 'size_t'
     309 |         size_t size;
         |         ^
   ./usr/include/linux/media/arm/mali-c55-config.h:698:2: error: unknown type name 'bool'
     698 |         bool mesh_show;
         |         ^
   ./usr/include/linux/media/arm/mali-c55-config.h:847:2: error: unknown type name 'size_t'
     847 |         size_t total_size;
         |         ^
   4 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


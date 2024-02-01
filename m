Return-Path: <linux-media+bounces-4538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A833E84513A
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 07:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D79D1F229CB
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 06:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A3285C4F;
	Thu,  1 Feb 2024 06:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoLAaEx/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E3D83CD5;
	Thu,  1 Feb 2024 06:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706767657; cv=none; b=Kiw1QbO7ftXdXGQqvNjzt6qB+FokhVpZtPJlNSNo0SnFsoNFFKTqnh22PcQFNQ2jL+RFLiWiEjLczUn7RRbRQYuO2cUc+A1y3s/WO2LCxjWCEwKYk4p00ebtCTo0R5kW481sxIAj85GqL9CZ3GzD1YUvlVpONsricVu6juWZpd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706767657; c=relaxed/simple;
	bh=D6bXdxqiDlPA/Gr9VoLm4TRLXPbuhZp5QeUAVwsb4/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quOfz78NNPapK6mkyrscKLWDj4VuVo7XMOFHM58OP0k9WSY0scmgLNjT5P78PZNtAKUPMWz3ht3+ySsM55A3HoRwaA8xLUsaRZ2f4LtDghb6Rp26kAhWU/r6Q6BjMH2zqD+ciYiiJYq7rBq96mFZQSI2dBQRT0aiL/VzXyppFUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EoLAaEx/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706767656; x=1738303656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D6bXdxqiDlPA/Gr9VoLm4TRLXPbuhZp5QeUAVwsb4/k=;
  b=EoLAaEx/XFnakGZZEikM833nHlD04+9s35MdXV95Ul0MtS59W5NJ1iCJ
   rrBxQx9CQzwVjj7UH1e+rjs+9n2TSWSvc/iC230MRu9ioQAXXqNguUg0z
   emJl+UCvQ5nW9j/rm1AmBkBSTSf2FEGMe5yY/wyD0QXF8wW/4xSDoAPN0
   HjohnDP4zYQVCIxuc4hsaR0kFLOUCUIeRclx7dwk73qTxyu8lBErHcFjd
   7trsNlIP2WGjg08yx+VUNQyRH/G4/MHQiBFSmK3holl0yce4XMlKE4q2c
   GlE8b0Bx/unYlsUIVvTG8/Uo+l1xgLNiptD1rzkcwVVWgqv0mqMoClslT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3680508"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="3680508"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 22:07:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="912032520"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="912032520"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Jan 2024 22:07:31 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVQET-0002Qj-11;
	Thu, 01 Feb 2024 06:07:29 +0000
Date: Thu, 1 Feb 2024 14:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 3/5] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <202402011332.NzuDyrGr-lkp@intel.com>
References: <20240131164709.810587-4-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131164709.810587-4-dan.scally@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master linus/master v6.8-rc2 next-20240131]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/media-uapi-Add-MEDIA_BUS_FMT_RGB202020_1X60-format-code/20240201-005029
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240131164709.810587-4-dan.scally%40ideasonboard.com
patch subject: [PATCH 3/5] media: mali-c55: Add Mali-C55 ISP driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240201/202402011332.NzuDyrGr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402011332.NzuDyrGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402011332.NzuDyrGr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/arm/mali-c55/mali-c55-capture.c:286:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     286 | static const char * const mali_c55_cap_dev_to_name(struct mali_c55_cap_dev *cap)
         |        ^~~~~
--
   drivers/media/platform/arm/mali-c55/mali-c55-tpg.c: In function 'mali_c55_tpg_configure':
>> drivers/media/platform/arm/mali-c55/mali-c55-tpg.c:125:36: warning: variable 'fmt' set but not used [-Wunused-but-set-variable]
     125 |         struct v4l2_mbus_framefmt *fmt;
         |                                    ^~~


vim +286 drivers/media/platform/arm/mali-c55/mali-c55-capture.c

   285	
 > 286	static const char * const mali_c55_cap_dev_to_name(struct mali_c55_cap_dev *cap)
   287	{
   288		if (cap->reg_offset == MALI_C55_CAP_DEV_FR_REG_OFFSET)
   289			return capture_device_names[0];
   290		else if (cap->reg_offset == MALI_C55_CAP_DEV_DS_REG_OFFSET)
   291			return capture_device_names[1];
   292		else
   293			return "params/stat not supported yet";
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-10473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB68B7C68
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 17:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8E601C209BF
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 15:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59816173336;
	Tue, 30 Apr 2024 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2E+8cED"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D5416D9B6
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 15:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714492652; cv=none; b=Hs82lfk44rTiSUS7qB7MEG8FVmcq0C6B2dkVjcLYTuE5rgW4wDVFMBXpttS92nAjDLUmH3Qu+u8SSEHdEEYprCZOcqgT9F5A67sS2WeC0eSrGVOuoo8HDGvwx3gswDZVaA5XwP6o917SiSZeLRtdfbExhBSL4+mNXAeup06Xm9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714492652; c=relaxed/simple;
	bh=qPwTiPc7rUTt8AVAcjRiJLZFPNJjjuNQnMHaV7j5wCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmOkhaTE6o4n3WQfWfPdSYw2/NOGKebLZ/IuR45NWJ4YRFZKAds6zmylvaD1XOK8fIomH7WNYrzCtTyFjLPg635T8ltQNDQJiO4s6HvY7cCveoT1Jp5+llYWICajgVCQ9gTotxtDNVdTuiwvgbfctm/dkZhIYj7Kh8IYiN8b4Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2E+8cED; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714492651; x=1746028651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qPwTiPc7rUTt8AVAcjRiJLZFPNJjjuNQnMHaV7j5wCo=;
  b=a2E+8cEDj+gam/HSEqI7q5hjVmN9qfyA1xYSFHFfBOZp8sHtUxcqoBc4
   PwVRQ+VZifWx5dJLAFJjAYgY8Nso0kF1nVZiL9snJDBLfL5pU+5gWEF+P
   E/Kq9DSXWEW2gN7rXw2oyEEYWTgzzQZZcpaC0qEthjDuZXLSYvcmaLbkg
   sGA3ez8GkxEQYr/UleACJI9ybWNL18W34HhoeU32vw30+6qo6qr2QXjyn
   4QZ8hKmzMjQl0wW/yVctmk1LTFQXtT0Y54Vr0CA6H7qBygSZg76ZMytLl
   uELd/9fFtvgclOKhF1H6PSA/OgjCL4lPR0aCc6rmP/L9maiVz0kcJCtkG
   g==;
X-CSE-ConnectionGUID: XVDcCOVcRa+fSX48FQXHPA==
X-CSE-MsgGUID: fD+ZYK15RtWI6BVZHyUcNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20755018"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="20755018"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 08:57:31 -0700
X-CSE-ConnectionGUID: YZKv/2gjRQGMcxbMntifog==
X-CSE-MsgGUID: PIOvf8+TRg2mGXLwsnLceg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="26465061"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Apr 2024 08:57:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1prC-0008IB-0z;
	Tue, 30 Apr 2024 15:57:26 +0000
Date: Tue, 30 Apr 2024 23:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, bingbu.cao@linux.intel.com,
	daxing.li@intel.com
Subject: Re: [PATCH v2] media: i2c: Add ar0234 camera sensor driver
Message-ID: <202404302344.158Y810h-lkp@intel.com>
References: <20240429051333.1306453-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429051333.1306453-1-dongcheng.yan@intel.com>

Hi Dongcheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on sailus-media-tree/master linuxtv-media-stage/master linus/master v6.9-rc6 next-20240430]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongcheng-Yan/media-i2c-Add-ar0234-camera-sensor-driver/20240430-133240
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240429051333.1306453-1-dongcheng.yan%40intel.com
patch subject: [PATCH v2] media: i2c: Add ar0234 camera sensor driver
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240430/202404302344.158Y810h-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404302344.158Y810h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404302344.158Y810h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ar0234.c:1032:36: warning: 'ar0234_acpi_ids' defined but not used [-Wunused-const-variable=]
    1032 | static const struct acpi_device_id ar0234_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~


vim +/ar0234_acpi_ids +1032 drivers/media/i2c/ar0234.c

  1031	
> 1032	static const struct acpi_device_id ar0234_acpi_ids[] = {
  1033		{ "INTC10C0" },
  1034		{}
  1035	};
  1036	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


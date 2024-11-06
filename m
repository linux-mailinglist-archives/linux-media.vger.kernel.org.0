Return-Path: <linux-media+bounces-20967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B439BDDBC
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 04:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F8BEB2344C
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 03:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E97190660;
	Wed,  6 Nov 2024 03:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaLLcKmz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B701519048D
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 03:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730864529; cv=none; b=sjeLS4rLOrx56ad95sYJGMZjiKvZS0Lu6hxhvBL/pI4nO5KJWCvR/fq0Yzjj/R181pkmYtCrDpySGdEUt32dNqTZmpni2VcvS1DmvfaejUQ3d+H6ui+GSeXwUCqTjCI+uO7PtbbY8y7P5O5psw+4r+Q6Dy/w/WhaEgSEmWkGZg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730864529; c=relaxed/simple;
	bh=QgWjU8ZtdIR6PNXF+o7XEIvFR3v3VeUlDounSNC8+vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qT7E5XrwVPrYodj3od9q8LFPl/SRMDRl4po6GW1eGtM7wUnlNTCgLddiumW9UpCyzrQlHKqRkiKRV/tjM0diSAL64HNociEELr83J5YGAna/uXS3SJefiK1fVIKZd8hp1/4qR1U3FtVzoZJ5bIusHMoRLZT8wxk7+butVkRqawE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaLLcKmz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730864528; x=1762400528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QgWjU8ZtdIR6PNXF+o7XEIvFR3v3VeUlDounSNC8+vM=;
  b=RaLLcKmz8iVoFbOHuX6tAU1V0yskhSv4lB+zSCrCXukt1csozm2ha97H
   sq51Nkl8lXOsKK4v5vo/hFnaQsDHv/4LJgUm0Sr4ailq8YEmB00qCusDC
   xtKIDIWVQYG/rjMIdERRsMUOMi/DhxMr6U7126UrHYUoSLDJcpmfzcqds
   MMVVX30o9A0RK1m4+aySuqcyBDB6+Hhmc260DMoH365gn/WssSVGpxi2Z
   bJfcXJeAQHF80kI8ma1LLNGonxOiHipBflmIXA40et7Y07McIpsPVGbZT
   3C2IVLOmdDcEo0ix/yn+vxZLhph5fYMLGFR+AzF/DUcU0THd6c9C18CVB
   g==;
X-CSE-ConnectionGUID: XQTGx9oTS06lwTyXwKfKVQ==
X-CSE-MsgGUID: y2OZLSDvS1S3T4+fHzS8Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30751202"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="30751202"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 19:42:07 -0800
X-CSE-ConnectionGUID: QJF3QXA5TImU5pe27h+zOA==
X-CSE-MsgGUID: yBuNHG1yTmyHDshcKFlTFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="88263722"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2024 19:42:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Wvj-000mty-0d;
	Wed, 06 Nov 2024 03:42:03 +0000
Date: Wed, 6 Nov 2024 11:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] media: i2c: Add driver for AD5823 VCM
Message-ID: <202411061152.VKd9JYpa-lkp@intel.com>
References: <20241105204246.30097-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105204246.30097-1-hdegoede@redhat.com>

Hi Hans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-stage/master]
[also build test WARNING on media-tree/master sailus-media-tree/master linus/master v6.12-rc6 next-20241105]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-i2c-Add-driver-for-AD5823-VCM/20241106-044442
base:   https://git.linuxtv.org/media_stage.git master
patch link:    https://lore.kernel.org/r/20241105204246.30097-1-hdegoede%40redhat.com
patch subject: [PATCH] media: i2c: Add driver for AD5823 VCM
config: alpha-kismet-CONFIG_V4L2_CCI_I2C-CONFIG_VIDEO_AD5823-0-0 (https://download.01.org/0day-ci/archive/20241106/202411061152.VKd9JYpa-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241106/202411061152.VKd9JYpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061152.VKd9JYpa-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for V4L2_CCI_I2C when selected by VIDEO_AD5823
   WARNING: unmet direct dependencies detected for V4L2_CCI_I2C
     Depends on [n]: MEDIA_SUPPORT [=y] && I2C [=n]
     Selected by [y]:
     - VIDEO_AD5823 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


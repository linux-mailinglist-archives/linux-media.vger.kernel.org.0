Return-Path: <linux-media+bounces-23987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 508B99FA1E5
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 19:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A2F97A1C08
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 18:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E502217B4FF;
	Sat, 21 Dec 2024 18:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jm/8rnjq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A5A13541B;
	Sat, 21 Dec 2024 18:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734806137; cv=none; b=oaWqIVrlwZ1VbwCGJiMn7eluwlzL1gZQBXUeqPPz2XY3+95rqNC++RPX77Cy4Nxu/ea83GonJOdT7EWOfSbOn77CWWXnlnFLKgHRmWAT0vp8gs5YOayyPESCDWucTRHIlwkV/WWfZnCwa8ja192AUe3CaHlCnjRTdqaAXtOWJLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734806137; c=relaxed/simple;
	bh=lVYKjo+Ke4pwz0cUb6epoQIlzNlbQZRTf/k4pJY3ekM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3F8U9zGw7ddBH9c3HgBkaY3RpSn1VXjOsFhE2Z77W3SgsXvXS0UldQId1HoCFILnAkN3JxDN7dY+jkCI9N1EnRGqGOnjW5n3abahiDzl5cGE9lZ7iCydW7/Yv7hQLyriTUjxxj1eCICFe0DL4EGT6quhRAmlKsl1J4lsZ3x508=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jm/8rnjq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734806135; x=1766342135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lVYKjo+Ke4pwz0cUb6epoQIlzNlbQZRTf/k4pJY3ekM=;
  b=jm/8rnjqb5xAmGx43fJITcmDOErl+blx4Sl5dRZI9wil2hulEhF/gqJk
   T+kSCg9U1ZG5fGZ3ebdCoZGlqiK7DqfpZejwrFD+KnKzU893zgUCRFI80
   dmwVcyoTFTfl+smmqP/Nd91x9GGVfdMJxwaKb08i1IVrw2ewK8pRf7Wfg
   SJPbfQLa0wmF7WLjZWvAtXB3UPXlJbQmHjfbm8B2RddDTdJZEDviIZi5c
   FzsSdwB6e0GIG/tAVRCkl1hoGbPIWGMcIMrluW/KGJ9eTR1m+8PJdPJYi
   b0zDe1kE6VEYq/FchOq1frf5HwpHhsU1Iaqf4ct5Dlq3PrAiOLU9Xk+gi
   g==;
X-CSE-ConnectionGUID: 2egw5b1XS0ixfiA0OlZqZw==
X-CSE-MsgGUID: U3QV/TH6Qra6CJ0ZjDaxAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35474189"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35474189"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:35:35 -0800
X-CSE-ConnectionGUID: ju9GWxSmQFuS6iK0ViHFTw==
X-CSE-MsgGUID: pTo69KGOQMmY3VC50P42PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98627611"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2024 10:35:31 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP4K0-0002Ox-30;
	Sat, 21 Dec 2024 18:35:28 +0000
Date: Sun, 22 Dec 2024 02:34:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	John Cox <john.cox@raspberrypi.com>,
	Dom Cobley <dom@raspberrypi.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
Message-ID: <202412220238.0kZEBbMb-lkp@intel.com>
References: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on e90c9612ac3969cb8206029a26bcd2b6f5d4a942]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Stevenson/RFC-media-Add-media_request_-pin-unpin-API/20241221-002633
base:   e90c9612ac3969cb8206029a26bcd2b6f5d4a942
patch link:    https://lore.kernel.org/r/20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e%40raspberrypi.com
patch subject: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20241222/202412220238.0kZEBbMb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220238.0kZEBbMb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220238.0kZEBbMb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/raspberrypi/hevc_dec/hevc_d.c:24:10: fatal error: hevc_d_h265.h: No such file or directory
      24 | #include "hevc_d_h265.h"
         |          ^~~~~~~~~~~~~~~
   compilation terminated.
--
>> drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c:21:10: fatal error: hevc_d_h265.h: No such file or directory
      21 | #include "hevc_d_h265.h"
         |          ^~~~~~~~~~~~~~~
   compilation terminated.
--
>> drivers/media/platform/raspberrypi/hevc_dec/hevc_d_h265.c:20:10: fatal error: hevc_d_h265.h: No such file or directory
      20 | #include "hevc_d_h265.h"
         |          ^~~~~~~~~~~~~~~
   compilation terminated.


vim +24 drivers/media/platform/raspberrypi/hevc_dec/hevc_d.c

    22	
    23	#include "hevc_d.h"
  > 24	#include "hevc_d_h265.h"
    25	#include "hevc_d_video.h"
    26	#include "hevc_d_hw.h"
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


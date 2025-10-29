Return-Path: <linux-media+bounces-45886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E70C17B38
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 01:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE302188A481
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 00:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E378E2D7DCE;
	Wed, 29 Oct 2025 00:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGcbP/Ui"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615E7277C9E;
	Wed, 29 Oct 2025 00:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761699552; cv=none; b=BoVWzvlLGIg5hWdgwEnVdgobVlAsxOtseKFc0KnRC6rNmkZ1vFVvpl/BYOMdZ5t3eELRo3hpQo4Gc4V8HTt2AzARN9yqOgi8FxMqFBDzv3609HbBqFccPh4oGySbVi+d9Z0NyXXT62p2itg33kld2yC4qlVpDPI/J2/f6ZhGz2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761699552; c=relaxed/simple;
	bh=L1fwkKyfGCopimO2KT6ZjVWg4mk91IJv4XRwdhvRqpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjqdLZ/d8nNoY0RbAY0Hr1ANsM+X9cd5nbr7OWMhLRUALMNjirrzOhjQhHyQnwTR5U/Y1I/kh370gOOohodjS2S/cNiqu1yR8pfBVMsdG2rmbU4fiYgeQV+n+HuD0fHRaHbmSvA71wyxnjfxaBu3O6Edb/yrbHR/ZHzSbkRni2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGcbP/Ui; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761699551; x=1793235551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L1fwkKyfGCopimO2KT6ZjVWg4mk91IJv4XRwdhvRqpk=;
  b=KGcbP/Ui9AJUd5sYSh9O7CSeBm6GylszWXYjoCXSWMNkyTaqgJF+bo81
   HrdJ2on47MhtA137MGBTrj+gWf6fTm3YAmJMR9QpuCx1vo1FZYKsW26+h
   T9yDPNumdWCQ4Tof8y9cL39nzM8Z5oCp1Re/ifWdoyYJG6QGGY8SzVYWv
   83dPQxTlb/qo9Pz7QbocPc+nL2Xp460fhO1erWyB8bISKY7wEHEOErqkN
   BVM/h8sFJpWWKsaeVW3ebyXP55dRw0pwTBiCb0qY7PJla3FfjLBhzSR2w
   LMs9ccZ5bxNDMVcruWGP9opRGkH+HC2uR1iP9MzfhtKXT5dkemGalSQ+/
   Q==;
X-CSE-ConnectionGUID: EeZumeyvRneK6bGFcehd9g==
X-CSE-MsgGUID: hbtp6LSjS8mG8I8GUjKKlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75260111"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="75260111"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 17:59:10 -0700
X-CSE-ConnectionGUID: dXL4dUxQTLy/VrcE6UDrBA==
X-CSE-MsgGUID: Y4zkv6KLQZ+6jtEdLHrAng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="185391143"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2025 17:59:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDuWT-000JyH-23;
	Wed, 29 Oct 2025 00:58:54 +0000
Date: Wed, 29 Oct 2025 08:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 04/13] media: i2c: ov5647: Fix v4l2-compliance failure
 subscribing to events
Message-ID: <202510290816.8EQhDjD8-lkp@intel.com>
References: <20251028-b4-rpi-ov5647-v1-4-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-b4-rpi-ov5647-v1-4-098413454f5e@ideasonboard.com>

Hi Jai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Jai-Luthra/media-i2c-ov5647-Parse-and-register-properties/20251028-153619
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251028-b4-rpi-ov5647-v1-4-098413454f5e%40ideasonboard.com
patch subject: [PATCH 04/13] media: i2c: ov5647: Fix v4l2-compliance failure subscribing to events
config: sparc64-randconfig-r134-20251029 (https://download.01.org/0day-ci/archive/20251029/202510290816.8EQhDjD8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290816.8EQhDjD8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290816.8EQhDjD8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ov5647.c:870:10: sparse: sparse: Initializer entry defined twice
   drivers/media/i2c/ov5647.c:876:10: sparse:   also defined here

vim +870 drivers/media/i2c/ov5647.c

3c2472a3c54895 Ramiro Oliveira 2017-03-22  867  
c9a05cece64c60 Jacopo Mondi    2020-11-19  868  /* Subdev core operations registration */
3c2472a3c54895 Ramiro Oliveira 2017-03-22  869  static const struct v4l2_subdev_core_ops ov5647_subdev_core_ops = {
dc3373081396f5 Jacopo Mondi    2020-11-19 @870  	.subscribe_event	= v4l2_ctrl_subdev_subscribe_event,
dc3373081396f5 Jacopo Mondi    2020-11-19  871  	.unsubscribe_event	= v4l2_event_subdev_unsubscribe,
3c2472a3c54895 Ramiro Oliveira 2017-03-22  872  #ifdef CONFIG_VIDEO_ADV_DEBUG
3c2472a3c54895 Ramiro Oliveira 2017-03-22  873  	.g_register		= ov5647_sensor_get_register,
3c2472a3c54895 Ramiro Oliveira 2017-03-22  874  	.s_register		= ov5647_sensor_set_register,
3c2472a3c54895 Ramiro Oliveira 2017-03-22  875  #endif
d812c6225cf5be David Plowman   2025-10-28  876  	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
d812c6225cf5be David Plowman   2025-10-28  877  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
3c2472a3c54895 Ramiro Oliveira 2017-03-22  878  };
3c2472a3c54895 Ramiro Oliveira 2017-03-22  879  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


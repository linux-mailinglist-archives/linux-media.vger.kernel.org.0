Return-Path: <linux-media+bounces-35174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E89ADED65
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 15:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7F8D17639C
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 13:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA3B2E425F;
	Wed, 18 Jun 2025 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Md8qN3R1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3444238F80;
	Wed, 18 Jun 2025 13:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251890; cv=none; b=KlgbeGSc62AE0IXjvm6+CgGqicwjqIng0Il2wRqP4sp/iujTL5M3fiWavBDWquA46Ryiq04NB3haOPm9Hmbtx3TPcWwCn77xTKif5UyGeru2NmiaYioIFvcfBjxhmS3o3ogUH63XWJOMMg4bQYcsYss9OouwcW3geJ+wP/HGPY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251890; c=relaxed/simple;
	bh=/tCzdXt+ockM6LlaMEgh7Zi7SPYptgyb1ZQQMfoYVN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYGPOFCKTCBZ7+2jFthNzhkoiyj/lKbKZVfBLZ/yM/tq69wHpF5uay3z4V7OQXXLuCkjP+NAIwZ0ollrfVCEzfSP+X1I5DRcrYmzsVskzUOuylYYhWdEilyW7+sXDtncvUEYG4H7gCyRrHWC5ow/BfP2kyPL65wiZjjlNTgl88E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Md8qN3R1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750251889; x=1781787889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/tCzdXt+ockM6LlaMEgh7Zi7SPYptgyb1ZQQMfoYVN4=;
  b=Md8qN3R1Nsf6Ubr9WHEmKHZNZw8QgpE5uVRxWzrHQv0V62/sGJ7m4QZ1
   2NyHvMFQCMwhdfl3Al2uGSYo0iFTuU5Z1Jy/oKCVR7GC0GvZYKrsPDSDY
   drxG4semjO626yFPbzH5hP4gKgEmQ63TaKKs6agz8L60v2o/I+3AGFmyh
   Ztas5lsufYOlJR1YkE+KpGe/h+cZ9+rZdtOiujoXHkxk99TrjHDxi/wgM
   gjUiKaceWiszSz4cJLEjggfjqBuoTm2M9QPwF00w2/G3AmsPo07I6YzI1
   bFruV9oaHWRSSStWDZc5FSRqclNEWh+IhY/BO2C3sLywMZWWLgNjXNz8V
   Q==;
X-CSE-ConnectionGUID: YPPuRKxAQRqccgtOYjsTUA==
X-CSE-MsgGUID: /PvKVT3DR6S6bYCkxfnDkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52554864"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52554864"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 06:04:48 -0700
X-CSE-ConnectionGUID: kxWTrLjFSFierB10b+exMQ==
X-CSE-MsgGUID: DRv0dJ4vTUipwe25GWQOqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="173094405"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jun 2025 06:04:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRsT4-000Jna-28;
	Wed, 18 Jun 2025 13:04:42 +0000
Date: Wed, 18 Jun 2025 21:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Richard Leitner <richard.leitner@linux.dev>
Subject: Re: [PATCH v5 09/10] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Message-ID: <202506182043.reVJKofN-lkp@intel.com>
References: <20250617-ov9282-flash-strobe-v5-9-9762da74d065@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250617-ov9282-flash-strobe-v5-9-9762da74d065@linux.dev>

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on d9946fe286439c2aeaa7953b8c316efe5b83d515]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Leitner/media-v4l-ctrls-add-a-control-for-flash-strobe-duration/20250617-153657
base:   d9946fe286439c2aeaa7953b8c316efe5b83d515
patch link:    https://lore.kernel.org/r/20250617-ov9282-flash-strobe-v5-9-9762da74d065%40linux.dev
patch subject: [PATCH v5 09/10] media: i2c: ov9282: implement try_ctrl for strobe_duration
config: i386-randconfig-051-20250618 (https://download.01.org/0day-ci/archive/20250618/202506182043.reVJKofN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506182043.reVJKofN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506182043.reVJKofN-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/i2c/ov9282.o: in function `ov9282_flash_duration_to_us':
>> drivers/media/i2c/ov9282.c:722: undefined reference to `__udivdi3'
>> ld: drivers/media/i2c/ov9282.c:722: undefined reference to `__udivdi3'


vim +722 drivers/media/i2c/ov9282.c

   711	
   712	static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
   713	{
   714		/*
   715		 * As the calculation in ov9282_us_to_flash_duration uses an integer
   716		 * divison calculate in ns here to get more precision. Then check if
   717		 * we need to compensate that divison by incrementing the µs result.
   718		 */
   719		u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
   720		u64 ns = value * 1000 * frame_width / OV9282_STROBE_SPAN_FACTOR;
   721	
 > 722		return DIV_ROUND_UP(ns, 1000);
   723	}
   724	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


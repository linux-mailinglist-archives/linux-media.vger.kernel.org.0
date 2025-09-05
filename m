Return-Path: <linux-media+bounces-41869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D78CB4602F
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 19:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D511BC874A
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 17:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E96334DCCF;
	Fri,  5 Sep 2025 17:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4oQ7vrV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC0930B537;
	Fri,  5 Sep 2025 17:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757093568; cv=none; b=BK4mZO4Vo0zuDYnJFMFiRO9/xRPFPivTl6S3IatfbndKwHOl4q7ty+VTp/2WWaAMvL/SEloL4vjhXWoRNUVN2ITJfbKFbn8QtjscUaVEPdtfOtnZ6B6VCkUPg0L0iVc6jtzjsLfaHeJFZropS5Y+uaOi3u6iKHT2uNThIImuG3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757093568; c=relaxed/simple;
	bh=lK2O/xBammCPdQBZhe/2hWMrEK5q7QWxiYFZFBdB/hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alUeC/MbZfAX75br6vqP/H9m4E7twsEZ62FaBi1MqE9rh6ubWKCLCjdfraf/UPUtHuhE5NZgFHXXPadi+VsAJEFzp5BKue6WOgI+zL7saUOClu7zl6ezHdqiDsTSonYQvm/heqrTmg1kcBo/P+4Ok9ehSVdzVBNMsAcUEumxMHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4oQ7vrV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757093567; x=1788629567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lK2O/xBammCPdQBZhe/2hWMrEK5q7QWxiYFZFBdB/hY=;
  b=g4oQ7vrVeyssVImTZa3iItb0ZESz9ljvLO8RqOES1OQIBBi+qL87OW3R
   YTvLh1B9YcvP60wOsw2fP2GNSooYcvEwtoBYltm7ZZNw/++WAFxC+b1ap
   Ae1ZHJc6xLvsmnra80cdBI6riQQjVxwKTl+A65XHwvFAB/aJmy0sntB7h
   T/TsOlWiW0hxWrsjR7mjC9WBbc1tsQ0iR71BZ7+NY2R/AX1pCPo5ieGka
   Jzha5X3IPjaDJLozh20g/cuOXuy3G42WzDjB2bawxaAu377RHqUAKMb8z
   b2mCswlVTQ/Ht7F4ajAeq+YARzT+1p9pIGOuEdHz1h6QJEZndaRvkrILn
   Q==;
X-CSE-ConnectionGUID: JnPjM2bUSXqbBsAywBEHWA==
X-CSE-MsgGUID: z1zS9CIZS96lCJZ8vXr0rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70153260"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="70153260"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 10:32:46 -0700
X-CSE-ConnectionGUID: 1zmXb2lNR1mtf+jZtF9b3w==
X-CSE-MsgGUID: r0ji+lcTSO2f/uurzWZMKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="176307365"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Sep 2025 10:32:43 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuaIi-0000fl-0W;
	Fri, 05 Sep 2025 17:32:40 +0000
Date: Sat, 6 Sep 2025 01:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	Richard Leitner <richard.leitner@linux.dev>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v7 09/10] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Message-ID: <202509060108.kK81M3GB-lkp@intel.com>
References: <20250901-ov9282-flash-strobe-v7-9-d58d5a694afc@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-ov9282-flash-strobe-v7-9-d58d5a694afc@linux.dev>

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on d9946fe286439c2aeaa7953b8c316efe5b83d515]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Leitner/media-v4l-ctrls-add-a-control-for-flash-strobe-duration/20250901-231141
base:   d9946fe286439c2aeaa7953b8c316efe5b83d515
patch link:    https://lore.kernel.org/r/20250901-ov9282-flash-strobe-v7-9-d58d5a694afc%40linux.dev
patch subject: [PATCH v7 09/10] media: i2c: ov9282: implement try_ctrl for strobe_duration
config: sh-randconfig-002-20250905 (https://download.01.org/0day-ci/archive/20250906/202509060108.kK81M3GB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509060108.kK81M3GB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509060108.kK81M3GB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/media/i2c/ov9282.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


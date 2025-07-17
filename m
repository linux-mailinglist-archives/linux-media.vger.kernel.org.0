Return-Path: <linux-media+bounces-37956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBAFB0887E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DFA31769B9
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 08:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD7B287517;
	Thu, 17 Jul 2025 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qhwsfa/V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0750286D7F;
	Thu, 17 Jul 2025 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752742444; cv=none; b=fhY6OkpZsKnlLmq2F46Faqj3/GJuEdu7/PuzPFsMMyYTCqqishZuzpRX/PApQsOyI5iwS/IE71I+E/bmhLTiSZk956PiAcs95ISE6AqmWgn0E1AtEkpQqQ5VR7T/FNvqWUr7qEWct7xHYfircHs3CH9VhgbBkCD+F3Frww+U6Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752742444; c=relaxed/simple;
	bh=ikS7eZGcyckpPcCBZR25oVV9mLaq7LJ2mNH1ZNn1IYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hufDc3kW0qJFbbl8PWERm2bJDdMhSFO4vLZREsn314rEfnh0OAvCJVD7sounOvGI9no0w9JQmItlfr1pLrmeAjTHD8Sgq4QDjJGTIDEzZDK0taSr/DTpLedY4mjIuqyRpfSWILnjU2RiLKf5B6mfMQ/sI23j8dEOJDzAu4QCr00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qhwsfa/V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752742441; x=1784278441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ikS7eZGcyckpPcCBZR25oVV9mLaq7LJ2mNH1ZNn1IYI=;
  b=Qhwsfa/VdxcZ4dEn9B52CSZBb+GJQmjQ2PY1HqtaWv82O3XjkHi/oPQ4
   WdlJicb0443bhC9IW3Oy+12Ckl5I4o6dqDRMyPlbgstNNhxWB2lvqAFfm
   2VwuSsJQDh8qzEVlQQ/uvVx5vieN60rl1GmixCP0qeWkHnut8r5PXtYS0
   L4EG3EV+A+sM0CUnOQapakwdlbyevVINLJmRa7xS9eVhr9AV7bEp/QM3i
   3t1rgncEdJp88Or+3vLBnggaFUEYGMDuB8TYs7xivr7AWnJ90ddCpBtS2
   stUS/E6ZrdeGSJJFr3uaDq2DWG+Hcoc4RrU8TkqoQ4MqeZiyn03eU3PXk
   Q==;
X-CSE-ConnectionGUID: 3+bxPew5SJi+KrMDEiufmQ==
X-CSE-MsgGUID: P5yhT7VDT/GKKexWUoLTtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="77545620"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="77545620"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 01:54:01 -0700
X-CSE-ConnectionGUID: d1C2phvQR4ieMhMwvadKsg==
X-CSE-MsgGUID: kyaY/dfGQBaFgpqj3zXccA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="158438320"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jul 2025 01:53:58 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucKNH-000DPb-32;
	Thu, 17 Jul 2025 08:53:55 +0000
Date: Thu, 17 Jul 2025 16:53:36 +0800
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
Subject: Re: [PATCH v6 10/11] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Message-ID: <202507171651.LXHLvA4w-lkp@intel.com>
References: <20250716-ov9282-flash-strobe-v6-10-934f12aeff33@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-ov9282-flash-strobe-v6-10-934f12aeff33@linux.dev>

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on d9946fe286439c2aeaa7953b8c316efe5b83d515]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Leitner/media-v4l-ctrls-add-a-control-for-flash-strobe-duration/20250716-171003
base:   d9946fe286439c2aeaa7953b8c316efe5b83d515
patch link:    https://lore.kernel.org/r/20250716-ov9282-flash-strobe-v6-10-934f12aeff33%40linux.dev
patch subject: [PATCH v6 10/11] media: i2c: ov9282: implement try_ctrl for strobe_duration
config: i386-randconfig-014-20250717 (https://download.01.org/0day-ci/archive/20250717/202507171651.LXHLvA4w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171651.LXHLvA4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171651.LXHLvA4w-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__udivdi3" [drivers/media/i2c/ov9282.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/media/i2c/ov9282.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


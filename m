Return-Path: <linux-media+bounces-25610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B25C7A2681F
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 00:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45BC11652F9
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 23:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57A92116E1;
	Mon,  3 Feb 2025 23:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnD+OK19"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D241F92A;
	Mon,  3 Feb 2025 23:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738627126; cv=none; b=brlnZn0PYh3pEs0AcFv7RfpSJ1rubSZcb/xBWPVXZR7T4VsFQ91Fr4DC3sPdrpH+QDLH10bvqGrmR9xNA+zACZC5k+SM9z+6OCgzXHjOYN7MNUPZvx/oZeaACG/i8O6jYySdXUqK2SBnreSeJQ/tqX0ZTYbYSBDD/M46wuATG24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738627126; c=relaxed/simple;
	bh=fZdZTW1Uj/50eyfDyZNAy1noAaFQYLg7xYfaP9/qQfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFjDp5JsgWVcjCUmGtqVOcCc8m9GbItAxken5zH8urYGtcu0U3Gwy8Xqx+70v72INc+BG369pvQuk86nhITer1RMvs4rizPyBuSNhrloAR4Gw2GO4ygzBkL1GIkuB2+IW1aAVJtJ9YAPQP3hvLkmyUHMEga7hELukKKBhGDnnMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnD+OK19; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738627124; x=1770163124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fZdZTW1Uj/50eyfDyZNAy1noAaFQYLg7xYfaP9/qQfQ=;
  b=LnD+OK19J7Tc62DEsJ/BKa5rExplj5wZl/R0plI6C//qkLR5PmoBPmVv
   PtqjpKTrd+oeuebpLAyXD0yy+Jd6YyM3J8NeKmgCrCQb2l1qwTKbGr/uR
   qszfo/t+F+ujzR8c/VnMnxrt6FJMUOlmqFVYpx2A/xjPeSkN4vnr1t9Kr
   VcS50FiBu7+rk6Gmd+69PmDZV6IP5E3YeDMq/jWuxiIGyyKOIFjnvzmsv
   Ws4Al0rDKSemSOf9dreO42loPqQ00rDFv5FD9nfBZrz6lCbK0e65Sqb1V
   ZYhbhekGEnI3QBRwQAQX6GWRWVOKC+sHXBBUWJgZcKP1ZjSEv9wbW5KOu
   Q==;
X-CSE-ConnectionGUID: J8VzxAmuQqGGn6l399iYgQ==
X-CSE-MsgGUID: lyQSte5RQg6y2OYwguxlmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39018867"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="39018867"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 15:58:44 -0800
X-CSE-ConnectionGUID: w0+KyYlGSbWrqVdbRDYK8Q==
X-CSE-MsgGUID: HIg/KDBfRhOvKR7GVEtJAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="115454871"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Feb 2025 15:58:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf6Kt-000riB-1x;
	Mon, 03 Feb 2025 23:58:39 +0000
Date: Tue, 4 Feb 2025 07:57:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v2 4/6] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
Message-ID: <202502040757.Rn9RKQjR-lkp@intel.com>
References: <20250203-uvc-granpower-ng-v2-4-bef4b55e7b67@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-uvc-granpower-ng-v2-4-bef4b55e7b67@chromium.org>

Hi Ricardo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Ribalda/media-uvcvideo-Keep-streaming-state-in-the-file-handle/20250203-203055
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250203-uvc-granpower-ng-v2-4-bef4b55e7b67%40chromium.org
patch subject: [PATCH v2 4/6] media: uvcvideo: Increase/decrease the PM counter per IOCTL
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250204/202502040757.Rn9RKQjR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040757.Rn9RKQjR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040757.Rn9RKQjR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/usb/uvc/uvc_v4l2.c:1530:27: error: 'uvc_v4l2_video_ioctl2' undeclared here (not in a function)
    1530 |         .unlocked_ioctl = uvc_v4l2_video_ioctl2,
         |                           ^~~~~~~~~~~~~~~~~~~~~


vim +/uvc_v4l2_video_ioctl2 +1530 drivers/media/usb/uvc/uvc_v4l2.c

  1525	
  1526	const struct v4l2_file_operations uvc_fops = {
  1527		.owner		= THIS_MODULE,
  1528		.open		= uvc_v4l2_open,
  1529		.release	= uvc_v4l2_release,
> 1530		.unlocked_ioctl	= uvc_v4l2_video_ioctl2,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


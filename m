Return-Path: <linux-media+bounces-28455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 673E7A68413
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 05:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CD24189A5A0
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 04:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7733C24E014;
	Wed, 19 Mar 2025 04:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WftOnWra"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6271F4C8B;
	Wed, 19 Mar 2025 04:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742357038; cv=none; b=QcoHC5qyePz2HJ8HnmiS34KlAiHi1RzfbtMd+mZ/eH7L/fReEpVHLDOfy9lkOaLdI7dFTvDueXxdJuLmpQURqEQiaZqhS74vPdY5cOanairuFKXAzK02Vqem5tSzhbaXNB7O4gF6VxnNZh3NXVTvIjM3in9J0eGLz3JMMHEFYmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742357038; c=relaxed/simple;
	bh=0/JR/pB+k+9AEcl5/c7cHM6TepMSr4auWngtYq/+i+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8eDJeaAsdUz81XKQ6LrUZLRMHKzbcPCCmxZJiucB8q8qyrXJiBQDJ2MiUnfq+z9Ntz4JCzv3pSJuqXCTlh7kAJ5dpwgzcLgIIM8SV0pyXru5LrBiX11PmjpseX0f3CUh74hRfh2FSsdbCAUeNyvoB3HvZQVzcPFbMvt+IsRC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WftOnWra; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742357037; x=1773893037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0/JR/pB+k+9AEcl5/c7cHM6TepMSr4auWngtYq/+i+A=;
  b=WftOnWraLRJp6fvLidgPPoPDVo4scMLUYcPztojnYbo9vV5O3xqfJ90u
   /wwMFli3FYz1e6ahEndmSnBxpJVTMAmZWT5wYnrHMnJmbGhO6Q1MXk5CP
   f0ZO2+z0Vw52CpJ8k6x+EVeKlDXhTPLMSPReklQVTtn9agOwahs5SfdeX
   aqifaLasI7k+ZMHQ00zCcpH/1w18CUfA2dRYib6gBBksX7LiHzEfkFM/g
   0nLYClO7jFGo7a8A02QuRP1MfJ2GfJwC77B1VsYjgixkB9OlKnN9Yvimi
   m/3tLwlHAFnKquXUaJSsaiekgASpEqzGS4Txi0OiiDSHL4Z5RdGKBeb0i
   A==;
X-CSE-ConnectionGUID: WvxgiBjoRYy/D5YBa1XXZw==
X-CSE-MsgGUID: Tozc/kSLTNiIxliATGX1mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43448106"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="43448106"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 21:03:56 -0700
X-CSE-ConnectionGUID: ctKI1CrUT+umzslfbH++5A==
X-CSE-MsgGUID: tvlyeC76SNqDAIywRMgd0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="122630725"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Mar 2025 21:03:53 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tukei-000ELK-2m;
	Wed, 19 Mar 2025 04:03:49 +0000
Date: Wed, 19 Mar 2025 12:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: chenchangcheng <ccc194101@163.com>, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, mchehab@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: Re: [PATCH v2] media: uvcvideo: Fix bandwidth issue for Alcor camera
Message-ID: <202503191124.azEOPRHh-lkp@intel.com>
References: <20250318085724.1151547-1-ccc194101@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318085724.1151547-1-ccc194101@163.com>

Hi chenchangcheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4701f33a10702d5fc577c32434eb62adde0a1ae1]

url:    https://github.com/intel-lab-lkp/linux/commits/chenchangcheng/media-uvcvideo-Fix-bandwidth-issue-for-Alcor-camera/20250318-165843
base:   4701f33a10702d5fc577c32434eb62adde0a1ae1
patch link:    https://lore.kernel.org/r/20250318085724.1151547-1-ccc194101%40163.com
patch subject: [PATCH v2] media: uvcvideo: Fix bandwidth issue for Alcor camera
config: i386-buildonly-randconfig-006-20250319 (https://download.01.org/0day-ci/archive/20250319/202503191124.azEOPRHh-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503191124.azEOPRHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503191124.azEOPRHh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/usb/uvc/uvc_video.c:269:3: error: call to undeclared function 'uvc_printk'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     269 |                 uvc_printk(KERN_WARNING, "the max payload transmission size [%d]
         |                 ^
>> drivers/media/usb/uvc/uvc_video.c:269:28: warning: missing terminating '"' character [-Winvalid-pp-token]
     269 |                 uvc_printk(KERN_WARNING, "the max payload transmission size [%d]
         |                                          ^
   drivers/media/usb/uvc/uvc_video.c:269:28: error: expected expression
   drivers/media/usb/uvc/uvc_video.c:271:45: warning: missing terminating '"' character [-Winvalid-pp-token]
     271 |                            use the default value of 1024 bytes.\n",
         |                                                                  ^
   2 warnings and 2 errors generated.


vim +269 drivers/media/usb/uvc/uvc_video.c

   162	
   163	static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
   164		struct uvc_streaming_control *ctrl)
   165	{
   166		const struct uvc_format *format = NULL;
   167		const struct uvc_frame *frame = NULL;
   168		unsigned int i;
   169	
   170		/*
   171		 * The response of the Elgato Cam Link 4K is incorrect: The second byte
   172		 * contains bFormatIndex (instead of being the second byte of bmHint).
   173		 * The first byte is always zero. The third byte is always 1.
   174		 *
   175		 * The UVC 1.5 class specification defines the first five bits in the
   176		 * bmHint bitfield. The remaining bits are reserved and should be zero.
   177		 * Therefore a valid bmHint will be less than 32.
   178		 *
   179		 * Latest Elgato Cam Link 4K firmware as of 2021-03-23 needs this fix.
   180		 * MCU: 20.02.19, FPGA: 67
   181		 */
   182		if (usb_match_one_id(stream->dev->intf, &elgato_cam_link_4k) &&
   183		    ctrl->bmHint > 255) {
   184			u8 corrected_format_index = ctrl->bmHint >> 8;
   185	
   186			uvc_dbg(stream->dev, VIDEO,
   187				"Correct USB video probe response from {bmHint: 0x%04x, bFormatIndex: %u} to {bmHint: 0x%04x, bFormatIndex: %u}\n",
   188				ctrl->bmHint, ctrl->bFormatIndex,
   189				1, corrected_format_index);
   190			ctrl->bmHint = 1;
   191			ctrl->bFormatIndex = corrected_format_index;
   192		}
   193	
   194		for (i = 0; i < stream->nformats; ++i) {
   195			if (stream->formats[i].index == ctrl->bFormatIndex) {
   196				format = &stream->formats[i];
   197				break;
   198			}
   199		}
   200	
   201		if (format == NULL)
   202			return;
   203	
   204		for (i = 0; i < format->nframes; ++i) {
   205			if (format->frames[i].bFrameIndex == ctrl->bFrameIndex) {
   206				frame = &format->frames[i];
   207				break;
   208			}
   209		}
   210	
   211		if (frame == NULL)
   212			return;
   213	
   214		if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) ||
   215		     (ctrl->dwMaxVideoFrameSize == 0 &&
   216		      stream->dev->uvc_version < 0x0110))
   217			ctrl->dwMaxVideoFrameSize =
   218				frame->dwMaxVideoFrameBufferSize;
   219	
   220		/*
   221		 * The "TOSHIBA Web Camera - 5M" Chicony device (04f2:b50b) seems to
   222		 * compute the bandwidth on 16 bits and erroneously sign-extend it to
   223		 * 32 bits, resulting in a huge bandwidth value. Detect and fix that
   224		 * condition by setting the 16 MSBs to 0 when they're all equal to 1.
   225		 */
   226		if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
   227			ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
   228	
   229		if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
   230		    stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
   231		    stream->intf->num_altsetting > 1) {
   232			u32 interval;
   233			u32 bandwidth;
   234	
   235			interval = (ctrl->dwFrameInterval > 100000)
   236				 ? ctrl->dwFrameInterval
   237				 : frame->dwFrameInterval[0];
   238	
   239			/*
   240			 * Compute a bandwidth estimation by multiplying the frame
   241			 * size by the number of video frames per second, divide the
   242			 * result by the number of USB frames (or micro-frames for
   243			 * high- and super-speed devices) per second and add the UVC
   244			 * header size (assumed to be 12 bytes long).
   245			 */
   246			bandwidth = frame->wWidth * frame->wHeight / 8 * format->bpp;
   247			bandwidth *= 10000000 / interval + 1;
   248			bandwidth /= 1000;
   249			if (stream->dev->udev->speed >= USB_SPEED_HIGH)
   250				bandwidth /= 8;
   251			bandwidth += 12;
   252	
   253			/*
   254			 * The bandwidth estimate is too low for many cameras. Don't use
   255			 * maximum packet sizes lower than 1024 bytes to try and work
   256			 * around the problem. According to measurements done on two
   257			 * different camera models, the value is high enough to get most
   258			 * resolutions working while not preventing two simultaneous
   259			 * VGA streams at 15 fps.
   260			 */
   261			bandwidth = max_t(u32, bandwidth, 1024);
   262	
   263			ctrl->dwMaxPayloadTransferSize = bandwidth;
   264		}
   265	
   266		if (format->flags & UVC_FMT_FLAG_COMPRESSED &&
   267		    stream->dev->quirks & UVC_QUIRK_OVERFLOW_BANDWIDTH &&
   268		    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
 > 269			uvc_printk(KERN_WARNING, "the max payload transmission size [%d]
   270				   exceededs the size of the ep max packet.
   271				   use the default value of 1024 bytes.\n",
   272				   ctrl->dwMaxPayloadTransferSize);
   273			ctrl->dwMaxPayloadTransferSize = 1024;
   274		}
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-28457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F05A684AC
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 06:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03708179CC9
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 05:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A274524E4BF;
	Wed, 19 Mar 2025 05:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hl8F+xwI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20186130A73;
	Wed, 19 Mar 2025 05:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742363479; cv=none; b=HVgjhrAtFnTf++WMUZzE2mHKPMj+D7/mFB6pTiL/A7eUjuR8BiyydmA7TMVw6a9MYI8jQsqdJYMspo5KX2PcHTv2znGo51BvPSHdOSC138theC1p97MjeTQym8Lt2nJMGzFAsjdBjEgmjBO07Kdbkl1eTTFyqSf690qYKMsj5ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742363479; c=relaxed/simple;
	bh=du3za2Tlx3XbP9cB4jI0leMq6FSVwQ5shprz/Y4qleE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umSU0cKEttnSOh3JfiBmD2TfMQqDVoonZQcjooAQRM+A4UYudQ0qHkyWDw8PSu+hJCYAERqw3FW2APzZKf2Poz0paMNEOqNL4wUCTDlpgjGPe2olbNlVPQEiMA4Wmycr+pU1IbVWE3VNdRP+LA1kMt/Na7arvO/aE/Aw2mhjORs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hl8F+xwI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742363477; x=1773899477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=du3za2Tlx3XbP9cB4jI0leMq6FSVwQ5shprz/Y4qleE=;
  b=Hl8F+xwIVxJrAaLanNrRiAgf2shrPsrVVYueXE+BEne3O8eykGw5nleM
   XW1A0cm7BrOBnTXDVzoT3KGGaP7MEb0tZkGggObOt7d7I8z+6ZodZbdt8
   GVJJ8Nl0iQKzoiP3h36Euqke0wP0xK0VP7kafcGPs2NVBGF1Uoz4XMvMh
   cic8Jv0Ff8icLmsQOdI/gNGmY/uJyGADFR60WJcgypeGkBfRZp/yQn8px
   ihPS/aryOOx8crM/ntX3VDqWbt+Q4+ldTCjS4JSHpppd43FqNtSIs5ccX
   Y6it3Ood7XsH4+xRWGQMzi1oSWb3btoUaxuvDmJMR7WPr1NZ+gtvoHZ85
   g==;
X-CSE-ConnectionGUID: 3MdaNbaqRQqJnscx6jS3Uw==
X-CSE-MsgGUID: Fu98qYEBRPiKpVGHhw2QBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54528501"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="54528501"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 22:51:17 -0700
X-CSE-ConnectionGUID: +xrUdlTNS5S3ENA1TnqL3Q==
X-CSE-MsgGUID: gixFJNKuSRWyGw+M6A9dUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="122959656"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2025 22:51:14 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tumKd-000EOU-36;
	Wed, 19 Mar 2025 05:51:11 +0000
Date: Wed, 19 Mar 2025 13:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: chenchangcheng <ccc194101@163.com>, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: Re: [PATCH v2] media: uvcvideo: Fix bandwidth issue for Alcor camera
Message-ID: <202503191330.AveQs7tb-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 4701f33a10702d5fc577c32434eb62adde0a1ae1]

url:    https://github.com/intel-lab-lkp/linux/commits/chenchangcheng/media-uvcvideo-Fix-bandwidth-issue-for-Alcor-camera/20250318-165843
base:   4701f33a10702d5fc577c32434eb62adde0a1ae1
patch link:    https://lore.kernel.org/r/20250318085724.1151547-1-ccc194101%40163.com
patch subject: [PATCH v2] media: uvcvideo: Fix bandwidth issue for Alcor camera
config: sparc-randconfig-r072-20250319 (https://download.01.org/0day-ci/archive/20250319/202503191330.AveQs7tb-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503191330.AveQs7tb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503191330.AveQs7tb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/usb/uvc/uvc_video.c: In function 'uvc_fixup_video_ctrl':
>> drivers/media/usb/uvc/uvc_video.c:269:17: error: implicit declaration of function 'uvc_printk'; did you mean '_printk'? [-Werror=implicit-function-declaration]
     269 |                 uvc_printk(KERN_WARNING, "the max payload transmission size [%d]
         |                 ^~~~~~~~~~
         |                 _printk
   drivers/media/usb/uvc/uvc_video.c:269:42: warning: missing terminating " character
     269 |                 uvc_printk(KERN_WARNING, "the max payload transmission size [%d]
         |                                          ^
>> drivers/media/usb/uvc/uvc_video.c:269:42: error: missing terminating " character
     269 |                 uvc_printk(KERN_WARNING, "the max payload transmission size [%d]
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/usb/uvc/uvc_video.c:270:28: error: 'exceededs' undeclared (first use in this function)
     270 |                            exceededs the size of the ep max packet.
         |                            ^~~~~~~~~
   drivers/media/usb/uvc/uvc_video.c:270:28: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/media/usb/uvc/uvc_video.c:270:37: error: expected ')' before 'the'
     270 |                            exceededs the size of the ep max packet.
         |                                     ^~~~
         |                                     )
   drivers/media/usb/uvc/uvc_video.c:269:27: note: to match this '('
     269 |                 uvc_printk(KERN_WARNING, "the max payload transmission size [%d]
         |                           ^
>> drivers/media/usb/uvc/uvc_video.c:271:64: error: stray '\' in program
     271 |                            use the default value of 1024 bytes.\n",
         |                                                                ^
   drivers/media/usb/uvc/uvc_video.c:271:66: warning: missing terminating " character
     271 |                            use the default value of 1024 bytes.\n",
         |                                                                  ^
   drivers/media/usb/uvc/uvc_video.c:271:66: error: missing terminating " character
     271 |                            use the default value of 1024 bytes.\n",
         |                                                                  ^~
   cc1: some warnings being treated as errors


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
 > 270				   exceededs the size of the ep max packet.
 > 271				   use the default value of 1024 bytes.\n",
   272				   ctrl->dwMaxPayloadTransferSize);
   273			ctrl->dwMaxPayloadTransferSize = 1024;
   274		}
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


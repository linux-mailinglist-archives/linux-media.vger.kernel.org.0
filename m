Return-Path: <linux-media+bounces-28456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF56BA68497
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 06:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C22F3B866A
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 05:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC8424EF92;
	Wed, 19 Mar 2025 05:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBZsoEC5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BDF24EF85;
	Wed, 19 Mar 2025 05:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742362149; cv=none; b=mslWwxbusDb89T9+8WXPF/8Vb4fyGI+hBAvEbgsTL5bSoPENgCF/8wPp+bY3uUXTXhH/f+BfISAmCBMyI+EZ5WQkFs6jWsUHuDoi4AMaaQoC5g4UGPDju10SyHDQ6nEO3yoonz4CE0frvwvdZ1Ei/5AE1qblwrTqajuASo94AAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742362149; c=relaxed/simple;
	bh=dl6cK5TEnuTVjLJCg8igSMXiMO3bRFThDiba1zjklzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJPR8gKH8PtxZq1wdvLxBXy1xCNjscXgOcBoJJ8R/nLw5jzrX0kfBRGCN7bNzQaLb7UVYdM+SbdgFmVHJiwmZQR9q/9xlXAEj3H6U/LtnxdDVeLZw3cpTHjaDSqUZxl8SNg4ocS8EdOAMNDlILG6Kt4zxr3pbzFJNSAhoykaDGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBZsoEC5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742362146; x=1773898146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dl6cK5TEnuTVjLJCg8igSMXiMO3bRFThDiba1zjklzU=;
  b=mBZsoEC5RBfuSBPKE7tix/UlCyJL975rzdSIphehfv3cdo4dWOF0Ql/V
   1RrflVxgv3+0mttgBJZvLrZW3ZzJMAAu1BjZOc05kkMvdHmfE74WI+loi
   E2xtmNgmL8MHW560VWEO2yy2jfznoLo/mK/a/zUR+FtBoo1VconBSvHLv
   NycdDinGxRfJ1S3cfbr5tkhRqlewv+0dT9uy4Eb+7A9DOnXHaDyHsyI4G
   3qVcIL8C4VerUWdthPvL2b2usNPLYJiZwtKTi4rEydxl9m7nRAxdmFnJ1
   29KFjlWKQFiq/JOqiiZtIIgTTJ0pzYxiTWjw5dgZbJSGd3yl6PHpVXfa+
   w==;
X-CSE-ConnectionGUID: eJhui+XIQLKXPKIUycS1mw==
X-CSE-MsgGUID: 9dVeB2xNQQi3isZ7HoWVzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="42783173"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="42783173"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 22:29:05 -0700
X-CSE-ConnectionGUID: GvnVli49SZqiUQkIb/OKVQ==
X-CSE-MsgGUID: it6V6nnVSqeDs0iGvwHZ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="153476189"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2025 22:29:03 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tulz7-000EO6-0Z;
	Wed, 19 Mar 2025 05:28:58 +0000
Date: Wed, 19 Mar 2025 13:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: chenchangcheng <ccc194101@163.com>, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, mchehab@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: Re: [PATCH v2] media: uvcvideo: Fix bandwidth issue for Alcor camera
Message-ID: <202503191353.gaC25wLw-lkp@intel.com>
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
config: i386-buildonly-randconfig-006-20250319 (https://download.01.org/0day-ci/archive/20250319/202503191353.gaC25wLw-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503191353.gaC25wLw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503191353.gaC25wLw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/usb/uvc/uvc_video.c:269:3: error: call to undeclared function 'uvc_printk'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     269 |                 uvc_printk(KERN_WARNING, "the max payload transmission size [%d]
         |                 ^
   drivers/media/usb/uvc/uvc_video.c:269:28: warning: missing terminating '"' character [-Winvalid-pp-token]
     269 |                 uvc_printk(KERN_WARNING, "the max payload transmission size [%d]
         |                                          ^
>> drivers/media/usb/uvc/uvc_video.c:269:28: error: expected expression
   drivers/media/usb/uvc/uvc_video.c:271:45: warning: missing terminating '"' character [-Winvalid-pp-token]
     271 |                            use the default value of 1024 bytes.\n",
         |                                                                  ^
   2 warnings and 2 errors generated.


vim +/uvc_printk +269 drivers/media/usb/uvc/uvc_video.c

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


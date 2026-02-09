Return-Path: <linux-media+bounces-52441-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FTlB/QSimlrGAAAu9opvQ
	(envelope-from <linux-media+bounces-52441-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 18:01:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3D7112CDE
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 18:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5861C3008452
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 17:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1B63859E7;
	Mon,  9 Feb 2026 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lB4+rXs6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595562D372D;
	Mon,  9 Feb 2026 17:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770656455; cv=none; b=uBJkzteVjNyTkQbXburPz6MbSUu6izSQBGcsbdg1dT0zZpJ0ONEt3rKLSa2UBWX7NBXw23co9nnXfXwgHqycKQso4bAsjJTkuMpTQIOGgCXAqyZB1X5doVJNiPiTEoQhcBFHmDckgsjzjHexVIoLrP8k2BX6Be1ydoXREnPc/64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770656455; c=relaxed/simple;
	bh=mf/6Q1WBshYdJwFlet1rqxPMJn1IL8rkiFNbZ7fGmaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRJXlFoKZrkEHLCLACHhGamdiUM+oVvT6E4Gsa4UaHth6+BIyj5vpwUYdjxsNJJCS9A70OFt1srCrj1XmIhPIm60eA8JtUN+CLGW7x4py+SndH6QQEOgVqcsxEGv7MAxR4zb0llJ5UPPfKva2Wt38u94jXFhZNttNcuGN7yjm/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lB4+rXs6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770656455; x=1802192455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mf/6Q1WBshYdJwFlet1rqxPMJn1IL8rkiFNbZ7fGmaI=;
  b=lB4+rXs6CkMIXLcDnk8EbV12+6ogqHoOeioftT5KiZ6KPcm86W/fjBVu
   0HGgdVONST5Ue3uizWNTd/EgEBlW/XMYTcLQLc90hc7+CwmKWRvwPorLL
   1gm6AgN/MC2pm1fvQmfJIgONm+1l/3TIO9eoxuoav1WUN93V3h/pQf7ge
   TDcq1OmIeP4H1wRJDmNJqN8IillMkuAOMiBFmj8191y4ibmxi2LSMe7+0
   +zqY9VqL7xECsnUXy4JJfSexJRoSvtRU1YnIzmU/7W82kJaUg0YtVK2Yk
   kezuzLBKd3I05Mm8k+/alqyhr2lpV4irhxFI4jLysI0p4ydIpWdfcutXP
   w==;
X-CSE-ConnectionGUID: 0iK0MQWeQJWc6Pe7CJ1LYw==
X-CSE-MsgGUID: endlzPPpQqGfUTzEA3AZLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71955274"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71955274"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 09:00:50 -0800
X-CSE-ConnectionGUID: Alqk51ddRwqsVd7qMqY3+g==
X-CSE-MsgGUID: 2+f/WVnHRS+656o+nOIarw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="210791783"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Feb 2026 09:00:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpUcv-00000000o8m-1U0v;
	Mon, 09 Feb 2026 17:00:45 +0000
Date: Tue, 10 Feb 2026 01:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: toast1599 <swizzguy76@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Bingbu Cao <bingbu.cao@intel.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, toast1599 <swizzguy76@gmail.com>
Subject: Re: [PATCH] staging: media: ipu7: refine PHY, ABI and add metadata
 support
Message-ID: <202602100028.PFvYD41f-lkp@intel.com>
References: <20260209081025.100080-1-swizzguy76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209081025.100080-1-swizzguy76@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52441-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 3E3D7112CDE
X-Rspamd-Action: no action

Hi toast1599,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/toast1599/staging-media-ipu7-refine-PHY-ABI-and-add-metadata-support/20260209-161453
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260209081025.100080-1-swizzguy76%40gmail.com
patch subject: [PATCH] staging: media: ipu7: refine PHY, ABI and add metadata support
config: x86_64-randconfig-122-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100028.PFvYD41f-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100028.PFvYD41f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100028.PFvYD41f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/videodev2.h:61,
                    from include/media/v4l2-dev.h:18,
                    from drivers/staging/media/ipu7/ipu7-isys-video.c:23:
>> include/uapi/linux/videodev2.h:82:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |          ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:59:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                        ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:59:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:44: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                            ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:59:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:65: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                                                 ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:59:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: error: initializer element is not constant
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:59:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: note: (near initialization for 'ipu7_isys_pfmts[9].pixelformat')
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:59:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/videodev2.h:82:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |          ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:62:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                        ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:62:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:44: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                            ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:62:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:65: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                                                 ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:62:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: error: initializer element is not constant
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:62:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: note: (near initialization for 'ipu7_isys_pfmts[11].pixelformat')
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:62:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/videodev2.h:82:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |          ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:65:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                        ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:65:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:44: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                            ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:65:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:65: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                                                 ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:65:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: error: initializer element is not constant
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:65:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: note: (near initialization for 'ipu7_isys_pfmts[13].pixelformat')
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:65:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/videodev2.h:82:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |          ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:68:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                        ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:68:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:44: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                            ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:68:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:65: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                                                 ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:68:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: error: initializer element is not constant
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:68:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: note: (near initialization for 'ipu7_isys_pfmts[15].pixelformat')
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:68:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from drivers/staging/media/ipu7/ipu7-isys-video.c:12:
   drivers/staging/media/ipu7/ipu7-isys-video.c: In function 'ipu7_isys_put_stream':
   drivers/staging/media/ipu7/ipu7-isys-video.c:665:26: error: 'isys' undeclared (first use in this function)
     665 |                 dev_err(&isys->adev->auxdev.dev, " no available stream\n");
         |                          ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:665:17: note: in expansion of macro 'dev_err'
     665 |                 dev_err(&isys->adev->auxdev.dev, " no available stream\n");
         |                 ^~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:665:26: note: each undeclared identifier is reported only once for each function it appears in
     665 |                 dev_err(&isys->adev->auxdev.dev, " no available stream\n");
         |                          ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:665:17: note: in expansion of macro 'dev_err'
     665 |                 dev_err(&isys->adev->auxdev.dev, " no available stream\n");
         |                 ^~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c: In function 'ipu7_isys_video_init':
   drivers/staging/media/ipu7/ipu7-isys-video.c:1031:70: error: expected expression before '|' token
    1031 |         av->vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_IO_MC | | V4L2_CAP_META_CAPTURE
         |                                                                      ^
--
   In file included from include/linux/videodev2.h:61,
                    from include/media/v4l2-dev.h:18,
                    from ipu7-isys-video.c:23:
>> include/uapi/linux/videodev2.h:82:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |          ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:59:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                        ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:59:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:44: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                            ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:59:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:65: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                                                 ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:59:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: error: initializer element is not constant
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:59:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: note: (near initialization for 'ipu7_isys_pfmts[9].pixelformat')
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:59:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/videodev2.h:82:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |          ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:62:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                        ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:62:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:44: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                            ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:62:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:65: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                                                 ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:62:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: error: initializer element is not constant
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:62:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: note: (near initialization for 'ipu7_isys_pfmts[11].pixelformat')
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:62:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/videodev2.h:82:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |          ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:65:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                        ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:65:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:44: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                            ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:65:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:65: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                                                 ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:65:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: error: initializer element is not constant
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:65:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: note: (near initialization for 'ipu7_isys_pfmts[13].pixelformat')
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:65:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/videodev2.h:82:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |          ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:68:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                        ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:68:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:44: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                            ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:68:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:65: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                                                 ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:68:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: error: initializer element is not constant
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:68:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:9: note: (near initialization for 'ipu7_isys_pfmts[15].pixelformat')
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |         ^
   ipu7-isys-video.h:29:34: note: in expansion of macro 'v4l2_fourcc'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~
   ipu7-isys-video.c:68:10: note: in expansion of macro 'V4L2_META_FMT_IPU7_STATS'
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from ipu7-isys-video.c:12:
   ipu7-isys-video.c: In function 'ipu7_isys_put_stream':
   ipu7-isys-video.c:665:26: error: 'isys' undeclared (first use in this function)
     665 |                 dev_err(&isys->adev->auxdev.dev, " no available stream\n");
         |                          ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   ipu7-isys-video.c:665:17: note: in expansion of macro 'dev_err'
     665 |                 dev_err(&isys->adev->auxdev.dev, " no available stream\n");
         |                 ^~~~~~~
   ipu7-isys-video.c:665:26: note: each undeclared identifier is reported only once for each function it appears in
     665 |                 dev_err(&isys->adev->auxdev.dev, " no available stream\n");
         |                          ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   ipu7-isys-video.c:665:17: note: in expansion of macro 'dev_err'
     665 |                 dev_err(&isys->adev->auxdev.dev, " no available stream\n");
         |                 ^~~~~~~
   ipu7-isys-video.c: In function 'ipu7_isys_video_init':
   ipu7-isys-video.c:1031:70: error: expected expression before '|' token
    1031 |         av->vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_IO_MC | | V4L2_CAP_META_CAPTURE
         |                                                                      ^


vim +82 include/uapi/linux/videodev2.h

607ca46e97a1b6 David Howells 2012-10-13  75  
607ca46e97a1b6 David Howells 2012-10-13  76  /*
607ca46e97a1b6 David Howells 2012-10-13  77   *	M I S C E L L A N E O U S
607ca46e97a1b6 David Howells 2012-10-13  78   */
607ca46e97a1b6 David Howells 2012-10-13  79  
607ca46e97a1b6 David Howells 2012-10-13  80  /*  Four-character-code (FOURCC) */
607ca46e97a1b6 David Howells 2012-10-13  81  #define v4l2_fourcc(a, b, c, d)\
607ca46e97a1b6 David Howells 2012-10-13 @82  	((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
ff3c65cb81157b Shuah Khan    2019-06-12  83  #define v4l2_fourcc_be(a, b, c, d)	(v4l2_fourcc(a, b, c, d) | (1U << 31))
607ca46e97a1b6 David Howells 2012-10-13  84  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


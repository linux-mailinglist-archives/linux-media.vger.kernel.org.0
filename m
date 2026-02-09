Return-Path: <linux-media+bounces-52420-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IjsNev8iWluFQAAu9opvQ
	(envelope-from <linux-media+bounces-52420-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:27:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B96111E56
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5977C300B1B8
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E3037F8A0;
	Mon,  9 Feb 2026 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/saDF9h"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6181237F725;
	Mon,  9 Feb 2026 15:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650845; cv=none; b=gJIIPE8Wr0GIMqNQuHKLCHrViqcxkmnHYtv+W4z56q2sv5MSSX1I3pQVknkVeOXKxXasqgM/nTVzNxHaBJHeqgPYUs8HLPnHzezucEJocjTQqfIf64L7mbA8xlSU5YebJz2XfROtsirauzJcWWwcskz9sEFTSh7tqXEOmsrKtlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650845; c=relaxed/simple;
	bh=OIQ+LPQznmbWOzMdwcNFU1qRdQGdNU8mXYy4h9LBx80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFoLWQHUVmEY2fgeUF028o+gnUnZRhZxIC1SHDuaTVSOrXJakzNRe95icm3Z1v1cTe7Fu1UZirT6/wtGgW8i1mh/7jb7YS3apvZULtZaqJ0tAxBAkB/j/Bh9vPhzuopTviVBIrngEyFg005VTQHPdJb5mdA3lIg7y3PosDhIwE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/saDF9h; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770650845; x=1802186845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OIQ+LPQznmbWOzMdwcNFU1qRdQGdNU8mXYy4h9LBx80=;
  b=I/saDF9hdFVpmrODqxaDp8nAWrq2vnRbCixdEsd63TGWq+AYpVB2tnmg
   emN7gn71jsyxv9IVFL3pCpFFPpW+UACRda4Ni1UEOA79rBDpYXKYKT98G
   fnHuqR2fN7vONH2PRHyY1qfbGDm0qJEGPFLEv3jD8fErwkx3oxDIwjEr5
   uqRXMyM+QuBzda3a7yychx+w1A2HICT9/uwnrGntaCJQAmfhjel4vJHRT
   UHexmBGPyRD4DWO8PGBCakR7+U9FT71vOQlAsl6bTddZm7kFq8gZbOiF1
   SFl8Vte2oFtM/53thtX5oSyWQf1x5t2Yj9LohHjHOumDKUiUIi2eKUvdy
   g==;
X-CSE-ConnectionGUID: fJEsCFfRSsWDssqt6QzdiQ==
X-CSE-MsgGUID: OvnrS4mJQzWUxqXpwt7EfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71749491"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71749491"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:27:25 -0800
X-CSE-ConnectionGUID: zm1YdpgOQjiDe8vuADcA6Q==
X-CSE-MsgGUID: HaH05wf+Q4yWm2HJLzTfoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211677233"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Feb 2026 07:27:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpTAU-00000000o4I-3tYQ;
	Mon, 09 Feb 2026 15:27:18 +0000
Date: Mon, 9 Feb 2026 23:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: toast1599 <swizzguy76@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	toast1599 <swizzguy76@gmail.com>
Subject: Re: [PATCH] staging: media: ipu7: refine PHY, ABI and add metadata
 support
Message-ID: <202602092340.64ST4kYt-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52420-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email,01.org:url]
X-Rspamd-Queue-Id: 75B96111E56
X-Rspamd-Action: no action

Hi toast1599,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/toast1599/staging-media-ipu7-refine-PHY-ABI-and-add-metadata-support/20260209-161453
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260209081025.100080-1-swizzguy76%40gmail.com
patch subject: [PATCH] staging: media: ipu7: refine PHY, ABI and add metadata support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260209/202602092340.64ST4kYt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092340.64ST4kYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092340.64ST4kYt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/ipu7/ipu7-isys-video.c:59:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:3: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |          ^~~~~~~~~~
>> drivers/staging/media/ipu7/ipu7-isys-video.c:59:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:17: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                        ^~~~~~~~~~
>> drivers/staging/media/ipu7/ipu7-isys-video.c:59:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:37: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                            ^~~~~~~~~~
>> drivers/staging/media/ipu7/ipu7-isys-video.c:59:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      59 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:58: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                                                 ^~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:62:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:3: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |          ^~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:62:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:17: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                        ^~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:62:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:37: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                            ^~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:62:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      62 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:58: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                                                 ^~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:65:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:3: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |          ^~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:65:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:17: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                        ^~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:65:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:37: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                            ^~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:65:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      65 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:58: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                                                                 ^~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:68:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:3: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |          ^~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:68:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.h:29:34: note: expanded from macro 'V4L2_META_FMT_IPU7_STATS'
      29 | #define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:82:17: note: expanded from macro 'v4l2_fourcc'
      82 |         ((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
         |                        ^~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-isys-video.c:68:3: warning: cast to smaller integer type '__u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
      68 |         {V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},


vim +59 drivers/staging/media/ipu7/ipu7-isys-video.c

    39	
    40	const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
    41		{V4L2_PIX_FMT_SBGGR12, 16, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
    42		 IPU_INSYS_FRAME_FORMAT_RAW16},
    43		{V4L2_PIX_FMT_SGBRG12, 16, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
    44		 IPU_INSYS_FRAME_FORMAT_RAW16},
    45		{V4L2_PIX_FMT_SGRBG12, 16, 12, MEDIA_BUS_FMT_SGRBG12_1X12,
    46		 IPU_INSYS_FRAME_FORMAT_RAW16},
    47		{V4L2_PIX_FMT_SRGGB12, 16, 12, MEDIA_BUS_FMT_SRGGB12_1X12,
    48		 IPU_INSYS_FRAME_FORMAT_RAW16},
    49		{V4L2_PIX_FMT_SBGGR10, 16, 10, MEDIA_BUS_FMT_SBGGR10_1X10,
    50		 IPU_INSYS_FRAME_FORMAT_RAW16},
    51		{V4L2_PIX_FMT_SGBRG10, 16, 10, MEDIA_BUS_FMT_SGBRG10_1X10,
    52		 IPU_INSYS_FRAME_FORMAT_RAW16},
    53		{V4L2_PIX_FMT_SGRBG10, 16, 10, MEDIA_BUS_FMT_SGRBG10_1X10,
    54		 IPU_INSYS_FRAME_FORMAT_RAW16},
    55		{V4L2_PIX_FMT_SRGGB10, 16, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
    56		 IPU_INSYS_FRAME_FORMAT_RAW16},
    57		{V4L2_PIX_FMT_SBGGR8, 8, 8, MEDIA_BUS_FMT_SBGGR8_1X8,
    58		 IPU_INSYS_FRAME_FORMAT_RAW8},
  > 59		{V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
    60		{V4L2_PIX_FMT_SGBRG8, 8, 8, MEDIA_BUS_FMT_SGBRG8_1X8,
    61		 IPU_INSYS_FRAME_FORMAT_RAW8},
    62		{V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
    63		{V4L2_PIX_FMT_SGRBG8, 8, 8, MEDIA_BUS_FMT_SGRBG8_1X8,
    64		 IPU_INSYS_FRAME_FORMAT_RAW8},
    65		{V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
    66		{V4L2_PIX_FMT_SRGGB8, 8, 8, MEDIA_BUS_FMT_SRGGB8_1X8,
    67		 IPU_INSYS_FRAME_FORMAT_RAW8},
    68		{V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
    69		{V4L2_PIX_FMT_SBGGR12P, 12, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
    70		 IPU_INSYS_FRAME_FORMAT_RAW12},
    71		{V4L2_PIX_FMT_SGBRG12P, 12, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
    72		 IPU_INSYS_FRAME_FORMAT_RAW12},
    73		{V4L2_PIX_FMT_SGRBG12P, 12, 12, MEDIA_BUS_FMT_SGRBG12_1X12,
    74		 IPU_INSYS_FRAME_FORMAT_RAW12},
    75		{V4L2_PIX_FMT_SRGGB12P, 12, 12, MEDIA_BUS_FMT_SRGGB12_1X12,
    76		 IPU_INSYS_FRAME_FORMAT_RAW12},
    77		{V4L2_PIX_FMT_SBGGR10P, 10, 10, MEDIA_BUS_FMT_SBGGR10_1X10,
    78		 IPU_INSYS_FRAME_FORMAT_RAW10},
    79		{V4L2_PIX_FMT_SGBRG10P, 10, 10, MEDIA_BUS_FMT_SGBRG10_1X10,
    80		 IPU_INSYS_FRAME_FORMAT_RAW10},
    81		{V4L2_PIX_FMT_SGRBG10P, 10, 10, MEDIA_BUS_FMT_SGRBG10_1X10,
    82		 IPU_INSYS_FRAME_FORMAT_RAW10},
    83		{V4L2_PIX_FMT_SRGGB10P, 10, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
    84		 IPU_INSYS_FRAME_FORMAT_RAW10},
    85		{V4L2_PIX_FMT_UYVY, 16, 16, MEDIA_BUS_FMT_UYVY8_1X16,
    86		 IPU_INSYS_FRAME_FORMAT_UYVY},
    87		{V4L2_PIX_FMT_YUYV, 16, 16, MEDIA_BUS_FMT_YUYV8_1X16,
    88		 IPU_INSYS_FRAME_FORMAT_YUYV},
    89		{V4L2_PIX_FMT_RGB565, 16, 16, MEDIA_BUS_FMT_RGB565_1X16,
    90		 IPU_INSYS_FRAME_FORMAT_RGB565},
    91		{V4L2_PIX_FMT_BGR24, 24, 24, MEDIA_BUS_FMT_RGB888_1X24,
    92		 IPU_INSYS_FRAME_FORMAT_RGBA888},
    93	};
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


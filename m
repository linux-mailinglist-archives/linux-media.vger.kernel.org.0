Return-Path: <linux-media+bounces-11523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B83508C750D
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 13:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6660B2844AA
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 11:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41281459E5;
	Thu, 16 May 2024 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NW36PcXO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EF0145354
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715858159; cv=none; b=pZyhHeNKYFXygVsHAiJz67/AIBFTMd9tHMOn4ba01LJC+JJwMnSPlB/aanV7fQeMthfnNLj1qAbycNcfWdQl0oYXcjtXzTFCYwFNE4U18LlyawukdjUee+F6BveQ3PfwA19fR8FyH16GoPi/DoBVYx6jp4WxxW6t4q3iVBiDApY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715858159; c=relaxed/simple;
	bh=8FiDi3rSh8YbjIJWwXL4knvvjLdCTS7p5CuuEb5Phcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDPZUTe4wa3+iZwAnRPP/84EODO31ovM7iyWytQaGJShA8/PmCuK2htxvDZiWD1bnv1ksLrn3eYDZzfdWgwcl/CFe5LBFzGvu53Mqrwsex3pTJipQkbyIQZQscSPYZQW9Y9NwKC4oq9ROJ/YDOM8dUvX5or5Oggal3Naey8BBmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NW36PcXO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715858157; x=1747394157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8FiDi3rSh8YbjIJWwXL4knvvjLdCTS7p5CuuEb5Phcs=;
  b=NW36PcXOU4JL51tmC3JTqYFVuG6kbzYFCH9FXv+fRe7VbwKaKCs+dq0P
   np7Jxgw5h2QkeWvGNhLYnkAwQQhDpIdcPBsGoi5+Zg0L7yw98i0gJQIyo
   K59qhpT6V0gaarV+KvBI/IEWeV591tQ7/PpQY9hferJHWxPHneUItGK/L
   TTAFW55D4d2EnTX3nB17dTPPzuwj5yNoYvoofT1okp7gfCzgFRb/a4KHV
   VVnkTYfH14XP8V4NK8MNKv40cQtwWKwvKs5TN1INKr6axetUMgMUg+pzb
   uSFJ3vle7KLA1own/razxIW0exDOGTeAspHojlG1NSl1ny76dxIk8OjOP
   A==;
X-CSE-ConnectionGUID: FwJLUfBWRtSBpYjNvS61Fg==
X-CSE-MsgGUID: mwMMFDB7SKasuL1ALfdJdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22564318"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="22564318"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 04:15:56 -0700
X-CSE-ConnectionGUID: yHj1g9vhQvy6yBpLhbvw0g==
X-CSE-MsgGUID: dMU429v1RKqrTvjpZ++YSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31521944"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 May 2024 04:15:55 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7Z5T-000EBT-2h;
	Thu, 16 May 2024 11:15:51 +0000
Date: Thu, 16 May 2024 19:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v5 1/4] media: v4l: Support passing media pad argument to
 v4l2_get_link_freq()
Message-ID: <202405161801.Muqsgsku-lkp@intel.com>
References: <20240516070507.21735-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516070507.21735-2-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8771b7f31b7fff91a998e6afdb60650d4bac59a5]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-Support-passing-media-pad-argument-to-v4l2_get_link_freq/20240516-150645
base:   8771b7f31b7fff91a998e6afdb60650d4bac59a5
patch link:    https://lore.kernel.org/r/20240516070507.21735-2-sakari.ailus%40linux.intel.com
patch subject: [PATCH v5 1/4] media: v4l: Support passing media pad argument to v4l2_get_link_freq()
config: i386-randconfig-006-20240516 (https://download.01.org/0day-ci/archive/20240516/202405161801.Muqsgsku-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405161801.Muqsgsku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405161801.Muqsgsku-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-common.c:510:7: error: no member named 'entity' in 'struct v4l2_subdev'
     510 |         sd = media_entity_to_v4l2_subdev(pad->entity);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:49: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:390:74: note: expanded from macro '__same_type'
     390 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/media/v4l2-core/v4l2-common.c:510:7: error: no member named 'entity' in 'v4l2_subdev'
     510 |         sd = media_entity_to_v4l2_subdev(pad->entity);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:3: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^                                             ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> drivers/media/v4l2-core/v4l2-common.c:510:5: error: assigning to 'struct v4l2_subdev *' from incompatible type 'void'
     510 |         sd = media_entity_to_v4l2_subdev(pad->entity);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +510 drivers/media/v4l2-core/v4l2-common.c

   504	
   505	s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
   506				     unsigned int div)
   507	{
   508		struct v4l2_subdev *sd;
   509	
 > 510		sd = media_entity_to_v4l2_subdev(pad->entity);
   511		if (!sd)
   512			return -ENODEV;
   513	
   514		return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
   515	}
   516	EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
   517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


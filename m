Return-Path: <linux-media+bounces-7161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712BB87D6AC
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 23:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E70FFB2183D
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 22:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D482D548F0;
	Fri, 15 Mar 2024 22:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czmJwfRr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2E2179AB
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 22:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710542190; cv=none; b=UcCljhOWwFjLCsy7LI/YV2mK1ms+wSAU3gSVR7JxNuQ9bEPsGJb2cu78KctR0Fd6A2YMdjYahgCQXj2yIerWbpKREfeqXU6OfSaXogvD8QsmSuh6OG+owgid5RUctBJeMl+Kt6/W81+lyL5lPC3zUGRQ+5KLCTZCGJsdBinHP4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710542190; c=relaxed/simple;
	bh=fIeglJFOFFzBUWQD1ferbO/RhnNMG+Ak9BJ34PUlydE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HI+rTEEoOU4MGM3mxczhJHV7qGySgQi8rLU+5aH6+LMNZvWZx7Csk801BoGJtI3aRRsfomWhnMfSF3qIMvz1HznxYzjKrkoVTpS5toAMISkGbO12Th6jMI/4Dc201MgMC/3a+rplsqTdR7uaJywTb0ZfefRxBTROGZHV8EhOD/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czmJwfRr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710542187; x=1742078187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fIeglJFOFFzBUWQD1ferbO/RhnNMG+Ak9BJ34PUlydE=;
  b=czmJwfRr2p5ze7dfCybcNLoY6Qq4Z/KHF7MpVgmOda6zcS3JobostU14
   3J8bb/fwEj6c9joAwWibuomUURdH9zaTKeXXiwSvmisWgV2GcLxYdb4AA
   W7DJ4c//1+88t4EZ8cR/DufkKbusLTlCJSlh9FVENrGKevzXVab3pc6Nj
   5G68uBToMMMifJ58khpx8NB/BbmQsQYYLlt2UAzF5qHYK6OrMelT4CCLz
   7PlThJahkXDIiAakz9EZA/wwBcauAB1AScty6ZOpiJ5qBq7BMD7p/dr7e
   bzuEuWPiLG4hgPsnWL5CocpUtBku5+K8lN5alGATF1HgmhggR/5Lhl4Cn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="8375532"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="8375532"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 15:36:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="13281627"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Mar 2024 15:36:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlGA2-000Eqj-0f;
	Fri, 15 Mar 2024 22:36:22 +0000
Date: Sat, 16 Mar 2024 06:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@collabora.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	kernel@collabora.com, Julien Massot <julien.massot@collabora.com>
Subject: Re: [PATCH 2/4] media: i2c: st-vgxy61: Add support for embedded data
Message-ID: <202403160651.QB9YWHsu-lkp@intel.com>
References: <20240315085158.1213159-3-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315085158.1213159-3-julien.massot@collabora.com>

Hi Julien,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master next-20240315]
[cannot apply to sailus-media-tree/streams linus/master v6.8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julien-Massot/media-i2c-st-vgxy61-Use-sub-device-active-state/20240315-165346
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240315085158.1213159-3-julien.massot%40collabora.com
patch subject: [PATCH 2/4] media: i2c: st-vgxy61: Add support for embedded data
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240316/202403160651.QB9YWHsu-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160651.QB9YWHsu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160651.QB9YWHsu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/st-vgxy61.c: In function 'vgxy61_enum_mbus_code':
>> drivers/media/i2c/st-vgxy61.c:709:30: error: 'MEDIA_BUS_FMT_META_8' undeclared (first use in this function); did you mean 'MEDIA_BUS_FMT_Y8_1X8'?
     709 |                 code->code = MEDIA_BUS_FMT_META_8;
         |                              ^~~~~~~~~~~~~~~~~~~~
         |                              MEDIA_BUS_FMT_Y8_1X8
   drivers/media/i2c/st-vgxy61.c:709:30: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/i2c/st-vgxy61.c: In function '__vgxy61_set_fmt':
   drivers/media/i2c/st-vgxy61.c:1251:26: error: 'MEDIA_BUS_FMT_META_8' undeclared (first use in this function); did you mean 'MEDIA_BUS_FMT_Y8_1X8'?
    1251 |         meta_fmt->code = MEDIA_BUS_FMT_META_8;
         |                          ^~~~~~~~~~~~~~~~~~~~
         |                          MEDIA_BUS_FMT_Y8_1X8
   drivers/media/i2c/st-vgxy61.c: In function 'vgxy61_get_frame_desc':
   drivers/media/i2c/st-vgxy61.c:1309:36: error: 'MEDIA_BUS_FMT_META_8' undeclared (first use in this function); did you mean 'MEDIA_BUS_FMT_Y8_1X8'?
    1309 |         desc->entry[1].pixelcode = MEDIA_BUS_FMT_META_8;
         |                                    ^~~~~~~~~~~~~~~~~~~~
         |                                    MEDIA_BUS_FMT_Y8_1X8
   drivers/media/i2c/st-vgxy61.c: In function 'vgxy61_init_state':
>> drivers/media/i2c/st-vgxy61.c:1326:34: error: 'V4L2_SUBDEV_ROUTE_FL_IMMUTABLE' undeclared (first use in this function); did you mean 'V4L2_SUBDEV_ROUTE_FL_ACTIVE'?
    1326 |                                  V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  V4L2_SUBDEV_ROUTE_FL_ACTIVE
   drivers/media/i2c/st-vgxy61.c: In function 'vgxy61_probe':
>> drivers/media/i2c/st-vgxy61.c:1891:37: error: 'MEDIA_PAD_FL_INTERNAL' undeclared (first use in this function); did you mean 'MEDIA_PAD_FL_SOURCE'?
    1891 |                 MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
         |                                     ^~~~~~~~~~~~~~~~~~~~~
         |                                     MEDIA_PAD_FL_SOURCE


vim +709 drivers/media/i2c/st-vgxy61.c

   698	
   699	static int vgxy61_enum_mbus_code(struct v4l2_subdev *sd,
   700					 struct v4l2_subdev_state *sd_state,
   701					 struct v4l2_subdev_mbus_code_enum *code)
   702	{
   703		if (code->pad == VGXY61_PAD_META ||
   704		    (code->pad == VGXY61_PAD_SOURCE &&
   705		     code->stream == VGXY61_STREAM_META)) {
   706			if (code->index > 0)
   707				return -EINVAL;
   708	
 > 709			code->code = MEDIA_BUS_FMT_META_8;
   710			return 0;
   711		}
   712	
   713		if (code->index >= ARRAY_SIZE(vgxy61_supported_codes))
   714			return -EINVAL;
   715	
   716		code->code = vgxy61_supported_codes[code->index].code;
   717	
   718		return 0;
   719	}
   720	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-38049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38715B09FE0
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 11:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE85C1885AE4
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 09:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AB729898C;
	Fri, 18 Jul 2025 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DE2Rp8tW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD60214A9E;
	Fri, 18 Jul 2025 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752831293; cv=none; b=Ea57wFnkYnkKWTLoQpwIJerWBhY+krO4Cyj++DNgX/RntM6oJ1THSGLSw4yYJlcVjAzUCnU9hR+0Qg5todWPgOCYTX4BGohTQng5YF5BfXpin4LMXR2XpLObCWBMYIBrpbXkMHK1yqNf6Ry7d7EMzc6QUeahaIN4GDBd4dwLATQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752831293; c=relaxed/simple;
	bh=IRZ6eW/IHF7BaJPyLxlRyPGJhIBXJU4DVyfIU35NfdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUZGPItcMC1GjsQtkYWyrTjzfmgDiZ/GeMvQ+nrMsxyVlu/QGJvpMn8cNWGFIzpsJ8oQJGUHS1KYOsBoCtFLavUbtJna1Ci4+2syrbLvfQ/XscaUwjwlZfY5Rt8asrkXNRMvlAoSc80Qivugyq0ImLZK5qPk07T5RplOgFje86w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DE2Rp8tW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752831291; x=1784367291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IRZ6eW/IHF7BaJPyLxlRyPGJhIBXJU4DVyfIU35NfdA=;
  b=DE2Rp8tW5fQyi7w/6CIzDvxlBoFN60Csfa2OaXzCT2rOobWGKS1IkWmV
   lmKAiRUJ9FH8gTwpWUiH0q1z+GfBKv+UEAUIj9lrbUxq+elBIbb/SV1wG
   nTW9uK6CpgdAw9Sv2w7hR2clY9tSzYncTLiqkPlSh9Qtwb10DBssbN2Gq
   h4szxrqbZu4+mhGB81LI6+UbCETrYwcXOV88LLVjDLDu8YNgxs109/v0e
   M0Xfwf3hkeQ3wqOUU0geX5RlUgOKUI9hp5fPQVEFmDenEzERvoK3nm/6T
   FxAqfBQKp1AJhGUs5MK7no1xTnaXhpBAGXRmYYVVWMelmQpypVrA4Ldql
   g==;
X-CSE-ConnectionGUID: 8DmUpQ45Qh+WTuOoDDdtvA==
X-CSE-MsgGUID: OW0c0FndQP+9sS82xEP6RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="42745801"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="42745801"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 02:34:51 -0700
X-CSE-ConnectionGUID: 0Fen4lgZRp6H3IhGQ8OvOQ==
X-CSE-MsgGUID: SFl6ENtfTHm7C6s1bpaAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="158096101"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Jul 2025 02:34:46 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uchUJ-000EVf-34;
	Fri, 18 Jul 2025 09:34:43 +0000
Date: Fri, 18 Jul 2025 17:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 09/26] media: v4l2-dev: Add
 video_device_context_from_file()
Message-ID: <202507181702.W5iinHRF-lkp@intel.com>
References: <20250717-multicontext-mainline-2025-v1-9-81ac18979c03@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-multicontext-mainline-2025-v1-9-81ac18979c03@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d968e50b5c26642754492dea23cbd3592bde62d8]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-mc-Add-per-file-handle-data-support/20250717-190546
base:   d968e50b5c26642754492dea23cbd3592bde62d8
patch link:    https://lore.kernel.org/r/20250717-multicontext-mainline-2025-v1-9-81ac18979c03%40ideasonboard.com
patch subject: [PATCH 09/26] media: v4l2-dev: Add video_device_context_from_file()
config: x86_64-buildonly-randconfig-004-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181702.W5iinHRF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181702.W5iinHRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181702.W5iinHRF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-dev.c:1184:1: warning: no previous prototype for function 'video_device_context_from_file' [-Wmissing-prototypes]
    1184 | video_device_context_from_file(struct file *filp, struct video_device *vfd)
         | ^
   drivers/media/v4l2-core/v4l2-dev.c:1183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1183 | struct video_device_context *
         | ^
         | static 
   1 warning generated.


vim +/video_device_context_from_file +1184 drivers/media/v4l2-core/v4l2-dev.c

  1182	
  1183	struct video_device_context *
> 1184	video_device_context_from_file(struct file *filp, struct video_device *vfd)
  1185	{
  1186		struct v4l2_fh *vfh =
  1187			test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? filp->private_data
  1188								    : NULL;
  1189	
  1190		/* If the file handle has been bound to a context return it. */
  1191		if (vfh && vfh->context)
  1192			return vfh->context;
  1193	
  1194		return vfd->default_context;
  1195	}
  1196	EXPORT_SYMBOL_GPL(video_device_context_from_file);
  1197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


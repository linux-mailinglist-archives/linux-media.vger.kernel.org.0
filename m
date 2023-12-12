Return-Path: <linux-media+bounces-2270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 574AE80F1E5
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 17:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A6882817C1
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 16:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107DD77656;
	Tue, 12 Dec 2023 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCm1mo8W"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED6111D
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 08:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702397283; x=1733933283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cFBdoTZ5fhsZheQJNeg0clfOcDH5a1bwW/O5K1uAiS8=;
  b=BCm1mo8WKTHzfbozale/2BhFjxUa47at/2U5UB6nB7tVKHJVQlbeVgro
   E6whGAV7FfXXbX2u9P15lGGsDGt3O3sJni8jUdc8igZ2tBXTiuv0opUlV
   FJeVMVUcFmwrK2rH+wh3IU2RWhtBDA2wTNkGBskoYxkktXorjsDz3HfTs
   16RP6JIHm2UX2HPOZyTzGRGtzAVuXRXjhAitFP+bNGKksYwk72/A3MZ7G
   VGDcHPkvxj6twlRoqC+z2PDKUf2b3Lgxno+89RpYdkwubMtAEkSLvCEI7
   edC5BRbc47FfZ4hb1h64b9pGLC0k47n+uCAgYuR4xFEP+QHE4LrdU5uB7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="379824183"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="379824183"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 08:08:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="843967766"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="843967766"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Dec 2023 08:07:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rD5IW-000JOF-2k;
	Tue, 12 Dec 2023 16:07:52 +0000
Date: Wed, 13 Dec 2023 00:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 1/4] media: v4l: Add a helper for setting up
 link-frequencies control
Message-ID: <202312122344.1l0j6bV6-lkp@intel.com>
References: <20231211140658.366268-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211140658.366268-2-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master sailus-media-tree/streams linus/master v6.7-rc5 next-20231212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-Add-a-helper-for-setting-up-link-frequencies-control/20231211-220844
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231211140658.366268-2-sakari.ailus%40linux.intel.com
patch subject: [PATCH 1/4] media: v4l: Add a helper for setting up link-frequencies control
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312122344.1l0j6bV6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312122344.1l0j6bV6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/media/v4l2-common:6: ./include/media/v4l2-common.h:567: WARNING: Unexpected indentation.
>> Documentation/driver-api/media/v4l2-common:6: ./include/media/v4l2-common.h:568: WARNING: Block quote ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


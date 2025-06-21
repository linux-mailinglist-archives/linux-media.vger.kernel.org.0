Return-Path: <linux-media+bounces-35536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7317EAE2C5C
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 22:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B6FD1896942
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 20:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1789527056E;
	Sat, 21 Jun 2025 20:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzkGMH+U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915B4270554
	for <linux-media@vger.kernel.org>; Sat, 21 Jun 2025 20:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750538143; cv=none; b=XsmSIU6qguKsa1gNGf5ZuKGaOdr7lswc5F9GqMhUE2B8Fq6SOCYXtHlSj5cpH+lPiavmGLWrsc/jK+EX5qMouNV9dTVDPfJxqVZ9Gd/BeFJzZxzn2OycHYJMusAYrqcOUOmUP8uj1zqYcp91xJAtRslsiXfxXndFIwly3U3v9UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750538143; c=relaxed/simple;
	bh=f+LFnI/d1zF0JXR6ojz+ynRiU5kOC/8tsDM0Fm/pdh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ggibC/jdOyzlTb4W3T4MbR0+f943+Z2wAWOEnEg8l00zgy6feFyFbmXEmz177l10k5DD9kMVFtL1Tj1canfNs9rCi8Bk98a8Jfp5MrMclH6sY64AcRHX/wGWi1dCq9y3puvtTlOAO/kO7tJivdtS20anFOmaVDWx0R3yy3znk24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzkGMH+U; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750538140; x=1782074140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f+LFnI/d1zF0JXR6ojz+ynRiU5kOC/8tsDM0Fm/pdh0=;
  b=RzkGMH+ULxkZlOc6boVacqgOjw238DVf8v/UfUwEM4T5ejHHOFvG0qFd
   kwxxoCovTZt9HYHa5k5CXy+v9daOKiyEpN/e4edflvkjmY306z2qHvpO5
   RNHPoKkpxoGdWjeqirLsVyCBxIiis5+U8BKKkz/bNThXZW63MfZIPkEdC
   daIhBfcmJMvBQG/ONtpa96+CQhgOK11BUr7ObS5AdNz6+kGdCdVIEYBPs
   fe/4MMjO4AXj7K9/SSxnC+Vwk2k7yxWdeYHDT9wDYe23dAYZ7a/J/EHlX
   CjEHNp7Mmssmk0kRGtGJQIMI4i8XTMxlqDyaRbHwPYXNY2DRQvdf477lU
   Q==;
X-CSE-ConnectionGUID: 8LthDGDFQWyBEoKk8Akqhg==
X-CSE-MsgGUID: ytLW5KnmQl+t0ISxEEDk1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="64136977"
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="64136977"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 13:35:40 -0700
X-CSE-ConnectionGUID: FJfPLYbeTheLwQuP1s4XEA==
X-CSE-MsgGUID: B825FYs9QsKAw4XDQ7Ir9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="182082154"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jun 2025 13:35:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uT4w4-000Mqs-2v;
	Sat, 21 Jun 2025 20:35:36 +0000
Date: Sun, 22 Jun 2025 04:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 74/78] drivers/media/i2c/imx219.c:898:3:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202506220450.mD3aWxjx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   2eb7b0a1567fd0da91e70f762d8cf94af1ffd7f9
commit: 65722cd911646712bb021c04b233c1f79f788067 [74/78] media: imx219: Add support for generic raw formats
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250622/202506220450.mD3aWxjx-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506220450.mD3aWxjx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506220450.mD3aWxjx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx219.c:898:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     898 |                 const u32 img_codes[] = {
         |                 ^
   1 warning generated.


vim +898 drivers/media/i2c/imx219.c

   889	
   890	static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
   891					 struct v4l2_subdev_state *state,
   892					 struct v4l2_subdev_mbus_code_enum *code)
   893	{
   894		struct imx219 *imx219 = to_imx219(sd);
   895	
   896		switch (code->pad) {
   897		case IMX219_PAD_IMAGE:
 > 898			const u32 img_codes[] = {
   899				IMX219_NATIVE_FORMAT,
   900				MEDIA_BUS_FMT_RAW_10,
   901			};
   902	
   903			/* The internal image pad is hardwired to the native format. */
   904			if (code->index > ARRAY_SIZE(img_codes))
   905				return -EINVAL;
   906	
   907			code->code = img_codes[code->index];
   908			return 0;
   909	
   910		case IMX219_PAD_EDATA:
   911			if (code->index > 0)
   912				return -EINVAL;
   913	
   914			code->code = MEDIA_BUS_FMT_META_8;
   915			return 0;
   916	
   917		case IMX219_PAD_SOURCE:
   918		default:
   919			break;
   920		}
   921	
   922		/*
   923		 * On the source pad, the sensor supports multiple image raw formats
   924		 * with different bit depths. The embedded data format bit depth
   925		 * follows the image stream.
   926		 */
   927		if (code->stream == IMX219_STREAM_IMAGE) {
   928			u32 format;
   929	
   930			if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4) {
   931				u32 idx = code->index - ARRAY_SIZE(imx219_mbus_formats);
   932				if (idx >= ARRAY_SIZE(imx219_mbus_formats_raw))
   933					return -EINVAL;
   934	
   935				format = imx219_mbus_formats_raw[idx];
   936			} else {
   937				format = imx219_mbus_formats[code->index * 4];
   938			}
   939			code->code = imx219_get_format_code(imx219, format);
   940		} else {
   941			struct v4l2_mbus_framefmt *fmt;
   942	
   943			if (code->index > 0)
   944				return -EINVAL;
   945	
   946			fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
   947							   IMX219_STREAM_EDATA);
   948			code->code = fmt->code;
   949		}
   950	
   951		return 0;
   952	}
   953	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


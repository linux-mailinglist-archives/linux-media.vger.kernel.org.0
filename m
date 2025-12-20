Return-Path: <linux-media+bounces-49238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 427ECCD3295
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 16:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF22A3011EE4
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 15:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FE72BDC02;
	Sat, 20 Dec 2025 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XszXLICy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FDA19C542
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246304; cv=none; b=W7JAhOarFnMcDSrXWBSlDtPryqjATJ78MLq3N+h9rmub4FYUvUsSH6kREKCInAp6Hy6sTPmXU4tDdOIVM2eiqkpKXtUMm3f+yb96bGo/AGDT6XEflptHTlnzoU1f7kwcO19/cgaj/nMmMYixHF7NvKhw8Tg4uk0kNGFmIfuDFcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246304; c=relaxed/simple;
	bh=Z8eNyISAIDcDV5gYAE55WRNEI/kbIRupZx3wU7u8+ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBrMlSnXjcUat4yS3Orjhl2z7O2Gzs5X2TC1Vh21CjyDzot29KHwcOTroL3p0ge1coGIJUGbKFPNwGol26U8YjPNTjzWhdde4E4ncUTEPvp8EozPmI/r0swAy2uKlvthm7u600xzwlDMWBWRbzR3pzVzEMp2xuILF7gsptjv5L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XszXLICy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766246303; x=1797782303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z8eNyISAIDcDV5gYAE55WRNEI/kbIRupZx3wU7u8+ko=;
  b=XszXLICyBTnRHi9ydlMT+z6PKKWmRXf/jIJ5RrbdoUR0XV2b/YzQMm7l
   NCmal3gOT4T02KnKUM4El9xCvvgoVnpbkdlnT2REhtq3JrtJEzU9d7Leu
   SQYQgQgZt4hRR7cRETrmoOJvYT5D937bpkmenuQ++Dgt5Gt04CtyWyUkz
   ThduOf9VmWP34qr8DdTJq7qy02dEodu70+emzlz7p0HiM0nBc8VFtAl7I
   QDVIys5+ZnaymMZ3Y30Z5dpVi9n9erxkS+GkvjRbieoP/mukOx0ZYWtZY
   Oa1R1xJynewckTDGUPweDYwahV8+y7esa9NXF1jz+fvaXO64QqP3PZzYF
   w==;
X-CSE-ConnectionGUID: xoVa60T0Su6hjk7sfL3GEw==
X-CSE-MsgGUID: MO7AB/0HTk6EOrOj5nYa9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70748135"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70748135"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:58:23 -0800
X-CSE-ConnectionGUID: Sc4JhSkdQheQoRCzAT4nfg==
X-CSE-MsgGUID: 7KnjS8evQ2y2W6lfqtj/bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199642949"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2025 07:58:21 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzLX-000000004oX-1J7k;
	Sat, 20 Dec 2025 15:58:19 +0000
Date: Sat, 20 Dec 2025 23:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: Walter Werner SCHNEIDER <contact@schnwalter.eu>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Walter Werner SCHNEIDER <contact@schnwalter.eu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 1/2] media: i2c: Add ov2732 image sensor driver
Message-ID: <202512202343.sZsxwdcf-lkp@intel.com>
References: <20251218-ov2732-driver-v1-1-0ceef92c4016@schnwalter.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-ov2732-driver-v1-1-0ceef92c4016@schnwalter.eu>

Hi Walter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Walter-Werner-SCHNEIDER/media-i2c-Add-ov2732-image-sensor-driver/20251218-062039
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251218-ov2732-driver-v1-1-0ceef92c4016%40schnwalter.eu
patch subject: [PATCH 1/2] media: i2c: Add ov2732 image sensor driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202343.sZsxwdcf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202343.sZsxwdcf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202343.sZsxwdcf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ov2732.c: In function 'ov2732_set_fmt':
>> drivers/media/i2c/ov2732.c:282:13: warning: variable 'prev_line_len' set but not used [-Wunused-but-set-variable]
     282 |         u32 prev_line_len;
         |             ^~~~~~~~~~~~~


vim +/prev_line_len +282 drivers/media/i2c/ov2732.c

   274	
   275	static int ov2732_set_fmt(struct v4l2_subdev *sd,
   276				  struct v4l2_subdev_state *state,
   277				  struct v4l2_subdev_format *fmt)
   278	{
   279		struct ov2732 *ov2732 = to_ov2732(sd);
   280		const struct ov2732_mode *mode;
   281		struct v4l2_mbus_framefmt *format;
 > 282		u32 prev_line_len;
   283		s64 vblank_def;
   284	
   285		format = v4l2_subdev_state_get_format(state, 0);
   286		prev_line_len = format->width + ov2732->hblank->val;
   287	
   288		mode = v4l2_find_nearest_size(supported_modes,
   289					      ARRAY_SIZE(supported_modes),
   290					      width, height,
   291					      fmt->format.width, fmt->format.height);
   292	
   293		fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
   294		fmt->format.width = mode->width;
   295		fmt->format.height = mode->height;
   296		fmt->format.field = V4L2_FIELD_NONE;
   297	
   298		*v4l2_subdev_state_get_format(state, fmt->pad) = fmt->format;
   299	
   300		if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
   301			vblank_def = mode->vts - mode->height;
   302			__v4l2_ctrl_modify_range(ov2732->vblank,
   303						 vblank_def,
   304						 OV2732_VTS_MAX - mode->height,
   305						 1, vblank_def);
   306		}
   307	
   308		return 0;
   309	}
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-39193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3953B1F4B5
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 15:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5441B3BB556
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 13:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0924269811;
	Sat,  9 Aug 2025 13:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQwg1Ese"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364451DE8AE;
	Sat,  9 Aug 2025 13:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754745467; cv=none; b=A6rekSDL+Izvgt7Y5DmQfJyP8v6Qx/Vo8qer0lfUj0O7E5n8WW/bInbB1V2a3P6+OPZcS8OYuyCQKo3b029lcHM/DD77uulSCtM94NAr5nMGAzvggKJTRZAUO4VPjXoIm/dXzZdVlOahEsy5e0aejDz9LvHKd3SAV1z19q7JeEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754745467; c=relaxed/simple;
	bh=RbSGZsdpzlkDff1hVs81RD6N3zPNN/x5VL/ZTxrfsUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VegPU3XsUhbCZj2K/m2tWlI3/kcQ14XszBBoiwKEGlwqFx5FxTr+y1P8C+/cuZMYgMDEOlIRqyl3NmAexE+FHPXZiRZ6zX4GExZL85lZoob9EL/Sp4L8RanPh3HDLd8h0eVDS8zLbiF9Q9SQ6MocU9rbvF6RMBRWGZiaHOx2vdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQwg1Ese; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754745466; x=1786281466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RbSGZsdpzlkDff1hVs81RD6N3zPNN/x5VL/ZTxrfsUM=;
  b=IQwg1EseZ1nlLx8XDpGgrs/9GAGXNGlg477NQfpkFmlO2c+wF5vtDrZn
   jlsUGW5iiTqlygooGi1jyauHeljlW1J0Qx27LROs9pYkHExN4xneoz50r
   e4of//wXyFVrn0HyRkCAJuvprALJy+WtP5sMa2ssRlfZIJtQWkODZhQY0
   oMpfKXGx6ufS96W78458olnt8A1fFYV3K8buSUT0BNytTJn5nwgOgufbB
   0cyCYQXN50dQ3bNBfTT7BDHMnN7EDzzffcerFIW0ngO0rivfkJpQMGGpB
   TI9g2UVtqV7mA7aMX1l7zFD/5jY+BZxzP9j2IL8EBoWHOAaobTlp0O5gO
   Q==;
X-CSE-ConnectionGUID: tIIXKegfSRuYQolX6z9UTw==
X-CSE-MsgGUID: qbJ9+qRiQ32LAljDSl46ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="67338566"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="67338566"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 06:17:45 -0700
X-CSE-ConnectionGUID: kuu25EDyQBWNUhQnZy+QVw==
X-CSE-MsgGUID: N+S8Ygg5TUKLxpj6LWRDqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169746865"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 09 Aug 2025 06:17:42 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukjS7-0004o0-2h;
	Sat, 09 Aug 2025 13:17:39 +0000
Date: Sat, 9 Aug 2025 21:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 11/12] media: rkvdec: Add HEVC support for the VDPU381
 variant
Message-ID: <202508092052.AFrUDe6V-lkp@intel.com>
References: <20250808200340.156393-12-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808200340.156393-12-detlev.casanova@collabora.com>

Hi Detlev,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master next-20250808]
[cannot apply to rockchip/for-next sailus-media-tree/master sailus-media-tree/streams v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/media-rkvdec-Switch-to-using-structs-instead-of-writel/20250809-041049
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250808200340.156393-12-detlev.casanova%40collabora.com
patch subject: [PATCH v2 11/12] media: rkvdec: Add HEVC support for the VDPU381 variant
config: i386-buildonly-randconfig-005-20250809 (https://download.01.org/0day-ci/archive/20250809/202508092052.AFrUDe6V-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508092052.AFrUDe6V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508092052.AFrUDe6V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c:119:39: error: field has incomplete type 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
     119 |         struct v4l2_ctrl_hevc_ext_sps_st_rps    st_cache;
         |                                                 ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   1 error generated.
--
>> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:261:23: error: subscript of pointer to incomplete type 'const struct v4l2_ctrl_hevc_ext_sps_lt_rps'
     261 |                         run->ext_sps_lt_rps[i].lt_ref_pic_poc_lsb_sps;
         |                         ~~~~~~~~~~~~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:69:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_lt_rps'
      69 |         const struct v4l2_ctrl_hevc_ext_sps_lt_rps      *ext_sps_lt_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:263:26: error: subscript of pointer to incomplete type 'const struct v4l2_ctrl_hevc_ext_sps_lt_rps'
     263 |                         !!(run->ext_sps_lt_rps[i].flags & V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT);
         |                            ~~~~~~~~~~~~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:69:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_lt_rps'
      69 |         const struct v4l2_ctrl_hevc_ext_sps_lt_rps      *ext_sps_lt_rps;
         |                      ^
>> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:263:38: error: use of undeclared identifier 'V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT'
     263 |                         !!(run->ext_sps_lt_rps[i].flags & V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT);
         |                                                           ^
>> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:299:77: error: subscript of pointer to incomplete type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     299 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_data = &run->ext_sps_st_rps[idx];
         |                                                                 ~~~~~~~~~~~~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
>> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:310:38: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     310 |         ref_rps_idx = st_rps_idx - (rps_data->delta_idx_minus1 + 1); /* 7-59 */
         |                                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:311:31: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     311 |         delta_rps = (1 - 2 * rps_data->delta_rps_sign) *
         |                              ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:312:15: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     312 |                    (rps_data->abs_delta_rps_minus1 + 1); /* 7-60 */
         |                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:317:41: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     317 |                 used_by_curr_pic_flag[j] = !!(rps_data->used_by_curr_pic & (1 << j));
         |                                               ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:318:34: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     318 |                 use_delta_flag[j] = !!(rps_data->use_delta_flag & (1 << j));
         |                                        ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:376:77: error: subscript of pointer to incomplete type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     376 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_data = &run->ext_sps_st_rps[idx];
         |                                                                 ~~~~~~~~~~~~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:381:38: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     381 |         st_rps->num_negative_pics = rps_data->num_negative_pics;
         |                                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:383:38: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     383 |         st_rps->num_positive_pics = rps_data->num_positive_pics;
         |                                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:387:47: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     387 |                 st_rps->used_by_curr_pic_s0[i] = !!(rps_data->used_by_curr_pic & (1 << i));
         |                                                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:391:40: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     391 |                         st_rps->delta_poc_s0[i] = -(rps_data->delta_poc_s0_minus1[i] + 1);
         |                                                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:396:14: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     396 |                                 (rps_data->delta_poc_s0_minus1[i] + 1);
         |                                  ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:402:47: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     402 |                 st_rps->used_by_curr_pic_s1[j] = !!(rps_data->used_by_curr_pic & (1 << (i + j)));
         |                                                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:406:38: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     406 |                         st_rps->delta_poc_s1[j] = rps_data->delta_poc_s1_minus1[j] + 1;
         |                                                   ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:411:14: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     411 |                                 (rps_data->delta_poc_s1_minus1[j] + 1);
         |                                  ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
>> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:427:42: error: invalid application of 'sizeof' to an incomplete type 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
     427 |         if (!memcmp(cache, run->ext_sps_st_rps, sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps)))
         |                                                 ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +119 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c

   115	
   116	struct rkvdec_hevc_ctx {
   117		struct rkvdec_aux_buf			priv_tbl;
   118		struct v4l2_ctrl_hevc_scaling_matrix	scaling_matrix_cache;
 > 119		struct v4l2_ctrl_hevc_ext_sps_st_rps	st_cache;
   120		struct rkvdec_vdpu381_regs_hevc		regs;
   121	};
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


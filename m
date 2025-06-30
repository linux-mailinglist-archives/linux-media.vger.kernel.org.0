Return-Path: <linux-media+bounces-36334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF44CAEE729
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 21:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEB2E3B675B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 19:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A679728EBE0;
	Mon, 30 Jun 2025 19:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZbTwiYx2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D073379D2;
	Mon, 30 Jun 2025 19:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310328; cv=none; b=s/opFbh76UkQ2AiZJAqI3JNhsadODfZrb9U86C0ML+2cHBReqTQJCA5DrWB4Rs49m1yM4gkJSfBP6XCd/lQUCeHAKpbqfVWXqwTwSAoCPGwqC8p6LjcCyLnPP1o5yZ9ikMrvzIAMiAjHgxpQBalEW2RakIW2yx3ce6SnZxsKuCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310328; c=relaxed/simple;
	bh=psDLQgMF9qmmKcTRLvKhuLBjMrAT6NjMMMj08Enkoe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMMSQG8eAVcd4dHI+7HNdz9ioxR2pxK8FJdBgnS8d1+luze9DL9CUi4VXyGc/GtBCskNPTWwaHiRcfOLrvMxyKbto3yTPPtojx1EalrFLOkTdcDp8HcQ2xUQk2fqiwko7fnoNEzVGRZbBjcdWzaj++JaJ8USmB/4FtxVCkiQIBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZbTwiYx2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751310326; x=1782846326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=psDLQgMF9qmmKcTRLvKhuLBjMrAT6NjMMMj08Enkoe0=;
  b=ZbTwiYx2smRfzD9EBckXpA3zpPxRrS817lq9C7xRGBL5rmpIjhKT8Xth
   blwHPJspOJvVnu07hZWvzWvjp5LZ2fCx5W3Bm/5RGsfCPb5Dgr66ynJIL
   O9M/yHq2fOzT1e1r6WMJ+4HDdo3pCJtFLqfLsBj4XRToX9+JXhMfMrYOE
   BqYKd7CRa5dPCIBdaU1wKV/0UlwboUhzpx4EL9jc/ABIjOVVJrvw5a0q7
   dKtSDYe1KCxqykPRyElRyrvppefKzdOp1oGkZfMc4WFKbDQPIrAiWO2YX
   cgj7D6WP6xJTBU+UbKuHTzIxglWHfUAJQRcUsZt6WhH7tesbfdK0yd5UU
   A==;
X-CSE-ConnectionGUID: l24jxXxKQpe7EOttL9/CNA==
X-CSE-MsgGUID: mnlCsX4hTyuSqr+i8uGPTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53510912"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="53510912"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 12:05:25 -0700
X-CSE-ConnectionGUID: SIxJ2dbvRR6/ih/kUFyP6g==
X-CSE-MsgGUID: Yd78Ci1SQt62sNi0hQN41Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="157591189"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jun 2025 12:05:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWJod-000ZHu-1F;
	Mon, 30 Jun 2025 19:05:19 +0000
Date: Tue, 1 Jul 2025 03:04:44 +0800
From: kernel test robot <lkp@intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v6] staging: media: atomisp: apply clang-format and fix
 checkpatch.pl errors
Message-ID: <202507010257.2IAupxkl-lkp@intel.com>
References: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>

Hi LiangCheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 67a993863163cb88b1b68974c31b0d84ece4293e]

url:    https://github.com/intel-lab-lkp/linux/commits/LiangCheng-Wang/staging-media-atomisp-apply-clang-format-and-fix-checkpatch-pl-errors/20250627-230151
base:   67a993863163cb88b1b68974c31b0d84ece4293e
patch link:    https://lore.kernel.org/r/20250627-bar-v6-1-b22b5ea3ced0%40gmail.com
patch subject: [PATCH v6] staging: media: atomisp: apply clang-format and fix checkpatch.pl errors
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250701/202507010257.2IAupxkl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010257.2IAupxkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010257.2IAupxkl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/staging/media/atomisp//pci/ia_css_acc_types.h:16,
                    from drivers/staging/media/atomisp//pci/ia_css_pipe_public.h:20,
                    from drivers/staging/media/atomisp/pci/sh_css_legacy.h:14,
                    from drivers/staging/media/atomisp/pci/atomisp_internal.h:24,
                    from drivers/staging/media/atomisp/pci/atomisp_cmd.h:19,
                    from drivers/staging/media/atomisp/pci/atomisp_cmd.c:26:
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/runtime/isp_param/interface/ia_css_isp_param_types.h:69:17: note: in expansion of macro 'CSS_ALIGN'
      69 |                 CSS_ALIGN(struct ia_css_memory_offsets *param, 8);
         |                 ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/runtime/isp_param/interface/ia_css_isp_param_types.h:74:17: note: in expansion of macro 'CSS_ALIGN'
      74 |                 CSS_ALIGN(void *ptr, 8);
         |                 ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/ia_css_acc_types.h:92:9: note: in expansion of macro 'CSS_ALIGN'
      92 |         CSS_ALIGN(
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/ia_css_acc_types.h:202:9: note: in expansion of macro 'CSS_ALIGN'
     202 |         CSS_ALIGN(u32 id, 8); /* IA_CSS_BINARY_ID_* */
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/ia_css_acc_types.h:276:9: note: in expansion of macro 'CSS_ALIGN'
     276 |         CSS_ALIGN(s32 num_output_formats, 8);
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/ia_css_acc_types.h:365:9: note: in expansion of macro 'CSS_ALIGN'
     365 |         CSS_ALIGN(u32 type, 8);
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/sh_css_internal.h:687:9: note: in expansion of macro 'CSS_ALIGN'
     687 |         CSS_ALIGN(u64 cookie_ptr,
         |         ^~~~~~~~~
   In file included from include/linux/bits.h:32,
                    from include/linux/gfp_types.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/firmware.h:8,
                    from drivers/staging/media/atomisp/pci/atomisp_cmd.c:10:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct sh_css_hmm_buffer) == SIZE_OF_SH_CSS_HMM_BUFFER_STRUCT"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/sh_css_internal.h:710:1: note: in expansion of macro 'static_assert'
     710 | static_assert(sizeof(struct sh_css_hmm_buffer) ==
         | ^~~~~~~~~~~~~
   In file included from drivers/staging/media/atomisp//pci/hive_isp_css_include/vmem.h:25,
                    from drivers/staging/media/atomisp//pci/isp/kernels/ob/ob_1.0/ia_css_ob_param.h:11,
                    from drivers/staging/media/atomisp/pci/sh_css_params.h:29,
                    from drivers/staging/media/atomisp/pci/atomisp_tables.h:12,
                    from drivers/staging/media/atomisp/pci/atomisp_cmd.c:32:
>> drivers/staging/media/atomisp//pci/hive_isp_css_common/host/vmem_local.h:16:26: error: expected specifier-qualifier-list before '(' token
      16 | #define VMEM_ARRAY(x, s) (t_vmem_elem x[(s) / ISP_NWAY][ISP_NWAY])
         |                          ^
   drivers/staging/media/atomisp//pci/isp/kernels/ob/ob_1.0/ia_css_ob_param.h:36:9: note: in expansion of macro 'VMEM_ARRAY'
      36 |         VMEM_ARRAY(vmask, OBAREA_MASK_SIZE);
         |         ^~~~~~~~~~
--
   In file included from drivers/staging/media/atomisp/pci/ia_css_acc_types.h:16,
                    from drivers/staging/media/atomisp/pci/ia_css.h:17,
                    from drivers/staging/media/atomisp/pci/atomisp_compat_css20.h:13,
                    from drivers/staging/media/atomisp/pci/atomisp_compat.h:11,
                    from drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:16:
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h:69:17: note: in expansion of macro 'CSS_ALIGN'
      69 |                 CSS_ALIGN(struct ia_css_memory_offsets *param, 8);
         |                 ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h:74:17: note: in expansion of macro 'CSS_ALIGN'
      74 |                 CSS_ALIGN(void *ptr, 8);
         |                 ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp/pci/ia_css_acc_types.h:92:9: note: in expansion of macro 'CSS_ALIGN'
      92 |         CSS_ALIGN(
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp/pci/ia_css_acc_types.h:202:9: note: in expansion of macro 'CSS_ALIGN'
     202 |         CSS_ALIGN(u32 id, 8); /* IA_CSS_BINARY_ID_* */
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp/pci/ia_css_acc_types.h:276:9: note: in expansion of macro 'CSS_ALIGN'
     276 |         CSS_ALIGN(s32 num_output_formats, 8);
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp/pci/ia_css_acc_types.h:365:9: note: in expansion of macro 'CSS_ALIGN'
     365 |         CSS_ALIGN(u32 type, 8);
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/sh_css_internal.h:687:9: note: in expansion of macro 'CSS_ALIGN'
     687 |         CSS_ALIGN(u64 cookie_ptr,
         |         ^~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:103,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from include/media/v4l2-dev.h:13,
                    from drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:8:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct sh_css_hmm_buffer) == SIZE_OF_SH_CSS_HMM_BUFFER_STRUCT"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/sh_css_internal.h:710:1: note: in expansion of macro 'static_assert'
     710 | static_assert(sizeof(struct sh_css_hmm_buffer) ==
         | ^~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: In function 'atomisp_css_dump_blob_infor':
>> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:3330:37: error: 'struct ia_css_fw_info' has no member named 'type'
    3330 |                 switch (bd[i].header.type) {
         |                                     ^
   In file included from include/linux/printk.h:616:
   drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:3334:74: error: 'struct ia_css_fw_info' has no member named 'type'
    3334 |                                 i + NUM_OF_SPS, fw_type_name[bd[i].header.type],
         |                                                                          ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:3332:25: note: in expansion of macro 'dev_dbg'
    3332 |                         dev_dbg(isp->dev,
         |                         ^~~~~~~
>> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:3335:62: error: 'struct ia_css_fw_info' has no member named 'info'
    3335 |                                 fw_acc_type_name[bd[i].header.info.isp.type],
         |                                                              ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:3332:25: note: in expansion of macro 'dev_dbg'
    3332 |                         dev_dbg(isp->dev,
         |                         ^~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:3336:45: error: 'struct ia_css_fw_info' has no member named 'info'
    3336 |                                 bd[i].header.info.isp.sp.id, bd[i].name);
         |                                             ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:3332:25: note: in expansion of macro 'dev_dbg'
    3332 |                         dev_dbg(isp->dev,
         |                         ^~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:3340:74: error: 'struct ia_css_fw_info' has no member named 'type'
    3340 |                                 i + NUM_OF_SPS, fw_type_name[bd[i].header.type],
         |                                                                          ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:3339:25: note: in expansion of macro 'dev_dbg'
    3339 |                         dev_dbg(isp->dev, "Num%2d type %s, name is %s\n",
         |                         ^~~~~~~
--
   In file included from drivers/staging/media/atomisp//pci/ia_css_acc_types.h:16,
                    from drivers/staging/media/atomisp//pci/ia_css_pipe_public.h:20,
                    from drivers/staging/media/atomisp/pci/sh_css_legacy.h:14,
                    from drivers/staging/media/atomisp/pci/atomisp_internal.h:24,
                    from drivers/staging/media/atomisp/pci/atomisp_cmd.h:19,
                    from drivers/staging/media/atomisp/pci/atomisp_csi2.c:10:
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/runtime/isp_param/interface/ia_css_isp_param_types.h:69:17: note: in expansion of macro 'CSS_ALIGN'
      69 |                 CSS_ALIGN(struct ia_css_memory_offsets *param, 8);
         |                 ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/runtime/isp_param/interface/ia_css_isp_param_types.h:74:17: note: in expansion of macro 'CSS_ALIGN'
      74 |                 CSS_ALIGN(void *ptr, 8);
         |                 ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/ia_css_acc_types.h:92:9: note: in expansion of macro 'CSS_ALIGN'
      92 |         CSS_ALIGN(
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/ia_css_acc_types.h:202:9: note: in expansion of macro 'CSS_ALIGN'
     202 |         CSS_ALIGN(u32 id, 8); /* IA_CSS_BINARY_ID_* */
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/ia_css_acc_types.h:276:9: note: in expansion of macro 'CSS_ALIGN'
     276 |         CSS_ALIGN(s32 num_output_formats, 8);
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/ia_css_acc_types.h:365:9: note: in expansion of macro 'CSS_ALIGN'
     365 |         CSS_ALIGN(u32 type, 8);
         |         ^~~~~~~~~
--
   In file included from drivers/staging/media/atomisp/pci/ia_css_acc_types.h:16,
                    from drivers/staging/media/atomisp/pci/ia_css.h:17,
                    from drivers/staging/media/atomisp/pci/atomisp_compat_css20.h:13,
                    from drivers/staging/media/atomisp/pci/atomisp_compat.h:11,
                    from drivers/staging/media/atomisp/pci/atomisp_drvfs.c:12:
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h:69:17: note: in expansion of macro 'CSS_ALIGN'
      69 |                 CSS_ALIGN(struct ia_css_memory_offsets *param, 8);
         |                 ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h:74:17: note: in expansion of macro 'CSS_ALIGN'
      74 |                 CSS_ALIGN(void *ptr, 8);
         |                 ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp/pci/ia_css_acc_types.h:92:9: note: in expansion of macro 'CSS_ALIGN'
      92 |         CSS_ALIGN(
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp/pci/ia_css_acc_types.h:202:9: note: in expansion of macro 'CSS_ALIGN'
     202 |         CSS_ALIGN(u32 id, 8); /* IA_CSS_BINARY_ID_* */
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp/pci/ia_css_acc_types.h:276:9: note: in expansion of macro 'CSS_ALIGN'
     276 |         CSS_ALIGN(s32 num_output_formats, 8);
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp/pci/ia_css_acc_types.h:365:9: note: in expansion of macro 'CSS_ALIGN'
     365 |         CSS_ALIGN(u32 type, 8);
         |         ^~~~~~~~~
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:23:25: error: expected specifier-qualifier-list before '(' token
      23 | #define CSS_ALIGN(d, a) (d __attribute__((aligned(a))))
         |                         ^
   drivers/staging/media/atomisp//pci/sh_css_internal.h:687:9: note: in expansion of macro 'CSS_ALIGN'
     687 |         CSS_ALIGN(u64 cookie_ptr,
         |         ^~~~~~~~~
   In file included from include/linux/bits.h:32,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/staging/media/atomisp/pci/atomisp_drvfs.c:8:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct sh_css_hmm_buffer) == SIZE_OF_SH_CSS_HMM_BUFFER_STRUCT"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/sh_css_internal.h:710:1: note: in expansion of macro 'static_assert'
     710 | static_assert(sizeof(struct sh_css_hmm_buffer) ==
         | ^~~~~~~~~~~~~
..


vim +3330 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c

0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29  3314  
250977de59340d2 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Andy Shevchenko       2020-06-26  3315  int atomisp_css_dump_blob_infor(struct atomisp_device *isp)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_compat_css20.c Mauro Carvalho Chehab 2020-04-19  3316  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_compat_css20.c Mauro Carvalho Chehab 2020-04-19  3317  	struct ia_css_blob_descr *bd = sh_css_blob_info;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_compat_css20.c Mauro Carvalho Chehab 2020-04-19  3318  	unsigned int i, nm = sh_css_num_binaries;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_compat_css20.c Mauro Carvalho Chehab 2020-04-19  3319  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_compat_css20.c Mauro Carvalho Chehab 2020-04-19  3320  	if (nm == 0)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_compat_css20.c Mauro Carvalho Chehab 2020-04-19  3321  		return -EPERM;
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/atomisp_compat_css20.c Mauro Carvalho Chehab 2020-04-19  3322  	if (!bd)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_compat_css20.c Mauro Carvalho Chehab 2020-04-19  3323  		return -EPERM;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_compat_css20.c Mauro Carvalho Chehab 2020-04-19  3324  
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29  3325  	/*
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29  3326  	 * The sh_css_load_firmware function discard the initial
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29  3327  	 * "SPS" binaries
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29  3328  	 */
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29  3329  	for (i = 0; i < sh_css_num_binaries - NUM_OF_SPS; i++) {
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29 @3330  		switch (bd[i].header.type) {
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29  3331  		case ia_css_isp_firmware:
19a0f50c655afde drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          LiangCheng Wang       2025-06-27  3332  			dev_dbg(isp->dev,
19a0f50c655afde drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          LiangCheng Wang       2025-06-27  3333  				"Num%2d type %s (%s), binary id is %2d, name is %s\n",
19a0f50c655afde drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          LiangCheng Wang       2025-06-27  3334  				i + NUM_OF_SPS, fw_type_name[bd[i].header.type],
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29 @3335  				fw_acc_type_name[bd[i].header.info.isp.type],
19a0f50c655afde drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          LiangCheng Wang       2025-06-27  3336  				bd[i].header.info.isp.sp.id, bd[i].name);
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29  3337  			break;
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29  3338  		default:
250977de59340d2 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Andy Shevchenko       2020-06-26  3339  			dev_dbg(isp->dev, "Num%2d type %s, name is %s\n",
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29  3340  				i + NUM_OF_SPS, fw_type_name[bd[i].header.type],
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29  3341  				bd[i].name);
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29  3342  		}
0cd8726c26edd1d drivers/staging/media/atomisp/pci/atomisp_compat_css20.c          Mauro Carvalho Chehab 2020-05-29  3343  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_compat_css20.c Mauro Carvalho Chehab 2020-04-19  3344  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_compat_css20.c Mauro Carvalho Chehab 2020-04-19  3345  	return 0;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_compat_css20.c Mauro Carvalho Chehab 2020-04-19  3346  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_compat_css20.c Mauro Carvalho Chehab 2020-04-19  3347  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


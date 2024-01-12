Return-Path: <linux-media+bounces-3607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7290982B9F7
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 04:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 876E71C23FE7
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 03:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC371A73C;
	Fri, 12 Jan 2024 03:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nD8Rj2+t"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A001A72F
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 03:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705030303; x=1736566303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B75fP1xY2+JPpu6g9TkXBE+zjgCuEdpb/jDmti73nhA=;
  b=nD8Rj2+tb2bPDhCNE+lhA68h0RUF/QcHQ2A0dgZ5tGLX/C/iVxUzwALP
   75tgz/Pu9PYpWnwJyfusC6is4bt9uJHP33qWshDdlFO/wcK6/V8IHrxPS
   PRy3JE9K0K4wsRgraPcOShAbp/aHYFvUN4KxK22zFS5yaie4jNnmFL2bL
   y1Zr8zCmrR9ofaxqpWDQnMC8PZcsngSp5cHmcgvpsGHp6BkmnPCd9a/J/
   zVt2U24R9+XVO4RaQveD/PBV0So8qbCoiJ2WtJp6eWlWC+it3+22MGeP6
   WDJEfpib8QZmFCU+GqqjSsJq7DzYJwyVdIS7mU5tVD1jOKdCbKVUHvBFG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="485249322"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="485249322"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 19:31:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="775875874"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="775875874"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 11 Jan 2024 19:31:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rO8Gc-00091I-2F;
	Fri, 12 Jan 2024 03:31:34 +0000
Date: Fri, 12 Jan 2024 11:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
	senozhatsky@chromium.org, andreaskleist@gmail.com,
	bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 16/17] media: ipu6/isys: support line-based metadata
 capture support
Message-ID: <202401121120.4CiWmH5y-lkp@intel.com>
References: <20240111065531.2418836-17-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111065531.2418836-17-bingbu.cao@intel.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master linus/master v6.7 next-20240111]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/bingbu-cao-intel-com/media-intel-ipu6-add-IPU-auxiliary-devices/20240111-155551
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240111065531.2418836-17-bingbu.cao%40intel.com
patch subject: [PATCH v3 16/17] media: ipu6/isys: support line-based metadata capture support
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240112/202401121120.4CiWmH5y-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401121120.4CiWmH5y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401121120.4CiWmH5y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:45:2: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_8'
      45 |         MEDIA_BUS_FMT_META_8,
         |         ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:46:2: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_10'
      46 |         MEDIA_BUS_FMT_META_10,
         |         ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:47:2: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_12'
      47 |         MEDIA_BUS_FMT_META_12,
         |         ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:48:2: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_16'
      48 |         MEDIA_BUS_FMT_META_16,
         |         ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:49:2: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_24'
      49 |         MEDIA_BUS_FMT_META_24,
         |         ^
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:406:13: error: call to undeclared function 'v4l2_subdev_state_get_stream_format'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     406 |         src_ffmt = v4l2_subdev_state_get_stream_format(state, sel->pad,
         |                    ^
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:406:11: error: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
     406 |         src_ffmt = v4l2_subdev_state_get_stream_format(state, sel->pad,
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     407 |                                                        sel->stream);
         |                                                        ~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:411:9: error: call to undeclared function 'v4l2_subdev_state_get_stream_crop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     411 |         crop = v4l2_subdev_state_get_stream_crop(state, sel->pad, sel->stream);
         |                ^
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:411:7: error: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
     411 |         crop = v4l2_subdev_state_get_stream_crop(state, sel->pad, sel->stream);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:456:9: error: call to undeclared function 'v4l2_subdev_state_get_stream_crop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     456 |         crop = v4l2_subdev_state_get_stream_crop(state, sel->pad, sel->stream);
         |                ^
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:456:7: error: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
     456 |         crop = v4l2_subdev_state_get_stream_crop(state, sel->pad, sel->stream);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:483:3: error: field designator 'init_cfg' does not refer to any field in type 'const struct v4l2_subdev_pad_ops'
     483 |         .init_cfg = ipu6_isys_subdev_init_cfg,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 errors generated.
--
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:88:3: error: use of undeclared identifier 'V4L2_META_FMT_GENERIC_8'
      88 |         {V4L2_META_FMT_GENERIC_8, 8, 8, MEDIA_BUS_FMT_META_8, 0},
         |          ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:88:34: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_8'
      88 |         {V4L2_META_FMT_GENERIC_8, 8, 8, MEDIA_BUS_FMT_META_8, 0},
         |                                         ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:89:3: error: use of undeclared identifier 'V4L2_META_FMT_GENERIC_CSI2_10'
      89 |         {V4L2_META_FMT_GENERIC_CSI2_10, 10, 10, MEDIA_BUS_FMT_META_10, 0},
         |          ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:89:42: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_10'
      89 |         {V4L2_META_FMT_GENERIC_CSI2_10, 10, 10, MEDIA_BUS_FMT_META_10, 0},
         |                                                 ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:90:3: error: use of undeclared identifier 'V4L2_META_FMT_GENERIC_CSI2_12'
      90 |         {V4L2_META_FMT_GENERIC_CSI2_12, 12, 12, MEDIA_BUS_FMT_META_12, 0},
         |          ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:90:42: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_12'
      90 |         {V4L2_META_FMT_GENERIC_CSI2_12, 12, 12, MEDIA_BUS_FMT_META_12, 0},
         |                                                 ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:91:3: error: use of undeclared identifier 'V4L2_META_FMT_GENERIC_CSI2_16'
      91 |         {V4L2_META_FMT_GENERIC_CSI2_16, 16, 16, MEDIA_BUS_FMT_META_16, 0},
         |          ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:91:42: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_16'
      91 |         {V4L2_META_FMT_GENERIC_CSI2_16, 16, 16, MEDIA_BUS_FMT_META_16, 0},
         |                                                 ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:92:3: error: use of undeclared identifier 'V4L2_META_FMT_GENERIC_CSI2_24'
      92 |         {V4L2_META_FMT_GENERIC_CSI2_24, 24, 24, MEDIA_BUS_FMT_META_24, 0},
         |          ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:92:42: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_24'
      92 |         {V4L2_META_FMT_GENERIC_CSI2_24, 24, 24, MEDIA_BUS_FMT_META_24, 0},
         |                                                 ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:122:18: error: invalid application of 'sizeof' to an incomplete type 'const struct ipu6_isys_pixelformat[]'
     122 |         for (i = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:148:18: error: invalid application of 'sizeof' to an incomplete type 'const struct ipu6_isys_pixelformat[]'
     148 |         if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:157:18: error: invalid application of 'sizeof' to an incomplete type 'const struct ipu6_isys_pixelformat[]'
     157 |         for (i = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:8: error: no member named 'width' in 'struct v4l2_meta_format'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |         ~~~~  ^
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:28: error: no member named 'width' in 'struct v4l2_meta_format'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                             ~~~~  ^
   include/linux/minmax.h:146:44: note: expanded from macro 'clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                                            ^~~
   include/linux/minmax.h:75:40: note: expanded from macro '__careful_clamp'
      75 |         __builtin_choose_expr(__is_constexpr((val) - (lo) + (hi)),      \
         |                                               ^~~
   include/linux/compiler.h:236:48: note: expanded from macro '__is_constexpr'
     236 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:28: error: no member named 'width' in 'struct v4l2_meta_format'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                             ~~~~  ^
   include/linux/minmax.h:146:44: note: expanded from macro 'clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                                            ^~~
   include/linux/minmax.h:76:11: note: expanded from macro '__careful_clamp'
      76 |                 __clamp(val, lo, hi),                                   \
         |                         ^~~
   include/linux/minmax.h:61:4: note: expanded from macro '__clamp'
      61 |         ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
         |           ^~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:28: error: no member named 'width' in 'struct v4l2_meta_format'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                             ~~~~  ^
   include/linux/minmax.h:146:44: note: expanded from macro 'clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                                            ^~~
   include/linux/minmax.h:76:11: note: expanded from macro '__careful_clamp'
      76 |                 __clamp(val, lo, hi),                                   \
         |                         ^~~
   include/linux/minmax.h:61:28: note: expanded from macro '__clamp'
      61 |         ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
         |                                   ^~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:28: error: no member named 'width' in 'struct v4l2_meta_format'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                             ~~~~  ^
   include/linux/minmax.h:146:44: note: expanded from macro 'clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                                            ^~~
   include/linux/minmax.h:76:11: note: expanded from macro '__careful_clamp'
      76 |                 __clamp(val, lo, hi),                                   \
         |                         ^~~
   include/linux/minmax.h:61:51: note: expanded from macro '__clamp'
      61 |         ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
         |                                                          ^~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:28: error: no member named 'width' in 'struct v4l2_meta_format'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                             ~~~~  ^
   include/linux/minmax.h:146:44: note: expanded from macro 'clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                                            ^~~
   include/linux/minmax.h:77:16: note: expanded from macro '__careful_clamp'
      77 |                 __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
         |                              ^~~
   include/linux/minmax.h:64:9: note: expanded from macro '__clamp_once'
      64 |         typeof(val) unique_val = (val);                                         \
         |                ^~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:23:7: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_24'
      23 |         case MEDIA_BUS_FMT_META_24:
         |              ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:28:7: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_16'
      28 |         case MEDIA_BUS_FMT_META_16:
         |              ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:34:7: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_12'
      34 |         case MEDIA_BUS_FMT_META_12:
         |              ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:40:7: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_10'
      40 |         case MEDIA_BUS_FMT_META_10:
         |              ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:46:7: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_8'
      46 |         case MEDIA_BUS_FMT_META_8:
         |              ^
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:159:8: error: call to undeclared function 'v4l2_subdev_state_get_stream_format'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     159 |         fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
         |               ^
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:159:6: error: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
     159 |         fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     160 |                                                   format->stream);
         |                                                   ~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:185:9: error: call to undeclared function 'v4l2_subdev_state_get_stream_crop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     185 |         crop = v4l2_subdev_state_get_stream_crop(state, other_pad,
         |                ^
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:185:7: error: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
     185 |         crop = v4l2_subdev_state_get_stream_crop(state, other_pad,
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     186 |                                                  other_stream);
         |                                                  ~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:244:8: error: call to undeclared function 'v4l2_subdev_state_get_stream_format'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     244 |         fmt = v4l2_subdev_state_get_stream_format(state, pad, stream);
         |               ^
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:244:6: error: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
     244 |         fmt = v4l2_subdev_state_get_stream_format(state, pad, stream);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:262:9: error: call to undeclared function 'v4l2_subdev_state_get_stream_crop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     262 |         rect = v4l2_subdev_state_get_stream_crop(state, pad, stream);
         |                ^
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:262:7: error: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
     262 |         rect = v4l2_subdev_state_get_stream_crop(state, pad, stream);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 errors generated.


vim +/MEDIA_BUS_FMT_META_8 +45 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c

    27	
    28	static const u32 csi2_supported_codes[] = {
    29		MEDIA_BUS_FMT_RGB565_1X16,
    30		MEDIA_BUS_FMT_RGB888_1X24,
    31		MEDIA_BUS_FMT_UYVY8_1X16,
    32		MEDIA_BUS_FMT_YUYV8_1X16,
    33		MEDIA_BUS_FMT_SBGGR10_1X10,
    34		MEDIA_BUS_FMT_SGBRG10_1X10,
    35		MEDIA_BUS_FMT_SGRBG10_1X10,
    36		MEDIA_BUS_FMT_SRGGB10_1X10,
    37		MEDIA_BUS_FMT_SBGGR12_1X12,
    38		MEDIA_BUS_FMT_SGBRG12_1X12,
    39		MEDIA_BUS_FMT_SGRBG12_1X12,
    40		MEDIA_BUS_FMT_SRGGB12_1X12,
    41		MEDIA_BUS_FMT_SBGGR8_1X8,
    42		MEDIA_BUS_FMT_SGBRG8_1X8,
    43		MEDIA_BUS_FMT_SGRBG8_1X8,
    44		MEDIA_BUS_FMT_SRGGB8_1X8,
  > 45		MEDIA_BUS_FMT_META_8,
  > 46		MEDIA_BUS_FMT_META_10,
  > 47		MEDIA_BUS_FMT_META_12,
  > 48		MEDIA_BUS_FMT_META_16,
  > 49		MEDIA_BUS_FMT_META_24,
    50		0
    51	};
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


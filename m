Return-Path: <linux-media+bounces-3597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C208B82B695
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 22:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63D4E1C23EE9
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 21:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C4258132;
	Thu, 11 Jan 2024 21:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMBvCwGY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22958120
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 21:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705008270; x=1736544270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mpcYbrWhLXQV3OEkoZW3Ab2z9VEwcZ0Wmb5SJxoUv28=;
  b=AMBvCwGYR5PonHe/b9dtCB3D9U9LnWG8SWnE0M5MWyIGttoy84ZLvFM5
   Wew8aS1DUrMd1vIkaancxkcUrJk4Pb0aFplyP1VblwIlfDgEQ2RaxdbjB
   86uXvNNEmjCbhm53/h/AJEjYqO+COaKD8QIHkZprNMZvTxeg6YVsTgz0B
   5o5IP/l2Qh5AhdK+H+12DSjQj2VErrB0uk27xjh1Kqd8dA9kT39DHUeTU
   PVrNlgPRr7t5x1P63ed9YBPI8kFT6SKjZt5G+F7h1t9SPkiPJJAn/ESAV
   fXPJOdLDFQEAl8KDbAPjDryeVvBX6d9aaZEzASAjjTd9u8M/WRKdY8y7I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5761227"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="5761227"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 13:21:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="786126713"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="786126713"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jan 2024 13:20:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rO2Tv-0008ke-1J;
	Thu, 11 Jan 2024 21:20:55 +0000
Date: Fri, 12 Jan 2024 05:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com, tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org, senozhatsky@chromium.org,
	andreaskleist@gmail.com, bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: Re: [PATCH v3 16/17] media: ipu6/isys: support line-based metadata
 capture support
Message-ID: <202401120528.5MY4pum6-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-004-20240111 (https://download.01.org/0day-ci/archive/20240112/202401120528.5MY4pum6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120528.5MY4pum6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401120528.5MY4pum6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c: In function 'ipu6_isys_mbus_code_to_bpp':
>> drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:23:14: error: 'MEDIA_BUS_FMT_META_24' undeclared (first use in this function); did you mean 'MEDIA_BUS_FMT_VUY8_1X24'?
      23 |         case MEDIA_BUS_FMT_META_24:
         |              ^~~~~~~~~~~~~~~~~~~~~
         |              MEDIA_BUS_FMT_VUY8_1X24
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:23:14: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:28:14: error: 'MEDIA_BUS_FMT_META_16' undeclared (first use in this function); did you mean 'MEDIA_BUS_FMT_Y16_1X16'?
      28 |         case MEDIA_BUS_FMT_META_16:
         |              ^~~~~~~~~~~~~~~~~~~~~
         |              MEDIA_BUS_FMT_Y16_1X16
>> drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:34:14: error: 'MEDIA_BUS_FMT_META_12' undeclared (first use in this function); did you mean 'MEDIA_BUS_FMT_UV8_1X8'?
      34 |         case MEDIA_BUS_FMT_META_12:
         |              ^~~~~~~~~~~~~~~~~~~~~
         |              MEDIA_BUS_FMT_UV8_1X8
>> drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:40:14: error: 'MEDIA_BUS_FMT_META_10' undeclared (first use in this function); did you mean 'MEDIA_BUS_FMT_Y10_1X10'?
      40 |         case MEDIA_BUS_FMT_META_10:
         |              ^~~~~~~~~~~~~~~~~~~~~
         |              MEDIA_BUS_FMT_Y10_1X10
>> drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:46:14: error: 'MEDIA_BUS_FMT_META_8' undeclared (first use in this function); did you mean 'MEDIA_BUS_FMT_Y8_1X8'?
      46 |         case MEDIA_BUS_FMT_META_8:
         |              ^~~~~~~~~~~~~~~~~~~~
         |              MEDIA_BUS_FMT_Y8_1X8
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c: In function 'ipu6_isys_subdev_set_fmt':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:159:15: error: implicit declaration of function 'v4l2_subdev_state_get_stream_format'; did you mean 'v4l2_subdev_state_get_format'? [-Werror=implicit-function-declaration]
     159 |         fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_subdev_state_get_format
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:159:13: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     159 |         fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
         |             ^
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:185:16: error: implicit declaration of function 'v4l2_subdev_state_get_stream_crop'; did you mean 'v4l2_subdev_state_get_crop'? [-Werror=implicit-function-declaration]
     185 |         crop = v4l2_subdev_state_get_stream_crop(state, other_pad,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                v4l2_subdev_state_get_crop
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:185:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     185 |         crop = v4l2_subdev_state_get_stream_crop(state, other_pad,
         |              ^
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c: In function 'ipu6_isys_get_stream_pad_fmt':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:244:13: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     244 |         fmt = v4l2_subdev_state_get_stream_format(state, pad, stream);
         |             ^
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c: In function 'ipu6_isys_get_stream_pad_crop':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:262:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     262 |         rect = v4l2_subdev_state_get_stream_crop(state, pad, stream);
         |              ^
   cc1: some warnings being treated as errors
--
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:45:9: error: 'MEDIA_BUS_FMT_META_8' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_Y8_1X8'?
      45 |         MEDIA_BUS_FMT_META_8,
         |         ^~~~~~~~~~~~~~~~~~~~
         |         MEDIA_BUS_FMT_Y8_1X8
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:46:9: error: 'MEDIA_BUS_FMT_META_10' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_Y10_1X10'?
      46 |         MEDIA_BUS_FMT_META_10,
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         MEDIA_BUS_FMT_Y10_1X10
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:47:9: error: 'MEDIA_BUS_FMT_META_12' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_UV8_1X8'?
      47 |         MEDIA_BUS_FMT_META_12,
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         MEDIA_BUS_FMT_UV8_1X8
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:48:9: error: 'MEDIA_BUS_FMT_META_16' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_Y16_1X16'?
      48 |         MEDIA_BUS_FMT_META_16,
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         MEDIA_BUS_FMT_Y16_1X16
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:49:9: error: 'MEDIA_BUS_FMT_META_24' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_VUY8_1X24'?
      49 |         MEDIA_BUS_FMT_META_24,
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         MEDIA_BUS_FMT_VUY8_1X24
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c: In function 'ipu6_isys_csi2_set_sel':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:406:20: error: implicit declaration of function 'v4l2_subdev_state_get_stream_format'; did you mean 'v4l2_subdev_state_get_format'? [-Werror=implicit-function-declaration]
     406 |         src_ffmt = v4l2_subdev_state_get_stream_format(state, sel->pad,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                    v4l2_subdev_state_get_format
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:406:18: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     406 |         src_ffmt = v4l2_subdev_state_get_stream_format(state, sel->pad,
         |                  ^
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:411:16: error: implicit declaration of function 'v4l2_subdev_state_get_stream_crop'; did you mean 'v4l2_subdev_state_get_crop'? [-Werror=implicit-function-declaration]
     411 |         crop = v4l2_subdev_state_get_stream_crop(state, sel->pad, sel->stream);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                v4l2_subdev_state_get_crop
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:411:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     411 |         crop = v4l2_subdev_state_get_stream_crop(state, sel->pad, sel->stream);
         |              ^
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c: In function 'ipu6_isys_csi2_get_sel':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:456:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         crop = v4l2_subdev_state_get_stream_crop(state, sel->pad, sel->stream);
         |              ^
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c: At top level:
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:483:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'init_cfg'
     483 |         .init_cfg = ipu6_isys_subdev_init_cfg,
         |          ^~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:483:21: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     483 |         .init_cfg = ipu6_isys_subdev_init_cfg,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:483:21: note: (near initialization for 'csi2_sd_pad_ops')
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:483:21: error: invalid initializer
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:483:21: note: (near initialization for 'csi2_sd_pad_ops.<anonymous>')
   cc1: some warnings being treated as errors
--
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:88:10: error: 'V4L2_META_FMT_GENERIC_8' undeclared here (not in a function); did you mean 'V4L2_META_FMT_VIVID'?
      88 |         {V4L2_META_FMT_GENERIC_8, 8, 8, MEDIA_BUS_FMT_META_8, 0},
         |          ^~~~~~~~~~~~~~~~~~~~~~~
         |          V4L2_META_FMT_VIVID
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:88:41: error: 'MEDIA_BUS_FMT_META_8' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_Y8_1X8'?
      88 |         {V4L2_META_FMT_GENERIC_8, 8, 8, MEDIA_BUS_FMT_META_8, 0},
         |                                         ^~~~~~~~~~~~~~~~~~~~
         |                                         MEDIA_BUS_FMT_Y8_1X8
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:89:10: error: 'V4L2_META_FMT_GENERIC_CSI2_10' undeclared here (not in a function)
      89 |         {V4L2_META_FMT_GENERIC_CSI2_10, 10, 10, MEDIA_BUS_FMT_META_10, 0},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:89:49: error: 'MEDIA_BUS_FMT_META_10' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_Y10_1X10'?
      89 |         {V4L2_META_FMT_GENERIC_CSI2_10, 10, 10, MEDIA_BUS_FMT_META_10, 0},
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                                 MEDIA_BUS_FMT_Y10_1X10
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:90:10: error: 'V4L2_META_FMT_GENERIC_CSI2_12' undeclared here (not in a function)
      90 |         {V4L2_META_FMT_GENERIC_CSI2_12, 12, 12, MEDIA_BUS_FMT_META_12, 0},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:90:49: error: 'MEDIA_BUS_FMT_META_12' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_UV8_1X8'?
      90 |         {V4L2_META_FMT_GENERIC_CSI2_12, 12, 12, MEDIA_BUS_FMT_META_12, 0},
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                                 MEDIA_BUS_FMT_UV8_1X8
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:91:10: error: 'V4L2_META_FMT_GENERIC_CSI2_16' undeclared here (not in a function)
      91 |         {V4L2_META_FMT_GENERIC_CSI2_16, 16, 16, MEDIA_BUS_FMT_META_16, 0},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:91:49: error: 'MEDIA_BUS_FMT_META_16' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_Y16_1X16'?
      91 |         {V4L2_META_FMT_GENERIC_CSI2_16, 16, 16, MEDIA_BUS_FMT_META_16, 0},
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                                 MEDIA_BUS_FMT_Y16_1X16
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:92:10: error: 'V4L2_META_FMT_GENERIC_CSI2_24' undeclared here (not in a function)
      92 |         {V4L2_META_FMT_GENERIC_CSI2_24, 24, 24, MEDIA_BUS_FMT_META_24, 0},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:92:49: error: 'MEDIA_BUS_FMT_META_24' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_VUY8_1X24'?
      92 |         {V4L2_META_FMT_GENERIC_CSI2_24, 24, 24, MEDIA_BUS_FMT_META_24, 0},
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                                 MEDIA_BUS_FMT_VUY8_1X24
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c: In function 'ipu6_isys_video_try_fmt_meta':
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:13: error: 'struct v4l2_meta_format' has no member named 'width'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |             ^~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from drivers/media/pci/intel/ipu6/ipu6-isys-video.c:7:
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:33: error: 'struct v4l2_meta_format' has no member named 'width'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                                 ^~
   include/linux/compiler.h:236:55: note: in definition of macro '__is_constexpr'
     236 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:23: note: in expansion of macro 'clamp'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                       ^~~~~
   In file included from include/linux/kernel.h:28,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from drivers/media/pci/intel/ipu6/ipu6-isys-video.c:9:
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:33: error: 'struct v4l2_meta_format' has no member named 'width'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                                 ^~
   include/linux/minmax.h:61:11: note: in definition of macro '__clamp'
      61 |         ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
         |           ^~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:23: note: in expansion of macro 'clamp'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                       ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:33: error: 'struct v4l2_meta_format' has no member named 'width'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                                 ^~
   include/linux/minmax.h:61:35: note: in definition of macro '__clamp'
      61 |         ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
         |                                   ^~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:23: note: in expansion of macro 'clamp'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                       ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:33: error: 'struct v4l2_meta_format' has no member named 'width'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                                 ^~
   include/linux/minmax.h:61:58: note: in definition of macro '__clamp'
      61 |         ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
         |                                                          ^~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:23: note: in expansion of macro 'clamp'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                       ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:33: error: 'struct v4l2_meta_format' has no member named 'width'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                                 ^~
   include/linux/minmax.h:64:16: note: in definition of macro '__clamp_once'
      64 |         typeof(val) unique_val = (val);                                         \
         |                ^~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:23: note: in expansion of macro 'clamp'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                       ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:33: error: 'struct v4l2_meta_format' has no member named 'width'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                                 ^~
   include/linux/minmax.h:64:35: note: in definition of macro '__clamp_once'
      64 |         typeof(val) unique_val = (val);                                         \
         |                                   ^~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:23: note: in expansion of macro 'clamp'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                       ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:33: error: 'struct v4l2_meta_format' has no member named 'width'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                                 ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:70:9: note: in expansion of macro 'static_assert'
      70 |         static_assert(__types_ok(val, lo), "clamp() 'lo' signedness error");    \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:31:31: note: in expansion of macro '__is_constexpr'
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |                               ^~~~~~~~~~~~~~
   include/linux/minmax.h:31:46: note: in expansion of macro 'is_signed_type'
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |                                              ^~~~~~~~~~~~~~
--
         |                                                        ^~~~
   include/linux/minmax.h:71:9: note: in expansion of macro 'static_assert'
      71 |         static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");    \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:36:53: note: in expansion of macro '__is_signed'
      36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
         |                                                     ^~~~~~~~~~~
   include/linux/minmax.h:41:17: note: in expansion of macro '__is_noneg_int'
      41 |                 __is_noneg_int(x) || __is_noneg_int(y))
         |                 ^~~~~~~~~~~~~~
   include/linux/minmax.h:71:23: note: in expansion of macro '__types_ok'
      71 |         static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");    \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:77:17: note: in expansion of macro '__clamp_once'
      77 |                 __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
         |                 ^~~~~~~~~~~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:23: note: in expansion of macro 'clamp'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                       ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:33: error: 'struct v4l2_meta_format' has no member named 'width'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                                 ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:71:9: note: in expansion of macro 'static_assert'
      71 |         static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");    \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:41:17: note: in expansion of macro '__is_noneg_int'
      41 |                 __is_noneg_int(x) || __is_noneg_int(y))
         |                 ^~~~~~~~~~~~~~
   include/linux/minmax.h:71:23: note: in expansion of macro '__types_ok'
      71 |         static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");    \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:77:17: note: in expansion of macro '__clamp_once'
      77 |                 __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
         |                 ^~~~~~~~~~~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:23: note: in expansion of macro 'clamp'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                       ^~~~~
   include/linux/minmax.h:36:10: error: first argument to '__builtin_choose_expr' not a constant
      36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:71:9: note: in expansion of macro 'static_assert'
      71 |         static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");    \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:41:17: note: in expansion of macro '__is_noneg_int'
      41 |                 __is_noneg_int(x) || __is_noneg_int(y))
         |                 ^~~~~~~~~~~~~~
   include/linux/minmax.h:71:23: note: in expansion of macro '__types_ok'
      71 |         static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");    \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:77:17: note: in expansion of macro '__clamp_once'
      77 |                 __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
         |                 ^~~~~~~~~~~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:23: note: in expansion of macro 'clamp'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                       ^~~~~
   include/linux/minmax.h:39:9: error: expression in static assertion is not an integer
      39 |         (__is_signed(x) == __is_signed(y) ||                    \
         |         ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:71:9: note: in expansion of macro 'static_assert'
      71 |         static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");    \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:71:23: note: in expansion of macro '__types_ok'
      71 |         static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");    \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:77:17: note: in expansion of macro '__clamp_once'
      77 |                 __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
         |                 ^~~~~~~~~~~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:23: note: in expansion of macro 'clamp'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                       ^~~~~
   include/linux/minmax.h:75:9: error: first argument to '__builtin_choose_expr' not a constant
      75 |         __builtin_choose_expr(__is_constexpr((val) - (lo) + (hi)),      \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:265:23: note: in expansion of macro 'clamp'
     265 |         meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
         |                       ^~~~~
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:13: error: 'struct v4l2_meta_format' has no member named 'height'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |             ^~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:34: error: 'struct v4l2_meta_format' has no member named 'height'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |                                  ^~
   include/linux/compiler.h:236:55: note: in definition of macro '__is_constexpr'
     236 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:24: note: in expansion of macro 'clamp'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |                        ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:34: error: 'struct v4l2_meta_format' has no member named 'height'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |                                  ^~
   include/linux/minmax.h:61:11: note: in definition of macro '__clamp'
      61 |         ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
         |           ^~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:24: note: in expansion of macro 'clamp'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |                        ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:34: error: 'struct v4l2_meta_format' has no member named 'height'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |                                  ^~
   include/linux/minmax.h:61:35: note: in definition of macro '__clamp'
      61 |         ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
         |                                   ^~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:24: note: in expansion of macro 'clamp'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |                        ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:34: error: 'struct v4l2_meta_format' has no member named 'height'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |                                  ^~
   include/linux/minmax.h:61:58: note: in definition of macro '__clamp'
      61 |         ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
         |                                                          ^~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:24: note: in expansion of macro 'clamp'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |                        ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:34: error: 'struct v4l2_meta_format' has no member named 'height'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |                                  ^~
   include/linux/minmax.h:64:16: note: in definition of macro '__clamp_once'
      64 |         typeof(val) unique_val = (val);                                         \
         |                ^~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:24: note: in expansion of macro 'clamp'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |                        ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:34: error: 'struct v4l2_meta_format' has no member named 'height'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |                                  ^~
   include/linux/minmax.h:64:35: note: in definition of macro '__clamp_once'
      64 |         typeof(val) unique_val = (val);                                         \
         |                                   ^~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:24: note: in expansion of macro 'clamp'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |                        ^~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:267:34: error: 'struct v4l2_meta_format' has no member named 'height'
     267 |         meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
         |                                  ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:70:9: note: in expansion of macro 'static_assert'
      70 |         static_assert(__types_ok(val, lo), "clamp() 'lo' signedness error");    \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:31:31: note: in expansion of macro '__is_constexpr'
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |                               ^~~~~~~~~~~~~~
   include/linux/minmax.h:31:46: note: in expansion of macro 'is_signed_type'
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |                                              ^~~~~~~~~~~~~~
   include/linux/minmax.h:39:10: note: in expansion of macro '__is_signed'
      39 |         (__is_signed(x) == __is_signed(y) ||                    \
         |          ^~~~~~~~~~~
   include/linux/minmax.h:70:23: note: in expansion of macro '__types_ok'
      70 |         static_assert(__types_ok(val, lo), "clamp() 'lo' signedness error");    \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:77:17: note: in expansion of macro '__clamp_once'
      77 |                 __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
         |                 ^~~~~~~~~~~~
   include/linux/minmax.h:146:28: note: in expansion of macro '__careful_clamp'
     146 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
..


vim +23 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c

    18	
    19	unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
    20	{
    21		switch (code) {
    22		case MEDIA_BUS_FMT_RGB888_1X24:
  > 23		case MEDIA_BUS_FMT_META_24:
    24			return 24;
    25		case MEDIA_BUS_FMT_RGB565_1X16:
    26		case MEDIA_BUS_FMT_UYVY8_1X16:
    27		case MEDIA_BUS_FMT_YUYV8_1X16:
  > 28		case MEDIA_BUS_FMT_META_16:
    29			return 16;
    30		case MEDIA_BUS_FMT_SBGGR12_1X12:
    31		case MEDIA_BUS_FMT_SGBRG12_1X12:
    32		case MEDIA_BUS_FMT_SGRBG12_1X12:
    33		case MEDIA_BUS_FMT_SRGGB12_1X12:
  > 34		case MEDIA_BUS_FMT_META_12:
    35			return 12;
    36		case MEDIA_BUS_FMT_SBGGR10_1X10:
    37		case MEDIA_BUS_FMT_SGBRG10_1X10:
    38		case MEDIA_BUS_FMT_SGRBG10_1X10:
    39		case MEDIA_BUS_FMT_SRGGB10_1X10:
  > 40		case MEDIA_BUS_FMT_META_10:
    41			return 10;
    42		case MEDIA_BUS_FMT_SBGGR8_1X8:
    43		case MEDIA_BUS_FMT_SGBRG8_1X8:
    44		case MEDIA_BUS_FMT_SGRBG8_1X8:
    45		case MEDIA_BUS_FMT_SRGGB8_1X8:
  > 46		case MEDIA_BUS_FMT_META_8:
    47			return 8;
    48		default:
    49			WARN_ON(1);
    50			return 8;
    51		}
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-6206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E6C86DB5B
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 07:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0269287952
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 06:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4382B5F845;
	Fri,  1 Mar 2024 06:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtjXkKsF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227905915D
	for <linux-media@vger.kernel.org>; Fri,  1 Mar 2024 06:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709273530; cv=none; b=qijQWVwlAOEBIZo7fVBZx7jRFqhz6jRbTTLJDx1AuMZZqiCQYqknPwIXUTqeGQK3vxUDQXVWd0bexPa/38eIT++EUJhs1GxpbF47d1V6n5QJWs1Oe8d7KTuMRtPlQb6ZrX0rQwTMBartsdjOSMTxOMAlQh83ioIyEse0NdL4H0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709273530; c=relaxed/simple;
	bh=bH+G5rZfIuw/z92ZiQL61hff6O10a8o0CM3atsbi5Og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rvROejL5G6EAk411WpTl//2Amr0QkChnXM/v7xg8RHo9OdGZ9rbNhvHvIXQt+3UoMTEQgE9B1Wc9Hcm0TuYO/xeVZcEwyevpcQZ3Xta4egVgoq2+PEZhcqheMRGuYqF7u4Nv7WDL1lhanJuRHvbYmSVMP82gRZXuUYo8AmbAI+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtjXkKsF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709273523; x=1740809523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bH+G5rZfIuw/z92ZiQL61hff6O10a8o0CM3atsbi5Og=;
  b=PtjXkKsFvL8xxCwq1ZNE4gAcXtlJbsmPoehFtfNxCMKtrVCQoNrvwvem
   srzy82GAtmOWIEpLg9A5EEZlrW8QrgLia8q2xUH8GndPrxBDnbtuMJG4D
   xZqJE6iJvWOe+BinCjnIPRH2YKNs4hR89bqNqCqbmDyTRNPKd9TGKUSl7
   GtmjXZV5ptee009Zc0y6MN7bIIaEc/ekn1WtMgpu+oTx2+1aPT/XkZN6/
   tWA82Z3lqx3Iy6DRVrPMzkn33uUVChbEm7wB/viGNHv+1bXGX6jS+8mZq
   o96QJFiCVgAFxsR/O5p9rZFhkWO4d4OEVkK+OiXcGHjBG/D4UvITIgxnz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3967759"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3967759"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 22:12:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8025951"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Feb 2024 22:12:01 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfw7h-000DaF-0z;
	Fri, 01 Mar 2024 06:11:57 +0000
Date: Fri, 1 Mar 2024 14:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>
Subject: [sailus-media-tree:ipu6 59/68]
 drivers/media/pci/intel/ipu6/ipu6-isys.c:210:62: error: 'struct
 video_device' has no member named 'entity'
Message-ID: <202403011421.Pl39qzi3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git ipu6
head:   3733f0aae05e6ac2c55192a4159bc81c5aaf5681
commit: d6c211a676c0a2de6ddfde4d7589878140a0371e [59/68] media: intel/ipu6: add Kconfig and Makefile
config: x86_64-randconfig-121-20240229 (https://download.01.org/0day-ci/archive/20240301/202403011421.Pl39qzi3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011421.Pl39qzi3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011421.Pl39qzi3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/ipu6-isys.c: In function 'isys_complete_ext_device_registration':
   drivers/media/pci/intel/ipu6/ipu6-isys.c:113:27: error: 'struct v4l2_subdev' has no member named 'entity'
     113 |         for (i = 0; i < sd->entity.num_pads; i++) {
         |                           ^~
   drivers/media/pci/intel/ipu6/ipu6-isys.c:114:23: error: 'struct v4l2_subdev' has no member named 'entity'
     114 |                 if (sd->entity.pads[i].flags & MEDIA_PAD_FL_SOURCE)
         |                       ^~
   drivers/media/pci/intel/ipu6/ipu6-isys.c:118:20: error: 'struct v4l2_subdev' has no member named 'entity'
     118 |         if (i == sd->entity.num_pads) {
         |                    ^~
   drivers/media/pci/intel/ipu6/ipu6-isys.c:124:40: error: 'struct v4l2_subdev' has no member named 'entity'
     124 |         ret = media_create_pad_link(&sd->entity, i,
         |                                        ^~
   drivers/media/pci/intel/ipu6/ipu6-isys.c:125:67: error: 'struct v4l2_subdev' has no member named 'entity'
     125 |                                     &isys->csi2[csi2->port].asd.sd.entity,
         |                                                                   ^
   drivers/media/pci/intel/ipu6/ipu6-isys.c: In function 'isys_csi2_create_media_links':
   drivers/media/pci/intel/ipu6/ipu6-isys.c:204:64: error: 'struct v4l2_subdev' has no member named 'entity'
     204 |                 struct media_entity *sd = &isys->csi2[i].asd.sd.entity;
         |                                                                ^
>> drivers/media/pci/intel/ipu6/ipu6-isys.c:210:62: error: 'struct video_device' has no member named 'entity'
     210 |                                                     &av->vdev.entity, 0, 0);
         |                                                              ^
   drivers/media/pci/intel/ipu6/ipu6-isys.c: In function 'isys_register_devices':
>> drivers/media/pci/intel/ipu6/ipu6-isys.c:829:9: error: implicit declaration of function 'media_device_cleanup'; did you mean 'media_entity_cleanup'? [-Werror=implicit-function-declaration]
     829 |         media_device_cleanup(&isys->media_dev);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         media_entity_cleanup
   cc1: some warnings being treated as errors
--
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c: In function 'ipu6_isys_csi2_get_link_freq':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:85:70: error: 'struct v4l2_subdev' has no member named 'entity'
      85 |         src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
         |                                                                      ^
   In file included from include/linux/atomic/atomic-instrumented.h:15,
                    from include/linux/atomic.h:82,
                    from drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:6:
>> include/linux/container_of.h:20:54: error: 'struct v4l2_subdev' has no member named 'entity'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:91:18: note: in expansion of macro 'media_entity_to_v4l2_subdev'
      91 |         ext_sd = media_entity_to_v4l2_subdev(src_pad->entity);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:376:27: error: expression in static assertion is not an integer
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:91:18: note: in expansion of macro 'media_entity_to_v4l2_subdev'
      91 |         ext_sd = media_entity_to_v4l2_subdev(src_pad->entity);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/atomic.h:5:
>> include/linux/stddef.h:16:33: error: 'struct v4l2_subdev' has no member named 'entity'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:91:18: note: in expansion of macro 'media_entity_to_v4l2_subdev'
      91 |         ext_sd = media_entity_to_v4l2_subdev(src_pad->entity);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c: In function 'ipu6_isys_csi2_set_sel':
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:395:21: error: implicit declaration of function 'v4l2_subdev_state_get_opposite_stream_format' [-Werror=implicit-function-declaration]
     395 |         sink_ffmt = v4l2_subdev_state_get_opposite_stream_format(state,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:395:19: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     395 |         sink_ffmt = v4l2_subdev_state_get_opposite_stream_format(state,
         |                   ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:401:20: error: implicit declaration of function 'v4l2_subdev_state_get_format' [-Werror=implicit-function-declaration]
     401 |         src_ffmt = v4l2_subdev_state_get_format(state, sel->pad, sel->stream);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:401:18: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     401 |         src_ffmt = v4l2_subdev_state_get_format(state, sel->pad, sel->stream);
         |                  ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:405:16: error: implicit declaration of function 'v4l2_subdev_state_get_crop' [-Werror=implicit-function-declaration]
     405 |         crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:405:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     405 |         crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
         |              ^
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c: In function 'ipu6_isys_csi2_get_sel':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:441:15: error: 'struct v4l2_subdev' has no member named 'entity'
     441 |         if (sd->entity.pads[sel->pad].flags & MEDIA_PAD_FL_SINK)
         |               ^~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:444:19: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     444 |         sink_ffmt = v4l2_subdev_state_get_opposite_stream_format(state,
         |                   ^
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:450:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     450 |         crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
         |              ^
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c: At top level:
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:477:20: error: 'v4l2_subdev_get_fmt' undeclared here (not in a function); did you mean 'v4l2_subdev_notify'?
     477 |         .get_fmt = v4l2_subdev_get_fmt,
         |                    ^~~~~~~~~~~~~~~~~~~
         |                    v4l2_subdev_notify
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:492:26: error: 'v4l2_subdev_link_validate' undeclared here (not in a function); did you mean 'v4l2_subdev_lock_state'?
     492 |         .link_validate = v4l2_subdev_link_validate,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                          v4l2_subdev_lock_state
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:493:29: error: 'v4l2_subdev_has_pad_interdep' undeclared here (not in a function); did you mean 'v4l2_subdev_ir_parameters'?
     493 |         .has_pad_interdep = v4l2_subdev_has_pad_interdep,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             v4l2_subdev_ir_parameters
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c: In function 'ipu6_isys_csi2_cleanup':
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:502:9: error: implicit declaration of function 'v4l2_subdev_cleanup'; did you mean 'v4l2_subdev_call'? [-Werror=implicit-function-declaration]
     502 |         v4l2_subdev_cleanup(&csi2->asd.sd);
         |         ^~~~~~~~~~~~~~~~~~~
         |         v4l2_subdev_call
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c: In function 'ipu6_isys_csi2_init':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:518:21: error: 'struct v4l2_subdev' has no member named 'entity'
     518 |         csi2->asd.sd.entity.ops = &csi2_entity_ops;
         |                     ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:530:15: error: implicit declaration of function 'v4l2_subdev_init_finalize'; did you mean 'v4l2_subdev_init'? [-Werror=implicit-function-declaration]
     530 |         ret = v4l2_subdev_init_finalize(&csi2->asd.sd);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_subdev_init
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c: In function 'ipu6_isys_csi2_get_remote_desc':
>> include/linux/container_of.h:20:54: error: 'struct v4l2_subdev' has no member named 'entity'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:591:18: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     591 |         source = media_entity_to_v4l2_subdev(source_entity);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:376:27: error: expression in static assertion is not an integer
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:591:18: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     591 |         source = media_entity_to_v4l2_subdev(source_entity);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct v4l2_subdev' has no member named 'entity'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:591:18: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     591 |         source = media_entity_to_v4l2_subdev(source_entity);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:10:
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c: In function 'ipu6_isys_set_csi2_streams_status':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:657:35: error: 'struct v4l2_subdev' has no member named 'entity'
     657 |                                 sd->entity.name, r_pad->index, r_stream,
         |                                   ^~
   include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                                ^~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:655:25: note: in expansion of macro 'dev_dbg'
     655 |                         dev_dbg(&av->isys->adev->auxdev.dev,
         |                         ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/bits.h:21,
                    from drivers/media/pci/intel/ipu6/ipu6-isys-video.c:7:
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c: In function 'link_validate':
>> include/linux/container_of.h:20:54: error: 'struct v4l2_subdev' has no member named 'entity'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:281:16: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     281 |         s_sd = media_entity_to_v4l2_subdev(link->source->entity);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:376:27: error: expression in static assertion is not an integer
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:281:16: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     281 |         s_sd = media_entity_to_v4l2_subdev(link->source->entity);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:251,
                    from include/linux/build_bug.h:5:
>> include/linux/stddef.h:16:33: error: 'struct v4l2_subdev' has no member named 'entity'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:281:16: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     281 |         s_sd = media_entity_to_v4l2_subdev(link->source->entity);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:295:17: error: implicit declaration of function 'v4l2_subdev_state_get_format' [-Werror=implicit-function-declaration]
     295 |         s_fmt = v4l2_subdev_state_get_format(s_state, s_pad->index, s_stream);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:295:15: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     295 |         s_fmt = v4l2_subdev_state_get_format(s_state, s_pad->index, s_stream);
         |               ^
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c: In function 'ipu6_isys_fw_pin_cfg':
>> include/linux/container_of.h:20:54: error: 'struct v4l2_subdev' has no member named 'entity'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:340:34: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     340 |         struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:376:27: error: expression in static assertion is not an integer
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:340:34: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     340 |         struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct v4l2_subdev' has no member named 'entity'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:340:34: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     340 |         struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c: In function 'ipu6_isys_configure_stream_watermark':
>> include/linux/container_of.h:20:54: error: 'struct v4l2_subdev' has no member named 'entity'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:657:15: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     657 |         esd = media_entity_to_v4l2_subdev(av->stream->source_entity);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:376:27: error: expression in static assertion is not an integer
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:657:15: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     657 |         esd = media_entity_to_v4l2_subdev(av->stream->source_entity);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct v4l2_subdev' has no member named 'entity'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:657:15: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     657 |         esd = media_entity_to_v4l2_subdev(av->stream->source_entity);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c: In function 'get_stream_mask_by_pipeline':
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:863:50: error: 'struct video_device' has no member named 'entity'
     863 |                 media_entity_pipeline(&__av->vdev.entity);
         |                                                  ^
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:870:64: error: 'struct video_device' has no member named 'entity'
     870 |                 if (pipeline == media_entity_pipeline(&av->vdev.entity))
         |                                                                ^
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c: In function 'ipu6_isys_video_set_streaming':
>> include/linux/container_of.h:20:54: error: 'struct v4l2_subdev' has no member named 'entity'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:898:15: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     898 |         ssd = media_entity_to_v4l2_subdev(stream->source_entity);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:376:27: error: expression in static assertion is not an integer
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:898:15: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     898 |         ssd = media_entity_to_v4l2_subdev(stream->source_entity);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct v4l2_subdev' has no member named 'entity'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:898:15: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     898 |         ssd = media_entity_to_v4l2_subdev(stream->source_entity);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:905:15: error: implicit declaration of function 'v4l2_subdev_routing_find_opposite_end' [-Werror=implicit-function-declaration]
     905 |         ret = v4l2_subdev_routing_find_opposite_end(routing, r_pad->index,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:921:23: error: implicit declaration of function 'v4l2_subdev_disable_streams' [-Werror=implicit-function-declaration]
     921 |                 ret = v4l2_subdev_disable_streams(ssd, s_pad->index,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:958:23: error: implicit declaration of function 'v4l2_subdev_enable_streams' [-Werror=implicit-function-declaration]
     958 |                 ret = v4l2_subdev_enable_streams(ssd, s_pad->index,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c: In function 'ipu6_isys_setup_video':
>> include/linux/container_of.h:20:54: error: 'struct v4l2_subdev' has no member named 'entity'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1108:21: note: in expansion of macro 'media_entity_to_v4l2_subdev'
    1108 |         remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:376:27: error: expression in static assertion is not an integer
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1108:21: note: in expansion of macro 'media_entity_to_v4l2_subdev'
    1108 |         remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct v4l2_subdev' has no member named 'entity'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/media/v4l2-subdev.h:1110:17: note: in expansion of macro 'container_of'
    1110 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1108:21: note: in expansion of macro 'media_entity_to_v4l2_subdev'
    1108 |         remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1120:9: error: implicit declaration of function 'for_each_active_route'; did you mean 'for_each_active_irq'? [-Werror=implicit-function-declaration]
    1120 |         for_each_active_route(&state->routing, r) {
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         for_each_active_irq
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1120:50: error: expected ';' before '{' token
    1120 |         for_each_active_route(&state->routing, r) {
         |                                                  ^~
         |                                                  ;
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1156:51: error: 'struct video_device' has no member named 'entity'
    1156 |         pipeline = media_entity_pipeline(&av->vdev.entity);
         |                                                   ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1158:23: error: implicit declaration of function 'video_device_pipeline_alloc_start'; did you mean 'media_pipeline_alloc_start'? [-Werror=implicit-function-declaration]
    1158 |                 ret = video_device_pipeline_alloc_start(&av->vdev);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       media_pipeline_alloc_start
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1160:23: error: implicit declaration of function 'video_device_pipeline_start'; did you mean 'media_pipeline_start'? [-Werror=implicit-function-declaration]
    1160 |                 ret = video_device_pipeline_start(&av->vdev, pipeline);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       media_pipeline_start
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1168:17: error: implicit declaration of function 'video_device_pipeline_stop'; did you mean 'video_device_release'? [-Werror=implicit-function-declaration]
    1168 |                 video_device_pipeline_stop(&av->vdev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 video_device_release
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c: In function 'ipu6_isys_video_init':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1203:47: error: 'struct video_device' has no member named 'entity'
    1203 |         ret = media_entity_pads_init(&av->vdev.entity, 1, &av->pad);
         |                                               ^
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1207:17: error: 'struct video_device' has no member named 'entity'
    1207 |         av->vdev.entity.ops = &entity_ops;
         |                 ^
   cc1: some warnings being treated as errors
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=n]
   Selected by [y]:
   - VIDEO_INTEL_IPU6 [=y] && PCI [=y] && (ACPI [=y] || COMPILE_TEST [=n]) && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && X86 [=y] && X86_64 [=y] && HAS_DMA [=y]


vim +210 drivers/media/pci/intel/ipu6/ipu6-isys.c

365931dd66c449 Bingbu Cao 2024-01-31  103  
365931dd66c449 Bingbu Cao 2024-01-31  104  static int
365931dd66c449 Bingbu Cao 2024-01-31  105  isys_complete_ext_device_registration(struct ipu6_isys *isys,
365931dd66c449 Bingbu Cao 2024-01-31  106  				      struct v4l2_subdev *sd,
365931dd66c449 Bingbu Cao 2024-01-31  107  				      struct ipu6_isys_csi2_config *csi2)
365931dd66c449 Bingbu Cao 2024-01-31  108  {
365931dd66c449 Bingbu Cao 2024-01-31  109  	struct device *dev = &isys->adev->auxdev.dev;
365931dd66c449 Bingbu Cao 2024-01-31  110  	unsigned int i;
365931dd66c449 Bingbu Cao 2024-01-31  111  	int ret;
365931dd66c449 Bingbu Cao 2024-01-31  112  
365931dd66c449 Bingbu Cao 2024-01-31  113  	for (i = 0; i < sd->entity.num_pads; i++) {
365931dd66c449 Bingbu Cao 2024-01-31  114  		if (sd->entity.pads[i].flags & MEDIA_PAD_FL_SOURCE)
365931dd66c449 Bingbu Cao 2024-01-31  115  			break;
365931dd66c449 Bingbu Cao 2024-01-31  116  	}
365931dd66c449 Bingbu Cao 2024-01-31  117  
365931dd66c449 Bingbu Cao 2024-01-31  118  	if (i == sd->entity.num_pads) {
365931dd66c449 Bingbu Cao 2024-01-31  119  		dev_warn(dev, "no src pad in external entity\n");
365931dd66c449 Bingbu Cao 2024-01-31  120  		ret = -ENOENT;
365931dd66c449 Bingbu Cao 2024-01-31  121  		goto unregister_subdev;
365931dd66c449 Bingbu Cao 2024-01-31  122  	}
365931dd66c449 Bingbu Cao 2024-01-31  123  
365931dd66c449 Bingbu Cao 2024-01-31  124  	ret = media_create_pad_link(&sd->entity, i,
365931dd66c449 Bingbu Cao 2024-01-31 @125  				    &isys->csi2[csi2->port].asd.sd.entity,
365931dd66c449 Bingbu Cao 2024-01-31  126  				    0, 0);
365931dd66c449 Bingbu Cao 2024-01-31  127  	if (ret) {
365931dd66c449 Bingbu Cao 2024-01-31  128  		dev_warn(dev, "can't create link\n");
365931dd66c449 Bingbu Cao 2024-01-31  129  		goto unregister_subdev;
365931dd66c449 Bingbu Cao 2024-01-31  130  	}
365931dd66c449 Bingbu Cao 2024-01-31  131  
365931dd66c449 Bingbu Cao 2024-01-31  132  	isys->csi2[csi2->port].nlanes = csi2->nlanes;
365931dd66c449 Bingbu Cao 2024-01-31  133  
365931dd66c449 Bingbu Cao 2024-01-31  134  	return 0;
365931dd66c449 Bingbu Cao 2024-01-31  135  
365931dd66c449 Bingbu Cao 2024-01-31  136  unregister_subdev:
365931dd66c449 Bingbu Cao 2024-01-31  137  	v4l2_device_unregister_subdev(sd);
365931dd66c449 Bingbu Cao 2024-01-31  138  
365931dd66c449 Bingbu Cao 2024-01-31  139  	return ret;
365931dd66c449 Bingbu Cao 2024-01-31  140  }
365931dd66c449 Bingbu Cao 2024-01-31  141  
365931dd66c449 Bingbu Cao 2024-01-31  142  static void isys_stream_init(struct ipu6_isys *isys)
365931dd66c449 Bingbu Cao 2024-01-31  143  {
365931dd66c449 Bingbu Cao 2024-01-31  144  	u32 i;
365931dd66c449 Bingbu Cao 2024-01-31  145  
365931dd66c449 Bingbu Cao 2024-01-31  146  	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
365931dd66c449 Bingbu Cao 2024-01-31  147  		mutex_init(&isys->streams[i].mutex);
365931dd66c449 Bingbu Cao 2024-01-31  148  		init_completion(&isys->streams[i].stream_open_completion);
365931dd66c449 Bingbu Cao 2024-01-31  149  		init_completion(&isys->streams[i].stream_close_completion);
365931dd66c449 Bingbu Cao 2024-01-31  150  		init_completion(&isys->streams[i].stream_start_completion);
365931dd66c449 Bingbu Cao 2024-01-31  151  		init_completion(&isys->streams[i].stream_stop_completion);
365931dd66c449 Bingbu Cao 2024-01-31  152  		INIT_LIST_HEAD(&isys->streams[i].queues);
365931dd66c449 Bingbu Cao 2024-01-31  153  		isys->streams[i].isys = isys;
365931dd66c449 Bingbu Cao 2024-01-31  154  		isys->streams[i].stream_handle = i;
365931dd66c449 Bingbu Cao 2024-01-31  155  		isys->streams[i].vc = INVALID_VC_ID;
365931dd66c449 Bingbu Cao 2024-01-31  156  	}
365931dd66c449 Bingbu Cao 2024-01-31  157  }
365931dd66c449 Bingbu Cao 2024-01-31  158  
365931dd66c449 Bingbu Cao 2024-01-31  159  static void isys_csi2_unregister_subdevices(struct ipu6_isys *isys)
365931dd66c449 Bingbu Cao 2024-01-31  160  {
365931dd66c449 Bingbu Cao 2024-01-31  161  	const struct ipu6_isys_internal_csi2_pdata *csi2 =
365931dd66c449 Bingbu Cao 2024-01-31  162  		&isys->pdata->ipdata->csi2;
365931dd66c449 Bingbu Cao 2024-01-31  163  	unsigned int i;
365931dd66c449 Bingbu Cao 2024-01-31  164  
365931dd66c449 Bingbu Cao 2024-01-31  165  	for (i = 0; i < csi2->nports; i++)
365931dd66c449 Bingbu Cao 2024-01-31  166  		ipu6_isys_csi2_cleanup(&isys->csi2[i]);
365931dd66c449 Bingbu Cao 2024-01-31  167  }
365931dd66c449 Bingbu Cao 2024-01-31  168  
365931dd66c449 Bingbu Cao 2024-01-31  169  static int isys_csi2_register_subdevices(struct ipu6_isys *isys)
365931dd66c449 Bingbu Cao 2024-01-31  170  {
365931dd66c449 Bingbu Cao 2024-01-31  171  	const struct ipu6_isys_internal_csi2_pdata *csi2_pdata =
365931dd66c449 Bingbu Cao 2024-01-31  172  		&isys->pdata->ipdata->csi2;
365931dd66c449 Bingbu Cao 2024-01-31  173  	unsigned int i;
365931dd66c449 Bingbu Cao 2024-01-31  174  	int ret;
365931dd66c449 Bingbu Cao 2024-01-31  175  
365931dd66c449 Bingbu Cao 2024-01-31  176  	for (i = 0; i < csi2_pdata->nports; i++) {
365931dd66c449 Bingbu Cao 2024-01-31  177  		ret = ipu6_isys_csi2_init(&isys->csi2[i], isys,
365931dd66c449 Bingbu Cao 2024-01-31  178  					  isys->pdata->base +
365931dd66c449 Bingbu Cao 2024-01-31  179  					  CSI_REG_PORT_BASE(i), i);
365931dd66c449 Bingbu Cao 2024-01-31  180  		if (ret)
365931dd66c449 Bingbu Cao 2024-01-31  181  			goto fail;
365931dd66c449 Bingbu Cao 2024-01-31  182  
365931dd66c449 Bingbu Cao 2024-01-31  183  		isys->isr_csi2_bits |= IPU6_ISYS_UNISPART_IRQ_CSI2(i);
365931dd66c449 Bingbu Cao 2024-01-31  184  	}
365931dd66c449 Bingbu Cao 2024-01-31  185  
365931dd66c449 Bingbu Cao 2024-01-31  186  	return 0;
365931dd66c449 Bingbu Cao 2024-01-31  187  
365931dd66c449 Bingbu Cao 2024-01-31  188  fail:
365931dd66c449 Bingbu Cao 2024-01-31  189  	while (i--)
365931dd66c449 Bingbu Cao 2024-01-31  190  		ipu6_isys_csi2_cleanup(&isys->csi2[i]);
365931dd66c449 Bingbu Cao 2024-01-31  191  
365931dd66c449 Bingbu Cao 2024-01-31  192  	return ret;
365931dd66c449 Bingbu Cao 2024-01-31  193  }
365931dd66c449 Bingbu Cao 2024-01-31  194  
365931dd66c449 Bingbu Cao 2024-01-31  195  static int isys_csi2_create_media_links(struct ipu6_isys *isys)
365931dd66c449 Bingbu Cao 2024-01-31  196  {
365931dd66c449 Bingbu Cao 2024-01-31  197  	const struct ipu6_isys_internal_csi2_pdata *csi2_pdata =
365931dd66c449 Bingbu Cao 2024-01-31  198  		&isys->pdata->ipdata->csi2;
365931dd66c449 Bingbu Cao 2024-01-31  199  	struct device *dev = &isys->adev->auxdev.dev;
365931dd66c449 Bingbu Cao 2024-01-31  200  	unsigned int i, j;
365931dd66c449 Bingbu Cao 2024-01-31  201  	int ret;
365931dd66c449 Bingbu Cao 2024-01-31  202  
365931dd66c449 Bingbu Cao 2024-01-31  203  	for (i = 0; i < csi2_pdata->nports; i++) {
365931dd66c449 Bingbu Cao 2024-01-31 @204  		struct media_entity *sd = &isys->csi2[i].asd.sd.entity;
365931dd66c449 Bingbu Cao 2024-01-31  205  
365931dd66c449 Bingbu Cao 2024-01-31  206  		for (j = 0; j < NR_OF_CSI2_SRC_PADS; j++) {
365931dd66c449 Bingbu Cao 2024-01-31  207  			struct ipu6_isys_video *av = &isys->csi2[i].av[j];
365931dd66c449 Bingbu Cao 2024-01-31  208  
365931dd66c449 Bingbu Cao 2024-01-31  209  			ret = media_create_pad_link(sd, CSI2_PAD_SRC + j,
365931dd66c449 Bingbu Cao 2024-01-31 @210  						    &av->vdev.entity, 0, 0);
365931dd66c449 Bingbu Cao 2024-01-31  211  			if (ret) {
365931dd66c449 Bingbu Cao 2024-01-31  212  				dev_err(dev, "CSI2 can't create link\n");
365931dd66c449 Bingbu Cao 2024-01-31  213  				return ret;
365931dd66c449 Bingbu Cao 2024-01-31  214  			}
365931dd66c449 Bingbu Cao 2024-01-31  215  
365931dd66c449 Bingbu Cao 2024-01-31  216  			av->csi2 = &isys->csi2[i];
365931dd66c449 Bingbu Cao 2024-01-31  217  		}
365931dd66c449 Bingbu Cao 2024-01-31  218  	}
365931dd66c449 Bingbu Cao 2024-01-31  219  
365931dd66c449 Bingbu Cao 2024-01-31  220  	return 0;
365931dd66c449 Bingbu Cao 2024-01-31  221  }
365931dd66c449 Bingbu Cao 2024-01-31  222  

:::::: The code at line 210 was first introduced by commit
:::::: 365931dd66c449c09eaf98792640b16ab4578280 media: intel/ipu6: add input system driver

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


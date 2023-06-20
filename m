Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EECBF736DE9
	for <lists+linux-media@lfdr.de>; Tue, 20 Jun 2023 15:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbjFTNv2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jun 2023 09:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232806AbjFTNvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jun 2023 09:51:09 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CDD1100
        for <linux-media@vger.kernel.org>; Tue, 20 Jun 2023 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687269040; x=1718805040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E893k2Y1LC+6RT64a0PXjV5EUOL+FZNmByCu34sf2TM=;
  b=n0LUYpK9x99UCmOf6WrhLpzoH9GpxLgIKfDI8NHGwkwhLE3zcgdjT3r7
   WDRcvMpfFsfq76UltPw0hI3H4UM4dwb7+tF358iRuLS2rh4EdZkPQTtlY
   /E9MoqYkBjXYS6su0emsFQBjFmhHRWHEU492WqTKBh8SrnA9TZ+4em7QD
   JPCZDH29FaKJ3t0/yAmVF3ap7HcJ86oEweVxYrmx+qhWkfe6XsKZnbFAM
   fzglO5U1nKndp2gwEOYRiJOBT2b2YXJ7iNQpH6nlfJU3pnLes4+1x4gmR
   r47KHqe6xxfzyorG4Uw19+lTWPbWB+iyKezQw69piGG1ar5nb8bb7i20V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="423526510"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="423526510"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="779431738"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="779431738"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2023 06:50:14 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qBbkM-0005uy-02;
        Tue, 20 Jun 2023 13:50:14 +0000
Date:   Tue, 20 Jun 2023 21:50:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:master 45/58]
 include/media/v4l2-subdev.h:1159:30: error: 'struct v4l2_subdev' has no
 member named 'entity'
Message-ID: <202306202130.hi2jb5Bz-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   32ead23d4c67a6347c771879e20a267a3ff022a8
commit: 1e3f3bfa589dc2ffbd6d487aa93425fc0dbfb2cf [45/58] media: i2c: Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for sensors
config: m68k-randconfig-r011-20230620 (https://download.01.org/0day-ci/archive/20230620/202306202130.hi2jb5Bz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306202130.hi2jb5Bz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306202130.hi2jb5Bz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/media/v4l2-core/v4l2-i2c.c:6:
   include/media/v4l2-subdev.h: In function 'v4l2_subdev_get_pad_format':
>> include/media/v4l2-subdev.h:1159:30: error: 'struct v4l2_subdev' has no member named 'entity'
    1159 |         if (WARN_ON(pad >= sd->entity.num_pads))
         |                              ^~
   include/asm-generic/bug.h:122:32: note: in definition of macro 'WARN_ON'
     122 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/media/v4l2-subdev.h: In function 'v4l2_subdev_get_pad_crop':
   include/media/v4l2-subdev.h:1179:30: error: 'struct v4l2_subdev' has no member named 'entity'
    1179 |         if (WARN_ON(pad >= sd->entity.num_pads))
         |                              ^~
   include/asm-generic/bug.h:122:32: note: in definition of macro 'WARN_ON'
     122 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/media/v4l2-subdev.h: In function 'v4l2_subdev_get_pad_compose':
   include/media/v4l2-subdev.h:1199:30: error: 'struct v4l2_subdev' has no member named 'entity'
    1199 |         if (WARN_ON(pad >= sd->entity.num_pads))
         |                              ^~
   include/asm-generic/bug.h:122:32: note: in definition of macro 'WARN_ON'
     122 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
--
   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/leds.h:12,
                    from drivers/media/v4l2-core/v4l2-subdev.c:13:
   include/media/v4l2-subdev.h: In function 'v4l2_subdev_get_pad_format':
>> include/media/v4l2-subdev.h:1159:30: error: 'struct v4l2_subdev' has no member named 'entity'
    1159 |         if (WARN_ON(pad >= sd->entity.num_pads))
         |                              ^~
   include/asm-generic/bug.h:122:32: note: in definition of macro 'WARN_ON'
     122 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/media/v4l2-subdev.h: In function 'v4l2_subdev_get_pad_crop':
   include/media/v4l2-subdev.h:1179:30: error: 'struct v4l2_subdev' has no member named 'entity'
    1179 |         if (WARN_ON(pad >= sd->entity.num_pads))
         |                              ^~
   include/asm-generic/bug.h:122:32: note: in definition of macro 'WARN_ON'
     122 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/media/v4l2-subdev.h: In function 'v4l2_subdev_get_pad_compose':
   include/media/v4l2-subdev.h:1199:30: error: 'struct v4l2_subdev' has no member named 'entity'
    1199 |         if (WARN_ON(pad >= sd->entity.num_pads))
         |                              ^~
   include/asm-generic/bug.h:122:32: note: in definition of macro 'WARN_ON'
     122 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'subdev_fh_init':
>> drivers/media/v4l2-core/v4l2-subdev.c:55:17: error: implicit declaration of function '__v4l2_subdev_state_alloc' [-Werror=implicit-function-declaration]
      55 |         state = __v4l2_subdev_state_alloc(sd, "fh->state->lock", &key);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-subdev.c:55:15: warning: assignment to 'struct v4l2_subdev_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      55 |         state = __v4l2_subdev_state_alloc(sd, "fh->state->lock", &key);
         |               ^
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'subdev_fh_free':
>> drivers/media/v4l2-core/v4l2-subdev.c:66:9: error: implicit declaration of function '__v4l2_subdev_state_free' [-Werror=implicit-function-declaration]
      66 |         __v4l2_subdev_state_free(fh->state);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'subdev_open':
>> drivers/media/v4l2-core/v4l2-subdev.c:91:37: error: 'struct v4l2_subdev' has no member named 'entity'
      91 |         if (sd->v4l2_dev->mdev && sd->entity.graph_obj.mdev->dev) {
         |                                     ^~
   drivers/media/v4l2-core/v4l2-subdev.c:94:27: error: 'struct v4l2_subdev' has no member named 'entity'
      94 |                 owner = sd->entity.graph_obj.mdev->dev->driver->owner;
         |                           ^~
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'check_state':
>> drivers/media/v4l2-core/v4l2-subdev.c:179:22: error: implicit declaration of function 'v4l2_subdev_state_get_stream_format'; did you mean 'v4l2_subdev_get_try_format'? [-Werror=implicit-function-declaration]
     179 |                 if (!v4l2_subdev_state_get_stream_format(state, pad, stream))
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      v4l2_subdev_get_try_format
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'subdev_ioctl_get_state':
>> drivers/media/v4l2-core/v4l2-subdev.c:504:30: error: implicit declaration of function 'v4l2_subdev_get_unlocked_active_state' [-Werror=implicit-function-declaration]
     504 |                              v4l2_subdev_get_unlocked_active_state(sd);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-subdev.c:503:47: warning: pointer/integer type mismatch in conditional expression
     503 |                              subdev_fh->state :
         |                                               ^
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'subdev_do_ioctl':
   drivers/media/v4l2-core/v4l2-subdev.c:899:58: error: 'struct v4l2_subdev' has no member named 'entity'
     899 |                         const struct media_pad *pads = sd->entity.pads;
         |                                                          ^~
   drivers/media/v4l2-core/v4l2-subdev.c:905:50: error: 'struct v4l2_subdev' has no member named 'entity'
     905 |                         if (route->sink_pad >= sd->entity.num_pads)
         |                                                  ^~
   drivers/media/v4l2-core/v4l2-subdev.c:912:52: error: 'struct v4l2_subdev' has no member named 'entity'
     912 |                         if (route->source_pad >= sd->entity.num_pads)
         |                                                    ^~
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'subdev_do_ioctl_lock':
>> drivers/media/v4l2-core/v4l2-subdev.c:979:25: error: implicit declaration of function 'v4l2_subdev_lock_state'; did you mean 'v4l2_subdev_notify'? [-Werror=implicit-function-declaration]
     979 |                         v4l2_subdev_lock_state(state);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         v4l2_subdev_notify
>> drivers/media/v4l2-core/v4l2-subdev.c:984:25: error: implicit declaration of function 'v4l2_subdev_unlock_state' [-Werror=implicit-function-declaration]
     984 |                         v4l2_subdev_unlock_state(state);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && MEDIA_CONTROLLER [=n]
   Selected by [y]:
   - VIDEO_CAMERA_SENSOR [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && MEDIA_CAMERA_SUPPORT [=y]


vim +1159 include/media/v4l2-subdev.h

02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1143  
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1144  /**
2f91838c3b717b Tomi Valkeinen        2022-04-12  1145   * v4l2_subdev_get_pad_format - ancillary routine to call
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1146   *	&struct v4l2_subdev_pad_config->try_fmt
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1147   *
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1148   * @sd: pointer to &struct v4l2_subdev
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  1149   * @state: pointer to &struct v4l2_subdev_state
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  1150   * @pad: index of the pad in the &struct v4l2_subdev_state->pads array
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1151   */
8ecbde62c063d7 Hans Verkuil          2020-07-17  1152  static inline struct v4l2_mbus_framefmt *
2f91838c3b717b Tomi Valkeinen        2022-04-12  1153  v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  1154  			   struct v4l2_subdev_state *state,
ab9bb73a066459 Mauro Carvalho Chehab 2017-12-19  1155  			   unsigned int pad)
ab9bb73a066459 Mauro Carvalho Chehab 2017-12-19  1156  {
2ba3e38517f5a4 Sakari Ailus          2022-08-26  1157  	if (WARN_ON(!state))
2ba3e38517f5a4 Sakari Ailus          2022-08-26  1158  		return NULL;
ab9bb73a066459 Mauro Carvalho Chehab 2017-12-19 @1159  	if (WARN_ON(pad >= sd->entity.num_pads))
ab9bb73a066459 Mauro Carvalho Chehab 2017-12-19  1160  		pad = 0;
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  1161  	return &state->pads[pad].try_fmt;
7cd5a16b22af7d Stanimir Varbanov     2010-05-21  1162  }
7cd5a16b22af7d Stanimir Varbanov     2010-05-21  1163  

:::::: The code at line 1159 was first introduced by commit
:::::: ab9bb73a0664595b76bb6e4a7ae10064aa58379f media: v4l2-subdev: get rid of __V4L2_SUBDEV_MK_GET_TRY() macro

:::::: TO: Mauro Carvalho Chehab <mchehab@s-opensource.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

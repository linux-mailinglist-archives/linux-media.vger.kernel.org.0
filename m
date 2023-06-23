Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41CFA73B041
	for <lists+linux-media@lfdr.de>; Fri, 23 Jun 2023 07:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbjFWFqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jun 2023 01:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjFWFq1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jun 2023 01:46:27 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1450F268C
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 22:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687499162; x=1719035162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8GNiX3M77PVeymdNW0lw2a6lhQqDnRvS7gvXn3WLmq8=;
  b=IusvaS+n/a9KbDnJVvxhe4vsVuQPiFt4Fskhd9y+4baU0khsn0m413U6
   UG2HpnCQ2u4z+sqUYVEuse84cgxIyGtfn7DAM9Ys5i0GrfwMmjPyeg+Ll
   MmkDIZdjq/0thAlmRTpFG/3s98pFltWn8iSpZ8fKNMfeeDA/uJKEGX+o7
   rvFJM8CLUaT0nhcb5VzPM7x+3R5olhMywmaIMi6se7JJSPqjRZ6YcvIen
   ItDp88X7K+JpHiC5TT/HI5kIDQlpgeujQhORUVeWbF2d6BuYlncSWviQ5
   OCvjfFyURTER3WwPLuqMogd7Oy5RRY+3luQIDHdb7R1wvZuklBrixB4JZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="426678377"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="426678377"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 22:46:00 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="749662464"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="749662464"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Jun 2023 22:45:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qCZcM-000817-0y;
        Fri, 23 Jun 2023 05:45:58 +0000
Date:   Fri, 23 Jun 2023 13:45:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org
Subject: [sailus-media-tree:master 57/58]
 include/media/v4l2-subdev.h:1159:25: error: no member named 'entity' in
 'struct v4l2_subdev'
Message-ID: <202306231315.r0N0wLfe-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   e03cd35afd1787dc8daadbd61ad47da455bc76eb
commit: 8e18f69a26469c79a76acf172967833adb89c55e [57/58] media: i2c: Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for sensors
config: i386-randconfig-i014-20230623 (https://download.01.org/0day-ci/archive/20230623/202306231315.r0N0wLfe-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231315.r0N0wLfe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306231315.r0N0wLfe-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/media/v4l2-core/tuner-core.c:30:
   In file included from include/media/tuner.h:14:
   In file included from include/media/v4l2-mc.h:15:
>> include/media/v4l2-subdev.h:1159:25: error: no member named 'entity' in 'struct v4l2_subdev'
           if (WARN_ON(pad >= sd->entity.num_pads))
                              ~~  ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   In file included from drivers/media/v4l2-core/tuner-core.c:30:
   In file included from include/media/tuner.h:14:
   In file included from include/media/v4l2-mc.h:15:
   include/media/v4l2-subdev.h:1179:25: error: no member named 'entity' in 'struct v4l2_subdev'
           if (WARN_ON(pad >= sd->entity.num_pads))
                              ~~  ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   In file included from drivers/media/v4l2-core/tuner-core.c:30:
   In file included from include/media/tuner.h:14:
   In file included from include/media/v4l2-mc.h:15:
   include/media/v4l2-subdev.h:1199:25: error: no member named 'entity' in 'struct v4l2_subdev'
           if (WARN_ON(pad >= sd->entity.num_pads))
                              ~~  ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   3 errors generated.
--
   In file included from drivers/media/v4l2-core/v4l2-subdev.c:23:
   In file included from include/media/v4l2-device.h:13:
>> include/media/v4l2-subdev.h:1159:25: error: no member named 'entity' in 'struct v4l2_subdev'
           if (WARN_ON(pad >= sd->entity.num_pads))
                              ~~  ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   In file included from drivers/media/v4l2-core/v4l2-subdev.c:23:
   In file included from include/media/v4l2-device.h:13:
   include/media/v4l2-subdev.h:1179:25: error: no member named 'entity' in 'struct v4l2_subdev'
           if (WARN_ON(pad >= sd->entity.num_pads))
                              ~~  ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   In file included from drivers/media/v4l2-core/v4l2-subdev.c:23:
   In file included from include/media/v4l2-device.h:13:
   include/media/v4l2-subdev.h:1199:25: error: no member named 'entity' in 'struct v4l2_subdev'
           if (WARN_ON(pad >= sd->entity.num_pads))
                              ~~  ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
>> drivers/media/v4l2-core/v4l2-subdev.c:55:10: error: call to undeclared function '__v4l2_subdev_state_alloc'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           state = __v4l2_subdev_state_alloc(sd, "fh->state->lock", &key);
                   ^
>> drivers/media/v4l2-core/v4l2-subdev.c:55:8: error: incompatible integer to pointer conversion assigning to 'struct v4l2_subdev_state *' from 'int' [-Wint-conversion]
           state = __v4l2_subdev_state_alloc(sd, "fh->state->lock", &key);
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-subdev.c:66:2: error: call to undeclared function '__v4l2_subdev_state_free'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __v4l2_subdev_state_free(fh->state);
           ^
>> drivers/media/v4l2-core/v4l2-subdev.c:91:32: error: no member named 'entity' in 'struct v4l2_subdev'
           if (sd->v4l2_dev->mdev && sd->entity.graph_obj.mdev->dev) {
                                     ~~  ^
   drivers/media/v4l2-core/v4l2-subdev.c:94:15: error: no member named 'entity' in 'struct v4l2_subdev'
                   owner = sd->entity.graph_obj.mdev->dev->driver->owner;
                           ~~  ^
>> drivers/media/v4l2-core/v4l2-subdev.c:179:8: error: call to undeclared function 'v4l2_subdev_state_get_stream_format'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   if (!v4l2_subdev_state_get_stream_format(state, pad, stream))
                        ^
   drivers/media/v4l2-core/v4l2-subdev.c:179:8: note: did you mean 'v4l2_subdev_get_pad_format'?
   include/media/v4l2-subdev.h:1153:1: note: 'v4l2_subdev_get_pad_format' declared here
   v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
   ^
>> drivers/media/v4l2-core/v4l2-subdev.c:504:9: error: call to undeclared function 'v4l2_subdev_get_unlocked_active_state'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                                v4l2_subdev_get_unlocked_active_state(sd);
                                ^
>> drivers/media/v4l2-core/v4l2-subdev.c:502:41: warning: pointer/integer type mismatch in conditional expression ('struct v4l2_subdev_state *' and 'int') [-Wconditional-type-mismatch]
           return which == V4L2_SUBDEV_FORMAT_TRY ?
                                                  ^
   drivers/media/v4l2-core/v4l2-subdev.c:899:39: error: no member named 'entity' in 'struct v4l2_subdev'
                           const struct media_pad *pads = sd->entity.pads;
                                                          ~~  ^
   drivers/media/v4l2-core/v4l2-subdev.c:905:31: error: no member named 'entity' in 'struct v4l2_subdev'
                           if (route->sink_pad >= sd->entity.num_pads)
                                                  ~~  ^
   drivers/media/v4l2-core/v4l2-subdev.c:912:33: error: no member named 'entity' in 'struct v4l2_subdev'
                           if (route->source_pad >= sd->entity.num_pads)
                                                    ~~  ^
>> drivers/media/v4l2-core/v4l2-subdev.c:979:4: error: call to undeclared function 'v4l2_subdev_lock_state'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           v4l2_subdev_lock_state(state);
                           ^
>> drivers/media/v4l2-core/v4l2-subdev.c:984:4: error: call to undeclared function 'v4l2_subdev_unlock_state'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           v4l2_subdev_unlock_state(state);
                           ^
   1 warning and 15 errors generated.

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

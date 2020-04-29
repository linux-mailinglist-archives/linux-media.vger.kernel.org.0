Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0016B1BD54E
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 09:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgD2HBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 03:01:36 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:47719 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgD2HBg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 03:01:36 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7073D20000E;
        Wed, 29 Apr 2020 07:01:31 +0000 (UTC)
Date:   Wed, 29 Apr 2020 09:04:42 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     kbuild test robot <lkp@intel.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        kbuild-all@lists.01.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v5 4/6] media: v4l2-subdev: Assume V4L2_SUBDEV_API is
 selected
Message-ID: <20200429070442.ghdf5ro7nidspenm@uno.localdomain>
References: <20200428210609.6793-5-jacopo@jmondi.org>
 <202004290742.VN7hf64i%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202004290742.VN7hf64i%lkp@intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here it goes -.-'
I was hoping to have this going through kbuild soon

Would guarding the whole file handle operations and the ioctl handler
a best option then ?

On Wed, Apr 29, 2020 at 07:44:30AM +0800, kbuild test robot wrote:
> Hi Jacopo,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on linuxtv-media/master]
> [also build test ERROR on linus/master v5.7-rc3 next-20200428]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Jacopo-Mondi/media-Register-read-only-sub-dev-devnode/20200429-062133
> base:   git://linuxtv.org/media_tree.git master
> config: arm-at91_dt_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=arm
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/media/v4l2-core/v4l2-subdev.c: In function 'subdev_fh_init':
> >> drivers/media/v4l2-core/v4l2-subdev.c:28:5: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>       28 |   fh->pad = v4l2_subdev_alloc_pad_config(sd);
>          |     ^~
>    drivers/media/v4l2-core/v4l2-subdev.c:29:9: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>       29 |   if (fh->pad == NULL)
>          |         ^~
>    drivers/media/v4l2-core/v4l2-subdev.c: In function 'subdev_fh_free':
>    drivers/media/v4l2-core/v4l2-subdev.c:38:32: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>       38 |  v4l2_subdev_free_pad_config(fh->pad);
>          |                                ^~
>    drivers/media/v4l2-core/v4l2-subdev.c:39:4: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>       39 |  fh->pad = NULL;
>          |    ^~
>    In file included from include/media/v4l2-device.h:13,
>                     from drivers/media/v4l2-core/v4l2-subdev.c:20:
>    drivers/media/v4l2-core/v4l2-subdev.c: In function 'subdev_do_ioctl':
>    drivers/media/v4l2-core/v4l2-subdev.c:469:54: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      469 |   return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->pad, format);
>          |                                                      ^~
>    include/media/v4l2-subdev.h:1111:16: note: in definition of macro 'v4l2_subdev_call'
>     1111 |        __sd, ##args); \
>          |                ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:469:54: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      469 |   return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->pad, format);
>          |                                                      ^~
>    include/media/v4l2-subdev.h:1113:39: note: in definition of macro 'v4l2_subdev_call'
>     1113 |    __result = __sd->ops->o->f(__sd, ##args); \
>          |                                       ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:480:54: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      480 |   return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
>          |                                                      ^~
>    include/media/v4l2-subdev.h:1111:16: note: in definition of macro 'v4l2_subdev_call'
>     1111 |        __sd, ##args); \
>          |                ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:480:54: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      480 |   return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
>          |                                                      ^~
>    include/media/v4l2-subdev.h:1113:39: note: in definition of macro 'v4l2_subdev_call'
>     1113 |    __result = __sd->ops->o->f(__sd, ##args); \
>          |                                       ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:494:37: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      494 |    sd, pad, get_selection, subdev_fh->pad, &sel);
>          |                                     ^~
>    include/media/v4l2-subdev.h:1111:16: note: in definition of macro 'v4l2_subdev_call'
>     1111 |        __sd, ##args); \
>          |                ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:494:37: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      494 |    sd, pad, get_selection, subdev_fh->pad, &sel);
>          |                                     ^~
>    include/media/v4l2-subdev.h:1113:39: note: in definition of macro 'v4l2_subdev_call'
>     1113 |    __result = __sd->ops->o->f(__sd, ##args); \
>          |                                       ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:516:37: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      516 |    sd, pad, set_selection, subdev_fh->pad, &sel);
>          |                                     ^~
>    include/media/v4l2-subdev.h:1111:16: note: in definition of macro 'v4l2_subdev_call'
>     1111 |        __sd, ##args); \
>          |                ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:516:37: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      516 |    sd, pad, set_selection, subdev_fh->pad, &sel);
>          |                                     ^~
>    include/media/v4l2-subdev.h:1113:39: note: in definition of macro 'v4l2_subdev_call'
>     1113 |    __result = __sd->ops->o->f(__sd, ##args); \
>          |                                       ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:527:61: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      527 |   return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->pad,
>          |                                                             ^~
>    include/media/v4l2-subdev.h:1111:16: note: in definition of macro 'v4l2_subdev_call'
>     1111 |        __sd, ##args); \
>          |                ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:527:61: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      527 |   return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->pad,
>          |                                                             ^~
>    include/media/v4l2-subdev.h:1113:39: note: in definition of macro 'v4l2_subdev_call'
>     1113 |    __result = __sd->ops->o->f(__sd, ##args); \
>          |                                       ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:535:62: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      535 |   return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->pad,
>          |                                                              ^~
>    include/media/v4l2-subdev.h:1111:16: note: in definition of macro 'v4l2_subdev_call'
>     1111 |        __sd, ##args); \
>          |                ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:535:62: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      535 |   return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->pad,
>          |                                                              ^~
>    include/media/v4l2-subdev.h:1113:39: note: in definition of macro 'v4l2_subdev_call'
>     1113 |    __result = __sd->ops->o->f(__sd, ##args); \
>          |                                       ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:560:66: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      560 |   return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->pad,
>          |                                                                  ^~
>    include/media/v4l2-subdev.h:1111:16: note: in definition of macro 'v4l2_subdev_call'
>     1111 |        __sd, ##args); \
>          |                ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:560:66: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>      560 |   return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->pad,
>          |                                                                  ^~
>    include/media/v4l2-subdev.h:1113:39: note: in definition of macro 'v4l2_subdev_call'
>     1113 |    __result = __sd->ops->o->f(__sd, ##args); \
>          |                                       ^~~~
>    drivers/media/v4l2-core/v4l2-subdev.c:569:37: error: 'struct v4l2_subdev_fh' has no member named 'pad'
>
> vim +28 drivers/media/v4l2-core/v4l2-subdev.c
>
> 2096a5dcf9704f drivers/media/video/v4l2-subdev.c     Laurent Pinchart  2009-12-09  24
> 7cd5a16b22af7d drivers/media/video/v4l2-subdev.c     Stanimir Varbanov 2010-05-21  25  static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
> 7cd5a16b22af7d drivers/media/video/v4l2-subdev.c     Stanimir Varbanov 2010-05-21  26  {
> 9b02cbb3ede89b drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart  2015-04-24  27  	if (sd->entity.num_pads) {
> 9b02cbb3ede89b drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart  2015-04-24 @28  		fh->pad = v4l2_subdev_alloc_pad_config(sd);
> ae184cda8d0eeb drivers/media/video/v4l2-subdev.c     Sakari Ailus      2011-10-14  29  		if (fh->pad == NULL)
> 7cd5a16b22af7d drivers/media/video/v4l2-subdev.c     Stanimir Varbanov 2010-05-21  30  			return -ENOMEM;
> 9b02cbb3ede89b drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart  2015-04-24  31  	}
> b9e6aad3939a62 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi      2020-04-28  32
> 7cd5a16b22af7d drivers/media/video/v4l2-subdev.c     Stanimir Varbanov 2010-05-21  33  	return 0;
> 7cd5a16b22af7d drivers/media/video/v4l2-subdev.c     Stanimir Varbanov 2010-05-21  34  }
> 7cd5a16b22af7d drivers/media/video/v4l2-subdev.c     Stanimir Varbanov 2010-05-21  35
>
> :::::: The code at line 28 was first introduced by commit
> :::::: 9b02cbb3ede89b5cd84bbe4ef493bd130d76b070 [media] v4l: subdev: Add pad config allocator and init
>
> :::::: TO: Laurent Pinchart <laurent.pinchart@linaro.org>
> :::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



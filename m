Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13645756A59
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 19:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbjGQR3L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 13:29:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbjGQR3K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 13:29:10 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC7010E4
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 10:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689614916; x=1721150916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kYgGvCiDe31MIMxswYCIn9LkB3/FZBhk16LZ7xosFIE=;
  b=QnF6ffys6tUdbGX+I9DiIwEnhSv443kf4ukjaA737q8huSyG4N5qoZ2e
   FDnKGU7DXAqPom8uL90S9omNUnCIw0UBC8htLCek0aeeKBmQ33cQyYv9A
   RJcw4gFBc7l0RieOV3+xIXPb8bPIpAlt8dNo715uWYeUXGarp7Ct17MXR
   2J55ocgrra1bdMEm0Ct4XoSprbRrGPBnW+EL/wlT5IdrF6eY/Mb0ohK2x
   fUfwyf3cqqm+nLTWTbdDrW0uEADx8UDKUnofWlyYYL7vE6e1WXRveyGGi
   PHSTQYCMW6obhA1JsjwADq3/rwFFnVFNAXwPoa6WZKwDiBA6ME+PX0vmQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="396820739"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="396820739"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 10:28:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="723283017"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="723283017"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Jul 2023 10:28:05 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qLS0y-0009lU-0J;
        Mon, 17 Jul 2023 17:28:04 +0000
Date:   Tue, 18 Jul 2023 01:27:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:async-multi 19/38]
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:819:18: error:
 initialization of 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev
 *, struct v4l2_async_connection *)' from incompatible pointer type 'int
 (*)(struct v4l2_async_notifier *, st...
Message-ID: <202307180109.WQuaPuRt-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://linuxtv.org/sailus/media_tree.git async-multi
head:   08781366d65974d473692f519e0b4345584d3761
commit: a34590c7bca91dfd8fce26d5707c6470fd7508f9 [19/38] media: v4l: async: Rename v4l2_async_subdev as v4l2_async_connection
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230718/202307180109.WQuaPuRt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180109.WQuaPuRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180109.WQuaPuRt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:770:34: error: field 'asd' has incomplete type
     770 |         struct v4l2_async_subdev asd;
         |                                  ^~~
   In file included from include/linux/bits.h:21,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:12:
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c: In function 'atomisp_notifier_bound':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:774:33: note: in expansion of macro 'container_of'
     774 | #define to_sensor_asd(a)        container_of(a, struct sensor_async_subdev, asd)
         |                                 ^~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:783:45: note: in expansion of macro 'to_sensor_asd'
     783 |         struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
         |                                             ^~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c: In function 'atomisp_notifier_unbind':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:774:33: note: in expansion of macro 'container_of'
     774 | #define to_sensor_asd(a)        container_of(a, struct sensor_async_subdev, asd)
         |                                 ^~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:805:45: note: in expansion of macro 'to_sensor_asd'
     805 |         struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
         |                                             ^~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c: At top level:
>> drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:819:18: error: initialization of 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
     819 |         .bound = atomisp_notifier_bound,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:819:18: note: (near initialization for 'atomisp_async_ops.bound')
>> drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:820:19: error: initialization of 'void (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'void (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
     820 |         .unbind = atomisp_notifier_unbind,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:820:19: note: (near initialization for 'atomisp_async_ops.unbind')
   cc1: some warnings being treated as errors


vim +819 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c

8d28ec7e9145ef Hans de Goede 2023-05-25  768  
8d28ec7e9145ef Hans de Goede 2023-05-25  769  struct sensor_async_subdev {
8d28ec7e9145ef Hans de Goede 2023-05-25 @770  	struct v4l2_async_subdev asd;
8d28ec7e9145ef Hans de Goede 2023-05-25  771  	int port;
8d28ec7e9145ef Hans de Goede 2023-05-25  772  };
8d28ec7e9145ef Hans de Goede 2023-05-25  773  
8d28ec7e9145ef Hans de Goede 2023-05-25  774  #define to_sensor_asd(a)	container_of(a, struct sensor_async_subdev, asd)
8d28ec7e9145ef Hans de Goede 2023-05-25  775  #define notifier_to_atomisp(n)	container_of(n, struct atomisp_device, notifier)
8d28ec7e9145ef Hans de Goede 2023-05-25  776  
8d28ec7e9145ef Hans de Goede 2023-05-25  777  /* .bound() notifier callback when a match is found */
8d28ec7e9145ef Hans de Goede 2023-05-25  778  static int atomisp_notifier_bound(struct v4l2_async_notifier *notifier,
8d28ec7e9145ef Hans de Goede 2023-05-25  779  				  struct v4l2_subdev *sd,
8d28ec7e9145ef Hans de Goede 2023-05-25  780  				  struct v4l2_async_subdev *asd)
8d28ec7e9145ef Hans de Goede 2023-05-25  781  {
8d28ec7e9145ef Hans de Goede 2023-05-25  782  	struct atomisp_device *isp = notifier_to_atomisp(notifier);
8d28ec7e9145ef Hans de Goede 2023-05-25  783  	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
8d28ec7e9145ef Hans de Goede 2023-05-25  784  
8d28ec7e9145ef Hans de Goede 2023-05-25  785  	if (s_asd->port >= ATOMISP_CAMERA_NR_PORTS) {
8d28ec7e9145ef Hans de Goede 2023-05-25  786  		dev_err(isp->dev, "port %d not supported\n", s_asd->port);
8d28ec7e9145ef Hans de Goede 2023-05-25  787  		return -EINVAL;
8d28ec7e9145ef Hans de Goede 2023-05-25  788  	}
8d28ec7e9145ef Hans de Goede 2023-05-25  789  
8d28ec7e9145ef Hans de Goede 2023-05-25  790  	if (isp->sensor_subdevs[s_asd->port]) {
8d28ec7e9145ef Hans de Goede 2023-05-25  791  		dev_err(isp->dev, "port %d already has a sensor attached\n", s_asd->port);
8d28ec7e9145ef Hans de Goede 2023-05-25  792  		return -EBUSY;
8d28ec7e9145ef Hans de Goede 2023-05-25  793  	}
8d28ec7e9145ef Hans de Goede 2023-05-25  794  
8d28ec7e9145ef Hans de Goede 2023-05-25  795  	isp->sensor_subdevs[s_asd->port] = sd;
8d28ec7e9145ef Hans de Goede 2023-05-25  796  	return 0;
8d28ec7e9145ef Hans de Goede 2023-05-25  797  }
8d28ec7e9145ef Hans de Goede 2023-05-25  798  
8d28ec7e9145ef Hans de Goede 2023-05-25  799  /* The .unbind callback */
8d28ec7e9145ef Hans de Goede 2023-05-25  800  static void atomisp_notifier_unbind(struct v4l2_async_notifier *notifier,
8d28ec7e9145ef Hans de Goede 2023-05-25  801  				    struct v4l2_subdev *sd,
8d28ec7e9145ef Hans de Goede 2023-05-25  802  				    struct v4l2_async_subdev *asd)
8d28ec7e9145ef Hans de Goede 2023-05-25  803  {
8d28ec7e9145ef Hans de Goede 2023-05-25  804  	struct atomisp_device *isp = notifier_to_atomisp(notifier);
8d28ec7e9145ef Hans de Goede 2023-05-25  805  	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
8d28ec7e9145ef Hans de Goede 2023-05-25  806  
8d28ec7e9145ef Hans de Goede 2023-05-25  807  	isp->sensor_subdevs[s_asd->port] = NULL;
8d28ec7e9145ef Hans de Goede 2023-05-25  808  }
8d28ec7e9145ef Hans de Goede 2023-05-25  809  
8d28ec7e9145ef Hans de Goede 2023-05-25  810  /* .complete() is called after all subdevices have been located */
8d28ec7e9145ef Hans de Goede 2023-05-25  811  static int atomisp_notifier_complete(struct v4l2_async_notifier *notifier)
8d28ec7e9145ef Hans de Goede 2023-05-25  812  {
8d28ec7e9145ef Hans de Goede 2023-05-25  813  	struct atomisp_device *isp = notifier_to_atomisp(notifier);
8d28ec7e9145ef Hans de Goede 2023-05-25  814  
8d28ec7e9145ef Hans de Goede 2023-05-25  815  	return atomisp_register_device_nodes(isp);
8d28ec7e9145ef Hans de Goede 2023-05-25  816  }
8d28ec7e9145ef Hans de Goede 2023-05-25  817  
8d28ec7e9145ef Hans de Goede 2023-05-25  818  static const struct v4l2_async_notifier_operations atomisp_async_ops = {
8d28ec7e9145ef Hans de Goede 2023-05-25 @819  	.bound = atomisp_notifier_bound,
8d28ec7e9145ef Hans de Goede 2023-05-25 @820  	.unbind = atomisp_notifier_unbind,
8d28ec7e9145ef Hans de Goede 2023-05-25  821  	.complete = atomisp_notifier_complete,
8d28ec7e9145ef Hans de Goede 2023-05-25  822  };
8d28ec7e9145ef Hans de Goede 2023-05-25  823  

:::::: The code at line 819 was first introduced by commit
:::::: 8d28ec7e9145ef6308ab3438d73308ec6ea14360 media: atomisp: Add support for v4l2-async sensor registration

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

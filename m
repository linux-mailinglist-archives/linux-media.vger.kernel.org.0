Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B91756CD7
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 21:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjGQTKL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 15:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjGQTKK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 15:10:10 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AFD116
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 12:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689621009; x=1721157009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QkjoOq4MRISDQJ4ms1A4pEFBqGTu3aqPBzgYirwhqKA=;
  b=HWr5gyqVqRQMCsWgv/p8ObqAIJhibAwq0wJzv9Hu8bcPQT2NFpo84oPZ
   GRd9zZn57roRRsvubHEkUdP0eq33+nUOLkhBa8AdKZ2STNnpucxzIJSrU
   +IjieP9/D8W+jQc/4IxrKywkWHAgmfxcAZoA97gt9z17pmFMgas6ze8JQ
   /GUeY7XZbgnEZZLtyZQ2UmXEkw6MOm1NRI7YEW6G30Z5fKvf0HdmD4fxD
   670qlMLgTVnuTl9qkmrWBTX2a2RvkvYvfMmADeHry9dnpxzKVV9gqwwF2
   C9B7qZSUXlcPLYkJx3l6FNsSlhaiueUUfYrxszDVI/WV410uHeNGpStf9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="350881475"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="350881475"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 12:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="758530011"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="758530011"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Jul 2023 12:10:07 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qLTbi-0009qy-1e;
        Mon, 17 Jul 2023 19:10:06 +0000
Date:   Tue, 18 Jul 2023 03:09:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:async-multi 37/38]
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:828:9: error: too
 few arguments to function 'v4l2_async_nf_init'
Message-ID: <202307180320.jErFaHnP-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git async-multi
head:   08781366d65974d473692f519e0b4345584d3761
commit: 9d9ffd33e490ccef9273215b1f3141c358e0b7a2 [37/38] media: v4l: async: Set v4l2_device and subdev in async notifier init
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230718/202307180320.jErFaHnP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180320.jErFaHnP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180320.jErFaHnP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:770:34: error: field 'asd' has incomplete type
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
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:819:18: error: initialization of 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
     819 |         .bound = atomisp_notifier_bound,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:819:18: note: (near initialization for 'atomisp_async_ops.bound')
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:820:19: error: initialization of 'void (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'void (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
     820 |         .unbind = atomisp_notifier_unbind,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:820:19: note: (near initialization for 'atomisp_async_ops.unbind')
   drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c: In function 'atomisp_csi2_bridge_parse_firmware':
>> drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:828:9: error: too few arguments to function 'v4l2_async_nf_init'
     828 |         v4l2_async_nf_init(&isp->notifier);
         |         ^~~~~~~~~~~~~~~~~~
   In file included from include/media/v4l2-subdev.h:14,
                    from drivers/staging/media/atomisp/pci/atomisp_cmd.h:28,
                    from drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:19:
   include/media/v4l2-async.h:159:6: note: declared here
     159 | void v4l2_async_nf_init(struct v4l2_async_notifier *notifier,
         |      ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/staging/media/atomisp/pci/atomisp_v4l2.c: In function 'atomisp_pci_probe':
>> drivers/staging/media/atomisp/pci/atomisp_v4l2.c:1511:38: error: passing argument 1 of 'v4l2_async_nf_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1511 |         err = v4l2_async_nf_register(&isp->v4l2_dev, &isp->notifier);
         |                                      ^~~~~~~~~~~~~~
         |                                      |
         |                                      struct v4l2_device *
   In file included from include/media/v4l2-subdev.h:14,
                    from drivers/staging/media/atomisp//include/hmm/../../include/linux/atomisp_platform.h:25,
                    from drivers/staging/media/atomisp//include/hmm/../../include/linux/atomisp_gmin_platform.h:19,
                    from drivers/staging/media/atomisp/pci/atomisp_v4l2.c:34:
   include/media/v4l2-async.h:281:56: note: expected 'struct v4l2_async_notifier *' but argument is of type 'struct v4l2_device *'
     281 | int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/staging/media/atomisp/pci/atomisp_v4l2.c:1511:15: error: too many arguments to function 'v4l2_async_nf_register'
    1511 |         err = v4l2_async_nf_register(&isp->v4l2_dev, &isp->notifier);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-async.h:281:5: note: declared here
     281 | int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
         |     ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/v4l2_async_nf_init +828 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c

8d28ec7e9145ef Hans de Goede 2023-05-25  823  
8d28ec7e9145ef Hans de Goede 2023-05-25  824  int atomisp_csi2_bridge_parse_firmware(struct atomisp_device *isp)
8d28ec7e9145ef Hans de Goede 2023-05-25  825  {
8d28ec7e9145ef Hans de Goede 2023-05-25  826  	int i, mipi_port, ret;
8d28ec7e9145ef Hans de Goede 2023-05-25  827  
8d28ec7e9145ef Hans de Goede 2023-05-25 @828  	v4l2_async_nf_init(&isp->notifier);

:::::: The code at line 828 was first introduced by commit
:::::: 8d28ec7e9145ef6308ab3438d73308ec6ea14360 media: atomisp: Add support for v4l2-async sensor registration

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

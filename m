Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB52C769AB1
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 17:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbjGaPVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 11:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjGaPVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 11:21:05 -0400
Received: from mgamail.intel.com (unknown [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B442BC3
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690816863; x=1722352863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/EscTkRtD7jAqlvkMCVgNtGWa02l8XolWSZOn4umt9g=;
  b=ijgyjvv+6pNBPGV2uqVJKM6Wtzm7oY+NBUAOnCS+rtVRNQ6v5U38BY8z
   ZV/Dy1BKS7JkxmG1s2uXPSlEbTT7mjSdDCsUQ3tNf9P+cPdPBNQRbN/G8
   3PS1I/e9gTjEe1GmftQPg+gW04cV5oP6k4fUByYiWKXWpD8hq0VG7DYbI
   TGwVF+VFuT7HIxGAnalcN3wXdpJb/RIz3r6dkdu2cnc4US8cJkhZqr8KQ
   PcWFk1AGbd6wBQpbS8fn/+Gi8vG7lYKAndH5/hsmOkrON9j6NwbW5L+dU
   EC0gAuj7PFvQWUJekDD6Ptv1cFq/8V8TgQGVq9gO/NOmQ7HpjSXBiDwqO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="348643320"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="348643320"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 08:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="793754615"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="793754615"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 31 Jul 2023 08:21:01 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qQUhh-0005C7-0Y;
        Mon, 31 Jul 2023 15:21:01 +0000
Date:   Mon, 31 Jul 2023 23:20:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:master 40/41]
 drivers/media/pci/intel/ivsc/mei_csi.c:574:40: warning: 'struct
 v4l2_async_subdev' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202307312307.t1gJlUux-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   f6a458a2c82c225125c937cfd5675c2a3c494b33
commit: cc561f8b16e6ce155c6368eb6bb3497f3d51332b [40/41] media: pci: intel: ivsc: Add CSI submodule
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230731/202307312307.t1gJlUux-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307312307.t1gJlUux-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307312307.t1gJlUux-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ivsc/mei_csi.c:574:40: warning: 'struct v4l2_async_subdev' declared inside parameter list will not be visible outside of this definition or declaration
     574 |                                 struct v4l2_async_subdev *asd)
         |                                        ^~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ivsc/mei_csi.c: In function 'mei_csi_notify_bound':
   drivers/media/pci/intel/ivsc/mei_csi.c:579:63: error: invalid use of undefined type 'struct v4l2_async_subdev'
     579 |         pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
         |                                                               ^~
   drivers/media/pci/intel/ivsc/mei_csi.c: At top level:
   drivers/media/pci/intel/ivsc/mei_csi.c:595:42: warning: 'struct v4l2_async_subdev' declared inside parameter list will not be visible outside of this definition or declaration
     595 |                                   struct v4l2_async_subdev *asd)
         |                                          ^~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ivsc/mei_csi.c:603:18: error: initialization of 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
     603 |         .bound = mei_csi_notify_bound,
         |                  ^~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ivsc/mei_csi.c:603:18: note: (near initialization for 'mei_csi_notify_ops.bound')
   drivers/media/pci/intel/ivsc/mei_csi.c:604:19: error: initialization of 'void (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'void (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
     604 |         .unbind = mei_csi_notify_unbind,
         |                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ivsc/mei_csi.c:604:19: note: (near initialization for 'mei_csi_notify_ops.unbind')
   drivers/media/pci/intel/ivsc/mei_csi.c: In function 'mei_csi_parse_firmware':
   drivers/media/pci/intel/ivsc/mei_csi.c:669:9: error: too few arguments to function 'v4l2_async_nf_init'
     669 |         v4l2_async_nf_init(&csi->notifier);
         |         ^~~~~~~~~~~~~~~~~~
   In file included from drivers/media/pci/intel/ivsc/mei_csi.c:28:
   include/media/v4l2-async.h:159:6: note: declared here
     159 | void v4l2_async_nf_init(struct v4l2_async_notifier *notifier,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ivsc/mei_csi.c:673:40: error: invalid application of 'sizeof' to incomplete type 'struct v4l2_async_subdev'
     673 |                                        struct v4l2_async_subdev);
         |                                        ^~~~~~
   include/media/v4l2-async.h:196:70: note: in definition of macro 'v4l2_async_nf_add_fwnode'
     196 |         ((type *)__v4l2_async_nf_add_fwnode(notifier, fwnode, sizeof(type)))
         |                                                                      ^~~~
   drivers/media/pci/intel/ivsc/mei_csi.c:685:15: error: implicit declaration of function 'v4l2_async_subdev_nf_register'; did you mean 'v4l2_async_subdev_nf_init'? [-Werror=implicit-function-declaration]
     685 |         ret = v4l2_async_subdev_nf_register(&csi->subdev, &csi->notifier);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_async_subdev_nf_init
   cc1: some warnings being treated as errors


vim +574 drivers/media/pci/intel/ivsc/mei_csi.c

   571	
   572	static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
   573					struct v4l2_subdev *subdev,
 > 574					struct v4l2_async_subdev *asd)
   575	{
   576		struct mei_csi *csi = notifier_to_csi(notifier);
   577		int pad;
   578	
   579		pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
   580						  MEDIA_PAD_FL_SOURCE);
   581		if (pad < 0)
   582			return pad;
   583	
   584		csi->remote = subdev;
   585		csi->remote_pad = pad;
   586	
   587		return media_create_pad_link(&subdev->entity, pad,
   588					     &csi->subdev.entity, 1,
   589					     MEDIA_LNK_FL_ENABLED |
   590					     MEDIA_LNK_FL_IMMUTABLE);
   591	}
   592	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

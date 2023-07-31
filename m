Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6A2576A1CD
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 22:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbjGaUVE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 16:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGaUVD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 16:21:03 -0400
Received: from mgamail.intel.com (unknown [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5C6133
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 13:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690834862; x=1722370862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gNp60KuEaU9JQP/SSpY7/dorsQLX5lDQJWMfSkqaNrk=;
  b=fIOHiJ2xIdVT0Pkh4VDcg8NwTsIj2hyElUZoBtpaRcxID2ECG5AObo+7
   +mBk+g0ucjYrQEjuhHD40QCXMS+bBJxwnjkKi2hIqCgRoZSlsBQ9dt+Uj
   d+41ZYu50PFow6bKBmns4lAlMnJrJDKqPeFIjQUM5svspa7O78omGgzt2
   ssZv+VKUX5hUvU5Q4I+8mp6uTg/0xmZ64OxFmKxEoJksOZK+Xdkc9B/j5
   F7my59VjLPsk/x6ULhN1I3lf6HMsws+ldH2U/xxqaSCNDgqwHSJKvZnEH
   Zv7zDSNKbMxF/Tgb7TDuDbwPHFbr+hImV7FIk3htn56DMJoqX1wWjB8cl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="372740656"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="372740656"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 13:21:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="705559477"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="705559477"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 31 Jul 2023 13:21:00 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qQZNy-0005Lv-1X;
        Mon, 31 Jul 2023 20:20:58 +0000
Date:   Tue, 1 Aug 2023 04:20:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:master 40/41]
 drivers/media/pci/intel/ivsc/mei_csi.c:579:63: error: invalid use of
 undefined type 'struct v4l2_async_subdev'
Message-ID: <202308010451.yxM9it0W-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   d4d9aa36901b6c499aa8ba7751172e323f4b18a9
commit: cc561f8b16e6ce155c6368eb6bb3497f3d51332b [40/41] media: pci: intel: ivsc: Add CSI submodule
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230801/202308010451.yxM9it0W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010451.yxM9it0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010451.yxM9it0W-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/pci/intel/ivsc/mei_csi.c:574:40: warning: 'struct v4l2_async_subdev' declared inside parameter list will not be visible outside of this definition or declaration
     574 |                                 struct v4l2_async_subdev *asd)
         |                                        ^~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ivsc/mei_csi.c: In function 'mei_csi_notify_bound':
>> drivers/media/pci/intel/ivsc/mei_csi.c:579:63: error: invalid use of undefined type 'struct v4l2_async_subdev'
     579 |         pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
         |                                                               ^~
   drivers/media/pci/intel/ivsc/mei_csi.c: At top level:
   drivers/media/pci/intel/ivsc/mei_csi.c:595:42: warning: 'struct v4l2_async_subdev' declared inside parameter list will not be visible outside of this definition or declaration
     595 |                                   struct v4l2_async_subdev *asd)
         |                                          ^~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ivsc/mei_csi.c:603:18: error: initialization of 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
     603 |         .bound = mei_csi_notify_bound,
         |                  ^~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ivsc/mei_csi.c:603:18: note: (near initialization for 'mei_csi_notify_ops.bound')
>> drivers/media/pci/intel/ivsc/mei_csi.c:604:19: error: initialization of 'void (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'void (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
     604 |         .unbind = mei_csi_notify_unbind,
         |                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ivsc/mei_csi.c:604:19: note: (near initialization for 'mei_csi_notify_ops.unbind')
   drivers/media/pci/intel/ivsc/mei_csi.c: In function 'mei_csi_parse_firmware':
>> drivers/media/pci/intel/ivsc/mei_csi.c:669:9: error: too few arguments to function 'v4l2_async_nf_init'
     669 |         v4l2_async_nf_init(&csi->notifier);
         |         ^~~~~~~~~~~~~~~~~~
   In file included from drivers/media/pci/intel/ivsc/mei_csi.c:28:
   include/media/v4l2-async.h:159:6: note: declared here
     159 | void v4l2_async_nf_init(struct v4l2_async_notifier *notifier,
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ivsc/mei_csi.c:673:40: error: invalid application of 'sizeof' to incomplete type 'struct v4l2_async_subdev'
     673 |                                        struct v4l2_async_subdev);
         |                                        ^~~~~~
   include/media/v4l2-async.h:196:70: note: in definition of macro 'v4l2_async_nf_add_fwnode'
     196 |         ((type *)__v4l2_async_nf_add_fwnode(notifier, fwnode, sizeof(type)))
         |                                                                      ^~~~
>> drivers/media/pci/intel/ivsc/mei_csi.c:685:15: error: implicit declaration of function 'v4l2_async_subdev_nf_register'; did you mean 'v4l2_async_subdev_nf_init'? [-Werror=implicit-function-declaration]
     685 |         ret = v4l2_async_subdev_nf_register(&csi->subdev, &csi->notifier);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_async_subdev_nf_init
   cc1: some warnings being treated as errors


vim +579 drivers/media/pci/intel/ivsc/mei_csi.c

   571	
   572	static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
   573					struct v4l2_subdev *subdev,
 > 574					struct v4l2_async_subdev *asd)
   575	{
   576		struct mei_csi *csi = notifier_to_csi(notifier);
   577		int pad;
   578	
 > 579		pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
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
   593	static void mei_csi_notify_unbind(struct v4l2_async_notifier *notifier,
   594					  struct v4l2_subdev *subdev,
 > 595					  struct v4l2_async_subdev *asd)
   596	{
   597		struct mei_csi *csi = notifier_to_csi(notifier);
   598	
   599		csi->remote = NULL;
   600	}
   601	
   602	static const struct v4l2_async_notifier_operations mei_csi_notify_ops = {
 > 603		.bound = mei_csi_notify_bound,
 > 604		.unbind = mei_csi_notify_unbind,
   605	};
   606	
   607	static int mei_csi_init_controls(struct mei_csi *csi)
   608	{
   609		u32 max;
   610		int ret;
   611	
   612		ret = v4l2_ctrl_handler_init(&csi->ctrl_handler, 2);
   613		if (ret)
   614			return ret;
   615	
   616		csi->ctrl_handler.lock = &csi->lock;
   617	
   618		max = ARRAY_SIZE(link_freq_menu_items) - 1;
   619		csi->freq_ctrl = v4l2_ctrl_new_int_menu(&csi->ctrl_handler,
   620							&mei_csi_ctrl_ops,
   621							V4L2_CID_LINK_FREQ,
   622							max,
   623							0,
   624							link_freq_menu_items);
   625		if (csi->freq_ctrl)
   626			csi->freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY |
   627						 V4L2_CTRL_FLAG_VOLATILE;
   628	
   629		csi->privacy_ctrl = v4l2_ctrl_new_std(&csi->ctrl_handler, NULL,
   630						      V4L2_CID_PRIVACY, 0, 1, 1, 0);
   631		if (csi->privacy_ctrl)
   632			csi->privacy_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
   633	
   634		if (csi->ctrl_handler.error)
   635			return csi->ctrl_handler.error;
   636	
   637		csi->subdev.ctrl_handler = &csi->ctrl_handler;
   638	
   639		return 0;
   640	}
   641	
   642	static int mei_csi_parse_firmware(struct mei_csi *csi)
   643	{
   644		struct v4l2_fwnode_endpoint v4l2_ep = {
   645			.bus_type = V4L2_MBUS_CSI2_DPHY,
   646		};
   647		struct device *dev = &csi->cldev->dev;
   648		struct v4l2_async_subdev *asd;
   649		struct fwnode_handle *fwnode;
   650		struct fwnode_handle *ep;
   651		int ret;
   652	
   653		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
   654		if (!ep) {
   655			dev_err(dev, "not connected to subdevice\n");
   656			return -EINVAL;
   657		}
   658	
   659		ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
   660		if (ret) {
   661			dev_err(dev, "could not parse v4l2 endpoint\n");
   662			fwnode_handle_put(ep);
   663			return -EINVAL;
   664		}
   665	
   666		fwnode = fwnode_graph_get_remote_endpoint(ep);
   667		fwnode_handle_put(ep);
   668	
 > 669		v4l2_async_nf_init(&csi->notifier);
   670		csi->notifier.ops = &mei_csi_notify_ops;
   671	
   672		asd = v4l2_async_nf_add_fwnode(&csi->notifier, fwnode,
 > 673					       struct v4l2_async_subdev);
   674		if (IS_ERR(asd)) {
   675			fwnode_handle_put(fwnode);
   676			return PTR_ERR(asd);
   677		}
   678	
   679		ret = v4l2_fwnode_endpoint_alloc_parse(fwnode, &v4l2_ep);
   680		fwnode_handle_put(fwnode);
   681		if (ret)
   682			return ret;
   683		csi->nr_of_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
   684	
 > 685		ret = v4l2_async_subdev_nf_register(&csi->subdev, &csi->notifier);
   686		if (ret)
   687			v4l2_async_nf_cleanup(&csi->notifier);
   688	
   689		v4l2_fwnode_endpoint_free(&v4l2_ep);
   690	
   691		return ret;
   692	}
   693	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

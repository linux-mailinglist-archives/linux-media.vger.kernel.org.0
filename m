Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 474EA77E859
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 20:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345407AbjHPSKI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 14:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345448AbjHPSJu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 14:09:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC2A2724
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692209387; x=1723745387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TlYtdN+Z+Wkt4n2fSUjeSF3J884QcalrWBnPWce+AMU=;
  b=Vcz5XXt/3to5HyvorelwZrg1kQAQua7fxbNf1Jw6kkSiEjZv3o6m2Z/B
   j7CHj9npqGG7Tz7gZvpk960mI0jWYk5OF5hYpCP6jwrXlw5U4apWPiFnE
   fxXEAcIDI/w9P0nxdDfB2xh9xnIugjPDRFyBSHritdoQYNsic7CdmuVLv
   bAifFGswL7VBjowO/jRvaTrQQ5cSM6M5zGKKQ1LpEJqT/ywg6l9fTt+VK
   2P+uR7XfiNNh0YChziROwq3gr2fUjJqpS64ibUgpyVMfK0ZiIpsEaumBJ
   TZAZtKDSzS+EA92goEHq9Y2uYvPkeaebHjkv+ccvSlrIvwhRs0Heu9StU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352190493"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="352190493"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 11:09:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1064939788"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="1064939788"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Aug 2023 11:09:45 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qWKxk-0000UJ-2v;
        Wed, 16 Aug 2023 18:09:44 +0000
Date:   Thu, 17 Aug 2023 02:09:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 9402/10518]
 drivers/media/pci/intel/ivsc/mei_csi.c:342:10: error: call to undeclared
 function 'v4l2_subdev_get_try_format'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202308170227.ymiFlMbT-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef66bf8aeb91fd331cf8f5dca8f9d7bca9ab2849
commit: 29006e196a5661d9afc8152fa2bf8a5347ac17b4 [9402/10518] media: pci: intel: ivsc: Add CSI submodule
config: x86_64-randconfig-x074-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170227.ymiFlMbT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170227.ymiFlMbT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170227.ymiFlMbT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ivsc/mei_csi.c:342:10: error: call to undeclared function 'v4l2_subdev_get_try_format'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   return v4l2_subdev_get_try_format(sd, sd_state, pad);
                          ^
>> drivers/media/pci/intel/ivsc/mei_csi.c:342:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct v4l2_mbus_framefmt *' [-Wint-conversion]
                   return v4l2_subdev_get_try_format(sd, sd_state, pad);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ivsc/mei_csi.c:360:16: error: call to undeclared function 'v4l2_subdev_get_try_format'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   mbusformat = v4l2_subdev_get_try_format(sd, sd_state, i);
                                ^
>> drivers/media/pci/intel/ivsc/mei_csi.c:360:14: error: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   mbusformat = v4l2_subdev_get_try_format(sd, sd_state, i);
                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/v4l2_subdev_get_try_format +342 drivers/media/pci/intel/ivsc/mei_csi.c

   332	
   333	static struct v4l2_mbus_framefmt *
   334	mei_csi_get_pad_format(struct v4l2_subdev *sd,
   335			       struct v4l2_subdev_state *sd_state,
   336			       unsigned int pad, u32 which)
   337	{
   338		struct mei_csi *csi = sd_to_csi(sd);
   339	
   340		switch (which) {
   341		case V4L2_SUBDEV_FORMAT_TRY:
 > 342			return v4l2_subdev_get_try_format(sd, sd_state, pad);
   343		case V4L2_SUBDEV_FORMAT_ACTIVE:
   344			return &csi->format_mbus[pad];
   345		default:
   346			return NULL;
   347		}
   348	}
   349	
   350	static int mei_csi_init_cfg(struct v4l2_subdev *sd,
   351				    struct v4l2_subdev_state *sd_state)
   352	{
   353		struct v4l2_mbus_framefmt *mbusformat;
   354		struct mei_csi *csi = sd_to_csi(sd);
   355		unsigned int i;
   356	
   357		mutex_lock(&csi->lock);
   358	
   359		for (i = 0; i < sd->entity.num_pads; i++) {
 > 360			mbusformat = v4l2_subdev_get_try_format(sd, sd_state, i);
   361			*mbusformat = mei_csi_format_mbus_default;
   362		}
   363	
   364		mutex_unlock(&csi->lock);
   365	
   366		return 0;
   367	}
   368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 930796BC1A5
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 00:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233234AbjCOXmt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Mar 2023 19:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233240AbjCOXme (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Mar 2023 19:42:34 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C671273011
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 16:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678923696; x=1710459696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ke0hmfx59qkGDbp2j8xWS9KEQdipUHzjtNcPr7NwLAI=;
  b=jOcXoZ3kDg23i7mLRAnkPC3CixnhgfeKj6tIlf1NKrymRbAVniAU6X9V
   WmjkaytLnIg2YkXABC5owoiqJkvHSwtlxmO7naDHrTgMsn/5TZM7C15ul
   7n9//etkHEqQMFkvVAcrjR5MVnkTwMG77PsoFud7/YsnKALlDcPztmSWg
   HOEDChezDFGdm54DOdXUIcpEeqFZ1RJ7ibf9o8A/HxekEaSVL4OTK2ogo
   igsHaJJWTYfWKbXfT+4dMEYGVpwFY9xx1177iA0Lo02LUoRShE0+pcsRx
   4JPG6HuvMdqICpw34GohLAym6EED3FBMZM83Wbxxx1dzOXF5AWQxG7/Sk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="337859492"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="337859492"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="743901603"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="743901603"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Mar 2023 16:40:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pcaj6-00087v-25;
        Wed, 15 Mar 2023 23:40:12 +0000
Date:   Thu, 16 Mar 2023 07:39:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [sailus-media-tree:master 50/68] drivers/media/i2c/ov2685.c:408:24:
 error: implicit declaration of function 'v4l2_subdev_get_try_crop'
Message-ID: <202303160714.dOJ3WZdw-lkp@intel.com>
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

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   fe3eff3ec489e6ea226ac38fe84d40583fe4298b
commit: 5a073632109dd9a9721812f43ce272e0f7859fa7 [50/68] media: i2c: ov2685: Add .get_selection() support
config: arc-buildonly-randconfig-r001-20230312 (https://download.01.org/0day-ci/archive/20230316/202303160714.dOJ3WZdw-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add sailus-media-tree git://linuxtv.org/sailus/media_tree.git
        git fetch --no-tags sailus-media-tree master
        git checkout 5a073632109dd9a9721812f43ce272e0f7859fa7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160714.dOJ3WZdw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/i2c/ov2685.c: In function '__ov2685_get_pad_crop':
>> drivers/media/i2c/ov2685.c:408:24: error: implicit declaration of function 'v4l2_subdev_get_try_crop' [-Werror=implicit-function-declaration]
     408 |                 return v4l2_subdev_get_try_crop(&ov2685->subdev, state, pad);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/ov2685.c:408:24: warning: returning 'int' from a function with return type 'const struct v4l2_rect *' makes pointer from integer without a cast [-Wint-conversion]
     408 |                 return v4l2_subdev_get_try_crop(&ov2685->subdev, state, pad);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/v4l2_subdev_get_try_crop +408 drivers/media/i2c/ov2685.c

   398	
   399	static const struct v4l2_rect *
   400	__ov2685_get_pad_crop(struct ov2685 *ov2685,
   401			      struct v4l2_subdev_state *state, unsigned int pad,
   402			      enum v4l2_subdev_format_whence which)
   403	{
   404		const struct ov2685_mode *mode = ov2685->cur_mode;
   405	
   406		switch (which) {
   407		case V4L2_SUBDEV_FORMAT_TRY:
 > 408			return v4l2_subdev_get_try_crop(&ov2685->subdev, state, pad);
   409		case V4L2_SUBDEV_FORMAT_ACTIVE:
   410			return mode->analog_crop;
   411		}
   412	
   413		return NULL;
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

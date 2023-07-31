Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2C2769BC5
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 18:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbjGaQEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 12:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbjGaQDx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 12:03:53 -0400
Received: from mgamail.intel.com (unknown [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F811BD2
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 09:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690819415; x=1722355415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=REwXaTrc9DrEQJyU3ZSNpbQ6T+OlGjj3Kmewbegq26o=;
  b=d5ZrBs2jtySv/wD8Rdm6waVLkjogUe/OoSB2nSD2DqFaHrYJPL1JChwk
   szaa3Qpy31zLNK7xvvGC29x7zVnrXcx6mfpdm3DE4YyAaQ6iwdLjIZQfM
   nrOJBQL44vCuRjQ8iCSuiav8R7E/0qfxjecfQ6GVfHCJNrBDcyi+34ShL
   Uy4Wd4ZVjtno29htSvz0l2Us8/qrZAp8VVGmODInYPKCTf/lyNJQL+GNa
   EQCPmKFqMriAtLN03URARiadFGXAEAp0z1+y1xuP5ho1j1Uzl6MAZgn5o
   BFNPzx8IgiCdlTJAEV2nZRyU8EVf9Uy3dy1/2gE8cUW4E0SrHCUhe1xZ/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="348655047"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="348655047"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 09:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="842318617"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="842318617"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2023 09:03:10 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qQVMT-0005DJ-2c;
        Mon, 31 Jul 2023 16:03:09 +0000
Date:   Tue, 1 Aug 2023 00:02:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:master 41/41]
 drivers/media/pci/intel/ivsc/mei_ace.c:444:41: warning: implicit conversion
 from 'enum ace_cmd_id' to 'enum ace_camera_owner'
Message-ID: <202308010053.Fi9ibMjW-lkp@intel.com>
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
commit: f6a458a2c82c225125c937cfd5675c2a3c494b33 [41/41] media: pci: intel: ivsc: Add ACE submodule
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230801/202308010053.Fi9ibMjW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010053.Fi9ibMjW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010053.Fi9ibMjW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/pci/intel/ivsc/mei_ace.c: In function 'mei_ace_post_probe_work':
>> drivers/media/pci/intel/ivsc/mei_ace.c:444:41: warning: implicit conversion from 'enum ace_cmd_id' to 'enum ace_camera_owner' [-Wenum-conversion]
     444 |         ret = ace_set_camera_owner(ace, ACE_SWITCH_CAMERA_TO_HOST);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ivsc/mei_ace.c: In function 'mei_ace_remove':
   drivers/media/pci/intel/ivsc/mei_ace.c:529:35: warning: implicit conversion from 'enum ace_cmd_id' to 'enum ace_camera_owner' [-Wenum-conversion]
     529 |         ace_set_camera_owner(ace, ACE_SWITCH_CAMERA_TO_IVSC);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ivsc/mei_ace.c: In function 'mei_ace_runtime_suspend':
   drivers/media/pci/intel/ivsc/mei_ace.c:538:42: warning: implicit conversion from 'enum ace_cmd_id' to 'enum ace_camera_owner' [-Wenum-conversion]
     538 |         return ace_set_camera_owner(ace, ACE_SWITCH_CAMERA_TO_IVSC);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ivsc/mei_ace.c: In function 'mei_ace_runtime_resume':
   drivers/media/pci/intel/ivsc/mei_ace.c:545:42: warning: implicit conversion from 'enum ace_cmd_id' to 'enum ace_camera_owner' [-Wenum-conversion]
     545 |         return ace_set_camera_owner(ace, ACE_SWITCH_CAMERA_TO_HOST);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +444 drivers/media/pci/intel/ivsc/mei_ace.c

   432	
   433	/* switch camera to host before probe sensor device */
   434	static void mei_ace_post_probe_work(struct work_struct *work)
   435	{
   436		struct acpi_device *adev;
   437		struct mei_ace *ace;
   438		struct device *dev;
   439		int ret;
   440	
   441		ace = container_of(work, struct mei_ace, work);
   442		dev = &ace->cldev->dev;
   443	
 > 444		ret = ace_set_camera_owner(ace, ACE_SWITCH_CAMERA_TO_HOST);
   445		if (ret) {
   446			dev_err(dev, "switch camera to host failed: %d\n", ret);
   447			return;
   448		}
   449	
   450		adev = ACPI_COMPANION(dev->parent);
   451		if (!adev)
   452			return;
   453	
   454		acpi_dev_clear_dependencies(adev);
   455	}
   456	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

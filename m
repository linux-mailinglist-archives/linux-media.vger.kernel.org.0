Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 826DA6CA0B7
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 12:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233342AbjC0KCQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 06:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjC0KCP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 06:02:15 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECA719AC
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679911333; x=1711447333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ATP8Gi43HynXW8oE+aGy6mx3t4M7BSIjvGRlF1y/Oys=;
  b=cZz5JQkGNgM3SLBojJCyfMsXcQH8PigiM8vfHhOwDAnzvMELOostZGKd
   +HMs6EBf5gMlApFuD1+VzN7yVpPJ1EaU1xnC5DjhaGlwHTMtGXaig/kZB
   tdPzZWZjDOB/KztrKh1ewi3/sl5P+KQYjFI7ZPDObMqaYRij13UDFqGLD
   fB0fE2ehHqraijXusUyYMj+OdAufJhf+O0ipWtmjxxvmnr4MXIN6+YbZ1
   ej5MvDsbRlzZlAoUjKl+yjFLaWQS47RzkpYw+7/lNVb/Vbby9mk/fD9oD
   UqQT6XzF8FdRsTjFyY4YsYIPUU79R/9PEoYwPoVURGIli6c0yFtGxDV/F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="402822677"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="402822677"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 03:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="929408671"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="929408671"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Mar 2023 03:02:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pgjg0-000Hfb-2Q;
        Mon, 27 Mar 2023 10:02:08 +0000
Date:   Mon, 27 Mar 2023 18:01:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Wentong Wu <wentong.wu@intel.com>, sakari.ailus@linux.intel.com,
        hdegoede@redhat.com, djrscally@gmail.com,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, bingbu.cao@linux.intel.com,
        zhifeng.wang@intel.com, xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v3 1/3] media: pci: intel: ivsc: Add CSI submodule
Message-ID: <202303271753.XGeJ1Prl-lkp@intel.com>
References: <1679898188-14426-2-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679898188-14426-2-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on rafael-pm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentong-Wu/media-pci-intel-ivsc-Add-CSI-submodule/20230327-142435
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/1679898188-14426-2-git-send-email-wentong.wu%40intel.com
patch subject: [PATCH v3 1/3] media: pci: intel: ivsc: Add CSI submodule
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230327/202303271753.XGeJ1Prl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/413726a06ca6f775b34425ed81e996b9b7237d31
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Wentong-Wu/media-pci-intel-ivsc-Add-CSI-submodule/20230327-142435
        git checkout 413726a06ca6f775b34425ed81e996b9b7237d31
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/pci/intel/ivsc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303271753.XGeJ1Prl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/pci/intel/ivsc/csi_bridge.c: In function 'csi_bridge_unregister_sensor':
   drivers/media/pci/intel/ivsc/csi_bridge.c:179:9: error: implicit declaration of function 'software_node_unregister_nodes'; did you mean 'software_node_unregister'? [-Werror=implicit-function-declaration]
     179 |         software_node_unregister_nodes(sensor->swnodes);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         software_node_unregister
   drivers/media/pci/intel/ivsc/csi_bridge.c: In function 'csi_bridge_connect_sensor':
   drivers/media/pci/intel/ivsc/csi_bridge.c:231:15: error: implicit declaration of function 'software_node_register_nodes'; did you mean 'software_node_register'? [-Werror=implicit-function-declaration]
     231 |         ret = software_node_register_nodes(sensor->swnodes);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               software_node_register
   drivers/media/pci/intel/ivsc/csi_bridge.c: At top level:
>> drivers/media/pci/intel/ivsc/csi_bridge.c:284:5: warning: no previous prototype for 'csi_bridge_init' [-Wmissing-prototypes]
     284 | int csi_bridge_init(struct mei_cl_device *csi_dev)
         |     ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/csi_bridge_init +284 drivers/media/pci/intel/ivsc/csi_bridge.c

   283	
 > 284	int csi_bridge_init(struct mei_cl_device *csi_dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

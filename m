Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFB13692BE0
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 01:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjBKATG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 19:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjBKATF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 19:19:05 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96E075F62
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 16:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676074743; x=1707610743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ehQzxX6L4ASmLk3JlrAJ2eAIDW9XFTC5kS3bmmGg88=;
  b=mv/pvYAzCqK6S1koBWVSPUVf5/HPYK5hWABgpYibNYMo1yhw9/HHUiXF
   rPr6HWnwQRqdX91S0ID/AYFks3X9LDnRlOS+vXJczUTr9xr1URuyLO54I
   qhz7HfX1zIVtpHg5m1Zhy/OGDXVbnoC2JOrT7/Dp2sCmLZUAvrZUvgXlI
   a+jRbz93SoUE8otx+eCeUyPbIajaVNiEcEyAaKfUb6hVLI+0uF8W73JNy
   Dv+1a86viKvqdNE13Gq5OvyZmYU881Z6f0rv1oYNseBfjTM9vUEZrP2qY
   8xBAkQdkvtPBTXzq2DOlkhG5uV/rWip1KsPJIhDx2CMOXSe5Q/DEncqiw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="416785801"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="416785801"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 16:18:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="756959080"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="756959080"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2023 16:18:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pQdbO-00068L-2R;
        Sat, 11 Feb 2023 00:18:50 +0000
Date:   Sat, 11 Feb 2023 08:18:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Wentong Wu <wentong.wu@intel.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, srinivas.pandruvada@intel.com,
        pierre-louis.bossart@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v1 1/3] media: pci: intel: ivsc: Add CSI submodule
Message-ID: <202302110756.bGB3JLgP-lkp@intel.com>
References: <20230210010221.2466486-2-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210010221.2466486-2-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on sailus-media-tree/streams linus/master v6.2-rc7 next-20230210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentong-Wu/media-pci-intel-ivsc-Add-CSI-submodule/20230210-090202
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230210010221.2466486-2-wentong.wu%40intel.com
patch subject: [PATCH v1 1/3] media: pci: intel: ivsc: Add CSI submodule
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230211/202302110756.bGB3JLgP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/bb45f3cb357165838a3c90d4bddfad40ad2d8ce7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Wentong-Wu/media-pci-intel-ivsc-Add-CSI-submodule/20230210-090202
        git checkout bb45f3cb357165838a3c90d4bddfad40ad2d8ce7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110756.bGB3JLgP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/pci/intel/ivsc/mei_csi.o: in function `csi_set_link_cfg':
>> mei_csi.c:(.text+0x1a6): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

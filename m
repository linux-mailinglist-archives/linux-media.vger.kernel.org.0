Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D41E4E261B
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 13:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347216AbiCUMOO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 08:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240603AbiCUMON (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 08:14:13 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04ABA1621A7
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 05:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647864768; x=1679400768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/iwgWB/Pj95NOLmoCdhY/JB+QJX072TvB1rH1TC6F1A=;
  b=IV3+poChQPt2rP9uueRXcWU/wsdIrL+d0B0Ccaw7HRezUGa+G3Kx9ImO
   eDtvKHJGWmkk2GTwbzZ3LuIm8ckTDf9IKc2FOSohswFwah3WUMwSVc2Yy
   QuRJKbzXUz+fX/O5fjCv7tmipNZHLorHkeJAZpVxbpA+Lx/XzlVJm4CiE
   oHgjc0fgT/ZI2g0/jys/Bj/AdJR0IUjKO9XB6raeNZnziERuh0mIEA/81
   U0tbSfLlP0tpFlzemDYg/KhfSWDt/Cej0eUqsLr6jquVbVVh2l+5UPCSO
   pk5QVwcGgiM/3NXaJqMnF3iYhFkUJhKc4Tj/nMbLkHoaPdxAQAYyWEEfA
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257725208"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; 
   d="scan'208";a="257725208"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 05:12:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; 
   d="scan'208";a="716473331"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Mar 2022 05:12:45 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nWGtw-000Hoo-Mz; Mon, 21 Mar 2022 12:12:44 +0000
Date:   Mon, 21 Mar 2022 20:11:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 13/17] media: rkisp1: Compile debugfs support
 conditionally
Message-ID: <202203212003.ngntIuxj-lkp@intel.com>
References: <20220319163100.3083-14-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220319163100.3083-14-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

I love your patch! Yet something to improve:

[auto build test ERROR on 71e6d0608e4d1b79069990c7dacb3600ced28a3b]

url:    https://github.com/0day-ci/linux/commits/Laurent-Pinchart/media-rkisp1-Misc-bug-fixes-and-cleanups/20220320-003349
base:   71e6d0608e4d1b79069990c7dacb3600ced28a3b
config: m68k-randconfig-r015-20220320 (https://download.01.org/0day-ci/archive/20220321/202203212003.ngntIuxj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/11c5c07e897814001cfa8356922aeea602844787
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Laurent-Pinchart/media-rkisp1-Misc-bug-fixes-and-cleanups/20220320-003349
        git checkout 11c5c07e897814001cfa8356922aeea602844787
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=m68k SHELL=/bin/bash drivers/media/platform/rockchip/rkisp1/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c:16:6: error: redefinition of 'rkisp1_debug_init'
      16 | void rkisp1_debug_init(struct rkisp1_device *rkisp1)
         |      ^~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c:14:
   drivers/media/platform/rockchip/rkisp1/rkisp1-common.h:525:20: note: previous definition of 'rkisp1_debug_init' with type 'void(struct rkisp1_device *)'
     525 | static inline void rkisp1_debug_init(struct rkisp1_device *rkisp1)
         |                    ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c:47:6: error: redefinition of 'rkisp1_debug_cleanup'
      47 | void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c:14:
   drivers/media/platform/rockchip/rkisp1/rkisp1-common.h:528:20: note: previous definition of 'rkisp1_debug_cleanup' with type 'void(struct rkisp1_device *)'
     528 | static inline void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +/rkisp1_debug_init +16 drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c

2521809005c614 Laurent Pinchart 2022-03-19  15  
2521809005c614 Laurent Pinchart 2022-03-19 @16  void rkisp1_debug_init(struct rkisp1_device *rkisp1)
2521809005c614 Laurent Pinchart 2022-03-19  17  {
2521809005c614 Laurent Pinchart 2022-03-19  18  	struct rkisp1_debug *debug = &rkisp1->debug;
2521809005c614 Laurent Pinchart 2022-03-19  19  
2521809005c614 Laurent Pinchart 2022-03-19  20  	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
2521809005c614 Laurent Pinchart 2022-03-19  21  
2521809005c614 Laurent Pinchart 2022-03-19  22  	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
2521809005c614 Laurent Pinchart 2022-03-19  23  			     &debug->data_loss);
2521809005c614 Laurent Pinchart 2022-03-19  24  	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
2521809005c614 Laurent Pinchart 2022-03-19  25  			     &debug->outform_size_error);
2521809005c614 Laurent Pinchart 2022-03-19  26  	debugfs_create_ulong("img_stabilization_size_error", 0444,
2521809005c614 Laurent Pinchart 2022-03-19  27  			     debug->debugfs_dir,
2521809005c614 Laurent Pinchart 2022-03-19  28  			     &debug->img_stabilization_size_error);
2521809005c614 Laurent Pinchart 2022-03-19  29  	debugfs_create_ulong("inform_size_error", 0444,  debug->debugfs_dir,
2521809005c614 Laurent Pinchart 2022-03-19  30  			     &debug->inform_size_error);
2521809005c614 Laurent Pinchart 2022-03-19  31  	debugfs_create_ulong("irq_delay", 0444,  debug->debugfs_dir,
2521809005c614 Laurent Pinchart 2022-03-19  32  			     &debug->irq_delay);
2521809005c614 Laurent Pinchart 2022-03-19  33  	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
2521809005c614 Laurent Pinchart 2022-03-19  34  			     &debug->mipi_error);
2521809005c614 Laurent Pinchart 2022-03-19  35  	debugfs_create_ulong("stats_error", 0444, debug->debugfs_dir,
2521809005c614 Laurent Pinchart 2022-03-19  36  			     &debug->stats_error);
2521809005c614 Laurent Pinchart 2022-03-19  37  	debugfs_create_ulong("mp_stop_timeout", 0444, debug->debugfs_dir,
2521809005c614 Laurent Pinchart 2022-03-19  38  			     &debug->stop_timeout[RKISP1_MAINPATH]);
2521809005c614 Laurent Pinchart 2022-03-19  39  	debugfs_create_ulong("sp_stop_timeout", 0444, debug->debugfs_dir,
2521809005c614 Laurent Pinchart 2022-03-19  40  			     &debug->stop_timeout[RKISP1_SELFPATH]);
2521809005c614 Laurent Pinchart 2022-03-19  41  	debugfs_create_ulong("mp_frame_drop", 0444, debug->debugfs_dir,
2521809005c614 Laurent Pinchart 2022-03-19  42  			     &debug->frame_drop[RKISP1_MAINPATH]);
2521809005c614 Laurent Pinchart 2022-03-19  43  	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
2521809005c614 Laurent Pinchart 2022-03-19  44  			     &debug->frame_drop[RKISP1_SELFPATH]);
2521809005c614 Laurent Pinchart 2022-03-19  45  }
2521809005c614 Laurent Pinchart 2022-03-19  46  
2521809005c614 Laurent Pinchart 2022-03-19 @47  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B92414C61CA
	for <lists+linux-media@lfdr.de>; Mon, 28 Feb 2022 04:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232846AbiB1D2c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Feb 2022 22:28:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbiB1D2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Feb 2022 22:28:31 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178314617E
        for <linux-media@vger.kernel.org>; Sun, 27 Feb 2022 19:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646018874; x=1677554874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=byNeG2vWKZv6tMrVrWwTfMcGnhTE1EpRz1JspjtgHGo=;
  b=ObGhKkuRTqOVqTEyMfBvkDPLVzyOop4PShTKjVOS+iOzg0dChSuZWhLj
   8DbfD9v4BH23Q1EAXWWtNuO98bJca4kdO8cmA18DT+V6Qqs0/gAqF0+gM
   MhbfWofA7KNGwHoDcG8+CRr5D9WLa4H2KHSA924kQzLAvwBAzAN9jGlJM
   Fus8inOhbwb1ZFki4bHnO5A7GRelig6kx1KAmHgY2N4tNLbb9XhAf2BOi
   gn41qRuBAMYUF1Fo9MF6fjJDVhcfX8V7G7Cu9RISwaVeCZTSjT467oH34
   FYfeMDuU7l+G3hC+BAVwpBR0Si7NnICLUiq/TMQwRsMYIbtnuZEWpAYlN
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="339229951"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="339229951"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2022 19:27:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="629474823"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Feb 2022 19:27:51 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nOWhT-0006zG-1o; Mon, 28 Feb 2022 03:27:51 +0000
Date:   Mon, 28 Feb 2022 11:27:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 12/16] media: rkisp1: Compile debugfs support
 conditionally
Message-ID: <202202281151.lY2yvuon-lkp@intel.com>
References: <20220227160116.18556-13-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227160116.18556-13-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

I love your patch! Yet something to improve:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on media-tree/master v5.17-rc6 next-20220225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Laurent-Pinchart/media-rkisp1-Misc-bug-fixes-and-cleanups/20220228-000306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
config: m68k-randconfig-r022-20220228 (https://download.01.org/0day-ci/archive/20220228/202202281151.lY2yvuon-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2ee8966047a595378fe16e057f9a25fd7e237f9c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Laurent-Pinchart/media-rkisp1-Misc-bug-fixes-and-cleanups/20220228-000306
        git checkout 2ee8966047a595378fe16e057f9a25fd7e237f9c
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

d321afe87aa3ed Laurent Pinchart 2022-02-27  15  
d321afe87aa3ed Laurent Pinchart 2022-02-27 @16  void rkisp1_debug_init(struct rkisp1_device *rkisp1)
d321afe87aa3ed Laurent Pinchart 2022-02-27  17  {
d321afe87aa3ed Laurent Pinchart 2022-02-27  18  	struct rkisp1_debug *debug = &rkisp1->debug;
d321afe87aa3ed Laurent Pinchart 2022-02-27  19  
d321afe87aa3ed Laurent Pinchart 2022-02-27  20  	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
d321afe87aa3ed Laurent Pinchart 2022-02-27  21  
d321afe87aa3ed Laurent Pinchart 2022-02-27  22  	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
d321afe87aa3ed Laurent Pinchart 2022-02-27  23  			     &debug->data_loss);
d321afe87aa3ed Laurent Pinchart 2022-02-27  24  	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
d321afe87aa3ed Laurent Pinchart 2022-02-27  25  			     &debug->outform_size_error);
d321afe87aa3ed Laurent Pinchart 2022-02-27  26  	debugfs_create_ulong("img_stabilization_size_error", 0444,
d321afe87aa3ed Laurent Pinchart 2022-02-27  27  			     debug->debugfs_dir,
d321afe87aa3ed Laurent Pinchart 2022-02-27  28  			     &debug->img_stabilization_size_error);
d321afe87aa3ed Laurent Pinchart 2022-02-27  29  	debugfs_create_ulong("inform_size_error", 0444,  debug->debugfs_dir,
d321afe87aa3ed Laurent Pinchart 2022-02-27  30  			     &debug->inform_size_error);
d321afe87aa3ed Laurent Pinchart 2022-02-27  31  	debugfs_create_ulong("irq_delay", 0444,  debug->debugfs_dir,
d321afe87aa3ed Laurent Pinchart 2022-02-27  32  			     &debug->irq_delay);
d321afe87aa3ed Laurent Pinchart 2022-02-27  33  	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
d321afe87aa3ed Laurent Pinchart 2022-02-27  34  			     &debug->mipi_error);
d321afe87aa3ed Laurent Pinchart 2022-02-27  35  	debugfs_create_ulong("stats_error", 0444, debug->debugfs_dir,
d321afe87aa3ed Laurent Pinchart 2022-02-27  36  			     &debug->stats_error);
d321afe87aa3ed Laurent Pinchart 2022-02-27  37  	debugfs_create_ulong("mp_stop_timeout", 0444, debug->debugfs_dir,
d321afe87aa3ed Laurent Pinchart 2022-02-27  38  			     &debug->stop_timeout[RKISP1_MAINPATH]);
d321afe87aa3ed Laurent Pinchart 2022-02-27  39  	debugfs_create_ulong("sp_stop_timeout", 0444, debug->debugfs_dir,
d321afe87aa3ed Laurent Pinchart 2022-02-27  40  			     &debug->stop_timeout[RKISP1_SELFPATH]);
d321afe87aa3ed Laurent Pinchart 2022-02-27  41  	debugfs_create_ulong("mp_frame_drop", 0444, debug->debugfs_dir,
d321afe87aa3ed Laurent Pinchart 2022-02-27  42  			     &debug->frame_drop[RKISP1_MAINPATH]);
d321afe87aa3ed Laurent Pinchart 2022-02-27  43  	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
d321afe87aa3ed Laurent Pinchart 2022-02-27  44  			     &debug->frame_drop[RKISP1_SELFPATH]);
d321afe87aa3ed Laurent Pinchart 2022-02-27  45  }
d321afe87aa3ed Laurent Pinchart 2022-02-27  46  
d321afe87aa3ed Laurent Pinchart 2022-02-27 @47  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4717D4DCF77
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 21:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiCQUjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 16:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiCQUjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 16:39:31 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C676143
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 13:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647549493; x=1679085493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=izW1J7nMvMyfzQRtUDJRsjFXu/vL7GV0U6SezsmFX3Q=;
  b=d6PWcSuuBtQOFW/+ic/Lsja9KRsTNmSwR0dHEJn/+Tzss6fQl382n1bF
   QvUfSS5RA+Qsuj3Lf/tS5IE4y2OIIdeYnPlqnFodufI7YerQ5b1oFTT4E
   qN/GhTq2GJmOtOEf0nAI8T556F6Qprm2y11f/SF9KRHGncL2NMjctwqS1
   4zWfTQsra8uZimPWn0A2PsjpbdPkjZX0+eLC6WKd1BvaCunQVmvlYd4E7
   dEWJxT4GYNBhAYBP8P2jt40EQHZqTneWRWo17VLkQKzhka6sRKlIu0Gz2
   GdXBcrvkXp5eS+nHjuTqLZkErYcY+/v5X+GoSBZMwDXTjmomTqwOn6gos
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="320190731"
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; 
   d="scan'208";a="320190731"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 13:38:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; 
   d="scan'208";a="498977576"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2022 13:38:06 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nUwso-000E3C-8Q; Thu, 17 Mar 2022 20:38:06 +0000
Date:   Fri, 18 Mar 2022 04:37:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [linux-next:master 11721/13392]
 drivers/media/platform/renesas/renesas-ceu.c:1609:30: warning: unused
 variable 'ceu_data_rz'
Message-ID: <202203180453.7LxvqwzJ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97add482e9033a9386baa8824fbea34d0cbfe663
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 [11721/13392] media: platform: place Renesas drivers on a separate dir
config: hexagon-randconfig-r021-20220317 (https://download.01.org/0day-ci/archive/20220318/202203180453.7LxvqwzJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/platform/renesas/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/renesas/renesas-ceu.c:1609:30: warning: unused variable 'ceu_data_rz' [-Wunused-const-variable]
   static const struct ceu_data ceu_data_rz = {
                                ^
   1 warning generated.


vim +/ceu_data_rz +1609 drivers/media/platform/renesas/renesas-ceu.c

32e5a70dc8f4e9 drivers/media/platform/renesas-ceu.c Jacopo Mondi 2018-02-22  1608  
32e5a70dc8f4e9 drivers/media/platform/renesas-ceu.c Jacopo Mondi 2018-02-22 @1609  static const struct ceu_data ceu_data_rz = {
32e5a70dc8f4e9 drivers/media/platform/renesas-ceu.c Jacopo Mondi 2018-02-22  1610  	.irq_mask = CEU_CETCR_ALL_IRQS_RZ,
32e5a70dc8f4e9 drivers/media/platform/renesas-ceu.c Jacopo Mondi 2018-02-22  1611  };
32e5a70dc8f4e9 drivers/media/platform/renesas-ceu.c Jacopo Mondi 2018-02-22  1612  

:::::: The code at line 1609 was first introduced by commit
:::::: 32e5a70dc8f4e9813c61e5465d72d2e9830ba0ff media: platform: Add Renesas CEU driver

:::::: TO: Jacopo Mondi <jacopo+renesas@jmondi.org>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

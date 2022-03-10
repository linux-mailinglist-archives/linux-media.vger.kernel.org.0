Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35D364D51A0
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 20:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241375AbiCJSS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 13:18:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245385AbiCJSS5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 13:18:57 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3702F01F
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 10:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646936275; x=1678472275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TeYKB8fszv/seXHKpGwreLAsM9ZK6hesNzPWC8JSbWk=;
  b=Cbe1mS5N6VPTj0uoc4uAbxnfeAZATv3gEcaVt5TbNwnlJ2x+R49fUGOr
   y3fgI8rWOdGkTWZjRdwo1dKledVKgoRG48GBzCwmJfaD0kJ4wyMxR0Dpu
   o945z0na/kTBBqHuO0dfwNzMKYUDwVzzuq39afqxYpZKzEKhG2iqfbIiT
   RXcF1MtgqsjaWxcTn5oykBxv0Rf42GyxOPA5CUICz0Cusg37perQxso7c
   y8+V4nyDr2wjokvF6P1g+tZpEB7hAwL1vb6841g7TYE1+Ow0bjjuDPlYJ
   zbN+FEBLXpfmn9GrPxFxwzxJjTk/m5zt96HsYdPCWAz0x8KufkodM5+ji
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="280067601"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="280067601"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 10:17:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="548110758"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 10 Mar 2022 10:17:44 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nSNM7-0005Fh-Hb; Thu, 10 Mar 2022 18:17:43 +0000
Date:   Fri, 11 Mar 2022 02:16:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     kbuild-all@lists.01.org, Jacopo Mondi <jacopo@jmondi.org>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/6] media: i2c: ov5670: Allow probing with OF
Message-ID: <202203110200.BVFJJTh4-lkp@intel.com>
References: <20220310130829.96001-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310130829.96001-3-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on v5.17-rc7 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jacopo-Mondi/media-i2c-ov5670-OF-support-runtime_pm-regulators/20220310-211143
base:   git://linuxtv.org/media_tree.git master
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20220311/202203110200.BVFJJTh4-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f5425877ffa93005c9f71ce9ce4185a787db66eb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jacopo-Mondi/media-i2c-ov5670-OF-support-runtime_pm-regulators/20220310-211143
        git checkout f5425877ffa93005c9f71ce9ce4185a787db66eb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from drivers/media/i2c/ov5670.c:4:
>> drivers/media/i2c/ov5670.c:2601:48: error: 'ov5670_of_ids' undeclared here (not in a function); did you mean 'ov5670_acpi_ids'?
    2601 |                 .of_match_table = of_match_ptr(ov5670_of_ids),
         |                                                ^~~~~~~~~~~~~
   include/linux/of.h:411:34: note: in definition of macro 'of_match_ptr'
     411 | #define of_match_ptr(_ptr)      (_ptr)
         |                                  ^~~~


vim +2601 drivers/media/i2c/ov5670.c

  2595	
  2596	static struct i2c_driver ov5670_i2c_driver = {
  2597		.driver = {
  2598			.name = "ov5670",
  2599			.pm = &ov5670_pm_ops,
  2600			.acpi_match_table = ACPI_PTR(ov5670_acpi_ids),
> 2601			.of_match_table = of_match_ptr(ov5670_of_ids),
  2602		},
  2603		.probe_new = ov5670_probe,
  2604		.remove = ov5670_remove,
  2605		.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
  2606	};
  2607	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

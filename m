Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85AC14B3192
	for <lists+linux-media@lfdr.de>; Sat, 12 Feb 2022 00:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345542AbiBKX6W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 18:58:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242360AbiBKX6V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 18:58:21 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF038D62
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 15:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644623899; x=1676159899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/DO8dz5a+fECO1lF8HkYAWxQJzTmxnoMcSf/ITjLVKU=;
  b=Rm2Z4X5RGC6mRnWFiPbK74E/X+t0XiNoyTkRftNErdIOqMPNQM9VeVMZ
   VGykevEe7t0icOhuLTwV+uk6yWtDwvUxEeF6b2Ik5EdGjrv2EO+RNB3Jn
   i7FCIAV7YciGqRaAVKuVPJULjF12Fa6A/HIkHwWnMp4jkAsRlJwSLnSaD
   QvJncJKz9xeVps/uTUfYQHXhVt1gDqdV7vv3scc2+tcsARCUAxo4KdBNN
   /aAxxtsz5y71pekhI0SoMrO5SpdFs2V1cPjb6FK+ASsq4wcucr3MctMBi
   xuBx3Hbrh0HKh9s2XNW30Zxj2sNjj1otzImrY6Jc7H11jaCXsI705u8W7
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="248663098"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="248663098"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 15:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="500937959"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Feb 2022 15:58:14 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nIfnq-0005No-5A; Fri, 11 Feb 2022 23:58:14 +0000
Date:   Sat, 12 Feb 2022 07:57:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com
Cc:     kbuild-all@lists.01.org, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 2/3] media: imx: Rename imx7-mipi-csis.c to
 imx-mipi-csis.c
Message-ID: <202202120715.pWMiLjja-lkp@intel.com>
References: <20220211180216.290133-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211180216.290133-3-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on shawnguo/for-next pza/reset/next linus/master v5.17-rc3 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jacopo-Mondi/media-De-stage-imx7-mipi-csis-c/20220212-020342
base:   git://linuxtv.org/media_tree.git master
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220212/202202120715.pWMiLjja-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/18a307fb15879832a050d12ae32bd9d94a9e5c91
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jacopo-Mondi/media-De-stage-imx7-mipi-csis-c/20220212-020342
        git checkout 18a307fb15879832a050d12ae32bd9d94a9e5c91
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'drivers/media/platform/imx/imx7-mipi-csis.o', needed by 'drivers/media/platform/imx/built-in.a'.
   make[5]: Target '__build' not remade because of errors.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

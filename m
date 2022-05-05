Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3149751BFCE
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 14:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353594AbiEEMyE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 08:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236062AbiEEMxv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 08:53:51 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30CB2ED61
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651755011; x=1683291011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+r26UPeOiOD5mZHL8FtWXo/czVM8PSHetoaVEoGMRHo=;
  b=iHqEIA6MgqPXLexBcomqfuIycRXo5Bxs6qQkOL5AGLh/Uz4i3VJW2j6a
   d1I6RxiFXMi9KKEYPAM90z1R2jm9i705Cd7W8EpLxkVECsuYo+j46ISHN
   A1JSt2MkMNOZi9xOIHACzBjVlybq9uDPVKtKfxc1o1PCl+v/rBwfDs8rb
   QSBFnqsZZ511CGLNpjfRYsCgrbrO+ScAo+m6kRhxPDQJ5z/pNtqbl/zm0
   O0Gbinc+TwohyO2J1LADozu9Ft1EkXO+zBP0LFgDlGmDmTxdcgvjpuloa
   soRx8DVKIACDV0DjLXlFzPxaxSSVxsXlqiov1w9SUqBengRAyuUkE8A3J
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="266938591"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="266938591"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 05:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="549332767"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 May 2022 05:50:08 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nmavo-000CPq-1V;
        Thu, 05 May 2022 12:50:08 +0000
Date:   Thu, 5 May 2022 20:49:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, andriy.shevchenko@linux.intel.com,
        hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v3 07/15] media: i2c: Add support for new frequencies to
 ov7251
Message-ID: <202205052045.9ovlO4pA-lkp@intel.com>
References: <20220504223027.3480287-8-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504223027.3480287-8-djrscally@gmail.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/Support-OVTI7251-on-Microsoft-Surface-line/20220505-063608
base:   git://linuxtv.org/media_tree.git master
config: hexagon-buildonly-randconfig-r002-20220501 (https://download.01.org/0day-ci/archive/20220505/202205052045.9ovlO4pA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4f69999ece8bcd0a4e1e616cac23441d2606348d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Scally/Support-OVTI7251-on-Microsoft-Surface-line/20220505-063608
        git checkout 4f69999ece8bcd0a4e1e616cac23441d2606348d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ov7251.c:176:37: warning: unused variable 'ov7251_pll1_cfg_24_mhz_319_2_mhz' [-Wunused-const-variable]
   static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_319_2_mhz = {
                                       ^
   1 warning generated.


vim +/ov7251_pll1_cfg_24_mhz_319_2_mhz +176 drivers/media/i2c/ov7251.c

   175	
 > 176	static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_319_2_mhz = {
   177		.pre_div = 0x05,
   178		.mult = 0x85,
   179		.div = 0x02,
   180		.pix_div = 0x0a,
   181		.mipi_div = 0x05,
   182	};
   183	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

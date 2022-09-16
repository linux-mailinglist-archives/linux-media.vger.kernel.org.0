Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA84C5BAF0B
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 16:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiIPONp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Sep 2022 10:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231977AbiIPONL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Sep 2022 10:13:11 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDD7B286D
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663337579; x=1694873579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HnulLupR3dofH4UZPkP9WrD+hu51HEcxKov0NpWHl1I=;
  b=JJ+gH/lJgvno2QOpVacUaSxPvOatoOXQB0Ysp2BV2X2Q1MMfNaQfMzlG
   ctx3xbCXaTz4Gduf6TdI5lFLdxG1E6JxiYsOt9nIHLeZeMWF+Dq+61e1j
   BbjqRJPJMvZdQGD7Lw6kMg62HLjijqEw1JCc5iin4pmj6sXT496HpR7qO
   etn3uLe5pUQh+ZiXZH9tnJqL3L6/nZispg09JTdibbIonfci0SY1CfYtc
   0ZRYq6aROcyiePf6xr3AMc0qqm+g0WOx+bSWA00iAp6LCBqQG7xeVmxmN
   JbnmAoebz3TmWpWMNdWGauL8gQOWf4qy6xhp69MwJokXPJHOT5BqvoEH6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="299822033"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="299822033"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 07:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="568842394"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Sep 2022 07:12:57 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oZC5Q-0001pq-0w;
        Fri, 16 Sep 2022 14:12:56 +0000
Date:   Fri, 16 Sep 2022 22:12:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [linux-next:master 2735/7639] ERROR: modpost:
 "vpss_clear_wbl_overflow"
 [drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.ko] undefined!
Message-ID: <202209162214.LZFXhn2B-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d5538ab91d3a9a237805be6f8c6c272af2987995
commit: 6971757bdcccdd420583b0ed52361ebdafed2738 [2735/7639] media: davinci: deprecate dm644x_ccdc, dm355_cddc and dm365_isif
config: parisc-randconfig-r023-20220916 (https://download.01.org/0day-ci/archive/20220916/202209162214.LZFXhn2B-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6971757bdcccdd420583b0ed52361ebdafed2738
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6971757bdcccdd420583b0ed52361ebdafed2738
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "vpss_clear_wbl_overflow" [drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.ko] undefined!
>> ERROR: modpost: "vpss_enable_clock" [drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.ko] undefined!
>> ERROR: modpost: "vpss_select_ccdc_source" [drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.ko] undefined!
>> ERROR: modpost: "vpss_enable_clock" [drivers/staging/media/deprecated/vpfe_capture/isif.ko] undefined!
>> ERROR: modpost: "vpss_select_ccdc_source" [drivers/staging/media/deprecated/vpfe_capture/isif.ko] undefined!
>> ERROR: modpost: "dm365_vpss_set_sync_pol" [drivers/staging/media/deprecated/vpfe_capture/isif.ko] undefined!
>> ERROR: modpost: "dm365_vpss_set_pg_frame_size" [drivers/staging/media/deprecated/vpfe_capture/isif.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

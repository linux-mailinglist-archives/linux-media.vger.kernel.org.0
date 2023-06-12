Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 670E672D455
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 00:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238145AbjFLWXZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 18:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232956AbjFLWXY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 18:23:24 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2672210D5;
        Mon, 12 Jun 2023 15:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686608603; x=1718144603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z7lMnWLVZUtIABsHb5EnGYpPZQF8Q7ziKnufPLXzAeY=;
  b=XTUSRpviH4ERXFd3H33gMTpNTLLKkSs0R4W4z1yB/9UpIP1yOzwXMUDz
   0ISBVAaqbxCNUj9d0gjvU+kT/ywS46TnDb/g9ucbYU2ibWbHEWQ9NkBxF
   KVrV5yEu2SPJ+XI3Hh88y43p1JV601hzLr3d8kdTdplxBl9Z1xxn8aMxL
   JdR1ud2F3A9iR34su9JrCaqJjauIJpEjx9It+zASZhhP8IUnJOuuXtaFd
   JV+i2pbQVAuu+Y/oK4AkEOqYhQ3IBB45gL+9mOHEW9zzldzfebvbppP7J
   OVgqytLpVvRGIBqQeSuHe0LiivTlWivV9Bhhz6wQi/aidtym2tIFnaiJ7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="338534547"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="338534547"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 15:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="705550334"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="705550334"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Jun 2023 15:23:19 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q8pwU-0000nP-1S;
        Mon, 12 Jun 2023 22:23:18 +0000
Date:   Tue, 13 Jun 2023 06:23:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helge Deller <deller@gmx.de>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] fbdev/media: Use GPIO descriptors for VIA GPIO
Message-ID: <202306130650.BS2fQAUp-lkp@intel.com>
References: <20230612134500.249178-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612134500.249178-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.4-rc6 next-20230609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/fbdev-media-Use-GPIO-descriptors-for-VIA-GPIO/20230612-214746
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230612134500.249178-1-linus.walleij%40linaro.org
patch subject: [PATCH] fbdev/media: Use GPIO descriptors for VIA GPIO
config: i386-randconfig-r034-20230612 (https://download.01.org/0day-ci/archive/20230613/202306130650.BS2fQAUp-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add media-tree git://linuxtv.org/media_tree.git
        git fetch media-tree master
        git checkout media-tree/master
        b4 shazam https://lore.kernel.org/r/20230612134500.249178-1-linus.walleij@linaro.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130650.BS2fQAUp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/via/via-gpio.c:13:10: fatal error: 'linux/via-gpio.h' file not found
   #include <linux/via-gpio.h>
            ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +13 drivers/video/fbdev/via/via-gpio.c

ec66841e495b9a drivers/video/via/via-gpio.c Jonathan Corbet 2010-05-05 @13  #include <linux/via-gpio.h>
a8a359318530a7 drivers/video/via/via-gpio.c Paul Gortmaker  2011-07-10  14  #include <linux/export.h>
7e0de022680f78 drivers/video/via/via-gpio.c Jonathan Corbet 2009-12-01  15  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

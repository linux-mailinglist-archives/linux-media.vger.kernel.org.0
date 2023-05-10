Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE8FB6FDAAB
	for <lists+linux-media@lfdr.de>; Wed, 10 May 2023 11:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236593AbjEJJXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 May 2023 05:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236859AbjEJJXV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 May 2023 05:23:21 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9A27EF9
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683710577; x=1715246577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1MPetMSix/zL+cBgS9SwgQotafIZUXKQbz3w0iATODE=;
  b=Sz112XcRCJvyddyGPsoniTMy0fBAuPdI11YOOAj+OmCcAZx+mN4lQYGr
   TxW2LaQYWFefWQqFbH4bU6LUO/D98zR/OONkQrUJI5C8NNslB4uEi2hT2
   eEc7R0VoQxrFJo2MoVBSd8wKE50xDB7z7DXFh/KpNbik+Pmp4GqDZLI2P
   MNKeCJWvXsH23msIAm8sBuF5O/mbRXn4/mJDmrBNbdMaeCasYNvxicymq
   fcAjNHFBBBw5wqZ09esM4fbHI8B45QgZe2X8qMIWpRR69G729C4Kz98v1
   6P4SVw/ZHxuKJgs/7ScDOFNvUnDbVdVyZ4PoEOxzma02YxCkGKPpLDVXB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="329789267"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="329789267"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 02:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="843441899"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="843441899"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 May 2023 02:22:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pwg1f-00035i-0j;
        Wed, 10 May 2023 09:22:23 +0000
Date:   Wed, 10 May 2023 17:21:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lucas De Marchi <lucas.demarchi@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [mlankhorst:dumpcg 16612/16889] drivers/gpu/drm/xe/.kunitconfig:
 warning: ignored by one of the .gitignore files
Message-ID: <202305101759.Fm4liH8e-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://people.freedesktop.org/~mlankhorst/linux dumpcg
head:   169b450351c6705039540a916fccb470d26ec34c
commit: cbe1c4c8c2c35d80aee7c14305d20acb85f8f7cd [16612/16889] drm/xe: Add min config for kunit integration ARCH=um
config: arc-randconfig-r043-20230509 (https://download.01.org/0day-ci/archive/20230510/202305101759.Fm4liH8e-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add mlankhorst git://people.freedesktop.org/~mlankhorst/linux
        git fetch --no-tags mlankhorst dumpcg
        git checkout cbe1c4c8c2c35d80aee7c14305d20acb85f8f7cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305101759.Fm4liH8e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/vc4/tests/.kunitconfig: warning: ignored by one of the .gitignore files
>> drivers/gpu/drm/xe/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/hid/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/ext4/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/fat/.kunitconfig: warning: ignored by one of the .gitignore files
   kernel/kcsan/.kunitconfig: warning: ignored by one of the .gitignore files
   lib/kunit/.kunitconfig: warning: ignored by one of the .gitignore files
   mm/kfence/.kunitconfig: warning: ignored by one of the .gitignore files
   net/sunrpc/.kunitconfig: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

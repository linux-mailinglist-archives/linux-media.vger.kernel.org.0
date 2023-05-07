Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 559826F9684
	for <lists+linux-media@lfdr.de>; Sun,  7 May 2023 04:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjEGCBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 May 2023 22:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjEGCB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 May 2023 22:01:29 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D80419D61
        for <linux-media@vger.kernel.org>; Sat,  6 May 2023 19:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683424888; x=1714960888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TUykyREkvoYgkJ35tg+SCwpfydW6o1znBSlKjgRpjXs=;
  b=SvY8i6OyNQdXNqjuMkl5jlg/6rGLBqBS3nlhPha9TkqLXd8d9YuiEEA+
   PuGWdpMn5RdeSPivqjIk1y/49b2ikmYYqe1+WiQ1zByzmAv6VUC+K1f0T
   i0vQM6rSgiQ/KL5ofjbK6cuSr2Ubc41aqlG7Z3PS4nXWAEbKQBhyfKc6q
   k3IERRkUrob9+xNACP5fATVBf2bgPtw5PZZ3RJNpgoPAJS/WK0TZXbLPf
   vqX3DqJOLmydcPrLDJFiagSHenZ98VYYx34yBhaLx+8Z9apJa6two8XuJ
   nT6OqsftdyP2SuZAsnJPqSoYfM5F9Ar4/pOzOfTPUyl/+7qEASg5md7Nc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="435756497"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="435756497"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 19:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="787656636"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="787656636"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 May 2023 19:01:26 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pvTiH-0000ZA-1f;
        Sun, 07 May 2023 02:01:25 +0000
Date:   Sun, 7 May 2023 10:01:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [stable:linux-4.19.y 3525/9999] ld.lld: error:
 drivers/media/usb/usbtv/usbtv-audio.o: contains a compressed section, but
 zlib is not available
Message-ID: <202305070940.YD1J8Lug-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   cdfda37ab2cfc783a190b563806cda611c35d1e3
commit: d4503a3fd3bbf8ddecddb4d71be7110d7651eb8a [3525/9999] media: usbtv: Fix refcounting mixup
config: x86_64-randconfig-a016-20230501 (https://download.01.org/0day-ci/archive/20230507/202305070940.YD1J8Lug-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=d4503a3fd3bbf8ddecddb4d71be7110d7651eb8a
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout d4503a3fd3bbf8ddecddb4d71be7110d7651eb8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305070940.YD1J8Lug-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/usbtv/usbtv-audio.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

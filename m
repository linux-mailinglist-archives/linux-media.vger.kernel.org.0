Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB6A712864
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 09:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbfECHDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 03:03:42 -0400
Received: from mga18.intel.com ([134.134.136.126]:33330 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725806AbfECHDl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 May 2019 03:03:41 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 May 2019 00:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,424,1549958400"; 
   d="scan'208";a="154356636"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 May 2019 00:03:40 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hMSEN-000BN1-KF; Fri, 03 May 2019 15:03:39 +0800
Date:   Fri, 3 May 2019 15:03:07 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     kbuild-all@01.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: move drivers/media/media-* to
 drivers/media/mc/mc-*
Message-ID: <201905031557.QGzqydJq%lkp@intel.com>
References: <5046ebfa-d05f-11d6-ade3-e1facb0a4970@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5046ebfa-d05f-11d6-ade3-e1facb0a4970@xs4all.nl>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I love your patch! Yet something to improve:

[auto build test ERROR on linuxtv-media/master]
[cannot apply to v5.1-rc7]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Hans-Verkuil/media-move-drivers-media-media-to-drivers-media-mc-mc/20190503-140358
base:   git://linuxtv.org/media_tree.git master
config: riscv-tinyconfig
compiler: riscv64-linux-gcc (GCC) 8.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        GCC_VERSION=8.1.0 make.cross ARCH=riscv  tinyconfig
        GCC_VERSION=8.1.0 make.cross ARCH=riscv 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/Kconfig:91: can't open file "drivers/media/mc/Kconfig"
   make[2]: *** [oldconfig] Error 1
   make[1]: *** [oldconfig] Error 2
   make: *** [sub-make] Error 2
--
>> drivers/media/Kconfig:91: can't open file "drivers/media/mc/Kconfig"
   make[2]: *** [olddefconfig] Error 1
   make[1]: *** [olddefconfig] Error 2
   make: *** [sub-make] Error 2
--
>> drivers/media/Kconfig:91: can't open file "drivers/media/mc/Kconfig"
   make[5]: *** [allnoconfig] Error 1
   make[4]: *** [allnoconfig] Error 2
   make[3]: *** [__build_one_by_one] Error 2
   make[3]: Target 'allnoconfig' not remade because of errors.
   make[3]: Target 'tiny.config' not remade because of errors.
   make[2]: *** [tinyconfig] Error 2
   make[1]: *** [tinyconfig] Error 2
   make: *** [sub-make] Error 2

vim +91 drivers/media/Kconfig

    90	
  > 91	source "drivers/media/mc/Kconfig"
    92	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

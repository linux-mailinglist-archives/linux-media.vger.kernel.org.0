Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8C7EA504
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 21:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfJ3UzK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 16:55:10 -0400
Received: from mga02.intel.com ([134.134.136.20]:61904 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbfJ3UzK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 16:55:10 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 13:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,248,1569308400"; 
   d="scan'208";a="203310055"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Oct 2019 13:55:00 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iPuzb-0005r0-Me; Thu, 31 Oct 2019 04:54:59 +0800
Date:   Thu, 31 Oct 2019 04:54:10 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Shawnx Tu <shawnx.tu@intel.com>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, andy.yeh@intel.com,
        shawnx.tu@intel.com
Subject: Re: [PATCH v1] hi556: Add support for Hi-556 sensor
Message-ID: <201910310426.KIEyC5Km%lkp@intel.com>
References: <1572338943-1855-1-git-send-email-shawnx.tu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572338943-1855-1-git-send-email-shawnx.tu@intel.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawnx,

I love your patch! Yet something to improve:

[auto build test ERROR on linuxtv-media/master]
[cannot apply to v5.4-rc5]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Shawnx-Tu/hi556-Add-support-for-Hi-556-sensor/20191031-033403
base:   git://linuxtv.org/media_tree.git master
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/i2c/Kconfig:582: syntax error
   drivers/media/i2c/Kconfig:581:warning: ignoring unsupported character ','
   drivers/media/i2c/Kconfig:581:warning: ignoring unsupported character ':'
>> drivers/media/i2c/Kconfig:581: unknown statement "To"
   drivers/media/i2c/Kconfig:582:warning: ignoring unsupported character '.'
>> drivers/media/i2c/Kconfig:582: unknown statement "module"
   make[2]: *** [allnoconfig] Error 1
   make[1]: *** [allnoconfig] Error 2
   make: *** [sub-make] Error 2
   4 real  2 user  0 sys  54.06% cpu 	make allnoconfig
--
>> drivers/media/i2c/Kconfig:582: syntax error
   drivers/media/i2c/Kconfig:581:warning: ignoring unsupported character ','
   drivers/media/i2c/Kconfig:581:warning: ignoring unsupported character ':'
>> drivers/media/i2c/Kconfig:581: unknown statement "To"
   drivers/media/i2c/Kconfig:582:warning: ignoring unsupported character '.'
>> drivers/media/i2c/Kconfig:582: unknown statement "module"
   make[2]: *** [oldconfig] Error 1
   make[1]: *** [oldconfig] Error 2
   make: *** [sub-make] Error 2
   4 real  2 user  0 sys  57.98% cpu 	make oldconfig
--
>> drivers/media/i2c/Kconfig:582: syntax error
   drivers/media/i2c/Kconfig:581:warning: ignoring unsupported character ','
   drivers/media/i2c/Kconfig:581:warning: ignoring unsupported character ':'
>> drivers/media/i2c/Kconfig:581: unknown statement "To"
   drivers/media/i2c/Kconfig:582:warning: ignoring unsupported character '.'
>> drivers/media/i2c/Kconfig:582: unknown statement "module"
   make[2]: *** [olddefconfig] Error 1
   make[1]: *** [olddefconfig] Error 2
   make: *** [sub-make] Error 2
   3 real  1 user  0 sys  63.87% cpu 	make olddefconfig

vim +582 drivers/media/i2c/Kconfig

   570	
   571	config VIDEO_HI556
   572		tristate "Hynix Hi-556 sensor support"
   573		depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
   574		depends on MEDIA_CAMERA_SUPPORT
   575		depends on MEDIA_CONTROLLER
   576		select V4L2_FWNODE
   577		help
   578		  This is a Video4Linux2 sensor driver for the Hynix
   579		  Hi-556 camera.
   580	
 > 581		To compile this driver as a module, choose M here: the
 > 582		module will be called hi556.
   583	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

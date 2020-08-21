Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09A724DDA7
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 19:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729098AbgHURVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 13:21:07 -0400
Received: from mga11.intel.com ([192.55.52.93]:8450 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728993AbgHURVE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 13:21:04 -0400
IronPort-SDR: mZvUzcQQ79QCAUG4UxpaapmGANXwFHG5etu9Gb2FMpoXYiFQBx9dUaLhB9gs0q1JrwyFQKKK2/
 dsurMsWdVsuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="153192107"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; 
   d="scan'208";a="153192107"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2020 10:21:03 -0700
IronPort-SDR: LHdu62qyqt0eng3KmoaeVx//hy//ABIL7iweTfJJ/3XMD+/oBtI/2ljW3aSOtsW1I98ymV31T8
 KjVCvuLN401g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; 
   d="scan'208";a="498041036"
Received: from lkp-server01.sh.intel.com (HELO 91ed66e1ca04) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Aug 2020 10:21:00 -0700
Received: from kbuild by 91ed66e1ca04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k9Aiq-0001GR-7C; Fri, 21 Aug 2020 17:21:00 +0000
Date:   Sat, 22 Aug 2020 01:20:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     =?iso-8859-1?Q?K=E9vin_L'h=F4pital?= <kevin.lhopital@bootlin.com>,
        linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mripard@kernel.org, wens@csie.org, yong.deng@magewell.com,
        p.zabel@pengutronix.de, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] media: i2c: Add support for the OV8865 image sensor
Message-ID: <202008220159.zlX8y0F3%lkp@intel.com>
References: <20200821145935.20346-4-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200821145935.20346-4-kevin.lhopital@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi "Kévin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linuxtv-media/master]
[also build test ERROR on sunxi/sunxi/for-next robh/for-next v5.9-rc1 next-20200821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/K-vin-L-h-pital/Support-of-MIPI-CSI-2-for-A83T-and-OV8865-camera/20200821-230356
base:   git://linuxtv.org/media_tree.git master
config: x86_64-randconfig-a002-20200820
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project b587ca93be114d07ec3bf654add97d7872325281)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64  randconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/i2c/Kconfig:741:error: recursive dependency detected!
   drivers/media/i2c/Kconfig:741: symbol VIDEO_IMX214 depends on V4L2_FWNODE
   drivers/media/v4l2-core/Kconfig:71: symbol V4L2_FWNODE is selected by VIDEO_OV8865
   drivers/media/i2c/Kconfig:1036: symbol VIDEO_OV8865 depends on VIDEO_V4L2_SUBDEV_API
   drivers/media/v4l2-core/Kconfig:19: symbol VIDEO_V4L2_SUBDEV_API depends on MEDIA_CONTROLLER
   drivers/media/Kconfig:168: symbol MEDIA_CONTROLLER is selected by VIDEO_IMX214
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

# https://github.com/0day-ci/linux/commit/aef022e7b2b7fca2cecab96bcbd6bca991163ab4
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review K-vin-L-h-pital/Support-of-MIPI-CSI-2-for-A83T-and-OV8865-camera/20200821-230356
git checkout aef022e7b2b7fca2cecab96bcbd6bca991163ab4
vim +741 drivers/media/i2c/Kconfig

32a363d0b0b142f Mauro Carvalho Chehab 2020-03-25  718  
5c57ae64e8bccc6 Mauro Carvalho Chehab 2020-04-15  719  menu "Camera sensor devices"
5c57ae64e8bccc6 Mauro Carvalho Chehab 2020-04-15  720  	visible if MEDIA_CAMERA_SUPPORT
f48fd1514212b5c Mauro Carvalho Chehab 2020-03-25  721  
f48fd1514212b5c Mauro Carvalho Chehab 2020-03-25  722  config VIDEO_APTINA_PLL
f48fd1514212b5c Mauro Carvalho Chehab 2020-03-25  723  	tristate
f48fd1514212b5c Mauro Carvalho Chehab 2020-03-25  724  
f48fd1514212b5c Mauro Carvalho Chehab 2020-03-25  725  config VIDEO_SMIAPP_PLL
f48fd1514212b5c Mauro Carvalho Chehab 2020-03-25  726  	tristate
f48fd1514212b5c Mauro Carvalho Chehab 2020-03-25  727  
e62138403a841e4 Shawn Tu              2019-11-01  728  config VIDEO_HI556
e62138403a841e4 Shawn Tu              2019-11-01  729  	tristate "Hynix Hi-556 sensor support"
32a363d0b0b142f Mauro Carvalho Chehab 2020-03-25  730  	depends on I2C && VIDEO_V4L2
32a363d0b0b142f Mauro Carvalho Chehab 2020-03-25  731  	select MEDIA_CONTROLLER
32a363d0b0b142f Mauro Carvalho Chehab 2020-03-25  732  	select VIDEO_V4L2_SUBDEV_API
e62138403a841e4 Shawn Tu              2019-11-01  733  	select V4L2_FWNODE
e62138403a841e4 Shawn Tu              2019-11-01  734  	help
e62138403a841e4 Shawn Tu              2019-11-01  735  	  This is a Video4Linux2 sensor driver for the Hynix
e62138403a841e4 Shawn Tu              2019-11-01  736  	  Hi-556 camera.
e62138403a841e4 Shawn Tu              2019-11-01  737  
e62138403a841e4 Shawn Tu              2019-11-01  738  	  To compile this driver as a module, choose M here: the
e62138403a841e4 Shawn Tu              2019-11-01  739  	  module will be called hi556.
e62138403a841e4 Shawn Tu              2019-11-01  740  
4361905962417ef Ricardo Ribalda       2018-10-05 @741  config VIDEO_IMX214
4361905962417ef Ricardo Ribalda       2018-10-05  742  	tristate "Sony IMX214 sensor support"
32a363d0b0b142f Mauro Carvalho Chehab 2020-03-25  743  	depends on GPIOLIB && I2C && VIDEO_V4L2
4361905962417ef Ricardo Ribalda       2018-10-05  744  	depends on V4L2_FWNODE
32a363d0b0b142f Mauro Carvalho Chehab 2020-03-25  745  	select MEDIA_CONTROLLER
32a363d0b0b142f Mauro Carvalho Chehab 2020-03-25  746  	select VIDEO_V4L2_SUBDEV_API
6de18fa3bd1dd51 Ian Kumlien           2020-02-26  747  	select REGMAP_I2C
4361905962417ef Ricardo Ribalda       2018-10-05  748  	help
4361905962417ef Ricardo Ribalda       2018-10-05  749  	  This is a Video4Linux2 sensor driver for the Sony
4361905962417ef Ricardo Ribalda       2018-10-05  750  	  IMX214 camera.
4361905962417ef Ricardo Ribalda       2018-10-05  751  
4361905962417ef Ricardo Ribalda       2018-10-05  752  	  To compile this driver as a module, choose M here: the
4361905962417ef Ricardo Ribalda       2018-10-05  753  	  module will be called imx214.
4361905962417ef Ricardo Ribalda       2018-10-05  754  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

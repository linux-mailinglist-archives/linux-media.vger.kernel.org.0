Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CD91AAA8D
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 16:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636608AbgDOOnX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 10:43:23 -0400
Received: from mga02.intel.com ([134.134.136.20]:40777 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636761AbgDOOnV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 10:43:21 -0400
IronPort-SDR: 59zoCiIqUu0ClSAjbLYrLnGrJdR4eGek+NP3M/GYQvqerf6EbCtCF9YLuKJQtNuYv8uGCT4fMX
 upaeMnKuLqaQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:43:18 -0700
IronPort-SDR: 7wa5eEDO+82IZVGkRZs2nlIh7jryIELCFaDpOZ0jox5vFgSl4nDV2h4MMcfopWcTJcN+KqCxBM
 zqTivcPKDDaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="253543139"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Apr 2020 07:43:17 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jOjG1-000Dqt-41; Wed, 15 Apr 2020 22:43:17 +0800
Date:   Wed, 15 Apr 2020 22:42:47 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org
Subject: [linuxtv-media:master 139/161] drivers/media/cec/Kconfig:27: symbol
 MEDIA_CEC_SUPPORT default is visible depending on MEDIA_SUPPORT_FILTER
Message-ID: <202004152207.nYpn1yeG%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/media_tree.git master
head:   63735af86d645a47903f912ae89957507edd917b
commit: 4be5e8648b0c287aefc6ac3f3a0b12c696054f43 [139/161] media: move CEC platform drivers to a separate directory
config: s390-zfcpdump_defconfig
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 4be5e8648b0c287aefc6ac3f3a0b12c696054f43
        GCC_VERSION=9.3.0 make.cross ARCH=s390  zfcpdump_defconfig
        GCC_VERSION=9.3.0 make.cross ARCH=s390 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pci/Kconfig:16:error: recursive dependency detected!
   drivers/pci/Kconfig:16: symbol PCI is selected by VIDEO_SECO_CEC
   drivers/media/cec/platform/Kconfig:100: symbol VIDEO_SECO_CEC depends on MEDIA_CEC_SUPPORT
>> drivers/media/cec/Kconfig:27: symbol MEDIA_CEC_SUPPORT default is visible depending on MEDIA_SUPPORT_FILTER
>> drivers/media/Kconfig:25: symbol MEDIA_SUPPORT_FILTER depends on MEDIA_SUPPORT
>> drivers/media/Kconfig:12: symbol MEDIA_SUPPORT depends on HAS_IOMEM
>> arch/s390/Kconfig:721: symbol HAS_IOMEM default value contains PCI
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

vim +27 drivers/media/cec/Kconfig

46d2a3b964ddbe Mauro Carvalho Chehab 2020-04-15 @27  	default y if !MEDIA_SUPPORT_FILTER
46d2a3b964ddbe Mauro Carvalho Chehab 2020-04-15  28  	help
46d2a3b964ddbe Mauro Carvalho Chehab 2020-04-15  29  	  Enable support for HDMI CEC (Consumer Electronics Control),
46d2a3b964ddbe Mauro Carvalho Chehab 2020-04-15  30  	  which is an optional HDMI feature.
46d2a3b964ddbe Mauro Carvalho Chehab 2020-04-15  31  
46d2a3b964ddbe Mauro Carvalho Chehab 2020-04-15  32  	  Say Y when you have an HDMI receiver, transmitter or a USB CEC
46d2a3b964ddbe Mauro Carvalho Chehab 2020-04-15  33  	  adapter that supports HDMI CEC.
4be5e8648b0c28 Mauro Carvalho Chehab 2020-04-15  34  

:::::: The code at line 27 was first introduced by commit
:::::: 46d2a3b964ddbe63605dab502c847180b1efbfb2 media: place CEC menu before MEDIA_SUPPORT

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

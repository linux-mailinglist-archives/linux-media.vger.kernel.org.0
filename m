Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20911AAC04
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 17:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbgDOPif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 11:38:35 -0400
Received: from mga12.intel.com ([192.55.52.136]:45711 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1414785AbgDOPi3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 11:38:29 -0400
IronPort-SDR: d9OLHdE3NqWM6bZkf11DPH1dFV8ymjOQUPUuW2uhU4OeiYmV2XvEl/vPSfyG5UTzU+Blc54C3H
 aaBqvhWUAsiw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 08:38:28 -0700
IronPort-SDR: 4scNxY4cYPeliG9elmEowZRslHjg629qvgLHYhYin7jaO6mdoorKZcU9yUJ8Fwmu+Li0prSIV3
 gPfbEyee+gAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="253558160"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Apr 2020 08:38:28 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jOk7P-000InU-AF; Wed, 15 Apr 2020 23:38:27 +0800
Date:   Wed, 15 Apr 2020 23:37:31 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org
Subject: [linuxtv-media:master 141/161] drivers/pci/Kconfig:16: symbol PCI is
 selected by CEC_SECO
Message-ID: <202004152327.PxKCYuXD%lkp@intel.com>
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
commit: df823a8208c434eee6e4e9aa016c956d0968e2e2 [141/161] media: cec: rename CEC platform drivers config options
config: s390-zfcpdump_defconfig
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout df823a8208c434eee6e4e9aa016c956d0968e2e2
        GCC_VERSION=9.3.0 make.cross ARCH=s390  zfcpdump_defconfig
        GCC_VERSION=9.3.0 make.cross ARCH=s390 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pci/Kconfig:16:error: recursive dependency detected!
>> drivers/pci/Kconfig:16: symbol PCI is selected by CEC_SECO
>> drivers/media/cec/platform/Kconfig:100: symbol CEC_SECO depends on MEDIA_CEC_SUPPORT
   drivers/media/cec/Kconfig:27: symbol MEDIA_CEC_SUPPORT default is visible depending on MEDIA_SUPPORT_FILTER
   drivers/media/Kconfig:25: symbol MEDIA_SUPPORT_FILTER depends on MEDIA_SUPPORT
   drivers/media/Kconfig:12: symbol MEDIA_SUPPORT depends on HAS_IOMEM
   arch/s390/Kconfig:721: symbol HAS_IOMEM default value contains PCI
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

vim +16 drivers/pci/Kconfig

5f8fc43217a01c Bogicevic Sasa    2016-02-03   5  
eb01d42a77785f Christoph Hellwig 2018-11-15   6  # select this to offer the PCI prompt
eb01d42a77785f Christoph Hellwig 2018-11-15   7  config HAVE_PCI
eb01d42a77785f Christoph Hellwig 2018-11-15   8  	bool
eb01d42a77785f Christoph Hellwig 2018-11-15   9  
eb01d42a77785f Christoph Hellwig 2018-11-15  10  # select this to unconditionally force on PCI support
eb01d42a77785f Christoph Hellwig 2018-11-15  11  config FORCE_PCI
eb01d42a77785f Christoph Hellwig 2018-11-15  12  	bool
eb01d42a77785f Christoph Hellwig 2018-11-15  13  	select HAVE_PCI
eb01d42a77785f Christoph Hellwig 2018-11-15  14  	select PCI
eb01d42a77785f Christoph Hellwig 2018-11-15  15  
eb01d42a77785f Christoph Hellwig 2018-11-15 @16  menuconfig PCI
eb01d42a77785f Christoph Hellwig 2018-11-15  17  	bool "PCI support"
eb01d42a77785f Christoph Hellwig 2018-11-15  18  	depends on HAVE_PCI
eb01d42a77785f Christoph Hellwig 2018-11-15  19  	help
eb01d42a77785f Christoph Hellwig 2018-11-15  20  	  This option enables support for the PCI local bus, including
eb01d42a77785f Christoph Hellwig 2018-11-15  21  	  support for PCI-X and the foundations for PCI Express support.
eb01d42a77785f Christoph Hellwig 2018-11-15  22  	  Say 'Y' here unless you know what you are doing.
eb01d42a77785f Christoph Hellwig 2018-11-15  23  

:::::: The code at line 16 was first introduced by commit
:::::: eb01d42a77785ff96b6e66a2a2e7027fc6d78e4a PCI: consolidate PCI config entry in drivers/pci

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Masahiro Yamada <yamada.masahiro@socionext.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

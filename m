Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA5B945D4EE
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 07:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345544AbhKYGuf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 01:50:35 -0500
Received: from mga02.intel.com ([134.134.136.20]:49184 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345562AbhKYGsf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 01:48:35 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="222680176"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="222680176"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 22:44:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="675128594"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 24 Nov 2021 22:44:24 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mq8UZ-0005uP-Ra; Thu, 25 Nov 2021 06:44:23 +0000
Date:   Thu, 25 Nov 2021 14:44:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: drivers/media/platform/atmel/atmel-sama7g5-isc.c:610:34: warning:
 unused variable 'microchip_xisc_of_match'
Message-ID: <202111251457.0RbiQSQs-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5f53fa508db098c9d372423a6dac31c8a5679cdf
commit: c9aa973884a163ecb6d5d4d3be9137058adcaf8c media: atmel: atmel-isc: add microchip-xisc driver
date:   6 months ago
config: x86_64-buildonly-randconfig-r001-20211118 (https://download.01.org/0day-ci/archive/20211125/202111251457.0RbiQSQs-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c46becf500df2a7fb4b4fce16178a036c344315a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c9aa973884a163ecb6d5d4d3be9137058adcaf8c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c9aa973884a163ecb6d5d4d3be9137058adcaf8c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/atmel/atmel-sama7g5-isc.c:610:34: warning: unused variable 'microchip_xisc_of_match' [-Wunused-const-variable]
   static const struct of_device_id microchip_xisc_of_match[] = {
                                    ^
   1 warning generated.


vim +/microchip_xisc_of_match +610 drivers/media/platform/atmel/atmel-sama7g5-isc.c

   609	
 > 610	static const struct of_device_id microchip_xisc_of_match[] = {
   611		{ .compatible = "microchip,sama7g5-isc" },
   612		{ }
   613	};
   614	MODULE_DEVICE_TABLE(of, microchip_xisc_of_match);
   615	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

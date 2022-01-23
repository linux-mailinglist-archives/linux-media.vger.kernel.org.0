Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C07564974E4
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 20:07:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233419AbiAWTHF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 14:07:05 -0500
Received: from mga01.intel.com ([192.55.52.88]:32773 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229533AbiAWTHF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 14:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642964825; x=1674500825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a4H8c/7gcQnLqbO56QG+BVclqAD5vRBBzirlssIZUyg=;
  b=Mr9peWU9LvbHU5iM1V/ZsALASj2/KUq8F4aN1H2gPEkI/QkrGUEJfuTe
   ElkddHDScNp/6RSQbRwS+qacFTZAwbfDr0QFvtCQnJhe/4y0ZGC4vCMFb
   t0Bhpdjl6Nc/7vtgt+8FM6ScV9yLxGb146OC7KzqYROEEvgPRpexw9e+7
   uRdMxD3XNZPOjbBnFvRzMQFBwRv1W39Jsp12Slej1tu7CmaStvKp28lAW
   L4HKhEFB/EYwAM2+cqZHaonlvvzYQLk3gdItDePhxhm02nO84rNBAeUpm
   /km2MVhavaFzBTSsijhp5yM+lAx/JFSIPsIg95mbjN199FTC2SDELUJHK
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="270352292"
X-IronPort-AV: E=Sophos;i="5.88,310,1635231600"; 
   d="scan'208";a="270352292"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2022 11:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,310,1635231600"; 
   d="scan'208";a="476494019"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Jan 2022 11:07:03 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nBiCc-000HTQ-LN; Sun, 23 Jan 2022 19:07:02 +0000
Date:   Mon, 24 Jan 2022 03:06:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Petko Manolov <petko.manolov@konsulko.com>,
        linux-media@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: Re: [PATCH v4 1/1] media: ovm6211: Adds support for OVM6211
Message-ID: <202201240216.kRT3o6Zf-lkp@intel.com>
References: <20220123142134.3074180-2-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220123142134.3074180-2-petko.manolov@konsulko.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c]

url:    https://github.com/0day-ci/linux/commits/Petko-Manolov/media-ovm6211-Adds-support-for-OVM6211/20220123-222248
base:   68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
config: i386-randconfig-a013-20220124 (https://download.01.org/0day-ci/archive/20220124/202201240216.kRT3o6Zf-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/87974226cae497656ad966fa391207ce1426615b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Petko-Manolov/media-ovm6211-Adds-support-for-OVM6211/20220123-222248
        git checkout 87974226cae497656ad966fa391207ce1426615b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ovm6211.c:1007:35: warning: unused variable 'ovm6211_id' [-Wunused-const-variable]
   static const struct i2c_device_id ovm6211_id[] = {
                                     ^
   1 warning generated.


vim +/ovm6211_id +1007 drivers/media/i2c/ovm6211.c

  1006	
> 1007	static const struct i2c_device_id ovm6211_id[] = {
  1008		{ "ovm6211", 0 },
  1009		{},
  1010	};
  1011	MODULE_DEVICE_TABLE(i2c, ovm6211_id);
  1012	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

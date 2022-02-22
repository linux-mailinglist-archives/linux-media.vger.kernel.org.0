Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 673A54C03F4
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 22:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235794AbiBVVjd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 16:39:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235770AbiBVVjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 16:39:32 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943451390EE
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 13:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645565946; x=1677101946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6L/+RTbTMUjvRdgDGJE618eoBcWzNzH2Ohhp5DYFX9k=;
  b=J30D7f/pM4YbIRnlygQTj21vP6sLLEFr5MoLfYIwiTFR1+86EMr3SGd7
   lml+WsrVnFWqixXizU4vJp+4u58fY4PmOn2a09a05syCPicHGnHIjp9DG
   b+824O5ByINnjNrXZpj5s/4PJPzso/t2C4tT8klXCrVEysa8705UmzAet
   IDJRhEP7TNp0XEx9BVkDIoSwskHY3p1wykUgpOYsvEM1ad7Cw9EaG3Afq
   R+FDa9TZbuvMDswDsbw23nLDhJKSQGNv5W4GI4i2M1QYHgfUDH4SO3F22
   vgqlikI2GLgw94r9gu97ewxgnbwbDKmfgxjV3xjdJYqC51M03pfOJ5Q49
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="315049203"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="315049203"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 13:39:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="490949602"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Feb 2022 13:39:04 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMcsB-0000eD-Dv; Tue, 22 Feb 2022 21:39:03 +0000
Date:   Wed, 23 Feb 2022 05:38:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: Re: [PATCH] media: cec: seco: Drop pointless include
Message-ID: <202202230527.2mRa4oUA-lkp@intel.com>
References: <20220222160121.54272-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222160121.54272-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Linus-Walleij/media-cec-seco-Drop-pointless-include/20220223-000503
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-a014-20220221 (https://download.01.org/0day-ci/archive/20220223/202202230527.2mRa4oUA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3b2630b860ba004410fd27ad657355bcc0b9bd72
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Linus-Walleij/media-cec-seco-Drop-pointless-include/20220223-000503
        git checkout 3b2630b860ba004410fd27ad657355bcc0b9bd72
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/cec/platform/seco/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/cec/platform/seco/seco-cec.c:553:35: error: use of undeclared identifier 'GPIOF_IN'; did you mean 'GPIOD_IN'?
           gpio = devm_gpiod_get(dev, NULL, GPIOF_IN);
                                            ^~~~~~~~
                                            GPIOD_IN
   include/linux/gpio/consumer.h:51:2: note: 'GPIOD_IN' declared here
           GPIOD_IN        = GPIOD_FLAGS_BIT_DIR_SET,
           ^
   1 error generated.


vim +553 drivers/media/cec/platform/seco/seco-cec.c

b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  546  
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  547  static int secocec_acpi_probe(struct secocec_data *sdev)
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  548  {
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  549  	struct device *dev = sdev->dev;
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  550  	struct gpio_desc *gpio;
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  551  	int irq = 0;
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  552  
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21 @553  	gpio = devm_gpiod_get(dev, NULL, GPIOF_IN);
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  554  	if (IS_ERR(gpio)) {
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  555  		dev_err(dev, "Cannot request interrupt gpio");
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  556  		return PTR_ERR(gpio);
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  557  	}
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  558  
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  559  	irq = gpiod_to_irq(gpio);
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  560  	if (irq < 0) {
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  561  		dev_err(dev, "Cannot find valid irq");
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  562  		return -ENODEV;
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  563  	}
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  564  	dev_dbg(dev, "irq-gpio is bound to IRQ %d", irq);
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  565  
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  566  	sdev->irq = irq;
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  567  
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  568  	return 0;
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  569  }
b03c2fb97adcc65 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  570  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

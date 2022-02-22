Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07B644C0288
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 20:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235350AbiBVT5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 14:57:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235312AbiBVT5W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 14:57:22 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5539C93193
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 11:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645559815; x=1677095815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6cGjfC+FeUjw8nZtsmwuSHCEMf3k+oxFDOSo0cRUlDQ=;
  b=HuNNjqFAfYoCahYhGTMumkvLejdUAgr+9qka46bgWqYUZGn288K8/JM6
   tN53Lc01WKRy8f4z9SIMB/2QYzqTjkjSpMKZYG6tlfaMr6Ds1+ygNLs3H
   TXxZoOgmy3UTLEH5rMFD8ece/gafBu5Dn+MCKBVmhB/JX0MSyzo+Mk4QP
   QYQkBJuarRoXmcFj+9mik4Zb074yIx26uy7v3L4R4sfYUxKIveBGHnWNj
   yc2TdS6wxCK13bUrF5cp4Xe4rEwfJokgTyvbN+IwlCmkUGFxujDWT+iAn
   6lDGN+Sb65x4ljEPuznzmhL4xp3IQbkmP+QGfQk6Pajtworo3G6luzZqX
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="312514240"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="312514240"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 11:56:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="547906070"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Feb 2022 11:56:53 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMbHI-0000ZA-GC; Tue, 22 Feb 2022 19:56:52 +0000
Date:   Wed, 23 Feb 2022 03:56:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Linus Walleij <linus.walleij@linaro.org>,
        Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: Re: [PATCH] media: cec: seco: Drop pointless include
Message-ID: <202202230327.ikz5OXY1-lkp@intel.com>
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
config: ia64-randconfig-r004-20220221 (https://download.01.org/0day-ci/archive/20220223/202202230327.ikz5OXY1-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3b2630b860ba004410fd27ad657355bcc0b9bd72
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Linus-Walleij/media-cec-seco-Drop-pointless-include/20220223-000503
        git checkout 3b2630b860ba004410fd27ad657355bcc0b9bd72
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/media/cec/platform/seco/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/ia64/include/asm/pgtable.h:153,
                    from include/linux/pgtable.h:6,
                    from arch/ia64/include/asm/uaccess.h:40,
                    from include/linux/uaccess.h:11,
                    from arch/ia64/include/asm/sections.h:11,
                    from include/linux/interrupt.h:21,
                    from drivers/media/cec/platform/seco/seco-cec.c:15:
   arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
   arch/ia64/include/asm/mmu_context.h:127:48: warning: variable 'old_rr4' set but not used [-Wunused-but-set-variable]
     127 |         unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
         |                                                ^~~~~~~
   drivers/media/cec/platform/seco/seco-cec.c: In function 'secocec_acpi_probe':
>> drivers/media/cec/platform/seco/seco-cec.c:553:42: error: 'GPIOF_IN' undeclared (first use in this function); did you mean 'GPIOD_IN'?
     553 |         gpio = devm_gpiod_get(dev, NULL, GPIOF_IN);
         |                                          ^~~~~~~~
         |                                          GPIOD_IN
   drivers/media/cec/platform/seco/seco-cec.c:553:42: note: each undeclared identifier is reported only once for each function it appears in


vim +553 drivers/media/cec/platform/seco/seco-cec.c

b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  546  
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  547  static int secocec_acpi_probe(struct secocec_data *sdev)
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  548  {
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  549  	struct device *dev = sdev->dev;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  550  	struct gpio_desc *gpio;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  551  	int irq = 0;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  552  
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21 @553  	gpio = devm_gpiod_get(dev, NULL, GPIOF_IN);
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  554  	if (IS_ERR(gpio)) {
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  555  		dev_err(dev, "Cannot request interrupt gpio");
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  556  		return PTR_ERR(gpio);
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  557  	}
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  558  
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  559  	irq = gpiod_to_irq(gpio);
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  560  	if (irq < 0) {
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  561  		dev_err(dev, "Cannot find valid irq");
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  562  		return -ENODEV;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  563  	}
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  564  	dev_dbg(dev, "irq-gpio is bound to IRQ %d", irq);
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  565  
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  566  	sdev->irq = irq;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  567  
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  568  	return 0;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  569  }
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2018-10-21  570  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

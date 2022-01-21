Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0789496546
	for <lists+linux-media@lfdr.de>; Fri, 21 Jan 2022 19:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiAUSvO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 13:51:14 -0500
Received: from mga14.intel.com ([192.55.52.115]:36415 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230095AbiAUSvL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 13:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642791070; x=1674327070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cswVdV775NVIuem5Dk9lwXW3KOPwL3FLbLe9q9c+s0s=;
  b=No7MTIHuP0AcnguzVtoB46wJGK61ggxhd1V+bmRRMjPRJeZUIsLQQN6u
   2lX60Zgh4PhvcK7BmwCsgJdftDn9FzH9m86jjNeRpa0LIDLvgJ5Jp4bz+
   4R6cDT2bobCfzms5v+5oGs5YQVZFEr+41Nqt7xMUCzGpAfzOYGqPeoNRq
   oAKS71drccgaiamMkdDRijnJ4uVpSU8Cwh93ttfhAIf70z79Syb+n48P/
   8iZtxmRKBr5gZs72y3s4mNFtPWn1FaKnDicitynOBe+Q86zJb/yKSH8qO
   kv5dyEwJHJcdLvdfJ8RI0n2afGOneVMbVIXNpJ/dwZOhDMyIiWxm1DdbT
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="245942436"
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; 
   d="scan'208";a="245942436"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 10:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; 
   d="scan'208";a="493941639"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Jan 2022 10:51:01 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nAz00-000FaG-HX; Fri, 21 Jan 2022 18:51:00 +0000
Date:   Sat, 22 Jan 2022 02:50:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org
Subject: Re: [PATCH 1/2] media: rc-core: rename ir_raw_event_reset to
 ir_raw_event_overflow
Message-ID: <202201220241.WSoRnyo3-lkp@intel.com>
References: <20220120161614.328202-1-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120161614.328202-1-sean@mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on next-20220121]
[cannot apply to sunxi/sunxi/for-next v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sean-Young/media-rc-core-rename-ir_raw_event_reset-to-ir_raw_event_overflow/20220121-001937
base:   git://linuxtv.org/media_tree.git master
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220122/202201220241.WSoRnyo3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5b0115b915832b54ebe085c923d73209b1abb364
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sean-Young/media-rc-core-rename-ir_raw_event_reset-to-ir_raw_event_overflow/20220121-001937
        git checkout 5b0115b915832b54ebe085c923d73209b1abb364
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/media/rc/mtk-cir.c: In function 'mtk_ir_irq':
>> drivers/media/rc/mtk-cir.c:220:9: error: implicit declaration of function 'ir_raw_event_reset'; did you mean 'ir_raw_event_store'? [-Werror=implicit-function-declaration]
     220 |         ir_raw_event_reset(ir->rc);
         |         ^~~~~~~~~~~~~~~~~~
         |         ir_raw_event_store
   cc1: some warnings being treated as errors


vim +220 drivers/media/rc/mtk-cir.c

6691e7b9a57c24 Sean Wang  2017-01-13  202  
6691e7b9a57c24 Sean Wang  2017-01-13  203  static irqreturn_t mtk_ir_irq(int irqno, void *dev_id)
6691e7b9a57c24 Sean Wang  2017-01-13  204  {
6691e7b9a57c24 Sean Wang  2017-01-13  205  	struct mtk_ir *ir = dev_id;
6691e7b9a57c24 Sean Wang  2017-01-13  206  	u8  wid = 0;
6691e7b9a57c24 Sean Wang  2017-01-13  207  	u32 i, j, val;
183e19f5b9ee18 Sean Young 2018-08-21  208  	struct ir_raw_event rawir = {};
6691e7b9a57c24 Sean Wang  2017-01-13  209  
6691e7b9a57c24 Sean Wang  2017-01-13  210  	/*
6691e7b9a57c24 Sean Wang  2017-01-13  211  	 * Reset decoder state machine explicitly is required
6691e7b9a57c24 Sean Wang  2017-01-13  212  	 * because 1) the longest duration for space MTK IR hardware
6691e7b9a57c24 Sean Wang  2017-01-13  213  	 * could record is not safely long. e.g  12ms if rx resolution
6691e7b9a57c24 Sean Wang  2017-01-13  214  	 * is 46us by default. There is still the risk to satisfying
6691e7b9a57c24 Sean Wang  2017-01-13  215  	 * every decoder to reset themselves through long enough
6691e7b9a57c24 Sean Wang  2017-01-13  216  	 * trailing spaces and 2) the IRQ handler guarantees that
6691e7b9a57c24 Sean Wang  2017-01-13  217  	 * start of IR message is always contained in and starting
50c3c1ba171f3f Sean Wang  2017-06-30  218  	 * from register mtk_chkdata_reg(ir, i).
6691e7b9a57c24 Sean Wang  2017-01-13  219  	 */
6691e7b9a57c24 Sean Wang  2017-01-13 @220  	ir_raw_event_reset(ir->rc);
6691e7b9a57c24 Sean Wang  2017-01-13  221  
6691e7b9a57c24 Sean Wang  2017-01-13  222  	/* First message must be pulse */
6691e7b9a57c24 Sean Wang  2017-01-13  223  	rawir.pulse = false;
6691e7b9a57c24 Sean Wang  2017-01-13  224  
6691e7b9a57c24 Sean Wang  2017-01-13  225  	/* Handle all pulse and space IR controller captures */
6691e7b9a57c24 Sean Wang  2017-01-13  226  	for (i = 0 ; i < MTK_CHKDATA_SZ ; i++) {
50c3c1ba171f3f Sean Wang  2017-06-30  227  		val = mtk_r32(ir, mtk_chkdata_reg(ir, i));
6691e7b9a57c24 Sean Wang  2017-01-13  228  		dev_dbg(ir->dev, "@reg%d=0x%08x\n", i, val);
6691e7b9a57c24 Sean Wang  2017-01-13  229  
6691e7b9a57c24 Sean Wang  2017-01-13  230  		for (j = 0 ; j < 4 ; j++) {
6691e7b9a57c24 Sean Wang  2017-01-13  231  			wid = (val & (MTK_WIDTH_MASK << j * 8)) >> j * 8;
6691e7b9a57c24 Sean Wang  2017-01-13  232  			rawir.pulse = !rawir.pulse;
6691e7b9a57c24 Sean Wang  2017-01-13  233  			rawir.duration = wid * (MTK_IR_SAMPLE + 1);
6691e7b9a57c24 Sean Wang  2017-01-13  234  			ir_raw_event_store_with_filter(ir->rc, &rawir);
6691e7b9a57c24 Sean Wang  2017-01-13  235  		}
6691e7b9a57c24 Sean Wang  2017-01-13  236  	}
6691e7b9a57c24 Sean Wang  2017-01-13  237  
6691e7b9a57c24 Sean Wang  2017-01-13  238  	/*
6691e7b9a57c24 Sean Wang  2017-01-13  239  	 * The maximum number of edges the IR controller can
6691e7b9a57c24 Sean Wang  2017-01-13  240  	 * hold is MTK_CHKDATA_SZ * 4. So if received IR messages
6691e7b9a57c24 Sean Wang  2017-01-13  241  	 * is over the limit, the last incomplete IR message would
6691e7b9a57c24 Sean Wang  2017-01-13  242  	 * be appended trailing space and still would be sent into
6691e7b9a57c24 Sean Wang  2017-01-13  243  	 * ir-rc-raw to decode. That helps it is possible that it
6691e7b9a57c24 Sean Wang  2017-01-13  244  	 * has enough information to decode a scancode even if the
6691e7b9a57c24 Sean Wang  2017-01-13  245  	 * trailing end of the message is missing.
6691e7b9a57c24 Sean Wang  2017-01-13  246  	 */
6691e7b9a57c24 Sean Wang  2017-01-13  247  	if (!MTK_IR_END(wid, rawir.pulse)) {
6691e7b9a57c24 Sean Wang  2017-01-13  248  		rawir.pulse = false;
6691e7b9a57c24 Sean Wang  2017-01-13  249  		rawir.duration = MTK_MAX_SAMPLES * (MTK_IR_SAMPLE + 1);
6691e7b9a57c24 Sean Wang  2017-01-13  250  		ir_raw_event_store_with_filter(ir->rc, &rawir);
6691e7b9a57c24 Sean Wang  2017-01-13  251  	}
6691e7b9a57c24 Sean Wang  2017-01-13  252  
6691e7b9a57c24 Sean Wang  2017-01-13  253  	ir_raw_event_handle(ir->rc);
6691e7b9a57c24 Sean Wang  2017-01-13  254  
6691e7b9a57c24 Sean Wang  2017-01-13  255  	/*
6691e7b9a57c24 Sean Wang  2017-01-13  256  	 * Restart controller for the next receive that would
6691e7b9a57c24 Sean Wang  2017-01-13  257  	 * clear up all CHKDATA registers
6691e7b9a57c24 Sean Wang  2017-01-13  258  	 */
50c3c1ba171f3f Sean Wang  2017-06-30  259  	mtk_w32_mask(ir, 0x1, MTK_IRCLR, ir->data->regs[MTK_IRCLR_REG]);
6691e7b9a57c24 Sean Wang  2017-01-13  260  
6691e7b9a57c24 Sean Wang  2017-01-13  261  	/* Clear interrupt status */
50c3c1ba171f3f Sean Wang  2017-06-30  262  	mtk_w32_mask(ir, 0x1, MTK_IRINT_CLR,
50c3c1ba171f3f Sean Wang  2017-06-30  263  		     ir->data->regs[MTK_IRINT_CLR_REG]);
6691e7b9a57c24 Sean Wang  2017-01-13  264  
6691e7b9a57c24 Sean Wang  2017-01-13  265  	return IRQ_HANDLED;
6691e7b9a57c24 Sean Wang  2017-01-13  266  }
6691e7b9a57c24 Sean Wang  2017-01-13  267  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20596243AC3
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 15:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgHMNYQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 09:24:16 -0400
Received: from gofer.mess.org ([88.97.38.141]:36031 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbgHMNYP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 09:24:15 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D6734C63F9; Thu, 13 Aug 2020 14:24:13 +0100 (BST)
Date:   Thu, 13 Aug 2020 14:24:13 +0100
From:   Sean Young <sean@mess.org>
To:     kernel test robot <lkp@intel.com>
Cc:     linux-media@vger.kernel.org, kbuild-all@lists.01.org
Subject: Re: [PATCH] media: gpio-ir-tx: spinlock is not needed to disable
 interrupts
Message-ID: <20200813132413.GA8764@gofer.mess.org>
References: <20200813101841.5526-1-sean@mess.org>
 <202008132017.SmCLPNwW%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202008132017.SmCLPNwW%lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 13, 2020 at 08:04:40PM +0800, kernel test robot wrote:
> Hi Sean,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linuxtv-media/master]
> [also build test ERROR on v5.8 next-20200813]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Sean-Young/media-gpio-ir-tx-spinlock-is-not-needed-to-disable-interrupts/20200813-182045
> base:   git://linuxtv.org/media_tree.git master
> config: h8300-randconfig-r011-20200813 (attached as .config)
> compiler: h8300-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=h8300 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/kernel.h:11,
>                     from drivers/media/rc/gpio-ir-tx.c:6:
>    include/linux/scatterlist.h: In function 'sg_set_buf':
>    include/asm-generic/page.h:93:50: warning: ordered comparison of pointer with null pointer [-Wextra]
>       93 | #define virt_addr_valid(kaddr) (((void *)(kaddr) >= (void *)PAGE_OFFSET) && \
>          |                                                  ^~
>    include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
>       78 | # define unlikely(x) __builtin_expect(!!(x), 0)
>          |                                          ^
>    include/linux/scatterlist.h:143:2: note: in expansion of macro 'BUG_ON'
>      143 |  BUG_ON(!virt_addr_valid(buf));
>          |  ^~~~~~
>    include/linux/scatterlist.h:143:10: note: in expansion of macro 'virt_addr_valid'
>      143 |  BUG_ON(!virt_addr_valid(buf));
>          |          ^~~~~~~~~~~~~~~
>    In file included from include/linux/seqlock.h:36,
>                     from include/linux/time.h:6,
>                     from include/linux/stat.h:19,
>                     from include/linux/module.h:13,
>                     from drivers/media/rc/gpio-ir-tx.c:7:
>    drivers/media/rc/gpio-ir-tx.c: In function 'gpio_ir_tx_probe':
> >> drivers/media/rc/gpio-ir-tx.c:174:25: error: 'struct gpio_ir' has no member named 'lock'
>      174 |  spin_lock_init(&gpio_ir->lock);
>          |                         ^~
>    include/linux/spinlock.h:345:17: note: in definition of macro 'spin_lock_init'
>      345 |  spinlock_check(_lock);   \
>          |                 ^~~~~
> >> drivers/media/rc/gpio-ir-tx.c:174:25: error: 'struct gpio_ir' has no member named 'lock'
>      174 |  spin_lock_init(&gpio_ir->lock);
>          |                         ^~
>    include/linux/spinlock.h:346:4: note: in definition of macro 'spin_lock_init'
>      346 |  *(_lock) = __SPIN_LOCK_UNLOCKED(_lock); \
>          |    ^~~~~
> 
> vim +174 drivers/media/rc/gpio-ir-tx.c
> 
> 24d79ebc6ccec55 Sean Young 2017-07-07  142  
> 24d79ebc6ccec55 Sean Young 2017-07-07  143  static int gpio_ir_tx_probe(struct platform_device *pdev)
> 24d79ebc6ccec55 Sean Young 2017-07-07  144  {
> 24d79ebc6ccec55 Sean Young 2017-07-07  145  	struct gpio_ir *gpio_ir;
> 24d79ebc6ccec55 Sean Young 2017-07-07  146  	struct rc_dev *rcdev;
> 24d79ebc6ccec55 Sean Young 2017-07-07  147  	int rc;
> 24d79ebc6ccec55 Sean Young 2017-07-07  148  
> 24d79ebc6ccec55 Sean Young 2017-07-07  149  	gpio_ir = devm_kmalloc(&pdev->dev, sizeof(*gpio_ir), GFP_KERNEL);
> 24d79ebc6ccec55 Sean Young 2017-07-07  150  	if (!gpio_ir)
> 24d79ebc6ccec55 Sean Young 2017-07-07  151  		return -ENOMEM;
> 24d79ebc6ccec55 Sean Young 2017-07-07  152  
> 24d79ebc6ccec55 Sean Young 2017-07-07  153  	rcdev = devm_rc_allocate_device(&pdev->dev, RC_DRIVER_IR_RAW_TX);
> 24d79ebc6ccec55 Sean Young 2017-07-07  154  	if (!rcdev)
> 24d79ebc6ccec55 Sean Young 2017-07-07  155  		return -ENOMEM;
> 24d79ebc6ccec55 Sean Young 2017-07-07  156  
> 24d79ebc6ccec55 Sean Young 2017-07-07  157  	gpio_ir->gpio = devm_gpiod_get(&pdev->dev, NULL, GPIOD_OUT_LOW);
> 24d79ebc6ccec55 Sean Young 2017-07-07  158  	if (IS_ERR(gpio_ir->gpio)) {
> 24d79ebc6ccec55 Sean Young 2017-07-07  159  		if (PTR_ERR(gpio_ir->gpio) != -EPROBE_DEFER)
> 24d79ebc6ccec55 Sean Young 2017-07-07  160  			dev_err(&pdev->dev, "Failed to get gpio (%ld)\n",
> 24d79ebc6ccec55 Sean Young 2017-07-07  161  				PTR_ERR(gpio_ir->gpio));
> 24d79ebc6ccec55 Sean Young 2017-07-07  162  		return PTR_ERR(gpio_ir->gpio);
> 24d79ebc6ccec55 Sean Young 2017-07-07  163  	}
> 24d79ebc6ccec55 Sean Young 2017-07-07  164  
> 24d79ebc6ccec55 Sean Young 2017-07-07  165  	rcdev->priv = gpio_ir;
> 24d79ebc6ccec55 Sean Young 2017-07-07  166  	rcdev->driver_name = DRIVER_NAME;
> 24d79ebc6ccec55 Sean Young 2017-07-07  167  	rcdev->device_name = DEVICE_NAME;
> 24d79ebc6ccec55 Sean Young 2017-07-07  168  	rcdev->tx_ir = gpio_ir_tx;
> 24d79ebc6ccec55 Sean Young 2017-07-07  169  	rcdev->s_tx_duty_cycle = gpio_ir_tx_set_duty_cycle;
> 24d79ebc6ccec55 Sean Young 2017-07-07  170  	rcdev->s_tx_carrier = gpio_ir_tx_set_carrier;
> 24d79ebc6ccec55 Sean Young 2017-07-07  171  
> 24d79ebc6ccec55 Sean Young 2017-07-07  172  	gpio_ir->carrier = 38000;
> 24d79ebc6ccec55 Sean Young 2017-07-07  173  	gpio_ir->duty_cycle = 50;
> 24d79ebc6ccec55 Sean Young 2017-07-07 @174  	spin_lock_init(&gpio_ir->lock);

Oops, this line should've been removed. I sent the wrong patch.

I'll the send a v2 soon.

Sean

> 24d79ebc6ccec55 Sean Young 2017-07-07  175  
> 24d79ebc6ccec55 Sean Young 2017-07-07  176  	rc = devm_rc_register_device(&pdev->dev, rcdev);
> 24d79ebc6ccec55 Sean Young 2017-07-07  177  	if (rc < 0)
> 24d79ebc6ccec55 Sean Young 2017-07-07  178  		dev_err(&pdev->dev, "failed to register rc device\n");
> 24d79ebc6ccec55 Sean Young 2017-07-07  179  
> 24d79ebc6ccec55 Sean Young 2017-07-07  180  	return rc;
> 24d79ebc6ccec55 Sean Young 2017-07-07  181  }
> 24d79ebc6ccec55 Sean Young 2017-07-07  182  
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



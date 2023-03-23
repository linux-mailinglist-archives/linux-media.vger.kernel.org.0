Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 926AB6C6FE7
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 19:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjCWSDo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 14:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjCWSDm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 14:03:42 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7942D10242;
        Thu, 23 Mar 2023 11:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679594621; x=1711130621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P5vLr1EmL8h7eHQhc8i127T9nq9qHp50s3VJKwH/T58=;
  b=UegksNFIHQQ3PbvGUGfYL61A3HyzL6mbWnVMt4MvyAbY8xmt8idu9xkS
   4MOqFpBDU9NJHbT1k2oHY1NO1q6DB9txUt8iLj+Xr1Q6zfGJsWZ/qx9Vk
   y7AzAYiV2ww3MLGYshmTOR4Yku8vI/RYZO5ZrPm3IxLSWYk7fxDjF4kzw
   v/Bdd+3sYvHGCoBHZTLUaHMfI9Nfhb4eTHnCWV2G45kmWA4YqMYbbJu2j
   39GVbACXP5IL1JU7X1QobAxaiWM8bXOY9lDkLvwnpuX0Vy3N15w3MN6I9
   CGCr/uwkmNMa1jfQH6q8INKJ4vAuKpKimQ0o6U0Uov74I2GgKhzhZ3kAb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402158142"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="402158142"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 11:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="714921162"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="714921162"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Mar 2023 11:03:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfPHl-000EbM-1b;
        Thu, 23 Mar 2023 18:03:37 +0000
Date:   Fri, 24 Mar 2023 02:02:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH 8/8] usb: gadget: uvc: implement s/g_parm
Message-ID: <202303240129.Efnw3p6C-lkp@intel.com>
References: <20230323-uvc-gadget-cleanup-v1-8-e41f0c5d9d8e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-8-e41f0c5d9d8e@pengutronix.de>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

I love your patch! Yet something to improve:

[auto build test ERROR on 8be174835f07b2c106b9961c0775486d06112a3c]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Tretter/usb-gadget-uvc-use-fourcc-printk-helper/20230323-194359
base:   8be174835f07b2c106b9961c0775486d06112a3c
patch link:    https://lore.kernel.org/r/20230323-uvc-gadget-cleanup-v1-8-e41f0c5d9d8e%40pengutronix.de
patch subject: [PATCH 8/8] usb: gadget: uvc: implement s/g_parm
config: hexagon-randconfig-r041-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240129.Efnw3p6C-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f6fdbbf392bbaa79e8553af32337c54a663760db
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michael-Tretter/usb-gadget-uvc-use-fourcc-printk-helper/20230323-194359
        git checkout f6fdbbf392bbaa79e8553af32337c54a663760db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240129.Efnw3p6C-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/usb/gadget/function/uvc_v4l2.c:24:
   In file included from drivers/usb/gadget/function/uvc.h:15:
   In file included from include/linux/usb/composite.h:27:
   In file included from include/linux/usb/gadget.h:24:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/usb/gadget/function/uvc_v4l2.c:24:
   In file included from drivers/usb/gadget/function/uvc.h:15:
   In file included from include/linux/usb/composite.h:27:
   In file included from include/linux/usb/gadget.h:24:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/usb/gadget/function/uvc_v4l2.c:24:
   In file included from drivers/usb/gadget/function/uvc.h:15:
   In file included from include/linux/usb/composite.h:27:
   In file included from include/linux/usb/gadget.h:24:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/usb/gadget/function/uvc_v4l2.c:289:2: warning: comparison of distinct pointer types ('typeof ((interval)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
           do_div(interval, timeperframe->denominator);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
           (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
                  ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/usb/gadget/function/uvc_v4l2.c:289:2: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
           do_div(interval, timeperframe->denominator);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
                   __rem = __div64_32(&(n), __base);       \
                                      ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
   extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
                                        ^
>> drivers/usb/gadget/function/uvc_v4l2.c:289:2: warning: shift count >= width of type [-Wshift-count-overflow]
           do_div(interval, timeperframe->denominator);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) == 0)) {          \
                                  ^  ~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   8 warnings and 1 error generated.


vim +289 drivers/usb/gadget/function/uvc_v4l2.c

   265	
   266	static void find_closest_timeperframe(struct uvc_device *uvc,
   267					      struct v4l2_fract *timeperframe)
   268	{
   269		struct uvc_video *video = &uvc->video;
   270		struct uvcg_format *uformat;
   271		struct uvcg_frame *uframe;
   272		unsigned long interval;
   273		unsigned int best_interval;
   274		unsigned int curr;
   275		unsigned int dist;
   276		unsigned int best_dist = UINT_MAX;
   277		int i;
   278	
   279		if (timeperframe->denominator == 0)
   280			timeperframe->denominator = video->timeperframe.denominator;
   281		if (timeperframe->numerator == 0)
   282			timeperframe->numerator = video->timeperframe.numerator;
   283	
   284		uformat = find_format_by_pix(uvc, video->fcc);
   285		uframe = find_closest_frame_by_size(uvc, uformat,
   286						    video->width, video->height);
   287	
   288		interval = timeperframe->numerator * 10000000;
 > 289		do_div(interval, timeperframe->denominator);
   290	
   291		for (i = 0; i < uframe->frame.b_frame_interval_type; i++) {
   292			curr = uframe->dw_frame_interval[i];
   293			dist = interval > curr ? interval - curr : curr - interval;
   294			if (dist < best_dist) {
   295				best_dist = dist;
   296				best_interval = curr;
   297			}
   298		}
   299	
   300		timeperframe->numerator = best_interval;
   301		timeperframe->denominator = 10000000;
   302		v4l2_simplify_fraction(&timeperframe->numerator,
   303				       &timeperframe->denominator, 8, 333);
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

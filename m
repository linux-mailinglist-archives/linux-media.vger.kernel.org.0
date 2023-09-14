Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFB27A0697
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 15:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239355AbjINN5B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 09:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239273AbjINN5B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 09:57:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F279D1BE
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 06:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694699816; x=1726235816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b3tYeezIb9VcuITzl9VzLSF72s5Sqe8g4+fg04ckpuk=;
  b=bOFIa70dJReJ30lbGspWZHRwgqXg7G86w7pqW/Y933HAPZgrrHrGM+zY
   76SNLJEpmwXxmc6i+u3H7bBt2f5vm2wv5RCtZ7IqeTjredbeXVSVaI5TL
   Ihj2OfrCTdiO2NjsCP/sTzqg0QZSjfGc0eHNJ2tC/QGlGwKxW1rfxDcTP
   BTEHZE2qDqGz6CchSppF/SzKoR/tT8Y1QI8yof6GU1GP9DSrahy4+UWoS
   6oCS3w+pWBex71iAR1Jp9Gil+AGDqcOyGqYGim7e6J2Ry7LBvbUUtMjF6
   GjEvGkZxDd5qCLfjj+f0kIfSzSyh8XRoAXZXhatf3EmCeo3l0+kp1QbEV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376292984"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="376292984"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 06:56:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="721287442"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="721287442"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Sep 2023 06:56:47 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qgmpp-0001eZ-0b;
        Thu, 14 Sep 2023 13:56:45 +0000
Date:   Thu, 14 Sep 2023 21:56:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH 05/13] media: rockchip: rga: pre-calculate plane offsets
Message-ID: <202309142156.JJwE4Eke-lkp@intel.com>
References: <20230914-rockchip-rga-multiplanar-v1-5-abfd77260ae3@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-rockchip-rga-multiplanar-v1-5-abfd77260ae3@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0bb80ecc33a8fb5a682236443c1e740d5c917d1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Tretter/media-rockchip-rga-fix-swizzling-for-RGB-formats/20230914-204330
base:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
patch link:    https://lore.kernel.org/r/20230914-rockchip-rga-multiplanar-v1-5-abfd77260ae3%40pengutronix.de
patch subject: [PATCH 05/13] media: rockchip: rga: pre-calculate plane offsets
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230914/202309142156.JJwE4Eke-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309142156.JJwE4Eke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309142156.JJwE4Eke-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/rockchip/rga/rga-hw.c: In function 'rga_get_addr_offset':
>> drivers/media/platform/rockchip/rga/rga-hw.c:46:65: warning: variable 'uv_factor' set but not used [-Wunused-but-set-variable]
      46 |                      y_div = 0, uv_stride = 0, pixel_width = 0, uv_factor = 0;
         |                                                                 ^~~~~~~~~


vim +/uv_factor +46 drivers/media/platform/rockchip/rga/rga-hw.c

f7e7b48e6d796d Jacob Chen      2017-10-11  38  
f7e7b48e6d796d Jacob Chen      2017-10-11  39  static struct rga_corners_addr_offset
7c2b289b29ea42 Michael Tretter 2023-09-14  40  rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
7c2b289b29ea42 Michael Tretter 2023-09-14  41  		    unsigned int x, unsigned int y, unsigned int w, unsigned int h)
f7e7b48e6d796d Jacob Chen      2017-10-11  42  {
f7e7b48e6d796d Jacob Chen      2017-10-11  43  	struct rga_corners_addr_offset offsets;
f7e7b48e6d796d Jacob Chen      2017-10-11  44  	struct rga_addr_offset *lt, *lb, *rt, *rb;
f7e7b48e6d796d Jacob Chen      2017-10-11  45  	unsigned int x_div = 0,
f7e7b48e6d796d Jacob Chen      2017-10-11 @46  		     y_div = 0, uv_stride = 0, pixel_width = 0, uv_factor = 0;
f7e7b48e6d796d Jacob Chen      2017-10-11  47  
f7e7b48e6d796d Jacob Chen      2017-10-11  48  	lt = &offsets.left_top;
f7e7b48e6d796d Jacob Chen      2017-10-11  49  	lb = &offsets.left_bottom;
f7e7b48e6d796d Jacob Chen      2017-10-11  50  	rt = &offsets.right_top;
f7e7b48e6d796d Jacob Chen      2017-10-11  51  	rb = &offsets.right_bottom;
f7e7b48e6d796d Jacob Chen      2017-10-11  52  
f7e7b48e6d796d Jacob Chen      2017-10-11  53  	x_div = frm->fmt->x_div;
f7e7b48e6d796d Jacob Chen      2017-10-11  54  	y_div = frm->fmt->y_div;
f7e7b48e6d796d Jacob Chen      2017-10-11  55  	uv_factor = frm->fmt->uv_factor;
f7e7b48e6d796d Jacob Chen      2017-10-11  56  	uv_stride = frm->stride / x_div;
f7e7b48e6d796d Jacob Chen      2017-10-11  57  	pixel_width = frm->stride / frm->width;
f7e7b48e6d796d Jacob Chen      2017-10-11  58  
7c2b289b29ea42 Michael Tretter 2023-09-14  59  	lt->y_off = offset->y_off + y * frm->stride + x * pixel_width;
7c2b289b29ea42 Michael Tretter 2023-09-14  60  	lt->u_off = offset->u_off + (y / y_div) * uv_stride + x / x_div;
7c2b289b29ea42 Michael Tretter 2023-09-14  61  	lt->v_off = offset->v_off + (y / y_div) * uv_stride + x / x_div;
f7e7b48e6d796d Jacob Chen      2017-10-11  62  
f7e7b48e6d796d Jacob Chen      2017-10-11  63  	lb->y_off = lt->y_off + (h - 1) * frm->stride;
f7e7b48e6d796d Jacob Chen      2017-10-11  64  	lb->u_off = lt->u_off + (h / y_div - 1) * uv_stride;
f7e7b48e6d796d Jacob Chen      2017-10-11  65  	lb->v_off = lt->v_off + (h / y_div - 1) * uv_stride;
f7e7b48e6d796d Jacob Chen      2017-10-11  66  
f7e7b48e6d796d Jacob Chen      2017-10-11  67  	rt->y_off = lt->y_off + (w - 1) * pixel_width;
f7e7b48e6d796d Jacob Chen      2017-10-11  68  	rt->u_off = lt->u_off + w / x_div - 1;
f7e7b48e6d796d Jacob Chen      2017-10-11  69  	rt->v_off = lt->v_off + w / x_div - 1;
f7e7b48e6d796d Jacob Chen      2017-10-11  70  
f7e7b48e6d796d Jacob Chen      2017-10-11  71  	rb->y_off = lb->y_off + (w - 1) * pixel_width;
f7e7b48e6d796d Jacob Chen      2017-10-11  72  	rb->u_off = lb->u_off + w / x_div - 1;
f7e7b48e6d796d Jacob Chen      2017-10-11  73  	rb->v_off = lb->v_off + w / x_div - 1;
f7e7b48e6d796d Jacob Chen      2017-10-11  74  
f7e7b48e6d796d Jacob Chen      2017-10-11  75  	return offsets;
f7e7b48e6d796d Jacob Chen      2017-10-11  76  }
f7e7b48e6d796d Jacob Chen      2017-10-11  77  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

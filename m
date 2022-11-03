Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4FC618630
	for <lists+linux-media@lfdr.de>; Thu,  3 Nov 2022 18:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbiKCRac (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Nov 2022 13:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbiKCRab (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Nov 2022 13:30:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F9D263F
        for <linux-media@vger.kernel.org>; Thu,  3 Nov 2022 10:30:30 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oqe2j-00054Z-DI; Thu, 03 Nov 2022 18:30:17 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oqe2j-0003XJ-05; Thu, 03 Nov 2022 18:30:17 +0100
Date:   Thu, 3 Nov 2022 18:30:16 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [sailus-media-tree:master 43/47] drivers/clk/clk.c:1022:5:
 error: redefinition of 'clk_prepare'
Message-ID: <20221103173016.a2stvc6jtprs3nzh@pengutronix.de>
References: <202211031915.GxCDfpg5-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211031915.GxCDfpg5-lkp@intel.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 22-11-03, kernel test robot wrote:
> tree:   git://linuxtv.org/sailus/media_tree.git master
> head:   7336c54a562b479866d2de2abc61487a4e07b0b9
> commit: 80a21da360516fa602f3a50eb9792f9dfbfb5fdb [43/47] media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver
> config: sh-allmodconfig
> compiler: sh4-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add sailus-media-tree git://linuxtv.org/sailus/media_tree.git
>         git fetch --no-tags sailus-media-tree master
>         git checkout 80a21da360516fa602f3a50eb9792f9dfbfb5fdb
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/clk.c:941:6: error: redefinition of 'clk_unprepare'
>      941 | void clk_unprepare(struct clk *clk)
>          |      ^~~~~~~~~~~~~
>    In file included from drivers/clk/clk.c:9:
>    include/linux/clk.h:303:20: note: previous definition of 'clk_unprepare' with type 'void(struct clk *)'
>      303 | static inline void clk_unprepare(struct clk *clk)
>          |                    ^~~~~~~~~~~~~
> >> drivers/clk/clk.c:1022:5: error: redefinition of 'clk_prepare'
>     1022 | int clk_prepare(struct clk *clk)
>          |     ^~~~~~~~~~~
>    include/linux/clk.h:271:19: note: previous definition of 'clk_prepare' with type 'int(struct clk *)'
>      271 | static inline int clk_prepare(struct clk *clk)
>          |                   ^~~~~~~~~~~
> >> drivers/clk/clk.c:1268:6: error: redefinition of 'clk_is_enabled_when_prepared'
>     1268 | bool clk_is_enabled_when_prepared(struct clk *clk)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/clk.h:284:20: note: previous definition of 'clk_is_enabled_when_prepared' with type 'bool(struct clk *)' {aka '_Bool(struct clk *)'}
>      284 | static inline bool clk_is_enabled_when_prepared(struct clk *clk)
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for COMMON_CLK
>    Depends on [n]: !HAVE_LEGACY_CLK [=y]
>    Selected by [m]:
>    - VIDEO_TC358746 [=m] && MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && PM [=y] && I2C [=m]

Hm.. this is strange but my relate to the unmet dependency. I could add
a depends on COMMON_CLK but this no i2c driver is doing that, just a few
platform drivers.

Regards,
  Marco

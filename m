Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F1C4DA091
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 17:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346697AbiCOQ44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 12:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243479AbiCOQ4y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 12:56:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5207756C25
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 09:55:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 09176B810EE
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 16:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3539C340E8;
        Tue, 15 Mar 2022 16:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647363339;
        bh=8ARYFhjWfd7G/MaMBnSlEToE5LqJPYI3a47OYB8X3ko=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PVWHwvXPSZhU8/4TlfZn/9l1E2x/H4YA9CiYkuZY4hsRwamcwcHEueH/I63xjj1r1
         Qkvsilmo7jWwqAN7LcWY7jPuiWXD8nTl1EnyuOVhk7WfLKx1o96ITCuAcJRsAEhQ84
         B7lqbouv0m16EINbjsCbOjg+/CdmwpyyWtM11jWQ/kFu9fPAvdDTs2impDh2YYB/an
         OhodRVQkUPp6xXL8oxKkgIMO4nr6PRi0Ncx9mjDw7rDjdWqShNFYYbsAPgpaZEYUqI
         bc8bcW6Ux9VGzB+HX/nWD19cTAUkwLTJkq8+2Ah6YZWkUPDPTXldeAFmc9X2kJG8xn
         E8ZTOvEk4zdOg==
Date:   Tue, 15 Mar 2022 09:55:32 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        llvm@lists.linux.dev, kbuild-all@lists.01.org,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 8/8] media: i2c: ov5670: Add .get_selection() support
Message-ID: <YjDFBKhV0ALzu36l@dev-arch.thelio-3990X>
References: <20220314162714.153970-9-jacopo@jmondi.org>
 <202203151238.pCKNarov-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202203151238.pCKNarov-lkp@intel.com>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 15, 2022 at 12:18:48PM +0800, kernel test robot wrote:
> Hi Jacopo,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on media-tree/master]
> [also build test ERROR on linus/master v5.17-rc8 next-20220310]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Jacopo-Mondi/media-i2c-ov5670-OF-support-runtime_pm-regulators/20220315-003034
> base:   git://linuxtv.org/media_tree.git master
> config: i386-randconfig-a012-20220314 (https://download.01.org/0day-ci/archive/20220315/202203151238.pCKNarov-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3e4950d7fa78ac83f33bbf1658e2f49a73719236)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/c619a8eee6477517dfaa05511344d0bddc4e1c55
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Jacopo-Mondi/media-i2c-ov5670-OF-support-runtime_pm-regulators/20220315-003034
>         git checkout c619a8eee6477517dfaa05511344d0bddc4e1c55
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/media/i2c/ov5670.c:1787:18: error: initializer element is not a compile-time constant
>                    .analog_crop = ov5670_analog_crop,
>                                   ^~~~~~~~~~~~~~~~~~
>    1 error generated.

GCC versions prior to 8 will complain about this as well:

$ gcc --version | head -1
gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0

$ make -j"$(nproc)" mrproper allmodconfig drivers/media/i2c/ov5670.o
drivers/media/i2c/ov5670.c:1787:18: error: initializer element is not constant
   .analog_crop = ov5670_analog_crop,
                  ^~~~~~~~~~~~~~~~~~
drivers/media/i2c/ov5670.c:1787:18: note: (near initialization for ‘supported_modes[0].analog_crop’)
drivers/media/i2c/ov5670.c:1799:18: error: initializer element is not constant
   .analog_crop = ov5670_analog_crop,
                  ^~~~~~~~~~~~~~~~~~
drivers/media/i2c/ov5670.c:1799:18: note: (near initialization for ‘supported_modes[1].analog_crop’)
drivers/media/i2c/ov5670.c:1811:18: error: initializer element is not constant
   .analog_crop = ov5670_analog_crop,
                  ^~~~~~~~~~~~~~~~~~
drivers/media/i2c/ov5670.c:1811:18: note: (near initialization for ‘supported_modes[2].analog_crop’)
drivers/media/i2c/ov5670.c:1823:18: error: initializer element is not constant
   .analog_crop = ov5670_analog_crop,
                  ^~~~~~~~~~~~~~~~~~
drivers/media/i2c/ov5670.c:1823:18: note: (near initialization for ‘supported_modes[3].analog_crop’)
drivers/media/i2c/ov5670.c:1836:18: error: initializer element is not constant
   .analog_crop = ov5670_analog_crop,
                  ^~~~~~~~~~~~~~~~~~
drivers/media/i2c/ov5670.c:1836:18: note: (near initialization for ‘supported_modes[4].analog_crop’)
drivers/media/i2c/ov5670.c:1848:18: error: initializer element is not constant
   .analog_crop = ov5670_analog_crop,
                  ^~~~~~~~~~~~~~~~~~
drivers/media/i2c/ov5670.c:1848:18: note: (near initialization for ‘supported_modes[5].analog_crop’)
scripts/Makefile.build:288: recipe for target 'drivers/media/i2c/ov5670.o' failed

clang may eventually support this: https://reviews.llvm.org/D76096

Cheers,
Nathan

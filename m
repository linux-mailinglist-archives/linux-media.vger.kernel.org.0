Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4032C524D42
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 14:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353905AbiELMn3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 08:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351628AbiELMnZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 08:43:25 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F0D6A002
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 05:43:23 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24CC7SSK018750;
        Thu, 12 May 2022 14:43:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=i4Zv5sgHGijE8KApDEqt9b8jgWl1xVk0LP2pufAAtLI=;
 b=6CtuEn3NXDU6UQ8xNvOOu4bwfv2EdwI0WN7XSw6p4BW7Q5PHoIoxsMDy9e4iEY9jsr/f
 QwZkUzOuAlbEzChdvU5jRZP/6gaNxysJhisKWHzDqUxMlSSSfALXbbqFCfNQtif6fUoA
 05IuWQpGaR98bXidcKuO5Uh4XzXY95v+R+aLEh8KcXjBAZrD/KOc+9aSxunOqC5iFfFo
 advfu4ixGWaIjDoZ8MRxUNfSXMiCeddKEvmtvnx4RkZClVww1suEaZSS2oh8morOsrsI
 Px2j4ceEIOZGK46/Zj1dEhb8S1uZvwdFJNAtb5E/x0JRt+BL1/s5cLwal8qDbdXIa44v BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g083j291f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 May 2022 14:43:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53FE010002A;
        Thu, 12 May 2022 14:43:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43922229A91;
        Thu, 12 May 2022 14:43:08 +0200 (CEST)
Received: from [10.0.2.15] (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 12 May 2022 14:43:07
 +0200
Subject: Re: [PATCH v3 3/5] media: uapi: Add ST VGXY61 header file
To:     kernel test robot <lkp@intel.com>, <linux-media@vger.kernel.org>
CC:     <kbuild-all@lists.01.org>, <alain.volmat@foss.st.com>,
        <hugues.fruchet@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <dave.stevenson@raspberrypi.com>, <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>
References: <20220512074037.3829926-4-benjamin.mugnier@foss.st.com>
 <202205121843.Y5ufdQpc-lkp@intel.com>
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Message-ID: <6d721576-0453-e246-e3ba-d1614b41bc9d@foss.st.com>
Date:   Thu, 12 May 2022 14:43:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <202205121843.Y5ufdQpc-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-12_10,2022-05-12_01,2022-02-23_01
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixed for v4.

Benjamin

On 12/05/2022 12:32, kernel test robot wrote:
> Hi Benjamin,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on media-tree/master]
> [also build test ERROR on linus/master v5.18-rc6 next-20220511]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Mugnier/media-Add-ST-VGXY61-camera-sensor-driver/20220512-154318
> base:   git://linuxtv.org/media_tree.git master
> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220512/202205121843.Y5ufdQpc-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 11.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/47c49a5b0ade9511ba79fbe14a0d2231975757e5
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Benjamin-Mugnier/media-Add-ST-VGXY61-camera-sensor-driver/20220512-154318
>         git checkout 47c49a5b0ade9511ba79fbe14a0d2231975757e5
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=mips prepare
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
>    scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
>    scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>>> error: include/uapi/linux/st-vgxy61.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
>    make[2]: *** [scripts/Makefile.headersinst:63: usr/include/linux/st-vgxy61.h] Error 1
>    make[2]: Target '__headers' not remade because of errors.
>    make[1]: *** [Makefile:1280: headers] Error 2
>    arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
>       26 | void output_ptreg_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
>       78 | void output_task_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:92:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
>       92 | void output_thread_info_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:108:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
>      108 | void output_thread_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:136:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
>      136 | void output_thread_fpu_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:179:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
>      179 | void output_mm_defines(void)
>          |      ^~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:218:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
>      218 | void output_sc_defines(void)
>          |      ^~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:253:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
>      253 | void output_signal_defined(void)
>          |      ^~~~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:320:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
>      320 | void output_pbe_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:332:6: warning: no previous prototype for 'output_pm_defines' [-Wmissing-prototypes]
>      332 | void output_pm_defines(void)
>          |      ^~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:346:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
>      346 | void output_kvm_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:390:6: warning: no previous prototype for 'output_cps_defines' [-Wmissing-prototypes]
>      390 | void output_cps_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:219: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
> 

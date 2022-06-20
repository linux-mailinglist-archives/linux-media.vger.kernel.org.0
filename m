Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 072BE552430
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 20:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343564AbiFTSqw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 14:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235019AbiFTSqw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 14:46:52 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA7B1A398;
        Mon, 20 Jun 2022 11:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655750810; x=1687286810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3cO+9b7DCuxN6a4z6JHt9DjUZ/m4m3onBWRNXNTs5m0=;
  b=e8BRQMeZBm0KGhI9fhGSUqXQ7zE5HROVbvCBnNqS0d037yJGwpdrBbOe
   J5rXrP+07hMnDKNOxk+kt3tF96H0g6nxsoFZ1qvN6rLdYefyH3gGR930i
   ano1awVDQAc1fwUdhkKKkT5imIdJ0mPlrXjfQOULrj5DK1VqluCxILBBF
   yMsrG9yP7nufX8+GaBdx+26QQ5WxtdJbnBvm9NHzsGlajLQ825Cv6oWxf
   mLyqmsfiKh4tX6O0Vi+BEKtoqvBP+IUsupuuNcegpsXV7FOXca53N9KC1
   KJoKYDQGi1qNFBI/t4HEamn5UqkyqlJSUJwpOrPsd2XCYG9AgiDVMOg1D
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="305393344"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="305393344"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 11:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="654795752"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Jun 2022 11:46:47 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o3MQB-000VIK-4w;
        Mon, 20 Jun 2022 18:46:47 +0000
Date:   Tue, 21 Jun 2022 02:46:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org,
        ays@melexis.com, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        kieran.bingham+renesas@ideasonboard.com, devicetree@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 4/6] media: uapi: Add mlx7502x header file
Message-ID: <202206210214.qdKFyz8R-lkp@intel.com>
References: <20220620162523.GA14039@vkh-ThinkPad-T490>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620162523.GA14039@vkh-ThinkPad-T490>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Volodymyr,

I love your patch! Yet something to improve:

[auto build test ERROR on 945a9a8e448b65bec055d37eba58f711b39f66f0]

url:    https://github.com/intel-lab-lkp/linux/commits/Volodymyr-Kharuk/media-i2c-mlx7502x-ToF-camera-support/20220621-003030
base:   945a9a8e448b65bec055d37eba58f711b39f66f0
config: x86_64-randconfig-a013-20220620 (https://download.01.org/0day-ci/archive/20220621/202206210214.qdKFyz8R-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4c86ad4f2630e1b354d314a93800db2363826242
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Volodymyr-Kharuk/media-i2c-mlx7502x-ToF-camera-support/20220621-003030
        git checkout 4c86ad4f2630e1b354d314a93800db2363826242
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> error: include/uapi/linux/mlx7502x.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[2]: *** [scripts/Makefile.headersinst:63: usr/include/linux/mlx7502x.h] Error 1
   make[2]: Target '__headers' not remade because of errors.
   make[1]: *** [Makefile:1286: headers] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

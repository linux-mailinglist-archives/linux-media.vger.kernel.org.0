Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA7F552453
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 20:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243351AbiFTS6H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 14:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236360AbiFTS6E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 14:58:04 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382DCCFF;
        Mon, 20 Jun 2022 11:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655751481; x=1687287481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x+gv9xpQam84+22/vjH7Q89E2WxB+XSOUwJeuL1wLrU=;
  b=At6B3dAZny36B1yY0gCIeXagnKzNmS2dAb2wqvk/oP+CAbDZB4J3yCzf
   3A/gUYxLM6sJbqgiiDWfi79c9tktMKMfQQaU89wLaDp1T0AMpxsxRxh51
   qwP22Iz5uL93vv/Ax/XZPxPkxL1kAB5GXWtOIy7gFNOcBdMCvAGfafprQ
   NoZYFn1vHKJabmf4TBO9lR96e0JNIIWtevrt2a2rBsIYNdDlgusKIWdHx
   QvS4Rwr8/dTsud52mmDWP1Ow5QcDIttLzUMldeFSWUc18FPWjcdomBDhU
   2FKBoq5+6X72OZBQ553N0nXQ/wy7Gsm5cn7pcQAB8RzL8+d2U/h/ahUQk
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="260390706"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="260390706"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 11:57:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="643238919"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2022 11:57:50 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o3Mar-000VUF-Ga;
        Mon, 20 Jun 2022 18:57:49 +0000
Date:   Tue, 21 Jun 2022 02:56:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org,
        ays@melexis.com, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        kieran.bingham+renesas@ideasonboard.com, devicetree@vger.kernel.org
Cc:     kbuild-all@lists.01.org
Subject: Re: [PATCH 4/6] media: uapi: Add mlx7502x header file
Message-ID: <202206210257.TVLhK9QZ-lkp@intel.com>
References: <20220620162523.GA14039@vkh-ThinkPad-T490>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620162523.GA14039@vkh-ThinkPad-T490>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20220621/202206210257.TVLhK9QZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4c86ad4f2630e1b354d314a93800db2363826242
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Volodymyr-Kharuk/media-i2c-mlx7502x-ToF-camera-support/20220621-003030
        git checkout 4c86ad4f2630e1b354d314a93800db2363826242
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=m68k prepare

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

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8880D498078
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 14:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242891AbiAXNI4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 08:08:56 -0500
Received: from mga04.intel.com ([192.55.52.120]:13552 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239858AbiAXNIz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 08:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643029735; x=1674565735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ay7yonqcYw4lzgc0ZRVBIAGCdvzjkwmkD2+ZbM7lxsE=;
  b=WyX+yqLY8OCsk7US92OAJxT3Ooh6bDtr0YU61YFX0CTJczjY5GyHowsN
   Yx44JIMZVB3GcL6duz06cC0mcuy1acSDGaqkwg9qBDprxevd8O2F0PTip
   LkoKK9ULxvJGTYj9Tt3KJLbnv+n6iSsOoOmLee15m1i9+omQNDaPoZSYT
   6MGPZ84BiFd/toMF0iA7ZGEvNNCRIzS1o5lgJv/8Rkr0zuXjFZGi/Sj1U
   2zn9jXZy0JVHo5a+QYbjGvJ3wrp8u6EmMw2FL0bTFUGsKBrE0rRt82nhI
   cnu2nOYBYzVP3izU/xjOV6UoANlsbUAFIAC7sT7yel3dE9LvhjfySueDF
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="244873526"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="244873526"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 05:08:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="562651153"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Jan 2022 05:08:41 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nBz5M-000ILj-JB; Mon, 24 Jan 2022 13:08:40 +0000
Date:   Mon, 24 Jan 2022 21:08:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
        shawnguo@kernel.org, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH V3 06/10] arm64: dts: imx8mq: Enable both G1 and G2 VPU's
 with vpu-blk-ctrl
Message-ID: <202201242024.Xqet4cvg-lkp@intel.com>
References: <20220124023125.414794-7-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124023125.414794-7-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on e783362eb54cd99b2cac8b3a9aeac942e6f6ac07]

url:    https://github.com/0day-ci/linux/commits/Adam-Ford/media-hantro-imx8mq-imx8mm-Let-VPU-decoders-get-controlled-by-vpu-blk-ctrl/20220124-103340
base:   e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
config: arm64-buildonly-randconfig-r001-20220124 (https://download.01.org/0day-ci/archive/20220124/202201242024.Xqet4cvg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a74e6df1159d70d74f2a6988748f8e9648478d86
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Adam-Ford/media-hantro-imx8mq-imx8mm-Let-VPU-decoders-get-controlled-by-vpu-blk-ctrl/20220124-103340
        git checkout a74e6df1159d70d74f2a6988748f8e9648478d86
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi:275.1-5 Label or path vpu not found
   FATAL ERROR: Syntax error parsing input tree

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

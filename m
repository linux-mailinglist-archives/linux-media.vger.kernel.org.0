Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D832577309
	for <lists+linux-media@lfdr.de>; Sun, 17 Jul 2022 03:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbiGQBeI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jul 2022 21:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232637AbiGQBeG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jul 2022 21:34:06 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E94319C1C;
        Sat, 16 Jul 2022 18:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658021645; x=1689557645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+XMChNw0Gz6+nuPRsN7JXhyI2VdGCfNEEUhObhOMVpg=;
  b=blm0m6ho4eci+UkT9ZCvXVfuYrME2wGPdVOv4u1/JCAlwwvPQy5CdZWJ
   7+U6wrvOS1h6c9vqBMIUzvJapABZ41i8epHlmHmu6pgfdeyVn8hJK1f7E
   orAecDDJRzwYf6E/5W/hyJqjsgcKF/Ktww4TsppDMXJld6ZPFUgSXVXIe
   Sm+hbcWAvacIfAvOYor9qrdC2O/34/rWexbWB0fpj1npq7KNDUybvrNFy
   vH+BykWRH9IPJLBRRiChaVOnCh1kbLXXFqqpApCtkO7jK0sCOMf2LQC1g
   ua8P29uiylmByNOkyAwaC00n6Fa5d7KchdSIkr5oxed24WWgUmkXXc5l5
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="284774845"
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; 
   d="scan'208";a="284774845"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2022 18:34:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; 
   d="scan'208";a="629514612"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Jul 2022 18:34:01 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oCtAX-0002Q9-9s;
        Sun, 17 Jul 2022 01:34:01 +0000
Date:   Sun, 17 Jul 2022 09:33:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Volodymyr Kharuk <vkh@melexis.com>,
        Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michal Simek <monstr@monstr.eu>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/6] media: i2c: Add driver for mlx7502x ToF sensor
Message-ID: <202207170928.qeUikXoT-lkp@intel.com>
References: <6f9b20bb1946d8a50170963b84e32abfdee14ba7.1657786765.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f9b20bb1946d8a50170963b84e32abfdee14ba7.1657786765.git.vkh@melexis.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Volodymyr,

I love your patch! Perhaps something to improve:

[auto build test WARNING on d8e8aa866ed8636fd6c1017c3d9453eab2922496]

url:    https://github.com/intel-lab-lkp/linux/commits/Volodymyr-Kharuk/media-i2c-mlx7502x-ToF-camera-support/20220714-163709
base:   d8e8aa866ed8636fd6c1017c3d9453eab2922496
config: parisc-randconfig-s041-20220715 (https://download.01.org/0day-ci/archive/20220717/202207170928.qeUikXoT-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/59a691c2f449518699a328ea663098aa3ae038b9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Volodymyr-Kharuk/media-i2c-mlx7502x-ToF-camera-support/20220714-163709
        git checkout 59a691c2f449518699a328ea663098aa3ae038b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc64 SHELL=/bin/bash drivers/media/i2c/ drivers/pci/ kernel/trace/ sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/mlx7502x.c:1989:53: sparse: sparse: Using plain integer as NULL pointer

vim +1989 drivers/media/i2c/mlx7502x.c

  1987	
  1988	static const struct of_device_id mlx7502x_of_match[] = {
> 1989		{ .compatible = "melexis,mlx7502x", .data = 0 }, /* auto-detection */
  1990		{ .compatible = "melexis,mlx75026", .data = &mlx75026 },
  1991		{ .compatible = "melexis,mlx75027", .data = &mlx75027 },
  1992		{ /* sentinel */ }
  1993	};
  1994	MODULE_DEVICE_TABLE(of, mlx7502x_of_match);
  1995	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

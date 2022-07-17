Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E6D5778E5
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 01:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbiGQXxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jul 2022 19:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiGQXxJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jul 2022 19:53:09 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C3010FF0;
        Sun, 17 Jul 2022 16:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658101988; x=1689637988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VNMEzfp+9oK/wqfrmdzIE3iL6TAeWOf/0OE1dADLY6c=;
  b=OBAX0RhqQBDYz9jAeQz9uDGNdJMrI8qMuxH1NmaPc7kkTjwMo+0Ftrz+
   pjKwCbdvL1JxV66sXid4VdLyCjZ87Uy5zNSEpgOkEQXMaKLpZV485GDjH
   EozSexQf4qXoM5+ZytnhVqSUE5awhFhh53nur0Ty8ZnExzVRB7v7fq8A3
   OlV0w7Mj+aKxF4hwjH/36hUg8ChI5HkUiTWDeblBzMI0/XGmd3ap9MsQ0
   CooxFGFDBswWyNDhMcEMPhVmEj0aj2ZerR0JIiSk9jbhQxxC+hNZbGs7M
   4rYW5UZC2l5l3ML8ow079+MS0mz12bZICi+TjnvXET30rQahcwc4gpcoP
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="350063090"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="350063090"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2022 16:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="547276233"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Jul 2022 16:53:05 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oDE4O-0003o1-EY;
        Sun, 17 Jul 2022 23:53:04 +0000
Date:   Mon, 18 Jul 2022 07:52:33 +0800
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
Message-ID: <202207180729.RLw6oeM7-lkp@intel.com>
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
config: parisc-randconfig-s041-20220715 (https://download.01.org/0day-ci/archive/20220718/202207180729.RLw6oeM7-lkp@intel.com/config)
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

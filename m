Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D90EA525551
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 21:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353630AbiELTDu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 15:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238231AbiELTDu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 15:03:50 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BA620F4E6
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 12:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652382229; x=1683918229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r/MrM0aa3v+g3XfeTh6/KiXpr80XesavKEiyALab2Lw=;
  b=eUnnlbbc52d8vTNpdWi0tWainTUGkBGPvAhJS13AqSim//GAXkGL7xV4
   LhbtitvGc9c5TOOq/D8LDbIzkbCDopPGzzkBDZ3jqzILb6y3Yj8y4+v5T
   1idxyCM5kaDFtFXacIhcMfnvyEKn9ob9zuDoxTp5fIzUIwZLnGjZsqMpg
   OuZoqRjJGDXfXee6m6RCQyhECGaazqBjPNfPhbR1WFd9McAy5KREg3scv
   Yk4si5PHtjMt7QIrgiIqDGQjUwzuLfVPAkplw4zQ0/9OM81xn6h7Ke0WZ
   bcgZORpGA4kEarLH/hYLRByRiVPFupLYWCszNPMgRv2WeL+QL663kJIbn
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="252160664"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="252160664"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 12:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="895922349"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 May 2022 12:03:46 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1npE6D-000Kpg-B6;
        Thu, 12 May 2022 19:03:45 +0000
Date:   Fri, 13 May 2022 03:02:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Oliver Neukum <oneukum@suse.com>, linux-media@vger.kernel.org,
        mchehab@kernel.org, sean@mess.org
Cc:     kbuild-all@lists.01.org, Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] imon_raw: respect DMA coherency
Message-ID: <202205130246.Kh3xxrsg-lkp@intel.com>
References: <20220512130321.30599-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512130321.30599-1-oneukum@suse.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Oliver,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/imon_raw-respect-DMA-coherency/20220512-210422
base:   git://linuxtv.org/media_tree.git master
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20220513/202205130246.Kh3xxrsg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5e1a1b1e9c8288033f5f1f1d70a3d7506114fad3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oliver-Neukum/imon_raw-respect-DMA-coherency/20220512-210422
        git checkout 5e1a1b1e9c8288033f5f1f1d70a3d7506114fad3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/rc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/little_endian.h:14,
                    from include/linux/byteorder/little_endian.h:5,
                    from arch/arm/include/uapi/asm/byteorder.h:22,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arm/include/asm/bitops.h:267,
                    from include/linux/bitops.h:33,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/media/rc/imon_raw.c:5:
   drivers/media/rc/imon_raw.c: In function 'imon_ir_data':
>> include/uapi/linux/byteorder/little_endian.h:39:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                  ^
   include/uapi/linux/swab.h:128:54: note: in definition of macro '__swab64'
     128 | #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/media/rc/imon_raw.c:32:20: note: in expansion of macro 'be64_to_cpu'
      32 |         u64 data = be64_to_cpu(imon->ir_buf);
         |                    ^~~~~~~~~~~


vim +39 include/uapi/linux/byteorder/little_endian.h

5921e6f8809b16 David Howells 2012-10-13  15  
5921e6f8809b16 David Howells 2012-10-13  16  #define __constant_htonl(x) ((__force __be32)___constant_swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  17  #define __constant_ntohl(x) ___constant_swab32((__force __be32)(x))
5921e6f8809b16 David Howells 2012-10-13  18  #define __constant_htons(x) ((__force __be16)___constant_swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  19  #define __constant_ntohs(x) ___constant_swab16((__force __be16)(x))
5921e6f8809b16 David Howells 2012-10-13  20  #define __constant_cpu_to_le64(x) ((__force __le64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  21  #define __constant_le64_to_cpu(x) ((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  22  #define __constant_cpu_to_le32(x) ((__force __le32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  23  #define __constant_le32_to_cpu(x) ((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  24  #define __constant_cpu_to_le16(x) ((__force __le16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  25  #define __constant_le16_to_cpu(x) ((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  26  #define __constant_cpu_to_be64(x) ((__force __be64)___constant_swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  27  #define __constant_be64_to_cpu(x) ___constant_swab64((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  28  #define __constant_cpu_to_be32(x) ((__force __be32)___constant_swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  29  #define __constant_be32_to_cpu(x) ___constant_swab32((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  30  #define __constant_cpu_to_be16(x) ((__force __be16)___constant_swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  31  #define __constant_be16_to_cpu(x) ___constant_swab16((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  32  #define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  33  #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  34  #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  35  #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  36  #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  37  #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  38  #define __cpu_to_be64(x) ((__force __be64)__swab64((x)))
5921e6f8809b16 David Howells 2012-10-13 @39  #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  40  #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  41  #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  42  #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  43  #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  44  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

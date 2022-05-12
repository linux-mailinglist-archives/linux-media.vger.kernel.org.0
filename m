Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABFA5525461
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 20:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357424AbiELSAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 14:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357423AbiELSAs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 14:00:48 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54387CCE
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 11:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652378446; x=1683914446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jd99sjNG6Saq9JjJWAu32MhudDc2SRg5hBBb5k6MBfM=;
  b=M1y+X7ivkWctD5txC3RLvA2+cnoZs7LLnOX2Aw9u/KLc9F0W8XguPZvm
   JRia4z8M+KtvVU+xlQu7oen3HYEVzjUcc5nKA1vtPAk3e7dWneEnAS3lt
   0GVz/26/TAZOwkvf2Eg8fR8iacZDVj9cxYnAY9rDi+ZF7WAsN97m7TgR5
   SIMA1plrKMvl/3ZJ44e6/Yx/TaDQkQ5n3TdGPz1znAmnSgBn9fHXECngH
   OwG7AOUGlGknun1FsJQQv1uHXVz+EHloyQNziYesnBlHQHJejVGu1JBjI
   ei4FuTCKMX2YGPYNchzs2rjCVo60NDnRAoM1zyXsNIZtRGpb1QardjgOc
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="267684604"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="267684604"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 11:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="521071822"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 May 2022 11:00:44 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1npD7D-000KmU-0n;
        Thu, 12 May 2022 18:00:43 +0000
Date:   Fri, 13 May 2022 01:59:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Oliver Neukum <oneukum@suse.com>, linux-media@vger.kernel.org,
        mchehab@kernel.org, sean@mess.org
Cc:     kbuild-all@lists.01.org, Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] imon_raw: respect DMA coherency
Message-ID: <202205130146.FkLP3KTa-lkp@intel.com>
References: <20220512130321.30599-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512130321.30599-1-oneukum@suse.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Oliver,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc6 next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/imon_raw-respect-DMA-coherency/20220512-210422
base:   git://linuxtv.org/media_tree.git master
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220513/202205130146.FkLP3KTa-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5e1a1b1e9c8288033f5f1f1d70a3d7506114fad3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oliver-Neukum/imon_raw-respect-DMA-coherency/20220512-210422
        git checkout 5e1a1b1e9c8288033f5f1f1d70a3d7506114fad3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/media/rc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/arc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arc/include/asm/bitops.h:192,
                    from include/linux/bitops.h:33,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/media/rc/imon_raw.c:5:
   drivers/media/rc/imon_raw.c: In function 'imon_ir_data':
>> include/uapi/linux/byteorder/big_endian.h:39:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                          ^
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/media/rc/imon_raw.c:32:20: note: in expansion of macro 'be64_to_cpu'
      32 |         u64 data = be64_to_cpu(imon->ir_buf);
         |                    ^~~~~~~~~~~


vim +39 include/uapi/linux/byteorder/big_endian.h

5921e6f8809b16 David Howells 2012-10-13  15  
5921e6f8809b16 David Howells 2012-10-13  16  #define __constant_htonl(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  17  #define __constant_ntohl(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  18  #define __constant_htons(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  19  #define __constant_ntohs(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  20  #define __constant_cpu_to_le64(x) ((__force __le64)___constant_swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  21  #define __constant_le64_to_cpu(x) ___constant_swab64((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  22  #define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  23  #define __constant_le32_to_cpu(x) ___constant_swab32((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  24  #define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  25  #define __constant_le16_to_cpu(x) ___constant_swab16((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  26  #define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  27  #define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  28  #define __constant_cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  29  #define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  30  #define __constant_cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  31  #define __constant_be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  32  #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  33  #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  34  #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  35  #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  36  #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  37  #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  38  #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13 @39  #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  40  #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  41  #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  42  #define __cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  43  #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  44  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

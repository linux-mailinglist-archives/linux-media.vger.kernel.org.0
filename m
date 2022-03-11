Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCFAD4D6834
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 18:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243113AbiCKSAs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 13:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239458AbiCKSAs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 13:00:48 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6AD9154D27
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 09:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647021584; x=1678557584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=k7e2g/eNySvoazSg+XH+0bqDjbRKCveB0kCgSux2C6Q=;
  b=N8uonHOZlstzhQ0D6/vy+7VMxsNOTIV/Jea7BMkzHlMIZAzMfajCPaYk
   1RuAphmAWT/jRIAkcB6Q1KyRcNkLh++yZWKrAA0Pm8ReLoKUR+JNf3xhR
   TOW/KfZ8PWFwI7eo6ItwUaQiHH48y/T8lOqPZqylQNed3TgPacnijC73o
   F5G1yqvOA/7GtetXBCoahACYv4xNA46/wCEBgW8rKnq0Ca75FJ8bnesgI
   +wp050ixnXBvKMYoHez931X4jmW4a3S7Wm0A/G/avXc8ARdIcaKS4nH1X
   FSkWrEVuqsQ0Re6RFcUycxMovsVQOYstoLxhfhzW4RKJKCY4jk6Jwxa16
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="237794062"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="237794062"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 09:59:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="633488411"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Mar 2022 09:59:41 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nSjYC-0006tr-Fo; Fri, 11 Mar 2022 17:59:40 +0000
Date:   Sat, 12 Mar 2022 01:59:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>, sumit.semwal@linaro.org,
        gustavo@padovan.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 2/2] dma-buf/sync-file: fix warning about fence containers
Message-ID: <202203120115.Qe4GABIV-lkp@intel.com>
References: <20220311110244.1245-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220311110244.1245-2-christian.koenig@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi "Christian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc7 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christian-K-nig/dma-buf-add-dma_fence_unwrap/20220311-190352
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 79b00034e9dcd2b065c1665c8b42f62b6b80a9be
config: arm64-randconfig-r014-20220310 (https://download.01.org/0day-ci/archive/20220312/202203120115.Qe4GABIV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/ca3584ac05c4a450e69b1c6bcb0672b5ab026c7c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christian-K-nig/dma-buf-add-dma_fence_unwrap/20220311-190352
        git checkout ca3584ac05c4a450e69b1c6bcb0672b5ab026c7c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/dma-buf/sync_file.c:8:
   include/linux/dma-fence-unwrap.h:44:18: error: implicit declaration of function 'dma_fence_chain_contained' [-Werror,-Wimplicit-function-declaration]
           cursor->array = dma_fence_chain_contained(cursor->chain);
                           ^
   include/linux/dma-fence-unwrap.h:44:18: note: did you mean 'dma_fence_chain_init'?
   include/linux/dma-fence-chain.h:108:6: note: 'dma_fence_chain_init' declared here
   void dma_fence_chain_init(struct dma_fence_chain *chain,
        ^
   In file included from drivers/dma-buf/sync_file.c:8:
>> include/linux/dma-fence-unwrap.h:44:16: warning: incompatible integer to pointer conversion assigning to 'struct dma_fence *' from 'int' [-Wint-conversion]
           cursor->array = dma_fence_chain_contained(cursor->chain);
                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-fence-unwrap.h:46:9: error: implicit declaration of function 'dma_fence_array_first' [-Werror,-Wimplicit-function-declaration]
           return dma_fence_array_first(cursor->array);
                  ^
   include/linux/dma-fence-unwrap.h:46:9: note: did you mean 'dma_fence_array_create'?
   include/linux/dma-fence-array.h:77:25: note: 'dma_fence_array_create' declared here
   struct dma_fence_array *dma_fence_array_create(int num_fences,
                           ^
   In file included from drivers/dma-buf/sync_file.c:8:
>> include/linux/dma-fence-unwrap.h:46:9: warning: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct dma_fence *' [-Wint-conversion]
           return dma_fence_array_first(cursor->array);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-fence-unwrap.h:77:8: error: implicit declaration of function 'dma_fence_array_next' [-Werror,-Wimplicit-function-declaration]
           tmp = dma_fence_array_next(cursor->array, cursor->index);
                 ^
   include/linux/dma-fence-unwrap.h:77:6: warning: incompatible integer to pointer conversion assigning to 'struct dma_fence *' from 'int' [-Wint-conversion]
           tmp = dma_fence_array_next(cursor->array, cursor->index);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings and 3 errors generated.


vim +44 include/linux/dma-fence-unwrap.h

088aa14c0f5cad Christian König 2022-03-11  33  
088aa14c0f5cad Christian König 2022-03-11  34  /**
088aa14c0f5cad Christian König 2022-03-11  35   * dma_fence_unwrap_array - helper to unwrap dma_fence_arrays
088aa14c0f5cad Christian König 2022-03-11  36   * @cursor: cursor to initialize
088aa14c0f5cad Christian König 2022-03-11  37   *
088aa14c0f5cad Christian König 2022-03-11  38   * Helper function to unwrap dma_fence_array containers, don't touch directly.
088aa14c0f5cad Christian König 2022-03-11  39   * Use dma_fence_unwrap_first/next instead.
088aa14c0f5cad Christian König 2022-03-11  40   */
088aa14c0f5cad Christian König 2022-03-11  41  static inline struct dma_fence *
088aa14c0f5cad Christian König 2022-03-11  42  dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
088aa14c0f5cad Christian König 2022-03-11  43  {
088aa14c0f5cad Christian König 2022-03-11 @44  	cursor->array = dma_fence_chain_contained(cursor->chain);
088aa14c0f5cad Christian König 2022-03-11  45  	cursor->index = 0;
088aa14c0f5cad Christian König 2022-03-11 @46  	return dma_fence_array_first(cursor->array);
088aa14c0f5cad Christian König 2022-03-11  47  }
088aa14c0f5cad Christian König 2022-03-11  48  

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

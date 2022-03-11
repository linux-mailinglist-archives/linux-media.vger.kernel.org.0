Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 628274D679F
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 18:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350776AbiCKRar (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 12:30:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350770AbiCKRaq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 12:30:46 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19271D529A
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 09:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647019781; x=1678555781;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=icNk0QqUK4xYwGy7RzSXOYunnwxl8oLQQKUMhnVt744=;
  b=fvC0rRN6h/4U051zzbbmph59x/YNC7SXpyMUHiFA0Zz9p6bCb/Dr8O+b
   CFfL8QHp3ltHkNFS8JHdlNnpk69nbZQdG0Se3yJW0WPKALIJA0NuRFXuF
   HRBhISP7QtHmH9kSBO25tJ6aSEto5BO3sffPJlnoau4xxhUcv/24fP1kg
   3UoNybWywhWWcKc2VQkE041xUr5xQF32mav1df9mrPgzTZswuwiztRJwv
   ihOl5LIB/AMoDqFpUCLV1rpPjzg3lG++nIoHjBRgY88hlBl3+W0nUJ/Dk
   g4aJFmT/4FXr/N85KjcJsfJnOv5FeJWOaa4aoPe4P7ilvwUym8/ZN/O8o
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="253178615"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="253178615"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 09:29:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="689120408"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2022 09:29:39 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nSj58-0006rD-NW; Fri, 11 Mar 2022 17:29:38 +0000
Date:   Sat, 12 Mar 2022 01:28:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>, sumit.semwal@linaro.org,
        gustavo@padovan.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Message-ID: <202203120114.jpyQmShC-lkp@intel.com>
References: <20220311110244.1245-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311110244.1245-1-christian.koenig@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
config: hexagon-randconfig-r045-20220310 (https://download.01.org/0day-ci/archive/20220312/202203120114.jpyQmShC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/088aa14c0f5cad378854823fa661ee145dd2c01b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christian-K-nig/dma-buf-add-dma_fence_unwrap/20220311-190352
        git checkout 088aa14c0f5cad378854823fa661ee145dd2c01b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/dma-buf/st-dma-fence-unwrap.c:7:
   include/linux/dma-fence-unwrap.h:44:18: error: implicit declaration of function 'dma_fence_chain_contained' [-Werror,-Wimplicit-function-declaration]
           cursor->array = dma_fence_chain_contained(cursor->chain);
                           ^
   include/linux/dma-fence-unwrap.h:44:18: note: did you mean 'dma_fence_chain_init'?
   include/linux/dma-fence-chain.h:108:6: note: 'dma_fence_chain_init' declared here
   void dma_fence_chain_init(struct dma_fence_chain *chain,
        ^
   In file included from drivers/dma-buf/st-dma-fence-unwrap.c:7:
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
   In file included from drivers/dma-buf/st-dma-fence-unwrap.c:7:
>> include/linux/dma-fence-unwrap.h:46:9: warning: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct dma_fence *' [-Wint-conversion]
           return dma_fence_array_first(cursor->array);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-fence-unwrap.h:77:8: error: implicit declaration of function 'dma_fence_array_next' [-Werror,-Wimplicit-function-declaration]
           tmp = dma_fence_array_next(cursor->array, cursor->index);
                 ^
   include/linux/dma-fence-unwrap.h:77:6: warning: incompatible integer to pointer conversion assigning to 'struct dma_fence *' from 'int' [-Wint-conversion]
           tmp = dma_fence_array_next(cursor->array, cursor->index);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dma-buf/st-dma-fence-unwrap.c:133:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
           int err = 0;
               ^
   drivers/dma-buf/st-dma-fence-unwrap.c:175:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
           int err = 0;
               ^
   drivers/dma-buf/st-dma-fence-unwrap.c:217:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
           int err = 0;
               ^
   6 warnings and 3 errors generated.


vim +44 include/linux/dma-fence-unwrap.h

    33	
    34	/**
    35	 * dma_fence_unwrap_array - helper to unwrap dma_fence_arrays
    36	 * @cursor: cursor to initialize
    37	 *
    38	 * Helper function to unwrap dma_fence_array containers, don't touch directly.
    39	 * Use dma_fence_unwrap_first/next instead.
    40	 */
    41	static inline struct dma_fence *
    42	dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
    43	{
  > 44		cursor->array = dma_fence_chain_contained(cursor->chain);
    45		cursor->index = 0;
  > 46		return dma_fence_array_first(cursor->array);
    47	}
    48	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

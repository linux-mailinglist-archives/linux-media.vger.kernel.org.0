Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8780D4D68C6
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 19:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345153AbiCKSyA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 13:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350138AbiCKSx7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 13:53:59 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CAB6F7441
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 10:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647024774; x=1678560774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HPBPOXoL/N182wEXUNP+tY5sANWLFLzGilUZ02/k/WI=;
  b=hfP1trXZEp3P8sCyAyIW/OTyLEI/HlvknFkRY5lvpVf+ypkv9UgZyT2K
   /Lw64slTXlnxErSpiQUzMnsIjLuq08syfBnFuXaQPL1VBAu5cfbtNtQ3Z
   t80NCeno59/a3w38DVKSCqQekAn6fAAZetnVe9BHUGszbKO5TLDpfIMrB
   N62Uo1ZO4ufJRCZsfG7kSJ6p8twltkj8QReOJIiRKyU6EcdcFhQbezLYf
   tsqX+ayMfxJl1hs2rGKqsS8GyX27OZ2ObPAYZkMKxxKHG9dQT36Wdzfr6
   ty+6olrBTqTFkiWHbOEStRS40lQ3SFwpa3pOz6zyXtqepkyb8IwTqIjNO
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="255579502"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="255579502"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 10:52:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="645019154"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 11 Mar 2022 10:52:45 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nSkNZ-0006xC-1h; Fri, 11 Mar 2022 18:52:45 +0000
Date:   Sat, 12 Mar 2022 02:51:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>, sumit.semwal@linaro.org,
        gustavo@padovan.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     kbuild-all@lists.01.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 2/2] dma-buf/sync-file: fix warning about fence containers
Message-ID: <202203120217.BFa438j9-lkp@intel.com>
References: <20220311110244.1245-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220311110244.1245-2-christian.koenig@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi "Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.17-rc7 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christian-K-nig/dma-buf-add-dma_fence_unwrap/20220311-190352
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 79b00034e9dcd2b065c1665c8b42f62b6b80a9be
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20220312/202203120217.BFa438j9-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/ca3584ac05c4a450e69b1c6bcb0672b5ab026c7c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christian-K-nig/dma-buf-add-dma_fence_unwrap/20220311-190352
        git checkout ca3584ac05c4a450e69b1c6bcb0672b5ab026c7c
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/dma-buf/sync_file.c:8:
   include/linux/dma-fence-unwrap.h: In function 'dma_fence_unwrap_array':
>> include/linux/dma-fence-unwrap.h:44:18: error: implicit declaration of function 'dma_fence_chain_contained'; did you mean 'dma_fence_chain_init'? [-Werror=implicit-function-declaration]
      44 |  cursor->array = dma_fence_chain_contained(cursor->chain);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                  dma_fence_chain_init
   include/linux/dma-fence-unwrap.h:44:16: warning: assignment to 'struct dma_fence *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      44 |  cursor->array = dma_fence_chain_contained(cursor->chain);
         |                ^
>> include/linux/dma-fence-unwrap.h:46:9: error: implicit declaration of function 'dma_fence_array_first'; did you mean 'dma_fence_array_create'? [-Werror=implicit-function-declaration]
      46 |  return dma_fence_array_first(cursor->array);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         dma_fence_array_create
   include/linux/dma-fence-unwrap.h:46:9: warning: returning 'int' from a function with return type 'struct dma_fence *' makes pointer from integer without a cast [-Wint-conversion]
      46 |  return dma_fence_array_first(cursor->array);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-fence-unwrap.h: In function 'dma_fence_unwrap_next':
>> include/linux/dma-fence-unwrap.h:77:8: error: implicit declaration of function 'dma_fence_array_next'; did you mean 'dma_fence_unwrap_next'? [-Werror=implicit-function-declaration]
      77 |  tmp = dma_fence_array_next(cursor->array, cursor->index);
         |        ^~~~~~~~~~~~~~~~~~~~
         |        dma_fence_unwrap_next
   include/linux/dma-fence-unwrap.h:77:6: warning: assignment to 'struct dma_fence *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      77 |  tmp = dma_fence_array_next(cursor->array, cursor->index);
         |      ^
   cc1: some warnings being treated as errors


vim +44 include/linux/dma-fence-unwrap.h

088aa14c0f5cad Christian K�nig 2022-03-11  33  
088aa14c0f5cad Christian K�nig 2022-03-11  34  /**
088aa14c0f5cad Christian K�nig 2022-03-11  35   * dma_fence_unwrap_array - helper to unwrap dma_fence_arrays
088aa14c0f5cad Christian K�nig 2022-03-11  36   * @cursor: cursor to initialize
088aa14c0f5cad Christian K�nig 2022-03-11  37   *
088aa14c0f5cad Christian K�nig 2022-03-11  38   * Helper function to unwrap dma_fence_array containers, don't touch directly.
088aa14c0f5cad Christian K�nig 2022-03-11  39   * Use dma_fence_unwrap_first/next instead.
088aa14c0f5cad Christian K�nig 2022-03-11  40   */
088aa14c0f5cad Christian K�nig 2022-03-11  41  static inline struct dma_fence *
088aa14c0f5cad Christian K�nig 2022-03-11  42  dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
088aa14c0f5cad Christian K�nig 2022-03-11  43  {
088aa14c0f5cad Christian K�nig 2022-03-11 @44  	cursor->array = dma_fence_chain_contained(cursor->chain);
088aa14c0f5cad Christian K�nig 2022-03-11  45  	cursor->index = 0;
088aa14c0f5cad Christian K�nig 2022-03-11 @46  	return dma_fence_array_first(cursor->array);
088aa14c0f5cad Christian K�nig 2022-03-11  47  }
088aa14c0f5cad Christian K�nig 2022-03-11  48  
088aa14c0f5cad Christian K�nig 2022-03-11  49  /**
088aa14c0f5cad Christian K�nig 2022-03-11  50   * dma_fence_unwrap_first - return the first fence from fence containers
088aa14c0f5cad Christian K�nig 2022-03-11  51   * @head: the entrypoint into the containers
088aa14c0f5cad Christian K�nig 2022-03-11  52   * @cursor: current position inside the containers
088aa14c0f5cad Christian K�nig 2022-03-11  53   *
088aa14c0f5cad Christian K�nig 2022-03-11  54   * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
088aa14c0f5cad Christian K�nig 2022-03-11  55   * first fence.
088aa14c0f5cad Christian K�nig 2022-03-11  56   */
088aa14c0f5cad Christian K�nig 2022-03-11  57  static inline struct dma_fence *
088aa14c0f5cad Christian K�nig 2022-03-11  58  dma_fence_unwrap_first(struct dma_fence *head, struct dma_fence_unwrap *cursor)
088aa14c0f5cad Christian K�nig 2022-03-11  59  {
088aa14c0f5cad Christian K�nig 2022-03-11  60  	cursor->chain = dma_fence_get(head);
088aa14c0f5cad Christian K�nig 2022-03-11  61  	return dma_fence_unwrap_array(cursor);
088aa14c0f5cad Christian K�nig 2022-03-11  62  }
088aa14c0f5cad Christian K�nig 2022-03-11  63  
088aa14c0f5cad Christian K�nig 2022-03-11  64  /**
088aa14c0f5cad Christian K�nig 2022-03-11  65   * dma_fence_unwrap_next - return the next fence from a fence containers
088aa14c0f5cad Christian K�nig 2022-03-11  66   * @cursor: current position inside the containers
088aa14c0f5cad Christian K�nig 2022-03-11  67   *
088aa14c0f5cad Christian K�nig 2022-03-11  68   * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
088aa14c0f5cad Christian K�nig 2022-03-11  69   * the next fence from them.
088aa14c0f5cad Christian K�nig 2022-03-11  70   */
088aa14c0f5cad Christian K�nig 2022-03-11  71  static inline struct dma_fence *
088aa14c0f5cad Christian K�nig 2022-03-11  72  dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
088aa14c0f5cad Christian K�nig 2022-03-11  73  {
088aa14c0f5cad Christian K�nig 2022-03-11  74  	struct dma_fence *tmp;
088aa14c0f5cad Christian K�nig 2022-03-11  75  
088aa14c0f5cad Christian K�nig 2022-03-11  76  	++cursor->index;
088aa14c0f5cad Christian K�nig 2022-03-11 @77  	tmp = dma_fence_array_next(cursor->array, cursor->index);
088aa14c0f5cad Christian K�nig 2022-03-11  78  	if (tmp)
088aa14c0f5cad Christian K�nig 2022-03-11  79  		return tmp;
088aa14c0f5cad Christian K�nig 2022-03-11  80  
088aa14c0f5cad Christian K�nig 2022-03-11  81  	cursor->chain = dma_fence_chain_walk(cursor->chain);
088aa14c0f5cad Christian K�nig 2022-03-11  82  	return dma_fence_unwrap_array(cursor);
088aa14c0f5cad Christian K�nig 2022-03-11  83  }
088aa14c0f5cad Christian K�nig 2022-03-11  84  

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

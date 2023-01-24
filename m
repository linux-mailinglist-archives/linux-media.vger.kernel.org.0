Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E64678F13
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 04:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbjAXDoq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 22:44:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbjAXDop (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 22:44:45 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3D71B55F
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 19:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674531884; x=1706067884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=llzNk44ai2kUw+bb6PggWcQopKhOjJdBfAbzDb2u3TY=;
  b=NGmbaCHH1bo1YHsZsB1YGJCqLrib9clogbtw0KV+PFZSQyDQezHNloxH
   4eSCHH4ug3bqESe6+1MlO/NbNRUeDq+1xCVD53ozmC4QH77fg0RXpVLGq
   1pWH+2fuhfsWz7buajdm54lC4AgRWd9PUQiiiamY6vHybdG32PIFC6MXq
   xdHNzL2Z40Tnuf4CTmRVGEyj+S4Y7AFgsL5IHF/R7TYuPDa1RGGbRzSa9
   +6RuB29saUV2xqxy8+d4hRjYZzZ1NKw2QHt/ttVK+loxGg0uguRVHtK/8
   Y3ljLlZ9NjHJtm1+0gx3htSy0DWdpyG8Fn3vePrs0oqu+S10Oy3rfE1za
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="306577696"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="306577696"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 19:44:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655280246"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="655280246"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 19:44:37 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKAEe-00066K-2B;
        Tue, 24 Jan 2023 03:44:36 +0000
Date:   Tue, 24 Jan 2023 11:44:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>, l.stach@pengutronix.de,
        nicolas@ndufresne.ca, ppaalanen@gmail.com, sumit.semwal@linaro.org,
        daniel@ffwll.ch, robdclark@gmail.com, tfiga@chromium.org,
        sebastian.wick@redhat.com, hverkuil@xs4all.nl,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
        lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
        jstultz@google.com, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org
Cc:     oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] media: uvcvideo: expose dma-heap hint to userspace
Message-ID: <202301241137.qT2rnQ5T-lkp@intel.com>
References: <20230123123756.401692-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230123123756.401692-3-christian.koenig@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on media-tree/master drm-tip/drm-tip linus/master v6.2-rc5]
[cannot apply to next-20230123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/media-uvcvideo-expose-dma-heap-hint-to-userspace/20230123-213836
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230123123756.401692-3-christian.koenig%40amd.com
patch subject: [PATCH 2/2] media: uvcvideo: expose dma-heap hint to userspace
config: i386-randconfig-a002-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241137.qT2rnQ5T-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/adc04dccd892eec7f84c6ec112b48df376172e48
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-K-nig/media-uvcvideo-expose-dma-heap-hint-to-userspace/20230123-213836
        git checkout adc04dccd892eec7f84c6ec112b48df376172e48
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/usb/uvc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/media/usb/uvc/uvc_driver.c:10:
>> include/linux/dma-heap.h:92:5: warning: no previous prototype for 'dma_heap_create_device_link' [-Wmissing-prototypes]
      92 | int dma_heap_create_device_link(struct device *dev, const char *heap)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/dma-heap.h:97:6: warning: no previous prototype for 'dma_heap_remove_device_link' [-Wmissing-prototypes]
      97 | void dma_heap_remove_device_link(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/dma_heap_create_device_link +92 include/linux/dma-heap.h

4ce5c5c0cf31f4 Christian König 2023-01-23   91  
4ce5c5c0cf31f4 Christian König 2023-01-23  @92  int dma_heap_create_device_link(struct device *dev, const char *heap)
4ce5c5c0cf31f4 Christian König 2023-01-23   93  {
4ce5c5c0cf31f4 Christian König 2023-01-23   94  	return 0;
4ce5c5c0cf31f4 Christian König 2023-01-23   95  }
4ce5c5c0cf31f4 Christian König 2023-01-23   96  
4ce5c5c0cf31f4 Christian König 2023-01-23  @97  void dma_heap_remove_device_link(struct device *dev)
4ce5c5c0cf31f4 Christian König 2023-01-23   98  {
4ce5c5c0cf31f4 Christian König 2023-01-23   99  }
4ce5c5c0cf31f4 Christian König 2023-01-23  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

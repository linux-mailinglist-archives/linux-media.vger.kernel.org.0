Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5057A017D
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 12:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238074AbjINKTI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 06:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238067AbjINKTH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 06:19:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B7C1BE8;
        Thu, 14 Sep 2023 03:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694686744; x=1726222744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O1LLvMPKGNc5ZFEUOpVx7SNJUHBbUo3ACKo6XHAjDn8=;
  b=SZ/IwTk/JBtcrbnUWIewn+srlKHoTrayar6iVcO7lMtfmSDT//8bm0Em
   VUeDuWO9tN+xsF1aO3GXL1tBhkcO1ukq5PIoY+H+4VJvDDECvaDO0iqnB
   QV3p6I0RNDzOzMcUKvbsXovf0uJR3QOZCbsG9BFJ7z/44TUb1bw2GQEIG
   ElKlBJWnCwDZXXSCwjT5whp2266t6Po98FP8ujYOOoYdG+trCgYrIQBE4
   OidZkxRO1gtW8FylSp0FK+TG/CPbMfj/hZN2J2BGIMImPij9VCI6pN1gp
   rMXaqgVZMLMZ3ke4yp/wJl6JTodUC7nZj7e6R/dBa0GWUGjw6fO0+0Nc2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363949201"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="363949201"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 03:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773840738"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="773840738"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Sep 2023 03:18:44 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qgjQo-0001Tp-0F;
        Thu, 14 Sep 2023 10:18:42 +0000
Date:   Thu, 14 Sep 2023 18:18:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        christian.koenig@amd.com, Matthias Brugger <matthias.bgg@gmail.com>
Cc:     oe-kbuild-all@lists.linux.dev, Anan Sun <anan.sun@mediatek.com>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        jianjiao.zeng@mediatek.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tjmercier@google.com,
        linaro-mm-sig@lists.linaro.org, John Stultz <jstultz@google.com>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
        Yong Wu <yong.wu@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 6/9] dma-buf: heaps: mtk_sec_heap: Add tee service call
 for buffer allocating/freeing
Message-ID: <202309141707.zdT0yuMT-lkp@intel.com>
References: <20230911023038.30649-7-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911023038.30649-7-yong.wu@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yong,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on robh/for-next linus/master v6.6-rc1 next-20230914]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yong-Wu/dma-buf-heaps-Deduplicate-docs-and-adopt-common-format/20230911-103308
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230911023038.30649-7-yong.wu%40mediatek.com
patch subject: [PATCH 6/9] dma-buf: heaps: mtk_sec_heap: Add tee service call for buffer allocating/freeing
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230914/202309141707.zdT0yuMT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141707.zdT0yuMT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141707.zdT0yuMT-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `mtk_kree_secure_session_init':
   mtk_secure_heap.c:(.text+0x130): undefined reference to `tee_client_open_context'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `.L10':
   mtk_secure_heap.c:(.text+0x19c): undefined reference to `tee_client_open_session'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `.L12':
   mtk_secure_heap.c:(.text+0x1dc): undefined reference to `tee_client_close_context'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `mtk_sec_mem_tee_service_call.constprop.0':
>> mtk_secure_heap.c:(.text+0x274): undefined reference to `tee_client_invoke_func'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `mtk_sec_mem_release.isra.0':
   mtk_secure_heap.c:(.text+0x464): undefined reference to `tee_client_invoke_func'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

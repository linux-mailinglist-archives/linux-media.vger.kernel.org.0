Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A717079E970
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 15:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240989AbjIMNgA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 09:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239451AbjIMNf7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 09:35:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5878E19B9;
        Wed, 13 Sep 2023 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694612155; x=1726148155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pj/V2UP2unub0wz1wILtsfcstjsxnGVCuZljE+FR6is=;
  b=hwFMlmw/Vpz1TIdSWWVzkDj2SrdocYj2Mc8TkpyDn6Gby0/vZf6IchS5
   Z8RgMCbQbbQGkPWGTfFNY9tUtrr18IT+tXtCmGsT/GsX9tcNP+0tKX6fe
   sxlamtAzS1LaG48cj/hRNoBYK1Y9vKn2qmOcHYUREMYxs3myo8Aduq4uh
   TnPa+GypGZYMGSneFHau27qyrSQ1tLAV3WJIkU+wjc6HuehIcLa1YsuK+
   1CrWblBZw8f76eo9GHhV6NBnTgkh/ZcTJad8/AE6USNWKgmuwTPNn6LEY
   UpWjT1DA21mEPwrz+cxmth9qJcGY7wh7EI+SpbaD4+yxySAKpk5tcLT+y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="375993253"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="375993253"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 06:35:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="859269609"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="859269609"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Sep 2023 06:35:50 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qgQ1z-00006X-2b;
        Wed, 13 Sep 2023 13:35:47 +0000
Date:   Wed, 13 Sep 2023 21:35:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        christian.koenig@amd.com, Matthias Brugger <matthias.bgg@gmail.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>, tjmercier@google.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Yong Wu <yong.wu@mediatek.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, jianjiao.zeng@mediatek.com,
        kuohong.wang@mediatek.com
Subject: Re: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
Message-ID: <202309132148.UABRshAB-lkp@intel.com>
References: <20230911023038.30649-6-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911023038.30649-6-yong.wu@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yong,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on robh/for-next linus/master v6.6-rc1 next-20230912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yong-Wu/dma-buf-heaps-Deduplicate-docs-and-adopt-common-format/20230911-103308
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230911023038.30649-6-yong.wu%40mediatek.com
patch subject: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230913/202309132148.UABRshAB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309132148.UABRshAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309132148.UABRshAB-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `mtk_kree_secure_session_init':
>> mtk_secure_heap.c:(.text+0x130): undefined reference to `tee_client_open_context'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `.L10':
>> mtk_secure_heap.c:(.text+0x19c): undefined reference to `tee_client_open_session'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `.L12':
>> mtk_secure_heap.c:(.text+0x1dc): undefined reference to `tee_client_close_context'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

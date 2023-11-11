Return-Path: <linux-media+bounces-119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A50A7E8D8B
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 00:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84D7CB20AAD
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 23:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D7E1DDDE;
	Sat, 11 Nov 2023 23:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJTYGytq"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AD61DDCC;
	Sat, 11 Nov 2023 23:28:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C43B30C5;
	Sat, 11 Nov 2023 15:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699745303; x=1731281303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yLMN9BN0x0GJyChe1fur9BIfuNV27m8XBnDpqqzLe8E=;
  b=VJTYGytqfXGww5m4474Duuj1AOEH13Ef2BQ34cgTvkOAkc5Ru9ceV5PW
   KBOa9ZQ10CmPvFO/35CFcD2nv85ZnUkYTkP4IAia8M/Qa20zrmEk9Rpsm
   +W2+OOP0Ok1eufhMGYnHUNx1uzl6/duRlWs+gAuGHjhDjKlIZyB8L46B1
   JRDxcx5LmAwnHBXsCSicwUtIhRGr4g/0LhYYG93FwVU6F1p8WJMbXz3Tq
   ittUlVkkb1QyGn68/4xeq+2BoXRuYOi793h/6JfFoWt9GYHoQQz6EVcrq
   0eUUUW8D8ONGLM8R3IFQ4CemNh+CVjHe1ClNGp6ZOcURF6Ob7fRJ0vYNj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="3316457"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="3316457"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 15:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="764026399"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="764026399"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Nov 2023 15:28:15 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1xOf-000AoU-1f;
	Sat, 11 Nov 2023 23:28:13 +0000
Date: Sun, 12 Nov 2023 07:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	John Stultz <jstultz@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jeffrey Kardatzke <jkardatzke@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Vijayanand Jitta <quic_vjitta@quicinc.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Yong Wu <yong.wu@mediatek.com>, jianjiao.zeng@mediatek.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
	linux-mediatek@lists.infradead.org,
	Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] dma-buf: heaps: secure_heap: Add tee memory
 service call
Message-ID: <202311120707.FDrzrRME-lkp@intel.com>
References: <20231111111559.8218-5-yong.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231111111559.8218-5-yong.wu@mediatek.com>

Hi Yong,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on robh/for-next drm-tip/drm-tip linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yong-Wu/dma-buf-heaps-Initialize-a-secure-heap/20231111-192115
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231111111559.8218-5-yong.wu%40mediatek.com
patch subject: [PATCH v2 4/8] dma-buf: heaps: secure_heap: Add tee memory service call
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231112/202311120707.FDrzrRME-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120707.FDrzrRME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120707.FDrzrRME-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `tee_client_open_session'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/dma-buf/heaps/secure_heap.o: in function `secure_heap_tee_session_init':
   secure_heap.c:(.text.secure_heap_tee_session_init+0xd0): undefined reference to `tee_client_open_context'
   powerpc64-linux-ld: secure_heap.c:(.text.secure_heap_tee_session_init+0x2b4): undefined reference to `tee_client_open_session'
   powerpc64-linux-ld: secure_heap.c:(.text.secure_heap_tee_session_init+0x458): undefined reference to `tee_client_close_context'
   powerpc64-linux-ld: drivers/dma-buf/heaps/secure_heap.o: in function `secure_heap_tee_service_call.constprop.0':
>> secure_heap.c:(.text.secure_heap_tee_service_call.constprop.0+0xbc): undefined reference to `tee_client_invoke_func'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


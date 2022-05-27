Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79C415357D3
	for <lists+linux-media@lfdr.de>; Fri, 27 May 2022 04:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236417AbiE0CjC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 May 2022 22:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236374AbiE0CjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 May 2022 22:39:00 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C4EE52AB
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 19:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653619139; x=1685155139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9btj2t8Ai0XAQfVLl3idqQi7EnvGruQK2QwkrzBc3Xc=;
  b=JFd4yBduLpb836AGWUQ4F6F4TAOWNkv/BIB0IblP+Y+S0BlHd1xCGWs4
   yI933xOeKJXZpq1Kv78XOjk+hsOY+eqIZ9kRfJUMkbyV004AZ4OxqzjZq
   Wc+PuPQmFHGb0ajcrOvOB335kgP1/7XOwpPhW88BA+B85WRC5UvdKgMwv
   2oTbg26ms0Yor5WKQu+dahBolAi3ktACUUiFiRQMdK+XG40yYThLQQK9k
   w62AEb57SfGI0Ay0TMJ51/LqgHIvIVRFF3bQIy3OpVxFxAZhZWjUE4302
   8cIsHRqTsBDYpaHr8Nw61pFaG4AVGRght/2XBcRCRFGVLbH9RzlPIQkBR
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="337405820"
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; 
   d="scan'208";a="337405820"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2022 19:38:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; 
   d="scan'208";a="610026464"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 May 2022 19:38:51 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nuPsI-0004L2-Gf;
        Fri, 27 May 2022 02:38:50 +0000
Date:   Fri, 27 May 2022 10:37:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Gert Wollny <gert.wollny@collabora.com>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Daniel Stone <daniel@fooishbar.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Rob Clark <robdclark@gmail.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Qiang Yu <yuq825@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v6 14/22] dma-buf: Introduce new locking convention
Message-ID: <202205271042.1WRbRP1r-lkp@intel.com>
References: <20220526235040.678984-15-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526235040.678984-15-dmitry.osipenko@collabora.com>
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to drm/drm-next media-tree/master drm-intel/for-linux-next v5.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/Add-generic-memory-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220527-075717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git cdeffe87f790dfd1baa193020411ce9a538446d7
config: hexagon-randconfig-r045-20220524 (https://download.01.org/0day-ci/archive/20220527/202205271042.1WRbRP1r-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6f4644d194da594562027a5d458d9fb7a20ebc39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/97f090c47ec995a8cf3bced98526ee3eaa25f10f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Osipenko/Add-generic-memory-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220527-075717
        git checkout 97f090c47ec995a8cf3bced98526ee3eaa25f10f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:1339:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   return ret;
                          ^~~
   drivers/dma-buf/dma-buf.c:1331:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +/ret +1339 drivers/dma-buf/dma-buf.c

  1327	
  1328	static int dma_buf_vmap_locked(struct dma_buf *dmabuf, struct iosys_map *map)
  1329	{
  1330		struct iosys_map ptr;
  1331		int ret;
  1332	
  1333		dma_resv_assert_held(dmabuf->resv);
  1334	
  1335		if (dmabuf->vmapping_counter) {
  1336			dmabuf->vmapping_counter++;
  1337			BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
  1338			*map = dmabuf->vmap_ptr;
> 1339			return ret;
  1340		}
  1341	
  1342		BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
  1343	
  1344		ret = dmabuf->ops->vmap(dmabuf, &ptr);
  1345		if (WARN_ON_ONCE(ret))
  1346			return ret;
  1347	
  1348		dmabuf->vmap_ptr = ptr;
  1349		dmabuf->vmapping_counter = 1;
  1350	
  1351		*map = dmabuf->vmap_ptr;
  1352	
  1353		return 0;
  1354	}
  1355	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

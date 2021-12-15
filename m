Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE3C4759AB
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 14:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237408AbhLONbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 08:31:06 -0500
Received: from mga07.intel.com ([134.134.136.100]:20443 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234443AbhLONbF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 08:31:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639575065; x=1671111065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k866ifHnZPwQQfxaHvaMlY4Jgk6Yu0xwg2XFEW7LZyw=;
  b=XsVq3m0AU5+IJIlb/lSBWq+KxPmUDgxMRSpk2evJoN6MN+UJ6k5hZLBc
   yyuaxC1SQ8kUyYXBB+7bY9sTM8rmcC2BcE6Z2SFY6NYmjMAI13FjcHCwu
   s34MnqYPxney14ulQ/FaO7KybTbBpPOteJLs+P3yH/XefmTmdS1V8dWtu
   QEBLP4xs+vva1ZB3JX7c2I6DpG/ZOrW8n6TPXWL+J7TgV/MqNZ6M2t8Gm
   IxRqyQyNQojNLIUAdYPSS3O2u6nlKTgLnuV/YqDFQqKCRY4bbgZZ9KKWh
   pOCdxDNOjCU8c3Ty3FFUFhp4AxTN0ncf5kNvV7yLbjvt1zQYB7x1ThtPC
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="302599464"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="302599464"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 05:31:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="482389228"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Dec 2021 05:31:02 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mxUN3-0001pa-UZ; Wed, 15 Dec 2021 13:31:01 +0000
Date:   Wed, 15 Dec 2021 21:30:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     kbuild-all@lists.01.org, amd-gfx@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        Monk Liu <Monk.Liu@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v3] drm/amdgpu: introduce new amdgpu_fence object to
 indicate the job embedded fence
Message-ID: <202112152115.sqAqnvG7-lkp@intel.com>
References: <20211215063551.2810601-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215063551.2810601-1-ray.huang@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Huang,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip v5.16-rc5 next-20211214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Huang-Rui/drm-amdgpu-introduce-new-amdgpu_fence-object-to-indicate-the-job-embedded-fence/20211215-143731
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20211215/202112152115.sqAqnvG7-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/a47becf231b123760625c45242e89f5e5b5b4915
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Huang-Rui/drm-amdgpu-introduce-new-amdgpu_fence-object-to-indicate-the-job-embedded-fence/20211215-143731
        git checkout a47becf231b123760625c45242e89f5e5b5b4915
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:631: warning: expecting prototype for amdgpu_fence_clear_job_fences(). Prototype was for amdgpu_fence_driver_clear_job_fences() instead


vim +631 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c

   623	
   624	/**
   625	 * amdgpu_fence_clear_job_fences - clear job embedded fences of ring
   626	 *
   627	 * @ring: fence of the ring to be cleared
   628	 *
   629	 */
   630	void amdgpu_fence_driver_clear_job_fences(struct amdgpu_ring *ring)
 > 631	{
   632		int i;
   633		struct dma_fence *old, **ptr;
   634	
   635		for (i = 0; i <= ring->fence_drv.num_fences_mask; i++) {
   636			ptr = &ring->fence_drv.fences[i];
   637			old = rcu_dereference_protected(*ptr, 1);
   638			if (old && old->ops == &amdgpu_job_fence_ops)
   639				RCU_INIT_POINTER(*ptr, NULL);
   640		}
   641	}
   642	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

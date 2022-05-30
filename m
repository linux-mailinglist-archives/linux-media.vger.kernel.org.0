Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A539537C47
	for <lists+linux-media@lfdr.de>; Mon, 30 May 2022 15:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236298AbiE3NbL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 May 2022 09:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237354AbiE3NaX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 May 2022 09:30:23 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B9828BD19
        for <linux-media@vger.kernel.org>; Mon, 30 May 2022 06:27:12 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dmitry.osipenko)
        with ESMTPSA id 6AB921F41C09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1653917230;
        bh=1Pi7dEoZ0pAA1m9BojUV8qIcFRS0/TZau3kDTBpqkcE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JUuwe1ITApxeAApFN7LfnPQ3+xgNi4oasTkD25Cy4scubjbogcCZAZVD53gWR2Ea7
         BPI7npTFBlKlTg095blVuNJyEXdQDxAUefuiLXnqEt7PNqo1cM4WGytj6OFxJsxmNx
         Z0UlPTSqI+vcFKdZpp/5AvfBsRpV7xHIUB2/kN5LyAzQyrUCvYn8YVHQvrGSyEeVme
         kB3hACHu2CenwkFyYntNLS/BS4uM5qUKupj/suLuvIHyyTQ237fSZw6lJgfTAw4hX0
         /064XT+eA/oI9E1a5Q5m1Fvjk0rXJ42+bXYfW/OoA/TJsoqJfi/NDpN5kDh8YNq9+n
         kfNLPrzdmKQMQ==
Message-ID: <de487670-238b-5cb3-f779-35aa3014e63c@collabora.com>
Date:   Mon, 30 May 2022 16:27:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [kbuild] Re: [PATCH v6 17/22] drm/shmem-helper: Add generic
 memory shrinker
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
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
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     lkp@intel.com, kbuild-all@lists.01.org, linux-media@vger.kernel.org
References: <202205272155.MxDiru43-lkp@intel.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <202205272155.MxDiru43-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/30/22 10:09, Dan Carpenter wrote:
> Hi Dmitry,
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/Add-generic-memory-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220527-075717 
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git  cdeffe87f790dfd1baa193020411ce9a538446d7
> config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220527/202205272155.MxDiru43-lkp@intel.com/config )
> compiler: gcc-11 (Debian 11.3.0-1) 11.3.0
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> New smatch warnings:
> drivers/gpu/drm/drm_gem_shmem_helper.c:226 drm_gem_shmem_set_evictable() warn: inconsistent returns 'shmem->base.resv'.
> drivers/gpu/drm/drm_gem_shmem_helper.c:253 drm_gem_shmem_set_purgeable() warn: inconsistent returns 'shmem->base.resv'.
> drivers/gpu/drm/drm_gem_shmem_helper.c:703 drm_gem_shmem_fault() error: we previously assumed 'shmem->pages' could be null (see line 694)
> 
> vim +226 drivers/gpu/drm/drm_gem_shmem_helper.c
> 
> 875fd932de880a Dmitry Osipenko 2022-05-27  215  int drm_gem_shmem_set_evictable(struct drm_gem_shmem_object *shmem)
> 875fd932de880a Dmitry Osipenko 2022-05-27  216  {
> 875fd932de880a Dmitry Osipenko 2022-05-27  217  	dma_resv_lock(shmem->base.resv, NULL);
> 875fd932de880a Dmitry Osipenko 2022-05-27  218  
> 875fd932de880a Dmitry Osipenko 2022-05-27  219  	if (shmem->madv < 0)
> 875fd932de880a Dmitry Osipenko 2022-05-27  220  		return -ENOMEM;
> 
> Unlock before returning?
> 
> 875fd932de880a Dmitry Osipenko 2022-05-27  221  
> 875fd932de880a Dmitry Osipenko 2022-05-27  222  	shmem->eviction_enabled = true;
> 875fd932de880a Dmitry Osipenko 2022-05-27  223  
> 875fd932de880a Dmitry Osipenko 2022-05-27  224  	dma_resv_unlock(shmem->base.resv);
> 875fd932de880a Dmitry Osipenko 2022-05-27  225  
> 875fd932de880a Dmitry Osipenko 2022-05-27 @226  	return 0;
> 875fd932de880a Dmitry Osipenko 2022-05-27  227  }
> 875fd932de880a Dmitry Osipenko 2022-05-27  228  EXPORT_SYMBOL_GPL(drm_gem_shmem_set_evictable);
> 875fd932de880a Dmitry Osipenko 2022-05-27  229  
> 875fd932de880a Dmitry Osipenko 2022-05-27  230  /**
> 875fd932de880a Dmitry Osipenko 2022-05-27  231   * drm_gem_shmem_set_purgeable() - Make GEM purgeable by memory shrinker
> 875fd932de880a Dmitry Osipenko 2022-05-27  232   * @shmem: shmem GEM object
> 875fd932de880a Dmitry Osipenko 2022-05-27  233   *
> 875fd932de880a Dmitry Osipenko 2022-05-27  234   * Tell memory shrinker that this GEM can be purged. Initially purging is
> 875fd932de880a Dmitry Osipenko 2022-05-27  235   * disabled for all GEMs. If GEM was purged, then -ENOMEM is returned.
> 875fd932de880a Dmitry Osipenko 2022-05-27  236   *
> 875fd932de880a Dmitry Osipenko 2022-05-27  237   * Returns:
> 875fd932de880a Dmitry Osipenko 2022-05-27  238   * 0 on success or a negative error code on failure.
> 875fd932de880a Dmitry Osipenko 2022-05-27  239   */
> 875fd932de880a Dmitry Osipenko 2022-05-27  240  int drm_gem_shmem_set_purgeable(struct drm_gem_shmem_object *shmem)
> 875fd932de880a Dmitry Osipenko 2022-05-27  241  {
> 875fd932de880a Dmitry Osipenko 2022-05-27  242  	dma_resv_lock(shmem->base.resv, NULL);
> 875fd932de880a Dmitry Osipenko 2022-05-27  243  
> 875fd932de880a Dmitry Osipenko 2022-05-27  244  	if (shmem->madv < 0)
> 875fd932de880a Dmitry Osipenko 2022-05-27  245  		return -ENOMEM;
> 
> Same.

Indeed, thanks!

-- 
Best regards,
Dmitry

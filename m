Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC0D7560CF2
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 01:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiF2XGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 19:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiF2XGK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 19:06:10 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBF11DA7F;
        Wed, 29 Jun 2022 16:06:08 -0700 (PDT)
Received: from [192.168.2.145] (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 97A3B660177B;
        Thu, 30 Jun 2022 00:06:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656543967;
        bh=MHzNXwrpamEQJfSn517DbHauHiLavqph9+6FDdh8cW0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=R3tBCTFOx5La3aI3IuCM416s6ri/Rh+h8/CoISbxHReBFWX7oD8ghFIqxKIheLH5w
         K/nf9MDe20o+qs6uI9V4q7kgllcSj0UFzIr7895NwJrkgQscojZeKpuMoIZ/sXAhJ/
         ByY76oOA2S/Qn7NuU44zmtC8ngpXqT/Sk6mv6EXPgD3t0Yu7tgBa91vpQ3RjptNtcQ
         8wCG1+oVsnGfEAp76m0cvoIjw+tsFZcA1BMMt46ZPsluMUFRdOJVorWacWuPAU7oSR
         BcNWnLcHirxsy7f3PCwGEKwWPOZCORt9oP3UUBVzLpplCao7w54md/Ljni//qJgOjB
         FFn9vf973GUvQ==
Message-ID: <467a1cee-ba8c-98f3-0398-2a7a5a90b5c3@collabora.com>
Date:   Thu, 30 Jun 2022 02:06:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 02/22] drm/gem: Move mapping of imported dma-bufs to
 drm_gem_mmap_obj()
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Cc:     intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        kernel@collabora.com, linux-media@vger.kernel.org,
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
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-3-dmitry.osipenko@collabora.com>
 <b8271f0c-d6a3-4194-1959-e112859756a3@shipmail.org>
 <c0273ac2-c87c-2612-03d4-dc52510b22f7@collabora.com>
 <b4086751-9bff-ea5e-93fc-ce2c513b129b@shipmail.org>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <b4086751-9bff-ea5e-93fc-ce2c513b129b@shipmail.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/29/22 11:43, Thomas Hellström (Intel) wrote:
> 
> On 6/29/22 10:22, Dmitry Osipenko wrote:
>> On 6/29/22 09:40, Thomas Hellström (Intel) wrote:
>>> On 5/27/22 01:50, Dmitry Osipenko wrote:
>>>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
>>>> handle imported dma-bufs properly, which results in mapping of
>>>> something
>>>> else than the imported dma-buf. For example, on NVIDIA Tegra we get a
>>>> hard
>>>> lockup when userspace writes to the memory mapping of a dma-buf that
>>>> was
>>>> imported into Tegra's DRM GEM.
>>>>
>>>> To fix this bug, move mapping of imported dma-bufs to
>>>> drm_gem_mmap_obj().
>>>> Now mmaping of imported dma-bufs works properly for all DRM drivers.
>>> Same comment about Fixes: as in patch 1,
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_gem.c              | 3 +++
>>>>    drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ---------
>>>>    drivers/gpu/drm/tegra/gem.c            | 4 ++++
>>>>    3 files changed, 7 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>> index 86d670c71286..7c0b025508e4 100644
>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>> @@ -1038,6 +1038,9 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj,
>>>> unsigned long obj_size,
>>>>        if (obj_size < vma->vm_end - vma->vm_start)
>>>>            return -EINVAL;
>>>>    +    if (obj->import_attach)
>>>> +        return dma_buf_mmap(obj->dma_buf, vma, 0);
>>> If we start enabling mmaping of imported dma-bufs on a majority of
>>> drivers in this way, how do we ensure that user-space is not blindly
>>> using the object mmap without calling the needed DMA_BUF_IOCTL_SYNC
>>> which is needed before and after cpu access of mmap'ed dma-bufs?
>>>
>>> I was under the impression (admittedly without looking) that the few
>>> drivers that actually called into dma_buf_mmap() had some private
>>> user-mode driver code in place that ensured this happened.
>> Since it's a userspace who does the mapping, then it should be a
>> responsibility of userspace to do all the necessary syncing.
> 
> Sure, but nothing prohibits user-space to ignore the syncing thinking
> "It works anyway", testing those drivers where the syncing is a NOP. And
> when a driver that finally needs syncing is tested it's too late to fix
> all broken user-space.
> 
>>   I'm not
>> sure whether anyone in userspace really needs to map imported dma-bufs
>> in practice. Nevertheless, this use-case is broken and should be fixed
>> by either allowing to do the mapping or prohibiting it.
>>
> Then I'd vote for prohibiting it, at least for now. And for the future
> moving forward we could perhaps revisit the dma-buf need for syncing,
> requiring those drivers that actually need it to implement emulated
> coherent memory which can be done not too inefficiently (vmwgfx being
> one example).

Alright, I'll change it to prohibit the mapping. This indeed should be a
better option.

-- 
Best regards,
Dmitry

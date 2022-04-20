Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85F9B508FDB
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 20:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347114AbiDTS7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 14:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243356AbiDTS73 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 14:59:29 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF5E45ADA
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 11:56:41 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id t11so5354205eju.13
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 11:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rc0pPwaP6/47w0P3YZ39eMLVgRn/8HQa1EN8gwRIGPs=;
        b=cmErzdTGtahwYRQP00Qx8ZhwKKlMefoOYkcL5s+3xGq3JNVsS/YzcT3ZAxRoU+OnB4
         Fvu4mS+ZQeWtA88hbuNOPIUv9KPSuSzmrdD6Jlfnd6b+tSHT2NlftqPlRufBHvi9tMc2
         loSjNnChoqebzllejBYgyAhkRSGLI3PCNbTbGPCjMCKVg4LE2dQPoCVGHM3jECncMctU
         IYggO6Zr8mhmCjUIPHb9H3vbiDHEPEjT/WXKJNUvplY7zVVI7teffHrjweDk2osj+f3P
         XkkBMv24FTjxyGvP7mVVyU9y9/awljahl+gICqSG3mdp1b8uKhkc7YI095oI7p3pldf0
         Evpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rc0pPwaP6/47w0P3YZ39eMLVgRn/8HQa1EN8gwRIGPs=;
        b=EDJ8yUV2buo47I3EZq/g4YO9JMvItyQI5eoP2BGk8rUuXK5loQe2MnmY+RjdIZ4urf
         UzgSMa3d/rCbq4DOhP4OIQFEpK0T76EpKVwlQd/LuBE3vlt9bhNQcbn8cGGCkyeuYtLz
         /w404fAZ4aj3HFo8PDMYuhR5OvQ/FzUJR4pFz9T6q3hb5WZ6NjlAAlQ6tX3RSEGX0ze5
         Ki0zn5SHWwR7xteunoOBkLBECp2Oq9jCseXSoMFC13l4WeHxiyB8i0zG5LktJ2RM2dKn
         0mCKoEuGYt2/gQNkOx9D50LMzdZaF1xy7nfNA21+PCxZ0UMcrs8BJEzzZRd3Rr/+eteJ
         L4yA==
X-Gm-Message-State: AOAM532YOvGrJPCiLWwsa0+UJujpSMEQoTYZqKtJcIWZo3SjlpEWCb6v
        aRNNqYu8bkXGsViwKec4ke4=
X-Google-Smtp-Source: ABdhPJymoss9KS5UEweBNeuSGQfdIi8XFSwbjs/XNcQRdCopeJCWXgyfUb9ZXOzrmQgQ0Um++2aN9Q==
X-Received: by 2002:a17:906:31c2:b0:6e8:6e8b:cbe4 with SMTP id f2-20020a17090631c200b006e86e8bcbe4mr20179080ejf.293.1650481000148;
        Wed, 20 Apr 2022 11:56:40 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:425d:2971:45fa:ac5d? ([2a02:908:1252:fb60:425d:2971:45fa:ac5d])
        by smtp.gmail.com with ESMTPSA id r3-20020aa7d583000000b00420a8b66566sm10414324edq.97.2022.04.20.11.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 11:56:39 -0700 (PDT)
Message-ID: <ac12f900-fb47-37d6-9a1c-ac44bc711069@gmail.com>
Date:   Wed, 20 Apr 2022 20:56:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/15] dma-buf & drm/amdgpu: remove dma_resv workaround
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Zack Rusin <zackr@vmware.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc:     "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-4-christian.koenig@amd.com>
 <60ab53ce1ce1333f5e6a15fc83c3c05cd9bd1084.camel@vmware.com>
 <4c2e9414-3926-c9d7-8482-0d6d9191c2ac@amd.com>
 <fe8916b53b0f0101e6616d23eb6896399b092d58.camel@vmware.com>
 <54d00af9-9384-5794-490c-7d4cafe086b6@gmail.com>
 <e1c60e2a1478c406f515d51608a751fdc9feff3a.camel@vmware.com>
 <baa19a2d-6ad9-63ea-20f4-284a794f8998@amd.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <baa19a2d-6ad9-63ea-20f4-284a794f8998@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 20.04.22 um 20:49 schrieb Christian König:
> Am 20.04.22 um 20:41 schrieb Zack Rusin:
>> On Wed, 2022-04-20 at 19:40 +0200, Christian König wrote:
>>> Am 20.04.22 um 19:38 schrieb Zack Rusin:
>>>> On Wed, 2022-04-20 at 09:37 +0200, Christian König wrote:
>>>>> ⚠ External Email
>>>>>
>>>>> Hi Zack,
>>>>>
>>>>> Am 20.04.22 um 05:56 schrieb Zack Rusin:
>>>>>> On Thu, 2022-04-07 at 10:59 +0200, Christian König wrote:
>>>>>>> Rework the internals of the dma_resv object to allow adding
>>>>>>> more
>>>>>>> than
>>>>>>> one
>>>>>>> write fence and remember for each fence what purpose it had.
>>>>>>>
>>>>>>> This allows removing the workaround from amdgpu which used a
>>>>>>> container
>>>>>>> for
>>>>>>> this instead.
>>>>>>>
>>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>>> Cc: amd-gfx@lists.freedesktop.org
>>>>>> afaict this change broke vmwgfx which now kernel oops right
>>>>>> after
>>>>>> boot.
>>>>>> I haven't had the time to look into it yet, so I'm not sure
>>>>>> what's
>>>>>> the
>>>>>> problem. I'll look at this tomorrow, but just in case you have
>>>>>> some
>>>>>> clues, the backtrace follows:
>>>>> that's a known issue and should already be fixed with:
>>>>>
>>>>> commit d72dcbe9fce505228dae43bef9da8f2b707d1b3d
>>>>> Author: Christian König <christian.koenig@amd.com>
>>>>> Date:   Mon Apr 11 15:21:59 2022 +0200
>>>> Unfortunately that doesn't seem to be it. The backtrace is from the
>>>> current (as of the time of sending of this email) drm-misc-next,
>>>> which
>>>> has this change, so it's something else.
>>> Ok, that's strange. In this case I need to investigate further.
>>>
>>> Maybe VMWGFX is adding more than one fence and we actually need to
>>> reserve multiple slots.
>> This might be helper code issue with CONFIG_DEBUG_MUTEXES set. On 
>> that config
>> dma_resv_reset_max_fences does:
>>     fences->max_fences = fences->num_fences;
>> For some objects num_fences is 0 and so after max_fences and 
>> num_fences are both 0.
>> And then BUG_ON(num_fences >= max_fences) is triggered.
>
> Yeah, but that's expected behavior.
>
> What's not expected is that max_fences is still 0 (or equal to old 
> num_fences) when VMWGFX tries to add a new fence. The function 
> ttm_eu_reserve_buffers() should have reserved at least one fence slot.
>
> So the underlying problem is that either ttm_eu_reserve_buffers() was 
> never called or VMWGFX tried to add more than one fence.


To figure out what it is could you try the following code fragment:

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c 
b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index f46891012be3..a36f89d3f36d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -288,7 +288,7 @@ int vmw_validation_add_bo(struct 
vmw_validation_context *ctx,
                 val_buf->bo = ttm_bo_get_unless_zero(&vbo->base);
                 if (!val_buf->bo)
                         return -ESRCH;
-               val_buf->num_shared = 0;
+               val_buf->num_shared = 16;
                 list_add_tail(&val_buf->head, &ctx->bo_list);
                 bo_node->as_mob = as_mob;
                 bo_node->cpu_blit = cpu_blit;

Thanks,
Christian.

>
> Regards,
> Christian.
>
>>
>> z
>>
>


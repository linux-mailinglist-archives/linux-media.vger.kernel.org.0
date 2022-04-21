Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4503A509D76
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 12:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388315AbiDUKV2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 06:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388329AbiDUKUz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 06:20:55 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AEF2E690
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 03:17:39 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id t11so8960822eju.13
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 03:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=o9Uwrnr+J/6PoPyTPGmYSGkDODoDuGBLtRMs0gUpXJk=;
        b=Tw1xmngZVfgCT7TLBstw8nQFpll9Eq0dUwiVJsGbsS/YNeQ/L4ksc7k4vKU2gYhMG4
         WIP/P3GVtSM8yQUBvFu0wzQ78CvU/jVksuhYepDhTmaFzetdJPma6K/6biJfMh2ou1mV
         Y8YlaBN2lk5t/HxXOih3jiSyY0LmmKxksUQfDKQigduQaJfdeFZYGTZtfX6lrtc+7PgK
         nU0GqecKph+MxFN0nxH2edRAv/7RwdPu1D7V/yjTDsOtz0gs4xjJISOSJZgsCOOt6zRZ
         DFqR9U/lLaDZcgzIAgXpFM0KtrraQjTO95+6FFitzuEIK1qjfmZ2ZOUfzFuf61KKx9nZ
         ynZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o9Uwrnr+J/6PoPyTPGmYSGkDODoDuGBLtRMs0gUpXJk=;
        b=fDU8Uk5mBzU/3ZYy/zdvSoYYySp1tc49LzHHoYxgPqxTZt2R3BYuuCeHEtEJkHjwil
         OCQwIxcE2qH/ycmtMUCoy5jt+jfaQG+IODyWACFi07lwZnKzZnyhzKjJWEJizsQQXO0v
         pVP2/+jbknNDG188nmtdl8RHB9W1yo2GIFpGCB5FTaCBVeImAhgDgJAYFxY1ao/+coM/
         zpRECy/FOe1coa5l99pkjozuhT+xRpJhxyICgpr2+OxH5sYLjk7+pHL5w4giGSDt2sU6
         Mfc6GG9mRamVkXUr5MJRKNDrr3tfKu0xvlodWvhYE7RGRdin1jgZxi2OTXSdw+EFVWeH
         wdLw==
X-Gm-Message-State: AOAM532EUQPR0uDAktkwv0dvMjKb75VhXIBms8z2EkkgwATD1udSVIhy
        Yy9AUmdk86v0bR8vkGJjOzI=
X-Google-Smtp-Source: ABdhPJwfX3c1ZjiNGKR8X3C8C8qD7akq9C+VUDTYnVQCMx9rkiXUpNWEIgmkZxnq8ehfCKoNipcwXg==
X-Received: by 2002:a17:907:7da3:b0:6f0:d63:69bd with SMTP id oz35-20020a1709077da300b006f00d6369bdmr5677073ejc.289.1650536258169;
        Thu, 21 Apr 2022 03:17:38 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:74ec:39fd:9a7c:7ff3? ([2a02:908:1252:fb60:74ec:39fd:9a7c:7ff3])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm7745262ejj.142.2022.04.21.03.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 03:17:37 -0700 (PDT)
Message-ID: <6cd3571c-099b-df43-a7e0-243aba11726b@gmail.com>
Date:   Thu, 21 Apr 2022 12:17:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/15] dma-buf & drm/amdgpu: remove dma_resv workaround
Content-Language: en-US
To:     Zack Rusin <zackr@vmware.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
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
 <ac12f900-fb47-37d6-9a1c-ac44bc711069@gmail.com>
 <5d699ffa903b5e54e8660367c3b46f07c86f4c55.camel@vmware.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <5d699ffa903b5e54e8660367c3b46f07c86f4c55.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 20.04.22 um 21:28 schrieb Zack Rusin:
> [SNIP]
>> To figure out what it is could you try the following code fragment:
>>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>> b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>> index f46891012be3..a36f89d3f36d 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>> @@ -288,7 +288,7 @@ int vmw_validation_add_bo(struct
>> vmw_validation_context *ctx,
>>                   val_buf->bo = ttm_bo_get_unless_zero(&vbo->base);
>>                   if (!val_buf->bo)
>>                           return -ESRCH;
>> -               val_buf->num_shared = 0;
>> +               val_buf->num_shared = 16;
>>                   list_add_tail(&val_buf->head, &ctx->bo_list);
>>                   bo_node->as_mob = as_mob;
>>                   bo_node->cpu_blit = cpu_blit;
> Fails the same BUG_ON with num_fences and max_fences == 0.

Thanks for testing this.

So the buffer object is not reserved through 
vmw_validation_bo_reserve(), but comes from somewhere else. 
Unfortunately I absolutely can't find where that's coming from.

Do you have some documentation howto setup vmwgfx? E.g. sample VM which 
I can download somewhere etc..

Thanks,
Christian.

>
> z


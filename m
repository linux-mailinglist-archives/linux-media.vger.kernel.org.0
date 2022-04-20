Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC0A1508EB6
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 19:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352807AbiDTRnM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 13:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353546AbiDTRnL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 13:43:11 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4443945503
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 10:40:24 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id s25so3222839edi.13
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 10:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UGqF/VNrOQXVy0XVsg7vlIex9Byf7MQ1HLHnkGVT8jI=;
        b=jEJ8ogj8lc9owjZce7IJB4It8T4hbhUnmPeuGb9BcLfMhltaGMKp4GqC8/3NkFbH7h
         ymNvxWDpt/iCgckENBA7mGuXa2Vgzj+XsdFqwroEgf+BNnzssz3JnND7K3x0opOK4SlL
         4kxC5HmhON6Epj8hkoIgY14/PklMvafmxMBy2EjsORqnUGj+mBqKW+QEpoSBXKjbHI4f
         NYzqjFZWDn6usSAYL2EdbnNQVn1MF86oDYi0qsGN66jLhxxqOiVCI0cNXox0EN2YjJ2d
         QGuH2UdIfE80ppvFsk/bXC29kpp53y0/+rN6ZzcuzSsEjgLh+K160NXtR+g97QC3BiWX
         K8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UGqF/VNrOQXVy0XVsg7vlIex9Byf7MQ1HLHnkGVT8jI=;
        b=VyzUGaKGj42/K/r3pbvXXfrYaTimAz0LsuYz3AiMgWoLWQrtmd8w2DF0eFbb2GAZsp
         uyuDtPU0r6cWK0V5M0wXuSkg1D4/DZzdFfl/UvQfp6W2BmRaYU1o8/mE8qzzCbEHBShh
         DDhkY8R5y6DEjv+FumloQ40y5/MFgUAFsX/AUgMCsu2OtKvKieA+YUS2DLakUH254Nb3
         GTrIitwymoSj753glAdIlOLwYAB0x4ueF2o/Mm8MdEI5rJ4RZomch7CmD2/n/0In9WXv
         6vUq4Nb+VITZhhMvKWD+cOPNV0grX6ju8t8DPKxy8e2kqr0zdL+J+UCjLtkTmb2r1RU8
         CWGw==
X-Gm-Message-State: AOAM5331PLBSU8k58gJ1TKu/ZUt2qolq+oMAUs9l56A85tntS+88FRfo
        +hB6Un10kRySBcagWIJQBO0=
X-Google-Smtp-Source: ABdhPJzl4hP6+bYyCHH6YeLv3zGSn/Zl1qGJV0gcCoYdO4ALyzAM4zbXzED5a3WR79SdNoCSmCxO/w==
X-Received: by 2002:a50:fd81:0:b0:41d:7582:75df with SMTP id o1-20020a50fd81000000b0041d758275dfmr24584159edt.208.1650476422538;
        Wed, 20 Apr 2022 10:40:22 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:425d:2971:45fa:ac5d? ([2a02:908:1252:fb60:425d:2971:45fa:ac5d])
        by smtp.gmail.com with ESMTPSA id g15-20020a170906520f00b006cd07ba40absm6918464ejm.160.2022.04.20.10.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 10:40:21 -0700 (PDT)
Message-ID: <54d00af9-9384-5794-490c-7d4cafe086b6@gmail.com>
Date:   Wed, 20 Apr 2022 19:40:20 +0200
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
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <fe8916b53b0f0101e6616d23eb6896399b092d58.camel@vmware.com>
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

Am 20.04.22 um 19:38 schrieb Zack Rusin:
> On Wed, 2022-04-20 at 09:37 +0200, Christian König wrote:
>> ⚠ External Email
>>
>> Hi Zack,
>>
>> Am 20.04.22 um 05:56 schrieb Zack Rusin:
>>> On Thu, 2022-04-07 at 10:59 +0200, Christian König wrote:
>>>> Rework the internals of the dma_resv object to allow adding more
>>>> than
>>>> one
>>>> write fence and remember for each fence what purpose it had.
>>>>
>>>> This allows removing the workaround from amdgpu which used a
>>>> container
>>>> for
>>>> this instead.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Cc: amd-gfx@lists.freedesktop.org
>>> afaict this change broke vmwgfx which now kernel oops right after
>>> boot.
>>> I haven't had the time to look into it yet, so I'm not sure what's
>>> the
>>> problem. I'll look at this tomorrow, but just in case you have some
>>> clues, the backtrace follows:
>> that's a known issue and should already be fixed with:
>>
>> commit d72dcbe9fce505228dae43bef9da8f2b707d1b3d
>> Author: Christian König <christian.koenig@amd.com>
>> Date:   Mon Apr 11 15:21:59 2022 +0200
> Unfortunately that doesn't seem to be it. The backtrace is from the
> current (as of the time of sending of this email) drm-misc-next, which
> has this change, so it's something else.

Ok, that's strange. In this case I need to investigate further.

Maybe VMWGFX is adding more than one fence and we actually need to 
reserve multiple slots.

Regards,
Christian.

>
> z


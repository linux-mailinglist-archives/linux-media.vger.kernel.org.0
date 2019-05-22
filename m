Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFCFA26917
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 19:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbfEVR2F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 13:28:05 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53160 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbfEVR2E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 13:28:04 -0400
Received: by mail-wm1-f65.google.com with SMTP id y3so3055865wmm.2;
        Wed, 22 May 2019 10:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4S0Pec9BfD8kDwkly62E8kWNDoNmW+jmLXii0uHlq84=;
        b=qSC/E8Xb32KhkpZX/APfXdIGTG2h3A33Q295nP7KBI+d/zKZEyDPBic2fY/4AfElK1
         CdqKD9m70g5/oyzWKpWUdlSzNrItRXf5+5B+Fbh9bc1ZnGcUBWBUmCCafNkw8ASARpx8
         +3wtKHc/5RtFtzk2URnIEz+Wow7rsZNeI5c5bc3gGNKRkJc4Sdvxi2Uain6tG76D5Z3j
         S7JvBic6R/by6vzi3Md1y/JyCBwLE+CMci+2VQ26I8ANLdaoSzjcjV78UIUlYfM1twB8
         x5VvrP1B+vxF/hxxIiPJCZ8iSVHx2g2I+CDq0Om7XzoGxOA4LKxCszYV7sMVfx58HQdm
         8jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=4S0Pec9BfD8kDwkly62E8kWNDoNmW+jmLXii0uHlq84=;
        b=FoSvT16Mu2LkrJrBDgJXLMQdPqjujG4oeTwiXRKYno44eoncIQ1jD2RM/HsHzmmOOY
         vVQ0030apyxFoDsvQNV9z9u5IWsQb6GSHd+PWy2OVfd9cJN/2AW6aWQriXApUl6loKHB
         baHXJVVxB7FTeBxVrHWsRpSK5cD3W6rQeea+7BRzkdh4SsQKP/J+gr5cCgP7/jLxyrZ4
         Hy25rN7p1lirMudK1yarNyw3nPJV2CfeO4P31jjypHiciq4ICUm40dFosJtGTaYRQ3en
         ejoDwirMEtk8BsCk35mQZegLGV7qVtgthBPJzN0Pl6/WKZsfl3BIiWmSFH5z4QbLXK95
         C64w==
X-Gm-Message-State: APjAAAUk/ZG5dC7EcWHm+ArTovxsqCgVNNrcV4U4Q4REJzTs27ELDFdR
        21vnoyy1YEka+UsjAIO/V9BmSX6r
X-Google-Smtp-Source: APXvYqwD8IBhEolkceHyQXps2P8YYEE22P/lpAoZE3V2IX1M1/rT6DDluSpzupRRYXRQCKwANjBPQQ==
X-Received: by 2002:a1c:a7cc:: with SMTP id q195mr8640694wme.53.1558546081898;
        Wed, 22 May 2019 10:28:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id m206sm8514022wmf.21.2019.05.22.10.28.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 10:28:01 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 01/12] dma-buf: add dynamic caching of sg_table
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>
Cc:     amd-gfx list <amd-gfx@lists.freedesktop.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20190416183841.1577-1-christian.koenig@amd.com>
 <1556323269-19670-1-git-send-email-lmark@codeaurora.org>
 <CAO_48GGanguXbmYDD+p1kK_VkiWdZSTYAD1y-0JQK7hqL_OPPg@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d7fb2a6b-f516-b506-247d-0f3d4d59ec8e@gmail.com>
Date:   Wed, 22 May 2019 19:27:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO_48GGanguXbmYDD+p1kK_VkiWdZSTYAD1y-0JQK7hqL_OPPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 22.05.19 um 18:17 schrieb Sumit Semwal:
> Hi Christian,
>
> On Sat, 27 Apr 2019 at 05:31, Liam Mark <lmark@codeaurora.org> wrote:
>> On Tue, 16 Apr 2019, Christian König wrote:
>>
>>> To allow a smooth transition from pinning buffer objects to dynamic
>>> invalidation we first start to cache the sg_table for an attachment
>>> unless the driver explicitly says to not do so.
>>>
>>> ---
>>>   drivers/dma-buf/dma-buf.c | 24 ++++++++++++++++++++++++
>>>   include/linux/dma-buf.h   | 11 +++++++++++
>>>   2 files changed, 35 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 7c858020d14b..65161a82d4d5 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -573,6 +573,20 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>>>        list_add(&attach->node, &dmabuf->attachments);
>>>
>>>        mutex_unlock(&dmabuf->lock);
>>> +
>>> +     if (!dmabuf->ops->dynamic_sgt_mapping) {
>>> +             struct sg_table *sgt;
>>> +
>>> +             sgt = dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
>>> +             if (!sgt)
>>> +                     sgt = ERR_PTR(-ENOMEM);
>>> +             if (IS_ERR(sgt)) {
>>> +                     dma_buf_detach(dmabuf, attach);
>>> +                     return ERR_CAST(sgt);
>>> +             }
>>> +             attach->sgt = sgt;
>>> +     }
>>> +
>>>        return attach;
>>>
>>>   err_attach:
>>> @@ -595,6 +609,10 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>>>        if (WARN_ON(!dmabuf || !attach))
>>>                return;
>>>
>>> +     if (attach->sgt)
>>> +             dmabuf->ops->unmap_dma_buf(attach, attach->sgt,
>>> +                                        DMA_BIDIRECTIONAL);
>>> +
>>>        mutex_lock(&dmabuf->lock);
>>>        list_del(&attach->node);
>>>        if (dmabuf->ops->detach)
>>> @@ -630,6 +648,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>>>        if (WARN_ON(!attach || !attach->dmabuf))
>>>                return ERR_PTR(-EINVAL);
>>>
>>> +     if (attach->sgt)
>>> +             return attach->sgt;
>>> +
>> I am concerned by this change to make caching the sg_table the default
>> behavior as this will result in the exporter's map_dma_buf/unmap_dma_buf
>> calls are no longer being called in
>> dma_buf_map_attachment/dma_buf_unmap_attachment.
> Probably this concern from Liam got lost between versions of your
> patches; could we please request a reply to these points here?

Sorry I indeed never got this mail, but this is actually not an issue 
because Daniel had similar concerns and we didn't made this the default 
in the final version.

>> This seems concerning to me as it appears to ignore the cache maintenance
>> aspect of the map_dma_buf/unmap_dma_buf calls.
>> For example won't this potentially cause issues for clients of ION.
>>
>> If we had the following
>> - #1 dma_buf_attach coherent_device
>> - #2 dma_buf attach non_coherent_device
>> - #3 dma_buf_map_attachment non_coherent_device
>> - #4 non_coherent_device writes to buffer
>> - #5 dma_buf_unmap_attachment non_coherent_device
>> - #6 dma_buf_map_attachment coherent_device
>> - #7 coherent_device reads buffer
>> - #8 dma_buf_unmap_attachment coherent_device
>>
>> There wouldn't be any CMO at step #5 anymore (specifically no invalidate)
>> so now at step #7 the coherent_device could read a stale cache line.
>>
>> Also, now by default dma_buf_unmap_attachment no longer removes the
>> mappings from the iommu, so now by default dma_buf_unmap_attachment is not
>> doing what I would expect and clients are losing the potential sandboxing
>> benefits of removing the mappings.
>> Shouldn't this caching behavior be something that clients opt into instead
>> of being the default?

Well, it seems you are making incorrect assumptions about the cache 
maintenance of DMA-buf here.

At least for all DRM devices I'm aware of mapping/unmapping an 
attachment does *NOT* have any cache maintenance implications.

E.g. the use case you describe above would certainly fail with amdgpu, 
radeon, nouveau and i915 because mapping a DMA-buf doesn't stop the 
exporter from reading/writing to that buffer (just the opposite actually).

All of them assume perfectly coherent access to the underlying memory. 
As far as I know there is no documented cache maintenance requirements 
for DMA-buf.

The IOMMU concern on the other hand is certainly valid and I perfectly 
agree that keeping the mapping time as short as possible is desirable.

Regards,
Christian.

>> Liam
>>
>> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
> Best,
> Sumit.


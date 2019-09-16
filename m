Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E359B3A30
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 14:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732438AbfIPMXT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 08:23:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37597 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbfIPMXT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 08:23:19 -0400
Received: by mail-wm1-f68.google.com with SMTP id r195so10091345wme.2
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2019 05:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=iebtbZVanI/kdhxEL8nf6JProYwqZe7BVzw3fVKKEIg=;
        b=LNkPxme7beBwAoKveCp2PM4gtE+zJFpOOTegzr4EPu1UrGajGMTyHP12/YMplKp3iY
         f+J5IQnE9FSdrNV6UESfLxpdIZU0vkv9Fz8YQTurT7cOuFHFEBpcETHYuhr+u3INLQIs
         M/OOPjqin21ZHnahRzquJakewNgUV20iTdIpkUIVcKdmS+SlWjP3hqJUfcjiHjhdhHEo
         qyQczazbT5ifsps//czjtmROYo78GjWxueXSJ+WNo2MKFRKtDv84Y7fDM+TDOScYuDPu
         1Ece/WmlQ+BqsfiJqJiRs9+2dKF3+tbji2BiE0urje6rXaH+ZrwyjqB+LMO8sVZw2a+y
         2CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:from:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=iebtbZVanI/kdhxEL8nf6JProYwqZe7BVzw3fVKKEIg=;
        b=cZA15ieVlOAgW4cg3MTlmXKRU5Ow+HN3Do87L1f09iscFVh2wLjEsC7+rMojFO25Ux
         e1uZcAH6+Hog4ij1h58ESGxOZ4NrxFYED2ucagxYX+1N8KyzW2fM7ZwXLmK87pSIg1B7
         D2n3vEOrTYTDxTtUeKKl3saoDXmSGCWf3xGwMSfQ5eGYLEKMlHOu/7k6/BvGjyIOBrqw
         vDmZTYJsxE2rj1BclNc5ssbZMVL8v7+teURPFZc0cN5epBzbcovuQ2NSpq1YhkRglU9b
         XtNSFoymzBgkzxCV5Oxolrc+X1w7fAlEP0wLNGJ/d0OER4lG2uzZyQz8P9YwiQ/CgV+B
         Htig==
X-Gm-Message-State: APjAAAXdlBaspADRjwPfbx7ooMQhe0dMrL/4JeG3cF2JvknFJ7HndJYX
        SO/Z9K9IjSdF+w2FkY9ZafQ=
X-Google-Smtp-Source: APXvYqwB+Kki1MwEcj6bomEf3xZykGgUytHCyo4qfiE6HaVi82sHdEq9tMsF3RiMqW1oCiWSOHKvoQ==
X-Received: by 2002:a05:600c:34e:: with SMTP id u14mr9226104wmd.110.1568636595114;
        Mon, 16 Sep 2019 05:23:15 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id e17sm7769563wma.15.2019.09.16.05.23.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Sep 2019 05:23:14 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 1/4] dma-buf: change DMA-buf locking convention
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
References: <20190829142917.13058-1-christian.koenig@amd.com>
 <20190829142917.13058-2-christian.koenig@amd.com>
 <20190903080522.GM2112@phenom.ffwll.local>
 <cd5acbac-73a4-a51a-4383-2c7517e7c180@gmail.com>
Message-ID: <88f748d2-43de-ae2a-b895-40d8b3be5c78@gmail.com>
Date:   Mon, 16 Sep 2019 14:23:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cd5acbac-73a4-a51a-4383-2c7517e7c180@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ping? Any further comment on this or can't we merge at least the locking 
change?

Christian.

Am 11.09.19 um 12:53 schrieb Christian König:
> Am 03.09.19 um 10:05 schrieb Daniel Vetter:
>> On Thu, Aug 29, 2019 at 04:29:14PM +0200, Christian König wrote:
>>> This patch is a stripped down version of the locking changes
>>> necessary to support dynamic DMA-buf handling.
>>>
>>> For compatibility we cache the DMA-buf mapping as soon as
>>> exporter/importer disagree on the dynamic handling.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/dma-buf/dma-buf.c | 90 
>>> ++++++++++++++++++++++++++++++++++++---
>>>   include/linux/dma-buf.h   | 51 +++++++++++++++++++++-
>>>   2 files changed, 133 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 433d91d710e4..65052d52602b 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -525,6 +525,10 @@ struct dma_buf *dma_buf_export(const struct 
>>> dma_buf_export_info *exp_info)
>>>           return ERR_PTR(-EINVAL);
>>>       }
>>>   +    if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
>>> +            exp_info->ops->dynamic_mapping))
>>> +        return ERR_PTR(-EINVAL);
>>> +
>>>       if (!try_module_get(exp_info->owner))
>>>           return ERR_PTR(-ENOENT);
>>>   @@ -645,10 +649,11 @@ void dma_buf_put(struct dma_buf *dmabuf)
>>>   EXPORT_SYMBOL_GPL(dma_buf_put);
>>>     /**
>>> - * dma_buf_attach - Add the device to dma_buf's attachments list; 
>>> optionally,
>>> + * dma_buf_dynamic_attach - Add the device to dma_buf's attachments 
>>> list; optionally,
>>>    * calls attach() of dma_buf_ops to allow device-specific attach 
>>> functionality
>>> - * @dmabuf:    [in]    buffer to attach device to.
>>> - * @dev:    [in]    device to be attached.
>>> + * @dmabuf:        [in]    buffer to attach device to.
>>> + * @dev:        [in]    device to be attached.
>>> + * @dynamic_mapping:    [in]    calling convention for map/unmap
>>>    *
>>>    * Returns struct dma_buf_attachment pointer for this attachment. 
>>> Attachments
>>>    * must be cleaned up by calling dma_buf_detach().
>>> @@ -662,8 +667,9 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
>>>    * accessible to @dev, and cannot be moved to a more suitable 
>>> place. This is
>>>    * indicated with the error code -EBUSY.
>>>    */
>>> -struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>>> -                      struct device *dev)
>>> +struct dma_buf_attachment *
>>> +dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>>> +               bool dynamic_mapping)
>>>   {
>>>       struct dma_buf_attachment *attach;
>>>       int ret;
>>> @@ -677,6 +683,7 @@ struct dma_buf_attachment *dma_buf_attach(struct 
>>> dma_buf *dmabuf,
>>>         attach->dev = dev;
>>>       attach->dmabuf = dmabuf;
>>> +    attach->dynamic_mapping = dynamic_mapping;
>>>         mutex_lock(&dmabuf->lock);
>>>   @@ -685,16 +692,64 @@ struct dma_buf_attachment 
>>> *dma_buf_attach(struct dma_buf *dmabuf,
>>>           if (ret)
>>>               goto err_attach;
>>>       }
>>> +    dma_resv_lock(dmabuf->resv, NULL);
>>>       list_add(&attach->node, &dmabuf->attachments);
>>> +    dma_resv_unlock(dmabuf->resv);
>>>         mutex_unlock(&dmabuf->lock);
>>>   +    /* When either the importer or the exporter can't handle dynamic
>>> +     * mappings we cache the mapping here to avoid issues with the
>>> +     * reservation object lock.
>>> +     */
>>> +    if (dma_buf_attachment_is_dynamic(attach) !=
>>> +        dma_buf_is_dynamic(dmabuf)) {
>>> +        struct sg_table *sgt;
>>> +
>>> +        if (dma_buf_is_dynamic(attach->dmabuf))
>>> +            dma_resv_lock(attach->dmabuf->resv, NULL);
>>> +
>>> +        sgt = dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
>> Now we're back to enforcing DMA_BIDI, which works nicely around the
>> locking pain, but apparently upsets the arm-soc folks who want to 
>> control
>> this better.
>
> Take another look at dma_buf_map_attachment(), we still try to get the 
> caching there for ARM.
>
> What we do here is to bidirectionally map the buffer to avoid the 
> locking hydra when importer and exporter disagree on locking.
>
> So the ARM folks can easily avoid that by switching to dynamic locking 
> for both.
>
> Regards,
> Christian.
>
>> That's why your previous version moved the caching into
>> map/unmap_sg, which resurrected the locking hydra.
>>
>> I think we're going a bit in circles here, and I don't have a good idea
>> either :-/
>> -Daniel
>>
>>> +        if (!sgt)
>>> +            sgt = ERR_PTR(-ENOMEM);
>>> +        if (IS_ERR(sgt)) {
>>> +            ret = PTR_ERR(sgt);
>>> +            goto err_unlock;
>>> +        }
>>> +        if (dma_buf_is_dynamic(attach->dmabuf))
>>> +            dma_resv_unlock(attach->dmabuf->resv);
>>> +        attach->sgt = sgt;
>>> +        attach->dir = DMA_BIDIRECTIONAL;
>>> +    }
>>> +
>>>       return attach;
>>>     err_attach:
>>>       kfree(attach);
>>>       mutex_unlock(&dmabuf->lock);
>>>       return ERR_PTR(ret);
>>> +
>>> +err_unlock:
>>> +    if (dma_buf_is_dynamic(attach->dmabuf))
>>> +        dma_resv_unlock(attach->dmabuf->resv);
>>> +
>>> +    dma_buf_detach(dmabuf, attach);
>>> +    return ERR_PTR(ret);
>>> +}
>>> +EXPORT_SYMBOL_GPL(dma_buf_dynamic_attach);
>>> +
>>> +/**
>>> + * dma_buf_attach - Wrapper for dma_buf_dynamic_attach
>>> + * @dmabuf:    [in]    buffer to attach device to.
>>> + * @dev:    [in]    device to be attached.
>>> + *
>>> + * Wrapper to call dma_buf_dynamic_attach() for drivers which still 
>>> use a static
>>> + * mapping.
>>> + */
>>> +struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>>> +                      struct device *dev)
>>> +{
>>> +    return dma_buf_dynamic_attach(dmabuf, dev, false);
>>>   }
>>>   EXPORT_SYMBOL_GPL(dma_buf_attach);
>>>   @@ -711,11 +766,20 @@ void dma_buf_detach(struct dma_buf *dmabuf, 
>>> struct dma_buf_attachment *attach)
>>>       if (WARN_ON(!dmabuf || !attach))
>>>           return;
>>>   -    if (attach->sgt)
>>> +    if (attach->sgt) {
>>> +        if (dma_buf_is_dynamic(attach->dmabuf))
>>> +            dma_resv_lock(attach->dmabuf->resv, NULL);
>>> +
>>>           dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
>>>   +        if (dma_buf_is_dynamic(attach->dmabuf))
>>> +            dma_resv_unlock(attach->dmabuf->resv);
>>> +    }
>>> +
>>>       mutex_lock(&dmabuf->lock);
>>> +    dma_resv_lock(dmabuf->resv, NULL);
>>>       list_del(&attach->node);
>>> +    dma_resv_unlock(dmabuf->resv);
>>>       if (dmabuf->ops->detach)
>>>           dmabuf->ops->detach(dmabuf, attach);
>>>   @@ -749,6 +813,9 @@ struct sg_table *dma_buf_map_attachment(struct 
>>> dma_buf_attachment *attach,
>>>       if (WARN_ON(!attach || !attach->dmabuf))
>>>           return ERR_PTR(-EINVAL);
>>>   +    if (dma_buf_attachment_is_dynamic(attach))
>>> +        dma_resv_assert_held(attach->dmabuf->resv);
>>> +
>>>       if (attach->sgt) {
>>>           /*
>>>            * Two mappings with different directions for the same
>>> @@ -761,6 +828,9 @@ struct sg_table *dma_buf_map_attachment(struct 
>>> dma_buf_attachment *attach,
>>>           return attach->sgt;
>>>       }
>>>   +    if (dma_buf_is_dynamic(attach->dmabuf))
>>> +        dma_resv_assert_held(attach->dmabuf->resv);
>>> +
>>>       sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
>>>       if (!sg_table)
>>>           sg_table = ERR_PTR(-ENOMEM);
>>> @@ -793,9 +863,15 @@ void dma_buf_unmap_attachment(struct 
>>> dma_buf_attachment *attach,
>>>       if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
>>>           return;
>>>   +    if (dma_buf_attachment_is_dynamic(attach))
>>> +        dma_resv_assert_held(attach->dmabuf->resv);
>>> +
>>>       if (attach->sgt == sg_table)
>>>           return;
>>>   +    if (dma_buf_is_dynamic(attach->dmabuf))
>>> +        dma_resv_assert_held(attach->dmabuf->resv);
>>> +
>>>       attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>>>   }
>>>   EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
>>> @@ -1219,10 +1295,12 @@ static int dma_buf_debug_show(struct 
>>> seq_file *s, void *unused)
>>>           seq_puts(s, "\tAttached Devices:\n");
>>>           attach_count = 0;
>>>   +        dma_resv_lock(buf_obj->resv, NULL);
>>>           list_for_each_entry(attach_obj, &buf_obj->attachments, 
>>> node) {
>>>               seq_printf(s, "\t%s\n", dev_name(attach_obj->dev));
>>>               attach_count++;
>>>           }
>>> +        dma_resv_unlock(buf_obj->resv);
>>>             seq_printf(s, "Total %d devices attached\n\n",
>>>                   attach_count);
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index ec212cb27fdc..a8f8b2b812fd 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -42,6 +42,17 @@ struct dma_buf_ops {
>>>         */
>>>       bool cache_sgt_mapping;
>>>   +    /**
>>> +     * @dynamic_mapping:
>>> +     *
>>> +     * If true the framework makes sure that the map/unmap_dma_buf
>>> +     * callbacks are always called with the dma_resv object locked.
>>> +     *
>>> +     * If false the framework makes ure that the map/unmap_dma_buf
>>> +     * callbacks are always called without the dma_resv object locked.
>>> +     */
>>> +    bool dynamic_mapping;
>>> +
>>>       /**
>>>        * @attach:
>>>        *
>>> @@ -109,6 +120,9 @@ struct dma_buf_ops {
>>>        * any other kind of sharing that the exporter might wish to make
>>>        * available to buffer-users.
>>>        *
>>> +     * This is always called with the dmabuf->resv object locked when
>>> +     * the dynamic_mapping flag is true.
>>> +     *
>>>        * Returns:
>>>        *
>>>        * A &sg_table scatter list of or the backing storage of the 
>>> DMA buffer,
>>> @@ -327,6 +341,8 @@ struct dma_buf {
>>>    * @sgt: cached mapping.
>>>    * @dir: direction of cached mapping.
>>>    * @priv: exporter specific attachment data.
>>> + * @dynamic_mapping: true if dma_buf_map/unmap_attachment() is 
>>> called with the
>>> + * dma_resv lock held.
>>>    *
>>>    * This structure holds the attachment information between the 
>>> dma_buf buffer
>>>    * and its user device(s). The list contains one attachment struct 
>>> per device
>>> @@ -343,6 +359,7 @@ struct dma_buf_attachment {
>>>       struct list_head node;
>>>       struct sg_table *sgt;
>>>       enum dma_data_direction dir;
>>> +    bool dynamic_mapping;
>>>       void *priv;
>>>   };
>>>   @@ -394,10 +411,39 @@ static inline void get_dma_buf(struct 
>>> dma_buf *dmabuf)
>>>       get_file(dmabuf->file);
>>>   }
>>>   +/**
>>> + * dma_buf_is_dynamic - check if a DMA-buf uses dynamic mappings.
>>> + * @dmabuf: the DMA-buf to check
>>> + *
>>> + * Returns true if a DMA-buf exporter wants to be called with the 
>>> dma_resv
>>> + * locked, false if it doesn't wants to be called with the lock held.
>>> + */
>>> +static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
>>> +{
>>> +    return dmabuf->ops->dynamic_mapping;
>>> +}
>>> +
>>> +/**
>>> + * dma_buf_attachment_is_dynamic - check if a DMA-buf attachment 
>>> uses dynamic
>>> + * mappinsg
>>> + * @attach: the DMA-buf attachment to check
>>> + *
>>> + * Returns true if a DMA-buf importer wants to call the map/unmap 
>>> functions with
>>> + * the dma_resv lock held.
>>> + */
>>> +static inline bool
>>> +dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
>>> +{
>>> +    return attach->dynamic_mapping;
>>> +}
>>> +
>>>   struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>>> -                            struct device *dev);
>>> +                      struct device *dev);
>>> +struct dma_buf_attachment *
>>> +dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>>> +               bool dynamic_mapping);
>>>   void dma_buf_detach(struct dma_buf *dmabuf,
>>> -                struct dma_buf_attachment *dmabuf_attach);
>>> +            struct dma_buf_attachment *attach);
>>>     struct dma_buf *dma_buf_export(const struct dma_buf_export_info 
>>> *exp_info);
>>>   @@ -409,6 +455,7 @@ struct sg_table *dma_buf_map_attachment(struct 
>>> dma_buf_attachment *,
>>>                       enum dma_data_direction);
>>>   void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct 
>>> sg_table *,
>>>                   enum dma_data_direction);
>>> +void dma_buf_move_notify(struct dma_buf *dma_buf);
>>>   int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>>>                    enum dma_data_direction dir);
>>>   int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
>>> -- 
>>> 2.17.1
>>>
>


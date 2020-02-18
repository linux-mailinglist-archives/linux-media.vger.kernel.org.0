Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79299162703
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 14:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgBRNUJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 08:20:09 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37958 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgBRNUJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 08:20:09 -0500
Received: by mail-wm1-f67.google.com with SMTP id a9so2866831wmj.3
        for <linux-media@vger.kernel.org>; Tue, 18 Feb 2020 05:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=U3h6aJz6L+CS9MjTdIAS5p90j+53sA+NzuXTs9Hdx+A=;
        b=J5wCZNOBYgMGXWxxuPHydKz4W2tgHFhTlGNww6yT7HdFkez8lu3MaFJBmtMTmX2aGx
         Pcm2OCDY/u5gqkN5P6rywPIi6c6lbrJWqrIemHOHrK/oIMLU+0VV2LWJYy9y8FpdFGzT
         Oi57zpoos8dOLjG69GHWnNafC49BMvvmqHV8Fo1G8SLIGmOdyj+M3yJGDJ5e7GotYiZy
         OfEyps24C8sN1ptI+o4MlUtNnr/tZf1jURWL5t9zQcWroZYcC2jgRwcxdjTLC/6oAwx+
         JSZPAuCd3Ed8S3IevjABYYp7RuvF5r7ouJVx30jIuHy74K3df5VbmVKp9IyHwYSX6RCi
         6Dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=U3h6aJz6L+CS9MjTdIAS5p90j+53sA+NzuXTs9Hdx+A=;
        b=FxspaMR7JbLyIPHZQbLfAYksdQ/KWUtickuUAXpIJPbe7WhCdIjuY/VnPaYMCAY1Yq
         TsEFZJ6uGRu8QhucEpElrTinFWCFR62oEwL4N21a7l3mea5LEuWT03rF/i4C8V21HtY3
         uHALV8BZlzUSd16ShnvaQkCPJuNeNxBLjmKy2tXkdE3/2y6SzB/oy1CpOSS8NCstA6rD
         WiPJIZVZmNCTwzcaS+Jnj+hYyPqWLjIz70HsyX9Lkt/fowLjViMrYn73Dcs610tMCiJn
         N6poZ/N2Q+ANjMoQt2U/3O8+r2mYCM2j8dTlxDzK0bCX1tVqNfq9HHLdk0Hx9CIQoPIl
         F2+g==
X-Gm-Message-State: APjAAAWCGIa+EuCbl11kq0CFJBzHARY6HCXRBGz+SZeXzXcOsW7kx6Zh
        PxOtzrZwf0rndVnU/p0tB7k=
X-Google-Smtp-Source: APXvYqxs90yRwp11u2cPh92Slih7u9UJMgkAd+EynHMZhb5WK4JACCingOqk947Kuw3FR58afqOxtg==
X-Received: by 2002:a1c:e28a:: with SMTP id z132mr3091894wmg.157.1582032005691;
        Tue, 18 Feb 2020 05:20:05 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id p11sm5988848wrn.40.2020.02.18.05.20.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Feb 2020 05:20:05 -0800 (PST)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 1/5] dma-buf: add dynamic DMA-buf handling v14
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
References: <20191029104049.9011-1-christian.koenig@amd.com>
 <20191029104049.9011-2-christian.koenig@amd.com>
 <20191105102045.GC10326@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cb607ed5-eaeb-5332-d1de-77cae8512c1d@gmail.com>
Date:   Tue, 18 Feb 2020 14:20:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105102045.GC10326@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.11.19 um 11:20 schrieb Daniel Vetter:
> On Tue, Oct 29, 2019 at 11:40:45AM +0100, Christian König wrote:
> [SNIP]
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index d377b4ca66bf..ce293cee76ed 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -529,6 +529,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>   		    exp_info->ops->dynamic_mapping))
>>   		return ERR_PTR(-EINVAL);
>>   
>> +	if (WARN_ON(!exp_info->ops->dynamic_mapping &&
>> +		    (exp_info->ops->pin || exp_info->ops->unpin)))
>> +		return ERR_PTR(-EINVAL);
> Imo make this stronger, have a dynamic mapping iff there's both a pin and
> unpin function. Otherwise this doesn't make a lot of sense to me.

I want to avoid that for the initial implementation. So far dynamic only 
meant that we have the new locking semantics.

We could make that mandatory after this patch set when amdgpu is 
migrated and has implemented the necessary callbacks.

>> [SNIP]
>> @@ -821,13 +877,23 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>>   		return attach->sgt;
>>   	}
>>   
>> -	if (dma_buf_is_dynamic(attach->dmabuf))
>> +	if (dma_buf_is_dynamic(attach->dmabuf)) {
>>   		dma_resv_assert_held(attach->dmabuf->resv);
>> +		if (!attach->importer_ops->move_notify) {
> Imo just require ->move_notify for importers that give you an ops
> function. Doesn't really make sense to allow dynamic without support
> ->move_notify.

Same thing here. We could make that mandatory and clean it up after 
migrating amdgpu.

>> [SNIP]
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index af73f835c51c..7456bb937635 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -93,14 +93,40 @@ struct dma_buf_ops {
>>   	 */
>>   	void (*detach)(struct dma_buf *, struct dma_buf_attachment *);
>>   
>> +	/**
>> +	 * @pin:
>> +	 *
>> +	 * This is called by dma_buf_pin and lets the exporter know that the
>> +	 * DMA-buf can't be moved any more.
> I think we should add a warning here that pinning is only ok for limited
> use-cases (like scanout or similar), and not as part of general buffer
> management.
>
> i915 uses temporary pins through it's execbuf management (and everywhere
> else), so we have a _lot_ of people in dri-devel with quite different
> ideas of what this might be for :-)

Yeah, that is also a good idea for us. Wrote a one liner, but you might 
want to double check the wording.

>> [SNIP]
>> @@ -141,9 +167,6 @@ struct dma_buf_ops {
>>   	 *
>>   	 * This is called by dma_buf_unmap_attachment() and should unmap and
>>   	 * release the &sg_table allocated in @map_dma_buf, and it is mandatory.
>> -	 * It should also unpin the backing storage if this is the last mapping
>> -	 * of the DMA buffer, it the exporter supports backing storage
>> -	 * migration.
> This is still valid for non-dynamic exporters. Imo keep but clarify that.

OK, changed.

>> [SNIP]
>> @@ -438,16 +491,19 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
>>   static inline bool
>>   dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
>>   {
>> -	return attach->dynamic_mapping;
>> +	return !!attach->importer_ops;
> Hm why not do the same for exporters, and make them dynamic iff they have
> pin/unpin?

Same thing as before, to migrate amdgpu to the new interface first and 
then make it mandatory.

I think I will just write a cleanup patch into the series which comes 
after the amdgpu changes.

Thanks,
Christian.

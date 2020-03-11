Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0CD0181B4C
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 15:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729908AbgCKOdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 10:33:05 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46326 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbgCKOdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 10:33:05 -0400
Received: by mail-wr1-f66.google.com with SMTP id n15so2869225wrw.13
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CQ0JDxNrcN3shv6a5m0suWWdeJt0vyxFrdr4rHmqkqU=;
        b=iCG7ITCPV+6IA471m5arYSpjP/9x2Omj5aJ3wCYIEKDtN4MZ0oizDH6Xn9Q+jqcjXx
         MeOITCcMjtOHua4CH48S2fIv+2ZV0Iy39e4zuX7clFNibnupKM9pqmRHDVtbib2fAuVe
         f1TA+ZAVqrtKUHa8qQSD9dlM1mEUrok++8+mYnjRBtfKwQD2RF899GZjDSApZFbhg6PQ
         ZMxKARTyEig6ahtFNIG8Ps+QJqobSbEVFakQk/qAQe2IOgF23/WuqVhvdg61tOUb6wLM
         oUzGJWwRa2gECudS0qx9dqcG1IkF7EmIoOg0Kee/kvBbKyTTcZCh+2eZnScEEtHk+1ap
         NNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=CQ0JDxNrcN3shv6a5m0suWWdeJt0vyxFrdr4rHmqkqU=;
        b=QrrHXYuek23MhSWRT4rXkXvMnZLXVNh6p49u4u60Pt+4N2tVjr95DnjmIp2wnwVkuq
         IPsyvxw4e7chzX2rzVM5ymtJ/KqABZNMNWxVQ3hsTcT984ne2wYBS0CeN3KBwxwr1hhU
         6Ly7A18brq69OiU5KlbQOlnsqPVyTAxpthYqfjFohXad4EOyTXExDbqKCiwWP5GmgYjo
         BbtgKZGLAQRIbotGYOfe4fX72LuqQVOE7PQnlSNMpthqt0z448x4VK3469vCmR/OSg63
         PhcSv0WHCf0iKwyHy6ncuOKqgxgKsN3c/HGjAIn3ROklckyQ7v9lYn1lMpnX36mIoDtS
         ghqg==
X-Gm-Message-State: ANhLgQ0iHXr+a/8n6OOpk29TPEzK4VKcOIQVIRKblMEAlZ/OM5lBtx6w
        cErogWYysBcX41t1nKW0jlo=
X-Google-Smtp-Source: ADFU+vupajy8DiEtdmUz0h9BP/XwMnaErjf8sHC5057XwoWGaDuCWiInFXD/bVB1J78ZSPNA/rAVZw==
X-Received: by 2002:a5d:4d48:: with SMTP id a8mr4915400wru.246.1583937183716;
        Wed, 11 Mar 2020 07:33:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id c13sm10921011wro.96.2020.03.11.07.33.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Mar 2020 07:33:02 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 4/6] drm/amdgpu: add checks if DMA-buf P2P is supported
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     David1.Zhou@amd.com, hch@infradead.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        Logan Gunthorpe <logang@deltatee.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-5-christian.koenig@amd.com>
 <20200311140415.GB31668@ziepe.ca>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <848c2f50-1529-f036-69cd-5104b7ebe27b@gmail.com>
Date:   Wed, 11 Mar 2020 15:33:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200311140415.GB31668@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 11.03.20 um 15:04 schrieb Jason Gunthorpe:
> On Wed, Mar 11, 2020 at 02:51:56PM +0100, Christian König wrote:
>> Check if we can do peer2peer on the PCIe bus.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> index aef12ee2f1e3..bbf67800c8a6 100644
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> @@ -38,6 +38,7 @@
>>   #include <drm/amdgpu_drm.h>
>>   #include <linux/dma-buf.h>
>>   #include <linux/dma-fence-array.h>
>> +#include <linux/pci-p2pdma.h>
>>   
>>   /**
>>    * amdgpu_gem_prime_vmap - &dma_buf_ops.vmap implementation
>> @@ -179,6 +180,9 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
>>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>   	int r;
>>   
>> +	if (pci_p2pdma_distance_many(adev->pdev, &attach->dev, 1, true) < 0)
>> +		attach->peer2peer = false;
>> +
> Are there other related patches than this series?
>
> p2p dma mapping needs to be done in common code, in p2pdma.c - ie this
> open coding is missing the bus_offset stuff, at least.

Yeah, I'm aware of this. But I couldn't find a better way for now.

> I really do not want to see drivers open code this stuff.
>
> We already have a p2pdma API for handling the struct page case, so I
> suggest adding some new p2pdma API to handle this for non-struct page
> cases.
>
> ie some thing like:
>
> int 'p2pdma map bar'(
>     struct pci_device *source,
>     unsigned int source_bar_number,
>     struct pci_device *dest,
>     physaddr&len *array_of_offsets & length pairs into source bar,
>     struct scatterlist *output_sgl)

Well that's exactly what I have to avoid since I don't have the array of 
offsets around and want to avoid constructing it.

Similar problem for dma_map_resource(). My example does this on demand, 
but essentially we also have use cases where this is done only once.

Ideally we would have some function to create an sgl based on some 
arbitrary collection of offsets and length inside a BAR.

Regards,
Christian.

>
> Jason


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6462A67D851
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 23:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232835AbjAZW0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 17:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjAZW0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 17:26:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF836530C1
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 14:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674771956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HklvufQZfBWJQ24G/LaO8a1AhEjWrY545//BpSv4N9I=;
        b=Rt2px9EgioGatrCi9DxrTTeQqH2jw3u4OIIjbjEZwmZpSlh4KsjUnRK+fHu69qhSjAMUfY
        IjNE+4bzfe57GIGduscE5RJ/jHyhr9PDcbRiVz3efIC7D79+n3rJfO0FtrPoO35KbCmsF3
        9CVs+niDuxMzWEU1+XnB+Jrjo1HPjD4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357-4YWU1hKmP0eByOm6aSE6dA-1; Thu, 26 Jan 2023 17:25:52 -0500
X-MC-Unique: 4YWU1hKmP0eByOm6aSE6dA-1
Received: by mail-ed1-f72.google.com with SMTP id l17-20020a056402255100b00472d2ff0e59so2299885edb.19
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 14:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HklvufQZfBWJQ24G/LaO8a1AhEjWrY545//BpSv4N9I=;
        b=GKwv3Q0KePa9Gm4TF5Tyjm8rigJWhN0nu2gCiH/YSvi3DILrRXauwhNg/3KKQQVpoB
         1P9nsHNYfi2hlgfQGJq/KdOToM7Kcv/4zF+JDFVSEwDaM+d6Fk/dGKMVzx97lMd00ipg
         p6Z2opgchYUB15QcQbXTVgi4Aty+ttwZJ3xoTAfUAuoFIl0qA5bP9bQIrFpuwzcdWvBe
         rZgzv3kaCqhTJE9+8lqZAZE8QPLNHZemSsEudIA7D1qeLLy/3lCvsKcAF9vffhBiB4dm
         6TmYffnpDGxQ0/GihvAvht2vUzuDMfKFR3CSC2G7wKA/p1G2Bu/zEf96s2lH2VcDWt+v
         RVOA==
X-Gm-Message-State: AFqh2kqazm4x9QQWxXuPTBXh29yi+Gz28DbpaT0qAC0zPn8/Z76wH5t4
        jvCXbYgVVcGnp1Hnfczcfi+ksHOa9GlMX9uEmTaFOIcI7542QjC/QTbJCcHGC9IG2/IJfmzlm7q
        ib7z5MsrirwtSOlFaaIJK7FY=
X-Received: by 2002:a17:907:8999:b0:877:83ea:2bfc with SMTP id rr25-20020a170907899900b0087783ea2bfcmr29298592ejc.39.1674771951249;
        Thu, 26 Jan 2023 14:25:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu8weu5499CBW7EQXZLSCEzQQ9uDVPguSl7RkTew9/qlc9qQ7QRBuzQoH7Teg0s42R+asqjQg==
X-Received: by 2002:a17:907:8999:b0:877:83ea:2bfc with SMTP id rr25-20020a170907899900b0087783ea2bfcmr29298582ejc.39.1674771951068;
        Thu, 26 Jan 2023 14:25:51 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id e14-20020a1709062c0e00b007c0a7286ac8sm1193875ejh.69.2023.01.26.14.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 14:25:50 -0800 (PST)
Message-ID: <5caf64b6-0e3c-4c24-4fe8-9ed2caf43822@redhat.com>
Date:   Thu, 26 Jan 2023 23:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] dma-buf: actually set signaling bit for private sub
 fences
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Arvind.Yadav@amd.com, sumit.semwal@linaro.org, gustavo@padovan.org
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230126002844.339593-1-dakr@redhat.com>
 <4b13c48e-1677-3947-42e5-5ba241bcb96a@amd.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <4b13c48e-1677-3947-42e5-5ba241bcb96a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/26/23 07:58, Christian König wrote:
> Am 26.01.23 um 01:28 schrieb Danilo Krummrich:
>> In dma_fence_allocate_private_stub() set the signaling bit of the newly
>> allocated private stub fence rather than the signaling bit of the
>> shared dma_fence_stub.
>>
>> Fixes: c85d00d4fd8b ("dma-buf: set signaling bit for the stub fence")
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Should I push it upstream as well or do you have commit access?

Thanks, I can push it to drm-misc-next.

> 
>> ---
>>   drivers/dma-buf/dma-fence.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 406b4e26f538..0de0482cd36e 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -167,7 +167,7 @@ struct dma_fence 
>> *dma_fence_allocate_private_stub(void)
>>                  0, 0);
>>       set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>> -        &dma_fence_stub.flags);
>> +        &fence->flags);
>>       dma_fence_signal(fence);
> 


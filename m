Return-Path: <linux-media+bounces-8098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CF888FEE7
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 13:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF14F2929AE
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 12:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69037EF0B;
	Thu, 28 Mar 2024 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BsPqoS+A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8140C7E575
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711628712; cv=none; b=QbuHqbAkT+/GrQ/THbc4yzKpPyXvfLq3KylxSv8rZqR7LZYR6o5uVQRxg8N8+TFaZGF9EFzblEAUOcJ9k4jkaJqZPYvBnlUxH+KwmNXBpHYoY0Y4Qu/elRuFXjhlcD+LDKJp0N1zedojThsSC1ddH+lpfTmbN72pIBhJHAVrwjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711628712; c=relaxed/simple;
	bh=kl8IcrnOMDGYWHFT4YyXQ1c32kS1mgZgGduhm9pKJ3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LueKedhZyeOVnR97IrDlWHkAW9gO10fYaA7suQZ0rl7CFSxZK8o7/hztVriwJWqHabYM/mjX2xiLzC8liDRCR6WUKF5SJPRxOZl0vEl0tr2oO4M0RFkeA0ixwctMM1JONTL8ykg7s8qSCWXlcjRR4A7Qa1o5YkrCHux8zRCxj80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BsPqoS+A; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41543b772e6so6691325e9.2
        for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 05:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711628707; x=1712233507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IewWu8lmxt6/0HVEI36CNBq5rN/g2F+PxaVTBG2h/iU=;
        b=BsPqoS+AjhXtUn7SSz4UVY2MWTJjdK1P5bvk66k/N8Bvl4Hc4nHFNkgkO23N8xqPXs
         jcOa5Zmmq4pqM94T9lQ/eQIS2RGCT+5jy4oi6W1orQUly7m2qNDjNjRV0qvjhtLAk9mh
         UXZfGf5UmmMzQKVSuZDO8DxaAAss3Pj0wV/YPH9XQl0VtZeCYMao+Di7qKcjAIVKPY3B
         9qyW8U5FEedwcSWfVbFiKknKX68Bj7xfriPTQoUzjKkdDqosUp6WTFz/S3ZwMaxCUIV8
         kRtJ0OI81Pv0OeBuumprkeLV6FfOmgiogBaw5e9sDHQ5TL0VbYVgWqC3Q/1mMC/aAvT/
         5dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711628707; x=1712233507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IewWu8lmxt6/0HVEI36CNBq5rN/g2F+PxaVTBG2h/iU=;
        b=pxvnE1m6AI+mMsLdzg3x2wzIb0rzxrwf25trZxGLgnWZdRNqxbzLzRZ/nr6KWoFipn
         ZFcPfHyD3wbX8uq0KPk6q6ZjXpoddRbNahtDQ2Pi1UgfJqW5QqgoiQWeQ5Nr8BtwLcl4
         +5y3iiWQWWYZOY+ARUBSuz8k14RyEMqFYLztBnfHrDrWsWicraO3/ZiZEJAfuO2b2jSC
         pj8DVxVTX5YRhXnGCIcxtQzw3+3U04B1fEl5peRjnyvcXHBgt7uhq/LSvw4B21JqIYs2
         M96wSeh9+1ncqxfYzDnhR1t62kUycQH5SLY6FiYlNqLMNLbuy2Hfbhj0KOdq5j2n1KDV
         jTMA==
X-Forwarded-Encrypted: i=1; AJvYcCXEglpkwZaNPwVdiLT6w6PXLDnnMowe7gqk7T0kshimk5U7V2cGjNwFW4q8LeWJ+kM4nRsyqGZxdbQQxEZImmAlTyETm/Ix/96iI7I=
X-Gm-Message-State: AOJu0Yx+/HeR7HTkIK8xGEVjwE81R350w/Hk0jQ64WMacJzV/B+pwn9Y
	APdx65h3TS15XsAOzWOk2JuW6whKj8+/3SfBzjR5PiYIb13GlfVbqc9u1/Ej2JE=
X-Google-Smtp-Source: AGHT+IH0y2fo2UTEGk+nQ03ttrhLqd3C0Z1OT03HbenKppy5AOYESKIChnTRGuAmLfyXp7UsaXIgVA==
X-Received: by 2002:a05:600c:1c8d:b0:413:feed:b309 with SMTP id k13-20020a05600c1c8d00b00413feedb309mr2723847wms.6.1711628706870;
        Thu, 28 Mar 2024 05:25:06 -0700 (PDT)
Received: from [10.1.5.112] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id fb7-20020a05600c520700b00414969894a1sm4030818wmb.13.2024.03.28.05.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 05:25:06 -0700 (PDT)
Message-ID: <342cdc02-22e7-4caf-b00e-b46cbcdf36fa@baylibre.com>
Date: Thu, 28 Mar 2024 13:25:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 1/3] net: ethernet: ti: Add accessors for
 struct k3_cppi_desc_pool members
To: Naveen Mamindlapalli <naveenm@marvell.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ratheesh Kannoth <rkannoth@marvell.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
References: <20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v5-1-bc1739170bc6@baylibre.com>
 <SJ2PR18MB5635B9F20BB6CE1CC945F3B2A23B2@SJ2PR18MB5635.namprd18.prod.outlook.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <SJ2PR18MB5635B9F20BB6CE1CC945F3B2A23B2@SJ2PR18MB5635.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/28/24 13:06, Naveen Mamindlapalli wrote:
>> -----Original Message-----
>> From: Julien Panis <jpanis@baylibre.com>
>> Sent: Thursday, March 28, 2024 2:57 PM
>> To: David S. Miller <davem@davemloft.net>; Eric Dumazet
>> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
>> <pabeni@redhat.com>; Russell King <linux@armlinux.org.uk>; Alexei Starovoitov
>> <ast@kernel.org>; Daniel Borkmann <daniel@iogearbox.net>; Jesper Dangaard
>> Brouer <hawk@kernel.org>; John Fastabend <john.fastabend@gmail.com>;
>> Sumit Semwal <sumit.semwal@linaro.org>; Christian König
>> <christian.koenig@amd.com>; Simon Horman <horms@kernel.org>; Andrew
>> Lunn <andrew@lunn.ch>; Ratheesh Kannoth <rkannoth@marvell.com>
>> Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org; bpf@vger.kernel.org;
>> linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org; linaro-mm-
>> sig@lists.linaro.org; Julien Panis <jpanis@baylibre.com>
>> Subject: [PATCH net-next v5 1/3] net: ethernet: ti: Add accessors
>> for struct k3_cppi_desc_pool members
>>
>> This patch adds accessors for desc_size and cpumem members. They may be
>> used, for instance, to compute a descriptor index.
>>
>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>> ---
>>   drivers/net/ethernet/ti/k3-cppi-desc-pool.c | 12 ++++++++++++
>> drivers/net/ethernet/ti/k3-cppi-desc-pool.h |  2 ++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c b/drivers/net/ethernet/ti/k3-
>> cppi-desc-pool.c
>> index 05cc7aab1ec8..fe8203c05731 100644
>> --- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
>> +++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
>> @@ -132,5 +132,17 @@ size_t k3_cppi_desc_pool_avail(struct
>> k3_cppi_desc_pool *pool)  }  EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_avail);
>>
>> +size_t k3_cppi_desc_pool_desc_size(struct k3_cppi_desc_pool *pool) {
>> +	return pool->desc_size;
> Don't you need to add NULL check on pool ptr since this function is exported?

Thanks for the review.
Absolutely, you're right.

>
>> +}
>> +EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_size);
>> +
>> +void *k3_cppi_desc_pool_cpuaddr(struct k3_cppi_desc_pool *pool) {
>> +	return pool->cpumem;
> Same here.
>
>> +}
>> +EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_cpuaddr);
>> +
>>   MODULE_LICENSE("GPL");
>>   MODULE_DESCRIPTION("TI K3 CPPI5 descriptors pool API"); diff --git
>> a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h b/drivers/net/ethernet/ti/k3-cppi-desc-
>> pool.h
>> index a7e3fa5e7b62..149d5579a5e2 100644
>> --- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
>> +++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
>> @@ -26,5 +26,7 @@ k3_cppi_desc_pool_dma2virt(struct k3_cppi_desc_pool
>> *pool, dma_addr_t dma);  void *k3_cppi_desc_pool_alloc(struct
>> k3_cppi_desc_pool *pool);  void k3_cppi_desc_pool_free(struct
>> k3_cppi_desc_pool *pool, void *addr);  size_t k3_cppi_desc_pool_avail(struct
>> k3_cppi_desc_pool *pool);
>> +size_t k3_cppi_desc_pool_desc_size(struct k3_cppi_desc_pool *pool);
>> +void *k3_cppi_desc_pool_cpuaddr(struct k3_cppi_desc_pool *pool);
>>
>>   #endif /* K3_CPPI_DESC_POOL_H_ */
>>
>> --
>> 2.37.3
>>



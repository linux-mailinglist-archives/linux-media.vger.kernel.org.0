Return-Path: <linux-media+bounces-8966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B065089EDB8
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 10:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32B66B21624
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 08:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F356154C00;
	Wed, 10 Apr 2024 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="luiGW5o5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFB6EAD0
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712738184; cv=none; b=WNPI5tUpQ5u7DmGzLYe9gUW3+NkhwvCuM1MdQtOJ7oys3SKqa9cglPGW/J4E8YF4olgQs80e9aq9dK3bHtdzUrH74tPNRoYbX/P31oU3FEUXnRO45f7JPATyBiZv6Ns6pEFrjUurJPAa0Y2VApZW9gdim9Az+sFcNrtcIJUzyWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712738184; c=relaxed/simple;
	bh=CHdAxLoBOGL9I5p8Ew8usJ4IwvLH18ZThFBDeQwsKf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u4KUmDNot4kh9MGvmn7Qn0XIG5szKxz4DbZhzhzYjnVSes9kmdzcSXLOleqOE+0o6UNq/ifZmC4kqR6Wd4Hz4Qx6+vfBJSFApRqfLOyGmRGuCRianK24NJeR4wQPbos9viT3g/t7uvL5C0ty+GBYqmFYmb+578AV6BY0y+lswfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=luiGW5o5; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516db2214e6so5366998e87.1
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 01:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712738180; x=1713342980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9442A62TET00hjBhezvrYLKwHX+oM+EzqcfF+cyAB4=;
        b=luiGW5o5J9NhDfsYt/Wxk8bc46+t6JG4OSiMlwDj8ptz8BuqRq7/Dn3DbH2B7tPlFi
         kGXKlUE4ZzSDetkQvr+ZZgoAvlwkfhdI13bLjK/AU1VMWrhvtxbdBh1NDe6ryMXeOQmx
         v+gN6n5UFbmQT+9VGklXqKbFjQjysncrRJWnHIlb8VAkGnroOx6rkfiBM16C4QcE21mG
         U/UcAxxw1sDGMrJShkNBI6V/jbo8PoaeYXOSSEuoUvBuxgUqMfh4YlHMPssRgEzRLi4W
         u1aF4PfCz/ES/xncEyNL6C+3PM0DBf3IbYQjRn4Chy3bfYeEJaK1aw0QM9PCrb2igIrT
         2X3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712738180; x=1713342980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9442A62TET00hjBhezvrYLKwHX+oM+EzqcfF+cyAB4=;
        b=QbEdKGjcqWqjjEoNWDufcfw1XOdZaIjGVHzJtLh9dRoGJ0g55/MsUpXjo38qEoHFIm
         2k02E9fiwoit3DCocrOmk591EdE0SySLAsNAGMKZISq+B7fJpWduEw30L8oj0WIwMdQG
         aasSl/OLNPCyxYrWJeUyidvaC6Wpl3Khu3NTtPwnbY1yacu4mrZfmqd4wbk33JIUkMRV
         jO3IG2DPcqKLeEo768bweCM2PZFuzzBATctVUwqHh5cfAM9UyyCLXhJ0Jc/Pr36UpfiE
         xhFVkavhEgp2Q9qNEoXbKyVSB6OqzKhCfv+DCF9DTn38HEntRuXJfLTkCDstqEHSWuUR
         lRkg==
X-Forwarded-Encrypted: i=1; AJvYcCXphg8kMvcJ31qUG6EJdZdV18Bw/BfSJskGbG36mHua/b1clRhAv7nQuDC0qsr7Gb1ifGSLU79/MZAIl0zEQm4YI+ksQJQsjf9iIjc=
X-Gm-Message-State: AOJu0YxZ+u2InrLdflhoRSZ7d85i4gzUvTaZXz0dbfGk6dsPu2GG8pFT
	6e1qUWMa+NMZ3M14hYf7qwe5WQxoOjkiX8Zil9lrWQQBRWf+7voZBSiAiW40Nqo=
X-Google-Smtp-Source: AGHT+IFjuM+EmbthlDbYjlSk1kmQ8trGtibZz10xcKh0nWxgzTalqLJgyFM1d4+Ue232gWWi76+xmw==
X-Received: by 2002:ac2:54a4:0:b0:516:c11a:4dbc with SMTP id w4-20020ac254a4000000b00516c11a4dbcmr981724lfk.22.1712738180088;
        Wed, 10 Apr 2024 01:36:20 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.74])
        by smtp.gmail.com with ESMTPSA id iv6-20020a05600c548600b00417bc4820acsm528157wmb.0.2024.04.10.01.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 01:36:19 -0700 (PDT)
Message-ID: <6f356fec-4384-4367-8812-a18b71156116@baylibre.com>
Date: Wed, 10 Apr 2024 10:36:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 2/3] net: ethernet: ti: Add desc_infos member
 to struct k3_cppi_desc_pool
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ratheesh Kannoth <rkannoth@marvell.com>,
 Naveen Mamindlapalli <naveenm@marvell.com>, danishanwar@ti.com,
 yuehaibing@huawei.com, rogerq@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v8-2-f3421b58da09@baylibre.com>
 <20240409173948.66abe6fa@kernel.org>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240409173948.66abe6fa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/10/24 02:39, Jakub Kicinski wrote:
> On Mon, 08 Apr 2024 11:38:03 +0200 Julien Panis wrote:
>>   		goto gen_pool_create_fail;
>>   	}
>>   
>> +	pool->desc_infos = kcalloc(pool->num_desc,
>> +				   sizeof(*pool->desc_infos), GFP_KERNEL);
>> +	if (!pool->desc_infos) {
>> +		ret = -ENOMEM;
>> +		dev_err(pool->dev,
>> +			"pool descriptor infos alloc failed %d\n", ret);
> Please don't add errors on mem alloc failures. They just bloat the
> kernel, there will be a rather large OOM splat in the logs if GFP_KERNEL
> allocation fails.
>
>> +		kfree_const(pool_name);
>> +		goto gen_pool_desc_infos_alloc_fail;
>> +	}
>> +
>>   	pool->gen_pool->name = pool_name;
> If you add the new allocation after this line, I think you wouldn't
> have to free pool_name under the if () explicitly.

Hello Jakub,

Thanks for these suggestions, I'll implement them in next version.

Also, about mem alloc failures, shouldn't we free 'pool' on kstrdup_const()
error at the beginning of k3_cppi_desc_pool_create_name() ?
I mean, it's not visible in my patch but I now wonder if this was done
properly even before I modify the file.

Currently, we have:
     pool_name = kstrdup_const(...)
     if (!pool_name)
         return ERR_PTR(ret);

Shouldnt we have instead:
     pool_name = kstrdup_const(...)
     if (!pool_name)
         goto gen_pool_create_fail;
(maybe label to be renamed)
...so that 'pool' can be freed before returning error.

Julien


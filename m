Return-Path: <linux-media+bounces-10818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7268BC4DA
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 02:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 143BD1F21C9C
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 00:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7052BA926;
	Mon,  6 May 2024 00:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="YJtQ3EPk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388051FA3
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 00:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714955363; cv=none; b=amdjZlEd9uL95Vqnf5g2KOPaeDxaJ7sXErt5CrwFAqbsQOnVPa+OHU/JWMRrp6C3xErnWb3HEBuRiFCTZetry3ymsafa6Egp4X0Lf+I9x/GJiYft9gQS64hlfSpFlZ+XdcLRoFIk0ziwrLEXCTjEUcIGUWp/byorKPVdZeq0SDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714955363; c=relaxed/simple;
	bh=7p83fI6SjhbSz9whdN8AjeYm5Iaq6UXmW/wjThWyv6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAWjX8293zTbaAmEyft0kizg66fM9t2PYfgBojhot8AeYJu5rnPMVdXiJ25kOIMOc9lnV/Y2Kj9J+A/w4kUc/db6GW5oO+X0b+hzEU/LUbFku2KuhsqLo1Ht6YWtz1pUXhNFPzU7I8EfvZMqTByqdzeIUDu/7LYKQhq6vY/hofI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=YJtQ3EPk; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2b273cbbdfdso973566a91.1
        for <linux-media@vger.kernel.org>; Sun, 05 May 2024 17:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1714955361; x=1715560161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sTixdwfAlIVssw/yTwe1uZ1trqj6K9Ho7zGTIsCsG3k=;
        b=YJtQ3EPk7IxrNvgo8weclRLgIUIWkSOI2Uep1o1M/rk9e0dB+mVfcDL2Ra/RKgbRaV
         4yD0nNAz17zHnC1JbqzasjATt3Y4kUqFfBfl4uDx/zyyAwmCgdWBqfnXG64JOZ3VVasD
         TpWrwpoJPMZ1aCGn4xBszZrjTzvv5gHLPW4FLW7M2xKyeRN3dmeqwv7P7Qzj6PulULEp
         iKKq9LW6PdJR11ebmc1NoRMdfQ6vYQYYHA7xQiZMqlhAGok5r3mf8gMd5KZKadxtoFqx
         EMNG1nXwcBwffehAbXoAJ9b4BN0JZNUl2iEcpz1iMRyOz+EEFNblqZD7QukB/0M0HXcx
         nJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714955361; x=1715560161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTixdwfAlIVssw/yTwe1uZ1trqj6K9Ho7zGTIsCsG3k=;
        b=F58Jf3eOXbcFP44OX1eTaVz9pxgaleCxj4SFeXXvvZQNEyeayR48ZzkOmg9AIEtCxG
         RArkp4YVtxvHEkC1UZNTI6LATrUtwe0AjP0Tu0a3/rOhj7LxiSzTMvuSSxFVzFElB+rd
         Jhv6c5rMMWmvESp6EDOQ9tfVBsaIHe71ov2qGfX2zsnyBI2Hv9tIpuGrQ1OABgn1Ma0S
         hJ72nllbIgahormRG03z0gdGyHnqTbpEmGz/hZhCJabpt72h2Ye7x9BWDzeCV+iTtmrn
         EsXqTCaHUgI0eKC5IYzgFbRDYiaxAnhToXOiYgVlDwB2Z7KgfPACSoxs2QfEbjYjnMUa
         2zMA==
X-Forwarded-Encrypted: i=1; AJvYcCXAlC+ep/zj9wdWEv4cSboBSq2a4dG+x5yGK2RYUGa83Cwksxs4piBuUojOvDZWR703UBsRGGV98edtUiHuwSkHgRTOcwrs+31m0EY=
X-Gm-Message-State: AOJu0YzTQeNRBvYLBXhA9tUn2lQT9/MU+oUbmgFONJtT2Lp24FYPbEaG
	ZaR/omSULqABZHV/ScIX5BCO3AMuSm37oTipfgh9LUN24BMEtLFXFKOZIVb9Lws=
X-Google-Smtp-Source: AGHT+IFapiyynwMzWBFC3qoHSlJe6Vp0gcSIQLTrnjL4T2m4HyoHAt77UaMOEYoyby7VMZX56YX6rQ==
X-Received: by 2002:a17:90a:d30a:b0:2aa:c2ba:3758 with SMTP id p10-20020a17090ad30a00b002aac2ba3758mr8212757pju.42.1714955361360;
        Sun, 05 May 2024 17:29:21 -0700 (PDT)
Received: from [192.168.1.15] (174-21-160-85.tukw.qwest.net. [174.21.160.85])
        by smtp.gmail.com with ESMTPSA id h4-20020a17090a710400b002b1314ba8c0sm8708252pjk.57.2024.05.05.17.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 May 2024 17:29:20 -0700 (PDT)
Message-ID: <306cf793-6f96-4a22-aca0-53c0ccefc0a1@davidwei.uk>
Date: Sun, 5 May 2024 17:29:18 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 07/14] page_pool: devmem support
Content-Language: en-GB
To: Christoph Hellwig <hch@infradead.org>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Christian Brauner <brauner@kernel.org>,
 Simon Horman <horms@kernel.org>, David Howells <dhowells@redhat.com>,
 Florian Westphal <fw@strlen.de>, Yunsheng Lin <linyunsheng@huawei.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>,
 Arseniy Krasnov <avkrasnov@salutedevices.com>,
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Johannes Berg <johannes.berg@intel.com>, Abel Wu <wuyun.abel@bytedance.com>,
 Breno Leitao <leitao@debian.org>, Pavel Begunkov <asml.silence@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-8-almasrymina@google.com>
 <8357256a-f0e9-4640-8fec-23341fc607db@davidwei.uk>
 <ZjH1hO8qJgOqNKub@infradead.org>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <ZjH1hO8qJgOqNKub@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-05-01 00:55, Christoph Hellwig wrote:
> On Fri, Apr 26, 2024 at 05:17:52PM -0700, David Wei wrote:
>> On 2024-04-02 5:20 pm, Mina Almasry wrote:
>>> @@ -69,20 +106,26 @@ net_iov_binding(const struct net_iov *niov)
>>>   */
>>>  typedef unsigned long __bitwise netmem_ref;
>>>  
>>> +static inline bool netmem_is_net_iov(const netmem_ref netmem)
>>> +{
>>> +#if defined(CONFIG_PAGE_POOL) && defined(CONFIG_DMA_SHARED_BUFFER)
>>
>> I am guessing you added this to try and speed up the fast path? It's
>> overly restrictive for us since we do not need dmabuf necessarily. I
>> spent a bit too much time wondering why things aren't working only to
>> find this :(
> 
> So what else do you need?  I was assured last round that nothing but
> dmabuf and potentially the huge page case (that really just is the page
> provider) would get added.

I'm using userspace memory so having this gated behind
CONFIG_DMA_SHARED_BUFFER doesn't make sense for us.

> 
>>
> ---end quoted text---


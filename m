Return-Path: <linux-media+bounces-11630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5348C91F4
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2024 20:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C758B1F21D0B
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2024 18:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866E060DEE;
	Sat, 18 May 2024 18:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="eR1BZGWi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6313C53E32
	for <linux-media@vger.kernel.org>; Sat, 18 May 2024 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716057975; cv=none; b=JCxjRRm6WimbkM0tcnlM8jqtfDAZArVLen8LAzle342E2SBMrtSDu4ETvi00uQz6uK+CqapRO89qxhs02bL7ZTZSTTjO0UBxD3B5PVSctJ89b8xsxyYKg0SepZ/mRXrqaR75M507RZVyCoIsIyibVPhUOhf58Eg0OYdDATifMls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716057975; c=relaxed/simple;
	bh=zQdyUAfqyEGFQFtZHOsOkjixcTwdwCIOHdjVrBr5h0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HC50UzXIqALrbZi/CxgZPF3ByEvgTx5SNzu66njQawSiyjbLoPyMFMc1g68idq8jDWR6Y9/zyIvw3zHokPSGedt03qA4/AN0YIb3WawB6l/Mk+bLMFCljUDsGtQ89BxX6n5mxpmxLYUjyluLMSVFuRQVz4WFnknvIZZZFTroKQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=eR1BZGWi; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f69422c090so437205b3a.2
        for <linux-media@vger.kernel.org>; Sat, 18 May 2024 11:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1716057973; x=1716662773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtghe09oJ6h1zM6r9/hcuib2w+0SfFSyUIep5UEjz/8=;
        b=eR1BZGWiXUpu2rNKW2Dg0cebePtcPzqYX2u5sAFvIGD+F4YpaI4u3yxUrMF+gvTohG
         affruCAaUkXyjjMKkYm2juD+Qy8Su66gtY7GTZSw/0NV8Lp5VsnFW5Eeuy9jLGUqnduO
         sfBEHdUFPniJ+ymxgStYAf3knUbYbu13wMvCjt/gGpJUao1H7fIMRVoIo3Zdk0e1j7Jk
         gGrny5nnCtrzU5wwSTUSnMoslxlmwQHgozR5HStBaLReUsSSObFhENpDWdzmADxItp1p
         prY4wfdoqXZl+zZLTNCR26qlRpJN3t4e0Nz2ujcdkegRJyydgbisxR10yo8UJA7lcKKl
         M0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716057973; x=1716662773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtghe09oJ6h1zM6r9/hcuib2w+0SfFSyUIep5UEjz/8=;
        b=PtA0Fagj2OMuJCAm20SxnqbQuXB4OT28EVWtsQXXxjgBYmc4UCacMSNQ5CzKijbjOm
         Sb21Xp/dnOIimbGViAEQtd274j9jkUk8rq0mErE8ugg9Xhxlr8JYasptyKh4skzOYxDJ
         vy5c4n4Eu/qcjSRyZeOZZZrVDIgIeDMvSnaw7WfxHE9jWmyCHOlFO6iYXIol3som61+Z
         vAOps4IR1oGV5c7ASIIVwZwD/1Og3SglTTsLU5iZsjTQrhEuc/9UfvRf+QDtDlQLyRgp
         AD6sQyAueSWMwZi1ACP9bRqLP44e3Xrc7tdGkBXsLxe0xrvtSXxTibPElHKxOzv+W8Yc
         ZLPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4uZVhuNdnEdhwqA9mEPmtvmwYlDRyL640cYecKRnVe1/RaQ0xHcK5Eo587fJ2vPD2LlKpVfe97wpgUkSGKo6xnYMBtC2RSqpk3/Q=
X-Gm-Message-State: AOJu0Yw7HM/RooibK8aUU6mqwHPBHGJWy+nfe8qTKS9i3LWdb2T1EZnd
	PuA3PcP5XcQuYLz4p4awiQD62t4uoNzhF1lqsDsadUHxoN0v16/SK8iXj9Dqp1c=
X-Google-Smtp-Source: AGHT+IGg0S5X0hOpYwIoBA7prkwh880WzDoU3RkbOFeT/k39JSwrbImT1CJOj9wyUMDIZCVhykRgQw==
X-Received: by 2002:a05:6a00:1988:b0:6f3:8468:f9d1 with SMTP id d2e1a72fcca58-6f4e02c7d62mr28356985b3a.14.1716057972513;
        Sat, 18 May 2024 11:46:12 -0700 (PDT)
Received: from [192.168.1.16] (174-21-188-197.tukw.qwest.net. [174.21.188.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a6656esm16665141b3a.38.2024.05.18.11.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 May 2024 11:46:11 -0700 (PDT)
Message-ID: <d85f4ba4-774f-4577-985f-45a5a1866da7@davidwei.uk>
Date: Sat, 18 May 2024 11:46:09 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 04/14] netdev: support binding dma-buf to
 netdevice
Content-Language: en-GB
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240510232128.1105145-1-almasrymina@google.com>
 <20240510232128.1105145-5-almasrymina@google.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240510232128.1105145-5-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-05-10 16:21, Mina Almasry wrote:
> +void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
> +{
> +	struct netdev_rx_queue *rxq;
> +	unsigned long xa_idx;
> +	unsigned int rxq_idx;
> +
> +	if (!binding)
> +		return;
> +
> +	if (binding->list.next)
> +		list_del(&binding->list);
> +
> +	xa_for_each(&binding->bound_rxq_list, xa_idx, rxq) {
> +		if (rxq->mp_params.mp_priv == binding) {
> +			/* We hold the rtnl_lock while binding/unbinding
> +			 * dma-buf, so we can't race with another thread that
> +			 * is also modifying this value. However, the page_pool
> +			 * may read this config while it's creating its
> +			 * rx-queues. WRITE_ONCE() here to match the
> +			 * READ_ONCE() in the page_pool.
> +			 */
> +			WRITE_ONCE(rxq->mp_params.mp_ops, NULL);
> +			WRITE_ONCE(rxq->mp_params.mp_priv, NULL);
> +
> +			rxq_idx = get_netdev_rx_queue_index(rxq);
> +
> +			netdev_rx_queue_restart(binding->dev, rxq_idx);

What if netdev_rx_queue_restart() fails? Depending on where it failed, a
queue might still be filled from struct net_devmem_dmabuf_binding. This
is one downside of the current situation with netdev_rx_queue_restart()
needing to do allocations each time.

Perhaps a full reset if individual queue restart fails?



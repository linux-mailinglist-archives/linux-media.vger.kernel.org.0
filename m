Return-Path: <linux-media+bounces-6531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDD8872CC8
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 03:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8327FB26C77
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 02:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58B412E68;
	Wed,  6 Mar 2024 02:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="tXzN2w3m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AAED530
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 02:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709692137; cv=none; b=SjCkmFX3jLi9y6Vtz1Y4a5l5gEJSA0l+una4IeK04k4C8EuiUlbyljKNzW4l5EJ2eSPxMu0cHmck1Pf4dHLqjilxcYN9nLNXssTM+sE35i1jDFDA3Qz9vT2p2HvWrzwXHhW3GEMviIM8lqdGwMgo2TLtIgGW+K+yPz6Yf3ZF66s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709692137; c=relaxed/simple;
	bh=m/4/IJpnreuZGBCjDFZuh5CJChe0Zp0mf+/fUUyVNyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4qc9ryw0zxLu71TYErVa03pId6e7JK9iUfFc0tvMgcXrqZWOoviePbXgeM6l7GuzWIniBvTj+5EL+ZV/aRIz9v9nQOPsImsBs6xQSTidJnZ0ValWmt737tvk+zSO+ZcdWloC119UPGIRz4RPLVF2JwpdjZMa5IlmLZe0rqJrYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=tXzN2w3m; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-21edca2a89dso254017fac.3
        for <linux-media@vger.kernel.org>; Tue, 05 Mar 2024 18:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1709692133; x=1710296933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n9CloCqaM+25WoaR2YknpneBnZb2s33DuZ5EXKAJgUk=;
        b=tXzN2w3mIA42+kxiYmI+IfLVus4l/QCyp13ANiYCaN2AX0ORMGh8eFZyBZrHwi5+ui
         zNdIkjkiBk4A/hgNMWzvhoZCVZgub5eQsDzmq3IH7LIsjQRrvMfh2CRMGVf8ialf+Rus
         nghzApmYQfTLUlMYRSXbb4x6B6akvEuK4rNb6WwQoK4aLQOK0EG+oA4Ab7xlOOeaibDg
         nJSUHhZ9ODRVCyFEvPMgBTKDGO9DRMtkgCfGe4EIFAsUKHZm1wpITxZLA3udaKd58MVY
         6IouXTOA0w+XUEzqhiMWwJtLgVug5qR8dVcL0sonjarAz3MYOIYP8a1XnRJ4sV8i2/vC
         ncEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709692133; x=1710296933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n9CloCqaM+25WoaR2YknpneBnZb2s33DuZ5EXKAJgUk=;
        b=AwEoefRFILyitWMUJTHneiF6aMzjIGr8H81xzokhUpX3daAdSB8RVveD4exUq3RF4f
         9SEpqHS0ysnxS0vxlTkvJmvdW6z2DEUk8lXH+WvG6ha7mrnWyuLbJbASFVQZVsqAoloU
         R3gUlb2HYthcPrOupWyN6fo41JTaRJCy66V9zOy3eSctIIOp82azQJYIYIA8eUgKGjKu
         8Rg8UxZnbl5cBINN0ha5oI1YjbxnM2gciP5xiJxfq4jttQl1LrdgH/77zerzVMCQdT+G
         v3tE4ngRLTvsMcA/drhXXd9DZAIFNJHoFW5ZPOqBV8R+9omQ+t7FUlpSw7jlSiyZMAjs
         S1lw==
X-Forwarded-Encrypted: i=1; AJvYcCVCbGvAVKJ+k/TZrBLp7Bf+x6Zq+znD810Jquoly7JZXb88uxE6kVF9YjnpH+I1WU14XGsItab0rn0fyZUofpBss/8/b9541XlG5Tw=
X-Gm-Message-State: AOJu0Yy54n3sbBkSyTuo5kB+SIdnPlL8OvV+0vNtF1g78VpjgZZiXL55
	naU99CG3wytgu5oAdQZEsmPZ+eWBkdb4+5gAUgwzMyEmHE8tMo0Hbz/bNjJLpmY=
X-Google-Smtp-Source: AGHT+IHKixed8Mkgk+0mpRfXfdBzYVdPnWZ0ptxrRYAk7Gk8YnML1zfyWGAr7RcPhYJE96tLslzelg==
X-Received: by 2002:a05:6870:1786:b0:220:8d17:6ebd with SMTP id r6-20020a056870178600b002208d176ebdmr3863595oae.42.1709692133363;
        Tue, 05 Mar 2024 18:28:53 -0800 (PST)
Received: from [192.168.1.24] (71-212-18-124.tukw.qwest.net. [71.212.18.124])
        by smtp.gmail.com with ESMTPSA id x35-20020a056a0018a300b006e5bdc19842sm7873904pfh.73.2024.03.05.18.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 18:28:52 -0800 (PST)
Message-ID: <383c4870-167f-4123-bbf3-928db1463e01@davidwei.uk>
Date: Tue, 5 Mar 2024 18:28:51 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v6 09/15] memory-provider: dmabuf devmem
 memory provider
Content-Language: en-GB
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
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
 Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-10-almasrymina@google.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240305020153.2787423-10-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-03-04 18:01, Mina Almasry wrote:
> +	if (pool->p.queue)
> +		binding = READ_ONCE(pool->p.queue->binding);
> +
> +	if (binding) {
> +		pool->mp_ops = &dmabuf_devmem_ops;
> +		pool->mp_priv = binding;
> +	}

This is specific to TCP devmem. For ZC Rx we will need something more
generic to let us pass our own memory provider backend down to the page
pool.

What about storing ops and priv void ptr in struct netdev_rx_queue
instead? Then we can both use it.


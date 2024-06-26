Return-Path: <linux-media+bounces-14172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F35917F53
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 13:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 597181C224CB
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 11:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC3A17E918;
	Wed, 26 Jun 2024 11:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="h9AVUdF8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E06217D8AA
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719400478; cv=none; b=VBtr03FS9B7jNYHNEiUfUALJYY/G/O2MHUUiv1skrr9a0RlN77h5EELGwmnSfPMshXtYbzJ5qaekkuL7vDMj7C3IqIe4jpN5lEWr+9HvQZUloAqsPtrJzJ3mEwGkfy15oMv4wGl9E3FXxci04yXhRvxvwuTlU09spdwxNYw8obQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719400478; c=relaxed/simple;
	bh=QxJ6Ryg0MTGf1ol2NkihM25bbyjZ46x5noyiSJpXA5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEjpldHsxa3YV/kDQ1S9rE6qa5qy/vcXxUy2mn7QUxbKdmRNBAFotb9kZWKs0/E5Kx/gQ1JKytgWYhRsEGu0sXfCumGNbh+q6+kGngmbKI3py+27Bc9Zr5jpbao/iZy3RE9NiWu9irSiwphpmQ6XzihYj0X2sjq8RJPAyk8xncQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=h9AVUdF8; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57d280e2d5dso120597a12.1
        for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 04:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1719400474; x=1720005274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EtgNgXw4xx+u3otM9wLzx6tVvs8OZ+sqt5uPSGOj0/8=;
        b=h9AVUdF86aQFnEBTDVJTpNaUDe6H52Xsi9ulCPMSQ15LhujD6yb5M/hlENLB/cb4aW
         gZ1gCDP1MxZJWA+j/Q0Uv3CCL+guwnAv4v9l4RE3a8Wjfen4xDAqeO0m8I3tEdKfryQy
         l/pKWL5IHUKu0N/OMnnaM/iwp/Td9ZTTyt6eKtzUAdX8b+69YiMNwSFtjES5YopOr75q
         CrRK6Q0imqsrBaFJEJVNPTDdIGYSLkBxDCmMn6rIzltxTxwugjd1x37qjP1aYeRJ0Xs6
         Lzn6y1DE98I06KKNcim15PsRjsU5dTcpuFpGCEl3a4vwFIr+pcW8dVRYrM19zOO5eemK
         CzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719400474; x=1720005274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EtgNgXw4xx+u3otM9wLzx6tVvs8OZ+sqt5uPSGOj0/8=;
        b=JD8bM3xwt/NaZ72SMbqgs09AIeV/aT3av7KWZrodCD2S4BE/NL7eHPBO7uBpG3Rhkk
         S7r8f08KAVKbGZQSt1ZN7yE1hofNJm0omZKGAIyXK7IJ15iYu6UAeNZHtoGD8xhOD4nA
         w46xDRrg+u9Ylm0djJWOPwPS/p32mmrBV2czeridMiAqWU2VWbJnNlRSbPm7+aS7H0hR
         h9ahRCVl+KxZeIGBYhdgifoaXTNdnt3munLknBbVE2orXU7mY7PHSsX/Warg7gq9pyY3
         ExCUWZevR9aIMAOe/prbKjGnWa3f6COnk4ZXsE1gD66Hl8A11F3KucHoQbpmhTCgXlFw
         c3Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXw/hs6Bkfk83IhZUw226XtOMa6lSNaywDdu3VghCkYwmrTz/SM4cXeyQxZZbds7tVFs6PFGKqSYciv5cOMI1kMRE08k0T9bbRix/o=
X-Gm-Message-State: AOJu0YxwWbROouWEaU+L6JHWmcbdjyq8tbjb2Oa77x74KEuRAChwLwL9
	V3HnCLPgs/kDTPcVt3PIXwDqAND3nSjn75o+iM8Bm3ccHwwFyTmzt6rWUgkXKyg=
X-Google-Smtp-Source: AGHT+IGayyA9DDFhDYoFM+ga8k4lnKPETjVZJrjYalViZSne124FOI0Yd/seFB4YsVb6tDnNMrZMyg==
X-Received: by 2002:a50:d79e:0:b0:57d:101f:ae9f with SMTP id 4fb4d7f45d1cf-57d4bdc76c9mr6673624a12.33.1719400473452;
        Wed, 26 Jun 2024 04:14:33 -0700 (PDT)
Received: from [192.168.51.243] ([78.128.78.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303d7b26sm7088836a12.3.2024.06.26.04.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 04:14:33 -0700 (PDT)
Message-ID: <1d0483b9-13bc-426e-a57a-69044d5098c1@blackwall.org>
Date: Wed, 26 Jun 2024 14:14:23 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 11/13] net: add SO_DEVMEM_DONTNEED setsockopt
 to release RX frags
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
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240625195407.1922912-1-almasrymina@google.com>
 <20240625195407.1922912-12-almasrymina@google.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20240625195407.1922912-12-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2024 22:53, Mina Almasry wrote:
> Add an interface for the user to notify the kernel that it is done
> reading the devmem dmabuf frags returned as cmsg. The kernel will
> drop the reference on the frags to make them available for reuse.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
> 
> v10:
> - Fix leak of tokens (Nikolay).
> 
> v7:
> - Updated SO_DEVMEM_* uapi to use the next available entry (Arnd).
> 
> v6:
> - Squash in locking optimizations from edumazet@google.com. With his
>    changes we lock the xarray once per sock_devmem_dontneed operation
>    rather than once per frag.
> 
> Changes in v1:
> - devmemtoken -> dmabuf_token (David).
> - Use napi_pp_put_page() for refcounting (Yunsheng).
> - Fix build error with missing socket options on other asms.
> 
> ---
>   arch/alpha/include/uapi/asm/socket.h  |  1 +
>   arch/mips/include/uapi/asm/socket.h   |  1 +
>   arch/parisc/include/uapi/asm/socket.h |  1 +
>   arch/sparc/include/uapi/asm/socket.h  |  1 +
>   include/uapi/asm-generic/socket.h     |  1 +
>   include/uapi/linux/uio.h              |  4 ++
>   net/core/sock.c                       | 61 +++++++++++++++++++++++++++
>   7 files changed, 70 insertions(+)
> 

FWIW,
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>




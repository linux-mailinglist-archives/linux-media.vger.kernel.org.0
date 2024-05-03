Return-Path: <linux-media+bounces-10728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F9E8BB48F
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 22:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1756C1C23B1A
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 20:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96B6158DC5;
	Fri,  3 May 2024 20:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BXraE1Cg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C1A158D76
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 20:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714767060; cv=none; b=olnugxReGlyT6XpXDAQqCfXH5Lk8FA8Lrve5ILDCwpB2ceSJLsDPyjd8omkHpqftUANVxzS2nEFqN1KUvvrVwCXvrbfjBXaQTFJAIu0XRFvJuB3/hCnHRhjwPqOJ3cUZJTr8Wqt4M4yBWq3isy14UifDoxmSss5nBd/soiSI54U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714767060; c=relaxed/simple;
	bh=atCvgdMV0JNn9Qp/m9GZW6Z7D46Y3/r5gcCPjNPxDaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPegeWXAjnODJcEWry6V/ttkn3TkPhvhIKfHDOpNg/A9SPSKiSMxE5tJj8ig3ZzoYkQsOo0gRUaAOExFnCQwVD/u1agOgZPITE1j/4rzH4CM4i/hvRdTFsXYCC5R/hIExoikJtBGxX5WB8qfXhJ2wmPrQMfZxgVM31Jt/xJW/lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BXraE1Cg; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a4702457ccbso184966b.3
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 13:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714767056; x=1715371856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atCvgdMV0JNn9Qp/m9GZW6Z7D46Y3/r5gcCPjNPxDaY=;
        b=BXraE1Cgqyr5gr4R1yA5bOlellj2XeZR3ELw04tSwgwfVv7Tej6f7AujDIMDuINB9N
         q2nEFO9qOEOvh7HiQReLkvkWl9rakjWPl9SNFurQZQAs8DOlxuJjeYtxzcy6KEPNqqVf
         mwGAzmTZDZUQIyusOpqki566NwoJRymeYhZF0faPskN7YR9xUI8DTCq7DVLv/ZuGgRBy
         VfUrZztINEbwkYEdTK3UD6K5jJ2XqM612KvTehIfS51KV69MgrJejg+oDxSW3IlsJPsO
         jOH3BSBbOuyK5XYgLAnbMwFMEoHPp/g5j9BgwCfWSYACT8UAkV3w6IWQfdiM9MX4ard4
         eLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714767056; x=1715371856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atCvgdMV0JNn9Qp/m9GZW6Z7D46Y3/r5gcCPjNPxDaY=;
        b=VkimgsSn5WXiW7jP4DSm7UU8iYXyQXaDzq8c5uYp2OzHpqd0sX5OZPGYEPHE4FXsty
         aMjCsbPKO8R4IDANQ+std2+y3fyTXoGlAM6N87CwzIiquaeTP1xlvTTRccGadOLyUm6h
         bsA6x37TT0sdzOH/ASX1G3JkYTjJPDAuKP+skAfJDLDm6tQyG8eRuHrj6sOiOhctkpfw
         hQX/OSwF6q1VI2xwopAf6gT6w7nWOlPw0SUX2WsEq7sDNw7qsioOzohnVaE51m2K5+ad
         Azz7yDT6hoOkjH521Jr9214j6Yqukc7AL8JYNkDohteTHyEIBm7afP02C0bsL66zaord
         OFpw==
X-Forwarded-Encrypted: i=1; AJvYcCWimXBlmW736KCH00wrRfnUrs91SyvLLqLeE9VGxxWa2MYLlLIegx38wS1R6FF8WGmUtsEhzcwFaRLuHI7NKHM9M5fUEijZz8kwksw=
X-Gm-Message-State: AOJu0Yw+jdBajGDtf8E+S0FtQChTuOWp8PIYnLLYyRWSz/qpYkAoxFqB
	W9iZJAXUjbD29gxp+7++P2NFK04zgoOlueMqfJ9BPolfy8QQYlb4ZXc3mTRR8MMNt/bp0xtkZko
	O7l+GN7EJjop90q8tP68aawykHO7CgctXMfab
X-Google-Smtp-Source: AGHT+IGWuTH3tkleUzlLfpne/Dggcuo50hlED+Ywh+UOAOcbaWh6EvDDw4vd2uLlNQ7vtR/GRuLWEPXod8Vuv8D8Zd0=
X-Received: by 2002:a17:906:29d4:b0:a59:165f:87e6 with SMTP id
 y20-20020a17090629d400b00a59165f87e6mr2459058eje.48.1714767055895; Fri, 03
 May 2024 13:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-3-almasrymina@google.com> <ZjH1QaSSQ98mw158@infradead.org>
In-Reply-To: <ZjH1QaSSQ98mw158@infradead.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 3 May 2024 13:10:44 -0700
Message-ID: <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Amritha Nambiar <amritha.nambiar@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Christian Brauner <brauner@kernel.org>, Simon Horman <horms@kernel.org>, 
	David Howells <dhowells@redhat.com>, Florian Westphal <fw@strlen.de>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, 
	Aleksander Lobakin <aleksander.lobakin@intel.com>, Michael Lass <bevan@bi-co.net>, 
	Jiri Pirko <jiri@resnulli.us>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Richard Gobert <richardbgobert@gmail.com>, 
	Sridhar Samudrala <sridhar.samudrala@intel.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Johannes Berg <johannes.berg@intel.com>, Abel Wu <wuyun.abel@bytedance.com>, 
	Breno Leitao <leitao@debian.org>, Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the late reply.

On Wed, May 1, 2024 at 12:55=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> Still NAK to creating a=E2=85=BAbitrary hooks here.

Is the concern still that folks may be able to hook proprietary stuff
into this like you mentioned before[1]?

I don't see how that can be done as currently written. The page_pool
grabs the memory_provider_ops from the netdev_rx_queue struct managed
by core net stack and not really overridable by external modules. When
the netdev creates the page_pool, it gets the core-managed
netdev_rx_queue via something like __netif_get_rx_queue() and passes
that to page_pool_create().

We could make the memory_provider_ops even more opaque by only
allowing the device to only pass in the netdev + queue num to the
page_pool_create, and have the page_pool_create query the
netdev_rx_queue struct, to make sure we're getting the one managed by
core.

Long story short is that as currently written I think it's pretty much
impossible for someone to plug in a proprietary out-of-tree memory
provider using these hooks, and if desired I can change the code
slightly to make it even more difficult (but maybe that's pointless, I
don't think it's possible even in the current iteration). The only way
to get a memory_provider_ops in is to seek to merge it as part of the
kernel with community approval. Is there something I'm missing here?

> This should be a page or
> dmabuf pool and not an indirect call abstraction allowing random
> crap to hook into it.
>

What is the suggested fix here? I do something like:

cp net/core/page_pool.c net/core/dmabuf_pool.c

and then modify it such that the net stack maintains 2 page_pools?
There are a lot of cons to that:

1. Code duplication/maintenance (page_pool.c + dmabuf_pool.c will look
very similar).

2. The hooks enable more use cases than dmabuf_pool + standard pages.
In addition to those, I'm thinking of (but not working on):
a. Limited memory pools. I.e. a page_pool limited to a certain amount
of memory (for overcommited VMs).
b. dmabuf pools with GPU virtual addresses. Currently we seek to
support dmabuf memory where the virtual address is an offset into the
dmabuf for CPU access. For GPU memory accessible to the GPU we need
dmabuf memory where the virtual address is the GPU virtual address.

3. Support for multiple page_pools is actually more proprietary
friendly IMO. Currently the page_pool is internal to core. If we start
adding additional pools we need to have some uniform behavior between
all the pools so core can operate on memory that originated from any
one of them. In that case it becomes actually easier for someone to
develop an out of tree pool and use it from their out-of-tree driver
and as long as their out of tree page_pool behaves similarly enough to
the decided uniform behavior, it may be able to fool core into
thinking it's an in-tree pool...

[1] https://lore.kernel.org/linux-kernel/ZfegzB341oNc_Ocz@infradead.org/


--
Thanks,
Mina


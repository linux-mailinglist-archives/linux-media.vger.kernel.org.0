Return-Path: <linux-media+bounces-7645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 746818871FF
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 18:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 036FE1F2443E
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 17:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21BB60252;
	Fri, 22 Mar 2024 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NuAiMh/M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C365A5FDA8
	for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711129243; cv=none; b=RmQE5jEef/+wRS6SJ3sXnoZd/07SNbd0q4c3IxdwpnfU3tD3zRkCoMlBAwp5/qR1JqqGt9twF+OIZWmz6HloPePlHLq2ofp7Xxhzzn7zg6vtYxm8OHbLBQRwpaR8zLBWahZgqFGMeBgXq8aNvw4AHfN9C4Yar6nvhMCJgqVM29Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711129243; c=relaxed/simple;
	bh=7T0QYgj6Z0QWJ7WZghtr6Q0zZ77ROAwtyZEJQAtnJrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8FI7NXMr68e7sdpmDWAJjuCRtjZsOMfTE0XEMO4dxd9CCgsQ82NGEYJ/s+HsMqTIwr088rcABgZDsipBdcJFM+TtnDvhQpfEFVe10PMIth0+RdkXPs8Zt/h/Abfd8HwVanliuTqm1eRlajeoyPkSApL1xgCO+cGxGaKKJSypbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NuAiMh/M; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a450bedffdfso292961166b.3
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711129239; x=1711734039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YM4J2ObtCNq8IqrJeUkrlLZCafy3cmXh0Ri66R+dm4=;
        b=NuAiMh/MosGpuJph6/CXhnqgtnF7qTB4wgozIjMxlP7xwIMTBUkxGp7jiLeBJeNUA8
         uf3RbWvwApbMZFE+1zAiSE/rUFH1AmO4Inn/LeR4eLLIyJhCb6kAZF5e/IqWygoVbAS0
         YNddRISS5xPN/6moDsAN0RJLCFP7BYfwoyTBXRz81dPr4VwAGpuAx4kKX1ddy3i+i8J0
         GW8CtvhZyNMxHOAbds+zU9+r9Ux6hPYEAFI7Xi+I0b4x9bRWTLPNpPCI2wo9BHwHpm54
         90xv2NndkuSs6tCPxxNLMeQMMbA9UkVREUUY00h8sSJNFZUydz03W+30nass1/Zv6OwQ
         wtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711129239; x=1711734039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YM4J2ObtCNq8IqrJeUkrlLZCafy3cmXh0Ri66R+dm4=;
        b=oTv4Dgtr5k6B4pZZhUuG1n9WQGGXk2UOs615FO3tJ+zMy8lrf+2zvSn843lIqVbBmD
         WCjiCWh+shsSbf6iPL4CqRes8991KSHk2RSQMz1/VBkRHzHuZ6zX/mDqGhKdcRVJ+qO1
         go6BC5+cgYi59SQGluURCcBbwZYGaR9bwBFB6sS+bWMaK19dhsNEmYMpnSRhZYWwyA4L
         cgFguIZlXfM7WKIW5GZQixoEqvfqM/cMW5G8QPLnn6UNE1nFGQtpvKhLwGm4BiPuSpLE
         N3idIZOB+N2SDHZjcFUU5WeLt1Tzbmqi7iAbjv5mdlAGM6bj4b0318h/KHv04+6jy4B0
         cYxA==
X-Forwarded-Encrypted: i=1; AJvYcCVDzXjvq/WzMmJd7ijFxl9xjIaTs73Uvrn+T6PTLxQ7CJK+fLz7CLHrYlrEkU1xiRqMn6oHsuaklXk8BJ/575FB580fopt9BjZZ3jc=
X-Gm-Message-State: AOJu0YynySjF57RJ5sD5Wh30qvzFlkfFg1SWtTvtkV+vZcBNei43//eJ
	Fz+hxV481noE6Rr7zgnCsGeSU99/lsY0YfWE1BIaU4TkBPpY0HWIRQqbcIVG/C3lL+71x5kXaJ3
	WYe3hvCfby5SO09kkw7Su8OQfS6sSUN3OHrDW
X-Google-Smtp-Source: AGHT+IH25NX6qQBoFnVnA4psBCYCRYBaiXOTPUtbfU8ggcYNeDelzQNuP6wH36Jj0kmkf8kYIMZ+vwfa54Dm4tCqR3s=
X-Received: by 2002:a17:906:c2d4:b0:a46:befa:f0b0 with SMTP id
 ch20-20020a170906c2d400b00a46befaf0b0mr293662ejb.45.1711129238808; Fri, 22
 Mar 2024 10:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com> <ZfegzB341oNc_Ocz@infradead.org>
 <b938514c-61cc-41e6-b592-1003b8deccae@davidwei.uk> <ZfjMopBl27-7asBc@infradead.org>
In-Reply-To: <ZfjMopBl27-7asBc@infradead.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 22 Mar 2024 10:40:26 -0700
Message-ID: <CAHS8izMT1Smz6UWu2uwAQRqgZPU7jTfS3GKiA_sDw9KLqoP-JA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>
Cc: David Wei <dw@davidwei.uk>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
	Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

Sorry for the late reply, I've been out for a few days.

On Mon, Mar 18, 2024 at 4:22=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Sun, Mar 17, 2024 at 07:49:43PM -0700, David Wei wrote:
> > I'm working on a similar proposal for zero copy Rx but to host memory
> > and depend on this memory provider API.
>
> How do you need a different provider for that vs just udmabuf?
>

This was discussed on the io_uring ZC RFC in one of the earliest RFCs.
Here is a link to Pavel's response:

https://patchwork.kernel.org/project/netdevbpf/patch/20231106024413.2801438=
-6-almasrymina@google.com/#25589471

The UAPI of wrapping io_uring memory into a udmabuf just to use it
with devmem TCP only for the user to have to unwrap it is undesirable
to him.

> > Jakub also designed this API for hugepages too IIRC. Basically there's
> > going to be at least three fancy ways of providing pages (one of which
> > isn't actually pages, hence the merged netmem_t series) to drivers.
>
> How do hugepages different from a normal page allocation?  They should
> just a different ordered passed to the page allocator.
>

Yes, that's more-or-less what's what the hugepage memory provider
Jakub proposed does. The memory provider would allocate a hugepage and
hold a reference to it. Then when the page_pool needs a page, it would
allocate a PAGE_SIZE page from said hugepage region and provide it to
the page_pool, and the pool back to the driver. This allows the
hugepages to work without the page_pool and driver to be hugepage
aware and to insert huge page specific processing in it.

Other designs for this hugepage use case are possible, I'm just
describing Jakub's idea for it as a potential use-case for these
hooks. For example technically the page_pool at the moment does
support non-0 order allocations, but most drivers simply set the order
to 0 and use the page pool only for PAGE_SIZE allocations. An
alternative design could be to use this support in the page pool, but
that requires every driver to adopt this rather than a core networking
change that can apply transparently (to a large extent) to all
page_pool drivers.

--=20
Thanks,
Mina


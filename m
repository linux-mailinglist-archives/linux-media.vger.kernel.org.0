Return-Path: <linux-media+bounces-14877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DC892D92A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 21:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFE1E28AEF9
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 19:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FF3198845;
	Wed, 10 Jul 2024 19:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OqZsEAaa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E12197A97
	for <linux-media@vger.kernel.org>; Wed, 10 Jul 2024 19:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720639813; cv=none; b=jUmbZxzILYjJdlxKJLtaCRu6qSLN6m3iKjUx6uLLpwj27WFU+1ULPJ+DYcDZ7ECBAj2Xsi+4GymeCnlmLhP3p+XM3f1AenGkq7fA5Ak3Yzy0jONCMNTchB9uhUVp9ZlvpyAuT0v0SCgmfgar4BjddXJadIJMMAvEmOT3iWhyaN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720639813; c=relaxed/simple;
	bh=vBkDVZIJ1rRSVbjZ4GxH5dqIovbWI6t7z6ZQdTM1ZJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJF9B1f4n/13DBYqMEw4fGlohQ1HApWFq1ta0r2l6gjNrP6QIatZFW3lGXKME77nD2kvy8/5IAOaK+pxkxHAfoDSqEJ5s79LfvB/MGw/pF2WYhGcFDJvilaHiA7zA1DRRaD5OBvTGzGgohiBUG1adsCE6DFDSWgiDXm1evKBZac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OqZsEAaa; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6b5eb69e04cso1015916d6.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jul 2024 12:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720639810; x=1721244610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TF9673pSKaG/iNj3QtazN19JWkU+6gU585Ojo9AihIY=;
        b=OqZsEAaa1a5jqFMHFpslkD2j7n7HaqTLG7spVFgAz1qdJZ0JF6PyKAswzdU5e+XPfH
         yTTt3zL2Mn6yGX/rpyjU0PVv8HmynNWyXLmpTyE0oMvSbkn+mKaW+PTIdCyHMVx7CfJe
         voSJBUmeMcyAMOgs6Ch5+HIUt6LA7fItUtpKKtw6pqb3ejMSJITTd73AfzpNc68517c3
         lG7FyrM8M1LFAc6m4jWZEiLfJId7uhyvQ40Ggr/kQqtcXO4JZos+RYZLSd7GgscPB+kT
         uc4yfor3qNjc32CoYs0f/2oGgNRjl22iySaHo4HpSXKjb4ix1TMsUa+txl3wmrchMpHw
         wbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720639810; x=1721244610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TF9673pSKaG/iNj3QtazN19JWkU+6gU585Ojo9AihIY=;
        b=pMg8iyBPWanOAZwifOBgL84VqNE5z/NKECNoiSOChUKey9g7mgHycPcgqElCSUU0ig
         6/Hb60QFZJNbJ1/+XHkcd/0gAO+7AG13z81hc1eTVcCmWqOMPcXwT2151I2hXh83H0Ew
         av1HqTgX9fGorNSRMbOH9mO5gG2nQRmHLCUCm/UcTDW6t12DtNGw44JRW9vwogc2LM3M
         0ZX0nPOBpgyM39rH4TSnTikX0BAx+TetUmz7lsu1o++q7TeidP5IA9zqctMUjLxWyu/j
         auFt8qxz3gWdjx0v4y0SjLWsvOTWEjmmncFwCFntUtZFCET2zwZf6WpoFNBWQ8hr7lmi
         hi5g==
X-Forwarded-Encrypted: i=1; AJvYcCXHKtUBM/CzuaCoJHZ0HSO3mG6slTZWdyfCFhQyS+w+chaB73XiUpIg9K5EOgu40QP0SbtgyUPIdno+CyW4i9+k2pXkR9gxeWkLNM0=
X-Gm-Message-State: AOJu0Yy5GjMmvBWBVnWn43y2CzjkWK8mMa11a/vPI6SbSos+KEch/RYx
	40FEqdbAy9WnQkKtQ35f8xoxP5VoJaiZ02LgebnvcAX8X9ErwEzHFcXYkZ5n/goISBV1pGpZhvo
	A+HNzoARo3lpU/gEHK0sziCdpE8O/8FkTcfGa
X-Google-Smtp-Source: AGHT+IEMdp+uG7mJVElTTW/yEL8BYiZ2DRk3V7ywILd2rFJRrtwJG6ibX6vnK3fQMtsopMVC0v6jyUjKFfJoaAWAji4=
X-Received: by 2002:a05:6214:20a4:b0:6b5:34b:8c02 with SMTP id
 6a1803df08f44-6b61bcf32cbmr76578266d6.27.1720639809913; Wed, 10 Jul 2024
 12:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-5-almasrymina@google.com> <20240710093624.26d22f02@kernel.org>
In-Reply-To: <20240710093624.26d22f02@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 10 Jul 2024 12:29:58 -0700
Message-ID: <CAHS8izOoM3YfcQorLJXL4H+t2OL+oJ4fPP5ZBJRhnH5AxsUqfQ@mail.gmail.com>
Subject: Re: [PATCH net-next v16 04/13] netdev: netdevice devmem allocator
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 9:37=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 10 Jul 2024 00:17:37 +0000 Mina Almasry wrote:
> > +     net_devmem_dmabuf_binding_get(binding);
>
> Why does every iov need to hold a ref? pp holds a ref and does its own
> accounting, so it won't disappear unless all the pages are returned.

I guess it doesn't really need to, but this is the design/approach I
went with, and I actually prefer it a bit. The design is borrowed from
how struct dev_pagemap does this, IIRC. Every page allocated from the
pgmap holds a reference to the pgmap to ensure the pgmap doesn't go
away while some page that originated from it is out in the wild, and
similarly I did so in the binding here.

We could assume that the page_pool is accounting iovs for us, but that
is not always true, right? page_pool_return_page() disconnects a
netmem from the page_pool and AFAIU the page_pool can go away while
there is such a netmem still in use in the net stack. Currently this
can't happen with iovs because I currently don't support non-pp
refcounting for iovs (so they're always recyclable), but you have a
comment on the other patch asking why that works; depending on how we
converge on that conversation, the details of how the pp refcounting
could change.

It's nice to know that the binding refcounting will work regardless of
the details of how the pp refcounting works. IMHO having the binding
rely on the pp refcounting to ensure all the iovs are freed introduces
some fragility.

Additionally IMO the net_devmem_dmabuf_binding_get/put aren't so
expensive to want to optimize out, right? The allocation is a slow
path anyway and the fast path recycles netmem.

--
Thanks,
Mina


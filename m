Return-Path: <linux-media+bounces-15785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9C3947F73
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 18:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3C94B22BBB
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 16:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BAD15E5D2;
	Mon,  5 Aug 2024 16:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ooMfse3W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D9A15C13F
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 16:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722875652; cv=none; b=TOAu3G2o1WHzOYOpZ4WF9lTA8x2d6NB9Jc2ijVQXz0aEgyiGN/HekG6Yxt16XoEvkH7FnAdpn9R6aENRegpV5rQ+juW7aTb/gAE8LU8sCu8xkcanj/iZiTySsSjJl9vHElbbf7HkTjBLFtqD6+7hwodbaBVd5UeJftQaYJ921/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722875652; c=relaxed/simple;
	bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2ZkKvX3YGqusEVnEicc2qEERmCKGk34T2TOG6jgdOaUUy4Q9jAwz5mBAxU7gPcju0YcFjWEWXgYw52JR68ULh5J4jy/nct6VttZ7+KyCLbF6IaKfCfkgKmdZ8Dko/HbCaBaJk6RD6SoLF6xkJjN/qYCnqXu1/QEUX+ibo+aQcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ooMfse3W; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6b7a4668f1fso65310886d6.3
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2024 09:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722875649; x=1723480449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
        b=ooMfse3WVKfuxOLSSKdlcT9aqFqVw/RtyRXpOBsgOCTn9wKceQcM71mSUyFUCGbjdh
         26+ROdikowegVtjSUS4uWVUhtc95hLL23dlnWFj8cp65MVc4drKNIX9u43DWF2Bats8h
         t0heAI4eFDoxqmiGWoYtMgQD56gP+7qgIFOqzvLbDpke6iJR6YapJ+kA8HjUL+DyHiKy
         +7NkKP96kiTMdLcfY8EpRMfItKrh6siytmWkC/b0tGgiJkDeyeXjOqlFRgZJ9luyNyNG
         6FpewpnZhlzpQ9biBgMEY7x44yXFsfP3XIyl2lb1fAFA0jwMYwVdtCGFuyqF5RwPlBAL
         hg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722875649; x=1723480449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
        b=IO4Nhiru3b6ucgYz7LIMhepmX9vZExjdnq00PEGjAe/N2vLHzaBRyGzEP7DnVbIbDe
         z2kP/69YC68KCCTVbbDnZfonYOVf1EX1hbCNFx2MUHdfGYHG3IftXppEEb9RRhTHU4Al
         NpC6LBcOW3KYXmu1YT6VAQT6TUpu3Czc76cS/kmYDricLgWWeNovg34S3NdExkYYNmZD
         PhMbE93C3VNr8uFVzMO642RsovvAmP01wM1vbueDHznYkQfUi9L/vvA9ZeKokDYnzEE2
         NqHPNcJnRsjWa1O5eM0eoEHu9RORD2tZZ8/G0+hsjHXsFN/ixu4z9u6GZjiK0jVL5lo/
         6q7g==
X-Forwarded-Encrypted: i=1; AJvYcCWO/9xOAQ9OGbvMR4NWrnpb6zAPJH7nTlFHIW1MgpmHW3wEz0cE0IwcaoH0e3pqhtKBE7Sbxbcn4AOd2JaTMzkaKSwXSNfDKFLDCFQ=
X-Gm-Message-State: AOJu0YyWkyQviUx1eQJau6Wk3bLUARmCaV19JeV/YZfJtTaiTQWMHOUf
	TLGMuYWf2iQFuYFUTM/Sgzy+1QrO7XFzIBxsh1d5Z7E008Sgnnre53BqPoZgxusmnqZ9XZ82Sn4
	+Ez8OP+N6IqVCMyo7zRsg40pCrf15bpTliwA+
X-Google-Smtp-Source: AGHT+IE3X2dzKDTfvW579W1ONWZvzHmSuPdaFYmL6fjjzD5I45yXHVQPoF1XfHnvXWK/VzgEqMK+gXEJqks0i1Xyhdk=
X-Received: by 2002:a05:6214:4412:b0:6b5:7e97:7151 with SMTP id
 6a1803df08f44-6bb98345fa9mr131458736d6.17.1722875648824; Mon, 05 Aug 2024
 09:34:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730022623.98909-4-almasrymina@google.com> <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
In-Reply-To: <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 5 Aug 2024 12:33:55 -0400
Message-ID: <CAHS8izPxfCv1VMFBK1FahGTjVmUSSfrabgY5y6V+XtaszoHQ4w@mail.gmail.com>
Subject: Re: [PATCH net-next v17 03/14] netdev: support binding dma-buf to netdevice
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
	Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Christoph Hellwig <hch@infradead.org>, David Ahern <dsahern@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Helge Deller <deller@gmx.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Jakub Kicinski <kuba@kernel.org>, 
	"James E. J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jeroen de Borst <jeroendb@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Matt Turner <mattst88@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Paolo Abeni <pabeni@redhat.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Shailend Chand <shailend@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Taehee Yoo <ap420073@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Yunsheng Lin <linyunsheng@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 4:38=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/include/net/devmem.h
> > @@ -0,0 +1,115 @@
> =E2=80=A6
> > +#ifndef _NET_DEVMEM_H
> > +#define _NET_DEVMEM_H
> =E2=80=A6
>
> I suggest to omit leading underscores from such identifiers.
> https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+=
define+a+reserved+identifier
>

I was gonna apply this change, but I ack'd existing files and I find
that all of them include leading underscores, including some very
recently added files like net/core/page_pool_priv.h.

I would prefer to stick to existing conventions if that's OK, unless
there is widespread agreement to the contrary.

--=20
Thanks,
Mina


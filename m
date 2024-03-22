Return-Path: <linux-media+bounces-7647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 464E888724A
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 18:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53407B22F46
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 17:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB87C60BBA;
	Fri, 22 Mar 2024 17:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RzkND4Bm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A352D60BB9
	for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 17:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711130111; cv=none; b=cN0UR4vGCyo0/A/nEml6OPkZRJIvLGBBhVUhJ8UwCNu2k8ODcTAY7O365/FngZRbddSgAFBZy201SYuni5alcSea3AnyhqQ37ElM5I5RcSh1pofdNKN5/FtqsHdXNCU0s++2Sv0GYcfqd58wW1WJwejNAgdYxb40TAcypjDRKN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711130111; c=relaxed/simple;
	bh=l9m99BFxmTnLiVZTWH4IyJEQNsmy+RFkQO1mLY1L5IA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0gbBg7pEfjFqABBL+x9SQBpOPuRzVOxJLFEUBD4nQMRx0Ya28fA70a7/QAwQyqXuwWbgZJHGMKR7BIxZ2jUoua8m/ZCxgT4G03/qJxc0waJSHxR/Pt8yHBphdzUFT0yTjPV5boxKGTBpHBwTwODG/jX/r6pjh/HGirBTKsRtYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RzkND4Bm; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a46dec5d00cso319059266b.0
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 10:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711130107; x=1711734907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WuYhmNp304wILfLv6V/aQkHKFavalWMa0RSWXYvrPw=;
        b=RzkND4Bm4wkW3lvcEypkcxdmIg1Pc2XAJIPjja+0m+v/CoeclpPbx3S06/HnLsyDhQ
         IlE86J50GPqiQotibPDMSZcMLL/LCKx/nc/WNm03EtQrfCMtwRaAGvsZjG31wZg8unia
         yIO5LSMFoknJfUy3v6TCpywvoCOXS0ROpdyhSG4wgoLxD11Cmr7aC53NpjsGzJZtHEmz
         sA4xBR4biuHrpF47aakzjpmM+UJ+L8Q/7YjQryfz+gthJ09Xn0G6rQ7Edg5cBODxW7zj
         U24TMitp1pKP0upk5gxicw9rGF6SY9GuUwm96+GjbXB1pIgu8Q2a3SaUmr9e+3ce/QnJ
         wkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711130107; x=1711734907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WuYhmNp304wILfLv6V/aQkHKFavalWMa0RSWXYvrPw=;
        b=vCa8ulCMVL6AF66nCbwVr+HYDTgtRtnIHBisJP7K3w6Jzon29RIEvBNTR8/xnRnSZU
         dXcdyhuK9FEXiL4nz1EcafybmQ0ab8X6QUm+S+V69IYNdG6knZXOOVuHF+nE/ifzH199
         /9M8XcRyxLgBjy+2yiy1aCRbM/AjKTz8KqYIC/OcbublED6ceINvu8ug/4kfUGPU30b5
         LfSPD+fFOTyZCc1Co0YZ0JSJ0bfFyHcBe0qeDsmCjVrl+Lh+QsSFUHqvS3diwpNnMB7j
         8kGhMK0mIEuAvMj1vF05AVfg/2f+ahAGO2WkuUJ3VcD46PWa8bXA0XxT8KX55HXFFftE
         DrbA==
X-Forwarded-Encrypted: i=1; AJvYcCUzxNEiPBv0m3KWO27K/WAABQsSfTJs4Ttofj+LgKNb+QwkUFhNQY9z9KXUfauNHxGjoWPv+IJR2a2zCThqt51bFf9Iyy70tEO+7BU=
X-Gm-Message-State: AOJu0Yz055LEftj97+W1FAMjEBImaXkx/dm1dAHQAGP00h0E+OfRon/O
	tbEl89AKMA+HOZuRRn7leboVoK1fmSmLylLa/Puvfejsf5invzNUaHtGLkYhXMhbCSsm+17Plib
	V6a8VLu9RTq3giaRaaqwiHi3P6S23hTweObXf
X-Google-Smtp-Source: AGHT+IHTothcuqikFFrMs12/Yd8HwJZ8LnAxmbZMMmJb1jW1wBBEyord9u+K2tzA7reF5OIehczUR0R88m66zZf5tNs=
X-Received: by 2002:a17:906:d190:b0:a47:e62:4d72 with SMTP id
 c16-20020a170906d19000b00a470e624d72mr331556ejz.15.1711130106762; Fri, 22 Mar
 2024 10:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com> <ZfegzB341oNc_Ocz@infradead.org>
In-Reply-To: <ZfegzB341oNc_Ocz@infradead.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 22 Mar 2024 10:54:54 -0700
Message-ID: <CAHS8izOUi6qGp=LSQb_o5oph-EnhNOuhLkPSfbQRU3eniZvbdA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
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
	Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeelb@google.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 17, 2024 at 7:03=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Mon, Mar 04, 2024 at 06:01:37PM -0800, Mina Almasry wrote:
> > From: Jakub Kicinski <kuba@kernel.org>
> >
> > The page providers which try to reuse the same pages will
> > need to hold onto the ref, even if page gets released from
> > the pool - as in releasing the page from the pp just transfers
> > the "ownership" reference from pp to the provider, and provider
> > will wait for other references to be gone before feeding this
> > page back into the pool.
>
> The word hook always rings a giant warning bell for me, and looking into
> this series I am concerned indeed.
>
> The only provider provided here is the dma-buf one, and that basically
> is the only sensible one for the documented design.

Sorry I don't mean to argue but as David mentioned, there are some
plans in the works and ones not in the works to extend this to other
memory types. David mentioned io_uring & Jakub's huge page use cases
which may want to re-use this design. I have an additional one in
mind, which is extending devmem TCP for storage devices. Currently
storage devices do not support dmabuf and my understanding is that
it's very hard to do so, and NVMe uses pci_p2pdma instead. I wonder if
it's possible to extend devmem TCP in the future to support pci_p2pdma
to support nvme devices in the future.

Additionally I've been thinking about a use case of limiting the
amount of memory the net stack can use. Currently the page pool is
free to allocate as much memory as it wants from the buddy allocator.
This may be undesirable in very low memory setups such as overcommited
VMs. We can imagine a memory provider that allows allocation only if
the page_pool is below a certain limit. We can also imagine a memory
provider that preallocates memory and only uses that pinned pool. None
of these are in the works at the moment, but are examples of how this
can be (reasonably?) extended.

>  So instead of
> adding hooks that random proprietary crap can hook into,

To be completely honest I'm unsure how to design hooks for proprietary
code to hook into. I think that would be done on the basis of
EXPORTED_SYMBOL? We do not export these hooks, nor plan to at the
moment.

> why not hard
> code the dma buf provide and just use a flag?  That'll also avoid
> expensive indirect calls.
>

Thankfully the indirect calls do not seem to be an issue. We've been
able to hit 95% line rate with devmem TCP and I think the remaining 5%
are a bottleneck unrelated to the indirect calls. Page_pool benchmarks
show a very minor degradation in the fast path, so small it may be
just noise in the measurement (may!):

https://lore.kernel.org/netdev/20240305020153.2787423-1-almasrymina@google.=
com/T/#m1c308df9665724879947a345c4b1ec3b51ff6856

This is because the code path that does indirect allocations is the
slow path. The page_pool recycles netmem aggressively.

--=20
Thanks,
Mina


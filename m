Return-Path: <linux-media+bounces-16505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C7A957C29
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 06:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 095562821C0
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 04:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54816146592;
	Tue, 20 Aug 2024 04:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RvyK86HW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D82553E23
	for <linux-media@vger.kernel.org>; Tue, 20 Aug 2024 04:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724126479; cv=none; b=ex84VtvLqMVKzig/BUwHcNF6U/ynrr75/Px7NidfZBX2grNQEAg2T97Jq3vJfkQvsBNlGVBOcCnkWjtcPpJFwlHZTCtN19DC+5/oIHbWKtkdluuMryvnusxUkmO3gloKmyJY8zaBAoXK+4RJzqY47tKq2CkK/wE9vlGavbgu0bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724126479; c=relaxed/simple;
	bh=1NEjRuBY5BA17scWt+Chi0mbM4dw/JTo2pkLIZspGCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WqSFdiJUQwRvB7x2ghAwQiavEyigJsj37nCgZiWfYB6uu/w1PD8rZEGh8MDw2sYo+nsez8Svu2MrzlqWycPrQrLDt3tKWA2WLdHhzjddXJsY35lF+UK4W2QnXiOvBMKMmZOwo7nkcsIShzGPHT3yyhBbfDujkjzXkuLcXDOxczU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RvyK86HW; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e115c8aa51fso4921812276.1
        for <linux-media@vger.kernel.org>; Mon, 19 Aug 2024 21:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724126476; x=1724731276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91poigCWUpxkIrphB8LTAAUF4NvT94tKi0OG/MNIdXA=;
        b=RvyK86HWdzzlz1l0psp1w46bjiWWXvMg0YcTdoSNEgrs+TdZHmmzJ5xrfsolACmpZ8
         S7EFWBozbtXKWqonUo2BWJL4kjNl9xVxInLr/2JvEGtilxnIKNHRxFtL7R34cPqu59Mc
         /PoM+ey9SOz9NhMZAnfmgSG0CQUU2EtmMzPZWOfJz7/FRXPDkv5zIGeuXg9kcG+X4/54
         BpR3oRQPcQAJIK07lLsX16d6QkLLTCiTLuWACT1QN4UOGX72RBoih1L2Tok6bGFdUISG
         WvHNcjn7K3b/yq+brWoebGFnvSv/6gIIOxWQbExV2qgYyOdKKlvWVsgaTiYVLAc36MOO
         b90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724126476; x=1724731276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91poigCWUpxkIrphB8LTAAUF4NvT94tKi0OG/MNIdXA=;
        b=izM0ZypPqjppVWJ3gGU+K2HYulAw09BuaEllm9dQ/y7/g9djeMZOOBwZAw+LDe5QZB
         675rs1T78oI2Em4bq1ISLvhravYKFlc9grhXlAnTI86TCHJX+LHb8JjBSSxIYHL5qNpb
         qEEi6qSywpUOLva1cmyU5TN0ftXnBi8nOzkLN8K9oA83ssA1TgAOguF+wutpRvxApE2O
         rZUEZFf4h0IAa8qUB/eV4ZOvgHZsb4VPqr4k8LMRaWVH6G49doP+kRLRLmzjHU0jqwBj
         B2Px1ZoZViwOPjeL0mgxi064mJB1HKPp0Rjc+S011e+BtGuww6klHVOmrhGPqtOPP0lH
         SysQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgEvP4G0Y4fCVb9UF7L9oQmScwXF4xB+jQ3s32N/8LFQBvWykJE5hJAUUBe7es/Svp2rkDgH2VtJxsiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8vifx1qB2eeV7qj5fUG3k1FQYz05GoEXMO2D/q4i1y42UNLAc
	fEyLbqTt41ZipuiLueL/4uBIBEnXI8RVzu5UmZAjzDVzOf75AXueMlYBMWJ+BCx8hbj4XU/by4p
	oFvUx8lkOSSBylgYMfDrLA2TE1TGk2riF/cBN
X-Google-Smtp-Source: AGHT+IHL4a8LRpwayEoQ60nOlF+jCofnGmOL57d389F39z0O/Ch4wlx8nI+0Mq8+7YKwjKglCY5bW1U/rwrYO3XPVyM=
X-Received: by 2002:a05:6902:1b04:b0:e16:1ebf:2945 with SMTP id
 3f1490d57ef6-e161ebf2f84mr5591540276.27.1724126476152; Mon, 19 Aug 2024
 21:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813211317.3381180-4-almasrymina@google.com>
 <CAMArcTWWxjsg_zwS6waWkLpyHhwdXDm_NJeVGm_dr+eT5QDZiA@mail.gmail.com> <20240819155257.1148e869@kernel.org>
In-Reply-To: <20240819155257.1148e869@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 20 Aug 2024 00:01:02 -0400
Message-ID: <CAHS8izPL4YdqFjkTpYavdxQn816=kkUv0xravQJF4Uno7Bn3ZQ@mail.gmail.com>
Subject: Re: [PATCH net-next v19 03/13] netdev: support binding dma-buf to netdevice
To: Jakub Kicinski <kuba@kernel.org>
Cc: Taehee Yoo <ap420073@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 6:53=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 19 Aug 2024 00:44:27 +0900 Taehee Yoo wrote:
> > > @@ -9537,6 +9540,10 @@ static int dev_xdp_attach(struct net_device *d=
ev, struct netlink_ext_ack *extack
> > >                         NL_SET_ERR_MSG(extack, "Native and generic XD=
P can't be active at the same time");
> > >                         return -EEXIST;
> > >                 }
> > > +               if (dev_get_max_mp_channel(dev) !=3D -1) {
> > > +                       NL_SET_ERR_MSG(extack, "XDP can't be installe=
d on a netdev using memory providers");
> > > +                       return -EINVAL;
> > > +               }
> >
> > Should we consider virtual interfaces like bonding, bridge, etc?
> > Virtual interfaces as an upper interface of physical interfaces can
> > still install XDP prog.
> >
> > # ip link add bond0 type bond
> > # ip link set eth0 master bond0
> > # ip link set bond0 xdp pin /sys/fs/bpf/x/y
> > and
> > # ip link set bond0 xdpgeneric pin /sys/fs/bpf/x/y
> >
> > All virtual interfaces can install generic XDP prog.
> > The bonding interface can install native XDP prog.
>
> Good point. We may need some common helpers to place the checks for XDP.
> They are spread all over the place now.

Took a bit of a look here. Forgive me, I'm not that familiar with XDP
and virtual interfaces, so I'm a bit unsure what to do here.

For veth, it seems, the device behind the veth is stored in
veth_priv->peer, so it seems maybe a dev_get_max_mp_channel() check on
veth_priv->peer is the way to go to disable this for veth? I think we
need to do this check on creation of the veth and on the ndo_bpf of
veth.

For bonding, it seems we need to add mp channel check in bond_xdp_set,
and bond_enslave?

There are a few other drivers that define ndo_add_slave, seems a check
in br_add_slave is needed as well.

This seems like a potentially deep rabbit hole with a few checks to
add all of the place. Is this blocking the series? AFAICT if XDP fails
with mp-bound queues with a benign error, that seems fine to me; I
don't have a use case for memory providers + xdp yet. This should only
be blocking if someone can repro a very serious error (kernel crash)
or something with this combination.

I can try to add these checks locally and propose as a follow up
series. Let me know if I'm on the right track with figuring out how to
implement this, and, if you feel like it's blocking.

--=20
Thanks,
Mina


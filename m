Return-Path: <linux-media+bounces-14486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ECD91E81C
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 21:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDF291C2211A
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 19:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7985816F82C;
	Mon,  1 Jul 2024 19:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VUj8CS78"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3049A16F0F0
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 19:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719860461; cv=none; b=ttJfL1J+5gwnMjgSbOSguosSbOAuN4hjZo40InNvX8qRcl3v2rzbSmWUWiHdlMDooUwMrQZV3UKtHNWXh6M4A+2A+mYJr89Dl734rqIcQaKZE/vOyj0Icdh6HsWWnZTq+f/8FW6mh4HM6cWSV2chM6oFwh3gRTDv/lHmWNaGU0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719860461; c=relaxed/simple;
	bh=nBEjUU1jP0cTXpDAibWGkU5XKOL/L/nsa6YcOdFrVXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lk1nn8b3haEH8EcnnMr6SxRJT7fjBGR9wBTfmgMDKjzHnrHFAmEKEhie5/eJbMaA6cqzMMMnFGpTu93pKros5sxTczXl4Ut6Vbin6/9u1SXk3hRT8gbY3min5AuB4SXWAhwBk787zqxILvQW/r10ngE2Gbdrc8X8bFTMx2k27iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VUj8CS78; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-79d5e616e34so243822085a.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2024 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719860459; x=1720465259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4LpFR6VRPZBJqkm7iRXIp87VCy5+OyuBQMHBVpgrKc=;
        b=VUj8CS785cnwFWXu49a2yynTw9v5uBv7xV7sGzsKtbIvoTNL6XebeeShoCz1c7N9c6
         QOGHor2VqLzp0K1m3SZv/SBZFaz2CHuoZ8oXsw9KXCDQBvxqwRikiIBLCAwCxlrGz2/X
         hc5nYlLBRPdmRh7yHptNjyDMOkgHY7SjCvJS28YqP94iKO8zw4Mki7+1k4fCVqn2nprb
         AiEC6vWgc/hFEkSr2d8vF6MUm+f6Rooj1daMQNmskdu5fEMYG+P6YjIjLh3es+Yqqrz7
         2lha05Ab6XzuOpNcXnRqBElcdyOWL4r79CX5gf3ok4YE8CL5mfO8kfLJtqzYR8j0qAh1
         t3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719860459; x=1720465259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4LpFR6VRPZBJqkm7iRXIp87VCy5+OyuBQMHBVpgrKc=;
        b=B35bp0muv+eV1qX7JNDXxDkV+ca7EUTu7xAd5gTmzOETc4yy5S1qXW4XvjyC31B23Y
         YhHVAVcQqsW+JoHzGJvwE+v+vcbj688b2dOe3ybnvzGdRk8E0bsC2B4koZ9lnmPWFkIx
         eBt0qC9lDoCibY303Adz4Btou7lieY245R0OBT5l/wOCJdP/td06XoBuLTi0RkFXWoJC
         wguB/23ZXd2MtY3Qzb55II/bVw5h34nXsd3FAlp4sivWbmpfjCitTe9TGO/QuHvYroGN
         QwK619N8ec0pPz9V46Hycn4SwCC1fAS7MoTLf5pSxysTD8Wg1WgHbq0LRSyi35MfOAYO
         0VaA==
X-Forwarded-Encrypted: i=1; AJvYcCUuWbHXE+s9Py34kOdXwF13f9mEgU5fr7vwqqa/SzlBJKzXn5fhRnfLoCnsWAwK7dyyWO+5MnDvsR3fE7Tw6B3g2hRt5sWR9UxR/b4=
X-Gm-Message-State: AOJu0YzTm6WQuRZmhO9aW2QJSuSUPTINiTHXlskpH3drs70b+13fdBRd
	4CFe/8c1i7JIBcfBo6wiTl1lL/9MJpSLKEVlQg6edoREPgIF1yxGvotuxKyxgse+6O7078OWm0c
	FQL/rRyhXDEDMjoSKwJdYsElxwHxbJTe0/QEa
X-Google-Smtp-Source: AGHT+IHqGzU9tZFX9QqaBsD++nA7soWtr02PwwhDHubls3yJUOnaqW81EaDVu4zWNv2Iw9IsPTEVGjOAs2RkVILAwGg=
X-Received: by 2002:ad4:5c68:0:b0:6b5:4249:7c4 with SMTP id
 6a1803df08f44-6b5b7057b8emr78735846d6.2.1719860458778; Mon, 01 Jul 2024
 12:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-13-almasrymina@google.com> <m234oxcraf.fsf@gmail.com>
In-Reply-To: <m234oxcraf.fsf@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 1 Jul 2024 12:00:44 -0700
Message-ID: <CAHS8izOUJMnCxK0ZfOOOZH0auNF_Kk+WVA=oTEzJe8mYHdonfA@mail.gmail.com>
Subject: Re: [PATCH net-next v15 12/14] net: add devmem TCP documentation
To: Donald Hunter <donald.hunter@gmail.com>
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
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 3:10=E2=80=AFAM Donald Hunter <donald.hunter@gmail.=
com> wrote:
>
> Mina Almasry <almasrymina@google.com> writes:
> > +
> > +The user must bind a dmabuf to any number of RX queues on a given NIC =
using
> > +the netlink API::
> > +
> > +     /* Bind dmabuf to NIC RX queue 15 */
> > +     struct netdev_queue *queues;
> > +     queues =3D malloc(sizeof(*queues) * 1);
> > +
> > +     queues[0]._present.type =3D 1;
> > +     queues[0]._present.idx =3D 1;
> > +     queues[0].type =3D NETDEV_RX_QUEUE_TYPE_RX;
> > +     queues[0].idx =3D 15;
> > +
> > +     *ys =3D ynl_sock_create(&ynl_netdev_family, &yerr);
> > +
> > +     req =3D netdev_bind_rx_req_alloc();
> > +     netdev_bind_rx_req_set_ifindex(req, 1 /* ifindex */);
> > +     netdev_bind_rx_req_set_dmabuf_fd(req, dmabuf_fd);
> > +     __netdev_bind_rx_req_set_queues(req, queues, n_queue_index);
> > +
> > +     rsp =3D netdev_bind_rx(*ys, req);
> > +
> > +     dmabuf_id =3D rsp->dmabuf_id;
> > +
> > +
> > +The netlink API returns a dmabuf_id: a unique ID that refers to this d=
mabuf
> > +that has been bound.
>
> The docs don't mention the unbinding behaviour. Can you add the text
> from the commit message for patch 3 ?

Thanks, will do, if I end up sending another version of this with more
feedback. If this gets merged I'll follow up with a patch updating the
docs (there seems to be no other feedback at the moment).

--=20
Thanks,
Mina


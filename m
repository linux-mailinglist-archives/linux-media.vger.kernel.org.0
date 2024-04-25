Return-Path: <linux-media+bounces-10091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D04958B15E2
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 00:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47B4F1F2205F
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 22:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7CB15ECC7;
	Wed, 24 Apr 2024 22:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bgLn94E/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F8615EFB8
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 22:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713996680; cv=none; b=aT65GKMLK7WL7hlgJKrLyC6VfYg2PVfgooJUvP6JAX9LDTQEmdibu2JBVFWNbGqGC51e9z/RGV0PP0GkdAL14NC3aU1On0rpwZYmjQU8nSlQcpv2sqmUxfimDP131UB6hHe3b5a/EfgFLIVXJfb06LNz/zDGPB5JD2UaH5knDqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713996680; c=relaxed/simple;
	bh=pxhvcjOGdzqPJKU0g6cyW3p8OljKVeVIwlTbmM5Usw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYOVlDDXSrd7fvsP0NhHEYf7M8LpZto2mZ0ffFxQ7AkAOovB6JNfCLhlj5VzM9ADxEr8m2lPcqm8pwqvtYwNSoUPYbRgpjtY81ogXa/F6uJmv2nprgqYLfI/PlZl3oPTEcEZk7LymSKHkwSzh1nhyMkp4ydaaWlZB1nk2Nojlpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bgLn94E/; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51b09c3a111so458351e87.1
        for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713996677; x=1714601477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nrt9xX8+bezTu6PJtCUFo83NI4xccREO2afrxNR68uc=;
        b=bgLn94E/CBQ884LE+ijvvnf0wc5fCnOBsuVQwf0kdx5Tvu1MsMwCy/ZgLXEf+zLMzy
         Y507Bu7nMKmO0V1fYKsC7auy9IwFF0mRCuD0CtU2NdBuVX/7ke4VZCpXuPnu2jcqigmW
         1lNkpky8mr6qNJ76t2uOjHa+MK9zHbnfuXkn63hLgVaEqnd5IDrHwq7hgNSRMWrf9Dr3
         /ZBYM0OTowmJzbPzN0r9KMiLLRL06LRVo9PhZ47ZWi0o1ozpbHsShOnIxucAQ2z4p4wp
         GjMIJC99e7lgk0nAB7lCGi6BfmMDlIC9A+L8KwGYMM6cZT8U6+3B5TAvSabm+oC/eT+s
         Yf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713996677; x=1714601477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nrt9xX8+bezTu6PJtCUFo83NI4xccREO2afrxNR68uc=;
        b=Zc53YM4BZ5s1rrbvWvZ/HKe+lhO1HRAoTRmPujV1/CQ39Gjibw19oQwfsj+8NDzPtv
         p6bJqPAqfK3xR1MzcZpyIy7iSWM1qYUuOVMOPFyYc9HBDMmsHF+DsHv3s6GO9fZKydvu
         ue1Ska+fskIbqGArGS830F2zOX2UIvB1bsXhH1BuSfGPHTwSLK8IhMGLydR11hsHWNYc
         +3RuIhUrZjt3nvqV2EpJ/8vwmGtd4lZLG/4sQgHGiYEWq7GyUOtV8nJSSEVKckOEyMVn
         1MBXcTRMLM9kYa+HpzGyfv9L1ik7Fvbb7/8B3ScoD1TIbaGVjfEjpqeg9iaxNOZZN7LF
         GbAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZbY15Crm03DJretCROZpJBaQ8fx/lvKCly7IEwIFFul5zrxzE4W4nquId7avXP6fssu3VAXE3+RL9rhBzN9A4y85p5CRWf614rYA=
X-Gm-Message-State: AOJu0YxNephjevS0SyBmd4ttXGX59ZAi4E51IcjXNpwnrbPBgCxca82E
	+AH7VxyT9J2+PE29ekWz0qPY00/lLpGZoPZMG26jlnb5zlw9YWamq3P6CdxECGelSSU2S82gRf2
	lL+GNn47t7ALTYfsekizamWBDQxbAHOWywySw
X-Google-Smtp-Source: AGHT+IED2HbFEA0ewLNL7QH6VWfyVpE66498USZfd4zxtqZP/+CZ2KiwNYrpEZU2PM0GAlsCBDXy7oQT2HUG8Bnws0w=
X-Received: by 2002:a05:6512:1315:b0:51c:15fa:985 with SMTP id
 x21-20020a056512131500b0051c15fa0985mr1591764lfu.15.1713996676557; Wed, 24
 Apr 2024 15:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-5-almasrymina@google.com> <b30cb265-26ee-40f9-a25b-6c909e63fc79@davidwei.uk>
In-Reply-To: <b30cb265-26ee-40f9-a25b-6c909e63fc79@davidwei.uk>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 24 Apr 2024 15:11:04 -0700
Message-ID: <CAHS8izPf5ZnpUw9o6Oo-iTdoKkOEzerobP0Vkq7KZQOab2+_LQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v8 04/14] netdev: support binding dma-buf to netdevice
To: David Wei <dw@davidwei.uk>
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
	Breno Leitao <leitao@debian.org>, Pavel Begunkov <asml.silence@gmail.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 10:36=E2=80=AFAM David Wei <dw@davidwei.uk> wrote:
>
> On 2024-04-02 5:20 pm, Mina Almasry wrote:
> > +     /* We hold the rtnl_lock while binding/unbinding dma-buf, so we c=
an't
> > +      * race with another thread that is also modifying this value. Ho=
wever,
> > +      * the driver may read this config while it's creating its * rx-q=
ueues.
> > +      * WRITE_ONCE() here to match the READ_ONCE() in the driver.
> > +      */
> > +     WRITE_ONCE(rxq->mp_params.mp_priv, binding);
>
> Is the mp_ops update missing here?
>

I  do it in this patch, because it's the one that introduces mp_ops:
https://patchwork.kernel.org/project/netdevbpf/patch/20240403002053.2376017=
-9-almasrymina@google.com/


--=20
Thanks,
Mina


Return-Path: <linux-media+bounces-60156-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B2dGO3N9GkAFQIAu9opvQ
	(envelope-from <linux-media+bounces-60156-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:59:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFED4ADD50
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27FDE307362D
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 15:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734FD3D6696;
	Fri,  1 May 2026 15:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MMngYb3a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D586E3D7D91
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650885; cv=pass; b=dCxvLmcuVow8xQZsG+fUC6mZuUKYC5XxTgkQdb3U6/KjlqLQ7xIYyBNF1Z2TPtu3jo1FxUGzyum8YjQqUTWhNf3Sfqz1wXmr3dJIOEgI+D33u3ME/0qIHhXmbmJrrzqhZP1Dsz2wm+vWgF1Qsziz9bjtFT7CXDC4IqGanPfqHG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650885; c=relaxed/simple;
	bh=6F6wYU18yxg4ylsZFJ3NklBJq4gHY1P9YinU+KyOCWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWNgxRWqWNvdvwxIkZtY2QdIN/LHJU0ZR7vHo26Tq/NnYc8c4+xioefEqNcseKgfy+b8iI3dMv5ROTzwmjMvfotWNu8iQ6bmbTYTD88t+jO7jYaaRWh1ix3xDNkDECN+22pz4QX2mmH3LpVotVi0JGCvycuUJeZj7jCIxZGXQKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MMngYb3a; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso117925e9.0
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 08:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777650882; cv=none;
        d=google.com; s=arc-20240605;
        b=Ii41tmrrDdJIOMT+9hcNc6fYF/MNmNkmP1dGbnR3DDsaa924HITzg/WwihzKKoyQ3w
         kTFXRMNvCC+4a9UruSn7uz9nVjB7FrO6vLjoxcazNUYwhCliji66Uir/Foje5yMI3dcj
         DynFw0iDN1E673qmvI2fRjatiKMJHdCsW6om8EcAW7tWF8LKcivlSyoIKpHYhxNpdxyp
         n0Nx0Q24CRvqdy/uGGS3tuQMN9rIC1c58QLYW7X23yKO9i5hjILZ7iDry65ZENZHpJgy
         RjajbjpJf7U2FV54yfBbEBBn/yPEnCslDScAHfgBXiD4r11e6CG30NmoukNILCCrAAiO
         kVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jwUF0jTP/NOVRMHfd02ulbOWRiSGddGMyJftTXYHjDU=;
        fh=A91k+eFb1zCVFkuQupsMVllnbO6SaGmi00Mxwqynb7w=;
        b=HP1fIhYKGtc8t28Jo/r10OcCnK5OJVe7LDkssOIdiKl01jZObUSa0eNghU16zrid6Z
         CcV2zZEduMEhOI+uYCLYADMiS+G0WQF1OrI1AuDEiJLCO57AY1eTB7IyFnoRHa2mh9Qy
         u4er0u8YIgsor1gVsVB1nZkvbbUY7vjcEtdxvwzek/Y5DVNZgUlBdsOPo+mFRdp9jR+/
         LPgJ1cUdZx3OhCWhWbdB4vPvX9VW+1oBdvklrWfjBl3ZfOWhMOHjPZXqp2MFYpTKWobF
         sqQdgkdK1YWLyStcJC0+l1K3bR5NCUxLAa8I92EWaTrVvjFoXk+cQmBfjdZxVBssnN2g
         /SkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777650882; x=1778255682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwUF0jTP/NOVRMHfd02ulbOWRiSGddGMyJftTXYHjDU=;
        b=MMngYb3aml9EvfMFSqihGenHoRBqR+kQ5UIvNf4ibhU9wwi9wh8/cLjQh/uf2mrHwp
         AkXd+YOjm4FoH0TUvc1EOwsYYRTOAMSDTYn2UuDybpKTsFicQ6oUlM39GKzoq0w+ghSA
         dcEp36123NioidDn3tVaFFNM6Q9+Rm+AuISJCLgx25C0erTK5429CtQ8mXGgeJYQZMox
         em1p5wzq8pFRg9b209uKiG3qR/U4J4mP6t0qVFa8FgLo/t0dXUwmZ4ApgvOg3tT092sF
         lBlzIQzhzC94gTOHerlKVhqRoKoe7oYj8d/lyP3LG8dg7hUUcU+gg6wuuxFGmCD/ATjt
         YhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650882; x=1778255682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jwUF0jTP/NOVRMHfd02ulbOWRiSGddGMyJftTXYHjDU=;
        b=gBEmmpoaNDnsnCqCeWOdqEIfrXeLbwr9nkyD6hoCldo+t1LRL8CYqSGc8UKFVq/k+9
         uh9+mGups5SkxJ+jcvUToWf/xHh6aPaiN2dFxURzEjkQ5J4bX1vARagTGh6HupZZN9sL
         AxUSL0E9MrYSLO54kxzVEPhsnO2swTimU8/9Bcamvd2+lvCbF0zafCWjW5RCeJkZmnxO
         QdDaCF/DZHdl6erpM8hsPUx1BoMGnWlohMZ4TCXwZaSS2f3TpTZptQNWIVxK9GPZcTX/
         RlhHje6gAiAW39imbBlV4cO1b4A3jrqTTUdCtxD9BC+mxb9MD2pRJpR7IUtwMVOZFauw
         Gbqg==
X-Forwarded-Encrypted: i=1; AFNElJ+DGXVtz0VOvKz0lZp+Gx9jLDVaj5nJYVdW7FZiyUSdqPaIhwWXo8v7poX7uBW1oZMu5ZmeUH/kH4TESw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHv6PsAmOHndXagPNZvSkhFBf0YLmRuAbJvDFTpgrY0OcDAQwy
	EyFLg6Xltrc3ULKE/o68omfcS5N5vepYF5njIUS+ZV/TtCFqnsodJO17OPKCJDu7huTVzdMkBuQ
	Y2uE1y+0ug8rGNoakj/HDidh1lI1UQvSssTo41ls5
X-Gm-Gg: AeBDieu16Su2h60jgGNW2dZbrbZVejkFIkZNnD1fy186qmN8wsry9U24VU0MEuXmNra
	eOYCjQ5VUnNLJnkTnPGegKAaa7/xUwYO0igsN/NGSUDY2H32Iv+fxOd4ZMrD481DjkNbiBvPrvb
	V+/d/+8UtiJ6mc7wGXUTD3DC1Fu92Wp7ghLeaRzZfzEOoxFqjGcghBP+Jcwp8C6r2tKcn0R+384
	OE6N4CJmNcuj7bBpjlkeQmZD+OzWBA2fgxAJL6h9bhDVPgRWl4LjWM+gCz+xjtUX8QK/DVN3sTm
	DuHIeUqobOR6TumWdBjEufxLRO83DUs4m8gXp13GWTih07kikrUSvQFomSs=
X-Received: by 2002:a05:600c:588a:b0:48a:55dc:9c1e with SMTP id
 5b1f17b1804b1-48a8dbd8581mr1073235e9.10.1777650881744; Fri, 01 May 2026
 08:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406214938.24142-1-baohua@kernel.org> <a6d1c89a-3c71-4e06-adcb-56595071dcc2@amd.com>
 <CAGsJ_4xquCzQLbvpkC8arAN=9KhrAkdPdxnB=v85GvvQu23Xyg@mail.gmail.com>
 <9034246e-3971-4fad-94b7-80f4ad0e29db@amd.com> <CAGsJ_4z5EZoNMBVnu6sCkThyi9VTCeCH29buVecuySuv_Ry8fw@mail.gmail.com>
In-Reply-To: <CAGsJ_4z5EZoNMBVnu6sCkThyi9VTCeCH29buVecuySuv_Ry8fw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 1 May 2026 08:54:29 -0700
X-Gm-Features: AVHnY4K9IQcLD4rvVzmAGkjSkrXkB2IVyJxFSBLPqAnQQvgeGWt-GzWKe8Eu21c
Message-ID: <CABdmKX3baqmBkZxMB6PTG6Sj5S9qi+RwVvwpmkLqKkqvfeZAUw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: Optimize sg_table-to-pages
 conversion in vmap
To: Barry Song <baohua@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	Xueyuan Chen <Xueyuan.chen21@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CBFED4ADD50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,gmail.com,linaro.org,collabora.com,arm.com,google.com];
	TAGGED_FROM(0.00)[bounces-60156-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email,mail.gmail.com:mid]

On Thu, Apr 30, 2026 at 9:15=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Wed, Apr 22, 2026 at 3:10=E2=80=AFPM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > On 4/7/26 13:29, Barry Song wrote:
> > > On Tue, Apr 7, 2026 at 3:58=E2=80=AFPM Christian K=C3=B6nig <christia=
n.koenig@amd.com> wrote:
> > >>
> > >> On 4/6/26 23:49, Barry Song (Xiaomi) wrote:
> > >>> From: Xueyuan Chen <Xueyuan.chen21@gmail.com>
> > >>>
> > >>> Replace the heavy for_each_sgtable_page() iterator in system_heap_d=
o_vmap()
> > >>> with a more efficient nested loop approach.
> > >>>
> > >>> Instead of iterating page by page, we now iterate through the scatt=
erlist
> > >>> entries via for_each_sgtable_sg(). Because pages within a single sg=
 entry
> > >>> are physically contiguous, we can populate the page array with a in=
 an
> > >>> inner loop using simple pointer math. This save a lot of time.
> > >>>
> > >>> The WARN_ON check is also pulled out of the loop to save branch
> > >>> instructions.
> > >>>
> > >>> Performance results mapping a 2GB buffer on Radxa O6:
> > >>> - Before: ~1440000 ns
> > >>> - After:  ~232000 ns
> > >>> (~84% reduction in iteration time, or ~6.2x faster)
> > >>
> > >> Well real question is why do you care about the vmap performance?
> > >>
> > >> That should basically only be used for fbdev emulation (except for V=
MGFX) and we absolutely don't care about performance there.
> > >
> > > I agree that in mainline, dma_buf_vmap is not used very often.
> > > Here=E2=80=99s what I was able to find:
> > >
> > >   1   1638  drivers/dma-buf/dma-buf.c <<dma_buf_vmap_unlocked>>
> > >              ret =3D dma_buf_vmap(dmabuf, map);
> > >    2    376  drivers/gpu/drm/drm_gem_shmem_helper.c
> > > <<drm_gem_shmem_vmap_locked>>
> > >              ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
> > >    3     85  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> > > <<etnaviv_gem_prime_vmap_impl>>
> > >              ret =3D dma_buf_vmap(etnaviv_obj->base.import_attach->dm=
abuf, &map);
> > >    4    433  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c <<map_external>>
> > >              ret =3D dma_buf_vmap(bo->tbo.base.dma_buf, map);
> > >    5     88  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c <<vmw_gem_vmap>>
> > >              ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
> > >
> > > However, in the Android ecosystem, system_heap and similar heaps
> > > are widely used across camera, NPU, and media drivers. Many of these
> > > drivers are not in mainline but do use vmap() in real code paths.
> >
> > Well out of tree drivers are not a justification to make an upstream ch=
anges.
> >
> > Apart from a handful of workarounds which need to CPU access as fallbac=
k DMA-buf vmap is only used to provide fb dev emulation.
> >
> > The vmap interface has already given us quite a headache in the first p=
lace and there are a couple of unresolved problems regarding synchronizatio=
n and coherency.
> >
> > When a driver would be pushed upstream which makes so frequent use of t=
he dma_buf_vmap function that it matters for the performance I think there =
would be push back on that and the driver developer would require a very go=
od explanation why that is necessary.
> >
> > So for now I have to reject that patch.
>
> Well, it doesn=E2=80=99t seem to increase complexity, and the code is qui=
te easy
> to understand.

I agree with this. This change introduces basically no downsides for
upstream, even if it primarily benefits a rare use case. Since
dma_buf_vmap is exported for driver use, why not enhance the
performance for all callers?

-T.J.

> It would be great if the community could be more welcoming
> to developers who are just getting involved, rather than discouraging the=
m.
>
> Apparently, no one can control whether the source code of those kernel
> modules will be upstreamed except the vendors themselves, but products
> can still benefit from the common kernel.
>
> Best Regards
> Barry


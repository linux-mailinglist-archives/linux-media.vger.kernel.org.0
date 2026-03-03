Return-Path: <linux-media+bounces-54371-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JWcJcz0pmmgawAAu9opvQ
	(envelope-from <linux-media+bounces-54371-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 15:48:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8B21F1C51
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 15:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B45330709B1
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 14:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CE747D934;
	Tue,  3 Mar 2026 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PFP3bTMS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AskVjbzh"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFC747D92E
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549250; cv=pass; b=DyKUyS3NSM1dfjtYoIePBZBsiYTatO2HDxpdVsqrsxafpSvgCEhRVTmHDL23QkJcTgrgyuRoQye0kXNfmWEyVbwsh5UDocQNj9DMlMnmFwfrYfS5y3alLGq/4DVuVjHOxzaGU3XeqAoRV+J4YyDfNg0hJVElQozOcWzRabEpjq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549250; c=relaxed/simple;
	bh=7MpbblFcPZi3wBjzTsxHXVpnWCSauFBEUdLtqyENUK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ig5NoUuro5LcRjkn85SeGQucgJmtm6zFiPiYp3vKKlBuzlwgkRk63U4PLurLikfNKOw+dnOcG3ewu7xu/yRroPgPzWfGg9jSypErN/yVlflK5ut7F5whfx/87c40N03lBpuENhlabal9iPWBbYOLI3Nuer7ikA8OhPwsWRvuBU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PFP3bTMS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AskVjbzh; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772549247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=67yY3F56XFWrwiaal1aRX9aq+ZjoX8WGlYCGFwR1Ay0=;
	b=PFP3bTMSneHi9dSlPnKRLuz7w2912yPdBciw8Lk10GPYCskjy6z5OCDC2nG0f7/IOJ8lSZ
	KZlQ5IUA8eHL8i2JIje1fXJFfQEx2QBU1tmg0/ZGCod8tAaSwn9BDas9fJTFIpmd9Kqy3F
	qmErmJ9UNg3P72UUsAg1CFsWFTxbaKE=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-se0G9GOSNa6Jb0uQP1CEwQ-1; Tue, 03 Mar 2026 09:47:26 -0500
X-MC-Unique: se0G9GOSNa6Jb0uQP1CEwQ-1
X-Mimecast-MFC-AGG-ID: se0G9GOSNa6Jb0uQP1CEwQ_1772549246
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-64ca2fce827so12175557d50.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 06:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772549246; cv=none;
        d=google.com; s=arc-20240605;
        b=CXwoaTGv6XKH0ArU2crXp///V16LhX7wHnXlEPKLjm99a4j9+5tSP6IWJ+IMji1K0r
         6/w9TohtcxZ57iXmHRovxMe1b8Rp5QwVzQbu3mNz4mHoRrR5RLlUi5KwZkrRSHlkld+r
         LhNAv3bfAZXhShhheQchUQMlfk5XAPT5qfaTgI9gE5H4FuRc0TwletzWWakgFp9xXIqn
         KESI77T2JwfRYc/Bm3hj9cg4fF+/XH7WnTdlseJYhNAkgCAfnbJP/sqMdhFZL5vSGYdj
         x0GXGNROuId8OOvdIc7KyOhjT5jP/nhNC8Sq4s4KUiHsI6i4teXyLWwsz7W+GsShVIhj
         V0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=67yY3F56XFWrwiaal1aRX9aq+ZjoX8WGlYCGFwR1Ay0=;
        fh=xCJ1rcP21os6k2hBzm2+7E9axgbKP3bPwPecxZZ77xA=;
        b=D6fBYTFfZlUbYSp78C8TVJSC3CTO4vCu+Gsm0BdPU5UF15395TBj+RWAjMW9ZrUsCj
         kflZBnHUtTwpKq9xd24sHWfoErHf1/+ZH4cJEmav9RZ1ayIzl3x/bCcpvTgyJYfaRspp
         Y02Jz2s6njvPyplalz/k6p7xGwhFP65DAwv7XP0ObvlKqZllFxc2WlNr1+eYbkifDDgS
         da0G44tHueJlts1TEoqmjTiQj4g1/ykTwiGf4/x3KXpIDPraMNfUADcGxS5Xp9yVF5qg
         7maKZBpytCbuzFfDz8SXUaT2AqPgntDbdn5NYeMiD13UJr7e7ulnN1q41K719cmcUDLY
         jZhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772549246; x=1773154046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67yY3F56XFWrwiaal1aRX9aq+ZjoX8WGlYCGFwR1Ay0=;
        b=AskVjbzhUmXtUyZMf+W0SISoCbdVXlt+QpO5fU8PuAxgQkIPxzAPDM0UQm6Ys9l8fH
         JBmbnbiO9c1Us6yb6MvUfvYOLcslQSHhTmy0eH/FZWRca20/oVRBDYagi8Mo8zwSmW9B
         GGLenNTo9VCxQr2r2jPsY4FhZQvTRkfICn/SF7YLZoKoxfFzLi7Usbs0v0wxMqmIeJy1
         Y9n2N4SyZ8J2YKzpVCrVjCbuWAvQUGw85pxhDEzjFkby76nTB++Bs0gN45L7mWob/hrT
         19uZ9mlolqotFdpbuxe5l/MVyLiC9LrQBLWhTxzu2ZyIJGoywOHD3ULJVF8+MSkesGNT
         7iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772549246; x=1773154046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=67yY3F56XFWrwiaal1aRX9aq+ZjoX8WGlYCGFwR1Ay0=;
        b=j7sm/f7IftfHgiq/5G/8mWUOS/lkJLkVoLuhaFLe5NL7pZJh0cm/LSW/51n0VDl4Z3
         k6VjfxQvxD2wfUgRRXAkg7Kb0hQYJk7stCi4xbhODa/MSj6zz5vkZknBRPHFyJ9bo/IB
         SDa9UMM2kIbGeqVDsTt+4EpwmI+Nm5B6jRGe3O8pKkOOjCpPagTIi80cYxBv6/Dn1eJb
         P3mwv1AU59tv/+0XopGHleoKECnm5VChY2pIK7IgDNv3YdCbSZAOICOgLtwODr/zn4mG
         ZPfO7sdaOa3Eoo06o1eAuTGXFCrjeNVuL0qdsFrIjGU/JVXEcogmXfr8wW1J5Z+YN2bN
         UdFw==
X-Forwarded-Encrypted: i=1; AJvYcCUMYn7xmi+raaDaapPPOmOsPX6Fs4yKZxQiIfPUVFFf0yC1yqP1/eNYV1/pSIHjriV20l76GLjEI4vd2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMTxjV/sHIgGl70VC0gWPdtbtf9zTAlS9QEbVQgxW+4QcjJFXu
	C/h2VhEPX/7lmZFBPzbgOkz+TgW0109+YHiYMjChj5Yv+Kt6jIgFrOwHH7GyyIgSYLLGNmTZeTB
	PvKmrwA9ASHSBx99kMPz1dDlzd274fE/qN1FSM2WwFCq1/xXKvcTLZ7KOWntRiJKZ9uDHZ8H0af
	zZScsbI3WH6JYNVU/5BB3BKtxPF9m3dJaR2af68CQ=
X-Gm-Gg: ATEYQzwCX70YelYRh+RGg17sXgP38EAuw10j/V/kGnYj1P4DW5j62bT1MO/bdxaSQd9
	dCP3BDDOB73tD2bzHGwP7NdamkZxRe7ihMK2gfhxXkCkwOThEOwa++NtI8vsir2kkfpSrEkY5Ox
	mBSkHkX1SepzIafSJ8Bn0+1ck0eoi2nHz5yH2uDZRjey+n3ZNRKjieaHo6zdP3Elu65agJNHFlI
	Q==
X-Received: by 2002:a05:690e:b4b:b0:64c:cfae:a9c4 with SMTP id 956f58d0204a3-64cedbb766amr1502465d50.15.1772549245648;
        Tue, 03 Mar 2026 06:47:25 -0800 (PST)
X-Received: by 2002:a05:690e:b4b:b0:64c:cfae:a9c4 with SMTP id
 956f58d0204a3-64cedbb766amr1502428d50.15.1772549245221; Tue, 03 Mar 2026
 06:47:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
 <20260303-b4-dmabuf-heap-coherent-rmem-v2-4-65a4653b3378@redhat.com> <20260303-rigorous-cow-of-saturation-23f87b@houat>
In-Reply-To: <20260303-rigorous-cow-of-saturation-23f87b@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 3 Mar 2026 15:47:14 +0100
X-Gm-Features: AaiRm519G2sejRBJyA3Xs8Zi4JtzQv5MBBjaKxQXlykPb9RAYNkCbJ50N8lMMy0
Message-ID: <CADSE00+jCZSHi=OLbmOebBwnue5tjG7AFPKN76CbYDWYBcP+AA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1B8B21F1C51
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54371-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,exp_info.name:url]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 2:20=E2=80=AFPM Maxime Ripard <mripard@redhat.com> w=
rote:
>
> Hi,
>
> On Tue, Mar 03, 2026 at 01:33:47PM +0100, Albert Esteve wrote:
> > Add a dma-buf heap for DT coherent reserved-memory
> > (i.e., 'shared-dma-pool' without 'reusable' property),
> > exposing one heap per region for userspace buffers.
> >
> > The heap binds the heap device to each memory region so
> > coherent allocations use the correct dev->dma_mem, and
> > it defers registration until module_init when normal
> > allocators are available.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/dma-buf/dma-heap.c            |   4 +-
> >  drivers/dma-buf/heaps/Kconfig         |   9 +
> >  drivers/dma-buf/heaps/Makefile        |   1 +
> >  drivers/dma-buf/heaps/coherent_heap.c | 426 ++++++++++++++++++++++++++=
++++++++
> >  include/linux/dma-heap.h              |  11 +
> >  include/linux/dma-map-ops.h           |   7 +
> >  6 files changed, 456 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 88189d4e48561..ba87e5ac16ae2 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -390,8 +390,8 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >
> >       heap =3D dma_heap_create(exp_info);
> >       if (IS_ERR(heap)) {
> > -             pr_err("dma_heap: failed to create heap (%d)\n", PTR_ERR(=
heap));
> > -             return PTR_ERR(heap);
> > +             pr_err("dma_heap: failed to create heap (%ld)\n", PTR_ERR=
(heap));
> > +             return ERR_CAST(heap);
>
> This looks unrelated and should possibly be squashed into the previous
> patch that introduces dma_heap_create()?
>
> > +static int coherent_heap_init_dma_mask(struct device *dev)
> > +{
> > +     int ret;
> > +
> > +     ret =3D dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
> > +     if (!ret)
> > +             return 0;
> > +
> > +     /* Fallback to 32-bit DMA mask */
> > +     return dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > +}
>
> Why do you need to mess with the DMA mask? I'd expect that device to be
> able to access everything.

When I tested I was getting: "reserved memory is beyond device's set
DMA address range", so I tested if it was fixed with
dma_coerce_mask_and_coherent() and/or dma_set_mask_coherent(). I did
not debug the value of coherent_dma_mask, but given the error I assume
it was not set properly? Ultimately, using the 64 bit mask fixed it,
and I added a 32-bit fallback to ensure support for 32-bit systems.

>
> > +static int __coherent_heap_register(struct reserved_mem *rmem)
> > +{
> > +     struct dma_heap_export_info exp_info;
> > +     struct coherent_heap *coh_heap;
> > +     struct device *heap_dev;
> > +     int ret;
> > +
> > +     if (!rmem || !rmem->name)
> > +             return -EINVAL;
> > +
> > +     coh_heap =3D kzalloc_obj(*coh_heap);
> > +     if (!coh_heap)
> > +             return -ENOMEM;
> > +
> > +     coh_heap->rmem =3D rmem;
> > +     coh_heap->name =3D kstrdup(rmem->name, GFP_KERNEL);
> > +     if (!coh_heap->name) {
> > +             ret =3D -ENOMEM;
> > +             goto free_coherent_heap;
> > +     }
> > +
> > +     exp_info.name =3D coh_heap->name;
> > +     exp_info.ops =3D &coherent_heap_ops;
> > +     exp_info.priv =3D coh_heap;
> > +
> > +     coh_heap->heap =3D dma_heap_create(&exp_info);
> > +     if (IS_ERR(coh_heap->heap)) {
> > +             ret =3D PTR_ERR(coh_heap->heap);
> > +             goto free_name;
> > +     }
> > +
> > +     heap_dev =3D dma_heap_get_dev(coh_heap->heap);
> > +     ret =3D coherent_heap_init_dma_mask(heap_dev);
> > +     if (ret) {
> > +             pr_err("coherent_heap: failed to set DMA mask (%d)\n", re=
t);
> > +             goto destroy_heap;
> > +     }
> > +
> > +     ret =3D of_reserved_mem_device_init_with_mem(heap_dev, rmem);
> > +     if (ret) {
> > +             pr_err("coherent_heap: failed to initialize memory (%d)\n=
", ret);
> > +             goto destroy_heap;
> > +     }
> > +
> > +     ret =3D dma_heap_register(coh_heap->heap);
> > +     if (ret) {
> > +             pr_err("coherent_heap: failed to register heap (%d)\n", r=
et);
> > +             goto destroy_heap;
> > +     }
>
> I guess it's more of a comment about your previous patch, but it's not
> clear to me why you needed to split dma_heap_add into dma_heap_create /
> _register. Can you expand a bit?

So first I tried to just use dma_heap_add() and then use the heap_dev
afterward to call of_reserved_mem_device_init_with_mem(), but if that
call failed, the error path required some kind dma_heap_remove()
function as the heap was already registered by then.

In the CMA heap for example, dma_heap_add() is invoked at the end of
the `init` function. Therefore, you do not have this issue, if it
failed it means the heap was not added and you just need to clean
everything else.

However, performing a remove() does not sound like something that can
be done safely. I've spent some time thinking on alternatives, but
splitting felt the best pattern.

This way I can:
1. Create the device
2. Call of_reserved_mem_device_init_with_mem
3. Register the heap

This places registration at the end, making every error path and
cleanup easy to handle.

Also, the `dma_heap_add()` code already seemed to handle these two
parts/phases implicitly with device_create(), so splitting felt
architecturally sound.

>
> > diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> > index 1b0ea43ba66c3..77e6cb66ffce1 100644
> > --- a/include/linux/dma-heap.h
> > +++ b/include/linux/dma-heap.h
> > @@ -9,10 +9,12 @@
> >  #ifndef _DMA_HEAPS_H
> >  #define _DMA_HEAPS_H
> >
> > +#include <linux/errno.h>
> >  #include <linux/types.h>
> >
> >  struct dma_heap;
> >  struct device;
> > +struct reserved_mem;
> >
> >  /**
> >   * struct dma_heap_ops - ops to operate on a given heap
> > @@ -53,4 +55,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_=
export_info *exp_info);
> >
> >  extern bool mem_accounting;
> >
> > +#if IS_ENABLED(CONFIG_DMABUF_HEAPS_COHERENT)
> > +int dma_heap_coherent_register(struct reserved_mem *rmem);
> > +#else
> > +static inline int dma_heap_coherent_register(struct reserved_mem *rmem=
)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +#endif
> > +
> >  #endif /* _DMA_HEAPS_H */
>
> Do you still need that now that you switched to an iterator-like
> function?
>
> > diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> > index 60b63756df821..c87e5e44e5383 100644
> > --- a/include/linux/dma-map-ops.h
> > +++ b/include/linux/dma-map-ops.h
> > @@ -12,6 +12,7 @@
> >
> >  struct cma;
> >  struct iommu_ops;
> > +struct reserved_mem;
> >
> >  struct dma_map_ops {
> >       void *(*alloc)(struct device *dev, size_t size,
> > @@ -161,6 +162,7 @@ int dma_alloc_from_dev_coherent(struct device *dev,=
 ssize_t size,
> >  int dma_release_from_dev_coherent(struct device *dev, int order, void =
*vaddr);
> >  int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_stru=
ct *vma,
> >               void *cpu_addr, size_t size, int *ret);
> > +struct reserved_mem *dma_coherent_get_reserved_region(unsigned int idx=
);
> >  #else
> >  static inline int dma_declare_coherent_memory(struct device *dev,
> >               phys_addr_t phys_addr, dma_addr_t device_addr, size_t siz=
e)
> > @@ -172,6 +174,11 @@ static inline int dma_declare_coherent_memory(stru=
ct device *dev,
> >  #define dma_release_from_dev_coherent(dev, order, vaddr) (0)
> >  #define dma_mmap_from_dev_coherent(dev, vma, vaddr, order, ret) (0)
> >  static inline void dma_release_coherent_memory(struct device *dev) { }
> > +static inline
> > +struct reserved_mem *dma_coherent_get_reserved_region(unsigned int idx=
)
> > +{
> > +     return NULL;
> > +}
> >  #endif /* CONFIG_DMA_DECLARE_COHERENT */
> >
> >  #ifdef CONFIG_DMA_GLOBAL_POOL
>
> To preserve bisectability, you shouldn't do it that way. Introduce this
> function into a preliminary patch, and then use it in this one.
>
> Maxime



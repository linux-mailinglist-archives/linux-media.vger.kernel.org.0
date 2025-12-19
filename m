Return-Path: <linux-media+bounces-49155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CB0CCF5A0
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 11:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78EC1302E14E
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 10:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD592FB97A;
	Fri, 19 Dec 2025 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FpNhUZOU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SVhHnXwz"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261CC23EA84
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139563; cv=none; b=K3SO+r9TopqhArSq5JtZ87Vw+Y96N3k4nH09liC1VSzCGfBN2xdkc/CpoT2rGJs2ooiqFxeLNW6Sb0kGtaHtumJbnDEFBVmySo7A3tItfbTH1kdVuQcEPXLWe8vmKv4yOR8YFLDNHv3kmnPpChUSNuPYq12i+LnWj5InObPujWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139563; c=relaxed/simple;
	bh=n+Sjh7UuYFLIovf/XxlzAidLiUL3k2dY2RdNBAzDrDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtXO7K1WBAHKNl/MwWmO4glJO3FVigLy/9oaKoluJIezThkUe78C9nGyfnw/EzIrtkwr9RmC5u5+1NJVi3FbJMALK2IuPcs4E0W6yXv7Zc7slKfcR0a1rB14wdffRFcB7y5/Y9VzOUATiBkrm0NdCVTLgKVnS7+KYvlUHEVSJSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FpNhUZOU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SVhHnXwz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766139560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n+Sjh7UuYFLIovf/XxlzAidLiUL3k2dY2RdNBAzDrDc=;
	b=FpNhUZOUC81ql5ptF8dqy1pu+8kqqMuibACzm9NTcpudYVPO4s3KgGYyhcQIryOTHkUuwb
	7sRaaL5xzQRpSKu+7rbRJmBdRbscO2WzQqSezrRNFKQUrDHHiSOs+vJAqVN/iLciznZK1V
	REQMkToL5Lfc0HELFpkfj3XilWP9lHw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-HZCvh62JPrS3oqEv69Q45A-1; Fri, 19 Dec 2025 05:19:18 -0500
X-MC-Unique: HZCvh62JPrS3oqEv69Q45A-1
X-Mimecast-MFC-AGG-ID: HZCvh62JPrS3oqEv69Q45A_1766139557
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-430fdaba167so885732f8f.3
        for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 02:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766139557; x=1766744357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n+Sjh7UuYFLIovf/XxlzAidLiUL3k2dY2RdNBAzDrDc=;
        b=SVhHnXwzknIcSNyB3LJ+Cf2nlDf0Qa3P0P6HRcb1q9ZP0guXG1mpyYT4Bdc+PG1sFk
         8bml8NJK/aPoDD0zAbKSj+dLWgrw/C1Vr4XmiA0lr/eX1Ud/tEex/REidzci+Nw12p2y
         6PbgjH0UWlFohzHcVJVvm6wt7N8vnzLhAh5aKL7fHhOAQfJpjIm8j7Pcy3x43haPcBef
         Cld/3hw+hJflhKsUN8YBysr1HMItlYKR0SuZWKXmyMYz00HHOk1rF39cNnVThqWBu482
         9GjiPT9xlVVI4qODsbsK6FKppM/2O/dMpV4fb2JECrfsnC0yOeuJf+fUIyJKbM8ea3nP
         3I7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766139557; x=1766744357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+Sjh7UuYFLIovf/XxlzAidLiUL3k2dY2RdNBAzDrDc=;
        b=M+c9d8nf14pEwfuqNstmrKPqdUur39dFLSPEtaMgVeFQIzxAt3OwVKs29uQcjFIr3c
         WLMtv8bcLlOJBPB7ABA84YFGWjEr/UCMfDc9LnJapQcoHIbHQ+SGJP7QBoai6H7snFwm
         NaIIc3bn1oEclMb17vrG1k+gp4I394BQULQKjpZyfepl2isEflQhO/vuNO7b/2RlRfgd
         2pPDt8Bvq1AFQwcztJD+0CBijyK6h89iiJWd3ndoFNK4lEdnQPNg/0iVubVr08d+dfbn
         mg4PIcGoPqviD4rk2Mnk1kYyCb0gWHRNHXnqCe5P/F9jJC8NYK6rQAdIUnZJboFCzMYZ
         mOxg==
X-Forwarded-Encrypted: i=1; AJvYcCVAeQwl8Yj/557FhxKf6jXcxsu57Rq5iakb0X4I60jHs/eRXgCYNnJD2ulJJ6T9tdElWHmn96F9gB/o3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJDv4zr+ZmKlwlbYWLhfcXsbUTy4j7T5eZve4B8o+YqocrpM4X
	CI2QZGxCrDlZlMP7g/DK+YZ41COvy4htS5qzlfOeR5Qsl0k/X2epKBFNdLAWnreXrD3MXeSFIkJ
	UeGXy/tYsO4sb4aBjS1VUK8ehTTV44QscFnCj8ssgpkztVTPZMYMTXpodXyEEKk+5
X-Gm-Gg: AY/fxX4JhY2bvjKIyBToCe9aczp+V67tN67Tm/to6c0SSqHLmBQnoghgsZvtf5i0RFp
	U6/QjlvnziW6+ZvdF74RWriro6wHB0w/5k4LeLoybx98uEi6qwnD3Iwny8TBOnMxui1nQo1pdwq
	a07xclKNhTg70VePN/BIoIb4blnsyvTSlIN8ntU+0xse0z79aAE8GnZSAbKNuTOLTUC/ri5plUI
	XYOT4iMjYdztpvkvvs9zTka/LKtqM5ILDjc7oZ4d2JyRS97lsl/0J+F5uylGlOkSxkoGYFZFkO4
	Cmt6dDgo/nNFjGHRtA4v3Ju70SGLBpvLYRkxaEHbLfa2YS/cYsYmBVoF8qlRCw==
X-Received: by 2002:a05:6000:1868:b0:430:fc0f:8fb9 with SMTP id ffacd0b85a97d-4324e4f9458mr2556876f8f.36.1766139556958;
        Fri, 19 Dec 2025 02:19:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeh4Zbkr/D6P7HWKArF0jdwKfFL+l6ZrJJ1FavgfXi5moav7Q7vb1/nUNiIeSf8i+9DMCNLQ==
X-Received: by 2002:a05:6000:1868:b0:430:fc0f:8fb9 with SMTP id ffacd0b85a97d-4324e4f9458mr2556840f8f.36.1766139556391;
        Fri, 19 Dec 2025 02:19:16 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm4147867f8f.31.2025.12.19.02.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:19:15 -0800 (PST)
Date: Fri, 19 Dec 2025 11:19:15 +0100
From: Maxime Ripard <mripard@redhat.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Eric Chanudet <echanude@redhat.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Christian Koenig <christian.koenig@amd.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
Message-ID: <20251219-precise-tody-of-fortitude-5a3839@houat>
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
 <CABdmKX1HgSzUPS1Ot93tpctgunfHt_F_XNROB6zzpu_u0oH2=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="4cy66ljvjeto773l"
Content-Disposition: inline
In-Reply-To: <CABdmKX1HgSzUPS1Ot93tpctgunfHt_F_XNROB6zzpu_u0oH2=A@mail.gmail.com>


--4cy66ljvjeto773l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
MIME-Version: 1.0

Hi,

On Tue, Dec 16, 2025 at 11:06:59AM +0900, T.J. Mercier wrote:
> On Mon, Dec 15, 2025 at 7:51=E2=80=AFPM Maxime Ripard <mripard@redhat.com=
> wrote:
> > On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> > > On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redha=
t.com> wrote:
> > > >
> > > > The system dma-buf heap lets userspace allocate buffers from the pa=
ge
> > > > allocator. However, these allocations are not accounted for in memc=
g,
> > > > allowing processes to escape limits that may be configured.
> > > >
> > > > Pass the __GFP_ACCOUNT for our allocations to account them into mem=
cg.
> > >
> > > We had a discussion just last night in the MM track at LPC about how
> > > shared memory accounted in memcg is pretty broken. Without a way to
> > > identify (and possibly transfer) ownership of a shared buffer, this
> > > makes the accounting of shared memory, and zombie memcg problems
> > > worse. :\
> >
> > Are there notes or a report from that discussion anywhere?
>=20
> The LPC vids haven't been clipped yet, and actually I can't even find
> the recorded full live stream from Hall A2 on the first day. So I
> don't think there's anything to look at, but I bet there's probably
> nothing there you don't already know.

Ack, thanks for looking at it still :)

> > The way I see it, the dma-buf heaps *trivial* case is non-existent at
> > the moment and that's definitely broken. Any application can bypass its
> > cgroups limits trivially, and that's a pretty big hole in the system.
>=20
> Agree, but if we only charge the first allocator then limits can still
> easily be bypassed assuming an app can cause an allocation outside of
> its cgroup tree.
>=20
> I'm not sure using static memcg limits where a significant portion of
> the memory can be shared is really feasible. Even with just pagecache
> being charged to memcgs, we're having trouble defining a static memcg
> limit that is really useful since it has to be high enough to
> accomodate occasional spikes due to shared memory that might or might
> not be charged (since it can only be charged to one memcg - it may be
> spread around or it may all get charged to one memcg). So excessive
> anonymous use has to get really bad before it gets punished.
>=20
> What I've been hearing lately is that folks are polling memory.stat or
> PSI or other metrics and using that to take actions (memory.reclaim /
> killing / adjust memory.high) at runtime rather than relying on
> memory.high/max behavior with a static limit.

But that's only side effects of a buffer being shared, right? (which,
for a buffer sharing mechanism is still pretty important, but still)

> > The shared ownership is indeed broken, but it's not more or less broken
> > than, say, memfd + udmabuf, and I'm sure plenty of others.
>=20
> One thing that's worse about system heap buffers is that unlike memfd
> the memory isn't reclaimable. So without killing all users there's
> currently no way to deal with the zombie issue. Harry's proposing
> reparenting, but I don't think our current interfaces support that
> because we'd have to mess with the page structs behind system heap
> dmabufs to change the memcg during reparenting.
>=20
> Ah... but udmabuf pins the memfd pages, so you're right that memfd +
> udmabuf isn't worse.
>=20
> > So we really improve the common case, but only make the "advanced"
> > slightly more broken than it already is.
> >
> > Would you disagree?
>=20
> I think memcg limits in this case just wouldn't be usable because of
> what I mentioned above. In our common case the allocator is in a
> different cgroup tree than the real users of the buffer.

So, my issue with this is that we want to fix not only dma-buf itself,
but every device buffer allocation mechanism, so also v4l2, drm, etc.

So we'll need a lot of infrastructure and rework outside of dma-buf to
get there, and figuring out how to solve the shared buffer accounting is
indeed one of them, but was so far considered kind the thing to do last
last time we discussed.

What I get from that discussion is that we now consider it a
prerequisite, and given how that topic has been advancing so far, one
that would take a couple of years at best to materialize into something
useful and upstream.

Thus, it blocks all the work around it for years.

Would you be open to merging patches that work on it but only enabled
through a kernel parameter for example (and possibly taint the kernel?)?
That would allow to work towards that goal while not being blocked by
the shared buffer accounting, and not affecting the general case either.

Maxime

--4cy66ljvjeto773l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUUmogAKCRAnX84Zoj2+
docaAX97oRKC47EmRfraR77g2nPKkhNGbslMpV97iGWZDw9W7qVFZSWxAm3ZOecR
fdkqIH0BgJFWYMfMj1oLwlijaHOD41ueRI3Yd6gM9FpeT9i1TBtqRQpdmR+3tIkc
JQn/bUAXkA==
=H3ZY
-----END PGP SIGNATURE-----

--4cy66ljvjeto773l--



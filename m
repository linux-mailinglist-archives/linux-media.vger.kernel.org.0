Return-Path: <linux-media+bounces-53597-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCfsC39/oGnWkQQAu9opvQ
	(envelope-from <linux-media+bounces-53597-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 18:14:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A430A1AC01C
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 18:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E189F341B081
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 17:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913003603E9;
	Thu, 26 Feb 2026 16:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qeuBWaGY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C303603CA
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125147; cv=pass; b=dj7r48ahRm2GCY6XRJeYGlMTKIkwyorndkkXnQQ8X4y5bnSFKeNrJr+XzeVzxbY07gNCJV4y3oAOWUYSgg2kdpXMn5LiLWqYAIBysl7bNTDyxzG6aq3XPj/AKyKNSoTbBfuClm1hFda4Ke52Wo3umn1HqFJXhXG1jYjUP2QRc/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125147; c=relaxed/simple;
	bh=AH7fFA2R32bYr6PwRcky2ytsG7fZdObmn2E9Be7X+EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOWDSmWOYiE0xAyHjC86QzvsvRXMKyTfaTEeZUi8DgEPrNaeBlyosqqFKIM0+bsW/UlseExt7qH1nNycleTdD4j1c01gsRxMiRXE2CdYRTSYnjr0cV6GBi+b45WFPqgni2DP4cQx6kXKSSq/eV5bCSKQN1aI3K0DSFPrsyRwtwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qeuBWaGY; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48373ad38d2so106435e9.0
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 08:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772125144; cv=none;
        d=google.com; s=arc-20240605;
        b=L4MluuUjfAWEI+YsBY0eNPmCenBexBBxgD/gJrdbEi5fRlpwsRvgwsQ+1oQjtvO/gl
         ML4UIt+g0YhESDit6Axv7KQ6NU68ozKDRBDsOAN7zDYR6KdT4M+jDRoQHmXN8fObqof/
         Siq1IMnO2OTLspJwxbrj6Xl+2rTVacE8GlAH1t6LNILdVWlN9jYFJcmkaMeBflFa8EOP
         9S3mxXS7rxqtyrURkTjhpC0Y7vAB+GYZNRHHoeyX1kNj44z65VRuGpJLgmqvve+rX1as
         0wKRTF3ErrzAybel/cpvFZD2NzzWh4fTAbZsmHlPr9+JF0ag+a3rWVJeCuoVcXpBQTWo
         XIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GaC7hfbtyJLGGerhfBe2P9Hj0mHnDOXyDJFEYnDiBqY=;
        fh=oLWsDYV8mCB7oLPiY9Wh9RB9x+8Tj8auTT4kldGsA7o=;
        b=aG53fNreXJBiWGTDLowDs4ASYdcMlXhfZ4krocaOvfwDEC1JvfA1tDzbDFwPZSeAXq
         95QqTrhCU4kRKDrTryn81c2GWRhbrejCkoTo5mi4TTyXNzfq37jMZ0WzlMqNkM+1+kln
         O/UD85auEhaAeNEU7tglpC4eBQq1FHZW7Jt8042k4KiHDPUE89xiFMLjFDWL7Lav7UuQ
         I62X8sujzc3AoLsOx2f630Fo2iuXM4Ocwej/EngScsFwe3oQ3y9yUNK25tcdKWiuO9mb
         tu7gQWT8nZpQkIpxwk6jdobA+hpa8nEY7e77BhYI1aFbB2n7jUmPAx0aLtc2BOU1tHtO
         KwrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772125144; x=1772729944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaC7hfbtyJLGGerhfBe2P9Hj0mHnDOXyDJFEYnDiBqY=;
        b=qeuBWaGYv2ASeuvM5Xjf7tFcXjEWIosC5awIL0qqHxIrVDHGs35G2QMiyT6iCOcmQA
         uHcyMHvZDqFm+DR3ZAiLu9SwNHoGa8S83twfJUJ50YF9cTxGRUM9DGzRpoBr7bEEGfpC
         R0GzSsUX0zed58BZ+dem+wBOkmsGud/NwuOsIO5Yj2b9/01zydeG4zFlPXrItVwku6YH
         EPb400u0+KySBOvWu3FfprArKOY76JTgKKzVBBNG1vnrqB08DCX5xKi8hOBjrCHUM2vj
         cgyPoVTmPSbTLhp4V76a9CZLMOSxnZ4zBWmfR3ps1RZI5NQwaerbxgK3XC1PC/0o/UK9
         wmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125144; x=1772729944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GaC7hfbtyJLGGerhfBe2P9Hj0mHnDOXyDJFEYnDiBqY=;
        b=saBo+yeYfhCfcqGfKAgJWqXzItjHCDjNV73AJJnP8F3iCgToG+3i1Cd9TQW71yeZ3b
         QvU9BJBpmJN+EU8GlsVq5dczewsHPYiyI5G4gftKXmwCOR43tPZb1OrS7bTk/x4xqAGz
         AXVCC5gNlDr1BPJ4wZP+zTBBkLU1d/WY3A9bSLJXTswCzCWDJbn9/6MCgQNINk9x3Xb8
         07sACJ8xWgMqryH7qizRqtlzm8icrILAxtKihWS3dm/UgM4OAnMjUdBan0easB4hhBgu
         xpI+uw5KoTI73Msyu0gGckBq2BF/Ii2kU+YbRJodkWyFsrUR+Nq8XGb2lNjgErr6qWwN
         83WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/dFUt5pxdbDHVHXoaXP6hZi3tWjmsrj9koeHMPVD6m27kCb7Ao1m54u6PO5+4jwUHup8ZO+/k9RnsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOlTmN95Y3XzlrZTkogO3HXUNjassTAaZcqGnbodwbKEuY2dAT
	Jf4b+WYNE2wTY32M56A6aPcXJ+saY/aDco7Heh8fSQRRkI7yOCdUr7wRRmiJ987a7fRO9KsKA8u
	76APRPtiHxShcYFdNoZ5jNWlyubhq4LjKa4TupQIw
X-Gm-Gg: ATEYQzzOmzaYXLMm6B2R4uRcm9ix58LWrn7ZQxVP7MKpEzy87WqLhWZvEngzlfucmOO
	nMS5yAaLVY9CQndSEZi+dTU4wWaqjHxCyR4DcKwCXCUVKlftN9W7Uqtx0f0ijFs717mZVV9K0LS
	wx0BgiP0f/a6no2q9IY63e64cyz3c3E9AKVYn9ktPsL2sqJjLB8d6gZCFJa1WYKog8+PyOS/Nua
	Y5/EBIq36oR6HywFC3lmxkM9vCzFBea8ZUB6e/DXdrT5MSHvjPi1Iy/VjSJHbSGHSHal77pG7ow
	FPyhkVZdKuH9837/owgGL12NiGixF0sFGWr1dLXOD15t3tRXnx+qgTFtNtlW6gLIaxX1tA==
X-Received: by 2002:a05:600c:4f16:b0:47e:de1d:ce99 with SMTP id
 5b1f17b1804b1-483c31a76e5mr1276055e9.12.1772125143309; Thu, 26 Feb 2026
 08:59:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <20260225-dma-buf-heaps-as-modules-v1-2-2109225a090d@kernel.org>
 <60ecebf2-a708-4797-bedd-588c3e9931ff@kernel.org> <20260226-impetuous-analytic-jellyfish-d4a86d@penduick>
In-Reply-To: <20260226-impetuous-analytic-jellyfish-d4a86d@penduick>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 26 Feb 2026 08:58:51 -0800
X-Gm-Features: AaiRm51ICxvhnfb6IRxyaVo1JANC2yUPYPY4UyYDMkMh1Zp0Qc24kArQnpKFuW4
Message-ID: <CABdmKX0KZLGaJWBoo3tkCxLvby3f4Fn0nMCLyz4a-H-9J_CtPQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] mm: cma: Export cma_alloc and cma_release
To: Maxime Ripard <mripard@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53597-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A430A1AC01C
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 2:38=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi David,
>
> On Thu, Feb 26, 2026 at 11:25:24AM +0100, David Hildenbrand (Arm) wrote:
> > On 2/25/26 17:41, Maxime Ripard wrote:
> > > The CMA dma-buf heap uses cma_alloc() and cma_release() to allocate a=
nd
> > > free, respectively, its CMA buffers.
> > >
> > > However, these functions are not exported. Since we want to turn the =
CMA
> > > heap into a module, let's export them both.
> > >
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  mm/cma.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/mm/cma.c b/mm/cma.c
> > > index 94b5da468a7d719e5144d33b06bcc7619c0fbcc9..be142b473f3bd41b9c7d8=
ba4397f018f6993d962 100644
> > > --- a/mm/cma.c
> > > +++ b/mm/cma.c
> > > @@ -949,10 +949,11 @@ struct page *cma_alloc(struct cma *cma, unsigne=
d long count,
> > >     if (page)
> > >             set_pages_refcounted(page, count);
> > >
> > >     return page;
> > >  }
> > > +EXPORT_SYMBOL_GPL(cma_alloc);
> > >
> > >  static struct cma_memrange *find_cma_memrange(struct cma *cma,
> > >             const struct page *pages, unsigned long count)
> > >  {
> > >     struct cma_memrange *cmr =3D NULL;
> > > @@ -1025,10 +1026,11 @@ bool cma_release(struct cma *cma, const struc=
t page *pages,
> > >
> > >     __cma_release_frozen(cma, cmr, pages, count);
> > >
> > >     return true;
> > >  }
> > > +EXPORT_SYMBOL_GPL(cma_release);
> > >
> > >  bool cma_release_frozen(struct cma *cma, const struct page *pages,
> > >             unsigned long count)
> > >  {
> > >     struct cma_memrange *cmr;
> > >
> >
> > I'm wondering whether we want to restrict all these exports to the
> > dma-buf module only using EXPORT_SYMBOL_FOR_MODULES().
>
> TIL about EXPORT_SYMBOL_FOR_MODULES, thanks.

Ohh, ditto.

> > Especially dma_contiguous_default_area() (patch #4), I am not sure
> > whether we want arbitrary modules to mess with that.
>
> Yeah, I wasn't too fond about that one either. Alternatively, I guess we
> could turn dev_get_cma_area into a non-inlined function and export that
> instead?

I checked the history to see if dev_get_cma_area was converted to
inline at some point for performance, but it has always been that way
since 3.5. That'd be my only worry with un-inlining and exporting it.
EXPORT_SYMBOL_FOR_MODULES sounds like a better way to me.

> Or we could do both.
>
> Maxime


Return-Path: <linux-media+bounces-49156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95403CCF621
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 11:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 091BB309EC50
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 10:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E455308F38;
	Fri, 19 Dec 2025 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZCs/X4de";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZTE4Du7M"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E4E3081B0
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 10:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139951; cv=none; b=Rudg0xvlITKCeROgcy+bb3J+FCeFCy6stZczRlTqdj70h65wj6m91Oh/LoX9lEMGlnhCK/9It+WXiFZ4wg2utSESBIITgcZUBYILfRfADltANv/YFQOpyV2UtUKNQINNMuHoBxAu01rAVGQerUJrPgf1hFHHYy6lWdCPLFv7Yxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139951; c=relaxed/simple;
	bh=QjDiJjB7C2v1UtJ+RkaYpL+6MQ9Nkb3DziS0e1v2t2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMK8Mv/X4KFOUph/8MAT77DIkhTgjP+uXOxXfkR+Q0vusT6ZobGL9jNuXgFrc5xV9stSzP3hSys0VY1dZZdEAyiHDzv7u7M6yaom1jUPlw3vAWtHTgw4jYBifrAiN/UviQ3YKZ7XGl2xgXJqbR2eJWFo/IqLUt7QTTdOoUzR2/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZCs/X4de; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZTE4Du7M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766139949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QjDiJjB7C2v1UtJ+RkaYpL+6MQ9Nkb3DziS0e1v2t2k=;
	b=ZCs/X4dewmXd3k9wDbSoWqziqTEu1zN6oBx5XHIMcEQxnQDvcDJXtfN+Q3gnp9VHRd6xv9
	iU4XOPUqSy+EmV5q4CtA8JA5Tgb1Ej9cHnQZoxjLTd9C0bdLSB7lWo8VHPi76ZwPZDq16r
	uKgzfDxcwQSTy66G7uAagRgY5qvz+wM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-6ri9sfjGPfS0aRhONfsaVw-1; Fri, 19 Dec 2025 05:25:47 -0500
X-MC-Unique: 6ri9sfjGPfS0aRhONfsaVw-1
X-Mimecast-MFC-AGG-ID: 6ri9sfjGPfS0aRhONfsaVw_1766139946
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47788165c97so8883735e9.0
        for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 02:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766139946; x=1766744746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QjDiJjB7C2v1UtJ+RkaYpL+6MQ9Nkb3DziS0e1v2t2k=;
        b=ZTE4Du7MqOTX9Jynp0zIOyihMtrPSET7QnuNxZlozyW3G9FullELNJDfmut2O69n3T
         DfwqMLWE/L9ub9V5HDgH6DGKmsNTu1yfZeQIndq7tedaSRB6KTBCms7eKsW5pG+6++K7
         TLuN7O8I/QSto9KL1xw18a6BNcSSSc6NiVE/oP0qvDdU8c0gGTRGbnBbcUCx4dJZ0MXu
         asXKO3zFBR6qms4wLXBOe9wS8ZvKIEF0gMnhF7fKWyxYeQB0KygY8lk0uko3KlU+PhXk
         qIN9yd6xEvoy9Ot/thzm9sYeiTnUFS8FZO4fonbtGlt959hipRkR3FiG6nf9cMsAzMuz
         1hHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766139946; x=1766744746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjDiJjB7C2v1UtJ+RkaYpL+6MQ9Nkb3DziS0e1v2t2k=;
        b=Fqkjxage3c8WgP6VB5+uqZU4ViGN61KGegFF8MbjOvQXUFzmtnB/4dFnqooB+uURIM
         7SiK4UztsafLzUfius/0yqevRUElvvcsIc0lygc7+OFfpVcjx9wrSvPURDkv91fHTa91
         QcG8hgWiQXhdyNOc1CQZxEu9Zf4d/PlUHak9QOKvd/WYHJQ82YWia0shaXLKT2xWlDZ6
         Cy/Q/RyJltNxqIOqSwy9ye/5BQFsUlBLCHiduVZxa7LSqYX6wZEcI53lkhES8Ndhbhk3
         o2HyS3Isfpoj33lyBORY4XkJRRAWScB1ogcxfJ6gdyw2Nk1ltZ5zlA9BfPOoHcVQB5eh
         /Uvw==
X-Forwarded-Encrypted: i=1; AJvYcCV/D7tpezA9IFlOrjkGyTTIiB4MrcQQozmRdCWwqo/4cp+Oi99Lu6MQtXjAKWt6y9FDQkauDRjd46lkkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+nX+q+HpBQK6JrImEpDqq4ZGNjrAj7T6uvMEP+qTEjtvyhu4W
	s3aM8ZemtCoLv9+uIfWzcgEO5PwZgrF0U1ET8N89rYauPKGusX+PVULKdBlRLQkqWDoBpJuB5lm
	WBsFMKiXw1nTiVkXuXFzw3OOzJF/ISbF9O+Sf3CveXJ7aaV0GmiLso4r7oa7PmTvJ
X-Gm-Gg: AY/fxX4ESkB1t9Dibg6rflauxB2fsyDmG47nKL5N0KIvZeCddVA2YPHBP6PCSWkVHba
	onx4M4963s8t7TYMkuQJzyipVnOMTovSJL1j8SAd+QgwVD3pKB6NwEaM0buQ/UZoATPt8rb28Fk
	12n4tz0tNKQihhcUal7wLbuISktxNZcLOON+zuZW9sGrs67SaHvwuP2P9LJAAgrO4p+BxdfhXOf
	u46vhzTqNxZ7PbAvui7gdWGw+GR7F2qWLTrZKsQChaJwAMLORdvSPbphDwSfXnSz/Wz7unAiEWP
	GHHc/1hhdK3e3/U3zshCXBZoGIxdvQGGK8YQqjBTfhHJeKuDqdyG+1ySURkErA==
X-Received: by 2002:a05:600c:5248:b0:47a:8154:33e3 with SMTP id 5b1f17b1804b1-47d1958958dmr21132345e9.28.1766139945702;
        Fri, 19 Dec 2025 02:25:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFagDmA6mPBXBEAFzxJYNGFzP2GgCwlY1oy9ixI0iy9zInEz22wLjFWwqDhC49txteMc6NoXg==
X-Received: by 2002:a05:600c:5248:b0:47a:8154:33e3 with SMTP id 5b1f17b1804b1-47d1958958dmr21131995e9.28.1766139945121;
        Fri, 19 Dec 2025 02:25:45 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm37190635e9.13.2025.12.19.02.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:25:44 -0800 (PST)
Date: Fri, 19 Dec 2025 11:25:43 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, 
	Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
Message-ID: <20251219-large-daffy-monkey-74665d@houat>
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
 <07cdcce2-7724-4fe9-8032-258f6161e71d@amd.com>
 <20251215-garnet-cheetah-of-adventure-ca6fdc@penduick>
 <ef52d9e9-6abe-421a-98f8-f96353652e1e@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="5d5u624ftgk7q5qf"
Content-Disposition: inline
In-Reply-To: <ef52d9e9-6abe-421a-98f8-f96353652e1e@amd.com>


--5d5u624ftgk7q5qf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
MIME-Version: 1.0

On Mon, Dec 15, 2025 at 03:53:22PM +0100, Christian K=C3=B6nig wrote:
> On 12/15/25 14:59, Maxime Ripard wrote:
> > On Mon, Dec 15, 2025 at 02:30:47PM +0100, Christian K=C3=B6nig wrote:
> >> On 12/15/25 11:51, Maxime Ripard wrote:
> >>> Hi TJ,
> >>>
> >>> On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> >>>> On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redh=
at.com> wrote:
> >>>>>
> >>>>> The system dma-buf heap lets userspace allocate buffers from the pa=
ge
> >>>>> allocator. However, these allocations are not accounted for in memc=
g,
> >>>>> allowing processes to escape limits that may be configured.
> >>>>>
> >>>>> Pass the __GFP_ACCOUNT for our allocations to account them into mem=
cg.
> >>>>
> >>>> We had a discussion just last night in the MM track at LPC about how
> >>>> shared memory accounted in memcg is pretty broken. Without a way to
> >>>> identify (and possibly transfer) ownership of a shared buffer, this
> >>>> makes the accounting of shared memory, and zombie memcg problems
> >>>> worse. :\
> >>>
> >>> Are there notes or a report from that discussion anywhere?
> >>>
> >>> The way I see it, the dma-buf heaps *trivial* case is non-existent at
> >>> the moment and that's definitely broken. Any application can bypass i=
ts
> >>> cgroups limits trivially, and that's a pretty big hole in the system.
> >>
> >> Well, that is just the tip of the iceberg.
> >>
> >> Pretty much all driver interfaces doesn't account to memcg at the
> >> moment, all the way from alsa, over GPUs (both TTM and SHM-GEM) to
> >> V4L2.
> >=20
> > Yes, I know, and step 1 of the plan we discussed earlier this year is to
> > fix the heaps.
> >=20
> >>> The shared ownership is indeed broken, but it's not more or less brok=
en
> >>> than, say, memfd + udmabuf, and I'm sure plenty of others.
> >>>
> >>> So we really improve the common case, but only make the "advanced"
> >>> slightly more broken than it already is.
> >>>
> >>> Would you disagree?
> >>
> >> I strongly disagree. As far as I can see there is a huge chance we
> >> break existing use cases with that.
> >=20
> > Which ones? And what about the ones that are already broken?
>=20
> Well everybody that expects that driver resources are *not* accounted to =
memcg.

Which is a thing only because these buffers have never been accounted
for in the first place. So I guess the conclusion is that we shouldn't
even try to do memory accounting, because someone somewhere might not
expect that one of its application would take too much RAM in the
system?

> >> There has been some work on TTM by Dave but I still haven't found time
> >> to wrap my head around all possible side effects such a change can
> >> have.
> >>
> >> The fundamental problem is that neither memcg nor the classic resource
> >> tracking (e.g. the OOM killer) has a good understanding of shared
> >> resources.
> >=20
> > And yet heap allocations don't necessarily have to be shared. But they
> > all have to be allocated.
> >=20
> >> For example you can use memfd to basically kill any process in the
> >> system because the OOM killer can't identify the process which holds
> >> the reference to the memory in question. And that is a *MUCH* bigger
> >> problem than just inaccurate memcg accounting.
> >=20
> > When you frame it like that, sure. Also, you can use the system heap to
> > DoS any process in the system. I'm not saying that what you're concerned
> > about isn't an issue, but let's not brush off other people legitimate
> > issues as well.
>=20
> Completely agree, but we should prioritize.
>=20
> That driver allocated memory is not memcg accounted is actually uAPI,
> e.g. that is not something which can easily change.
>=20
> While fixing the OOM killer looks perfectly doable and will then most
> likely also show a better path how to fix the memcg accounting.

I don't necessarily disagree, but we don't necessarily have the same
priorities either. Your use-cases are probably quite different from
mine, and that's ok. But that's precisely why all these discussions
should be made on the ML when possible, or at least have some notes when
a discussion has happened at a conference or something.

So far, my whole experience with this topic, despite being the only one
(afaik) sending patches about this for the last 1.5y, is that everytime
some work on this is done the answer is "oh but you shouldn't have
worked on it because we completely changed our mind", and that's pretty
frustrating.

Maxime

--5d5u624ftgk7q5qf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUUoJwAKCRAnX84Zoj2+
dj4lAX0Yy0is1eVfn9GJZ8tPnOe91CbMkIdAor1dgBxh5RGL/e9IAXnnFFQzaX12
w2/x3FEBfA/Q0bKegplzRU4jhv1EueYV2Vj5bqPF2sIKW/Eff7kOIT0+y8L+DyLg
WOULpERarw==
=8moi
-----END PGP SIGNATURE-----

--5d5u624ftgk7q5qf--



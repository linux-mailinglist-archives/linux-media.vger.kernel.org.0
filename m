Return-Path: <linux-media+bounces-48812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A47CBE56E
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 15:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53A4D3030932
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 14:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553FD2BDC17;
	Mon, 15 Dec 2025 13:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="drNCRSPh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LpJtVA0g"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA2E2F363B
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807154; cv=none; b=VKxu7Ynd3M1ANl31DtkbZ6s+tUUZgVW4dSYMCyH9WqD9EmSt9GvW6TcPs9DO8ntoGdeh2yBfWT7GD55SHbfMODcdkfiuVNJI2twkAD0Z+yZ/5r0gJf373oyrirXmNJNr16rYyTUinLuPjDE13s8u4hxko4ICCa5+bJl7N02JGcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807154; c=relaxed/simple;
	bh=fxDTKwhMmaT8yFIgWPPRxzSP91DdXIWwn+nIL+l50K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkTOahRmvTNTxPgk0mNW+lPUcW9UrtvkNSQkN41U8OWqA0CZEs7R69bKN+Ny+qAXHl9S/07xdcQ+3kO3c0FlOOTIvl0tpg73o6UjFz7culZ7Dn4yt1tWMx+5HIhXZznb7nzVTC6V5P1vK8x7Xvo8DUDUGYDw655sAoOJde5CzpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=drNCRSPh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LpJtVA0g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765807151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fxDTKwhMmaT8yFIgWPPRxzSP91DdXIWwn+nIL+l50K8=;
	b=drNCRSPhqsoP6Mt8tr/W00IbL+Pgf1t11DA3EGBtTsVEAUf5P3n2UbmRohSu87bD2uZTQP
	EVJgUxPLKe0YaOv1G3wepGKLsr9B5EsKmB9nTdfR4NXQgbPDfDsz1KBZp4tSlXC4k/2MaU
	7/eixA9p7wjrlSAdpUjsCLdwtUD7QtE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-kNuE2Z_qMxSOHvhNMHQ1_g-1; Mon, 15 Dec 2025 08:59:07 -0500
X-MC-Unique: kNuE2Z_qMxSOHvhNMHQ1_g-1
X-Mimecast-MFC-AGG-ID: kNuE2Z_qMxSOHvhNMHQ1_g_1765807146
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4775d8428e8so30382835e9.0
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 05:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765807146; x=1766411946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxDTKwhMmaT8yFIgWPPRxzSP91DdXIWwn+nIL+l50K8=;
        b=LpJtVA0gmoHjQnA3M/kZXndiToHeGr4FrQ4XBjgwJBCYMgSdpSHpKpGDsAmmhmKm1S
         ef5+kyQnxZxF0KoEgVmAY8hmfg+PCvxq1iVw0cbG2V3i3m7Koi4hp1M61fQbXXjI2UM7
         WK1UOFOxkfNdMPVP76hFNDDxsm131NGA/kc8lpHAMUCbpEHN7SKpc3PdR6FdhFV67RTV
         JIPVPPHD8KnHKrScgdU9/TLdzLQLQ9K8wBI8aqtQYn1odjOY+vqvxZXhG1Dn+tonwgJj
         e1jux2G6W8oeFrJpQcEn0mIpp9jFX4HQRvF8HfNtzT226QrZsO83JKHvhW3ghMRg+jRi
         U8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765807146; x=1766411946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxDTKwhMmaT8yFIgWPPRxzSP91DdXIWwn+nIL+l50K8=;
        b=h+3AX5P9wFxrFAL6HnAPHKQNiw/9+Sqtmj8Xw7xYVrnM2b5C18kql3fjglIHg07QS1
         izjIspP3GwY00K8mBCaI2anCDxVemcTWvSnhmrG23nJ3GLBVralYqotKunVjjWORLlAw
         KU08leKSu3qK0mGgs1khSaQxY/P5SDcAKAWAaoYYrTUloopc/pozbytfuyS6k2ZEzvJw
         ANJwdv64mZQIEwfm8NUbA2ePXZKWlX90Tk2sECWAIuiyq15uVG7/56gXwShzy9V3BqjH
         OShtHbO51GSnvJty1Ww2Dm3lKkUCZiwO2GyCQQwUx62B4pz9aC1m+TOskQpuH/U6vNNs
         c0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvWyfzpFT9/qGMZrljxUacrhsXg3YqcRqftOMGseVnq95sRw1sLFBbeaE/5AmKE0OqtyucmhENJuyPxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbXuuwHrwXpcnPUAeQOfjMGyJ6CuYOp95ETWHZF5zjuzLfvA9t
	uhQ36L3w8whbGwReqXpcGzUxFAC3O73HWaEAkPtBGQqDYrxRlNWPmhWeG4lKQ4gBQGDIU+Q94vz
	TOOTkBEn1t0lQVwCeIzGfM/eTaTiIJ6taIHyZdI37FxefkhqXGXDaDtmmU9l2S1pc
X-Gm-Gg: AY/fxX46qeBnqPPT/6PsFtdXMKE/B8O2/A4iGAdwFKvMLX4O8rO+pXBW+kBR0yp46DQ
	zVIoYJha6zV43zaG5pYN9+mP+LXwMAMncQwciyq+7IZVHveXBGyHjPxosY2UbwY3mud61D5Z266
	P48TEGHhHJzqO+Z+uNgxCDTcv3Z3Yg2bPNYs0+yyhZ3eVFufTQr2TwEgLJ/n504UqbZ7Olb3WuK
	Gj+srlTCooRLOrX+pKMy6IVtrQ2W8I+KWwf+nQ2PYxCDZxw94WvqIHuPz02JLPzZlTjZSRjKaS0
	6TFIeIsAgSfjWmS4CuPYZKB/HfhXiSGonxJjJjLZPLIuhQ1S/tpQag6fmXXrZJ7oXIyE6tDhD8o
	AX2l7
X-Received: by 2002:a05:600c:a40e:b0:477:b734:8c52 with SMTP id 5b1f17b1804b1-47a900bd6cfmr88610735e9.14.1765807146413;
        Mon, 15 Dec 2025 05:59:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqFocdgwq3FCiLwNZCPP3yGh7X+/+A4X5ZrVtcOGVh8JXh/FPlhQAyGrD/wsm7r0PlrPxysw==
X-Received: by 2002:a05:600c:a40e:b0:477:b734:8c52 with SMTP id 5b1f17b1804b1-47a900bd6cfmr88610465e9.14.1765807145881;
        Mon, 15 Dec 2025 05:59:05 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4a3e9fsm187336645e9.6.2025.12.15.05.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 05:59:05 -0800 (PST)
Date: Mon, 15 Dec 2025 14:59:04 +0100
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
Message-ID: <20251215-garnet-cheetah-of-adventure-ca6fdc@penduick>
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
 <07cdcce2-7724-4fe9-8032-258f6161e71d@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="l7ljucmjyhr7i7d4"
Content-Disposition: inline
In-Reply-To: <07cdcce2-7724-4fe9-8032-258f6161e71d@amd.com>


--l7ljucmjyhr7i7d4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
MIME-Version: 1.0

On Mon, Dec 15, 2025 at 02:30:47PM +0100, Christian K=C3=B6nig wrote:
> On 12/15/25 11:51, Maxime Ripard wrote:
> > Hi TJ,
> >=20
> > On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> >> On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redhat=
=2Ecom> wrote:
> >>>
> >>> The system dma-buf heap lets userspace allocate buffers from the page
> >>> allocator. However, these allocations are not accounted for in memcg,
> >>> allowing processes to escape limits that may be configured.
> >>>
> >>> Pass the __GFP_ACCOUNT for our allocations to account them into memcg.
> >>
> >> We had a discussion just last night in the MM track at LPC about how
> >> shared memory accounted in memcg is pretty broken. Without a way to
> >> identify (and possibly transfer) ownership of a shared buffer, this
> >> makes the accounting of shared memory, and zombie memcg problems
> >> worse. :\
> >=20
> > Are there notes or a report from that discussion anywhere?
> >=20
> > The way I see it, the dma-buf heaps *trivial* case is non-existent at
> > the moment and that's definitely broken. Any application can bypass its
> > cgroups limits trivially, and that's a pretty big hole in the system.
>=20
> Well, that is just the tip of the iceberg.
>=20
> Pretty much all driver interfaces doesn't account to memcg at the
> moment, all the way from alsa, over GPUs (both TTM and SHM-GEM) to
> V4L2.

Yes, I know, and step 1 of the plan we discussed earlier this year is to
fix the heaps.

> > The shared ownership is indeed broken, but it's not more or less broken
> > than, say, memfd + udmabuf, and I'm sure plenty of others.
> >=20
> > So we really improve the common case, but only make the "advanced"
> > slightly more broken than it already is.
> >=20
> > Would you disagree?
>=20
> I strongly disagree. As far as I can see there is a huge chance we
> break existing use cases with that.

Which ones? And what about the ones that are already broken?

> There has been some work on TTM by Dave but I still haven't found time
> to wrap my head around all possible side effects such a change can
> have.
>=20
> The fundamental problem is that neither memcg nor the classic resource
> tracking (e.g. the OOM killer) has a good understanding of shared
> resources.

And yet heap allocations don't necessarily have to be shared. But they
all have to be allocated.

> For example you can use memfd to basically kill any process in the
> system because the OOM killer can't identify the process which holds
> the reference to the memory in question. And that is a *MUCH* bigger
> problem than just inaccurate memcg accounting.

When you frame it like that, sure. Also, you can use the system heap to
DoS any process in the system. I'm not saying that what you're concerned
about isn't an issue, but let's not brush off other people legitimate
issues as well.

Maxime

--l7ljucmjyhr7i7d4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUAUIwAKCRAnX84Zoj2+
duttAX9Ga4fqCYlX2dwZgwnc6nPNr0N4H4lEcTNLVs1FO6VC/tdfQXgym9Jnci7z
b5tpPZkBf06sCKJuANIMHhKZwJ4dsNb9bC0X9JuS9CoEhy2fKPraCO3Vf1oezx0e
uJhMcKjuFg==
=SrQ0
-----END PGP SIGNATURE-----

--l7ljucmjyhr7i7d4--



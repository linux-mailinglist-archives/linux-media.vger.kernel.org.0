Return-Path: <linux-media+bounces-14329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B3891BD67
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 13:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F219283F12
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 11:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D0A156984;
	Fri, 28 Jun 2024 11:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKSsS2Y9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7695D152179;
	Fri, 28 Jun 2024 11:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719574163; cv=none; b=Wpo02WGydzhIvMqRyhxWhr3tdQ+tc/LR52Tv9cvaCqAHQ8+haPuKmQ2jDOldAzyUdm4nLpKDGiDUWTagB2nn1h7a7YLCMVFsJJ7Zt8hAH8usDtYuhQkiQlw8pd72nFrWaeQ179ir+LoXH0m2IduHV6haDovudF/4olaTHiGLhXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719574163; c=relaxed/simple;
	bh=k0zq4I2xpIIHUPwrd+noMDLx1nxxe1on/uPa8q9W890=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTaA818V65IHXUHqwktGGEceXrc53Itm93wo8mJNE5POQhgFBMkBU5ufq+w3aS1am/4vxU9251+fGetEUaV3fNUPmmIIIZ8KycqJRUicNG0CImHR+wS7CnAAelS4WtSo3zS70OIrC38LknKy6TAxYNrQlgU5c7JWUFmlK4ZmbWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKSsS2Y9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3629c517da9so423143f8f.2;
        Fri, 28 Jun 2024 04:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719574160; x=1720178960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VwHyv+/nheDOEQqvCDypmg/zh1UxDN8rLzkHFy0r5dk=;
        b=nKSsS2Y9hyTym2ulGQNvdGhOc1mrC8sjdB55Gi3wkzV0CwRxDJNKhMXAwmtFeCDg6R
         gCxfOqBwJgtQE8CIaJw9hRRzUHJMUjsUSWox/f4DfXztlBVpgbwZrMMPvDUtVGlDtZHs
         5CgSwbh09MIBuOxgY9VjlGLRxdvbD/ey4WhoaUNfwxo1yGFeH1u7oKEtZxID9GmrTT56
         Q2gTd4JTJraRI/hfC9zMrucooEZ1FTs0vf/FHsEi4jBvk6Gs0y5NZvjFLZFWk3b7pmyZ
         mBq3BeISpP8q1WLkGHUEyLKcKdFgNAkvLqbUutru8el45hNYT9gMV7waHYXGxY2FO01Q
         RoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719574160; x=1720178960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwHyv+/nheDOEQqvCDypmg/zh1UxDN8rLzkHFy0r5dk=;
        b=OWaPHIMCH5OjdZ+nUNNOOx1m0IeHUj8Lhoy8td+yOUh5UG/2D8ZpBmDITlxbxAuthe
         fyu1BqSLnnVFtxrVdZy1XHB/VHHUMzmNxY5FpF8BTl87CX5HARZ4D7gJOtriGyf1oz7y
         uf1D3AMRw93vfrPsX0038M2TGGu+yFZH0jXvXR7YZdvtkHp2ymBDq2cHEQ+6eiMpP44Y
         7L8OJ/zYceZgnfIQctu1bQtRPtVV5t43rr0IMQU47x1vChGSte6ebHDmL6VpvKDl9u3W
         2+KrdvKV8ox77ATTicaaAGkNt+RfB/0OyV7SIUUye6YzVLCEHwjmjq8HE0W1katvJtrf
         18GA==
X-Forwarded-Encrypted: i=1; AJvYcCXun0fzgY5gtGvEu7y9EEvTBOBf5JCOd5Kh2hkmi2T4ex90vGy/jILFURXeT2wcvfElDdKLjsej7vDwbarJv3QcYxXNul+X+wMvMAtfXWgJzXq5BwgZah+u7Eh47K3wwwMHLY2w56IiIf0OxH7fAkNg75jK3FzoXMOHKieTSLAsMawh6Jyu
X-Gm-Message-State: AOJu0Yy1L7AM+mT6rDvCmB0KP9Qyxkk2aT7Ph4APT13kQB9y6CGyA/zq
	e7mJvr6GMrXYyGYI7GEOuaDPasxKEyQneIAVZE2EQveEIIsifipZ/3Xyqg==
X-Google-Smtp-Source: AGHT+IHSIPxiCQZHyj0KQ1gk5pY4ojyWZH16385yV/UYI3N9XukgmcAnac3lAWtu5FDl9Cb+4IKZ9g==
X-Received: by 2002:adf:f450:0:b0:360:9a40:3dd8 with SMTP id ffacd0b85a97d-366e96567cemr12944422f8f.65.1719574159201;
        Fri, 28 Jun 2024 04:29:19 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b09a828sm31184325e9.37.2024.06.28.04.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:29:18 -0700 (PDT)
Date: Fri, 28 Jun 2024 13:29:17 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: John Stultz <jstultz@google.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
Message-ID: <qy7aczeu6kumv5utemoevi7omp5ryq55zmgzxh5hrz5orf2osp@wypg66awof4n>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
 <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kapzi2mpfibvyjib"
Content-Disposition: inline
In-Reply-To: <ZkyOOwpM57HIiO3v@phenom.ffwll.local>


--kapzi2mpfibvyjib
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 02:06:19PM GMT, Daniel Vetter wrote:
> On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
> > On Thu, May 16, 2024 at 3:56=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch>=
 wrote:
> > > On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> > > > But it makes me a little nervous to add a new generic allocation fl=
ag
> > > > for a feature most hardware doesn't support (yet, at least). So it's
> > > > hard to weigh how common the actual usage will be across all the
> > > > heaps.
> > > >
> > > > I apologize as my worry is mostly born out of seeing vendors really
> > > > push opaque feature flags in their old ion heaps, so in providing a
> > > > flags argument, it was mostly intended as an escape hatch for
> > > > obviously common attributes. So having the first be something that
> > > > seems reasonable, but isn't actually that common makes me fret some.
> > > >
> > > > So again, not an objection, just something for folks to stew on to
> > > > make sure this is really the right approach.
> > >
> > > Another good reason to go with full heap names instead of opaque flag=
s on
> > > existing heaps is that with the former we can use symlinks in sysfs to
> > > specify heaps, with the latter we need a new idea. We haven't yet got=
ten
> > > around to implement this anywhere, but it's been in the dma-buf/heap =
todo
> > > since forever, and I like it as a design approach. So would be a good=
 idea
> > > to not toss it. With that display would have symlinks to cma-ecc and =
cma,
> > > and rendering maybe cma-ecc, shmem, cma heaps (in priority order) for=
 a
> > > SoC where the display needs contig memory for scanout.
> >=20
> > So indeed that is a good point to keep in mind, but I also think it
> > might re-inforce the choice of having ECC as a flag here.
> >=20
> > Since my understanding of the sysfs symlinks to heaps idea is about
> > being able to figure out a common heap from a collection of devices,
> > it's really about the ability for the driver to access the type of
> > memory. If ECC is just an attribute of the type of memory (as in this
> > patch series), it being on or off won't necessarily affect
> > compatibility of the buffer with the device.  Similarly "uncached"
> > seems more of an attribute of memory type and not a type itself.
> > Hardware that can access non-contiguous "system" buffers can access
> > uncached system buffers.
>=20
> Yeah, but in graphics there's a wide band where "shit performance" is
> defacto "not useable (as intended at least)".
>=20
> So if we limit the symlink idea to just making sure zero-copy access is
> possible, then we might not actually solve the real world problem we need
> to solve. And so the symlinks become somewhat useless, and we need to
> somewhere encode which flags you need to use with each symlink.
>=20
> But I also see the argument that there's a bit a combinatorial explosion
> possible. So I guess the question is where we want to handle it ...

Sorry for jumping into this discussion so late. But are we really
concerned about this combinatorial explosion in practice? It may be
theoretically possible to create any combination of these, but do we
expect more than a couple of heaps to exist in any given system?

Would it perhaps make more sense to let a platform override the heap
name to make it more easily identifiable? Maybe this is a naive
assumption, but aren't userspace applications and drivers not primarily
interested in the "type" of heap rather than whatever specific flags
have been set for it?

For example, if an applications wants to use a protected buffer, the
application doesn't (and shouldn't need to) care about whether the heap
for that buffer supports ECC or is backed by CMA. All it really needs to
know is that it's the system's "protected" heap.

This rather than try to represent every possible combination we
basically make this a "configuration" issue. System designers need to
settle on whatever combination of flags work for all the desired use-
cases and then we expose that combination as a named heap.

One problem that this doesn't solve is that we still don't have a way of
retrieving these flags in drivers which may need them. Perhaps one way
to address this would be to add in-kernel APIs to allocate from a heap.
That way a DRM/KMS driver (for example) could find a named heap,
allocate from it and implicitly store flags about the heap/buffer. Or
maybe we could add in-kernel API to retrieve flags, which would be a bit
better than having to expose them to userspace.

Thierry

--kapzi2mpfibvyjib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+nooACgkQ3SOs138+
s6E98RAAv7+i/7uJg+tq6+f8CJRlZOqAtn8prnuvk6eIf4H6fKxsN81OpDd288mJ
Xq9XkIUEjLpb/ZGcXZXqQn8lO9d5/Q8aSuFOPNmDJwNdV/XXs+gNkf9lEvs61oPa
lO3xPqP2BN7AZKwF6iVCUQ2pLcIFGbhVtJNcLkNNh0GtdH76bpHubTMGL+RoPtm6
e1ktKqwr4Z0ur56l00LBy+OQ3A38tTIMq/5XLfESeAOQbqx7gszLJOYzvh58tAS5
EYH/1c09cLk82EGjb0xb8IWvDhWn8RzCNeyX2F+gpfJsYHIWO9R/ygk+lBiMXgHx
8Ynhlb7gL7fmO0M+vx63IkvPD6YSxlqAkLU+IDs7GMzRBrwh8NPcgkfWTXRu4vYf
3r5Ere84xSZpat+ijjGDnckkMN4QeMXLn8wj0ZuaP26kjSX6R7gTKBINxm3LsivH
gGI4Ab2FlVU5dGrHmewZt79+dAiWBd6y6ks6MVVBdzSNp9DCALKMDU2yZqh+fieA
+FCuIknJvPSZFr57m89YBZ2VqgoW+SHiaUabiscvldcW8DE/1QLNa54NN/1oLaJ3
GCH34Xrl9BzuuD9Ph7Og7AoU7Y4nrB0NxgHWeMtpGTZqGvafMMZ9doVxBkHfT3z3
rfQFVdZn2sWNqJFdLwzfR9O8UmF0w/rOxi9mwriAeGVXmUjUB/I=
=6/gO
-----END PGP SIGNATURE-----

--kapzi2mpfibvyjib--


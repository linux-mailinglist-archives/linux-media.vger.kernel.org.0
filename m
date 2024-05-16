Return-Path: <linux-media+bounces-11551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFC38C7640
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 14:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C17691F20CEF
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 12:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA927156221;
	Thu, 16 May 2024 12:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSjoRR0b"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4461474A6;
	Thu, 16 May 2024 12:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715862119; cv=none; b=pHbEJbarqldN1CJYjoKVCL3UHGyvgbsrOC7YeTrk2SGzoMoHttEkMvPYTcNzwISSpssWMx8NtwCPJfupXes1iEH4G0P8Ve+3GkyqvyZlDs1gmymEkEcwDG4U/qPwZYfkky4Yj3ma4PgI51dLmuz5qJCVxLN5b0xmNE9TOxejtpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715862119; c=relaxed/simple;
	bh=og2Nqqaql9Pj5FhU3UnTUi0Dq2iCUYzxBGOkcdtvLyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LW4gZy92RgUkJGSphow/BBTM0xFWpo53V223SaIoRNa+BHvWP1yz/O6BfkPw+QbA6Td4Wd2fj0KGF6Vxh0MpzD/X3H7rjxWezLrJrfwO8bXFuvcBVoJeVYE0vorVhtcI038joFGsCxnQP2ZaMzezOkaZQyjCC/VY2GOu0NTUx1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSjoRR0b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18360C2BD11;
	Thu, 16 May 2024 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715862118;
	bh=og2Nqqaql9Pj5FhU3UnTUi0Dq2iCUYzxBGOkcdtvLyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jSjoRR0bdV7cvpZVVM41FV1kAcxVnP3ZkQ7KWgn7qAQaco1R7LaFpSWK+y53DTQHz
	 Gbrr8X5h9mMRQNE1BLYdh52u5xgCdJM5Q97tEoX4NWBWZ/GDBLqATfRPPqyU3Y08d0
	 ekRwpEKYYNDJ3oOKEQ2wEC1pJfgH5NSZYik1C/KHezwvSbnZgrsaTUQPz/XzFV3K7k
	 Mif5MjrrWIyHQO4sx1x4qBDazGCUr4pyyvfg0McFPsTKDp3igMKJMy/BnYQi1OXoG6
	 Ha6hCRXavz2UUhJmSzE+bZTYmbIF1IAikT7MTxPrXznj9BRKGKj9HOGrQWp7emJoYp
	 xybjPdYK+PUjw==
Date: Thu, 16 May 2024 14:21:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: John Stultz <jstultz@google.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
Message-ID: <20240516-truthful-fair-kudu-adb6df@penduick>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="npe44gq3m5hshith"
Content-Disposition: inline
In-Reply-To: <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>


--npe44gq3m5hshith
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Thanks for your feedback

On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> On Wed, May 15, 2024 at 6:57=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > This series is the follow-up of the discussion that John and I had a few
> > months ago here:
> >
> > https://lore.kernel.org/all/CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHq=
qyrroCMQ@mail.gmail.com/
> >
> > The initial problem we were discussing was that I'm currently working on
> > a platform which has a memory layout with ECC enabled. However, enabling
> > the ECC has a number of drawbacks on that platform: lower performance,
> > increased memory usage, etc. So for things like framebuffers, the
> > trade-off isn't great and thus there's a memory region with ECC disabled
> > to allocate from for such use cases.
> >
> > After a suggestion from John, I chose to start using heap allocations
> > flags to allow for userspace to ask for a particular ECC setup. This is
> > then backed by a new heap type that runs from reserved memory chunks
> > flagged as such, and the existing DT properties to specify the ECC
> > properties.
> >
> > We could also easily extend this mechanism to support more flags, or
> > through a new ioctl to discover which flags a given heap supports.
>=20
> Hey! Thanks for sending this along! I'm eager to see more heap related
> work being done upstream.
>=20
> The only thing that makes me a bit hesitant, is the introduction of
> allocation flags (as opposed to a uniquely specified/named "ecc"
> heap).
>=20
> We did talk about this earlier, and my earlier press that only if the
> ECC flag was general enough to apply to the majority of heaps then it
> makes sense as a flag, and your patch here does apply it to all the
> heaps. So I don't have an objection.
>=20
> But it makes me a little nervous to add a new generic allocation flag
> for a feature most hardware doesn't support (yet, at least). So it's
> hard to weigh how common the actual usage will be across all the
> heaps.
>=20
> I apologize as my worry is mostly born out of seeing vendors really
> push opaque feature flags in their old ion heaps, so in providing a
> flags argument, it was mostly intended as an escape hatch for
> obviously common attributes. So having the first be something that
> seems reasonable, but isn't actually that common makes me fret some.
>=20
> So again, not an objection, just something for folks to stew on to
> make sure this is really the right approach.

I understand your hesitation and concern :) Is there anything we could
provide that would help moving the discussion forward?

> Another thing to discuss, that I didn't see in your mail: Do we have
> an open-source user of this new flag?

Not at the moment. I guess it would be one of the things that would
reduce your concerns, but is it a requirement?

Thanks!
Maxime

--npe44gq3m5hshith
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkX6VAAKCRAnX84Zoj2+
dvFkAX4hPR+OmB6uyCvlMnPDpOA7eFAD+O5/7X+BRKTf5Cmdj+Cie8BhtyQAl7C8
Hky2TnoBgM2pwhStelk3c11olIba3Ix/Pi7eLLvudC0t/wilucjcMDy5wbyzQGJw
YksYgv+49Q==
=UGuj
-----END PGP SIGNATURE-----

--npe44gq3m5hshith--


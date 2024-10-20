Return-Path: <linux-media+bounces-19998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AAC9A6F75
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 18:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 031CB283E5E
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 16:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8923F1CFEC1;
	Mon, 21 Oct 2024 16:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gx38Tp/U"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E6C191F81;
	Mon, 21 Oct 2024 16:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729528218; cv=none; b=iUhT5LPzqJR+KFENLLyyEsYo+qXfgqPJgkjiZcnrCrmvD10hTBPh6ED5h9LN4QWAiRM9bRkbrJf1ie9NW1q0ykXcYOwQy8f/mnmL28HVub1st4ctNpPUnCJyq+N51kBPItxTMbsSEpoK8/HsEzERkk2PJb7KBPjyaXhadXoqbHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729528218; c=relaxed/simple;
	bh=2LDTaveehZdRfWHaRCsXwhisOputZxFsmf8gMuLd480=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIbGfzKW9BIxdDZn9b69prRM0RkVs1y5KV55MOz7ni+QQTVVpaTROCWLUiqPmGJwuWGqu07onfDTrBxZacXBMrmG+Po4mX15reKH1n77ACzR/4BPvtzR+r5OlU7oUZv9xeASumwoVRMqJ67ab9YwAKIjeauJ5BqpHc0JAT83so4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gx38Tp/U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23EDC4CEC3;
	Mon, 21 Oct 2024 16:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729528218;
	bh=2LDTaveehZdRfWHaRCsXwhisOputZxFsmf8gMuLd480=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gx38Tp/UnlehadMq0pHQ6zjvKR/R+BZH3HZOLkQsgW9hd4bjjzYL3LGwBRqMFBxOY
	 WMTJjbvkl2ZVl75fVnWSznP5GkTkwuk6VA+z7sCyKwuwKxHpj4/sWtYAn48omavELQ
	 g4KBDkbvDiHo93dV1u21sta35PrJpll8fq/D7yW36Lgrq0z4Rrqm9gnQmD+sW7XRCS
	 mGmQTGTkiigrQNyHc2GlWzBn9h/lhBdAHq5FxCfGF4sh3Z7fWaFZTHInHtuztIiSd+
	 r7neyunkNlctbcejeK2ao/tziUx2AutTQbO4AEOWLUj00Ip203aEHhrMIkSau+UNI6
	 QCsKds8g93iVw==
Date: Mon, 21 Oct 2024 18:30:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add heap name definitions
Message-ID: <20241021-defiant-unicorn-of-authority-b23277@houat>
References: <20240930144057.453751-1-mripard@kernel.org>
 <CABdmKX3=h57Jcphiq2Ekseg=j_ay8frmFgyHKWb04b4J5f2T5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="s2ffrzbhmhcapo4x"
Content-Disposition: inline
In-Reply-To: <CABdmKX3=h57Jcphiq2Ekseg=j_ay8frmFgyHKWb04b4J5f2T5w@mail.gmail.com>


--s2ffrzbhmhcapo4x
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add heap name definitions
MIME-Version: 1.0

Hi TJ,

Thanks for your review

On Tue, Oct 01, 2024 at 11:03:41PM +0200, T.J. Mercier wrote:
> On Mon, Sep 30, 2024 at 4:41=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > Following a recent discussion at last Plumbers, John Stultz, Sumit
> > Sewal, TJ Mercier and I came to an agreement that we should document
> > what the dma-buf heaps names are expected to be, and what the buffers
> > attributes you'll get should be documented.
> >
> > Let's create that doc to make sure those attributes and names are
> > guaranteed going forward.
>=20
> Hey, thanks for sending this!
>=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> >
> > ---
> >
> > To: Jonathan Corbet <corbet@lwn.net>
> > To: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > Cc: John Stultz <jstultz@google.com>
> > Cc: "T.J. Mercier" <tjmercier@google.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-doc@vger.kernel.org
> > ---
> >  Documentation/userspace-api/dma-buf-heaps.rst | 71 +++++++++++++++++++
> >  Documentation/userspace-api/index.rst         |  1 +
> >  2 files changed, 72 insertions(+)
> >  create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst
> >
> > diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentat=
ion/userspace-api/dma-buf-heaps.rst
> > new file mode 100644
> > index 000000000000..00436227b542
> > --- /dev/null
> > +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> > @@ -0,0 +1,71 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > +Allocating dma-buf using heaps
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Dma-buf Heaps are a way for userspace to allocate dma-buf objects. The=
y are
> > +typically used to allocate buffers from a specific allocation pool, or=
 to share
> > +buffers across frameworks.
> > +
> > +Heaps
> > +=3D=3D=3D=3D=3D
> > +
> > +A heap represent a specific allocator. The Linux kernel currently supp=
orts the
>=20
> "represents"
>=20
> > +following heaps:
> > +
> > + - The ``system`` heap allocates virtually contiguous, cacheable, buff=
ers
>=20
> Virtually contiguous sounds a little weird to me here. Sure, that's
> what userspace will get when it maps the buffer (and I guess this *is*
> UAPI documentation after all), but I'm not sure it's correct to say
> that's a property of the buffer itself? What if we invert this and
> instead say that there is NO guarantee that the memory for the buffer:
>  - is physically contiguous
>  - has any particular alignment (greater than page aligned)
>  - has any particular page size (large order allocations are attempted
> first, but not guaranteed or even likely on some systems)
>  - has bounds on physical addresses
>=20
> Maybe that is too much detail here...

Yeah, I don't know.

It's getting philosophical, but I guess there's an infinite number of
guarantees we wouldn't provide. It seems easier for me to maintain a
list of the things a buffer is/has rather than the opposite.

But maybe we can rephrase virtually contiguous if it's weird to you?

> > +
> > + - The ``reserved`` heap allocates physically contiguous, cacheable, b=
uffers.
> > +   Depending on the platform, it might be called differently:
> > +
> > +    - Acer Iconia Tab A500: ``linux,cma``
> > +    - Allwinner sun4i, sun5i and sun7i families: ``default-pool``
> > +    - Amlogic A1: ``linux,cma``
> > +    - Amlogic G12A/G12B/SM1: ``linux,cma``
> > +    - Amlogic GXBB/GXL: ``linux,cma``
> > +    - ASUS EeePad Transformer TF101: ``linux,cma``
> > +    - ASUS Google Nexus 7 (Project Bach / ME370TG) E1565: ``linux,cma``
> > +    - ASUS Google Nexus 7 (Project Nakasi / ME370T) E1565: ``linux,cma=
``
> > +    - ASUS Google Nexus 7 (Project Nakasi / ME370T) PM269: ``linux,cma=
``
> > +    - Asus Transformer Infinity TF700T: ``linux,cma``
> > +    - Asus Transformer Pad 3G TF300TG: ``linux,cma``
> > +    - Asus Transformer Pad TF300T: ``linux,cma``
> > +    - Asus Transformer Pad TF701T: ``linux,cma``
> > +    - Asus Transformer Prime TF201: ``linux,cma``
> > +    - ASUS Vivobook S 15: ``linux,cma``
> > +    - Cadence KC705: ``linux,cma``
> > +    - Digi International ConnectCore 6UL: ``linux,cma``
> > +    - Freescale i.MX8DXL EVK: ``linux,cma``
> > +    - Freescale TQMa8Xx: ``linux,cma``
> > +    - Hisilicon Hikey: ``linux,cma``
> > +    - Lenovo ThinkPad T14s Gen 6: ``linux,cma``
> > +    - Lenovo ThinkPad X13s: ``linux,cma``
> > +    - Lenovo Yoga Slim 7x: ``linux,cma``
> > +    - LG Optimus 4X HD P880: ``linux,cma``
> > +    - LG Optimus Vu P895: ``linux,cma``
> > +    - Loongson 2k0500, 2k1000 and 2k2000: ``linux,cma``
> > +    - Microsoft Romulus: ``linux,cma``
> > +    - NXP i.MX8ULP EVK: ``linux,cma``
> > +    - NXP i.MX93 9x9 QSB: ``linux,cma``
> > +    - NXP i.MX93 11X11 EVK: ``linux,cma``
> > +    - NXP i.MX93 14X14 EVK: ``linux,cma``
> > +    - NXP i.MX95 19X19 EVK: ``linux,cma``
> > +    - Ouya Game Console: ``linux,cma``
> > +    - Pegatron Chagall: ``linux,cma``
> > +    - PHYTEC phyCORE-AM62A SOM: ``linux,cma``
> > +    - PHYTEC phyCORE-i.MX93 SOM: ``linux,cma``
> > +    - Qualcomm SC8280XP CRD: ``linux,cma``
> > +    - Qualcomm X1E80100 CRD: ``linux,cma``
> > +    - Qualcomm X1E80100 QCP: ``linux,cma``
> > +    - RaspberryPi: ``linux,cma``
> > +    - Texas Instruments AM62x SK board family: ``linux,cma``
> > +    - Texas Instruments AM62A7 SK: ``linux,cma``
> > +    - Toradex Apalis iMX8: ``linux,cma``
> > +    - TQ-Systems i.MX8MM TQMa8MxML: ``linux,cma``
> > +    - TQ-Systems i.MX8MN TQMa8MxNL: ``linux,cma``
> > +    - TQ-Systems i.MX8MPlus TQMa8MPxL: ``linux,cma``
> > +    - TQ-Systems i.MX8MQ TQMa8MQ: ``linux,cma``
> > +    - TQ-Systems i.MX93 TQMa93xxLA/TQMa93xxCA SOM: ``linux,cma``
> > +    - TQ-Systems MBA6ULx Baseboard: ``linux,cma``
> > +
>=20
> This part LGTM. Might be worth it to document that a CMA region must
> be specified on the kernel command line. Otherwise this heap won't
> show up at runtime by only enabling the kernel configs necessary to
> build it.

Really? My understanding was that you need a default CMA region, which
happens either if you have cma=3D on the kernel command line, a default
CMA pool in the DT, or if CMA_SIZE_MBYTES isn't set to 0?

Maxime

--s2ffrzbhmhcapo4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxaBkAAKCRAnX84Zoj2+
dqjHAYDOF5c6RNgjdendRdyPhXQAC1ISWO1BSqCCIHxAPxfwOWwMLgheo1wWWdM2
VlGKPnsBgLP8NmXOvds/WbOjrEOW8ouZnGoAxxOlVwyENTXyxNIcf781az0gtNCf
RgmGRA/B5A==
=QvhE
-----END PGP SIGNATURE-----

--s2ffrzbhmhcapo4x--


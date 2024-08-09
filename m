Return-Path: <linux-media+bounces-16058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E756394D283
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 16:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 806AAB2196C
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 14:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E47B198825;
	Fri,  9 Aug 2024 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2JA35G7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6205D197A68;
	Fri,  9 Aug 2024 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723214965; cv=none; b=mb1QbTicEkSoA1556ePcYJtDY3SPKTgA2GKQyhRPg+sKBqLvKjXXsn4Yn42B1H8LFndjx86gyQgHkAK6mpYLYA35zz8e1IvGCzqTuDgySfkd8T2pI++SxChWthISedloW6xD2leabpdm9N4PIpN8ebPLWIpUZ9TqQzYYra928Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723214965; c=relaxed/simple;
	bh=26n09ZIaJtD0l1jyPbXELEN64tF3YdvsFI0WbmrVEqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjbZcizPqQBc0DQcpvmkgTaz/ehpc5e1oKsbKKC9YZWf1tmn+eXAKApuyJ3QBBg/Tqe1+o7LRt7eh4fogjdeJohbffXIyn5joQLRc5/RpJWs7BkQqK0ut82v+k+PpP6DE73TK+rfdlQ+UxQ075zYEKAM80B392WDMOzY/tuv6Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2JA35G7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E49C4AF0D;
	Fri,  9 Aug 2024 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723214964;
	bh=26n09ZIaJtD0l1jyPbXELEN64tF3YdvsFI0WbmrVEqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2JA35G7gH/3s3VRNzS8PKNYunNi9aYQoVFy8XmJ+BwfY5+bQa7LTU3v1QTfEBH3z
	 1t4PxiF8wc0NPzfu0gGcJvmJ5VmEiSi+Iq0iwjl++g93EP98Q0DQrXRG3xN9y0We0I
	 bf1MPn6fHCyPlu0BUjSdcq+Qw5H0nGovMyYEVmjHAFjeUpy1vqOqYvHdhJAMmAniIF
	 d60vrsmjvpbV/gABQG5bJECMEkg2ftFXso1EZx1AWXsGn7jxRGwUm+XHwQufcnGt9f
	 L+r+rgdbLYi/JOksgGbaFh2DYTh7wcwOaJi0qFR0aOr9yNcLD0+IGD4Lc5GF9d75er
	 hwoaAVk4w+VkQ==
Date: Fri, 9 Aug 2024 15:49:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240809-smuggler-patrol-067003f0ba9b@spud>
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
 <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>
 <20240808-backyard-unglue-3cf429ad8da5@spud>
 <CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SxlQ+XhTGBIdU8Mo"
Content-Disposition: inline
In-Reply-To: <CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>


--SxlQ+XhTGBIdU8Mo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2024 at 02:47:53PM +0800, Keguang Zhang wrote:
> On Thu, Aug 8, 2024 at 11:37=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, Aug 08, 2024 at 07:22:19PM +0800, Keguang Zhang via B4 Relay wr=
ote:
> > > From: Keguang Zhang <keguang.zhang@gmail.com>
> > >
> > > Add devicetree binding document for Loongson-1 NAND Controller.
> > >
> > > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > > ---
> > > Changes in v8:
> > > - Add a description part.
> > > - Adjust the compatible because the match data for ls1c-nfc differs f=
rom ls1b-nfc.
> > > - Mark 'nand-use-soft-ecc-engine' and 'nand-ecc-algo' as mandatory.
> > > - Delete the superfluous blank lines.
> > >
> > > Changes in v7:
> > > - rename the file to loongson,ls1b-nfc.yaml
> > >
> > > Changes in v6:
> > > - A newly added patch
> > > ---
> > >  .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml | 75 ++++++++++++=
++++++++++
> > >  1 file changed, 75 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.=
yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> > > new file mode 100644
> > > index 000000000000..7ce335324a29
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> >
> > When I first read "nfc" here I thought it was a copy-paste mistake, as
> > "nfc" is a technology of it's own. I think it would make sense to rename
> > to "loongson,ls1b-nand-controller" etc to remove that sort of confusion.
> > These devices might not implement NFC, but what's to say that a future
> > device will not?
> >
> Sorry for the confusion.
> The string "loongson,ls1b-nand-controller" might be too long.

It "might"? Why do you think it is too long?

> May I rename it to "loongson,ls1b-nand"?

Sure.

--SxlQ+XhTGBIdU8Mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrYscAAKCRB4tDGHoIJi
0tPAAPsG15YkPAlg2tUUrN2amO1EFgloq1wSMyBK1Q29C6L50AEA4AVTK9jOQ9Zg
mm2+nrwrqf0WFQT/soeSzKGLISNMVg4=
=zt9F
-----END PGP SIGNATURE-----

--SxlQ+XhTGBIdU8Mo--


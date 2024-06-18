Return-Path: <linux-media+bounces-13561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A305E90D5C9
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45AE9289EE0
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C67113C807;
	Tue, 18 Jun 2024 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5ocSYpJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0476A1586C7;
	Tue, 18 Jun 2024 14:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721092; cv=none; b=M/34CnS4UPY9PVtfs0zL4fg//15ep546gYyothGhwFU/LJ+bmcBZhb+uNo8SaAwMlpGmSuL6deQO9AGQ7EKgVrpImhUT5GjUcGqINxe7JqjWz0gkZrOGWUy0WAEtOLF1RQw4g87aP0W+3uQ9ZGMdb17IKyn3X9w43YTzxyEjZh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721092; c=relaxed/simple;
	bh=s4vPJGYWZCq+Cc2fZQWHmYxr1kYfC6dNufjoTd7Y6TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a64T0/O3jVX/N86zfCC+MoHSC6hwkzTZR7690dg20q8Fi8bYpQFRrYvTS01h91MFq2AT+DjcMat8DC7IJxcWXFvdmaBEbFf/QkhLuJuOQzf0jtAns7BiPXsqX9nQPocyeSweASdvntI0MwPIzHLUXC/W/1v7ZwRveZppoMYo4z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5ocSYpJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953B0C4AF1C;
	Tue, 18 Jun 2024 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718721090;
	bh=s4vPJGYWZCq+Cc2fZQWHmYxr1kYfC6dNufjoTd7Y6TM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X5ocSYpJ0jkKRdDS6HTT6shzfyaklzJSIT1k5TgV8wpFrw8OhUTMkrLOFvDA4u9h2
	 Vv4HVgRbKZaQ2ox1YTpa1P/PX/+ERbL6rBQbymCvE4lsVniYP9e/vxeB5La28wdIrL
	 4kixtBFfa3jGwWnnqBnyo44/3x5yd/ukuKv8+dgd77LjU11GaHtMpfV+qY5QEAK2Fh
	 kJC6380d2D7Bpv9K5kfCwxXWiOTxb9Ms0LlInW8rNVmampiWcJlFAoSztpDD2f6qjl
	 ZwKzQVdZFEEP2BRNTqsI0KiCUfS0lbrvw4wZxzas/Ova1j+Umz6TKROyzHAeU4+m8h
	 tXR4FeAVy+mUQ==
Date: Tue, 18 Jun 2024 15:31:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240618-author-unwrapped-519359da5161@spud>
References: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
 <20240610113124.2396688-2-niklas.soderlund+renesas@ragnatech.se>
 <20240610-screen-wolverine-78370c66d40f@spud>
 <20240610165935.GA382677@ragnatech.se>
 <20240610-yoga-antler-e6447592de16@spud>
 <20240611110617.GD382677@ragnatech.se>
 <20240613165111.GA2005299-robh@kernel.org>
 <CAMuHMdUQr0pzhL6Tq=R_TTUSu5wDZO-sWQHkuLg4C=xv9TyoWQ@mail.gmail.com>
 <20240618135753.GQ382677@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CkYNxKz40gnO5wVW"
Content-Disposition: inline
In-Reply-To: <20240618135753.GQ382677@ragnatech.se>


--CkYNxKz40gnO5wVW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 03:57:53PM +0200, Niklas S=C3=B6derlund wrote:
> Hi All,
>=20
> On 2024-06-13 21:35:13 +0200, Geert Uytterhoeven wrote:
> > Hi Rob, Conor,
> >=20
> > On Thu, Jun 13, 2024 at 6:51=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> > > On Tue, Jun 11, 2024 at 01:06:17PM +0200, Niklas S=C3=B6derlund wrote:
> > > > On 2024-06-10 22:32:29 +0100, Conor Dooley wrote:
> > > > > On Mon, Jun 10, 2024 at 06:59:35PM +0200, Niklas S=C3=B6derlund w=
rote:
> > > > > > On 2024-06-10 17:03:49 +0100, Conor Dooley wrote:
> > > > > > > On Mon, Jun 10, 2024 at 01:31:23PM +0200, Niklas S=C3=B6derlu=
nd wrote:
> > > > > > > > Document support for the VIN module in the Renesas V4M (r8a=
779h0) SoC.
> > > > > > > >
> > > > > > > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+rene=
sas@ragnatech.se>
> > > > > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > > > ---
> > > > > > > >  Documentation/devicetree/bindings/media/renesas,vin.yaml |=
 1 +
> > > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > >
> > > > > > > > diff --git a/Documentation/devicetree/bindings/media/renesa=
s,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > > > > index 5539d0f8e74d..168cb02f8abe 100644
> > > > > > > > --- a/Documentation/devicetree/bindings/media/renesas,vin.y=
aml
> > > > > > > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.y=
aml
> > > > > > > > @@ -54,6 +54,7 @@ properties:
> > > > > > > >                - renesas,vin-r8a77995 # R-Car D3
> > > > > > > >                - renesas,vin-r8a779a0 # R-Car V3U
> > > > > > > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > > > > > > +              - renesas,vin-r8a779h0 # R-Car V4M
> > > > > > >
> > > > > > > Your driver patch suggests that this is compatible with the g=
 variant.
> > > > > >
> > > > > > Currently it is. But that not always be true, I tried to outlin=
e this in
> > > > > > to cover letter.
> > > > >
> > > > > To be honest, I don't usually read cover letters when reviewing b=
indings.
> > > > > Information about why things are/are not compatible should be in a
> > > > > commit itself.
> > > > >
> > > > > >     The V4M capture pipeline is similar to the other Gen4 SoC s=
upported
> > > > > >     upstream already V4H. Currently all futures supported for V=
IN on V4M are
> > > > > >     also supported by V4H and the driver code can be shared. Bu=
t as done for
> > > > > >     other R-Car IP bindings a new dedicated binding for V4M is =
created.
> > > > > >     This have proved prudent in the past where quirks are found=
 even within
> > > > > >     the same generation as more advance use-cases are enabled.
> > > > >
> > > > > I don't understand how this precludes using the g variant as a fa=
llback
> > > > > compatible. I'm not suggesting that you don't add a specific one =
for the
> > > > > h variant.
> > > >
> > > > The bindings have been around for a while and currently there are 2=
5 SoC
> > > > specific compatibles, one for each SoC supported. Each compatible
> > > > consist of the SoC model number, not the VIN IP model/version numbe=
r as
> > > > no such versioning schema exist.
> > > >
> > > > The datasheets are specific for each SoC and there are differences
> > > > between almost every SoC. There are of course lots of similarities
> > > > between the SoCs and the similarities are cluster around the 3
> > > > generations (Gen{2,3,4}) supported.
> > > >
> > > > Using the g variant as fallback in DTS for h variant even if we als=
o add
> > > > a specific one for h is confusing. As g and h are two different SoC.
> > >
> > > Why? That is the very definition of how "compatible" is supposed to
> > > work.
> > >
> > > > The g variant is r8a779g0 which is the SoC name/number for V4H.
> > > > The h variant is r8a779h0 which is the SoC name/number for V4M.
> > > >
> > > > I think the core of the problem is that there are no versioning sch=
ema
> > > > for the individual IP blocks used on each SoC. For better or worse =
the
> > > > bindings for lots of Renesas IPs are centred around SoC name/number=
 and
> > > > not the individual IP implementations.
> > >
> > > We've tried IP version based compatibles before. It doesn't work. Gue=
ss
> > > what, the IP version changes with nearly every SoC. Chip designers ha=
ve
> > > no discipline.
> >=20
> > The R-Car V4M capture pipeline is similar to e.g. the R-Car V4H capture
> > pipeline. But it is not identical, hence the different compatible value=
s.
> > AFAIU, for the current feature-set, the driver does not need to handle
> > the differences.  But that may change later...
>=20
> How can I best move forward here? The proposed compatible is not a IP=20
> block specific one, but a SoC specific one. This is the design used for=
=20
> the R-Car video capture pipeline and we already use 25 of them to=20
> support different SoCs in the R-Car Gen1, Gen2, Gen3 and Gen4 families=20
> using the schema proposed in this patch.
>=20
> If I understand the feedback correctly there is not so much an issue=20
> with adding this new compatible. Rather that the driver do not use a=20
> fallback compatible as currently the compatible added by this patch, as=
=20
> the driver currently treats it the same as another SoC in the R-Car Gen4=
=20
> family. Have I understand the issue correctly?

Yes, there's __nothing__ wrong with a specific compatible (in fact they
are encouraged), it's the adding of a specific compatible without a
fallback when the driver change indicates that a fallback is suitable.

> If so, then yes the driver currently treats it the same as another Gen4=
=20
> SoC. But we already know there are differences between the video capture=
=20
> pipeline in these SoCs, however the driver do not yet cover these parts. =
=20
> So going the fallback compatible route now could create comp ability=20
> issues down the road. Is it not better to do the specific thing now and=
=20
> avoid that issue all together?

It entirely depends on what the variances are. If the H variant adds
some new features that the G one does not have, then there's not gonna
be a compatibility issue down the road. If it is the other way around,
or both variants have unique elements, then the fallback wouldn't be
suitable. The onus would be is on you to explain why in your commit
message for the binding if it one of the latter two cases.

--CkYNxKz40gnO5wVW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnGaPgAKCRB4tDGHoIJi
0goSAQDB30pTQe/uM99qDjfjBg9xOfXS23DmZYdbCxWyvQeyqQEAp22Gh9b3dK37
v5WXntCmnV+Kyjk9R0kgFMi+iVYd1Ao=
=knxP
-----END PGP SIGNATURE-----

--CkYNxKz40gnO5wVW--


Return-Path: <linux-media+bounces-37577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AB2B032AC
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 20:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C9A618940E0
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 18:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E89E289345;
	Sun, 13 Jul 2025 18:49:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55456149C51;
	Sun, 13 Jul 2025 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752432569; cv=none; b=hq9ovHcFZQvVnhwkEdGD0zW4vxqYnEejHmHtZQxyzMBAmPc4vcwDPmY8+ugsFVPDwEY1rtN6A97eLGy1rz91PfpTMUznLyvAZFx/ZorQl5eq2RInM1C8N/ZcUZc/yAUH4SsVfGg/a5RBDBiyJ0Clr+Hk+BRAQ/YljVtl4jLsZRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752432569; c=relaxed/simple;
	bh=i3XsHWfEcdnNfIIdpBdjTzITZ4nvF2sPD8/gNhy9d4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4wNDoj59CgMiYCiEuijP6Sjc+TLN9INaIJJlmNzPVEfLOzE8Tgod1K4esvhTr4cUG+fUGY6CEOrLgUhvOHi9JEpFpiEg8yU6RlUXkoZiHSl23RpHMWF0/kic60UbXgYzoh24mCwda7Re8xW6Z8rSVjvMG2R8HvaBpvSiDSgBB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 6D59D1F00047;
	Sun, 13 Jul 2025 18:49:10 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id CD076B00472; Sun, 13 Jul 2025 18:49:07 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (armstrong.paulk.fr [82.65.240.19])
	by laika.paulk.fr (Postfix) with ESMTPSA id 97E55B000E1;
	Sun, 13 Jul 2025 18:49:04 +0000 (UTC)
Date: Sun, 13 Jul 2025 20:49:01 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v8 1/9] dt-bindings: media: sun6i-a31-csi: Add optional
 interconnect properties
Message-ID: <aHP_nR2y5iMsCtFH@shepard>
References: <20250704154628.3468793-1-paulk@sys-base.io>
 <20250704154628.3468793-2-paulk@sys-base.io>
 <20250709-misty-coot-of-fantasy-cfadfa@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X9zBqThFU9k8sBj9"
Content-Disposition: inline
In-Reply-To: <20250709-misty-coot-of-fantasy-cfadfa@houat>


--X9zBqThFU9k8sBj9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Wed 09 Jul 25, 09:26, Maxime Ripard wrote:
> On Fri, Jul 04, 2025 at 05:46:18PM +0200, Paul Kocialkowski wrote:
> > An interconnect can be attached to the sun6i-a31-csi device, which is
> > useful to attach the dma memory offset. Add related properties.
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> >  .../devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml  | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a3=
1-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-cs=
i.yaml
> > index 1aa5775ba2bc..978ef2dc0ae7 100644
> > --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.y=
aml
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.y=
aml
> > @@ -40,6 +40,12 @@ properties:
> >    resets:
> >      maxItems: 1
> > =20
> > +  interconnects:
> > +    maxItems: 1
> > +
> > +  interconnect-names:
> > +    const: dma-mem
> > +
>=20
> Is it really optional? My experience (despite being a bit outdated by
> now) was that it was required for some SoCs, and missing for others.

My understanding of the current stituation is that devices with the
interconnects property will get the dma offset from it while others
will have it set via sunxi_mbus' notifier. So in practice the
interconnects property is not required.

Currently the A83T and V3s/V3/S3 have sun6i-a31-csi devices declared in
their device-trees without the property. So I'm not sure if this still
allows us to add a mandatory property that may not always be present.

It should definitely be added (along with a mbus node) to existing users
though.

So all in all I think it makes more sense to not mark it as mandatory.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--X9zBqThFU9k8sBj9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhz/50ACgkQhP3B6o/u
lQzxTw//ROiN0Htb48Bzab2XLYugHHGICn0T1zNUDY1N+dbp1F7DBt7zbFSKmJrQ
KoEAcG81QXASWnIaf0NTPaBhSetnasv1VP7AGA7Bzp6J0ddaRESL3Y12C9k7VBDs
x62h5WT9Pyu9RchfXGaRbEwQBxcFu7+a3QUkqsXhs/2kFxFrfFrFJKnfNorgKf2P
TzKXxMPG67cmkl3+nek5hyyxftfZOpZatmFbnGV/K4SOd1F4o0hlblhAlaUfm7Nw
oulvKgn7ObSPXB/rhxzmlvAe92WDjta6xAaK3uhC05+wphwJxuCjzo4nImERZ6at
zqKV7r4GwQLjm4ttJ2LXs6qIrwYNGmvcnCIwm2N4i5vN+Si6GoOGMD6rsmHWKYQB
USnaF5WKD5eiBAQL4R9szCA3XBxWa3SHlxbdJfS1sJe81PtHxaT8TsINn7zNcf16
f7rAxcX1xd1nA6couHmXA/wungzTP65cfc01oq27XtrbKBuxvGImhSHMVMVdqHyU
pQeOAlrbHxy1w03g3pGFNrfLdTG1ntHCaqp77+eXzxqS1kZKkDxcTft8YpZMXa60
QeKx44JurlO4HeFJHE6uxpo5V5YHdzBqRv3gQ9eis8n5Ek4ZU9fHJwUkDd8GWGHY
vyT7FJ0Fw6DmKxqHlN6r8bt7KpcwJzIOqZStRrvQNJX6D+peS5E=
=u6Ul
-----END PGP SIGNATURE-----

--X9zBqThFU9k8sBj9--


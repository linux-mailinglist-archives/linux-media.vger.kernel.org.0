Return-Path: <linux-media+bounces-43422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF9FBACF46
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 14:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 325ED1C75CB
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 12:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E55B302CC2;
	Tue, 30 Sep 2025 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gcYdA31z"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21431B4236;
	Tue, 30 Sep 2025 12:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759237105; cv=none; b=M2Y8WQnVQr4jT1xDKWArYbCXFeqf/YVGN7POT+NC4hb3IeMV8sFOQ7t0xd5zcnblM3PHym7LxSxZvEssXyPb7Gl7ZTS7YaiH4q0AoLXfiooVJY6drRAuuROTlj5ZgUGm33C1i6hyrR2hq4GUD/p8F97oMI4buLQnikQO+8tPrtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759237105; c=relaxed/simple;
	bh=RK7IzL1Zeq/fJP4hvapyJAwCkjX9uv/grEB82ocyfBY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L7lZ06YSJ0j/I/KOgxBbL6mG/HBF3wQxB7kcU9WQIupgpJ1Uk73cAbpasYaKLVadKU4KBxCXCAPRrnGPXWvtAALJXHGN+SqiIdCkJ35CAFJ+W65EUXBYprIzO/PJp26QiAUvVrU0z/PEtnry0qpFWPLEtOHBdQtX5VIc3U28MDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gcYdA31z; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759237097;
	bh=RK7IzL1Zeq/fJP4hvapyJAwCkjX9uv/grEB82ocyfBY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gcYdA31z3d8lq1Z+J4heKJjd3YHupC16bCknHdbE//P24BpkKFtBvcBap+Y5TivUM
	 PIbnRy3tuyWV6OOpNx9Vky7JOar0NAh3GgPZRNDDhxT0nHX0zPr/nSjVEk7MyPTJr5
	 7LsNdRFaov8ohJVsCKD0auKP+cmLvvU3Y9KYIFXnC3t+vUg+KrVkxaAY/fmXpwH/kz
	 xo7/4oKSVpXOfOHTH4vEmWAw89TFR5up42x0/At7HOJTo2MkSg3wdVMplSX0tZptkm
	 Sm6B6sozNSU3eDguDfCV2b/LQ0gA/RUoyc5Un1w+PDQgD0EQXOkeaK7SD2HPPY4byi
	 J3j6JaZxi7AGg==
Received: from [IPv6:2606:6d00:17:ebd3::5ac] (unknown [IPv6:2606:6d00:17:ebd3::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1196917E0154;
	Tue, 30 Sep 2025 14:58:15 +0200 (CEST)
Message-ID: <2efcfe19bafd1276e9fc71b72e251443f313d693.camel@collabora.com>
Subject: Re: [PATCH v2 12/27] media: v4l2-subdev: Introduce v4l2 subdev
 context
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi
	 <jacopo.mondi@ideasonboard.com>
Cc: Anthony McGivern <Anthony.McGivern@arm.com>, 
 "bcm-kernel-feedback-list@broadcom.com"	
 <bcm-kernel-feedback-list@broadcom.com>, "florian.fainelli@broadcom.com"	
 <florian.fainelli@broadcom.com>, "hverkuil@kernel.org"
 <hverkuil@kernel.org>,  "kernel-list@raspberrypi.com"	
 <kernel-list@raspberrypi.com>, "Kieran Bingham
 (kieran.bingham@ideasonboard.com)"	 <kieran.bingham@ideasonboard.com>,
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"	
 <linux-media@vger.kernel.org>, "linux-rpi-kernel@lists.infradead.org"	
 <linux-rpi-kernel@lists.infradead.org>, "m.szyprowski@samsung.com"	
 <m.szyprowski@samsung.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "sakari.ailus@linux.intel.com"	 <sakari.ailus@linux.intel.com>,
 "tfiga@chromium.org" <tfiga@chromium.org>, 
 "tomi.valkeinen@ideasonboard.com"	 <tomi.valkeinen@ideasonboard.com>
Date: Tue, 30 Sep 2025 08:58:13 -0400
In-Reply-To: <20250930101626.GE25784@pendragon.ideasonboard.com>
References: 
	<DU0PR08MB8836559555E586FCD5AE1CBA811FA@DU0PR08MB8836.eurprd08.prod.outlook.com>
	 <pdxsi4fskze6mvgro5foa3jvmrvl3ihmksnzukonoihkb5xum5@kph26jtiayda>
	 <20250930101626.GE25784@pendragon.ideasonboard.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-0L4H1CrQYwSEJYFcjhYv"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-0L4H1CrQYwSEJYFcjhYv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Le mardi 30 septembre 2025 =C3=A0 13:16 +0300, Laurent Pinchart a =C3=A9cri=
t=C2=A0:
> On Tue, Sep 30, 2025 at 11:53:39AM +0200, Jacopo Mondi wrote:
> > On Thu, Sep 25, 2025 at 09:26:56AM +0000, Anthony McGivern wrote:
> > > On Thu, Jul 24, 2025 at 16:10:19 +0200, Jacopo Mondi write:
> > > > Introduce a new type in v4l2 subdev that represents a v4l2 subdevic=
e
> > > > contex. It extends 'struct media_entity_context' and is intended to=
 be
> > > > extended by drivers that can store driver-specific information
> > > > in their derived types.
> > > >=20
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >=20
> > > I am interested in how the sub-device context will handle the
> > > Streams API? Looking at the commits the
> > > v4l2_subdev_enable/disable_streams functions still appear to operate
> > > on the main sub-device only. I take it we would have additional
> > > context-aware functions here that can fetch the subdev state from
> > > the sub-device context, though I imagine some fields will have to be
> > > moved into the context such as s_stream_enabled, or even
> > > enabled_pads for non stream-aware drivers?
> >=20
> > mmm good question, I admit I might have not considered that part yet.
> >=20
> > Streams API should go in a soon as Sakari's long awaited series hits
> > mainline, and I will certainly need to rebase soon, so I'll probably
> > get back to this.
> >=20
> > Have you any idea about how this should be designed ?
>=20
> Multi-context is designed for memory to memory pipelines, as inline
> pipelines can't be time-multiplexed (at least not without very specific
> hardware designs that I haven't encountered in SoCs so far). In a

I probably don't understand what you mean here, since I know you are well a=
ware
of the ISP design on RK3588. It has two cores, which allow handling up to 2
sensors inline, but once you need more stream, you should have a way to
reconfigure the pipeline and use one or both cores in a m2m (multi-context)
fashion to extend its capability (balancing the resolutions and rate as usu=
al).

Perhaps you mean this specific case is already covered by the stream API
combined with other floating proposal ? I think most of us our missing the =
big
picture and just see organic proposals toward goals documented as un-relate=
d,
but that actually looks related.

Nicolas

> memory-to-memory pipeline I expect the .enable/disable_streams()
> operation to not do much, as the entities in the pipeline operate based
> on buffers being queued on the input and output video devices. We may
> still need to support this in the multi-context framework, depending on
> the needs of drivers.
>=20
> Anthony, could you perhaps share some information about the pipeline
> you're envisioning and the type of subdev that you think would cause
> concerns ?

--=-0L4H1CrQYwSEJYFcjhYv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaNvT5QAKCRDZQZRRKWBy
9H2OAQDYJU61T/0h1wzEwZ7iddu/tUyOjwcMugwELYj4l1qfdQEArPd23oj/vi4j
GiESd5rvRJN2+qKwpQh3Nn1Jvkrefgo=
=mobG
-----END PGP SIGNATURE-----

--=-0L4H1CrQYwSEJYFcjhYv--


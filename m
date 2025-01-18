Return-Path: <linux-media+bounces-24889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB72A15E31
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 18:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0385F7A34E4
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 17:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7691A725C;
	Sat, 18 Jan 2025 17:00:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0E21A238E
	for <linux-media@vger.kernel.org>; Sat, 18 Jan 2025 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737219630; cv=none; b=hv/VLwUjwmxicUG6V6y20EUIKOxnCRxYQCR7fzims8GhETbXJ0R2NGsQ3iv9ystPzzvmKkrIxKmwSuG/TtCYXtZAUIlW52u/3Cvp0qUduRMdiqRMj4By36t3396DEmkQOb2jz7KZBlO+gDJR39iTK9AVzLW6H6Y7Imj4e9+lNPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737219630; c=relaxed/simple;
	bh=TebaQcwz2ypXSsuKIj6I9LgkRLf+OKwy2ZYyJt4Qk4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbUu5jttnqqG7hD/8/uzmS0AZRLyrip1ZutfKBuQhhlxPz5HOifPZT0zmKicvsqWtW+ZMoiTeEcItUvgpY1cIv8+XTkLRO5efDh8Art2NG+IbLgY+cDFdd/tnSa1b5KTF4q40GGgB9ogjQzJA5iMtTG+9lwHcPfaaJI1bNFPhWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id A90051F00055
	for <linux-media@vger.kernel.org>; Sat, 18 Jan 2025 17:00:21 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 445D3AA22F5; Sat, 18 Jan 2025 17:00:20 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 43E77AA22EC;
	Sat, 18 Jan 2025 17:00:19 +0000 (UTC)
Date: Sat, 18 Jan 2025 18:00:17 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <dwlsalmeida@gmail.com>, Adam Ford <aford173@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, andrzejtp2010@gmail.com,
	Frank Li <frank.li@nxp.com>, ming.qian@oss.nxp.com,
	linux-media <linux-media@vger.kernel.org>, linux-imx@nxmp.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Gustavo Padovan <gus@collabora.com>
Subject: Re: Hantro H1 Encoding Upstreaming
Message-ID: <Z4veIWQC8ARKEPzI@collins>
References: <CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
 <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
 <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
 <A3476357-8D8D-4B82-8CAB-58370BECF575@gmail.com>
 <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
 <Z4fOScVgLqYEU4Hw@collins>
 <a6e7a9a0426df1902965262328d1da8e9339b952.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="My/hnROweO1SgH98"
Content-Disposition: inline
In-Reply-To: <a6e7a9a0426df1902965262328d1da8e9339b952.camel@collabora.com>


--My/hnROweO1SgH98
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Wed 15 Jan 25, 14:51, Nicolas Dufresne a =C3=A9crit :
> Le mercredi 15 janvier 2025 =C3=A0 16:03 +0100, Paul Kocialkowski a =C3=
=A9crit=C2=A0:
> > We could have some common per-codec bitstream generation v4l2 code with=
 either
> > a cpu buffer access backend or a driver-specific implementation for wri=
ting the
> > bits. I already have a base for this in my cedrus h264 encoder work:
> > https://github.com/bootlin/linux/blob/cedrus/h264-encoding/drivers/stag=
ing/media/sunxi/cedrus/cedrus_enc_h264.c#L722
>=20
> There is a lot of code in there that you can throw directly into v4l2-h26=
4, this
> is exactly what that library is meant for. It had never meant to be limit=
ed to
> generating intermediate reference lists for decoders, or to be decoder sp=
ecific.
> Note that golomb coding can further be generalized.
>=20
> I do agree at least for now that letting the driver write headers have mo=
re
> advantages. It allows notably to turn off the knobs that would not otherw=
ise be
> supported.

Yes it seems common that hardware will not support certain features or valu=
es
and need some bitstream values set to some hard-coded values. There's also
various controls for the stateful API that define most of the basic things =
that
can be configured in the SPS/PPS. Then each driver exposing what it supports
is a pretty good fit.

> The modification would of course be reference at s_ctrl time,
> assuming you reuse existing sps/pps and other similar compound controls. =
As we
> didn't have encoder in mind when we created these compound controls, its
> possible that we'll have to add an extended one to fill the gaps, which h=
as
> always been the plan.

I'm not really sure it's needed to pass the whole pps/sps in controls.
Reusing the individual stafeul controls feels like a good fit from what I c=
an
see. And yes we'd need some extra info to be passed from userspace about th=
ings
like frame type, qp, etc that will impact the generated bitstream.

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--My/hnROweO1SgH98
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmeL3iEACgkQhP3B6o/u
lQx0dg/+P1g3424RbeGfoj3LSYGIArQbdxEU1IWVF6QugnXtJRXiDuPAnDjM993V
qWmdk2RCe9Dl6L+J3Tcb+uBO9y1rx2JFLcXeDSuuZNgEmdIHJlXO5O9vCk/gef7F
r4jCIiPPUofg5mJFuqMDffyRZTG4Ayd+H7+aBr1vvq82oV6OTaWgvozhO8xqONQ1
ijFZ4zCKWOtgiKcXSuro64ws5WtigoBhiJJ+XR4XjcZBPyj76PmuoRM2YJ7GWipX
rd1q9EuVESl/Og2NSUmUBmhAGvuIm5W6IpsE+bLXt3wdvlIXPYbZEmxgdeNyYrqR
dN1bFut5lypouuhlOQkK1/45ZTi2haNtjgnyw2O+geFdASsKavZxst5NVmAD4BZC
HvPS7IYDzw1WUgOSfwF/7SJr0vWA6YfjjtLUj9d1X8QcJBzSTwMF9knF2WA9GmK1
UGwbwuUBUfyDidELjO69B+tE2U4Kkv4skLRERsZU53r50MW+sUIpsCDfSeql2Zvz
8r1vOjjGYoTlMqetqhzRLXpXpUQldH68k8+rOLhIiKSkQWjnDXfBDLp/xAVUDRXQ
Ev5YHcRv+q+27at7bfuDYW66MTHPDDXqoPCjHm/LMZ+w2haMn2vsIt4BL0bGVj4e
qZZh7k9C/FLKG77a9F9S+CBtjwaF6pcDsIG/7+xg14wXy0+a7hE=
=t/uf
-----END PGP SIGNATURE-----

--My/hnROweO1SgH98--


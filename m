Return-Path: <linux-media+bounces-41595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB32B40854
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 17:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B19CC5441EE
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50ECD2BE03D;
	Tue,  2 Sep 2025 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DoC5GhLJ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486692DFA3C
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756824919; cv=none; b=i5DtgyAxtGAj2EhReGKG9mATEWiYYhI5Tx1g1XdXYymT+KaU7Y5CqMLOgwWoDAExYe1DslY1u39wEjVQ4OuXr/NrtCaLDalaZsHv7lYNRpeTZ+tYmVYd/lGMtycVB68yM66GUSNhg0uvPaIbjSmxIfTX+UvPyLr6G+eVWO/Rzd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756824919; c=relaxed/simple;
	bh=zqQipLJwm+1nTt0uBUGs1NQb/hyubBn+kKYdOyvXXgA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kzJsPgjJVL2HmZA/zrQFIt6YsNRKipVx13+pw+8kHqbn9XMjVGgZdYKYSFopiUT6z7dCEupocuYi2iqsvqFAhnzBM7tGxOVZLNQ1nFTGPrOL5ZBoki9l1oFhCXS/kxVQjyQELzrPyhG0GoVuuQduHMxQpqtpkTbzQS1/jj2dg/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DoC5GhLJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756824915;
	bh=zqQipLJwm+1nTt0uBUGs1NQb/hyubBn+kKYdOyvXXgA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DoC5GhLJ7CRct+GLe67gr1wAmMTX7A+UpHrDCEU9cojf0mrv/CpFDrM9meXvDeh+0
	 nfuzM7KS469Oo/zO2bGIY3buztYjk8HB4GPSH4wFolS/ZKWS6bF+mMzAYhrwvPCyGO
	 NhHyceVncnnSnkQA0ZeSWMuncKQbaefcM7Llz0qZWxADLBUDmHVtdEYyk6AZ1CvOy1
	 IBdnPJIut+6n17FlpbBpgHwlbRQfE8l+ibd8AEE+Fd9RBtDq0A4tfcy8FGHvVRGZsJ
	 vt/GYBGov1/hy0+pCZALn0EJLFCecvNm5Qf2e5ZIISa9GNTn1p+QjhzevA9D980oTy
	 uhpNrCUthKEPQ==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DE30E17E0456;
	Tue,  2 Sep 2025 16:55:14 +0200 (CEST)
Message-ID: <4158785f415986924f916f4bfe1988376806f8ed.camel@collabora.com>
Subject: Re: Hantro G1 jpeg decoder stm32mp2 (plain text)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: linux-media <linux-media@vger.kernel.org>, Hugues Fruchet
	 <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Tue, 02 Sep 2025 10:55:12 -0400
In-Reply-To: <CAOf5uwnofTZ1ARzqAD0Tevz_gX1w=Uv5b7Q8=-ZnwQpioZvXuw@mail.gmail.com>
References: 
	<CAOf5uwmTTFcizew2QRAr=TZ12hTfXg6NFEsDYKASB7wPeB4odw@mail.gmail.com>
	 <7b37c5679994281ae1806f2ee84d1aede77ca836.camel@collabora.com>
	 <CAOf5uw=uPkC60gE7Ea_ZnEZdYJRYRJKz=OVUN0RvO_NVe2tw5A@mail.gmail.com>
	 <96dc1231c7d18f8106e4b5e56a336add377ee235.camel@collabora.com>
	 <CAOf5uwnofTZ1ARzqAD0Tevz_gX1w=Uv5b7Q8=-ZnwQpioZvXuw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-PSKTQybYKSfTANFhdMyz"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-PSKTQybYKSfTANFhdMyz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 02 septembre 2025 =C3=A0 15:30 +0200, Michael Nazzareno Trimarchi =
a =C3=A9crit=C2=A0:
> Hi Nicolas
>=20
> On Tue, Sep 2, 2025 at 3:13=E2=80=AFPM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> >=20
> > Hi,
> >=20
> > Le mardi 02 septembre 2025 =C3=A0 15:01 +0200, Michael Nazzareno Trimar=
chi a =C3=A9crit :
> > > > If you only have one format support, you don't need to force anythi=
ng in
> > > > GStreamer. Some extra information about Hantro post-processor. When=
 used, you
> > > > need to provide 2 sets of buffers. The decoder will still produce N=
V16, and a
> > > > secondary set of buffers is (in parallel, pipeline mode) written ba=
ck into the
> > > > format you have configured on the PP register set.
> > >=20
> > > Those sets of buffers are provided by gstreamer or how does this
> > > handle in practice for
> > > other decoders?
> > >=20
> > > >=20
> > > > The post-processor can also be used in standalone mode, but this fe=
ature is
> > > > often fused out. In that mode, in can input interleaved YUV, as oft=
en produced
> > > > as raw format by USB cameras (and most cameras using serial links).
> > >=20
> > > Much better. Now I need to understand better about the two set of buf=
fers
> >=20
> > the V4L2 API does not have the notion of primary vs secondary buffers (=
unlike as
> > an example Vulkan Video, which is 20 years younger :-D). So we endup hi=
ding the
> > primary buffers inside the kernel driver [0]. Just notice the this allo=
cation
> > allocates reference buffers for the decoder, and the decoder actually a=
llocate
> > the final buffers. This is quite convoluted imho. Note that some import=
ant fixes
> > have happen on this part of the postproc code (which arguably still nee=
d a lot
> > of cleanup, a proper split between G1 and G2 (and merging back VC8000 i=
nto G2
> > since this is largely compatible).
> >=20
> > https://gitlab.freedesktop.org/linux-media/media-committers/-/blob/next=
/drivers/media/platform/verisilicon/hantro_postproc.c?ref_type=3Dheads#L224
> > https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/db=
300ab0e9d38b1e1b0b561333b66a5beacb9994
> >=20
>=20
> Ok, I read the code, but I have some doubt:
>=20
> - the NV16 and NV12 are both available as the primary buffer for the
> decoder but you don't know until you plug the camera and start
> streaming, so I suppose that in this
> case the size of the primary buffer should be computed based on the
> biggest format.

Since JPEG is a stateful decoder, it needs to implement the respective port=
ion
of the stateful decoder specification. In short,

- Userspace should prepare the OUTPUT queue and provide a first buffer
- The driver should parse the frame header**=20
- The driver should notify that the resolution/format has been found
- Userspace will enum or get the information and configura capture queue


** JPEG is the only codec we allow in-kernel parsing to take place, other
codec=C2=A0must defer this to a firmware or implement the stateless spec

With that mechanism in-place, there is no need to allocate bigger then need=
ed.

> - I think that hantro_set_reference_frames_format assumption is to
> keep the one supported from decoder and match the first one match the
> bit_depth,
> =C2=A0 so it can set as reference the NV12 and not the NV16
>=20
> Is this correct?

Its the bitstream that dictate which of NV12 and NV16. The main issue you a=
re
facing is that only bit depth (8 and 10bit) has been implemented so far. Th=
ere
might be more work to support 422. Note that G1 is unique, since the decode=
r
part already support 2 formats. Though, in mainline we did not expose the t=
iled
format (8x4 tiling). So if you have a 422 JPEG stream, your choices are NV1=
6 or
8x4 NV16.
>=20
> The postproc_enable happens if we have prepare_run it means that the
> buffers are allocated already but the buffer will be known only when
> someone
> enqueues them to the decoder. In such a scenario is there any driver
> already solving it?

As this code have only been used through the stateless specification, some =
work
will be needed to support stateful for that context. CODA960 support might =
serve
as inspiration.

Nicolas

>=20
> Michael
>=20
> >=20
> > regards,
> > Nicolas

--=-PSKTQybYKSfTANFhdMyz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLcFUAAKCRDZQZRRKWBy
9BLoAQCSmMFd2QxdEUTtxOhuNIzqtTbwLvy0QYixQe76USGWVAEArB81c3DP6hTY
uoIJqxVTn3M+Z2gAVa4ghCNSTZUgBAw=
=kvDh
-----END PGP SIGNATURE-----

--=-PSKTQybYKSfTANFhdMyz--


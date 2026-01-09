Return-Path: <linux-media+bounces-50286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF6D0ADF9
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 16:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EFC730443ED
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 15:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D47435C190;
	Fri,  9 Jan 2026 15:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pLmOFvj4"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CA41D5141;
	Fri,  9 Jan 2026 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972100; cv=none; b=IHd41JkICg4XNdulUkI3V/bnSWQiArRnEJ1joVWaI/HSgwvKYDIt8cSvcAH2bcm2/pz2/Md/nMZKjsbTUeRIFnnIkkO2xiTONj/7l/yeMdJNSAAV+zHfG6d8HYVsk+EXznLo2BF44oY808Znee0X9gzW3URQlerKWvFVbPPLpfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972100; c=relaxed/simple;
	bh=1HD2uASmbhaMMGcoL/glMXY7M5i07XbjtXTfQdajags=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hdt9twtoLw7kuJllwPXi2T9vTubuelNwkBifJZqWQDCgcNvuppTnl4QsUuduOkAa7jmUbBSY3j2cLuTMkmYQUJZNU4H+89uYC3YlWFwgQAhpCl/ynm4vbywxpNbODSzs2XEEQSQNIgqUlzJ+boyqiwdWfNNheHUrwdbtHM4qB+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pLmOFvj4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767972097;
	bh=1HD2uASmbhaMMGcoL/glMXY7M5i07XbjtXTfQdajags=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pLmOFvj44qe5XO8yMEZaEjIDm1h9TgNz0s4keeg+1TfMw7JwSc9VB6tz2bnXaJJf1
	 7awx1rXcbYy3GmomCCqk2Bz5WhneGYV+LnufGH68DZ1xs3whw/uUEYyDCpZR8HLoqB
	 c35FnUuRgVaLhdeCPel4RRtt0HduiH9+7jQXWgAe2l5pgbSMeq5Ie1rN9wytEedpn2
	 LXIP78UqfdCpYGHDbj1oKoYSGJMo9+8VNDABqFHchrKxqsu0kNNpyqe3hRe32ZhY/h
	 P2AKsbNa9Ph/av6DGYry6bJ/eJpnFjuYg03TgAZpPw0wL0mdUrhhBGjsk0d+eV6szY
	 bwCrsU3cOIq2w==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3556517E13F9;
	Fri,  9 Jan 2026 16:21:36 +0100 (CET)
Message-ID: <6f94050e55358483cf99429c587f86ee8334b498.camel@collabora.com>
Subject: Re: [PATCH v10 0/5] Enable support for AV1 stateful decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Val Packett <val@packett.cool>, Deepa Guthyappa Madivalara	
 <deepa.madivalara@oss.qualcomm.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>,  Dikshita Agarwal
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Hans Verkuil <hverkuil+cisco@kernel.org>
Date: Fri, 09 Jan 2026 10:21:33 -0500
In-Reply-To: <bc0aa47d-81a9-480b-b156-b0cb23179515@packett.cool>
References: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
	 <DjKkpb96k7gGFmmmqsmLvO6sKcd02WwZq67n9hY4c75sajI_hENGebzfUBW3Xs3WGJ_oXdeYkNcV-T7UkXO6Xw==@protonmail.internalid>
	 <ae5531fa-a3a4-4fc5-8580-3a790bec4961@packett.cool>
	 <de8fe895-79ae-4540-9879-64d6f8f9e239@kernel.org>
	 <f86a904e-110e-448f-96e0-22bc6b3e4b38@packett.cool>
	 <a8af1513-fda6-4809-80ae-bb07d2ed0db3@oss.qualcomm.com>
	 <bc0aa47d-81a9-480b-b156-b0cb23179515@packett.cool>
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
	protocol="application/pgp-signature"; boundary="=-UUXliWYOFX6Sh2a1bQi4"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-UUXliWYOFX6Sh2a1bQi4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Val,

Le jeudi 08 janvier 2026 =C3=A0 16:25 -0300, Val Packett a =C3=A9crit=C2=A0=
:
>=20
> On 1/2/26 3:59 PM, Deepa Guthyappa Madivalara wrote:
> >=20
> > On 1/2/2026 3:01 AM, Val Packett wrote:
> > >=20
> > > On 1/2/26 7:44 AM, Bryan O'Donoghue wrote:
> > > > On 02/01/2026 10:43, Val Packett wrote:
> > > > >=20
> > > > > On 12/10/25 3:59 PM, Deepa Guthyappa Madivalara wrote:
> > > > > > Hi all,
> > > > > >=20
> > > > > > This patch series adds initial support for the AV1 stateful dec=
oder
> > > > > > codecs in iris decoder. Also it adds support for AV1 stateful
> > > > > > decoder
> > > > > > in V4l2. The objective of this work is to extend the Iris decod=
er's
> > > > > > capabilities to handle AV1 format codec streams, including nece=
ssary
> > > > > > format handling and buffer management.
> > > > >=20
> > > > > This is awesome, thanks!
> > > > >=20
> > > > > I've tested it with rpi-ffmpeg as well, and it works great (only
> > > > > required one interesting logic change..
> > > > > https://github.com/jc-kynesim/rpi-ffmpeg/pull/108) \o/
>=20
>=20
> BTW, the rpi-ffmpeg maintainer is asking,
>=20
> > for that flag_last code to trigger we have to have received an empty=
=20
> > capture buffer, which is the legacy method of signalling EOS, so=20
> > flag_last is a legitimate response. Is there something about AV1=20
> > stateful that means it is legitimate to receive empty capture buffers=
=20
> > mid stream? (grain & no-grain buffers spring to mind with an empty=20
> > frame if grain isn't enabled but that is pure speculation on my part=
=20
> > not supported by the documentation I've read). Now I'll grant that if=
=20
> > we get an EOS signalled this way we probably shouldn't attempt to=20
> > dequeue an event, but the "correct" answer of simply signalling EOS=20
> > back down the chain isn't what you want either?
>=20
> (`flag_last` being an internal variable for an end-of-stream condition,=
=20
> so basically, I needed to make ffmpeg *not* interpret an empty capture=
=20
> buffer as an end-of-stream. I never saw those with H264/H265/VP9, but=20
> with AV1 one arrives after the first frame)

Just a shot in the dark here, but in the discussion about the definition of=
 the
formats, we discussed about the lack of signalling of decode-only frames. B=
ut
for this codec, decode-only frames are wrapped with one display frame into =
Time
Units. So you should not hit that case if you submit TU. I'm wondering if t=
his
empty frame isn't an effect of passing OBU Frames one by one (rather then
passing the complete TU). Can you confirm what is FFMPEG behaviour on this
regard ?

If that is correct, I think it raised back what we should do to signal deco=
de
only buffers. Due to the legacy EOS flow (which I guess ffmpeg have support=
ed
since day one), its not possible to just send an empty capture buffer. But =
at
the same time, not marking "done" any buffers makes userspace book keeping
difficult.

Not best, but currently, the only way push an empty buffer is by sending th=
at
buffer with BUF_LAST flag (in which its pretty much the same as the old way=
, but
with an explicit flag) or empty buffer with an ERROR flag, which was always
allowed. The second could confuse a bit the application into thinking there=
 was
some corruption, but with a payload of 0, it clearly means the buffer is
unusable for display, but allows for book keeping (using the timestamp cook=
ie).

hopefully any of that can help,
Nicolas

--=-UUXliWYOFX6Sh2a1bQi4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaWEc/gAKCRDZQZRRKWBy
9N0TAQCOkJbz1JJ5gFWvyqaWuldaIPwAaysgmljrjYk98iu8MAEA1GRGBWiNSa8R
OxSSs/FsnWcU/dgXIGSK7jc7PP5pEgE=
=sZLp
-----END PGP SIGNATURE-----

--=-UUXliWYOFX6Sh2a1bQi4--


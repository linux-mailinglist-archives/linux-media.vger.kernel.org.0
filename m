Return-Path: <linux-media+bounces-42139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A87B5083B
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 23:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CD13560023
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 21:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD83B257437;
	Tue,  9 Sep 2025 21:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CR1KpVHU"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E0C31D385;
	Tue,  9 Sep 2025 21:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757453622; cv=none; b=qK7VeYva6nqjDoPEqaIGyOnrSZe8ZJdRXIvwvvkfVfUeNdos9CAgnp55FoSA6Zo5kL8d5EttgmJ56aq1WFZZV0U0ws3RMpO/uT0zJsc5odxFnRBGsaG5P1iEk0TnOlmQ1JcVGT8dHmAZ/b0LiHJsoFNUq2kp2Qd0P10NU4aqIzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757453622; c=relaxed/simple;
	bh=nOsRXuIezYAgPiiR/YaK8zOyx8Hk/0DFgm4DOiE9K1g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q8TfOg2g1V0CMVL6gnRDBYAv+F6v25a/jCK8w8STnQthRm+GjMIjfGvXj+e+o4x4NH9HoKKDLhF6cczsmrjaJiiTR323qL0zHaJAa/H5EOp1QGZ4XdeoQfsD3eCzBpU+S42BOvgT9IMTye5Uzazkdk2MmAfvjvYVBVbGl+8g3co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CR1KpVHU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757453618;
	bh=nOsRXuIezYAgPiiR/YaK8zOyx8Hk/0DFgm4DOiE9K1g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=CR1KpVHUhwSkJG/ycUCPbqIjdy3q5XO0TkIRV8Hk+0G7QHodlbShpBvxJ2OsWdNqc
	 lcBjr9DQ1lvE0Y3syiyXf33/rh2gmhtxe3PRVK0w/fYxsj12BqrQDFrl1iBHUConMW
	 mnRUCN2hjCddIFYX4BgHiC4wakzZ54FakE+DHEsEwxN2Z3gZekTtFCYFX0pVZ7sJYI
	 Gz9ofywDa0uLQvG4swtyJTM8r/aTcMC1BpH7bwZlq1sx4i948e4UdhvpGl4pYTX2qQ
	 CMGwcjZ/1N6L8B4BrBrk/p41NT3RhsxFe3Q/6R3pMYG30yKO63QN962ZwWnOe8ujLK
	 wQtUdJRGfjUDw==
Received: from [IPv6:2606:6d00:15:d961::5ac] (unknown [IPv6:2606:6d00:15:d961::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1EF8517E0489;
	Tue,  9 Sep 2025 23:33:37 +0200 (CEST)
Message-ID: <48540d8ee22cf747d2dd591a7869baf1cba6719e.camel@collabora.com>
Subject: Re: [PATCH v3 0/4] Performance improvement of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org"	
 <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>,  "bob.beckett@collabora.com"	
 <bob.beckett@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>,  "b-brnich@ti.com"	
 <b-brnich@ti.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung	
 <nas.chung@chipsnmedia.com>
Date: Tue, 09 Sep 2025 17:33:34 -0400
In-Reply-To: <SLXP216MB114806E1937625CA3760CA3EED0FA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
	 <f79ab2a0db0eb4aad20ed488de3635f9d8942cdf.camel@collabora.com>
	 <SLXP216MB114806E1937625CA3760CA3EED0FA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
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
	protocol="application/pgp-signature"; boundary="=-+sP4moG1Rb9SMwzbCOv5"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-+sP4moG1Rb9SMwzbCOv5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 09 septembre 2025 =C3=A0 06:16 +0000, jackson.lee a =C3=A9crit=C2=
=A0:
> > I tried and reproduce your results. I've used an ISOMP4 file, nothing b=
ig,
> > 720p 10min video. After 30s of seeking back and forth I've got a deadlo=
ck,
> > with the following kernel log:
> >=20
> > vdec 4210000.video-codec: wave5_vpu_firmware_command_queue_error_check:
> > still running: 0x1000
> >=20
> > I don't know if its worse then before, but the bug is severe enough to =
be
> > concern. To reproduce easily, I pick a longer video, seek forward close=
 to
> > the end, and then seek back (gst-play so smaller steps back) very quick=
ly
> > till it reaches position 0, and repeat.
> >=20
> > This happened without resolution change happening concurrent to seeks,
> > just a flat, single resolution video. Once I do the same test with an
> > agressive DRC in place, I hit kernel crash. I will share in private ema=
il
> > the DRC H.264 sample I'm using, and how to make it bigger so its manual=
ly
> > seekable.
> >=20
>=20
> I tried to reproduce this problem, but I am seeing a different phenomenon=
.
> Can you let me know your Gstreamer version you are using ?

GStreamer 1.26.5. I retested today and did not reproduce the crash this tim=
e,
but did get the "still running" message and stall (recoverable though). You=
 have
to try really hard, it might be worth automating a tests, so it can be more
agressive.

Nicolas

--=-+sP4moG1Rb9SMwzbCOv5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaMCdLgAKCRDZQZRRKWBy
9JZnAP4hb3FwCcpT20b6A0Yu7UItiHm4oMfM64MEttU/pPbqQwEAz+vYyNqLYDaC
SIBQ6O82pVLi3aviCR/6aWIDXxZkIwo=
=T58A
-----END PGP SIGNATURE-----

--=-+sP4moG1Rb9SMwzbCOv5--


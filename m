Return-Path: <linux-media+bounces-43062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD993B9A03E
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 15:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 656F22A41DA
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 13:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6129C3002C2;
	Wed, 24 Sep 2025 13:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xw164tS6"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9E4213237;
	Wed, 24 Sep 2025 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758720047; cv=none; b=sZGtbC6oXsoVmkBX9E52DyMVxEoh+WZjdMz1YWMUS3KzMM4NCr7GKTrLU1J5zsbDWmLv/EPnZQYfkCNXYYdmwHPnN6R8PNufviCDZ5O3zwBUqRh16LXYNtROJJHrC7UeGiBEs5y+ttakMrgSmT37rekTk6OVLNl8kfFYO8ycypE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758720047; c=relaxed/simple;
	bh=rB2sBTaMEgkmzZWzWgoT0m60TQ1pDitX6JLgXdRRbF8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u2v9n6OSEt+8eKVgB5s4tdiqa1cmaszVGnRdrq49Fw/gE2EQRBT0wQCNORoa7DFRiQVItdKss70ddbYtOrqb0LUw4WymGMLNEU1lhxnn5RO8nTxLsomlxx8IpvRS0Q4Vn6dm6/3sCNYTKP9sDko2DM5sR4iaSy/oERaOKGzYy3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xw164tS6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758720043;
	bh=rB2sBTaMEgkmzZWzWgoT0m60TQ1pDitX6JLgXdRRbF8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Xw164tS6oOBvIAjK20FXtEQPLVWk8PZs1BdwPM0gxNArJX3VOaWfW/KDHrntQfIk/
	 +SKGUebpRPB4lDRyByYJafb5SCO1FX6eW/Pen5PEkBdRdBOWQbQSMPI5t+qKu0EOFl
	 xQXNZ6sEeLhoa6fjqqErm5UX5vR3oK27MC2EjA8VFzzSwAN0QIyQ2rUyRqHcVOIy+r
	 WKEYzbBNXJwJM+ubWeD0vMGFmsGvvG5GIM/e0/zVDA5ita0PyyuD0gvTgOBFYqKoPE
	 q10igw3hrMdGX8yU1P6h/RNQ3YxznNLH4n1+IYZjDAuvmKKfVkVn1Li6n3sdVP3uXa
	 eDC50aQjNTf3g==
Received: from [IPv6:2606:6d00:17:ebd3::5ac] (unknown [IPv6:2606:6d00:17:ebd3::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 980B617E046C;
	Wed, 24 Sep 2025 15:20:42 +0200 (CEST)
Message-ID: <6eed102e2aa739e5026ee545a38ddacf09058bbb.camel@collabora.com>
Subject: Re: [PATCH v5 4/4] media: chips-media: wave5: Improve performance
 of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, Brandon Brnich
	 <b-brnich@ti.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "hverkuil-cisco@xs4all.nl"
	 <hverkuil-cisco@xs4all.nl>, "bob.beckett@collabora.com"
	 <bob.beckett@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>,  "hverkuil@xs4all.nl"	
 <hverkuil@xs4all.nl>, Nas Chung <nas.chung@chipsnmedia.com>
Date: Wed, 24 Sep 2025 09:20:40 -0400
In-Reply-To: <PU4P216MB114923D47D5AD77D5D32D56FED1CA@PU4P216MB1149.KORP216.PROD.OUTLOOK.COM>
References: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
		 <20250922055255.116-5-jackson.lee@chipsnmedia.com>
		 <1f59f00d-eff7-4c65-a504-227df0de75d2@ti.com>
	 <d4b7cc51f1bd7fcf88066e8510f950ec90cfb5aa.camel@collabora.com>
	 <PU4P216MB114923D47D5AD77D5D32D56FED1CA@PU4P216MB1149.KORP216.PROD.OUTLOOK.COM>
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
	protocol="application/pgp-signature"; boundary="=-S4Lbt0KClbM21B1zMugb"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-S4Lbt0KClbM21B1zMugb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jackson,

Le mercredi 24 septembre 2025 =C3=A0 01:14 +0000, jackson.lee a =C3=A9crit=
=C2=A0:
> Hi Nicolas
>=20
> > -----Original Message-----
> > From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Sent: Tuesday, September 23, 2025 3:00 AM
> > To: Brandon Brnich <b-brnich@ti.com>; jackson.lee
> > <jackson.lee@chipsnmedia.com>; mchehab@kernel.org; hverkuil-
> > cisco@xs4all.nl; bob.beckett@collabora.com
> > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; lafley.k=
im
> > <lafley.kim@chipsnmedia.com>; hverkuil@xs4all.nl; Nas Chung
> > <nas.chung@chipsnmedia.com>
> > Subject: Re: [PATCH v5 4/4] media: chips-media: wave5: Improve performa=
nce
> > of decoder
> >=20
> > Hi Brandon,
> >=20
> > Le lundi 22 septembre 2025 =C3=A0 12:32 -0500, Brandon Brnich a =C3=A9c=
rit=C2=A0:
> > > > -	/*
> > > > -	 * During a resolution change and while draining, the firmware
> > > > may
> > > > flush
> > > > -	 * the reorder queue regardless of having a matching decoding
> > > > operation
> > > > -	 * pending. Only terminate the job if there are no more IRQ
> > > > coming.
> > > > -	 */
> > > > -	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS,
> > > > &q_status);
> > > > -	if (q_status.report_queue_count =3D=3D 0 &&
> > > > -	=C2=A0=C2=A0=C2=A0 (q_status.instance_queue_count =3D=3D 0 ||
> > > > dec_info.sequence_changed)) {
> > > > -		dev_dbg(inst->dev->dev, "%s: finishing job.\n",
> > > > __func__);
> > > > -		pm_runtime_mark_last_busy(inst->dev->dev);
> > >=20
> > > Patch is failing to apply here to linux-next because these redundant
> > > calls have already been removed[0].
> >=20
> > Which have not been merged back from the RC into media-committers/next,
> > forcing to skip a cycle. Jackson, feel free to rebase on linux-next lik=
e
> > Brandon suggest.
>=20
> Then should I make v6 patch series based on Linux-next ?

I've asked advises from the other maintainers, and the answer is no. Basing=
 it
on our next branch for linux-media submission is the correct thing to do. I=
ts
too late for this cycle, but be reassured we will improve our process in fu=
ture
iterations to reduce the risk of this happening.

Feel free to send a rebased patch to Brandon, having more testing is always
good.

cheers,
Nicolas

>=20
> Thanks
> Jackson
>=20
> >=20
> > regards,
>=20
> > Nicolas

--=-S4Lbt0KClbM21B1zMugb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaNPwKAAKCRDZQZRRKWBy
9JInAP9ILze2brb/ataoKkg1g48S7xht38hWn+SOv6Q5tcUUZQEAoCkZnl150vPS
QU9retwUO/W9mggegoXGEUheH/LZUgg=
=9EFr
-----END PGP SIGNATURE-----

--=-S4Lbt0KClbM21B1zMugb--


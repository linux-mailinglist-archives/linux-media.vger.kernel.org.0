Return-Path: <linux-media+bounces-47214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 392C7C6479B
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 14:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F5D54F026A
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 13:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339C7333426;
	Mon, 17 Nov 2025 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UMIoHMlE"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE951946DA;
	Mon, 17 Nov 2025 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763387134; cv=none; b=VY8esLumnu8lhd5h4X3CmoDfGwiaz5z7jFpOWPmG1GhrS78nnvEl+BBlaGPhtTxszjF61QEIY6yoFzwvJbAnf0mmoD0rde6LuBdUkZHWYlwi6rRuZba154Lg09PFUtUta4n3tPRtHeeBHY6PxHQ1i6tW+95+TUrI5S4DiQyZVog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763387134; c=relaxed/simple;
	bh=cEVZ0IBFV6ktuNl5WlKG1Aqis8450gJ6Uxsn5mO+nrA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jhup5ixK2l4HZfug0RBI1h1bIzD20OTCaPy6En7dyGHi563irl8KK3WcNvtj7aY9Men+Qk0GIGGVdTPDLApcVGF9ek4naZ86kg9UEHzh+7OMMVp8mUIYnk4sY9+50hAfu8DcEV4FbdeDoxCllOuy2Cy5pEs7LWzy38u3FDCF3Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UMIoHMlE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763387130;
	bh=cEVZ0IBFV6ktuNl5WlKG1Aqis8450gJ6Uxsn5mO+nrA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UMIoHMlEK0LP/4g2w9cw1cbeICVFqAoPz3W6TB7qxMI+fixkrsWAWT1wzI3yiXYFd
	 u6TH3BujBVJ/AIa9dTg1S/5Og5Xa1rXdPFqicet6vUa5pjWDoNHiR3QavNsF8bJL5y
	 Dewq0Io1N7QXiZD5/pINdL+LR/9B+rR8WhRiP31WUqmTyhwnQ1qKyhht29ROc1CLgg
	 DiCVYKlD9J+XNBRRoiZMbhAFUtMJM/GnnrR7+rMil/WNtVmclYYyKuhaXufCjmKr9f
	 x+nyCeAOBIcJjYSpq0cIkLFWXxwsU/koCL1kzwdfAzcrjIJRzjO7fHTsgGwlGvtpA2
	 DLpbYMS3tOmTQ==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B464517E0364;
	Mon, 17 Nov 2025 14:45:29 +0100 (CET)
Message-ID: <018ef330788ac4d5f3cc6a9b9b98578eefabbbb9.camel@collabora.com>
Subject: Re: [PATCH v6 4/4] media: chips-media: wave5: Improve performance
 of decoder
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
Date: Mon, 17 Nov 2025 08:45:27 -0500
In-Reply-To: <SLXP216MB1148F3ED4920B12EECF84C03EDC9A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20251114012130.59-1-jackson.lee@chipsnmedia.com>
		 <20251114012130.59-5-jackson.lee@chipsnmedia.com>
	 <6196c9fbbd0e45276baa192a510230a2a510626e.camel@collabora.com>
	 <SLXP216MB1148F3ED4920B12EECF84C03EDC9A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
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
	protocol="application/pgp-signature"; boundary="=-Sg37irX4dCAy3X5MhiC7"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Sg37irX4dCAy3X5MhiC7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 17 novembre 2025 =C3=A0 02:07 +0000, jackson.lee a =C3=A9crit=C2=
=A0:
> > > =C2=A0		} else {
> > > +			spin_lock_irqsave(&inst->state_spinlock, flags);
> >=20
> > Move the locking inside the set_state function.
> >=20
> > cheers,
> > Nicolas
>=20
> I think the locking should not be move into the set_state
> function(switch_state).
> Because the send_eos_event, handle_dynamic_resolution_change and
> flag_last_buffer_done already have the lockdep_assert_held(&inst-
> >state_spinlock); inside those function,
> So to concisify the above code, even if the locking is moved into
> switch_statue, the locking should be called again outside.

My suggestion is to try and reduce code redundancy, another method commonly=
 used
is to have a small version of the function that takes the locking, this you=
 can
turn 3 lines into one in many places.

Nicolas

--=-Sg37irX4dCAy3X5MhiC7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaRsm9wAKCRDZQZRRKWBy
9LCxAQDfrq+4B/iMPykob+PtpWQwQ89PQAqXgB0qWXvolGXq1wD7BaleqxEDUTUo
sIDKvTdUgnhneNO/vRL3MSdarlvXsgk=
=cJAT
-----END PGP SIGNATURE-----

--=-Sg37irX4dCAy3X5MhiC7--


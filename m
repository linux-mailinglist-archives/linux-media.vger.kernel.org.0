Return-Path: <linux-media+bounces-62678-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RIS5GVUgEmqQvQYAu9opvQ
	(envelope-from <linux-media+bounces-62678-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 23:47:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B38065C0D43
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 23:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAAD03012C96
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 21:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFF43016EE;
	Sat, 23 May 2026 21:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nYCa6xB3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A562CB672
	for <linux-media@vger.kernel.org>; Sat, 23 May 2026 21:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779572813; cv=none; b=pEQVP2coy4etqHZXgZeo23gZ4vh65Xcpjk4Y+Hw3KvuKjDMFYXvrKkUiDtODUJ+HDM9Q/NSX9geBqI0MIuu3wLdtJAXlXkmqO55l/mwqw1gDmts07xodJbbVCXnJ2CS72I5fHe3wR3+GtJoRFqGic6mqac3I/AhY1MkVq1J2yQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779572813; c=relaxed/simple;
	bh=MYJPoKRqkYSHtucQ9sg6xLR1oUYWDrd1c2HuVWNotP0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gfWvbc0R7UY5qXYmAvCM/cIhLoemtKRRyc6uAFbVDoez0x/DDD8ha+1iToKW+0s+VJO4pEyVkjq5/LO6iphlekEp1TLFkBA1UCQki9uGQUBm2OgsGqnPaFBla/4xOhsy0jGldPuoED1h39e8Wzy6ACA7JWrWYiMKg0bbmwhEaxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nYCa6xB3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779572804;
	bh=MYJPoKRqkYSHtucQ9sg6xLR1oUYWDrd1c2HuVWNotP0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nYCa6xB3dXPs3AaXrtbB2og6plw4YnSbAL1gIHPSP3K8/yNHMGT6WaYt1AOzVPNro
	 poHvksU8T73R/swyBwsU4tlVDpOH+NS7S9mqPTZne3bXijM4/S/EdQdYxX5kqXkMHr
	 z+bv1zxQTm9pEjJcr6EcnmL03sI3sF+n2K5leUL0Wt2o/qiVLzg14wH0l88PZpexeg
	 4OSOSGrNfiUhNeQFN+/co4rH0Z9IIqSgj1FlCrm9VrCw4PSN63pD13oGZETOt0ikPI
	 5XZ1GhVowAe3YCSfyMc5sCQD1n4J1aX3kTuH9MVNB84XmizRNoKB9myz/py1TTlaNb
	 MI3/f83xABKjw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B1EE17E05B5;
	Sat, 23 May 2026 23:46:37 +0200 (CEST)
Message-ID: <fea6841fd4431b8f891e1f3e2f757372a225cc6e.camel@collabora.com>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Jacopo Mondi	
 <jacopo.mondi@ideasonboard.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Michael Riesch	
 <michael.riesch@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>,  Sakari Ailus
 <sakari.ailus@linux.intel.com>, Niklas =?ISO-8859-1?Q?S=F6derlund?=	
 <niklas.soderlund@ragnatech.se>, Tomi Valkeinen	
 <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>,
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Michael Tretter <m.tretter@pengutronix.de>,
  Tomasz Figa <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
 Kieran Bingham	 <kieran.bingham@ideasonboard.com>, Kevin Hilman
 <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>, Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>, Hans de Goede	 <hansg@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Brandon Brnich	 <b-brnich@ti.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Sven =?ISO-8859-1?Q?P=FCschel?=	
 <s.pueschel@pengutronix.de>, Devarsh Thakkar <devarsht@ti.com>, Yemike
 Abhilash Chandra <y-abhilashchandra@ti.com>, Jackson Lee
 <jackson.lee@chipsnmedia.com>, Jai Luthra	 <jai.luthra@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,  "Padhi, Beleswar"	
 <b-padhi@ti.com>, "Donadkar, Rishikesh" <r-donadkar@ti.com>, Rouven
 Czerwinski	 <rouven.czerwinski@linaro.org>, Nayden Kanchev
 <Nayden.Kanchev@arm.com>,  Konstantin Babin <Konstantin.Babin@arm.com>,
 Anthony McGivern <Anthony.McGivern@arm.com>
Date: Sat, 23 May 2026 17:46:35 -0400
In-Reply-To: <CAFEp6-1pA6v7P-ZrOD+iEGfq5Dv0CZ_CLiZ5u35tutQ6zAPqWA@mail.gmail.com>
References: 
	<CAFEp6-0_BdVDqB-re4AghOrRpwZ6H0ZQ9Vw9hv-hgZ+4Dz9HkQ@mail.gmail.com>
	 <20260413201907.GD4034@killaraus.ideasonboard.com>
	 <becd4dc0fe49c9d63fa6b49aab5afb3c4cffa8af.camel@collabora.com>
	 <20260413211602.GE4034@killaraus.ideasonboard.com>
	 <b427dccb-d512-470f-9a42-0f9d153dd1b5@kernel.org>
	 <CANiDSCtHpzVf7KEYoH+tA3RwN5kqQ=5CVp3WR-xPdCMpQ=2x6w@mail.gmail.com>
	 <420e20b3-4264-4ab0-bb50-1ae60f6c837a@collabora.com>
	 <20260414074230.GB4061@killaraus.ideasonboard.com>
	 <CAFEp6-3yQGp5R-B5VajUsmszFOTCFggCXuUa_dyXXULp0bk7Dw@mail.gmail.com>
	 <20260414084259.GC4061@killaraus.ideasonboard.com> <afCmQhSbQLDb6gvo@zed>
	 <77ea77b9-5503-40b2-882b-e96e30028c43@kernel.org>
	 <1182ce00f1c55cf28e13e6eb4f2e018b52a8f6a8.camel@collabora.com>
	 <CAFEp6-1pA6v7P-ZrOD+iEGfq5Dv0CZ_CLiZ5u35tutQ6zAPqWA@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-MvNxaV1W8W4sFXhd7OTv"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-62678-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: B38065C0D43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-MvNxaV1W8W4sFXhd7OTv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Loic,

Le vendredi 22 mai 2026 =C3=A0 21:49 +0200, Loic Poulain a =C3=A9crit=C2=A0=
:
> > I was hoping a small number of people and a simple caf=C3=A9/lobby too.=
 The mass
> > of
> > people interested in the reply arrive much later, but I'm there all day=
, and
> > would be more then happy to be able to brainstorm the subject a bit, wh=
ich
> > is
> > easier in small group.
>=20
> Is this BoF side session still planned? If there=E2=80=99s still interest=
,
> perhaps the easiest option would simply be to meet at the hotel lobby
> on Monday morning.

I myself retracted, and will take a rest day touring instead. But I'll be b=
ack
in Nice in the evening. If there is a meeting point, I'll join.

regards,
Nicolas

--=-MvNxaV1W8W4sFXhd7OTv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCahIgOwAKCRDZQZRRKWBy
9IcjAP0Ux5Z8BiMTmPggvCMIRLSHOG3k9R5+qz0qsUdRhTv75wEAz9scRmRA/VXS
09NAB6PUv3/6hnaJecfvWeH4m5h7Rgs=
=EHrI
-----END PGP SIGNATURE-----

--=-MvNxaV1W8W4sFXhd7OTv--


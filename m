Return-Path: <linux-media+bounces-58757-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDwbDqN/3mm/EwAAu9opvQ
	(envelope-from <linux-media+bounces-58757-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 19:55:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D87EC3FD537
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 19:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C86B3023860
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CB031714F;
	Tue, 14 Apr 2026 17:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CWUQAfHA"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41FD318BB3
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 17:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189331; cv=none; b=gCF16cXPHJ4H6LLqV0KdSfhJ/3j6Jvb+H780l/9yC0kSuiuRHdc8uybbV+EBy6VI7TBG0aai/x2Awcbb5zVp6PrmnJo35y/Gh5d0zDfjKMyatGSTmB9qJ/L3UEAfjdOTvsJPuPa4NVE8dOJ1C2DvIRSjSvPR5e3Z5+88hXwYz4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189331; c=relaxed/simple;
	bh=VftpV1EqjSLQ/d7yEq4ZuandGBbX0c3iTyObq+M98gU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JfDcAxyAnDE0+jjC1wLvmG03/hMM+iMv04MRcPIn5oeqkwFvdVNTqGfqtZyy9fyzaDMaU5mlv8m7zKjwatF/KrWHkfcX/upJ9FDLNVO8a1o1Ut5eSLP5hFBV2vnKmssb82WnvO7aJLrytGzbjLfPtaJQRgg4tfg8b2HbYgIBsZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CWUQAfHA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776189328;
	bh=VftpV1EqjSLQ/d7yEq4ZuandGBbX0c3iTyObq+M98gU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=CWUQAfHA75teroEA8WuJRtGjJNjMrqzYA6LjC/ghJwCCiJznSplHIVX+hjKS6F6Np
	 XviSrY3Nr0wNPlOKFRzFX3jh48XevbRW52hzVky3qQ0oMZzfMRhpHqCkh6X7J/bN/n
	 DM++qScGVsn83lLQ6srHB1ojXxvScNCapd1q4o9ypx9FAHlAJz298xn7y1ug4adSWN
	 p9KvnacnIEX5P8Tr4qkDOpZogYtHIxLQWphsl3brJhb4wc1oFuZOQTOogC/RAeMVDF
	 gxKRsXz178Iy/axVePwdfDoyuVLDalgMilIXMXPXldbYwIP9KYdKaFFZhjq8/XVc3a
	 Qykyw8Aip/1Yw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E63B17E1276;
	Tue, 14 Apr 2026 19:55:22 +0200 (CEST)
Message-ID: <6e4f376fd3d1624a502cb6634e0f855af7d223f5.camel@collabora.com>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Loic Poulain
	 <loic.poulain@oss.qualcomm.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, Ricardo Ribalda	
 <ribalda@chromium.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Linux
 Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sean Young <sean@mess.org>,  Sakari Ailus
 <sakari.ailus@linux.intel.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Niklas =?ISO-8859-1?Q?S=F6derlund?=	
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
 Czerwinski	 <rouven.czerwinski@linaro.org>
Date: Tue, 14 Apr 2026 13:55:20 -0400
In-Reply-To: <20260414084259.GC4061@killaraus.ideasonboard.com>
References: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
	 <CAFEp6-0_BdVDqB-re4AghOrRpwZ6H0ZQ9Vw9hv-hgZ+4Dz9HkQ@mail.gmail.com>
	 <20260413201907.GD4034@killaraus.ideasonboard.com>
	 <becd4dc0fe49c9d63fa6b49aab5afb3c4cffa8af.camel@collabora.com>
	 <20260413211602.GE4034@killaraus.ideasonboard.com>
	 <b427dccb-d512-470f-9a42-0f9d153dd1b5@kernel.org>
	 <CANiDSCtHpzVf7KEYoH+tA3RwN5kqQ=5CVp3WR-xPdCMpQ=2x6w@mail.gmail.com>
	 <420e20b3-4264-4ab0-bb50-1ae60f6c837a@collabora.com>
	 <20260414074230.GB4061@killaraus.ideasonboard.com>
	 <CAFEp6-3yQGp5R-B5VajUsmszFOTCFggCXuUa_dyXXULp0bk7Dw@mail.gmail.com>
	 <20260414084259.GC4061@killaraus.ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-7MsaiGvhe7TtL8HDggvU"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58757-lists,linux-media=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: D87EC3FD537
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-7MsaiGvhe7TtL8HDggvU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

Le mardi 14 avril 2026 =C3=A0 11:42 +0300, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> Let's not reproduce the design mistakes made in the V4L2 M2M framework.
>=20
> I also think you need to decouple the context handling and scheduling in
> two separate components. They need to work together, but shouldn't be
> bundled into a monolithic system. Very importantly, a driver should be
> able to implement contexts with the multi-context helpers, and implement
> custom scheduling itself.

Note that the v4l2_m2m_dev is juts miss-named, it does not wrap a specific =
dev
instance anymore. I'll rename and clean that up eventually, but I agree its=
 not
meant for your purpose, and it will be a good fight to use. Its already a p=
retty
big miss-fit for stateful codec, which don't really have the notion of "act=
ive
central job". Jacopo's proposal is to have multi-context MC (as you already
know), making the media device as the central source of context, so I think
that's a path in the right direction.

But I'll be honest, I would see a future where we actually drop (or break d=
own
into pieces) VB2, which is I read you well, its not miss-aligned with your =
say.

Nicolas

--=-7MsaiGvhe7TtL8HDggvU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCad5/iAAKCRDZQZRRKWBy
9CIZAP4/o8FefCdS5fOSkuADF5bgcYu7hh9qA1c8ilg3pXPbYwEA4G3bv7p7uUTD
yzzwQaQ3a4EOHTgQ5Sg0FVp6j6YOmAY=
=O9hr
-----END PGP SIGNATURE-----

--=-7MsaiGvhe7TtL8HDggvU--


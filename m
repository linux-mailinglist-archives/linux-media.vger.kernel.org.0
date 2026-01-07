Return-Path: <linux-media+bounces-50149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2670CFE56E
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 15:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A76BE305BD23
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 14:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC4F346A0D;
	Wed,  7 Jan 2026 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="qoKLF0ib"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51883469E7
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795870; cv=none; b=GdaRayihEsMqo9iqBogdkcvx+YvghadjXyjn4YAEXlpCUzaRYTs3iOYyfbVVnGeN2D+aH8dPbaN0qEOVCd5YBHbmMZssQdPDLQR9kQW0582wU50EHSimq1lnfgqrdpZ1iOSkODa8EuXWA0+iJpwR3W0o5BoaV20hc4/nrwzpq5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795870; c=relaxed/simple;
	bh=DIOKffkjUEV8oncdVsGhQS7d2PpHY8DcNSUF9DqBttg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jWv+DlSK+vfxpiL0gCnh/GLiMsA2T1clCoLDcqB7TiqHMvsCSV9CnOBnw7oOkDUkwybFzrlm2JNEq4G5tRJ7vMhG1h3zgPU7n0edPy4YavXbb7ZJOqiRV05WwmoQASgxRH0tPAJ92PhZu9Rat/sr1STV+fUawtXWp5+hf8oAu8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=qoKLF0ib; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c0d16bb24dso180350185a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 06:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767795868; x=1768400668; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fNFVme+dR9u7zl7Ngrlb7Wgf4zjZ10+VPmUyii4JMEM=;
        b=qoKLF0ib/LCqtXoZzr7sD4L2WU9leyPlX0o54AbZ5ozYQckr4h/DgSLRqy2BWJWzcM
         guK6FLRpEDtS8V2t/ezT+fTbAzqX4ZGd3UH+2yfvbiih9QnlIVySUUDw++2IDuQvgOz+
         o2JaAZTl4XjWwejpQ/bVAafat2NBwZ/Vv4Y6wTxfO23flvzR4mPKQItyW+9VmPGMZZza
         4Kthg0ngejkRAa5SBMl5R2hjCW3/SgNBkAdvt+JeNC4ppbyolfyBo6tNP3Cqw2eHOjpp
         yXgZqT6wIrguEtLgd47kaZ76Q8lZX7T0/y573AFiPovT/JAW+M9LAZ6L9wgQu5HPSYpd
         cp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795868; x=1768400668;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNFVme+dR9u7zl7Ngrlb7Wgf4zjZ10+VPmUyii4JMEM=;
        b=JjXC37XTI0eBo0wDeNueJBh5P214Rxnlf+Xu5l0BgmerdXlrEEewp5/3N/xJckjqSa
         Ax5o4T4xkXZDQvTbeweNwmHSsr7FLcRDEB9VrPY5G7nK0M8gEtXIdY3aV35rizC/fUXM
         CvxV7qiIzs3tTiG+DQb/+dQuD7F6KAqfJ12cCXJuH/RsopR4sEeAUvZ7S/i/1MKLg0VX
         hdrEJT4v6IEcTF1+Zp4kW+d52xXfEL8y3pYcyYAsooUk66vFY6UAxRzubKZVKrGg9wer
         hmd5HKbJOsFzgjuuH16MPLwSvcC/96y4tS9rD9PsZl9pk1xg9/Z6PgB6fNftIUJ6RIq+
         kCyA==
X-Gm-Message-State: AOJu0Yx6ngk21rQ2Q03rwOwXGEchC0XNUnMxDp4m3zDgOzyLj5P3tM5A
	07LyQEcavBmlu6h7Gb1z7QdL+0tZ+N42kq+Fu1bksJjj4v0CuyrzDgIB47gv2MU3EAk=
X-Gm-Gg: AY/fxX7Hh0GfGL+F5W4oU57+GTnBQz0cEebs/9vt/ooZkdkPvreNitQDzycPSWj1ffU
	XbClQsAuHvrOyVcMmxQ+hUD30gm61lKHTjduudDN0cXz6LY4oknatrtK0gm5X2jUhQG12QmEwu+
	T2qCYimZ7A3X5a5TIHoWWMxoyTGTMTX+bmZG+moCt/QVv6ttqdDyUn+BsuxYtVaV9VnBCdZfwf9
	tXtdduy5uaQNMY04y9LceUnX5YoMomE0dJfZDYb9nldsqevIMxtpNYi60E5OMKPaAE4LzMgCSpw
	WZxMJE1CLY6G69D0XK6hiS49cQlNZwmG+gfqPzcVgjwkucWLe+E2i6OAu0Ha5tJwWMmhxQ8qvAh
	0uJQIFL+l+iSaLQyrvNrZXKSkgPiK0pbrSUDwjFGJ4z13QyXYKihrFYdlMfUgKz2CacprsuXv0b
	mHKxgWPcGOGRj4XXa8dDdHM0/ojJ8=
X-Google-Smtp-Source: AGHT+IErN6Om+JnV7pt2OrE10wjhOwwk29EHITTsHyDdmu04Aosymy91WagJFYJDt0O/0Sn51dCh5w==
X-Received: by 2002:a05:622a:1189:b0:4ee:1dd0:5a53 with SMTP id d75a77b69052e-4ffb4a657aemr30278291cf.78.1767795867495;
        Wed, 07 Jan 2026 06:24:27 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907726f1f1sm33493346d6.52.2026.01.07.06.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:24:26 -0800 (PST)
Message-ID: <11c7e1c0f9e71978d9dea6b1af067e38d9a2509a.camel@ndufresne.ca>
Subject: Re: [PATCH v2 14/22] media: rockchip: rga: support external iommus
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Wed, 07 Jan 2026 09:24:25 -0500
In-Reply-To: <b4b1a113-a8dc-4ed7-b395-eaa0deb6a957@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-14-989a67947f71@pengutronix.de>
	 <c5b6707e3e6748bf923aaf34db1ae231c7e121ad.camel@ndufresne.ca>
	 <b4b1a113-a8dc-4ed7-b395-eaa0deb6a957@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-5UuRc+BcCZ/5WnhbhpYA"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-5UuRc+BcCZ/5WnhbhpYA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 07 janvier 2026 =C3=A0 15:19 +0100, Sven P=C3=BCschel a =C3=A9c=
rit=C2=A0:
> > > @@ -95,13 +96,16 @@ queue_init(void *priv, struct vb2_queue *src_vq,
> > > struct vb2_queue *dst_vq)
> > > =C2=A0 =C2=A0	src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > > =C2=A0 =C2=A0	src_vq->drv_priv =3D ctx;
> > > =C2=A0 =C2=A0	src_vq->ops =3D &rga_qops;
> > > -	src_vq->mem_ops =3D &vb2_dma_sg_memops;
> > > +	src_vq->mem_ops =3D &vb2_dma_contig_memops;
> > That's a bit I'm less knowledgeable here, since I never used the sg_mem=
ops
> > in
> > any of my work, but what is the consequence ? (appart from gaining exte=
rnal
> > iommu support)
>=20
> This is only for the external iommu support, which uses the=20
> vb2_dma_contig_plane_dma_addr function to get a single linear address=20
> (instead of vb2_dma_sg_plane_desc used for the manual iommu mapping).
>=20
> Without an external iommu the value is overridden afterwards to=20
> vb2_dma_sg_memops. I probably should move the if up to make clear that=
=20
> this is only set for the external iommu case.
>=20
> Or did I misunderstand your question?

That was it, I read quickly thinking it was always vb2_dma_contig_memops no=
w,
regardless which iommu implementation is used. If you can make it clearer t=
hat
the ops depends on the context, that would be great.

Nicolas

--=-5UuRc+BcCZ/5WnhbhpYA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV5smQAKCRDZQZRRKWBy
9PM4AQCBafMXk9xMtDHVflNbiu2lwVtsblKMfDzInz3cl5dvOwEA0FMg25ztMD+h
KzEXKxEk4Tw15/oxoq0BpUevHamk4w4=
=81M/
-----END PGP SIGNATURE-----

--=-5UuRc+BcCZ/5WnhbhpYA--


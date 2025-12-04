Return-Path: <linux-media+bounces-48250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B09DCA4EF9
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 19:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E086309F817
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 18:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928733624AD;
	Thu,  4 Dec 2025 18:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="2x+/V778"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A13361DBF
	for <linux-media@vger.kernel.org>; Thu,  4 Dec 2025 18:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764872144; cv=none; b=QS8N3J5yepy1S/+eRR63ML2YD1Mp6lUUDs5cObXZTt+eT464I92+Mz/JLijZaB/1OnPlVbw3rUI6JGVFOwKgGQWRmDYmeDwFEEEb1fe/ijeg6ZbgE7LZurzCp5O66Bt/8qeh/w02auMSqHF9XOb0aSJd9gKHs6coQKkNrjWysfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764872144; c=relaxed/simple;
	bh=a+2kYj5/q0i0WNKmd7h2WF2fnGy3xLOLJAXsmaD7G30=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BGo5RJ2sWKKf6i85sEWWzcFvEozDcnn5+roqaWCASMSDV5uxb8hBhPSiwM3dlqIhR/8A1VxLW01iOHYZsMyxJCzClqsYndSzsTHkYZ+L78Nm9xcnso+7pAridhp5noerbX6iQ/ACIpncWqDaA33TRkHVVzjJYZoqb0YjtEwZ8Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=2x+/V778; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b2d6df99c5so253774685a.1
        for <linux-media@vger.kernel.org>; Thu, 04 Dec 2025 10:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764872139; x=1765476939; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CkN5ne6AGy4deatrHlfFV2w9dbwRa7Sv7MYr8Yqmbic=;
        b=2x+/V778sZne/8V2O+jrOFGn22MGvrVab/Mo7Efj63PENPvsG0BB9dYMl9aayM9R0U
         w6BKH83Ny8GrcgYCMfJJp/kF1l1s5id5LapvZnVXIT7bUcDTOuWg/rBgPtm0OL5324Gf
         u3vi2gs6EEUA7+8InEm82ujjlOZqIsYcPsuflvqJ/fnu102L/oV4ZYKZc9VZ6cmIOhB6
         kIHOVo8Uow3odqW4wjLPRbx5AyGv91oBOZ9ltJUVikmnXOsnvK9vFlQ1tFbF7qj/gWpp
         X+9D4yeExqBqyeyDqVAfEmdUjMOWbyiBCF/cT3px3jtZefQTJ3F+ZkJsokmxGfxhi5hd
         37hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764872139; x=1765476939;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkN5ne6AGy4deatrHlfFV2w9dbwRa7Sv7MYr8Yqmbic=;
        b=PodxhXUf/4gtLc4t7O706EcFJWI7OHFLKlxVN9uqRJVjNHkw9iPuAjdy8XBpSIdse1
         XGr3MSWUCjpSpZIXc3JRoEk/oGR1rD+pQEFqDpKFAUXQz193upjHb1/vTop7cTgOLYBl
         R0ElKyhJVhz9IEBNjX0UeIL0sDgXSh4Nj4ewFnaxbev36LihNDSkv2iEOPT1p2vwk8St
         hSPsSL7xWOW0HVMWmpkqtfrTv/x9OK/jGZQ3NTSiEdOkF0smoctE/EQdSSnNHrNMU7WY
         twJJFaLjOCCzGHpnWjFFGcnsDOIeSQCusA7Ve385WV6DWzCvZR1Cf3EkwCJ7IP58euSc
         joWw==
X-Gm-Message-State: AOJu0Yy0kfgFafgUugXRRbulY7sGq6T2jYP7GffEMfuYQkclbAjb0oQJ
	YMQfnPgvawOFP/64rlBw/H5lGDEBfOVLomQF7AeOwTjvNrD/Vq8rnvAN4uMCSbJ73OE=
X-Gm-Gg: ASbGncvRIqGKivDJ+SI1HJ+R1jNVm4xan9qApqjBvZXkTBR66nx8JviR9+GDc07cm0H
	ORuYCdbnxwnMNpmOCHEPRc2xMhrFGMTbb5wKIW0Z0iE4u1OhIAWmMIDGZp+3BY0yWlIP8Q21NEQ
	Qrs4dgDQjN0JzWDzX0xNBaO8H0LIVay2qLegOzozlN10L2ZlR16205giajeWy3sPejz1JZ1pW44
	Fs8X4C42fNZgpBc4qYxETvSEjNXAPeLAtBdgR0zcujVRMBTkNbtDvz2yoFRMD6vwTyVDjPCSA+L
	ripQ0C5fLMOV8l+BCw29wrhrfdwUehoWjS3jJmgXo3gVkeZebu6itKTWZ2QxTyM0gR8HlH+qvys
	4ePZ5Nlzfx/LsvanyAjwxUiytoivqFJhS0QSyfvDy87HYdaCZRBWjJZgcHLM2dGGc4chal/IISX
	YnQGJOCxYwvozQxsrI
X-Google-Smtp-Source: AGHT+IE+HIR9s2e4UjyUeKhqtKhe1QpzEqyfDz+DTdQCgsuNTjBVcFH9SGVc4xBEqazvmpc5ECJjgg==
X-Received: by 2002:a05:620a:40c4:b0:8b2:9b48:605e with SMTP id af79cd13be357-8b61608ba80mr567564285a.38.1764872138834;
        Thu, 04 Dec 2025 10:15:38 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b6252b2855sm186512885a.13.2025.12.04.10.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:15:37 -0800 (PST)
Message-ID: <9f38bda2f1753645a1ae392ce5364ea0165fdc01.camel@ndufresne.ca>
Subject: Re: [PATCH v3 3/3] media: verisilicon: Avoid G2 bus error while
 decoding H.264 and HEVC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	benjamin.gaignard@collabora.com,
 p.zabel@pengutronix.de, 	sebastian.fricke@collabora.com,
 shawnguo@kernel.org, ulf.hansson@linaro.org, 	s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, 	linux-imx@nxp.com,
 l.stach@pengutronix.de, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Thu, 04 Dec 2025 13:15:35 -0500
In-Reply-To: <aTHGJzVKa7PbEifJ@lizhi-Precision-Tower-5810>
References: <20251204090813.595-1-ming.qian@oss.nxp.com>
	 <20251204090813.595-3-ming.qian@oss.nxp.com>
	 <aTHGJzVKa7PbEifJ@lizhi-Precision-Tower-5810>
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
	protocol="application/pgp-signature"; boundary="=-MBM9wOUi8PufoWyT5ryr"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-MBM9wOUi8PufoWyT5ryr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

Le jeudi 04 d=C3=A9cembre 2025 =C3=A0 12:34 -0500, Frank Li a =C3=A9crit=C2=
=A0:
> > +static struct v4l2_m2m_dev *hantro_get_v4l2_m2m_dev(struct hantro_dev =
*vpu)
> > +{
> > +	struct device_node *node;
> > +	struct hantro_dev *shared_vpu;
> > +
> > +	if (!vpu->variant || !vpu->variant->shared_devices)
> > +		goto init_new_m2m_dev;
>=20
> I found only use shared_devices here, how to=C2=A0 ensure that g1 and g2 =
operate
> alternately by using shared_devices?

shared_devices is an array of of_device_id we match against. All the matchi=
ng
devices will share the same v4l2_m2m_dev (aka m2m scheduler). Typically, bo=
th
cores will be schedule as one. This achieve what alternate operations witho=
ut
active polling or blocking locks/mutex.

For this platform, we only matched against the compatible for simplicity, s=
ince
we know there is only one of each type. I've suggested this method to Ming,
since it will make it really easy to apply such a quirk if other hardware h=
ave
problems or design constraints.

regards,
Nicolas

--=-MBM9wOUi8PufoWyT5ryr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTHPyAAKCRDZQZRRKWBy
9FdpAP0WVi613vUGZXZ8B9/zghQmLePsDyJ2PS2cgoKj3hjSLwEAuoGzRC6WOtML
GYwvZvgMPtF3PhbqORxXKjZpwhicvwA=
=JuBF
-----END PGP SIGNATURE-----

--=-MBM9wOUi8PufoWyT5ryr--


Return-Path: <linux-media+bounces-49504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5933CDD089
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 20:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D22113026BC2
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 19:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2201431E11C;
	Wed, 24 Dec 2025 19:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ZsmWlne7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BCA33E7
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 19:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766603886; cv=none; b=Ix2GQDkvyCHtqbVKYp7uR9zbj2Sl5+GoX5xj3nUwsDgSdT8AKhSFKQyqiuly2vJ589bSe0EUR97PAmwARFlXPtd0XaqI2NOaAQfXV1/FIaFj4mBSqYbNoFWARwHZmV7FuAp3gasHtjGL/USXzcGmDeiYCbGS6JHYtPUu27w1g5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766603886; c=relaxed/simple;
	bh=xZg5eUrmrvQkn5kS5Z5StXMcG2MdDw+ySiCbxKWmi3o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ITJn0QPWSZb0bKeEDQlClq9SUUqsPgOJWFHUEJ8wtjEYVxmuDiis+WOh/pIuqLMQT5TPahqo1i/XL7+m/N+G5JsXgn1LUaM0X82APQUNDsENAKvK2WHsxX/BwfLbRe7w5XHo2abAT9bXWtGE1gG7fbMTZbef2/npxxT9J3Xy90s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ZsmWlne7; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b31a665ba5so691565585a.2
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 11:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766603884; x=1767208684; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xZg5eUrmrvQkn5kS5Z5StXMcG2MdDw+ySiCbxKWmi3o=;
        b=ZsmWlne7wfFWtV5eFakUofdFaB030+KE1QAPNNwPZatJ36ViUOg1eLubUC4N8YfnXY
         3r+sPPNP35Dhc0AUexWJAAtHh+NgjIIa8MXJ02yKsQkfBkohycpGqipMOLlwZrKwPTc6
         Bk8T8KC7Xx5wCLo6zxK7qp+Q1KHwxn9HsIDXG9/bjwoTIsZGrpAMBkF/80YM5eYYW8T6
         2XdatM5V3fjwK5VEL1X5T+GxwCUkih1FaMp5DCtT0Ek8dI7OZXQj6jgpJbnTVqAOZbD0
         4uxYXgSnQfthbFJx1uDjaQ9gdcRgZtyruG5xH9A/2SsteM9qPAI+PZNL/RZ/At1z2aZo
         Ru2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766603884; x=1767208684;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZg5eUrmrvQkn5kS5Z5StXMcG2MdDw+ySiCbxKWmi3o=;
        b=Xg7mgALT7EydUrms9sWIRwdDyRzghrf79w7aCY3aMh56sslNrusAqzpJs4TBODJQPP
         NsPXIDw2ptLV0Ez+pc1NCYKPuw7f/Kvgam62Vq4fVKAaY8UgxHMI9yVHiIhN6PvZEmKH
         8MRXraMRgG7cvGgMX6851M41V5TKhjFReRUIpqNZsaqIso5fvU+uP+2iET1NCX2rxpRS
         qRkiBmpiuff1tAQJrYN5PlJmZCZKPwDixkUSDdsOSd/Dr0a8pxFTw8caKHw2chKh1xop
         eFrccEnoNHqR/clkRqk+RQFEhi7B+wSLYjiEM14VcfjEb+l8tDIFlkKhKl1Bf4ZPao2h
         OfYg==
X-Forwarded-Encrypted: i=1; AJvYcCVseUGUXhYVLozTClHG+qkKbO6/NyEy0jOcx/WtU6L+tzK/CGQaynnZqhbDi3DI0g4dC2HT1U5qdvI0+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOoBrvADjsVf5ed0NJnrTKESWB/HqiN+MlqF8Nb96or0BmICXn
	saCWLVKuRAwpClFq5RPgm99JtupbVl/OPUJT6JVdKL4HjrUSuobXKodw7LMPWR+iLWw=
X-Gm-Gg: AY/fxX6Dh1P9h3fO0i6UtB6mohbNPV7ZnsniKdtlZryJyeMZlp8K9Mn0E1qEEtxwb6V
	M2amRJV9/1XiCjdzg4PQWh6TEyXctiUyo1tHiV6J48VNytw8aWy919Alr0zud+IRiJRebsbGbJm
	733TS+Ou9eKL7wJwwLZI+BlEsfBoyxoc2PJbK1jGLwi60xkqQzvZe8iu5LNjsr8HnSh9N5KP1a8
	nbQZN+szh8lyTomG4qdglpnQkQWEKnBgoaMmkxuAPiJ8rJ9xUl4nX0qew0cTO5SYbeL2629rqbt
	yGCvmKEmbg39Opk4l+4+FhE+RbSnI/o5+p9TmwqPlMz8p9ambXomqhJjLy4ra6ff/Aszu6yM8If
	QdVntqMdQcOGx3oSXXyQxDhgRJ5rv0RZf5jJTx+9WOfgOOlsNV6RdaY4HUliYxO/IVrYPs5MvSp
	YJMCZnstqpuEuNLeEb
X-Google-Smtp-Source: AGHT+IFE+lwyQ0lBVNQN9AauKUiupd6cPnSEIMOpaIWg/SbEk3o4rIkkKVIUe+K1qw6hZBgNQd+vpA==
X-Received: by 2002:a05:620a:4843:b0:8c0:cca6:8522 with SMTP id af79cd13be357-8c0cca68539mr1707477185a.37.1766603883870;
        Wed, 24 Dec 2025 11:18:03 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623feb0sm136297056d6.2.2025.12.24.11.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:18:03 -0800 (PST)
Message-ID: <b6ae2f157fb6fd0b80602f363b99dab1dc0b1cc6.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/3] media: docs: dev-decoder: Trigger dynamic source
 change for colorspace
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 24 Dec 2025 14:18:02 -0500
In-Reply-To: <20251217030227.1546-2-ming.qian@oss.nxp.com>
References: <20251217030227.1546-1-ming.qian@oss.nxp.com>
	 <20251217030227.1546-2-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-n17ZtuMY6Flq/RX7bbkp"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-n17ZtuMY6Flq/RX7bbkp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 17 d=C3=A9cembre 2025 =C3=A0 11:02 +0800, ming.qian@oss.nxp.com=
 a =C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> If colorspace changes, the client needs to renegotiate the pipeline,
> otherwise the decoded frame may not be displayed correctly.
>=20
> So add colorspace as a trigger parameter for dynamic resolution change.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0Documentation/userspace-api/media/v4l/dev-decoder.rst | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> index eb662ced0ab4..2beb6ba1b3c2 100644
> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> @@ -933,7 +933,10 @@ reflected by corresponding queries):
> =C2=A0
> =C2=A0* the minimum number of buffers needed for decoding,
> =C2=A0
> -* bit-depth of the bitstream has been changed.
> +* bit-depth of the bitstream has been changed,
> +
> +* colorspace of the bitstream has been changed, but it doesn't require
> +=C2=A0 buffer reallocation.
> =C2=A0
> =C2=A0Whenever that happens, the decoder must proceed as follows:
> =C2=A0

--=-n17ZtuMY6Flq/RX7bbkp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUw8agAKCRDZQZRRKWBy
9CHGAP9gEAjecV8PUMv/Zb5o06iitW7EtgLf6x+mn9znVa2a7wEA6gnPxAGouGcD
1gWVb5hh/gTP+c0avA3fnMj4aV97VQc=
=oB75
-----END PGP SIGNATURE-----

--=-n17ZtuMY6Flq/RX7bbkp--


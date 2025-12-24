Return-Path: <linux-media+bounces-49505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5372CDD08F
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 20:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D447730072AE
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 19:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9A6329C64;
	Wed, 24 Dec 2025 19:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ByeNXChy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133F42E4274
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 19:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766604002; cv=none; b=NyOsU5RuFsub6+UU7fMof9Bl5QEv1V2cvMt3+o8K3p2gc2DjiHXVDa0tjJ9nv/xF+nx3Xt29242sSpI1MhuAlcXfj28kYr22QWZekLPke3H+rh/a82g3kOLTqss8IrJ+Dk7ejIp5p6K56TKJuKZ/jrBJgBnpNYYxPSiphuuqhxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766604002; c=relaxed/simple;
	bh=ErfgYdcVqeZdxFW+svquaJZWnpjVxPnFzRILn9Io9/w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n10hNLye+punasciHF5YlkluegeN4oaI0fEhTNbiVP1Q6RiQdAsmviht7YIbSC+bHr8VFLe1VLdbYpICznQOX6X/wudbZuX88pIqIlonMI0hxjrCknCbbUr7h+etYW0MAlJ7PCZseOV0OJXm24KaB8ivWqzsXaeJp8UiRhbJL60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ByeNXChy; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a379ca088so67350086d6.0
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 11:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766604000; x=1767208800; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FWgFvpw/AHNyDXufCuZ5epDAc/pafdJFP2isUDb12EE=;
        b=ByeNXChyQiwwyWo3bgWl6/2MjO3bfvf9lvrjkgt4pEv/FpWcGK7R8DD6sHjDIKBvRM
         ZuY75c499eRSFsmpEwBjJaVjSg/iJoLHhKbrGwW9mxdR56PF8ntr6FlOMVckNpdtwt+R
         bs+C0SQ8pVPmABTDnTBlcf8m+qkmyMV8/i/mJV3FjMGg0J8G9nITMOootKXQMzcufSJI
         fblWsXEp3RUlBFyj4ViLjQf/XhNABEzEmA5lAjV4EPNAiYErtqOBzqdKqNXY+iV8XHMq
         hMD6N8QFBDombJ2e7e8Vq07/dL++PgTmV8DddlnCC6AbaiSnxN1MySjnXhd9z4CaFUHb
         YJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604000; x=1767208800;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWgFvpw/AHNyDXufCuZ5epDAc/pafdJFP2isUDb12EE=;
        b=GBgLtESmHftBuedPEe1/opQts8EkeznzdG6/Zrc/KBiVS/BTznzLVBFccg2RGcG+tX
         22DYyPkGVv8H42qdItsgmXKWyhvFwLBqEUq/c6rzA/lrYM6oRjbwHc95zKFKXamzq6Qw
         BAzCMxAnCqwna85mqy+a9mzTznPVr5YqANM4PZoTI2RpYJENQAfIu4OY9DeE5XMX5y5E
         EgmqJ4FpxqGuUe6fl2Nk8Uw4oUDY7GfbejtrDc+bKRrRuIX0aGu8LKYLRrAav3h/WKqk
         WBGZ9Oh2H09o9MMfVl0BBqbEZdRkixBhHW4z/BXNhaWmIVspE0ErxD5tWa52jfAE45TM
         kkVw==
X-Forwarded-Encrypted: i=1; AJvYcCXstojtPYKX++hk9LWh2SVYzsTB+3n7LKQHGH/jqDNrJDXBkRJ641AOhE2tuMhsaP9ZvJHeG0gEh/9BCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTuLsrrz+aZf5qh7fTFJny8WEXBnINPte7P2CIbOtArO3iJSQa
	GRa3sCLqjxy7h4PTbWzfwARxzsgSQqtzRrsLLvpA7dYQVIw4VpVDMfCIrX9njaFv3Jc=
X-Gm-Gg: AY/fxX4THCl1AXmupiIIFueK6H614slBRHzcuUhZUuRmAz0zoJgHIr5fOuWvJstpi5e
	dV8FWwYBURLPuP2l4GCcvVay1sZKmduYBrkqEftJRpbZg0CIo8lEvkt62O/Bt0goYcbPgzqe/Fu
	lRudqDj7UnOZABWIe9LN2jcl5TUsXbwE09S9SojGsFWR3dpVrUtKTNWgRbtcqwCCCepZbBogQ3n
	RklYsD/izN2m/hrD7w6Cqq16x3IxeDb67RBSmooJlV/tKlddjFTdEh+1ae0z8tMu4wMahGTJAgH
	X4PrK5BbNGorizkFBOPyl6MGsBWvLUVH9+67niVbRNJ+7vgHxuuNIjat+FQwkrQzmh/XrzyF4Ld
	h9nhV8EcNuOlFkrKWkOKIcLm2rUPQhv4ibMNT4jqxm5pjBdlEF1Sn4p66Sl8rdu+RcxpgVf8D/y
	iHeXbjVsRb2Mp6Fy8nlU8vJEXkNSM=
X-Google-Smtp-Source: AGHT+IEeDZpPPu6YZwcQ8tx4vjP/alqKLZ2iCL81HE8OxCMqXyviVYCPm8KNV8TIbtaCK6+e47FNYg==
X-Received: by 2002:a05:6214:20a2:b0:880:5279:98eb with SMTP id 6a1803df08f44-88d86290d80mr291887636d6.44.1766604000085;
        Wed, 24 Dec 2025 11:20:00 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a44e26bsm131729676d6.47.2025.12.24.11.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:19:59 -0800 (PST)
Message-ID: <5500fa4f4ee321a451360a84cf5834781c1a9615.camel@ndufresne.ca>
Subject: Re: [PATCH v4 2/3] media: amphion: Clear last_buffer_dequeued flag
 for DEC_CMD_START
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 24 Dec 2025 14:19:58 -0500
In-Reply-To: <20251217030227.1546-3-ming.qian@oss.nxp.com>
References: <20251217030227.1546-1-ming.qian@oss.nxp.com>
	 <20251217030227.1546-3-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-TbnDfBH7kuP5a4j2UK4h"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-TbnDfBH7kuP5a4j2UK4h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 17 d=C3=A9cembre 2025 =C3=A0 11:02 +0800, ming.qian@oss.nxp.com=
 a =C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> The V4L2_DEC_CMD_START command may be used to handle the dynamic source
> change, which will triggers an implicit decoder drain.
> The last_buffer_dequeued flag is set in the implicit decoder drain,
> so driver need to clear it to continue the following decoding flow.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/amphion/vdec.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index c0d2aabb9e0e..f25dbcebdccf 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -724,6 +724,7 @@ static int vdec_decoder_cmd(struct file *file, void *=
fh, struct v4l2_decoder_cmd
> =C2=A0	switch (cmd->cmd) {
> =C2=A0	case V4L2_DEC_CMD_START:
> =C2=A0		vdec_cmd_start(inst);
> +		vb2_clear_last_buffer_dequeued(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx));
> =C2=A0		break;
> =C2=A0	case V4L2_DEC_CMD_STOP:
> =C2=A0		vdec_cmd_stop(inst);

--=-TbnDfBH7kuP5a4j2UK4h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUw83gAKCRDZQZRRKWBy
9N4GAPsEStp+V8u3PcY6TUQYOCoH/OAkqDJ6OoG31fahIVD4IQEA+Bl3uh5sZQhc
KDFtxNYkj8x7KW7YxzN9h3vDdlSs3AM=
=bMEn
-----END PGP SIGNATURE-----

--=-TbnDfBH7kuP5a4j2UK4h--


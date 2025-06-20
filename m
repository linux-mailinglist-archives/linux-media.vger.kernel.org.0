Return-Path: <linux-media+bounces-35496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9A3AE1E11
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 17:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 243C83AAA9E
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 15:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABFC2BDC0C;
	Fri, 20 Jun 2025 15:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="rNo/I8ZL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D1A2BD5A1
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432012; cv=none; b=l0+EJ3RQC1uHhA7IpOJVVYGOlLkJ+F5GRqDlqz13cN5fXZE7xaRMrYT6H3boYH6+x8IC9WRZdMOpT16whPSv/jENhNHJE+bsmeacQz6XcUUOTSpLY+66iexl7YRELmFB9TipfdRX7p8HZn6U1gdGTRDUNYxFCyKqD1LMI30dyTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432012; c=relaxed/simple;
	bh=LSJDkcrrLoGkZMF1EcEy87q2AqYWTZd7Xq9u6uACDbA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W/dI3hNnKGUx3j6uOXP4moCg+fk7lbdTQX7Pwc4z0k8vFVYcTmOIq5ZPOo9e8GEKmkon2q0q9Yw/T12f7ZV0GTR3xmv6tpPaKeCF4ekOedwVr1XIR/Msn6uaJf2n7Loaey7sb/lJofzfjKnpGFNiRHrGv96vwCakrlqDLVRxdX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=rNo/I8ZL; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fad79433bbso18177886d6.0
        for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1750432010; x=1751036810; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LSJDkcrrLoGkZMF1EcEy87q2AqYWTZd7Xq9u6uACDbA=;
        b=rNo/I8ZLPTYwIASTYWqIBzmo9dFFxRQ8A9abnij7sxynDKlyY3kd/I51lkDzbv2Csq
         qKfrFE1tWHMu+/uUz9DI64tkTDWTB9By42PFLkBSNKrIHSWX3lG+22mMDnu0wx23GR9Z
         jANCJYGtMKkMEfSTAZeD+yturVQou1HU2TKLNz0BSSInCQfcgYCwgo5gv4aYDkqbHEPw
         3xj/JUQ6FHaAAclzdwET/4c+vnnO/RC9umRc+12sOLL7KcuM1gPXZSlETUl1Hzct3gRJ
         SnBwlfoJuM8S8URvyMbhu7ILos1W5k9jsFi4IvjKYe4sqb7k14rSeqiysV4298+YtGh1
         PA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750432010; x=1751036810;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSJDkcrrLoGkZMF1EcEy87q2AqYWTZd7Xq9u6uACDbA=;
        b=VppGRYePkLJCYkEhLpwpKM6PKFgQKz3dJae5Z11ZhdO6TgaPh31Y/j6oOfaYgdtuuv
         hZH0QABUbeOrWYfsg33vFw/eCfAjYmYOS11icnvQCsydLTzCt+XXP/W+BYRTsDnUuDzr
         DrbDquZQKWA2TbZvi9rOjDWBycyn3/Sij3+NnXwcj0abtgel8DJVM5xzNMgdJ6ccs2L7
         qNkIHIeomp2qM9ZrpALL+xyO4HL7S7ZX97iGeF9CqI2BMcTcUCoeYduD09VQCC30FlPq
         FBXi6GRjCe6B4Z7ZKUnsO9i92on/1dGnkKII7UPskGF6nBETHwixutTPfQMsJwdw2g3D
         2MBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVACJ8sfpnYu4Vb9Mj0bUwtkh/rlESEsy++v3SCnqZQ9mKyIwGaD8/qR8AT2NzqU9ISp6jYws3XGutS9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxclH5jtRRRQxN0XzSHyLpRAXtyeMehdcllG8Ui0sGfZoNIGLhv
	CTbaeQX3Zn/FnUuesz2Gp+VpJRqWjl4ZZc7TYOsaplImNBLvMUMAKmOGBcFkvwlro/0=
X-Gm-Gg: ASbGncuvxoMpcPeAUNBPAzZ2ticTpKSLCmNN9zCHI0UwyANsHyXXwXi6lgNE0kYGW4X
	zqK4u2mprhsrMNSoK1kdjmu/OJmoxfX+r4DEkT7LjskHoT3zubnGMHmvDlko6aOQGIxLbyYQ4mx
	08vmZ0iI4/dh3Ba2t9r+n8dazCKNRoHF+9pdcHNEgrIiTtv/kj+pLuZZy0zeLU5+fq0zzH51v7A
	aC7eHd4bKuzKtd+0GlnDYJ9WwJm+spI+xda2SpxFbNOT/mT3g454kqXNXtK0cYGovFElR//STjw
	cOp2mvSPPZ6nl0sr/yoOt0XUJVrDp7iuku3lVbPC6lMUcxD28Y5NL0rUezy+whnBFwk=
X-Google-Smtp-Source: AGHT+IFSbdWcJq6maD1xUyD31N97nxqkeERkrPfl+oPHZ7odb6VWFZL/FFDSL0pRREpka1+wvb6uPw==
X-Received: by 2002:a05:6214:2463:b0:6f8:8fdf:f460 with SMTP id 6a1803df08f44-6fd0a461262mr40636306d6.9.1750432009010;
        Fri, 20 Jun 2025 08:06:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::c41? ([2606:6d00:17:b699::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd095a3f94sm12971696d6.111.2025.06.20.08.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:06:47 -0700 (PDT)
Message-ID: <82d38c0dc93255da3195a919dc650ef8fc07e7f2.camel@ndufresne.ca>
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Shawn Guo
	 <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	ming.qian@nxp.com
Date: Fri, 20 Jun 2025 11:06:45 -0400
In-Reply-To: <6898ce74-808d-4976-b04e-31737396a86c@linaro.org>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
	 <20250521173444.310641-1-Frank.Li@nxp.com>
	 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
	 <aFORokzx/sImgDtA@dragon>
	 <d46d73f84e78daf152962ffb5cce7dd3ae0920d1.camel@ndufresne.ca>
	 <6898ce74-808d-4976-b04e-31737396a86c@linaro.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6BjHJSIIonN27c8RdqsP"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-6BjHJSIIonN27c8RdqsP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 juin 2025 =C3=A0 07:54 +0200, Krzysztof Kozlowski a =C3=A9cr=
it=C2=A0:
> On 19/06/2025 19:16, Nicolas Dufresne wrote:
> > Le jeudi 19 juin 2025 =C3=A0 12:27 +0800, Shawn Guo a =C3=A9crit=C2=A0:
> > > On Fri, May 23, 2025 at 07:22:04PM -0400, Nicolas Dufresne wrote:
> > > > Hi,
> > > >=20
> > > > Le mercredi 21 mai 2025 =C3=A0 13:34 -0400, Frank Li a =C3=A9crit=
=C2=A0:
> > > > > Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc",=
 which
> > > > > are backward compatible with "nxp,imx8qxp-jpgdec" and
> > > > > "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which co=
mbine
> > > > > wrap and all slots together. Reduce minItems of power-domains to =
1 for
> > > > > i.MX95 and keep the same restriction for others.
> > > > >=20
> > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > >=20
> > > > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > >=20
> > > > Krzysztof, will you take this one once the DTS part is ready ?
> > >=20
> > > dt-bindings is the prerequisite of DTS.=C2=A0 DTS patch looks good to=
 me
> > > and I'm waiting for dt-bindings part to be applied first.
> >=20
> > I was waiting for sign of life on the DTS part, we usually get some ack=
,
> > which is good sign we can take the bindings.
>=20
> Such process never happens. DT bindings are the prerequisite here and
> platform maintainers wait for bindings to be accepted before taking DTS
> or even sometimes reviewing DTS. Why even bother to review DTS if it
> follows entirely incorrect binding?

You are the one requesting DTS with DT bindings for review purpose. You've
done so regularly this year.

As for review process, Ack are a workaround to a black whole in our review
process. Patches without any reply can either be un-reviewed due to lack
of time, or accepted. You do whatever you like, I'm just saying that clarit=
y
can help to coordinate.

regards,
Nicolas

>=20
> Best regards,
> Krzysztof

--=-6BjHJSIIonN27c8RdqsP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaFV5BQAKCRDZQZRRKWBy
9KazAQCZpPC27cOiLrCeirOx9KtegKeVBpOKvNdcjZFKHZg+0AD+OJGvNGaHn+Di
rFaOSJG8M735rmjWeSPrkNAWKU2s4Qc=
=Chy2
-----END PGP SIGNATURE-----

--=-6BjHJSIIonN27c8RdqsP--


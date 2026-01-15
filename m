Return-Path: <linux-media+bounces-50796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7A0D24DC9
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 15:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F1A0A300CB4A
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 14:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7063A1A55;
	Thu, 15 Jan 2026 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="XDxZ4l+T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2EF3A1A37
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 14:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485738; cv=none; b=RwB79u9j9sk50NkdRx0vL8t2L9r4MXxBY/6nIPs8iJOej8u7Ty1B51c/sg5oTonMud/GRivIxhCAS8vplxMFIc2RUUoRUPcsz4IlPFNl2MC08alVrW8KM3WeRFfsJn/oJV7ZFgNYesNvG/gRm0azZJ1VLP2KI56tQhm+qlOjhVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485738; c=relaxed/simple;
	bh=mkebdjfvUNSZgRJJe+5p7S/ViqNXWJxR/XbMtIkcIGo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y1e5VcyFjkvhXYCVqqFvpxKtfJv49vxXBV2n2FaRGbDhAsmqtSpxMHmpZlQaisf6eHp0vzs+usnfsMGQ2OzhpexVFBqEPujURlVVh6rrA0YwN7X3e1UGzBsHDZvNo9gRPZQq/c2f6Ot4upAmrCefYF8tKLbCBH19AQTGtYX7uPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=XDxZ4l+T; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88fe44cce7eso10025956d6.3
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 06:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1768485736; x=1769090536; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mkebdjfvUNSZgRJJe+5p7S/ViqNXWJxR/XbMtIkcIGo=;
        b=XDxZ4l+TZ0q+2F9Ly9YI6QBZm4Fc64M0v6JwPn2mVFQ5De5EiGpI0QSKDzYsHDk9PI
         zcdBTKyw0HYzHlb3bvSxMW7nLhU8jYsZ3xrrTtYsDrCZ14xPNhJvwElMf0WLqNEFuE+q
         BFvAJVMT5pzu63atidIuwpxkZJ3W3TErW/imhxYfLPeWjAooCFK0J0eK3HoP52Obt5uy
         h/lVQNIq/hiM9+pt/lqXP7/ecyAbbErMKoErANhaVJtKAbo4xSaw4BLmHsMO4Sd6wikN
         y7ovdMrVJY1nA15k2UsPkj9aLER/81ysIzkMtr0jNrPC58GS9HuU9XLwOaTeqWWCitjh
         9mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768485736; x=1769090536;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkebdjfvUNSZgRJJe+5p7S/ViqNXWJxR/XbMtIkcIGo=;
        b=N4Oo/wFlrROQBYWEx7f4SC5DJyXWFcu6RmcjEGQyaCeGm2soINrKTn93v5jezIax0D
         oqsFQg//1bt8s9azqawrXFpbcVx7o6qH85a+fLaX/qyZrP8p8Oxspwr4F28tbGl8DFKk
         l/KbL1SD4z5Jspx952JrQEq8LckWhO2qBRhGFC1AMkYC4RLiU90FwPrLyC3HvhgNKYiu
         Q2SIMFmq4nBifQdumHva8+bTQUR2+ptleWaW3NvH0ysRJC93zEztwbuEGnDEIolZTkri
         AIB9Lv+jg1xblQwZTp6pp1llaWUEGrSy8jS5LVtnaRaJ9MeSE44a7Hdw0u/V7djRAadE
         Hvbw==
X-Forwarded-Encrypted: i=1; AJvYcCW1V3fhBhkiqEiu6IOeGCYJLjykkIR9sMpsYJp6F0wcG93bdBHuTVP5Vg3B9vo33QopR1rhzGD6YP+HKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqFIFAW3ODa6B1EPwuxxHaxyI5ExKeFo6btjTeZflSgB46w0Mc
	d2MfhDGOdpYNwl752k+saaLMoNN0JiATK0ziZPzq+qxUDo7WuvPKsj2ej9WKDtwNOrE=
X-Gm-Gg: AY/fxX4XIJqJ4mbLUw3xeyOrWm4PfpU6U3s6KN83yEHFYf4Uq/K8oekLoCEdTWbtdVN
	fBScVhtRsWh2yYGmjE3502Q6rfakkc9YLRKjZ4WR21c5blVRsjhKRcQA65AatoG9WFzUqJ2zm/b
	xTX7313p6pVbV3japNL6gIdizrlxQ4Ql/fFl4IpBzUVVAHjLDOpkN+WNtKGk9f21/ERtFE+AMhF
	bY1yjhfzo1LomBWI4/Ur6NkXHOLP+11wRpELwHl/umTXgsx3XA+FuRisODgxDRx9H84aE/EIcNp
	+3iPb2wtdnuPMTMvFKH84KLSVLrfXrcX9F0g7wgYWotvVB1BkKidDFgMxjWJ1l6DIsDb7cfmOSv
	EvTqkrmRqgSpnSqQSylcAodIj/yUnU9d7hNEirAREjv4dv/p7ussRpfMxOUIY+OkKY1wnEk3fSi
	TbCb0URTTCjOmqeFPV
X-Received: by 2002:a05:6214:10c2:b0:785:aa57:b5bb with SMTP id 6a1803df08f44-892743cfe92mr64172606d6.43.1768485731419;
        Thu, 15 Jan 2026 06:02:11 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530a9f5aasm395158685a.21.2026.01.15.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:02:10 -0800 (PST)
Message-ID: <50137983757d754609d8164dbdfc429b32e3d6b5.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/3] Add support for QC08C format in iris driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dikshita Agarwal
	 <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Abhinav Kumar	
 <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 09:02:07 -0500
In-Reply-To: <s2qjimx4tq2jdnir7b5dljf4onsbcmvb5prxcvc22q76l5cgnz@wrgcqdrl26sb>
References: 
	<20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
	 <s2qjimx4tq2jdnir7b5dljf4onsbcmvb5prxcvc22q76l5cgnz@wrgcqdrl26sb>
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
	protocol="application/pgp-signature"; boundary="=-SuVcRe6JDVhxJkp0/xej"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-SuVcRe6JDVhxJkp0/xej
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 15 janvier 2026 =C3=A0 10:08 +0200, Dmitry Baryshkov a =C3=A9crit=
=C2=A0:
> On Wed, Oct 08, 2025 at 03:22:24PM +0530, Dikshita Agarwal wrote:
> > Add support for the QC08C color format in both the encoder and decoder=
=20
> > paths of the iris driver. The changes include:
> >=20
> > - Adding QC08C format handling in the driver for both encoding and=20
> > decoding.
> > - Updating format enumeration to properly return supported formats.
> > - Ensuring the correct HFI format is set for firmware communication.
> > -Making all related changes required for seamless integration of QC08C=
=20
> > support.
> >=20
> > The changes have been validated using v4l2-ctl, compliance, and GStream=
er
> > (GST) tests.
> > Both GST and v4l2-ctl tests were performed using the NV12 format, as=
=20
> > these clients do not support the QCOM-specific QC08C format, and all=
=20
> > tests passed successfully.
> >=20
> > During v4l2-ctl testing, a regression was observed when using the NV12=
=20
> > color format after adding QC08C support. A fix for this regression has=
=20
> > also been posted [1].
> >=20
> > [1]:
> > https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.a=
garwal@oss.qualcomm.com/T/#u
> > =C2=A0
> >=20
> > Changes in v2:
> > - Added separate patch to add support for HFI_PROP_OPB_ENABLE (Bryan)
> > - Updated commit text to indicate QC08C is NV12 with UBWC compression
> > (Bryan, Dmitry)
> > - Renamed IRIS_FMT_UBWC to IRIS_FMT_QC08C (Dmitry)
> > - Link to v1:
> > https://lore.kernel.org/r/20250919-video-iris-ubwc-enable-v1-0-000d11ed=
afd8@oss.qualcomm.com
> >=20
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > ---
> > Dikshita Agarwal (3):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add support for HFI_PROP_OP=
B_ENABLE to control split mode
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add support for QC08C forma=
t for decoder
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add support for QC08C forma=
t for encoder
> >=20
>=20
> Looking at the series again... What is the definition of V4L formats?
> Are they expected to be self-compatible? Transferable between machines?
> In DRM world we made a mistake, making use of a single non-parametrized
> UBWC modifier, and then later we had to introduce OOB values to
> represent different params of UBWC compressed images.
>=20
> So, I wanted to ask, is single "UBWC-compressed NV12" enough for V4L2 or
> should we have different format values (at least for different swizzle
> and macrotile modes)?

Our expectation is that the decoder will produce the same format regardless=
 the
resolution. And that format should be shareable, so that same format coming=
 from
two drivers means the same thing without out of band data, except that
resolution and strides are needed oob anyway and can obviously be used as a=
n
acceptable workaround the issue you describe. It should also have a single
translation to DRM fourcc + modifier, and hopefully the other way around is
possible too, otherwise its a bit broken and unusable.

So bottom line, since V4L2 does not have modifiers, you have to treat one V=
4L2
format as a pair of DRM fourcc + modifier. Decoders typically only support =
a
subset, or hardware engineers can generally pick a handful of performant
configurations that works for all cases (its all 2D with similarly sized
macroblocks). Since these formats are only usable when consumed by GPU or
display controllers, its important that all party uses the same convention =
for
the limited information available.

Nicolas

--=-SuVcRe6JDVhxJkp0/xej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaWjzYAAKCRDZQZRRKWBy
9NHdAQC5zVxUrA0j3qXnoLE4o2clAaoEaw5nwUgVFbmIokPgOgEA00HZmP6ttFY1
awXTgDpAWi4QX7nSzx2DLiass5x7rAE=
=MTpT
-----END PGP SIGNATURE-----

--=-SuVcRe6JDVhxJkp0/xej--


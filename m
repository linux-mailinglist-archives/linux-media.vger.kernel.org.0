Return-Path: <linux-media+bounces-44940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89922BEB6EA
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 22:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E178B1AA4FE7
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 20:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CC32561AE;
	Fri, 17 Oct 2025 20:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="uaaILemH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC38423A98E
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 20:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760731324; cv=none; b=r90+UfL3lJqSzc7e7OCb2VDT9j4J4F17QoBcjCyG7a0+0bVMFc/4fNq6XqKV8zr7FJG23e3aJu6zCfw4D+OSog6OslM7RA/tTe+HjV28Yb/blr3OPijr/en6haIzzuUr+fDVpo04Es4FcJEZCxBcphMZ8s8PxTC6/rgbCxheHfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760731324; c=relaxed/simple;
	bh=uyhTf/Yn6End13EicY7fTGC1iItnSMpS8TMBNDZvOT8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ma7DWvskMpDkdJYoA3O26eoGv0sEBQVJhSGzpyjOkJ8ixsF/as8Y5Y+SATZP0MLXf0F//VpT86dno0eDndVDGi8ZJSd5VFkFQwzj7Xz3LG24SUSk07sHZ00SjS+sHAJOSF33PT78rpnsCvXVzhLNCkXohc16VHuLvKqnL7w/7sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=uaaILemH; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5d28f9b4c8cso1889607137.2
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1760731322; x=1761336122; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uyhTf/Yn6End13EicY7fTGC1iItnSMpS8TMBNDZvOT8=;
        b=uaaILemHO0QiQamnUkVY6Q3aYm58PzvJ0NTP++KsA2Shen/K9kkeo/5qm4t+71afSj
         D0fjdbdPN7vxrvK7Ucet0nAMfoiJ58qOMFqp8icKGbmjnDt+T5R8CrXi8U1jDBPMXqoV
         AgpG748P8MEbVd1AzPSG51ijJQn9SG/y/6m3Mws2nGA6L7VPVU2k6FbPAC33XmFnjTVU
         IRwKY4FF9YrEIT8XsYox5c/JZcxeTEISnQf/Z2M1sA0HWyuF+JyTdgsQYJgRHX1lK64d
         lAP90dhULEdB8NM2fEVx7lsGDo8iVD1JdpMTs03MfviEZInjQUKS3Y7arsS9j2DX15Qt
         XUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760731322; x=1761336122;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyhTf/Yn6End13EicY7fTGC1iItnSMpS8TMBNDZvOT8=;
        b=iZH0XjW+l/v0Y2pzQSAysW2NBM7NTxDhJvf+E6gNysxNXlccHlMz/WqQsrByy5Iqq+
         R+omEjmS+UVjt+0F70/Gqg7NS4zRxBrlCFnGZuFv4ZQ+qY2zbV8zM3b07CK1wTrmCiY/
         U9JE2F0mczXai7oD/bgh+9gPyskCs/z+52Tq3D2Fe4TWEe8veO+n7enAdsw5iMZcFvcj
         tJ1v1sRea2BOTlc8uY5G8n3StYaYPuWrvsvnq6mfoW6hRUbdP8ijW2WoyBMYF1+/vNXS
         tEGjnvcD74pMk/Z2xaLkk5+sWqeiS70KkCwNA7ihhPaP6gzMWhlkmrhDjVSqkctarMB6
         EHbw==
X-Gm-Message-State: AOJu0Yxs77ASvP5WhPiCNL/keKWA6ECtgee2NYqltEG47OmNjIHUs3a3
	TSCBQPLLR4rCkXguc7e7Ezx1xmhmob7FqRRQ3fJRPbgd47W/1sh8QtGDpIsRxk7z05g=
X-Gm-Gg: ASbGnct2FvcRgecVbM46rgTDOr1B9uwiipcQewdhgRUk2fTGo8NjfTvu95s2lCgfjg3
	F7ZEnDkRMBhF0nBbkANVmQ28knjZxLIAfssBIt819qVZyDBlayZdd3QYtKBjj/ZjDsu+BavWPdK
	AOk5EKDaW8gG31nmDKv8CiB8n3uczJtF8VQHJj9mQK3XHezGvGymrnNlDWJwcJhuqNkzTEIk55/
	rUJx/SIeLSt/zcPniAxXTD8WAjCRhUrzONpK18OjrG3RBmvmzXPSHn6d7Ku9ffuyLF2IexuCrti
	YSmdG9eU97pOSlj/CyXYHmCHr3WfeKgVD8IADNdFuEZM0P3QIfBKbIt20fYvGx92vjMGjpgwS/I
	Qi8UZOP8xTHAZf2pDH5FwiEsMYjoRqzZPm0SBJ2mDMLtvBNTMpcpBu8xB56912Hk4vFEhL9T3Oe
	b5u1p46nbjQYnLdZVG
X-Google-Smtp-Source: AGHT+IGmcdG+dLWZ9QjPqKn5vbvyPULmAxubJ7JMNbm5wJ9rjtxXh60lzpQUudunNXWZznUcpLdv0A==
X-Received: by 2002:a05:6102:a4c:b0:5d5:d1e1:73e8 with SMTP id ada2fe7eead31-5d7dd555679mr2238466137.13.1760731321548;
        Fri, 17 Oct 2025 13:02:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::5ac? ([2606:6d00:17:ebd3::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87cf51ff3c9sm4701776d6.8.2025.10.17.13.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:02:00 -0700 (PDT)
Message-ID: <c2acbc028d014ca9eccefc070e50e40a1022f90c.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
Date: Fri, 17 Oct 2025 16:01:59 -0400
In-Reply-To: <20251017-av1_irisdecoder-v2-1-964a5478139e@oss.qualcomm.com>
References: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
	 <20251017-av1_irisdecoder-v2-1-964a5478139e@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="=-Bg5QwTftatcyAjl3ssim"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Bg5QwTftatcyAjl3ssim
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 17 octobre 2025 =C3=A0 11:35 -0700, Deepa Guthyappa Madivalara =
a =C3=A9crit=C2=A0:
> Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
> Video4Linux2(V4L2) API. This format is intended for AV1
> bitstreams in stateful decoding/encoding workflows.
> The fourcc code 'AV10' is used to distinguish
> this format from the existing V4L2_PIX_FMT_AV1_FRAME,
> which is used for stateless AV1 decoder implementation.
>=20
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.=
com>
> ---
> =C2=A0Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 +++=
+++++
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A02 files changed, 9 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index 806ed73ac474ce0e6df00f902850db9fd0db240e..d82557a6ac30851b4fd432a5c=
eab969abaed2e25 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -274,6 +274,14 @@ Compressed Formats
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of macroblocks to decode=
 a full corresponding frame to the matching
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 capture buffer.
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 * .. _V4L2-PIX-FMT-AV1:
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``V4L2_PIX_FMT_AV1``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 'AV10'
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - AV1 compressed video frame. This format=
 is adapted for implementing AV1
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pipeline. The decoder impleme=
nts stateful video decoder and expects one
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Temporal Unit per buffer from=
 OBU-stream or AnnexB.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The encoder generates one Tem=
poral Unit per buffer.
> =C2=A0.. raw:: latex
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 \normalsize
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..e03cfe0a5ae830595f0bf69b9=
51ca16beaedab72 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -775,6 +775,7 @@ struct v4l2_pix_format {
> =C2=A0#define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* =
H264 parsed slices */
> =C2=A0#define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* =
HEVC parsed slices */
> =C2=A0#define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* A=
V1 parsed frame */
> +#define V4L2_PIX_FMT_AV1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc('A', =
'V', '1', '0') /* AV1 */

An alternative fourcc could be to match the one used in the ISO specificati=
on,
which is also what browsers and Android uses. It would be "av01", link to t=
he
spec:

http://downloads.aomedia.org/assets/pdf/AV1-ISO-Base-Media-File-Format-Bind=
ing-Specification.pdf

Though, we never had any requirement in this direction, its just an idea. W=
ith
or without, I'm happy with the definition.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

cheers,
Nicolas

> =C2=A0#define V4L2_PIX_FMT_SPK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc(=
'S', 'P', 'K', '0') /* Sorenson Spark */
> =C2=A0#define V4L2_PIX_FMT_RV30=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc('R', =
'V', '3', '0') /* RealVideo 8 */
> =C2=A0#define V4L2_PIX_FMT_RV40=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc('R', =
'V', '4', '0') /* RealVideo 9 & 10 */

--=-Bg5QwTftatcyAjl3ssim
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaPKgtwAKCRDZQZRRKWBy
9G1mAQDGt5JQOm/w9g5nqKhv2gVj6S9I2LtZXQK7kIzpHep3EgD/UvNxHjG+9EpN
WkjKrbrxs1vYrwA/CnwzIQlfpQbKVgo=
=RfIA
-----END PGP SIGNATURE-----

--=-Bg5QwTftatcyAjl3ssim--


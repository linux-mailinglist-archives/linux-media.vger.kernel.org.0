Return-Path: <linux-media+bounces-41356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D83B3C2C0
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 20:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19CE17A20EC
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 18:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B97235063;
	Fri, 29 Aug 2025 18:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="nDWYWXDd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C4E9443
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 18:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756493833; cv=none; b=OoRz+OvWL4hRRmMASZE8TMiwVwHL7NDHNsmaUsFUFLY4eihjc4Ur/FUfDtt35XBcIVnlNTKjA03d2P629Bf//nPbn4kQJz6UAB4HwHv2+hjVOsu2s1VR0k8fS3sm9XBW8EavMcZrqjPsq0k/80E6s4sKPAmmQ4Gde04G5xytUmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756493833; c=relaxed/simple;
	bh=FAJXaYxtOcQ6gcRwtrG9GjWiuiiQtc3drDqS9/YbCtc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KJ7uCRW9VUgzQXHjjXjfmeqt78Hlo5FnP5qP8+EFmeRDTfCCojBKmRLq6oGk4XaQHAipSwFXkuGgjN2Ch5BH2E6MT9yr0+ftiClKnSZq8DOWhA70+EjNaoBa2goTCxsQMN9/3H1Qluf9IvI06QTDTgesFW9hBk7opQsMmCwIPpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=nDWYWXDd; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b2f40f6f7aso25871561cf.0
        for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 11:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756493830; x=1757098630; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PFC2NL6AC+2llQ+r3CsLm00vCsvAfiKwPzcatpgZERg=;
        b=nDWYWXDdtLnQB07dUReqwuSSsJFZ8z3rDqZM6FjbJz//Sq6l9VhdfZzAut5buVBLfp
         PUZKUE3hLB5tYah6buZlrV7bTSbt/NxADJCTzR1sQBx+sMYQEGMsxRFVSt05mcEZpQrs
         dOkVpJw58fMRJHyrUrblqbe+ne505x0/1qu7RbD0NiDQ4ACE2cCUcCJO/TOGY3vEB2TQ
         +VpIYqbQ+h0EhpkQvrpdsQ67TbNXrA2PeivL9suush6EQDXh+fWxBzz66CIkGJNGLbi6
         YJmNAAawnJlIctwq9zCmLxQCbYtsy8aYqWCeLA5jBlcWF3u9W+Z3KfxmHZbkB2YF9JLx
         Do8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756493830; x=1757098630;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFC2NL6AC+2llQ+r3CsLm00vCsvAfiKwPzcatpgZERg=;
        b=MlpjkVoZz6K4gvPFWVAXTwSHDTcmLRt4H6QwqYos60TFplcz9Xx0GmukPQ7KEawovm
         vIson8elbD3lvyeLGhtDyOk2mE72/ZVp/zgOvmbblO+whTF9m+nj7IRPeyYGKTR/Wd17
         aATz+P9u1heejWIyS3ghw8cAdHHI4v8h9PGp3OqRsnHsSboTy24gDvHHC1NbLQmNk4rE
         Y8SKllZplptgX6qJXqKIwqPHD8784q0JHEtokmXQILkTTssDcn4Hox/9e+ka1ZN+Owr/
         CCvrNXPlbbn6JihLI0dITXmJoNLQZ9FBcGFTHVwp1qxKbgal+zz0/dcwtnKe8R89ZqaR
         OPgw==
X-Forwarded-Encrypted: i=1; AJvYcCVITNMKGIGR4qX84KSc0mbZHcd2kFTkeFm3B02uVvyw4NQTC5igJAIQRqtXi3cMaJM5vcVb4P7Spn/lxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxghf7Cabzr+bARFQg0dzQqzkYVhQax2bE3dMbG7f9t9O5/cQoD
	HvYL1cMuGEoM96ywewCvgfFn99RA201JX6ti+6LHYke2ughLDBLLHB9deKuCKHdSA9w=
X-Gm-Gg: ASbGncspC3WGIFPYTVvagEt6UrS9YFl3AIxuMNoEV9jbURacpNpm6+ZcdeF7LJQmOpt
	JjvJTuVMIVewplaqSAg23wAlLkCXhOgVT+Bb9ccy/hl9gVQ9lPAB1DlHEI+89QAz5cpjzWv7Om1
	0lBbBW2B6aDAVRFV03DCUTGmJZDQp+qyz/d7HSX2fQaIXWTf6pIsEASJcIjcIHiDETXqtndA1qG
	T3tnASn0L8spR6DZk/lDTFt4MwZGNddkFPQ/yN3hadqg3rD5neD3YeCBVc3x9gntlIAZEXCoYPQ
	/xsByvIcMm0xHOEdGB41iC0pyEXivW5H4/Vzva4Tt+uDymPjus2M2FAHwTpigBsBPFOk92iA9X4
	I4jS7Yd5/8wyFtsJkRoSaSbPAY68z2Z9/vgKAjQ==
X-Google-Smtp-Source: AGHT+IEakG3NbMasM6aByEap0RqPpWldsk82o+ZXf4RsU/WtslwCKO+NvxDoyc6q/jsSGSs3V1VMHw==
X-Received: by 2002:a05:622a:1392:b0:4b3:8ee:5220 with SMTP id d75a77b69052e-4b31b9bdf58mr2380151cf.29.1756493829825;
        Fri, 29 Aug 2025 11:57:09 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e624cef74sm20958356d6.46.2025.08.29.11.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 11:57:09 -0700 (PDT)
Message-ID: <44aa36a8aaa7da22a4552b910ceb966b3a911691.camel@ndufresne.ca>
Subject: Re: media: mediatek: vcodec: use = { } instead of memset()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Markus Elfring <Markus.Elfring@web.de>, Qianfeng Rong
	 <rongqianfeng@vivo.com>, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew-CT Chen	
 <andrew-ct.chen@mediatek.com>, Andrzej Pietrasiewicz
 <andrzejtp2010@gmail.com>,  Angelo Gioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei
 Dong	 <yunfei.dong@mediatek.com>
Date: Fri, 29 Aug 2025 14:57:07 -0400
In-Reply-To: <887bfbac-0e16-491b-ab0b-a0997890ff2d@web.de>
References: <20250803135514.118892-1-rongqianfeng@vivo.com>
	 <9f0b868c-47f9-4c98-ac99-86bfbc6a432d@web.de>
	 <e3903e95-3659-4d68-86ef-0f3d6b2c8d90@vivo.com>
	 <887bfbac-0e16-491b-ab0b-a0997890ff2d@web.de>
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
	protocol="application/pgp-signature"; boundary="=-x2bNKOcY/JOmIuS4+i3d"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-x2bNKOcY/JOmIuS4+i3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 05 ao=C3=BBt 2025 =C3=A0 15:32 +0200, Markus Elfring a =C3=A9crit=
=C2=A0:
> > > =E2=80=A6
> > > > This patch converts =E2=80=A6
> > > See also once more:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/process/submitting-patches.rst?h=3Dv6.16#n94
> > I don't think your point is a problem here. =E2=80=A6
>=20
> Will any contributors care more for the usage of imperative mood
> also according to improved change descriptions?

Markus, its the way you review that does not work. I'm far from perfect, so=
 I
don't normally give any lesson, but I've seen this this exact interaction t=
oo
often. Try suggesting a rephrase instead.

Qianfeng Rong, the suggestion is that:

   This patch converts memset() to =3D { }, thereby:
  =20
Can be rephrased:

   Converts memset() to =3D { }, thereby:

Also, some maintainers may prefer if you swap the two paraphs, so you get t=
o the
point first, and give context in the remaining. Processing tones of patches=
 is
improved if you don't have to read the entire message to understand what th=
e
patch is doing at high level.

regards,
Nicolas

--=-x2bNKOcY/JOmIuS4+i3d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLH4BAAKCRDZQZRRKWBy
9IVHAP9J86Ojzz3i7bMsDJIB6kLBlO2gUdhSv1G3ByosVTrY6AD/VI6IENrCxFJa
n/fABRYAp3ytH2Ai4BiJS1KJLHLVLAw=
=ECGR
-----END PGP SIGNATURE-----

--=-x2bNKOcY/JOmIuS4+i3d--


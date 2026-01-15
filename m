Return-Path: <linux-media+bounces-50795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C44CD24D22
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 14:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06B8830361FB
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 13:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8F621C17D;
	Thu, 15 Jan 2026 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="g6mmNhCj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE0932B9B4
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 13:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485088; cv=none; b=UKZ1SxVwHESNAtt6i/hxcHYi/hRTv2HOufcFQvmQfX0pCpDcCzPLM0/mErTvbq+M7rHxIAbjiyIEHOjGJLyuqrz6BlwXIeuzlgt07QHTX010tgOqEOBUKRHYyvKrVJKi++iDLae+l5SXpDuplW6M/oUzXnJHOtGaOdwsxvHnTSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485088; c=relaxed/simple;
	bh=vDR+DX+ICj5VJSbWgztBSkQDT5kITuGwruv9WcWoYe8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c5uJdfCk13C8AnxQM80T4X+8MkuuYCW7wwEZONtZTBEsoM2bnA6ZVejxTCL6NBa0BmhOVXDzsLVHlcV0SfDZDANbxUkVvVLITGoBFO3xkWkPCWUWUjkX/0N2leaOVED5SsZEooDbYD/hGYW0bEjucaeLHPWjkiM4R8PGbvp2fmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=g6mmNhCj; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88a32bf0248so6796356d6.0
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 05:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1768485086; x=1769089886; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vDR+DX+ICj5VJSbWgztBSkQDT5kITuGwruv9WcWoYe8=;
        b=g6mmNhCjtZiOgb6OwwvO1sytwE6ZCmUnUKW02VSlvwlRyWPimzdFwS1rDUd38Vnoyi
         0uC9w8ZTRDEetIXeD5ZGjDNyhqktrY5YK/1vcoksHBtu/ML+ZgA9UClhkKeMcc+bxH88
         8y1DCOEl/QBZwjbSKKWAYTuzSUZZI21Z5BRiTFKdThrAUajEZ7SxXGsMzdScb3iyzDa2
         PIOj0UiNZLGpDLnqTyqSStXNYkvr294Z2mHmF7N+F4Gjvw2y1FYE1DFfmrqaBNtL4kZf
         vtaFXvHcDHvCaYxkvKNtHzlMP8W9xD4NcC2eoTkkxaLIr5LjdMApxpNiyeJbEDDn8SJW
         cVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768485086; x=1769089886;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDR+DX+ICj5VJSbWgztBSkQDT5kITuGwruv9WcWoYe8=;
        b=ogw1bHXfzHmnoc2Gy9A5Aaq8A22FWDKdJfgQtNnGs1mWMwRE97TPiiPKik1yN0qxhP
         xQLHtx7xjSef0mtIKx3hlUVBiG474pgn3nmO6QpatIZRyrJGyQjfM/RGu6omD37tV2AA
         tkUfmNpqT+LDa/LV7gZeCbbaWm/3eQGOmPOdY3nhg6bVtVg5r3iUvdJP689OIImVw/LT
         SwpvpqHB2rBGCaLua/oXoa3nONcuGivnJfepmCpWTMyTATikdim+sHrSNs/pxTAbPyUS
         tGD37FJhkiBQG+6DB8E7fJ+sMgfNAT1Xblj1iPKhcX7zDtMNs6jOePg+l1JfP2JkWDBT
         B3Sw==
X-Gm-Message-State: AOJu0YzOb0YvyXYBEeKWeAC0F+3C2l2ravDkcF6FDcDQN61uOcZmZk7u
	OcV5U/Qg4Yt11ZLi0Iqj/Gjo25x3qHTvNbQ8d1T2T8turHryOvrnZQQmLFC2awaiAbw=
X-Gm-Gg: AY/fxX5dR+RPc6mBmhZ+zURHV6TD1rKkhQktShy/vdYNgzQT0HaS2tckdjBwf24BY+T
	l2yddgaFJCbciEyTISfNjgJhoa2oTHd+0IQL7IYjKujR+QyNRYuxALqTR8biJSVuyplrQKa+xzk
	rCKEeQgwEzMpyFjDWL8kVFha5vpwjZQWs9CGPeuC0iuvquzzAJuhPcZZDrgrnltrLcNIkKiK6gh
	kH1QvDJ/dpK9M6y2rvzBU8X2V8tAvpFsBuAOZ5M6x4h73w5yumNyORRgh1ksBuqyN8uWNczGcoG
	HljSOMg+T5hKRQGBpCwLP3yOb4NGW4pvCXEq4lz2X6Vrt89Q6SYD8Cy4Y/rbRsVcwZxhTksEUXZ
	LUezxhOrE4HvRx//XjoD9Ta97IcEuy0vfZArLMWT4GMGDpX2e/pV6zPMUKSzt0fgbAzWLPiVKVP
	CIHK12L54lnYMoawH24APH0piaRKk=
X-Received: by 2002:a05:6214:19c9:b0:880:5edf:d135 with SMTP id 6a1803df08f44-892743ecb4bmr90791336d6.53.1768485085820;
        Thu, 15 Jan 2026 05:51:25 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e2aa5sm203968666d6.19.2026.01.15.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 05:51:25 -0800 (PST)
Message-ID: <d06dfe735a246cf23d670f87d95deec7bf5265a0.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 1/3] media: uapi: Introduce new control for video
 encoder ROI
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Thu, 15 Jan 2026 08:51:23 -0500
In-Reply-To: <763b6cdd-514c-4aff-b7db-8c0a17fdb645@oss.qualcomm.com>
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
	 <20260113-iris_enc_roi-v1-1-6c86eba38587@oss.qualcomm.com>
	 <08ff44d8907c72b7599fa4599477d78bcecb440a.camel@ndufresne.ca>
	 <763b6cdd-514c-4aff-b7db-8c0a17fdb645@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="=-4EfGdaMvYDV/uoQuviha"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-4EfGdaMvYDV/uoQuviha
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 14 janvier 2026 =C3=A0 16:20 -0800, Deepa Guthyappa Madivalara =
a =C3=A9crit=C2=A0:
> > > +``V4L2_CID_MPEG_VIDEO_ENC_ROI (struct)``
> > > +=C2=A0=C2=A0=C2=A0 Defines the control id to configure specific delt=
a QP for one or more
> > > +=C2=A0=C2=A0=C2=A0 rectangular regions of interest. The struct v4l2_=
ctrl_enc_roi_params
> > > +=C2=A0=C2=A0=C2=A0 is defined to hold up to 10 v4l2_rect regions and=
 their corresponding
> > > +=C2=A0=C2=A0=C2=A0 delta_qp with a range of -31 to 30.
> > > +=C2=A0=C2=A0=C2=A0 Applicable to encoders
> > Any justification for this range ? Also, I believe I've seen hardware s=
upport
> > both delta and absolute values. Since it meant to be generic, some rese=
arch is
> > needed. If we delibaritly ignore absolute, perhaps the CID should be na=
med
> > accordingly ? Something like V4L2_CID_MPEG_VIDEO_ENC__DELTAQP_ROI ?
>=20
> As per Android ROI API - MediaCodec API QP from the app is an offset QP,
> meaning userspace will received offset Qp and it converts it to deltaQp
> before passing onto the driver in Android HAL. I have used the same idea.
> Delta MbQP =3D frame QP + Offset Qp. This is clamped to -31 to 30 current=
ly
> and set to driver as delta QP, hence I have it as -31 to 30.
>=20
> Absolute values are mostly for frame QP, I would say. All the=20
> information out there for ROI
> kind of implies to deltaQP, but we could be more precise as well.
> Let me know if it is a must to change to CID.

That's exactly what I want to avoid, hardcoding Android HAL into V4L2 witho=
ut
having our own rational and documentation. Also, Android HAL is a much olde=
r API
then D3D and Vulkan, and its not as well defined.The second is hardcoding r=
ange
for one specific implementation. Since this is codec agnostic, and hardware
agnostic control, I would prefer is defined in a way that it requires no sc=
aling
by the driver. IIRC, some codec have QP values from 0 to 63, so why don't w=
e
allo from -63 to 63 ? The alternative is to let the driver expose its range=
, but
its a little tricky, you will have to specify when this information is avai=
lable
in the Stateful Video Encoder spec.

As for the rest, you haven't considered extensibility in your proposal, wha=
t if
a non Qualcomm hardware do have features like aboslute QP ? (Hantro/VSI doe=
s
btw). How do we add that in a clean way ?

Nicolas

--=-4EfGdaMvYDV/uoQuviha
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaWjw2wAKCRDZQZRRKWBy
9D1SAP92tas3kEN9sDLF5yOfgNqtSCxbbQfo0nV1bDsItRBDGAD/cYxdAq6tgbL8
UU2md8W1C/BDvJH5koiRccSeGHuK9wQ=
=4KtW
-----END PGP SIGNATURE-----

--=-4EfGdaMvYDV/uoQuviha--


Return-Path: <linux-media+bounces-41726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7418B427AD
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 19:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 711111B25007
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 17:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C12D31CA61;
	Wed,  3 Sep 2025 17:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="YUoqvl5F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5256830DED9
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756919586; cv=none; b=XkwtuUuhQT/OVUk+OvGhwNmFKJP5Iw+Mz8ly8HjdJpED9dzPvK01o1nELQDEoxoGjIlWC/cdAyjmLsO5Ap/8EF7FtNqTfBldLDWXpVJ8ygEb6KH3ldFJrgHzywPJklKbFY4NYIGeLD/H9pVehtQM/CqV+WrwnrTbebu0ahnOTf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756919586; c=relaxed/simple;
	bh=AdxDf5zeXQhsksmaMXC9EJWtWbesa8BK9ehvgf0lftg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mmZNUgDhlS+K+Bxtec4kJ+zZa23qqY+bW2nP1rSJAfLl1KQG5NE4npad/x8AvF26H5MCtCRnk/wFDrctiLWo3NCVnYPJfqigKk2hLCMGXW339tc5rn0oJmloR2wwekLPLHY25YjVT2ub1rmWsWeBdp7E8kIT5tPpLi5y9LGYxJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=YUoqvl5F; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-80e2c527010so2533085a.1
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756919583; x=1757524383; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AdxDf5zeXQhsksmaMXC9EJWtWbesa8BK9ehvgf0lftg=;
        b=YUoqvl5FGeSWyq8Y5EKxVo9VUf/h27BPJGt6vBD9lQOCd8q5uJB+/aOwNZYcsjdKIW
         XOHNlE285r2tWBl/QznH9JEQ5SOU6d2aIviwidBWTxalCvbpG5TgLSlm+SzD64XjO6os
         B00SjsHFezYfcqNzabkhN1YSb0r3bAmUzt6iimSYd0dDnaQwub7xC2L3R8s1BnMEG8yT
         1MhIi5s0aUkGJNlzY/CspFGfHnkVI4gqEF7dwqpJyt0VX0gNZW1L1U/r+4UCqUvWyb4W
         cnOyg+0xYUjAZxqwICDrZhY4eDSkDEoonH3AmcuVZezTaVqOsTEghfY5HFCPAHvubIds
         8Ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756919583; x=1757524383;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdxDf5zeXQhsksmaMXC9EJWtWbesa8BK9ehvgf0lftg=;
        b=LgbjTebanyCsvSL19+q+4D0FoxYyr10XWCloJp9a29HzqauaSs7Mu/vFeK5AlQi7es
         v25SC/OvaoOy3Ig0r7Fv/QyfSx+E+eX+xYP6o9h3X3QZ8zEGkEwr2ts9/xHVQoqBYQTG
         AW8df9+r6fSJUJ25JRUnd4d34WTdi5RAOKNlTtvnF9raZmwmiugnSK01UK7jdlw1tJWB
         Ej02GYK4mQhfm1G+InctSfrrY2A/EUXSvMqww/ImeF3Ar/YiD9H31msp0+4ynveuvtkO
         kHZuL/XWXX4nqx+3x6QuhV0/E5jYXeB8jxeiulzf96D5GBqsyEQVHgz0R8Fp+uVZJOsX
         q3fw==
X-Forwarded-Encrypted: i=1; AJvYcCXuF/BkMExd3EHhvpsvzJPvGHtouIOCvrY/URbFqh8e/sn3kRE6R0x/W9BKqXnK+D+xRhAA7/nkNarxVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzURBiEpriEC2+DVyJti3AxblYnXZw/4FF6uGk82bn+MI4Q5uKj
	j8cUio/AdYIGKFoFkDD/lV9LzA3N5AqyfSJdx+/XwufluOxyHvgvjMlI1yPadeo1NG8=
X-Gm-Gg: ASbGnctrNxXgNFv4vg8uu5XVQL4r1hXksSh6YvHOX5TNGKP/9FCihUAVi1/kWm60JVX
	wMtNZu+LRdBPq3JHu1cn7S08lfyLiTPI8yc+nHa4g5ym8Uy6Y1M0SjIE46E12JBMeTTrKq1XCG7
	mj2/3KWJSrbB+nAQkB//+we+o4ggiVUzXzcBLksyRjqIDrZvlo5QlcqwY21WNMwYFrhiPazmrTu
	nx8st/nwd4kr8BwZvWiE0uPLIc8g7RFK+J2rLj9RosHpM3dq9yVZ3+zvvPd3oM+7rWY5DsorUNX
	tUYyAjl+rwIXGDFQrWv8Nw9l4nB63Y0bIxeC75wqpgMBBlFIebhB9g4EMuzGGTPCa8lEtO1wTWm
	LRLTw5Mb59D260qmo1xfBPEmVixpZbF98bmSyOw==
X-Google-Smtp-Source: AGHT+IE2gk2cAMApAiK5YzQI79QMXJKlXiHeFQVTEq67x8yVV85XXX2+3+BrCnQSOq7OZa/8/eFoDw==
X-Received: by 2002:a05:620a:6919:b0:7e8:902c:7f90 with SMTP id af79cd13be357-7ff26f9fdc9mr1708337085a.15.1756919582911;
        Wed, 03 Sep 2025 10:13:02 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aac237b51sm135862385a.61.2025.09.03.10.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 10:13:02 -0700 (PDT)
Message-ID: <699dae8715b77f20f075452ecbaf03c2e0876186.camel@ndufresne.ca>
Subject: Re: [PATCH] media: s5p-mfc: Always pass NULL to
 s5p_mfc_cmd_host2risc_v6()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda
	 <andrzej.hajda@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Date: Wed, 03 Sep 2025 13:13:00 -0400
In-Reply-To: <20250730005212.GB2984390@ax162>
References: 
	<20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
	 <9650d2e240a9170175069e3a4f6d6d9512d62aa3.camel@ndufresne.ca>
	 <20250730005212.GB2984390@ax162>
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
	protocol="application/pgp-signature"; boundary="=-pzsAHyLPvNQykWC7D2G9"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-pzsAHyLPvNQykWC7D2G9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 29 juillet 2025 =C3=A0 17:52 -0700, Nathan Chancellor a =C3=A9crit=
=C2=A0:
> Hi Nicolas,
>=20
> On Tue, Jul 29, 2025 at 10:24:22AM -0400, Nicolas Dufresne wrote:
> > Le mardi 15 juillet 2025 =C3=A0 15:13 -0700, Nathan Chancellor a =C3=A9=
crit=C2=A0:
> > > From what I can tell, it seems like ->cmd_host2risc() is only ever
> > > called from v6 code, which always passes NULL? It seems like it shoul=
d
> > > be possible to just drop .cmd_host2risc on the v5 side, then update
> > > .cmd_host2risc to only take two parameters? If so, I can send a follo=
w
> > > up as a clean up, so that this can go back relatively conflict free.
> >=20
> > It seems so yes. For this specific patch, I would probably rename "args=
" to
> > "__unused" to make the reading faster. But does not matter so much if y=
ou
> > later
> > remove it.
>=20
> Yes, after this change is picked up in a maintainer's tree, I do plan to
> send a patch to remove the "args" parameter altogether. If you really
> care, I can certainly rename the parameter in this change to "__unused"
> as suggested but if you don't, I will just leave it as is to make
> backporting this a little easier.
>=20
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> Thanks a lot for taking a look!

While applying your patch, I realized the Hans merged another version of th=
is
fix, but made by Arnd. It covers the remaining too, so I will mark yours as
superseded now.

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/7fa37b=
a25a1dfc084e24ea9acc14bf1fad8af14c

thanks for your work,
Nicolas

>=20
> Cheers,
> Nathan

--=-pzsAHyLPvNQykWC7D2G9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLh3HAAKCRDZQZRRKWBy
9En1AQD1tAsHKQWAylP0KeFD1yHx0HsU6uwqceGeGAr1Nc5pkwEAgs/En9h0xvlo
EVQVqh/acb6D4sGssLO0+X1Rreu8sAM=
=sQoA
-----END PGP SIGNATURE-----

--=-pzsAHyLPvNQykWC7D2G9--


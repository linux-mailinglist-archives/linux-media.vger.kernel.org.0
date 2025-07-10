Return-Path: <linux-media+bounces-37331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6091EB00664
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 401C03B5765
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BAC275859;
	Thu, 10 Jul 2025 15:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ejoiv/xF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AD82749CD
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160868; cv=none; b=iRa0sUY9nTT57bTdZUgHdQzYOgxWgyAkZVu0uF5oMAIvWORFt2H0g58yEz7wpQgaM9t1Q8Jr9rqqJ+nqeWQbXx3k7DhwWWOPWUFkJJ1uJalw/OGlYpTZD5AMaycEALfxSfyTRWVCcUZ/78ZxVHQ9NH50Jj3yY3WZM/hFxgmBKd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160868; c=relaxed/simple;
	bh=xKpf3SbAmWkt5VJofJn48qdY/118qeqD5HjzAhisH5k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qSCCdimPphjH+0fVbAzH/01pvzEJUU8VMx1FMj7YsNj94lDvNykGMvqQdghfuGKxhbVkbEp2Ewcnw/pXEg1Mh2QYgkAWsbmtR8AkoLQ3b5tjWABtuu2xBUhagR0jRpIEXoAxDeQcS3NJR8Ee8ubEiWuGhvf986zI324+SrrMVrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ejoiv/xF; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-6fafb6899c2so11121946d6.0
        for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752160865; x=1752765665; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xKpf3SbAmWkt5VJofJn48qdY/118qeqD5HjzAhisH5k=;
        b=ejoiv/xF4795KY/I32aTsxdkxFhqS7S7mZG8Ihq2GAvpIiDNRStRgoH0q8orS46r5c
         TLnj7YardrNIZVZfR+TJKDZ+ucYCHZRy4da1uQcYSRgWF0Xiu/+DEUvo51LibBtRT+BB
         pTUDhfTIy933xRwH7vnZXmUvY1uf972w3GRFJVGllZ3U8ksJl677GoOPJ4DvcaLUL56m
         pPJpDb7uxcK4EFJ6R3UMuSMhqp1vo6IBxKYxA9M5mkI+2/7/pMxMmvEvJyE3WD81JlEQ
         thFL236GNPeF3DAjzJ92+CQVkkRmMrQqyS/Nb19Fk3GupTIT9QkhEIgXVk0B4+YmQWw9
         ZlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160865; x=1752765665;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKpf3SbAmWkt5VJofJn48qdY/118qeqD5HjzAhisH5k=;
        b=EXWzRHve/twV0xoCcMQPRXY8A1cQWaSh/Ls8IH80oKshlmq2Ymwg6R2OnorDuJETOb
         u8vsFpJtcsFt9xVFvtl9TcYkkbm6RIfwXrh/++T0sHPkVrKv4i0yGEhXDjgk7GyJ/5KL
         3H3EyIcOvvYdjUVbBj80CVLWffr82oumrCe9epy71Hcdv6w3rfqq1NQ+756XGI2TFNMZ
         DkcIp3tH4EIjM6HGHuJY3hBjPkWr3bZuPwEloyqAwBX8RGTAI/YtpnAmjcOSqeTvLayC
         mHZro83kl65giOuTqH674xzDcRwojkDTam2RxiF5tiDePzry+Vuf+ClxkAkgqVcwriZq
         VTBg==
X-Forwarded-Encrypted: i=1; AJvYcCX23oNw+j8MnU5z9xStCItHfqtBzA++5YhdfdaqZsDZHoDSY02DaoLAiNxu/a0LXD3d7ZzrxmqByMgX3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaHFRgUcL35uJ0sQTLctFbiuEFt52LYW4c7wcHsKDHMrufKWwy
	cjlA0uRWk+mjpKPFBsa9VO31qjTmAnFs7ZpGj+s7xqyHXYSAdRRxPA5FqW801cCz/hs=
X-Gm-Gg: ASbGncumN1hukv6CFc+I6j85H67Tn0KUorPZecnr6rNAH2A9TpsSfuXo1286gTzbdjr
	XHEyD0/fLMt+NBFgBQpkfYDH/GabI8iAFSeivNKQ1dPb0PhKB8mJg572t55z8MXTXoAcv2jjzEJ
	rjw7OifJIFoJ1ru/ZloX7V4wtDAuU2+VWz7+VJrN2Zw2O+iS8kghsZcIJ/6b7axBh4nBjwFH7w9
	lnvwVnY+8ZHDQ9s7s8eNpkUj0s8/VH5jin/xQWr6PTTNCkIIVhXhTaZ0dtL+y1s+7wk6eVTPjcb
	A65XZTePBQHfIm+S/YpBFasw2TwTG1WK8Q+NogPzm7T4Ewx9TYS03Yi/LO210zUqgDM=
X-Google-Smtp-Source: AGHT+IH0uA7EbnPkACvyJEVJCpbYJKsf0sky4Js9sJlbaC40zioZfAIyIXsCJGWIghdll3hzxEsL/w==
X-Received: by 2002:a05:6214:4e14:b0:6fa:a5c9:2ee7 with SMTP id 6a1803df08f44-70495a1fe12mr51088666d6.8.1752160864846;
        Thu, 10 Jul 2025 08:21:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7049799e407sm9536186d6.23.2025.07.10.08.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:04 -0700 (PDT)
Message-ID: <78c981eb7fafe864bea60c662ba5b474fbd44669.camel@ndufresne.ca>
Subject: Re: [PATCH v6 0/2] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey	 <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier"	 <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Robin Murphy	
 <robin.murphy@arm.com>, Andrew Davis <afd@ti.com>, Jared Kangas	
 <jkangas@redhat.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Date: Thu, 10 Jul 2025 11:21:02 -0400
In-Reply-To: <20250709-spotted-ancient-oriole-c8bcd1@houat>
References: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
	 <49e3fa834aadb37452112bb704a1a1593c1fd0b8.camel@ndufresne.ca>
	 <20250709-spotted-ancient-oriole-c8bcd1@houat>
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
	protocol="application/pgp-signature"; boundary="=-0srW01EuwsYGDYpmIBS/"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-0srW01EuwsYGDYpmIBS/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 09 juillet 2025 =C3=A0 15:38 +0200, Maxime Ripard a =C3=A9crit=
=C2=A0:
> > Will there be a generic way to find out which driver/device this carveo=
ut
> > belongs to ? In V4L2, only complex cameras have userspace drivers,
> > everything
> > else is generic code.
>=20
> I believe it's a separate discussion, but the current stance is that the
> heap name is enough to identify in a platform-specific way where you
> allocate from. I've worked on documenting what a good name is so
> userspace can pick it up more easily here:
>=20
> https://lore.kernel.org/r/20250616-dma-buf-heap-names-doc-v2-1-8ae43174cd=
bf@kernel.org
>=20
> But it's not really what you expected

=46rom a dma-heap API, the naming rules seems necessary, but suggesting gener=
ic
code to use "grep" style of search to match a heap is extremely fragile. Th=
e
documentation you propose is (intentionally?) vague. For me, the naming is =
more
like giving proper names to your function calls do devs can make sense out =
of
it.

Stepping back a little, we already opened the door for in-driver use of hea=
ps.
So perhaps the way forward is to have V4L2 drivers utilize heaps from insid=
e the
kernel. Once driver are fully ported, additional APIs could be added so tha=
t
userspace can read which heap(s) is going to be used for the active
configuration, and which other heaps are known usable (enumerate them). The=
re is
no need to add properties in that context, since these will derives from th=
e
driver configuration you picked. If you told you driver you doing secure me=
mory
playback, the driver will filter-out what can't be used.

Examples out there often express simplified view of the problem. Your ECC v=
ideo
playback case is a good one. Let's say you have performance issue in both
decoder and display due to ECC. You may think that you just allocate from a=
 non-
ECC heap, import these into the decoder, and once filled, import these into=
 the
display driver and you won.

But in reality, your display buffer might not be the reference buffers, and=
 most
of the memory bandwidth in a modern decoder goes into reading reference fra=
mes
and the attached metadata (the later which may or may not be in the same
allocation block).

Even once the reference frames get exposed to userspace (which is a long te=
rm
goal), there will still be couple of buffers that just simply don't fit and=
 must
be kept hidden inside the driver.

My general conclusion is that once these heap exists, and that we guarantee
platform specific unique names, we should probably build on top. Both users=
pace
and driver become consumers of the heap. And for the case where the platfor=
m-
specific knowledge lives inside the kernel, then heaps are selected by the
kernel. Also, very little per-driver duplication will be needed, since 90% =
of
the V4L2 driver share the allocator implementation.

Does that makes any sense to anyone ?

Nicolas


--=-0srW01EuwsYGDYpmIBS/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaG/aXgAKCRDZQZRRKWBy
9DlHAP9fTMIloahiN5XMBZnBB4aGkZUXdygAalNGlj6RFJZc3AD/RAhlPPmyBaVt
ZDKBRjZVW40OnGDxhAYZePpjsIkSPw4=
=uaX4
-----END PGP SIGNATURE-----

--=-0srW01EuwsYGDYpmIBS/--


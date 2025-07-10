Return-Path: <linux-media+bounces-37333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7F8B007F8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 18:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E506643C4F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 16:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226D920D51A;
	Thu, 10 Jul 2025 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="zN6rUgEI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B422EF2A5
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163274; cv=none; b=pRdGiVxMpKjJbmcC3QXVqZyMtO149VK1gOTvVJsN0+8w2p9Y2XTjyqw/Ogwcudd89QQM4TmpAOJHL6YphURDcatxMMH/sT8W2FBVKG4Cz7oEbypVUP78S81LscE4+QXTVsFjBKisAJDW5ofWyefqzaBlZ5NVxZwhT4IdWaLzH6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163274; c=relaxed/simple;
	bh=Yla3vwbjPx7zCNlMAs2BigvE7j7ziHcSYEcAkfhAQT8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T+QaXdtMzAOICMq7WFUshLT6jejK4FkhPA+CHT6nXgB6bKipWYE+QuP747ONtzhKgY+eIlglFD3g1odR63WUPLIkoz4P/Z14pCKT8RUR/jH0DakVzXUwENXscYByGF0yageMHF0uQ64GWVmF3kAEuVr4RPEyEipMXQ6owkJsT/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=zN6rUgEI; arc=none smtp.client-ip=209.85.160.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-4a44b3526e6so15929461cf.0
        for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 09:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752163272; x=1752768072; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h2JvzJqEFY8FcNSNGs4AC4X799LbBQx2h7PFI9T2cfQ=;
        b=zN6rUgEImTitTNkoQe4vqOu5RL8ve5vQnNHL4OXk00/jOT2rYtEZPstfmKm+4AwUWB
         RVozOzkKCYRmmP7vPvT3tp0OwkVOblF1SYp7chtEKcfZcKhlmfr8xFKBU7NqzRWUHazB
         BvujR0c1WXa7HsjeHAjyv509UGFhEamq0xvPtf0wzvvlOqhlh73eBenBrwaWohyaLtp0
         XhxTdYOoXCrxZFGf5l9vpiOYpLMLth4eXRVctf8hFmPQ+qX9pCULte930+Muc102q3gH
         Hz4KHbY95TTn0yXYKAaPycRZIMjZJLfJrU2faCgPVxCRRYPdbagfYydiMLFiYFqxVNK3
         BjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163272; x=1752768072;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2JvzJqEFY8FcNSNGs4AC4X799LbBQx2h7PFI9T2cfQ=;
        b=Z8vWyUU+765/FLht5OP3GMkuBXb3x4uB9g75NRn+B/AHtpbvmZGzsuRoPuqMnRuQSN
         OcJA8nsqsao5QUqLX9AJYr1mFgYtJi0sR3EtRHzs1qUOa6SqaCI9+kkSBDb6oIUUW1on
         BvYjR+M9y1w3oIy56YE0tXHQEv/0Y+x3KIUpOBnnJciTnxRbsZ9jL6JCATuiZ/jCKrv1
         RVu/uQ6EFR5bEFyeJ8IrF2wzyS3L8xiwZAvPm2020zRVudIHap4XPpKNBtITit0wnI+g
         UI6CfWJHxObACT4EbBwRxMkRGrsTH9W83wU4CFDWiB8RtkKsSRv9kISnh1ZztSo1DJgn
         rYQg==
X-Forwarded-Encrypted: i=1; AJvYcCUDMA4nFjcRHAOCWZFzF52LuVwCS34fnUNbLYXkRAb48mu2odN/4Q2jroTX0h9N2pfW64FYG5vybc875g==@vger.kernel.org
X-Gm-Message-State: AOJu0YycAbFUF+Vmm8hAHkFa/4dH8A4IVa2fb9k/tHqR9hy2mQMBHchV
	EIgi7Qosjv7mIIJuQYYDnNzSHgKvyG9EgGzVxOhdFTYn445VwC00OxQn7Q9ahbYoA/yVy30c2gl
	T4ftS+t5RrHq0
X-Gm-Gg: ASbGncs5z/MHba1Bu3Q4FIVAAkFzbxzLoVNDHt8eFUUFBwm+EycLb4PAzeod1hsvl8c
	SswoX2nmVj9WThDPsnFP71EFFmMSSZlOBMbx2r/OSpBV0hFf6sdN17SHDXKCjnNSucC5Y7KGpoo
	GoXNvQrJxZHQLsivEv46S0WbpdpJVeZURhcIcfBw+9niNbu1h1O2k8Yiv5Y2Y8UEHSanfqjsPNH
	NOE7P/m3XfG0YUyAA5p77yRNfax7mBrYKtOeAjv6ZHB32TxejQDYUBdRtcZJy80CBvu5g//VrCc
	JA4aiyQLFrsbzMfB6zVzKOl4whT/3SFUyx+q+KhX6PXjTDxFMCTQaRPiid5McqGqGhg=
X-Google-Smtp-Source: AGHT+IFbQFapyLU2kvG8JwQQkxoFge/HX+KIphHVjcEQzpniLu173HdtuK79yftQGxLEwpJMC++ZBw==
X-Received: by 2002:a05:622a:8cc:b0:4a4:30a0:39c0 with SMTP id d75a77b69052e-4a9f80b0c22mr23008391cf.28.1752163271437;
        Thu, 10 Jul 2025 09:01:11 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edefb55asm10028431cf.77.2025.07.10.09.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:01:09 -0700 (PDT)
Message-ID: <775b0f527f365fa4217a5d9acfbb80e4f87078ef.camel@ndufresne.ca>
Subject: Re: DMA-BUFs always uncached on arm64, causing poor camera
 performance on Librem 5
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Pavel Machek <pavel@ucw.cz>, kraxel@redhat.com,
 vivek.kasireddy@intel.com, 	dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, 	benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, 	tjmercier@google.com,
 linux-media@vger.kernel.org, 	linaro-mm-sig@lists.linaro.org, kernel list
 <linux-kernel@vger.kernel.org>, 	laurent.pinchart@ideasonboard.com,
 l.stach@pengutronix.de, 	linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, 	etnaviv@lists.freedesktop.org,
 phone-devel@vger.kernel.org
Date: Thu, 10 Jul 2025 12:01:07 -0400
In-Reply-To: <aG94uNDrL1MdHJPM@duo.ucw.cz>
References: <aG94uNDrL1MdHJPM@duo.ucw.cz>
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
	protocol="application/pgp-signature"; boundary="=-Nzv40WcQzqiJQr2kcTPI"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Nzv40WcQzqiJQr2kcTPI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pavel,

Le jeudi 10 juillet 2025 =C3=A0 10:24 +0200, Pavel Machek a =C3=A9crit=C2=
=A0:
> Hi!
>=20
> It seems that DMA-BUFs are always uncached on arm64... which is a
> problem.
>=20
> I'm trying to get useful camera support on Librem 5, and that includes
> recording vidos (and taking photos).
>=20
> memcpy() from normal memory is about 2msec/1MB. Unfortunately, for
> DMA-BUFs it is 20msec/1MB, and that basically means I can't easily do
> 760p video recording. Plus, copying full-resolution photo buffer takes
> more than 200msec!
>=20
> There's possibility to do some processing on GPU, and its implemented her=
e:
>=20
> https://gitlab.com/tui/tui/-/tree/master/icam?ref_type=3Dheads
>=20
> but that hits the same problem in the end -- data is in DMA-BUF,
> uncached, and takes way too long to copy out.
>=20
> And that's ... wrong. DMA ended seconds ago, complete cache flush
> would be way cheaper than copying single frame out, and I still have
> to deal with uncached frames.
>=20
> So I have two questions:
>=20
> 1) Is my analysis correct that, no matter how I get frame from v4l and
> process it on GPU, I'll have to copy it from uncached memory in the
> end?
>=20
> 2) Does anyone have patches / ideas / roadmap how to solve that? It
> makes GPU unusable for computing, and camera basically unusable for
> video.

If CPU access is strictly required for your use case, the way forward is to
implement=C2=A0V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINT in the capture driver.=
 Very
little drivers enable that.

Once your driver have that capability, you will be able to set
V4L2_MEMORY_FLAG_NON_COHERENT while doing REQBUFS or CREATE_BUFS ioctl. Tha=
t
gives you allocation with CPU cache working, but you'll get the invalidatio=
n (or
flush) overhead by default. When capture data have not been read by CPU, yo=
u can
always queue it back with the V4L2_BUF_FLAG_NO_CACHE_INVALIDATE. But for yo=
ur
use case, it seems that you want the invalidation to take place, otherwise =
your
software will endup reading old cache data instead of the next frame data.

Please note that the integration in the DMABuf SYNC ioctl was missing for a
while, so make sure you have recent enough kernel or get ready for backport=
s.
The feature itself was commonly used with CPU only access, notably on Chrom=
eOS
using libyuv. No DMABuf was involved initially.

regards,

Nicolas

[0] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-r=
eqbufs.html#v4l2-buf-cap-supports-mmap-cache-hints

>=20
> Best regards,
> 								Pavel

--=-Nzv40WcQzqiJQr2kcTPI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaG/jwwAKCRDZQZRRKWBy
9BRcAP404riqHZv877jAk3LeonpmR8YSE9c6bNWGPspAtHTMNAEAzVw7ScK+PCWl
1/uUbQsGbqWd6r5mH47vDOU14pKwSQM=
=wFFh
-----END PGP SIGNATURE-----

--=-Nzv40WcQzqiJQr2kcTPI--


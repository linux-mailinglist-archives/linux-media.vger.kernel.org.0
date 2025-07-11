Return-Path: <linux-media+bounces-37533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1143B02588
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 22:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92231547436
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 20:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3C11EFFBB;
	Fri, 11 Jul 2025 20:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="s7ElN+sr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50F81DE4FC
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 20:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752264045; cv=none; b=Gy7LS94go1Vj1oqhQXF3XKIMULNm2Cj8O7aGiX6gsl2EuCQhz/stxYPfQliFTBy/DLgDRFjSlrVVc90MWbge02Wwj6/GaOcjx1d27RzneTgjlMv01PAvLRBjQat2WUUKy8gx7BjOH99ZeNCeRhNIHeKwR1RLuMiI1sEox+7YY7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752264045; c=relaxed/simple;
	bh=rZi2rCdl13Itq2FYc/am7oHPt2a+dpwp2iEDHnh9MtI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lxsl6v9T7fMkKiZ2+8wuqVBIwHuU+/yTVOwDP/XhXmPVzfhyQpNKtkm7OyElzMAYW7AJ9Iw82xNIeA6yL0U0l8JSw7PDdgsGQ5A17/RsjpKizDwzBJRvr5WauN2NMZfGrNpzs6okS1XOJFNePcA/7CmoEpRdyeb8CGYqFoYVm4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=s7ElN+sr; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so22668116d6.1
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 13:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752264042; x=1752868842; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rZi2rCdl13Itq2FYc/am7oHPt2a+dpwp2iEDHnh9MtI=;
        b=s7ElN+sreRJNoyiNTLESTLZc1tL6zO1KXaQfWAgTq52i5LLEu9v0p94aZSmK7xeikO
         7gtjemhxzhRo68LIoa4IilSjtaj8OzZKtwPp0pUCcDVaTfTMB1dEB38ftVuoLB14U+Ze
         /KNGd/f4yyA7+Ky0WVouOSODiAM5RbuMIGjywl6Y8C2lK5CItBJz43uQWmRwT8QZIWpC
         /3z3jGsayTocuoFZSz2G5E4Oi534pq/vUS3akQ4mSWnxMji6a17XrtIWsALvd9TIMU5G
         lElNUS8maI1MVpufwH7/3w4Iu+25FIalrmRjB6wuBIYY163E3bxJHIt86h7jbMSM4W56
         lRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752264042; x=1752868842;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZi2rCdl13Itq2FYc/am7oHPt2a+dpwp2iEDHnh9MtI=;
        b=njnCmt6CyxTcsO/OL6+vJTanhdsUOKtoZV6M++23bT6V9wCKS/ynTU0CmEORpvZdWj
         tX1ZAkeVT3c5EyX+RRW7Dpud2VS3gVpwKIXkfOivtHL8DCZ/Tbg2IvO+PeMrOgxKLvVI
         XHIIX7wHVvJ/zPC/X58VK/P/nxjL9p6/7WKCsrNklFnLNcvSWAdXbTL7dX6aaQ6JDW+6
         6PnbO+gtU+C5dUAVsn37LuSuZk8pmMAUZpd11dIzUtw6UfF00xhJLiP77ZHeefV1QLaf
         4E58RgN1UMLcAj/sOMyooSm7uUBLoIfZJ0exelnXVI/j64v7zq7ZQUQANp/sRZCiX+EO
         BZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpaIg9eN5ZhKsH9oRI2UDYDTXJGvFh/5y6phy+kfoxZ/uxg+vFoRjqd6WsnzMJed4iNDrA/efLpfcQDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYorXTv7JAtbrawCTGadliujfO3eC0Gg2DkPFVDRfJNMEG7XgP
	V71I0ekwKgUUu3bHgkYBGI9WKIonBTNto8LzRrDhX3YHK/4CHx2lpji9wKK5o1FIqsA=
X-Gm-Gg: ASbGncsQON+RdH0yug0FRpCl8rn6rVB5jrAT0JlFfM9U8U0zh8ZpfZZTqbxZ/qLhDl8
	j3nZbhCu9aptP1tSpczU6Boicx3atboqseurwGL3fgVf/DQWmBkDlq4qtwTDMxz16vn2eOhjWf4
	CRPWRu9ZWHA08mJwi1nsAR0JEWbPWbH401+96OVcLk7BRnwPZOsfuHnH7S4c4JzyDdTQ1tHsiHb
	ySxgGlciWy50kFMz7gP/Nz8cGkpOCJz7v9a8/8ck7LUN79+vZF9UlpohKJ5sslx0cfvxYr41DQI
	KaVdOWcDpJ9duRxJ/5rFBd3RXxKHnav6IX/7Z8TQpSEgg93KR4KQXJ4Y8HNEoJg0rH0WW338M3F
	qq144XVKOwUR6jpy35ujRU/oOxJM=
X-Google-Smtp-Source: AGHT+IGM+1hSBakMhrLaq9WY4U9uml++QAtwf0AFvIykTUocyfI+3+molPmoYEJFzOkqT6FmQrqWMw==
X-Received: by 2002:a05:6214:2e92:b0:704:a592:490b with SMTP id 6a1803df08f44-704a592491emr63860896d6.37.1752264042280;
        Fri, 11 Jul 2025 13:00:42 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7049799e874sm23334306d6.18.2025.07.11.13.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 13:00:41 -0700 (PDT)
Message-ID: <1f36e0e642a1554f4661f122f7d525d5677ce1df.camel@ndufresne.ca>
Subject: Re: [PATCH 7/8] media: rkvdec: Remove TODO file
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel	 <sebastian.reichel@collabora.com>, Cristian Ciocaltea	
 <cristian.ciocaltea@collabora.com>, Alexey Charkov <alchark@gmail.com>, 
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu
 <liujianfeng1994@gmail.com>, Nicolas Frattaroli	
 <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>,
  Andy Yan <andy.yan@rock-chips.com>, Frank Wang
 <frank.wang@rock-chips.com>, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rockchip@lists.infradead.org,
 Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda
 <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>,  Yunke Cao
 <yunkec@google.com>, linux-media@vger.kernel.org, kernel@collabora.com
Date: Fri, 11 Jul 2025 16:00:39 -0400
In-Reply-To: <20250623160722.55938-8-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
	 <20250623160722.55938-8-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-KQw6nRLQn0EVg5xyIuZ/"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-KQw6nRLQn0EVg5xyIuZ/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 juin 2025 =C3=A0 12:07 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> 2 items are present in the TODO file:
> =C2=A0- HEVC support
> =C2=A0- Evaluate adding helper for rkvdec_request_validate
>=20
> Missing HEVC support is not a reason for a driver to be in staging,
> support for different features of the hardware can be added in drivers
> in the main tree.
>=20
> The rkvdec_request_validate function was simplified in
> commit 54676d5f5630 ("media: rkvdec: Do not require all controls to be pr=
esent
> in every request")
> by not setting controls that have not changed.
> As it now basically just calls vb2_request_validate(), there is no need
> for a helper.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/staging/media/rkvdec/TODO | 11 -----------
> =C2=A01 file changed, 11 deletions(-)
> =C2=A0delete mode 100644 drivers/staging/media/rkvdec/TODO
>=20
> diff --git a/drivers/staging/media/rkvdec/TODO
> b/drivers/staging/media/rkvdec/TODO
> deleted file mode 100644
> index 2c0779383276e..0000000000000
> --- a/drivers/staging/media/rkvdec/TODO
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -* Support for HEVC is planned for this driver.
> -
> -=C2=A0 Given the V4L controls for that CODEC will be part of
> -=C2=A0 the uABI, it will be required to have the driver in staging.
> -
> -=C2=A0 For this reason, we are keeping this driver in staging for now.
> -
> -* Evaluate introducing a helper to consolidate duplicated
> -=C2=A0 code in rkvdec_request_validate and cedrus_request_validate.
> -=C2=A0 The helper needs to the driver private data associated with
> -=C2=A0 the videobuf2 queue, from a media request.

--=-KQw6nRLQn0EVg5xyIuZ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaHFtaAAKCRDZQZRRKWBy
9F41AP99Ssroc2Ugv8H1VwcSMEFKHPQNBb3wYyF+ksoPrbKbdAD/RUUvTpWPsDfz
ldKo4ficYUoAy5UZisMdhE0ngURfwg4=
=tW+S
-----END PGP SIGNATURE-----

--=-KQw6nRLQn0EVg5xyIuZ/--


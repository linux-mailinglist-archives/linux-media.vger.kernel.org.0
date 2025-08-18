Return-Path: <linux-media+bounces-40184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 403F1B2AE83
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 18:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A80F418831BB
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 16:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A240341AB4;
	Mon, 18 Aug 2025 16:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="0clavAA2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C172F254B1F
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755535746; cv=none; b=R1WJwU61FmL1205BteGLABQ3FUFyin7OiBR0JmkFczd3gUVBTaG0VKr7p54jrFUH2jRTjKBaXUyrP+EUnlfi2IO2HWxxdc1uwNW3/3voTmUDWib2r+6xteQeMNODpV8LT2J+jhhB2xJfCrleZNeIjmV8O3s2ZNUNMFHZCkP2jVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755535746; c=relaxed/simple;
	bh=sIa05R0J/p/gvUlQdm/OCv2IWb3eNdcA65nc7xoccNA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oBrQbfE+Og0TZ1E4ide4nt8hPh5R/Fi41wUejCu9/+4SL8RF4/8QThcK3Tjg22INhGvT1uBibSCg6myMIQKxX3lz/yShHcvm6w+t/7hBRZleAZ6k8KLbcbR/W0yxKAci265jr6xbR07ojsITE+u9UFGZbWJHn60viQ2bdvMWKWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=0clavAA2; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e8704c7a46so520351385a.1
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1755535743; x=1756140543; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sIa05R0J/p/gvUlQdm/OCv2IWb3eNdcA65nc7xoccNA=;
        b=0clavAA2qP8OEnSkljGWBubheysE6suCf106ykC83NIoTHCZRH3OfxrOMrlkd0NvCL
         fKDBLYBAi5Nxy+C28+p42FLMO11WYr8oNO7PNG9IAfD7nLbn8++iWZm2Btc77x/0xNzg
         V6x28OHRSkAdovFmTCs1NRV1rz+U1oTaLLqGF/xN9HRb+7FOMsqf/kiIwU/2wtRfEqHS
         1FV7jlGWEUHZmuqw4BDjSL5glNN44YPUSr8eYEpmLcTprx30er2Tj62inB0kzcZhhmGJ
         l8XqFK5nJKj92UEgOmNEgTk/DKBVQbNMkU1SQElieJKXBdpbst0jzqZcUQHTueuoBoWF
         A+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755535743; x=1756140543;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIa05R0J/p/gvUlQdm/OCv2IWb3eNdcA65nc7xoccNA=;
        b=mkzg0RefoNZzKOmmIQsv5PydY184lF/jPGNq4fXX5DTTYs8iCb65rKas9CY6pwVNgh
         Tv+teFaApVoQFeBz3EgG8XdfoJU3U+CAAoI/792ZhHIQU7AbfdY4aciboy8TkQr01YSC
         mkmVoVNHG6K54rZgMKJHtCoQU0kagKWQ9AevY8U1wYMowQRMjZrmVZ58EyQDfVSvQ97N
         w/NyDnVXZO1EfA7IVlvE0w5k/zXkkQxNj03ijqjuDrXJPQwKIW1zgm4sRENG3fYoLbTR
         HC74Q0t1tZgt6/xw/mZwly9cvynStKymlppUKInsCXMd0J/i0UgBmO92+Mk/aX3idP9t
         DXAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMi9+gS1GGoT35fkF1gbUQtOscQiOhb+ElDtmjZ432EHp2zCwhJqR3G5Kg9feGbBudA4K2LcpIqa7npQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTsNu9QuNWpBXwyR+rMVnxlRLVc4lo+P+2xTVONoapgLPV+gN9
	0fxHVOdTid4i2OKDQp/PYh3PgUbwH/8CrqCxy9R50i/euzdV6APsF9+4mrD8rNHThEWwKd1aUEX
	nohvb
X-Gm-Gg: ASbGnctWMgTGNyMaFiGkQLOtosd/RAyjakVtUhIajIq2+katMCak8vY1MTTIN2Fzyvy
	vvY4z2QEWRjblon3QpUH7Y7Sc1fxPl/K9CM56MnVh94O8xfZsajf6BZNpo0AXVaKseiYe+Rbedc
	vz9dJPkHrgvZVoPMSlE/aMOeKud8w05EmhI6Y5MPMOK7vnMmbtp0EfzRts8w3zA3nzHAL7vYksC
	lZXsfgy+c479QcAVAndCQnjjoC+Mee74OGL+7R0Z4kQQ2OWT4CDHtFtQXFdfi9rKA9kSp8SggHX
	4qFytRvO7Z2PAUz1M14OXxG7FPqPyfoTWjnRujisvTZmY2KnPrRmyTjjx41YgMjEcRJDQiPkTA1
	ETln0MF5G7FWAnkZcncA6kgZpE2s=
X-Google-Smtp-Source: AGHT+IHRV9UYYoFMmbsyOi7K7b5e5kdl/Y6v6JETPNaJGIFU2rDTZXhnrzz/YLs+Qb/laKu4ITGx8w==
X-Received: by 2002:a05:620a:17a3:b0:7e8:46f8:6d5e with SMTP id af79cd13be357-7e87e12a2b3mr1594522485a.51.1755535743520;
        Mon, 18 Aug 2025 09:49:03 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e1c10f2sm613132985a.59.2025.08.18.09.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 09:49:02 -0700 (PDT)
Message-ID: <2cd17949c94940377b1e2cd9879f88150fb798db.camel@ndufresne.ca>
Subject: Re: How to construct a Gstreamer pipeline using crop feature for
 v4l2
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Date: Mon, 18 Aug 2025 12:49:01 -0400
In-Reply-To: <SLXP216MB1148BE257D9FDA62BA7680EFED31A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: 
	<SLXP216MB1148BE257D9FDA62BA7680EFED31A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
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
	protocol="application/pgp-signature"; boundary="=-ojSLfuFopnj0V6acntoS"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-ojSLfuFopnj0V6acntoS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jackson,

Le lundi 18 ao=C3=BBt 2025 =C3=A0 06:33 +0000, jackson.lee a =C3=A9crit=C2=
=A0:
> Hello All
>=20
> I am developing a V4L2 driver that uses hardware acceleration for CSC,
> scaling, and crop. I am using the v4l2convert plugin in GStreamer for tes=
ting.
>=20
> I was able to test CSC and scaling with v4l2convert using a GStreamer pip=
eline
> like the one below:
>=20
> gst-launch-1.0 filesrc location=3DBasketballPass_416x240_50_nv12.yuv !
> rawvideoparse width=3D416 height=3D240 format=3Dnv12 framerate=3D30/1
> colorimetry=3Dbt601 ! v4l2convert ! video/x-raw,format=3DNV24,width=3D416=
,height=3D240
> ! filesink location=3DNV24.yuv
>=20
> However, when I try to test the crop functionality, it seems that the
> v4l2convert plugin does not support it directly. How can I construct a
> GStreamer pipeline to test this?

The support for cropping, either the source or to the destination is only
partially implemented in v4l2convert element code (./subprojects/gst-plugin=
s-
good/sys/v4l2/gstv4l2transform.c). Currently, its only used to handle paddi=
ng
due to alignment. To test this feature with GStreamer, you would have to
implement source crop (usually done through GstVideoCropMeta support) and
destination crop (usually done with properties).

There might be a way to test using v4l2-ctl, but I didn't find out myself y=
et.

regards,

Nicolas

--=-ojSLfuFopnj0V6acntoS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaKNZfQAKCRDZQZRRKWBy
9F1XAQDR8vq8KF4sldfKJ7QI5KbqFIxVnZd+u9UZJjrqmHZ4/wEAlOIJDrLhICf5
wCl/qN8/v5F41vqi4hEp8du+FM/qNwM=
=OrfD
-----END PGP SIGNATURE-----

--=-ojSLfuFopnj0V6acntoS--


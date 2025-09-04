Return-Path: <linux-media+bounces-41783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02FEB44120
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 17:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 769195879CD
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 15:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6F9C8F0;
	Thu,  4 Sep 2025 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="u0kUJwzu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778DC26D4D4
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 15:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757001266; cv=none; b=S6CNoN8djpnrLmp5SPmSz8yQ90/76vftMKYgX+XOFvjkjF9vfRVHfvLhGeOeNmQw1h7736dABLitNYXwt2qUcK/qL6DoOKyxCopeu1UVEhgUxjz22u/2+7fdDV7ufZOpZtv7n06BTIGrExq72GLBDf/1A3hp5fr9LGPEKURp+gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757001266; c=relaxed/simple;
	bh=NZsXl6YNvbNKl/6Z8/xkPxia+1Mmiwl62zs5F3BiEBQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C+yDWpXcE7+J7+LutUqCu4hYAAIsURMTTI8DAyOejgqsZXPwCLPRiL+9ozK4NRTM0N9UOcN3HHKldMGUr0wkZ9TWG9VdsOg4gkJj3xYKV4JcA5Mh+Ksyh31LD0S6y84xYdOGWGLZP5s7VmvBaltk3iTNwq2GOflaAUUDstLZpcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=u0kUJwzu; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-7220d7dea27so9185646d6.1
        for <linux-media@vger.kernel.org>; Thu, 04 Sep 2025 08:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1757001263; x=1757606063; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CupnfoR7Wq8Isj3y9KQeT4kDofo2q3g9cffLLEa/Bmw=;
        b=u0kUJwzuP6Eoqz3N7QFYqX3uLgQx8UgJePqhNhhOVMowfjiQp9S+SuuOEXqxL9wYdj
         pmwJhSl25Znh5WBP4lHxihNc26VfgXX6RbTV/WcvJw9Q59bqKuEA0YJtL1s21q4SLfRb
         Rvj6leTRsXmbN6nhkEKR6TXrbQ7igIFZwBnN19E2l+/yXrkjfMgnnL+ZCLGWVpC31SVq
         tFF3Lx0rCLDegEi5QQZ/Zr3f5fJMEH0XA34Y9dY/8Ht1hDUBkiEkG8ftawyqVErnB7o3
         lz4nSyyhQDki6Y3+1TWRIdgMCA8gRTdssWML0o8j+XvIwLf2SEAK2t2A8zwEVrTU7g8N
         Tk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757001263; x=1757606063;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CupnfoR7Wq8Isj3y9KQeT4kDofo2q3g9cffLLEa/Bmw=;
        b=F0dwNB+oUkZ2fdS/S/fGrUb/G6oAbJF5ViXUL4ZTGRo4xPT0CmRMCGcPmAfOQ1WQaf
         XoSumn6VNdBtVekcUgqaMOAcWkf8smn4QvIV60z8PMM/onAWd8bOGogCdPp/kSraemD1
         qrI/44D2nJRyHlQvQsFZqI7irJE0+zC5si0YDGv2IPeQS/modyNQ0ufmwKb+v9UvMb2U
         IZJp6sHTvbaooP9JzsbWnL0ui9M2nZOue76miF3Ckff1fRBevfPrt+T5ypBgl956YZWH
         Qmd6ZsKzHAncBQYqW+mLgLPmIOd21JVU+8d/W3ki9jGTxr0WD5+M1hZUvOhueC6QOwZt
         qi0g==
X-Gm-Message-State: AOJu0YwhKyjpCq0lzhB1IZaG6R3xuwtjah3t1JL8mV1wgNRT6JBpbc6w
	JO8pq+d9isoNCUJv5u6W/rAMVWhj0yADAqyqsP5X+hfXuLEi2w2l+6+ML7WKPXi6bA8=
X-Gm-Gg: ASbGncvv5sGzFLmcarmpyxLVQn079tyGgth0/MmM0CqHzAk5skLdh8+N+q2Lx4Ekhr6
	oNqJWnxk60aK2u4b0FQD+COerfoq7mu04CdL5Jc6a7TXvzF5fRWhidKKyKhU+qUCjjaxOvyb8tC
	/BcZeXDH+rVCUPicd6nSHfRpCaS6nsfG2fqCNpmBqdFZryHSsagpqJRcg6x0RTECFpbg+OEevar
	VGeGr35XCbqtX+BDLFUGHObwsI3PRRo2HpwKRQ89bH165pIcqa/6x0MtAVzrmWls8YFwM5W4xMA
	EpHJqfL5i1MwhB1VfKySJIM+2UacYj8AaPllL2qS2d6dXyzhM+vVI7m+Ztd/QI4TGzmJ84cczJQ
	WWchIscmdRroUG0ajtJrwUYycWjHyPpo442QVpQ==
X-Google-Smtp-Source: AGHT+IFE52FvAlaKtWbQ5o0NmfX8WgTvwUZ6/IuQgIgkYceXVYsMPe+6Yfn/RZ/Fv/powbGQSeXrcw==
X-Received: by 2002:a05:6214:19cc:b0:716:ba73:8b72 with SMTP id 6a1803df08f44-716ba738bf2mr241684946d6.19.1757001262970;
        Thu, 04 Sep 2025 08:54:22 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b4947b1asm48950046d6.41.2025.09.04.08.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:54:22 -0700 (PDT)
Message-ID: <59e87d8e346bb16b225382b9a4500e1b16bbf776.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/8] Add support for Wave6 video codec driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marek Vasut <marek.vasut@mailbox.org>, Nas Chung
 <nas.chung@chipsnmedia.com>, 	mchehab@kernel.org, hverkuil@xs4all.nl,
 sebastian.fricke@collabora.com, 	robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 jackson.lee@chipsnmedia.com, 	lafley.kim@chipsnmedia.com
Date: Thu, 04 Sep 2025 11:54:20 -0400
In-Reply-To: <472aac3c-9d3e-4892-8d6c-665fa6793464@mailbox.org>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
	 <f03d0ae0-d28b-4b06-8f63-9d06f15c0522@mailbox.org>
	 <fcfa00b5ae102d76b02ce1667d27822e6d2c3c81.camel@ndufresne.ca>
	 <472aac3c-9d3e-4892-8d6c-665fa6793464@mailbox.org>
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
	protocol="application/pgp-signature"; boundary="=-rQkiAugD/o1ZvBT9U1nt"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-rQkiAugD/o1ZvBT9U1nt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 04 septembre 2025 =C3=A0 17:32 +0200, Marek Vasut a =C3=A9crit=C2=
=A0:
> On 9/4/25 3:25 PM, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mercredi 03 septembre 2025 =C3=A0 23:47 +0200, Marek Vasut a =C3=A9c=
rit=C2=A0:
> > > On 4/22/25 11:31 AM, Nas Chung wrote:
> > > > This patch series introduces support for the Chips&Media Wave6 vide=
o
> > > > codec IP, a completely different hardware architecture compared to =
Wave5.
> > > >=20
> > > > The wave6 driver is a M2M stateful encoder/decoder driver.
> > > > It supports various video formats, including H.264 and H.265,
> > > > for both encoding and decoding.
> > > > While other versions of the Wave6 IP may support VP9 decoding and
> > > > AV1 decoding and encoding those formats are not implemented or vali=
dated
> > > > in this driver at this time.
> > > >=20
> > > > On NXP i.MX SoCs, the Wave6 IP functionality is split between two r=
egions:
> > > > VPU Control region, Manages shared resources such as firmware memor=
y.
> > > > VPU Core region, Provides encoding and decoding capabilities.
> > > > The VPU core cannot operate independently without the VPU control r=
egion.
> > > >=20
> > > > This driver has been tested with GStreamer on:
> > > > - NXP i.MX95 board
> > > > - pre-silicon FPGA environment
> > > >=20
> > > > Test results for decoder fluster:
> > > > - JVT-AVC_V1, Ran 77/135 tests successfully=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 35.519 secs
> > > > - JVT-FR-EXT, Ran 25/69 tests successfully=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 17.725 secs
> > > > - JCT-VC-HEVC_V1, Ran 132/147 tests successfully=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 81.549 secs
> > > > - All failures are due to unsupported hardware features:
> > > > -- 10bit, Resolutions higher than 4K, FMO, MBAFF
> > > > -- Extended profile, Field encoding and High422 sreams.
> > > >=20
> > > > Test results for v4l2-compliance:
> > > > v4l2-compliance 1.29.0-5359, 64 bits, 64-bit time_t
> > > > v4l2-compliance SHA: 2a91a869eb8a 2025-04-12 11:35:53
> > > >=20
> > > > Compliance test for wave6-dec device /dev/video0:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail: ../utils/v4l2-compliance/v4l2-te=
st-controls.cpp(1180): !have_source_change || !have_eos
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_=
(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> > > > Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: =
1, Warnings: 0
> > > >=20
> > > > Compliance test for wave6-enc device /dev/video1:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail: ../utils/v4l2-compliance/v4l2-te=
st-controls.cpp(1169): node->codec_mask & STATEFUL_ENCODER
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_=
(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> > > > Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: =
1, Warnings: 0
> > > >=20
> > > > Note: the failures are all related with the eos event.
> > >=20
> > > For what its worth, the whole series:
> > >=20
> > > Tested-by: Marek Vasut <marek.vasut@mailbox.org> # NXP i.MX95 rev. A0
> >=20
> > Do you mind sharing what tests you have done ? Are you confirming the s=
ame
> > fluster and compliance results, have you done more ? Since this is larg=
ely
> > inspired on Wave5, I'd like to see people testing real-world playback, =
with
> > seeks, dynamic resolution changes, data lost. On Wave5, latest performa=
nce
> > patches leads to crash or hangs.
> I did not use fluster this time, I used h264 decode of 1920x1080 60 FPS=
=20
> stream. The pipeline was very basic, something along the lines of:
>=20
> gst-launch-1.0 -v filesrc location=3D/test.mp4 ! qtdemux ! h264parse !=
=20
> v4l2h264dec ! fpsdisplaysink text-overlay=3Dfalse video-sink=3Dwaylandsin=
k

Thanks for the detail. Since you have a running setup, perhaps consider tes=
ting
with the following, left/right keyboard arrow will let you jump around in t=
he
media.

  gst-play-1.0 --audiosink=3Dfakeaudiosink --videosink=3Dwaylandsink /test.=
mp4

That would at least cover seeking use cases. I provided Nas a stream that
aggressively do resolution changes to reproduce a Wave5 crash, I would expe=
ct
him to test and report against Wave6 too. If you'd like to have that sample=
, let
me know, its not very big, and free, but I'd rather not do attachements ove=
r the
mailing list.

regards,
Nicolas

--=-rQkiAugD/o1ZvBT9U1nt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLm2LAAKCRDZQZRRKWBy
9EtkAQCHftEHuFqu/CGZGFVjDS0zfFNB49nCoSFYLcOlPivn+gD/THK9ihIjKXNh
HFMc495U+ea+XAU+U2kGkIqsH9fdjgk=
=CPDD
-----END PGP SIGNATURE-----

--=-rQkiAugD/o1ZvBT9U1nt--


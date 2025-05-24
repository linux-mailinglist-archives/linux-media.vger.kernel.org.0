Return-Path: <linux-media+bounces-33301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4815AC2CB8
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 02:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C78F67AD70F
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 00:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04D21C5490;
	Sat, 24 May 2025 00:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="XyZBH6vi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3FF19D06A
	for <linux-media@vger.kernel.org>; Sat, 24 May 2025 00:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748046622; cv=none; b=iegbn0t8leCVduRvxYDbvTHkK4hMs1AYVqr7ga4xo/8zIlqAJNZw9e0tX4lUDdnSPJrWqiITiP/jk/gfP77t3nN0ynKvBG7OtP1HXEC7OFXcWGf8pkg+054u8zelkJbqFYsfKc+Wv0fm3XjZwdhfXcLU7cEvShc+aJdly3/jYRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748046622; c=relaxed/simple;
	bh=Z3vQxLcTpDMFbmhqz80TZkS1cBKQmNM3Hvh7L+Ojb0c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KUyjUxxBNGBAX5KeXSpDpWQ+nv7fxbfBz3NHkt3fe9hPoVtVSJarIbom4NOu4LPcIfiD/2WcNcsHQ2l47ACDUftnFlwrdHN8RXOHmTFap8IOJ5b+0EgcHFPltJtEuIqLd0qnH9cEigWNfxyaMM3qYbDD1OCg0FbUdhvU4OJtTL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=XyZBH6vi; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5b2472969so35956685a.1
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 17:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748046619; x=1748651419; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z3vQxLcTpDMFbmhqz80TZkS1cBKQmNM3Hvh7L+Ojb0c=;
        b=XyZBH6vizpgpRCeZTyKCanfnijS/hfS2cqHTp68TiMC2+Rpkt1qIzoAIJxU1ET9OWJ
         x6q+v9DyfJ7y0AYGt4tvsCsQYgeb9yL7R3cDjmPCP7VhDCt2IVMuZRDVIPnDamW8YJ0q
         vadw/4btZjnz6gm2QHFx8oO88bhxmEy6s5liOaG3S0H2nSgK9PvzaMkmvjRwdXFr+nS8
         mpKJhNqRAvfFm+Wh+X8AK32vB1GmRblw+vAspkOQiBZaRtDRPZqbFZPDs8CqwkqMPpwf
         EMIRn07nBYutQqGXxKCOlc10TOyYnuS2rg6w+ywH/jDW5KXYw7DlEMayChptN0XodZ5N
         Xi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748046619; x=1748651419;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z3vQxLcTpDMFbmhqz80TZkS1cBKQmNM3Hvh7L+Ojb0c=;
        b=MXTayYhMe2rK2yC6ssnGfldBVnO9c661qSEU33Anl4CIclpz1j7HpolzSu8Sx/vKAb
         yZH366vre4ywGjwdCEsaUG5hUnFw0qOm5TKs9hrKvM5TGgpR2e7bFUVbaGgNOFmqf2L5
         g4GUWJt6M3wxohoVIsauwT22OnakDr237fpP0fw1K5qBGHjs1orhYwbJSyW59s+p2549
         Vm40K1NKYvHevsyroy2gXPWpYayvuYoHrpOLmYenAxEOYCT7X0SnD839BM30UJivMiU0
         d2nHk6zJTvvZ611in4dlMNOV6nbqpgR/YQSHH6zKruvr4hC3H1IC7akn3PQ4srPe48dS
         hTwA==
X-Forwarded-Encrypted: i=1; AJvYcCV5ZV4M/42MltRPl8qFjLRCrgEc/9VM6PTyI6yt2nMGbRltKIUw1y7pSe1pZ4lTdTzFxcdYE9Yd54rxrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0p+Haq3ykxFjy6XwOPOkMRfXjIQXyTk7pWATue+H74j0E/TEL
	UEkeCqxZ39a8V7pkpftj8SFyvuu/J2ylGgon990xTIfJ6+/jbcYNCvYceq/frzHK3S8=
X-Gm-Gg: ASbGncupoOGgnwZuBt/EN38jljP/GDotgREYaO58EtCbEaKUVecZlz5xpt8GlpnFTQy
	C3xsLdOoHJ/p95Vw+qfVEAJ1wX2WHMBVQe8u9Bt3FXbrVf4EAp8BqEGY6hTaGSw2gXyDYPPoNvq
	fEqod0YZV61BjKWW6NXrjkL6XF6AHfqed/TpX5b5KLfcdI+cEisK24ArRqI5bAByVQBCu+u2KhE
	ONUZAaPujJumMJZYVT6fqX36MGaZA4wfWNXdrZviqUnEgcN8FUHZ9pdFsJdj6YxVvVJ2oUe5tei
	9U2E+bSwsu3WJtIZgOjGWxazI+W3OYbazvdh1jwAxnUZpbN8Xa1wf5Fq
X-Google-Smtp-Source: AGHT+IEdDR8OXzB8US60Ph044RM+6ozSx842gNCE6DrnFPv+fhbjtE54fFC5D64DrrpFCuVDHM+uHA==
X-Received: by 2002:a05:620a:45a7:b0:7cd:53cc:c60c with SMTP id af79cd13be357-7ceecc2b5d3mr205043985a.37.1748046619377;
        Fri, 23 May 2025 17:30:19 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468b7400sm1254895885a.66.2025.05.23.17.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 17:30:18 -0700 (PDT)
Message-ID: <b1d8b6407bcaea4e12ff1c6c206c8d3b591ac2a9.camel@ndufresne.ca>
Subject: Re: [PATCH v3 1/5] docs: uapi: media: Document Raspberry Pi NV12
 column format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 23 May 2025 20:30:17 -0400
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-1-8fd3fad1d6fb@raspberrypi.com>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
	 <20250423-media-rpi-hevc-dec-v3-1-8fd3fad1d6fb@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 23 avril 2025 =C3=A0 18:20 +0100, Dave Stevenson a =C3=A9crit=
=C2=A0:
> The Raspberry Pi HEVC decoder uses a tiled format based on
> columns for 8 and 10 bit YUV images, so document them as
> NV12MT_COL128 and NV12MT_10_COL128.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> =C2=A0.../userspace-api/media/v4l/pixfmt-yuv-planar.rst=C2=A0 | 42 ++++++=
++++++++++++++++
> =C2=A01 file changed, 42 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst =
b/Documentation/userspace-
> api/media/v4l/pixfmt-yuv-planar.rst
> index b788f6933855..b5b590f234b0 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -827,6 +827,48 @@ Data in the 12 high bits, zeros in the 4 low bits, a=
rranged in little endian ord
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cb\ :sub:`11`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`11`
> =C2=A0
> +V4L2_PIX_FMT_NV12MT_COL128 and V4L2_PIX_FMT_NV12MT_10_COL128
> +------------------------------------------------------------
> +
> +``V4L2_PIX_FMT_NV12MT_COL128`` is a tiled version of
> +``V4L2_PIX_FMT_NV12M`` where the two planes are split into 128 byte wide=
 columns
> +of Y or interleaved CbCr.
> +
> +V4L2_PIX_FMT_NV12MT_10_COL128 expands that as a 10 bit format where 3 10=
 bit
> +values are packed into a 32bit word. A 128 byte wide column therefore ho=
lds 96
> +samples (either Y or interleaved CrCb). That effectively makes it 6 valu=
es in a
> +64 bit word for the CbCr plane, as the values always go in pairs.

Could be nice to mention that this has a verticalement alignment of 8, allo=
wing
to represent it as a 128x8 tiled format with a column layout. This was hand=
y for
the GStreamer integration your showed me.

Nicolas

> +
> +Bit-packed representation.
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3=
.2cm}|
> +
> +.. flat-table::
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths: 8 8 8 8
> +
> +=C2=A0=C2=A0=C2=A0 * - Y'\ :sub:`00[7:0]`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Y'\ :sub:`01[5:0] (bits 7--2)` Y'\ :sub=
:`00[9:8]`\ (bits 1--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Y'\ :sub:`02[3:0] (bits 7--4)` Y'\ :sub=
:`01[9:6]`\ (bits 3--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - unused (bits 7--6)` Y'\ :sub:`02[9:4]`\=
 (bits 5--0)
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3=
.2cm}|
> +
> +.. flat-table::
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths: 12 12 12 12 12 12 12 12
> +
> +=C2=A0=C2=A0=C2=A0 * - Cb\ :sub:`00[7:0]`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`00[5:0]`\ (bits 7--2) Cb\ :su=
b:`00[9:8]`\ (bits 1--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cb\ :sub:`01[3:0]`\ (bits 7--4) Cr\ :su=
b:`00[9:6]`\ (bits 3--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - unused (bits 7--6) Cb\ :sub:`02[9:4]`\ =
(bits 5--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`01[7:0]`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cb\ :sub:`02[5:0]`\ (bits 7--2) Cr\ :su=
b:`01[9:8]`\ (bits 1--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`02[3:0]`\ (bits 7--4) Cb\ :su=
b:`02[9:6]`\ (bits 3--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - unused (bits 7--6) Cr\ :sub:`02[9:4]`\ =
(bits 5--0)
> +
> =C2=A0
> =C2=A0Fully Planar YUV Formats
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D


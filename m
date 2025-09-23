Return-Path: <linux-media+bounces-42975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C425B949E9
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 08:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E0CC18A7728
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 06:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5190730FC09;
	Tue, 23 Sep 2025 06:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frpSum8p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CCC30DD24
	for <linux-media@vger.kernel.org>; Tue, 23 Sep 2025 06:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758610234; cv=none; b=sUbyCidE3oEUskEp51qWMQpO0St+6gpGYfOnR418x4XcG+qaKG8BEOPWV3SU03yC5ciwOJSDRbTNIhqdqh+xi+oJTb/9R32In6pV3o+NSTOjakChjYkG7z4IGEIqBCiQkWstUcKAeaxoR/ll2NUIIfdYMXISxGoU8wiSJs3pZag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758610234; c=relaxed/simple;
	bh=pPBdSCZ98EIpwgaqHpCLbXJNmqJk8sex29UYfeBRev8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6laujPcuB5ahHjuWaV7j3vM99dgNd7u/Vbof/TDLV0mP8VVN0idqGEuOvEcKr4LKttc+KgXgJOZo5puY9bUhaiQyajXYCHZbwfX5uj3vkVcuV9zqMzekhxjlGWnsTZ7CpB+jLAv9H/tc5wVOBfXT2sk3m9EID2FhOnfZo45fgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frpSum8p; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so2245466f8f.1
        for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 23:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758610229; x=1759215029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlHMNT4xc0wNyFIvmzeOSrTMM9NhDAlJukXUCTenInc=;
        b=frpSum8pTn6/45zYXuZSfYQRbScJ+haDC53s2YEQMalT6oC4DCxyUvgNZVCspFIu/6
         Mp96AuVlJOs6mmSEgVWxqBa9YW1RiFFMk0/qu4PUFLddVGWSw/Wffp3NqWjqdvKmSS4N
         CZ7i1f7dYeq/6u9Zpk5fBzqRzc0vo7zKlKldu794lgXHx3L/Mol0YvJaVgvBsknApKDa
         BUNHyBnQodvMiEX0H0oErY1jP47a8CH3Yk82sD5KfzabwYUAuAzCNYM60GFurTZaIRZS
         IrCs6BikAm/TM6WV9/PQSJIidsHARpW86Wib9qztQW4binzf0CMeWXc4npseb0UKT/oT
         9GXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758610229; x=1759215029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlHMNT4xc0wNyFIvmzeOSrTMM9NhDAlJukXUCTenInc=;
        b=VuOm3Owc9VQYtexzG+t4E0CPeZvZdUCcas0LNPsyiPmx2+KTpQbVDcE/gyiyzHt7R/
         eiBvrUQ4FCqpOYqKdilU7F3TNUq8+6JfFMOVEwqkBzNCGVq2Mm8rAlIEoLAwEuvFcpso
         fdE5xg78uNdNyy1mGJhXTwGhDL/pg6rlwdgxzOkAqg5d23QaEIoTBLC6MyuBx7fQY7Q+
         d0RhMN60vJFlkFkzSwlRkcplRxUvQXTElA0sCbojfsZ2PnBpT9Z39JAmbqkR0J/dzMJo
         4IF2lnVYbKOq8NDGNuoTWCIT/nO+lpCMPDiZEbf7LcR1r/ytvm/9rpM4owF2P1GwK4pP
         TP3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHkKLn6UmGPqgOdHuRLs8aY2qvHg5UGPTHf29nLtknk2+qgSVMTpVN6PeMtrzY45zTl02bK5du5up4FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ0shUUydl8aCBzn9dSXbJj0llaMo/SNuaZ2eaastUiY7GhPnX
	mZD5JQ+txdpy2YIcQuuPdSQQQ7aEpQygOAq1JWdcwVWp8tQoCbX2K3ue9lZODXPbCsn2CjreN3B
	sTei9S7zlhfKnQaeEcERO5N3RKTT/KMA=
X-Gm-Gg: ASbGncvF3cvk+JpKPLbnsLasESjpt3tnZWqlMeaUKl/b6Zqqk6L/Rb4XdHz63vEuLFC
	OuTbvu7RpOCl8XcS3sxDHcfFRzQVlflJKfnUYRQFPyfi7nzIYAx6hnRpcclqnm2cx1+LNJDL6fC
	lLQgLPEkKeiIOnelacABSWrNYyqN29Kl9JCA8k+Y9Ye4A5nFF34lBL94dszRuxvreFNiV2p/eor
	PsnU3nn
X-Google-Smtp-Source: AGHT+IFIL9spgkRWeaf/DjU4ZimRMkpNrzt/GsrYPm8NvTEHKwN4tt4n4FOvoiR/fTEyzsskJnG9u+5cLECvuvZfH7Y=
X-Received: by 2002:a05:6000:1a8b:b0:3ef:42fe:8539 with SMTP id
 ffacd0b85a97d-405c5ccd2e3mr1200526f8f.25.1758610229039; Mon, 22 Sep 2025
 23:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <3074302.Sgy9Pd6rRy@senjougahara>
 <CAPVz0n1ozJ13MB4eFMAJzESe8iQ7SKjMApZCLFAZ_eubCFs0tg@mail.gmail.com>
 <7680340.18pcnM708K@senjougahara> <CAPVz0n2iRVBf0+BwdV6Le2FhY8xERqbtsyeff26Dh44mKsTy6A@mail.gmail.com>
In-Reply-To: <CAPVz0n2iRVBf0+BwdV6Le2FhY8xERqbtsyeff26Dh44mKsTy6A@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 23 Sep 2025 09:50:17 +0300
X-Gm-Features: AS18NWAPWlBampVZ8t1uLSAdSzhUJXoDcFVyZ2xPhXDe7jRCkvdwCVIoO2M9fsE
Message-ID: <CAPVz0n1YDdM+EtuO72CNqVE0opJLt5KfONNGenuSKO678mfc4Q@mail.gmail.com>
Subject: Re: [PATCH v2 16/23] staging: media: tegra-video: tegra20: simplify
 format align calculations
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 23 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:11 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=B2=D1=82, 23 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:04 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Monday, September 22, 2025 4:36=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 10:2=
7 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Monday, September 22, 2025 3:30=E2=80=AFPM Svyatoslav Ryhel wrot=
e:
> > > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE =
09:23 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > >
> > > > > > On Monday, September 22, 2025 2:13=E2=80=AFPM Svyatoslav Ryhel =
wrote:
> > > > > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=
=BE 07:44 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > > > >
> > > > > > > > On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav =
Ryhel wrote:
> > > > > > > > > Simplify format align calculations by slightly modifying =
supported formats
> > > > > > > > > structure.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/staging/media/tegra-video/tegra20.c | 41 +++++++=
+-------------
> > > > > > > > >  1 file changed, 16 insertions(+), 25 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c =
b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > index 6e0b3b728623..781c4e8ec856 100644
> > > > > > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct=
 v4l2_pix_format *pix, unsigned int bpp)
> > > > > > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDT=
H,  TEGRA20_MAX_WIDTH);
> > > > > > > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIG=
HT, TEGRA20_MAX_HEIGHT);
> > > > > > > > >
> > > > > > > > > -     switch (pix->pixelformat) {
> > > > > > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > > > > > -             pix->bytesperline =3D roundup(pix->width, 2=
) * 2;
> > > > > > > > > -             pix->sizeimage =3D roundup(pix->width, 2) *=
 2 * pix->height;
> > > > > > > > > -             break;
> > > > > > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > > > > > -             pix->bytesperline =3D roundup(pix->width, 8=
);
> > > > > > > > > -             pix->sizeimage =3D roundup(pix->width, 8) *=
 pix->height * 3 / 2;
> > > > > > > > > -             break;
> > > > > > > > > -     }
> > > > > > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp=
, 8);
> > > > > > > >
> > > > > > > > Assuming the bpp is coming from the format table below, thi=
s changes the value of bytesperline for planar formats. With this it'll be =
(width * 12) / 8 i.e. width * 3/2, which doesn't sound right.
> > > > > > > >
> > > > > > >
> > > > > > > Downstream uses soc_mbus_bytes_per_line for this calculation =
which was
> > > > > > > deprecated some time ago, here is a fragment
> > > > > > >
> > > > > > > s32 soc_mbus_bytes_per_line(u32 width, const struct soc_mbus_=
pixelfmt *mf)
> > > > > > > {
> > > > > > >  if (mf->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> > > > > > >  return 0;
> > > > > > >
> > > > > > >  if (mf->layout !=3D SOC_MBUS_LAYOUT_PACKED)
> > > > > > >  return width * mf->bits_per_sample / 8;
> > > > > > >
> > > > > > >  switch (mf->packing) {
> > > > > > >  case SOC_MBUS_PACKING_NONE:
> > > > > > >   return width * mf->bits_per_sample / 8;
> > > > > > >  case SOC_MBUS_PACKING_2X8_PADHI:
> > > > > > >  case SOC_MBUS_PACKING_2X8_PADLO:
> > > > > > >  case SOC_MBUS_PACKING_EXTEND16:
> > > > > > >   return width * 2;
> > > > > > >  case SOC_MBUS_PACKING_1_5X8:
> > > > > > >   return width * 3 / 2;
> > > > > > >  case SOC_MBUS_PACKING_VARIABLE:
> > > > > > >   return 0;
> > > > > > >  }
> > > > > > >    return -EINVAL;
> > > > > > > }
> > > > > > >
> > > > > > > V4L2_PIX_FMT_YUV420 and V4L2_PIX_FMT_YVU420 are classified as
> > > > > > > SOC_MBUS_PACKING_1_5X8 hence we get width * 3/2
> > > > > >
> > > > > > Googling this brings up the entry
> > > > > >
> > > > > > {
> > > > > >         .code =3D V4L2_MBUS_FMT_YUYV8_1_5X8,
> > > > > >         .fmt =3D {
> > > > > >                 .fourcc                 =3D V4L2_PIX_FMT_YUV420=
,
> > > > > >                 .name                   =3D "YUYV 4:2:0",
> > > > > >                 .bits_per_sample                =3D 8,
> > > > > >                 .packing                        =3D SOC_MBUS_PA=
CKING_1_5X8,
> > > > > >                 .order                  =3D SOC_MBUS_ORDER_LE,
> > > > > >                 .layout                 =3D SOC_MBUS_LAYOUT_PAC=
KED,
> > > > > >         },
> > > > > > }
> > > > > >
> > > > > > which matches that you're describing. It doesn't make sense to =
me, since it at the same time specifies PIX_FMT_YUV420 (which is planar wit=
h 3 planes, as documented by include/uapi/linux/videodev2.h), and LAYOUT_PA=
CKED
> > > > > >
> > > > > > /**
> > > > > >  * enum soc_mbus_layout - planes layout in memory
> > > > > >  * @SOC_MBUS_LAYOUT_PACKED:             color components packed
> > > > > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_U_V:      YUV components stored i=
n 3 planes (4:2:2)
> > > > > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_C:        YUV components stored i=
n a luma and a
> > > > > >  *                                      chroma plane (C plane i=
s half the size
> > > > > >  *                                      of Y plane)
> > > > > >  * @SOC_MBUS_LAYOUT_PLANAR_Y_C:         YUV components stored i=
n a luma and a
> > > > > >  *                                      chroma plane (C plane i=
s the same size
> > > > > >  *                                      as Y plane)
> > > > > >  */
> > > > > > enum soc_mbus_layout {
> > > > > >         SOC_MBUS_LAYOUT_PACKED =3D 0,
> > > > > >         SOC_MBUS_LAYOUT_PLANAR_2Y_U_V,
> > > > > >         SOC_MBUS_LAYOUT_PLANAR_2Y_C,
> > > > > >         SOC_MBUS_LAYOUT_PLANAR_Y_C,
> > > > > > };
> > > > > >
> > > > > > i.e. non-planar. The code in the driver is handling it as three=
 planes as well, with addresses VB0_BASE_ADDRESS/VB0_BASE_ADDRESS_U/VB0_BAS=
E_ADDRESS_V. Since the planes are separate, there should be no need to have=
 more than 'width' samples per line.
> > > > > >
> > > > >
> > > > > I did not invent this, I have just simplified this calculation fr=
om
> > > > > downstream, output values remain same. I have no cameras which ca=
n
> > > > > output V4L2_PIX_FMT_YUV420 or V4L2_PIX_FMT_YVU420 so I cannot tes=
t if
> > > > > this works either. Other YUV and RAW formats were tested on real =
HW
> > > > > and work perfectly fine.
> > > >
> > > > My understanding from the code was, that the MEDIA_BUS_FMT_ formats=
 listed in the video format table refer to the input formats from the camer=
a, and the V4L2_PIX_FMT_ formats to output formats from VI. Hence VI could =
input UYVY8_2X8 and write to memory in YUV420. The code dealing with V4L2_P=
IX_FMT_ values seems to be related to the output to memory. Is it possible =
to test this (your camera -> VI converts to YUV420) or am I mistaken?
> > > >
> > >
> > > Camera I am testing with has no YUV420 options available and from wha=
t
> > > I can tell there is no way to force VI to output in YUV420 unless
> > > camera supports it. Any format manipulations should requite hooking u=
p
> > > ISP, or am I missing smth?
> >
> > From a quick look at the spec it looks to me like for YUV422 packed inp=
ut formats specifically, VI should be able to convert to YUV420. If that we=
re not the case, e.g. 'TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV42=
0),' would not make sense anyway as it's talking about both YUV422 packed i=
nput data and then also YUV420.
> >
>
> After additional checking you are correct, VI should be able to
> perform YUV442 to YUV440. One of the reasons why VI is not exposing
> YUV440 may be video-centric nature of the driver, so that it exposes
> only formats supported by camera and VI. I will double check which
> formats video device exposes. What should I test exactly?
>

Alternatively, since code that I propose matches in output with one
that was before, changes can be applied and revised once there will be
such need. Especially, since YUV422 and RAW8/10 work fine and were
tested. I am not sure there will be many use cases which deliberately
target YUV420.

> > >
> > > > It's certainly possible that the current code is functional -- if b=
ytesperline is set to a too large value and that information flows to users=
pace, it could still read the buffer. It would just waste memory.
> > > >
> > > > >
> > > > > > >
> > > > > > > > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > >  /*
> > > > > > > > > @@ -576,20 +564,23 @@ static const struct tegra_vi_ops te=
gra20_vi_ops =3D {
> > > > > > > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > > > > > > -{                                                    \
> > > > > > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > > > > > > > -     .bpp     =3D BPP,                                 \
> > > > > > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > > > > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_COD=
E, BPP, FOURCC)      \
> > > > > > > > > +{                                                       =
             \
> > > > > > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,    =
               \
> > > > > > > > > +     .bit_width      =3D BIT_WIDTH,                     =
               \
> > > > > > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,     =
               \
> > > > > > > > > +     .bpp            =3D BPP,                           =
               \
> > > > > > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,         =
               \
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > >  static const struct tegra_video_format tegra20_video_for=
mats[] =3D {
> > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > > > > > +     /* YUV422 */
> > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY=
),
> > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY=
),
> > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV=
),
> > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU=
),
> > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV4=
20),
> > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU4=
20),
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > >
> > > >
> > > >
> > > >
> >
> >
> >
> >


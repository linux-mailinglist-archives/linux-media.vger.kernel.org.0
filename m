Return-Path: <linux-media+bounces-43047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7AEB996B6
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 12:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F6614A67B3
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 10:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565F42DD61E;
	Wed, 24 Sep 2025 10:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBuksr15"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7692D8DDB
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758709470; cv=none; b=WUKkLoW7Mo76D3uHYR2FyX6s5597D/wVXVwRDYwSfqKUDcHyNxz62/Al9GtQU6I0r6QvPnUfiaoWj8kd9/0HpKIXr7v+nD8IdyeJIM6ZvPwM+LQOMaM60K3+v/AnxQAVPFSTrzqTfABPLLRl+zrXYpyb9BZvTV56soCJO6LG//4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758709470; c=relaxed/simple;
	bh=i5LHq117p+4hrpkADwkBaxhJZmGT9lfX9VFZYYyAOKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lq81rpEXSkx2gQVMJv2+5uXfPTRJ6PA+qOJzs2mISJsSamsYl+MZObbKChyjBcQsNQ1ugGSC9WzVPCRhPjummPBhrHvLdaH4BpK5pvc+Ukyl17NaR8RIlPd3SIIrnPLR9b4LDrna+kjEB83a/eVRzEd/l2IHNvZblbnGjCwAO3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBuksr15; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so7254915e9.1
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 03:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758709463; x=1759314263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gretcwQnpDGCPakc5QSs/CMgn/W8WOTF+w/mEf//2Ng=;
        b=GBuksr15lmZte3xsgwDzT6Baka3dd/EqUvE215z+hdlBKeCG7tshDw9lI3btTQCcfq
         n2hEDTv8x8Y2vxTggSp0SHBjuqU+/5atA7iHa0lmtyoAoERTd3N8w2mG2ml8hyA3SSDV
         HDWSYzwm6gHlH2DTqaDxu6ajdpKPZ3YwV/cJOzKjzDQOqWAasRaXRmwrJ49sLRmM067i
         DhhHc4842baJ9clOukv0MXNjyYVUvWoNJE8eIorsxbV4vlFRAJAbksCnDbN69BLVk3+6
         1lgtxS7D4vNRWEdpaOc9X91bYrBsVl0w5MIa9E/pP+syRVNj2/RwgB95/N/vzAL6mhvT
         xkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709463; x=1759314263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gretcwQnpDGCPakc5QSs/CMgn/W8WOTF+w/mEf//2Ng=;
        b=hKRh4FJCiC17M4PvPfaaOrp5Mh05atZkVjed7MAXX3wTrBrybuQVDAjgE5U5aB6Cbv
         5XqDZsYCczZSOpvx7Dv2Qlw4BWQneoiMCbsB4G9qabNUIJpMrEmGAuqvWQNIs5zrNefe
         jbAgHiTk/GhJmk9G9srsgKkEeINU1Uv2972lfBzIqtr8xhhfHmF87+ORbRRV0rCn066q
         oRH6PxxKkPYcjidtWdqByN75wgV3Y7waVVfNpPX+RXgEqAAx5a9GgBwsR7+haoSTIzpz
         0zh0n+308u/ymXb1hLL1hxT9BbEgR1tfs7fCYinjc9FbQRFOS5sbYK2P4C8WMlJBEqSF
         8IiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxS3uOglKhKBM+HPbcquQ+tEGZ0QpIV5dxPJ6i3dauMC9kU79p69jJYXaFM+bT78g2YpyzI1DhdT2Mjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlFoL9GNx2mDQCCUdFMResIustBOVbme4GWNvLuSC3Vc7PfDd2
	iWSe/OrtTOJSMy8mt44UNppg6EnynF3Y0r65NlZuuD8fTDQHZ92shy/XvaS9hJLIS1bYRsmn1o+
	5HloZqt7j4KztuYb8osraRvRzfm4zYIk=
X-Gm-Gg: ASbGncvKV5ib9Q+OT/vMhG0+nyojT/iDwace9dhwHWdtoq/2IKSK7d+lCJwEsKHm28M
	o5Xm/B6Z20+U/cvhObvkV7nPk8AkkVHD157tOtaU++qUC+79FX+7daIxKjusrSk8eaOTOGgEzk0
	vwIp8GCJWdrV8I3EUOILOQa5j+RyHgzJ1/r1modXeznQ7BtoGnwF2pUWZC7pJNKQ+fRJVTUvgcy
	1VoBFbe
X-Google-Smtp-Source: AGHT+IHjFfiQ0vFg6GDDmmZaYrl4EZIptvfqVeJXSPQCbu5XhQPmz0hwGG4YWWtv2EPc4iQc6+UXclQNcq+eGjUcSaw=
X-Received: by 2002:a05:600c:1d25:b0:46e:1a14:a81b with SMTP id
 5b1f17b1804b1-46e1dace319mr69712765e9.36.1758709462784; Wed, 24 Sep 2025
 03:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <CAPVz0n2iRVBf0+BwdV6Le2FhY8xERqbtsyeff26Dh44mKsTy6A@mail.gmail.com>
 <CAPVz0n1YDdM+EtuO72CNqVE0opJLt5KfONNGenuSKO678mfc4Q@mail.gmail.com> <16036554.JCcGWNJJiE@senjougahara>
In-Reply-To: <16036554.JCcGWNJJiE@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 24 Sep 2025 13:24:11 +0300
X-Gm-Features: AS18NWBbjZsnZ9m5cz51nVTPHxnoDTX2--cXA-awWwC7Lpn9huoFN8H21FzrPo8
Message-ID: <CAPVz0n0HmYAF8=1q6jQCuWn0pmcwqAzNTNfPh0kvJ_BiLByP1Q@mail.gmail.com>
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

=D1=81=D1=80, 24 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 07:47 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, September 23, 2025 3:50=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 23 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:11 =
Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > =D0=B2=D1=82, 23 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:0=
4 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Monday, September 22, 2025 4:36=E2=80=AFPM Svyatoslav Ryhel wrot=
e:
> > > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE =
10:27 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > >
> > > > > > On Monday, September 22, 2025 3:30=E2=80=AFPM Svyatoslav Ryhel =
wrote:
> > > > > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=
=BE 09:23 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > > > >
> > > > > > > > On Monday, September 22, 2025 2:13=E2=80=AFPM Svyatoslav Ry=
hel wrote:
> > > > > > > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80.=
 =D0=BE 07:44 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > > > > > > > >
> > > > > > > > > > On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatos=
lav Ryhel wrote:
> > > > > > > > > > > Simplify format align calculations by slightly modify=
ing supported formats
> > > > > > > > > > > structure.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/staging/media/tegra-video/tegra20.c | 41 +++=
+++++-------------
> > > > > > > > > > >  1 file changed, 16 insertions(+), 25 deletions(-)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/staging/media/tegra-video/tegra2=
0.c b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > > > index 6e0b3b728623..781c4e8ec856 100644
> > > > > > > > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(st=
ruct v4l2_pix_format *pix, unsigned int bpp)
> > > > > > > > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_=
WIDTH,  TEGRA20_MAX_WIDTH);
> > > > > > > > > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_=
HEIGHT, TEGRA20_MAX_HEIGHT);
> > > > > > > > > > >
> > > > > > > > > > > -     switch (pix->pixelformat) {
> > > > > > > > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > > > > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > > > > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > > > > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > > > > > > > -             pix->bytesperline =3D roundup(pix->widt=
h, 2) * 2;
> > > > > > > > > > > -             pix->sizeimage =3D roundup(pix->width, =
2) * 2 * pix->height;
> > > > > > > > > > > -             break;
> > > > > > > > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > > > > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > > > > > > > -             pix->bytesperline =3D roundup(pix->widt=
h, 8);
> > > > > > > > > > > -             pix->sizeimage =3D roundup(pix->width, =
8) * pix->height * 3 / 2;
> > > > > > > > > > > -             break;
> > > > > > > > > > > -     }
> > > > > > > > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width *=
 bpp, 8);
> > > > > > > > > >
> > > > > > > > > > Assuming the bpp is coming from the format table below,=
 this changes the value of bytesperline for planar formats. With this it'll=
 be (width * 12) / 8 i.e. width * 3/2, which doesn't sound right.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Downstream uses soc_mbus_bytes_per_line for this calculat=
ion which was
> > > > > > > > > deprecated some time ago, here is a fragment
> > > > > > > > >
> > > > > > > > > s32 soc_mbus_bytes_per_line(u32 width, const struct soc_m=
bus_pixelfmt *mf)
> > > > > > > > > {
> > > > > > > > >  if (mf->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> > > > > > > > >  return 0;
> > > > > > > > >
> > > > > > > > >  if (mf->layout !=3D SOC_MBUS_LAYOUT_PACKED)
> > > > > > > > >  return width * mf->bits_per_sample / 8;
> > > > > > > > >
> > > > > > > > >  switch (mf->packing) {
> > > > > > > > >  case SOC_MBUS_PACKING_NONE:
> > > > > > > > >   return width * mf->bits_per_sample / 8;
> > > > > > > > >  case SOC_MBUS_PACKING_2X8_PADHI:
> > > > > > > > >  case SOC_MBUS_PACKING_2X8_PADLO:
> > > > > > > > >  case SOC_MBUS_PACKING_EXTEND16:
> > > > > > > > >   return width * 2;
> > > > > > > > >  case SOC_MBUS_PACKING_1_5X8:
> > > > > > > > >   return width * 3 / 2;
> > > > > > > > >  case SOC_MBUS_PACKING_VARIABLE:
> > > > > > > > >   return 0;
> > > > > > > > >  }
> > > > > > > > >    return -EINVAL;
> > > > > > > > > }
> > > > > > > > >
> > > > > > > > > V4L2_PIX_FMT_YUV420 and V4L2_PIX_FMT_YVU420 are classifie=
d as
> > > > > > > > > SOC_MBUS_PACKING_1_5X8 hence we get width * 3/2
> > > > > > > >
> > > > > > > > Googling this brings up the entry
> > > > > > > >
> > > > > > > > {
> > > > > > > >         .code =3D V4L2_MBUS_FMT_YUYV8_1_5X8,
> > > > > > > >         .fmt =3D {
> > > > > > > >                 .fourcc                 =3D V4L2_PIX_FMT_YU=
V420,
> > > > > > > >                 .name                   =3D "YUYV 4:2:0",
> > > > > > > >                 .bits_per_sample                =3D 8,
> > > > > > > >                 .packing                        =3D SOC_MBU=
S_PACKING_1_5X8,
> > > > > > > >                 .order                  =3D SOC_MBUS_ORDER_=
LE,
> > > > > > > >                 .layout                 =3D SOC_MBUS_LAYOUT=
_PACKED,
> > > > > > > >         },
> > > > > > > > }
> > > > > > > >
> > > > > > > > which matches that you're describing. It doesn't make sense=
 to me, since it at the same time specifies PIX_FMT_YUV420 (which is planar=
 with 3 planes, as documented by include/uapi/linux/videodev2.h), and LAYOU=
T_PACKED
> > > > > > > >
> > > > > > > > /**
> > > > > > > >  * enum soc_mbus_layout - planes layout in memory
> > > > > > > >  * @SOC_MBUS_LAYOUT_PACKED:             color components pa=
cked
> > > > > > > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_U_V:      YUV components stor=
ed in 3 planes (4:2:2)
> > > > > > > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_C:        YUV components stor=
ed in a luma and a
> > > > > > > >  *                                      chroma plane (C pla=
ne is half the size
> > > > > > > >  *                                      of Y plane)
> > > > > > > >  * @SOC_MBUS_LAYOUT_PLANAR_Y_C:         YUV components stor=
ed in a luma and a
> > > > > > > >  *                                      chroma plane (C pla=
ne is the same size
> > > > > > > >  *                                      as Y plane)
> > > > > > > >  */
> > > > > > > > enum soc_mbus_layout {
> > > > > > > >         SOC_MBUS_LAYOUT_PACKED =3D 0,
> > > > > > > >         SOC_MBUS_LAYOUT_PLANAR_2Y_U_V,
> > > > > > > >         SOC_MBUS_LAYOUT_PLANAR_2Y_C,
> > > > > > > >         SOC_MBUS_LAYOUT_PLANAR_Y_C,
> > > > > > > > };
> > > > > > > >
> > > > > > > > i.e. non-planar. The code in the driver is handling it as t=
hree planes as well, with addresses VB0_BASE_ADDRESS/VB0_BASE_ADDRESS_U/VB0=
_BASE_ADDRESS_V. Since the planes are separate, there should be no need to =
have more than 'width' samples per line.
> > > > > > > >
> > > > > > >
> > > > > > > I did not invent this, I have just simplified this calculatio=
n from
> > > > > > > downstream, output values remain same. I have no cameras whic=
h can
> > > > > > > output V4L2_PIX_FMT_YUV420 or V4L2_PIX_FMT_YVU420 so I cannot=
 test if
> > > > > > > this works either. Other YUV and RAW formats were tested on r=
eal HW
> > > > > > > and work perfectly fine.
> > > > > >
> > > > > > My understanding from the code was, that the MEDIA_BUS_FMT_ for=
mats listed in the video format table refer to the input formats from the c=
amera, and the V4L2_PIX_FMT_ formats to output formats from VI. Hence VI co=
uld input UYVY8_2X8 and write to memory in YUV420. The code dealing with V4=
L2_PIX_FMT_ values seems to be related to the output to memory. Is it possi=
ble to test this (your camera -> VI converts to YUV420) or am I mistaken?
> > > > > >
> > > > >
> > > > > Camera I am testing with has no YUV420 options available and from=
 what
> > > > > I can tell there is no way to force VI to output in YUV420 unless
> > > > > camera supports it. Any format manipulations should requite hooki=
ng up
> > > > > ISP, or am I missing smth?
> > > >
> > > > From a quick look at the spec it looks to me like for YUV422 packed=
 input formats specifically, VI should be able to convert to YUV420. If tha=
t were not the case, e.g. 'TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, Y=
UV420),' would not make sense anyway as it's talking about both YUV422 pack=
ed input data and then also YUV420.
> > > >
> > >
> > > After additional checking you are correct, VI should be able to
> > > perform YUV442 to YUV440. One of the reasons why VI is not exposing
> > > YUV440 may be video-centric nature of the driver, so that it exposes
> > > only formats supported by camera and VI. I will double check which
> > > formats video device exposes. What should I test exactly?
> > >
>
> If you are able to test, I would like to see the following (with YUV422 i=
nput camera, VI set to output YUV420)
> (1) Output image is correct
> (2) Check output image bytes per line (e.g. with a hex editor)
> (3) If output image bytes per line is 3/2 * width, try changing it to 1 *=
 width and repeating test
>

1 * width is enough, 3/2 * width has just end of memory dump filled
with zeroes. I assume downstream is wrong in this aspect. Additionally
I was able to address YUV422 > YUV420 conversion. Existing YUV entries
have YUV 2X8 media bus formats which are not used by my camera, my
camera uses only YUV 1X16 media bus formats. So by adding those YU12
format appeared.

>
> > Alternatively, since code that I propose matches in output with one
> > that was before, changes can be applied and revised once there will be
> > such need. Especially, since YUV422 and RAW8/10 work fine and were
> > tested. I am not sure there will be many use cases which deliberately
> > target YUV420.
> >
>
> Yeah, since it's a pre-existing issue, that makes sense. However, I'd sti=
ll add a comment to the bytes per line calculation with a reference to the =
downstream code it's based on, and that it produces an unexpected 3/2 * wid=
th for YUV420.
>

I assume since I am applying expected and correct value, no additional
comments would be required within code, but I will add a note to
commit description.

> Mikko
>
> > > > >
> > > > > > It's certainly possible that the current code is functional -- =
if bytesperline is set to a too large value and that information flows to u=
serspace, it could still read the buffer. It would just waste memory.
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > > +     pix->sizeimage =3D pix->bytesperline * pix->hei=
ght;
> > > > > > > > > > >  }
> > > > > > > > > > >
> > > > > > > > > > >  /*
> > > > > > > > > > > @@ -576,20 +564,23 @@ static const struct tegra_vi_op=
s tegra20_vi_ops =3D {
> > > > > > > > > > >       .vi_stop_streaming =3D tegra20_vi_stop_streamin=
g,
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)   =
 \
> > > > > > > > > > > -{                                                   =
 \
> > > > > > > > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,        =
   \
> > > > > > > > > > > -     .bpp     =3D BPP,                              =
   \
> > > > > > > > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,            =
   \
> > > > > > > > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS=
_CODE, BPP, FOURCC)      \
> > > > > > > > > > > +{                                                   =
                 \
> > > > > > > > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,=
                   \
> > > > > > > > > > > +     .bit_width      =3D BIT_WIDTH,                 =
                   \
> > > > > > > > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE, =
                   \
> > > > > > > > > > > +     .bpp            =3D BPP,                       =
                   \
> > > > > > > > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,     =
                   \
> > > > > > > > > > >  }
> > > > > > > > > > >
> > > > > > > > > > >  static const struct tegra_video_format tegra20_video=
_formats[] =3D {
> > > > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > > > > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > > > > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > > > > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > > > > > > > +     /* YUV422 */
> > > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, =
UYVY),
> > > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, =
VYUY),
> > > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, =
YUYV),
> > > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, =
YVYU),
> > > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, =
YUV420),
> > > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, =
YVU420),
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > > > > > > > > >


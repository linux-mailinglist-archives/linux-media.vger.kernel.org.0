Return-Path: <linux-media+bounces-42898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E8BB8F507
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 09:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1D2E189EC08
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 07:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDE72F6198;
	Mon, 22 Sep 2025 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQGIOCZi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81612F5A17
	for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 07:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758526619; cv=none; b=RslG2f6KTJmehLhKG8Qe4iMh7DPNYCp5aeSaMCDwhinf25Ys2Z2rG6ALu60BplcNT7oCF+bxfYROJi/NfkcLGwGa6tHKsaxTfkdMe23InSJzmOZRYPWjOzUpReN0cSrn8VefHk+gZdkcmnqMwPyZ4MMH9APIM0xiziUqaaJNnFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758526619; c=relaxed/simple;
	bh=aOyTQYZuDWlPt0S+jrgAOD98xMe9oFqP1/5VVHR8G98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSmT1+UI9JW6UCtxYbYtn6YLt0jy938PLsgiDQYtZDtGUg/7OkeVhU/Us0Z3fbu8Gk7BMWA/nFIj9T5kZRigbT2DoZsNX5m9GxTPF3dZV6avqH7mKcWK6qhS/WHFvGlm5pVO4QLhX88m5wX4cmUL/xUIvuB/AHsb29kZ+D7KT3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQGIOCZi; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3fa528f127fso556600f8f.1
        for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758526614; x=1759131414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQTiutALUjkpQjQ6uKKs077crH4fXFWsk2vBwe4NujY=;
        b=QQGIOCZiN0ERDkQxqpQ+JB6btRHGCJB0bePmB/2LiLTMWFhwix5GolXG/M68dG++Bj
         hzOiq6Ybo5j4+kPmGFYGYggXdsoqtPplAl6S2Fg6sDl0oGkJwUtHhltUEMYyJQPlyIVH
         g5MGahbLvo9wnmmj7jwGvk5+PEFceoii1ii3sSHlkYDTZwVGucJhIHX2gjDYfRnZAlN0
         0/miRPBQt62QTTg+Fu5i2/DEzZTPZ9xmCNiCcLA0wwIeNHsm9ubRhkJNg2qplNCoEd7g
         NNTrrSKhMm4R1TTvwZM+1yeJzU0NjyuVPJ9p7c8xsPf06IN0JMUgcn6loqNlBzKtga3q
         iqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758526614; x=1759131414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQTiutALUjkpQjQ6uKKs077crH4fXFWsk2vBwe4NujY=;
        b=IezYjE6B2XiprpsHF/dV84W6k+NB84B7qWIBLSmAa++KONu3L9H4iHuxVcy1yY4vVF
         bauInaGq51o+EVBMZIUXK+ici/6zU4RMJ7YaUpuoPdVz2pdDMbceHNpxOrVrIyduVScT
         rsyL5Ji9ULPuvwC9VLHDhjwSsFEEywv9Xv7/+l/9xYdVOMipISp/qyqCyqsfwKArlcQ5
         SnWdQszd59skFtxXn62GywqA07hzPqblB06XIZwOxLVfkhSI4jwbgj1UjNwzhiummiI1
         xGlYXvDQhC76WiSalAYA5KHynGyAHx2nmE14LFJzN4+xd1fiLS/9GilBqSNPdPiZ7BNh
         UD5A==
X-Forwarded-Encrypted: i=1; AJvYcCW8X+ZL5SXiwBvphBmlXXstGWGrsZiTDVAGJxI/FQFBP/EacfDCzl/Indgny0OYEQxtXlFC5UHR5rBELA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1770Usw+o5J/yHG4XhOlJNipQgt3kq4bHF5L+8oZQl0ZYng1w
	AKGwI/Y7277mleebwrf8prEU6EotEewACYyhCI5zu+FwgOLpVwkkBGBZ4Yf+uBoMh2RsT+F8xIt
	nGE3+26Qsg8JHYfmxwuzCaT6Fu/feKiA=
X-Gm-Gg: ASbGncsq9yEL7R74CDQjZVw8qcHje/KkliTNQTrsEdOKQJKH0Mn3XkHiaEJsLLSXEjW
	vwuaKHl0/eOlq1alB2r2/v1N12XHs2B2Gc22WHMFK3ARuYNkgRP9SVMmjbvMgFFK+L2UV1CZOIv
	EIMuNVGtbRrb0T0I8dR6D/pt78dZBNjDf+/eFe3UDtMfzsaLReEiJ+QMRzguxaAkwsHqjQI5UOk
	DOzdJhh
X-Google-Smtp-Source: AGHT+IG2SLbXARRu0t168HLsZz/v53XcB1wJ8Ft52VtbeB5V4oYB8nfGA5hMzmF2UiZq9koPPs+A0RRL4rJK+tjvmts=
X-Received: by 2002:a5d:5f87:0:b0:3ec:42f9:953e with SMTP id
 ffacd0b85a97d-3edd43b5c0dmr15773738f8f.7.1758526613972; Mon, 22 Sep 2025
 00:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <4198615.hdfAi7Kttb@senjougahara>
 <CAPVz0n0TPKa2cVXZdUEAWWHquGeqzj=p-9cXx79jc6RwXLkkGg@mail.gmail.com> <3074302.Sgy9Pd6rRy@senjougahara>
In-Reply-To: <3074302.Sgy9Pd6rRy@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 22 Sep 2025 10:36:42 +0300
X-Gm-Features: AS18NWCN3qDh6Art7Go1S1L6w234Yc5WBRcSNsroEE7Na7Xcr_-CeAzzooRElaI
Message-ID: <CAPVz0n1ozJ13MB4eFMAJzESe8iQ7SKjMApZCLFAZ_eubCFs0tg@mail.gmail.com>
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

=D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 10:27 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Monday, September 22, 2025 3:30=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:23 =
Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Monday, September 22, 2025 2:13=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 07=
:44 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel =
wrote:
> > > > > > Simplify format align calculations by slightly modifying suppor=
ted formats
> > > > > > structure.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++-----=
--------
> > > > > >  1 file changed, 16 insertions(+), 25 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/driv=
ers/staging/media/tegra-video/tegra20.c
> > > > > > index 6e0b3b728623..781c4e8ec856 100644
> > > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_=
pix_format *pix, unsigned int bpp)
> > > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TE=
GRA20_MAX_WIDTH);
> > > > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TE=
GRA20_MAX_HEIGHT);
> > > > > >
> > > > > > -     switch (pix->pixelformat) {
> > > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > > -             pix->bytesperline =3D roundup(pix->width, 2) * 2;
> > > > > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 * p=
ix->height;
> > > > > > -             break;
> > > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > > > > -             pix->sizeimage =3D roundup(pix->width, 8) * pix->=
height * 3 / 2;
> > > > > > -             break;
> > > > > > -     }
> > > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8);
> > > > >
> > > > > Assuming the bpp is coming from the format table below, this chan=
ges the value of bytesperline for planar formats. With this it'll be (width=
 * 12) / 8 i.e. width * 3/2, which doesn't sound right.
> > > > >
> > > >
> > > > Downstream uses soc_mbus_bytes_per_line for this calculation which =
was
> > > > deprecated some time ago, here is a fragment
> > > >
> > > > s32 soc_mbus_bytes_per_line(u32 width, const struct soc_mbus_pixelf=
mt *mf)
> > > > {
> > > >  if (mf->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> > > >  return 0;
> > > >
> > > >  if (mf->layout !=3D SOC_MBUS_LAYOUT_PACKED)
> > > >  return width * mf->bits_per_sample / 8;
> > > >
> > > >  switch (mf->packing) {
> > > >  case SOC_MBUS_PACKING_NONE:
> > > >   return width * mf->bits_per_sample / 8;
> > > >  case SOC_MBUS_PACKING_2X8_PADHI:
> > > >  case SOC_MBUS_PACKING_2X8_PADLO:
> > > >  case SOC_MBUS_PACKING_EXTEND16:
> > > >   return width * 2;
> > > >  case SOC_MBUS_PACKING_1_5X8:
> > > >   return width * 3 / 2;
> > > >  case SOC_MBUS_PACKING_VARIABLE:
> > > >   return 0;
> > > >  }
> > > >    return -EINVAL;
> > > > }
> > > >
> > > > V4L2_PIX_FMT_YUV420 and V4L2_PIX_FMT_YVU420 are classified as
> > > > SOC_MBUS_PACKING_1_5X8 hence we get width * 3/2
> > >
> > > Googling this brings up the entry
> > >
> > > {
> > >         .code =3D V4L2_MBUS_FMT_YUYV8_1_5X8,
> > >         .fmt =3D {
> > >                 .fourcc                 =3D V4L2_PIX_FMT_YUV420,
> > >                 .name                   =3D "YUYV 4:2:0",
> > >                 .bits_per_sample                =3D 8,
> > >                 .packing                        =3D SOC_MBUS_PACKING_=
1_5X8,
> > >                 .order                  =3D SOC_MBUS_ORDER_LE,
> > >                 .layout                 =3D SOC_MBUS_LAYOUT_PACKED,
> > >         },
> > > }
> > >
> > > which matches that you're describing. It doesn't make sense to me, si=
nce it at the same time specifies PIX_FMT_YUV420 (which is planar with 3 pl=
anes, as documented by include/uapi/linux/videodev2.h), and LAYOUT_PACKED
> > >
> > > /**
> > >  * enum soc_mbus_layout - planes layout in memory
> > >  * @SOC_MBUS_LAYOUT_PACKED:             color components packed
> > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_U_V:      YUV components stored in 3 pl=
anes (4:2:2)
> > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_C:        YUV components stored in a lu=
ma and a
> > >  *                                      chroma plane (C plane is half=
 the size
> > >  *                                      of Y plane)
> > >  * @SOC_MBUS_LAYOUT_PLANAR_Y_C:         YUV components stored in a lu=
ma and a
> > >  *                                      chroma plane (C plane is the =
same size
> > >  *                                      as Y plane)
> > >  */
> > > enum soc_mbus_layout {
> > >         SOC_MBUS_LAYOUT_PACKED =3D 0,
> > >         SOC_MBUS_LAYOUT_PLANAR_2Y_U_V,
> > >         SOC_MBUS_LAYOUT_PLANAR_2Y_C,
> > >         SOC_MBUS_LAYOUT_PLANAR_Y_C,
> > > };
> > >
> > > i.e. non-planar. The code in the driver is handling it as three plane=
s as well, with addresses VB0_BASE_ADDRESS/VB0_BASE_ADDRESS_U/VB0_BASE_ADDR=
ESS_V. Since the planes are separate, there should be no need to have more =
than 'width' samples per line.
> > >
> >
> > I did not invent this, I have just simplified this calculation from
> > downstream, output values remain same. I have no cameras which can
> > output V4L2_PIX_FMT_YUV420 or V4L2_PIX_FMT_YVU420 so I cannot test if
> > this works either. Other YUV and RAW formats were tested on real HW
> > and work perfectly fine.
>
> My understanding from the code was, that the MEDIA_BUS_FMT_ formats liste=
d in the video format table refer to the input formats from the camera, and=
 the V4L2_PIX_FMT_ formats to output formats from VI. Hence VI could input =
UYVY8_2X8 and write to memory in YUV420. The code dealing with V4L2_PIX_FMT=
_ values seems to be related to the output to memory. Is it possible to tes=
t this (your camera -> VI converts to YUV420) or am I mistaken?
>

Camera I am testing with has no YUV420 options available and from what
I can tell there is no way to force VI to output in YUV420 unless
camera supports it. Any format manipulations should requite hooking up
ISP, or am I missing smth?

> It's certainly possible that the current code is functional -- if bytespe=
rline is set to a too large value and that information flows to userspace, =
it could still read the buffer. It would just waste memory.
>
> >
> > > >
> > > > > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > > > > >  }
> > > > > >
> > > > > >  /*
> > > > > > @@ -576,20 +564,23 @@ static const struct tegra_vi_ops tegra20_=
vi_ops =3D {
> > > > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > > > >  };
> > > > > >
> > > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > > > -{                                                    \
> > > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > > > > -     .bpp     =3D BPP,                                 \
> > > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP=
, FOURCC)      \
> > > > > > +{                                                             =
       \
> > > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,          =
         \
> > > > > > +     .bit_width      =3D BIT_WIDTH,                           =
         \
> > > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,           =
         \
> > > > > > +     .bpp            =3D BPP,                                 =
         \
> > > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,               =
         \
> > > > > >  }
> > > > > >
> > > > > >  static const struct tegra_video_format tegra20_video_formats[]=
 =3D {
> > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > > +     /* YUV422 */
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > > > > >  };
> > > > > >
> > > > > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > >
> > >
> > >
> > >
>
>
>
>


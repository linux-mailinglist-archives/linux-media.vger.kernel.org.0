Return-Path: <linux-media+bounces-39483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AABE3B21AC8
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 04:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D88A3ADC52
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 02:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705322D97BF;
	Tue, 12 Aug 2025 02:31:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236CB311C02;
	Tue, 12 Aug 2025 02:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754965889; cv=none; b=mVK8thlUFhpUncyAB2Hvps42na9FAtlvLkEs/Jc6wpYctzupZ+o2KNPhtDwU6mh9DQg9Se5RWHwkYvBPwPPokAgiC0YJFPJ3jJuMdupx4qOACadMgmSAAigyUeyDoOkvFf7NQKh3GHAhnfTCMTYltXAbeKM+/8u2tuy+jLcOeZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754965889; c=relaxed/simple;
	bh=QU3UBbRkyYoq2ff/+rRNJ/oHK1mbbzN5+5iXiBKolJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAKz9ccXXOQ/DbN1ltesNysaNJ/XNRzNIIHY7o6IwCwYaUWxHe1w1By/UVPwJehd3yGjZycQt/U5wUim3Gz0ntJk5TmuUbD6PeMimkaa0Wq9Lg4iVRSj6xPBJswxaXVTGsABSc7mNVI3a1c3EzFAAfa7N7BzvhL9tS+Ef8Q45/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af925cbd73aso952141266b.1;
        Mon, 11 Aug 2025 19:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754965885; x=1755570685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47wXFH/mF2GbpAeMoWSuZbZJWSqZQr2mIeTg2QUMF9Y=;
        b=bIzS1ZE62mPA3N3NBdIIcpWwyJM+GnrsBAI0Ljr0bHfdkzehl1c9Q/ftjbCtyUc3Co
         II0nu5a+5D2BMwqmfJDqmdHUfzx4I15yDQ7nc5lDp0MmX6Q9CZ4yW5QhfxLen0TvAxYI
         BjbifvE+CHmQxnF/qjlhnQq31V/v78WqbxTdgVSt3n/sjMcvfHl/1xm7LvrCP9tgDkS9
         geibWY+XWjSmUR7LASBxWB1X9b6typ3M1fLIUWBM9U3w0hbznaKGHzg/JmYMnwZ8zTqC
         HMU7CvEtUbxDWZfrLPng3jXSruwGxEqkqK/pfrCZnMbbqe4SOryQatWcktSgZPvxm1oV
         K7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPUm2dj8fuhDTBH/JF4TBrIcbCUmYmrJEoIhyFVzyfjeHxpMu0ltuvOfXLKk2RsGkfJmil3IjZ0/LVA04R@vger.kernel.org, AJvYcCWW2zbDOn+JVurEptgrk20UGnRBFF0vLc5MrJ4ePyA6RijIiwiDVQBMLfIk4km/nH09yk6KpBAKDJQx@vger.kernel.org, AJvYcCXYbGJ59WznF+AJ3f8kWzFkHjnSnQo59gSpdYkXWypt7VvmXXyjU+vYcnGXEQXZp6vkXOFOoGENFTdXyMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHprXI7JASFEnjcg51J1Sl50ZgCUc2qWR+jpxWnj5fS+iAcNx7
	6BNzHFuWpEhcuPtTNdaOmTaoxrnLEJWElq3GSjknMuKveLlb7x69q+hnR9CRNQhd9jI=
X-Gm-Gg: ASbGncsLLhUwY/r5drAzaWxsIJJeuVRtWbeZzOeVNx5IHJJrbrJjYrjL3kxotBmpHL3
	AzGthQ0/la3RBBYMmazVa5Gssw2jszWx2UDyUeN8fe29m+AeSDxHDGv9NwIyn8r5vEKpnlDZEGg
	qClKnKsDvXsAnXi8ETuZT44dXBVez4daoQ+GdzBQQJo7vYJcVlpujXtYqybiRLV4ZZ9TkNkrLDf
	vlEqgmjz+wqbchjRiGaeSK3abvmLsm/02MK38cBcshklveorYim5VoygZlEsLSsnYrZTxGZrQdu
	ThQ9wKT1/iaLjrCKx9sXx2nZsZ5OBPT/nOoNperdxN5+Yx8hRqyY2sSCHQCozeEGQ1NmW3wTMwR
	NkwCdWregpcJFuw+g+mdNnXe1oBIh51vtyo+G42Ft2MY5wPd1mD4Z56DcyA==
X-Google-Smtp-Source: AGHT+IHy0W+3ccYD/4YrvdOwFZrMDAzdKJ+XHFMzlM8W44MKHad5+bkX0bI8amnZquLuUlFQkJ2ilA==
X-Received: by 2002:a17:906:6a0f:b0:af9:479b:8caf with SMTP id a640c23a62f3a-afa1e1fb747mr129941966b.51.1754965885106;
        Mon, 11 Aug 2025 19:31:25 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af92a2ec9cbsm2009413166b.79.2025.08.11.19.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 19:31:24 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-617b36cc489so9757814a12.0;
        Mon, 11 Aug 2025 19:31:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUm6sViYYBJwDCcGURzuIhETj9Mfcc6LmZum8nAxjBErMbtS2DsMW0tWAtEO/QodyFxXSYT8OnCEPR2Owg=@vger.kernel.org, AJvYcCW3yN2hNA9LGMwLmpmcMhjZwjW2sF6DlHo28xlbVbEIan8PhKFizkWQ4qrAktdGcOR+QknJ8JaM+nLy89Ad@vger.kernel.org, AJvYcCXsYu5YOo46Re8QdyDwEgTzTIVO4izhPqOCvDhrQc/Zp9zKUSpDBLa9GhYFI69lMqp7x+GR6ObW/kmu@vger.kernel.org
X-Received: by 2002:a05:6402:1d4a:b0:615:8ab1:9c92 with SMTP id
 4fb4d7f45d1cf-6184ec7f671mr972927a12.21.1754965884455; Mon, 11 Aug 2025
 19:31:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-5-will@willwhang.com>
 <CAPY8ntATfq=yqoYkpuD5Ga-7yUb8C-_k=wSZJBpz0p9PLjVk0w@mail.gmail.com>
In-Reply-To: <CAPY8ntATfq=yqoYkpuD5Ga-7yUb8C-_k=wSZJBpz0p9PLjVk0w@mail.gmail.com>
From: Will Whang <will@willwhang.com>
Date: Mon, 11 Aug 2025 19:31:13 -0700
X-Gmail-Original-Message-ID: <CAFoNnrzHhJVbR1yQrr6o1+1JhyDB6y0NNfyJkK=by9YOJRGusQ@mail.gmail.com>
X-Gm-Features: Ac12FXxo2zIEu3DKLJ0MfSYHCGQBlJP-gsnvq9FZJ8JMtsN4IWIq_9lAHNai2po
Message-ID: <CAFoNnrzHhJVbR1yQrr6o1+1JhyDB6y0NNfyJkK=by9YOJRGusQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] media: docs: Add userspace-API guide for the
 IMX585 driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,
Reply inline.
Thanks,
Will Whang

On Mon, Aug 11, 2025 at 7:24=E2=80=AFAM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Will
>
> Thanks for the patches.
>
> On Sun, 10 Aug 2025 at 23:11, Will Whang <will@willwhang.com> wrote:
> >
> > The new IMX585 V4L2 sub-device driver introduces several
> > driver-specific controls for configuring Clear-HDR blending,
> > gradation compression thresholds, and HCG enabling.  This patch adds
> > an rst document under Documentation/userspace-api/media/drivers/
> > that details each control, allowed values, and their effects.
> >
> > Signed-off-by: Will Whang <will@willwhang.com>
> > ---
> >  .../userspace-api/media/drivers/imx585.rst    | 122 ++++++++++++++++++
> >  .../userspace-api/media/drivers/index.rst     |   1 +
> >  MAINTAINERS                                   |   1 +
> >  3 files changed, 124 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/drivers/imx585.rs=
t
> >
> > diff --git a/Documentation/userspace-api/media/drivers/imx585.rst b/Doc=
umentation/userspace-api/media/drivers/imx585.rst
> > new file mode 100644
> > index 000000000..9f7c16f30
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/drivers/imx585.rst
> > @@ -0,0 +1,122 @@
> > +.. SPDX-License-Identifier: GPL-2.0-only
> > +
> > +Sony IMX585 driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The IMX585 image-sensor driver provides the following *driver-specific=
*
> > +V4L2 controls.  They are visible only when the IMX585 driver is loaded
> > +and sit in the sensor-private control class.
> > +
> > +HDR data blending
> > +-----------------
> > +
> > +``V4L2_CID_IMX585_HDR_DATASEL_TH``  (``U16[2]``)
> > +    Lower/upper **thresholds** (0 =E2=80=93 4095) that decide which ex=
posure is
> > +    chosen=E2=80=94or blended=E2=80=94for each pixel in Clear-HDR mode=
.
> > +
> > +``V4L2_CID_IMX585_HDR_DATASEL_BK``  (menu)
> > +    **Blending ratio** between the long-gain (LG) and
> > +    high-gain (HG) read-outs.
> > +
> > +    .. flat-table::
> > +       :stub-columns: 0
> > +       :widths: 1 5
> > +
> > +       * - ``0``
> > +         - HG =C2=BD, LG =C2=BD
> > +       * - ``1``
> > +         - HG =C2=BE, LG =C2=BC
> > +       * - ``2``     # duplicate ratio present in the datasheet
> > +         - HG =C2=BD, LG =C2=BD
> > +       * - ``3``
> > +         - HG =E2=85=9E, LG =E2=85=9B
> > +       * - ``4``
> > +         - HG 15=E2=81=8416, LG 1=E2=81=8416
> > +       * - ``5``     # second 50/50 entry as documented
> > +         - **2=E2=81=BF=E1=B5=88** HG =C2=BD, LG =C2=BD
> > +       * - ``6``
> > +         - HG 1=E2=81=8416, LG 15=E2=81=8416
> > +       * - ``7``
> > +         - HG =E2=85=9B, LG =E2=85=9E
> > +       * - ``8``
> > +         - HG =C2=BC, LG =C2=BE
> > +
> > +Gradation compression
> > +---------------------
> > +
> > +``V4L2_CID_IMX585_HDR_GRAD_TH``  (``U32[2]``)
> > +    17-bit **break-points** (0 =E2=80=93 0x1ffff) that shape the 16-bi=
t
> > +    gradation-compression curve.
> > +
> > +``V4L2_CID_IMX585_HDR_GRAD_COMP_L``  (menu)
> > +    See V4L2_CID_IMX585_HDR_GRAD_COMP_H
> > +
> > +``V4L2_CID_IMX585_HDR_GRAD_COMP_H``  (menu)
> > +    **Compression ratios** below the first break-point and between the
> > +    two break-points, respectively.
> > +
> > +    .. flat-table::
> > +        :stub-columns: 0
> > +        :widths: 1 4
> > +
> > +        * - ``0``
> > +          - 1 : 1
> > +        * - ``1``
> > +          - 1 : 2
> > +        * - ``2``
> > +          - 1 : 4   *(default for COMP_L)*
> > +        * - ``3``
> > +          - 1 : 8
> > +        * - ``4``
> > +          - 1 : 16
> > +        * - ``5``
> > +          - 1 : 32
> > +        * - ``6``
> > +          - 1 : 64  *(default for COMP_H)*
> > +        * - ``7``
> > +          - 1 : 128
> > +        * - ``8``
> > +          - 1 : 256
> > +        * - ``9``
> > +          - 1 : 512
> > +        * - ``10``
> > +          - 1 : 1024
> > +        * - ``11``
> > +          - 1 : 2048
> > +
> > +Gain settings
> > +-------------
> > +
> > +``V4L2_CID_IMX585_HDR_GAIN``  (menu)
> > +    **Additional gain** (in dB) applied to the high-gain path when
> > +    Clear-HDR is active.
> > +
> > +    .. flat-table::
> > +        :stub-columns: 0
> > +        :widths: 1 3
> > +
> > +        * - ``0``
> > +          - +0 dB
> > +        * - ``1``
> > +          - +6 dB
> > +        * - ``2``
> > +          - +12 dB *(default)*
> > +        * - ``3``
> > +          - +18 dB
> > +        * - ``4``
> > +          - +24 dB
> > +        * - ``5``
> > +          - +29.1 dB
> > +
> > +``V4L2_CID_IMX585_HCG_GAIN``  (boolean)
>
> HCG stands for High Conversion Gain, so we've got Gain repeated in the na=
me.
>
> Spell it out as V4L2_CID_IMX585_HIGH_CONV_GAIN, or call it
> CONVERSION_GAIN and use an enum control?
>
> > +    Toggle **High-Conversion-Gain** mode.
> > +
> > +    *0 =3D LCG (default), 1 =3D HCG.*
>
> An HCG / LCG control would also be applicable for IMX290 [1], so it
> would be nice if this could be a generic control instead of imx585
> specific.
>
> I never got a good description as to the benefit HCG was meant to
> give. The datasheet for IMX290 says the conversion efficiency ratio
> between HCG and LCG is 2, but not why that is any better than adding
> 6dB of analog gain.
>
What I've learned is that HCG is actually a 2nd stage amplifier, so
instead of using one for high gain, you can split it into two lower
gain stages that lower the noise.
This is also why ClearHDR and HCG have the conflict, because it is
basically sampling after the 1st gain stage and 2nd gain stage as
High/Low gain images.

I have thought about making it more generic because IMX662 and IMX678
are going to be the next patch once this one passes that also has this
function (the two are basically stripped down versions from IMX585
that the driver can be adapted to easily). I intended for the upcoming
IMX662/IMX678 driver to use IMX585's V4L2 HCG control also.

But given that I'm new to Linux kernel developments, or more
specifically, V4L2, I really don't have an idea how to do so in a way
the patch will be accepted.
Or I can make this more generic name to replace IMX585 for STARVIS2,
for example: V4L2_CID_STARVIS2_HIGH_CONV_GAIN

> Sony's website [2] states
> "Sony=E2=80=99s Super High Conversion Gain technology is designed to ampl=
ify
> electrical signals immediately after the conversion from photons, when
> the noise levels are relatively low. In this way, it reduces the
> overall noise after amplification. As a result, lower-noise images,
> compared to conventional technology, can be captured even in a
> low-illuminance environment. Lower noise levels in images also help to
> enhance the accuracy in visual or AI-assisted image recognition."
> From that one would presume you'd always want it on (lower noise =3D
> good), unless needing the minimum exposure time and the image was
> already over-exposed.
> I'm guessing you have no additional information based on your description=
 text.
>
>   Dave
>
> [1] Also IMX327, IMX462, and IMX662 which are in the same family,
> IMX678 (ratio of 2.6), and quite probably most of the Sony Starvis or
> Starvis 2 ranges.
> [2] https://www.sony-semicon.com/en/technology/security/index.html
Yeah I think Starvis 2 series all have this capability.
>
> > +
> > +Notes
> > +-----
> > +
> > +* Controls are writable while streaming; changes take effect from the
> > +  next frame.
> > +* HDR-specific controls are hidden when HDR is disabled.
> > +* Inter-control dependencies are enforced by the driver.
> > diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Docu=
mentation/userspace-api/media/drivers/index.rst
> > index d706cb47b..87912acfb 100644
> > --- a/Documentation/userspace-api/media/drivers/index.rst
> > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > @@ -32,6 +32,7 @@ For more details see the file COPYING in the source d=
istribution of Linux.
> >         cx2341x-uapi
> >         dw100
> >         imx-uapi
> > +       imx585
> >         max2175
> >         npcm-video
> >         omap3isp-uapi
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 175f5236a..42e32b6ba 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23183,6 +23183,7 @@ M:      Will Whang <will@willwhang.com>
> >  L:     linux-media@vger.kernel.org
> >  S:     Maintained
> >  F:     Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
> > +F:     Documentation/userspace-api/media/drivers/imx585.rst
> >  F:     drivers/media/i2c/imx585.c
> >  F:     include/uapi/linux/imx585.h
> >
> > --
> > 2.39.5
> >
> >


Return-Path: <linux-media+bounces-41500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCECFB3F42B
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70A4C3B22B7
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 05:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7F92E1754;
	Tue,  2 Sep 2025 05:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktakt2pj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815B5274B31;
	Tue,  2 Sep 2025 05:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756789527; cv=none; b=j3Nf5Y7Lj5sZ0MoeD3NNucjDnoCx5rFGHSXxYs6h0CY7caisaOd6yusYm3YnNpE1JH0doeiTLPlAQY2t+iUzCmejQnsZecPvxg+pM7BkHcwdy7yhbMJDTMLJX+qqKY2P3qIA/vTMrqDipdz2fyQX1MbfKSXjhboiifCpGsNIbYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756789527; c=relaxed/simple;
	bh=vtfsb/s4s6Nsv/OIPvzrPK2PiISv3Kib0SJdMjxDr30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A39WlKtiHVeRVXpgs9FQ9rT2o38p56k3GEegjkuI0xi0RCPlzGa9065EUDN+3dywYdUbRAwzavkXesc/BwlEib/96okzZ8iC+kzJ4DUhBkNIbzb1a52spe7XwqhZpGoicNvHPdxm7m1CGW74axIamMUfDSe73VBlwx47R7wMWxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktakt2pj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso33162615e9.3;
        Mon, 01 Sep 2025 22:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756789524; x=1757394324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsvxK8OTvjy6mRY2UF8u2ijfI8Gfv3ds+RCWrhu9dI8=;
        b=ktakt2pjCk9dJjlZiU2STx+zn2K0ucJb6ELlYoCI6Es5E9FAe16h1H70NEl0B3+zRO
         swd1G6v/lOjYSwUgHTRQt0y8i+0S50BAbRHqQQlJElyHX6wlcnEM4RivEc7Jv3T6MMWj
         N9c5X8xK6lDQlFyRh3o2rZnnovhTf/ety6wB5PfYJPGMrzx15c6NZcAAQWE+DIKrmQEl
         RqiSkJkLo3v4ps6AtQMULrjQMlzicHtWpH1WhPc8WhdYjiJRhrwEWr1Aud3C2lzV4IBT
         FTrFU5+9Tl5fechhZfTjAvpDW8koOEaJDyD/KdyPubiff7Bs07bPQIdB8dXRJyqXlOz5
         Mc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756789524; x=1757394324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsvxK8OTvjy6mRY2UF8u2ijfI8Gfv3ds+RCWrhu9dI8=;
        b=Jm1HJ0+CXaRAgVZ8+h8WRnO5/hl0G4Us5oF5ndNcg43y+T+scYui2ZVZqWIM6pYyXn
         SDjPajVQqbVLw91TNJnmknsaMVtgCk5koYGFLKcwAN5svnyG9p0PRWBVhnntPSLpMFr2
         f9i+PZn/ujxYk84bxpMxoal+aI1lEakF679efwbaJklXzYdkJg0wzJpgFZXsMif9LK2c
         yxDK9VOg/JF+eR6l/qBZdlaR73tJHzJ4zfvPJfl6aNhQItLdavoP+3EUuCvlfuc8P2x8
         3fft4Gq42UpLcay5Srx059Y9OANglXey+82xKE/XGaUnHcsi5O011wraM0+s/sF2YQFe
         zrQA==
X-Forwarded-Encrypted: i=1; AJvYcCUkBGv+R4Nho2KTOB75WlXrTpMUUT5LYSlPvj2H8Q7OmLOKxgH8Bg3eA4naj+xuTJ19bYCrvxWynaEYvvD3@vger.kernel.org, AJvYcCUqrKw7biUm4f0xc4qZHIoITxnvMhAXOiiA/XqYUaWmKLhFJmeyYSKvVW11lR4DShEPwP6F9qKPtO4cHCY=@vger.kernel.org, AJvYcCVDE0DlZPZxLM5CPb+Jj03GlBHVtKfRAzjmtxZZSe1WPU4mu9GCNLynT7mBgH+3LJeSX4tHKm9dbv3Z@vger.kernel.org, AJvYcCVJ+1lbuyoR0DKOvkWWH+Lm67qRrc6qc7Z3GB0aFukLoqE4Bs0/pfUJ7PX+8OIno/+iNwBqYXZZPwEd@vger.kernel.org, AJvYcCWgz4knitNQRHGAJqEcafhbpfbkxAqOzNyyvPkMJj1WCF5U9DcLKogjvDCQHCQcgRfsSFxLMLxlnPxKWIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg5d9NDub9wcxBtnKaIM0xDaCGVM4IqJSPSa/M4nUJ2RH2l76R
	StCR4rzOlJsD90MeGMN7ZH/oaZX3pu/a9w4qclBA+Yb6S8PYJtSV0stY2lyqFeQGJwpOyCec46y
	dbYYGYcLfWZRVGawo2Sg5PdDi8lHKITE=
X-Gm-Gg: ASbGncsdqxf34lZ0rbBO+QrDCcVV+VOWspwVFE1yOkA7Vf4sY9WVoCRb8IxdeMvCndw
	SsghmtgufxFYX9ctQCOJX957jgZvbJ1TzCIQerQomUx+aClGts4qcNQjyrHmf/nYTE8C6MRWgQD
	GnuSrI54Mg8s+obMvZRs30Qww9aQVTh7k2sZMykDRSl5JSHwedB4PmTYl+S1XeT9d967q9nVKf1
	I+7lFNW
X-Google-Smtp-Source: AGHT+IFaLGWrhMd9gaUFsjIuhaYuop/TR0fhRThMUYmbG5VO5CB2x6zfi844hhIhJImP7arGJuqPWad7TwuKTeA/xGg=
X-Received: by 2002:a5d:5f95:0:b0:3d0:b3cc:c21c with SMTP id
 ffacd0b85a97d-3d1e06aff5bmr7629522f8f.55.1756789523601; Mon, 01 Sep 2025
 22:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-8-clamor95@gmail.com>
 <6948375.lOV4Wx5bFT@senjougahara>
In-Reply-To: <6948375.lOV4Wx5bFT@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Sep 2025 08:05:12 +0300
X-Gm-Features: Ac12FXyFWFQp9zyC-dC-muHX4hjhMNXKuUIlIfX1jsnphJFz8uYCWTVS01gjz_M
Message-ID: <CAPVz0n2dp7kdCWFLWQjQY+tGO_ayzxGW=zxx3FwX_yeeR9J2Bg@mail.gmail.com>
Subject: Re: [PATCH v1 07/19] staging: media: tegra-video: csi: parametrize
 MIPI calibration device presence
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 2 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 03:47 Mikko=
 Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Dedicated MIPI calibration block appears only in Tegra114, before Tegra=
114
> > all MIPI calibration pads were part of VI block.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/csi.c      | 12 +++++++-----
> >  drivers/staging/media/tegra-video/csi.h      |  1 +
> >  drivers/staging/media/tegra-video/tegra210.c |  1 +
> >  3 files changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/csi.c
> > b/drivers/staging/media/tegra-video/csi.c index 74c92db1032f..2f9907a20=
db1
> > 100644
> > --- a/drivers/staging/media/tegra-video/csi.c
> > +++ b/drivers/staging/media/tegra-video/csi.c
> > @@ -485,11 +485,13 @@ static int tegra_csi_channel_alloc(struct tegra_c=
si
> > *csi, if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> >               return 0;
> >
> > -     chan->mipi =3D tegra_mipi_request(csi->dev, node);
> > -     if (IS_ERR(chan->mipi)) {
> > -             ret =3D PTR_ERR(chan->mipi);
> > -             chan->mipi =3D NULL;
> > -             dev_err(csi->dev, "failed to get mipi device: %d\n", ret)=
;
> > +     if (csi->soc->has_mipi_calibration) {
> > +             chan->mipi =3D tegra_mipi_request(csi->dev, node);
>
> The way I would read 'soc->has_mipi_calibration' is that this device (CSI=
)
> contains the MIPI calibration hardware. I.e. the opposite of here. I woul=
d
> invert the logic and optionally call it e.g. 'internal_mipi_calib'.
>
> A cleaner way to do this might be to always call tegra_mipi_request et al=
. --
> on pre-Tegra114 SoCs this would just call back to the VI/CSI driver using=
 the
> callbacks registered in the MIPI driver as we discussed before. That way =
the
> CSI driver won't need separate code paths for SoCs with internal MIPI
> calibration and SoCs with the external MIPI calibration device.
>

So basically MIPI calibration device for Tegra20/Tegra30 has to be
created within CSI and when MIPI calibration is requested, CSI phandle
is used. Question: may I use a dedicated node for MIPI calibration
within CSI or it has to use CSI node itself? With dedicated node
configuration should be much simpler and can help avoiding probe of
entire.

> Cheers,
> Mikko
>
> > +             if (IS_ERR(chan->mipi)) {
> > +                     ret =3D PTR_ERR(chan->mipi);
> > +                     chan->mipi =3D NULL;
> > +                     dev_err(csi->dev, "failed to get mipi device:
> %d\n", ret);
> > +             }
> >       }
> >
> >       return ret;
> > diff --git a/drivers/staging/media/tegra-video/csi.h
> > b/drivers/staging/media/tegra-video/csi.h index 3ed2dbc73ce9..400b913bb=
1cb
> > 100644
> > --- a/drivers/staging/media/tegra-video/csi.h
> > +++ b/drivers/staging/media/tegra-video/csi.h
> > @@ -128,6 +128,7 @@ struct tegra_csi_soc {
> >       unsigned int num_clks;
> >       const struct tpg_framerate *tpg_frmrate_table;
> >       unsigned int tpg_frmrate_table_size;
> > +     bool has_mipi_calibration;
> >  };
> >
> >  /**
> > diff --git a/drivers/staging/media/tegra-video/tegra210.c
> > b/drivers/staging/media/tegra-video/tegra210.c index
> > da99f19a39e7..305472e94af4 100644
> > --- a/drivers/staging/media/tegra-video/tegra210.c
> > +++ b/drivers/staging/media/tegra-video/tegra210.c
> > @@ -1218,4 +1218,5 @@ const struct tegra_csi_soc tegra210_csi_soc =3D {
> >       .num_clks =3D ARRAY_SIZE(tegra210_csi_cil_clks),
> >       .tpg_frmrate_table =3D tegra210_tpg_frmrate_table,
> >       .tpg_frmrate_table_size =3D ARRAY_SIZE(tegra210_tpg_frmrate_table=
),
> > +     .has_mipi_calibration =3D true,
> >  };
>
>
>
>


Return-Path: <linux-media+bounces-18555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF8D98638F
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 17:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 428971C27666
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 15:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6A913B5AF;
	Wed, 25 Sep 2024 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etU5KFHl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746DE25757;
	Wed, 25 Sep 2024 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727277921; cv=none; b=UBDiNvBDhomYIIDvwpg2JMwvZhiE6LKWzjabYvPwyRg93K5ygiO+vXuxWxWmSdIG8Cq8MGE3c8gp7KLKGA9ezfqbyhASzehsAtQgqZEQv0KN1q6Odrh4vXXw4ou5aT0XLTlKsBIeqfU3x3m4g2upYtTfjnG1WWPJSPWDNZQthgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727277921; c=relaxed/simple;
	bh=/rg8lzY/L9SaJEfUUJfiiuMItn3SqcxpEq8hsR2vPO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBSx672mEknz1m8iVmFoCB9g9bmGNtcYZ1r7wQE2LtvtuSU+BfKpW8hwZlX+RviJF8HBVGDW1kUeUmx28kf4Mc8igFfvwbbegzUyfqt8duuTNCWZ+KGOMUAoi4XdP2qYvdzKAuxrlojtMwGrMhiewPk3spB0PvMuEgJlfGcqIas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etU5KFHl; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-49bbbebc26dso2344443137.0;
        Wed, 25 Sep 2024 08:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727277918; x=1727882718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xh/2EOs2WTw8AQzEyqJvYQT+wfQifYuKy9bTkOCzPg=;
        b=etU5KFHls/AQi12xnZireF/Bul4TeGc3/Zpff4oAti2Uet6y0XV6vVQss1O7rtLb+d
         XWOwzalINOdfF4Dy+7mu6D5sdIBDKSNCb+gVRbzwmlPkzHWb8KbDP9/TLRnOnPPV9ZaZ
         3YvLaClToFIRSJU80RG93mnHzyGUb+paS6GtrUf2iXYHwLjnqMOwVEPQbBYRBx4dJ/2c
         Ld1XsOgOvATr2FeDkzhh+Ghv0awgSw4QB1l7asw4DyzrcaSUa5HD4rNTNwKPw+YVza5z
         pVyoHerGAvcxAuWsKxPiM+SWas92bejvpQHTb0Kfl2f4aLip7yV/3pjPV1dkoZv736iv
         uRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727277918; x=1727882718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xh/2EOs2WTw8AQzEyqJvYQT+wfQifYuKy9bTkOCzPg=;
        b=S276bpY0ArP6o+RIfQAtvbNkJS7PeX2vH+iGnElhfBgLtTvXnkV6a13SWf7SScCfQY
         xN0BnOL3PNZ47fyJIKnznTvAcborXTG81ts+9XC6C/ATLs1jdxvm8RVWji17T6mkrg+Y
         khaLDQg/vbH6hK1iKtXmBpYMKEPFG+OPLLj3QhatQ+cq6LwPRdBEAPc9MRBRet3VJb6t
         ya8mASDBkkFnmYJGAJLPBCFX2moW97KjkmBv5a+SBBN9zJtBz5piFgy3G1wR3fVWZUe4
         t9zu+1L/6+ix0IzZDjZ70O1qrNACkjHX7ivE0fAug5QFDuScZQcGTLk+BB/MN4KRhAup
         8QPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNYoB7yQIgMa6KFCgoPl5rcVNshThLOteLsG6j9BZhJZHB69ZpFa5vVETjwqcP9C78JcQZwXlEPbW5dx2VtqRPkjg=@vger.kernel.org, AJvYcCX5PBVnjeQQhMPpABx+v4L0UARat99AQytFwOzaE+CZmvgJRMatlLy9XPmxlRdOzC0F1bT4V7v0vpyZvec=@vger.kernel.org, AJvYcCXftOCL+dTxV1XQeYM0yZlcxv6noOiXxSPd5WwOPQe9aiL4zXJOq4ttjkK9jMINCGNkIKrwFl7Zb3XhIS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1+TrW3Mc3EbfUmiZq4p7p0v22n2GkDTQDRA+fogYXifXX0ns
	Tmch/us69CXk4M0cnwZTbYqKfNUnJ3jWnddvFkkQelCwayhuJY358mQ6k01moOFJ2VbW/grrAtD
	r1XKe1pYUcGid9cpVoB2Y0foHa+c=
X-Google-Smtp-Source: AGHT+IEg6P4vnh18BilWdWKPk3+aT1nLRyAXyvrAWbYUOD6SRQAugNrB4O6aCr5Atj7f9apSxRU16+Pjxx7ksN+WqtM=
X-Received: by 2002:a05:6122:319b:b0:4ef:5b2c:df41 with SMTP id
 71dfb90a1353d-505c20745fcmr2875987e0c.9.1727277917965; Wed, 25 Sep 2024
 08:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240924224357.GM7165@pendragon.ideasonboard.com>
In-Reply-To: <20240924224357.GM7165@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Sep 2024 16:24:52 +0100
Message-ID: <CA+V-a8uZP0_kvtNYzfTA8atn=wgFrabLODxyVuyYvjR68z=HZA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] media: i2c: ov5645: Use dev_err_probe instead of dev_err
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Tue, Sep 24, 2024 at 11:44=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Sep 10, 2024 at 06:06:03PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Drop dev_err() and use the dev_err_probe() helper on probe path.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/i2c/ov5645.c | 74 +++++++++++++++-----------------------
> >  1 file changed, 28 insertions(+), 46 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > index 78b86438c798..9e6ff1f1b9ac 100644
> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -1076,51 +1076,37 @@ static int ov5645_probe(struct i2c_client *clie=
nt)
> >       ov5645->dev =3D dev;
> >
> >       endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> > -     if (!endpoint) {
> > -             dev_err(dev, "endpoint node not found\n");
> > -             return -EINVAL;
> > -     }
> > +     if (!endpoint)
> > +             return dev_err_probe(dev, -EINVAL, "endpoint node not fou=
nd\n");
> >
> >       ret =3D v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
> >                                        &ov5645->ep);
> >
> >       of_node_put(endpoint);
> >
> > -     if (ret < 0) {
> > -             dev_err(dev, "parsing endpoint node failed\n");
> > -             return ret;
> > -     }
> > +     if (ret < 0)
> > +             return dev_err_probe(dev, ret, "parsing endpoint node fai=
led\n");
> >
> > -     if (ov5645->ep.bus_type !=3D V4L2_MBUS_CSI2_DPHY) {
> > -             dev_err(dev, "invalid bus type, must be CSI2\n");
> > -             return -EINVAL;
> > -     }
> > +     if (ov5645->ep.bus_type !=3D V4L2_MBUS_CSI2_DPHY)
> > +             return dev_err_probe(dev, -EINVAL, "invalid bus type, mus=
t be CSI2\n");
> >
> >       /* get system clock (xclk) */
> >       ov5645->xclk =3D devm_clk_get(dev, NULL);
> > -     if (IS_ERR(ov5645->xclk)) {
> > -             dev_err(dev, "could not get xclk");
> > -             return PTR_ERR(ov5645->xclk);
> > -     }
> > +     if (IS_ERR(ov5645->xclk))
> > +             return dev_err_probe(dev, PTR_ERR(ov5645->xclk), "could n=
ot get xclk");
> >
> >       ret =3D of_property_read_u32(dev->of_node, "clock-frequency", &xc=
lk_freq);
> > -     if (ret) {
> > -             dev_err(dev, "could not get xclk frequency\n");
> > -             return ret;
> > -     }
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "could not get xclk freque=
ncy\n");
> >
> >       /* external clock must be 24MHz, allow 1% tolerance */
> > -     if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> > -             dev_err(dev, "external clock frequency %u is not supporte=
d\n",
> > -                     xclk_freq);
> > -             return -EINVAL;
> > -     }
> > +     if (xclk_freq < 23760000 || xclk_freq > 24240000)
> > +             return dev_err_probe(dev, -EINVAL, "external clock freque=
ncy %u is not supported\n",
> > +                                  xclk_freq);
> >
> >       ret =3D clk_set_rate(ov5645->xclk, xclk_freq);
> > -     if (ret) {
> > -             dev_err(dev, "could not set xclk frequency\n");
> > -             return ret;
> > -     }
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "could not set xclk freque=
ncy\n");
> >
> >       for (i =3D 0; i < OV5645_NUM_SUPPLIES; i++)
> >               ov5645->supplies[i].supply =3D ov5645_supply_name[i];
> > @@ -1131,16 +1117,12 @@ static int ov5645_probe(struct i2c_client *clie=
nt)
> >               return ret;
> >
> >       ov5645->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_H=
IGH);
> > -     if (IS_ERR(ov5645->enable_gpio)) {
> > -             dev_err(dev, "cannot get enable gpio\n");
> > -             return PTR_ERR(ov5645->enable_gpio);
> > -     }
> > +     if (IS_ERR(ov5645->enable_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(ov5645->enable_gpio), "=
cannot get enable gpio\n");
>
> Those lines are getting long. We usually try to wrap at 80 columns for
> sensor drivers:
>
As there will be a v3 anyway, I'll wrap it to 80 columns.

>                 return dev_err_probe(dev, PTR_ERR(ov5645->enable_gpio),
>                                      "cannot get enable gpio\n");
>
> Same elsewhere. I'll let Sakari decide.
>
> >
> >       ov5645->rst_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH)=
;
> > -     if (IS_ERR(ov5645->rst_gpio)) {
> > -             dev_err(dev, "cannot get reset gpio\n");
> > -             return PTR_ERR(ov5645->rst_gpio);
> > -     }
> > +     if (IS_ERR(ov5645->rst_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(ov5645->rst_gpio), "can=
not get reset gpio\n");
> >
> >       mutex_init(&ov5645->power_lock);
> >
> > @@ -1177,9 +1159,9 @@ static int ov5645_probe(struct i2c_client *client=
)
> >       ov5645->sd.ctrl_handler =3D &ov5645->ctrls;
> >
> >       if (ov5645->ctrls.error) {
> > -             dev_err(dev, "%s: control initialization error %d\n",
> > -                    __func__, ov5645->ctrls.error);
> >               ret =3D ov5645->ctrls.error;
> > +             dev_err_probe(dev, ret, "%s: control initialization error=
 %d\n",
> > +                           __func__, ov5645->ctrls.error);
> >               goto free_ctrl;
> >       }
> >
> > @@ -1192,7 +1174,7 @@ static int ov5645_probe(struct i2c_client *client=
)
> >
> >       ret =3D media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pa=
d);
> >       if (ret < 0) {
> > -             dev_err(dev, "could not register media entity\n");
> > +             dev_err_probe(dev, ret, "could not register media entity\=
n");
> >               goto free_ctrl;
> >       }
> >
> > @@ -1202,14 +1184,14 @@ static int ov5645_probe(struct i2c_client *clie=
nt)
> >
> >       ret =3D ov5645_read_reg(ov5645, OV5645_CHIP_ID_HIGH, &chip_id_hig=
h);
> >       if (ret < 0 || chip_id_high !=3D OV5645_CHIP_ID_HIGH_BYTE) {
> > -             dev_err(dev, "could not read ID high\n");
> >               ret =3D -ENODEV;
> > +             dev_err_probe(dev, ret, "could not read ID high\n");
> >               goto power_down;
> >       }
> >       ret =3D ov5645_read_reg(ov5645, OV5645_CHIP_ID_LOW, &chip_id_low)=
;
> >       if (ret < 0 || chip_id_low !=3D OV5645_CHIP_ID_LOW_BYTE) {
> > -             dev_err(dev, "could not read ID low\n");
> >               ret =3D -ENODEV;
> > +             dev_err_probe(dev, ret, "could not read ID low\n");
> >               goto power_down;
> >       }
> >
> > @@ -1218,24 +1200,24 @@ static int ov5645_probe(struct i2c_client *clie=
nt)
> >       ret =3D ov5645_read_reg(ov5645, OV5645_AEC_PK_MANUAL,
> >                             &ov5645->aec_pk_manual);
> >       if (ret < 0) {
> > -             dev_err(dev, "could not read AEC/AGC mode\n");
> >               ret =3D -ENODEV;
> > +             dev_err_probe(dev, ret, "could not read AEC/AGC mode\n");
> >               goto power_down;
> >       }
> >
> >       ret =3D ov5645_read_reg(ov5645, OV5645_TIMING_TC_REG20,
> >                             &ov5645->timing_tc_reg20);
> >       if (ret < 0) {
> > -             dev_err(dev, "could not read vflip value\n");
> >               ret =3D -ENODEV;
> > +             dev_err_probe(dev, ret, "could not read vflip value\n");
> >               goto power_down;
> >       }
> >
> >       ret =3D ov5645_read_reg(ov5645, OV5645_TIMING_TC_REG21,
> >                             &ov5645->timing_tc_reg21);
> >       if (ret < 0) {
> > -             dev_err(dev, "could not read hflip value\n");
> >               ret =3D -ENODEV;
> > +             dev_err_probe(dev, ret, "could not read hflip value\n");
> >               goto power_down;
> >       }
> >
> > @@ -1243,7 +1225,7 @@ static int ov5645_probe(struct i2c_client *client=
)
> >
> >       ret =3D v4l2_async_register_subdev(&ov5645->sd);
> >       if (ret < 0) {
> > -             dev_err(dev, "could not register v4l2 device\n");
> > +             dev_err_probe(dev, ret, "could not register v4l2 device\n=
");
> >               goto power_down;
> >       }
> >
>
> The probe function looks really young, I think it would benefit from
> being broken down in multiple functions.
>
I will add this once this initial series gets accepted.

Cheers,
Prabhakar


Return-Path: <linux-media+bounces-19080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27B598FD56
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 08:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB836283B91
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 06:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E154783CDA;
	Fri,  4 Oct 2024 06:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BdIsqzfY"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7F26F305
	for <linux-media@vger.kernel.org>; Fri,  4 Oct 2024 06:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728023452; cv=none; b=PN0bJRFxcJzHlV9EZHUztcTAnBWjagdYyxfnR+QcLHvkRz1J5tnC4cPZ2JBZRQt6Uy73diXSkWuurtntjaE6233nXsrPsq/flapJKWyqSSWhqQQxSHx8kYCLFkTExaMwsfx0d3vkRqQ1XzoWWL3ynqvdbO3OAxFQlP1MBOIBevs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728023452; c=relaxed/simple;
	bh=LaGiGAECZr45n/baVNQi60sTw49ldZJO96unEcccBlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiNlor+TL5/ca+2gp+RI8qCDoZANmTgSHk1IwZzsJVe2zDbGIC22EfFyUdzP+ZZM2JAbcXhk4MkTRYfzPZ3kf480a1HKJp8MfNxYvQBsmyPUTewkrys8MKiEQOvsa75tK3REemRy4Top9l9LY3Hi4+noey1eYOUEwRcs9b6sCdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BdIsqzfY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728023449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+I9rmxkkilny0d+zpLla4rs5gqMYbuLbi7iIDhgZOGY=;
	b=BdIsqzfYLiOHUufDd5kORWzCYVNXc0yu5deudXadZxxzGPAvRpy+YzU1xTiVjeaaks7MP7
	ZkJCZ0Dh+WDQfK7Oj4P+5ptZXshpuN+imksgWl5mUAM0no7P8xm5BsA+BdUEm2s1h0iSbz
	+R5m4sr6ornltSK2EjD4yAn9LlKXC7g=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-bwrccW6IMV-CreMvn27A1g-1; Fri, 04 Oct 2024 02:30:47 -0400
X-MC-Unique: bwrccW6IMV-CreMvn27A1g-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2e18d5b9a25so2301915a91.2
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2024 23:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728023446; x=1728628246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+I9rmxkkilny0d+zpLla4rs5gqMYbuLbi7iIDhgZOGY=;
        b=VApOzMLt5r3gQFLLbxpqrVCt7S09TUYm80Zp1pVUDferpVZmmHoobkzO2KlW2tfAjr
         5SEzMBoWk5GYYtPyjQfVAkhe11P7LIhgDU1uO8u+v40Dhlx1T0TqIsxobp5cTg+vaJ8Q
         3dLXGLaS68Ytcktw/zaFp4OaHjTH2kZ7fdhRb9ZlH4D+7W9NoUJJle0+SiTx3R5CaDRV
         SVFKSCLVsjdLo35kbsk3UGopcEb6fsvv1tA7PqYyWc3GkHNg1y/73cfDuZyLbSGtGwby
         os9DQHAl4/zN9jr65XHZPW27MXKfnt4lOVUjbOio+lbWxmk90oCKms3sury7CZleLz1K
         oltQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ58g7hgSjEP7GHbiA9FEEJFMPvSzVVwRi/VRaWObRu3Ld1EtbLtF7qnT3G1BSOjgThtllOJpfJwqiJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhkf6bedN4gBZNWt5w5eH6CZSXzc9ZUWBl05bq0P2Er0YsMHQb
	XHIHvIVJpgC1iLrk0FBBDkaE9JB/VvAmpeQ+iXbj7o7NdfLZUeRe4jimjTbdjRjRWiPe7z1+0/B
	V9I8D9NfsoilvAB5x/psMx+fMFynhwxyEmrPL4ObbHWKikPLHZgpktp+2Ty6Jad1AT4/OuWu6gK
	KWHPqytm4HPCIiN+sXOUymuzyCKSKqj5H/9Ko=
X-Received: by 2002:a17:90a:5511:b0:2e1:89aa:65b7 with SMTP id 98e67ed59e1d1-2e1e621d451mr2203490a91.9.1728023446442;
        Thu, 03 Oct 2024 23:30:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxUTZiay529AOqdX6JJRM2qykWvfiZx9Ht9ZYHN/gKSBxdgyT+RO2tCdRamuPyc5zPfHok6h13smnQ7MSlMaM=
X-Received: by 2002:a17:90a:5511:b0:2e1:89aa:65b7 with SMTP id
 98e67ed59e1d1-2e1e621d451mr2203474a91.9.1728023446086; Thu, 03 Oct 2024
 23:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002093037.50875-1-hpa@redhat.com> <70231d35-a114-4b26-92c7-d33fec01d2b5@wanadoo.fr>
In-Reply-To: <70231d35-a114-4b26-92c7-d33fec01d2b5@wanadoo.fr>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 4 Oct 2024 14:30:34 +0800
Message-ID: <CAEth8oG-FjR+TDE_bd94i3ODaVBJGAuouXyoTrSPtfrM+OOJPg@mail.gmail.com>
Subject: Re: [PATCH] media: Add t4ka3 camera sensor driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christophe,

Thank you for reviewing.

On Thu, Oct 3, 2024 at 5:03=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 02/10/2024 =C3=A0 11:30, Kate Hsuan a =C3=A9crit :
> > Add the t4ka3 driver from:
> > https://github.com/kitakar5525/surface3-atomisp-cameras.git
> >
> > With many cleanups / changes (almost a full rewrite) to make it suitabl=
e
> > for upstream:
> >
> > * Remove the VCM and VCM-OTP support, the mainline kernel models VCMs a=
nd
> >    calibration data eeproms as separate v4l2-subdev-s.
> >
> > * Remove the integration-factor t4ka3_get_intg_factor() support and IOC=
TL,
> >    this provided info to userspace through an atomisp private IOCTL.
> >
> > * Turn atomisp specific exposure/gain IOCTL into standard v4l2 controls=
.
> >
> > * Use normal ACPI power-management in combination with runtime-pm suppo=
rt
> >    instead of atomisp specific GMIN power-management code.
> >
> > * Turn into a standard V4L2 sensor driver using
> >    v4l2_async_register_subdev_sensor().
> >
> > * Add vblank, hblank, and link-freq controls; drop get_frame_interval()=
.
> >
> > * Use CCI register helpers.
> >
> > * Calculate values for modes instead of using fixed register-value list=
s,
> >    allowing arbritrary modes.
> >
> > * Add get_selection() and set_selection() support
> >
> > * Add a CSI2 bus configuration check
> >
> > This been tested on a Xiaomi Mipad2 tablet which has a T4KA3 sensor wit=
h
> > DW9761 VCM as back sensor.
> >
> > Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
>
> Hi,
>
> a few comments, should it help.
>
> > +static int t4ka3_s_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     int ret;
> > +
> > +     mutex_lock(&sensor->lock);
> > +
> > +     if (sensor->streaming =3D=3D enable) {
> > +             dev_warn(sensor->dev, "Stream already %s\n", enable ? "st=
arted" : "stopped");
> > +             goto error_unlock;
> > +     }
> > +
> > +     if (enable) {
> > +             ret =3D pm_runtime_get_sync(sensor->sd.dev);
> > +             if (ret) {
> > +                     dev_err(sensor->dev, "power-up err.\n");
> > +                     goto error_unlock;
> > +             }
> > +
> > +             cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
> > +                                 ARRAY_SIZE(t4ka3_init_config), &ret);
> > +             /* enable group hold */
> > +             cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
> > +             cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_re=
gs,
> > +                                 ARRAY_SIZE(t4ka3_pre_mode_set_regs), =
&ret);
> > +             if (ret)
> > +                     goto error_powerdown;
> > +
> > +             ret =3D t4ka3_set_mode(sensor);
> > +             if (ret)
> > +                     goto error_powerdown;
> > +
> > +             ret =3D cci_multi_reg_write(sensor->regmap, t4ka3_post_mo=
de_set_regs,
> > +                                       ARRAY_SIZE(t4ka3_post_mode_set_=
regs), NULL);
> > +             if (ret)
> > +                     goto error_powerdown;
> > +
> > +             /* Restore value of all ctrls */
> > +             ret =3D __v4l2_ctrl_handler_setup(&sensor->ctrls.handler)=
;
> > +             if (ret)
> > +                     goto error_powerdown;
> > +
> > +             /* disable group hold */
> > +             cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
> > +             cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
> > +             if (ret)
> > +                     goto error_powerdown;
> > +
> > +             sensor->streaming =3D 1;
> > +     } else {
> > +             ret =3D cci_write(sensor->regmap, T4KA3_REG_STREAM, 0, NU=
LL);
> > +             if (ret)
> > +                     goto error_powerdown;
> > +
> > +             ret =3D pm_runtime_put(sensor->sd.dev);
> > +             if (ret)
> > +                     goto error_unlock;
> > +
> > +             sensor->streaming =3D 0;
> > +     }
> > +
> > +     mutex_unlock(&sensor->lock);
> > +     return ret;
> > +
> > +error_powerdown:
> > +     ret =3D pm_runtime_put(sensor->sd.dev);
>
> I think that the "ret =3D " should be removed here.

Okay, make sense.

>
> > +error_unlock:
> > +     mutex_unlock(&sensor->lock);
> > +     return ret;
> > +}
>
> ...
>
> > +static int t4ka3_probe(struct i2c_client *client)
> > +{
> > +     struct t4ka3_data *sensor;
> > +     int ret;
> > +
> > +     /* allocate sensor device & init sub device */
> > +     sensor =3D devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL=
);
> > +     if (!sensor)
> > +             return -ENOMEM;
> > +
> > +     sensor->dev =3D &client->dev;
> > +
> > +     ret =3D t4ka3_check_hwcfg(sensor);
> > +     if (ret)
> > +             return ret;
> > +
> > +     mutex_init(&sensor->lock);
> > +
> > +     sensor->link_freq[0] =3D T4KA3_LINK_FREQ;
> > +     sensor->mode.crop =3D t4ka3_default_crop;
> > +     t4ka3_fill_format(sensor, &sensor->mode.fmt, T4KA3_ACTIVE_WIDTH, =
T4KA3_ACTIVE_HEIGHT);
> > +     t4ka3_calc_mode(sensor);
> > +
> > +     v4l2_i2c_subdev_init(&(sensor->sd), client, &t4ka3_ops);
> > +     sensor->sd.internal_ops =3D &t4ka3_internal_ops;
> > +
> > +     sensor->powerdown_gpio =3D devm_gpiod_get(&client->dev, "powerdow=
n",
> > +                                             GPIOD_OUT_HIGH);
> > +     if (IS_ERR(sensor->powerdown_gpio))
> > +             return dev_err_probe(&client->dev, PTR_ERR(sensor->powerd=
own_gpio),
> > +                                  "getting powerdown GPIO\n");
> > +
> > +     sensor->reset_gpio =3D devm_gpiod_get_optional(&client->dev, "res=
et",
> > +                                                  GPIOD_OUT_HIGH);
> > +     if (IS_ERR(sensor->reset_gpio))
> > +             return dev_err_probe(&client->dev, PTR_ERR(sensor->reset_=
gpio),
> > +                                  "getting reset GPIO\n");
> > +
> > +     pm_runtime_set_suspended(&client->dev);
> > +     pm_runtime_enable(&client->dev);
> > +     pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> > +     pm_runtime_use_autosuspend(&client->dev);
> > +
> > +     sensor->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> > +     if (IS_ERR(sensor->regmap))
> > +             return PTR_ERR(sensor->regmap);
>
> I thing this should goto err_pm_runtime;

Okay, I'll get the regmap information before setting up runtime pm.
So, probe() can return without diable the pm.

>
> > +
> > +     ret =3D t4ka3_s_config(&sensor->sd);
> > +     if (ret)
> > +             goto err_pm_runtime;
> > +
> > +     sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +     sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +     sensor->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +     ret =3D t4ka3_init_controls(sensor);
> > +     if (ret)
> > +             goto err_controls;
> > +
> > +     ret =3D media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pa=
d);
> > +     if (ret)
> > +             goto err_controls;
> > +
> > +     ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
> > +     if (ret)
> > +             goto err_media_entity;
> > +
> > +     return 0;
> > +
> > +err_media_entity:
> > +     media_entity_cleanup(&sensor->sd.entity);
> > +err_controls:
> > +     v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +err_pm_runtime:
> > +     pm_runtime_disable(&client->dev);
> > +     return ret;
> > +}
> > +
> > +static struct acpi_device_id t4ka3_acpi_match[] =3D {
> > +     { "XMCC0003" },
> > +     {},
>
> No need for ending comma after terminator.
Okay.

>
> > +};
>
> ...
>
> CJ
>

I'll propose a v2 patch to include the improvements.

--=20
BR,
Kate



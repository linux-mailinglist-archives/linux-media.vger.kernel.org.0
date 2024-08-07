Return-Path: <linux-media+bounces-15912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 610AB94A346
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 10:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35656B23223
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709481C9ECD;
	Wed,  7 Aug 2024 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apuVklc4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FD63A267;
	Wed,  7 Aug 2024 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723020474; cv=none; b=tvOQhXpgkPsIboP4Asp/vaO4N5hmIjgsrpGF4+SBONxgLJzinp2NzEaq6mLtSiv3Cjkk8GtwpL/12LhZOr+3/C1Wjl9VcMSuEGh9IcBOn9NzW0RUjrMQki78EsM354mns4DotNSGTBSRydqM7n0yNSdGnpxdkVRiRSyV5+wNB80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723020474; c=relaxed/simple;
	bh=bZUZlG3iZqWM6zNuA9QoCZ+B1pqhylsgwBvpTEWeh2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca/Y/ObkaC5IpnnLOFlsZXeYb0RaSQH/qvHl9gz9LFeAvSXnC7hBJTXHgIZoIlR8DTlGkZRnmwd1cCuHZ1ZL2KsfbcMOoV/trCm65ZWiqW5aGIryOYx35tte9JwIp9BugnZw7I2R1yMkyJxH4ewP1lkRuuqGt+oPru2DZlcwujs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apuVklc4; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5ba482282d3so2018746a12.2;
        Wed, 07 Aug 2024 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723020471; x=1723625271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKZKz+yYZuMxg39mJXtEjiiI7Fxr+H8aAatxlvRJKwM=;
        b=apuVklc4fhH68KGqr0TJ2D8DTXtMBSu2rCqc654tWDRxKuBsc5MbGbngXXwAFDoThe
         kGO9OdSpXDFyih8UrwActSIwww+UHOfQqLOkcPntyXeaBd4/KgMEbdCbWT4NPML73PcV
         DacpiWJwmbJssFecRBbEPDFBHYDirHOL4WagtxQXGBsyPSOh6JUvZ7eskjhaGF4s2zJy
         G6NXirlUsmv1izmbO0Th2SqKnd4/p5GVcHw+Ow8IbqVHaKDnwdClLDhs4jEt3VGcdlNl
         Yg7D9DmAltoFX528BDbPhF+IceGno+8Ew+sFPGe4+pOSmoncBl8fDacXF10G+tixCauu
         qloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723020471; x=1723625271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKZKz+yYZuMxg39mJXtEjiiI7Fxr+H8aAatxlvRJKwM=;
        b=lVGdjX9O8CjGNmsvQ6BEkVGZnkXVyRL2e3oBTllh5MuW6P4wccujaS7K4VCjx5ZcFk
         CJoWz6LnOr8hf6FeP6pkUdcGdfs9ZDUUXvg6ilc+fVkCnZ7zuMMtw5BI2Lv9gtaBHc1o
         RWnXn2M5l5lmiP4jL+gv8BWHoPp0gv3UhjbXP/HCmDxHTJElDaA48NE9QCcWE+G4cwES
         R6SIYLpqo+wTCvSmjugve9iB/fn/3AdQsVYk73glKbXahXFTiuwoCjT/+/iXIx2guZ3i
         OGTtJ8wTbK9zMbmGaHfY34M6gB0rmGFRf/2bOy0GGJGDIatCeVduRS4rGraco018/FqO
         aO7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7J95BIAZ5QmawD/1BL1NpmLT1b5Z3z04Mw1PyZCI2/wnkpr8Jk4xUYtVGQ3EOklFLVDBmrYGEDp5FsbSB9ecUsfHr8ozSbF67Cdj1QQDoTIenXd4tTpC1xYs2o6v37aON623LpPKePMM=
X-Gm-Message-State: AOJu0YxufGcb2Z2e6/Re4mHbbneWhCyI2oc6G7/kLyxqxC6XUz/LJHS4
	olIfQmnoMr/7ysDuoTjDHLu+du3DGB5ifw60fQpy8S7pJLyPhLDyeVzsoU0pfBnMnBX2WE8MVfR
	SOZQAPnHFqNu82VZGzXmEJfcgGTypEofv
X-Google-Smtp-Source: AGHT+IHbc9us9SbX5Undu4ye5qsyec9b817rZTm3Gri0WK3DQmIwf9wychGWJIgbFFASj5CYnTxEIJVm0UHa6T3jBZc=
X-Received: by 2002:aa7:d755:0:b0:5a2:1693:1a2f with SMTP id
 4fb4d7f45d1cf-5b7f39e01e5mr12282162a12.12.1723020471017; Wed, 07 Aug 2024
 01:47:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com>
 <20240807-imx290-avail-v1-2-666c130c7601@skidata.com> <6072611.lOV4Wx5bFT@steina-w>
In-Reply-To: <6072611.lOV4Wx5bFT@steina-w>
From: Benjamin Bara <bbara93@gmail.com>
Date: Wed, 7 Aug 2024 10:47:39 +0200
Message-ID: <CAJpcXm6Bv37GUsttdGDDgX1Do+KC_xVSwHV7M5_aEuvhuv6u3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: imx290: Check for availability in probe()
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Wed, 7 Aug 2024 at 10:33, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> Hi Benjamin,
>
> Am Mittwoch, 7. August 2024, 10:10:28 CEST schrieb Benjamin Bara:
> > Currently, the V4L2 subdevice is also created when the device is not
> > available/connected. In this case, dmesg shows the following:
> >
> > [   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
> > [   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
> > [   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
> > [   10.454018] imx290 7-001a: Error writing reg 0x3020: -6
> >
> > which seems to come from imx290_ctrl_update() after the subdev init is
> > finished. However, as the errors are ignored, the subdev is initialized
> > but simply does not work. From userspace perspective, there is no
> > visible difference between a working and not-working subdevice (except
> > when trying it out or watching for the error message).
> >
> > This commit adds a simple availability check before starting with the
> > subdev initialization to error out instead.
>
> There is already a patch reading the ID register at [1]. This also reads =
the
> ID register. But I don't have any documentation regarding that register,
> neither address nor values definitions. If there is known information abo=
ut
> that I would prefer reading the ID and compare it to expected values.

Thanks for the link - it seems like Laurent has dropped the patch for
the more recent kernel versions on their GitLab.

This was also my initial intention, but similar to you, I don't have a
docu describing this register, so I am not sure where the info is coming
from and if it really contains the identification/type info. Probably
Laurent has more infos on that.

Best regards
Benjamin

> Best regards,
> Alexander
>
> [1] https://gitlab.com/ideasonboard/nxp/linux/-/commit/85ce725f1de7c16133=
bfb92b2ab0d3d84efcdb47
>
> > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > ---
> >  drivers/media/i2c/imx290.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 4150e6e4b9a6..a86076e42a36 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -1580,6 +1580,11 @@ static int imx290_probe(struct i2c_client *clien=
t)
> >       pm_runtime_set_autosuspend_delay(dev, 1000);
> >       pm_runtime_use_autosuspend(dev);
> >
> > +     /* Make sure the sensor is available before V4L2 subdev init. */
> > +     ret =3D cci_read(imx290->regmap, IMX290_STANDBY, NULL, NULL);
> > +     if (ret)
> > +             goto err_pm;
> > +
> >       /* Initialize the V4L2 subdev. */
> >       ret =3D imx290_subdev_init(imx290);
> >       if (ret)
> >
> >
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>


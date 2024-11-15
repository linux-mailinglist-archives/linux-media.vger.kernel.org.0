Return-Path: <linux-media+bounces-21463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A24199CF27A
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 18:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28C571F21E0F
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 17:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57C31D63EA;
	Fri, 15 Nov 2024 17:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lGCJy6ez"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AD01D5AC0
	for <linux-media@vger.kernel.org>; Fri, 15 Nov 2024 17:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731690704; cv=none; b=Gzv9pz9KsXgcz2FToJhJIIpzkH1cZgO7n603dZ5HM60CETRZoE1WlXQYqGp3UrwgvR1T8s3/8ZetiPk1BRTlbdrcutADOfKZAmWCAtRT99IUKccRtat1a6KzHSiEamlfDmneFTQ4mz2BSdU4cUZolbEu8S7BggzeaCtFYuhmmL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731690704; c=relaxed/simple;
	bh=g8IkE+i4pe0PMzVhH0jOsS/D8u0poueTQpnEGgfHD80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNoZdKICXd8b4wkFcJoAk5559CHexuUkOEDEAOO/ls0QXTfrChweiY2TwhXe96kwphBQiZISVkQb88xfKXLVUJwqPat9PTKFu6VViEuzd5J1FQB42fVFRvRlnuNnqsHpy2rwF6usgzEHqkFxg/FXKiNEbRRgfKjAE+1kQqubpHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lGCJy6ez; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e602a73ba1so555304b6e.2
        for <linux-media@vger.kernel.org>; Fri, 15 Nov 2024 09:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731690700; x=1732295500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3O+OzxQdcaSJBAi4TfSD5hfO27hOZSUSA7g9yNppmGc=;
        b=lGCJy6ezWoZjXrZj0VBrtbHQq6QAYxfrnP8VbWV3tm01MhEi87sUrneDEFdezmY2wf
         ATAgngaiSPcnyPr+muV8wz+yh6DP8V13qSJTiA8DEUPv+MXY01voZVFVAL6C7v08L3M3
         VQlEzFKDHjIOBYF7Ii2BLPUxCgK/ftTVqpOh3PTlEPkbLAvciDFKAicf8xxoVCKUzklJ
         NzGNyi/Hk+OsQLVFGXd38GemuvfTRaM/a7Zikb/gZPC1EXFsWMkiluJK5cv9dJeBRwbC
         kNX2HSegi1BZE4GPHni8pFgRcrECHrApvmXbknKSB0ooTVb/1aT4m4bRy2XESjW8pxw9
         iAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731690700; x=1732295500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3O+OzxQdcaSJBAi4TfSD5hfO27hOZSUSA7g9yNppmGc=;
        b=JJYbNAH1pbd0wnkPyrM0xxJ/Wr1qPEfkKov11bA0mbV4E0IxDt78e8lw1bvU2YIVdi
         cQiGAGXb132KHfdhKwMZURWZ4ofBhG6aPmEMI35E8/rJss1E/xUfurQWdZQlwz/XxVvn
         4TGPBtV99YJjt+GAa8xY7gHsffcgu6z0ja7DPM4/FxAd4YsXEjdxAwPkmesHQfuVwlh7
         P7kBYJluH5AfuG1JBeMicTJcMWfI0kqUVzc/xpVFxLcmY53vVEYqnA/vXCDRprSmlPcJ
         l+vhRfjKzIu0oHTxLslShxEt4LxGqrpnS/SZZ4aFN8N2c0SBSZeSnhIr0EDFc3+md1jy
         xWEg==
X-Forwarded-Encrypted: i=1; AJvYcCUB7s20nSW+b1/KsWuPV2kROrPuFtO9zne7V8MkgHjtW9HU5DS+VnLZmNWlyJ3cWgFUCFPrKL74ST5mSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhU5b7E+cfW1X7Nr/vKNp+vJIP+d9DISPVhRR+cdxFC89Dklbo
	BgyIIJ9NqDwXkqoOdVP8P20+noIIgFbd/SBOCH9tj5iXi5rdtzhcJ67DUlcht7lcgWT8Ap508FI
	4XofxL5QLNlhFX0D7KqFDJEOZZbs62P5i3g6T2g==
X-Google-Smtp-Source: AGHT+IHUR32gnJVqLrCFUneW5/JzoV52tvqPUnsXEuRMGVDOGd+HQpyLY3CeMR0tap9+CxLm0PgZl503N8PceMtYJFo=
X-Received: by 2002:a54:4602:0:b0:3e7:bcab:8f0b with SMTP id
 5614622812f47-3e7bcab8f8cmr3122582b6e.24.1731690700505; Fri, 15 Nov 2024
 09:11:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115142021.574402-1-aardelean@baylibre.com> <173168263299.4187655.2771344063896221513@ping.linuxembedded.co.uk>
In-Reply-To: <173168263299.4187655.2771344063896221513@ping.linuxembedded.co.uk>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Fri, 15 Nov 2024 19:11:29 +0200
Message-ID: <CA+GgBR_5-9b+5oN9fcKRgiLc8gBdNZegJFGmkimtjJpy7LHa6Q@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx296: Implement simple retry for model identification
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	laurent.pinchart@ideasonboard.com, manivannan.sadhasivam@linaro.org, 
	sakari.ailus@linux.intel.com, mchehab@kernel.org, 
	Alexandru Ardelean <alex@shruggie.ro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 4:57=E2=80=AFPM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Alexandru Ardelean (2024-11-15 14:20:21)
> > From: Alexandru Ardelean <alex@shruggie.ro>
> >
> > On a cold boot of the device (and sensor), and when using the 'sony,imx=
296'
> > compatible string, it often seems that I get 'invalid device model 0x00=
00'.
> > After doing a soft reboot, it seems to work fine.
> >
> > After applying this change (to do several retries), the sensor is
> > identified on the first cold boot. The assumption here would be that th=
e
> > wake-up from standby takes too long. But even trying a 'udelay(100)' af=
ter
> > writing register IMX296_CTRL00 doesn't seem to help (100 microseconds
> > should be a reasonable fixed time).
>
> I believe Raspberry Pi have an IMX296 and have some out of tree patches.
>

Oh.
It didn't occur to me to look into RPi's tree.
But I will try out their patch.
I don't have access to the datasheet for this sensor.
I was just playing around with it and found this annoying issue on
cold-boot, which made me wonder if it's a reset delay issue or
something else.

Thanks
Alex

>  https://github.com/raspberrypi/linux/commits/rpi-6.6.y/drivers/media/i2c=
/imx296.c
>
> It looks like they do similar fixes for bootup, for instance:
>
>  https://github.com/raspberrypi/linux/commit/7713ce38e6a26425ace3a57b3d03=
ba0125c16f89
>
> which introduces a 2-5ms delay before reading the IMX296_SENSOR_INFO
> register.
>
> As this delay is significantly longer tahn the 100microseconds you've
> tried it might be worth testing Naushir's patch, which states:
>
> """
> Add a 2-5ms delay when coming out of standby and before reading the
> sensor info register durning probe, as instructed by the datasheet. This
> standby delay is already present when the sensor starts streaming.
> """
>
> Regards
> --
> Kieran
>
> >
> > However, after implementing the retry loop (as this patch does it), see=
ms
> > to resolve the issue on the cold boot, and the device is identified.
> >
> > When using the 'sony,imx296ll' and 'sony,imx296lq' compatible strings, =
the
> > device identification process isn't happening, and the sensor works fin=
e.
> >
> > Signed-off-by: Alexandru Ardelean <aardelean@baylibre.com>
> > ---
> >  drivers/media/i2c/imx296.c | 44 ++++++++++++++++++++++----------------
> >  1 file changed, 26 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
> > index 83149fa729c4..9c3641c005a4 100644
> > --- a/drivers/media/i2c/imx296.c
> > +++ b/drivers/media/i2c/imx296.c
> > @@ -931,7 +931,7 @@ static int imx296_read_temperature(struct imx296 *s=
ensor, int *temp)
> >  static int imx296_identify_model(struct imx296 *sensor)
> >  {
> >         unsigned int model;
> > -       int temp =3D 0;
> > +       int temp =3D 0, retries;
> >         int ret;
> >
> >         model =3D (uintptr_t)of_device_get_match_data(sensor->dev);
> > @@ -943,25 +943,33 @@ static int imx296_identify_model(struct imx296 *s=
ensor)
> >                 return 0;
> >         }
> >
> > -       /*
> > -        * While most registers can be read when the sensor is in stand=
by, this
> > -        * is not the case of the sensor info register :-(
> > -        */
> > -       ret =3D imx296_write(sensor, IMX296_CTRL00, 0, NULL);
> > -       if (ret < 0) {
> > -               dev_err(sensor->dev,
> > -                       "failed to get sensor out of standby (%d)\n", r=
et);
> > -               return ret;
> > -       }
> > +       retries =3D 0;
> > +       do {
> > +               /*
> > +                * While most registers can be read when the sensor is =
in
> > +                * standby, this is not the case of the sensor info reg=
ister :-(
> > +                */
> > +               ret =3D imx296_write(sensor, IMX296_CTRL00, 0, NULL);
> > +               if (ret < 0) {
> > +                       dev_err(sensor->dev,
> > +                               "failed to get sensor out of standby (%=
d)\n",
> > +                               ret);
> > +                       return ret;
> > +               }
> >
> > -       ret =3D imx296_read(sensor, IMX296_SENSOR_INFO);
> > -       if (ret < 0) {
> > -               dev_err(sensor->dev, "failed to read sensor information=
 (%d)\n",
> > -                       ret);
> > -               goto done;
> > -       }
> > +               udelay(10);
> > +
> > +               ret =3D imx296_read(sensor, IMX296_SENSOR_INFO);
> > +               if (ret < 0) {
> > +                       dev_err(sensor->dev,
> > +                               "failed to read sensor information (%d)=
\n",
> > +                               ret);
> > +                       goto done;
> > +               }
> > +
> > +               model =3D (ret >> 6) & 0x1ff;
> > +       } while (model =3D=3D 0 && retries++ < 3);
> >
> > -       model =3D (ret >> 6) & 0x1ff;
> >
> >         switch (model) {
> >         case 296:
> > --
> > 2.46.1
> >


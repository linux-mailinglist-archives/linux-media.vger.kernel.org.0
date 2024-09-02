Return-Path: <linux-media+bounces-17395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A05E4968EA4
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 22:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B5EE1F234CA
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 20:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6295D1C62C6;
	Mon,  2 Sep 2024 20:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0Z81Jk6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2171C1A3AAE;
	Mon,  2 Sep 2024 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725307434; cv=none; b=U0UQGZQ60DA8mTHhm+t+YSo8hWRxDSq8mMzESlDTSMuWan7CGWlByEVNuxzMHHUSbxM3AZQn5wz57XJkY/fkv6N4BHrO6YF0GaeTL2hBzo+LhGosBf6lGK+3zx7AkyvgyWomu12jlKtVHrZTL3Zu7nxwO3En+/h161fo1nlHbfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725307434; c=relaxed/simple;
	bh=qONdzdDsbnpIOzgzfTtZ+dg+Q+7gaLKkxLqxmNXtuck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oL6IpGWVuYq1Ud/MDcN3Wewt/IgdVXaz+2C6EYYlC5sj+h/UjP7UuRDq0kr9hy16bbOB2LwDsr0mZdahQ31wC4HPywT1TSCZSHBCx9BaDfVuWRYvhdAPFABohUHn7LygEgnmjOYGJqGeSCJpNFPy+Y7wsFio9ZENo1rC5lTumhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0Z81Jk6; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f502086419so45773291fa.3;
        Mon, 02 Sep 2024 13:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725307431; x=1725912231; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G2rzI8XnwAvje8n92Q91oYkvaH28K2yhg6ufqOtQN3c=;
        b=g0Z81Jk6Ce7GtTeXcG3aXqv040aTrPu0ch1mPBLudPaZv2HuR8WqA+UaevxLDAPpfA
         Qz1s8aZsd5BZoPl2iAHBtcLD4XCv1ihdPGEGjkadSSpv8RAU8Bm5OjS7OcLjTj49UOwX
         mOC49hC9Fyw7nUCIlJ0VOhhebP2k1zVfkqIAm918LO4lvnr2WmsrcRovk4+e6UrNDeaa
         NPoW5UPSiyIGsjkrMUTObmJp96w/iLTna6/6ovDRhA6/EaEq/YKHqXmxW7qjdjC2Dse/
         8Z0QcGLfVV8RdYGee4Lkjbhde0a37BKkBChQfcyE1RFNNY3vSQnkEu7rmlT7flB1VmM5
         Z8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725307431; x=1725912231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2rzI8XnwAvje8n92Q91oYkvaH28K2yhg6ufqOtQN3c=;
        b=rq7+65CMGY7yOX7aRROoZwpDHhXHhrGb3ig2KQE79AgQsB1xPxkVTM7E/mBEyDjYEP
         1il2diAfy+9Gp5M2j/hN/cfrafX8rqoO/rWPC/d02XFrtyWEzzKuXhkzqW0VRW8Gqiv5
         6rt0gGX038wBwKPvwOsV5cQ9pxuSHNRufKF+bOYiMauF0U9BW/L1F6h08a2QPMJmJdIh
         AyJIQZM/tRV+UM4N/Wi6rgbD6n8W6SrN3jQk309PjBhNSE6gj+95R9pqXRlo03bQglIO
         GcyRZ6eFYIZTpLNL9GGATH/cSY1sDUpIx3JnmARoJNJLth6PQ+b+6T9i40gjGHVwdljI
         wTlA==
X-Forwarded-Encrypted: i=1; AJvYcCU8qhsdy4NyHrNEmDTDKmnUALViVkvBXURXKQaa1RT4q0erGWqzuCQHcvP7unR6d2CpyWpdtk6dbboy6gA=@vger.kernel.org, AJvYcCWT2ewYQzVRBtRmZryX+D0LoozT9fNRKwFsR11zM6paJAJuUSjG1J96/rILcFANyK/4PTqY0XQxInhkqi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDfRfGrZNfs1r4hk7ePDV6RAwIrWvH1/r06ozVPJnlfBPwDtKZ
	ydoXn0xkrkhoAvEJeZ50yCHqZsnL07MrrB5HC6WJQWWt0YJyx3OeF/SQCE2qy3PTjoNemBmai26
	YtK0dWVFI7AmRoNNZ6+NEj+ttjSE=
X-Google-Smtp-Source: AGHT+IHWbkeYOsIOTN15vtw00APkIdqfhCl5GBFl8Xzp2G+BrG8U2vmWOtzLcTNt51sfnTtTYK8wP3Pf28y1l4F4mQU=
X-Received: by 2002:a05:651c:502:b0:2f3:bdc9:8914 with SMTP id
 38308e7fff4ca-2f64440e6f8mr7462811fa.17.1725307430779; Mon, 02 Sep 2024
 13:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-6-b32a12799fed@skidata.com> <CAPY8ntCCCpjohup5Aqrrt6mRXpBukKUFnQWkuwKJ=xJCW=PDog@mail.gmail.com>
In-Reply-To: <CAPY8ntCCCpjohup5Aqrrt6mRXpBukKUFnQWkuwKJ=xJCW=PDog@mail.gmail.com>
From: Benjamin Bara <bbara93@gmail.com>
Date: Mon, 2 Sep 2024 22:03:39 +0200
Message-ID: <CAJpcXm7jYNG1rbLOJcbjHZbdbgFC7g5xGuUrTOE5b9-FcZ9xVQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] media: i2c: imx290: Check for availability in probe()
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dave!

On Mon, 2 Sept 2024 at 20:22, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
> On Mon, 2 Sept 2024 at 16:58, <bbara93@gmail.com> wrote:
> >
> > From: Benjamin Bara <benjamin.bara@skidata.com>
> >
> > Currently, the V4L2 subdevice is also created when the device is not
> > available/connected. From userspace perspective, there is no visible
> > difference between a working and not-working subdevice (except when
> > trying it out).
> >
> > This commit adds a simple availability check before starting with the
> > subdev initialization to error out instead.
> >
> > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > ---
> > Changes since v2:
> > - the new 1/8 is split out
> > - use dev_err_probe() (thx Laurent)
> > ---
> >  drivers/media/i2c/imx290.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 9610e9fd2059..6b292bbb0856 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -1571,6 +1571,7 @@ static int imx290_probe(struct i2c_client *client)
> >  {
> >         struct device *dev = &client->dev;
> >         struct imx290 *imx290;
> > +       u64 val;
> >         int ret;
> >
> >         imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
> > @@ -1631,6 +1632,17 @@ static int imx290_probe(struct i2c_client *client)
> >         pm_runtime_set_autosuspend_delay(dev, 1000);
> >         pm_runtime_use_autosuspend(dev);
> >
> > +       /* Make sure the sensor is available before V4L2 subdev init. */
> > +       ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
> > +       if (ret) {
> > +               ret = dev_err_probe(dev, -ENODEV, "Failed to detect sensor\n");
> > +               goto err_pm;
> > +       }
> > +       if (val != IMX290_STANDBY_STANDBY) {
>
> As Laurent commented on v2, this is a slightly unsafe check. If the
> device isn't controlled via a regulator then there's no guarantee that
> the sensor will be in standby.
> The cci_read call will already have returned an error if the sensor
> isn't present which will be 99.999% of the error cases.
>
> If you want to catch the case where it's not in standby, why not put
> it into standby as a recovery mechanism. It'd be a better user
> experience than just bombing out of the probe.

Thanks for the idea - no idea why it didn't come to my mind. I would
also prefer setting STANDBY instead of reading the value.

Kind regards
Benjamin

>   Dave
>
> > +               ret = dev_err_probe(dev, -ENODEV, "Sensor is not in standby\n");
> > +               goto err_pm;
> > +       }
> > +
> >         /* Initialize the V4L2 subdev. */
> >         ret = imx290_subdev_init(imx290);
> >         if (ret)
> >
> > --
> > 2.46.0
> >
> >


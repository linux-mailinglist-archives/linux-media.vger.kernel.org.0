Return-Path: <linux-media+bounces-17394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7D0968EA3
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 22:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFC13B2233D
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 20:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CCE1C62D2;
	Mon,  2 Sep 2024 20:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Og9+2TGP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DFA1A3AAE;
	Mon,  2 Sep 2024 20:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725307332; cv=none; b=LfEgVKduNzS9DShcW5aVFeBlckQoT1T5gcygrLre/4he+eoTPRCEPFef33DO5uJXfo/DlqN87UAV0SvjTKwxgKdp0NNSUOBjpVZHGFrY+EIX5DHl6j4kK7fFYyXN6HfZQdXS59S/CetgScYcCZXI4gHTLh7jB22pMHvKeUpKlKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725307332; c=relaxed/simple;
	bh=kwaVErdccwdvHSBnmn2NVpmlsQiUGliDStnRuLJUQrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYWD6dZQIHhCEN5NOK+O4ix1SFPD3+iJC+rCtmNAnOO51a7NUWCoQ44RWjARlZhfpa0tWwQF0bzBnTepA9yS6tNUxpQlNxQ1uHHhj0HhdDV+FKJVGqr8B+2n3Sd9eayTNAbPwCP6zKmNS/RMj6xtICMveVDzZn5Wp2S0Jc1uHf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Og9+2TGP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A54DC62;
	Mon,  2 Sep 2024 22:00:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725307258;
	bh=kwaVErdccwdvHSBnmn2NVpmlsQiUGliDStnRuLJUQrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Og9+2TGPt4cmfC0kFkFkD+9AZGoercrnqHPsdxnmfSnWzKg/sqrT2AjTyXOPeHcsJ
	 uKaW1BOR2RpnQV9D1iv1nX4CVwjhfsQFmol7vOLg1xzWGT+ytLsPIYfOcipYjGX3yV
	 aSNSoxAfqyYf5YfRPRJKUMLajgiMRhwsXdzT7hKs=
Date: Mon, 2 Sep 2024 23:01:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: bbara93@gmail.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v3 6/7] media: i2c: imx290: Check for availability in
 probe()
Message-ID: <20240902200136.GS1995@pendragon.ideasonboard.com>
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-6-b32a12799fed@skidata.com>
 <CAPY8ntCCCpjohup5Aqrrt6mRXpBukKUFnQWkuwKJ=xJCW=PDog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCCCpjohup5Aqrrt6mRXpBukKUFnQWkuwKJ=xJCW=PDog@mail.gmail.com>

On Mon, Sep 02, 2024 at 07:22:43PM +0100, Dave Stevenson wrote:
> Hi Benjamin
> 
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

I would also just drop the value check. I don't think it would really
catch real world issues.

> > +               ret = dev_err_probe(dev, -ENODEV, "Sensor is not in standby\n");
> > +               goto err_pm;
> > +       }
> > +
> >         /* Initialize the V4L2 subdev. */
> >         ret = imx290_subdev_init(imx290);
> >         if (ret)

-- 
Regards,

Laurent Pinchart


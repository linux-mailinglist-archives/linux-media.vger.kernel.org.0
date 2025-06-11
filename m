Return-Path: <linux-media+bounces-34509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE6FAD5588
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 14:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 920B11899D07
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 12:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528AD27FD50;
	Wed, 11 Jun 2025 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmLtBXWh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149C32E6102;
	Wed, 11 Jun 2025 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644944; cv=none; b=myS9nyChyg3fqm9rRWPwvjr1ygjE1j9TrE5/AS4u4dauMNy40g3NJ360IEAn3fuIifTjUaw3qybqaQhpsofcBNnZgMUMsFBkMQ1CVIIWQtkW2VTpESRAWOYt/oD+4ERFJpH8X8DS0WDHjl95vlBosyXmU78X/v+XleC9t9Syjyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644944; c=relaxed/simple;
	bh=fRYRpEXR++aTPyaPcPtD2qWzS2enPVhOvKEvWcRfFGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqTq1Shtamf4rmNt6YhvLXOfOLH3Z97fA/35IImPYFGiePmvBe0ox5e8Tg1dgi9vjsOtQ4cLQGKSF7cj11J+EGEuqGsIfzxuH33AsfFLy5XRi9fYK4tToTH3FOWqmuxVqv06VyIu8Ksa72IJqVEwvdtbPyzyZnr/cCmo3lGKSCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmLtBXWh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749644943; x=1781180943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fRYRpEXR++aTPyaPcPtD2qWzS2enPVhOvKEvWcRfFGg=;
  b=KmLtBXWhUKUZraDjxREeAEDnZdy9Z1hx8deQPbQK/XP2lSWtan4pIHGx
   5YvglPRUIHh+PpapU1KySEmHzMx6GpPpIOkshxDBGfSk5SLLWL82m60za
   1H44uu7CWqjG18wDY5gLyetEKIZZ8N1h6BM9xbVyDtAJEkmNOrjkkCHrV
   QcwD3WnNgdm40ngKEX16xNFGYwzaUPNuIUV0/IT/xOSuTnN73dBmnG5Xq
   rUce+3VXfQh0+Z+fk4H6HxBvjOIlludSu0FUGkvhC27l1ReVPRcouuSu0
   MZ1tSb/1t/3D1bgZVZVC0v9o6/QIAvcH7pUZEYEFr/PnFW8ZiPz5FSYJZ
   w==;
X-CSE-ConnectionGUID: yOtpj79qRlmzsqBMsQ+FtQ==
X-CSE-MsgGUID: sMmc2h+aQRyCsZYnAfYtnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69225938"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="69225938"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 05:29:02 -0700
X-CSE-ConnectionGUID: oWTZLb2CQeq6c17koXOY3Q==
X-CSE-MsgGUID: EYEvX8S6S7m+lTPNE8bR9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="148096839"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.148])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 05:29:00 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8A94A11FB50;
	Wed, 11 Jun 2025 15:28:57 +0300 (EEST)
Date: Wed, 11 Jun 2025 12:28:57 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH] media: dw9714: add support for powerdown pin
Message-ID: <aEl2idu0E9EZIkpn@kekkonen.localdomain>
References: <20250611-dw9714-sd-v1-1-fb47ef5e736c@emfend.at>
 <aElNcDTLEJTcJs2s@kekkonen.localdomain>
 <f4ebc809-f30e-46aa-9f36-db98370ebe6e@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4ebc809-f30e-46aa-9f36-db98370ebe6e@emfend.at>

Hi Matthias,

On Wed, Jun 11, 2025 at 02:15:10PM +0200, Matthias Fend wrote:
> Hi Sakari,
> 
> thanks for your comments.
> 
> Am 11.06.2025 um 11:33 schrieb Sakari Ailus:
> > Hi Matthias,
> > 
> > Thanks for the patch.
> > 
> > On Wed, Jun 11, 2025 at 09:13:33AM +0200, Matthias Fend wrote:
> > > Add support for the powerdown pin (xSD), which can be used to put the VCM
> > > driver into power down mode. This is useful, for example, if the VCM
> > > driver's power supply cannot be controlled.
> > > The use of the powerdown pin is optional.
> > 
> > Please rewrap. Most editors can do it for you.
> 
> To me the message body looks line wrapped at 75 columns. The last sentence
> on a new line. At least that is what was intended.
> So I think I'm missing something here. Can you please tell me what exactly I
> should change?

It should look like this (i.e. the lines shouldn't be longer than 75 but
also as long as that rule allows):

Add support for the powerdown pin (xSD), which can be used to put the VCM
driver into power down mode. This is useful, for example, if the VCM
driver's power supply cannot be controlled. The use of the powerdown pin is
optional.

> 
> > 
> > > 
> > > Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> > > ---
> > >   drivers/media/i2c/Kconfig  |  2 +-
> > >   drivers/media/i2c/dw9714.c | 16 ++++++++++++++++
> > >   2 files changed, 17 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index e45ba127069fc0848f1a06ceb789efd3c222c008..e923daeec9c574c5b8c7014b9e83fcbad47866c0 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -748,7 +748,7 @@ config VIDEO_AK7375
> > >   config VIDEO_DW9714
> > >   	tristate "DW9714 lens voice coil support"
> > > -	depends on I2C && VIDEO_DEV
> > > +	depends on GPIOLIB && I2C && VIDEO_DEV
> > >   	select MEDIA_CONTROLLER
> > >   	select VIDEO_V4L2_SUBDEV_API
> > >   	select V4L2_ASYNC
> > > diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
> > > index 2ddd7daa79e28a2cde915b4173fa27e60d5a2b57..5b78c1848f80bc3e32df13d149f3865ff8defe6e 100644
> > > --- a/drivers/media/i2c/dw9714.c
> > > +++ b/drivers/media/i2c/dw9714.c
> > > @@ -2,6 +2,7 @@
> > >   // Copyright (c) 2015--2017 Intel Corporation.
> > >   #include <linux/delay.h>
> > > +#include <linux/gpio/consumer.h>
> > >   #include <linux/i2c.h>
> > >   #include <linux/module.h>
> > >   #include <linux/pm_runtime.h>
> > > @@ -38,6 +39,7 @@ struct dw9714_device {
> > >   	struct v4l2_subdev sd;
> > >   	u16 current_val;
> > >   	struct regulator *vcc;
> > > +	struct gpio_desc *powerdown_gpio;
> > >   };
> > >   static inline struct dw9714_device *to_dw9714_vcm(struct v4l2_ctrl *ctrl)
> > > @@ -151,11 +153,20 @@ static int dw9714_probe(struct i2c_client *client)
> > >   	if (IS_ERR(dw9714_dev->vcc))
> > >   		return PTR_ERR(dw9714_dev->vcc);
> > > +	dw9714_dev->powerdown_gpio = devm_gpiod_get_optional(&client->dev,
> > > +							     "powerdown",
> > > +							     GPIOD_OUT_LOW);
> > > +	if (IS_ERR(dw9714_dev->powerdown_gpio))
> > > +		return dev_err_probe(&client->dev,
> > > +				     PTR_ERR(dw9714_dev->powerdown_gpio),
> > > +				     "could not get powerdown gpio\n");
> > > +
> > >   	rval = regulator_enable(dw9714_dev->vcc);
> > >   	if (rval < 0) {
> > >   		dev_err(&client->dev, "failed to enable vcc: %d\n", rval);
> > >   		return rval;
> > >   	}
> > > +	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 0);
> > 
> > This seems to be redundant, you're already setting the GPIO low when
> > acquiring it. Typically the order is different, though: the regulator is
> > enabled first. Also related to the following comment.
> 
> Yes, that's right. I'll set the pin during initialization so that power-down
> mode is active. So at least the sequence is always the same.
> 
> > 
> > >   	usleep_range(1000, 2000);
> > > @@ -185,6 +196,7 @@ static int dw9714_probe(struct i2c_client *client)
> > >   	return 0;
> > >   err_cleanup:
> > > +	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 1);
> > >   	regulator_disable(dw9714_dev->vcc);
> > 
> > It'd be nice to have a single implementation of the power-on and power-off
> > sequences. Now there are two.
> 
> Okay, will do so.

Please add a separate patch for this, before this one.

-- 
Regards,

Sakari Ailus


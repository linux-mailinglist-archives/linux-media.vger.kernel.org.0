Return-Path: <linux-media+bounces-29048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85FA76569
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A398D3A324A
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 12:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21C61E3779;
	Mon, 31 Mar 2025 12:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="odGzAfmV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B0F1D89FD;
	Mon, 31 Mar 2025 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743422895; cv=none; b=PUdVwR8urf72FwqI7WTh91KT1a3l833vT1qVzO/0l7jQCW5vOkEeqS9dp05FQTVF39IIxfQKk9O6OC7Yr9lEPJsMLsEpxbuIC2nkEm2UsZWYEWsx1UITSs7DkBRCZ9KX9yAm9RpGiHUSFYYDqHW/T7M20jCrOT0jBKl9xvtQ2go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743422895; c=relaxed/simple;
	bh=2SfSCQcYNxF578A2wNnE6Peexu1C8CZ9y0aZPHmZxeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7dEVlw6W6F0dzen56hugBDwRDeCRHcnd6g8LGtl2gPmYLCVgM30hD5zYAdShwqK5qd9fD8vDlEYMN80i94NbQ56//kod7IkXlXlyxBWcBjbGPnnbRYayo80rw/ogIswqxcLtRWWWY/S0X5hA+NFnwLm+74h6aSvRIbEEzCg0yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=odGzAfmV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26B713DA;
	Mon, 31 Mar 2025 14:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743422780;
	bh=2SfSCQcYNxF578A2wNnE6Peexu1C8CZ9y0aZPHmZxeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=odGzAfmVMBGRnDbtLl0ZYvsMhchM5eYvEUDk32nmxL2t/zkBBUkGfY6MYBncQCepS
	 ySrwD/eM7NzBCZ+UvWHPj0t5KGk7892ZTWpk4mdIsCDkOMaju52c9+O05Dj+YxO3rE
	 wIIRs7UNq3nOuScaXS+UidiMLL7RlA3UQ7k72FME=
Date: Mon, 31 Mar 2025 15:07:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	acopo Mondi <jacopo+renesas@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: i2c: rdacm2x: Make use of device properties
Message-ID: <20250331120748.GB28722@pendragon.ideasonboard.com>
References: <20250331073435.3992597-1-andriy.shevchenko@linux.intel.com>
 <174340899625.3687388.14660711739063778026@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174340899625.3687388.14660711739063778026@ping.linuxembedded.co.uk>

On Mon, Mar 31, 2025 at 09:16:36AM +0100, Kieran Bingham wrote:
> Quoting Andy Shevchenko (2025-03-31 08:34:35)
> > Convert the module to be property provider agnostic and allow
> > it to be used on non-OF platforms.
> 
> Looks reasonable to me.

Is that going to work out of the box though ? The calls below read the
"reg" property to get the device I2C addresses. AFAIK, ACPI handles I2C
addresses using ACPI-specific methods.

Andy, have you tested this patch on an ACPI system ?

> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/media/i2c/rdacm20.c | 5 ++---
> >  drivers/media/i2c/rdacm21.c | 5 ++---
> >  2 files changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> > index b8bd8354d100..dcab63d19baf 100644
> > --- a/drivers/media/i2c/rdacm20.c
> > +++ b/drivers/media/i2c/rdacm20.c
> > @@ -16,10 +16,10 @@
> >   */
> >  
> >  #include <linux/delay.h>
> > -#include <linux/fwnode.h>
> >  #include <linux/init.h>
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> > +#include <linux/property.h>
> >  #include <linux/slab.h>
> >  #include <linux/videodev2.h>
> >  
> > @@ -575,8 +575,7 @@ static int rdacm20_probe(struct i2c_client *client)
> >         dev->dev = &client->dev;
> >         dev->serializer.client = client;
> >  
> > -       ret = of_property_read_u32_array(client->dev.of_node, "reg",
> > -                                        dev->addrs, 2);
> > +       ret = device_property_read_u32_array(&client->dev, "reg", dev->addrs, 2);
> >         if (ret < 0) {
> >                 dev_err(dev->dev, "Invalid DT reg property: %d\n", ret);
> 
> But this is no longer a DT reg property ?
> 
> >                 return -EINVAL;
> > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > index 3e22df36354f..5ea6988de48b 100644
> > --- a/drivers/media/i2c/rdacm21.c
> > +++ b/drivers/media/i2c/rdacm21.c
> > @@ -11,10 +11,10 @@
> >   */
> >  
> >  #include <linux/delay.h>
> > -#include <linux/fwnode.h>
> >  #include <linux/init.h>
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> > +#include <linux/property.h>
> >  #include <linux/slab.h>
> >  #include <linux/videodev2.h>
> >  
> > @@ -551,8 +551,7 @@ static int rdacm21_probe(struct i2c_client *client)
> >         dev->dev = &client->dev;
> >         dev->serializer.client = client;
> >  
> > -       ret = of_property_read_u32_array(client->dev.of_node, "reg",
> > -                                        dev->addrs, 2);
> > +       ret = device_property_read_u32_array(&client->dev, "reg", dev->addrs, 2);
> >         if (ret < 0) {
> >                 dev_err(dev->dev, "Invalid DT reg property: %d\n", ret);
> 
> Same here ...
> 
> With those fixed,
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> >                 return -EINVAL;

-- 
Regards,

Laurent Pinchart


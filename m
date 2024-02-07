Return-Path: <linux-media+bounces-4825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB8B84CCD3
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 15:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01011B22892
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 14:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9027E57A;
	Wed,  7 Feb 2024 14:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bonUAQWM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2367A73C
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 14:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707316459; cv=none; b=haGywb0j9AAibyVDOq1PrzTrUQNPXNXS5TCZ/SxEkYy+GGk3sFxgCcNBXb0yhN/Ojl7L1bYWnYCQlzqE9BHGOWdoVYdgY2GZF3QOZDzS9wCGw6eathe27Db0vok7KW6lpq2ZYV/bccoitLMxwNYDGoCioEa7gMMnoWrH4xsbuSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707316459; c=relaxed/simple;
	bh=ietjK9NAzUnEgA8ygsgQepi51SQOUIydrfd0UXqW1Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZVmyLe33FqDdDySdZQDsuF95N4zaO8maf9u21iYipT512Ut4ofJoOe56JUvTjGvzW8CNo8emRYmC2g7/N3mSN5M24N5TjwzZQBTZ/yT1cDIlGVGaVyr/SZkxxambj/1aPXT+EHcmXqCxkDlTdrAd8TL2+UBHJJ0Z9a/KFlyOKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bonUAQWM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46B24975;
	Wed,  7 Feb 2024 15:32:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707316372;
	bh=ietjK9NAzUnEgA8ygsgQepi51SQOUIydrfd0UXqW1Q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bonUAQWM/1v5TX64Ej/bcYqFAFiQuV/mI8eyPj9fGEMJ/GRK2wP3B4TmeZo2BIvEB
	 HkzluNVq+4ZqM94LbaR5b0k6G0i/AJ+PyXi/1/avCHdJ3joiNC9T+Q9zrbkgx1VXa/
	 oN4wm33+FnokpIC2Xe9tvRBV5Jr4nQ+LLeMKMZ/U=
Date: Wed, 7 Feb 2024 16:34:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 21/29] media: ipu3-cio2: Request IRQ earlier
Message-ID: <20240207143418.GS23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-22-sakari.ailus@linux.intel.com>
 <3a6fe3d1-8b1d-411e-83c9-9611ce4aea67@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3a6fe3d1-8b1d-411e-83c9-9611ce4aea67@xs4all.nl>

On Mon, Feb 05, 2024 at 03:58:45PM +0100, Hans Verkuil wrote:
> On 20/12/2023 11:37, Sakari Ailus wrote:
> > Call devm_request_irq() before registering the async notifier, as otherwise
> > it would be possible to use the device before the interrupts could be
> > deliveted to the driver.
> 
> deliveted -> delivered
> 
> Isn't this a regular fix? Ditto for the previous patch (20/29).
> 
> I'd just queue this up in the next PR.

Fixes: tags would then be nice.

> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > index da82d09b46ab..3222ec5b8345 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > @@ -1789,11 +1789,6 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
> >  
> >  	v4l2_async_nf_init(&cio2->notifier, &cio2->v4l2_dev);
> >  
> > -	/* Register notifier for subdevices we care */
> > -	r = cio2_parse_firmware(cio2);
> > -	if (r)
> > -		goto fail_clean_notifier;
> > -
> >  	r = devm_request_irq(dev, pci_dev->irq, cio2_irq, IRQF_SHARED,
> >  			     CIO2_NAME, cio2);
> >  	if (r) {
> > @@ -1801,6 +1796,11 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
> >  		goto fail_clean_notifier;
> >  	}
> >  
> > +	/* Register notifier for subdevices we care */
> > +	r = cio2_parse_firmware(cio2);
> > +	if (r)
> > +		goto fail_clean_notifier;
> > +
> >  	pm_runtime_put_noidle(dev);
> >  	pm_runtime_allow(dev);
> >  

-- 
Regards,

Laurent Pinchart


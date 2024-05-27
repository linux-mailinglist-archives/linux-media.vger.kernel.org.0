Return-Path: <linux-media+bounces-11921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AE58CFC22
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 10:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A12CB2840CB
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 08:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB16713174B;
	Mon, 27 May 2024 08:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="RJMxe4Ej"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BD85916B
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 08:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799704; cv=pass; b=P/HNIBQQ7cIDXJasHNHq/CioiItck/giIhJGIMRkli9zncTgNnR98sowdIwOeoMP5wtkcXeh/6zgWlbIZTnfqO2zwYCe7OBNqrJBiBYZ2i8phZHYjqQIi4+2FMhcMBZVwX0e0M2Luhr+4Q7F1YM0I17MtMxcSvCt+NdpWsyLrQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799704; c=relaxed/simple;
	bh=g0Rz7cxLg0UC66auKGnd3eySNn0tU0v1zai4T/0RrHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1ZCCEOJYwz2XpqW03Wt5wMSSBdSHCyIXF5J+BZIpWelef6bFemOnXIT/AoirnM5xY2wj1VURrPX7Q+VF6Cvpgm9DzZycgbaBjdYZA7v/yrxwGKDxsvmrC5owfLqCYdAw4G+SWqrLpA4uj0hzJTbxGS5fYZUmSJzPLu8X6+VHiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=RJMxe4Ej; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Vnq6p3KkxzyQm;
	Mon, 27 May 2024 11:48:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1716799699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HFKD0Cu1iWtA5ZGI5SYqn4+/xpTCMkvvHQWeNXdgowA=;
	b=RJMxe4EjvPfZ71G0df8JEZOwbD2tdCSxbzeljtWqivRcxFcyfcYnHac6fuvA3lMyeSN8jm
	jTJa2ytsrRp4/vuNnLSaADj66DuDD4KseNlEvI3V/n+des5+EUrjaNofNL7H0SAgU5Xv3y
	7Q03t4weG0KAgsg/FYO+pk93CbuIr9g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1716799699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HFKD0Cu1iWtA5ZGI5SYqn4+/xpTCMkvvHQWeNXdgowA=;
	b=dURe9J1Ckbz+8KhIx7mvIuaIkA75R1iplpNd3vvxLFZO6tU9Arn5sS4cFAiLp4to5JGVcp
	b7m77TFFO0PJe0FmxHZidL/uOVNGX/OwKXKJh3Yvt/Cj/mmgrivoQFUMjsPB9iRr9ocpa7
	yIGEUg0Ob9RIOW68W4VhOODdCe2yrFU=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1716799699; a=rsa-sha256; cv=none;
	b=r/n+LYO4fB/X9U/bXqdqjJHXtuflLs5HkDXQTwp8MB2gRQ/VlZURUU7oo4HEpsRxDCF2oh
	N0T9AleZEswqgvJpOevGsHt9pd5L4pRj56LMN7+UR0t19RYGpKgHC78kH8SD1E6pcqPd+Y
	J8RbRRszblo6V2NoOg+L75ch7iQssHY=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EB54D634C93;
	Mon, 27 May 2024 11:45:22 +0300 (EEST)
Date: Mon, 27 May 2024 08:45:22 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v7 7/8] media: raspberrypi: Add support for PiSP BE
Message-ID: <ZlRIIv3PHJQyysEm@valkosipuli.retiisi.eu>
References: <20240524140024.161313-1-jacopo.mondi@ideasonboard.com>
 <20240524140024.161313-8-jacopo.mondi@ideasonboard.com>
 <ZlOimSRFNNt1fdN3@valkosipuli.retiisi.eu>
 <lqo77pdefh6f5ynxu32s24paj2qa22rc6pih623mhywifgr4pw@kt4iic67ljfz>
 <ZlRAyMCduqsxYaQu@valkosipuli.retiisi.eu>
 <20240527083133.GB2986@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527083133.GB2986@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, May 27, 2024 at 11:31:33AM +0300, Laurent Pinchart wrote:
> On Mon, May 27, 2024 at 08:14:00AM +0000, Sakari Ailus wrote:
> > Hi Jacopo,
> > 
> > On Mon, May 27, 2024 at 09:56:00AM +0200, Jacopo Mondi wrote:
> > > > > +#include <linux/media/raspberrypi/pisp_be_config.h>
> > > >
> > > > Where is the header included from? If it's just this driver, then I'd put
> > > > it in the driver's directory.
> > > 
> > > It's the uAPI header file. Or did I miss your question ?
> > 
> > If it's uapi, then you should have uapi in its header path. I.e.
> > 
> > #include <uapi/linux...>
> > 
> > > > > +	/* Everything else is as supplied by the user. */
> > > > > +	begin =	offsetof(struct pisp_be_config, global.bayer_order)
> > > > > +	      / sizeof(u32);
> > > >
> > > > The slash should be on the previous line. Same elsewhere.
> > > >
> > > 
> > > Please, this is highly subjective and other people (like Laurent) often
> > > ask for the contrary. Without any polemic intent, I encourage reviewers
> > > (myself included) in considering how much time we spend (and
> > > demand) on such subjective issues. Even more when other reviewers might have
> > > different opinions, with the end result of pulling contributors in
> > > different directions.
> > 
> > Having binary operators at the beginning of a statement split on multiple
> > lines is simply uncommon, perhaps around 10 % of the cases in the media
> > tree based on a quick look. Keeping the coding style consistent is
> > beneficial for us all.
> 
> I've been slowly but steadily working on increasing that number :-) I
> think the style above is the most readable, and I would leave it to
> driver authors (as long as they're consistent within a driver).

This has been one of the differences between what's commonly (albeit not
explicitly I guess) used in Linux compared to the GNU coding standards
which is explicit about it.

I prefer to keep it at the end of the line which apparently is the
preference of a largish majority.

...

> > > > > +	/* Hardware initialisation */
> > > > > +	pm_runtime_set_autosuspend_delay(pispbe->dev, 200);
> > > > > +	pm_runtime_use_autosuspend(pispbe->dev);
> > > > > +	pm_runtime_enable(pispbe->dev);
> > > > > +
> > > > > +	ret = pm_runtime_resume_and_get(pispbe->dev);
> > > >
> > > > You'll need to call the driver's resume function manually instead. The
> > > > above depends on CONFIG_PM.
> > > 
> > > The driver selects CONFIG_PM, doesn't it ?
> > 
> > It depends on PM.
> > 
> > It'd be trivial to remove that dependency.
> 
> For drivers such as sensor drivers that need to work on a wide variety
> of platforms, with varying configurations, I agree that not depending on
> CONFIG_PM is a good thing (I reserve the right to change my mind though
> :-)). For this driver, I don't think the dependency is an issue.

People tend to copy these from one driver to another so there is value in
doing it properly even if the benefits for this driver might be minor.

-- 
Regards,

Sakari Ailus


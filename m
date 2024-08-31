Return-Path: <linux-media+bounces-17265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE5F966E50
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 02:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3A9E1C227BB
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 00:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437DC1BC39;
	Sat, 31 Aug 2024 00:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PC0sz0wb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92354134A8;
	Sat, 31 Aug 2024 00:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725065663; cv=none; b=qXtwAhnLQSzPI3MQcKDCQz5rtjFg04ayb5HAK5XeaiSmKu1yeZeyfNpRUzkgrSIyioixfPHyAbRRls4Vny5L359UPOai/7u35L3vdPztSzYzaAPxUuUJO7rPIbmgP7Kfnfzge8UPGFfl5WMFQX9ZQJjdMasFvHwTd5G+7gdGUMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725065663; c=relaxed/simple;
	bh=pLXEs8HCiSuPrL0F/bTvEb3NZZP2lknUsKAddUG+j0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgZ/kw2XxG0IM7Dt+ka3fTcKUxVY9jm/f64kkp7yeJ7qvCIlwspZRw8/IPbr+Z8IcQVb5/53qpiURzncRlwLeT9UGRpslYj0xpXRKABLy/e8dCK9PD4E4BGuTuk2yEtPF5iJnwvh+HwYLYHEVKZxECEcEdJ0WvekbwvXehvH0uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PC0sz0wb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC38274C;
	Sat, 31 Aug 2024 02:53:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725065585;
	bh=pLXEs8HCiSuPrL0F/bTvEb3NZZP2lknUsKAddUG+j0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PC0sz0wb0a8X4G8RhIBDV481u6srFDTbnX0FFxR7Gpr42syeN0ehVj9s1IVO/q9fc
	 9c4HBPpySENzK6/khZnBp8TFIBS3Z2OytsBMQnRwK+JkMTJgJh1UPJUpO/TuCNsOjj
	 pKbK/48FtpJQb7egkCjLPloatBS+MImxLVfXmjww=
Date: Sat, 31 Aug 2024 03:53:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Benjamin Bara <bbara93@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v2 1/2] media: i2c: imx290: Check for availability in
 probe()
Message-ID: <20240831005342.GA27958@pendragon.ideasonboard.com>
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
 <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com>
 <20240829131909.GD12951@pendragon.ideasonboard.com>
 <20240829163247.ovsst5ipecthtc6u@thinkpad>
 <20240829164843.GA15799@pendragon.ideasonboard.com>
 <20240830083107.4h5ryhcq6e6e5dw3@thinkpad>
 <20240830092526.GE25163@pendragon.ideasonboard.com>
 <20240830122529.6dcqamcxk6crfpvb@thinkpad>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240830122529.6dcqamcxk6crfpvb@thinkpad>

On Fri, Aug 30, 2024 at 05:55:29PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Aug 30, 2024 at 12:25:26PM +0300, Laurent Pinchart wrote:
> > On Fri, Aug 30, 2024 at 02:01:07PM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Aug 29, 2024 at 07:48:43PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Aug 29, 2024 at 10:02:47PM +0530, Manivannan Sadhasivam wrote:
> > > > > On Thu, Aug 29, 2024 at 04:19:09PM +0300, Laurent Pinchart wrote:
> > > > > 
> > > > > Hi Laurent,
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > > +		dev_err(dev, "Sensor is not in standby mode\n");
> > > > > > > +		ret = -ENODEV;
> > > > > > > +		goto err_pm;
> > > > > > > +	}
> > > > > > > +
> > > > > > 
> > > > > > My last concern is about accessing hardware at probe time. There are
> > > > > > known cases where this is problematic. They can be split in two
> > > > > > categories, systems that exhibit unwanted side effects when powering the
> > > > > > sensor up, and systems where the sensor can't be accessed at probe time.
> > > > > > 
> > > > > > The two issues I can think of in the first category is devices that have
> > > > > > a camera privacy light that could cause worries among users if it
> > > > > > flashes at boot time, and devices that agressively optimize boot time.
> > > > > > 
> > > > > > In the second category, I know that some people use camera serdes
> > > > > > (FPD-Link, GMSL, ...) that are controlled by userspace. As they should
> > > > > > instead use kernel drivers for those components, upstream may not care
> > > > > > too much about this use case. Another issue I was told about was a
> > > > > > device booting in temperatures that were too low for the camera to
> > > > > > operate, which then needed half an hour to heat the device enclosure
> > > > > > before the sensor and serdes could be accessed. That's a bit extreme,
> > > > > > but it sounds like a valid use case to me.
> > > > > > 
> > > > > > What do we do with those cases ? Detecting devices at probe time does
> > > > > > have value, so I think it should be a policy decision. We may want to
> > > > > > convey some of that information through DT properties (I'm not sure what
> > > > > > would be acceptable there though). In any case, that's quite a bit of
> > > > > > yak shaving, so I'm inclined to accept this series (or rather its next
> > > > > > version), given that quite a few other camera sensor drivers detect the
> > > > > > device at probe time. I would however like feedback on the problem to
> > > > > > try and find a good solution.
> > > > > 
> > > > > Most of the issues you mentioned applies to other hardware peripherals also IMO.
> > > > > And it is common for the drivers to read registers and make sure the device is
> > > > > detected on the bus during probe().
> > > > 
> > > > That's true. I think the problem affects different device types
> > > > differently though, and this may (or may not) call for different
> > > > solutions.
> > > > 
> > > > > If an usecase doesn't want to read the
> > > > > registers during probe time, then they _should_not_ build the driver as built-in
> > > > > rather make it as a loadable module and load it whenever necessary. This applies
> > > > > to boot time optimization as well.
> > > > 
> > > > For most of the use cases I listed I agree with you. One exception is
> > > > the privacy light issue. Regardless of when the camera sensor driver is
> > > > loaded, powering the device at probe time will flash the privacy light.
> > > > Doing so later than boot time would probably make the issue even worse,
> > > > I would worry more if I saw my webcam privacy light flashing at a random
> > > > point after boot time.
> > > 
> > > I'm not familiar with the privacy light feature in camera sensors, but is there
> > > no way to prevent it from enabling by default? If that's not possible, it makes
> > > sense to disable it using a DT property as it is a hardware feature.
> > 
> > The whole point of the privacy light is that it shouldn't be possible to
> > disable it by software. Otherwise malicious software could try to work
> > around it. On many devices it is hardwired to one of the camera sensor's
> > power supplies.
> 
> Ah okay, please forgive my ignorance here. But still I'm not sure about the DT
> usage. Maybe it is best to send out a bindings patch and see what the
> maintainers have to say?

Yes, that's a good path forward. I don't think it should block this
patch though.

-- 
Regards,

Laurent Pinchart


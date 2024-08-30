Return-Path: <linux-media+bounces-17223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8106E965CCA
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 11:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 317BA1F244CF
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 09:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5A517A5B2;
	Fri, 30 Aug 2024 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n7JXn9PQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2106217839D;
	Fri, 30 Aug 2024 09:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725009960; cv=none; b=XUuOK3UywVQ0JPKDAlTl3DAQqHkHy/PfBaqxG4+E8iwKvNI2D9cG+z195c1657M+V7Jh6i99qjn1tp5vBE3Z8EPihn8ZqBJSX8SwddJA7AawqEUn8AF9o+xylwmA3E8SnbeIYne0UHBVHW/mRTTB91+ObcdIyiV+nkmofaXATqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725009960; c=relaxed/simple;
	bh=yt0IjaTL6kWf85KWlWWslTSM1oe3LVytQN8Dx49IB9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sffSlR6hfKcxrwPwW3IWw2bRKlBsT719ymRWLjwXAh9KKPz0Cr7VRW/tzmh1YWEy8ZFbUlaKzMjzxA4DNfubsbPhVVFACZVR42F0p56V42vvi+43cbQqXODYDlrGnNIDiAJn6QjdJNcwfubLA7ckp2HNib9QCSeLy7xBEXtEBgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n7JXn9PQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D8CB227;
	Fri, 30 Aug 2024 11:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725009888;
	bh=yt0IjaTL6kWf85KWlWWslTSM1oe3LVytQN8Dx49IB9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7JXn9PQXX2guuDPTzc5CNm+o5VflkFnH4U8RXSYp/vyrw68l7zE5bsp+OFm/P0uK
	 wqmBu/w+AnOUkXDAtDb0aEuDGS+9aj+u9GtBoSBCtIdPjRwVoxMASqqBQmwHboyGG9
	 I6DOzJv8suMkLk9jlBmJ7Az+niixyMOba0gb+200=
Date: Fri, 30 Aug 2024 12:25:26 +0300
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
Message-ID: <20240830092526.GE25163@pendragon.ideasonboard.com>
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
 <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com>
 <20240829131909.GD12951@pendragon.ideasonboard.com>
 <20240829163247.ovsst5ipecthtc6u@thinkpad>
 <20240829164843.GA15799@pendragon.ideasonboard.com>
 <20240830083107.4h5ryhcq6e6e5dw3@thinkpad>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240830083107.4h5ryhcq6e6e5dw3@thinkpad>

On Fri, Aug 30, 2024 at 02:01:07PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Aug 29, 2024 at 07:48:43PM +0300, Laurent Pinchart wrote:
> > On Thu, Aug 29, 2024 at 10:02:47PM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Aug 29, 2024 at 04:19:09PM +0300, Laurent Pinchart wrote:
> > > 
> > > Hi Laurent,
> > > 
> > > [...]
> > > 
> > > > > +		dev_err(dev, "Sensor is not in standby mode\n");
> > > > > +		ret = -ENODEV;
> > > > > +		goto err_pm;
> > > > > +	}
> > > > > +
> > > > 
> > > > My last concern is about accessing hardware at probe time. There are
> > > > known cases where this is problematic. They can be split in two
> > > > categories, systems that exhibit unwanted side effects when powering the
> > > > sensor up, and systems where the sensor can't be accessed at probe time.
> > > > 
> > > > The two issues I can think of in the first category is devices that have
> > > > a camera privacy light that could cause worries among users if it
> > > > flashes at boot time, and devices that agressively optimize boot time.
> > > > 
> > > > In the second category, I know that some people use camera serdes
> > > > (FPD-Link, GMSL, ...) that are controlled by userspace. As they should
> > > > instead use kernel drivers for those components, upstream may not care
> > > > too much about this use case. Another issue I was told about was a
> > > > device booting in temperatures that were too low for the camera to
> > > > operate, which then needed half an hour to heat the device enclosure
> > > > before the sensor and serdes could be accessed. That's a bit extreme,
> > > > but it sounds like a valid use case to me.
> > > > 
> > > > What do we do with those cases ? Detecting devices at probe time does
> > > > have value, so I think it should be a policy decision. We may want to
> > > > convey some of that information through DT properties (I'm not sure what
> > > > would be acceptable there though). In any case, that's quite a bit of
> > > > yak shaving, so I'm inclined to accept this series (or rather its next
> > > > version), given that quite a few other camera sensor drivers detect the
> > > > device at probe time. I would however like feedback on the problem to
> > > > try and find a good solution.
> > > 
> > > Most of the issues you mentioned applies to other hardware peripherals also IMO.
> > > And it is common for the drivers to read registers and make sure the device is
> > > detected on the bus during probe().
> > 
> > That's true. I think the problem affects different device types
> > differently though, and this may (or may not) call for different
> > solutions.
> > 
> > > If an usecase doesn't want to read the
> > > registers during probe time, then they _should_not_ build the driver as built-in
> > > rather make it as a loadable module and load it whenever necessary. This applies
> > > to boot time optimization as well.
> > 
> > For most of the use cases I listed I agree with you. One exception is
> > the privacy light issue. Regardless of when the camera sensor driver is
> > loaded, powering the device at probe time will flash the privacy light.
> > Doing so later than boot time would probably make the issue even worse,
> > I would worry more if I saw my webcam privacy light flashing at a random
> > point after boot time.
> 
> I'm not familiar with the privacy light feature in camera sensors, but is there
> no way to prevent it from enabling by default? If that's not possible, it makes
> sense to disable it using a DT property as it is a hardware feature.

The whole point of the privacy light is that it shouldn't be possible to
disable it by software. Otherwise malicious software could try to work
around it. On many devices it is hardwired to one of the camera sensor's
power supplies.

> > > A DT property wouldn't be feasible as DT is supposed to describe the hardware,
> > > not the usecase.
> > 
> > I think that rule is typically slightly relaxed, by allowing in DT
> > system descriptions, not just hardware descriptions. Otherwise we
> > wouldn't allow things like reserved memory ranges. Describing that a
> > camera sensor has a privacy light, in a way that would allow drivers to
> > avoid powering up the device at probe time without requiring much
> > duplicated code in all drivers, would in my opinion be an acceptable DT
> > usage.
> 
> Well, I agree with you. As I said above, privacy light is a hardware feature, so
> we can enable/disable it using a DT property. My comment about the DT property
> applies only to detecting the devices during probe time, which is a
> driver/usecase dependent feature.

-- 
Regards,

Laurent Pinchart


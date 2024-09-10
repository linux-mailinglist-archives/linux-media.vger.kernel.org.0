Return-Path: <linux-media+bounces-18064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 526B5973167
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 12:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 754231C2567E
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 10:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5933E19005D;
	Tue, 10 Sep 2024 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t6MrLWea"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D7418C331;
	Tue, 10 Sep 2024 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725962805; cv=none; b=X0uM0lSXplO28ViVk7DUyR5SpV7vIJtRnvzBCrXq2AUfCdZEg1628qoNW66G9peBDNsLaLwMvmfn0KLtjykxS9A7VDK3Cnm7SRQZvEMlugqqGWRI3YLTa6WCRUeyYN2XBy6MWcGry7pNim0Zdx7WjKyb4M08zW9NqJdspWoIPKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725962805; c=relaxed/simple;
	bh=qRP4ALNKD5dj2TC3hY3hzYkODtfa0xHzrUb9GlW6tMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maKKGvb0V8vkhFvzkGkD3OAALeKbsb5ihVQV81cFkMxscr9/TUREOrCX6RWf/iQ7ZePCm0J7dh7HpRH8FfdyKCo+yhuxQ/BFEM34s5PtTVc63ZyNRS/QnWF6v+kHywwXlGjw7e7G6CfKa0BwlAMM5yNbWM9tpGUYh649JEjX9BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t6MrLWea; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 042433EA;
	Tue, 10 Sep 2024 12:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725962725;
	bh=qRP4ALNKD5dj2TC3hY3hzYkODtfa0xHzrUb9GlW6tMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6MrLWeaJ8twnv04KN60ubMnSKaq4QwAMx2wMRjVLXkjDgd2DGF5QXnhGdhbTkp8p
	 ZgR7aY7RLWqVo6z7XvPrKLTRzpS4cXch5Hvtro00qj3sGHh+OU+J8OxjEJHpcoM0GY
	 qdG/615/JLB3P4z8vKS3VcdTGfbwPRgrrHf3Gwcs=
Date: Tue, 10 Sep 2024 13:06:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/4] media: raspberrypi: Add support for RP1-CFE
Message-ID: <20240910100608.GC6996@pendragon.ideasonboard.com>
References: <763b3147-d7cb-44a7-b73b-8f7f4fd622ab@ideasonboard.com>
 <yib2r4wisxvk3kgogbjqawrpmfq6lcezfk4xjmftj44jzkbclc@icapodv2ffzk>
 <d5188c0a-4a52-4378-89b1-48f606e448cc@ideasonboard.com>
 <ggtlreq5gyhzfdv6yzeuia46y7fxpuyvg236prig52t43xsl2a@crlqks2nhfpe>
 <20240909134516.GA9448@pendragon.ideasonboard.com>
 <Zt8ZysTT5DIZr-J7@kekkonen.localdomain>
 <jdtjdspf4qyrgn6jmyxeab5ueo53wjd5vuhvlpin3pdiyifwht@dndfcqnmv7sd>
 <ZuAQpITcee2SSYKk@kekkonen.localdomain>
 <6u2g4v4ktt543sy5jlp3vonemhzhrwyz2liikg6jb2kx3h7jao@z6s233clqwqk>
 <ZuAXiKjdgMUY1jcV@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuAXiKjdgMUY1jcV@kekkonen.localdomain>

On Tue, Sep 10, 2024 at 09:55:20AM +0000, Sakari Ailus wrote:
> On Tue, Sep 10, 2024 at 11:42:06AM +0200, Jacopo Mondi wrote:
> > > > > > > > Ah, I missed that one.
> > > > > > > >
> > > > > > > > I don't think it fixes the issue I mentioned. If we have PM enabled, and the
> > > > > > > > parent device requires powering up for the child device (BE) to be
> > > > > > > > accessible, the driver will crash when calling pispbe_hw_init(). I think you
> > > > > > > > should call pm_runtime_set_active() before calling pispbe_runtime_resume().
> > > > > > >
> > > > > > > As discussed, this is not a problem currently for BE, but indeed you
> > > > > > > have a point.
> > > >
> > > > I admit the runtime_pm intrinsics are obscure to me, but Laurent just
> > > > made me notice something.
> > > >
> > > > Consider the following scenario
> > > >
> > > > *) Kernel compiled with CONFIG_PM
> > > > *) i2c sensor driver that supports both CONFIG_PM and !CONFIG_PM by:
> > > >   *) Manually power up the sensor during probe
> > > >   *) Call pm_runtime_enable() and pm_runtime_set_active() at the end
> > > >      of the probe routine after having accessed the chip over i2c
> > > >      (like most, if not all the i2c drivers in mainline do including
> > > >      ccs)
> > > >
> > > > All these drivers work, and during the probe routine before accessing
> > > > the HW, they don't need to power up the parent i2c controller.
> > >
> > > This isn't done explicitly by the I²C drivers, indeed but...
> > >
> > > >
> > > > Might it be that during probe() the parent is guaranteed to be enabled ?
> > >
> > > ...yes.
> > >
> > 
> > Unrelated, but I am wrong the driver core calls pm_request_idle() on
> > the just probed device ? Does this mean drivers doesn't have to do
> > that by themseleves ? (it's not a big deal, as request_idle() doesn't
> > change the usage counter)
> 
> Seems like that. This could be omitted from drivers then.

Is that guaranteed, or is it an implementation detail that could change
at any time ?

> > > > I add a look in the driver-core and pm Documentation/ but found
> > > > nothing.
> > > >
> > > > A quick stroll in driver/base/ got me to __device_attach() and it
> > > > seems parents are powered up before attaching a driver to a device
> > > > (which in my understanding should be what ends up calling probe()).
> > > > Clearly I've no real understanding of what I'm talking about when it
> > > > comes to driver-core, so take this with a grain of salt.
> > >
> > > This only works with runtime PM enabled.
> > 
> > It's the CONFIG_PM case that was worrying for Tomi
> > 
> > > > > > > Sad note: most of all the occurrences of "grep set_active" in
> > > > > > > drivers/media/platform/ show that set_active() is used as I've done in
> > > > > > > my patch
> > > > > > >
> > > > > > > > However, you said above that "supporting !CONFIG_PM is not that much work".
> > > > > > > > Maybe not. But how much work is it to get it right (for both PM and !PM),
> > > > > > > > and make sure it stays right? =).
> > > > > > > >
> > > > > > > > Just my opinion, but if there are zero use cases for the !PM, I would just
> > > > > > > > go with "depends on PM" to keep the driver simpler, less bug-prone, and
> > > > > > > > easier to maintain.
> > > > > >
> > > > > > I'm fine with that, and for platform drivers, that's my preferred
> > > > > > option. Sakari ?
> > > > >
> > > > > I'm concerned with your (?) recent finding that many architectures don't
> > > > > have support for CONFIG_PM. In this case the device is very unlikely to be
> > > > > used outside ARM(64) so I guess it's fine.
> > > > >
> > > >
> > > > Also, this IP is RPi specific, and the !CONFIG_PM case is not used or
> > > > tested on Pi.
> > > >
> > > > However, I think this current patch is correct (assuming the above
> > > > reasoning on i2c sensor drivers is correct) and doesn't require
> > > > CONFIG_PM, so I would be tempted to keep this version.
> > >
> > > I understand the current patch does depend on CONFIG_PM: it requires
> > > runtime PM to be operational to start the clock, for instance.
> > 
> > Where do you see that ?
> > 
> > This version still calls pispbe_runtime_resume() to power up the IP,
> > it doesn't go through runtime_pm:
> > https://patchwork.linuxtv.org/project/linux-media/patch/20240904095836.344833-5-jacopo.mondi@ideasonboard.com/
> 
> cfe_runtime_resume() is only called via runtime PM.
> 
> > Thanks!
> > 
> > > > > > > I don't see a use case for !PM and we confirmed with RPi they don't
> > > > > > > need to support it. During the review of a previous version of the BE
> > > > > > > driver iirc I've been asked to support !PM but I'm not sure I recall
> > > > > > > the reasons.
> > > > > >
> > > > > > I hope it wasn't me :-)
> > > > >
> > > > > Me neither. Although it'd be nice: CONFIG_PM isn't a hardware specific
> > > > > option as such. As one part of the kernel requires !CONFIG_PM and another
> > > > > CONFIG_PM, we can expect problems, at least in principle.
> > > > >
> > > > > Ideally all architectures would support it so CONFIG_PM could be removed
> > > > > and we could say the problem has been solved. :-)

-- 
Regards,

Laurent Pinchart


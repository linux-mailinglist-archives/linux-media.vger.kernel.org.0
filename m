Return-Path: <linux-media+bounces-16768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE6595ECC1
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 11:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 205DA1C2167B
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 09:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C02F13DBBF;
	Mon, 26 Aug 2024 09:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RM+YBKI3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3006084A4D
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663320; cv=none; b=Udkmj1N0DLmX2sVqsV3snOs4g4+z9hvLBvRqqC5c1mjoH7RYD59Fv56jbqYDp9TiqihS42jl4CB2nmBUcr/gVCLvqzzxVoHj2yGY7GrC+7w5Tgvt2kwkR+m8wcJ6VS0HvEVl+2RwSFZdUQcFL4Tu9YEOIYrkFqZ4XtvEAzfFcGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663320; c=relaxed/simple;
	bh=hdmP5+QZtMZxAvEcqArDer6bvlbzmXGdIEkg61HnPg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOqqfifs1dh6RKlG16DNhnhxXkt0/CSsXoooHI3/65gUUiQ9PoUKt3HpjjTYim1Jv6dzCq91Ltqapct1MQnenhWDXX/l+9xTFd/nh0fbwAL9MLp0/4gdzfWN4AGZeKVVVk1WxADOC9ZmgfHP6mlgS+vL/WK7a9wfCnstArvUwDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RM+YBKI3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05723E4;
	Mon, 26 Aug 2024 11:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724663250;
	bh=hdmP5+QZtMZxAvEcqArDer6bvlbzmXGdIEkg61HnPg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RM+YBKI357czdMyGX3D1kT8dZpaJ9/QkXwln4O64oiGYb+C0NoMFdRIQH+Pnfavzl
	 eTmmuu2UT2BEnawplT8BcYhUZVgrbya4hGvWwBXuZjAr3dVmZMGSvvpH+P81Ko1rVh
	 eMEPW+oNsBXhCj3RIjcVY1mLrGeoIx1XFL1e35QU=
Date: Mon, 26 Aug 2024 12:08:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>, jerry.w.hu@intel.com,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	Jai Luthra <j-luthra@ti.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v3)
Message-ID: <20240826090831.GE7789@pendragon.ideasonboard.com>
References: <1bea3c06-4f9d-4bea-a036-9166fc75808e@xs4all.nl>
 <20240825222455.GA24390@pendragon.ideasonboard.com>
 <20240826040314.75ce2e2c@sal.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240826040314.75ce2e2c@sal.lan>

Hi Mauro,

On Mon, Aug 26, 2024 at 04:03:14AM +0200, Mauro Carvalho Chehab wrote:
> Em Mon, 26 Aug 2024 01:24:55 +0300 Laurent Pinchart escreveu:
> > On Tue, Aug 13, 2024 at 10:17:59AM +0200, Hans Verkuil wrote:

[snip]

> > > 16:30-18:00: TBD  
> > 
> > Here's a candidate topic for this time slot:
> > 
> > Should media drivers depend on CONFIG_PM?
> > 
> > Supporting both CONFIG_PM and !CONFIG_PM in drivers requires cumbersome
> > constructs, most likely leading to bugs because !CONFIG_PM is hardly
> > ever tested. The issue can be at least partly attributed to deficiencies
> > in the runtime PM and driver core APIs that should make this task easier
> > for drivers, but that will not realistically change any time soon.
> > 
> > In !CONFIG_PM kernels, drivers using runtime PM power up the device at
> > probe time, and keep it powered until remove time. The increased power
> > consumption really makes !CONFIG_PM a niche use case, if a use case at
> > all.
> > 
> > For those reasons, I would like to propose depending on CONFIG_PM for
> > media drivers. In an ideal world this could be done for the whole
> > subsystem. 
> 
> This is not an option. Not all drivers depend on it. Some of them will
> never need it - like most USB and PCI tv/capture cards and digital tv ones.

That by itself, I think, isn't a problem. We could technical depend on
CONFIG_PM even if not all drivers make active use of it. Whether or not
we want to is the question I hope this discussion will answer (and I
have an increasingly strong feeling the answer will be negative, but
let's see).

> > However, some architectures don't support CONFIG_PM, namely
> > 
> > - alpha
> > - csky
> > - hexagon
> > - m68k
> > - microblaze
> > - nios2
> > - openrisc
> > - parisc
> > - s390
> > - sparc (32-bit version only, sparc64 supports CONFIG_PM)
> 
> Well, arch-dependent drivers, like the ones made to run with ARM SoC
> could depend on PM, but then there are sensor drivers and such which
> are somewhat independent.
> 
> > I assume we would get complains of the media subsystem became unusable
> > on those architectures. The decision could be made per driver, or per
> > category of drivers. I'm in particular interested in avoiding the churn
> > of supporting !CONFIG_PM in camera sensor drivers, and in platform
> > drivers that are used only on platforms that support CONFIG_PM.
> 
> There are a couple of sensor drivers that are used by em28xx, which, as far
> as I remember, doesn't use PM. So, even for sensors it could be problematic.

I've checked the em28xx driver. Unless I'm mistaken, the only driver it
uses from drivers/media/i2c/ is the ov2640. Still, that's more than
zero, so this would certainly need to be taken into account.

In the em28xx case, power management of the camera sensor is handled by
the em28xx driver, outside of the camera sensor driver. Switching to
usage of runtime PM in the ov2640 driver and keeping the sensor "powered
up" from probe() onwards wouldn't be an issue, as the power on would be
a no-op (the ov2640 driver will have no regulator, clock or GPIO to
control in this case). Depending on CONFIG_PM, however, could be an
issue, even if I doubt anyone would use an em28xx-based device on a
platform that doesn't enable CONFIG_PM.

> > I'm aware that asking this question may open the door to a more annoying
> > one. If we decide that we need to keep supporting those platforms in
> > camera sensor drivers, and that keeping the camera sensor powered up
> > unconditionally is not good enough, then we will have to reconsider the
> > move to runtime PM for sensor drivers that we started years ago (and
> > haven't completed yet).
> 
> Having PM support for sensor drivers makes sense, provided that it won't
> break support of the existing drivers using them.
>
> > > Please reply with corrections, questions, etc. to this email. I'll update the agenda
> > > over time. Again, these times are very preliminary.  

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-29074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11B2A76AF5
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 17:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D98D13A5AF4
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 15:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9BA215056;
	Mon, 31 Mar 2025 15:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A2vjB/5B"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C27A1E377F;
	Mon, 31 Mar 2025 15:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435302; cv=none; b=mj+ZZXHc/HL/sx8oer409zlebHboi7nrcDW3/ybnfznLyUiG5wpmaxNU9kkrW5CzKTr0RULevFKdcvRqGuMCsuhVlhyXg00YzWUJHgfU3MH7+bFsk7xbO8C/c01uyp2J8ht86jwe0qZFEcqz+tANDLhmXAOeZrSMDWjSQCfubf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435302; c=relaxed/simple;
	bh=LHM59K1nA/qd1MwDarSznh9Wjd8bcZHmCH2h/xNu9C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSlwAXujM+YR0weeKXIkvJaSpQDFSz+2m4PjgU3/xHwkrceiZO6FMgp57md/6BOPyhfi02KlEJkk8CrcSVkPoEQbkz4FP70anXXDgcqYomskA/B3IFDwnjhKiJ+FGkSuzDHOJ6pMv+68aP8xxCf45SN3eq4jf37lflnv4uvJJgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A2vjB/5B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3187D703;
	Mon, 31 Mar 2025 17:33:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743435187;
	bh=LHM59K1nA/qd1MwDarSznh9Wjd8bcZHmCH2h/xNu9C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A2vjB/5BxIZbuErCQWBisDa033m2+uInqm6gD6Dg/ARhns1O4VZcZpwApDlpEmw16
	 SHZAe2VRb0D9xaW5B7MzkrrFdzzoqd/4iQ+k2iX8GTeDwH1ufTm2O6iaMB4zlMeLGL
	 FVvRnBoKB/raT24etk1rXPyVQ405zW5H3N5a8cuE=
Date: Mon, 31 Mar 2025 18:34:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	acopo Mondi <jacopo+renesas@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: i2c: rdacm2x: Make use of device properties
Message-ID: <20250331153435.GB14432@pendragon.ideasonboard.com>
References: <20250331073435.3992597-1-andriy.shevchenko@linux.intel.com>
 <174340899625.3687388.14660711739063778026@ping.linuxembedded.co.uk>
 <20250331120748.GB28722@pendragon.ideasonboard.com>
 <Z-qJOeeHUgWCtkTv@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-qJOeeHUgWCtkTv@smile.fi.intel.com>

On Mon, Mar 31, 2025 at 03:23:21PM +0300, Andy Shevchenko wrote:
> On Mon, Mar 31, 2025 at 03:07:48PM +0300, Laurent Pinchart wrote:
> > On Mon, Mar 31, 2025 at 09:16:36AM +0100, Kieran Bingham wrote:
> > > Quoting Andy Shevchenko (2025-03-31 08:34:35)
> > > > Convert the module to be property provider agnostic and allow
> > > > it to be used on non-OF platforms.
> > > 
> > > Looks reasonable to me.
> > 
> > Is that going to work out of the box though ? The calls below read the
> > "reg" property to get the device I2C addresses. AFAIK, ACPI handles I2C
> > addresses using ACPI-specific methods.
> > 
> > Andy, have you tested this patch on an ACPI system ?
> 
> Only compile-tested. But you are right, this is something different here
> between OF and ACPI.
> 
> I can rephrase the commit message to just point out that fwnode.h shouldn't
> be in the drivers and either converting to device property in an assumption
> that later it can be easier to support non-OF cases, or using of.h.

I wasn't aware that fwnode.h shouldn't be used in drivers, could you
explain that ?

If this patch is part of an effort to eliminate usage of some APIs from
all drivers, I'm fine with it. Otherwise, I'm not sure it's worth
modifying the driver.

-- 
Regards,

Laurent Pinchart


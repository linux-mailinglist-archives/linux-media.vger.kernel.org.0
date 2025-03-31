Return-Path: <linux-media+bounces-29079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47997A76BEF
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 18:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F313A4DF5
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 16:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352AD2147ED;
	Mon, 31 Mar 2025 16:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sFYGFS/Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A971E0B86;
	Mon, 31 Mar 2025 16:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743438487; cv=none; b=itvV8CKlHi6I8lZcG//WqL7GYdhM9e0/clmbELX4frR4b8Jq80i42Rp+OGELl1JVbUx0Sc8BkYp+ffVGFOO+zd88iKrXkGJRwbNRUoNcSqs5rhviJDGe5tdCzzBQKn4kEKetOv8+i5HneEgUDxGnP8BOU8WwQjdtyIVyvrwh6zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743438487; c=relaxed/simple;
	bh=BaWF2A5UazbVoXywtVIf3WKyRW8xn75zzoi+lh7sVLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eturTtH/w8MHg1nMQZuXC8PxXr8x2PYfu1eQUMhPe0jCCElGHVr0r+QMsTwjsVkjNVTeQtyg2AB4gnoBSqQHYCcLPzp+FBsrQb2yoLH0z3F5EVG77MLbE4Tl1+pN86ycPI747nXn4YSEYDk4U+pSJkMvev7RSgdioPyWiM9/02c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sFYGFS/Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E947725;
	Mon, 31 Mar 2025 18:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743438371;
	bh=BaWF2A5UazbVoXywtVIf3WKyRW8xn75zzoi+lh7sVLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFYGFS/Y050KZY567oV2PaASCow/xcPAQ/xlOR3uYPcbNzjyJJE620yXolocYAdG4
	 kzQeowe8K1oPClMBDJIaAYXpNbNC1qZNg1l+peCbnKCAO7QkYUAh1xeFlkgMywDddc
	 Bsd1tSLNmGZnsfcMDFrGjdAoZGdO/eZZUzpT5Mj0=
Date: Mon, 31 Mar 2025 19:27:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	acopo Mondi <jacopo+renesas@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: i2c: rdacm2x: Make use of device properties
Message-ID: <20250331162739.GG14432@pendragon.ideasonboard.com>
References: <20250331073435.3992597-1-andriy.shevchenko@linux.intel.com>
 <174340899625.3687388.14660711739063778026@ping.linuxembedded.co.uk>
 <20250331120748.GB28722@pendragon.ideasonboard.com>
 <Z-qJOeeHUgWCtkTv@smile.fi.intel.com>
 <20250331153435.GB14432@pendragon.ideasonboard.com>
 <Z-rBQ8tsDHW9clYh@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-rBQ8tsDHW9clYh@smile.fi.intel.com>

On Mon, Mar 31, 2025 at 07:22:27PM +0300, Andy Shevchenko wrote:
> On Mon, Mar 31, 2025 at 06:34:35PM +0300, Laurent Pinchart wrote:
> > On Mon, Mar 31, 2025 at 03:23:21PM +0300, Andy Shevchenko wrote:
> > > On Mon, Mar 31, 2025 at 03:07:48PM +0300, Laurent Pinchart wrote:
> > > > On Mon, Mar 31, 2025 at 09:16:36AM +0100, Kieran Bingham wrote:
> > > > > Quoting Andy Shevchenko (2025-03-31 08:34:35)
> > > > > > Convert the module to be property provider agnostic and allow
> > > > > > it to be used on non-OF platforms.
> > > > > 
> > > > > Looks reasonable to me.
> > > > 
> > > > Is that going to work out of the box though ? The calls below read the
> > > > "reg" property to get the device I2C addresses. AFAIK, ACPI handles I2C
> > > > addresses using ACPI-specific methods.
> > > > 
> > > > Andy, have you tested this patch on an ACPI system ?
> > > 
> > > Only compile-tested. But you are right, this is something different here
> > > between OF and ACPI.
> > > 
> > > I can rephrase the commit message to just point out that fwnode.h shouldn't
> > > be in the drivers and either converting to device property in an assumption
> > > that later it can be easier to support non-OF cases, or using of.h.
> > 
> > I wasn't aware that fwnode.h shouldn't be used in drivers, could you
> > explain that ?
> 
> The fwnode.h provides the data types and definitions that are meant
> to be used by the fwnode / device property API providers. The leaf drivers
> shouldn't have any business with those definitions. Everything the drivers
> need should be provided via property.h. property.h guarantees the necessary
> data types to be visible to the users, when required (mostly think of
> struct fwnode_reference_args). Yes, I am aware of v4l2-fwnode.h and it seems
> it falls into the category of special device property API provider.
> 
> > If this patch is part of an effort to eliminate usage of some APIs from
> > all drivers, I'm fine with it. Otherwise, I'm not sure it's worth
> > modifying the driver.
> 
> These drivers basically include the wrong header.
> If you insist, I can patch fwnode.h to add a comment summarizing the above.

No, it's fine. I mixed fwnode.h and property.h when writing my previous
reply, but I don't think it's a matter of lack of documentation, more
likely lack of sleep :-)

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-32592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 133FFAB8735
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 15:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D732A189579C
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 12:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420B0299935;
	Thu, 15 May 2025 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HH0h0vHZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23932980CD;
	Thu, 15 May 2025 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313898; cv=none; b=Tv2WurmQ+O+BrF0MFl/C6Y0TGwxxJm9NhH3y42l95nGvZd62ovYYGm0XzmZ7fpUDoTMlt3DIwKe7IbxWK8LXiL2Fqo+AY8KMKC7d5v+/eJb+xTiZTnHBy7yQWXH+AGAv3723NjUQ+mXB9voNVaScY2JIMddQ6JZFAsElTkDPxYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313898; c=relaxed/simple;
	bh=q+PNBFnebOJgyZTqJNikV5zzDQPNDBL6Et00VWV6iAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhVjAJ+J332iyGhzrqI7ajeRtyy+5OaTLYDBs12eADg76Eo350AzOqlNsZvc5AQQIQ88GdHI3uibdkXuMxKqKVJQgZv81HEYYj8dtS4ETUPVGCp53d4BQJ+ErSIUQiBQ9oTgj1CRWr/n6WobsgWze+2wfawOkO6mB9CIc0TUAgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HH0h0vHZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-100-182-nat.elisa-mobile.fi [85.76.100.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0123A836;
	Thu, 15 May 2025 14:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747313877;
	bh=q+PNBFnebOJgyZTqJNikV5zzDQPNDBL6Et00VWV6iAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HH0h0vHZJxH0UJU7cFN+76iA0pp55gi3IGB41RIPnn3/V3pRktpAff4ZlgDisMIrP
	 xw/nTjQtNiI/HyXrWRtKqJIUvsYiwLzXWUTcbsSxoDdjx4irXPkpP8QL8Cgs8ERKZA
	 S4yG5enGhkgibtGOqyjbihvDs3TlgwIbVu5FteIY=
Date: Thu, 15 May 2025 14:58:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
	naush@raspberrypi.com, mchehab@kernel.org,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <20250515125805.GB12492@pendragon.ideasonboard.com>
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
 <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
 <20250515084403.GQ23592@pendragon.ideasonboard.com>
 <aCXU4rfcbBpg6p7Y@svinhufvud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aCXU4rfcbBpg6p7Y@svinhufvud>

On Thu, May 15, 2025 at 02:49:54PM +0300, Sakari Ailus wrote:
> On Thu, May 15, 2025 at 10:44:03AM +0200, Laurent Pinchart wrote:
> > On Sat, May 10, 2025 at 04:21:09PM +0200, Hans de Goede wrote:
> > > On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
> > > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > > platforms to retrieve a reference to the clock producer from firmware.
> > > > 
> > > > This helper behaves the same as clk_get_optional() except where there is
> > > > no clock producer like in ACPI-based platforms.
> > > > 
> > > > For ACPI-based platforms the function will read the "clock-frequency"
> > > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > > indicated in the property.
> > > > 
> > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > 
> > > This certainly looks quite useful, thank you for working
> > > on this.
> > > 
> > > Note on some IPU3 platforms where the clk is provided by
> > > a clk-generator which is part of a special sensor-PMIC
> > > the situation is a bit more complicated.
> > > 
> > > Basically if there is both a clk provider and a clock-frequency
> > > property then the clock-frequency value should be set as freq
> > > to the clk-provider, see:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020
> > > 
> > > for an example of a driver which handles this case.
> > 
> > On a side note, the DT bindings for the OV8865 doesn't specify the
> > clock-frequency property...
> 
> And they should not.
> 
> This property is used on ACPI systems (via software nodes or otherwise) to
> convey the frequency. No standard API exist for frequency control so
> effectively drivers are informed of the frequency instead. Older bindings
> on DT specify "clock-frequency", too, for sensors.
> 
> We could do this on ACPI only, that should be fine. Why I haven't
> suggested it is because on DT you won't get as far since you always have a
> clock.
> 
> > > IMHO it would be good if the generic helper would handle
> > > this case too and if there is both a clk-provider and
> > > a clock-frequency property then try to set the clock-frequency
> > > value with clk_set_rate(), arguably you could just warn on
> > > a failure to set the rate though, instead of the error
> > > the ov8865 driver currently throws.
> > > 
> > > Sakari, Laurent any opinions on adding handling this case
> > > to the generic helper ?
> > 
> > We really need to standardize the clock-frequency property, and document
> > it accordingly. Some drivers use it to set the external clock rate,
> > while others use it to inform themselves about the clock rate, without
> > changing it, for platforms that have no CCF clock providers. Some
> > drivers also set the clock rate to a fixed value, or to a value that
> > depends on the link frequency selected by userspace. I don't like this
> > situation much.
> 
> I'd rather drop the clock-frequency in bindings where it's not really
> needed. Drivers that have (or had) it in DT bindings need to continue to
> respect it, though, but they probably won't be using this helper. There
> aren't very many of these drivers and there won't be any new ones. This is
> implicitly documented in driver documentation, but we could add an
> explicit note to the documentation of this helper.

Explicit documentation would be better.

-- 
Regards,

Laurent Pinchart


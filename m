Return-Path: <linux-media+bounces-29611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABC0A7FF88
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 13:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 055F91895DC1
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 11:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B31268691;
	Tue,  8 Apr 2025 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fBI6Y0Pd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7380E26738B;
	Tue,  8 Apr 2025 11:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744111004; cv=none; b=uR82CPrpA3ycjtbBQzaey9PmREIRyTcmpJjlrGoDwV+q5bz/mHPDHd0kF/2IHcjTI0OHEIMqccmjR0BONJ9n58w9PjxDjlDy8vhyCvTABA7pXsOPZCFw4T0uQrAg0UdeCQHZyTcAwKKKmyw6At+VyxTd+09GDHgStWSH0jKYppM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744111004; c=relaxed/simple;
	bh=Rs1VDrfkKYspHuvyPdg5qkfl/f18RpD/0VWPjsoz9AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clJ3InL+6WNbUWIKI3EEmHEBwTHwRLOVezsDic7fN/cVHe2OYlaKkDHaLWO7+389n/6p0RYoNGkiUPCI+aoiRH7joFK42iFk+nDgv4RkviAZSmhp13AXcE0sUiWzcpXIaTcNGwEua49REiMRH4FBJIbm/7tYleGdINI1bggIhhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fBI6Y0Pd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDBCD78E;
	Tue,  8 Apr 2025 13:14:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744110881;
	bh=Rs1VDrfkKYspHuvyPdg5qkfl/f18RpD/0VWPjsoz9AA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBI6Y0Pdl8J5Ng5N9UaqZo3SizMvHnr34sFg4UcRdurTRV+H+QanOe1aW36FBjmqk
	 V+klsKZEeZP0BT8U4iVyAe8TUgBm3UXQp+1EizvjMCEaVGYSuAoRMLtw/8lcZvY7fa
	 IrFgyDcWvdsQZZhuUENepJrjpcQHvMvorW8E3upE=
Date: Tue, 8 Apr 2025 14:16:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: thp7312: use fwnode_for_each_child_node()
Message-ID: <20250408111613.GC31475@pendragon.ideasonboard.com>
References: <Z90qM33DvkTMGg_x@mva-rohm>
 <20250321104100.GC25483@pendragon.ideasonboard.com>
 <Z_Ti7aQK2_OlrUee@kekkonen.localdomain>
 <20250408101252.GB31475@pendragon.ideasonboard.com>
 <3d8546b9-92bd-40da-a61a-4534ba7779db@gmail.com>
 <Z_T8N8aHR-2OzHAO@kekkonen.localdomain>
 <6f6a0ade-09fd-49eb-a8ae-ac8849b8ce92@gmail.com>
 <Z_UDmqZoPtybJr95@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z_UDmqZoPtybJr95@kekkonen.localdomain>

On Tue, Apr 08, 2025 at 11:08:10AM +0000, Sakari Ailus wrote:
> Moi,
> 
> On Tue, Apr 08, 2025 at 01:42:12PM +0300, Matti Vaittinen wrote:
> > On 08/04/2025 13:36, Sakari Ailus wrote:
> > > Hei Laurent, Matti,
> > > 
> > > On Tue, Apr 08, 2025 at 01:26:42PM +0300, Matti Vaittinen wrote:
> > > > On 08/04/2025 13:12, Laurent Pinchart wrote:
> > > > > Hi Sakari,
> > > > > 
> > > > > On Tue, Apr 08, 2025 at 08:48:45AM +0000, Sakari Ailus wrote:
> > > > > > On Fri, Mar 21, 2025 at 12:41:00PM +0200, Laurent Pinchart wrote:
> > > > > > > On Fri, Mar 21, 2025 at 10:58:27AM +0200, Matti Vaittinen wrote:
> > > > > > > > When fwnode_for_each_available_child_node() is used on the device-tree
> > > > > > > > backed systems, it renders to same operation as the
> > > > > > > > fwnode_for_each_child_node(), because the fwnode_for_each_child_node()
> > > > > > > > does only iterate through those device-tree nodes which are available.
> > > > > > > 
> > > > > > > This makes me wonder why the OF backend implements
> > > > > > > fwnode_for_each_child_node() as fwnode_for_each_available_child_node().
> > > > > > > Is that on purpose, or is it a bug ?
> > > > > > 
> > > > > > I discussed this with Rafael and he didn't recall why the original
> > > > > > implementation was like that. The general direction later on has been not
> > > > > > to present unavailable nodes over the fwnode interface.
> > > > > > 
> > > > > > So I'd say:
> > > > > > 
> > > > > > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > 
> > > > > > We should also change the documentation of the fwnode API accordingly.
> > > > > 
> > > > > Does that also mean that the fwnode_for_each_available_child_node()
> > > > > function will be dropped ? It's used by few drivers (5 in addition to
> > > > > the thp7312 driver, plus 3 call sites in drivers/base/core.c), so a
> > > > > patch series to drop it should be easy.
> > > > > 
> > > > 
> > > > I assume the fwnode_for_each_available_child_node() still makes sense for
> > > > ACPI backed users, no?
> > > 
> > > Not really (see my earlier explanation in
> > > <Z9mQPJwnKAkPHriT@kekkonen.localdomain>).
> > 
> > I capture that the _named_ available nodes don't have value as ACPI names
> > aren't really what is expected by the _named_ callers. What I didn't pick is
> > that the fwnode_for_each_available_child_node() - which should iterate all
> > available child nodes ignoring the name - wouldn't be useful.
> 
> Fair enough. I don't think we need to support enumerating unavailable ACPI
> device nodes in this API. I'd indeed change the behaviour so that only
> available nodes are enumerated. I can post a patch for that.

Unless there's a specific reason against it that I wouldn't be aware of,
I would also very much favour merging the fwnode_for_each_child_node()
and fwnode_for_each_available_child_node() functions into a single one
that only enumerates available nodes, with a consistent behaviour across
all backend. Having fwnode_for_each_child_node() return unavailable ACPI
nodes but not unavailable DT nodes would be really confusing.

> > > I think all the *available* stuff
> > > should be removed from include/linux/property.h, apart from
> > > fwnode_device_is_availble(), which should be turned to work on struct
> > > device to signal its availability for device nodes only.
> > 
> > I am not saying I have any understanding of the uses of the 'unavailable'
> > nodes. As such I am not arguing over what you say here :)

-- 
Regards,

Laurent Pinchart


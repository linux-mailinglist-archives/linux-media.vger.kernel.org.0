Return-Path: <linux-media+bounces-32584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB58FAB853D
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 13:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B34517B31A8
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F84298992;
	Thu, 15 May 2025 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXwE8PwB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F852298259;
	Thu, 15 May 2025 11:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309805; cv=none; b=e++xs/E22VpZaO2ypP3FIqOQIYTP/ajOuKj0bbdyYcT630NDy3mespdz3WcHHzGPnzI7D+ZTThtDt9mDvzTI13RYs5oycg8oAF0Lwxk4Koem2YLkfBfykiQwo4k0n4pss/PerKOg3gpGNFCye6jGAuLB0gjp4ky032KDuwfd4F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309805; c=relaxed/simple;
	bh=X4IxOhtFNiuzqX5KQQTxFgGZxeDwNf5OJrUwzLAdiMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eModZnrkiy1WD+sEdYlnLeymYDCDoaByeIHdkAcJQIK/E+cA2qgpntL7ycQfoaLboOumHYr3iVvqM+Y5Y0Wcbb40w1b67JcRh0E8OXYo05h5d/aI7VBGUQ0oI4RTnxq/8IO4uAfwbxZjeY1Kc+W9CgnbKWO8L7n7jLSgLkPFxms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXwE8PwB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747309804; x=1778845804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X4IxOhtFNiuzqX5KQQTxFgGZxeDwNf5OJrUwzLAdiMc=;
  b=kXwE8PwBdm8bnqxS/ouanGilSyAzdSvO9GUZzdtUCLkyOtx3uUScs7RY
   DteAj3CWxxuVYs8+SlJcig4bwA7G95ff7E19ox1tp0D1TOP3U2Dxcw4Ul
   DMcGZXdSKxdoWDFVpp9JT4EjaD9APafyEuTjy0+FsFsJWcl7OC63a8c+D
   rdgUzdZNble2G1UStiHjZM2ujLFvWqQDWaHopyjnRbX89gyyMeGPhQp10
   uwfHvvdpl8kiliU3G6PHnbfe9lsBMlUXU22hGesLrPdkqf65Pkvghd0uf
   EGNaPmfE44gaT2sdjEXCTU+y6vrYeBRYhGlVYdlAVrQ5wwpMtjNyBEv8U
   Q==;
X-CSE-ConnectionGUID: Jn+mlHg3T5OriMWVl8iSjw==
X-CSE-MsgGUID: GELeQEBFStq46wJnvhG+Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48491209"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48491209"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:50:03 -0700
X-CSE-ConnectionGUID: X/6xKPFiS/KhLyuU2i6Zgg==
X-CSE-MsgGUID: U+Xh/hiuR3KDsn8CJHBDHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138398884"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO svinhufvud) ([10.245.244.230])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:49:58 -0700
Date: Thu, 15 May 2025 14:49:54 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
	naush@raspberrypi.com, mchehab@kernel.org,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <aCXU4rfcbBpg6p7Y@svinhufvud>
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
 <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
 <20250515084403.GQ23592@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515084403.GQ23592@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, May 15, 2025 at 10:44:03AM +0200, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Sat, May 10, 2025 at 04:21:09PM +0200, Hans de Goede wrote:
> > On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
> > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > platforms to retrieve a reference to the clock producer from firmware.
> > > 
> > > This helper behaves the same as clk_get_optional() except where there is
> > > no clock producer like in ACPI-based platforms.
> > > 
> > > For ACPI-based platforms the function will read the "clock-frequency"
> > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > indicated in the property.
> > > 
> > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > 
> > This certainly looks quite useful, thank you for working
> > on this.
> > 
> > Note on some IPU3 platforms where the clk is provided by
> > a clk-generator which is part of a special sensor-PMIC
> > the situation is a bit more complicated.
> > 
> > Basically if there is both a clk provider and a clock-frequency
> > property then the clock-frequency value should be set as freq
> > to the clk-provider, see:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020
> > 
> > for an example of a driver which handles this case.
> 
> On a side note, the DT bindings for the OV8865 doesn't specify the
> clock-frequency property...

And they should not.

This property is used on ACPI systems (via software nodes or otherwise) to
convey the frequency. No standard API exist for frequency control so
effectively drivers are informed of the frequency instead. Older bindings
on DT specify "clock-frequency", too, for sensors.

We could do this on ACPI only, that should be fine. Why I haven't
suggested it is because on DT you won't get as far since you always have a
clock.

> 
> > IMHO it would be good if the generic helper would handle
> > this case too and if there is both a clk-provider and
> > a clock-frequency property then try to set the clock-frequency
> > value with clk_set_rate(), arguably you could just warn on
> > a failure to set the rate though, instead of the error
> > the ov8865 driver currently throws.
> > 
> > Sakari, Laurent any opinions on adding handling this case
> > to the generic helper ?
> 
> We really need to standardize the clock-frequency property, and document
> it accordingly. Some drivers use it to set the external clock rate,
> while others use it to inform themselves about the clock rate, without
> changing it, for platforms that have no CCF clock providers. Some
> drivers also set the clock rate to a fixed value, or to a value that
> depends on the link frequency selected by userspace. I don't like this
> situation much.

I'd rather drop the clock-frequency in bindings where it's not really
needed. Drivers that have (or had) it in DT bindings need to continue to
respect it, though, but they probably won't be using this helper. There
aren't very many of these drivers and there won't be any new ones. This is
implicitly documented in driver documentation, but we could add an
explicit note to the documentation of this helper.

-- 
Regards,

Sakari Ailus


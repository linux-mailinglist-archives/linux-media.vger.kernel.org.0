Return-Path: <linux-media+bounces-29591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B061A7F8A2
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 10:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 373C03BFDCB
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 08:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F59265606;
	Tue,  8 Apr 2025 08:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QN7J50AC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641E0264A7B;
	Tue,  8 Apr 2025 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102132; cv=none; b=iT+Q1EQRrEjxpX249XavL4/WZvlXJzUtobRLDrR1DxZpWMqVaB2A4x4mfcZf0liDUm+N4nH5V/UwK+oVxVp/laqFJZst6GnnK/WomX/Ib+o5YrsEQAxOlwsMJJQa4BBSC1Bdp9N1Wd5lHZk/gJeAadIthv5nkTtgbnYAbqxQoDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102132; c=relaxed/simple;
	bh=QboZBxd8+rNwo0pKW/iVwcS0B2zApiAX3/k+2rn+l7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCBtTx0a+N7L16vADmW4SVnF2xyix2F9/dVjscIHthf7EqinKhHt9R7CyuQ2+v8gUpUFliS+BszrJYFgSTlXP+gZ2PqlZgIEv106OEjc1vvKKhRZZCbjkYDQKLhcVPU2z7IWKUUadgDPdI0UEKusDwayDnD2PyYYB8CMTYuzN/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QN7J50AC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744102131; x=1775638131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QboZBxd8+rNwo0pKW/iVwcS0B2zApiAX3/k+2rn+l7c=;
  b=QN7J50ACvfRtAoDJ+wYGUy8vunDUXF3qn1duhhX0YZ5QHFBHN36brHGR
   NsZ8+o32I1AdzdWcAMKzGGyx6p9hzb0dZ8I9ZJLCSpjg4inSQVMUC/+BL
   drxeh2agXtYSfgwEhE1A4kiFIweooxu6FcnzB2CXzYvvD6jdMN0yVEWvQ
   Ixz+nkJ9g33QQ80Ei1K8orfInkighKF1LCzdjIRWrgcfr/r6FMXPmw3PN
   wgLXw2ajz2QIYH6RJ3S1xbryMjugqr9pfQ1afWpaLYA/00iPgFHnjvmLy
   nWv73V0sfP5DWToOlnd1e/2NZnAVf6iM3C6knVnUO5CTGtGP/ldEIjEr/
   g==;
X-CSE-ConnectionGUID: N8ZfO0WrRpiSKTYxPWta9Q==
X-CSE-MsgGUID: cUBN99xeQDyCH7Q+NKZQaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45615003"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45615003"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:48:50 -0700
X-CSE-ConnectionGUID: wbeNfKdTQDqGdRShoemECQ==
X-CSE-MsgGUID: jo0/bwYOSfq1dgAe7ol4Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="128728389"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:48:48 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 16A5811FB1F;
	Tue,  8 Apr 2025 11:48:45 +0300 (EEST)
Date: Tue, 8 Apr 2025 08:48:45 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: thp7312: use fwnode_for_each_child_node()
Message-ID: <Z_Ti7aQK2_OlrUee@kekkonen.localdomain>
References: <Z90qM33DvkTMGg_x@mva-rohm>
 <20250321104100.GC25483@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321104100.GC25483@pendragon.ideasonboard.com>

Hi Laurent, Matti,

On Fri, Mar 21, 2025 at 12:41:00PM +0200, Laurent Pinchart wrote:
> Hi Matti,
> 
> Thank you for the patch.
> 
> On Fri, Mar 21, 2025 at 10:58:27AM +0200, Matti Vaittinen wrote:
> > When fwnode_for_each_available_child_node() is used on the device-tree
> > backed systems, it renders to same operation as the
> > fwnode_for_each_child_node(), because the fwnode_for_each_child_node()
> > does only iterate through those device-tree nodes which are available.
> 
> This makes me wonder why the OF backend implements
> fwnode_for_each_child_node() as fwnode_for_each_available_child_node().
> Is that on purpose, or is it a bug ?

I discussed this with Rafael and he didn't recall why the original
implementation was like that. The general direction later on has been not
to present unavailable nodes over the fwnode interface.

So I'd say:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

We should also change the documentation of the fwnode API accordingly.

> 
> > The thp7312 uses the fwnode_for_each_available_child_node() to look up
> > and handle nodes with specific names. This means the code is used only
> > on the device-tree backed systems because the node names have little
> > meaning on ACPI or swnode backed systems.
> > 
> > Use the fwnode_for_each_child_node() instead of the
> > fwnode_for_each_available_child_node() In order to make it clearly
> > visible that the 'availability' of the nodes does not need to be
> > explicitly considered here. This will also make it clearly visible that
> > the code in this driver is suitable candidate to be converted to use the
> > new fwnode_for_each_named_child_node()[2] when it gets merged.
> > 
> > [1]: https://lore.kernel.org/all/Z9rhfJUlCbi7kA2m@kekkonen.localdomain/
> > [2]: https://lore.kernel.org/all/9c3880f74476436f39d796b5c10c540ae50b722c.1742225817.git.mazziesaccount@gmail.com/
> > 
> > Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > 
> > ---
> > Revision history:
> > v1 => v2:
> >  - rephrase the commit message to not claim the 'availability' has no
> >    well defined meaning on the DT backed systems. Instead, explain that
> >    the fwnode_for_each_available_child_node() only iterates through the
> >    available nodes on the DT backed systems and is thus functionally
> >    equivalent to the fwnode_for_each_child_node().
> > 
> > NOTE: The change is compile tested only! Proper testing and reviewing is
> > highly appreciated (as always).
> > ---
> >  drivers/media/i2c/thp7312.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
> > index 8852c56431fe..4b66f64f8d65 100644
> > --- a/drivers/media/i2c/thp7312.c
> > +++ b/drivers/media/i2c/thp7312.c
> > @@ -2067,7 +2067,7 @@ static int thp7312_parse_dt(struct thp7312_device *thp7312)
> >  		return -EINVAL;
> >  	}
> >  
> > -	fwnode_for_each_available_child_node(sensors, node) {
> > +	fwnode_for_each_child_node(sensors, node) {
> >  		if (fwnode_name_eq(node, "sensor")) {
> >  			if (!thp7312_sensor_parse_dt(thp7312, node))
> >  				num_sensors++;
> > 
> > base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
> 

-- 
Regards,

Sakari Ailus


Return-Path: <linux-media+bounces-28614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65733A6D74E
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 10:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9F2816D1F0
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C641725D91A;
	Mon, 24 Mar 2025 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Whae2DUn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DA425D8E7;
	Mon, 24 Mar 2025 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742808543; cv=none; b=eTrhaPfJ4Txk8M56JhqK1GbrxjhKT5fPFvC3MfLKUorO4hGfeu3bxP+Sq7t1W5YnCto3Un811Shxjy19kixoGZNWcf7OP+izyY3ZUpxRuwCS8Ka6Oy+UPv6ZHvVZlx3d7oygM247rLajU7TgwHfKmG169n/e6ezQ6HoQ4SXb8zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742808543; c=relaxed/simple;
	bh=/7lhOihOiF6LFmy/aky+kel/L5mJlt1vEBAezb7fuIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMoFJR1kS7E1HZ91muqx9XZNLyPKQWsHLcXlgRtMmD4YWNrLu/L20iUqyNEnbRN4kRKIMDNOa+PwV4iIbMyiviajZBEjuwmSjd9m1Ejy/DnWtrPjAWkX8WgJ2YYLodJc7mRYR01qbCtk3WH+pOBPhVbC7nUMpa2ToF9EjiEUr+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Whae2DUn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742808542; x=1774344542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/7lhOihOiF6LFmy/aky+kel/L5mJlt1vEBAezb7fuIE=;
  b=Whae2DUn5W65cuOETy7rLgIuUjecPv94boLVTKs0xmupGU2mdMCBt5DD
   F3FpPoDoTERSl8hREjMe0sYkzFkAYxZly7HoQvgkn4LaR6PE/M+ddW5nj
   xlrW42/IjdnS9d2rv7m8QJg0DgNbBus3cHXWJT9lPKZVpRnqJxiJnaq8r
   JGK1DG5VtZ9xNXkhFAnvDycSQkblBek/rSmSPqlXvU3W0gp5E+4fvJCJS
   ild863oRZ12+E9SLBdPeV7d8sYcRfo9Kkj4G22w2odmH8rGQGgeGUYV25
   cv4iM95VItXKvIVNGNy8bTwDVmniLcaPfLK1BBZLicyu3/zpxi6TkBuCY
   A==;
X-CSE-ConnectionGUID: MdllRRkSSuuPWFC/Y7s5BQ==
X-CSE-MsgGUID: kyT2WBDGS9aW1WpTZDaSrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="43733412"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="43733412"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 02:29:02 -0700
X-CSE-ConnectionGUID: mkCKeAlfQCWAla3fCSuedA==
X-CSE-MsgGUID: 5cRl6niPQHauZ4xHsws5qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="128811251"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 02:28:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 48899120AB3;
	Mon, 24 Mar 2025 11:28:56 +0200 (EET)
Date: Mon, 24 Mar 2025 09:28:56 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v2] media: i2c: thp7312: use fwnode_for_each_child_node()
Message-ID: <Z-El2EzbV5EFDA3Q@kekkonen.localdomain>
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

Hi Laurent,

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

I went back to see where this came from,I understand
<URL:https://lkml.org/lkml/2014/10/17/185> is the first version of the
patch adding device_get_next_child_node(). Since then the behaviour has
been carried forward.

Cc Rafael.

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
Kind regards,

Sakari Ailus


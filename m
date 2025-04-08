Return-Path: <linux-media+bounces-29602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3044A7FB9B
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 12:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 410941893A9B
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 10:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963E9267B7C;
	Tue,  8 Apr 2025 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f+j3YOJo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00412266585;
	Tue,  8 Apr 2025 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107207; cv=none; b=DSo5C+W9Rb/5Eih9NnLvRISYLPBLqjsBuFkfNfm2G9AAxQ2zC8ACNFDl2Vo6/g7dIBIQbi77KQTazpINf9e/rHAmaMXm/nV1kMc57H5lcZ0vY0voyIui6AseJMynvrksqzMswc0cQc9xkbjKQwXxB+DZhzzMv5p7WCBayUb6v6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107207; c=relaxed/simple;
	bh=eVlUao8+2H4sq9uDxSotSHajHwx7ErY75Ibnc/bVBjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiKdkXYEWMWORrcLdlIeu+zcacL4KGoRAMFmgVQYU1WiljQIGaFdpa1OdUpcm/ZO1+neo7a6g0tR2i0SNMmuX9dRLL7D4eWEkphE3fVqMXx9Xt5+Mr8eNZh1rOBiOXV79XnmHjjU5TPzg8vdgF5OZS5CKmD3qWQrH2dbIAsOFoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f+j3YOJo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA5BA6EC;
	Tue,  8 Apr 2025 12:11:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744107080;
	bh=eVlUao8+2H4sq9uDxSotSHajHwx7ErY75Ibnc/bVBjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+j3YOJoFlKzCzQjj/x+HggUUOs31ZdRa3TK3/id3W1/MhTouFnp8JHFj0v+9oz7r
	 EUIiHvdo6i1cDXNuu4WSVe534JIYvwW+ozoETgZYWjksiZ5LuK1XRtRJ6JBBjdATbR
	 /mCW7xYlk6Da4itc+Yl6ehFkCPfwFUlX3YC22/u4=
Date: Tue, 8 Apr 2025 13:12:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: thp7312: use fwnode_for_each_child_node()
Message-ID: <20250408101252.GB31475@pendragon.ideasonboard.com>
References: <Z90qM33DvkTMGg_x@mva-rohm>
 <20250321104100.GC25483@pendragon.ideasonboard.com>
 <Z_Ti7aQK2_OlrUee@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z_Ti7aQK2_OlrUee@kekkonen.localdomain>

Hi Sakari,

On Tue, Apr 08, 2025 at 08:48:45AM +0000, Sakari Ailus wrote:
> On Fri, Mar 21, 2025 at 12:41:00PM +0200, Laurent Pinchart wrote:
> > On Fri, Mar 21, 2025 at 10:58:27AM +0200, Matti Vaittinen wrote:
> > > When fwnode_for_each_available_child_node() is used on the device-tree
> > > backed systems, it renders to same operation as the
> > > fwnode_for_each_child_node(), because the fwnode_for_each_child_node()
> > > does only iterate through those device-tree nodes which are available.
> > 
> > This makes me wonder why the OF backend implements
> > fwnode_for_each_child_node() as fwnode_for_each_available_child_node().
> > Is that on purpose, or is it a bug ?
> 
> I discussed this with Rafael and he didn't recall why the original
> implementation was like that. The general direction later on has been not
> to present unavailable nodes over the fwnode interface.
> 
> So I'd say:
> 
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> We should also change the documentation of the fwnode API accordingly.

Does that also mean that the fwnode_for_each_available_child_node()
function will be dropped ? It's used by few drivers (5 in addition to
the thp7312 driver, plus 3 call sites in drivers/base/core.c), so a
patch series to drop it should be easy.

> > > The thp7312 uses the fwnode_for_each_available_child_node() to look up
> > > and handle nodes with specific names. This means the code is used only
> > > on the device-tree backed systems because the node names have little
> > > meaning on ACPI or swnode backed systems.
> > > 
> > > Use the fwnode_for_each_child_node() instead of the
> > > fwnode_for_each_available_child_node() In order to make it clearly
> > > visible that the 'availability' of the nodes does not need to be
> > > explicitly considered here. This will also make it clearly visible that
> > > the code in this driver is suitable candidate to be converted to use the
> > > new fwnode_for_each_named_child_node()[2] when it gets merged.
> > > 
> > > [1]: https://lore.kernel.org/all/Z9rhfJUlCbi7kA2m@kekkonen.localdomain/
> > > [2]: https://lore.kernel.org/all/9c3880f74476436f39d796b5c10c540ae50b722c.1742225817.git.mazziesaccount@gmail.com/
> > > 
> > > Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > > 
> > > ---
> > > Revision history:
> > > v1 => v2:
> > >  - rephrase the commit message to not claim the 'availability' has no
> > >    well defined meaning on the DT backed systems. Instead, explain that
> > >    the fwnode_for_each_available_child_node() only iterates through the
> > >    available nodes on the DT backed systems and is thus functionally
> > >    equivalent to the fwnode_for_each_child_node().
> > > 
> > > NOTE: The change is compile tested only! Proper testing and reviewing is
> > > highly appreciated (as always).
> > > ---
> > >  drivers/media/i2c/thp7312.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
> > > index 8852c56431fe..4b66f64f8d65 100644
> > > --- a/drivers/media/i2c/thp7312.c
> > > +++ b/drivers/media/i2c/thp7312.c
> > > @@ -2067,7 +2067,7 @@ static int thp7312_parse_dt(struct thp7312_device *thp7312)
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > -	fwnode_for_each_available_child_node(sensors, node) {
> > > +	fwnode_for_each_child_node(sensors, node) {
> > >  		if (fwnode_name_eq(node, "sensor")) {
> > >  			if (!thp7312_sensor_parse_dt(thp7312, node))
> > >  				num_sensors++;
> > > 
> > > base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6

-- 
Regards,

Laurent Pinchart


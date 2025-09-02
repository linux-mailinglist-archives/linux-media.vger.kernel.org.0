Return-Path: <linux-media+bounces-41572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2725FB400DF
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AB3D17D0DC
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790E328EA56;
	Tue,  2 Sep 2025 12:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p7IjiLZJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CAE28D82F;
	Tue,  2 Sep 2025 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816709; cv=none; b=c24xv+MCJoAZQ6pAlZOII/sjixD61zDuGxKc5gWe2YwtloaDNZMJzAMho7UafpCbLZ4lDGpkF0uheNTc58PzAw6e43PkRk3JZFx+3geZnRXFTCW2M7ErLMpLXk7O4jqTIQcz9RfEuojoCKF2GDffPmsIh0dO6QX2R4UPJ9Ow43s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816709; c=relaxed/simple;
	bh=E7533lX6MAykX99kEXEDHRaSmvwJZBHmZuyZ+hSEuDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bycc9vdGS5XoAZsG9FHx+ZjP9oY6yrrq6L75WY0QOxCTkfD3DX0qY4K44/RFCmwneVZw/tsDQdqS0ITZCtOniBNCUmisDiPWWqD9qSLsBLV/ZTbFnc+IrhkF/mJhGAEHrelPqqzxrwpXBbXEhy3NzhNXxROfX4FOfAql025rFxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p7IjiLZJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8408DC77;
	Tue,  2 Sep 2025 14:37:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756816637;
	bh=E7533lX6MAykX99kEXEDHRaSmvwJZBHmZuyZ+hSEuDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7IjiLZJrdTo7odl3ewl6xeftk66e0FJE5SY4uQ5HzNOgIhoXDJm/XjCq2Zg1OB6q
	 KN+RSD0GQiPZHE8i/VhO7eE94s6ELIMfxzEy9wwZTHVHpLdaIajy1M5A2r4FdTMSPi
	 3m9WHxqZcQaFE7dQGw2oVw3Swfdvuca/Lj0OxX8Q=
Date: Tue, 2 Sep 2025 14:38:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
	rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from
 mbus_config
Message-ID: <20250902123805.GL13448@pendragon.ideasonboard.com>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
 <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>
 <20250815103205.GJ6201@pendragon.ideasonboard.com>
 <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu>
 <20250815113633.GM6201@pendragon.ideasonboard.com>
 <aJ8pKs_6YpAiPjlq@valkosipuli.retiisi.eu>
 <20250819024413.GJ5862@pendragon.ideasonboard.com>
 <175681611736.1349241.9877873145029586025@isaac-ThinkPad-T16-Gen-2>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175681611736.1349241.9877873145029586025@isaac-ThinkPad-T16-Gen-2>

On Tue, Sep 02, 2025 at 01:28:37PM +0100, Isaac Scott wrote:
> Quoting Laurent Pinchart (2025-08-19 03:44:13)
> <snip>
> > > > > > That would need to parse the endpoint every time we start streaming, it
> > > > > > doesn't sound ideal.
> > > > > 
> > > > > Perhaps not, but does that matter in practice? Parsing the endpoint is,
> > > > > after all, fairly trivial. The advantage would be simplifying drivers.
> > > > 
> > > > It's trivial from a code point of view, but it's not a cheap operation.
> > > > I'd like to avoid making starting streaming more expensive.
> > > 
> > > How cheap is "not cheap"? I'd be surprised if parsing an endpoint took more
> > > time than e.g. an I²C register write. Of course it depends on the CPU...
> > 
> > Still, it's not cheap, and I think it can easily be avoided.
> > 
> > > > > Alternatively we could think of caching this information somewhere but I
> > > > > don't think it's worth it.
> > > > 
> > > > Drivers likely need to parse endpoints for other reasons. I'd cache the
> > > > value in drivers, like done today, and pass it to a get_active_lanes
> > > > helper.
> > > 
> > > Then drivers presumably would also validate this against the endpoint
> > > configuration, wouldn't they? That's extra code in every CSI-2 receiver
> > > driver.
> > 
> > Why so ? The number of connected lanes can be passed to the helper
> > function, which can use it to validate the number of lanes reported by
> > the source subdev.
> 
> Apologies if I'm interpreting this wrong, but it seems that the main
> thing I'm reading is that this is not the correct place to implement
> this, and it should be implemented at a higher level (e.g. in v4l2) that
> lets all MIPI CSI reciever drivers use it?
> 
> I have noticed that similar functionality has been implemented as part
> of __v4l2_get_link_freq_pad. Are you suggesting that I take a similar
> approach and resubmit as a new series?

As far as iI understand, Sakari would like a helper function that will
query the remote subdev for the number of data lanes it uses, and
validates that against the number of connected data lanes as described
by DT. I don't like the idea of parsing the endpoint properties every
time we do so, so I think the number of connected data lanes should be
passed by the driver to the helper instead. The helper would still query
the remote subdev, and validate the value.

> > > > > > > The function could take struct media_pad pointer as an argument, or struct
> > > > > > > v4l2_subdev pointer and the pad number.
> > > > > > > 
> > > > > > > I wonder if any other parameters could change dynamically but I can't think
> > > > > > > of that now, so perhaps just the number of lanes is what the function
> > > > > > > should indeed return.
> > > > > > > 
> > > > > > > > +
> > > > > > > > +   return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > > > > >  {
> > > > > > > >     struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > > > > > @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > > > > >     format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> > > > > > > >     csis_fmt = find_csis_format(format->code);
> > > > > > > >  
> > > > > > > > +   ret = mipi_csis_get_active_lanes(sd);
> > > > > > > > +   if (ret < 0)
> > > > > > > > +           dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
> > > > > > > > +
> > > > > > > >     ret = mipi_csis_calculate_params(csis, csis_fmt);
> > > > > > > >     if (ret < 0)
> > > > > > > >             goto err_unlock;

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-41817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F16B45318
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 11:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2582D188A986
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 09:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5014427E7DD;
	Fri,  5 Sep 2025 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hBjwSfbQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241704D599
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 09:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757064307; cv=none; b=DBYwyvOWcmkiH8hAUIdPLf0IQK1hERWGe7PeSjS5oJM2EmXcQnaWptbet8ccby63ojzEZUKykzNSoOD65ycNxh03Iyc1X5/04bmQL+B70z9HwrWIMOj5haFe6/aHPtUXwShsLeU7tEg2uvazoz1+B5W+cw3TmsimKYkv/sVcfTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757064307; c=relaxed/simple;
	bh=XY2WbEpqImmQLoVZJuvGNUC7KZQ06NsnlW5CDbHtE0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQBXaaZ79S61JdGGhtHwrrEUCRvgSfdbnEyVBZe6HLEkgcRcKgmoCBbspOnhTgXQ71h7fQGggb/f5jc9eYFWzGpmaxfwc7Uh8SWBwEKJSZGgG6TMvT+VJNx0ca+3BYD2VnzAmCohx1JdO4Qm+odoL27lsDgVuvFQh48AbTddgw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hBjwSfbQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2CB15346;
	Fri,  5 Sep 2025 11:23:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757064233;
	bh=XY2WbEpqImmQLoVZJuvGNUC7KZQ06NsnlW5CDbHtE0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hBjwSfbQM5Tz++d/5KSjWEWycrEZcFc2biH2h6gVllPxdVMVSuBavv09xwpiv6bhp
	 BXfCNEpa+Z1Gfcd0si/ZY01jDKevVIfhTWQ0+iySsPPEIjkgXhk5w21kzZMsrz+YZ2
	 ye5YXeLjophLGllMjTYQZJH1fxPaw6303d/IpZkk=
Date: Fri, 5 Sep 2025 11:24:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v2 10/72] media: i2c: hi556: Replace client->dev usage
Message-ID: <20250905092441.GB6549@pendragon.ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
 <20250812214620.30425-11-laurent.pinchart@ideasonboard.com>
 <aLqifDc9FqUh_oiC@kekkonen.localdomain>
 <20250905084622.GA6549@pendragon.ideasonboard.com>
 <aLqrWr5RwNKucDvq@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLqrWr5RwNKucDvq@kekkonen.localdomain>

On Fri, Sep 05, 2025 at 12:20:26PM +0300, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Fri, Sep 05, 2025 at 10:46:22AM +0200, Laurent Pinchart wrote:
> > On Fri, Sep 05, 2025 at 11:42:36AM +0300, Sakari Ailus wrote:
> > > On Wed, Aug 13, 2025 at 12:45:18AM +0300, Laurent Pinchart wrote:
> > > > The driver needs to access the struct device in many places, and
> > > > retrieves it from the i2c_client itself retrieved with
> > > > v4l2_get_subdevdata(). Store it as a pointer in struct hi556 and access
> > > > it from there instead, to simplify the driver.
> > > > 
> > > > While at it, fix a mistake in the sort order of include statements.
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > 
> > > Avoiding v4l2_get_subdevdata is a big plus. But instead of adding the dev
> > > field to every driver's context struct, could you use the dev field that
> > > exists in struct v4l2_subdev already?
> > 
> > I'd rather not. I think it's much clearer to have a dev pointer in the
> > driver structure, initialized right after allocation. The structure is
> > available everywhere, this makes lines shorter, and functions called
> > from probe won't need to wonder if the subdev has been initialized
> > already or not, and get the dev pointer from somewhere else in the
> > latter case.
> 
> That's something extra you need to initialise, besides the sub-device which
> tends to be initialised as one of the first things in the probe function --
> usually right after allocating memory for the context struct.

No, the subdevice is typically not initialized right away.

> So I see no reason why you should add a new field for this. In fact, we've
> rather gotten rid of just this kind of fields that cache data easily
> available elsewhere over the past years, there used to be more of them in
> many drivers.

I think that's a very bad idea. Storing a dev pointer in the driver
structure is the most common pattern and the only one that scales. It's
common for drivers to initialize the subdev after performing other
initialization operations, and the subdev initialization can also be
done in a function called by probe(). We would have to pass the dev
pointer around manually in many cases, this is error prone. Storing a
dev pointer is much simpler and maintainable, and is a clean code
pattern that be applied to all sensor drivers, increasing consistency
through the subsystem.

-- 
Regards,

Laurent Pinchart


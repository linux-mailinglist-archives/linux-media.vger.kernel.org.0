Return-Path: <linux-media+bounces-50626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD041D1B9DC
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 23:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3274B300FD43
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443D2354AE9;
	Tue, 13 Jan 2026 22:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ItW+8e7q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1405D30F806
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 22:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768344011; cv=none; b=F+gS/d+GfdnFkDxNqx6QrOhCrtePQnwh0AjxQaxVlrFa7eO112vE3gqxtlZql01p3Hs5S4u4xVIRDwP8IHvHPEkugtRp79HZZeXPBnsXqJ33aaLRSFNJHoHufCTTU35w5zcTAF0JFZ/lzYVpoeOwlFO4ij2BB/m3EWCM3GenF5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768344011; c=relaxed/simple;
	bh=vlkcRkPWo/fwDVBcC6t4+DvWZzC1GemObqREPudjpUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtc/q1DRGG8dwYkXFZM49aL0VK1BfY5/WIBaOgAD/z8usLh8RxKuv10pjuhN7SklCohOyo3L+6vjgZPlLt8nYJYoxmRKIYYJKe6mQwk227Molomdp4rZBzFW1+Ms/QZuuCV3McnDzrWYybmb/ncMBQKCwxrw4IT7Iy93StdWsfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ItW+8e7q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ECC003A4;
	Tue, 13 Jan 2026 23:39:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768343975;
	bh=vlkcRkPWo/fwDVBcC6t4+DvWZzC1GemObqREPudjpUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ItW+8e7qMjG2sWWrw6mDSP882FxRhYmFSyYig/Z4Z4MLUhKzpXLr2f7nw2YdGneHl
	 clZFZiRtCr70p0cMH87RrTMd9dlMiWf/bhEd4PxsDKZmehQFlLJvH7/d24L3sPrKpO
	 pQmCTu1v5Iol+iTn8mtLsJgsqChDe08x6ftNK6IU=
Date: Wed, 14 Jan 2026 00:39:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, linux-media@vger.kernel.org,
	hans@jjverkuil.nl, Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 19/64] media: v4l: uapi: Add a control for color
 pattern flipping effect
Message-ID: <20260113223940.GF30544@pendragon.ideasonboard.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-20-sakari.ailus@linux.intel.com>
 <ce6153ae-10fe-4160-b1d7-4b431f4d45f3@nxp.com>
 <aWY-ldR_PMFcI1LR@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aWY-ldR_PMFcI1LR@kekkonen.localdomain>

On Tue, Jan 13, 2026 at 02:46:13PM +0200, Sakari Ailus wrote:
> Hi Mirela,
> 
> On Wed, Jul 23, 2025 at 01:14:44AM +0300, Mirela Rabulea wrote:
> > Hi Sakari,
> > 
> > On 6/19/25 14:57, Sakari Ailus wrote:
> > > 
> > > 
> > > Add a bitmask control (V4L2_CID_COLOR_PATTERN_FLIP) to tell whether
> > > flipping results in a change in the sensor's color pattern, separately
> > > horizontally and vertically. The information is essential for raw formats
> > > when using generic raw mbus codes.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >   .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
> > >   drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
> > >   include/uapi/linux/v4l2-controls.h                     |  5 +++++
> > >   3 files changed, 17 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > index b19aaaffbce0..43a62a85afb8 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > @@ -131,3 +131,13 @@ Image Source Control IDs
> > >         - Raw Bayer, with alternating lines beginning with green, blue pixels and
> > >           red, green pixels.
> > >         - 3
> > > +
> > > +``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
> > > +    Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
> > 
> > Maybe "Report whether the horizontal or vertical flipping controls..."
> > sounds more like a sentence?
> 
> How about "This control determines whether..."?

"whether" normally requires a correlative "or". You could write "This
control determines if the horizontal or vertical flipping controls ...".

> > Also, it looks like this is also a read-only control, so it would be nice to
> > mention it also in this doc.
> 
> Agreed.

-- 
Regards,

Laurent Pinchart


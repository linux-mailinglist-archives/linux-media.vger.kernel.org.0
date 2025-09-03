Return-Path: <linux-media+bounces-41671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E8CB41EB8
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 868441BA5820
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12032FCC0F;
	Wed,  3 Sep 2025 12:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QCfy5HbD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4EE2FC881
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901924; cv=none; b=MXdwbPXpVYSslUr4mEwMcZhcFUm8VtdponX6RqgDrjwnykuhP5+CHuzHuj3kB8KfxbIZIal/+a6dVPYtpn9g2PXuW13xdhOyZbfqM/L3n+mB/uTas5FnvJYu2lqVR8cWXdkBnFktuECJ1o6G/UvKivcg4hKEwBulPdMGssh2Qpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901924; c=relaxed/simple;
	bh=+BPoDXu9lZwsHv7tHM2tz3se2XsyDxE98CQnl1z93yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+tfxYdnNzkbdYh7DKJ5yQ5rw3kRHkDyt707ZI6BlGjQTeeyt14IWV7eZnMLjLuKUnTOIlWKMyFXneJe+PVTabYcFxFP9tPfMA0IkMdvvlQq08DXoDCeQwK/Bl9qY43yIY+2jf4OPCGYapx+2UoI5ATWTpe3vKoBYOe4awMZdz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QCfy5HbD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-160.net.vodafone.it [5.90.50.160])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5897E7CE;
	Wed,  3 Sep 2025 14:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756901850;
	bh=+BPoDXu9lZwsHv7tHM2tz3se2XsyDxE98CQnl1z93yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QCfy5HbDY18TZDu72Ds3bOs983C9F6fxHlNgwtdfI0kqnmKtgFRJk7jIxRCJXOUVw
	 kWz9QXK8qSMp3paQf5iHTck+SJmtP6jaCWM7/nOgo270ciChAAs7Q+A26jz5vaKXlp
	 3xzUCUWCEtJ0g1ESsiwbs9BunmNZw661HJWFVMIE=
Date: Wed, 3 Sep 2025 14:18:35 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 21/66] media: v4l: uapi: Add a control for color
 pattern flipping effect
Message-ID: <4sfyzce5u5akvsvrvkwclcchhhdvusv6erorc4xsrelf7o63zd@ef4ca7f6vycg>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-22-sakari.ailus@linux.intel.com>
 <b2yrfklofl6qpoekmy3r745gk4fvgdlpcdppatwwr3y34kn5zv@xusoi3rasdrc>
 <aLgXmb-ANkC5JNYD@kekkonen.localdomain>
 <aLgbM8Vg7oPar5Y2@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLgbM8Vg7oPar5Y2@kekkonen.localdomain>

Hi Sakari

On Wed, Sep 03, 2025 at 01:40:51PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Wed, Sep 03, 2025 at 01:25:30PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Mon, Sep 01, 2025 at 04:34:56PM +0200, Jacopo Mondi wrote:
> > > Hi Sakari
> > >
> > > On Mon, Aug 25, 2025 at 12:50:22PM +0300, Sakari Ailus wrote:
> > > > Add a bitmask control (V4L2_CID_COLOR_PATTERN_FLIP) to tell whether
> > > > flipping results in a change in the sensor's color pattern, separately
> > > > horizontally and vertically. The information is essential for raw formats
> > > > when using generic raw mbus codes.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
> > > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
> > > >  include/uapi/linux/v4l2-controls.h                     |  6 ++++++
> > > >  3 files changed, 18 insertions(+)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > index 0fcd60d8c621..ef3784d1119a 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > @@ -133,3 +133,13 @@ Image Source Control IDs
> > > >        - Raw Bayer, with alternating lines beginning with green, blue pixels and
> > > >          red, green pixels.
> > > >        - 3
> > > > +
> > > > +``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
> > >
> > > I still believe that having this and V4L2_CTRL_FLAG_MODIFY_LAYOUT
> > > might be confusing. Should sensor driver that registers H/VFLIP still
> > > mark those controls as V4L2_CTRL_FLAG_MODIFY_LAYOUT or should they
> > > implement V4L2_CID_COLOR_PATTERN_FLIP, or do both ?
> > >
> > > Should we deprectate V4L2_CTRL_FLAG_MODIFY_LAYOUT for flip controls ?
> > > In this case I think the documentation of the flag should be updated.
> >
> > Good question. I don't think the flag provides any useful information to
> > the userspace in this case, it's just a matter of UAPI consistency.

"in this case" you mean if the sub-dev registers
V4L2_CID_COLOR_PATTERN_FLIP ?

> >
> > How about setting set the flag to these controls in the control framework?
> > I can add a patch for that.
>
> Of course this is not workable as-is as the flag would be present on the
> *FLIP controls.
>
> This would be still worked around in the control framework, based on the
> value of the flip control, but I think it'd be more practical to document
> the flag does not apply to generic raw mbus codes or as you suggested, to
> media bus codes at all. The patch that added it is
> bf587efff165e0563cc9d2227e49eeba7eb50434 .

I think documenting it as deprecated for sub-devs that use generic raw
mbus codes and register V4L2_CID_COLOR_PATTERN_FLIP it's possibily the
best we can do ?

>
> --
> Regards,
>
> Sakari Ailus


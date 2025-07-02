Return-Path: <linux-media+bounces-36628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16488AF638C
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 22:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633FF1C42421
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 20:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E4F2D77F3;
	Wed,  2 Jul 2025 20:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aGrPMuFQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56772DE6F5;
	Wed,  2 Jul 2025 20:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751489491; cv=none; b=ZvFlk/2l0LrbuRN0gGH5DTPmmWcdjY5E9o/M/quaYTWqvyzgkpSxhBexOXetKwjJWF8tIiC7+GA4wTeP2N36Aqs+yk9/vSYkxdg23HTMRL/DaG61L/KFozw/ysFkly3rX94mbg/w05b5P+OY2qqpaO2NZowoXjC0zLgzwP+DM1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751489491; c=relaxed/simple;
	bh=pZB+eUOlfplhCyuQZJ/swT3euXRYIJ+QbX5ELCNIlrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWIOsTfiFX6DDzyn49EWaeNJvgnIFblEfrb1DsdeX/l9pOWNVrCDPK19aijsGY7kzsrCpPIsUOZYj6k8/KJd8WRSl050Dr2N/5am9IleeDwpV3lfcDVBLl3X2EhC1K3wgKUXwKtiaOwyKIGTs1gFgYWA4SCUpkHVlOMp0MP7RYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aGrPMuFQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 98DA01D4C;
	Wed,  2 Jul 2025 22:51:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751489464;
	bh=pZB+eUOlfplhCyuQZJ/swT3euXRYIJ+QbX5ELCNIlrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGrPMuFQnkBG+JG1SNXfuOOWKqAofLnAQ3WyxyRbjJ/aq5xS21/wYv23Wtg4jaZM9
	 RwBFhDx527q5XZHibGrTpaQlvWEyYwqx8UbfOJrP4viYw++oD99CLZdeCJMkwaCyRp
	 BWAk8LxKHE19SZAVwsaV84LEDGv3fiSHYAxqomcU=
Date: Wed, 2 Jul 2025 23:51:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 01/15] media: rcar-csi2: Use the pad version of
 v4l2_get_link_freq()
Message-ID: <20250702205100.GM17819@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-1-026655df7138@ideasonboard.com>
 <20250602094321.GD3645@pendragon.ideasonboard.com>
 <20250702150711.GE3830050@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702150711.GE3830050@ragnatech.se>

On Wed, Jul 02, 2025 at 05:07:11PM +0200, Niklas Söderlund wrote:
> On 2025-06-02 12:43:21 +0300, Laurent Pinchart wrote:
> > On Fri, May 30, 2025 at 04:50:30PM +0300, Tomi Valkeinen wrote:
> > > Use the new version of v4l2_get_link_freq() which supports media_pad as
> > > a parameter.
> > 
> > The commit message should explain why. With that fixed,
> 
> How about this,
> 
> The pad aware version of v4l2_get_link_freq() tries to retrieve the link 

s/pad aware/pad-aware/

> frequency from the media bus configuration using the get_mbus_config 
> operation, and only if the subdevice do not implement this operation 

s/do not/does not/

> fall-back to the old method of getting it using the V4L2_CID_LINK_FREQ 

s/fall-back/falls back/

> or V4L2_CID_PIXEL_RATE control.
> 
> Update the VIN driver to use the pad aware version to be able to support 

s/pad aware/pad-aware/

> subdevices that only provides the link frequency in the media bus 
> configuration. As the implementation falls-back to the old method if the 

s/falls-back/falls back/

> subdevice don't support get_mbus_config, or don't provide a link 

s/don't/doesn't/g

> frequency in the v4l2_mbus_config struct, this is fully backward 
> compatible.

Looks good to me.

As discussed privately, this patch is needed to avoid breakages with the
latest GMSL2/3 drivers posted in [1] on Gen4 platforms. As the patch
makes sense on its own without the rest of the series, I'll take it in
my tree.

[1] lore.kernel.org/linux-media/20250702132104.1537926-1-demonsingur@gmail.com

> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > ---
> > >  drivers/media/platform/renesas/rcar-csi2.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > > index 9979de4f6ef1..ddbdde23c122 100644
> > > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > > @@ -954,6 +954,7 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
> > >  static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> > >  			   unsigned int lanes)
> > >  {
> > > +	struct media_pad *remote_pad;
> > >  	struct v4l2_subdev *source;
> > >  	s64 freq;
> > >  	u64 mbps;
> > > @@ -962,8 +963,9 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> > >  		return -ENODEV;
> > >  
> > >  	source = priv->remote;
> > > +	remote_pad = &source->entity.pads[priv->remote_pad];
> > >  
> > > -	freq = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
> > > +	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
> > >  	if (freq < 0) {
> > >  		int ret = (int)freq;
> > >  

-- 
Regards,

Laurent Pinchart


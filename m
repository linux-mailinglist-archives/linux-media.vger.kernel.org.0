Return-Path: <linux-media+bounces-23459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D669F2C97
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 10:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A7E6161D32
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 09:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B45200B9B;
	Mon, 16 Dec 2024 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PjSmlP2J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38A52E628
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734340075; cv=none; b=bY4zXl9W457mQfV4+65wqj9Kuy3kWRlRF3uIztD3gqqSYfxVvYeoji3RJeAC0b0HwGojXp1I8Kyc/tzCHCNbVavd93rFecuQcn0cs3HVRvxFq5A1z35acsrDsIVzqc+C7ywPZt+BLNWShkzsawZ4ySbRlPY1EwmRst7/7fX+ZrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734340075; c=relaxed/simple;
	bh=DI0looqerUSfKAG+mw9Wv6CS81S2oNeK7NJ4RS3oqHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRwrpiavDJi1LPRx2rWlLOHD9fIyYLuJ9aFe0B0jCfIhcNk2NQv44kTvQBi/jNEr/Cdmw6ck6ccGEKHPbmPS4ZnlB1B6Xf77pNkeBMX2IZejOijYco03jJCkTK5o933/ABEfG0iTtezbbXpYPJQzdCj7zegiftMJWTDc/VWPifo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PjSmlP2J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3BF613C;
	Mon, 16 Dec 2024 10:07:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734340035;
	bh=DI0looqerUSfKAG+mw9Wv6CS81S2oNeK7NJ4RS3oqHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PjSmlP2JsxE3FmNOCFzojdeFqCBsnF96wlIYSDgLt3bhnl3RNwxs4TxCxlmz5+swH
	 W976nkkXXvfw8OJTWm4toypg8KxxixYVv1W/4/9jJhGdW29/LPT43LWXldBsmPV/0h
	 njA+YFLPQQUuo8VqJLNjfmO/OxtvSGVecuteXkVA=
Date: Mon, 16 Dec 2024 11:07:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 5/5] media: intel/ipu6: Obtain link frequency from a
 sub-device
Message-ID: <20241216090736.GD32204@pendragon.ideasonboard.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-6-sakari.ailus@linux.intel.com>
 <20241215170832.GI9975@pendragon.ideasonboard.com>
 <Z1_bAI3PQdDNG_VJ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z1_bAI3PQdDNG_VJ@kekkonen.localdomain>

On Mon, Dec 16, 2024 at 07:47:12AM +0000, Sakari Ailus wrote:
> On Sun, Dec 15, 2024 at 07:08:32PM +0200, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> 
> Thank you for the review. I asked you to review a set but it wasn't this
> one:
> <URL:https://lore.kernel.org/linux-media/20241129095142.87196-1-sakari.ailus@linux.intel.com/T/#t>.
> :-)

Are you complaining that I review too many patches ? :-)

> > I think this should come before 4/5.
> > 
> > On Tue, Dec 10, 2024 at 09:59:06AM +0200, Sakari Ailus wrote:
> > > Obtain the link frequency from the sub-device instead of a control
> > > handler. This allows obtaining it using the get_mbus_config() sub-device
> > > pad op that which is only supported by the IVSC driver.
> > 
> > "which is the only method supported by the IVSC driver"
> > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 +++---------
> > >  1 file changed, 3 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > index 051898ce53f4..da8581a37e22 100644
> > > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > @@ -80,25 +80,19 @@ static const struct ipu6_csi2_error dphy_rx_errors[] = {
> > >  s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
> > >  {
> > >  	struct media_pad *src_pad;
> > > -	struct v4l2_subdev *ext_sd;
> > > -	struct device *dev;
> > >  
> > >  	if (!csi2)
> > >  		return -EINVAL;
> > >  
> > > -	dev = &csi2->isys->adev->auxdev.dev;
> > >  	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
> > 
> > Not a candidate for this patch, but can the source change, or can it be
> > cached at probe time (or notifier bound time) ?
> 
> It could be, but why would you do that?
> 
> This would also prevent connecting multiple sensors to a single CSI-2
> receiver.

Precisely because people shouldn't do this :-)

It would be more efficient to get the pad at probe time and cache it,
and would remove an error path at runtime. Until we have a use case
where we need to support more than one sensor on the same CSI-2 receiver
for this driver, I think that would be best.

> > >  	if (IS_ERR(src_pad)) {
> > > -		dev_err(dev, "can't get source pad of %s (%ld)\n",
> > > +		dev_err(&csi2->isys->adev->auxdev.dev,
> > > +			"can't get source pad of %s (%ld)\n",
> > >  			csi2->asd.sd.name, PTR_ERR(src_pad));
> > >  		return PTR_ERR(src_pad);
> > >  	}
> > >  
> > > -	ext_sd = media_entity_to_v4l2_subdev(src_pad->entity);
> > > -	if (WARN(!ext_sd, "Failed to get subdev for %s\n", csi2->asd.sd.name))
> > > -		return -ENODEV;
> > > -
> > > -	return v4l2_get_link_freq(ext_sd->ctrl_handler, 0, 0);
> > > +	return v4l2_get_link_freq(src_pad, 0, 0);
> > >  }
> > >  
> > >  static int csi2_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,

-- 
Regards,

Laurent Pinchart


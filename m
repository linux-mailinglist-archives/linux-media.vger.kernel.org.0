Return-Path: <linux-media+bounces-35343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB24AE0865
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 16:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 898711BC351C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD29A1D6187;
	Thu, 19 Jun 2025 14:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="umTX0kjo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763101A238D
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342557; cv=none; b=CqH/loKYOx4caY9PM/o9FNJ9E3cZ102PBvq0Qxm2011hXQ3aAnGx049LYfUZTyE5JzcScSf5E9MS0KDJrAcPPJRiW8ikYkiETNVSvxNCfDXCl9h7i8qYjm2jOkoPkwENODg7G/RIlyRoKkFO+uuEWcFwuv7XXIIFV3VJkSM3B6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342557; c=relaxed/simple;
	bh=knLYWQ27zCT+ViwPhg6hd+SJEgUOFLCYXupd/PjMF/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6M9OiQ3wowBxIeA6ezKjUBrL3TyCrBuOCq52+KblbkCXQEq8lHnh/4DtrELisdlNbAVhJq4KZDefp8i/mrONQ93nlP0DJEh9xEQsqYvR6e5LVKJR5hPQ+PjBtOI+MWkdHhV34c/ltxBQDkzMsY+UOWlfAklBvXE6zeJGaRb+Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=umTX0kjo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A567E107;
	Thu, 19 Jun 2025 16:15:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750342539;
	bh=knLYWQ27zCT+ViwPhg6hd+SJEgUOFLCYXupd/PjMF/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=umTX0kjobAtFJj9iVk8RgNlMD/mvgPFZlEQkMUBPdAnslHjMEwH/DSxM6dppxNX4I
	 d/sIThKQR+67ynvIIrp1ouPa2BStOFKdyJfWyviBYvgfprlG7CAEmirNY+kVuIef6T
	 /xXtp01JmDvddBPt35o1KkcmfimuEZ54Sh5iYwj0=
Date: Thu, 19 Jun 2025 17:15:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 01/13] media: ipu6: Use correct pads for xlate_streams()
Message-ID: <20250619141535.GN22102@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-2-sakari.ailus@linux.intel.com>
 <20250619132704.GC32166@pendragon.ideasonboard.com>
 <aFQWvHY1i4rPJXg1@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFQWvHY1i4rPJXg1@kekkonen.localdomain>

On Thu, Jun 19, 2025 at 01:55:08PM +0000, Sakari Ailus wrote:
> On Thu, Jun 19, 2025 at 04:27:04PM +0300, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> 
> Thanks for the review!
> 
> > On Thu, Jun 19, 2025 at 11:15:34AM +0300, Sakari Ailus wrote:
> > > The arguments to v4l2_subdev_state_xlate_streams() were incorrect, the
> > 
> > s/were/are/
> > 
> > > source pads was used as the sink pad and the source pad was a constant
> > 
> > s/pads was/pad is/
> > s/pad was/pad is/
> > 
> > Are you sure though ? Unless I misread the code, you replace
> > 
> > pad0 = CSI2_PAD_SRC
> > pad1 = CSI2_PAD_SINK
> > 
> > with
> > 
> > pad0 = pad
> > pad1 = CSI2_PAD_SINK
> > 
> > This seems to be a correct fix, but I don't see where "the source pad
> > was used as the sink pad".
> 
> Right, I'll reword it for v2.
> 
> > > (rather than the actual source pad). Fix these.
> > > 
> > > Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > index da8581a37e22..6030bd23b4b9 100644
> > > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > @@ -354,9 +354,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
> > >  	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
> > >  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> > >  
> > > -	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
> > > -						       CSI2_PAD_SINK,
> > > -						       &streams_mask);
> > > +	sink_streams =
> > > +		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> > > +						&streams_mask);
> > 
> > This is one of the cases where I'd write
> > 
> > 	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> > 						       &streams_mask);
> > 
> > even if it goes to 81 columns.
> 
> The limit is still 80, not 81.

The global limit is 100 for the kernel. There's somehow of a consensus
in the media subsystem to keep it closer to 80, with different people
have different sensitivities. We occasionally go over 80, and that's
usually left as a driver maintainer decision.

> Either way, a number of the new functions in the V4L2 subdev KAPI have very
> long names, I'll post patches to shorten them later on.

As long as the name remains equally readable and understandable, and all
functions use the same conventions, I'm fine with that.

> > >  
> > >  	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
> > >  	if (ret)
> > > @@ -384,9 +384,9 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
> > >  	struct media_pad *remote_pad;
> > >  	u64 sink_streams;
> > >  
> > > -	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
> > > -						       CSI2_PAD_SINK,
> > > -						       &streams_mask);
> > > +	sink_streams =
> > > +		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> > > +						&streams_mask);
> > 
> > Same here.
> > 
> > >  
> > >  	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
> > >  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);

-- 
Regards,

Laurent Pinchart


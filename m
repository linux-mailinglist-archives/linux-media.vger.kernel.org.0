Return-Path: <linux-media+bounces-35357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AEEAE0A24
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 17:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52D091C22A1E
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 15:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BD12264C1;
	Thu, 19 Jun 2025 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="chaiolhm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1DA28C026
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345726; cv=none; b=mGGbv5sOUmQmPbmwZpoXrOWBnQwPfRVslNjULgnhXOVtiC/HuGiH0Pz88KJG3y4wU2HcimRFeTQxDNb7FIc7SLQ4WSOss23vhU47iYu1o31gLL9OrfxQ/og3EfritCCWscNrX4NaCLu3fokT0Aj4FCRRgBBCf7u3lb1XS3IZJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345726; c=relaxed/simple;
	bh=SQSh6VYNs/62U3Zi0e5ZoLXCX1FnJnKUdBrJXuHVMsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lveo/etrvScKFurrSN/DHggaTe6c8ob7kmSwcSVc+U3KPtb9mkxsKInXsG4EXSTKdW0lg9bLt2Fjb0T+tl2Kz0uTgc9/1jcOASYq6DGX9W9zaVUQYFty/IxyL2atl+UWCAncEhmoXDMl9BD7X8HExOepYC7Q+5SdTiyMOduJQTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=chaiolhm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AF982EC;
	Thu, 19 Jun 2025 17:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750345708;
	bh=SQSh6VYNs/62U3Zi0e5ZoLXCX1FnJnKUdBrJXuHVMsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chaiolhmoDRgDVHnOrz+1J/F9A9y2GaVmvs3c6htUz7s3oTmmsBD0RpzbWpz2J4vL
	 5+ITvqlMtgAPAFJJqnmHtf7UCJ0EtJUKP2bcGO0v/MELnO7KFNG3oC8LsUjEmE0PCl
	 Wm4+MNSert+QfuKlGIe8pmJ0TEbpuzViks5zmhhY=
Date: Thu, 19 Jun 2025 18:08:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 01/13] media: ipu6: Use correct pads for xlate_streams()
Message-ID: <20250619150824.GO22102@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-2-sakari.ailus@linux.intel.com>
 <20250619132704.GC32166@pendragon.ideasonboard.com>
 <aFQWvHY1i4rPJXg1@kekkonen.localdomain>
 <20250619141535.GN22102@pendragon.ideasonboard.com>
 <aFQeoK8B008EHc3C@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFQeoK8B008EHc3C@kekkonen.localdomain>

On Thu, Jun 19, 2025 at 02:28:48PM +0000, Sakari Ailus wrote:
> On Thu, Jun 19, 2025 at 05:15:35PM +0300, Laurent Pinchart wrote:
> > On Thu, Jun 19, 2025 at 01:55:08PM +0000, Sakari Ailus wrote:
> > > On Thu, Jun 19, 2025 at 04:27:04PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Jun 19, 2025 at 11:15:34AM +0300, Sakari Ailus wrote:
> > > > > The arguments to v4l2_subdev_state_xlate_streams() were incorrect, the
> > > > 
> > > > s/were/are/
> > > > 
> > > > > source pads was used as the sink pad and the source pad was a constant
> > > > 
> > > > s/pads was/pad is/
> > > > s/pad was/pad is/
> > > > 
> > > > Are you sure though ? Unless I misread the code, you replace
> > > > 
> > > > pad0 = CSI2_PAD_SRC
> > > > pad1 = CSI2_PAD_SINK
> > > > 
> > > > with
> > > > 
> > > > pad0 = pad
> > > > pad1 = CSI2_PAD_SINK
> > > > 
> > > > This seems to be a correct fix, but I don't see where "the source pad
> > > > was used as the sink pad".
> > > 
> > > Right, I'll reword it for v2.
> > > 
> > > > > (rather than the actual source pad). Fix these.
> > > > > 
> > > > > Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 ++++++------
> > > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > > index da8581a37e22..6030bd23b4b9 100644
> > > > > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > > @@ -354,9 +354,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
> > > > >  	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
> > > > >  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> > > > >  
> > > > > -	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
> > > > > -						       CSI2_PAD_SINK,
> > > > > -						       &streams_mask);
> > > > > +	sink_streams =
> > > > > +		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> > > > > +						&streams_mask);
> > > > 
> > > > This is one of the cases where I'd write
> > > > 
> > > > 	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> > > > 						       &streams_mask);
> > > > 
> > > > even if it goes to 81 columns.
> > > 
> > > The limit is still 80, not 81.
> > 
> > The global limit is 100 for the kernel. There's somehow of a consensus
> > in the media subsystem to keep it closer to 80, with different people
> > have different sensitivities. We occasionally go over 80, and that's
> > usually left as a driver maintainer decision.
> 
> It's 80, not 100. The checkpatch.pl limit is higher than 80 though, as
> there are still commonly cases where the code is more readable with longer
> lines. See e.g. Documentation/process/coding-style.rst .

It states

----
The preferred limit on the length of a single line is 80 columns.

Statements longer than 80 columns should be broken into sensible chunks,
unless exceeding 80 columns significantly increases readability and does
not hide information.
----

In this specific case, going over 80 columns improves readability in my
opinion, and doesn't hide information. As I wrote, we treat this as a
driver maintainer preference at the moment, so I won't make a call for
the ipu6 driver.

-- 
Regards,

Laurent Pinchart


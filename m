Return-Path: <linux-media+bounces-35335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 586F1AE06D7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 15:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2C8C4A2BF2
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 13:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A053246BB4;
	Thu, 19 Jun 2025 13:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KHC6vAX2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AE62264DF
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339162; cv=none; b=gFl8nv0cj3CBzRN4c/Bmo3/sA+9CnqTtj21Qh/CTzktfVvOmZMfIeaLSRkN44Vg3XSTSdHzAcYomSfIzSHqlkSkbPYalhOeZ0NW1OLsMtt3S/Pd4hNigGCbeeM/xV3vAVZibq2Wh03h3VfCUQqpHU1U/eNVGBs8W02RIAJLh7wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339162; c=relaxed/simple;
	bh=4OBFwitY0kEE7G03lXuFEILRq+Z9hpzTKhT+K5bLa+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4TclMKjbkRZE2/R1emqTL0N/INljc2wy1i7aRVTHGZCQlyLCi0FQ4a9VinqhrK5zOaups+vHHkFYzWWHtGXyHz7aURkle3nTWhmOr1IN1CRcahX/WGVdxhOE4ur2mJfCib+5MnJ4vB/KtW96GG79r3aJvB5qsuEug9AsKOuZEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KHC6vAX2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A88F99F;
	Thu, 19 Jun 2025 15:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750339145;
	bh=4OBFwitY0kEE7G03lXuFEILRq+Z9hpzTKhT+K5bLa+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHC6vAX2AlYU2SVvFLMahAuwIo1zr7xp2XUPoNoDHqXpeCTSGmyTzf02OIfUEbrPi
	 hw1iQnOb3y/icjMEi8xEThveUrls/QzR4zyffqYp6q5OSZSwdecx7v0QMiMmWzBxqE
	 wsD9WNf4t1yyJFlRupOpTy0gGGWkNZ1L5jKCi4F0=
Date: Thu, 19 Jun 2025 16:19:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 03/13] media: ipu6: Enable and disable each stream at
 CSI-2 subdev source pad
Message-ID: <20250619131900.GB32166@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-4-sakari.ailus@linux.intel.com>
 <20250619124855.GA32166@pendragon.ideasonboard.com>
 <aFQMWAgx_LnC2IGL@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFQMWAgx_LnC2IGL@kekkonen.localdomain>

On Thu, Jun 19, 2025 at 01:10:48PM +0000, Sakari Ailus wrote:
> On Thu, Jun 19, 2025 at 03:48:55PM +0300, Laurent Pinchart wrote:
> > On Thu, Jun 19, 2025 at 11:15:36AM +0300, Sakari Ailus wrote:
> > > On UAPI, streaming is started a video device at a time. The IPU6 ISYS
> > > driver only starts streaming on the source sub-device when all relevant
> > > video devices have been set streaming. This also needs to be reflected in
> > > the sub-device pads, hence set them all streaming, one at a time.
> > 
> > Why ? What's wrong with enabling/disabling streams on each pad as the
> > corresponding video device is started/stopped ?
> 
> Streaming is started once all the related video nodes are set streaming,
> otherwise there's a chance of losing data.

Yes, but that's something that can be handled in the subdev, to only
start the ISYS and its source when all the streams that are part of the
pipeline have been started.

> I've squashed this with the last patch after posting the set.

Maybe it will become clearer when I review the rest of the series.

> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 43 ++++++++++++-------
> > >  1 file changed, 28 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > > index 24a2ef93474c..54006b5e2ccd 100644
> > > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > > @@ -990,6 +990,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> > >  	struct device *dev = &av->isys->adev->auxdev.dev;
> > >  	struct v4l2_subdev *sd;
> > >  	struct media_pad *r_pad;
> > > +	unsigned int i;
> > >  	u32 sink_pad, sink_stream;
> > >  	u64 r_stream;
> > >  	u64 stream_mask = 0;
> > > @@ -1018,14 +1019,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> > >  		stop_streaming_firmware(av);
> > >  
> > >  		/* stop sub-device which connects with video */
> > > -		dev_dbg(dev, "stream off entity %s pad:%d mask:0x%llx\n",
> > > -			sd->name, r_pad->index, stream_mask);
> > > -		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
> > > -						  stream_mask);
> > > -		if (ret) {
> > > -			dev_err(dev, "stream off %s failed with %d\n", sd->name,
> > > -				ret);
> > > -			return ret;
> > > +		for (i = CSI2_PAD_SRC; i < NR_OF_CSI2_SRC_PADS; i++) {
> > > +			if (!media_pad_pipeline(&sd->entity.pads[i]))
> > > +				continue;
> > > +			ret = v4l2_subdev_disable_streams(sd, i, 1U);
> > > +			if (ret) {
> > > +				dev_err(dev, "stream off %s failed with %d\n",
> > > +					sd->name, ret);
> > > +				return ret;
> > > +			}
> > >  		}
> > >  		close_streaming_firmware(av);
> > >  	} else {
> > > @@ -1036,13 +1038,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> > >  		}
> > >  
> > >  		/* start sub-device which connects with video */
> > > -		dev_dbg(dev, "stream on %s pad %d mask 0x%llx\n", sd->name,
> > > -			r_pad->index, stream_mask);
> > > -		ret = v4l2_subdev_enable_streams(sd, r_pad->index, stream_mask);
> > > -		if (ret) {
> > > -			dev_err(dev, "stream on %s failed with %d\n", sd->name,
> > > -				ret);
> > > -			goto out_media_entity_stop_streaming_firmware;
> > > +		for (i = CSI2_PAD_SRC; i < NR_OF_CSI2_SRC_PADS; i++) {
> > > +			if (!media_pad_pipeline(&sd->entity.pads[i]))
> > > +				continue;
> > > +			ret = v4l2_subdev_enable_streams(sd, i, 1U);
> > > +			if (ret) {
> > > +				dev_err(dev, "stream on %s failed with %d\n",
> > > +					sd->name, ret);
> > > +				goto out_media_entity_stop_streaming_firmware;
> > > +			}
> > >  		}
> > >  	}
> > >  
> > > @@ -1051,6 +1055,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> > >  	return 0;
> > >  
> > >  out_media_entity_stop_streaming_firmware:
> > > +	while (i-- > CSI2_PAD_SRC) {
> > > +		int ret2;
> > > +
> > > +		if (!media_pad_pipeline(&sd->entity.pads[i]))
> > > +			continue;
> > > +		ret2 = v4l2_subdev_disable_streams(sd, i, 1U);
> > > +		dev_err(dev, "stream off %s failed with %d\n", sd->name, ret2);
> > > +	}
> > > +
> > >  	stop_streaming_firmware(av);
> > >  
> > >  	return ret;

-- 
Regards,

Laurent Pinchart


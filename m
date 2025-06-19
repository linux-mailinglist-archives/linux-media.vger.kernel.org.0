Return-Path: <linux-media+bounces-35341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6B9AE07F2
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 15:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D73A2189E428
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 13:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605A628D8E1;
	Thu, 19 Jun 2025 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtMyXqic"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA0E25DCF2
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341155; cv=none; b=Qt9tH7wFqe+IzdCs/yQiTHJ035arq5YBaHlh/08QzVzeTip0BioGEX0JD4kAL0Vf1xM8Kjt3GsY970Fihp29d1500db9CChQ0vm2OcA4e8G/ZDh+qhh7Y1MpKb10x1nsbX22ZtG9dcnNMApLtL6LSbzM9+ZJNCIp1SDNXHN2aqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341155; c=relaxed/simple;
	bh=9rqTGVzQU8QP5UpsWS1KXQEMBw52fJQ+eS/N0Sd5NeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=genTJeOesvfisbcQv+6lDC0AvnJ4BYxZgWHlHXkNEJ8mKJ6O9NI5EhSoOUgZNMP9gNsTAy9EKp8tuPOY4FffPBOtLGHn9uKcoFlg8fQ2GEoiOJO7yWY/cKvFWyNS6NXpoCy6yor5QYdLo6SNOoRgI3atN1164rcpmMyFGc+RLHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtMyXqic; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750341154; x=1781877154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9rqTGVzQU8QP5UpsWS1KXQEMBw52fJQ+eS/N0Sd5NeQ=;
  b=OtMyXqicBOCJ+AF9N49sSt8OBQr/zTA/Qe9JYbT2tQzDOJJiYObSbXAm
   sALqraL+bzTKaRB2wr9WJqa9pJ2k+sIqis4X5MErKslrXsE39u698715f
   nLNbsqmunNiUYK2sKqvgIdAgk22NKmbgg6PsyS1yicb0g3rBbiHkXep7g
   Lq1tDfoL0XU9zzBVkYhvlPzJp3gsbo71qHtcwiUR5ytn7nSk8Ha2h8PZO
   O+ynsFEuybsFgyEcnHb7lx8U+6temySGZswlznL+XSZZP7TqnyWfDS2mc
   +ZUKOe8XHt3JNV+LqESy7SnkRzgk1LBMPBoKz+wEP66/MfpczGmwOMgUn
   Q==;
X-CSE-ConnectionGUID: cSO0o5gfReiffLqaeZ86dA==
X-CSE-MsgGUID: h2YgFIkgQV+KFPkPkZdXng==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="62862932"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="62862932"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 06:52:34 -0700
X-CSE-ConnectionGUID: VM5cvnK1TWGsRE+d2nDCkw==
X-CSE-MsgGUID: rBh+sLKrRyGxIFeD4sab4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150249052"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 06:52:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DCD7211FC38;
	Thu, 19 Jun 2025 16:52:28 +0300 (EEST)
Date: Thu, 19 Jun 2025 13:52:28 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 03/13] media: ipu6: Enable and disable each stream at
 CSI-2 subdev source pad
Message-ID: <aFQWHBSPcCCTmtHq@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-4-sakari.ailus@linux.intel.com>
 <20250619124855.GA32166@pendragon.ideasonboard.com>
 <aFQMWAgx_LnC2IGL@kekkonen.localdomain>
 <20250619131900.GB32166@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619131900.GB32166@pendragon.ideasonboard.com>

On Thu, Jun 19, 2025 at 04:19:00PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 19, 2025 at 01:10:48PM +0000, Sakari Ailus wrote:
> > On Thu, Jun 19, 2025 at 03:48:55PM +0300, Laurent Pinchart wrote:
> > > On Thu, Jun 19, 2025 at 11:15:36AM +0300, Sakari Ailus wrote:
> > > > On UAPI, streaming is started a video device at a time. The IPU6 ISYS
> > > > driver only starts streaming on the source sub-device when all relevant
> > > > video devices have been set streaming. This also needs to be reflected in
> > > > the sub-device pads, hence set them all streaming, one at a time.
> > > 
> > > Why ? What's wrong with enabling/disabling streams on each pad as the
> > > corresponding video device is started/stopped ?
> > 
> > Streaming is started once all the related video nodes are set streaming,
> > otherwise there's a chance of losing data.
> 
> Yes, but that's something that can be handled in the subdev, to only
> start the ISYS and its source when all the streams that are part of the
> pipeline have been started.

I agree, this is done in the CSI-2 receiver driver actually.

There's some work to do in cleaning up the IPU6 driver. The combination of
videobuf2 and streams isn't very driver-friendly currently. Things
generally need to happen in certain order and this may not be always veyr
convenient for drivers.

> 
> > I've squashed this with the last patch after posting the set.
> 
> Maybe it will become clearer when I review the rest of the series.
> 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 43 ++++++++++++-------
> > > >  1 file changed, 28 insertions(+), 15 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > > > index 24a2ef93474c..54006b5e2ccd 100644
> > > > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > > > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > > > @@ -990,6 +990,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> > > >  	struct device *dev = &av->isys->adev->auxdev.dev;
> > > >  	struct v4l2_subdev *sd;
> > > >  	struct media_pad *r_pad;
> > > > +	unsigned int i;
> > > >  	u32 sink_pad, sink_stream;
> > > >  	u64 r_stream;
> > > >  	u64 stream_mask = 0;
> > > > @@ -1018,14 +1019,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> > > >  		stop_streaming_firmware(av);
> > > >  
> > > >  		/* stop sub-device which connects with video */
> > > > -		dev_dbg(dev, "stream off entity %s pad:%d mask:0x%llx\n",
> > > > -			sd->name, r_pad->index, stream_mask);
> > > > -		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
> > > > -						  stream_mask);
> > > > -		if (ret) {
> > > > -			dev_err(dev, "stream off %s failed with %d\n", sd->name,
> > > > -				ret);
> > > > -			return ret;
> > > > +		for (i = CSI2_PAD_SRC; i < NR_OF_CSI2_SRC_PADS; i++) {
> > > > +			if (!media_pad_pipeline(&sd->entity.pads[i]))
> > > > +				continue;
> > > > +			ret = v4l2_subdev_disable_streams(sd, i, 1U);
> > > > +			if (ret) {
> > > > +				dev_err(dev, "stream off %s failed with %d\n",
> > > > +					sd->name, ret);
> > > > +				return ret;
> > > > +			}
> > > >  		}
> > > >  		close_streaming_firmware(av);
> > > >  	} else {
> > > > @@ -1036,13 +1038,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> > > >  		}
> > > >  
> > > >  		/* start sub-device which connects with video */
> > > > -		dev_dbg(dev, "stream on %s pad %d mask 0x%llx\n", sd->name,
> > > > -			r_pad->index, stream_mask);
> > > > -		ret = v4l2_subdev_enable_streams(sd, r_pad->index, stream_mask);
> > > > -		if (ret) {
> > > > -			dev_err(dev, "stream on %s failed with %d\n", sd->name,
> > > > -				ret);
> > > > -			goto out_media_entity_stop_streaming_firmware;
> > > > +		for (i = CSI2_PAD_SRC; i < NR_OF_CSI2_SRC_PADS; i++) {
> > > > +			if (!media_pad_pipeline(&sd->entity.pads[i]))
> > > > +				continue;
> > > > +			ret = v4l2_subdev_enable_streams(sd, i, 1U);
> > > > +			if (ret) {
> > > > +				dev_err(dev, "stream on %s failed with %d\n",
> > > > +					sd->name, ret);
> > > > +				goto out_media_entity_stop_streaming_firmware;
> > > > +			}
> > > >  		}
> > > >  	}
> > > >  
> > > > @@ -1051,6 +1055,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> > > >  	return 0;
> > > >  
> > > >  out_media_entity_stop_streaming_firmware:
> > > > +	while (i-- > CSI2_PAD_SRC) {
> > > > +		int ret2;
> > > > +
> > > > +		if (!media_pad_pipeline(&sd->entity.pads[i]))
> > > > +			continue;
> > > > +		ret2 = v4l2_subdev_disable_streams(sd, i, 1U);
> > > > +		dev_err(dev, "stream off %s failed with %d\n", sd->name, ret2);
> > > > +	}
> > > > +
> > > >  	stop_streaming_firmware(av);
> > > >  
> > > >  	return ret;
> 

-- 
Regards,

Sakari Ailus


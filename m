Return-Path: <linux-media+bounces-35334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E88EAE0690
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 15:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 241643A517A
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 13:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCD62459F1;
	Thu, 19 Jun 2025 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6miw9DM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F291178F4A
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750338655; cv=none; b=M00dNXpy77ne1emXSEALFP1bZi7/bXfweo+BoUoIWbJpWP+pHdNdT1+I5SBR1x5y6/uI3UndqObv92GGM+J87vhah/1sD9mTPiv+qBUlk233k7pzgZoD1fd3BtcvUqWhvxCu90DCXvhGNmQs0y5qlRxi8GiECZNXuzAWpoIRZ2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750338655; c=relaxed/simple;
	bh=FuoUn9XBBIihzGP7d1BJA/Q5O6L7RKgIcn9WlX0XIwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acVlBnKOz6kEAYJPPl76aqeGugqtR8TLYW6wDzQLnK4OSwDPRFTBE3FRxMJPPpjEEa/IgIhSPCVIaDiDkjJoYZSFK6unq50E9/Lge9ozSOS4SODeEIpf9UNeahkOiy5w8vaxc1c9JygyjbtWCwF+j+8/Lv8bNGtc2bjLJWODl00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6miw9DM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750338655; x=1781874655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FuoUn9XBBIihzGP7d1BJA/Q5O6L7RKgIcn9WlX0XIwQ=;
  b=i6miw9DM2cpLadcxWbHJimfL79MXODZ2FoMCdSvLq7LyY6vJ3XOYlhUG
   rMGpqd1n00M12EJHZeQLWkRKqxdWHqRKsqY/2paJpeA15dlUbLm7VDuL7
   hn94IctZPeabnajZOL3n8yk7V6W+wHcbXXwPOE4frdkPgAY01/1Jh+l3Q
   MJQ5wEYWF1i+jkadzE1evmTAvlVEs7YtV3Tjb0InuZYnEoHVpmuACuHVi
   rYS3nA9JNzjgQqPhyVdHcyvsm9MY7+eIoSgh4Lp+Xe0xkNBk5CV4dHnvh
   OZAphWt85FWKevRXv8866SVDiIqwID5kHr3oNWMizrmDRIpc9Gwwmy/ME
   w==;
X-CSE-ConnectionGUID: FA4PPoLASz+59NF9InWVig==
X-CSE-MsgGUID: 5R4ve8/1RoiKfXHTl5Sgrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="62859132"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="62859132"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 06:10:54 -0700
X-CSE-ConnectionGUID: RegUNtmiSDW95mB/uFsrxw==
X-CSE-MsgGUID: WqeqVG4ZSHOpDzK4A+UVhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150871618"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 06:10:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C461D11F91E;
	Thu, 19 Jun 2025 16:10:48 +0300 (EEST)
Date: Thu, 19 Jun 2025 13:10:48 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 03/13] media: ipu6: Enable and disable each stream at
 CSI-2 subdev source pad
Message-ID: <aFQMWAgx_LnC2IGL@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-4-sakari.ailus@linux.intel.com>
 <20250619124855.GA32166@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619124855.GA32166@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Jun 19, 2025 at 03:48:55PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Jun 19, 2025 at 11:15:36AM +0300, Sakari Ailus wrote:
> > On UAPI, streaming is started a video device at a time. The IPU6 ISYS
> > driver only starts streaming on the source sub-device when all relevant
> > video devices have been set streaming. This also needs to be reflected in
> > the sub-device pads, hence set them all streaming, one at a time.
> 
> Why ? What's wrong with enabling/disabling streams on each pad as the
> corresponding video device is started/stopped ?

Streaming is started once all the related video nodes are set streaming,
otherwise there's a chance of losing data.

I've squashed this with the last patch after posting the set.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 43 ++++++++++++-------
> >  1 file changed, 28 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > index 24a2ef93474c..54006b5e2ccd 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > @@ -990,6 +990,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> >  	struct device *dev = &av->isys->adev->auxdev.dev;
> >  	struct v4l2_subdev *sd;
> >  	struct media_pad *r_pad;
> > +	unsigned int i;
> >  	u32 sink_pad, sink_stream;
> >  	u64 r_stream;
> >  	u64 stream_mask = 0;
> > @@ -1018,14 +1019,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> >  		stop_streaming_firmware(av);
> >  
> >  		/* stop sub-device which connects with video */
> > -		dev_dbg(dev, "stream off entity %s pad:%d mask:0x%llx\n",
> > -			sd->name, r_pad->index, stream_mask);
> > -		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
> > -						  stream_mask);
> > -		if (ret) {
> > -			dev_err(dev, "stream off %s failed with %d\n", sd->name,
> > -				ret);
> > -			return ret;
> > +		for (i = CSI2_PAD_SRC; i < NR_OF_CSI2_SRC_PADS; i++) {
> > +			if (!media_pad_pipeline(&sd->entity.pads[i]))
> > +				continue;
> > +			ret = v4l2_subdev_disable_streams(sd, i, 1U);
> > +			if (ret) {
> > +				dev_err(dev, "stream off %s failed with %d\n",
> > +					sd->name, ret);
> > +				return ret;
> > +			}
> >  		}
> >  		close_streaming_firmware(av);
> >  	} else {
> > @@ -1036,13 +1038,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> >  		}
> >  
> >  		/* start sub-device which connects with video */
> > -		dev_dbg(dev, "stream on %s pad %d mask 0x%llx\n", sd->name,
> > -			r_pad->index, stream_mask);
> > -		ret = v4l2_subdev_enable_streams(sd, r_pad->index, stream_mask);
> > -		if (ret) {
> > -			dev_err(dev, "stream on %s failed with %d\n", sd->name,
> > -				ret);
> > -			goto out_media_entity_stop_streaming_firmware;
> > +		for (i = CSI2_PAD_SRC; i < NR_OF_CSI2_SRC_PADS; i++) {
> > +			if (!media_pad_pipeline(&sd->entity.pads[i]))
> > +				continue;
> > +			ret = v4l2_subdev_enable_streams(sd, i, 1U);
> > +			if (ret) {
> > +				dev_err(dev, "stream on %s failed with %d\n",
> > +					sd->name, ret);
> > +				goto out_media_entity_stop_streaming_firmware;
> > +			}
> >  		}
> >  	}
> >  
> > @@ -1051,6 +1055,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> >  	return 0;
> >  
> >  out_media_entity_stop_streaming_firmware:
> > +	while (i-- > CSI2_PAD_SRC) {
> > +		int ret2;
> > +
> > +		if (!media_pad_pipeline(&sd->entity.pads[i]))
> > +			continue;
> > +		ret2 = v4l2_subdev_disable_streams(sd, i, 1U);
> > +		dev_err(dev, "stream off %s failed with %d\n", sd->name, ret2);
> > +	}
> > +
> >  	stop_streaming_firmware(av);
> >  
> >  	return ret;
> 

-- 
Regards,

Sakari Ailus


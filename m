Return-Path: <linux-media+bounces-35368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B855AE0BDF
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 19:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 230A0174C3D
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 17:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D970928C2DE;
	Thu, 19 Jun 2025 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FW8Cqozo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C561DB54C
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 17:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750353666; cv=none; b=DD/L17n7v7wj7bVWtpHPttb624tlVJVTfN4VmN6LjIUWY3wCNw0ena7hWLH1Yn2YTsD08lG+pbI3fFL6vtUDXqNN+2ExmbY91TN4LoRNqYF0aJCOOJba1t/eoiKaO6dWZOu9E3Qo/ka66oyH97H2gG0AZauyITfrKvOmhQW3I2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750353666; c=relaxed/simple;
	bh=M0w5xMRHIS3RZQadhkWaxoKnzF6ksJQuO2uElIm5/r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XS59CUuTOdMyIDDPQEPh4RNb3cSer7U1fX+stiZICzZayUaYPZYAxsWUe42Y7727Kq/lUG5Cx5Eaa/JjZIxEiaxnno756fxwbMlIpxeEB68tM3rVKpJhAeN+OUoRY87mHSTOE3KUZ2DulvNAaZ3Fl+NzeJCGvFFG+T/T2RN+sNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FW8Cqozo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750353664; x=1781889664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M0w5xMRHIS3RZQadhkWaxoKnzF6ksJQuO2uElIm5/r8=;
  b=FW8CqozoJWhFxjDga07XBs/Ji/uGfBcVoVcVaZdBpMat1OinN1jtfKKg
   cYN2rR2RPh3H6Wyy+0qChUZRKrmEvPxExBxcxjsHlnCSAUJHzkeDiU2qr
   LLKuiz2LGQ3EHZMLPcAcmT3tphCF59T3kJu3ytc3S4UuAL85ml68D8oif
   OUQ9bFL6g+PQAP+erhQyOMJI2oRbCF4HBcZ4+l/4j+F00SOhlpMkuqZHf
   fgnQhs0O0ZhHvItiaajfDcRrwnoQd4NGF//Rt4Mok5DKWLZXhptfx2Osr
   XjrXpwjpyepShK5sB19bI+C4+kkuu9Nw1UbuWEuWfiaFTzhkTjFXPiMsv
   g==;
X-CSE-ConnectionGUID: FTlyR7BgStC8gWlS7RX6vw==
X-CSE-MsgGUID: Uo3LEitdSGKyDj+xusrdeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52480545"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="52480545"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 10:21:03 -0700
X-CSE-ConnectionGUID: jQe9b0nLRASN+/1nwRn2Dg==
X-CSE-MsgGUID: sy3yW2kiSIm0nWPXqC1ylA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="174316373"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.10])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 10:21:01 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3549811F89A;
	Thu, 19 Jun 2025 20:20:59 +0300 (EEST)
Date: Thu, 19 Jun 2025 17:20:59 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 07/13] media: ipu6: Set up CSI-2 receiver at correct
 moment
Message-ID: <aFRG-9RoCGbWK_yx@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-8-sakari.ailus@linux.intel.com>
 <20250619170030.GI32166@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619170030.GI32166@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Jun 19, 2025 at 08:00:30PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thanks for the review.

> 
> On Thu, Jun 19, 2025 at 11:15:40AM +0300, Sakari Ailus wrote:
> > Enable the CSI-2 receiver before the first stream is started and disable
> > it when the last stream is stopped. Before this patch, every time a stream
> > was started, the CSI-2 receiver was enabled and similarly, it was disabled
> > when any stream was stopped.
> 
> You mentioned in 03/13 that we should only enable the source when all
> video capture devices have been started. Shouldn't you enable the CSI-2
> receiver when *all* streams are enabled, not when the first one is
> enabled (and similarly when stopping) ?

Indeed. That only comes in the last patch, but I think some of these can be
squashed, too.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 25 ++++++++++++-------
> >  1 file changed, 16 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > index 6030bd23b4b9..3b837e9ccffe 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > @@ -348,7 +348,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
> >  	struct ipu6_isys_csi2_timing timing = { };
> >  	struct v4l2_subdev *remote_sd;
> >  	struct media_pad *remote_pad;
> > -	u64 sink_streams;
> > +	u64 sink_streams, already_enabled;
> >  	int ret;
> >  
> >  	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
> > @@ -358,13 +358,17 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
> >  		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> >  						&streams_mask);
> >  
> > -	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
> > -	if (ret)
> > -		return ret;
> > +	already_enabled = v4l2_subdev_state_streams_enabled(sd, state,
> > +							    CSI2_PAD_SINK);
> 
> It would be cheaper to store a bitmask of enabled streams on the csi2
> structure.

I think I'll do just that. Indeed, this soon won't be even usable here in
any case.

> 
> > +	if (!already_enabled) {
> > +		ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
> > +		if (ret)
> > +			return ret;
> >  
> > -	ret = ipu6_isys_csi2_set_stream(sd, &timing, csi2->nlanes, true);
> > -	if (ret)
> > -		return ret;
> > +		ret = ipu6_isys_csi2_set_stream(sd, &timing, csi2->nlanes, true);
> > +		if (ret)
> > +			return ret;
> > +	}
> >  
> >  	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
> >  					 sink_streams);
> > @@ -382,7 +386,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
> >  {
> >  	struct v4l2_subdev *remote_sd;
> >  	struct media_pad *remote_pad;
> > -	u64 sink_streams;
> > +	u64 sink_streams, still_enabled;
> >  
> >  	sink_streams =
> >  		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> > @@ -391,7 +395,10 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
> >  	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
> >  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> >  
> > -	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
> > +	still_enabled = v4l2_subdev_state_streams_enabled(sd, state,
> > +							  CSI2_PAD_SINK);
> > +	if (still_enabled == sink_streams)
> > +		ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
> >  
> >  	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
> >  
> 

-- 
Regards,

Sakari Ailus


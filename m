Return-Path: <linux-media+bounces-35342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D977EAE0809
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 15:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C8901BC39BF
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 13:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C29270EBC;
	Thu, 19 Jun 2025 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6lnw6bm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C421B23E325
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341314; cv=none; b=ACia8MivUQb7YTSobSph+40kbGNtUHattVRcpmWSX0+xInIK5l4NHWkhQeZIwPkizx11zgZ0UnOCm41AR+/BnfXS3hcgcWK2LqPvYUH5njIyRTKGZotDPrn9BsAHTZWExp6R1itCqWl/YAvIrFSC5v8pKJkP5tjqGD7GHHyUMOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341314; c=relaxed/simple;
	bh=KuLw6Xyq5v7bpgKklXgoGJ7/67MWMZWTXBpPHCSy6iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAoWMOkWl9WkzwTq+xU88NE2xISJ4orwx27oBHGnqO92E8ISWTEcYfNrUHm/2zA4foJSEx+iSU/bohTKi6NI8bczJNcSVJtLEeLI2Mxh9nVKbYCdhpPS/ZfB0gAMKPFdFUdSqH+4z0IUA3J44/b5zPUZNL6kBfvJP8ZGNQjwPwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6lnw6bm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750341312; x=1781877312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KuLw6Xyq5v7bpgKklXgoGJ7/67MWMZWTXBpPHCSy6iw=;
  b=I6lnw6bmB/Lo+Yp1dawlCbUNActnzS60YKTdlIxoA7PYqhzzO1hZxl9i
   8nuvZyXCglQm4WtvMyMWIxQtFMirtCd28xJ/+Lc9SHuMAhX7hYj7RP+pW
   DT2WJeFIKzs1y95XJybjxb+HowcjjhbiY9Isz8W0NdlQrtS99wpMh9FfJ
   sbyERQY7mlsmNi33guI/rhofDq2Qae7MztBaS9lFAwsPpPNHf8Nb1um9t
   ZFeUHTCMBerqQ0VT5MAU2Ck3j+dJJD0MCJNigqytA26cKYZAl++1l8ECe
   rvgezfvac8HlRMzDYz1KrEVWnudxj0i8frKaBdpIBUaznSxSGWsqfL4QV
   Q==;
X-CSE-ConnectionGUID: 8T6BrSp4SlWKWasSTmQsfQ==
X-CSE-MsgGUID: GD/QVl6MRwmA2ZGbu1/rFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="51701895"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="51701895"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 06:55:12 -0700
X-CSE-ConnectionGUID: 5hjk9kE8RbSu/NIPVTO6FQ==
X-CSE-MsgGUID: 6wheES3hR8W3B1F8TPkpiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="151187976"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 06:55:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5E28511FC38;
	Thu, 19 Jun 2025 16:55:08 +0300 (EEST)
Date: Thu, 19 Jun 2025 13:55:08 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 01/13] media: ipu6: Use correct pads for xlate_streams()
Message-ID: <aFQWvHY1i4rPJXg1@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-2-sakari.ailus@linux.intel.com>
 <20250619132704.GC32166@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619132704.GC32166@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Jun 19, 2025 at 04:27:04PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thanks for the review!

> 
> On Thu, Jun 19, 2025 at 11:15:34AM +0300, Sakari Ailus wrote:
> > The arguments to v4l2_subdev_state_xlate_streams() were incorrect, the
> 
> s/were/are/
> 
> > source pads was used as the sink pad and the source pad was a constant
> 
> s/pads was/pad is/
> s/pad was/pad is/
> 
> Are you sure though ? Unless I misread the code, you replace
> 
> pad0 = CSI2_PAD_SRC
> pad1 = CSI2_PAD_SINK
> 
> with
> 
> pad0 = pad
> pad1 = CSI2_PAD_SINK
> 
> This seems to be a correct fix, but I don't see where "the source pad
> was used as the sink pad".

Right, I'll reword it for v2.

> 
> > (rather than the actual source pad). Fix these.
> > 
> > Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > index da8581a37e22..6030bd23b4b9 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > @@ -354,9 +354,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
> >  	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
> >  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> >  
> > -	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
> > -						       CSI2_PAD_SINK,
> > -						       &streams_mask);
> > +	sink_streams =
> > +		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> > +						&streams_mask);
> 
> This is one of the cases where I'd write
> 
> 	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> 						       &streams_mask);
> 
> even if it goes to 81 columns.

The limit is still 80, not 81.

Either way, a number of the new functions in the V4L2 subdev KAPI have very
long names, I'll post patches to shorten them later on.

> 
> >  
> >  	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
> >  	if (ret)
> > @@ -384,9 +384,9 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
> >  	struct media_pad *remote_pad;
> >  	u64 sink_streams;
> >  
> > -	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
> > -						       CSI2_PAD_SINK,
> > -						       &streams_mask);
> > +	sink_streams =
> > +		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> > +						&streams_mask);
> 
> Same here.
> 
> >  
> >  	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
> >  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> 

-- 
Regards,

Sakari Ailus


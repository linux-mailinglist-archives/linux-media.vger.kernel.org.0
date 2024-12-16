Return-Path: <linux-media+bounces-23460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E58C09F2CBF
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 10:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D3BD168585
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 09:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2A8200BB8;
	Mon, 16 Dec 2024 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdjpEv8N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5CB1B87C4
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 09:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734340720; cv=none; b=UqIujo3ffkT67sAD9I3RSHaZMwnypG6GwQiIFYl+cEobrRR6kLAEjmUgKvEjOWSkFoeClgBBWwwO0FdLMQvOQIs5gZ8Bg6Pw7FfUvF9W6D7npkOgak8+I7sEEzHwTdvBAniY/zYaqHeG7U71LKNvoIWkJNyZzRg6KECxsNUX61c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734340720; c=relaxed/simple;
	bh=YC6ZzhLrPzge6fbJ5mjiMd2lxdfUO2OtXgnEUgWWub8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e05eY29moIxkdj1rNWYOj7vPttjB4DZ95BgtfjRF7HwfYxQm6sXEUmU9sz6hM72PSzN2SA43h9sGkNNj3PCZ+PcDmmCfSuo/0Cz2x65wKV4V6obaDS5237vor4gWqoE3lbpVtZLzqIPA7LQYnJYtyqYUZlrv22DTPqF2dgGETMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdjpEv8N; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734340719; x=1765876719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YC6ZzhLrPzge6fbJ5mjiMd2lxdfUO2OtXgnEUgWWub8=;
  b=NdjpEv8Nb02EsqGDTWsaOjxIu8B4jf3prszxk8gyhUJI7TqqWg+n3Fte
   F4C+O4X+3SJMtLeQo45gWNuAxfaZnCtviqzZc/amelx+xoR0v72hcvwSt
   at0tm5l5CpacjF/uIcXPkM802IxeoFsRsk1plYvmtA8cvVqc1rRr7+ojX
   aWGGxdpw/AMsUqjI8YmryQBR02LeiyL3y98gof5K3223Bq0j3Sn3mytwH
   Va2dlywK8qA11Y/R6U2d5ejbeDn0d/tdaXSb3MuzmAxYKYAbt92Pk5yr1
   fwcmaxxufVH10WyV22jooBc9kqiDuMvKglrno4czL2b/ixPgVuKM5CPTq
   Q==;
X-CSE-ConnectionGUID: agha4XqXQyyOrO3PqT13aA==
X-CSE-MsgGUID: grEXQc6aSX+Y6gNsX2Wb0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="57200626"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="57200626"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 01:18:39 -0800
X-CSE-ConnectionGUID: WzgaImvkQA+nLPVD3bG69w==
X-CSE-MsgGUID: 8s0LA3O6Q4i5f/f7TO0K0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97578465"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 01:18:36 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E9F4511F9F7;
	Mon, 16 Dec 2024 11:18:31 +0200 (EET)
Date: Mon, 16 Dec 2024 09:18:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 5/5] media: intel/ipu6: Obtain link frequency from a
 sub-device
Message-ID: <Z1_wZ_bORiA8UiKd@kekkonen.localdomain>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-6-sakari.ailus@linux.intel.com>
 <20241215170832.GI9975@pendragon.ideasonboard.com>
 <Z1_bAI3PQdDNG_VJ@kekkonen.localdomain>
 <20241216090736.GD32204@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216090736.GD32204@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Dec 16, 2024 at 11:07:36AM +0200, Laurent Pinchart wrote:
> On Mon, Dec 16, 2024 at 07:47:12AM +0000, Sakari Ailus wrote:
> > On Sun, Dec 15, 2024 at 07:08:32PM +0200, Laurent Pinchart wrote:
> > > Hi Sakari,
> > > 
> > > Thank you for the patch.
> > 
> > Thank you for the review. I asked you to review a set but it wasn't this
> > one:
> > <URL:https://lore.kernel.org/linux-media/20241129095142.87196-1-sakari.ailus@linux.intel.com/T/#t>.
> > :-)
> 
> Are you complaining that I review too many patches ? :-)

No, I'm complaining your selection of patches to review. ;-)

> 
> > > I think this should come before 4/5.
> > > 
> > > On Tue, Dec 10, 2024 at 09:59:06AM +0200, Sakari Ailus wrote:
> > > > Obtain the link frequency from the sub-device instead of a control
> > > > handler. This allows obtaining it using the get_mbus_config() sub-device
> > > > pad op that which is only supported by the IVSC driver.
> > > 
> > > "which is the only method supported by the IVSC driver"
> > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 +++---------
> > > >  1 file changed, 3 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > index 051898ce53f4..da8581a37e22 100644
> > > > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > @@ -80,25 +80,19 @@ static const struct ipu6_csi2_error dphy_rx_errors[] = {
> > > >  s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
> > > >  {
> > > >  	struct media_pad *src_pad;
> > > > -	struct v4l2_subdev *ext_sd;
> > > > -	struct device *dev;
> > > >  
> > > >  	if (!csi2)
> > > >  		return -EINVAL;
> > > >  
> > > > -	dev = &csi2->isys->adev->auxdev.dev;
> > > >  	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
> > > 
> > > Not a candidate for this patch, but can the source change, or can it be
> > > cached at probe time (or notifier bound time) ?
> > 
> > It could be, but why would you do that?
> > 
> > This would also prevent connecting multiple sensors to a single CSI-2
> > receiver.
> 
> Precisely because people shouldn't do this :-)
> 
> It would be more efficient to get the pad at probe time and cache it,
> and would remove an error path at runtime. Until we have a use case

I presume it'd take a bug somewhere for that to fail. I don't think a
relatively small number of instructions would make measurable a difference
in performance. If we thought this was a problem, there would be a lot to
work on elsewhere in the framework, starting with the control framework and
IOCTL handling. The problem is just that nearly all that code is there for
sound and important reasons.

> where we need to support more than one sensor on the same CSI-2 receiver
> for this driver, I think that would be best.

I don't disagree as such but we can't affect hardware design here. Nothing
currently prevents that and adding a driver bug that will cause whatever
ills when hit is not a solution either, even if the former were true. Well,
if this were Windows, the situation could be different.

-- 
Regards,

Sakari Ailus


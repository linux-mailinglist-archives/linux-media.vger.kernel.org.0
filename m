Return-Path: <linux-media+bounces-23461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF449F2D23
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 10:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E87ED166585
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 09:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A32201260;
	Mon, 16 Dec 2024 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eTAoygob"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8152010EF
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 09:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734342069; cv=none; b=MW1eYJtFKHa0TRbRRu6980PTXA2Daa2aH5jZyHZd1UFhD6EuVW8go8HkRiOhQBS0VZ+BJILssnySoQxJ3OIt+SBQkZMHxWUKi5jX6pEbnoOuNzvyDOE5PANOWtLHyG1jNZALKWSjvXkFktxifqeGnPfEbwsOyrFWWGxVQLL7yzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734342069; c=relaxed/simple;
	bh=PW3Lb+A/qpF3LrAThOuP6kveazNyEe663tMFUTFT0QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmrMaYiRz+qNNv/qdFZDDB5NLxViM3b1mmkrjIK8whllyGxFYMCIqk0xDfv5QgdG4tAMHOKdQSQ5BJjVTXP18VB7E161cVhpdSPphx7tgaTQ5o/XIsPQBOlnVcDXTtWp90HJsaKnhLqiKMVrS3rP5TqLzcwob5AsQnehL0q8P2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eTAoygob; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57C4E13C;
	Mon, 16 Dec 2024 10:40:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734342025;
	bh=PW3Lb+A/qpF3LrAThOuP6kveazNyEe663tMFUTFT0QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTAoygob35TU7CkkNf+52Q4dd4M60k+o7GkWaSEU37Gx/69+F511qir/9Lwwjy+rL
	 /Cn/lJHFSOCIHcWmE5ryglLkxPR/xhp43FBHMn+y03q23UP5zVBtWxux6m7CZjli0Y
	 KxFTcdAEI0KsA3SWZsXFK0kfJ1TIgANCsrbw2+vU=
Date: Mon, 16 Dec 2024 11:40:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 5/5] media: intel/ipu6: Obtain link frequency from a
 sub-device
Message-ID: <20241216094045.GE32204@pendragon.ideasonboard.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-6-sakari.ailus@linux.intel.com>
 <20241215170832.GI9975@pendragon.ideasonboard.com>
 <Z1_bAI3PQdDNG_VJ@kekkonen.localdomain>
 <20241216090736.GD32204@pendragon.ideasonboard.com>
 <Z1_wZ_bORiA8UiKd@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z1_wZ_bORiA8UiKd@kekkonen.localdomain>

On Mon, Dec 16, 2024 at 09:18:31AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Mon, Dec 16, 2024 at 11:07:36AM +0200, Laurent Pinchart wrote:
> > On Mon, Dec 16, 2024 at 07:47:12AM +0000, Sakari Ailus wrote:
> > > On Sun, Dec 15, 2024 at 07:08:32PM +0200, Laurent Pinchart wrote:
> > > > Hi Sakari,
> > > > 
> > > > Thank you for the patch.
> > > 
> > > Thank you for the review. I asked you to review a set but it wasn't this
> > > one:
> > > <URL:https://lore.kernel.org/linux-media/20241129095142.87196-1-sakari.ailus@linux.intel.com/T/#t>.
> > > :-)
> > 
> > Are you complaining that I review too many patches ? :-)
> 
> No, I'm complaining your selection of patches to review. ;-)
> 
> > 
> > > > I think this should come before 4/5.
> > > > 
> > > > On Tue, Dec 10, 2024 at 09:59:06AM +0200, Sakari Ailus wrote:
> > > > > Obtain the link frequency from the sub-device instead of a control
> > > > > handler. This allows obtaining it using the get_mbus_config() sub-device
> > > > > pad op that which is only supported by the IVSC driver.
> > > > 
> > > > "which is the only method supported by the IVSC driver"
> > > > 
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 +++---------
> > > > >  1 file changed, 3 insertions(+), 9 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > > index 051898ce53f4..da8581a37e22 100644
> > > > > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > > @@ -80,25 +80,19 @@ static const struct ipu6_csi2_error dphy_rx_errors[] = {
> > > > >  s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
> > > > >  {
> > > > >  	struct media_pad *src_pad;
> > > > > -	struct v4l2_subdev *ext_sd;
> > > > > -	struct device *dev;
> > > > >  
> > > > >  	if (!csi2)
> > > > >  		return -EINVAL;
> > > > >  
> > > > > -	dev = &csi2->isys->adev->auxdev.dev;
> > > > >  	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
> > > > 
> > > > Not a candidate for this patch, but can the source change, or can it be
> > > > cached at probe time (or notifier bound time) ?
> > > 
> > > It could be, but why would you do that?
> > > 
> > > This would also prevent connecting multiple sensors to a single CSI-2
> > > receiver.
> > 
> > Precisely because people shouldn't do this :-)
> > 
> > It would be more efficient to get the pad at probe time and cache it,
> > and would remove an error path at runtime. Until we have a use case
> 
> I presume it'd take a bug somewhere for that to fail. I don't think a
> relatively small number of instructions would make measurable a difference
> in performance. If we thought this was a problem, there would be a lot to
> work on elsewhere in the framework, starting with the control framework and
> IOCTL handling. The problem is just that nearly all that code is there for
> sound and important reasons.
> 
> > where we need to support more than one sensor on the same CSI-2 receiver
> > for this driver, I think that would be best.
> 
> I don't disagree as such but we can't affect hardware design here. Nothing
> currently prevents that and adding a driver bug that will cause whatever

It wouldn't be a bug, the driver would just ignore all bug the first
source. If that doesn't work for someone, we would hear about it.

> ills when hit is not a solution either, even if the former were true. Well,
> if this were Windows, the situation could be different.

-- 
Regards,

Laurent Pinchart


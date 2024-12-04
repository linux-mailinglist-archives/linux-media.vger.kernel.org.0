Return-Path: <linux-media+bounces-22643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 782AC9E41C2
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 18:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52707168573
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 17:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC3621D598;
	Wed,  4 Dec 2024 17:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ORW1M6NS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7187122D4EA;
	Wed,  4 Dec 2024 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331912; cv=none; b=Beq0HVFOhq+H2OW2aAOzjPPzqT5BSQmoTnuECTX44rPLKsHrUEpwztEB7DpE+ONXClPxdNWfa8hcdOW/tNnzHaasBV+QXodyVGd67biuX1FeUIYBFbXT66bas71OcFHBjkrniqTQC3OSS+VjtcVOEls7s7cRc4J3AOYV2Bnxkq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331912; c=relaxed/simple;
	bh=78gxj/BzoWW/qirjW9VkHtBeuxgnIovOYGaNqmENlXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQWuXFBbxsfoey7qvPrjVt+SZFCODOzeSX1lPfJPtmDKc1TteQMFzKgyNWHEKW2ASLWSS/NMClsuNZ1RuDJMutdTKRLgow2kysyKrKJ7+MJctF+MSXp/5G5fu0p3wbiU3OddMFVdVjarX9zIAXl/A82TZBh/WhoGJ/Kl7tf7wBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ORW1M6NS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E82114D4;
	Wed,  4 Dec 2024 18:04:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733331880;
	bh=78gxj/BzoWW/qirjW9VkHtBeuxgnIovOYGaNqmENlXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORW1M6NSD/L10kyaJaBu69hYJhJ+ZqX0mJM0fy66bzh7YHxRWFubGNkNF7eKLB1KR
	 9CNIPWNKHYNh8kV+TjHEtQ3xd/UR78LQvYnDJUWm1qM+Ji7XmZeIZOoU6PWiZ0F3Pi
	 IJoycTEnrm+Kr9CxYCPs4C2ThkNRheyOw3EmO5/0=
Date: Wed, 4 Dec 2024 19:04:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: dafna@fastmail.com, linux-media@vger.kernel.org, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 media-next] media: rkisp1: Fix unused value issue
Message-ID: <20241204170456.GA16224@pendragon.ideasonboard.com>
References: <20241119072653.72260-1-dheeraj.linuxdev@gmail.com>
 <20241119075944.GA31681@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119075944.GA31681@pendragon.ideasonboard.com>

On Tue, Nov 19, 2024 at 09:59:44AM +0200, Laurent Pinchart wrote:
> Hi Dheeraj,
> 
> Thank you for the patch.
> 
> On Tue, Nov 19, 2024 at 12:56:53PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> > This commit fixes an unused value issue detected by Coverity (CID
> > 1519008). The error condition for the invalid MIPI CSI-2 is not
> > properly handled as the break statement would only exit the switch block
> > and not the entire loop. Fixed this by returning the error immediately
> > after the switch block.
> 
> The patch doesn't "return immediately". You can write "Fix this by
> breaking from the look immediately after the switch block when an error
> occurs." or something similar.
> 
> > 'Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver
> > optional")'
> 
> The Fixes tag should be formatted on a single line, without outer
> quotes, and without a blank line between it and the Signed-off-by line:
> 
> Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver optional")

That commit ID doesn't exist in the git history. The commit
corresponding to the message is 7d4f126fde89. I'll update the commit
message accordingly.

> > Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> 
> I can update the commit message when applying the patch, there's no need
> to submit a v5, unless if you want to. Please let me know if I should
> take this version and update the commit message, or if you will send a
> v5.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index dd114ab77800..9ad5026ab10a 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> >  			break;
> >  		}
> >  
> > +		if (ret)
> > +			break;
> > +
> >  		/* Parse the endpoint and validate the bus type. */
> >  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> >  		if (ret) {

-- 
Regards,

Laurent Pinchart


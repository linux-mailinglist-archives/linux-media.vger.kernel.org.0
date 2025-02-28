Return-Path: <linux-media+bounces-27205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE3A494AE
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 10:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B322F1894F7F
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 09:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5DB2561D9;
	Fri, 28 Feb 2025 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WwY6xCrn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD6C25291D;
	Fri, 28 Feb 2025 09:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740734412; cv=none; b=kVXDyem2jPPWPUxtCGGA1MoPBnARKeHHFePBVb6gHMjIGaKO+ZgXbyKedL5ysM9INVqITE7cu6fdt5nS5VbfMt/vpUV59JXACXlZp8ZzGknZDfiK7VbHkH8m0D24NZoW/BOtNkEZU0rmUOtauUzF4yTihfSYJESmphST6FRlKvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740734412; c=relaxed/simple;
	bh=+W/0OimqeFV+eBzmzI25ytsvWWfhHb8W3p9uRyegnQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3leSK/9BuYUQZsy91ASdIkPR/WzCeHQ21/PK83wllDUf8vfiBBYFNipD+wP5UXZueWAr5IAGLZHcL9MiFhsQd9GxXcEkqE2VBIVaP6k++46gtMdoP00BmoXl6LOBElFDSsLWNR66dQQcadojDj6eW0HIKjRy+TkCMLfZuBe/5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WwY6xCrn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (unknown [IPv6:2404:7a81:160:2100:7597:2d2d:d3f:6ef1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21071606;
	Fri, 28 Feb 2025 10:18:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740734320;
	bh=+W/0OimqeFV+eBzmzI25ytsvWWfhHb8W3p9uRyegnQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WwY6xCrnUVzR0rZlwmYVnstPYZwRN8NyowA/4t+9++TN6nbpA23gH7FU3RAO65DVZ
	 CiBFlGqKnZU8Yk0fAPL7aZLGOfO76uvy7z0yVMSH++uHbWgcz62mokdKIWNGXVsqIS
	 nXFzYQM/1O9pPyMLdCN9alk8I3ZKddbdJzRMf2Gs=
Date: Fri, 28 Feb 2025 18:20:01 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: imx335: Set vblank immediately
Message-ID: <Z8F_wardyYM7sCQx@pyrite.rasen.tech>
References: <20250214133709.1290585-1-paul.elder@ideasonboard.com>
 <Z7G3d_zEhqDuepNM@kekkonen.localdomain>
 <Z77Vg7zcnj_5a-0s@pyrite.rasen.tech>
 <Z77XJrRoqZWTLF4g@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z77XJrRoqZWTLF4g@kekkonen.localdomain>

On Wed, Feb 26, 2025 at 08:56:06AM +0000, Sakari Ailus wrote:
> Hi Paul,
> 
> On Wed, Feb 26, 2025 at 05:49:07PM +0900, Paul Elder wrote:
> > Hi Sakari,
> > 
> > Thanks for the review.
> > 
> > On Sun, Feb 16, 2025 at 10:01:27AM +0000, Sakari Ailus wrote:
> > > Hi Paul,
> > > 
> > > On Fri, Feb 14, 2025 at 10:37:09PM +0900, Paul Elder wrote:
> > > > When the vblank v4l2 control is set, it does not get written to the
> > > > hardware immediately. It only gets updated when exposure is set. Change
> > > > the behavior such that the vblank is written immediately when the
> > > > control is set.
> > > > 
> > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > ---
> > > >  drivers/media/i2c/imx335.c | 19 +++++++++++++------
> > > >  1 file changed, 13 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > > > index fcfd1d851bd4..e73a23bbbc89 100644
> > > > --- a/drivers/media/i2c/imx335.c
> > > > +++ b/drivers/media/i2c/imx335.c
> > > > @@ -559,12 +559,12 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
> > > >  			imx335->vblank,
> > > >  			imx335->vblank + imx335->cur_mode->height);
> > > >  
> > > > -		return __v4l2_ctrl_modify_range(imx335->exp_ctrl,
> > > > -						IMX335_EXPOSURE_MIN,
> > > > -						imx335->vblank +
> > > > -						imx335->cur_mode->height -
> > > > -						IMX335_EXPOSURE_OFFSET,
> > > > -						1, IMX335_EXPOSURE_DEFAULT);
> > > > +		 __v4l2_ctrl_modify_range(imx335->exp_ctrl,
> > > 
> > > Indentation.
> > > 
> > > You're also missing an error check here.
> > 
> > I reasoned that it's fine to not have the error check.
> > 
> > afaiu, the only change this has to error is if try/s_ctrl on
> > V4L2_CID_EXPOSURE fails when the change to the range of valid exposure
> > values requires a new exposure value to be set. Setting the exposure
> > control comes back to this function, and goes through the switch-case
> > and imx335_update_exp_gain() below, which doesn't fail.
> 
> It will fail if cci_write() it calls does.

Hm good point. I suppose we don't actually want to continue on if it
does fail... ok I'll fix it.

> 
> > 
> > Also the imx219 has the exact same pattern in imx219_set_ctrl.
> 
> Feel free to fix it. :-)

:)


Paul


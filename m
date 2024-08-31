Return-Path: <linux-media+bounces-17278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC26496723C
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 16:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82ED21F22167
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 14:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF0E1CFB9;
	Sat, 31 Aug 2024 14:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZOPgqfwW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5193C00
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725115454; cv=none; b=VzTiCEOsg4AGj+SOopbGG9rfPmp2pK9lkuPxFeqZKjz328vpupS82ASix9UijIKn2VtH+J3jMgjXBnJhNf2egoVMmlO8nqXF+6XxrHpJBOz8yhV7SeD7/PfLfB6kU8cBMJD9ulD3o+2D0YMQiTYrQpP+OwN3TbGNMFhiwEBOZgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725115454; c=relaxed/simple;
	bh=J1KbWYXflsRLn/iUmhofyDAPZswt9/OEzwcaUQtFsJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2dMTM6u999QkvfO2Hftz7b5lj83AMoq7X5ebbM9+2AlqdGbAGuduVgKpPCeg7xfIh303eR6AIVIei80EdGjWuxWrS26OMMRYgpyusmPZni5eOd21HneIeQ+G7NMKJItozPKJAjt2bCaA9545WOQ85juTXerXWKE2z7/YLi+ne0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZOPgqfwW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-57-33.net.vodafone.it [5.90.57.33])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6E9D667;
	Sat, 31 Aug 2024 16:43:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725115381;
	bh=J1KbWYXflsRLn/iUmhofyDAPZswt9/OEzwcaUQtFsJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOPgqfwW41/DuHHRDDzo0zRB6HH06/3FIvImM7ZdwPLto0SsCNPsH3HOPlH6RPftQ
	 DzRWXDF1uaKsukALjhGsEycPJKRuvEayl9dsDVqLOaxE9QhvvGRcIwl+fXS09GbbAk
	 mL2E0XNeAeWs8v7B/pgAyMvOq+CFZjE2ejEOqbng=
Date: Sat, 31 Aug 2024 16:44:06 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/4] media: pisp_be: Drop reference to non-existing
 function
Message-ID: <uiegxtxn346x47uarwixe2shwrnv4sew3fmlhsaizodf7lg2ev@lplysuhwhjtd>
References: <20240827074018.534354-1-jacopo.mondi@ideasonboard.com>
 <20240827074018.534354-2-jacopo.mondi@ideasonboard.com>
 <20240831010330.GC27958@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240831010330.GC27958@pendragon.ideasonboard.com>

Hi Laurent

On Sat, Aug 31, 2024 at 04:03:30AM GMT, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Aug 27, 2024 at 09:40:15AM +0200, Jacopo Mondi wrote:
> > A comment in the pisp_be driver references to the
>
> s/to the/the/
>
> >  pispbe_schedule_internal() which doesn't exist.
>
> s/which/function which/
>
> >
> > Drop it.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > index 65ff2382cffe..8ba1b9f43ba1 100644
> > --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > @@ -368,10 +368,7 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
> >  	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
> >  				     &pispbe->node[MAIN_INPUT_NODE]);
> >  	if (ret <= 0) {
> > -		/*
> > -		 * This shouldn't happen; pispbe_schedule_internal should insist
> > -		 * on an input.
> > -		 */
> > +		/* Shouldn't happen, we have validated an input is available. */
>
> Actually, where is that validated ?
>

When preparing a job, the MAIN_INPUT_NODE buffer is mandatory if I
read the usage of the 'ignore_buffers' flag right ?




> >  		dev_warn(pispbe->dev, "ISP-BE missing input\n");
> >  		hw_en->bayer_enables = 0;
> >  		hw_en->rgb_enables = 0;
>
> --
> Regards,
>
> Laurent Pinchart


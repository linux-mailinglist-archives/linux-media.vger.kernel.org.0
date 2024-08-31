Return-Path: <linux-media+bounces-17280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D9396724B
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 17:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 616611F22405
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 15:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAAD81CD35;
	Sat, 31 Aug 2024 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AJtVWPRN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9675E1CD2A
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725116440; cv=none; b=B0X/mLS9j1zpasl9aYahpD0VR67owLcw+JpiZOtsG9aqqGaYqo4HcvPSuB4QHWIj5ho0pbw+bGJZR4+59NM8QUoL8kGnifVQwluKDhMxiOgEBtZyDOHdbu6Holg6NOi5NFlk7fDXutivhx94jvRRSYAPV8Gx8ol9Jsbf5O3Qvb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725116440; c=relaxed/simple;
	bh=jvX6rpgyeKp9EMTXlVs76Bm+NjGGRNp34Oy9DRiqV4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+ZarZEBiduOJOyg04yV3aladSKtJCZKNfjs1EXQMRkyettTJ45414NKqEEflsX/Rpyt/JEmWmom1Pfxw1IkMx8NoVAe1+JsDBOBAyhJo1DG8n/tEhBrhygd3sv4AbWLM1zj4qFCOCneK7gZRBePcrtwtzXyW+YjptDD+1jzUKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AJtVWPRN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F257C667;
	Sat, 31 Aug 2024 16:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725116367;
	bh=jvX6rpgyeKp9EMTXlVs76Bm+NjGGRNp34Oy9DRiqV4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJtVWPRNj9ZCinIH2IpYtM73fCcoJqxUUGDpL6fO5LO9nsrYxdYSzVenDmTOn+EtN
	 t3IRNjZj3/mn47/IjNzMttqpR/mmGmRq5hObDE40M5lxJSQPuYBIcAfF3uj3TtF0kn
	 WqMnyZb+kt5/2w/jh8WPnleo9Nt4A1wp8Eb1Om3o=
Date: Sat, 31 Aug 2024 18:00:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/4] media: pisp_be: Drop reference to non-existing
 function
Message-ID: <20240831150005.GE27958@pendragon.ideasonboard.com>
References: <20240827074018.534354-1-jacopo.mondi@ideasonboard.com>
 <20240827074018.534354-2-jacopo.mondi@ideasonboard.com>
 <20240831010330.GC27958@pendragon.ideasonboard.com>
 <uiegxtxn346x47uarwixe2shwrnv4sew3fmlhsaizodf7lg2ev@lplysuhwhjtd>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <uiegxtxn346x47uarwixe2shwrnv4sew3fmlhsaizodf7lg2ev@lplysuhwhjtd>

On Sat, Aug 31, 2024 at 04:44:06PM +0200, Jacopo Mondi wrote:
> On Sat, Aug 31, 2024 at 04:03:30AM GMT, Laurent Pinchart wrote:
> > On Tue, Aug 27, 2024 at 09:40:15AM +0200, Jacopo Mondi wrote:
> > > A comment in the pisp_be driver references to the
> >
> > s/to the/the/
> >
> > >  pispbe_schedule_internal() which doesn't exist.
> >
> > s/which/function which/
> >
> > >
> > > Drop it.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > index 65ff2382cffe..8ba1b9f43ba1 100644
> > > --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > @@ -368,10 +368,7 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
> > >  	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
> > >  				     &pispbe->node[MAIN_INPUT_NODE]);
> > >  	if (ret <= 0) {
> > > -		/*
> > > -		 * This shouldn't happen; pispbe_schedule_internal should insist
> > > -		 * on an input.
> > > -		 */
> > > +		/* Shouldn't happen, we have validated an input is available. */
> >
> > Actually, where is that validated ?
> 
> When preparing a job, the MAIN_INPUT_NODE buffer is mandatory if I
> read the usage of the 'ignore_buffers' flag right ?

I think you're right. The logic is convoluted, it relies on the fact
that streaming_map is first checked for MAIN_INPUT_NODE. Hopefully it
will be clearer after all the cleanups.

On a side note, is the pisp_format check in pispbe_get_planes_addr()
needed ?

> > >  		dev_warn(pispbe->dev, "ISP-BE missing input\n");
> > >  		hw_en->bayer_enables = 0;
> > >  		hw_en->rgb_enables = 0;

-- 
Regards,

Laurent Pinchart


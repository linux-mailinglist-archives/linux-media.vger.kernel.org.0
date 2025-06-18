Return-Path: <linux-media+bounces-35133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3856AADE636
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 10:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A35A21896869
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 08:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9824727FB2D;
	Wed, 18 Jun 2025 08:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rCvG9vb1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A7B24DD13;
	Wed, 18 Jun 2025 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237141; cv=none; b=f1psJncAXNRiDG8HeSCyn0pmCHjUeLqHAazpgMK1H3Izp+WE1WGzKn2kMHDttG5wTZm0obzJ4g1xHfRRDhhLaXFFoH9WEs5xZzTK1YSWFumONAqjmm4gToqCG8hCtBJquQlI5YeRL0N7BRerpkdy2hM6FOwZfdgpBMJ8zLaZxyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237141; c=relaxed/simple;
	bh=gGJjTXpUN65/Jh/Y8+521fq8rsbsxvFo6HGAyo2LHyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyQaYYQHFf0Bw1HEksmm9j18FD7/cF12Qecnogzh7cULT++d9g+tD1Doou5H0+sExS5sMFqwjs1LubEYaY8fZbMuV+xp1hO/9tdGCsfpI0iQN4xOTt3JQHCnzFzpdQ61A8wPsieyq1Lw3NbCiNWYFuLkhpbb4o3l1zhuDvswT9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rCvG9vb1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84070593;
	Wed, 18 Jun 2025 10:58:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750237124;
	bh=gGJjTXpUN65/Jh/Y8+521fq8rsbsxvFo6HGAyo2LHyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rCvG9vb1AHqPhf1/uvTudEgOG4WDMsqtrdWd4mgY0JRlHinnvptGjnWOEx3xPW+Nv
	 yc3P0Zq+qSyVZHD+9PN1e3HKvun5+iEGQ96kiaIkcNS+zluGEsARNwBZOI+SVPbzKW
	 FetCXardRpQne3qPtqqJIf5qNsEXHx+PhrjGnU1k=
Date: Wed, 18 Jun 2025 11:58:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 07/12] media: rcar-vin: Merge all notifiers
Message-ID: <20250618085840.GD28826@pendragon.ideasonboard.com>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-8-niklas.soderlund+renesas@ragnatech.se>
 <20250612231504.GE10542@pendragon.ideasonboard.com>
 <CAMuHMdWn01G-kyFgM+7e+TDaoN4ekSuM=c0kcByFLDsVBVvgwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWn01G-kyFgM+7e+TDaoN4ekSuM=c0kcByFLDsVBVvgwA@mail.gmail.com>

On Wed, Jun 18, 2025 at 09:44:02AM +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Tue, 17 Jun 2025 at 21:48, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Jun 06, 2025 at 08:26:01PM +0200, Niklas Söderlund wrote:
> > > The VIN usage of v4l-async is complex and stems from organic growth of
> > > the driver of supporting both private local subdevices (Gen2, Gen3) and
> > > subdevices shared between all VIN instances (Gen3 and Gen4).
> > >
> > > The driver used a separate notifier for each VIN for the private local
> > > ones, and a shared group notifier for the shared ones. This was complex
> > > and lead to subtle bugs when unbinding and later rebinding subdevices in
> > > one of the notifiers having to handle different edge cases depending on
> > > if it also had subdevices in the other notifiers etc.
> > >
> > > To simplify this have the Gen2 devices allocate and form a VIN group
> > > too. This way all subdevices on all models can be collect in a
> > > single group notifier. Then there is only a single complete callback for
> > > all where the video devices and subdevice nodes can be registered etc.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> [ deleted 132 lines of quoted patch ]
> 
> > > @@ -417,6 +452,12 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
> > >               if (!(vin_mask & BIT(i)))
> > >                       continue;
> > >
> > > +             /* Parse local subdevice. */
> > > +             ret = rvin_parallel_parse_of(vin->group->vin[i]);
> > > +             if (ret)
> > > +                     return ret;
> > > +
> > > +             /* Prase shared subdevices. */
> >
> > s/Prase/Parse/
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks, but please trim your replies, I had to scroll three times
> through your email to find this ;-)

I intentionally don't, as I find it annoying when people do :-)

> [ deleted 262 lines of quoted patch ]

-- 
Regards,

Laurent Pinchart


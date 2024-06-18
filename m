Return-Path: <linux-media+bounces-13569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7050090D699
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 17:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16796282F1B
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 15:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E641CD3C;
	Tue, 18 Jun 2024 15:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zm89y7S1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C67418C22;
	Tue, 18 Jun 2024 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723305; cv=none; b=NhQrDVGvxzR9xl88oqjSeGLn5tdw9aW6JKY1RSHbo28DZhwY53HzNXk5txiJO7aFLw1GgACFt7SAAvm77o59wPZYCqHkQNRT/RYz/XJfvqsAefa3c2X0Klfp/ojKtD1I/O20YF7JMcs9H2EJvBvCibdj2EJbpywPZywUFdaOMTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723305; c=relaxed/simple;
	bh=khG3xc3vkb1exZoO/8wrNW/e03ySqjgHAht5UQAE0jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiQJkClQFuxjEFUTJAtyttvpZfub2u0SAiDNMr6cYwJE51mITyYKJVAYah40Xjq2FEZuRmjxYc0xa3ui+1s1YR3CVeY6gaErnMmLOtWtE6LiKdcWXOZWPWg2iAPMMOOqelfiNwiiHrRn1xzT6N3aJJ0FHNBNnU0ComtjpRkM5jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zm89y7S1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6CA5908;
	Tue, 18 Jun 2024 17:08:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718723284;
	bh=khG3xc3vkb1exZoO/8wrNW/e03ySqjgHAht5UQAE0jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zm89y7S1zof9vKA4BqQbD4+fCWhdHwJl/SAar4tetn/wx4dgdVTu6AI2K/2MSp+bK
	 A5vFxIaIz8DkbVIWI7ehGGe9xlAQad/4SqcjL6BjM86ISWHYjhx23VBUzo84/79tLi
	 /IoAOzdyXqmQ0cfW47bXKxPqSTyF/DYIriDKA5Vc=
Date: Tue, 18 Jun 2024 18:08:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Add support for RAW10
Message-ID: <20240618150800.GB22767@pendragon.ideasonboard.com>
References: <20240417120230.4086364-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWxxzn2t2qURChY=62GmDPKbQku63uRCCg=CDRCeOwJTw@mail.gmail.com>
 <20240618144101.GB17243@pendragon.ideasonboard.com>
 <20240618145113.GC17243@pendragon.ideasonboard.com>
 <20240618150114.GR382677@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618150114.GR382677@ragnatech.se>

On Tue, Jun 18, 2024 at 05:01:14PM +0200, Niklas Söderlund wrote:
> Hi Laurent,
> 
> Thanks for your review.
> 
> On 2024-06-18 17:51:13 +0300, Laurent Pinchart wrote:
> > On Tue, Jun 18, 2024 at 05:41:03PM +0300, Laurent Pinchart wrote:
> > > Hi Geert,
> > > 
> > > On Wed, Apr 17, 2024 at 03:34:36PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, Apr 17, 2024 at 2:06 PM Niklas Söderlund wrote:
> > > > > Some R-Car SoCs are capable of capturing RAW10. Add support for it
> > > > > using the V4L2_PIX_FMT_Y10 pixel format, which I think is the correct
> > > > > format to express RAW10 unpacked to users.
> > > > >
> > > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > 
> > > > Thanks for your patch!
> > > > 
> > > > I am no VIN or V4L2 expert, but the register bits LGTM, so
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > 
> > > > > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > > > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > > > @@ -780,6 +782,9 @@ static int rvin_setup(struct rvin_dev *vin)
> > > > >         case MEDIA_BUS_FMT_Y8_1X8:
> > > > >                 vnmc |= VNMC_INF_RAW8;
> > > > >                 break;
> > > > > +       case MEDIA_BUS_FMT_Y10_1X10:
> > > > > +               vnmc |= VNMC_INF_RGB666;
> > > > 
> > > > The actual meaning of this bit is not uniform across all SoCs.
> > > > On R-Car V3U it means (partial) 16 bpp, on R-Car Gen3 it means 18 bpp.
> > > 
> > > The INF bits have different meanings depending on the VIN input. What
> > > you refer to above for V3U is for the CSI-2 input, while for the rest of
> > > Gen3 you quote the values for the parallel input. Value 111 is
> > > documented as "prohibit" for the CSI-2 input on the rest of Gen3.
> > 
> > To be precise, for V3U the documentation indicates "Input from Channel
> > Selector", not CSI-2. V3U has no parallel input.
> 
> Yes it's getting a tad complex, but there is no issue here is there?  
> This patch extends struct struct rvin_info with a new raw10 bool which 
> indicates if raw10 is supported, or not. If it's not supported the 
> driver rejects the MEDIA_BUS_FMT_Y10_1X10 in format validation.

Apart from the naming causing some confusion, I don't see any issue.
Functionally this part of the patch seems correct.

> > The macros for the INF bits mix names for different types of inputs, it
> > could be a good idea to clean this up.
> 
> There are so many things in this driver I would like to clean up and are 
> working on. The first step is to clean up the async and VIN group mess, 
> there are patches for that on the list. Once that is done I'm planing to 
> refactor the init functions and defines, one per generation in different 
> files to make it more clear how things look on the different generations.

I'm looking forward to that :-)

> > > > > +               break;
> > > > >         default:
> > > > >                 break;
> > > > >         }

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-11805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7C18CD0D3
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 13:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 583EB283E86
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861A6144313;
	Thu, 23 May 2024 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A2t4qTB9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854DC46AF
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716462324; cv=none; b=j39OYOpsBkskHJ4c3DJAAxS8qSF7tmsQjcu9RlwSbhbd9kQNCS6txFiS83LuNChYKngxxfRO81HxS6LW+xv+gngc+BKQ0p2EYMR2/t8elhjb6C1USGpChprU6OOQxjQnI4YkDeD1XpVE3/y+TKyNgtC8cuhKfgt7/1LBEnwqZ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716462324; c=relaxed/simple;
	bh=AosHltbKgN9Pycg9/M1PoGwXRPxuCBPsPlBcW8W7HlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWxblx9NirGChHSFSZpmJM+eCMhmZUu5K+0dRnRMaW+cUOC/EDGemA0IYZmZftD3EWvTdeny7vDLZnkKo12txQURU0k9IHXWLPteQFwShh8KiDSll0+WkFU+kwcCFvwPEa8G1NhKP131EbovTR3LpDbpbPd0XHz9skIB32TPZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A2t4qTB9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFC798E1;
	Thu, 23 May 2024 13:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716462308;
	bh=AosHltbKgN9Pycg9/M1PoGwXRPxuCBPsPlBcW8W7HlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A2t4qTB9BSetsyW9MydtbgHSQkhS+Jy6Fb4UbJovNFlKuX5qj3RKpodR2wfinhR9G
	 e1MOCp07Ld7falKfgKTJ6SAGHq/4MP6CQdgI2vA9q+tr2CUfa9VY1DwlOGU/1UCGCn
	 oiLlZdouPIQCyEM44UmlcBkqF21xzYGyB/do3g48=
Date: Thu, 23 May 2024 14:05:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v6 1/7] media: uapi: pixfmt-luma: Document MIPI CSI-2
 packing
Message-ID: <20240523110510.GC10295@pendragon.ideasonboard.com>
References: <20240502110503.38412-1-jacopo.mondi@ideasonboard.com>
 <20240502110503.38412-2-jacopo.mondi@ideasonboard.com>
 <Zk8eo4OZs8gu_k2Q@valkosipuli.retiisi.eu>
 <20240523105722.GG6640@pendragon.ideasonboard.com>
 <Zk8hBTLghjVAOaG-@valkosipuli.retiisi.eu>
 <20240523110413.GB10295@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240523110413.GB10295@pendragon.ideasonboard.com>

On Thu, May 23, 2024 at 02:04:15PM +0300, Laurent Pinchart wrote:
> On Thu, May 23, 2024 at 10:57:09AM +0000, Sakari Ailus wrote:
> > On Thu, May 23, 2024 at 01:57:22PM +0300, Laurent Pinchart wrote:
> > > On Thu, May 23, 2024 at 10:46:59AM +0000, Sakari Ailus wrote:
> > > > On Thu, May 02, 2024 at 01:04:56PM +0200, Jacopo Mondi wrote:
> > > > > The Y10P, Y12P and Y14P format variants are packed according to
> > > > > the RAW10, RAW12 and RAW14 formats as defined by the MIPI CSI-2
> > > > > specification. Document it.
> > > > > 
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
> > > > > ---
> > > > >  Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > > > index b3c5779521d8..f02e6cf3516a 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > > > @@ -209,3 +209,7 @@ are often referred to as greyscale formats.
> > > > >      For Y012 and Y12 formats, Y012 places its data in the 12 high bits, with
> > > > >      padding zeros in the 4 low bits, in contrast to the Y12 format, which has
> > > > >      its padding located in the most significant bits of the 16 bit word.
> > > > > +
> > > > > +    The 'P' variations of the Y10, Y12 and Y14 formats are packed according to
> > > > > +    the RAW10, RAW12 and RAW14 packing scheme as defined by the MIPI CSI-2
> > > > > +    specification.
> > > > 
> > > > The CSI-2 specification isn't publicly available. I think you'll need to
> > > > add similar examples of the packing the packed raw formats have.
> > > 
> > > Would referencing the CSI-2-packed bayer formats be acceptable ?
> > > Otherwise we'll essentially duplicate documentation.
> > 
> > I'm fine with that but the packing should be then documented independently
> > of formats. I'd prefer referring to component numbers (1 to 4) so this
> > could be re-used with Bayer formats.
> > 
> > The documentation from the Bayer formats should be usable for this almost
> > as-is.
> 
> Sounds good to me.

Oh, and obviously, the best way to address all this would be for the
MIPI Alliance to publish an open version of the CSI-2 specification,
covering at least the parts that are relevant from a software point of
view.

-- 
Regards,

Laurent Pinchart


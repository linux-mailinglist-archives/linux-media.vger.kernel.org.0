Return-Path: <linux-media+bounces-11823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606238CD444
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 15:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 920B91C20D63
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 13:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835EC13B7AE;
	Thu, 23 May 2024 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NRYRdr0/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AD72AE94
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 13:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716470584; cv=none; b=klGZ7BwO5NDxPwDsb2twbVoA31yiKZSrCT/NVq0yDzj02Yq/58VfW3kRVf15ebpIui1HIBrDZGRRFh36z29i8M350bGtRJxZX8zdPc6b/eYK5/UkDzf269AbSzu2QD73hsonnObIW3oFODNSe3FgZfN3Tactq/VOTGsBykmHCdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716470584; c=relaxed/simple;
	bh=8/Ew30nv2sNyfEEffsLLCGALDBbX2mndyfu2Lod64jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHwPrSjkdC7czOzXgIssL+ZPHHrbXAM3TSrJY8bTSrryBEx1E4eOAaAMUbnl6YBtBW4+DHetYHQ+VHEub5Ub2udSo7ISxx5m9DVdE8NKbeuhGFi+biqH/oshHpz4M/SLHDUSs72vtsYOgVu+LkhuKQQItZQSSHCOO1nLJ7LCNUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NRYRdr0/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AFFA7E1;
	Thu, 23 May 2024 15:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716470566;
	bh=8/Ew30nv2sNyfEEffsLLCGALDBbX2mndyfu2Lod64jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRYRdr0/ehGZsewZ9EavS/3h4Z4H8+NemeXjj04q4G/s5p/7eTPs7813SaaFa0cbk
	 dg0TchUuopE4jHkb/Bt5/dRFWdsK2yDLC2DBmigh6/0GHSYgWxyVSzGUl6n2E6xaGJ
	 NJQ8ReI4xX8eU9sYIvSxXNE1j/xH6zi9UcQXsPZA=
Date: Thu, 23 May 2024 15:22:56 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v6 1/7] media: uapi: pixfmt-luma: Document MIPI CSI-2
 packing
Message-ID: <35fwbp2fr5kaxqg3qey2cz7nwwlhzf4s5euo3zm4dkimrztzru@peabkvwqsblq>
References: <20240502110503.38412-1-jacopo.mondi@ideasonboard.com>
 <20240502110503.38412-2-jacopo.mondi@ideasonboard.com>
 <Zk8eo4OZs8gu_k2Q@valkosipuli.retiisi.eu>
 <20240523105722.GG6640@pendragon.ideasonboard.com>
 <Zk8hBTLghjVAOaG-@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zk8hBTLghjVAOaG-@valkosipuli.retiisi.eu>

Hi Sakari, Laurent

On Thu, May 23, 2024 at 10:57:09AM GMT, Sakari Ailus wrote:
> On Thu, May 23, 2024 at 01:57:22PM +0300, Laurent Pinchart wrote:
> > On Thu, May 23, 2024 at 10:46:59AM +0000, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Thu, May 02, 2024 at 01:04:56PM +0200, Jacopo Mondi wrote:
> > > > The Y10P, Y12P and Y14P format variants are packed according to
> > > > the RAW10, RAW12 and RAW14 formats as defined by the MIPI CSI-2
> > > > specification. Document it.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
> > > > ---
> > > >  Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > > index b3c5779521d8..f02e6cf3516a 100644
> > > > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > > @@ -209,3 +209,7 @@ are often referred to as greyscale formats.
> > > >      For Y012 and Y12 formats, Y012 places its data in the 12 high bits, with
> > > >      padding zeros in the 4 low bits, in contrast to the Y12 format, which has
> > > >      its padding located in the most significant bits of the 16 bit word.
> > > > +
> > > > +    The 'P' variations of the Y10, Y12 and Y14 formats are packed according to
> > > > +    the RAW10, RAW12 and RAW14 packing scheme as defined by the MIPI CSI-2
> > > > +    specification.
> > >
> > > The CSI-2 specification isn't publicly available. I think you'll need to
> > > add similar examples of the packing the packed raw formats have.

Don't we have the packaging examples in the tables already ? In
mainline already for 10P and introduced by:

adb1d4655e53 ("media: v4l: Add V4L2-PIX-FMT-Y14P format")
181047763040 ("media: v4l: Add V4L2-PIX-FMT-Y12P format")

in the media staging tree.

> >
> > Would referencing the CSI-2-packed bayer formats be acceptable ?
> > Otherwise we'll essentially duplicate documentation.
>
> I'm fine with that but the packing should be then documented independently
> of formats. I'd prefer referring to component numbers (1 to 4) so this
> could be re-used with Bayer formats.
>
> The documentation from the Bayer formats should be usable for this almost
> as-is.
>
> --
> Sakari Ailus


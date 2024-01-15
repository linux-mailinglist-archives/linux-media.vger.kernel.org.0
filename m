Return-Path: <linux-media+bounces-3698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FAC82D822
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 12:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51621282422
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 11:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A966282D6;
	Mon, 15 Jan 2024 11:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BnQT7QGe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB900DF4C
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 11:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C18AD326;
	Mon, 15 Jan 2024 12:09:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705316943;
	bh=pWwCEpMi0ExBI51OQZV6/NE14I5aMAWMsRauRTqLEo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BnQT7QGefXM+DYs9DhAZx1eFoKDypLoPhMt5defPNjxwy4dDkt+6D96cxkenVAqno
	 DaEH//+z+/fm2W/q4e/kdb25Y//nH3/lM9CoJc7VV5AcKswYG7D8We3Gpp6NElV01T
	 u0DfEmjDlfZkjLq1ygjWceVSdPXfSBycDFspuOE8=
Date: Mon, 15 Jan 2024 13:10:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Purism Kernel Team <kernel@puri.sm>
Subject: Re: [PATCH 6/7] media: mc: Expand MUST_CONNECT flag to always
 require an enabled link
Message-ID: <20240115111015.GE5869@pendragon.ideasonboard.com>
References: <20240115103029.28055-1-laurent.pinchart@ideasonboard.com>
 <20240115103029.28055-7-laurent.pinchart@ideasonboard.com>
 <ZaUMbP8e_Ng_WxCT@valkosipuli.retiisi.eu>
 <20240115105525.GC5869@pendragon.ideasonboard.com>
 <ZaUQAo0Y6Ofm249e@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZaUQAo0Y6Ofm249e@valkosipuli.retiisi.eu>

On Mon, Jan 15, 2024 at 10:59:14AM +0000, Sakari Ailus wrote:
> On Mon, Jan 15, 2024 at 12:55:25PM +0200, Laurent Pinchart wrote:
> > On Mon, Jan 15, 2024 at 10:43:56AM +0000, Sakari Ailus wrote:
> > > Hi Laurent,
> > > 
> > > Many thanks for working on this.
> > 
> > You're welcome. It was somehow fun.
> > 
> > > On Mon, Jan 15, 2024 at 12:30:28PM +0200, Laurent Pinchart wrote:
> > > > The MEDIA_PAD_FL_MUST_CONNECT flag indicates that the pad requires an
> > > > enabled link to stream, but only if it has any link at all. This makes
> > > > little sense, as if a pad is part of a pipeline, there are very few use
> > > > cases for an active link to be mandatory only if links exist at all. A
> > > > review of in-tree drivers confirms they all need an enabled link for
> > > > pads marked with the MEDIA_PAD_FL_MUST_CONNECT flag.
> > > > 
> > > > Expand the scope of the flag by rejecting pads that have no links at
> > > > all. This requires modifying the pipeline build code to add those pads
> > > > to the pipeline.
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > >  .../media/mediactl/media-types.rst            | 11 ++--
> > > >  drivers/media/mc/mc-entity.c                  | 53 +++++++++++++++----
> > > >  2 files changed, 48 insertions(+), 16 deletions(-)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > index 0ffeece1e0c8..1ce87c0b705f 100644
> > > > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > @@ -375,12 +375,11 @@ Types and flags used to represent the media graph elements
> > > >  	  are origins of links.
> > > >  
> > > >      *  -  ``MEDIA_PAD_FL_MUST_CONNECT``
> > > > -       -  If this flag is set and the pad is linked to any other pad, then
> > > > -	  at least one of those links must be enabled for the entity to be
> > > > -	  able to stream. There could be temporary reasons (e.g. device
> > > > -	  configuration dependent) for the pad to need enabled links even
> > > > -	  when this flag isn't set; the absence of the flag doesn't imply
> > > > -	  there is none.
> > > > +       -  If this flag, then at least one link connected to the pad must be
> > > > +          enabled for the pad to be able to stream. There could be temporary
> > > > +          reasons (e.g. device configuration dependent) for the pad to need
> > > > +          enabled links even when this flag isn't set; the absence of the flag
> > > > +          doesn't imply there is none.
> > > 
> > > Shoudln't you indent by tabs first here?
> > 
> > My text editor picked the option it liked best. I'll fix indentation to
> > avoid switching from tabs to spaces.
> > 
> > > Would it be possible to backport this, too? I'm pretty sure there will be
> > > NULL pointer dereferences due to this, even previous to the graph walk
> > > rework.
> > 
> > Patches 1/7 and 2/7 should be simple to backport (hopefully). Patch 3/7
> > should as well, which will fix the crash in the imx8-isi driver. Patches
> > 4/7 to 6/7 may be more difficult to backport as they could generate more
> > conflicts, it depends how far back you want to go. That would be my
> > preferred option though.
> > 
> > > It may require reworking this to apply it to the pre-rework implementation
> > > and that's outside the scope of this set obviously.
> > 
> > The rework (v6.1) predates the imx8-isi driver (v6.4), so from an
> > imx8-isi point of view, we don't have to backport this earlier than
> > v6.4.
> 
> How certain are you this only affects the imx8-isi driver? There are many
> drivers using the MUST_CONNECT flag and I'm not sure all those have the
> necessary checks in place. There of course could be drivers just missing
> the flag, too, and that's a different issue.

The imx8-isi was not using the flag, so it's a different issue. The ISI
is special in the sense that it has an input crossbar switch that can
have Asome non-connected inputs in valid configurations.

For drivers using the flag, in most cases there should be at least one
link connected to MUST_CONNECT pads. Many drivers are for 1-sink,
1-source subdevs, and those should not get registered in the first place
if they have nothing connected to their source.

One exception may be the ipu3-cio2 driver which has multiple independent
CSI-2 RXs. Some of them will not have any sensor connected. This could
be addressed in the ipu3-cio2 driver to not register those CSI-2 RXs
(and the corresponding video nodes). Alternatively I'm fine if you try
to backport this series before v6.1, but I won't :-)

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-3696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A93A582D7EB
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 11:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32FF11F21ADE
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 10:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B381E86B;
	Mon, 15 Jan 2024 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="zTyLrTBQ"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB77F1DDC1
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TD8KG4MkxzySZ;
	Mon, 15 Jan 2024 12:59:14 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1705316354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cOZvf7FT2W5ShrUrKvLODg0WIvvLUGtPbJY8e9wBIW4=;
	b=zTyLrTBQO6HFu/MgEBHkXsxDkBsZBJKw9JGyOJD8WE13vH/QHy+fqnJ+EMMyQfcH9I/vh6
	zf/zZslywsk3ixWSzAlq/EnjMfMxw7HK6L8Wki0+hvII8twfx0Fm4k4qt3E9bfNK3hrQwn
	0p+GCmeRuKsrDpGznrNljJbg5Mvw2Y4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1705316354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cOZvf7FT2W5ShrUrKvLODg0WIvvLUGtPbJY8e9wBIW4=;
	b=VgPnqvUDiBg0oFO+k2mQ6AdnoRt8RjWoPli7VMT1g8TwcKieFMwYLbPhbYEEldFvqmdolb
	6IhoA9A1G5lFEsI97lGfcC4dROIJUmm6ZqGIv8EW5CGEnDGZlIe3OPPq9tHvupe1Zq30Bn
	olqV8L/kyuNz/w0cMO7dU8LSEvsituE=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1705316354; a=rsa-sha256; cv=none;
	b=KugaII2SiriAPqVkRrOeOfpIcDUKQPHEtgKqgHf/o53NxJxb4eMB9lUHSA3/vcpUsjJ5qA
	96TxzjvJAE1nOvWVRycVy3YDqnUNiCns+AKQFyxWts9UpdiHZugiHr1IBCKHXkuBu7J8fC
	HgHOuwOpZ+LjeuPCgDaQ3GPUfT34a90=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 35F46634C93;
	Mon, 15 Jan 2024 12:59:14 +0200 (EET)
Date: Mon, 15 Jan 2024 10:59:14 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <ZaUQAo0Y6Ofm249e@valkosipuli.retiisi.eu>
References: <20240115103029.28055-1-laurent.pinchart@ideasonboard.com>
 <20240115103029.28055-7-laurent.pinchart@ideasonboard.com>
 <ZaUMbP8e_Ng_WxCT@valkosipuli.retiisi.eu>
 <20240115105525.GC5869@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115105525.GC5869@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Jan 15, 2024 at 12:55:25PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Mon, Jan 15, 2024 at 10:43:56AM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > Many thanks for working on this.
> 
> You're welcome. It was somehow fun.
> 
> > On Mon, Jan 15, 2024 at 12:30:28PM +0200, Laurent Pinchart wrote:
> > > The MEDIA_PAD_FL_MUST_CONNECT flag indicates that the pad requires an
> > > enabled link to stream, but only if it has any link at all. This makes
> > > little sense, as if a pad is part of a pipeline, there are very few use
> > > cases for an active link to be mandatory only if links exist at all. A
> > > review of in-tree drivers confirms they all need an enabled link for
> > > pads marked with the MEDIA_PAD_FL_MUST_CONNECT flag.
> > > 
> > > Expand the scope of the flag by rejecting pads that have no links at
> > > all. This requires modifying the pipeline build code to add those pads
> > > to the pipeline.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  .../media/mediactl/media-types.rst            | 11 ++--
> > >  drivers/media/mc/mc-entity.c                  | 53 +++++++++++++++----
> > >  2 files changed, 48 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > index 0ffeece1e0c8..1ce87c0b705f 100644
> > > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > @@ -375,12 +375,11 @@ Types and flags used to represent the media graph elements
> > >  	  are origins of links.
> > >  
> > >      *  -  ``MEDIA_PAD_FL_MUST_CONNECT``
> > > -       -  If this flag is set and the pad is linked to any other pad, then
> > > -	  at least one of those links must be enabled for the entity to be
> > > -	  able to stream. There could be temporary reasons (e.g. device
> > > -	  configuration dependent) for the pad to need enabled links even
> > > -	  when this flag isn't set; the absence of the flag doesn't imply
> > > -	  there is none.
> > > +       -  If this flag, then at least one link connected to the pad must be
> > > +          enabled for the pad to be able to stream. There could be temporary
> > > +          reasons (e.g. device configuration dependent) for the pad to need
> > > +          enabled links even when this flag isn't set; the absence of the flag
> > > +          doesn't imply there is none.
> > 
> > Shoudln't you indent by tabs first here?
> 
> My text editor picked the option it liked best. I'll fix indentation to
> avoid switching from tabs to spaces.
> 
> > Would it be possible to backport this, too? I'm pretty sure there will be
> > NULL pointer dereferences due to this, even previous to the graph walk
> > rework.
> 
> Patches 1/7 and 2/7 should be simple to backport (hopefully). Patch 3/7
> should as well, which will fix the crash in the imx8-isi driver. Patches
> 4/7 to 6/7 may be more difficult to backport as they could generate more
> conflicts, it depends how far back you want to go. That would be my
> preferred option though.
> 
> > It may require reworking this to apply it to the pre-rework implementation
> > and that's outside the scope of this set obviously.
> 
> The rework (v6.1) predates the imx8-isi driver (v6.4), so from an
> imx8-isi point of view, we don't have to backport this earlier than
> v6.4.

How certain are you this only affects the imx8-isi driver? There are many
drivers using the MUST_CONNECT flag and I'm not sure all those have the
necessary checks in place. There of course could be drivers just missing
the flag, too, and that's a different issue.

-- 
Regards,

Sakari Ailus


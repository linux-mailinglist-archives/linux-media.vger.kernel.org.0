Return-Path: <linux-media+bounces-16710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9216295E03F
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 00:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABA771C210F0
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 22:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6022013AD11;
	Sat, 24 Aug 2024 22:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qOk2QLIm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12018F62;
	Sat, 24 Aug 2024 22:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724537901; cv=none; b=qMKcp/CRBCUJgD9Y6PGTjlqQZvvlK5DnZQB9p6i3/M0e1U7ybn60dxsbb9Eu+p5yeEHH4hogvaXhEOGQEcf2Lc/ieAKg/VHRjEjiWstDMOX27R0PywHtWf3Ym7eaPkmx0KR7seqiQNQuc0w/1HA0MGHwkxbyKNYuQJhQ3/p9y3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724537901; c=relaxed/simple;
	bh=kQECYvydUBlLx4+90xyvKL+kAHTj+qmxEZLP/Vh2wJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KO33+59k9puYZS4LXJe/0N8S2NfcCvIc0mXE8AISnBnno139Da9gJhnPwItY8FDLcMDaJx7ooHI3TLSeIzI0b77J6m6MXfvmwYWskH3qrhNj3g8qYObm9FfGkMfDd1kh3sv1cBvT/u/IG4/voaDJf5E0DDmEtEFHNPuXLrBMDp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qOk2QLIm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95C5B3D6;
	Sun, 25 Aug 2024 00:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724537832;
	bh=kQECYvydUBlLx4+90xyvKL+kAHTj+qmxEZLP/Vh2wJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qOk2QLImwcOK1/AsuyeRNEfplbubM7c01LaRf4otvWgz/fIWkWP8qW55zaKAZCSAP
	 JrB41jb5yJWEyZ54Md1vNsfggydL5NUYh1lMmXSDXIwAvmazfhjEsuirAgHn4182A6
	 X/Qdd4/xYmJAfq11Q6BlNxUpDOtlXk/1KIJWpzNQ=
Date: Sun, 25 Aug 2024 01:18:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 4/4] media: Documentation: mc: Replace deprecated graph
 walk API
Message-ID: <20240824221813.GA24650@pendragon.ideasonboard.com>
References: <20240822212445.2037-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240822212445.2037-5-laurent.pinchart+renesas@ideasonboard.com>
 <ZspabTUscKHf4AGV@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZspabTUscKHf4AGV@valkosipuli.retiisi.eu>

On Sat, Aug 24, 2024 at 10:10:53PM +0000, Sakari Ailus wrote:
> On Fri, Aug 23, 2024 at 12:24:43AM +0300, Laurent Pinchart wrote:
> > The graph walk API has been deprecated in commit eac564de0915 ("media:
> > mc: entity: Add entity iterator for media_pipeline") in favour of
> > pipelien iterators, but the MC documentation hasn't been updated
> > accordingly. It still documents the deprecated API as the only option.
> > Fix it by dropping the deprecated function, and documenting the new API.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  Documentation/driver-api/media/mc-core.rst | 67 +++++++++++++---------
> >  1 file changed, 41 insertions(+), 26 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> > index 2456950ce8ff..1d010bd7ec49 100644
> > --- a/Documentation/driver-api/media/mc-core.rst
> > +++ b/Documentation/driver-api/media/mc-core.rst
> > @@ -144,7 +144,8 @@ valid values are described at :c:func:`media_create_pad_link()` and
> >  Graph traversal
> 
> Perhaps this could be changed as well? The text below still mentions
> traversing graphs but no longer documents the API. Shouldn't we cease to
> mention it as well?

We can rename it. Do you have a proposal for a better name ? The section
documents the API that iterates over all entities/pads/links in the
graph, as well as some functions that perform some form of graph
traversal such as media_pad_remote_pad_first().

> Apart from this,
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> >  ^^^^^^^^^^^^^^^
> >  
> > -The media framework provides APIs to iterate over entities in a graph.
> > +The media framework provides APIs to traverse media graphs, locating connected
> > +entities and links.
> >  
> >  To iterate over all entities belonging to a media device, drivers can use
> >  the media_device_for_each_entity macro, defined in
> > @@ -159,31 +160,6 @@ the media_device_for_each_entity macro, defined in
> >      ...
> >      }
> >  
> > -Drivers might also need to iterate over all entities in a graph that can be
> > -reached only through enabled links starting at a given entity. The media
> > -framework provides a depth-first graph traversal API for that purpose.
> > -
> > -.. note::
> > -
> > -   Graphs with cycles (whether directed or undirected) are **NOT**
> > -   supported by the graph traversal API. To prevent infinite loops, the graph
> > -   traversal code limits the maximum depth to ``MEDIA_ENTITY_ENUM_MAX_DEPTH``,
> > -   currently defined as 16.
> > -
> > -Drivers initiate a graph traversal by calling
> > -:c:func:`media_graph_walk_start()`
> > -
> > -The graph structure, provided by the caller, is initialized to start graph
> > -traversal at the given entity.
> > -
> > -Drivers can then retrieve the next entity by calling
> > -:c:func:`media_graph_walk_next()`
> > -
> > -When the graph traversal is complete the function will return ``NULL``.
> > -
> > -Graph traversal can be interrupted at any moment. No cleanup function call
> > -is required and the graph structure can be freed normally.
> > -
> >  Helper functions can be used to find a link between two given pads, or a pad
> >  connected to another pad through an enabled link
> >  (:c:func:`media_entity_find_link()`, :c:func:`media_pad_remote_pad_first()`,
> > @@ -276,6 +252,45 @@ Subsystems should facilitate link validation by providing subsystem specific
> >  helper functions to provide easy access for commonly needed information, and
> >  in the end provide a way to use driver-specific callbacks.
> >  
> > +Pipeline traversal
> > +^^^^^^^^^^^^^^^^^^
> > +
> > +Once a pipeline has been constructed with :c:func:`media_pipeline_start()`,
> > +drivers can iterate over entities or pads in the pipeline with the
> > +:c:macro:´media_pipeline_for_each_entity` and
> > +:c:macro:´media_pipeline_for_each_pad` macros. Iterating over pads is
> > +straightforward:
> > +
> > +.. code-block:: c
> > +
> > +   media_pipeline_pad_iter iter;
> > +   struct media_pad *pad;
> > +
> > +   media_pipeline_for_each_pad(pipe, &iter, pad) {
> > +       /* 'pad' will point to each pad in turn */
> > +       ...
> > +   }
> > +
> > +To iterate over entities, the iterator needs to be initialized and cleaned up
> > +as an additional steps:
> > +
> > +.. code-block:: c
> > +
> > +   media_pipeline_entity_iter iter;
> > +   struct media_entity *entity;
> > +   int ret;
> > +
> > +   ret = media_pipeline_entity_iter_init(pipe, &iter);
> > +   if (ret)
> > +       ...;
> > +
> > +   media_pipeline_for_each_entity(pipe, &iter, entity) {
> > +       /* 'entity' will point to each entity in turn */
> > +       ...
> > +   }
> > +
> > +   media_pipeline_entity_iter_cleanup(&iter);
> > +
> >  Media Controller Device Allocator API
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >  

-- 
Regards,

Laurent Pinchart


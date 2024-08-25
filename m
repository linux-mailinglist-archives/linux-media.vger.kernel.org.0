Return-Path: <linux-media+bounces-16731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A841F95E238
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 08:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8FD31C20BBD
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 06:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E530383A5;
	Sun, 25 Aug 2024 06:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="sdwzNi8I"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219DD17C61;
	Sun, 25 Aug 2024 06:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724566761; cv=pass; b=GaRZP+8MRh/PlchSoRTuum2mNjRm6ljno8zXGT6pVPzOAMVE2jYo5aAr7tgZrVG68439BUSLwaC8DebTSqoovp9uH6uiCeiQkkC3kuVWwDNqLhHwwZiRYZReyP2+JMKLxuf1BrnGnKqVMLjODj2b17LT6m2CrRi0w6bzFIpH5LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724566761; c=relaxed/simple;
	bh=iHF4FQ86ITCy8wcTdOII1RY9ETgAFYf+mRbl/N/7QLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5nLj/TGZN6IUS8KgC6ujqHMzME/j5QREe0V/t2I+FnaHE89VM15MM7m6BopHsApGWw/PgO0ZHJ9YIWrpCkVOaqgaPQUKvrtIW8X5/7YZZlXeLoeOhGS/mEdvI0l2akJ0UMWrBYbS3OooMadTx7SIYXB0yu+i32AMJ5XfAy45JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=sdwzNi8I; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Ws3YF3WmfzyVP;
	Sun, 25 Aug 2024 09:19:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1724566754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6KpQVPK4GvKy5X2JbyrOj1dq9pFhRPnjhsJAhaSY/Ck=;
	b=sdwzNi8IyQEpvJeL2VWiAYe3duP6aWto1ZzMnebSATi+shpz0JzvFLzAYVud1j18tb2XVc
	6NJFyen5eUMddcAc903m7mc0EkgPVkmUnCKJk+VKMhxUDsSW+96ORKK+lPeRd0kZElqfz3
	SyMqA+DFNA13FkfswpdZkQGalljqE8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1724566754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6KpQVPK4GvKy5X2JbyrOj1dq9pFhRPnjhsJAhaSY/Ck=;
	b=rAAJoUrblFeVqkS30IEjdw8XvAZ8qILDQy5wvC7LsaVLY6Y4CazwXMffjjtJ65N5SOrnww
	OqYu5RDbHkMfoR+QnKKCEwouUXljWmhbOk6VHNfsJpzQuUeQdaKtHvV1HujuYnBKTM7RID
	FACLzgMS+sWczGb/kMMCCxVQVk5ogHw=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1724566754; a=rsa-sha256; cv=none;
	b=PHgZ3A5NcbPL1MrGLUylljWLGPkpX+mO0c/iOF6UED39E8A5XdM5ZzF8RH8dTX5v6w8D0P
	qK3qE/lSOfLB28pOpGgaWEk4SG0EWvzAIn8x31pK5ZgwFQxCBU34UN/3SPZ4OmUoD+qx2x
	n7JgZMAp6q37ZkKkNvX2FD1jf4h+i7g=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9C77E634C94;
	Sun, 25 Aug 2024 09:19:11 +0300 (EEST)
Date: Sun, 25 Aug 2024 06:19:11 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 4/4] media: Documentation: mc: Replace deprecated graph
 walk API
Message-ID: <ZsrM3-m7xbr5fpkH@valkosipuli.retiisi.eu>
References: <20240822212445.2037-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240822212445.2037-5-laurent.pinchart+renesas@ideasonboard.com>
 <ZspabTUscKHf4AGV@valkosipuli.retiisi.eu>
 <20240824221813.GA24650@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240824221813.GA24650@pendragon.ideasonboard.com>

Hi Laurent,

On Sun, Aug 25, 2024 at 01:18:13AM +0300, Laurent Pinchart wrote:
> On Sat, Aug 24, 2024 at 10:10:53PM +0000, Sakari Ailus wrote:
> > On Fri, Aug 23, 2024 at 12:24:43AM +0300, Laurent Pinchart wrote:
> > > The graph walk API has been deprecated in commit eac564de0915 ("media:
> > > mc: entity: Add entity iterator for media_pipeline") in favour of
> > > pipelien iterators, but the MC documentation hasn't been updated
> > > accordingly. It still documents the deprecated API as the only option.
> > > Fix it by dropping the deprecated function, and documenting the new API.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  Documentation/driver-api/media/mc-core.rst | 67 +++++++++++++---------
> > >  1 file changed, 41 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> > > index 2456950ce8ff..1d010bd7ec49 100644
> > > --- a/Documentation/driver-api/media/mc-core.rst
> > > +++ b/Documentation/driver-api/media/mc-core.rst
> > > @@ -144,7 +144,8 @@ valid values are described at :c:func:`media_create_pad_link()` and
> > >  Graph traversal
> > 
> > Perhaps this could be changed as well? The text below still mentions
> > traversing graphs but no longer documents the API. Shouldn't we cease to
> > mention it as well?
> 
> We can rename it. Do you have a proposal for a better name ? The section
> documents the API that iterates over all entities/pads/links in the
> graph, as well as some functions that perform some form of graph
> traversal such as media_pad_remote_pad_first().

I missed earlier the pipeline traversal is its own section. Still, the
graph traversal itself is gone as a public API in the documentation. How
about e.g.:

- Accessing graph objects
- Working with graph objects

> 
> > Apart from this,
> > 
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > >  ^^^^^^^^^^^^^^^
> > >  
> > > -The media framework provides APIs to iterate over entities in a graph.
> > > +The media framework provides APIs to traverse media graphs, locating connected
> > > +entities and links.
> > >  
> > >  To iterate over all entities belonging to a media device, drivers can use
> > >  the media_device_for_each_entity macro, defined in
> > > @@ -159,31 +160,6 @@ the media_device_for_each_entity macro, defined in
> > >      ...
> > >      }
> > >  
> > > -Drivers might also need to iterate over all entities in a graph that can be
> > > -reached only through enabled links starting at a given entity. The media
> > > -framework provides a depth-first graph traversal API for that purpose.
> > > -
> > > -.. note::
> > > -
> > > -   Graphs with cycles (whether directed or undirected) are **NOT**
> > > -   supported by the graph traversal API. To prevent infinite loops, the graph
> > > -   traversal code limits the maximum depth to ``MEDIA_ENTITY_ENUM_MAX_DEPTH``,
> > > -   currently defined as 16.
> > > -
> > > -Drivers initiate a graph traversal by calling
> > > -:c:func:`media_graph_walk_start()`
> > > -
> > > -The graph structure, provided by the caller, is initialized to start graph
> > > -traversal at the given entity.
> > > -
> > > -Drivers can then retrieve the next entity by calling
> > > -:c:func:`media_graph_walk_next()`
> > > -
> > > -When the graph traversal is complete the function will return ``NULL``.
> > > -
> > > -Graph traversal can be interrupted at any moment. No cleanup function call
> > > -is required and the graph structure can be freed normally.
> > > -
> > >  Helper functions can be used to find a link between two given pads, or a pad
> > >  connected to another pad through an enabled link
> > >  (:c:func:`media_entity_find_link()`, :c:func:`media_pad_remote_pad_first()`,
> > > @@ -276,6 +252,45 @@ Subsystems should facilitate link validation by providing subsystem specific
> > >  helper functions to provide easy access for commonly needed information, and
> > >  in the end provide a way to use driver-specific callbacks.
> > >  
> > > +Pipeline traversal
> > > +^^^^^^^^^^^^^^^^^^
> > > +
> > > +Once a pipeline has been constructed with :c:func:`media_pipeline_start()`,
> > > +drivers can iterate over entities or pads in the pipeline with the
> > > +:c:macro:´media_pipeline_for_each_entity` and
> > > +:c:macro:´media_pipeline_for_each_pad` macros. Iterating over pads is
> > > +straightforward:
> > > +
> > > +.. code-block:: c
> > > +
> > > +   media_pipeline_pad_iter iter;
> > > +   struct media_pad *pad;
> > > +
> > > +   media_pipeline_for_each_pad(pipe, &iter, pad) {
> > > +       /* 'pad' will point to each pad in turn */
> > > +       ...
> > > +   }
> > > +
> > > +To iterate over entities, the iterator needs to be initialized and cleaned up
> > > +as an additional steps:
> > > +
> > > +.. code-block:: c
> > > +
> > > +   media_pipeline_entity_iter iter;
> > > +   struct media_entity *entity;
> > > +   int ret;
> > > +
> > > +   ret = media_pipeline_entity_iter_init(pipe, &iter);
> > > +   if (ret)
> > > +       ...;
> > > +
> > > +   media_pipeline_for_each_entity(pipe, &iter, entity) {
> > > +       /* 'entity' will point to each entity in turn */
> > > +       ...
> > > +   }
> > > +
> > > +   media_pipeline_entity_iter_cleanup(&iter);
> > > +
> > >  Media Controller Device Allocator API
> > >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >  

-- 
Regards,

Sakari Ailus


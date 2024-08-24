Return-Path: <linux-media+bounces-16709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFAD95E03B
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 00:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD2CEB215C0
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 22:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D0F13C8F9;
	Sat, 24 Aug 2024 22:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="T6jab5aT";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="cHggtILQ"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC9C1EA80;
	Sat, 24 Aug 2024 22:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724537472; cv=pass; b=hp6G+KCBT4LM6ZVUI39HEv/jjUI7cafN4YghT+bmE324kKfvmQVJbrLCVr8IlGGpNAQoqplnrJdh+n9pl/u3JACQNyJi4VvJC6L1jOksY1Mc4CVXVHmNDVsdBZr9eFeTaLMJkvsRSzTYgP4+6/nyrSqTVu4noh4QNjrCt1ByulU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724537472; c=relaxed/simple;
	bh=xykohgP+9L7JFUCAt8ykQOoCBgzChyY4+Rz7dGASQ74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jImEUuf+A6rbi3I8Hbn6bFfBoMD4q4aRSm1+ew0dPloiz+PWU/IFydVusRgNrzxa3V3tE+01Ayr5f+AxLK6Mi2KFAOMZ2jLPfdg6lTTBwAPgOzahTzyyCex2tuCc5eEOP+8uLBjMBIkqgs3yTPj1Od5mUBzEH8lwhHMTyvvw5Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=T6jab5aT; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=cHggtILQ; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4Wrrk20TPqz49Px6;
	Sun, 25 Aug 2024 01:11:06 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1724537466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/K3S4yoDtEBLtYvYycGtbzHmHfRIUQu3u+U/8FnHvS0=;
	b=T6jab5aTnCP6ctx1e+SWnU/rIpnmWWdx0iCczgV5pNNlw5lJb/6hkTDo7R/v7h+sqC/BBT
	gStII2XrBhpwj91oRh1KbRUS1jz3tDTgVCR209S4x5zPG1/FZRGQvwy8tu6NlIUFrnKAvK
	kdFJLBQOjF+iRpw40kbSKciuNSKPUf11P269ml51lgXbkVHySJsM+7P5RkSH7oEZQPnztU
	xoCUog1eGQ0NkV9MbX7Vr7hrsIZpJNTrI5+rx6sNyvfHuuvLZR5P2ltTlYkSxQhx4+Wxbd
	V1+sQ0gyr/xPmCfuwDHl7oaELWgc0CqiN89yplMgvz5vRqQxkraHHN0xLHCl1g==
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Wrrjr5LJyzyVV;
	Sun, 25 Aug 2024 01:10:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1724537457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/K3S4yoDtEBLtYvYycGtbzHmHfRIUQu3u+U/8FnHvS0=;
	b=cHggtILQyY3GLq5DkhuOHtTV9nKc4HVlAMU7STcX1uK1QDgnFhb9HsUkwyy2hWkHiugkPk
	aNORuAEnuRXy8fqWWYyQ8uQNeEGWlAjJUOJCDarYsOGF/p2ijmmXBnXprCM0N7GnoTyK3D
	fqfrsEsfZfWriX+ZK5bBkp6BKfvaV20=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1724537457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/K3S4yoDtEBLtYvYycGtbzHmHfRIUQu3u+U/8FnHvS0=;
	b=xE2OHc+Krpj/i4c/XiW5vBxJFOool8in2e3fzMbHtCr0esRez6ID019LIe624xmQQ4dhM5
	wpC9MjVieslz7Oy1Hyo874jiroYWi7Yji7JXOy9W+uBWZNRl+0GmnE7g5Mk0+wXjZ6xYvS
	9Hk7yJfbjGKZgn3L9+VnkExmbkqwxUY=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1724537457; a=rsa-sha256; cv=none;
	b=mbLjXMlFyhNKm7VfYQl+r3XbfcvqP0F2/9x2lTXWHxssN3jFDPbyFUFO4ly+TIDl0xcbeB
	9FSMDYzXrfdIac5tFz3sb0VPhhWZhvMVDEGqzKrfiHzDm/wMZEryqtW9mYXNyg/W+nMwOq
	u++eWEI0pi3hUu1945IN9bvDWTkusuM=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id DB8D5634C93;
	Sun, 25 Aug 2024 01:10:53 +0300 (EEST)
Date: Sat, 24 Aug 2024 22:10:53 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 4/4] media: Documentation: mc: Replace deprecated graph
 walk API
Message-ID: <ZspabTUscKHf4AGV@valkosipuli.retiisi.eu>
References: <20240822212445.2037-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240822212445.2037-5-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240822212445.2037-5-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

On Fri, Aug 23, 2024 at 12:24:43AM +0300, Laurent Pinchart wrote:
> The graph walk API has been deprecated in commit eac564de0915 ("media:
> mc: entity: Add entity iterator for media_pipeline") in favour of
> pipelien iterators, but the MC documentation hasn't been updated
> accordingly. It still documents the deprecated API as the only option.
> Fix it by dropping the deprecated function, and documenting the new API.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  Documentation/driver-api/media/mc-core.rst | 67 +++++++++++++---------
>  1 file changed, 41 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> index 2456950ce8ff..1d010bd7ec49 100644
> --- a/Documentation/driver-api/media/mc-core.rst
> +++ b/Documentation/driver-api/media/mc-core.rst
> @@ -144,7 +144,8 @@ valid values are described at :c:func:`media_create_pad_link()` and
>  Graph traversal

Perhaps this could be changed as well? The text below still mentions
traversing graphs but no longer documents the API. Shouldn't we cease to
mention it as well?

Apart from this,

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

>  ^^^^^^^^^^^^^^^
>  
> -The media framework provides APIs to iterate over entities in a graph.
> +The media framework provides APIs to traverse media graphs, locating connected
> +entities and links.
>  
>  To iterate over all entities belonging to a media device, drivers can use
>  the media_device_for_each_entity macro, defined in
> @@ -159,31 +160,6 @@ the media_device_for_each_entity macro, defined in
>      ...
>      }
>  
> -Drivers might also need to iterate over all entities in a graph that can be
> -reached only through enabled links starting at a given entity. The media
> -framework provides a depth-first graph traversal API for that purpose.
> -
> -.. note::
> -
> -   Graphs with cycles (whether directed or undirected) are **NOT**
> -   supported by the graph traversal API. To prevent infinite loops, the graph
> -   traversal code limits the maximum depth to ``MEDIA_ENTITY_ENUM_MAX_DEPTH``,
> -   currently defined as 16.
> -
> -Drivers initiate a graph traversal by calling
> -:c:func:`media_graph_walk_start()`
> -
> -The graph structure, provided by the caller, is initialized to start graph
> -traversal at the given entity.
> -
> -Drivers can then retrieve the next entity by calling
> -:c:func:`media_graph_walk_next()`
> -
> -When the graph traversal is complete the function will return ``NULL``.
> -
> -Graph traversal can be interrupted at any moment. No cleanup function call
> -is required and the graph structure can be freed normally.
> -
>  Helper functions can be used to find a link between two given pads, or a pad
>  connected to another pad through an enabled link
>  (:c:func:`media_entity_find_link()`, :c:func:`media_pad_remote_pad_first()`,
> @@ -276,6 +252,45 @@ Subsystems should facilitate link validation by providing subsystem specific
>  helper functions to provide easy access for commonly needed information, and
>  in the end provide a way to use driver-specific callbacks.
>  
> +Pipeline traversal
> +^^^^^^^^^^^^^^^^^^
> +
> +Once a pipeline has been constructed with :c:func:`media_pipeline_start()`,
> +drivers can iterate over entities or pads in the pipeline with the
> +:c:macro:´media_pipeline_for_each_entity` and
> +:c:macro:´media_pipeline_for_each_pad` macros. Iterating over pads is
> +straightforward:
> +
> +.. code-block:: c
> +
> +   media_pipeline_pad_iter iter;
> +   struct media_pad *pad;
> +
> +   media_pipeline_for_each_pad(pipe, &iter, pad) {
> +       /* 'pad' will point to each pad in turn */
> +       ...
> +   }
> +
> +To iterate over entities, the iterator needs to be initialized and cleaned up
> +as an additional steps:
> +
> +.. code-block:: c
> +
> +   media_pipeline_entity_iter iter;
> +   struct media_entity *entity;
> +   int ret;
> +
> +   ret = media_pipeline_entity_iter_init(pipe, &iter);
> +   if (ret)
> +       ...;
> +
> +   media_pipeline_for_each_entity(pipe, &iter, entity) {
> +       /* 'entity' will point to each entity in turn */
> +       ...
> +   }
> +
> +   media_pipeline_entity_iter_cleanup(&iter);
> +
>  Media Controller Device Allocator API
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  

-- 
Kind regards,

Sakari Ailus


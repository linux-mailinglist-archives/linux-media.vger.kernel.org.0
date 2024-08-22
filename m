Return-Path: <linux-media+bounces-16620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9B795C03D
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 23:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFB80B245C6
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 21:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6C01D2F5A;
	Thu, 22 Aug 2024 21:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LlTCktcs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAD31D27A9;
	Thu, 22 Aug 2024 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724361899; cv=none; b=W9L7MVuH+jv+WZEIwwZ2X+gpzMoOdWOSpIndVOiYz0gysBSP0PBMMcpGR8cdN7UpdABUhP2ArQBtInOMNciejjbJIgj4QdqRVT0d9aGP4JJr/JwIEvW0v3TjD7TasrTu/8j21VBsCKI58pDnoW/yDCQiSpKhpWLaU40SHTD00iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724361899; c=relaxed/simple;
	bh=vVuGdYMoHpe9UjhoZIZ69aB4nMlLOe5ZKj5NYGwE/xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BJc9xouI5mTczcHEUEKzGxqaBsmC1f1EPDC5yXnb6/AAchdJao76vEPLJSeJniIf111WybUNvLZe41EDxcvQYv5L1LxCEqgq6MMukrhwtuBc1A4oYOsnEi5XJzQ8tCGioyAFTWlS4betTsYKxBULNs01THhrSN5rYt/dbPz+W+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LlTCktcs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3EEA219;
	Thu, 22 Aug 2024 23:23:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724361831;
	bh=vVuGdYMoHpe9UjhoZIZ69aB4nMlLOe5ZKj5NYGwE/xQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LlTCktcsqpSwu+Wjrgyx+WrNMCDNB6Hi+hUemERH1Q4EUl/3oXVVAWeiqZ0wmxKgk
	 XmpBN6c6s4LfifjIDSc2EE05XXO7r6cVJxinWEtLMgGN5cG9kNykDd/pn/bC3YU6i5
	 CMQie1MosbF31N3Ej8MkEb496CYUUTXCqzUeRzbw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 4/4] media: Documentation: mc: Replace deprecated graph walk API
Date: Fri, 23 Aug 2024 00:24:43 +0300
Message-ID: <20240822212445.2037-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240822212445.2037-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240822212445.2037-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The graph walk API has been deprecated in commit eac564de0915 ("media:
mc: entity: Add entity iterator for media_pipeline") in favour of
pipelien iterators, but the MC documentation hasn't been updated
accordingly. It still documents the deprecated API as the only option.
Fix it by dropping the deprecated function, and documenting the new API.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/driver-api/media/mc-core.rst | 67 +++++++++++++---------
 1 file changed, 41 insertions(+), 26 deletions(-)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 2456950ce8ff..1d010bd7ec49 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -144,7 +144,8 @@ valid values are described at :c:func:`media_create_pad_link()` and
 Graph traversal
 ^^^^^^^^^^^^^^^
 
-The media framework provides APIs to iterate over entities in a graph.
+The media framework provides APIs to traverse media graphs, locating connected
+entities and links.
 
 To iterate over all entities belonging to a media device, drivers can use
 the media_device_for_each_entity macro, defined in
@@ -159,31 +160,6 @@ the media_device_for_each_entity macro, defined in
     ...
     }
 
-Drivers might also need to iterate over all entities in a graph that can be
-reached only through enabled links starting at a given entity. The media
-framework provides a depth-first graph traversal API for that purpose.
-
-.. note::
-
-   Graphs with cycles (whether directed or undirected) are **NOT**
-   supported by the graph traversal API. To prevent infinite loops, the graph
-   traversal code limits the maximum depth to ``MEDIA_ENTITY_ENUM_MAX_DEPTH``,
-   currently defined as 16.
-
-Drivers initiate a graph traversal by calling
-:c:func:`media_graph_walk_start()`
-
-The graph structure, provided by the caller, is initialized to start graph
-traversal at the given entity.
-
-Drivers can then retrieve the next entity by calling
-:c:func:`media_graph_walk_next()`
-
-When the graph traversal is complete the function will return ``NULL``.
-
-Graph traversal can be interrupted at any moment. No cleanup function call
-is required and the graph structure can be freed normally.
-
 Helper functions can be used to find a link between two given pads, or a pad
 connected to another pad through an enabled link
 (:c:func:`media_entity_find_link()`, :c:func:`media_pad_remote_pad_first()`,
@@ -276,6 +252,45 @@ Subsystems should facilitate link validation by providing subsystem specific
 helper functions to provide easy access for commonly needed information, and
 in the end provide a way to use driver-specific callbacks.
 
+Pipeline traversal
+^^^^^^^^^^^^^^^^^^
+
+Once a pipeline has been constructed with :c:func:`media_pipeline_start()`,
+drivers can iterate over entities or pads in the pipeline with the
+:c:macro:´media_pipeline_for_each_entity` and
+:c:macro:´media_pipeline_for_each_pad` macros. Iterating over pads is
+straightforward:
+
+.. code-block:: c
+
+   media_pipeline_pad_iter iter;
+   struct media_pad *pad;
+
+   media_pipeline_for_each_pad(pipe, &iter, pad) {
+       /* 'pad' will point to each pad in turn */
+       ...
+   }
+
+To iterate over entities, the iterator needs to be initialized and cleaned up
+as an additional steps:
+
+.. code-block:: c
+
+   media_pipeline_entity_iter iter;
+   struct media_entity *entity;
+   int ret;
+
+   ret = media_pipeline_entity_iter_init(pipe, &iter);
+   if (ret)
+       ...;
+
+   media_pipeline_for_each_entity(pipe, &iter, entity) {
+       /* 'entity' will point to each entity in turn */
+       ...
+   }
+
+   media_pipeline_entity_iter_cleanup(&iter);
+
 Media Controller Device Allocator API
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
Regards,

Laurent Pinchart



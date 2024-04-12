Return-Path: <linux-media+bounces-9163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C99128A2B2E
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 11:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673C61F23147
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 09:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED803502AA;
	Fri, 12 Apr 2024 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cY6JQXeD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2AC5026B
	for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712914130; cv=none; b=KrDJDrJvyajEIuK15z8b6p0uVGt8jqfFnJYoKLvm973GWwsBo1+wF/rjABqe1r3P3kEx3b/x65Lzo1eC7HUbB0Tq4uqcy0nmACPtU/5n1vY1yfUxg3HU+rK6wW1bsbqok4bfa2Y17+CIaXuTAwc5ThNV/ioWV9HK3yALeodK8bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712914130; c=relaxed/simple;
	bh=8Kq+yyWjf6Cjn+0B2wLMeia6Um+S14ALSOleKlO3/JE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NJAo7k4GWqxuQf8zd6arnx6rTOTNOVuhaXQUVwp1uyAU+M3XshzlXHa9UGfbYLrSIW5nTXcToDmIzpaQlBWQDTaEV6zx9zcYn3womL6gWPtgoSUIGv2sDAjIEKgjPjIrbtq+vCAtTFBHACvrFz/PAo5sQeTk0qWOztXPuoMWDeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cY6JQXeD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from fedora.local (unknown [103.251.226.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 574D4A68;
	Fri, 12 Apr 2024 11:28:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712914082;
	bh=8Kq+yyWjf6Cjn+0B2wLMeia6Um+S14ALSOleKlO3/JE=;
	h=From:To:Cc:Subject:Date:From;
	b=cY6JQXeD/oBXn6y4ArlMjp9S1wXatmoBAjZws0eZhIr919/+xIkKjH22dG16eN0sZ
	 X5sbngrlhkFzzK7E8EiZVxtoGr68Gj8d0uLDWisJ1Tc7Ht9SbZrO3QF1kwgXScxVlA
	 Q/FzKSYr5Qbqj0RsZrlXrDarDN6Qni7FPWISEsRQ=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] media: Documentation: dev-subdev: Fix sentence conjunction
Date: Fri, 12 Apr 2024 14:58:36 +0530
Message-ID: <20240412092836.69031-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sentence conjunction in the streams and routes section.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 43988516acdd..7f6620cbdf78 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -561,7 +561,7 @@ selections. The order of configuring formats and selections along a stream is
 the same as without streams (see :ref:`format-propagation`).
 
 Instead of the sub-device wide merging of streams from all sink pads
-towards all source pads, data flows for each route are separate from each
+towards all source pads, data flows for each route that are separate from each
 other. Any number of routes from streams on sink pads towards streams on
 source pads is allowed, to the extent supported by drivers. For every
 stream on a source pad, however, only a single route is allowed.
-- 
2.44.0



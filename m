Return-Path: <linux-media+bounces-13646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB6690E143
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 03:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A53A2840B6
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 01:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39C8FC01;
	Wed, 19 Jun 2024 01:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SXVNE4PA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83A5EAF9;
	Wed, 19 Jun 2024 01:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718760269; cv=none; b=RjZqmWykEHYrutbA5c9u2vJ6tPvER1ibE3VJ/+UZwU1utbGqSPFyWHNWy0Rh1Bgk03hZDxkixHiBqVdNDr+t4MqCU5n+wN6SVdlOKno7guf6xqG1xp+6QvWhYZdVv0P0fKM2Nr20E98IgeLCwgzC4Teu//6PND4uA1QHS9OZHY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718760269; c=relaxed/simple;
	bh=GebboEQBPNN6stBSyIeo/u+bZsCpoRVYWm0IsmkmX2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V48IT5ecINQwUOhRJSNy1MtHtnkg5+JjGAvDD9tUD8HcWlsRgW1OShtZc7nc/+qd/w4qvdAAfkNNa7WFstirr9AhsVu5kf2kdyg/ywarTv+FeJkIzSXR7UxV/wIgCAZl9ZbQfiM1FNaqHtYVy3bHxgLLNCZLWxb8lGI2lsY8Trw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SXVNE4PA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73294F89;
	Wed, 19 Jun 2024 03:24:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718760246;
	bh=GebboEQBPNN6stBSyIeo/u+bZsCpoRVYWm0IsmkmX2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SXVNE4PALmS+2/4h2cUercuGY/blGsocT1V8aXhkFV+mZGxDrEAPDhUgN/6DwcijD
	 v1k+BJMVXizFpH+X8p47hU3HElgcN7+pwdOor0HTTSjrdKR8BIn1PDFOtEPJUNmTUT
	 hAilrrz7qbG1FYoi1qJIf90Y8eGeiskCLrp1D2sA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/8] media: v4l2-subdev: Refactor warnings in v4l2_subdev_link_validate()
Date: Wed, 19 Jun 2024 04:23:52 +0300
Message-ID: <20240619012356.22685-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_subdev_link_validate() function prints a one-time warning if it
gets called on a link whose source or sink is not a subdev. As links get
validated in the context of their sink, a call to the helper when the
link's sink is not a subdev indicates that the driver has set its
.link_validate() handler to v4l2_subdev_link_validate() on a non-subdev
entity, which is a clear driver bug. On the other hand, the link's
source not being a subdev indicates that the helper is used for a subdev
connected to a video output device, which is a lesser issue, if only
because this is currently common practice.

There are no drivers left in the kernel that use
v4l2_subdev_link_validate() in a context where it may get called on a
non-subdev sink. Replace the pr_warn_once() with a WARN_ON() in this
case to make sure that new offenders won't be introduced.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4f71199bf592..2d5e39c79620 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1451,11 +1451,15 @@ int v4l2_subdev_link_validate(struct media_link *link)
 	bool states_locked;
 	int ret;
 
-	if (!is_media_entity_v4l2_subdev(link->sink->entity) ||
-	    !is_media_entity_v4l2_subdev(link->source->entity)) {
-		pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
-			     !is_media_entity_v4l2_subdev(link->sink->entity) ?
-			     "sink" : "source",
+	/*
+	 * Links are validated in the context of the sink entity. Usage of this
+	 * helper on a sink that is not a subdev is a clear driver bug.
+	 */
+	if (WARN_ON(!is_media_entity_v4l2_subdev(link->sink->entity)))
+		return -EINVAL;
+
+	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
+		pr_warn_once("source of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
 			     link->source->entity->name, link->source->index,
 			     link->sink->entity->name, link->sink->index);
 		return 0;
-- 
Regards,

Laurent Pinchart



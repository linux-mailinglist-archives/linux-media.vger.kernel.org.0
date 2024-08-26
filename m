Return-Path: <linux-media+bounces-16802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5333195F1A8
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F22CC1F22963
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741F718859A;
	Mon, 26 Aug 2024 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cb2PW3I4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7915518785F;
	Mon, 26 Aug 2024 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724676080; cv=none; b=ZU7nwMuze8V5AsxyWFzwWDm5XbqrBeCowvd/U9Um2r/sAHt8pj3VixKku7+9RS1tdsgmh9BgANVteFlJnJGzbrGEnjjAoJQKDoDlmlEKm6AFbN9A5QkFB1opiKbS9ijz8TA+ysS2Sg5cOOCjW5qIQFtYHW2uK8/llpnQJJAqW/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724676080; c=relaxed/simple;
	bh=tf0gc+Fe9/W9nbNtwdjzHM9gsYlIcyofSdubnqTEUoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PMQKk+Q5wcF3ZvmsdcwSB4e5EPodXL/E5sAC9y3D54A/T2bfGbAImToRnNWF7w2pFK2imBQrF9OH4ZE2y+OfU9gKv8NGlwUP6Kgt9guZGyk7xwYd+WSbGu4WDe39GP7YlcnogRA6X8Q1+vMVo64DJNuyy+U45Nl/cGMB65EHqZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cb2PW3I4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E058A8F;
	Mon, 26 Aug 2024 14:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724676010;
	bh=tf0gc+Fe9/W9nbNtwdjzHM9gsYlIcyofSdubnqTEUoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cb2PW3I4Hy4uVS5oXuJOP4NG0db2CPbZKoXMXxjLLPLD0Yehvn+YpFHkRG/j9YUr8
	 TywusXbvI0FS/ed1upfdHbKZ9BbH0vesI+nVO4KssWuYD4cIeAe5KkguG0TCE58bWL
	 SCoTBxV3CjwZUHYhPeUPMUNSeG6i4CqIOycQqE+g=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 4/7] media: v4l2-subdev: Refactor warnings in v4l2_subdev_link_validate()
Date: Mon, 26 Aug 2024 15:41:03 +0300
Message-ID: <20240826124106.3823-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
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
non-subdev sink. Replace the pr_warn_once() with a WARN_ON_ONCE() in
this case to make sure that new offenders won't be introduced.

A subsequent change will improve the v4l2_subdev_link_validate() helper
to properly support validating video device to subdev links.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Extend commit message with third paragraph

Changes since v1:

- Switch from WARN_ON() to WARN_ON_ONCE()
---
 drivers/media/v4l2-core/v4l2-subdev.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7c5812d55315..d3196042d5c5 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1443,11 +1443,15 @@ int v4l2_subdev_link_validate(struct media_link *link)
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
+	if (WARN_ON_ONCE(!is_media_entity_v4l2_subdev(link->sink->entity)))
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



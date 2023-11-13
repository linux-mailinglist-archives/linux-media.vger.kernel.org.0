Return-Path: <linux-media+bounces-198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B17E99FE
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8BCC280C6B
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FE81C69C;
	Mon, 13 Nov 2023 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sgvsI97f"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22761C2BC
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:17:15 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA305D4C
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 02:17:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8654C2C6;
	Mon, 13 Nov 2023 11:16:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699870608;
	bh=3iURt+JSzPBRtlVuAwtf0I5lk4DAgDFb46EdfGMGCek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sgvsI97fNq0SLdfmx07WqkPG8j+zvcOGeVdm6lDhOzCJC7HUlhicCRDS3Izjr9X6v
	 u7dt45EtkjUIPtpgRYPffWsYWyE+XOJawfeLpg2QURrdZKfZAMRM581BNrFwzNQqOf
	 tlGYGYTnapbNlAL3WYDzO0d3X8MfO/q6lBRyg9ls=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 1/2] media: v4l2-subdev: Drop unreacheable warning
Date: Mon, 13 Nov 2023 12:17:17 +0200
Message-ID: <20231113101718.6098-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113101718.6098-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20231113101718.6098-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_subdev_link_validate_get_format() function warns if the pad
given as argument belongs to a non-subdev entity. This can't happen, as
the function is called from v4l2_subdev_link_validate() only (indirectly
through v4l2_subdev_link_validate_locked()), and that function ensures
that both ends of the link are subdevs.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index be86b906c985..67d43206ce32 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1184,14 +1184,6 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
 	struct v4l2_subdev *sd;
 	int ret;
 
-	if (!is_media_entity_v4l2_subdev(pad->entity)) {
-		WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,
-		     "Driver bug! Wrong media entity type 0x%08x, entity %s\n",
-		     pad->entity->function, pad->entity->name);
-
-		return -EINVAL;
-	}
-
 	sd = media_entity_to_v4l2_subdev(pad->entity);
 
 	fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
-- 
Regards,

Laurent Pinchart



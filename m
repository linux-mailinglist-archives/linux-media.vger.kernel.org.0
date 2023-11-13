Return-Path: <linux-media+bounces-199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6777E99FF
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9EDC280D37
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7100E1C6B1;
	Mon, 13 Nov 2023 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WcXnk8c8"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C82B1C699
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:17:17 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95095D7C
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 02:17:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 303D9A68;
	Mon, 13 Nov 2023 11:16:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699870610;
	bh=uBstu39/m6HZY+nV4D5uJFdJ0LhVZSFAKDyVMsODvQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WcXnk8c8ZKRsdgo7rDAT61cFE56z35j7nk02c+Oxeoy7RHxlQsOvPfZwBFccQL5M1
	 ttuJG8H14uHVVRci7udQ/PMDB5Gjv9/ad8qvmaSukafgUDB8J+aY0UjBc5XTEmikc6
	 BPkAtTHgC46/kZzydBneX2tSFni82BsFo14bRsP0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 2/2] media: v4l2-subdev: Relax warnings in link validation
Date: Mon, 13 Nov 2023 12:17:18 +0200
Message-ID: <20231113101718.6098-3-laurent.pinchart+renesas@ideasonboard.com>
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

Before v6.3, the v4l2_subdev_link_validate() helper would ignore links
whose source was a video device and sink a subdev. The helper was (and
still is) used by drivers in such cases, in particular for subdevs with
multiple sink pads, some connected to video devices and some to other
subdevs.

Then, commit a6b995ed03ff ("media: subdev: use streams in
v4l2_subdev_link_validate()") assumed the entities on the two sides of a
link are both subdevs, and caused crashes in drivers that use the helper
with subdev sink pads connected to video devices. Commit 55f1ecb11990
("media: v4l: subdev: Make link validation safer"), merged in v6.4,
fixed the crash by adding an explicit check with a pr_warn_once(),
mentioning a driver bug.

Links between a subdev and a video device need to be validated, and
v4l2_subdev_link_validate() can't handle that. Drivers typically handle
this validation manually at stream start time (either in the .streamon()
ioctl handler, or in the .start_streaming() vb2 queue operation),
instead of implementing a custom .link_validate() handler. Forbidding
usage of v4l2_subdev_link_validate() as the .link_validate() handler
would thus force all subdev drivers that mix source links to subdev and
video devices to implement a custom .link_validate() handler that
returns immediately for the video device links and call
v4l2_subdev_link_validate() for subdev links. This would create lots of
duplicated code for no real gain. Instead, relax the check in
v4l2_ctrl_modify_range() to ignore links from a video device to a subdev
without printing any warning.

Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 30 ++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 67d43206ce32..b00be1d57e05 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1356,15 +1356,31 @@ int v4l2_subdev_link_validate(struct media_link *link)
 	struct v4l2_subdev *source_sd, *sink_sd;
 	struct v4l2_subdev_state *source_state, *sink_state;
 	bool states_locked;
+	bool is_sink_subdev;
+	bool is_source_subdev;
 	int ret;
 
-	if (!is_media_entity_v4l2_subdev(link->sink->entity) ||
-	    !is_media_entity_v4l2_subdev(link->source->entity)) {
-		pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
-			     !is_media_entity_v4l2_subdev(link->sink->entity) ?
-			     "sink" : "source",
-			     link->source->entity->name, link->source->index,
-			     link->sink->entity->name, link->sink->index);
+	is_sink_subdev = is_media_entity_v4l2_subdev(link->sink->entity);
+	is_source_subdev = is_media_entity_v4l2_subdev(link->source->entity);
+
+	if (!is_sink_subdev || !is_source_subdev) {
+		/*
+		 * Do not print the warning if the source is a video device and
+		 * the sink a subdev. This is a valid use case, to allow usage
+		 * of this helper by subdev drivers that have multiple sink
+		 * pads, some connected to video devices and some connected to
+		 * other subdevs. The video device to subdev link is typically
+		 * validated manually by the driver at stream start time in such
+		 * cases.
+		 */
+		if (!is_sink_subdev ||
+		    !is_media_entity_v4l2_video_device(link->source->entity))
+			pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
+				     !is_sink_subdev ? "sink" : "source",
+				     link->source->entity->name,
+				     link->source->index,
+				     link->sink->entity->name,
+				     link->sink->index);
 		return 0;
 	}
 
-- 
Regards,

Laurent Pinchart



Return-Path: <linux-media+bounces-16612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD395BAE1
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 17:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F20C51C23E49
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 15:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2ED81CCEE0;
	Thu, 22 Aug 2024 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SU7PrTag"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B378F1CCB57;
	Thu, 22 Aug 2024 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341545; cv=none; b=CHRG/Urdfs/q8utK9aOlSOW5qhdy87OIYOFtRG848bmRqGzFNbuIocbv9gr7s15CJTzUH5bhGJLkJpoXMmo6XiMfX168yG5eyyq5qwBAN1BHRvlQc4+KGz4k8P3mADsVJ3PUCzGiPzqmQkr8qqWCRp3I9uqFVkLDs1SKHOAe1a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341545; c=relaxed/simple;
	bh=p/Vm87vlP9XYuQzQ5C0tpdtZ2+oVHTKxRgJwzH0dUr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTmw/t1xapFdLxQ+aPKcg4M1stI97marwps6CJdOqJ63lIMsSgHUJ7aS9lvG17KiTVT3LtVLMhOhzvmeMkFG7+p7Q8DU2NqEm3QH8qmgCki5KrrhAiDCbsKg2Shbb2SHSPEswmv/SfsD2TgvF5ZG2j1bbNGxVMlh9AohDVBb05w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SU7PrTag; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE764219;
	Thu, 22 Aug 2024 17:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724341479;
	bh=p/Vm87vlP9XYuQzQ5C0tpdtZ2+oVHTKxRgJwzH0dUr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SU7PrTagQdQsFO0Zt77FCfkk69Ukw8gftdP8wFAzXvGoqZIu2rp/onK6kZ19Bs//v
	 aej3pAjiPAmGp1LocMH+4v8W248JmuTBtPybWkf2cDs5UsXP07s/abFgw33BY/PLev
	 S7mc1fE8ZlqjFlOjTm84IvoKmG41L2lr7sBw7ms8=
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
Subject: [PATCH v2 6/7] media: renesas: vsp1: Implement .link_validate() for video devices
Date: Thu, 22 Aug 2024 18:45:30 +0300
Message-ID: <20240822154531.25912-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_subdev_link_validate() helper prints a warning if the
.link_validate() operation is not implemented for video devices
connected to the subdevs. Implement the operation to silence the
warning.

Ideally validation of the link between the video device and the subdev
should be implemented in that operation. That would however break
userspace that does not configure formats on all video devices before
starting streaming. While this mode of operation may not be considered
valid by the V4L2 API specification (interpretation differ), it is
nonetheless supported by the vsp1 driver at the moment and used by at
least the vsp1 unit test suite, and possibly other userspace
applciations. Removing it would be a regression.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_video.c  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index fdb46ec0c872..e728f9f5160e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -1081,6 +1081,27 @@ static const struct v4l2_file_operations vsp1_video_fops = {
 	.mmap = vb2_fop_mmap,
 };
 
+/* -----------------------------------------------------------------------------
+ * Media entity operations
+ */
+
+static int vsp1_video_link_validate(struct media_link *link)
+{
+	/*
+	 * Ideally, link validation should be implemented here instead of
+	 * calling vsp1_video_verify_format() in vsp1_video_streamon()
+	 * manually. That would however break userspace that start one video
+	 * device before configures formats on other video devices in the
+	 * pipeline. This operation is just a no-op to silence the warnings
+	 * from v4l2_subdev_link_validate().
+	 */
+	return 0;
+}
+
+static const struct media_entity_operations vsp1_video_media_ops = {
+	.link_validate = vsp1_video_link_validate,
+};
+
 /* -----------------------------------------------------------------------------
  * Suspend and Resume
  */
@@ -1215,6 +1236,7 @@ struct vsp1_video *vsp1_video_create(struct vsp1_device *vsp1,
 
 	/* ... and the video node... */
 	video->video.v4l2_dev = &video->vsp1->v4l2_dev;
+	video->video.entity.ops = &vsp1_video_media_ops;
 	video->video.fops = &vsp1_video_fops;
 	snprintf(video->video.name, sizeof(video->video.name), "%s %s",
 		 rwpf->entity.subdev.name, direction);
-- 
Regards,

Laurent Pinchart



Return-Path: <linux-media+bounces-16804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB94195F1B3
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97A5A1F20C92
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA9418D645;
	Mon, 26 Aug 2024 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RWPLUEgm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8099C1898F2;
	Mon, 26 Aug 2024 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724676084; cv=none; b=Vlmx+HBZOod0rLCIGh6fpQYoBCwcNCQNld2lHUModXk8UAXv4p72wQQghX/v660FX4x7dKDje+Q5k0UJK+i1h3fttA7JyO6B5itugAEy9prnYDNmBJrV2nVHGSwLgaCJ7G67M+q/BqkNzNzxfunpMH9I+U1gF1ik0xDxJWV/UCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724676084; c=relaxed/simple;
	bh=xnXHdOWz1ePOrNRwz+1c9IdDf589HBsYqT6MdqLoPoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPHtd3tpCHh+Xbwkv3L9ytScEZ/sDBOJfDrkzHyaruhJLxotIvZDMK/FLep83KIAGp6lXdvuZUEhDfvoxxnY/FPjuoc9rA9JqexYfFiFK3sldXp+eghymdmFqUBdAuKvzo7EMA78VDJdtbjsEzmczI8ak+z+LdARD6sc0d9Umes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RWPLUEgm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1D90D4A;
	Mon, 26 Aug 2024 14:40:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724676013;
	bh=xnXHdOWz1ePOrNRwz+1c9IdDf589HBsYqT6MdqLoPoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RWPLUEgmyl4uc7cXRG6mq0sb2plLDGNiLLjeHdlSKqsueCQMKM6fpCPzkazNblsau
	 NYM/hX4hEoYOvgR7AhWS/qQoEdK30UEg6H0Xixd3zaE5Bh7UN/dVEuf+Ru3PEFcnuo
	 I354xqSxR4/B3liTLly/GokwmQ7VbIGLqVfHy2Mg=
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
Subject: [PATCH v3 6/7] media: renesas: vsp1: Implement .link_validate() for video devices
Date: Mon, 26 Aug 2024 15:41:05 +0300
Message-ID: <20240826124106.3823-7-laurent.pinchart+renesas@ideasonboard.com>
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
applications. Removing it would be a regression.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Fix typo in commit message
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



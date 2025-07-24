Return-Path: <linux-media+bounces-38409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B47F6B10D02
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 098491C860D3
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999A32ECE8E;
	Thu, 24 Jul 2025 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pzHa1tjZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845032ECD00;
	Thu, 24 Jul 2025 14:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366274; cv=none; b=EI5+AtrshOzhoMU+ZUpGbsgsoHUT4wwbWqzd8SsRDdZxTxX1VCP8VBzUohceqyAnACuvNLEDdqFFfs0TPgzn73DeSPSUpbX6bafvdcISveIZLG1vZJQ8+qyAsvaNJl4D5l5tDtpQ1i6dsY8L/q5LvMljQ6ficcR8w6aUYUtCnIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366274; c=relaxed/simple;
	bh=Ee9J4mCFwsXOb6mRepzI/4oK3qWzitZE/F4KVxjoUTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gf1YT5xLEaditx84OryF4OlDPOPWAacbmUl57op68L+aP+4nHq5/xscgjPQ+9DaBf0niW+V0xq828S1tgzjZZMPPq8kQnqJbVLMFv2svyeNNTRMOlpW5EmmL8cxnQ1SUHtp40/+apYcoflmU3jqMYWfAlDGizWJl2Nz1aEz2reM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pzHa1tjZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF2DA1C0A;
	Thu, 24 Jul 2025 16:10:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366218;
	bh=Ee9J4mCFwsXOb6mRepzI/4oK3qWzitZE/F4KVxjoUTk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pzHa1tjZMGgYMU078QicAtgwWMuYcA9cnDrSFTuykjJHaoEKfgnLhDSXu5z0QhEpQ
	 jY2bsX5Mv18P89zp/y6H9tdEG/sgVCEI0ob5Ee92O8SBobDukmlGqNtICsnABIJuKu
	 5FNMJ4n9+HP2YVdteavsS1Rc9eQhjvmWcvzDGzxY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:32 +0200
Subject: [PATCH DNI v2 25/27] media: pisp_be: Implement link validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-25-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3786;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Ee9J4mCFwsXOb6mRepzI/4oK3qWzitZE/F4KVxjoUTk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7RDaGW0mIc3AfkJWN26XnOzBGJjJeUiPFQd
 JH2LcAA4PWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0QAKCRByNAaPFqFW
 PG+CD/4mldTV0hLxTaCPPXBaV6zXOSZrS3SQeXmb5Q5F6gOH8g+iZNHcl1hnJbPLgT6JzC0yHiz
 0fzTFmKzPy+AYJY64XeKBKK2UEgcYmPYRAt3GXtd1voVIepfSnhCEPBJ0j7qJoD9034kwsZNzRL
 Jyr//C+HnZJuWF3UHFXyQ5IupxB6fEAiOr+PgRB/b1WfaPMAY27JT1FTaJaDZkGR7cKb9m9ia44
 HUYWIWdP8t55v0R6Cry0RY7hJ+7YTj3kkeKbPimvKx6Cxaix5x7YvJT158VS5N1LSDUpqbt6+A7
 YWS6TveLGCrPaETMcQt0FEfIwwkF6mjoi+ceZkw4iyFe5NTQrK7tc8vNfHCpGyReLlLaFD8iFgh
 REgXFd/j7PMj3C1/Irhgl1W4a6zabgaeZn9VDmBVwridn6YL0lVqjv3lFov53waE5LG6nGEkRYU
 /56Bfb2ae4kbt0UeQXutV0qanklfaV1EOMn3CtrB4flUTj8h3V5/uN7PST8sjwfVF4ixIUuIGOL
 7InbN3r3cbniY64r2sgzC+S/xJGMXVZjEEgz0pv70yOFq6j55sJzh+JYeacaD5qu+VvnSrIW2x/
 RFN3obsvJug96z1KROEyDfSla9RgVWmmBBEdPCIQgigpviGBqVGb+4dTsCrlcZigEhulkBvk58X
 3hUMPlEKlUcYDgg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Implement link validation to validate that the sizes of the format on
the video device matches the size programmed on the ISP subdevice
connected pad.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 22e440f387b5e5560b2cc80a8b3bf6064dc12d7c..2a8c09a9c70952c9f99e542271e994d62392c617 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1362,6 +1362,67 @@ static const struct v4l2_ioctl_ops pispbe_node_ioctl_ops = {
 	.vidioc_streamoff = vb2_ioctl_streamoff,
 };
 
+static int pispbe_link_validate(struct media_link *link)
+{
+	const struct v4l2_mbus_framefmt *sd_fmt;
+	struct v4l2_pix_format_mplane *pix_mp;
+	struct v4l2_subdev_state *state;
+	struct media_entity *vdev_ent;
+	struct media_entity *sd_ent;
+	struct pispbe_node *node;
+	struct v4l2_subdev *sd;
+
+	if (is_media_entity_v4l2_video_device(link->source->entity)) {
+		vdev_ent = link->source->entity;
+		sd_ent = link->sink->entity;
+	} else {
+		sd_ent = link->source->entity;
+		vdev_ent = link->sink->entity;
+	}
+
+	node = container_of(media_entity_to_video_device(vdev_ent),
+			    struct pispbe_node, vfd);
+	switch (node->id) {
+	case TDN_INPUT_NODE:
+		fallthrough;
+	case STITCH_INPUT_NODE:
+		fallthrough;
+	case TDN_OUTPUT_NODE:
+		fallthrough;
+	case STITCH_OUTPUT_NODE:
+		fallthrough;
+	case CONFIG_NODE:
+		/* Skip validation for these nodes. */
+		return 0;
+	}
+	pix_mp = &node->format.fmt.pix_mp;
+
+	sd = media_entity_to_v4l2_subdev(sd_ent);
+	state = v4l2_subdev_get_unlocked_active_state(sd);
+	sd_fmt = v4l2_subdev_state_get_format(state, node->id);
+
+	/* Only check for sizes. */
+	if (pix_mp->width != sd_fmt->width) {
+		dev_dbg(node->pispbe->dev,
+			"%s: width does not match (vdev %u, sd %u)\n",
+			__func__, pix_mp->width, sd_fmt->width);
+		return -EPIPE;
+	}
+
+	if (pix_mp->height != sd_fmt->height) {
+		dev_dbg(node->pispbe->dev,
+			"%s: height does not match (vdev %u, sd %u)\n",
+			__func__, pix_mp->height, sd_fmt->height);
+		return -EPIPE;
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations pispbe_node_entity_ops = {
+	.link_validate = pispbe_link_validate,
+};
+
 static const struct video_device pispbe_videodev = {
 	.name = PISPBE_NAME,
 	.vfl_dir = VFL_DIR_M2M, /* gets overwritten */
@@ -1445,6 +1506,7 @@ static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
 	vdev->device_caps = V4L2_CAP_STREAMING | node_desc[id].caps;
 
 	node->pad.flags = output ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+	entity->ops = &pispbe_node_entity_ops;
 	ret = media_entity_pads_init(entity, 1, &node->pad);
 	if (ret) {
 		dev_err(pispbe->dev,
@@ -1561,6 +1623,10 @@ static const struct v4l2_subdev_internal_ops pispbe_subdev_internal_ops = {
 	.init_state = pispbe_init_state,
 };
 
+static const struct media_entity_operations pispbe_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
 static int pispbe_init_subdev(struct pispbe_dev *pispbe)
 {
 	struct v4l2_subdev *sd = &pispbe->sd;
@@ -1569,6 +1635,7 @@ static int pispbe_init_subdev(struct pispbe_dev *pispbe)
 	v4l2_subdev_init(sd, &pispbe_sd_ops);
 	sd->internal_ops = &pispbe_subdev_internal_ops;
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->entity.ops = &pispbe_subdev_entity_ops;
 	sd->owner = THIS_MODULE;
 	sd->dev = pispbe->dev;
 	strscpy(sd->name, PISPBE_NAME, sizeof(sd->name));

-- 
2.49.0



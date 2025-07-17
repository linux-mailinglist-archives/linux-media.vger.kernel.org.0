Return-Path: <linux-media+bounces-37989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C4BB08B32
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6944C3B61C5
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342552DAFAE;
	Thu, 17 Jul 2025 10:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cQ2dcqSA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1F62D8DBD;
	Thu, 17 Jul 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749186; cv=none; b=K7ZyzdlAC7eX0Am3i9HIaw2POwO7eekzKZtASBFScZ2HvDWdi3Bn1Oqo+eBcPbBsjkNDtCaNJEuAtbabMnAdYm5tC+OxoRiC6j6fGGpxj0ka5UU/PNr9LNDAMDk2XcvVW9r5l0WHpYGK9ihGq6AK2j70d3ZYyJbXqkeDGPKiWlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749186; c=relaxed/simple;
	bh=Ee9J4mCFwsXOb6mRepzI/4oK3qWzitZE/F4KVxjoUTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+q++r9x+7SFo0j5QEPZU9tMfOcYFRHeLqJy8nmWp8KBOP1+KhJtpTLZSj4yg9LRckjOM5T4mxvU6CvVuI3+BcHArUgEt4FhP7GANcyucTid9tlgxrceTOtWWIeOM1jDnZ9QGDnZHef0fiN3Pg4/4NPITSOn1djAXxIA7+IXVhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cQ2dcqSA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39114198D;
	Thu, 17 Jul 2025 12:45:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749145;
	bh=Ee9J4mCFwsXOb6mRepzI/4oK3qWzitZE/F4KVxjoUTk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cQ2dcqSA5NULHDFYF95BOzb2Z9+5jQEIZxGFqamQec1RH/cSXPus8dG4wUAW+JuDl
	 tgIiPG4d9ZvUBt0XZaCrgYAKMYFVllO6gZ6pjztSU6P2KlL+efH+qkhyHJZlJU8LMF
	 uzjGUT62eqiDvb9VY8xNNSLZryTZ2/kDz+W9CyIM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:50 +0200
Subject: [PATCH DNI 24/26] media: pisp_be: Implement link validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-24-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRR8lqbOlQJMHVVCjAWrrf8cZGeJbBx/gxq1
 dWWByn84cOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUQAKCRByNAaPFqFW
 PMdFD/9l8t4aehW6Q1OdtHw9gsMaWhBbA3/zHf/j9Up9Ky3olpwFQQpkb9xaD8oXN7lUHHkZp5P
 bjCX81l5L0bCbiCPSy5KoQITMtxvwg24/VDI2fbbyiP1U4yQwTyeLxuzgldRJkuaBj7BsVZcPP4
 Zo2LEGzbkfAyTHIKHB20mUPXyfSSa09MNRCeoDrpnwS0rs69LGM9MhlbAl619YPcyYP2nGKWu5t
 9a/W+2H1iNFxHGriNqktbAR7ht5LRo8yxHeNUSsmusQOkFrkbEtIMZ/8sz38RROqAUr6lCsOSH5
 5sWctmkRaY6DbGIA6MSZVUdFqcjHYxzAzQLpIw7UPYSFTKu5ma/MXR9F40Z3UYOeMJL8rUImuOZ
 m83BBFza3CUplaCjJ1gyPq2m9hSkrRoIIPjiKgnQPpci1lI/UwINgF0K1qWVQ9n6wiJoqBwU7Pw
 3X/GrcEOEcQ4JbKdbwqSm2z7kgELHym5MpdHmJY78pOP0L9noX7s/oYehA5/0C6QvIGUi6zxrMz
 lKyDl23RPMtmyjEXcCZdmgcr7zAreAbwhb7MqlvdrxQZtjxJ9HaxazaGaoE90LTLINGZMDAz3Jj
 vObO9EtrWQh1We0RrOYpL688ktx7H9KxBDGEEkHEj3fSMvRGAVTW1TkRACfQBgP0uX+OZ6fceEo
 RoZT4adGK6nmaxA==
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



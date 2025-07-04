Return-Path: <linux-media+bounces-36748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFD8AF84BC
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 02:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD71D5464EB
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18291C28E;
	Fri,  4 Jul 2025 00:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DR/Tfezh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A85FF9E8;
	Fri,  4 Jul 2025 00:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751588329; cv=none; b=kgp6rrsRBkb95fceH549aguynIBzn0QiVh1eL06TOUN8n/NZP0ufzbv4mH2p8MIlN286ZaC+GotDmgipoSN9UZUc54FjSib5i8zmp4IPQ6Mm+MfgZd5oIHLhm+DzXRB+feYEEYmyPlI85bF7G4zn58fdyek3yJgXnUpHwOiGPBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751588329; c=relaxed/simple;
	bh=R9a3qWefaseHWqRVdGaolig29jfiJgXESt+3EKJ5qkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mgi0vjF+rI9IelANeYMBUa7J6MDz2Wsi0rhKztEHoYkHbQwf/i9EXPfYyQIOr/cm6KZq6pWrkMIjuB8H+BGBwF2mB7/M+0MqpPU9t9wI5XNtrxb4CR9ku3wItesXzXBlBtWv/Nzl7FeWsEJ+7YpsqVHAOkm/JcTPvMp3fWVeXT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DR/Tfezh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F2D0A157F;
	Fri,  4 Jul 2025 02:18:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751588300;
	bh=R9a3qWefaseHWqRVdGaolig29jfiJgXESt+3EKJ5qkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DR/TfezhtPfzQIsZClOdrvmrKJorwBqXO/714THmVrkm0mOhi2zNPJmGO14fDnZDr
	 QNmqV4RZxI8n9GfGo+OWm0IYgr1TnZWZW07D5jDY23YSKQLI/pat65h1Y76WkCuLbr
	 k59TWUOAWqZ7RJBhc+bs2Up1QnAEY1HdoWu3YpAY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 3/8] media: renesas: vsp1: Fix code checks in frame size enumeration
Date: Fri,  4 Jul 2025 03:18:07 +0300
Message-ID: <20250704001812.30064-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The media bus code passed to the .enum_frame_size() operation for the
sink pad is required to be supported by the device, but not to match the
current format. All entities that use the vsp1_subdev_enum_frame_size()
helper, as well as the SRU and UDS entities that implement the operation
manually, perform the check incorrectly.

Fix the issue by implementing the correct code check in the
vsp1_subdev_enum_frame_size(). For the SRU and UDS, to avoid duplicating
code, use the vsp1_subdev_enum_frame_size() as a base and override the
enumerated size on the source pad with entity-specific constraints.

While at it, include the missing <linux/mutex.h> as the code locks
mutexes.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Include <linux/cleanup.h> and <linux/mutex.h>
---
 .../media/platform/renesas/vsp1/vsp1_entity.c | 49 ++++++++++++-------
 .../media/platform/renesas/vsp1/vsp1_sru.c    | 38 +++++++-------
 .../media/platform/renesas/vsp1/vsp1_uds.c    | 38 +++++++-------
 3 files changed, 64 insertions(+), 61 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 04b7ae6fb935..892a2adfdf3a 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -7,8 +7,10 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gfp.h>
+#include <linux/mutex.h>
 
 #include <media/media-entity.h>
 #include <media/v4l2-ctrls.h>
@@ -238,42 +240,51 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct vsp1_entity *entity = to_vsp1_entity(subdev);
-	struct v4l2_subdev_state *state;
-	struct v4l2_mbus_framefmt *format;
-	int ret = 0;
 
-	state = vsp1_entity_get_state(entity, sd_state, fse->which);
-	if (!state)
+	if (fse->index)
 		return -EINVAL;
 
-	format = v4l2_subdev_state_get_format(state, fse->pad);
-
-	mutex_lock(&entity->lock);
-
-	if (fse->index || fse->code != format->code) {
-		ret = -EINVAL;
-		goto done;
-	}
-
 	if (fse->pad == 0) {
+		unsigned int i;
+
+		for (i = 0; i < entity->num_codes; ++i) {
+			if (fse->code == entity->codes[i])
+				break;
+		}
+
+		if (i == entity->num_codes)
+			return -EINVAL;
+
 		fse->min_width = entity->min_width;
 		fse->max_width = entity->max_width;
 		fse->min_height = entity->min_height;
 		fse->max_height = entity->max_height;
 	} else {
+		struct v4l2_subdev_state *state;
+		struct v4l2_mbus_framefmt *format;
+
+		state = vsp1_entity_get_state(entity, sd_state, fse->which);
+		if (!state)
+			return -EINVAL;
+
 		/*
-		 * The size on the source pad are fixed and always identical to
-		 * the size on the sink pad.
+		 * The media bus code and size on the source pad are fixed and
+		 * always identical to the sink pad.
 		 */
+		format = v4l2_subdev_state_get_format(state, 0);
+
+		guard(mutex)(&entity->lock);
+
+		if (fse->code != format->code)
+			return -EINVAL;
+
 		fse->min_width = format->width;
 		fse->max_width = format->width;
 		fse->min_height = format->height;
 		fse->max_height = format->height;
 	}
 
-done:
-	mutex_unlock(&entity->lock);
-	return ret;
+	return 0;
 }
 
 /*
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
index 1dc34e6a510d..37fd36d09045 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
@@ -7,8 +7,10 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gfp.h>
+#include <linux/mutex.h>
 
 #include <media/v4l2-subdev.h>
 
@@ -116,29 +118,25 @@ static int sru_enum_frame_size(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct vsp1_sru *sru = to_sru(subdev);
-	struct v4l2_subdev_state *state;
-	struct v4l2_mbus_framefmt *format;
-	int ret = 0;
+	int ret;
 
-	state = vsp1_entity_get_state(&sru->entity, sd_state, fse->which);
-	if (!state)
-		return -EINVAL;
+	ret = vsp1_subdev_enum_frame_size(subdev, sd_state, fse);
+	if (ret)
+		return ret;
 
-	format = v4l2_subdev_state_get_format(state, SRU_PAD_SINK);
+	if (fse->pad == SRU_PAD_SOURCE) {
+		struct v4l2_subdev_state *state;
+		struct v4l2_mbus_framefmt *format;
 
-	mutex_lock(&sru->entity.lock);
+		state = vsp1_entity_get_state(&sru->entity, sd_state,
+					      fse->which);
+		if (!state)
+			return -EINVAL;
 
-	if (fse->index || fse->code != format->code) {
-		ret = -EINVAL;
-		goto done;
-	}
+		format = v4l2_subdev_state_get_format(state, SRU_PAD_SINK);
+
+		guard(mutex)(&sru->entity.lock);
 
-	if (fse->pad == SRU_PAD_SINK) {
-		fse->min_width = SRU_MIN_SIZE;
-		fse->max_width = SRU_MAX_SIZE;
-		fse->min_height = SRU_MIN_SIZE;
-		fse->max_height = SRU_MAX_SIZE;
-	} else {
 		fse->min_width = format->width;
 		fse->min_height = format->height;
 		if (format->width <= SRU_MAX_SIZE / 2 &&
@@ -151,9 +149,7 @@ static int sru_enum_frame_size(struct v4l2_subdev *subdev,
 		}
 	}
 
-done:
-	mutex_unlock(&sru->entity.lock);
-	return ret;
+	return 0;
 }
 
 static void sru_try_format(struct vsp1_sru *sru,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
index 8006d49ffbea..dd4722315c56 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
@@ -7,8 +7,10 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gfp.h>
+#include <linux/mutex.h>
 
 #include <media/v4l2-subdev.h>
 
@@ -121,38 +123,32 @@ static int uds_enum_frame_size(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct vsp1_uds *uds = to_uds(subdev);
-	struct v4l2_subdev_state *state;
-	struct v4l2_mbus_framefmt *format;
-	int ret = 0;
+	int ret;
 
-	state = vsp1_entity_get_state(&uds->entity, sd_state, fse->which);
-	if (!state)
-		return -EINVAL;
+	ret = vsp1_subdev_enum_frame_size(subdev, sd_state, fse);
+	if (ret)
+		return ret;
 
-	format = v4l2_subdev_state_get_format(state, UDS_PAD_SINK);
+	if (fse->pad == UDS_PAD_SOURCE) {
+		struct v4l2_subdev_state *state;
+		struct v4l2_mbus_framefmt *format;
 
-	mutex_lock(&uds->entity.lock);
+		state = vsp1_entity_get_state(&uds->entity, sd_state,
+					      fse->which);
+		if (!state)
+			return -EINVAL;
 
-	if (fse->index || fse->code != format->code) {
-		ret = -EINVAL;
-		goto done;
-	}
+		format = v4l2_subdev_state_get_format(state, UDS_PAD_SINK);
+
+		guard(mutex)(&uds->entity.lock);
 
-	if (fse->pad == UDS_PAD_SINK) {
-		fse->min_width = UDS_MIN_SIZE;
-		fse->max_width = UDS_MAX_SIZE;
-		fse->min_height = UDS_MIN_SIZE;
-		fse->max_height = UDS_MAX_SIZE;
-	} else {
 		uds_output_limits(format->width, &fse->min_width,
 				  &fse->max_width);
 		uds_output_limits(format->height, &fse->min_height,
 				  &fse->max_height);
 	}
 
-done:
-	mutex_unlock(&uds->entity.lock);
-	return ret;
+	return 0;
 }
 
 static void uds_try_format(struct vsp1_uds *uds,
-- 
Regards,

Laurent Pinchart



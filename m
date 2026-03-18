Return-Path: <linux-media+bounces-56254-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K8uOXE8u2lmhQIAu9opvQ
	(envelope-from <linux-media+bounces-56254-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 00:59:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D62C3F9E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 00:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 239AD30D704B
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 23:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5860393DDA;
	Wed, 18 Mar 2026 23:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f1nlrbXs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC4A392C34;
	Wed, 18 Mar 2026 23:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878358; cv=none; b=SHYv94p05nzCChUstoxlwptyevSpLwwzOh1RtLVAGEJjL4m6Rsj3tPc6oucIUCs94s5b8Cydya0bQo9MJc7SKzTdEBNM1zioH+og89JT5LZjxwN/h9fpVbUkxl1C2G5cy0YN8kzRCC+53OKmJJmpp+nnIUQli8FoVa2r4r6nfNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878358; c=relaxed/simple;
	bh=prxvKd9e67P3DNVwPH7/qTc7SVzibynIbEyyIwKw4sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R+eClwt8W5gMzRjTT/BrnxIvq1XFXXb5wzXSpW8bfGfgG/tHsNxSbvaW5i2xuwoaNN4xJP0PjNADzZXuD1CoP/EM/2w6poC4jnClrQc8KnU5LUHmg/esOroXRuTKIPMnrozk1qV4eB8hpDEjs23McnCi/Ky8pikdi719HgPOx+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f1nlrbXs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0803E13D3;
	Thu, 19 Mar 2026 00:57:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878280;
	bh=prxvKd9e67P3DNVwPH7/qTc7SVzibynIbEyyIwKw4sE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f1nlrbXs6ZUbsby6wisMnEVMh2ehkBl4NR2Eq4d+sbzZj16XBW7346FIoL6SZptfk
	 /Z+VuPZ8PwZdbTJt157iYQ2NkAn1TCdBO+LyhHMvcEv/M/zSAWe0chN9EJcZ9Fy98W
	 JIs+TARuC+1eoq+534e1bKBXg38V8AAO8Kv/8noA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 03/13] media: renesas: vsp1: Fix code checks in frame size enumeration
Date: Thu, 19 Mar 2026 01:58:57 +0200
Message-ID: <20260318235907.831556-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56254-lists,linux-media=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:email]
X-Rspamd-Queue-Id: 4C1D62C3F9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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



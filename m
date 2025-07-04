Return-Path: <linux-media+bounces-36827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B80AF9163
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 13:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF3293AAAE1
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5752C1595;
	Fri,  4 Jul 2025 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kk5DvUP4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA63B2C158B;
	Fri,  4 Jul 2025 11:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628045; cv=none; b=QSELBb66quw593PhrCAjnxejK6Sc2wZ0M7qVFjhT46Uq1apjSfRy1iXTG3/FFMPCWrRtdaJ61C9xLinEK4xHVdL0tcAXQXxAhl2E7l0fHehuQu9DObh5J4LWkc9HWtMshduuM5mezzs2TZVVwYaWW801ICWW9C5zDhA2Mdxrn4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628045; c=relaxed/simple;
	bh=asRX1TnRW1Wug59NQAt2mgnoh6p4v7dLDnFDjFP/Wes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YV7r/1/HBGfI+8nSupDtar2F1dT03RBcto7eFUiIAUK0tfcuOXyPeksLXnoPe9ddBUdAzHOtI3cB/aixvHALifA9JP+s0/tIZCkBaF2t4VOLy0TzJlewh3zIaImpTbohwT1yEeRoikw75WXvgcys0lllZmtWeh2dn737v8UZwWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kk5DvUP4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E90DE6BE;
	Fri,  4 Jul 2025 13:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751628017;
	bh=asRX1TnRW1Wug59NQAt2mgnoh6p4v7dLDnFDjFP/Wes=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kk5DvUP43AJGnqVZkRD+o/rgJhLWE1L4Q6lenB2ptXYk1qhcVIiI7F4eE1K6CTgt+
	 owneZDix78fX+HAHrMdkMdnxMakQD8JwR9ZwCTs0cIAEn8ZWdlWmzOLIrcD/P/YsUb
	 o8C16Pm1C8Cwbi3P6uuRGtdpA15lIwNEU9flSLe8=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Fri, 04 Jul 2025 12:20:18 +0100
Subject: [PATCH v3 1/5] media: mc: entity: Add pipeline_started/stopped ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-ivc-v3-1-5c45d936ef2e@ideasonboard.com>
References: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
In-Reply-To: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5134;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=asRX1TnRW1Wug59NQAt2mgnoh6p4v7dLDnFDjFP/Wes=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoZ7kHy1A3P4WYZ3q5Lgwk9C9O4ajQi6i7bm8P7
 REs030OcGWJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaGe5BwAKCRDISVd6bEV1
 MqujD/43r3RCM8b6GMFSZn9h6JZd/lsjesumraWpkPKwtYr9hG7lOu5FFe/kFKs6l51+G1EaBOh
 r8cz/eWe3lJD7Si+7NI+nj5Cz/SkVJRmm4U+dRS92LDDpX6uKsAQcnhJoDRZPsqllbaCEriJ2/2
 Bb3SCfMid5u/HUGyjKsfm9+5Bu1iTt/59MVeuEVmRLSFyfAZH6IkCBMXdWOv+5pPLAvHQqd42Yy
 PORHAokTOjfmK3Y9s+HwVjAOcdcAGrwhwe0auU/4ysFVMmwELUr8E8/xLP4rVPfhvcOrhj8Vyz8
 BhGxmJKBV3RbJZQfQdZhXOr6KmPa9dxMOoX9GicUFUuYW3UfDh1flPmxl3qf3TiMyyOl3glxdSQ
 ZknNMjyonWA0Xxplauc/Da5Fd81MRtv8LRDdKVsVItx9wXjRRuGpnojxkzV63M9ENjkAQzdULJE
 +1MpPW0PzkCcx+oyP/ZHIZtbr7nYW33a7XZXqKy5uMFj7vmFMWAQtRl58F6SqYwCI+KPeh09/au
 QqNzY1Li9yJgpN/qIhwkNamOZxSxraaXcTkknFe5yu/d9ByrniCiYBv5gtVYTjs6bN/kR6adEwP
 hSLF+VarLplXgPflXVRPVQQrJik5yO5uwbY2otyuIZtqTtDik08XOZZErOhFtKdLQx5GZ2vux4r
 UKfQbVBFvKJ+p1w==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add two new members to struct media_entity_operations, along with new
functions in media-entity.c to traverse a media pipeline and call the
new operations. The new functions are intended to be used to signal
to a media pipeline that it has fully started, with the entity ops
allowing drivers to define some action to be taken when those
conditions are met.

The combination of the new functions and operations allows drivers
which are part of a multi-driver pipeline to delay actually starting
streaming until all of the conditions for streaming succcessfully are
met across all drivers.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v4:

	- Reverted to having the iter variable

Changes in v3:

	- Dropped the iter variable now that the pipeline entity
	  iterator functions don't need it.
	- Updated documentation to specify Optional and return
	  values

Changes in v2:

	- Refactored media_pipeline_started() such that the cleanup
	  function for media_pipeline_entity_iter is unconditionally
	  called
	- Avoided using media_entity_call() helper for operation that
	  has return type void to avoid compiler warnings
---
 drivers/media/mc/mc-entity.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
 include/media/media-entity.h | 29 ++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 045590905582054c46656e20463271b1f93fa6b4..d3443537d4304e12cb015630101efba22375c011 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1053,6 +1053,52 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
 }
 EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
 
+int media_pipeline_started(struct media_pipeline *pipe)
+{
+	struct media_pipeline_entity_iter iter;
+	struct media_entity *entity;
+	int ret;
+
+	ret = media_pipeline_entity_iter_init(pipe, &iter);
+	if (ret)
+		return ret;
+
+	media_pipeline_for_each_entity(pipe, &iter, entity) {
+		ret = media_entity_call(entity, pipeline_started);
+		if (ret && ret != -ENOIOCTLCMD)
+			break;
+	}
+
+	media_pipeline_entity_iter_cleanup(&iter);
+
+	ret = ret == -ENOIOCTLCMD ? 0 : ret;
+	if (ret)
+		media_pipeline_stopped(pipe);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(media_pipeline_started);
+
+int media_pipeline_stopped(struct media_pipeline *pipe)
+{
+	struct media_pipeline_entity_iter iter;
+	struct media_entity *entity;
+	int ret;
+
+	ret = media_pipeline_entity_iter_init(pipe, &iter);
+	if (ret)
+		return ret;
+
+	media_pipeline_for_each_entity(pipe, &iter, entity)
+		if (entity->ops && entity->ops->pipeline_stopped)
+			entity->ops->pipeline_stopped(entity);
+
+	media_pipeline_entity_iter_cleanup(&iter);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(media_pipeline_stopped);
+
 /* -----------------------------------------------------------------------------
  * Links management
  */
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 64cf590b11343f68a456c5870ca2f32917c122f9..ad658f42357ec505c84d9479bbbf18494da7f939 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -269,6 +269,10 @@ struct media_pad {
  *			media_entity_has_pad_interdep().
  *			Optional: If the operation isn't implemented all pads
  *			will be considered as interdependent.
+ * @pipeline_started:	Notify this entity that the pipeline it is a part of has
+ *			been started
+ * @pipeline_stopped:	Notify this entity that the pipeline it is a part of has
+ *			been stopped
  *
  * .. note::
  *
@@ -284,6 +288,8 @@ struct media_entity_operations {
 	int (*link_validate)(struct media_link *link);
 	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
 				 unsigned int pad1);
+	int (*pipeline_started)(struct media_entity *entity);
+	void (*pipeline_stopped)(struct media_entity *entity);
 };
 
 /**
@@ -1261,6 +1267,29 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
 	     entity != NULL;							\
 	     entity = __media_pipeline_entity_iter_next((pipe), iter, entity))
 
+/**
+ * media_pipeline_started - Inform entities in a pipeline that it has started
+ * @pipe:	The pipeline
+ *
+ * Iterate on all entities in a media pipeline and call their pipeline_started
+ * member of media_entity_operations. Optional.
+ *
+ * Return: zero on success, or a negative error code passed through from an
+ * entity's .pipeline_started() operation.
+ */
+int media_pipeline_started(struct media_pipeline *pipe);
+
+/**
+ * media_pipeline_stopped - Inform entities in a pipeline that it has stopped
+ * @pipe:	The pipeline
+ *
+ * Iterate on all entities in a media pipeline and call their pipeline_stopped
+ * member of media_entity_operations. Optional.
+ *
+ * Return: zero on success, or -ENOMEM if the iterator initialisation failed.
+ */
+int media_pipeline_stopped(struct media_pipeline *pipe);
+
 /**
  * media_pipeline_alloc_start - Mark a pipeline as streaming
  * @pad: Starting pad

-- 
2.34.1



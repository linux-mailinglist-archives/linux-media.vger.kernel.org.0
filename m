Return-Path: <linux-media+bounces-37654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6373B0429A
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0780F188D725
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5E825C80E;
	Mon, 14 Jul 2025 15:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fbzBaB5P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F9E25A333;
	Mon, 14 Jul 2025 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505612; cv=none; b=EfGmafhghqa2pGBoHARzvo5d9o42l/s9KrMF9EEN4XPgHgq5xZ9J5Zh83ZsV1p4ZWYsSnPaqmf8c27HfZ9ben66BKzOj9TCVaTWxhsGsa287F3TOw0sOwm/o0ldhKfDGSqVXXCYVowFwQhw+/ase3D7WDugDnkRkhTqe5Tp7vVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505612; c=relaxed/simple;
	bh=wQF+bIPsZldlAp2gEc1uS1XJHaDZCWa5P/OTC8o+RG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fj0ynsVYGsdMoFhWeUL4geiCcGzH7km5gHI/4vXiB+I9VE/pbYJyWsc/IiiLKntlxy4YgRrC1vk6D0myCzKivd4YnyiEKUS60cY4xGMyPWe+EcTQF7ybSnZSYrfqr6dNhxV6Oquv76SvdfD3WgwtTbJ30wgKAr6fu8h9/v56H8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fbzBaB5P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F3D45304;
	Mon, 14 Jul 2025 17:06:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505573;
	bh=wQF+bIPsZldlAp2gEc1uS1XJHaDZCWa5P/OTC8o+RG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fbzBaB5PipkCMIodWN8ALJbb/dLuj9vxYlF22E3hEYjhWV1D1luVNHvdiSflFXGl4
	 1K+KklcqYvBW0c/dH2Bre4ZOQV7zQpN6822aoYwz6ekSJsqpmjR+lGKFeUTF/V7I0j
	 d2+D/nRLt21Hcidr7/s9Pd8rB3ugI92BCbpA5q4A=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:27 +0100
Subject: [PATCH v11 01/19] media: mc: entity: Add pipeline_started/stopped
 ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-1-bc20e460e42a@ideasonboard.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
In-Reply-To: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5233;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=wQF+bIPsZldlAp2gEc1uS1XJHaDZCWa5P/OTC8o+RG0=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodRz+gGtxck41EbwH+q25Ha98xQJqLw8G3gGqr
 MnMLhIbb1GJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUc/gAKCRDISVd6bEV1
 Mi+8D/0fcoeXNEBK3B/YCvCIU/FjX51xbA9OhnZyjitZfnk+3qrP6qz9Ho7xNayGk64Mk4SIYSK
 HdbceQk8rbRt8+tawtasUQZXb7efIhS7unBsBDIoSnMkciRgLcwr5LooONRylYDj5jTAasjpH6y
 GTWRqF62E/1ebKbEDv2o1TUeDohMJfoJ52mlvM2ChDoCJdxHdIUMnlvdxfqx9wiKSJGKXuUp6Pr
 8a5x5yes11+fcyZNoaWrrYAlUOQAweusX6UxzWyDnls4ZOJyfS1yAnQJg3FsswaCuz8WiOqEyHc
 t1b+PFR37Sfn5CDBHhF/PTx3kjmXgRM3Ezo3Xt7zKmgNC6jBpKuhvIwHlM37hSmVCeQB051rnRc
 ngxJVyhGqu/TobLBcbCnKs6K9gjocc3SizrBF8EtzgYn7weR/YHYnXPwFb9k/bB8dxx5SSjfin/
 8nGd/7O6jxyy82Oqw82CLbMGpci/ZfCbGxiALLdapOrJ4/HQ4jx0fusCq3snoh0w4fm0JFyRfn5
 exc5wNAQz+qjDaJ/QZqr/Jy0hlsG4tOZpRXj/LsioEvFdHcFLIK88Y3HiLljdbaPGCoyXeVNkp3
 ItS3pMxjaQye8fuJhR1ErdC+xHQ5GLropZPNe7Ftb69x9nxLP9mwcdUqCMFdSqnBv4WK14WJxE2
 h7qj5wkRliFxvqA==
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
Changes in v5:

	- Update kerneldoc comments with Optional statement in the
	  right place

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
index 64cf590b11343f68a456c5870ca2f32917c122f9..1e1026f65f2050bb9aa39bde68794da8d2d0a669 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -269,6 +269,10 @@ struct media_pad {
  *			media_entity_has_pad_interdep().
  *			Optional: If the operation isn't implemented all pads
  *			will be considered as interdependent.
+ * @pipeline_started:	Optional: Notify this entity that the pipeline it is a
+ *			part of has been started.
+ * @pipeline_stopped:	Optional: Notify this entity that the pipeline it is a
+ *			part of has been stopped.
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
+ * member of media_entity_operations.
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
+ * member of media_entity_operations.
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



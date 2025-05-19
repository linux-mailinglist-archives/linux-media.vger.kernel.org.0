Return-Path: <linux-media+bounces-32795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E21FABC03E
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 16:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 129847A09FE
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF22C283121;
	Mon, 19 May 2025 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tM2p4O5z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA8A27CCEB
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 14:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663492; cv=none; b=jq540jHugy1kyptCW6Cb6pXlT6vYDtXjov02ihdr2hzGddedw64z/cOeMACmrIg5LOQMZzgtfLfQnemmNnyXBXnMR/lyMelYolaE4lWc+2J/TpPiAFBebfjB3LcSy28XIo7zOxSa4lGDgUyqAnqJuyUJEJu1lInrhgou/40EcSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663492; c=relaxed/simple;
	bh=+h/OrU8IBqpwQZE8iMiuzQOz2whERkeYemDAAK2fsEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t2lI79tE0Q4ySjoB/KSxMP67geKDonGMKt1RckFovq0HGmCcrE7SemHsL6sMiRDsb9y0OOxGKXmyltFsB/FzNo/HxCIhlTZuWdyFF2zCdEkh/yL5RSxjULCxTMnJ8q9pH9Fbpk9w3KRmExAUZzUMvrTtU++bbTFAwU18dX2mKEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tM2p4O5z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6754D21;
	Mon, 19 May 2025 16:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747663467;
	bh=+h/OrU8IBqpwQZE8iMiuzQOz2whERkeYemDAAK2fsEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tM2p4O5z02ebRn2so7/5maEFQ2XrOEJlT1phntTg0dazyhWdYR2EGK7tfKy6xGSPB
	 sf4MCDAXWti1ZtJ/cCVzs5Sbo4uT/zbXKYbqb2iCytV/9g+P2KWU+TKsX7RDWmwSFn
	 n4SlyGVg2xx1nk4lECZKtQtwgae1QPFt5GYS4Er4=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 1/3] media: mc: entity: Add pipeline_started/stopped ops
Date: Mon, 19 May 2025 15:04:01 +0100
Message-Id: <20250519140403.443915-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519140403.443915-1-dan.scally@ideasonboard.com>
References: <20250519140403.443915-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 drivers/media/mc/mc-entity.c | 45 ++++++++++++++++++++++++++++++++++++
 include/media/media-entity.h | 24 +++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 045590905582..e36b1710669d 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1053,6 +1053,51 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
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
+			goto err_notify_stopped;
+	}
+
+	media_pipeline_entity_iter_cleanup(&iter);
+
+	return ret == -ENOIOCTLCMD ? 0 : ret;
+
+err_notify_stopped:
+	media_pipeline_stopped(pipe);
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
+		media_entity_call(entity, pipeline_stopped);
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
index 64cf590b1134..e858326b95cb 100644
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
@@ -1261,6 +1267,24 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
 	     entity != NULL;							\
 	     entity = __media_pipeline_entity_iter_next((pipe), iter, entity))
 
+/**
+ * media_pipeline_started - Inform entities in a pipeline that it has started
+ * @pipe:	The pipeline
+ *
+ * Iterate on all entities in a media pipeline and call their pipeline_started
+ * member of media_entity_operations.
+ */
+int media_pipeline_started(struct media_pipeline *pipe);
+
+/**
+ * media_pipeline_stopped - Inform entities in a pipeline that it has stopped
+ * @pipe:	The pipeline
+ *
+ * Iterate on all entities in a media pipeline and call their pipeline_stopped
+ * member of media_entity_operations.
+ */
+int media_pipeline_stopped(struct media_pipeline *pipe);
+
 /**
  * media_pipeline_alloc_start - Mark a pipeline as streaming
  * @pad: Starting pad
-- 
2.34.1



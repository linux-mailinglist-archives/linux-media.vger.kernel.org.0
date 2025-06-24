Return-Path: <linux-media+bounces-35723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5E7AE5E96
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 900DF189E1CA
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 08:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75ED2561C5;
	Tue, 24 Jun 2025 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jqqQjXXZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52BB230D14
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 08:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752012; cv=none; b=lKZzMvQmdVBDymVtShlI5evl2IC5z8ovVlwTk03Vw3eCOVM4HOg8hlELO8InBidye0wQElJIsq9ji1C2ED6CVtFM3nq6m7zQjPkoLtsxsMjY/vSl8JHREXohSEvKIJ3QUrZuZeO8AkJFyDS0m10WMJJq9QT9D+1ytS+fBWbh9tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752012; c=relaxed/simple;
	bh=97RfXz53yX8AKfp6WG4f7P/GOYXlkhWWARHJFXBQY7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=htF1Yc0p3F3f6EVC2ooQ8ohLkFLsqZUu0R0iBnfz9HFEHN/H2k9HQvod3U1xc72zzS2nW0uADfjGccRSdLmJq48Tm0kIAZIMUKwT0zirPwpVYH6ezqqz688H/1pqJW512cX4m+5TtjUdhIzT5+r2bW0g9bgu2tgGCVuADJCQZb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jqqQjXXZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87587D21;
	Tue, 24 Jun 2025 09:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750751988;
	bh=97RfXz53yX8AKfp6WG4f7P/GOYXlkhWWARHJFXBQY7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jqqQjXXZUAAmLgcLUuWCmRoaWNlReNH86k8wX7XSOc0hMuXUxouE+4SB954l/jDUm
	 H7/e5XxoFyjf4Cey1FeBGGliGyCnxyBuwC9I7ueUNWDLX6qFs3ks/uLdt7GIZ1IP/i
	 N00RXgFRA8v5MiCeQHB6XxnaFLssdtm78Vx6pqnI=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 08:59:50 +0100
Subject: [PATCH v2 1/3] media: mc: entity: Add pipeline_started/stopped ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-media-jobs-v2-1-8e649b069a96@ideasonboard.com>
References: <20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com>
In-Reply-To: <20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, jacopo.mondi@ideasonboard.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4650;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=97RfXz53yX8AKfp6WG4f7P/GOYXlkhWWARHJFXBQY7U=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWlsDYruj/h+ivDw4xTh5jai0CcTKxfWaJPNVN
 GgEbZklAL6JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFpbAwAKCRDISVd6bEV1
 MrtAD/wOTaQb/IT/mFsrTHrW3D6xOfJ4hkUW85YlI/Dbo3d0KbIwdMm9YVdi7d9dEZPUZvE1qJD
 1qJA2kfeByxaCKPM8uYcjolzeLJKUf7FmN5CZN2qizH4dQleZE3nJZpORm/ymb7yPNF2WAe1snE
 EiHm60C6w0/HcIg3IcnqRGib6jKqDtIGrN6pGi2aIVo7wWs3YYJ/IPsSg1tN34IUml3RZvHHR/H
 mM9u6OqNpWo/vCy59GJbTxWrwjH9GsXYqupEj+7SL50f4e5OeQmLf8b5VIn474j0/fBpMGOHALS
 oQ5itG/3CtY3OiSvL7yPlR9JWX/xtFMFlH87BzWJFVwO+EfAOn/vaGwQiq85WjXr8115ZFHiloy
 YHdRY5B+WGjUeXLSbuGuuEpUBpK7jOVJg0zVEPdbxbm9lJ88kbbfM7WktF30jZzD6IB3J85trqh
 L8BaRCLzBesGaiinKnhaUtKIs33dVt4AxOLBHGCZSrjtg2FHoHKX+5L0nDB63j84bFciD/eHOes
 C7vj+gE50twzzLz1Y4c9zi+iNQz/BXcBP6y2T654t9t8uxDvV90a06avvg7dtCJaGXrpjx9da9Q
 ZSc4+yCSYTW0XyxXA4kTJTAUabJSLVL4Z1Ib75wfAihMM3vJyf/TnCDsjoTkX/UhiuF/ltaY2ii
 gRw2ERZ7quiortw==
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
Changes in v2:

	- Refactored media_pipeline_started() such that the cleanup
	  function for media_pipeline_entity_iter is unconditionally
	  called
	- Avoided using media_entity_call() helper for operation that
	  has return type void to avoid compiler warnings
---
 drivers/media/mc/mc-entity.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
 include/media/media-entity.h | 24 +++++++++++++++++++++++
 2 files changed, 70 insertions(+)

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
index 64cf590b11343f68a456c5870ca2f32917c122f9..e858326b95cba6612a123f715af6ea7130a86e15 100644
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



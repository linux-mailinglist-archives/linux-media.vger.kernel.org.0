Return-Path: <linux-media+bounces-36606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A563AF5C84
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 17:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEFCF4A3A03
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 15:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8912930AADA;
	Wed,  2 Jul 2025 15:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qttxOass"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FEE1C3F02
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 15:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469329; cv=none; b=K0Lr/cOL+KMe/PZgUotsaPNXKKNB6l3Gx5+DUUjnjiElcB1PQUefHru0Y47YxFti+RXdMhYMXATfCXKo5k2ZKBE1vQ4QLVrdXAOo/+8YQX0tOUbwcVTKhiKOOU5FsTUoi/iuK5ByuPQ2qRxUVILUfwkSA73dBNd9AjFKbtVZIec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469329; c=relaxed/simple;
	bh=8ZSq3S0K+3iloECjQyZU+sZ2MI9AFgIoeLbYSa8K0Qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o+NXHa2Zz+g5hWCh7D2Ezb7po7Yk6oljt9/WsvBeXkiF0mFmT4ljCxY1DxIHaumNJdVc91dYdhUhxZ2LWkQHaPuJMIsEmifSsYJHCctXW5UIgTDp8+9xlnWRsSt8aweBAWszIcmrt3LQIumpWnAKt/G0ibS2E5N3b3Z8dFDSkXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qttxOass; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A906620EE;
	Wed,  2 Jul 2025 17:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751469299;
	bh=8ZSq3S0K+3iloECjQyZU+sZ2MI9AFgIoeLbYSa8K0Qo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qttxOassmggPorpmrD9aQ07oPDck3cBPkcz43y2+tuFsMefWsZ8PnpK0/O3lbdbMD
	 OFPEojkSUSF9YyPwaGcFG39BCFxI0OMG/NzE+qzJWwD/290ag3LszWtBwiE62vNpsm
	 FQdROXe8UZBV46PShPxk1IgxyF83UFbPe/KvdJXE=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 02 Jul 2025 16:15:04 +0100
Subject: [PATCH 3/4] media: mc: entity: Add pipeline_started/stopped ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-pipelines-v1-3-34525973e773@ideasonboard.com>
References: <20250702-pipelines-v1-0-34525973e773@ideasonboard.com>
In-Reply-To: <20250702-pipelines-v1-0-34525973e773@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4700;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=8ZSq3S0K+3iloECjQyZU+sZ2MI9AFgIoeLbYSa8K0Qo=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoZU0II3h7cdC4SJO60i5Ws+lke4aYxQivrSGZ0
 NMp3gFsGSaJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaGVNCAAKCRDISVd6bEV1
 MvUPEAC3YVaGgwsYrOh32/PoAVfqa3838BxDrm1GztnqrJXvVB5dJBAFBQvGBrWneP7i2q7WkkQ
 Y5m4FJbS62IoK23HOFK54yXrHAzfNvA0OVTRpRACLY+9FgmWyW4LcsC4WooXo2s/9GA0RiZPu3r
 kiClrQTFIwK85mjGL36vaNGUIKEsqEGylsc2Ao/y/lJ7+aL18WmV7OYlEEvfbDJA7Z8pUJxh07o
 MD1gTD6kup1VKDJgkuWKZjDnfbw9h6tKdVKn4p2vE+wo/Rkw/7Cc2W+fGN7YdjY65K/GGm6umHH
 pWc1OvQiJWcbSHYywDFAExmO5brrTtujHRDyFK84qccIdqmMAcNM/jVA86Y08O5TSAKAxOe9Mw6
 vba6qEiAsPZQ26Nilt375r2YlsyrzDvAIitMsMpabF3VZIsGegHQngMs/wPfv/cpt4X3jlFoz0a
 a68DqBQ5fiwCsXpNowe3lFp6xsmDZk7gniKQP7BEWdJAr/Bl04YDZ5yg+Hil60WQB9XtfBvMNvr
 lqqzQqXN/zpzRM5pE8vsLbxJh/VDnNFnA4oVXa6gCzbJMqpsgzp1ivVYnzk63izTzRMwBpcuBGx
 9+q2wyDrAFoGtXB1isHsj4psPHLCNleVnlpNr7xiEb1MuRtzYK0JaVtelKL0KtwL4Gd2wABWS9R
 x95wPBMM6MBwhwA==
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
This commit was originally in the "Add media jobs framework" series
but will now be dropped from there.

Changes in this version:

	- Dropped the iter variable now that the pipeline entity
	  iterator functions don't need it.
	- Updated documentation to specify Optional and return
	  values

Changes in the previous version:

	- Refactored media_pipeline_started() such that the cleanup
	  function for media_pipeline_entity_iter is unconditionally
	  called
	- Avoided using media_entity_call() helper for operation that
	  has return type void to avoid compiler warnings
---
 drivers/media/mc/mc-entity.c | 29 +++++++++++++++++++++++++++++
 include/media/media-entity.h | 27 +++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 30d15a180ad4525e9438083216ac328a4b76653a..64bacb3197a8a6b4af312abfc1ea9e3dfacdc012 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1059,6 +1059,35 @@ __media_pipeline_pad_iter_next(struct media_pipeline *pipe,
 }
 EXPORT_SYMBOL_GPL(__media_pipeline_pad_iter_next);
 
+int media_pipeline_started(struct media_pipeline *pipe)
+{
+	struct media_entity *entity;
+	int ret;
+
+	media_pipeline_for_each_entity(pipe, entity) {
+		ret = media_entity_call(entity, pipeline_started);
+		if (ret && ret != -ENOIOCTLCMD)
+			break;
+	}
+
+	ret = ret == -ENOIOCTLCMD ? 0 : ret;
+	if (ret)
+		media_pipeline_stopped(pipe);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(media_pipeline_started);
+
+void media_pipeline_stopped(struct media_pipeline *pipe)
+{
+	struct media_entity *entity;
+
+	media_pipeline_for_each_entity(pipe, entity)
+		if (entity->ops && entity->ops->pipeline_stopped)
+			entity->ops->pipeline_stopped(entity);
+}
+EXPORT_SYMBOL_GPL(media_pipeline_stopped);
+
 /* -----------------------------------------------------------------------------
  * Links management
  */
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 0f3bad2b9c319b1792bd62fff336bf09c1a42c1b..6e3a97183cc44a084581a941a1b5c02bef38b036 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -271,6 +271,10 @@ struct media_pad {
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
@@ -286,6 +290,8 @@ struct media_entity_operations {
 	int (*link_validate)(struct media_link *link);
 	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
 				 unsigned int pad1);
+	int (*pipeline_started)(struct media_entity *entity);
+	void (*pipeline_stopped)(struct media_entity *entity);
 };
 
 /**
@@ -1231,6 +1237,27 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
 	     entity != NULL;							\
 	     entity = __media_pipeline_entity_iter_next((pipe), entity))
 
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
+ */
+void media_pipeline_stopped(struct media_pipeline *pipe);
+
 /**
  * media_pipeline_alloc_start - Mark a pipeline as streaming
  * @pad: Starting pad

-- 
2.34.1



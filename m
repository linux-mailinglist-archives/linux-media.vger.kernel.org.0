Return-Path: <linux-media+bounces-21287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 105A09C5064
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 09:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAA412854DB
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 08:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A32520B800;
	Tue, 12 Nov 2024 08:17:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E745020B1E1
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 08:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731399451; cv=none; b=E99NaL5NZWIk1LJttTdbi5uwIqZgNcjEA1cvP2ExnDpjOGNLBJS7308GpRP+15l2b8JVFAjVZSi4IjoU5c0b03itUScKmXJIqGpvSqt8Ssmt1gW96bC4h4NKEcoNQYVnSfvGcG2yMbGquGS7rMmjZ2wC2mjO1wIm+vkLnnwPmvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731399451; c=relaxed/simple;
	bh=wqToGPDHzVCGWS/nqBvgyA7CUeLJuRHHi/RWbAz3WKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGpUKdAUYN5twVxJ4HRC14hqS4SJONfrw09Wot573IR5LRheeZDIIDwL5YZbMv7aVhsP0yUimJYoW9DHcvbfbkpOhBvzhfFjiGJqFTUUuR88njyZbbBTm04e9fRjGabm1Reepeq38VeXMqGWyGodtZbkCLUzNRKZFLlu29T494g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB6EC4CED6;
	Tue, 12 Nov 2024 08:17:30 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv3 2/2] media: v4l2-core: v4l2-ctrls: check for handler_new_ref misuse
Date: Tue, 12 Nov 2024 09:14:38 +0100
Message-ID: <ceb570dff6548f01b8acfddc0186bb4b3482a2ac.1731399278.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731399278.git.hverkuil@xs4all.nl>
References: <cover.1731399278.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An out-of-tree driver created a control handler, added controls, then called
v4l2_ctrl_add_handler to add references to controls from another handler, and
finally added another control that happened to have the same control ID as one
of the controls from that other handler.

This caused a NULL pointer crash when an attempt was made to use that last
control.

Besides the fact that two out-of-tree drivers used the same control ID for
different (private) controls, which is obviously a bug, this specific scenario
should have been caught. The root cause is the 'duplicate ID' check in
handler_new_ref(): it expects that drivers will first add all controls to a
control handler before calling v4l2_ctrl_add_handler. That way the local
controls will always override references to controls from another handler.

It never considered the case where new local controls were added after calling
v4l2_ctrl_add_handler. Add a check to handler_new_ref() to return an error in
the case that a new local control is added with the same ID as an existing
control reference. Also use WARN_ON since this is a driver bug.

This situation can only happen when out-of-tree drivers are used or during
driver development, since mainlined drivers all have their own control ranges
reserved in v4l2-controls.h, thus preventing duplicate control IDs.

In addition to this check, also add a WARN_ON if a new control is added to
a local control handler, after v4l2_ctrl_add_handler() was called. For now
just WARN, but this will return an error in the future.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 46 ++++++++++++++++++++---
 include/media/v4l2-ctrls.h                |  5 +++
 2 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index eeab6a5eb7ba..9ecf2e491b61 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1546,6 +1546,7 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
 	hdl->buckets = kvcalloc(hdl->nr_of_buckets, sizeof(hdl->buckets[0]),
 				GFP_KERNEL);
 	hdl->error = hdl->buckets ? 0 : -ENOMEM;
+	hdl->add_handler_called = false;
 	v4l2_ctrl_handler_init_request(hdl);
 	return hdl->error;
 }
@@ -1676,6 +1677,7 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 	u32 class_ctrl = V4L2_CTRL_ID2WHICH(id) | 1;
 	int bucket = id % hdl->nr_of_buckets;	/* which bucket to use */
 	unsigned int size_extra_req = 0;
+	int ret = 0;
 
 	if (ctrl_ref)
 		*ctrl_ref = NULL;
@@ -1719,13 +1721,32 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 	list_for_each_entry(ref, &hdl->ctrl_refs, node) {
 		if (ref->ctrl->id < id)
 			continue;
-		/* Don't add duplicates */
-		if (ref->ctrl->id == id) {
-			kfree(new_ref);
-			goto unlock;
+		/* Check we're not adding a duplicate */
+		if (ref->ctrl->id != id) {
+			list_add(&new_ref->node, ref->node.prev);
+			break;
 		}
-		list_add(&new_ref->node, ref->node.prev);
-		break;
+
+		/*
+		 * If we add a new control to this control handler, and we find
+		 * that it is a duplicate, then that is a driver bug. Warn and
+		 * return an error.
+		 *
+		 * It can be caused by either adding the same control twice, or
+		 * by first calling v4l2_ctrl_add_handler, and then adding a new
+		 * control to this control handler.
+		 *
+		 * Either sequence is incorrect.
+		 *
+		 * However, if the control is owned by another handler, and
+		 * a control with that ID already exists in the list, then we
+		 * can safely skip it: in that case it the control is overridden
+		 * by the existing control.
+		 */
+		if (WARN_ON(hdl == ctrl->handler))
+			ret = -EEXIST;
+		kfree(new_ref);
+		goto unlock;
 	}
 
 insert_in_hash:
@@ -1742,10 +1763,22 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 		 */
 		ctrl->cluster = &new_ref->ctrl;
 		ctrl->ncontrols = 1;
+		/*
+		 * It is a bad idea to add a new control to a handler once
+		 * v4l2_ctrl_add_handler() was called. For now just WARN
+		 * if this happens, but in the future this will be marked
+		 * as an error.
+		 *
+		 * A special exception is made for the control class type.
+		 */
+		if (ctrl->type != V4L2_CTRL_TYPE_CTRL_CLASS)
+			WARN_ON(hdl->add_handler_called);
 	}
 
 unlock:
 	mutex_unlock(hdl->lock);
+	if (ret)
+		return handler_set_err(hdl, ret);
 	return 0;
 }
 
@@ -2197,6 +2230,7 @@ int v4l2_ctrl_add_handler(struct v4l2_ctrl_handler *hdl,
 	if (hdl->error)
 		return hdl->error;
 	mutex_lock(add->lock);
+	hdl->add_handler_called = true;
 	list_for_each_entry(ref, &add->ctrl_refs, node) {
 		struct v4l2_ctrl *ctrl = ref->ctrl;
 
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..e54d4a958cc5 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -381,6 +381,10 @@ struct v4l2_ctrl_ref {
  * @notify_priv: Passed as argument to the v4l2_ctrl notify callback.
  * @nr_of_buckets: Total number of buckets in the array.
  * @error:	The error code of the first failed control addition.
+ * @add_handler_called: v4l2_ctrl_add_handler() was called for this control
+ *		handler. If this is true, then WARN if someone attempts to
+ *		add new controls to this handler. Eventually the WARN will
+ *		be replaced by an error.
  * @request_is_queued: True if the request was queued.
  * @requests:	List to keep track of open control handler request objects.
  *		For the parent control handler (@req_obj.ops == NULL) this
@@ -404,6 +408,7 @@ struct v4l2_ctrl_handler {
 	void *notify_priv;
 	u16 nr_of_buckets;
 	int error;
+	bool add_handler_called;
 	bool request_is_queued;
 	struct list_head requests;
 	struct list_head requests_queued;
-- 
2.45.2



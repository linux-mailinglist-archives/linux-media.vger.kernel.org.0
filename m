Return-Path: <linux-media+bounces-17126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A0596426E
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 12:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10B61B26618
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 10:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E349418FC67;
	Thu, 29 Aug 2024 10:58:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E97C18C92A
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929104; cv=none; b=HycH76NJNezVh9lwiouWy745FMCTBde93no+uoQJ6yCoxfkU3DoR0LLwKsjAt1jUUTFxQWeAgCSbj4jMWHrLXgprxAhxvTdTP1ZhBZDE14XAsK4JPmatvBo5RTS1QVzyEffWcL7I8qtOzdmyeaNj/YyNTXChzkLppWCVOnBBIWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929104; c=relaxed/simple;
	bh=ohHIXhKxXwNXJFI+JOnAESedElO7c/salAEaKQGgO2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxeDhjni2SUIwP7ddh/du+apKhIH8mC0U+P3T1TxSxIJsqq1jEBOVuyvHt1+T+xHCrjXRE33j2M1wevd+UB4brV//4pvaqogZJ6Mt/3W4AM5oE00a6SzpZnubUu4jUY9Ej3C8D6EACfYaB1j516Vb2wZaKJH4xwp9tWX6WeZ66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16875C4CEC5;
	Thu, 29 Aug 2024 10:58:22 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 1/3] media: mc: add manual request completion
Date: Thu, 29 Aug 2024 12:55:37 +0200
Message-ID: <88b5c6aee0e8fe21eb2a045cd5187ae149262720.1724928939.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724928939.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724928939.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default when the last request object is completed, the whole
request completes as well.

But sometimes you want to manually complete a request in a driver,
so add a manual complete mode for this.

In req_queue the driver marks the request for manual completion by
calling media_request_mark_manual_completion, and when the driver
wants to manually complete the request it calls
media_request_manual_complete().

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-request.c | 38 +++++++++++++++++++++++++++++++++--
 include/media/media-request.h | 36 ++++++++++++++++++++++++++++++++-
 2 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index addb8f2d8939..1ad725522a7d 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -54,6 +54,7 @@ static void media_request_clean(struct media_request *req)
 	req->access_count = 0;
 	WARN_ON(req->num_incomplete_objects);
 	req->num_incomplete_objects = 0;
+	req->manual_completion = false;
 	wake_up_interruptible_all(&req->poll_wait);
 }
 
@@ -319,6 +320,7 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
 	req->mdev = mdev;
 	req->state = MEDIA_REQUEST_STATE_IDLE;
 	req->num_incomplete_objects = 0;
+	req->manual_completion = false;
 	kref_init(&req->kref);
 	INIT_LIST_HEAD(&req->objects);
 	spin_lock_init(&req->lock);
@@ -465,7 +467,7 @@ void media_request_object_unbind(struct media_request_object *obj)
 
 	req->num_incomplete_objects--;
 	if (req->state == MEDIA_REQUEST_STATE_QUEUED &&
-	    !req->num_incomplete_objects) {
+	    !req->num_incomplete_objects && !req->manual_completion) {
 		req->state = MEDIA_REQUEST_STATE_COMPLETE;
 		completed = true;
 		wake_up_interruptible_all(&req->poll_wait);
@@ -494,7 +496,7 @@ void media_request_object_complete(struct media_request_object *obj)
 	    WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
 		goto unlock;
 
-	if (!--req->num_incomplete_objects) {
+	if (!--req->num_incomplete_objects && !req->manual_completion) {
 		req->state = MEDIA_REQUEST_STATE_COMPLETE;
 		wake_up_interruptible_all(&req->poll_wait);
 		completed = true;
@@ -505,3 +507,35 @@ void media_request_object_complete(struct media_request_object *obj)
 		media_request_put(req);
 }
 EXPORT_SYMBOL_GPL(media_request_object_complete);
+
+void media_request_manual_complete(struct media_request *req)
+{
+	unsigned long flags;
+	bool completed = false;
+
+	if (WARN_ON(!req))
+		return;
+	if (WARN_ON(!req->manual_completion))
+		return;
+
+	spin_lock_irqsave(&req->lock, flags);
+	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
+		goto unlock;
+
+	req->manual_completion = false;
+	/*
+	 * It is expected that all other objects in this request are
+	 * completed when this function is called. WARN if that is
+	 * not the case.
+	 */
+	if (!WARN_ON(req->num_incomplete_objects)) {
+		req->state = MEDIA_REQUEST_STATE_COMPLETE;
+		wake_up_interruptible_all(&req->poll_wait);
+		completed = true;
+	}
+unlock:
+	spin_unlock_irqrestore(&req->lock, flags);
+	if (completed)
+		media_request_put(req);
+}
+EXPORT_SYMBOL_GPL(media_request_manual_complete);
diff --git a/include/media/media-request.h b/include/media/media-request.h
index 3cd25a2717ce..6434758ab597 100644
--- a/include/media/media-request.h
+++ b/include/media/media-request.h
@@ -56,6 +56,10 @@ struct media_request_object;
  * @access_count: count the number of request accesses that are in progress
  * @objects: List of @struct media_request_object request objects
  * @num_incomplete_objects: The number of incomplete objects in the request
+ * @manual_completion: if true, then the request won't be marked as completed
+ * when @num_incomplete_objects reaches 0. Call media_request_manual_complete()
+ * to set this field to false and complete the request
+ * if @num_incomplete_objects == 0.
  * @poll_wait: Wait queue for poll
  * @lock: Serializes access to this struct
  */
@@ -68,6 +72,7 @@ struct media_request {
 	unsigned int access_count;
 	struct list_head objects;
 	unsigned int num_incomplete_objects;
+	bool manual_completion;
 	wait_queue_head_t poll_wait;
 	spinlock_t lock;
 };
@@ -218,6 +223,35 @@ media_request_get_by_fd(struct media_device *mdev, int request_fd);
 int media_request_alloc(struct media_device *mdev,
 			int *alloc_fd);
 
+/**
+ * media_request_mark_manual_completion - Set manual_completion to true
+ *
+ * @req: The request
+ *
+ * Mark that the request has to be manually completed by calling
+ * media_request_manual_complete().
+ *
+ * This function should be called in the req_queue callback.
+ */
+static inline void
+media_request_mark_manual_completion(struct media_request *req)
+{
+	req->manual_completion = true;
+}
+
+/**
+ * media_request_manual_complete - Set manual_completion to false
+ *
+ * @req: The request
+ *
+ * Set @manual_completion to false, and if @num_incomplete_objects
+ * is 0, then mark the request as completed.
+ *
+ * If there are still incomplete objects in the request, then
+ * WARN for that since that suggests a driver error.
+ */
+void media_request_manual_complete(struct media_request *req);
+
 #else
 
 static inline void media_request_get(struct media_request *req)
@@ -336,7 +370,7 @@ void media_request_object_init(struct media_request_object *obj);
  * @req: The media request
  * @ops: The object ops for this object
  * @priv: A driver-specific priv pointer associated with this object
- * @is_buffer: Set to true if the object a buffer object.
+ * @is_buffer: Set to true if the object is a buffer object.
  * @obj: The object
  *
  * Bind this object to the request and set the ops and priv values of
-- 
2.43.0



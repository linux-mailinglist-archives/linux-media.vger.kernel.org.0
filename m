Return-Path: <linux-media+bounces-47870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CB7C92FF3
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4007534D308
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 19:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A22334371;
	Fri, 28 Nov 2025 19:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ptnia/WQ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50A224A058;
	Fri, 28 Nov 2025 19:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764357419; cv=none; b=quakxbHs0pJ9ycjz8CbbFluaQT54nLfycoVWjj6RbemtA+0DISPPHerSeqBawxqVBg9L2UWsihq+RIqGhRPL1p0BZ1Idn9pzjoyAZHvoACHaE+SbPGWdNJ2gdd9IN23vWVg3EOto4McuCBd97HQL2AgjrYIs7ix+NOamFZN21qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764357419; c=relaxed/simple;
	bh=upYgvQfvCaZv2V+FrW0kF40lwPHlCilL/v6b6lsQpK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z6j2wJIW/rGCwZYsrfZB7BqgUpJj6vCCm48Gulh4HmwL+q1+u+ikvS4OcV9sS5xz403UfVYlAAaGoxQa36EaYGOd3kmjY67PMW5jvdE69CmB011ktiWqSi55QVjJ/XXZ772TkuQCv/aoZfwswSs6MhZrz0HVvguQOTgXAxnL3DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ptnia/WQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764357415;
	bh=upYgvQfvCaZv2V+FrW0kF40lwPHlCilL/v6b6lsQpK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ptnia/WQRwVtMBbwl2kYkC7e0z/G+nUof3Q20uEHAyScBmGdqD89bKnmfy+FseRhw
	 RruMLe8ygcYEKH42LTQ4pAUkLsEn4sOS7fR65iFgHPvFuhvxno3nSII2JDId/VtPQ5
	 22oY3f4fbfTYwt525xx6VrS1eqne1bHupHS3mrPU7+YzDzm9fzK182DZJFWMJ9S9CS
	 WffTGdrujg39Ak+HnlNuecLf7u5qUXyooMdFrtdN6wpKNyquSmUW9mWeqqVmsMPe0y
	 JW4pYmuPWEehxnv24mdoNmjnt2M+Iaed9yXBMT5e/oh27ykNPgFHCiFrl3D1rPGoTQ
	 1Cx6Uem8Izs9Q==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:17:7b4b::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7650117E10F2;
	Fri, 28 Nov 2025 20:16:53 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Fri, 28 Nov 2025 14:16:12 -0500
Subject: [PATCH v4 1/5] media: mc: add manual request completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-1-c166bdd4625c@collabora.com>
References: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-0-c166bdd4625c@collabora.com>
In-Reply-To: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-0-c166bdd4625c@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 linux-media@vger.kernel.org, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.14.2

From: Hans Verkuil <hverkuil@kernel.org>

By default when the last request object is completed, the whole
request completes as well.

But sometimes you want to delay this completion to an arbitrary point in
time so add a manual complete mode for this.

In req_queue the driver marks the request for manual completion by
calling media_request_mark_manual_completion, and when the driver
wants to manually complete the request it calls
media_request_manual_complete().

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/mc/mc-request.c | 41 +++++++++++++++++++++++++++++++++++++++--
 include/media/media-request.h | 38 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index f66f728b1b43dcd1cf51de46e828bf806f014f8d..512e6969152792558537dd8a0736df82847ae210 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -54,6 +54,7 @@ static void media_request_clean(struct media_request *req)
 	req->access_count = 0;
 	WARN_ON(req->num_incomplete_objects);
 	req->num_incomplete_objects = 0;
+	req->manual_completion = false;
 	wake_up_interruptible_all(&req->poll_wait);
 }
 
@@ -313,6 +314,7 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
 	req->mdev = mdev;
 	req->state = MEDIA_REQUEST_STATE_IDLE;
 	req->num_incomplete_objects = 0;
+	req->manual_completion = false;
 	kref_init(&req->kref);
 	INIT_LIST_HEAD(&req->objects);
 	spin_lock_init(&req->lock);
@@ -459,7 +461,7 @@ void media_request_object_unbind(struct media_request_object *obj)
 
 	req->num_incomplete_objects--;
 	if (req->state == MEDIA_REQUEST_STATE_QUEUED &&
-	    !req->num_incomplete_objects) {
+	    !req->num_incomplete_objects && !req->manual_completion) {
 		req->state = MEDIA_REQUEST_STATE_COMPLETE;
 		completed = true;
 		wake_up_interruptible_all(&req->poll_wait);
@@ -488,7 +490,7 @@ void media_request_object_complete(struct media_request_object *obj)
 	    WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
 		goto unlock;
 
-	if (!--req->num_incomplete_objects) {
+	if (!--req->num_incomplete_objects && !req->manual_completion) {
 		req->state = MEDIA_REQUEST_STATE_COMPLETE;
 		wake_up_interruptible_all(&req->poll_wait);
 		completed = true;
@@ -499,3 +501,38 @@ void media_request_object_complete(struct media_request_object *obj)
 		media_request_put(req);
 }
 EXPORT_SYMBOL_GPL(media_request_object_complete);
+
+void media_request_manual_complete(struct media_request *req)
+{
+	bool completed = false;
+	unsigned long flags;
+
+	if (WARN_ON_ONCE(!req))
+		return;
+
+	spin_lock_irqsave(&req->lock, flags);
+
+	if (WARN_ON_ONCE(!req->manual_completion))
+		goto unlock;
+
+	if (WARN_ON_ONCE(req->state != MEDIA_REQUEST_STATE_QUEUED))
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
+
+unlock:
+	spin_unlock_irqrestore(&req->lock, flags);
+	if (completed)
+		media_request_put(req);
+}
+EXPORT_SYMBOL_GPL(media_request_manual_complete);
diff --git a/include/media/media-request.h b/include/media/media-request.h
index bb500b2f9da46f5a9a84272759a137720b094a80..3256fcf3709da58878a59d90722bee3224d97af6 100644
--- a/include/media/media-request.h
+++ b/include/media/media-request.h
@@ -56,6 +56,9 @@ struct media_request_object;
  * @access_count: count the number of request accesses that are in progress
  * @objects: List of @struct media_request_object request objects
  * @num_incomplete_objects: The number of incomplete objects in the request
+ * @manual_completion: if true, then the request won't be marked as completed
+ * when @num_incomplete_objects reaches 0. Call media_request_manual_complete()
+ * to complete the request after @num_incomplete_objects == 0.
  * @poll_wait: Wait queue for poll
  * @lock: Serializes access to this struct
  */
@@ -68,6 +71,7 @@ struct media_request {
 	unsigned int access_count;
 	struct list_head objects;
 	unsigned int num_incomplete_objects;
+	bool manual_completion;
 	wait_queue_head_t poll_wait;
 	spinlock_t lock;
 };
@@ -218,6 +222,38 @@ media_request_get_by_fd(struct media_device *mdev, int request_fd);
 int media_request_alloc(struct media_device *mdev,
 			int *alloc_fd);
 
+/**
+ * media_request_mark_manual_completion - Enable manual completion
+ *
+ * @req: The request
+ *
+ * Mark that the request has to be manually completed by calling
+ * media_request_manual_complete().
+ *
+ * This function shall be called in the req_queue callback.
+ */
+static inline void
+media_request_mark_manual_completion(struct media_request *req)
+{
+	req->manual_completion = true;
+}
+
+/**
+ * media_request_manual_complete - Mark the request as completed
+ *
+ * @req: The request
+ *
+ * This function completes a request that was marked for manual completion by an
+ * earlier call to media_request_mark_manual_completion(). The request's
+ * @manual_completion field is reset to false.
+ *
+ * All objects contained in the request must have been completed previously. It
+ * is an error to call this function otherwise. If such an error occurred, the
+ * function will WARN and the object completion will be delayed until
+ * @num_incomplete_objects is 0.
+ */
+void media_request_manual_complete(struct media_request *req);
+
 #else
 
 static inline void media_request_get(struct media_request *req)
@@ -336,7 +372,7 @@ void media_request_object_init(struct media_request_object *obj);
  * @req: The media request
  * @ops: The object ops for this object
  * @priv: A driver-specific priv pointer associated with this object
- * @is_buffer: Set to true if the object a buffer object.
+ * @is_buffer: Set to true if the object is a buffer object.
  * @obj: The object
  *
  * Bind this object to the request and set the ops and priv values of

-- 
2.51.0



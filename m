Return-Path: <linux-media+bounces-34073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E00ACE58F
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 22:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C3367A2DBF
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 20:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E552221421A;
	Wed,  4 Jun 2025 20:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PAvZ1U9j"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E7C20C488;
	Wed,  4 Jun 2025 20:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067809; cv=none; b=lGEC3/fKGz1IlTfhHHH91CdnD0nO9UEfQTJu6sjFvUuiqz2i4tFS+Yj7szbpYWj2erDYqEut0H4fIBGbLFTppumDdM39Gi0xayVarRp8geRw4P+kV1hUx/wd0ju4hsshRTRbe/DBCUdxe3+sv4WfUSSP9oWEGtxn6AixicDG68Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067809; c=relaxed/simple;
	bh=2v06sXu3RhyrlzfSqsOq6sdxfW6AkWnae7dI01vja4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C8E4AHZ+tnlrFqBIuNYzRNvQc1zL+NgT2f5nVUkBeEUEHJKLLiZSO/6Q9TUYvuH9OThuqENdMs7M9eONxmQvmbiR78sIwroBLuNV7qMImoyJwzhXZW2ge77hrW4WqG4RemzaEjazj16MsdvorfHaL1kGBv7hboIK03tRoyajzGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PAvZ1U9j; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749067799;
	bh=2v06sXu3RhyrlzfSqsOq6sdxfW6AkWnae7dI01vja4w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PAvZ1U9j1EJaOCUQar/GpHDuqejxu2r1D4Wr70g7u1eU7DUBhJZxAt+4/HNAJ77to
	 7iGpwAhpZb+ZNSRlmWEVqSsTc/QUxuwq8SBweph7FJqaUYwfkX0VZRawsUne593tPy
	 vb5A703tkV5aBb/ZQ2iAtPdV6c3VAzHU2pU3XPGt22QmMgtm7ZOq+A2Q3JAxXxZxCI
	 DXRIVHjlVKYbJPdxRoskBBJOufChA7CBjyutgMfO73qVSuNiiW3eDedMpxutRWJPIj
	 gaWiGOG7alIII115yLeNuPVUwDmti3pGEyLG9PaBwB28AlwqOUC1yC4f48OzhCC4XY
	 MBietkJnLd4CA==
Received: from [192.168.13.145] (unknown [IPv6:2606:6d00:10:5285::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0720917E0C37;
	Wed,  4 Jun 2025 22:09:57 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Wed, 04 Jun 2025 16:09:35 -0400
Subject: [PATCH v3 1/5] media: mc: add manual request completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-1-603db4749d90@collabora.com>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
In-Reply-To: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 linux-media@vger.kernel.org, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

From: Hans Verkuil <hverkuil@xs4all.nl>

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
 drivers/media/mc/mc-request.c | 38 ++++++++++++++++++++++++++++++++++++--
 include/media/media-request.h | 38 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index 5edfc2791ce7c7485def5db675bbf53ee223d837..398d0806d1d274eb8c454fc5c37b77476abe1e74 100644
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
@@ -499,3 +501,35 @@ void media_request_object_complete(struct media_request_object *obj)
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
index d4ac557678a78372222704400c8c96cf3150b9d9..7f9af68ef19ac6de0184bbb0c0827dc59777c6dc 100644
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
+ * @manual_completion flag is reset to false.
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
2.49.0



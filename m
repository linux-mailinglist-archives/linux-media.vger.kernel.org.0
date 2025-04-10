Return-Path: <linux-media+bounces-29944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0B6A84830
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 17:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 002FC4C28EC
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 15:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1C91EB9E8;
	Thu, 10 Apr 2025 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="i+bfUBxv"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C9F1E51F1;
	Thu, 10 Apr 2025 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299608; cv=none; b=JWUwUr/b+FOEeyCqpSNYZuwjlYiKKu8juKsAE/4xPNTrr18lRJWXZc2aSppL7A6PL7NH2UB3+/sJtQvSGF86x4MoJ6lztYKpCCum9BFdn9A2qJ+B5LZs84elU37sdjhGb2TJD/q7ODFuyS9jUg0QjnvPFgjIER6jV6aTcB3+AbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299608; c=relaxed/simple;
	bh=AwEPX8xRZVl/NbRRiHiaCstM8T9LhZsmWzpP/mzC7aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELKdYoXOkOSXnp36A/wzjLSCX8EN2Coa6L8sSgAI6BQzp3z6vvVGwwmr6wUXNhfTzONND9V3OR/PGkDIAMEzaOdfv+hlxXbsfibhL2GqXBdAjMfZKb5H5A2nI/oJaevkl2sue1mg8jc7RLa3zoRnsCdxsEGWh0645cvBsr1G6sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=i+bfUBxv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744299603;
	bh=AwEPX8xRZVl/NbRRiHiaCstM8T9LhZsmWzpP/mzC7aQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i+bfUBxvjvm3vHjhHfpTIdy5WslTjCnuLr3tkJDZpxMMasqJ1TJMMHd4IY+fpBbDF
	 5g+KHuxPAzQCGgyxpq0mqNoVSAowbMzYjk3oL5+6xJfsJDDyf+viBfDeFVbH2IJhht
	 gva8KmNtRsZv000LT7+h1/K5IsSt9PSxnLvfdg+PFpGb2MQ5IBk+kxVnt9YBvKX+7s
	 eMIP8e27z/ymVV27CfJBEwfKER4txJGbqMM4xaGvoBIlXdUvSAMuNAitcKS2EB0ukM
	 IDVo+rSedGmgpkO6X4LVPnYVn7aHbJvXA1/ppFTRzrQ8BBUFJHkCFvwqTPp7IXJLP+
	 gVANhGjdTC55A==
Received: from [192.168.13.180] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 077D717E0808;
	Thu, 10 Apr 2025 17:40:01 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 10 Apr 2025 11:39:56 -0400
Subject: [PATCH v2 1/5] media: mc: add manual request completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-1-5b99ec0450e6@collabora.com>
References: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
In-Reply-To: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
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

But sometimes you want to manually complete a request in a driver,
so add a manual complete mode for this.

In req_queue the driver marks the request for manual completion by
calling media_request_mark_manual_completion, and when the driver
wants to manually complete the request it calls
media_request_manual_complete().

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/mc/mc-request.c | 38 ++++++++++++++++++++++++++++++++++++--
 include/media/media-request.h | 36 +++++++++++++++++++++++++++++++++++-
 2 files changed, 71 insertions(+), 3 deletions(-)

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
index d4ac557678a78372222704400c8c96cf3150b9d9..645d18907be7148ca50dcc9248ff06bd8ccdf953 100644
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
2.49.0



Return-Path: <linux-media+bounces-28223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF5A61290
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 14:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD3B53B3100
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 13:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6331FF615;
	Fri, 14 Mar 2025 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="Qv8oUF2x"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAFA2E3398;
	Fri, 14 Mar 2025 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958833; cv=pass; b=SdsDq24Pf91xw2lwysbZMN0bencK5NPW56ahz8jnqLrlUOvi5xTNO6i91pQ8LY7+KsNuJzMmyUbtuJRxF5JL04Dd6CK/5nbQ53vUl1Va7tnVyeqCelBYKEUBwTIb6k4vblk2NovV0JBTkEdbXFqj2ALS7ffT619LC60y43PjeDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958833; c=relaxed/simple;
	bh=sxx9sMpD06poRom5zVC4YKJwk1lBZQxtCTPM3pbmkzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aw5ExEI/bBMVCAjMRaHOLrF7/tMSpUMTDc3lDc/mnNR5qU0pQBv1aW79WMGl9oSp0oAcaeoY62J6kzDyzLQf+CtC3K5ykzGGFfukKLLbpGQhm6YjZBjEGWZVd4W8wEHgpQM3HuuHUgImpgTm8Vk/Xb2UeSduwPltqdko84839ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=Qv8oUF2x; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741958806; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z4W+LsH/yJVY8B2N8xt6Is2fJE82So2XzSPtn7d1dWbqu4KuqlKZPvCJ7kAh5Y0sSRkpbTvljesD5Kw9AVLRWAhGoaDrXRHsyjhGzW0hAc2YgaqajgYYb2ZEoCXbSU89HF1ZB82muum0unsKRvH/5wAqtiqyP1PHJNgWeL1sD84=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741958806; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r5PKoNAd5zdxZnMwzm0dBWgFUNSzx8BJjkS0WWVbCIU=; 
	b=AIinGbWMGyIBE8aBnER/snIY71HEWQQI4rocF/uQhMHT9lXY6UUjTtDCfEx9ipVP5gfgUwHXB0qHzKIxgKX1+8EkLp9SVbHAyIPZeahTwXhHhBH7oWrCXxj2dCLu+eNSMhhKkxXS2t/YvOHhwW7wrZdq6pjdxUIlC4l9M9T/tyQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741958806;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=r5PKoNAd5zdxZnMwzm0dBWgFUNSzx8BJjkS0WWVbCIU=;
	b=Qv8oUF2xoV7SRGHb8WOn1havaIyZS9juaRsefyEHe2dbt1msKRDccagbfNOKPW87
	zTiFnyzdYiHi3wNHHfIuIXKtduni4uLVngjGleHDg05twcBc7y/GTP2+V2hvTdWXAPh
	EjBTzg5QqH8QaO4CUgzNw3Fkl0hWey8tNuOtra6M=
Received: by mx.zohomail.com with SMTPS id 1741958804809871.0776006949541;
	Fri, 14 Mar 2025 06:26:44 -0700 (PDT)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Fri, 14 Mar 2025 14:26:26 +0100
Subject: [PATCH 1/5] media: mc: add manual request completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-1-5e277a3d695b@collabora.com>
References: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com>
In-Reply-To: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741958789; l=5988;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=lUKighMYgVNAExQB5VpogYNcL74ZwJPIAc0FRqQAaq0=;
 b=7wlGUTVZ371dfKFxqOPYsO1RtwsP+gLegIco+T4VVi5ZIkPmx+P08yrYtk3qysCozDkqEurtV
 e2waPI9m/NRCYSojyDp2r85Rx0RLLkTEwFd/KjNugkMM4z2v399MP2y
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

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
2.34.1



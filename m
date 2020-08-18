Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D742487C3
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 16:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgHROhZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 10:37:25 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:43291 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727893AbgHROhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 10:37:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 82jnkV8V2uuXO82jpkcevl; Tue, 18 Aug 2020 16:37:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597761441; bh=xqdJRbuSdQkV7q4CgLZt44sTo7bQDe8a40AMdT92bsM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=ZIUyUvZ/NBaUJij72IeHYZ2mKQL0oeVPbJmBRrsh9EW04NG5srzsCzZnvBaiuRK2Z
         Zv9/CWBXbAMNayYO8zH/6fpPJNyYwykxwHSY50l+n7IdQDJWjNDyZGpxOL5nHOH6+l
         wwkPafx40kN3eqsuuSmua4t9M6AyciPpgocO48hw+OT9H970w/vqfcbm+xVZNTWOWZ
         XJnhIUbrtK9qPYNfXztr6qvHiD+O/N/gMRx1b9s4G1CbsUVk4lVMo4Mc91dxnfm+kN
         Kh9Zh4hj31f9EE/LFZsKCvtY9O8yJQCe/sAMG3CrnhY9cDgafMur2A8X9Cd+252UPe
         5mMce51Eaz+4g==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 06/12] v4l2-ctrls.c: add v4l2_ctrl_request_add_handler
Date:   Tue, 18 Aug 2020 16:37:13 +0200
Message-Id: <20200818143719.102128-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
References: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCuwSrPvT4fumm6uq5Q5WMyOX6OnYFqvqUTKnnAc42oTX5UrWuzWMQXEHZ0Xwab3bjAqBvapkeMtcnah8py0+THUdibAVA3JlkwbJKBA3FfrJVRuZCf9
 MutHBxYoEallZtP/q0OB2XnCJYFdu6h4EqCQrwiCWra8okfqXdZAkac5bbCbmkYM4fe4xJG4EgawT0xEbOL5+hT3oI9SgWjgRVgJ29iPievIqXhZJd6d629a
 vLCVQBuRiPUnJBSOtzjJGfW8g2/2zvya2zTX+mLp3FNEr3SVaCewyR1Wov6ClyHz5BVDVJeeN6e+zXNlMbcW5xoP9uhUmaOfWpjS5OYLoWNoNuaLH/wbAw26
 Wji31XDc
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new v4l2_ctrl_request_add_handler() function that can be called in
req_validate() to add a control handler request object if needed.

This is needed if the driver needs to set controls in the request,

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-request.c        |  3 ++-
 drivers/media/v4l2-core/v4l2-ctrls.c | 35 ++++++++++++++++++++++++++++
 include/media/v4l2-ctrls.h           | 21 +++++++++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index 3b013deaeb06..d66711964429 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -417,7 +417,8 @@ int media_request_object_bind(struct media_request *req,
 
 	spin_lock_irqsave(&req->lock, flags);
 
-	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_UPDATING))
+	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_UPDATING &&
+		    req->state != MEDIA_REQUEST_STATE_VALIDATING))
 		goto unlock;
 
 	obj->req = req;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 3f3fbcd60cc6..8a3f2b2027e4 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -4345,6 +4345,41 @@ void v4l2_ctrl_request_complete(struct media_request *req,
 }
 EXPORT_SYMBOL(v4l2_ctrl_request_complete);
 
+int v4l2_ctrl_request_add_handler(struct media_request *req,
+				  struct v4l2_ctrl_handler *main_hdl,
+				  bool is_ro_request)
+{
+	struct media_request_object *obj;
+	struct v4l2_ctrl_handler *new_hdl;
+	int ret = 0;
+
+	if (!req || !main_hdl)
+		return 0;
+
+	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_VALIDATING))
+		return -EBUSY;
+
+	/* If a request object is found, then do nothing. */
+	obj = media_request_object_find(req, &req_ops, main_hdl);
+	if (obj) {
+		media_request_object_put(obj);
+		return is_ro_request ? -EINVAL : 0;
+	}
+
+	/* Create a new request so the driver can return controls */
+	new_hdl = kzalloc(sizeof(*new_hdl), GFP_KERNEL);
+	if (!new_hdl)
+		return -ENOMEM;
+
+	ret = v4l2_ctrl_handler_init(new_hdl, (main_hdl->nr_of_buckets - 1) * 8);
+	if (!ret)
+		ret = v4l2_ctrl_request_bind(req, new_hdl, main_hdl);
+	if (ret)
+		kfree(new_hdl);
+	return ret;
+}
+EXPORT_SYMBOL(v4l2_ctrl_request_add_handler);
+
 int v4l2_ctrl_request_setup(struct media_request *req,
 			     struct v4l2_ctrl_handler *main_hdl)
 {
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index f40e2cbb21d3..f0ee6f860798 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1254,6 +1254,27 @@ int v4l2_ctrl_request_setup(struct media_request *req,
 void v4l2_ctrl_request_complete(struct media_request *req,
 				struct v4l2_ctrl_handler *parent);
 
+/**
+ * v4l2_ctrl_request_add_handler - Add a control handler request object
+ *
+ * @req: The request
+ * @parent: The parent control handler ('priv' in media_request_object_find())
+ * @is_ro_request: this is a read-only request
+ *
+ * If the user created a request without controls, but the driver wants to
+ * set controls for the request, then this function can be called in the
+ * req_validate function. If there is no control handler object in the
+ * request, then this will add one. Now the driver can set controls
+ * and when v4l2_ctrl_request_complete() is called they will be automatically
+ * copied into the request.
+ *
+ * If @is_ro_request is true, then if there *is* a control handler object
+ * in the request, then this function will return -EINVAL.
+ */
+int v4l2_ctrl_request_add_handler(struct media_request *req,
+				  struct v4l2_ctrl_handler *parent,
+				  bool is_ro_request);
+
 /**
  * v4l2_ctrl_request_hdl_find - Find the control handler in the request
  *
-- 
2.27.0


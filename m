Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 087BE2306E4
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 11:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbgG1Jsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 05:48:55 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:35031 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728466AbgG1Jsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 05:48:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 0ME7kqEDGuuXO0ME9kI7x1; Tue, 28 Jul 2020 11:48:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595929733; bh=KiuHmja982A1wWeL3jylUtfwK2RR88pjKIyDj3lOXqI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=QlsDvb+ljFciPJjvpDlOm6TfYJ42EX9WfuIJQcGaw1oUXj4uW7k1TZbxen0jn4eAi
         xuuzm/+YxkouowyXJRG2sTHnjlK7PEOJxNQE0i87S7FS9jBzFgRwNyiC70wU6hXDJt
         pcbyCLvHVDyE+yay9aSYEdbthzpHh99ZEJ6wImR49eficKPZEmi2hPIOUsjVyBh4zl
         LwbwKCQ39Qd0fI0lB9HI/Lt05EDZ2oklM6Qy68ZUWmc961hLpyK6CeRPHNBEQr9H71
         Zp07UDRo6dTzIdtAvkE+I4RFXsEdk/MPvKFzvvU46RY/UnKn2f74+NtogM+1aQsZH5
         nzbBgb6MbV0Gw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 1/2] v4l2-ctrls.c: add v4l2_ctrl_request_create
Date:   Tue, 28 Jul 2020 11:48:50 +0200
Message-Id: <20200728094851.121933-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728094851.121933-1-hverkuil-cisco@xs4all.nl>
References: <20200728094851.121933-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHzVj9eR94V8IN+XQnKBTLoYkSjzbT6H6XasTrh1RTJY3iucTWtJZyujAS+vnZI9E3dLHazurw3gRLu05k5INnO38/H6SiVdAwVT/yyfNEcfHWF+/wxF
 UxzB+4l3GC3vAMB1++uhbt+YcySSPiyYuj6XOn2Yhc6FSUkQosBoTREwGERtF0aSe3n0kIBtvKWoxVNzKpViNg3SGJSA7sM5VJnCmhxwzlpzCW1/9wGmdXp3
 aKJ+kJlueHWHmrCuYiJWAtlTmhs+bZqIqkmXtLWO0xUfb+yaiEJ7PRdWxPwVMwODHFMYLIMWDmJzKlRaDvtulIbF4lp2OQlbyAo/SNwgDSI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new v4l2_ctrl_request_create() function that can be called in
req_validate() to create a control request object if needed.

This is needed if the driver needs to set controls in the request,

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-request.c        |  3 ++-
 drivers/media/v4l2-core/v4l2-ctrls.c | 35 ++++++++++++++++++++++++++++
 include/media/v4l2-ctrls.h           | 16 +++++++++++++
 3 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index c0782fd96c59..64df83c6f5e5 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -414,7 +414,8 @@ int media_request_object_bind(struct media_request *req,
 
 	spin_lock_irqsave(&req->lock, flags);
 
-	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_UPDATING))
+	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_UPDATING &&
+		    req->state != MEDIA_REQUEST_STATE_VALIDATING))
 		goto unlock;
 
 	obj->req = req;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 3f3fbcd60cc6..0d4c8551ba2a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -4345,6 +4345,41 @@ void v4l2_ctrl_request_complete(struct media_request *req,
 }
 EXPORT_SYMBOL(v4l2_ctrl_request_complete);
 
+int v4l2_ctrl_request_create(struct media_request *req,
+			     struct v4l2_ctrl_handler *main_hdl)
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
+		return 0;
+	}
+
+	/* Create a new request so the driver can return controls */
+	new_hdl = kzalloc(sizeof(*new_hdl), GFP_KERNEL);
+	if (!new_hdl)
+		return -ENOMEM;
+
+	obj = &new_hdl->req_obj;
+	ret = v4l2_ctrl_handler_init(new_hdl, (main_hdl->nr_of_buckets - 1) * 8);
+	if (!ret)
+		ret = v4l2_ctrl_request_bind(req, new_hdl, main_hdl);
+	if (ret)
+		kfree(new_hdl);
+	return ret;
+}
+EXPORT_SYMBOL(v4l2_ctrl_request_create);
+
 int v4l2_ctrl_request_setup(struct media_request *req,
 			     struct v4l2_ctrl_handler *main_hdl)
 {
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index f40e2cbb21d3..2703baa170fa 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1254,6 +1254,22 @@ int v4l2_ctrl_request_setup(struct media_request *req,
 void v4l2_ctrl_request_complete(struct media_request *req,
 				struct v4l2_ctrl_handler *parent);
 
+/**
+ * v4l2_ctrl_request_create - Create a control handler request object
+ *
+ * @req: The request
+ * @parent: The parent control handler ('priv' in media_request_object_find())
+ *
+ * If the user created a request without controls, but the driver wants to
+ * set controls for the request, then this function can be called in the
+ * request's req_validate function. If there is no control object in the
+ * request, then this will create one. Now the driver can set controls
+ * and when v4l2_ctrl_request_complete() is called they will be automatically
+ * copied into the request.
+ */
+int v4l2_ctrl_request_create(struct media_request *req,
+			     struct v4l2_ctrl_handler *parent);
+
 /**
  * v4l2_ctrl_request_hdl_find - Find the control handler in the request
  *
-- 
2.27.0


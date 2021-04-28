Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFFB336D59E
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 12:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239181AbhD1KTc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 06:19:32 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:48417 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239153AbhD1KTb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 06:19:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id bhHFlUpapk1MGbhHJlO0cP; Wed, 28 Apr 2021 12:18:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619605125; bh=98pM3J+qj4Zgdre5g0k837p8P93unag4764/QPxcKx8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=hJ9MApMpi0IXkaS94N7dI4nNNJk6iOrxDZ+Two+a2GPaOonGh87pfisE/yuejNsTi
         TTMnjHY7pPLZ2mu5hk9YZs0cNeIaSSfECM9PhewvR5f6kwIqskF6YBa4gCQkrBAQP+
         t3ZRiKuhHPsiQlRpYIMI/XtWBmK0krVlihClTJ2OIC9YGQJHKdEtS9rhP1e/pWcE3M
         tPrDh1mnJAXjIb4Zrhd0BINXu+nV9NvwGKx1jnHEau/3SSkv4mQo6kqOnKYSvjCei9
         szKm+ZjncdnSXCgtbNcc7nQO4uJ//LJJzP1tYhDmfRuMDttgZQm7akEsFiHrvi7Ous
         nryq6Tex/TB+A==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 1/5] v4l2-ctrls: always copy the controls on completion
Date:   Wed, 28 Apr 2021 12:18:37 +0200
Message-Id: <20210428101841.696059-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428101841.696059-1-hverkuil-cisco@xs4all.nl>
References: <20210428101841.696059-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfByuEbTvMV2rhHditWDUjUTOYLU8/+Pgr/BmhcOouCc0LV68opItVakHC53Ja5EEdQvq3E037ws6IQ4pGdZGiwJRbMgXaKxm/EKDS4xHnn1jbGHz/mZN
 bzdj7acWRkeYgr/uUg7vOt7jY20FhNaPJlxi1t6j+AcrJzcfpOmTHrM9/7TkNVlmWo9y2uT+hA0IMPP/BmvJTTs4o2/0jJCDWWknXOwfaJQo1Q8HOfL4zFdp
 QZAlH0l7l2B6WoM3AieBLno1dayuHyaBe2GXd91m1kdZCLZuPilmOpkb7FJvblmacLWJGyDAUb1Dj7ZaOcvfoA3lGH6YJDZ/pqfeDcuKfvs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When v4l2_ctrl_request_complete() is called and there is no control
handler object found in the request, then create such an object so
that all controls at completion state can be stored and are available
to userspace.

Otherwise any attempt by userspace to read the completed request data
will fail.

If allocating the control handler object failed, then indicate that
by returning ENOMEM when attempting to get the controls from the
completed request instead of returning ENOENT.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 36 ++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 0d7fe1bd975a..d58ac76854bb 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -4073,8 +4073,19 @@ v4l2_ctrls_find_req_obj(struct v4l2_ctrl_handler *hdl,
 	obj = media_request_object_find(req, &req_ops, hdl);
 	if (obj)
 		return obj;
+	/*
+	 * If there are no controls in this completed request,
+	 * then that can only happen if:
+	 *
+	 * 1) no controls were present in the queued request, and
+	 * 2) v4l2_ctrl_request_complete() could not allocate a
+	 *    control handler object to store the completed state in.
+	 *
+	 * So return ENOMEM to indicate that there was an out-of-memory
+	 * error.
+	 */
 	if (!set)
-		return ERR_PTR(-ENOENT);
+		return ERR_PTR(-ENOMEM);
 
 	new_hdl = kzalloc(sizeof(*new_hdl), GFP_KERNEL);
 	if (!new_hdl)
@@ -4085,8 +4096,8 @@ v4l2_ctrls_find_req_obj(struct v4l2_ctrl_handler *hdl,
 	if (!ret)
 		ret = v4l2_ctrl_request_bind(req, new_hdl, hdl);
 	if (ret) {
+		v4l2_ctrl_handler_free(new_hdl);
 		kfree(new_hdl);
-
 		return ERR_PTR(ret);
 	}
 
@@ -4680,8 +4691,25 @@ void v4l2_ctrl_request_complete(struct media_request *req,
 	 * wants to leave the controls unchanged.
 	 */
 	obj = media_request_object_find(req, &req_ops, main_hdl);
-	if (!obj)
-		return;
+	if (!obj) {
+		int ret;
+
+		/* Create a new request so the driver can return controls */
+		hdl = kzalloc(sizeof(*hdl), GFP_KERNEL);
+		if (!hdl)
+			return;
+
+		ret = v4l2_ctrl_handler_init(hdl, (main_hdl->nr_of_buckets - 1) * 8);
+		if (!ret)
+			ret = v4l2_ctrl_request_bind(req, hdl, main_hdl);
+		if (ret) {
+			v4l2_ctrl_handler_free(hdl);
+			kfree(hdl);
+			return;
+		}
+		hdl->request_is_queued = true;
+		obj = media_request_object_find(req, &req_ops, main_hdl);
+	}
 	hdl = container_of(obj, struct v4l2_ctrl_handler, req_obj);
 
 	list_for_each_entry(ref, &hdl->ctrl_refs, node) {
-- 
2.30.2


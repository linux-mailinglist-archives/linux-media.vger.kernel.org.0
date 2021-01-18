Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951DF2F9780
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 02:55:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730970AbhARBzd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 20:55:33 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35736 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730964AbhARBzc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 20:55:32 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6D3431F44A28
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 13/14] media: v4l2-async: Discourage use of v4l2_async_notifier_add_subdev
Date:   Sun, 17 Jan 2021 22:52:57 -0300
Message-Id: <20210118015258.3993-14-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118015258.3993-1-ezequiel@collabora.com>
References: <20210118015258.3993-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most -if not all- use-cases are expected to be covered by one of:
v4l2_async_notifier_add_fwnode_subdev,
v4l2_async_notifier_add_fwnode_remote_subdev or
v4l2_async_notifier_add_i2c_subdev.

We'd like to discourage drivers from using v4l2_async_notifier_add_subdev,
so rename it as __v4l2_async_notifier_add_subdev. This is
typically a good hint for drivers to avoid using the function.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-async.c  | 8 ++++----
 drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
 include/media/v4l2-async.h            | 9 +++++++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 810fa765c0e6..c3bcad01a7b7 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -601,7 +601,7 @@ void v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
 }
 EXPORT_SYMBOL_GPL(v4l2_async_notifier_cleanup);
 
-int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
+int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd)
 {
 	int ret;
@@ -618,7 +618,7 @@ int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 	mutex_unlock(&list_lock);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_subdev);
+EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_subdev);
 
 struct v4l2_async_subdev *
 v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
@@ -635,7 +635,7 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
 	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
 	asd->match.fwnode = fwnode_handle_get(fwnode);
 
-	ret = v4l2_async_notifier_add_subdev(notifier, asd);
+	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
 	if (ret) {
 		fwnode_handle_put(fwnode);
 		kfree(asd);
@@ -685,7 +685,7 @@ v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
 	asd->match.i2c.adapter_id = adapter_id;
 	asd->match.i2c.address = address;
 
-	ret = v4l2_async_notifier_add_subdev(notifier, asd);
+	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
 	if (ret) {
 		kfree(asd);
 		return ERR_PTR(ret);
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 5353e37eb950..919fde20032e 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -833,7 +833,7 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
 	if (ret < 0)
 		goto out_err;
 
-	ret = v4l2_async_notifier_add_subdev(notifier, asd);
+	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
 	if (ret < 0) {
 		/* not an error if asd already exists */
 		if (ret == -EEXIST)
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 7b45427aafb5..d2df7cf407ea 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -129,17 +129,22 @@ struct v4l2_async_notifier {
 void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
 
 /**
- * v4l2_async_notifier_add_subdev - Add an async subdev to the
+ * __v4l2_async_notifier_add_subdev - Add an async subdev to the
  *				notifier's master asd list.
  *
  * @notifier: pointer to &struct v4l2_async_notifier
  * @asd: pointer to &struct v4l2_async_subdev
  *
+ * \warning: Drivers should avoid using this function and instead use one of:
+ * @v4l2_async_notifier_add_fwnode_subdev,
+ * @v4l2_async_notifier_add_fwnode_remote_subdev or
+ * @v4l2_async_notifier_add_i2c_subdev.
+ *
  * Call this function before registering a notifier to link the provided @asd to
  * the notifiers master @asd_list. The @asd must be allocated with k*alloc() as
  * it will be freed by the framework when the notifier is destroyed.
  */
-int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
+int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd);
 
 /**
-- 
2.29.2


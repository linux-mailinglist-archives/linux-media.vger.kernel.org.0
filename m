Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFAAF3ABA70
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 19:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbhFQRRo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 13:17:44 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:38743 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbhFQRRo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 13:17:44 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id CFFE3E0008;
        Thu, 17 Jun 2021 17:15:34 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [RFC 2/4] media: v4l2-async: Add notifier flags
Date:   Thu, 17 Jun 2021 19:16:09 +0200
Message-Id: <20210617171611.80542-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617171611.80542-1-jacopo+renesas@jmondi.org>
References: <20210617171611.80542-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a 'flags' field to the async notifier structure and define the
V4L2_ASYNC_NOTIFIER_SKIP_POST_REGISTER flag.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-async.c |  1 +
 include/media/v4l2-async.h           | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index cd9e78c63791..0836e01e59ca 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -472,6 +472,7 @@ static int v4l2_async_notifier_asd_valid(struct v4l2_async_notifier *notifier,
 void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier)
 {
 	INIT_LIST_HEAD(&notifier->asd_list);
+	notifier->flags = 0;
 }
 EXPORT_SYMBOL(v4l2_async_notifier_init);
 
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 5b275a845c20..3f0627bf8894 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -92,6 +92,13 @@ struct v4l2_async_notifier_operations {
 		       struct v4l2_async_subdev *asd);
 };
 
+/*
+ * Set this flag to instruct the core framework not to call the post_register()
+ * core operation. The driver that registered the notifier will take care to
+ * do so eventually.
+ */
+#define V4L2_ASYNC_NOTIFIER_SKIP_POST_REGISTER		(1U << 0)
+
 /**
  * struct v4l2_async_notifier - v4l2_device notifier data
  *
@@ -103,6 +110,8 @@ struct v4l2_async_notifier_operations {
  * @waiting:	list of struct v4l2_async_subdev, waiting for their drivers
  * @done:	list of struct v4l2_subdev, already probed
  * @list:	member in a global list of notifiers
+ * @flags:	notifier's flags. Can be:
+ * 	%V4L2_ASYNC_NOTIFIER_SKIP_POST_REGISTER
  */
 struct v4l2_async_notifier {
 	const struct v4l2_async_notifier_operations *ops;
@@ -113,6 +122,7 @@ struct v4l2_async_notifier {
 	struct list_head waiting;
 	struct list_head done;
 	struct list_head list;
+	u32 flags;
 };
 
 /**
-- 
2.31.1


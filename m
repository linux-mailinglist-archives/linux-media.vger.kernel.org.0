Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3352D1A45ED
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 13:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgDJLvb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 07:51:31 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49038 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgDJLvb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 07:51:31 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1B42C2A0E84
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 1/3] media: v4l2-ctrls: Add the [__]v4l2_ctrl_s_ctrl_compound() helpers
Date:   Fri, 10 Apr 2020 08:51:11 -0300
Message-Id: <20200410115113.31728-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200410115113.31728-1-ezequiel@collabora.com>
References: <20200410115113.31728-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

VP9 codec drivers will need to set some of their frame context compound
controls. Let's provide the [__]v4l2_ctrl_s_ctrl_compound() helpers to
allow that.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 15 ++++++++++
 include/media/v4l2-ctrls.h           | 43 ++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 93d33d1db4e8..9a8445a9e788 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -4255,6 +4255,21 @@ int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
 }
 EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_area);
 
+int __v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl, const void *data,
+				size_t len)
+{
+	lockdep_assert_held(ctrl->handler->lock);
+
+	/* It's a driver bug if this happens. */
+	WARN_ON(!ctrl->is_ptr || ctrl->type < V4L2_CTRL_COMPOUND_TYPES);
+	if (WARN_ON(len != (ctrl->elem_size * ctrl->elems)))
+		return -EINVAL;
+
+	memcpy(ctrl->p_new.p, data, len);
+	return set_ctrl(NULL, ctrl, 0);
+}
+EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_compound);
+
 void v4l2_ctrl_request_complete(struct media_request *req,
 				struct v4l2_ctrl_handler *main_hdl)
 {
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 7db9e719a583..30c3be7f5efc 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1152,6 +1152,49 @@ static inline int v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
 	return rval;
 }
 
+/**
+ * __v4l2_ctrl_s_ctrl_compound() - Unlocked variant of
+ *				   v4l2_ctrl_s_ctrl_compound().
+ *
+ * @ctrl:	The control.
+ * @data:	The object pointer.
+ * @len:	The object length.
+ *
+ * This sets the control's new compound safely by going through the control
+ * framework. This function assumes the control's handler is already locked,
+ * allowing it to be used from within the &v4l2_ctrl_ops functions.
+ *
+ * This function is for compound type controls only.
+ */
+int __v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl, const void *data,
+				size_t len);
+
+/**
+ * v4l2_ctrl_s_ctrl_compound() - Helper function to set a control's compound
+ *				 value from within a driver.
+ *
+ * @ctrl:	The control.
+ * @data:	The object pointer.
+ * @len:	The object length.
+ *
+ * This sets the control's new compound safely by going through the control
+ * framework. This function will lock the control's handler, so it cannot be
+ * used from within the &v4l2_ctrl_ops functions.
+ *
+ * This function is for compound type controls only.
+ */
+static inline int v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
+					    const void *data, size_t len)
+{
+	int rval;
+
+	v4l2_ctrl_lock(ctrl);
+	rval = __v4l2_ctrl_s_ctrl_compound(ctrl, data, len);
+	v4l2_ctrl_unlock(ctrl);
+
+	return rval;
+}
+
 /* Internal helper functions that deal with control events. */
 extern const struct v4l2_subscribed_event_ops v4l2_ctrl_sub_ev_ops;
 
-- 
2.26.0.rc2


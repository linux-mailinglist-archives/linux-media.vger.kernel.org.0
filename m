Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 305DB11E4B4
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 14:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfLMNcD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 08:32:03 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57736 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfLMNcD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 08:32:03 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E1F76292D3F;
        Fri, 13 Dec 2019 13:32:00 +0000 (GMT)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 1/3] media: v4l2-ctrls: Add the [__]v4l2_ctrl_s_ctrl_compound() helpers
Date:   Fri, 13 Dec 2019 14:31:55 +0100
Message-Id: <20191213133157.105554-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191213133157.105554-1-boris.brezillon@collabora.com>
References: <20191213133157.105554-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VP9 codec drivers will need to set some of their frame context compound
controls. Let's provide the [__]v4l2_ctrl_s_ctrl_compound() helpers to
allow that.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 15 ++++++++++
 include/media/v4l2-ctrls.h           | 43 ++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 2928c5e0a73d..9d5c0242d3e0 100644
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
2.23.0


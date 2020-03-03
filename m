Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14AF41774EE
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 12:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbgCCLCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 06:02:04 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:58841 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728023AbgCCLCD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Mar 2020 06:02:03 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:d0e2:a5af:5d0f:8e60])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 95JIjjGK0EE3q95JJjzPQ0; Tue, 03 Mar 2020 12:02:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583233321; bh=CKcfMbIToKzNQjc+kXY4yhV+jic7THvcvIwi0ZB0XnI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=A1VFIWVuo1QGrlsymZACj8WKDq371CbGK/t+1l5SB1F8HaDkLvACo7XdRht9WYdEg
         ftIl97qLH1fBbOOTaKGwp7Z/acA9yx+8lHKDz2/M86TF2eQknuiiBkTCeU+y2i4JdD
         WKT5OZ+tFe35q4x3iH/BnMgNXKOIoJAbpTHtwHwuaSe3MdjEqkXtTkpQ66jXl3ruhg
         MyXPxryRvbHe/jmUZW0AEVdMQU242zv60O3UH58sCQWK0/jF6ibApZT1LAslydT2K0
         G5ZWAjhdyE7W7eSfCf6iDG5Av5fhHuPPTuW+tlhgwWN+LcevlCO5o/cNLlZI0EQavh
         NwKSDKUO3q7yw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] v4l2-ctrls: add __v4l2_ctrl_s_ctrl_compound()
Date:   Tue,  3 Mar 2020 12:02:00 +0100
Message-Id: <20200303110200.2571176-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303110200.2571176-1-hverkuil-cisco@xs4all.nl>
References: <20200303110200.2571176-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfE3eFw8HVjrTgaSo7BBUWo/XaNk/Alv5sZRNy/PE0NIRm5ujaXkjV6p5ek+GRCKGCc3UPnLPN49fSis0IrGD0mg6icS8SYFv4A1cvwhTBLXnSIVzSUUx
 sQmfe+vNp3v11jO1RMpgxM/fKz3cAnvzqn1EGHk3tEXQ0nfCwtv7TC3dEcQEyjRRU3WCaBGg/IC6M1xv9tP0znR7K47ITGxvXftqQnAgEjkUlXbs8tGMmyAQ
 xldQHRUiTH3s3BzPNzQoGhv3TW5GY8Md53lL+OBUkJdrHfo8NJhEs8Nc/YtjucMzVJbz9ZwGtCOJ0/SxDABgraA8i4kq2fBg+ubfMv24m/zTd+KoisoHIzMK
 2oHgUnZ4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rather than creating new compound control helpers for each new
type, create one generic function and just create defines on
top.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 10 +++---
 include/media/v4l2-ctrls.h           | 49 ++++++++++++++++------------
 2 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index d3bacf6b59d6..68684fcbdc61 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -4248,18 +4248,18 @@ int __v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
 }
 EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_string);
 
-int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
-			    const struct v4l2_area *area)
+int __v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
+				enum v4l2_ctrl_type type, const void *p)
 {
 	lockdep_assert_held(ctrl->handler->lock);
 
 	/* It's a driver bug if this happens. */
-	if (WARN_ON(ctrl->type != V4L2_CTRL_TYPE_AREA))
+	if (WARN_ON(ctrl->type != type))
 		return -EINVAL;
-	*ctrl->p_new.p_area = *area;
+	memcpy(ctrl->p_new.p, p, ctrl->elems * ctrl->elem_size);
 	return set_ctrl(NULL, ctrl, 0);
 }
-EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_area);
+EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_compound);
 
 void v4l2_ctrl_request_complete(struct media_request *req,
 				struct v4l2_ctrl_handler *main_hdl)
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 7db9e719a583..75a8daacb4c4 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1113,45 +1113,54 @@ static inline int v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
 }
 
 /**
- * __v4l2_ctrl_s_ctrl_area() - Unlocked variant of v4l2_ctrl_s_ctrl_area().
+ * __v4l2_ctrl_s_ctrl_compound() - Unlocked variant to set a compound control
  *
- * @ctrl:	The control.
- * @area:	The new area.
+ * @ctrl: The control.
+ * @type: The type of the data.
+ * @p:    The new compound payload.
  *
- * This sets the control's new area safely by going through the control
- * framework. This function assumes the control's handler is already locked,
- * allowing it to be used from within the &v4l2_ctrl_ops functions.
+ * This sets the control's new compound payload safely by going through the
+ * control framework. This function assumes the control's handler is already
+ * locked, allowing it to be used from within the &v4l2_ctrl_ops functions.
  *
- * This function is for area type controls only.
+ * This function is for compound type controls only.
  */
-int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
-			    const struct v4l2_area *area);
+int __v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
+				enum v4l2_ctrl_type type, const void *p);
 
 /**
- * v4l2_ctrl_s_ctrl_area() - Helper function to set a control's area value
- *	 from within a driver.
+ * v4l2_ctrl_s_ctrl_compound() - Helper function to set a compound control
+ *	from within a driver.
  *
- * @ctrl:	The control.
- * @area:	The new area.
+ * @ctrl: The control.
+ * @type: The type of the data.
+ * @p:    The new compound payload.
  *
- * This sets the control's new area safely by going through the control
- * framework. This function will lock the control's handler, so it cannot be
- * used from within the &v4l2_ctrl_ops functions.
+ * This sets the control's new compound payload safely by going through the
+ * control framework. This function will lock the control's handler, so it
+ * cannot be used from within the &v4l2_ctrl_ops functions.
  *
- * This function is for area type controls only.
+ * This function is for compound type controls only.
  */
-static inline int v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
-					const struct v4l2_area *area)
+static inline int v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
+					    enum v4l2_ctrl_type type,
+					    const void *p)
 {
 	int rval;
 
 	v4l2_ctrl_lock(ctrl);
-	rval = __v4l2_ctrl_s_ctrl_area(ctrl, area);
+	rval = __v4l2_ctrl_s_ctrl_compound(ctrl, type, p);
 	v4l2_ctrl_unlock(ctrl);
 
 	return rval;
 }
 
+/* Helper defines for area type controls */
+#define __v4l2_ctrl_s_ctrl_area(ctrl, area) \
+	__v4l2_ctrl_s_ctrl_compound((ctrl), V4L2_CTRL_TYPE_AREA, (area))
+#define v4l2_ctrl_s_ctrl_area(ctrl, area) \
+	v4l2_ctrl_s_ctrl_compound((ctrl), V4L2_CTRL_TYPE_AREA, (area))
+
 /* Internal helper functions that deal with control events. */
 extern const struct v4l2_subscribed_event_ops v4l2_ctrl_sub_ev_ops;
 
-- 
2.25.1


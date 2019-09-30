Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0FD1C1ECA
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 12:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730677AbfI3KSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 06:18:53 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34189 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727497AbfI3KSv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 06:18:51 -0400
Received: by mail-lf1-f67.google.com with SMTP id r22so6599050lfm.1;
        Mon, 30 Sep 2019 03:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oitGYrLz+M7x37417nx+E0ZUEysZsMYgL9DwRrCYv3c=;
        b=KwZIZR/1lZXJxAoiWBpL/3xdUpGveEY5K7jJJRlks1Cv3TBhcPhYsa3E5ABxP5esYJ
         H43WD103uEhUF+pOoKTTJIzGa85KzoCjoofEu8Q7XsTTvQ6dEQUAqRWUEXtBxj4DNr/o
         i8lkTgQVvyvQTJZU1/eQ+a4jYbZjPQI4VIcVqAXGU6kU5GIQyAwdcp/TghP7guSkzraE
         lzOw3C0sapXsgRvJByCtmgEJkkzZMPVhKSnchcc/1QTn1N0ilXku5HlPIVbB9LzjqFb9
         sTc5XvFLKzdlgZ0Z6MVHoS9BEScJF0fFdKiIXWz3DqfhQESz45WAuzcjGXit91PUtXE+
         +pfA==
X-Gm-Message-State: APjAAAVi6FQvifGMPXjx7U87l0j802fFASaRhJufsli4v0l8BmRNmT9J
        CBNypcoAhWwVQQtFKivZHSE=
X-Google-Smtp-Source: APXvYqwnkGg+sTmxTeI40nrqcXxb5XrY6dAjGUikrqBtozoB5kiE9WfKgTFQdnAOOMxMXcbzWnxf4A==
X-Received: by 2002:ac2:495e:: with SMTP id o30mr10706122lfi.82.1569838728794;
        Mon, 30 Sep 2019 03:18:48 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z8sm3805970lfg.18.2019.09.30.03.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 03:18:47 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ricardo@ribalda.com>,
        Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v8 3/8] media: add V4L2_CTRL_TYPE_AREA control type
Date:   Mon, 30 Sep 2019 12:18:36 +0200
Message-Id: <20190930101841.19630-4-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930101841.19630-1-ribalda@kernel.org>
References: <20190930101841.19630-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ricardo Ribalda Delgado <ricardo@ribalda.com>

This type contains the width and the height of a rectangular area.

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 21 ++++++++++++++
 include/media/v4l2-ctrls.h           | 42 ++++++++++++++++++++++++++++
 include/uapi/linux/videodev2.h       |  6 ++++
 3 files changed, 69 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 219d8aeefa20..b9a46f536406 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1678,6 +1678,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
 	void *p = ptr.p + idx * ctrl->elem_size;
+	struct v4l2_area *area;
 
 	switch ((u32)ctrl->type) {
 	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
@@ -1753,6 +1754,11 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		zero_padding(p_vp8_frame_header->entropy_header);
 		zero_padding(p_vp8_frame_header->coder_state);
 		break;
+	case V4L2_CTRL_TYPE_AREA:
+		area = p;
+		if (!area->width || !area->height)
+			return -EINVAL;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -2427,6 +2433,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
 		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
 		break;
+	case V4L2_CTRL_TYPE_AREA:
+		elem_size = sizeof(struct v4l2_area);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
@@ -4116,6 +4125,18 @@ int __v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
 }
 EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_string);
 
+int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
+			    const struct v4l2_area *area)
+{
+	lockdep_assert_held(ctrl->handler->lock);
+
+	/* It's a driver bug if this happens. */
+	WARN_ON(ctrl->type != V4L2_CTRL_TYPE_AREA);
+	memcpy(ctrl->p_new.p_area, area, sizeof(*area));
+	return set_ctrl(NULL, ctrl, 0);
+}
+EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_area);
+
 void v4l2_ctrl_request_complete(struct media_request *req,
 				struct v4l2_ctrl_handler *main_hdl)
 {
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 90a8ee48c2f3..c42f164e2c9e 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -50,6 +50,7 @@ struct poll_table_struct;
  * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
  * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
  * @p_vp8_frame_header:		Pointer to a VP8 frame header structure.
+ * @p_area:			Pointer to an area.
  * @p:				Pointer to a compound value.
  */
 union v4l2_ctrl_ptr {
@@ -68,6 +69,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
 	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
+	struct v4l2_area *p_area;
 	void *p;
 };
 
@@ -1086,6 +1088,46 @@ static inline int v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
 	return rval;
 }
 
+/**
+ * __v4l2_ctrl_s_ctrl_area() - Unlocked variant of v4l2_ctrl_s_ctrl_area().
+ *
+ * @ctrl:	The control.
+ * @area:	The new area.
+ *
+ * This sets the control's new area safely by going through the control
+ * framework. This function assumes the control's handler is already locked,
+ * allowing it to be used from within the &v4l2_ctrl_ops functions.
+ *
+ * This function is for area type controls only.
+ */
+int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
+			    const struct v4l2_area *area);
+
+/**
+ * v4l2_ctrl_s_ctrl_area() - Helper function to set a control's area value
+ *	 from within a driver.
+ *
+ * @ctrl:	The control.
+ * @s:		The new area.
+ *
+ * This sets the control's new area safely by going through the control
+ * framework. This function will lock the control's handler, so it cannot be
+ * used from within the &v4l2_ctrl_ops functions.
+ *
+ * This function is for area type controls only.
+ */
+static inline int v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
+					const struct v4l2_area *area)
+{
+	int rval;
+
+	v4l2_ctrl_lock(ctrl);
+	rval = __v4l2_ctrl_s_ctrl_area(ctrl, area);
+	v4l2_ctrl_unlock(ctrl);
+
+	return rval;
+}
+
 /* Internal helper functions that deal with control events. */
 extern const struct v4l2_subscribed_event_ops v4l2_ctrl_sub_ev_ops;
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 530638dffd93..b3c0961b62a0 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -422,6 +422,11 @@ struct v4l2_fract {
 	__u32   denominator;
 };
 
+struct v4l2_area {
+	__u32   width;
+	__u32   height;
+};
+
 /**
   * struct v4l2_capability - Describes V4L2 device caps returned by VIDIOC_QUERYCAP
   *
@@ -1720,6 +1725,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U8	     = 0x0100,
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
+	V4L2_CTRL_TYPE_AREA          = 0x0106,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.23.0


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8677B9128
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 15:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728738AbfITNwG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 09:52:06 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42660 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728683AbfITNvr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 09:51:47 -0400
Received: by mail-ed1-f68.google.com with SMTP id y91so6476403ede.9;
        Fri, 20 Sep 2019 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A53cv7OvgdQyBG6bMsoa1KhnJmlcJtjTX/OJeLBhmDg=;
        b=ZY/B1H2t8MVWjgpdpSuDEFXET27GOVC93lD66/DJVc0/gSvK4S5PzvBSCyVxE5ZWxI
         kkKHhsnnmn4DkWx+jYEfOHjJRY0Bqd6eHNxNNJXuiX5h7u71OygHyHoz3TrQvx8AHqFS
         9YEyXduWr/nClwmVzXb4fTYG4bIurKdeTvEzJjFy1JJUQJPXcTpdbdiY6ops2XPtFY5y
         pAGTapv5xHc99iucufUrjnl5oPYpWfUnfitLZYbk7mSDoQAUCY+xacqpyjOkVJ7h7lGa
         K8ffr/2OPnMioAWrwuYfbTx25NuOvFx6O0CYwPk/Rbxl7uJ+i1DTpCkHcJqbBZOSAG0X
         ySXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=A53cv7OvgdQyBG6bMsoa1KhnJmlcJtjTX/OJeLBhmDg=;
        b=X4s9B9HAGY04A9bvvcaAGUgnA5nfxdBHKwWkCIMao76NiorlfCjqxwArMKBrjnAKm1
         cIe92y4bvF5eZptg4oFkj9E+2+Wnon2Ic1XtmMJIPEcimU/1Xswx/XjiNGeYbdqt6Emk
         47om88SWe8xptjS36SkrcrEcOQehVj4axvmH85iSmNtooN6ot6/4z2gYjKReiNaNXpVD
         jW4N76jN6gJQW13u1QDgO4nAK4yRwuE/OHOlYbG9T3sTe1hzCzBYYZfAtR/GT6uVXICq
         ZA8I6idf53TaDFt7CZ8oj7RuFk+exMH8b17lsKxo+DmQ88BR1dZx/2oVTQ+f6uhhNIPW
         L8pg==
X-Gm-Message-State: APjAAAU/rpUkQdItYoDleOV2byPVB94j2aRIYxK4qqXYFRe3uac2wA8u
        NXVUhR2tTs4lFCrXZgWaT88=
X-Google-Smtp-Source: APXvYqyNhiILsEPNWuYjIaazG7IcpfbjFDWY19kpeZkc2Zfg8OmGksKwOQHB4LFidYr+27MQPchsyA==
X-Received: by 2002:aa7:d844:: with SMTP id f4mr13405678eds.269.1568987505101;
        Fri, 20 Sep 2019 06:51:45 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id t30sm337673edt.91.2019.09.20.06.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 06:51:43 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v6 3/7] media: add V4L2_CTRL_TYPE_AREA control type
Date:   Fri, 20 Sep 2019 15:51:33 +0200
Message-Id: <20190920135137.10052-4-ricardo@ribalda.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190920135137.10052-1-ricardo@ribalda.com>
References: <20190920135137.10052-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This type contains the width and the height of a rectangular area.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 21 ++++++++++++++
 include/media/v4l2-ctrls.h           | 41 ++++++++++++++++++++++++++++
 include/uapi/linux/videodev2.h       |  6 ++++
 3 files changed, 68 insertions(+)

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
index 4b356df850a1..746969559ef3 100644
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
 
@@ -1085,6 +1087,45 @@ static inline int v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
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


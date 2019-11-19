Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79240102336
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 12:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbfKSLfC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 06:35:02 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:60337 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727638AbfKSLfB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 06:35:01 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X1mbiD68Hcs92X1mciz4So; Tue, 19 Nov 2019 12:34:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574163299; bh=VLMIEcuHY0nyKdvIc0Ue5wwdqJsybSDZZ1nyz4Qqa1o=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=tBugt62NPztRD3dktLugii+GmrmL+1ks6N9cwFjOi++6tGIZlCTv+5KJEGqio4GU6
         paIdR1dGsgbveETz+QyAUdwNjRhNC0tGjeMluShS6TJkzJgwSRWTqEGplZn2DRUYnV
         iu1wH3zBo/d8EOIrKUw6/ScQtYfT394xRBUEYNmAGbfhmAE2ebSq5FEyI6ptGZu/XQ
         AbwItujIjkzlQ/QUd+yAr76cYUs+YcCJBicOaDgPfbBjef9om1QuY7K4a7LUgoJgj+
         hS0zftrMklIHSFwRyvG+JkTPF47UZJpP523L+LZ6CB+ROQ8N6Bdf0HYO57/j811B0U
         ogwsh0QKVcVbA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/5] v4l2-ctrls: add support for v4l2_fract types
Date:   Tue, 19 Nov 2019 12:34:53 +0100
Message-Id: <20191119113457.57833-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
References: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfI3Y7RpXC/Wtf53twy38gnVrmrCf/NxR/mfk5WuOJGz6yvR4rJaOru7QsBt0gc21ygyDJ44w6zvd7OpHENeWMom0uyt5K8y3Vs0NwCrvfM0oB02g0VYV
 lLoX1MSSe/JZ+jXSUHM+DPkUXVtXG9IXkgelmJVvZ1rQrfwMTjkPJfDvHGug6W+diFRvHrFkX2KGnW3jdDRdlbHDIwPFG3YFfKyU/zWDiXliri8tsyFV2T/b
 EvYh774a3AWXTOZpI2S452Uo8/RiYj0KTaKKpHhZVRHsyAWaJDLNaCr1U0F226NFPScRVlvYjtJxZUI6VQCP0g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The stateful encoder drivers need a fraction type in order to set
the desired frame rate with the required precision.

Add support for this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/uapi/v4l/vidioc-g-ext-ctrls.rst     |  5 +++
 .../media/uapi/v4l/vidioc-queryctrl.rst       |  6 +++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/v4l2-core/v4l2-ctrls.c          | 22 ++++++++++
 include/media/v4l2-ctrls.h                    | 44 ++++++++++++++++++-
 include/uapi/linux/videodev2.h                |  2 +
 6 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst b/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
index 271cac18afbb..fbb42e73b821 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
@@ -203,6 +203,11 @@ still cause this situation.
       - ``p_area``
       - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_AREA``.
+    * -
+      - :c:type:`v4l2_fract` *
+      - ``p_fract``
+      - A pointer to a struct :c:type:`v4l2_fract`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_FRACT``.
     * -
       - void *
       - ``ptr``
diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
index 6690928e657b..d4e3d2a71f56 100644
--- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
+++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
@@ -449,6 +449,12 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_area`, containing the width and the height
         of a rectangular area. Units depend on the use case.
+    * - ``V4L2_CTRL_TYPE_FRACT``
+      - any
+      - n/a
+      - any
+      - A struct :c:type:`v4l2_fract`, containing the numerator and the
+	denominator of the fraction.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index cb6ccf91776e..49df65d162a0 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -145,6 +145,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_FRACT :c:type:`v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 2928c5e0a73d..28a5d153d18c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1716,6 +1716,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
 	struct v4l2_area *area;
+	struct v4l2_fract *fract;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
 
@@ -1863,6 +1864,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CTRL_TYPE_FRACT:
+		fract = p;
+		if (!fract->denominator)
+			return -EINVAL;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -2549,6 +2556,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
+	case V4L2_CTRL_TYPE_FRACT:
+		elem_size = sizeof(struct v4l2_fract);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
@@ -4255,6 +4265,18 @@ int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
 }
 EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_area);
 
+int __v4l2_ctrl_s_ctrl_fract(struct v4l2_ctrl *ctrl,
+			     const struct v4l2_fract *fract)
+{
+	lockdep_assert_held(ctrl->handler->lock);
+
+	/* It's a driver bug if this happens. */
+	WARN_ON(ctrl->type != V4L2_CTRL_TYPE_FRACT);
+	*ctrl->p_new.p_fract = *fract;
+	return set_ctrl(NULL, ctrl, 0);
+}
+EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_fract);
+
 void v4l2_ctrl_request_complete(struct media_request *req,
 				struct v4l2_ctrl_handler *main_hdl)
 {
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 7db9e719a583..aefd62831bc8 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -54,7 +54,8 @@ struct poll_table_struct;
  * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
  * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
  * @p_hevc_slice_params:	Pointer to an HEVC slice parameters structure.
- * @p_area:			Pointer to an area.
+ * @p_area:			Pointer to a struct v4l2_area.
+ * @p_fract:			Pointer to a struct v4l2_fract.
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
  */
@@ -78,6 +79,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
 	struct v4l2_area *p_area;
+	struct v4l2_fract *p_fract;
 	void *p;
 	const void *p_const;
 };
@@ -1152,6 +1154,46 @@ static inline int v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
 	return rval;
 }
 
+/**
+ * __v4l2_ctrl_s_ctrl_fract() - Unlocked variant of v4l2_ctrl_s_ctrl_fract().
+ *
+ * @ctrl:	The control.
+ * @fract:	The new fraction.
+ *
+ * This sets the control's new fraction safely by going through the control
+ * framework. This function assumes the control's handler is already locked,
+ * allowing it to be used from within the &v4l2_ctrl_ops functions.
+ *
+ * This function is for fraction type controls only.
+ */
+int __v4l2_ctrl_s_ctrl_fract(struct v4l2_ctrl *ctrl,
+			     const struct v4l2_fract *fract);
+
+/**
+ * v4l2_ctrl_s_ctrl_fract() - Helper function to set a control's fraction value
+ *	 from within a driver.
+ *
+ * @ctrl:	The control.
+ * @fract:	The new fraction.
+ *
+ * This sets the control's new fraction safely by going through the control
+ * framework. This function will lock the control's handler, so it cannot be
+ * used from within the &v4l2_ctrl_ops functions.
+ *
+ * This function is for area type controls only.
+ */
+static inline int v4l2_ctrl_s_ctrl_fract(struct v4l2_ctrl *ctrl,
+					 const struct v4l2_fract *fract)
+{
+	int rval;
+
+	v4l2_ctrl_lock(ctrl);
+	rval = __v4l2_ctrl_s_ctrl_fract(ctrl, fract);
+	v4l2_ctrl_unlock(ctrl);
+
+	return rval;
+}
+
 /* Internal helper functions that deal with control events. */
 extern const struct v4l2_subscribed_event_ops v4l2_ctrl_sub_ev_ops;
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 04481c717fee..2b584c69e619 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1685,6 +1685,7 @@ struct v4l2_ext_control {
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
 		struct v4l2_area __user *p_area;
+		struct v4l2_fract __user *p_fract;
 		void __user *ptr;
 	};
 } __attribute__ ((packed));
@@ -1731,6 +1732,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
+	V4L2_CTRL_TYPE_FRACT         = 0x0107,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.23.0


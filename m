Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16A9A52B289
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 08:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbiERGYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 02:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbiERGYi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 02:24:38 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E87AECFE1A
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 23:24:35 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 135-20020a25058d000000b0064dd6bc9cfdso1030430ybf.23
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 23:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=stuv/D9l6oJDzk76OgRPiSyEIQsu87NgpOe8oeEFinQ=;
        b=J0SqpXhyFhNz+h02OZbLKmxvUktpKZ5KwfUyNdPTOg38qCdNsJwPinfG0HpjYzChKv
         ct4uoUZTmDylF5oiT/K9JpxmL9liYfw940VLM7UMPtAl8SNrgo5XIMfioqnIsWdxQAnl
         3Vrai4iFhM+fp98sI+mJSiBhIywENCtf7qihhAHvdj8irTx0J1KU0ULAx82TZgv1EzDe
         ySWDneVUlC0ALUyVve4lu+qB7cRbpPrRzAgid5hUnmMq36naiSAvFx1NvRHOIPYb/FY5
         IMiiGlmjKLnPvpYi2z78Z0PQQ8CNgcr1TIjuP2Zj5qRT7FWx7rkrsdAawCzL+xHK3sF3
         IDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=stuv/D9l6oJDzk76OgRPiSyEIQsu87NgpOe8oeEFinQ=;
        b=b6bDvyP/VuFfjjdfpdvIHhuVDjbEwwMX7zLCoO33BrHj5f5fZAmu8yE9vvjWw+ce7l
         0KeUmFyTfOKTjxRghE/tboDFSNr6dSUCK64LCBZi3YwhfY61m8rT+5AVi6yJH1BLrF66
         8OsN7/vPf3i6wiE41118F2ScjDFFM2fUDlvDXJ7+/Jhlai0vDt7wFQEdfSwoZPwzj6jU
         JoyDRN9/fEjhIGCcNr51q6+mnQRCR1td0e4w5OML3okX9K2hW2T4W4aKh0YfyqCNcOig
         bmWeZhCKOSHQISm837otSvCtm/5ZJvoF33tbaWQh8QTG6OdB2OJNR1rtvyrfk4k2Lhwd
         uu+g==
X-Gm-Message-State: AOAM530IMc76sSjwfSk1XBJ3MtqJZppfRGWY6JDOy1K/2M/NafaEy3Bx
        2iz2RtT9GId/Ld6PsX0WJI5hKlUyGss=
X-Google-Smtp-Source: ABdhPJyjB1BKB9Jjcsw8lHHwj+qqZYDhJdS2tqlEYRnu5OvnJ8U2MMeTYh6Kj0PD4MybcoXzbr7mpVinEpI=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d4d4:2a73:fa69:7d32])
 (user=yunkec job=sendgmr) by 2002:a25:7717:0:b0:64d:854f:2da4 with SMTP id
 s23-20020a257717000000b0064d854f2da4mr14508127ybc.633.1652855075195; Tue, 17
 May 2022 23:24:35 -0700 (PDT)
Date:   Wed, 18 May 2022 15:24:07 +0900
In-Reply-To: <20220518062412.2375586-1-yunkec@google.com>
Message-Id: <20220518062412.2375586-2-yunkec@google.com>
Mime-Version: 1.0
References: <20220518062412.2375586-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v3 1/6] media: v4l2_ctrl: Add region of interest rectangle control
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Including:
1. Add a control ID.
2. Add p_rect to struct v4l2_ext_control with basic support in
   v4l2-ctrls.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v2:
- Better documentation.

 .../media/v4l/ext-ctrls-camera.rst            | 10 ++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 ++++
 include/media/v4l2-ctrls.h                    |  2 ++
 include/uapi/linux/v4l2-controls.h            |  2 ++
 include/uapi/linux/videodev2.h                |  2 ++
 8 files changed, 45 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index 4c5061aa9cd4..c988a72b97b2 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -661,3 +661,13 @@ enum v4l2_scene_mode -
 .. [#f1]
    This control may be changed to a menu control in the future, if more
    options are required.
+
+``V4L2_CID_REGION_OF_INTEREST_RECT (struct)``
+   This control determines the region of interest. Region of interest is an
+   rectangular area represented by a struct v4l2_rect. The rectangle is in
+   pixel units and global coordinates. Use ``V4L2_CTRL_WHICH_MIN_VAL`` and
+   ``V4L2_CTRL_WHICH_MAX_VAL`` to query the range of coordinates.
+
+   Setting a region of interest allows the camera to optimize the capture for
+   the region. The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control
+   determines the detailed behavior.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 29971a45a2d4..f4e205ead0a2 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -189,6 +189,10 @@ still cause this situation.
       - ``p_area``
       - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_AREA``.
+    * - struct :c:type:`v4l2_rect` *
+      - ``p_area``
+      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_RECT``.
     * - struct :c:type:`v4l2_ctrl_h264_sps` *
       - ``p_h264_sps``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 9cbb7a0c354a..7b423475281d 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -147,6 +147,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 8968cec8454e..dcde405c2713 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -84,6 +84,11 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
 		return ptr1.p_u16[idx] == ptr2.p_u16[idx];
 	case V4L2_CTRL_TYPE_U32:
 		return ptr1.p_u32[idx] == ptr2.p_u32[idx];
+	case V4L2_CTRL_TYPE_RECT:
+		return ptr1.p_rect->top == ptr2.p_rect->top &&
+		       ptr1.p_rect->left == ptr2.p_rect->left &&
+		       ptr1.p_rect->height == ptr2.p_rect->height &&
+		       ptr1.p_rect->width == ptr2.p_rect->width;
 	default:
 		if (ctrl->is_int)
 			return ptr1.p_s32[idx] == ptr2.p_s32[idx];
@@ -307,6 +312,11 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_VP9_FRAME:
 		pr_cont("VP9_FRAME");
 		break;
+	case V4L2_CTRL_TYPE_RECT:
+		pr_cont("l: %d, t: %d, w: %u, h: %u",
+			ptr.p_rect->left, ptr.p_rect->top,
+			ptr.p_rect->width, ptr.p_rect->height);
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
@@ -525,6 +535,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
 	struct v4l2_area *area;
+	struct v4l2_rect *rect;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
 
@@ -888,6 +899,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CTRL_TYPE_RECT:
+		rect = p;
+		if (!rect->width || !rect->height)
+			return -EINVAL;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -1456,6 +1473,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
+	case V4L2_CTRL_TYPE_RECT:
+		elem_size = sizeof(struct v4l2_rect);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 54ca4e6b820b..95f39a2d2ad2 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1042,6 +1042,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
 	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
 	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
+	case V4L2_CID_REGION_OF_INTEREST_RECT:  return "Region Of Interest Rectangle";
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1524,6 +1525,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_REGION_OF_INTEREST_RECT:
+		*type = V4L2_CTRL_TYPE_RECT;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index b3ce438f1329..919e104de50b 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -58,6 +58,7 @@ struct video_device;
  * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level structure.
  * @p_hdr10_mastering:		Pointer to an HDR10 Mastering Display structure.
  * @p_area:			Pointer to an area.
+ * @p_rect:			Pointer to a rectangle.
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
  */
@@ -87,6 +88,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_area *p_area;
+	struct v4l2_rect *p_rect;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index bb40129446d4..499fcddb6254 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1008,6 +1008,8 @@ enum v4l2_auto_focus_range {
 
 #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
 
+#define V4L2_CID_REGION_OF_INTEREST_RECT	(V4L2_CID_CAMERA_CLASS_BASE+36)
+
 /* FM Modulator class control IDs */
 
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3768a0a80830..b712412cf763 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1751,6 +1751,7 @@ struct v4l2_ext_control {
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
 		struct v4l2_area __user *p_area;
+		struct v4l2_rect __user *p_rect;
 		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
 		struct v4l2_ctrl_h264_pps *p_h264_pps;
 		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
@@ -1810,6 +1811,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
+	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
 	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
 	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
-- 
2.36.0.550.gb090851708-goog


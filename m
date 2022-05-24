Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43EE7532240
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 06:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbiEXEp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 00:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234480AbiEXEpX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 00:45:23 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770898BD22
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 21:45:22 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id k17-20020a252411000000b0064ea6c388baso14044137ybk.0
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 21:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=I80/fQubht4j0oULJ1oTwqaO+keAESvjBTyhSyKRb4g=;
        b=ioZQZTztiKT6qrZ9rmJWhFxu/vER1/K/OGi4VfCulNnz6arolb89oq6ScHFnWWZyfY
         ow0KIURUG5/pb7fphKYKHvS03Mjoh3wThr6CiwWrR46qtLi6BQ69RfgoyMRCCxwS7f/Z
         n1/CShK+sYlDdZzcgdeRlcSnmTJ1u5zc7QcNdgZ4zqIU9FdTOWl+ncJFkj4o7KMEdwTa
         ORoyG7hxDLTnOkwf2A65u5filBrRCX5f9MVPH9dZkd9LdMl9yYtM1cPI8fkf00bZePdd
         3Hsbcmnf8qwwnLL1dKJAKt+xCNwuWX73LEd4KhShI6ekVphn/aKz+eb1bXHLmjPVedBR
         NbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=I80/fQubht4j0oULJ1oTwqaO+keAESvjBTyhSyKRb4g=;
        b=bLfPo4D9shKLg3lO/EEHOgWs0VqLPPhKRpvu+80l34p7huSJWn2zp1VjVtE8hLBYHR
         sYCvswvZPE2KM+YyHlAKHkNdkdy/tveKcoF42G9jCgSwDP+lYyDzxtWIZwnIWT2C8jWi
         MMuoTB3OKEohB5m5RRXdow1QGVX9xiTUxFgsBScj3VAPxUasPT3xZ1uSnIlH/e7nYRvX
         qlTI7stMHQSIsFNwCuNKOBX/zDnteauVoaN3c221zyeAOurCsk7JBA6HLjV+Bffw5njV
         Aul1L4YUHex4eJvFy6FBR6Rd/zmFj7vU/Nq6Q0RMnkAZyTNUIJQ+727onnStolRlsOE1
         Osog==
X-Gm-Message-State: AOAM532U01gUBtvDIWmydWgDyDbIyv0jKTVqJOeb8kK/zfxehkk04mvw
        7kjFWLhbOHlFg9ujU0i+G16BPbH5m34=
X-Google-Smtp-Source: ABdhPJzgjYQUuxF9rox9NS4FvagGiS41bZ1UeEBu5RbHQ8cUhBleoWg6Lo3eg8169iD/oBqXertzGir8l94=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7145:c41f:bdd2:acc])
 (user=yunkec job=sendgmr) by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr26340850ywi.449.1653367521639; Mon, 23
 May 2022 21:45:21 -0700 (PDT)
Date:   Tue, 24 May 2022 13:45:04 +0900
In-Reply-To: <20220524044507.1696012-1-yunkec@google.com>
Message-Id: <20220524044507.1696012-2-yunkec@google.com>
Mime-Version: 1.0
References: <20220524044507.1696012-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [PATCH v4 1/4] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
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

Add p_rect to struct v4l2_ext_control with basic support in
v4l2-ctrls.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++++++
 include/media/v4l2-ctrls.h                    |  2 ++
 include/uapi/linux/videodev2.h                |  2 ++
 5 files changed, 29 insertions(+)

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
index 8968cec8454e..384d12a9638b 100644
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
+		pr_cont("%ux%u@%dx%d",
+			ptr.p_rect->width, ptr.p_rect->height,
+			ptr.p_rect->left, ptr.p_rect->top);
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
2.36.1.124.g0e6072fb45-goog


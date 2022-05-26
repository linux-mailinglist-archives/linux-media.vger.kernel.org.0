Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 897ED534A1D
	for <lists+linux-media@lfdr.de>; Thu, 26 May 2022 07:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343865AbiEZFID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 May 2022 01:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbiEZFIA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 May 2022 01:08:00 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B620BA563
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 22:07:59 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-2ff3eeb2dfbso4781827b3.4
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 22:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=AfZX1+CDv7TYTtk+/zTrfmxKxnns4bMQ2dZq4OSa7SA=;
        b=V6KBRtqicESPBc3CC03HoVqopf5S5Y7sbOVpVfHWYHPbdbf8ARzQqpeeLvAuxPeqWz
         uNZWaJMhAeyhoEehjHR71URge2WBM8gfZinM1AKRRrJ272mGf6RSkew/4OE60VKlS3uq
         7B6RHKI8K1JsJFAGe/xkfrPH1uavDpvgI+fMjVImWu9pOZfD4A4v2oTvh0AYi2TCilTI
         baTcFZtHReVDmFvL6LqUP8CDF6tOuYOITcp0Raf7ZAmn+fA4Qj8LSI0OfDwxrYZ7qLcA
         PQFVkjDzdDnfG/tQb8GZYz4PM/9xpyJqAykaPXs/nWJGWoxgebhuqkjnw/f4ROT1KuDq
         mLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=AfZX1+CDv7TYTtk+/zTrfmxKxnns4bMQ2dZq4OSa7SA=;
        b=ccw6tGlTb2UnxXwp+U5+uBnGg0AMUPHqQtMffp9QlG9dlU1fOhrvi8ckivawHf/Fz5
         IGlSzMlaLWgs2Xa5q3AlA6OLt0bKs0OfF4TCPNkZqotDO1e3vWlC7PWI2IwNSz9qCXg1
         Z1Rb3TwFUTMRULN+1kRUNVhhYVBk151/F9n4FWsb0ylw/R9GZ4GTVCowooCKtAcl5kF+
         sWSly1Seyk8galMj3ax5tJYLLJrpsRTcUs5mbZAJ0Sy+xFkGNKrohjIcBey6sgEW7v2/
         JUl9uh8fh4b259VdSeoLovVpHeB9lvdIbHyXMTu+JhUW420S0U2vA6YsIGAwzfVEZxxu
         RzHg==
X-Gm-Message-State: AOAM531QPVE31j9+3ydd9zkoud/oOocCk9+sZWWpaIKIozAPtk5dSkq5
        hE8DMDPBCE1kj3gBWEy7eNjfObsAX5I=
X-Google-Smtp-Source: ABdhPJwXchNMhVg+yX314J1ZrTsdKRH+XevZQMy5PfZEX6EMBe9plrp6T0qjBH1hTeRPuKuoReAF/noyvJQ=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:9e5b:ab60:68b2:d628])
 (user=yunkec job=sendgmr) by 2002:a05:6902:120c:b0:64f:a22c:75e1 with SMTP id
 s12-20020a056902120c00b0064fa22c75e1mr21786311ybu.311.1653541678424; Wed, 25
 May 2022 22:07:58 -0700 (PDT)
Date:   Thu, 26 May 2022 14:07:40 +0900
In-Reply-To: <20220526050744.2431518-1-yunkec@google.com>
Message-Id: <20220526050744.2431518-2-yunkec@google.com>
Mime-Version: 1.0
References: <20220526050744.2431518-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [PATCH v5 1/5] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
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
Changelog since v4:
- Fix typo.
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++++++
 include/media/v4l2-ctrls.h                    |  2 ++
 include/uapi/linux/videodev2.h                |  2 ++
 5 files changed, 29 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 29971a45a2d4..7473baa4e977 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -189,6 +189,10 @@ still cause this situation.
       - ``p_area``
       - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_AREA``.
+    * - struct :c:type:`v4l2_rect` *
+      - ``p_rect``
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


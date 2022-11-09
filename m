Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B92206223AE
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 07:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiKIGGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 01:06:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiKIGGf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 01:06:35 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDBAB1F62F
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 22:06:33 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id j132-20020a25238a000000b006da635e2073so2403179ybj.2
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 22:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VYWH1c6Nd0APRYPnEa36YuiudVHOD0QPuMkxq6dv5hA=;
        b=ZF5YO3U62sjm0xCdbhWYmWVC9tN6rXwtGP2YEYlvmLDzxKNHc1DqZhRWYYXLsRebU8
         EXe6b/z9+xf6qv7fE9JNx2BMrwf6rOI/Esgx+IPtkQByh/6BohrrxEv0ttv0t1jfXefx
         dP+FmDr/fXJphZv7S55nE8QdJ9/q6f1h+ejJRTCnGi/CynhtmaIf0xCoZMrtXtw27yL0
         ytV8ChyPwZ2/DNfFFtv2LEMaTt7ji+gvDwGiiv12pDLUqYH8UB34nQ8+cAXiwKX6zOnB
         gCb3Kav+K7x9Zwf+WcMXkcf+M6CYCGByskwecTPSevUAq+AqVKp8i/Sr0A6Zt7ksWHBA
         9c7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYWH1c6Nd0APRYPnEa36YuiudVHOD0QPuMkxq6dv5hA=;
        b=clSwMGTNRv44P6ATW1xCJN6inZZgYQKB0dyA626oAcGntp147NEtfWplh+A6RrwNv4
         APSWTLm6jt0buyJ/VnsjvA/6b4ehyHvo6i7HBysEl2NiqsXCqRFlVCwoYC9p9nqViqaK
         UBGkPtVskEZ0Mbjhx119fu8fF9bz7FWwCXdUiweqZGZrcmlpLC59eqwLUI9Oj6K6Qqjc
         wC0S2vFAxmF/x0JMbPdam08fBMHIhqRnKzg78MMUivl0CrQvnXvGXsJqyuw5oZ32ghDR
         Sc2dnRroMtfucBIyzN+H8TEMTpzmj4GpLKYa94z/7wrel/w8Eijup28gZsJeHWMnr8o7
         dSWw==
X-Gm-Message-State: ACrzQf3Lx4KQhz3rr8nkC/5smlarjp2/P/RI0zkzgt2AMpRZ1MoZkGBI
        GJNL/whbtiMiHT8JGt91Xp8+R1rT3Ts=
X-Google-Smtp-Source: AMsMyM5xcY5/QhI8y/svMcaDYlMsqOBuwmykcbNEQLhJtv9/ronGj87/R77EAIbJ6QpiDPnUdNNmOgixaqc=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:124f:15d3:a305:3dbf])
 (user=yunkec job=sendgmr) by 2002:a05:6902:1186:b0:6c1:653a:ba74 with SMTP id
 m6-20020a056902118600b006c1653aba74mr55722622ybu.546.1667973993129; Tue, 08
 Nov 2022 22:06:33 -0800 (PST)
Date:   Wed,  9 Nov 2022 15:06:11 +0900
In-Reply-To: <20221109060621.704531-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221109060621.704531-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221109060621.704531-2-yunkec@google.com>
Subject: [PATCH v10 01/11] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add p_rect to struct v4l2_ext_control with basic support in
v4l2-ctrls.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v9:
- No Change.
Changelog since v8:
- No change.
Changelog since v7:
- Document V4L2_CTRL_TYPE_RECT in vidioc-queryctrl.rst.
- Rebased to media-stage master.
- Do not assign each field in std_equal.

 .../media/v4l/vidioc-g-ext-ctrls.rst              |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst  |  7 +++++++
 .../media/videodev2.h.rst.exceptions              |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c         | 15 +++++++++++++++
 include/media/v4l2-ctrls.h                        |  2 ++
 include/uapi/linux/videodev2.h                    |  2 ++
 6 files changed, 31 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 892cfeb8b988..927ef397f1ce 100644
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
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index a20dfa2a933b..58982cd382e3 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -441,6 +441,13 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_area`, containing the width and the height
         of a rectangular area. Units depend on the use case.
+    * - ``V4L2_CTRL_TYPE_RECT``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_rect`, containing a rectangle described by
+	the position of its top-left corner, the width and the height. Units
+	depend on the use case.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 2a589d34b80e..828cca8e2daa 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -150,6 +150,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 0dab1d7b90f0..0ac36ebc45dd 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -350,6 +350,11 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
 		pr_cont("HEVC_DECODE_PARAMS");
 		break;
+	case V4L2_CTRL_TYPE_RECT:
+		pr_cont("%ux%u@%dx%d",
+			ptr.p_rect->width, ptr.p_rect->height,
+			ptr.p_rect->left, ptr.p_rect->top);
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
@@ -569,6 +574,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
 	struct v4l2_area *area;
+	struct v4l2_rect *rect;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
 
@@ -918,6 +924,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
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
@@ -1605,6 +1617,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
index e59d9a234631..1846caf9dd53 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -52,6 +52,7 @@ struct video_device;
  * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level structure.
  * @p_hdr10_mastering:		Pointer to an HDR10 Mastering Display structure.
  * @p_area:			Pointer to an area.
+ * @p_rect:			Pointer to a rectangle.
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
  */
@@ -81,6 +82,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_area *p_area;
+	struct v4l2_rect *p_rect;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 29da1f4b4578..be04a7e28836 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1781,6 +1781,7 @@ struct v4l2_ext_control {
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
 		struct v4l2_area __user *p_area;
+		struct v4l2_rect __user *p_rect;
 		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
 		struct v4l2_ctrl_h264_pps *p_h264_pps;
 		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
@@ -1845,6 +1846,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
+	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
 	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
 	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
-- 
2.38.1.431.g37b22c650d-goog


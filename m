Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77AE860C384
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 07:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbiJYFzr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 01:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiJYFzm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 01:55:42 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4AE537FA7
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 22:55:40 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-36b1a68bfa6so68755317b3.22
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 22:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf+QfS6eMeyUYkxYbAECemXyio0W9qEY2bjKVVvIDeQ=;
        b=ELfhMm7C2ZO81IwRufvZn9argc0/c67hUlx7dLQ6qw9lOKPhug6CIbciGVy2fUlYm7
         4gzFqdY0KPnWRwLhD9zicSilDrZXtQP6rU356zqRkRdWC+g3Z+ppxrii8TQaFTKePr2x
         9GfJG13RMjm7QjoEdp1uIXJXyAp71YVrNigIv1PasZlgMQ5cDU6YnSLg7aALkyhuD/Tp
         8/nOKOjP6hhYT4fh/34soBXBg8hvC/iwkR6xOmkc1TP6teQk65H+Aory3kxZkT/+lXUf
         nDjtniHlQmpAV92n2miaHUKThR304/wi6RiCm7jPJR4rdjFXzFyzqPpTnpjJVH2HsZCk
         lN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf+QfS6eMeyUYkxYbAECemXyio0W9qEY2bjKVVvIDeQ=;
        b=0I5sJ/JR66o+hI91F8Hiwx6Q0ng/0f7Yjp8YI46tGXv3SiYlqmAuH30UD5PKIJgCk9
         kO2R2KpccHDhiKIeUQmqTDokixF0OmE01knvc/Mob7N0Pl8mDZPUnPIG7V69LeBtsS5h
         HnVv5GQuTZEAOez6C2Q5Uwfn82qXFoQ2lzc/ZwA+05eTzq2FClKtfHk0QR6M9maPltbN
         Z+jk9wND0TMTHYPcBYks/yciF0HJuywYIIcPPHbSkpJizHwohOv3bX4q5XO2a71SwCzT
         sNUhPzZqSWjsLHd4jR9d3DtPkGOMqBB+kcB7WKpqZAHpLt/b4fhmDwwlmO1ou/XgGDI1
         Mt4Q==
X-Gm-Message-State: ACrzQf1P76KBeEMWJeI5oNHiEdXzftwO08nUwwNgbBw6jW0i0Odw0WjS
        +5SF13zRWZ/ohEn+CAJLWmCPLmRJ8qU=
X-Google-Smtp-Source: AMsMyM6wpPManJOHpah+q4uv4GzTkHaMch0Z4qqnoQF23QirLrGp7oTX+yoVYSlQQcuodNdRVe2xHxQ/uuE=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7ee8:fa64:12b0:14f3])
 (user=yunkec job=sendgmr) by 2002:a05:6902:1148:b0:6ca:79c4:dcbc with SMTP id
 p8-20020a056902114800b006ca79c4dcbcmr16739081ybu.622.1666677339948; Mon, 24
 Oct 2022 22:55:39 -0700 (PDT)
Date:   Tue, 25 Oct 2022 14:55:18 +0900
In-Reply-To: <20221025055528.1117251-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221025055528.1117251-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Message-ID: <20221025055528.1117251-2-yunkec@google.com>
Subject: [PATCH v9 01/11] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
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
index 86cae23cc446..a81951c51325 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1780,6 +1780,7 @@ struct v4l2_ext_control {
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
 		struct v4l2_area __user *p_area;
+		struct v4l2_rect __user *p_rect;
 		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
 		struct v4l2_ctrl_h264_pps *p_h264_pps;
 		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
@@ -1844,6 +1845,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
+	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
 	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
 	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
-- 
2.38.0.135.g90850a2211-goog


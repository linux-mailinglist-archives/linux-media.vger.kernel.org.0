Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34600345FBE
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhCWNgG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 09:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbhCWNfg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 09:35:36 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33BDC0613D9
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:35:35 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id jy13so27112044ejc.2
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=//l1BqtUdSaKhUnb1YjCkD3o+Rvljtn6xVLWzLoWilo=;
        b=gx7fWGRZU0o+J7Wa5zj8uTxm5c7mUll7wtai6kMQOA3U9bBwtNYFoGnG1npykJyqnf
         ZcRHUbTRH9zed0EdFLuSUHNyAEkC3ToLFoXp6LTwGqgVAcjjYUdIlMPb7s9xAQMLMyr0
         HYQWrulmsSaxtrSKJvVdoLQ6x5g4mh+WZq3pGNutJBVch/tH1PcskmMuK9ZImqcQr6Ao
         Vp7Mi+eWWiOc85nFkNsDR8q/W51jANP9/jyExYRlfunQXRjMolSTqVEDgMm5c5K+WOhf
         Q4SNc8mvwNgf6CYqDm6YIMNRkPWl25lcu4EAN3UDKT1DwM3dfzoLRP/vu2eDyHz/9Kgo
         jM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=//l1BqtUdSaKhUnb1YjCkD3o+Rvljtn6xVLWzLoWilo=;
        b=CFDe5qDkhry5e3sfvyqyYtBTW+ghmBk3EYoNQfftQZHYZdjEk6CNvHBjq5Qa4DqltS
         uMFpyhSKZuhIoc8f+ZTqaOl7DRXmppdP+8TFuQpHhCdI1VgddWvNZLiZ0khMKK0jI3cX
         jWvwJWuQoK2dbPfRI8nxI0ULaP6+V1c4Q13uXBMIEVkVreSFT0kWYpap65EShXhZdbb4
         DI0QsB7W/vASV3zBWF+0cyjtpkHEjOnhlyrTRIIILWMuIVOjL/R28v9VLNTokEdBA+uq
         B0xw4BTkicBxxjEB/Pfrz8+3kvEWQsOM9/SRdChPp3PYlroDRQ0WJ6jveRQZh21YQlEt
         4sCg==
X-Gm-Message-State: AOAM531o48kdlzmzwayZD8Plki7uzUm4FJ9vqAvMCT+lIZZxAJfWjXc4
        nZ9LJcunErnkQkIffTfzAxYObwRALDXrRscI
X-Google-Smtp-Source: ABdhPJxc8mpwLvUtl6uHLGi7zphEpHPhnNWeQ8vOin7gpyJOAeVeW/ZXj7TtUbvFvBgX5w4YSUlP0Q==
X-Received: by 2002:a17:907:75c2:: with SMTP id jl2mr5054063ejc.334.1616506534192;
        Tue, 23 Mar 2021 06:35:34 -0700 (PDT)
Received: from localhost.localdomain (hst-221-103.medicom.bg. [84.238.221.103])
        by smtp.gmail.com with ESMTPSA id m7sm12627104edp.81.2021.03.23.06.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 06:35:33 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 1/2] v4l2-ctrl: Add decoder conceal color control
Date:   Tue, 23 Mar 2021 15:35:19 +0200
Message-Id: <20210323133520.943317-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323133520.943317-1-stanimir.varbanov@linaro.org>
References: <20210323133520.943317-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add decoder v4l2 control to set conceal color.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/v4l/ext-ctrls-codec.rst             | 33 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 3 files changed, 43 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 9963c1c9a4d5..e11a734c43bd 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -674,6 +674,39 @@ enum v4l2_mpeg_video_frame_skip_mode -
     is currently displayed (decoded). This value is reset to 0 whenever
     the decoder is started.
 
+``V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR (integer64)``
+    This control sets the conceal color in YUV color space. It describes
+    the client preference of the error conceal color in case of an error
+    where the reference frame is missing. The decoder should fill the
+    reference buffer with the preferred color and use it for future
+    decoding. The control is using 16 bits per channel.
+    Applicable to decoders.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * -
+      - 8bit  format
+      - 10bit format
+      - 12bit format
+    * - Y luminance
+      - Bit 0:7
+      - Bit 0:9
+      - Bit 0:11
+    * - Cb chrominance
+      - Bit 16:23
+      - Bit 16:25
+      - Bit 16:27
+    * - Cr chrominance
+      - Bit 32:39
+      - Bit 32:41
+      - Bit 32:43
+    * - Must be zero
+      - Bit 48:63
+      - Bit 48:63
+      - Bit 48:63
+
 ``V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE (boolean)``
     If enabled the decoder expects to receive a single slice per buffer,
     otherwise the decoder expects a single frame in per buffer.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index ca50e21e2838..c35c538c4aa4 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -948,6 +948,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:			return "VBV Buffer Size";
 	case V4L2_CID_MPEG_VIDEO_DEC_PTS:			return "Video Decoder PTS";
 	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:			return "Video Decoder Frame Count";
+	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:		return "Video Decoder Conceal Color";
 	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:			return "Initial Delay for VBV Control";
 	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
@@ -1436,6 +1437,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*max = 0x7fffffffffffffffLL;
 		*step = 1;
 		break;
+	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
+		*type = V4L2_CTRL_TYPE_INTEGER64;
+		*min = 0;
+		/* default for 8 bit black, luma is 16, chroma is 128 */
+		*def = 0x8000800010LL;
+		*max = 0xffffffffffffLL;
+		*step = 1;
+		break;
 	case V4L2_CID_PIXEL_RATE:
 		*type = V4L2_CTRL_TYPE_INTEGER64;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 6f8c08507bf4..926877c0c653 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -429,6 +429,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
 #define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID	(V4L2_CID_CODEC_BASE+230)
 #define V4L2_CID_MPEG_VIDEO_AU_DELIMITER		(V4L2_CID_CODEC_BASE+231)
+#define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+232)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
-- 
2.25.1


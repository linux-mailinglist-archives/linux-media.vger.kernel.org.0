Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FAB332A867
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347068AbhCBRgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349998AbhCBLpa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Mar 2021 06:45:30 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD2FC061797
        for <linux-media@vger.kernel.org>; Tue,  2 Mar 2021 03:44:36 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id jt13so34703938ejb.0
        for <linux-media@vger.kernel.org>; Tue, 02 Mar 2021 03:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OYb8vJLtF0OcL+zflNVb+VLYn9hupFKm6pNP1npRGAs=;
        b=Fdzmb2mRXTcQ71E7e/Rz9NstwwCYPElhCv8G7FK/LY3feNupOcxaNfx/7MchmQ/vNL
         iDfzMaZK4OQisuZk3ng8Z2redjqlToRn5uGKL3rndzr50AuqN/kdKo4KXVzsVfOIQAqd
         y7isDG/ym9EAbW1Y9Ym7a4tCXyRQNgscnZpSkcK6VXl0eyl/AStNR/0OPzfiYPcXICqt
         ny9O5+0PfSEjSZdkBg9uMZx+u7TB2+rkfR16kYMCfSprQwCSX0SZydRe6XpxMYiDYL16
         Uua8gvl0lseBR7r6ooml18e9YvnVYLWHRZHVME0MY7pw+ZFUrw1HM+uuctAHz6Up+RFs
         2tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OYb8vJLtF0OcL+zflNVb+VLYn9hupFKm6pNP1npRGAs=;
        b=SAbLy3Z1lFV11Z4ZBuwNMS7XYQaAO0x3CrkNNQJeR0mNq1hPL0GMePepP5YNp/vWoV
         w5JlHkplTnsS0ppyakMt2iFk39QEQUoCyCA8DS3FJUXe4A+L+IJmLNll1j4PnkmKIZwJ
         YBBJYCeZxtx5VbnMhaAc7V7MIxFvtk1y+RG4MPykxksE3m3DVA9OBqnxyo+rescD8CDd
         BzpozP0zKY6rbiaXU211I1deYuZZmDfk7uW3QrlMQVmcq9j/q20J8gwcY0cQE9xhXPft
         DI4vXEI52w6NGDacZNhrwucmiF380BwxV25NGWA2GleAW0efiMniH2MgiQqSVhHnn1Ac
         NyqQ==
X-Gm-Message-State: AOAM533++0Gwip76aXi14dTYg95azEcRCaezFr8ASI1+VfOGjEFmQlLV
        g92bp5q+EjDmCVBP8TsKEUbThLbdJOo4fuPa
X-Google-Smtp-Source: ABdhPJxPnMQDXF+ikLOWRIcd1g0H8KL/Bv0qB65dbjTr/Y9F89o5L8MY2b4sVhbO1Npyd8zBOZRRnA==
X-Received: by 2002:a17:906:388d:: with SMTP id q13mr2469836ejd.34.1614685475483;
        Tue, 02 Mar 2021 03:44:35 -0800 (PST)
Received: from localhost.localdomain (hst-208-217.medicom.bg. [84.238.208.217])
        by smtp.gmail.com with ESMTPSA id x17sm18494897edq.42.2021.03.02.03.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 03:44:35 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 1/2] v4l2-ctrl: Add decoder conceal color control
Date:   Tue,  2 Mar 2021 13:44:29 +0200
Message-Id: <20210302114430.3594475-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302114430.3594475-1-stanimir.varbanov@linaro.org>
References: <20210302114430.3594475-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add decoder v4l2 control to set conceal color.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/v4l/ext-ctrls-codec.rst             | 33 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 3 files changed, 43 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 00944e97d638..817da8a14572 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -674,6 +674,39 @@ enum v4l2_mpeg_video_frame_skip_mode -
     is currently displayed (decoded). This value is reset to 0 whenever
     the decoder is started.
 
+``V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR (integer64)``
+    This control sets conceal color in YUV color space. It describes the
+    client preference of error conceal color in case of error where
+    reference frame is missing. The decoder should fill the reference
+    buffer with preferred color and use it for future decoding. The control
+    is using 16bits per channel.
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
index 016cf6204cbb..a3b9d28a00b7 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -945,6 +945,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:			return "VBV Buffer Size";
 	case V4L2_CID_MPEG_VIDEO_DEC_PTS:			return "Video Decoder PTS";
 	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:			return "Video Decoder Frame Count";
+	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:		return "Video Decoder Conceal Color";
 	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:			return "Initial Delay for VBV Control";
 	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
@@ -1430,6 +1431,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*max = 0x7fffffffffffffffLL;
 		*step = 1;
 		break;
+	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
+		*type = V4L2_CTRL_TYPE_INTEGER64;
+		*min = 0;
+		/* default for 8bit black, luma is 16, chroma is 128 */
+		*def = 0x8000800010LL;
+		*max = 0xffffffffffffLL;
+		*step = 1;
+		break;
 	case V4L2_CID_PIXEL_RATE:
 		*type = V4L2_CTRL_TYPE_INTEGER64;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 039c0d7add1b..5e5a3068be2d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -428,6 +428,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
 #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
 #define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID	(V4L2_CID_CODEC_BASE+230)
+#define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+231)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
-- 
2.25.1


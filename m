Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02991E1DAD
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 10:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731599AbgEZIzB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 04:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728527AbgEZIzA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 04:55:00 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA58C08C5C0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 01:55:00 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id n24so22950993ejd.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=podEtQJynn8vbkjGNeeC+JbB0UoOH6+FyCUK9sYUJn4=;
        b=Nr8rKuZkt8KweBOcyHo2g4Ujy7JjKujFluF3VELDXfSs/xdouAXDKFVDjpG0peqBwJ
         vRjDKWUDCpNHxl0J0bWwUyk4HsD2HNLQ5pEvOzhdI/BEUjSBg3tuYQima0+NTj3thyx+
         vs04YQ4EKXsymFcN8+4s6v/nACegXCY9qTxHiogWscUrH8BeS0QeJ4Nm2m7+VTUa9mcH
         HUtMkkCzVi5MH+IT4QuOqO/yKXc0vJpIxx0hQ6/9OwlrUUvrtfcEZpOUlprfKktAe53t
         1ODusxv6Wa0DkhYtVYcl3yPklUkW5c0Tr1PJsP0qdrmgOSPq8Irfu5KXfYa59ipV1K9C
         qYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=podEtQJynn8vbkjGNeeC+JbB0UoOH6+FyCUK9sYUJn4=;
        b=gdseU39NesbYRVA41N+pqjILYIYZw6xl12ALF//8mGsfQqoiB9D4inTy3u2gL1iJbW
         tR5za6Vl84l7PVWKZsAhJKWR/f9hdYddOxKxuLYMvc2EUstWLS7b+r1RT1xhgx2HiPR5
         rC5hAQbEkTzA5vDuFkZ5t8r4QwmaFXU9vAELvncuuWSSyHnVm+jQX46Of0hhuFQzYV+y
         6gTLxustfKNtAjUR9ERf21XHPqrizVbzyjjw7CBEkW0HObtGuCqYLMATe00PmX+2uD1Q
         vooRdOHqCr9czS61JKhQP6cA+9CrY96A6JQ3CRIypsPRxAFlTuBOJHO0SMCbgYIsurSc
         16SQ==
X-Gm-Message-State: AOAM5311F4VqMvPKWoo8jqnXPT2kE40Ze/PYEvG+sfyLhR0ulB9Si1Ro
        vlBWM6E1s6KGu9cyxNQcCl1A8K82ZAuwOQ==
X-Google-Smtp-Source: ABdhPJw171as7mUXt+mmyvz7QjgiCrI+4kYucAVxQA3LbZATkgtSlw8GmSdwvKbT6OmYYNXhjcPA6w==
X-Received: by 2002:a17:906:1907:: with SMTP id a7mr188846eje.251.1590483298671;
        Tue, 26 May 2020 01:54:58 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-184.ip.btc-net.bg. [212.5.158.184])
        by smtp.gmail.com with ESMTPSA id o21sm18134521edr.68.2020.05.26.01.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 01:54:57 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] v4l2-ctrl: add control for thumnails
Date:   Tue, 26 May 2020 11:54:46 +0300
Message-Id: <20200526085446.30956-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add v4l2 control for decoder thumbnail.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 7 +++++++
 drivers/media/v4l2-core/v4l2-ctrls.c                      | 2 ++
 include/uapi/linux/v4l2-controls.h                        | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index d0d506a444b1..e838e410651b 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3726,6 +3726,13 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     disables generating SPS and PPS at every IDR. Setting it to one enables
     generating SPS and PPS at every IDR.
 
+``V4L2_CID_MPEG_VIDEO_DECODER_THUMBNAIL (button)``
+    Instructs the decoder to produce immediate output. The decoder should
+    consume first input buffer for progressive stream (or first two buffers
+    for interlace). Decoder should not allocate more output buffers that it
+    is required to consume one input frame. Usually the decoder input
+    buffers will contain only I/IDR frames but it is not mandatory.
+
 .. _v4l2-mpeg-hevc:
 
 ``V4L2_CID_MPEG_VIDEO_HEVC_SPS (struct)``
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index b188577db40f..cb2554404c63 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -991,6 +991,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
+	case V4L2_CID_MPEG_VIDEO_DECODER_THUMBNAIL:		return "Thumbnail generation";
 
 	/* CAMERA controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1234,6 +1235,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_AUTO_FOCUS_START:
 	case V4L2_CID_AUTO_FOCUS_STOP:
 	case V4L2_CID_DO_WHITE_BALANCE:
+	case V4L2_CID_MPEG_VIDEO_DECODER_THUMBNAIL:
 		*type = V4L2_CTRL_TYPE_BUTTON;
 		*flags |= V4L2_CTRL_FLAG_WRITE_ONLY |
 			  V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 62271418c1be..7e44a2779863 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -743,6 +743,8 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
 #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
 #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
 
+#define V4L2_CID_MPEG_VIDEO_DECODER_THUMBNAIL		(V4L2_CID_MPEG_BASE + 645)
+
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
 #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_MPEG_CX2341X_BASE+0)
-- 
2.17.1


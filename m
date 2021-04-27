Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768B136C4CC
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 13:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235835AbhD0LQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 07:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235884AbhD0LQc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 07:16:32 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341F4C061756
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 04:15:48 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id b14-20020a17090a6e0eb0290155c7f6a356so97193pjk.0
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 04:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rhS54utv1YzIbFPUPZVH1abgq1ro55v2mmnzFXetrAM=;
        b=dmzIuyFPRC2KRTi15IBaYcLiR1g2yCRfSlDgP0mRgEv0OR3plonVKqxwOyrjQVQuaN
         hUiRC7iZOrVb4Mvzzj5ALQQtU5ts7TMxRBg9kXrRU//93Cos8ksFOrBrex3AlrF5bEk5
         kYNSj6LkCopCPG7hp4fUXO93VVrUN7webOF70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rhS54utv1YzIbFPUPZVH1abgq1ro55v2mmnzFXetrAM=;
        b=NvCStRIwxEpyW9koxwA4Am9lON7M7YH0fE0JdHU7UeP3/neEQj2qk9FIMJASVUHv4P
         dPl0E87vDcAelnN/bRI6eqguHVn1ljc5TU7FiqKjyZIrciMIANl1u1BlEoUt8FtNLUNq
         jEeSg/rEsyDW8UTsB39D6Q1RDCmktL10/jFhZrrMJwUOGKjnmkAvwN4lD1YOPl0Sh88K
         7v0sIQnUmQDKjUkKR1c4efa1u8aQ023NRqU/gglVVLGfDS8PP27g9WwsnpvTMMqF4xMr
         ccrKHg9EklrM5OLb7qlk69tlcDKLa6TLToAy+C+pTt8swxrGKAratRl8r4jAd7SGMu6/
         okTw==
X-Gm-Message-State: AOAM532uf0BGF0M+GcQeCZiSiEjJO3VWVQLQ1IsEx7l7ROmCCx10EZIK
        miI/tgaRAjJvBDfSbOWAUDeWLQ==
X-Google-Smtp-Source: ABdhPJyCcW9kLpLl2eDspunleRze6lqZixbd7S2gRrdMnoYGRuckAWazBnOKh9E0c1MjbLf70D4rrA==
X-Received: by 2002:a17:90a:8548:: with SMTP id a8mr26549983pjw.48.1619522147830;
        Tue, 27 Apr 2021 04:15:47 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:b182:d363:32d0:53a2])
        by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 04:15:47 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 04/15] media: add Mediatek's MM21 format
Date:   Tue, 27 Apr 2021 20:15:15 +0900
Message-Id: <20210427111526.1772293-5-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Mediatek's non-compressed 8 bit block video mode. This format is
produced by the MT8183 codec and can be converted to a non-proprietary
format by the MDP3 component.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 7 +++++++
 drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
 include/uapi/linux/videodev2.h                            | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 0b879c0da713..42357b0b3535 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -246,6 +246,13 @@ please make a proposal on the linux-media mailing list.
 	It is an opaque intermediate format and the MDP hardware must be
 	used to convert ``V4L2_PIX_FMT_MT21C`` to ``V4L2_PIX_FMT_NV12M``,
 	``V4L2_PIX_FMT_YUV420M`` or ``V4L2_PIX_FMT_YVU420``.
+    * .. _V4L2-PIX-FMT-MM21:
+
+      - ``V4L2_PIX_FMT_MM21``
+      - 'MM21'
+      - Non-compressed, tiled two-planar format used by Mediatek MT8183.
+	This is an opaque intermediate format and the MDP3 hardware can be
+	used to convert it to other formats.
     * .. _V4L2-PIX-FMT-SUNXI-TILED-NV12:
 
       - ``V4L2_PIX_FMT_SUNXI_TILED_NV12``
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 6a5d1c6d11d6..608e3ddc0f42 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1385,6 +1385,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_TM6000:	descr = "A/V + VBI Mux Packet"; break;
 	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
 	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
+	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit block format"; break;
 	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
 	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
 	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 311a01cc5775..db04e37da1a8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -733,6 +733,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
 #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
 #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
+#define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */
 #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
 #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
-- 
2.31.1.498.g6c1eba8ee3d-goog


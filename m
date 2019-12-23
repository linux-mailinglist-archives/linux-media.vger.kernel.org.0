Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 182B7129540
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2019 12:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfLWLeg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Dec 2019 06:34:36 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46377 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbfLWLdt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Dec 2019 06:33:49 -0500
Received: by mail-lj1-f196.google.com with SMTP id m26so14979901ljc.13
        for <linux-media@vger.kernel.org>; Mon, 23 Dec 2019 03:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fdnv5G54kjVyBGm0/gl9gu7nvtpvFPt8yg5pxAgrcmE=;
        b=gAq2cysKYZZfj4Q8zAemwVqnt5m0oC3iqy37p1iR40SVb+N7zvSbX9h4shinQdiimL
         tcxtDJadBJ572tOx6WeL2xYwiCMx8viFF8fASfQGgBD2DvK+oAEv/Tm4fFeM/0uNl9In
         yXxqZkCfQErbq/BfvBOTW1KvoLHsf4p5MhC3QbBHuq5aUHykWh3sdJPDku6WotC5We2G
         6WoQzNoV2XMM5l6YLzdDQYY0EuQZIyH6J5K6J0Y0dMdUFwrbyAWlfkoW/9+I6O76NlWP
         cPT5B7ENvofMc1Wl6O1nUmL3VVrPqG6XRnkBejagryZ3Z/H/VpAVEJ+BvOPOObB7rSuK
         oQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fdnv5G54kjVyBGm0/gl9gu7nvtpvFPt8yg5pxAgrcmE=;
        b=pwTcspkCz0Eh4l3H4277+6bzrBBU2yslOd4Ypu6mzpLSBWm2Amd3fy21z+fGybukQ3
         cEx6CSqqWjcd6RoZzQOf9qTFop58/Fay8uTgVHAFva/MsHZhOYF0abiRyd/EyrkDDliL
         aKYzRpKrPyhv5A7WSLY6STzKPUHdRJilwSGdh/St05XW0IWBrD6VVPZyucW//DDiB21d
         7ei+oYARUBt23M9J3xg78tcjx1yfKxrN7LFy6QAwXbeRVgprgBtbMBB5IiHGDP4IQX08
         yzUQF9wV2KToksVoQsjKDew+47BV9aAFREWv/ERoIjHz7AMZJkzNP0hIiOi67PtX46+V
         J8Gg==
X-Gm-Message-State: APjAAAWAmeRRPm+Jsut2CdMIjj642Bx+mizCJOcS194MHkhsDscl29nH
        bSPRNNatDze3b9cawZSo7uzGqQ==
X-Google-Smtp-Source: APXvYqwOZpdpPPDJHLpxGOc/ElhqDZAYStQCW2QgMpCSboNbWVcXL8In/iZ+hCKvUAladS2LuxozXA==
X-Received: by 2002:a2e:6c13:: with SMTP id h19mr8124037ljc.221.1577100827132;
        Mon, 23 Dec 2019 03:33:47 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id g15sm8381500ljk.8.2019.12.23.03.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 03:33:46 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 04/12] v4l: Add source event change for bit-depth
Date:   Mon, 23 Dec 2019 13:33:03 +0200
Message-Id: <20191223113311.20602-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This event indicate that the source color bit-depth is changed
during run-time. The client must get the new format and re-allocate
buffers for it. This can usually happens with video decoder (encoders)
when the bit-stream color bit-depth is changed from 8 to 10bits
or vice versa.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 Documentation/media/uapi/v4l/vidioc-dqevent.rst | 8 +++++++-
 Documentation/media/videodev2.h.rst.exceptions  | 1 +
 include/uapi/linux/videodev2.h                  | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
index 42659a3d1705..fad853d440cf 100644
--- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
+++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
@@ -402,7 +402,13 @@ call.
 	that many Video Capture devices are not able to recover from a temporary
 	loss of signal and so restarting streaming I/O is required in order for
 	the hardware to synchronize to the video signal.
-
+    * - ``V4L2_EVENT_SRC_CH_COLOR_DEPTH``
+      - 0x0002
+      - This event gets triggered when color bit-depth change is detected
+	from a video decoder. Applications will have to query the new pixel
+	format and re-negotiate the queue. In most cases the streaming must be
+	stopped and restarted (:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`
+	followed by :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`).
 
 Return Value
 ============
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index cb6ccf91776e..209709114378 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -490,6 +490,7 @@ replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
 replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
 
 replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
+replace define V4L2_EVENT_SRC_CH_COLOR_DEPTH src-changes-flags
 
 replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 04481c717fee..2a5138ac6d25 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2307,6 +2307,7 @@ struct v4l2_event_frame_sync {
 };
 
 #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
+#define V4L2_EVENT_SRC_CH_COLOR_DEPTH		(1 << 1)
 
 struct v4l2_event_src_change {
 	__u32 changes;
-- 
2.17.1


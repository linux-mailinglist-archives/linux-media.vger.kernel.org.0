Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87AC117878
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2019 13:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbfEHLiR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 May 2019 07:38:17 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36264 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727723AbfEHLiP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 May 2019 07:38:15 -0400
Received: by mail-wm1-f66.google.com with SMTP id j187so2840873wmj.1
        for <linux-media@vger.kernel.org>; Wed, 08 May 2019 04:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=+SyLCGKQZVZPU6RL6iNDUpQzPqwKhYQ4Nyrk4MwksBs=;
        b=H4L+4rhnt7nJyxUySG1D23U7M9pA5N7CS039VwgPFeog8c1Klhg8iWTRDlj8w6WBt2
         5sItGQ+3VIqHal+WYVg6wp43BZm7t3BsDCDWbHZseIrR7Mh87mv/BdxJPCvcr2tsQy2q
         iS1Juki+Y76Q1bIFy1P+jHdFX5Wk1JvuKUQ53yaYwroRfFYA5gvxX7WsLQVC6j9bTINR
         KdENWoXqhrW86MJ2rtpD16eomAyw31yBAtLUK4QM1LPlSJCl+/Ho01vS8Lw7RuCHLeOw
         EF/I6soUFl2NVdwNrms2Brv8QFNqb5xdF+0ReSgAn4HgchKwtwWaTlelpv0+zpjyWB35
         Z/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+SyLCGKQZVZPU6RL6iNDUpQzPqwKhYQ4Nyrk4MwksBs=;
        b=pVId39swBFAi7Aj9hhDkXAi4ppArteOD0EzULhIhW0bcXJW1XcJuEBUx86u5TY/IGU
         2RTJ1Kod5TmspJNo7Y/WsKyulZEC3FVdnj0ns7yKDnU2Vx6p8tCwgJJTCjvAfFC7SAMu
         DkXtnxwt+9b6ZFqzwWIXbMoODEZCOKR7f6ij6mvWBljW7BwZthLU+m3xfj5a3NDTwRJi
         sU/6DFu01MOzPlwpfQuoNDuJCJK9mT5aYpAHh9TxxI4F1mP3CwMZLMoqBssaLY2vvlJo
         MvdfYxmudLWVwhdoTyHbNso1ltgb82FNKOpGV5D9Va1n+u9zN1O+LNLVkncvJDWOme+l
         RPBw==
X-Gm-Message-State: APjAAAV6Y1uD5kP5/D20MNkaEa8npin4dBHVVhsaAEb4sAOliop0G65r
        j3tjLcUaXR2CJwY6cSjKIAagwfug9mg=
X-Google-Smtp-Source: APXvYqxV6O4YkH8fOkqEwIvXPC5Y08lfZOvf0U3VsyRoVLRXZ/PfErlzIJjSyNQbIzcFPxlHt/buSQ==
X-Received: by 2002:a1c:eb07:: with SMTP id j7mr2656906wmh.138.1557315493184;
        Wed, 08 May 2019 04:38:13 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id r2sm36077322wrr.65.2019.05.08.04.38.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 04:38:12 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2] v4l: Add source event change for bit-depth
Date:   Wed,  8 May 2019 14:37:59 +0300
Message-Id: <20190508113759.19168-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This event indicate that the source bit-depth is changed during
run-time. The client must get the new format and re-allocate buffers
for it. This can usually happens with video decoder (encoders) when
the bit-stream depth is changed from 8 to 10bits or vice versa.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
Change since v1: s/BITDEPTH/BIT_DEPTH

 Documentation/media/uapi/v4l/vidioc-dqevent.rst | 7 +++++++
 Documentation/media/videodev2.h.rst.exceptions  | 1 +
 include/uapi/linux/videodev2.h                  | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
index dea9c0cc00ab..f7782cbddc5f 100644
--- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
+++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
@@ -397,6 +397,13 @@ call.
 	that many devices are not able to recover from a temporary loss of
 	signal and so restarting streaming I/O is required in order for the
 	hardware to synchronize to the video signal.
+    * - ``V4L2_EVENT_SRC_CH_BIT_DEPTH``
+      - 0x0002
+      - This event gets triggered when bit-depth change is detected from a
+	video decoder. Applications will have to query the new pixel format
+	and re-negotiate the queue. In most cases the streaming must be stopped
+	and restarted (:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` followed by
+	:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`).
 
 
 Return Value
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index 64d348e67df9..68ae00d7450f 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -478,6 +478,7 @@ replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
 replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
 
 replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
+replace define V4L2_EVENT_SRC_CH_BIT_DEPTH src-changes-flags
 
 replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 1050a75fb7ef..ecfdbaa60b05 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2287,6 +2287,7 @@ struct v4l2_event_frame_sync {
 };
 
 #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
+#define V4L2_EVENT_SRC_CH_BIT_DEPTH		(1 << 1)
 
 struct v4l2_event_src_change {
 	__u32 changes;
-- 
2.17.1


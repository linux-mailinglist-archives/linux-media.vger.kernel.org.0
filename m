Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 099A4187FE
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 11:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfEIJuM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 05:50:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38844 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfEIJuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 05:50:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id v11so2110824wru.5
        for <linux-media@vger.kernel.org>; Thu, 09 May 2019 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=hhS2+d0xP4GgHZNmcPpMkZwGucayXgjly3bXfhyzlK8=;
        b=ED/kZ9I9eq0+WF8uJUG0ZOnviVIDgjrf4KeRNdLJ6OQqMzq5xwbeRsvZmYyCW3arjc
         7cJgTprycCsiHmmVozTaFQlncETUkynpAItO4/5Rl7rX7tttResOcM+nKeuJZGnfVEFl
         xlQRLc65LIOYRY/l8dwr0THTapBDGOzSxm8LHFLrp+t/QIvq5zlXztpPNR4zOT3ZOYcX
         xkAT3P3bDm6A6yHfBqN8tdYaE/T4qddsleLy71EKEkIMzEdqSs1xkkkQQvqhpCnCaO5A
         iMtHze0VsRRKSmg0XNl2B7HIDSamxn1S2vfCP4/01F2p665EwyH2RmHahbxRQbl3fTlW
         5H+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hhS2+d0xP4GgHZNmcPpMkZwGucayXgjly3bXfhyzlK8=;
        b=LesbHR2Gx18knsoDCAbRpWd07lmIQCxFCWyConMywjuLjgCAn9MakKTzTWKWRYnlGl
         +wYsUo2cq3Y7v3gF9Eum8CJNg5ExJs76uDurHNha15sJlPnd6ZWUqwHOpnwD8xWZK1oe
         pC+vCbTeyEonV9Cx7HQbLlHXOVA6R9czaQDaC9yFw2DHjoYHouhKazf9GcuqONgA8CTI
         /5DtM+tm2VY7Qc7xl/2NPgahaXADz2ICbtqUSuBBiAHjv2gwUPiXFhZzLAHPpRNXtKti
         yrvtZzZNvuJfHe90k+lQJii49Gd39KlIoHMHyOgj6P6wx1VH6tuhUUHwbB1cKle1YxfI
         hQTA==
X-Gm-Message-State: APjAAAXw+4BRlFn7Vr1xZsK3NhBA5LWQq70P/91MjIdRFEGworGSxi0o
        vgY/dgEnvFxwgy/Cakrpy8u/ypRRviE=
X-Google-Smtp-Source: APXvYqzZgMQZ7xiz02ZOy2Wx504Kn6vmZ58uxtZSTbwNQytCclL0qkSF9BxyPmtkMC7idNFIdnRs5w==
X-Received: by 2002:adf:83c6:: with SMTP id 64mr2365983wre.81.1557395410924;
        Thu, 09 May 2019 02:50:10 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id l21sm1257039wmh.35.2019.05.09.02.50.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 02:50:09 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3] v4l: Add source event change for bit-depth
Date:   Thu,  9 May 2019 12:50:02 +0300
Message-Id: <20190509095002.31253-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
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
Change since v2: renamed BIT_DEPTH to COLOR_DEPTH

 Documentation/media/uapi/v4l/vidioc-dqevent.rst | 7 +++++++
 Documentation/media/videodev2.h.rst.exceptions  | 1 +
 include/uapi/linux/videodev2.h                  | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
index dea9c0cc00ab..7eb6451e6a81 100644
--- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
+++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
@@ -397,6 +397,13 @@ call.
 	that many devices are not able to recover from a temporary loss of
 	signal and so restarting streaming I/O is required in order for the
 	hardware to synchronize to the video signal.
+    * - ``V4L2_EVENT_SRC_CH_COLOR_DEPTH``
+      - 0x0002
+      - This event gets triggered when color bit-depth change is detected
+	from a video decoder. Applications will have to query the new pixel
+	format and re-negotiate the queue. In most cases the streaming must be
+	stopped and restarted (:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`
+	followed by :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`).
 
 
 Return Value
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index 64d348e67df9..69acf5959972 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -478,6 +478,7 @@ replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
 replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
 
 replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
+replace define V4L2_EVENT_SRC_CH_COLOR_DEPTH src-changes-flags
 
 replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 1050a75fb7ef..9410f9e186a1 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2287,6 +2287,7 @@ struct v4l2_event_frame_sync {
 };
 
 #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
+#define V4L2_EVENT_SRC_CH_COLOR_DEPTH		(1 << 1)
 
 struct v4l2_event_src_change {
 	__u32 changes;
-- 
2.17.1


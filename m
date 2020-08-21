Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89F224E2EB
	for <lists+linux-media@lfdr.de>; Sat, 22 Aug 2020 00:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgHUWAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 18:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgHUWAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 18:00:43 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3A30C061573
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 15:00:42 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id y3so3228059wrl.4
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 15:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=fn8SyOsZVYpp994OZLy2KpMwSs4p8ZvOPi37mehaER0=;
        b=Ob7QzsmBsy/oyojnAhGALQ2P4Xan9VczfX0XPVCxnr7V82yY9LZylX/0y7v5p6xv8W
         P4H7WRxJ/FI2ublhIOojnxas+io4ghpxfpvU/vMo/Kzv/DK03nQsJ0ZBIV4pauqyb9eF
         gFwNvhykV+86psG4DA5nA3iYbvJNzRhpE0ambTiUvk5ovJlKmKw9IXs8gi1Kq6FyR1qV
         K7pw1KmOVDZqq7yhb9nB/WeEAtdSyBCyB9zuZy09zZxGyuh1JiTkni9NBtQooy3NAcja
         5TaGvjZq5tpLZKUnPzG7XmOZjxW9sAWOA6QH1EqaReJRsEFWJikSlx47URemRiimTCXt
         7SPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fn8SyOsZVYpp994OZLy2KpMwSs4p8ZvOPi37mehaER0=;
        b=qD1aMn3Pq4r8fsElXSqzYIOjDQH4tdk0u4JZ4d4irr2+ZtyuBEmVKeR0p48u8qyzbR
         +nhCHsuxIMN9OACBPgSa0g6/eK+6mERxfhu9/7pRiWbLDWAOCFDXR1w+5TVilFgsX7W5
         1OXNtbx70NMQikiooPS1tHCJQkdMOLtlJtkqRGQoU3VgxaeNUj2Ru5bPchjnu9Q+N5VF
         bcj32W2ssW5egHl+bwBhlhgEVhq8cRk631BMZiFevMUFLgjxTKfvsBVC1v3jkSzjR5PQ
         LNem5U4A+JTJtt2np0URaDr/LARR4MKp0XWYn64ofZJMWsqQ6FiidIESQ9w7/067ncIs
         e36Q==
X-Gm-Message-State: AOAM530d3KtcreNyL033pSZ7QLcDDb8l4VA1kJ9CnVG3bvgF1N0nFhoR
        Hsunz9hKV5qQ7W+xlVxrHzVcsR+Ppp8kuQ==
X-Google-Smtp-Source: ABdhPJz6iOUdne2szNncKOcbu2hsHzvBkyUNsrvxhQPrYYpD+R6F8Weg0ZZp6BGlwaxRFQwLy/sFxw==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr4115146wrp.44.1598047241303;
        Fri, 21 Aug 2020 15:00:41 -0700 (PDT)
Received: from big-machine.home ([2a00:23c5:dd84:6e00:b159:9649:9f58:c065])
        by smtp.gmail.com with ESMTPSA id n12sm7529730wrq.63.2020.08.21.15.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 15:00:40 -0700 (PDT)
From:   Andrew Murray <amurray@thegoodpenguin.co.uk>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH] media: uvcvideo: Add bandwidth_cap module param
Date:   Fri, 21 Aug 2020 23:00:38 +0100
Message-Id: <20200821220038.16420-1-amurray@thegoodpenguin.co.uk>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Many UVC devices report larger values for dwMaxPayloadTransferSize than
appear to be required. This results in less bandwidth available for
other devices.

This problem is commonly observed when attempting to stream from multiple
UVC cameras with the host controller returning -ENOSPC and sometimes a
warning (XHCI controllers: "Not enough bandwidth for new device state.").

For uncompressed video, the UVC_QUIRK_FIX_BANDWIDTH works around this issue
by overriding the device provided dwMaxPayloadTransferSize with a
calculation of the actual bandwidth requirements from the requested frame
size and rate. However for compressed video formats it's not practical to
estimate the bandwidth required as the kernel doesn't have enough
information.

Let's provide a pragmatic solution by allowing the user to impose an upper
threshold to the amount of bandwidth each UVC device can reserve. If the
parameter isn't used then no threshold is imposed.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 drivers/media/usb/uvc/uvc_driver.c | 3 +++
 drivers/media/usb/uvc/uvc_video.c  | 8 ++++++++
 drivers/media/usb/uvc/uvcvideo.h   | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 431d86e1c94b..d5ecac7fc264 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -33,6 +33,7 @@ unsigned int uvc_no_drop_param;
 static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_trace_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
+unsigned int uvc_bandwidth_cap_param;
 
 /* ------------------------------------------------------------------------
  * Video formats
@@ -2389,6 +2390,8 @@ module_param_named(trace, uvc_trace_param, uint, S_IRUGO|S_IWUSR);
 MODULE_PARM_DESC(trace, "Trace level bitmask");
 module_param_named(timeout, uvc_timeout_param, uint, S_IRUGO|S_IWUSR);
 MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
+module_param_named(bandwidth_cap, uvc_bandwidth_cap_param, uint, S_IRUGO|S_IWUSR);
+MODULE_PARM_DESC(bandwidth_cap, "Maximum bandwidth per device");
 
 /* ------------------------------------------------------------------------
  * Driver initialization and cleanup
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a65d5353a441..74a0dc0614cf 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -196,6 +196,14 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 
 		ctrl->dwMaxPayloadTransferSize = bandwidth;
 	}
+
+	if (uvc_bandwidth_cap_param &&
+	    ctrl->dwMaxPayloadTransferSize > uvc_bandwidth_cap_param) {
+		uvc_trace(UVC_TRACE_VIDEO,
+			"Bandwidth capped from %u to %u B/frame.\n",
+			ctrl->dwMaxPayloadTransferSize, uvc_bandwidth_cap_param);
+		ctrl->dwMaxPayloadTransferSize = uvc_bandwidth_cap_param;
+	}
 }
 
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6ab972c643e3..c7d9220c9a7a 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -718,6 +718,7 @@ extern unsigned int uvc_no_drop_param;
 extern unsigned int uvc_trace_param;
 extern unsigned int uvc_timeout_param;
 extern unsigned int uvc_hw_timestamps_param;
+extern unsigned int uvc_bandwidth_cap_param;
 
 #define uvc_trace(flag, msg...) \
 	do { \
-- 
2.17.1


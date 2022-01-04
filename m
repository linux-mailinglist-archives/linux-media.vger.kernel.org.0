Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17EC6484212
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 14:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233284AbiADNHf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 08:07:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233279AbiADNHe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jan 2022 08:07:34 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA69C061761
        for <linux-media@vger.kernel.org>; Tue,  4 Jan 2022 05:07:34 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id w7so26520856plp.13
        for <linux-media@vger.kernel.org>; Tue, 04 Jan 2022 05:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X9SJuzXmFuNS0QuIAyKMpjq91Sjhf9b+dLUi09IShvE=;
        b=aVNAAXiZRH4/sLM/WGMQVcwvzWtXG6KyuMiQrwXWBn0+26XycXphXpN1sOg1W+v29L
         lZbu4HsHSJUzJymBmjVr9hqVsJLkPYb4u4kgY+IRcY89Rs2VTaoGEvjQoslQChs9o+kP
         qGok4sqg64A/07zhQ3KMiMU3Sh35parAUbsCqAl3YyYeB7XhoF5RYWxW+C1HbQMJJzbQ
         CKF05+7nVwLFWVV5+SUXUWkykv9GAvJYma4u3C1/grNIpoCBuwwK0u+KQkXkZ3VJymhs
         5zwv8Kt3PsGy+xgE0HHnQfhPfM+E+5TXBhWH7UljYQOJuRn3aWq+iAgv9oiZGWZGOSJ3
         f4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X9SJuzXmFuNS0QuIAyKMpjq91Sjhf9b+dLUi09IShvE=;
        b=VBY6BGgNwSAjnvJ87RtemMYxmh975Pah8AXvcumZyaXgL+fqpypb0K8BKrKvgvVhwq
         KfZmxDKIrXCAv6aYHfe8wtyAAtOrmoeuNDZqS4I+BNh/xy/Lc/RyGTCWtsyP6DknWbqU
         /aUBxElPOqdP9ZHBiRrps4sjUYOBvfglnOIGGoF7UkDy26bWXUW3+0vj8TbmGrKLl6fu
         DUhyPFzw1Cyt6N6NJhsgBGfcVS7eDMBjqTBr70oN2Qp3VO8/5t+XDPU4BxtC1Tc7Id9e
         1rirh1CwrgA1xvd+I+IlXcYL4+NHVyva7qIUbQuvCMhl26GeStEtQHqRgUgRRmf1/HiX
         xvCw==
X-Gm-Message-State: AOAM533cHplk+tbxRlpkCyZCL8n8GcceL9/LqDtXXD7kYPn8qPm9SrWR
        cCTE568RJG12gUDOkNWxnAgU11FPZdA0kQ==
X-Google-Smtp-Source: ABdhPJwTjqunqEAxn1iJLi5a1kxbsQfpNhXmJTZ1y+IL3K2jIma3R7Si6ShipJ3R2IovllYBvwKcuQ==
X-Received: by 2002:a17:90b:4c05:: with SMTP id na5mr60103983pjb.94.1641301653662;
        Tue, 04 Jan 2022 05:07:33 -0800 (PST)
Received: from veware.localdomain ([1.186.167.227])
        by smtp.googlemail.com with ESMTPSA id rj1sm37112568pjb.36.2022.01.04.05.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 05:07:33 -0800 (PST)
From:   Vedant Paranjape <vedantparanjape160201@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        Vedant Paranjape <vedantparanjape160201@gmail.com>
Subject: [PATCH v1] v4l2-utils: Fix incorrect use of fd in streaming_set_cap2out
Date:   Tue,  4 Jan 2022 18:37:08 +0530
Message-Id: <20220104130708.166638-1-vedantparanjape160201@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Running the "Stream video from a capture video device (/dev/video1) to an
output video device (/dev/video2)" example from the manpage with vivid
as the output device failed with a error message.

vedant@pc ~$ v4l2-ctl --list-devices
vivid (platform:vivid-000):
        /dev/video2
        /dev/video3
        /dev/radio0
        /dev/radio1
        /dev/vbi0
        /dev/vbi1
        /dev/swradio0
        /dev/media1

HD WebCam: HD WebCam (usb-0000:00:14.0-7):
        /dev/video0
        /dev/video1
        /dev/media0

vedant@pc ~$ v4l2-ctl -d0 --stream-mmap --out-device /dev/video3 --stream-out-dmabuf
               VIDIOC_G_FMT returned -1 (Invalid argument)
<VIDIOC_QBUF: failed: Invalid argument
handle out -1
handle out2in -1

While using the --out-device mode g_fmt must be operated on out_fd as
well. determine_field was called on fps_timestamp object for output, but was
not passed out_fd.

This patch fixes the VIDIOC_G_FMT returned -1 (Invalid argument) error.

Signed-off-by: Vedant Paranjape <vedantparanjape160201@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 752ea140..7f6482d6 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -2666,7 +2666,7 @@ static void streaming_set_cap2out(cv4l_fd &fd, cv4l_fd &out_fd)
 	unsigned cnt = 0;
 	cv4l_fmt fmt[2];
 
-	fd.g_fmt(fmt[OUT], out.g_type());
+	out_fd.g_fmt(fmt[OUT], out.g_type());
 	fd.g_fmt(fmt[CAP], in.g_type());
 	if (!(capabilities & (V4L2_CAP_VIDEO_CAPTURE |
 			      V4L2_CAP_VIDEO_CAPTURE_MPLANE |
@@ -2757,7 +2757,7 @@ static void streaming_set_cap2out(cv4l_fd &fd, cv4l_fd &out_fd)
 	}
 
 	fps_ts[CAP].determine_field(fd.g_fd(), in.g_type());
-	fps_ts[OUT].determine_field(fd.g_fd(), out.g_type());
+	fps_ts[OUT].determine_field(out_fd.g_fd(), out.g_type());
 
 	if (fd.streamon() || out_fd.streamon())
 		goto done;
-- 
2.25.1

